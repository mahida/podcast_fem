class Podcast < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :title, presence: true, length: {maximum: 100}
  validates :description, presence: true, length: {maximum: 700}
  validates :thumbnail, presence: true

  has_many :episodes

  has_attached_file :thumbnail, styles: { medium: "300x300#", thumb: "160x160#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\Z/
end
