require 'rubygems' if RUBY_VERSION < '1.9.0'
require 'bigpanda'

Puppet::Type.type(:bigpanda_deployment).provide(:bigpanda_deployment) do
  desc "send application deployment to bigpanda"

  def create
    return true
  end

  def destroy
    return true
  end


  def exists?
    begin
      component     = @resource[:name]
      version       = @resource[:version]
      owner         = @resource[:owner]
      access_token  = @resource[:access_token]
      status        = 'success'
      host          = Facter.value(:fqdn)

      client = BigPanda::Client.new :access_token => access_token, :target_url => 'https://stg-api.bigpanda.io'
      client.deployment_end :hosts => host, :version => version, :component => component, :status => status
      
    rescue Exception => e
      raise Puppet::Error, "Push bigpanda deployment failed with #{e}"
    end
  end

end
