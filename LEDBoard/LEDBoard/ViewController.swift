//
//  ViewController.swift
//  LEDBoard
//
//  Created by 이윤석 on 2022/05/14.
//

import UIKit

class ViewController: UIViewController, LEDBoardSettingDelegate { // LEDBoardSettingDelegate protocol을 채택한 클래스

    @IBOutlet weak var contentsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contentsLabel.textColor = .yellow
    }
    // 세그웨이로 화면전환 구현했기 때문에 prepare 메소드 구현
    // SettingViewController에서 전달한 데이터를 LED화면에서 받을 준비를 하는 함수
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settingViewController = segue.destination as? SettingViewController {
            settingViewController.delegate = self
            settingViewController.ledText = self.contentsLabel.text
            settingViewController.textColor = self.contentsLabel.textColor
            settingViewController.backgroundColor = self.view.backgroundColor ?? .black
        }
    }
    // LEDBoardSettingDelegate protocol의 요구사항을 만족시키기 위한 changedSetting 함수
    func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor) {
        if let text = text {
            self.contentsLabel.text = text
        }
        self.contentsLabel.textColor = textColor
        self.view.backgroundColor = backgroundColor
    }

}

