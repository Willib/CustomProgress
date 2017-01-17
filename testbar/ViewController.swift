//
//  ViewController.swift
//  testbar
//
//  Created by wulei on 17/1/12.
//  Copyright © 2017年 wulei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer:Timer?
    var progress:Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(type: .system)
        button.setTitle("点我点我点我", for: .normal)
        button.frame = CGRect(x:0, y:0, width:Int(UIScreen.main.bounds.width.native * 0.8), height:30)
        button.center = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY - 50)
        button.addTarget(self, action: #selector(self.onClike), for: .touchUpInside)
        
        self.view.addSubview(button)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func onClike(){
        let progressView = CXEProgressView(frame: CGRect(x:0, y:0, width:Int(UIScreen.main.bounds.width.native * 0.8), height:22))
        progressView.center = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
        CXEUserInteractiveManager.shared.show(progressView)
        
        let cancelProgressButton = UIButton(type: .system)
        cancelProgressButton.frame = CGRect(x: 0, y: 0, width: Int(UIScreen.main.bounds.width.native * 0.8), height: 60)
        cancelProgressButton.center = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY + 80)
        let attributes:[String:Any] = [NSFontAttributeName: UIFont.systemFont(ofSize: 15)]
        cancelProgressButton.setAttributedTitle(NSAttributedString(string:"你再点我试试", attributes: attributes), for: .normal)
        cancelProgressButton.tintColor = UIColor.white
        cancelProgressButton.addTarget(self, action: #selector(self.onCancleProgress), for: .touchUpInside)
        CXEUserInteractiveManager.shared.show(cancelProgressButton)
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true){_ in 
            progressView.progress = self.progress
            self.progress += 0.1
        }
    }
    
    func onCancleProgress(){
        CXEUserInteractiveManager.shared.diss()
        self.timer?.invalidate()
    }
}


