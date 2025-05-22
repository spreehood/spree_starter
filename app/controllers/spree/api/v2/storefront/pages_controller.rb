module Spree
  module Api
    module V2
      module Storefront
        class PagesController < Spree::BaseController
          def index
            pages = Spree::Page.all
            options = {
              include: params[:include].split(',').map(&:strip).reject(&:blank?).to_a
            }

            render json: Spree::Api::V2::Storefront::PageSerializer.new(pages, options).serializable_hash,
                   status: :ok
          end

          def show
            begin
              page = Spree::Page.friendly.find(params[:id])
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
end