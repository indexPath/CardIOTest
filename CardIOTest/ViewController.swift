//
//  ViewController.swift
//  CardIOTest
//
//  Created by 김성남 on 13/04/2019.
//  Copyright © 2019 김성남. All rights reserved.
//

import UIKit

class ViewController: extensionViewController {

  override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view.
  }
  
  @IBAction func joinButtonTouched(_ sender: UIButton) {
    let destination = CardOCRViewController.instantiate(storyboard: "Main")
    self.present(destination, animated: true, completion: nil)
  }

}

