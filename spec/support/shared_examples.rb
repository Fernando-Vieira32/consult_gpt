shared_examples 'a request' do |kind|
  it { subject and expect(response).to have_http_status kind.presence || :success }
  it { expect { subject }.not_to raise_exception }
end
