//
//  HomeVC.swift
//  QRScannerForCompany
//
//  Created by Ali Dhanani on 26/09/2018.
//  Copyright © 2018 Ali Dhanani. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenus()
    }
    

    func sideMenus() {
        if revealViewController() != nil {
            menuBtn.target = revealViewController()
            menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 300
            revealViewController().rightViewRevealWidth = 160
            
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }

}
