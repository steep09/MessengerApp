//
//  groupCell.swift
//  messengerApp
//
//  Created by Stephenson Ang on 04/07/2019.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import UIKit

class groupCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var memberLbl: UILabel!
    
    func configureCell(title: String, description: String, memberCount: Int) {
        self.titleLbl.text = title
        self.descriptionLbl.text = description
        self.memberLbl.text = "\(memberCount) members."
    }

}
