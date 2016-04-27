Pod::Spec.new do |s|  
  s.name             = "YQPopView"  
  s.version          = "1.0.0"  
  s.summary          = "A custum popview like qq."   
  s.homepage         = "https://github.com/yyqxiaoyin/YQPopView"  
  # s.screenshots      = "www.example.com/screenshots_1"  
  s.license          = 'MIT'  
  s.author           = { "yyqxiaoyin" => "357491060@qq.com" }  
  s.source           = { :git => "https://github.com/yyqxiaoyin/YQPopView.git", :tag => s.version.to_s }  
  # s.social_media_url = 'https://twitter.com/NAME'  
  
  s.platform     = :ios, '7.0'  
  # s.ios.deployment_target = '5.0'  
  # s.osx.deployment_target = '10.7'  
  s.requires_arc = true  
  
  s.source_files = 'YQPopView/*'  
  # s.resources = 'Assets'  
  
  # s.ios.exclude_files = 'Classes/osx'  
  # s.osx.exclude_files = 'Classes/ios'  
  # s.public_header_files = 'Classes/**/*.h'  
  s.frameworks = 'Foundation', 'UIKit'  
  
end  
