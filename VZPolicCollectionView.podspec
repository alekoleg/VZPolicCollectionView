Pod::Spec.new do |s|
  s.name         = "VZPolicCollectionView"
  s.version      = "0.0.2"
  s.summary      = "Horizontal UITableView"
  s.description  = "Horizontal UITableView"
  s.homepage     = "https://github.com/alekoleg/VZPolicCollectionView"
  s.license      = 'MIT'
  s.author       = { "Oleg Alekseenko" => "alekoleg@gmail.com" }
  s.source       = { :git => "https://github.com/alekoleg/VZPolicCollectionView", :tag => s.version.to_s}
  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'Classes/*.{h,m}'
 
  s.frameworks = 'Foundation', 'UIKit'
end
