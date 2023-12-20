//
//  Button.swift
//  Quizzler-iOS13
//
//  Created by Diogo Gabriel Izele on 14/12/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

class Button: UIButton {
    
    static var buttonAnimationDuration = 0.3
    
    var reverse: Bool
    
    init() {

        self.reverse = false
        super.init(frame: .zero)
        setupStyle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        self.reverse = false
        super.init(coder: aDecoder)
        setupStyle()
    }
    
    private func setupStyle() {
        self.layer.cornerRadius = 16
        self.clipsToBounds = true
        self.backgroundColor = self.getBackgroundColor()
        self.setTitleColor(self.getTextColor(), for: .normal)
    }
    
    func setReverse(_ value: Bool) {
        self.reverse = value
        self.backgroundColor = self.getBackgroundColor()
        self.setTitleColor(self.getTextColor(), for: .normal)
    }
    
    func onCheckUserAnswer(_ right: Bool) {
        if (right) {
            self.onPressedChangeColor(color: UIColor.systemGreen, UIColor.black)
        } else {
            self.onPressedChangeColor(color: UIColor.systemRed)
        }
    }
    
    private func onPressedChangeColor(color: UIColor, _ textColor: UIColor? = nil) {
        
        UIView.animate(withDuration: 0.1) {
            self.backgroundColor = color
        }
        
        if (textColor != nil) {
            self.setTitleColor(textColor, for: .normal)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + Button.buttonAnimationDuration) {
            
            UIView.animate(withDuration: 0.3) {
                self.backgroundColor = self.getBackgroundColor()
                
                if (textColor != nil) {
                    self.setTitleColor(self.getTextColor(), for: .normal)
                }
            }
        }
        
    }
    
    private func getBackgroundColor() -> UIColor {
        if self.reverse {
            return UIColor.systemYellow
        } else {
            return UIColor.systemPurple
        }
    }
    
    private func getTextColor() -> UIColor {
        if self.reverse {
            return UIColor.black
        } else {
            return UIColor.white
        }
    }
}
