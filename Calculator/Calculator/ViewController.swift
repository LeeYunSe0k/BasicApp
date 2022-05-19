//
//  ViewController.swift
//  Calculator
//
//  Created by 이윤석 on 2022/05/15.
//

import UIKit

enum Operation { // 연산자 열거형
    case Add
    case Subtract
    case Divide
    case Multiply
    case unknown
}

class ViewController: UIViewController {

    @IBOutlet weak var numberOutputLabel: UILabel! // 값들이 보여지는 label 변수
    
    var displayNumber = "" // 계산기 버튼을 누를때마다 numberOutputLabel에 표시되는 숫자를 가지고 있을 변수
    var firstOperand = "" // 이전 계산값을 저장하는 변수
    var secondOperand = "" // 새롭게 입력된 값을 저장하는 변수
    var result = "" // 계산 결과 값을 저장할 변수
    var currentOperation: Operation = .unknown //  현재 계산기에 어떤 연산자가 입력되어 있는지 저장하는 변수
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tabNumberButton(_ sender: UIButton) {    // 0~9까지 숫자 버튼 액션 함수
        guard let numberValue = sender.titleLabel?.text else { return } // 버튼의 타이틀 값(숫자)로 numberValue 값 저장
        if self.displayNumber.count < 9 {   // 최대 9개의 숫자까지 입력 가능하게 조건문 설정
            self.displayNumber += numberValue
            self.numberOutputLabel.text = self.displayNumber
        }
    }
    @IBAction func tabClearButton(_ sender: UIButton) { // AC버튼 액션 함수
        self.displayNumber = ""
        self.firstOperand = ""
        self.secondOperand = ""
        self.result = ""
        self.currentOperation = .unknown
        self.numberOutputLabel.text = "0"
    }
    @IBAction func tabDotButton(_ sender: UIButton) {   // . 버튼 액션 함수
        if self.displayNumber.count < 8, !self.displayNumber.contains("."){
            self.displayNumber += self.displayNumber.isEmpty ? "0." : "."
            self.numberOutputLabel.text = self.displayNumber
        }
    }
    // 각 연산자 버튼 액션 함수
    @IBAction func tabDivideButton(_ sender: UIButton) {
        self.operation(.Divide)
    }
    @IBAction func tabMultiplyButton(_ sender: UIButton) {
        self.operation(.Multiply)
    }
    @IBAction func tabSubtractButton(_ sender: UIButton) {
        self.operation(.Subtract)
    }
    @IBAction func tabAddButton(_ sender: UIButton) {
        self.operation(.Add)
    }
    @IBAction func tapEqualButton(_ sender: UIButton) {
        self.operation(self.currentOperation)
    }
    func operation(_ operation: Operation) {    // 연산 시 이용되는 operation 함수
        if self.currentOperation != .unknown {  // 연산자가 입력되어 있을 때 실행되는 함수
            if !self.displayNumber.isEmpty { // displayNumber = "" 일 때, 즉 secondOperand를 입력 받았을 때
                self.secondOperand = self.displayNumber
                self.displayNumber = ""
                
                // 연산을 위해 double로 형변환
                guard let firstOperand = Double(self.firstOperand) else { return }
                guard let secondOperand = Double(self.secondOperand) else { return }
                
                // switch문을 이용해 입력된 연산자로 연산
                switch self.currentOperation {
                case .Add:
                    self.result = "\(firstOperand + secondOperand)"
                case .Subtract:
                    self.result = "\(firstOperand - secondOperand)"
                case .Divide:
                    self.result = "\(firstOperand / secondOperand)"
                case .Multiply:
                    self.result = "\(firstOperand * secondOperand)"
                default:
                    break
                }
                
                if let result = Double(self.result), result.truncatingRemainder(dividingBy: 1) == 0 {
                    self.result = "\(Int(result))" // 결과 값이 정수일 때 정수로 표현 (1로 나눴을 때 나머지가 없으면 됨)
                }
                self.firstOperand = self.result
                self.numberOutputLabel.text = self.result
            }
            self.currentOperation = operation
        }
        else {  // 처음 연산을 진행할 때, 즉 currentOperation = .unknown 일 때
            self.firstOperand = self.displayNumber
            self.currentOperation = operation
            self.displayNumber = "" // 연산자 다음 입력되는 수를 화면에 보여주기 위해 ""로 초기화
        }
    }
}

