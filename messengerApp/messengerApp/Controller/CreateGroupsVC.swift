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
    var chosenEmailArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        emailSearchTxtField.delegate = self as? UITextFieldDelegate
        emailSearchTxtField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        doneBtn.isHidden = true
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
        
        if chosenEmailArray.contains(emailArray[indexPath.row]) {
            cell.configureCell(profileImage: profileImg!, email: emailArray[indexPath.row], isSelected: true)
        } else {
            cell.configureCell(profileImage: profileImg!, email: emailArray[indexPath.row], isSelected: false)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? userCell else { return }
        if !chosenEmailArray.contains(cell.emailLbl.text!) {
            chosenEmailArray.append(cell.emailLbl.text!)
            groupMemberLbl.text = chosenEmailArray.joined(separator: ", ")
            doneBtn.isHidden = false
        } else {
            chosenEmailArray = chosenEmailArray.filter({ $0 != cell.emailLbl.text! })
            if chosenEmailArray.count >= 1 {
                groupMemberLbl.text = chosenEmailArray.joined(separator: ", ")
            } else {
                groupMemberLbl.text = "add people to your group"
                doneBtn.isHidden = true
            }
        }
    }
    
}
extension CreateGroupsVC: UITextViewDelegate {
    
}
