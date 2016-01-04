require 'test_helper'

class PhraseTest < ActiveSupport::TestCase
  test '特定のPhraseのTranslationが存在し、そのVoiceが一つもない要素を取得したい' do
    phrase_with_voice_and_translation = Phrase.create! name: 'Voiceあり、Translationあり'
    translation = Phrase.create! name: '翻訳１'
    Translatability.create! phrase: phrase_with_voice_and_translation, translation: translation
    phrase_with_voice_and_translation.voices.create! name: '音声１'

    phrase_with_voice_without_translation = Phrase.create! name: 'Voiceあり、Translationなし'
    phrase_with_voice_without_translation.voices.create! name: '音声２'

    phrase_without_voice_with_translation = Phrase.create! name: 'Voiceなし、Translationあり'
    Translatability.create! phrase: phrase_without_voice_with_translation, translation: translation

    phrase_without_voice_and_translation = Phrase.create! name: 'Voiceなし、Translationなし'

    phrases = Phrase.with_translation_without_voice
    assert_equal [phrase_without_voice_with_translation.id], phrases.pluck(:id)
  end
end
