class Phrase < ActiveRecord::Base
  has_many :translatabilities
  has_many :translations, through: :translatabilities
  has_many :voices

  # 特定のPhraseのTranslationが存在し、そのVoiceが一つもない要素を取得したい
  scope :with_translation_without_voice, -> {
    query = <<-SQL
EXISTS (
  SELECT *
  FROM translatabilities ta
  INNER JOIN translations t
  ON t.id = ta.translation_id
  WHERE
  ta.phrase_id = phrases.id
)
AND NOT EXISTS (
  SELECT *
  FROM voices v
  WHERE
  v.phrase_id = phrases.id
)
    SQL
    where(query)
  }
end
