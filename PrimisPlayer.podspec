Pod::Spec.new do |s|
    s.name = 'PrimisPlayer'
    s.version = '2.3.0'
    s.summary = 'Primis Player for iOS'
    s.description = <<-DESC
    Primis is a global Video Discovery platform that increases revenue for publishers by helping users discover high-quality video content.
                         DESC

    s.homepage = 'https://github.com/PrimisTech/PrimisPlayer-ios'
    s.license = { :type => 'MIT', :file => 'LICENSE.txt' }
    s.author = { 'Primis' => 'mobile@primis.tech' }
    s.source = { :http => 'https://github.com/PrimisTech/PrimisPlayer-ios/releases/download/2.3.0/PrimisPlayerSdk.xcframework.zip', :type => "zip" }

    s.ios.deployment_target = '12.0'
    s.frameworks = 'WebKit', 'UIKit'
    s.preserve_paths = 'PrimisPlayerSdk.xcframework'
    s.vendored_frameworks = 'PrimisPlayerSdk.xcframework'
end
