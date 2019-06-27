require 'rspec'
require 'webmock/rspec'

require 'aliyunsdkcore'

describe 'roa nlp request' do

  WebMock.allow_net_connect!

  let(:roa_nlp_client) do
    ROAClient.new(
        endpoint:          'http://nlp.cn-shanghai.aliyuncs.com',
        api_version:       '2018-04-08',
        access_key_id:     ENV['ACCESS_KEY_ID'],
        access_key_secret: ENV['ACCESS_KEY_SECRET'],
        )
  end

  it 'request' do
    response = roa_nlp_client.request(method: 'POST', uri: '/nlp/api/wordsegment/general', options: { timeout: 15000 })
    expect(JSON.parse(response.body).keys.include?('data')).to be true
  end

  it 'post should ok' do
    response = roa_nlp_client.request(method: 'POST', uri: '/nlp/api/wordsegment/general', options: { timeout: 10000 })
    expect(JSON.parse(response.body).keys.include?('data')).to be true
  end

  it 'post raw body should ok' do
    options  = { raw_body: true, timeout: 10000 }
    response = roa_nlp_client.request(method: 'POST', uri: '/nlp/api/wordsegment/general', options: options)
    expect(response.body.instance_of? String).to be true
  end

end
