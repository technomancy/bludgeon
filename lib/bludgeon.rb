require 'fileutils'

module Bludgeon
  VERSION = '0.0.1'
  DOWNLOAD_LOCATION = '/tmp/bludgeon-project'
  # LINES_PER_PAGE = 50  # TODO: calculate based on font-size
  BLUDGEON_PAGES = 500 # TODO: is this accurate?

  def self.calculate(*args)
    project = Project.new(*args)
    project.download
    project.calculate
    report(project)
  end

  def self.report(project)
    puts ["== #{project.name} (#{project.url})",
          "  Pages: #{project.pages}",
          "You " + (project.bludgeon? ? "could" : "could not") +
          " bludgeon someone to death with a printout."].join("\n")
  end

  class Project
    def initialize(*args)
      @url = args.pop
      @name = args.pop || extract_name(@url)
      @type = if url =~ /^git:\/\// or url =~ /\.git$/
                :git
              elsif url =~ /^svn:\/\// or url =~ /^http:\/\//
                :svn
              else
                :gem
              end
    end

    attr_reader :name, :url, :pages, :type

    # TODO: wrap long lines? (look into the "pr" unix tool; may be able to do this)
    def calculate
      @pages = 0
      last_file = ''
      `find #{DOWNLOAD_LOCATION} -type f | xargs pr | egrep "Page [0-9]+$"`.split("\n").each do |line|
        time, file, page = line.split(/\s+/)
      end
      @pages = page_counts.map{ |c| c[/Page (\d+)$/, 1].to_i }.inject(0){ |sum, x| sum + x }
    end

    def bludgeon?
      self.pages >= BLUDGEON_PAGES
    end

    def download
      puts "Downloading #{url}..."
      system "rm -rf #{DOWNLOAD_LOCATION}"
      send "download_#{@type}"
      puts "...Done!"
    end

    def download_git
      system "git clone --depth=1 #{@url} #{DOWNLOAD_LOCATION} > /dev/null" or
        raise "Could not clone #{@url}"
      system "rm -rf #{DOWNLOAD_LOCATION}/.git"
    end

    def download_svn
      system "svn checkout #{@url} #{DOWNLOAD_LOCATION} > /dev/null" or
        raise "Could not checkout #{@url}"
      system "find #{DOWNLOAD_LOCATION} -type d -name .svn | xargs rm -rf"
    end

    def download_gem
      Dir.mkdir DOWNLOAD_LOCATION
      FileUtils.cd DOWNLOAD_LOCATION
      system "gem fetch #{@name} && gem unpack #{@name}*.gem" or
        raise "Could not fetch and unpack gem #{@name}"
      system "rm #{@name}*.gem"
    end

    def extract_name(url)
      url[/\/([^\/]*?)(\.git)?$/, 1] or url
    end
  end
end
