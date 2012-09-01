require 'coderay'

class CodeFormatter

  def self.display(text)
    return CodeRay.scan("#{text}", :ruby).div
  end

end