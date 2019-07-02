//
//  ShadowView.swift
//  messengerApp
//
//  Created by Stephenson Ang on 02/07/2019.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import UIKit

class ShadowView: UIView {
    
    override func awakeFromNib() {
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 5
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        super.awakeFromNib()
    }
    
}
