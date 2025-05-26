module Spree
  module Api
    module V2
      module Storefront
        class PageSerializer < Spree::Api::V2::BaseSerializer
          attributes :id, :name, :slug, :type, :meta_title, :meta_description, :meta_keywords, :preferences, :created_at, :updated_at

          has_many :sections, serializer: Spree::Api::V2::Storefront::PageSectionSerializer
          has_many :page_links, serializer: Spree::Api::V2::Storefront::PageLinkSerializer
        end
      end
    end
  end
end
