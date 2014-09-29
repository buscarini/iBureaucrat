Pod::Spec.new do |s|
  s.name = "iBureaucrat"
  s.ios.deployment_target = "7.0"
  s.version = "0.0.16"
  s.summary = "A forms library for iOS."
  s.homepage = "https://github.com/jasperblues/iBureaucrat"
  s.license = { :type => 'Apache2', :file => 'LICENSE' }
  s.author = { "Jasper Blues" => "jasper@appsquick.ly" }
  s.source = { :git => "https://github.com/buscarini/iBureaucrat.git", :tag => "0.0.16" }
  s.platform = :ios, '7.0'
  s.source_files = 'bureaucrat/**/*.{h,m}'
  s.ios.frameworks = %w{ QuartzCore CoreGraphics }
  s.requires_arc = true
  s.dependency 'CKUITools', '~> 0.5.3'
end


