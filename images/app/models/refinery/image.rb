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
    
    def self.per_page(dialog = false, has_size_options = false)
      if dialog
        unless has_size_options
          Images.pages_per_dialog
        else
          Images.pages_per_dialog_that_have_size_options
        end
      else
        Images.pages_per_admin_index
      end
    end
  end
end
