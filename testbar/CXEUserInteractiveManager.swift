//
//  CXEUserInteractiveManager.swift
//  testbar
//
//  Created by wulei on 17/1/17.
//  Copyright © 2017年 wulei. All rights reserved.
//

import Foundation
import UIKit

class CXEUserInteractiveManager: NSObject {
    
    private var _boardWindow : UIWindow?
    
    static let shared : CXEUserInteractiveManager = {
        let instance = CXEUserInteractiveManager.init()
        return instance
    }()
    
    //    MARK:load界面
    var boardWindow : UIWindow {
        if(self._boardWindow == nil) {
            
            let window : UIWindow = UIWindow(frame: UIScreen.main.bounds)
            window.windowLevel = UIWindowLevelStatusBar
            window.backgroundColor = UIColor.gray.withAlphaComponent(0.7)
            window.isUserInteractionEnabled = true
            window.makeKeyAndVisible()
            

            self._boardWindow = window
        }
        return self._boardWindow!
    }
    
    public func diss() {
        self.boardWindow.isHidden = true
        self.boardWindow.removeFromSuperview()
    }
    
    public func show(_ view : UIView) {
        self.boardWindow.addSubview(view)
        self.boardWindow.isHidden = false
    }
    
}

