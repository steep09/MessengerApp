//
//  userCell.swift
//  messengerApp
//
//  Created by Stephenson Ang on 03/07/2019.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import UIKit

class userCell: UITableViewCell {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var checkImg: UIImageView!
    
    func configureCell(profileImage image: UIImage, email: String, isSelected: Bool) {
        self.profileImg.image = image
        self.emailLbl.text = email
        if isSelected {
            self.checkImg.isHidden = false
        } else {
            self.checkImg.isHidden = true
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
