# frozen_string_literal: true

class CreationService
  include ActiveModel::Validations
  attr_reader :params

  validate :article_is_valid, if: :article

  def initialize(params)
    @params = params
  end

  def article
    @article ||= Article.new(params)
  end

  def create
    article.save if valid?
  end

  private

  def article_is_valid
    unless article.valid?
      article.errors.full_messages.each do |error|
        errors.add(:article, error)
      end
    end
  end
end
