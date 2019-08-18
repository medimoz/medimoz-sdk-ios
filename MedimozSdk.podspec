Pod::Spec.new do |spec|

  spec.name         = "MedimozSdk"
  spec.version      = "0.0.1"
  spec.summary      = "Audience measurement for iOS applications"

  spec.description  = <<-DESC
    Medimoz SDK is the tracking component that allows us to measure the audience
    for your iOS application. If you have not received an integration document
    with intructions and credentials, please write us at soporte@medimoz.com
  DESC

  spec.homepage     = "https://github.com/medimoz/medimoz-sdk-ios"

  spec.license      = "MIT"
  # spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }


  spec.authors             = { "Carlos Beltrán Recabarren" => "cbrecabarren@gmail.com" }

  spec.platform     = :ios, "8.0"

  spec.source       = { :git => "https://github.com/medimoz/medimoz-sdk-ios.git", :tag => "master" }

  spec.swift_version     = '4.0'

  spec.ios.deployment_target = '10.0'

  spec.source_files  = "MedimozFW/*.swift"
  
  spec.dependency 'MatomoTracker'

  spec.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }

end
