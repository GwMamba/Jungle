class New::TranslationsController < ApplicationController
  def translate
    translation_service = New::TranslationService.new
    original_text = params[:text]
    target_language = params[:target_language]

    translated_text = translation_service.translate_translate_text(original_text, target_language)

    # Store User's language preference in session
    session[:language_preference] = tanrget_language

    render json: { original_text: original_text, translated_text: translated_text }
  end

end
