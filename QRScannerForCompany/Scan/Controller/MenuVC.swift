//
//  MenuVC.swift
//  QRScannerForCompany
//
//  Created by Ali Dhanani on 26/09/2018.
//  Copyright © 2018 Ali Dhanani. All rights reserved.
//

import UIKit

struct cellData {
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
}

class MenuVC: UIViewController {
    
    
    var tableViewData = [cellData]()
    @IBOutlet weak var ProfileImage: UIImageView!
    @IBOutlet weak var BtnChangeStatus: UIButton!
    @IBOutlet weak var BtnImage: UIButton!
    @IBOutlet weak var StatusTable: UITableView!
    @IBOutlet weak var ExpandTable: UITableView!
     @IBOutlet weak var ScanImage: UIImageView!
    var menuStatus = ["Online", "Offline"]

    override func viewDidLoad() {
        super.viewDidLoad()
        StatusTable.isHidden = true
        tableViewData = [cellData(opened: false, title: "+Dashboard", sectionData: ["   +Network Marketplace", "   +Public Marketplace", "   +Listings", "   +Manage Accounts", "   +ProfileSettings", "   Notification Settings", "   Help & Support", "   Logout"])]
        WorkingWithImage()
        WorkingWithStatusButton()
        self.StatusTable.rowHeight = 20
        self.ExpandTable.rowHeight = 23
        // Do any additional setup after loading the view.
    }
    
    @IBAction func StatusBtnWork() {
        if StatusTable.isHidden == true {
            StatusTable.isHidden = false
        } else {
            StatusTable.isHidden = true
        }
    }
    
    func WorkingWithImage() {
        ScanImage.layer.cornerRadius = 10
        ScanImage.layer.borderWidth = 1
        ScanImage.layer.borderColor = UIColor.white.cgColor
        ScanImage.layer.masksToBounds = true
        ProfileImage.layer.cornerRadius = 40
        ProfileImage.layer.masksToBounds = true
    }
    
    func WorkingWithStatusButton() {
        BtnChangeStatus.layer.borderWidth = 0.5
        BtnImage.layer.borderWidth = 0.5
        BtnChangeStatus.layer.borderColor = UIColor.gray.cgColor
        BtnImage.layer.borderColor = UIColor.gray.cgColor
        
        
    }

}

extension MenuVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        if(tableView == ExpandTable) {
            return tableViewData.count
        }
        return  1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(tableView == ExpandTable) {
            if(tableViewData[section].opened == true) {
                return tableViewData[section].sectionData.count + 1
            } else {
                return 1
            }
        }
        if(tableView == StatusTable) {
            return menuStatus.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(tableView == ExpandTable) {
            var dataIndex = indexPath.row - 1
            if indexPath.row == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else { return UITableViewCell() }
                cell.textLabel?.text = tableViewData[indexPath.section].title
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else { return UITableViewCell() }
                cell.textLabel?.text = tableViewData[indexPath.section].sectionData[dataIndex]
                return cell
            }
        }
        if(tableView == StatusTable) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else { return UITableViewCell() }
            cell.textLabel?.text = menuStatus[indexPath.row]
            return cell
        }
        else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(tableView == ExpandTable) {
            if indexPath.row == 0 {
                if tableViewData[indexPath.section].opened == true {
                    tableViewData[indexPath.section].title = "+Dashboard"
                    tableViewData[indexPath.section].opened = false
                    let sections = IndexSet.init(integer: indexPath.section)
                    tableView.reloadSections(sections, with: .none)
                } else {
                    tableViewData[indexPath.section].opened = true
                    tableViewData[indexPath.section].title = "-Dashboard"
                    let sections = IndexSet.init(integer: indexPath.section)
                    tableView.reloadSections(sections, with: .none)
                }
            }
        }
        if(tableView == StatusTable) {
            BtnChangeStatus.setTitle(menuStatus[indexPath.row], for: .normal)
            StatusTable.isHidden = true
        }
    }
}
