//
//  CreateGroupsVC.swift
//  messengerApp
//
//  Created by Stephenson Ang on 03/07/2019.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import UIKit

class CreateGroupsVC: UIViewController {

    @IBOutlet weak var titleTxtField: UITextField!
    @IBOutlet weak var descriptionTxtField: UITextField!
    @IBOutlet weak var emailSearchTxtField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var groupMemberLbl: UILabel!
    
    var emailArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        emailSearchTxtField.delegate = self as? UITextFieldDelegate
        emailSearchTxtField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange() {
        if emailSearchTxtField.text == "" {
            emailArray = []
            tableView.reloadData()
        } else {
            DataService.instance.getEmail(forSearchQuery: emailSearchTxtField.text!) { (returnedEmailArray) in
                self.emailArray = returnedEmailArray
                self.tableView.reloadData()
            }
        }
    }

    @IBAction func doneBtnWasPressed(_ sender: Any) {
    }
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension CreateGroupsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(77)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as? userCell else { return UITableViewCell() }
        let profileImg = UIImage(named: "defaultProfileImage")
        cell.configureCell(profileImage: profileImg!, email: emailArray[indexPath.row], isSelected: true)
        return cell
    }
    
    
}
extension CreateGroupsVC: UITextViewDelegate {
    
}
