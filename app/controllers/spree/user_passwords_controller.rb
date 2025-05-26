module Spree
  class UserPasswordsController < ::Devise::PasswordsController
    helper_method :title, :password_path
    layout 'spree/storefront'

    include Spree::Core::ControllerHelpers::Order
    include Spree::LocaleUrls
    include Spree::ThemeConcern
    include Spree::IntegrationsHelper if defined?(Spree::IntegrationsHelper)

    include Spree::Storefront::DeviseConcern

    protected

    def translation_scope
      'devise.user_passwords'
    end

    private

    def title
      Spree.t(:forgot_password)
    end
  end
end
