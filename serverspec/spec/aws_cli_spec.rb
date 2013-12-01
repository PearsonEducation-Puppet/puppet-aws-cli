# For serverspec documentation - see http://serverspec.org/tutorial.html
require_relative '../spec_helper'

pkgs = ['python2.7', 'python-pip']
pkgs.each do |pkg|
  describe package("#{pkg}") do
    it { should be_installed }
  end
end

describe command('which aws') do
  it { should return_exit_status 0 }
end
