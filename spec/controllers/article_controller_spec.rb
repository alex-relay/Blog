require 'rails_helper'

describe ArticlesController, type: :request do
  let!(:articles) { FactoryBot.create_list(:article, 3) }

  describe 'get articles' do
    it 'should respond with a 200 status code on the index page and a list of articles' do
      get articles_path
      formatted = JSON.parse(response.body)
      expect(response).to be_successful
      expect(response).to have_http_status(200)
      expect(formatted.size).to eq 3
    end

    it 'should get a specific article' do
      get article_path(id: articles.first.id)
      formatted = JSON.parse(response.body)
      expect(response).to be_successful
      expect(formatted['id']).to eq 1
    end
  end

  describe 'create article' do
    it 'should create an article with given params' do
      post articles_path, params: { article: { title: 'Testing Title', body: 'This is a test body', status: 'public' } }
      expect(response).to be_successful
    end

    it 'should produce an error if body is nil' do
      post articles_path, params: { article: { title: 'Testing Title', body: nil, status: 'public' } }
      formatted = JSON.parse(response.body)
      expect(formatted['errors'].first['message']).to include "Body can't be blank"
    end

    it 'should produce an error if title is nil' do
      post articles_path, params: { article: { title: nil, body: 'This is a test body', status: 'public' } }
      formatted = JSON.parse(response.body)
      expect(formatted['errors'].first['message'].first).to eq "Title can't be blank"
    end

    it 'should produce an error if body is less than 10 characters' do
      post articles_path, params: { article: { title: 'Testing Title', body: 'too short', status: 'public' } }
      formatted = JSON.parse(response.body)
      expect(formatted['errors'].first['message'].first).to eq 'Body is too short (minimum is 10 characters)'
    end

    it 'should not allow for invalid field to be saved' do
      post articles_path,
           params: { article: { title: 'Testing Title', body: 'This is a test body', status: 'public',
                                invalid_field: 'test invalid field' } }
      formatted = JSON.parse(response.body)
      expect(formatted[:invalid_field]).to eq nil
    end
  end

  describe 'delete article' do
    before(:each) do
      article_d = create(:article)
      delete article_path(id: article_d.id)
    end
    it 'should remove an article' do
      expect(response).to have_http_status(204)
    end
  end

  describe 'update article' do
    it 'should update an article' do
      put article_path(
        id: articles.first.id, article: {
          title: articles.first.title, body: 'This is an updated body', status: 'archived'
        }
      )
      formatted = JSON.parse(response.body)
      expect(response).to be_successful
      expect(formatted['body']).to eq 'This is an updated body'
      expect(formatted['status']).to eq 'archived'
    end
  end
end
