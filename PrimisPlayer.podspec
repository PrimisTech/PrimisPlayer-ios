Pod::Spec.new do |s|
    s.name = 'PrimisPlayer'
    s.version = '1.6.0'
    s.summary = 'Primis Player for iOS'
    s.description = <<-DESC
    Primis is a global Video Discovery platform that increases revenue for publishers by helping users discover high-quality video content.
                         DESC

    s.homepage = 'https://github.com/PrimisTech/PrimisPlayer-ios'
    # s.license = "MIT"
    s.author = { 'Primis' => 'mobile@primis.tech' }
    # s.source = { :git => 'https://github.com/PrimisTech/PrimisPlayer-ios.git', :tag => s.version.to_s }
    s.source = { :http => 'https://github.com/PrimisTech/PrimisPlayer-ios/releases/download/1.6.0/PrimisPlayer.xcframework.zip' }

    s.ios.deployment_target = '10.0'
    s.frameworks = 'WebKit', 'UIKit'

    s.vendored_frameworks = 'PrimisPlayer.xcframework'
end
