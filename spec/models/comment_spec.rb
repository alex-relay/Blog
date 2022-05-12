# frozen_string_literal: true

require 'rails_helper'

describe Comment do
  subject(:comment) { create(:comment) }

  it 'should belong to an article' do
    expect(comment.article).to be_truthy
    expect(comment.article.comments.length).to eq 1
  end

  it 'should be created with attributes' do
    expect(comment.commenter).to be_truthy
    expect(comment.body).to be_truthy
  end

  describe 'errors' do
    subject(:comment2) { create(:comment, body: nil) }
    subject(:comment3) { create(:comment, commenter: nil) }

    it 'should produce an error if body is nil' do
      expect { comment2 }.to raise_error ActiveRecord::RecordInvalid
    end

    it 'should produce an error if commenter is nil' do
      expect { comment3 }.to raise_error ActiveRecord::RecordInvalid
    end
  end
end
