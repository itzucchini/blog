class Post < ActiveRecord::Base
  has_many :comments
  validates_presence_of :title, :body
  
  # validates_length_of :body, :title, :minimum => 10
  # validates_format_of uses regex. see rubular.com for example
  validates_length_of :body, :within => 5..50
  validates_length_of :title, :minimum => 5, :message => "title should be a little longer"
  
end
