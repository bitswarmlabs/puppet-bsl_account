require 'spec_helper'
describe 'bsl_account' do

  context 'with default values for all parameters' do
    it { should contain_class('bsl_account') }
  end
end
