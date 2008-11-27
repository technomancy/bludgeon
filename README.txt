= bludgeon

Bludgeon is a tool which will tell you if a given library is so large
that you could bludgeon someone to death with a printout of it.

== Description:

In #merb on Freenode:

  11:54 <technomancy> I'm sticking with minitest because rspec nests
                      instance_evals three-deep, but if that doesn't
                      scare you away, go for it. =)
  11:56 <scottmotte>  i don't know enough for it to scare me yet =)
  11:56 <jackdempsey> hehe
  11:57 <technomancy> I'm just saying ... if you could take the
                      printout of a library and bludgeon someone to
                      death with it, it might be time to look for a
                      lighter alternative.

== Usage:

  $ bludgeon git://github.com/dchelimsky/rspec.git
  == rspec (git://github.com/dchelimsky/rspec.git)
    Lines: 38698
    Pages: 773
  You could bludgeon someone to death with a printout.

== Requirements:

* Only works with git repositories so far.
* Depends on find, xargs, and wc command line utilities.
* As always, any Windows support is accidental.

== Install:

  $ sudo gem install bludgeon

== Todo:

* Research actual weight needed to bludgeon someone to death.
* Allow calculations to take font size into account.
* Calculate by wrapping long lines instead of truncating. (use pr utility?)
* Allow for portrait-orientation printouts when extremely long
  lines are common. (*ahem* Rails.)

== LICENSE:

(The MIT License)

Copyright (c) 2008 FIX

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
