module Refinery
  module Admin
    module ImagesHelper
      def other_image_views
        Refinery::Images.image_views.reject { |image_view|
          image_view.to_s == Refinery::Images.preferred_image_view.to_s
        }
      end

      def thumbnail_urls(image)
        thumbnail_urls = {
          :"data-original" => asset_paths.compute_public_path(image.url, ''),
          :"data-large" => asset_paths.compute_public_path(image.url, ''),
          :"data-grid" => asset_paths.compute_public_path(image.url(:thumb), '')
        }
        thumbnail_urls
      end
    end
  end
end
