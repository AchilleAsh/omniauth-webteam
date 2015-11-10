require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Webteam < OmniAuth::Strategies::OAuth2
      DEFAULT_SCOPE = 'user'
      # Give your strategy a name.
      option :name, "webteam"

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, {
        :site => "https://webteam.ensea.fr/api",
       :authorize_url => 'https://webteam.ensea.fr/oauth/v2/auth',
    :token_url => 'https://webteam.ensea.fr/oauth/v2/token'
  }

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid{ raw_info['id'] }

      info do
        {
          :first_name => raw_info['first_name'],
          :last_name => raw_info['name'],
          :name => raw_info['first_name'] + ' ' + raw_info['name'],
          :email => raw_info['email'],
          :nickname => raw_info['username']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('user').parsed
      end

        def request_phase
        options[:authorize_params] = {
          :client_id     => options['client_id'],
          :response_type => 'code',
          :scope        => (options['scope'] || DEFAULT_SCOPE)
        }

        super
      end
      
    end
  end
end
