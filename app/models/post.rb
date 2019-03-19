# frozen_string_literal: true

class Post < ApplicationRecord
  has_many_attached :post_pictures
  # after_create :tweet
  # after_create :fb_post

  belongs_to :writter, class_name: 'User'
  belongs_to :category
  has_many :comments, as: :commenteable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy

	validates :content, 
	presence: true,	
	length:{minimum: 5, maximum: 3000}
	
	validates :title,
	presence: true,
	length:{minimum: 5, maximum: 60}

  scope :by_latest_comment, -> {Post.joins(:comments).merge(Comment.order(created_at: :desc))}
  scope :by_date, -> { order(created_at: :asc)}

  def latest_comment
    comments
     .order(Comment.arel_table['created_at'].asc)
     .first
  end

  private

  def tweet
    BotTwitter.new(self.title, self.writter.user_name).perform
  end

  def fb_post
    @graph = Koala::Facebook::API.new(ENV['FB_ACCESS_TOKEN'])

    pages = @graph.get_connections('me', 'accounts')
    page_token = pages.first['access_token']
    @page_graph = Koala::Facebook::API.new(page_token)
    @page_graph.put_wall_post("#{self.writter.user_name} a poste un article : #{self.title} sur perma-culture.herokuapp.com \n #{self.content}")
  end
end
