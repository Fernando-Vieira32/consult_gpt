require 'rails_helper'

RSpec.describe 'Console routing', type: :routing do
  context 'development environment' do
    before do
      allow(Rails.env).to receive(:development?).and_return(true)
      Rails.application.reload_routes!
    end

    it 'routes to admin#console' do
      expect(get: '/console').to route_to(controller: 'admin', action: 'console')
    end
  end

  describe 'other environments' do
    before do
      Rails.application.reload_routes!
    end
    it 'does not route to admin#console' do
      expect(get: '/console').not_to be_routable
    end
  end
end
