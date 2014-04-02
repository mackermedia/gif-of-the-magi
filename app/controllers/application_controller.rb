class ApplicationController < ActionController::Base
  # before_filter :validate_viget_ip

  private

  def validate_viget_ip
    last_octet = request.ip.split('.').last
    hq_start   = request.ip.start_with?("70.182.186")

    case request.ip
    when "50.52.128.102"
      return true
    when "173.164.61.149"
      return true
    when hq_start && last_octet >= 97 && last_octet <= 126
      return true
    when "70.182.186.100"
      return true
    when "127.0.0.1"
      return true
    end

    false
  end
end
