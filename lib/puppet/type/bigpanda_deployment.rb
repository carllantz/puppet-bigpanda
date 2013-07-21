Puppet::Type.newtype(:bigpanda_deployment) do
    @doc = "Pushes a new deployment to bigpanda"
    
    ensurable

    newparam(:component, :namevar => true) do
      desc "The component/service/application deployed"
    end

    newparam(:access_token) do
      desc "The bigpanda organization access-token"

      validate do |value|
        if value == nil
          raise ArgumentError, "Please specify a bigpanda access-token"
        end
      end
    end

    newparam(:version) do
      desc "The version/revision of the component"
     end

    newparam(:owner) do
      desc "The owner/issuer of the deployment"
      defaultto "puppet"
    end

end


  