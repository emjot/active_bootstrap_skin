# frozen_string_literal: true

require "test_helper"
require "compile_check"

class CompilationTest < Minitest::Test
  def test_compilation_succeeds
    output = CompileCheck.compile!
    css = File.read(output)

    assert_includes css, ".navbar"
    assert_includes css, "#active_admin_content"
  end
end
