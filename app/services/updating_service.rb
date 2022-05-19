class UpdatingService
  include ActiveModel::Validations

  validate :article_is_valid, if: :article
  attr_reader :article

  def initialize(article:)
    @article = article
  end

  def update(params)
    article.update(params) if valid?
  end

  private

  def article_is_valid
    article.errors.full_messages.each do |error|
      errors.add(:article, error)
    end
  end
end
