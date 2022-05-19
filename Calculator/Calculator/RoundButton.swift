//
//  RoundButton.swift
//  Calculator
//
//  Created by 이윤석 on 2022/05/15.
//

import UIKit

// IBDesignable, IBInspectable을 통해 스토리보드를 통해 변경하고 실시간으로 변경된 값을 보여주도록 설정
@IBDesignable
class RoundButton: UIButton { // 버튼의 모양을 둥글게 만들기
    @IBInspectable var isRound: Bool = false {
        didSet {
            if isRound {
                self.layer.cornerRadius = self.frame.height / 2
            }
        }
    }
}
