//
//  IntergerToRomanViewController.swift
//  CodeLapTaskOne
//
//  Created by Ahmed Baloch on 10/06/2021.
//

import UIKit



class IntergerToRomanViewController: UIViewController, dataFromAddDelegate, openViewOnController, YesButtonTap {
   
    
    @IBOutlet weak var romanTV: RomanTableView!
    
    var datacollect = [[String:Any]]()
    var param = [String : Any]()
    var newsdata : [NewsData] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.romanTV.openViewOnControllerDelegate = self
        
    }
    
    @IBAction func didSelectOnAddBtn(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: .main)
       let AddPopUpViewController = storyboard.instantiateViewController(withIdentifier: "AddPopUpViewController") as! AddPopUpViewController
        AddPopUpViewController.modalPresentationStyle = .overCurrentContext
        AddPopUpViewController.addDataDelegate = self
        self.present(AddPopUpViewController, animated: true, completion: nil)
        
    }
    
    func getdata(data: [[String : Any]]) {
        self.datacollect = data
        self.romanTV.didUpdateData(data: data)
    }
    
    func didOpenViewOnController(atindex: Int) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: .main)
        let DeletePopUpController = storyboard.instantiateViewController(withIdentifier: "DeletePopUpViewController") as! DeletePopUpViewController
        DeletePopUpController.modalPresentationStyle = .overCurrentContext
        DeletePopUpController.atIndex = atindex
        DeletePopUpController.tableview = self.romanTV
        DeletePopUpController.yesButtonDelegate = self
        self.present(DeletePopUpController, animated: true, completion: nil)
    }
   
    
 
    func didYesButtonTap() {
        self.romanTV.reloadData()
    }

}
