# frozen_string_literal: true

require_relative '../../controllers/connection'

RSpec.describe LNDClientInternal::Connection do
  describe '.expand' do
    it 'expands' do
      expect(described_class.expand(
        'lndconnect://127.0.0.1:10001?cert=MIICJzCCAc2gAwIBAgIRAImZs0ieSBjBcMtpD8oQ_okwCgYIKoZIzj0EAwIwMTEfMB0GA1UEChMWbG5kIGF1dG9nZW5lcmF0ZWQgY2VydDEOMAwGA1UEAxMFYWxpY2UwHhcNMjMwMzEyMjM0NDEyWhcNMjQwNTA2MjM0NDEyWjAxMR8wHQYDVQQKExZsbmQgYXV0b2dlbmVyYXRlZCBjZXJ0MQ4wDAYDVQQDEwVhbGljZTBZMBMGByqGSM49AgEGCCqGSM49AwEHA0IABL8ZHtjXzSy7Qs9SL0wECTsAwyX8xplEox1DQUMnB6mfu5dXxzuTqoyCL1FuwjthqfZNO3hX2O-o5pyHxGkqYA2jgcUwgcIwDgYDVR0PAQH_BAQDAgKkMBMGA1UdJQQMMAoGCCsGAQUFBwMBMA8GA1UdEwEB_wQFMAMBAf8wHQYDVR0OBBYEFFXs5yUhjbRfmlYGGEYPlzquQdslMGsGA1UdEQRkMGKCBWFsaWNlgglsb2NhbGhvc3SCBWFsaWNlgg5wb2xhci1uMS1hbGljZYIEdW5peIIKdW5peHBhY2tldIIHYnVmY29ubocEfwAAAYcQAAAAAAAAAAAAAAAAAAAAAYcErBgABjAKBggqhkjOPQQDAgNIADBFAiBvz_hKoN0JltWgjzBHYHpB4fM2tqPge9j1m1tt0ye8PgIhAJkGw-5chEuH5bVFLBQjo5SUAW_sGX9i0aSqcSJBEERQ&macaroon=AgEDbG5kAvgBAwoQZfbno2BCpVfn-g6USaC3JRIBMBoWCgdhZGRyZXNzEgRyZWFkEgV3cml0ZRoTCgRpbmZvEgRyZWFkEgV3cml0ZRoXCghpbnZvaWNlcxIEcmVhZBIFd3JpdGUaIQoIbWFjYXJvb24SCGdlbmVyYXRlEgRyZWFkEgV3cml0ZRoWCgdtZXNzYWdlEgRyZWFkEgV3cml0ZRoXCghvZmZjaGFpbhIEcmVhZBIFd3JpdGUaFgoHb25jaGFpbhIEcmVhZBIFd3JpdGUaFAoFcGVlcnMSBHJlYWQSBXdyaXRlGhgKBnNpZ25lchIIZ2VuZXJhdGUSBHJlYWQAAAYg61atst43JqOPEZKGrLszr6q8eWVvQfxgr1inv45ukJ4'
      ).keys.sort).to eq(%i[address certificate host macaroon port])
    end
  end
end
