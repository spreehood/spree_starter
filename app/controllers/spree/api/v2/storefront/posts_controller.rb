module Spree
  module Api
    module V2
      module Storefront
        class PostsController < Spree::BaseController

          def index
            posts = Spree::Post.all

            render json: Spree::Api::V2::Storefront::PostSerializer.new(posts).serializable_hash,
                   status: :ok
          end

          def show
            begin
              post = Spree::Post.friendly.find(params[:id])

              render json: Spree::Api::V2::Storefront::PostSerializer.new(post).serializable_hash,
                     status: :ok
            rescue ActiveRecord::RecordNotFound
              render json: { error: 'Post not found' }, status: :not_found
            end
          end
        end
      end
    end
  end
end
