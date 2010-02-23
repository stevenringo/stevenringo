require 'nanoc3/tasks'

desc "Compile site"
task :compile do
  system "nanoc3 compile"
end

desc "Clean public directory"
task :clean do
  puts "deleting:"
  system "rm -rfv public/*"
end

desc "Build site: clean /public then compile"
task :build => [:clean, :compile]

