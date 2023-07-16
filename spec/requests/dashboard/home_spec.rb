require 'rails_helper'

RSpec.describe Dashboard::HomeController do
  describe 'GET index' do
    subject(:index) { get dashboard_home_index_path }
    it_behaves_like 'a request'
  end
end
