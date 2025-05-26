module Spree
  module Api
    module V2
      module Storefront
        class PageLinkSerializer < Spree::Api::V2::BaseSerializer
          set_type :page_link

          attributes :id, :label, :url, :open_in_new_tab, :position, :preferences, :created_at, :updated_at
        end
      end
    end
  end
end
