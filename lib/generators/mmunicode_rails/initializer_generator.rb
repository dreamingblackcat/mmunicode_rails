module MmunicodeRails
  module Generators
    class InitializerGenerator < ::Rails::Generators::Base

      source_root File.expand_path("../../templates", __FILE__)

      desc 'Creates MmunicodeRails initializer.'

      def copy_initializer
        copy_file 'mmunicode_rails.rb', 'config/initializers/mmunicode_rails.rb'
      end

    end
  end
end