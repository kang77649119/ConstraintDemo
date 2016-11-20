//
//  ViewController.swift
//  ConstraintDemo
//
//  Created by 也许、 on 2016/11/20.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 默认文本框
    @IBOutlet weak var textField: UITextField!
    
    // 表情控制器
    lazy var emojiVC : EmojiVC = EmojiVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 初始化UI
        setupUI()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.textField.resignFirstResponder()
    }

}

extension ViewController {
    
    // 初始化UI
    func setupUI() {
    
        // 设置文本框的输入附件为表情控制器的view
        self.addChildViewController(emojiVC)
        self.textField.inputView = emojiVC.view
        
        self.textField.becomeFirstResponder()
        
    }
    
    
}

