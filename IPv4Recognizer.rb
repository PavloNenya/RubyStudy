class IPv4Recognizer
  def is_valid(ipv4)
    result = Regexp.new('^((25[0-5]|(2[0-4]|1\d|[1-9]|)\d)\.?\b){4}$').match(ipv4)
    if result
      true
    else
      false
    end
  end
end

ipv4r = IPv4Recognizer.new
IPv4 = '192.168.0.1'
is_valid = ipv4r.is_valid(IPv4)
puts is_valid
wrong = '192.168.125.412'
is_valid = ipv4r.is_valid(wrong)
puts is_valid