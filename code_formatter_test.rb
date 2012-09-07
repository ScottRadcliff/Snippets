require './code_formatter.rb'
require 'test/unit'

class CodeFormatterTest < Test::Unit::TestCase

  def test_format_text_to_html
   html = CodeFormatter.display("something")
   assert html.include? "<pre>something</pre>"
  end
end
