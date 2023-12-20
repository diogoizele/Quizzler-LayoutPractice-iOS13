//
//  ProgressBar.swift
//  Quizzler-iOS13
//
//  Created by Diogo Gabriel Izele on 14/12/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

class ProgressBar: UIProgressView {
    
    init() {
        super.init(frame: .zero)
        setupStyle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupStyle()
    }
    
    private func setupStyle() {
        self.progress = 0
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
    }
    
    func setProgress(_ current: Int, _ total: Int) {
        
        let progress = Float(current) / Float(total)
        
        self.setProgress(progress, animated: true)
    }
}
