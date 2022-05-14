# frozen_string_literal: true

require 'rails_helper'

describe Article do
  subject(:article) { build(:article) }
  subject(:article2) { create(:article, body: nil) }
  subject(:article3) { create(:article, title: nil) }

  it 'should create an article model with correct title, body, status, and comments' do
    expect(article.title).to be_truthy
    expect(article.body).to be_truthy
    expect(article.comments).to eq []
    expect(article.status).to be_truthy
  end

  it 'should produce an error if article[:body] is nil' do
    expect { article2 }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'should produce an error if article[:title] is nil' do
    expect { article3 }.to raise_error(ActiveRecord::RecordInvalid)
  end

  describe 'errors for less than 10 characters on body' do
    subject(:article4) { create(:article, body: 'This is') }

    it 'should produce an error on body' do
      expect { article4 }.to raise_error ActiveRecord::RecordInvalid
    end
  end

  describe 'errors for incorrect statuses' do
    subject(:article5) { create(:article, status: 'invalid') }

    it 'should produce an error on the status' do
      expect { article5 }.to raise_error ActiveRecord::RecordInvalid
    end
  end

  it 'should return false when archived? instance method is called' do
    expect(article.archived?).to eq false
  end

  it "should return the number of public articles" do
  end
end
