//
//  MeVC.swift
//  messengerApp
//
//  Created by Stephenson Ang on 02/07/2019.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import UIKit
import Firebase

class MeVC: UIViewController {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        emailLbl.text = Auth.auth().currentUser!.email
    }

    @IBAction func signOutBtnWasPressed(_ sender: Any) {
    }
}
