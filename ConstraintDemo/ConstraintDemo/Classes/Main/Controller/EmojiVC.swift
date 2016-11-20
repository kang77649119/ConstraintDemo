//
//  EmojiVC.swift
//  ConstraintDemo
//
//  Created by 也许、 on 2016/11/20.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

class EmojiVC: UIViewController {
    
    // collectionView
    lazy var collectionView : UICollectionView = {
        
        let collectionView : UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        
        collectionView.backgroundColor = UIColor.yellow
    
        return collectionView
        
    }()
    
    // toolBar
    lazy var toolBar : UIToolbar = {
        
        let toolBar:UIToolbar = UIToolbar(frame: CGRect.zero)
        var items : [UIBarButtonItem] = []
        var index = 0
        for title in ["最近", "默认", "emoji", "浪小花"] {
        
            let item:UIBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(self.itemClick(sender:)))
            item.tag = index
            items.append(item)
            items.append(UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil
                , action: nil))
            index += 1
            
        }
        
        items.removeLast()
        toolBar.items = items
        
        return toolBar
    
    }()
    
    @objc func itemClick(sender:UIBarButtonItem) {
        print(sender.tag)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // 初始化UI
        setupUI()
    }

}

extension EmojiVC {

    // 初始化UI
    func setupUI(){
    
        // 添加控件
        self.view.addSubview(collectionView)
        self.view.addSubview(toolBar)
        
        // 布局控件
        // 1.取消控件的自动布局
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.toolBar.translatesAutoresizingMaskIntoConstraints = false
        
        // 2.设置约束
        // 有关联的view
        let refViews = [ "collectionView" : collectionView, "toolBar" : toolBar ] as [String : Any]
        var constraints : [NSLayoutConstraint] = []
        
        // 给collectionView添加水平方向约束
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[collectionView]-0-|", options: NSLayoutFormatOptions(rawValue : 0), metrics: nil, views: refViews)
        
        // 给toolBar添加水平方向约束
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[toolBar]-0-|", options: NSLayoutFormatOptions(rawValue : 0), metrics: nil, views: refViews)
        
        // 给collectionView和toolBar添加垂直方向约束
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[collectionView]-[toolBar(44)]-0-|", options: NSLayoutFormatOptions(rawValue : 0), metrics: nil, views: refViews)
        
        // 给view添加约束
        self.view.addConstraints(constraints)
        
    }
    
}
