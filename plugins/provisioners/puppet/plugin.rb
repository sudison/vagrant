require "vagrant"

module VagrantPlugins
  module Pupppet
    
    class Plugin < Vagrant.plugin("1")
      name "puppet"
      description <<-DESC
      Provides support for provisioning your virtual machines with
      Puppet either using `puppet apply` or a Puppet server.
      DESC

      provisioner("puppet") do
        require File.expand_path("../provisioner/puppet", __FILE__)
        Puppet::Provisioner::Puppet
      end

      provisioner("puppet_server") do
        require File.expand_path("../provisioner/puppet_server", __FILE__)
        Puppet::Provisioner::PuppetServer
      end
    end
  end
end
