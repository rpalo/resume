#!/usr/bin/env ruby

# Builds an ERB template.  Provides a 'partial' helper

require "erb"

def partial(name)
  filename = "#{name}.html.erb"
  if ! File.file?(filename)
    abort "generate: #{filename} does not exist."
  end
  ERB.new(File.read(filename), eoutvar: name).result(binding)
end

File.open("resume.html", "w") do |f|
  f.write(partial("resume"))
end
