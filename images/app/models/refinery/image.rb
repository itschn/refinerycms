require 'dragonfly'

module Refinery
  class Image < Refinery::Core::BaseModel
    attr_accessible :file
  
    mount_uploader :file, ::Refinery::ImageUploader 

    validates :file, presence: true
    
    delegate :url, to: :file
    
    def thumbnail(options = {})
      file.url(:thumb)
    end
    
    def image_name
      self[:file]
    end
    
    def title
      image_name
    end
  end
end
