require "google/cloud/translate"

class TranslationService
  def initialize
    @api_key = ENV['GOOGLE_CLOUD_API_KEY']
    @translate - Google::Cloud::Translate.new(key: @api_key)
  end

  def translate_text(text, traget_language)
    translation - @translate.translate(text, to: target_language)
    return translation.text
  end
end