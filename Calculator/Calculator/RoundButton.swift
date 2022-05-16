//
//  RoundButton.swift
//  Calculator
//
//  Created by 이윤석 on 2022/05/15.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {
    @IBInspectable var isRound: Bool = false {
        didSet {
            if isRound {
                self.layer.cornerRadius = self.frame.height / 2
            }
        }
    }
}
