//
//  Label.swift
//  Quizzler-iOS13
//
//  Created by Diogo Gabriel Izele on 14/12/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

class Label: UILabel {
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setText(_ text: String) {
        self.text = text
    }
}
