require 'spec_helper'

describe Channel do
  it { should validate_presence_of :name }
end
