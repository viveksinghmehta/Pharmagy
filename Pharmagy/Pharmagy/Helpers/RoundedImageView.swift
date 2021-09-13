//
//  RoundedImageView.swift
//  Pharmagy
//
//  Created by Vivek Singh Mehta on 13/09/21.
//

import UIKit
import Foundation


class RoundedImageView: UIImageView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = self.bounds.size.height * 0.5
    }
    
}
