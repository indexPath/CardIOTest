//
//  HankookNfcViewController.swift
//  SnappyWireExamp
//
//  Created by 김성남 on 2018. 9. 11..
//  Copyright © 2018년 김성남. All rights reserved.
//

import UIKit

class extensionViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.layoutIfNeeded()
    self.view.setNeedsLayout()
    self.initLayout()
    self.initRequest()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  func initLayout() {
  }
  
  func initRequest() {
    
  }
 
}
//-------------------------------------------------------------------------------------------
// MARK: - StoryBoardHelper
//-------------------------------------------------------------------------------------------
extension NSObject {
  public var className: String {
    return type(of: self).className
  }
  
  public static var className: String {
    return String(describing: self)
  }
}

protocol StoryBoardHelper {}
extension UIViewController: StoryBoardHelper {}
extension StoryBoardHelper where Self: UIViewController {
  static func instantiate() -> Self {
    let storyboard = UIStoryboard(name: self.className, bundle: nil)
    return storyboard.instantiateViewController(withIdentifier: self.className) as! Self
  }
  
  static func instantiate(storyboard: String) -> Self {
    let storyboard = UIStoryboard(name: storyboard, bundle: nil)
    return storyboard.instantiateViewController(withIdentifier: self.className) as! Self
  }
}
//-------------------------------------------------------------------------------------------*/
extension UIView {
  public func setCornerRadius(radius: CGFloat) {
    self.layer.cornerRadius = radius
    self.layer.masksToBounds = true
  }
}

