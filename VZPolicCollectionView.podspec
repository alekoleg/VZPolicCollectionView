Pod::Spec.new do |s|
  s.name         = "VZPolicCollectionView"
  s.version      = "0.0.9"
  s.summary      = "Horizontal UITableView"
  s.description  = "Horizontal UITableView custom implementation"
  s.homepage     = "https://github.com/alekoleg/VZPolicCollectionView"
  s.license      = 'MIT'
  s.author       = { "Oleg Alekseenko" => "alekoleg@gmail.com" }
  s.source       = { :git => "https://github.com/alekoleg/VZPolicCollectionView.git", :tag => s.version.to_s}
  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Classes/*.{h,m}'
 
  s.frameworks = 'Foundation', 'UIKit'
end
