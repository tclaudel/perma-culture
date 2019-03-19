require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user_categories: Field::HasMany,
    categories: Field::HasMany,
    posts: Field::HasMany,
    comments: Field::HasMany,
    likes: Field::HasMany,
    messages: Field::HasMany,
    conversations: Field::HasMany,
    id: Field::Number,
    email: Field::String,
    encrypted_password: Field::String,
    reset_password_token: Field::String,
    reset_password_sent_at: Field::DateTime,
    remember_created_at: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    user_name: Field::String,
    description: Field::Text,
    is_admin: Field::Boolean,
    address: Field::String,
    latitude: Field::Number.with_options(decimals: 2),
    longitude: Field::Number.with_options(decimals: 2),
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user_categories,
    :categories,
    :posts,
    :comments,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user_categories,
    :categories,
    :posts,
    :comments,
    :likes,
    :messages,
    :conversations,
    :id,
    :email,
    :encrypted_password,
    :reset_password_token,
    :reset_password_sent_at,
    :remember_created_at,
    :created_at,
    :updated_at,
    :user_name,
    :description,
    :is_admin,
    :address,
    :latitude,
    :longitude,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user_categories,
    :categories,
    :posts,
    :comments,
    :likes,
    :messages,
    :conversations,
    :email,
    :encrypted_password,
    :reset_password_token,
    :reset_password_sent_at,
    :remember_created_at,
    :user_name,
    :description,
    :is_admin,
    :address,
    :latitude,
    :longitude,
  ].freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end
end
