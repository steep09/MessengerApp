//
//  GroupFeedVC.swift
//  messengerApp
//
//  Created by Stephenson Ang on 04/07/2019.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import UIKit

class GroupFeedVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var groupTitleLbl: UILabel!
    @IBOutlet weak var membersLbl: UILabel!
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var messageTextField: InsetTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        messageTextField.bindToKeyboard()
        sendBtn.bindToKeyboard()
    }
    
    @IBAction func sendBtnWasPressed(_ sender: Any) {
        
    }
    
    @IBAction func backButtonWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
