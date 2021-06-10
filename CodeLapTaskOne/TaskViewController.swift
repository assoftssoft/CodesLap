//
//  TaskViewController.swift
//  CodeLapTaskOne
//
//  Created by Ahmed Baloch on 10/06/2021.
//

import UIKit

class TaskViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didSelectOnIntergerToRoman(_ sender: Any) {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: .main)
        let IntToRomanViewController = storyboard.instantiateViewController(withIdentifier: "IntergerToRomanViewController") as! IntergerToRomanViewController
        self.navigationController?.pushViewController(IntToRomanViewController, animated: true)
        
    }
    
    @IBAction func didSelectOnNewApi(_ sender: Any) {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: .main)
        let newApiControllerViewController = storyboard.instantiateViewController(withIdentifier: "NewApiControllerViewController") as! NewApiControllerViewController
        self.navigationController?.pushViewController(newApiControllerViewController, animated: true)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
