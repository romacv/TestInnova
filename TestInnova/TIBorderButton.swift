//
//  TIBorderButton.swift
//  TestInnova
//
//  Created by ROMAN RESENCHUK on 20.05.16.
//  Copyright © 2016 ROMAN RESENCHUK. All rights reserved.
//

import UIKit

class TIBorderButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func applyBorders() {
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = CGRectGetHeight(self.frame) / 2
        self.alpha = 1
    }
    
    func removeBorders() {
        self.layer.borderColor = UIColor.clearColor().CGColor
        self.layer.borderWidth = 0
        self.layer.cornerRadius = 0
        self.alpha = 0.5
    }
}

