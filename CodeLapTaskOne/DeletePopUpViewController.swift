//
//  DeletePopUpViewController.swift
//  CodeLapTaskOne
//
//  Created by Ahmed Baloch on 10/06/2021.
//

import UIKit
protocol YesButtonTap {
    func didYesButtonTap()
}
class DeletePopUpViewController: UIViewController {

    var dataCollection : [[String : Any]]?
    var tableview = RomanTableView()
    var atIndex : Int?
    var yesButtonDelegate : YesButtonTap?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func didTaponDelete(_ sender: Any) {
        if let index = atIndex {
            tableview.dataArray.remove(at: index)
                self.yesButtonDelegate?.didYesButtonTap()
                self.dismiss(animated: true, completion: nil)
        }
    }
}
