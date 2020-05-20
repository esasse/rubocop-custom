# frozen_string_literal: true

module RuboCop
  module Cop
    module RSpec
      class AvoidRequireRailsHelper < Cop
        MSG = 'Don\'t require rails_helper in your spec. It should be in .rspec file'

        def on_send(send_node)
          return unless send_node.method?(:require)
          return unless send_node.arguments[0].value == 'rails_helper'

          add_offense(send_node)
        end
      end
    end
  end
end
