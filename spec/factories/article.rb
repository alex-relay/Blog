# frozen_string_literal: true

FactoryBot.define do
  factory :article, class: Article do
    title { 'Test Title' }
    body { 'This is a body for an article' }
    status { 'public' }
  end
end
