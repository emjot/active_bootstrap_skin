# frozen_string_literal: true

require "fileutils"
require "sass-embedded"

module CompileCheck
  ROOT = File.expand_path("..", __dir__)
  STYLESHEETS_PATH = File.join(ROOT, "app/assets/stylesheets")
  ENTRYPOINT = File.join(ROOT, "test/compile/entrypoint.scss")
  OUTPUT = File.join(ROOT, "tmp/compile/active_bootstrap_skin.css")

  module_function

  def compile!(entrypoint: ENTRYPOINT, output: OUTPUT)
    FileUtils.mkdir_p(File.dirname(output))

    opts = { load_paths: [STYLESHEETS_PATH] }
    opts[:fatal_deprecations] = ["2.0.0"] if ENV["FATAL_DEPRECATIONS"]

    result = Sass.compile(entrypoint, **opts)
    File.write(output, result.css)
    output
  end
end
