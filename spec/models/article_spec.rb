# frozen_string_literal: true

require 'rails_helper'

describe Article do
  subject(:article) { build(:article) }

  it 'should create an article model with correct title and body' do
    expect(article.title).to eq 'Test Title'
  end
end
