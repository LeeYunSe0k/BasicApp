//
//  SettingViewController.swift
//  LEDBoard
//
//  Created by 이윤석 on 2022/05/14.
//

import UIKit

protocol LEDBoardSettingDelegate: AnyObject {
    func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor)
}

class SettingViewController: UIViewController {
    // 각 버튼 및 텍스트필드 별 아울렛 변수 설정
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    
    // 화면전환시 데이터를 전달 받을 delegate 및 각각 텍스트, 컬러, 배경컬러 변수 설정 및 초기화
    weak var delegate: LEDBoardSettingDelegate?
    var ledText: String?
    var textColor: UIColor = .yellow
    var backgroundColor: UIColor = .black
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView() // 호출하지 않으면 led화면에서 전달받은 값들이 초기화가 되지 않음
    }
    
    // 전달받은 데이터들로 View를 초기화 지켜주는 함수
    private func configureView() {
        if let ledText = self.ledText {
            self.textField.text = ledText
        }
        self.changeTextColor(color: self.textColor)
        self.changeBackgruondColorButton(color: self.backgroundColor)
    }
    
    // 각각 버튼 별 액션 함수
    @IBAction func tapTextColorButton(_ sender: UIButton) { // 텍스트 색상 설정 버튼 3개를 가지고 있는 함수
        // sender에 눌린 버튼이 저장됨
        if sender  == self.yellowButton {
            self.changeTextColor(color: .yellow)
            self.textColor = .yellow
        }
        else if sender  == self.purpleButton {
            self.changeTextColor(color: .purple)
            self.textColor = .purple
        }
        else {
            self.changeTextColor(color: .green)
            self.textColor = .green
        }
    }
    @IBAction func tapBackgroundColorButton(_ sender: UIButton) { // 배경 색상 설정 버튼 3개를 가지고 있는 함수
        // sender를 통해 어떤 버튼이 눌렸는지 구별
        if sender == self.blackButton {
            self.changeBackgruondColorButton(color: .black)
            self.backgroundColor = .black
        }
        else if sender == self.blueButton {
            self.changeBackgruondColorButton(color: .blue)
            self.backgroundColor = .blue
        }
        else {
            self.changeBackgruondColorButton(color: .orange)
            self.backgroundColor = .orange
        }
    }
    @IBAction func tapSaveButton(_ sender: UIButton) { // 저장 버튼을 눌렀을 때 액션 함수
        // delegate의 changedSetting 함수를 이용하여 데이터 전달
        self.delegate?.changedSetting(
            text: textField.text,
            textColor: self.textColor,
            backgroundColor: self.backgroundColor
        )
        self.navigationController?.popViewController(animated: true) // 이전 View 이동
    }
    
    private func changeTextColor(color: UIColor){ // 각 버튼의 alpha 값을 변경 해주는 함수
        // 삼항 연산자를 이용하여 파라미터로 전달받은 UIColor에 따라 해당 버튼일 시 alpha를 1로 아닐 시 0.2로 변경
        self.yellowButton.alpha = color == UIColor.yellow ? 1 : 0.2
        self.purpleButton.alpha = color == UIColor.purple ? 1 : 0.2
        self.greenButton.alpha = color == UIColor.green ? 1 : 0.2
    }
    private func changeBackgruondColorButton(color: UIColor){ // 각 배경 버튼의 alpha값을 변경해주는 함수
        // 삼항 연산자를 이용하여 파라미터로 전달받은 UIColor에 따라 해당 버튼일 시 alpha를 1로 아닐 시 0.2로 변경
        self.blackButton.alpha = color == UIColor.black ? 1 : 0.2
        self.blueButton.alpha = color == UIColor.blue ? 1 : 0.2
        self.orangeButton.alpha = color == UIColor.orange ? 1 : 0.2
    }
}
