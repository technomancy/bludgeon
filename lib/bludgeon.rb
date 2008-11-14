module Bludgeon
  VERSION = '0.0.1'
  DOWNLOAD_LOCATION = '/tmp/bludgeon-project'
  LINES_PER_PAGE = 50  # TODO: calculate based on font-size
  BLUDGEON_PAGES = 500 # TODO: is this accurate?

  def self.calculate(name, url)
    project = Project.new(name, url)
    project.download
    project.calculate
    report(project)
  end

  def self.report(project)
    puts ["== #{project.name} (#{project.url})",
          "  Lines: #{project.lines}",
          "  Pages: #{project.pages}",
          "You " + (project.bludgeon? ? "could" : "could not") +
          " bludgeon someone to death with a printout."].join("\n")
  end

  class Project
    def initialize(name, url)
      @name, @url = name, url
    end

    attr_reader :name, :url, :lines, :pages

    # TODO: wrap long lines?
    def calculate
      line_counts = `find #{DOWNLOAD_LOCATION} -type f | xargs wc -l`.split "\n"
      line_counts.pop # remove "totals" line
      @lines = line_counts.map{|i| i.to_i}.inject(0) { |memo, i| memo + i }
      @pages = @lines / LINES_PER_PAGE
    end

    def bludgeon?
      self.pages >= BLUDGEON_PAGES
    end

    # TODO: allow for other repository types. gems maybe?
    def download
      puts "Downloading #{url}..."
      system "rm -rf #{DOWNLOAD_LOCATION}"
      system "git clone --depth=1 #{@url} #{DOWNLOAD_LOCATION} > /dev/null" or
        raise "Could not download #{@url}"
      system "rm -rf #{DOWNLOAD_LOCATION}/.git"
    end
  end
end
