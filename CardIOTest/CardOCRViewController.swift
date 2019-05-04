//
//  CardOCRViewController.swift
//  CardIOTest
//
//  Created by 김성남 on 04/05/2019.
//  Copyright © 2019 김성남. All rights reserved.
//

import UIKit

/*
// carIO
// https://github.com/card-io/card.io-iOS-SDK
*/

class CardOCRViewController: extensionViewController {
  
  @IBOutlet weak var cardNumber_1_TextField: UITextField!
  @IBOutlet weak var cardNumber_2_TextField: UITextField!
  @IBOutlet weak var cardNumber_3_TextField: UITextField!
  @IBOutlet weak var cardNumber_4_TextField: UITextField!
  @IBOutlet weak var cardMonthTextField: UITextField!
  @IBOutlet weak var cardYearTextField: UITextField!
  @IBOutlet weak var cardScanButton: UIButton!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
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
  
  override func initLayout() {
    super.initLayout()
    self.cardScanButton.setCornerRadius(radius: 10)
  }
  
  override func initRequest() {
    super.initRequest()
   
  }
  
  // scan
  @IBAction func cardScanButtonTouched(_ sender: UIButton) {
    let cardIOVC = CardIOPaymentViewController(paymentDelegate: self)
    cardIOVC?.collectCardholderName = false
    cardIOVC?.collectCVV = false
    cardIOVC?.collectExpiry = true
    cardIOVC?.modalPresentationStyle = .formSheet
    cardIOVC?.guideColor = UIColor(red:0.13, green:0.54, blue:0.61, alpha:1.00)
    cardIOVC?.disableManualEntryButtons = true
    cardIOVC?.hideCardIOLogo = true
    present(cardIOVC!, animated: true, completion: nil)
  }
  
  
  @IBAction func backButtonTouched(_ sender: UIButton) {
    self.dismiss(animated: false, completion: nil)
  }
  
}

extension CardOCRViewController: CardIOPaymentViewControllerDelegate {
  func userDidCancel(_ paymentViewController: CardIOPaymentViewController!) {
    print("사용자가 결제 정보를 취소했습니다 .")
    paymentViewController?.dismiss(animated: true, completion: nil)
  }
  
  func userDidProvide(_ cardInfo: CardIOCreditCardInfo!, in paymentViewController: CardIOPaymentViewController!) {
    if let info = cardInfo {
      print(info.cardNumber!)  // card`z` number
      print(info.expiryMonth) // month
      print(info.expiryYear)  // year
      // cvv 까지 있지만 인식률이 안좋음
      
      let cardNumber_1 = info.cardNumber[..<info.cardNumber.index(info.cardNumber.startIndex, offsetBy: 4)]
      self.cardNumber_1_TextField.text = "\(cardNumber_1)"
      
      let cardNumber_2 = info.cardNumber[info.cardNumber.index(info.cardNumber.startIndex, offsetBy: 4)...info.cardNumber.index(info.cardNumber.endIndex, offsetBy: -9)]
      self.cardNumber_2_TextField.text = "\(cardNumber_2)"
      
      let cardNumber_3 = info.cardNumber[info.cardNumber.index(info.cardNumber.startIndex, offsetBy: 8)...info.cardNumber.index(info.cardNumber.endIndex, offsetBy: -5)]
      self.cardNumber_3_TextField.text = "\(cardNumber_3)"
      
      let cardNumber_4 = info.cardNumber[info.cardNumber.index(info.cardNumber.startIndex, offsetBy: 12)...info.cardNumber.index(info.cardNumber.endIndex, offsetBy: -1)]
      self.cardNumber_4_TextField.text = "\(cardNumber_4)"
      
      let yearNumber = "\(info.expiryYear)"
      let year = yearNumber[yearNumber.index(yearNumber.startIndex, offsetBy: 2)...yearNumber.index(yearNumber.endIndex, offsetBy: -1)]
      
      self.cardYearTextField.text = "\(year)"
      
      var expiryMonth = ""
      expiryMonth = "\(info.expiryMonth)"
      
      if expiryMonth.count == 1 {
        self.cardMonthTextField.text = "0\(info.expiryMonth)"
      } else {
        self.cardMonthTextField.text = "\(info.expiryMonth)"
      }
    }
    paymentViewController?.dismiss(animated: true, completion: nil)
  }
}
