module Spree
  module Api
    module V2
      module Storefront
        class PageSectionSerializer < Spree::Api::V2::BaseSerializer
          attributes :id, :name, :type, :position, :page_links_count, :preferences, :created_at, :updated_at

          attribute :image do |object|
            if object.image.attached?
              {
                url: Rails.application.routes.url_helpers.rails_blob_url(object.image, only_path: true),
                width: object.image.metadata[:width],
                height: object.image.metadata[:height]
              }
            end
          end

          has_many :blocks, serializer: Spree::Api::V2::Storefront::PageBlockSerializer
        end
      end
    end
  end
end
