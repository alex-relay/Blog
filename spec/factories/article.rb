# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :article, class: Article do
    title { Faker::Book.title }
    body { Faker::Hipster.paragraph(sentence_count: 2) }
    status { 'public' }
  end
end
