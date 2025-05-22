module Spree
  module Api
    module V2
      module Storefront
        class PagesController < Spree::BaseController
          def index
            pages = Spree::Page.includes(:sections, :page_links)
            options = {
              include: Array(params[:include]).
                      flat_map { |val| val.split(',') }.
                      map(&:strip).
                      reject(&:blank?)
            }

            render json: Spree::Api::V2::Storefront::PageSerializer.new(pages, options).serializable_hash,
                   status: :ok
          end

          def show
            page = Spree::Page.includes(:sections, :page_links, sections: :blocks).
                   friendly.
                   find(params[:id])
            options = {
              include: [:sections, :page_links, 'sections.blocks']
            }

            render json: Spree::Api::V2::Storefront::PageSerializer.new(page, options).serializable_hash,
                   status: :ok
          rescue ActiveRecord::RecordNotFound
            render json: { error: 'Page not found' }, status: :not_found
          end
        end
      end
    end
  end
end
