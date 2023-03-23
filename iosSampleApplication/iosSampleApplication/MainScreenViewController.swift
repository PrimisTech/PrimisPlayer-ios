//
//  MainScreenViewController.swift
//  iosSampleApplication
//
//  Created by Roei Rosental on 20/03/2023.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    @IBAction func logoClicked(_ sender: Any) {
        if let primisUrl = URL(string: "https://www.primis.tech") {
            UIApplication.shared.open(primisUrl)
        }
    }
}
