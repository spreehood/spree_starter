module Spree
  module Api
    module V2
      module Storefront
        class PostSerializer < Spree::Api::V2::BaseSerializer
          set_type :post

          attributes :id, :title, :slug, :tag_list, :published_at, :created_at, :updated_at

          attribute :image do |object|
            if object.image.attached?
              {
                url: Rails.application.routes.url_helpers.rails_blob_url(object.image, only_path: true),
                width: object.image.metadata[:width],
                height: object.image.metadata[:height]
              }
            end
          end

          attribute :content do |object|
            if object.content.body.present?
              {
                id: object.content.id,
                body: object.content.body
              }
            end
          end

          attribute :excerpt do |object|
            if object.excerpt.body.present?
              {
                id: object.excerpt.id,
                body: object.excerpt.body
              }
            end
          end

          attribute :post_category do |object|
            if object.post_category
              {
                id: object.post_category.id,
                name: object.post_category.title,
                slug: object.post_category.slug
              }
            end
          end

          attribute :author do |object|
            if object.author
              {
                id: object.author.id,
                name: object.author.name,
                email: object.author.email
              }
            end
          end
        end
      end
    end
  end
end
