# frozen_string_literal: true

require 'open-uri'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_create :grab_image
  after_create :welcome_send

  has_one_attached :avatar
  has_many :user_categories
  has_many :categories, through: :user_categories
  has_many :posts, foreign_key: 'writter_id'
  has_many :comments
  has_many :likes

  validates :user_name,
            presence: true,
            uniqueness: true,
            length: { in: 3..25 }

  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: 'Veuillez entrer un email valide' }

  def grab_image
    downloaded_image = open('https://loremflickr.com/g/400/400/face/')
    avatar.attach(io: downloaded_image, filename: 'image.png')
  end

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
