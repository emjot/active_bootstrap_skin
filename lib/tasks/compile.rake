# frozen_string_literal: true

require "rake/testtask"
require_relative "../compile_check"

namespace :compile do
  desc "Compile active_bootstrap_skin to tmp/compile/active_bootstrap_skin.css"
  task :css do
    output = CompileCheck.compile!
    puts "Compiled #{output}"
    puts "Strict deprecations: #{ENV['FATAL_DEPRECATIONS'] ? 'on' : 'off'}"
  end
end

desc "Compile active_bootstrap_skin to tmp/compile/active_bootstrap_skin.css"
task compile: "compile:css"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
  t.verbose = true
end
