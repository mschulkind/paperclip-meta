require 'paperclip-meta'

module Paperclip
    module Meta

      if defined? Rails::Railtie
        require 'rails'
        class Railtie < Rails::Railtie
          initializer 'paperclip_meta.insert_into_attachment' do
            ActiveSupport.on_load :after_initialize do
              Paperclip::Meta::Railtie.insert
            end
          end
        end
      end

      class Railtie
        def self.insert
          Paperclip::Attachment.send(:include, Paperclip::Meta::Attachment)
        end
      end

  end
end
