xml.instruct!
xml.tag! "soap:Envelope", "xmlns:soap" => 'http://schemas.xmlsoap.org/soap/envelope/',
                          "xmlns:xsd" => 'http://www.w3.org/2001/XMLSchema',
                          "xmlns:xsi" => 'http://www.w3.org/2001/XMLSchema-instance',
                          "xmlns:tns" => @namespace do
  if !header.nil?
    xml.tag! "soap:Header" do
      xml.tag! "tns:#{@tns_response_name}" do
        wsdl_data xml, header
      end
    end
  end
  xml.tag! "soap:Body" do
    xml.tag! "tns:#{@tns_response_name}" do
      wsdl_data xml, result
    end
  end
end
