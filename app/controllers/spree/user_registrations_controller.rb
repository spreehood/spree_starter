module Spree
  class UserRegistrationsController < ::Devise::RegistrationsController
    helper_method :title
    layout 'spree/storefront'

    include Spree::Core::ControllerHelpers::Order
    include Spree::LocaleUrls
    include Spree::ThemeConcern
    include Spree::AnalyticsHelper
    include Spree::IntegrationsHelper if defined?(Spree::IntegrationsHelper)

    include Spree::Storefront::DeviseConcern

    protected

    def translation_scope
      'devise.user_registrations'
    end

    private

    def title
      Spree.t(:sign_up)
    end
  end
end
