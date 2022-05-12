# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :comment, class: Comment do
    association :article, factory: :article

    commenter { Faker::Name.name }
    body { Faker::Hipster.paragraph(sentence_count: 2) }
    status { 'public' }
  end
end
