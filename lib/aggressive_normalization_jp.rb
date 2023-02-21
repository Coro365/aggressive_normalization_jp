# frozen_string_literal: true

require 'unicode'
require_relative "aggressive_normalization_jp/version"

module AggressiveNormalizationJp
  class Error < StandardError; end
  def normalization
    str = self
    # replace full-width to half-width
    str = str.tr("【】（）〔〕［］", "[]()[][]")
    str = str.tr("！？～〜＼／・|｜", "!?~~     ")
    str = str.tr("　", " ")

    # number
    str = str.tr("⓿❶❷❸❹❺❻❼❽❾", "0123456789")

    # for file path
    str = str.tr(":：", "  ")

    str = Unicode::nfkc(str)

    str = str.gsub(/\s+/, "\s")
    str.strip
  end

  def normalization!
    replace(self.normalization)
  end

  def feature
    downcase.normalization.delete("[]()~\s'._").delete("-")
  end

  def feature!
    replace(self.feature)
  end

  def text_escape
    gsub( %r'[\&\(\)\{\}\[\]\*\?\\\ \':]' ) { |c| '\\'+c }
  end

  def text_escape!
    replace(self.text_escape)
  end
end

include AggressiveNormalizationJp
