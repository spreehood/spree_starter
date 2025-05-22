module Spree
  module Api
    module V2
      module Storefront
        class PageBlockSerializer < Spree::Api::V2::BaseSerializer
          attributes :id, :name, :type, :position, :page_links_count, :preferences, :created_at, :updated_at

          attribute :asset do |object|
            if object.asset.attached?
              {
                url: Rails.application.routes.url_helpers.rails_blob_url(object.asset, only_path: true)
              }
            end
          end

          attribute :rich_text do |object|
            if object.rich_text_text.present?
              {
                id: object.rich_text_text.id,
                name: object.rich_text_text.name,
                body: object.rich_text_text.body,
                locale: object.rich_text_text.locale
              }
            end
          end
        end
      end
    end
  end
end
