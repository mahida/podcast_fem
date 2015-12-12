class Episode < ActiveRecord::Base
  belongs_to :podcast

  has_attached_file :thumbnail, styles: { medium: "300x300#", thumb: "160x160#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\Z/

  has_attached_file :mp3
  validates_attachment :mp3, content_type: { content_type: ["audio/mpeg", "audio/mp3"] }, file_name: { matches: [/mp3\Z/] }

end