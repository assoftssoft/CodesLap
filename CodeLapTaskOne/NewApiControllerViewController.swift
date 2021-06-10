//
//  NewApiControllerViewController.swift
//  CodeLapTaskOne
//
//  Created by Ahmed Baloch on 10/06/2021.
//

import UIKit

class NewApiControllerViewController: UIViewController {

    var dataArray : [NewsData] = []
    
    @IBOutlet weak var newApiTableView: NewApiTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NetWorkCall.getCall(url: "https://api.first.org/data/v1/news") { (data) in
            print(data)
            for value in data {
                let dictionaryValue = value as! NSDictionary
                let newsValue = NewsData.init(id: dictionaryValue.value(forKey: "id") as? Int ?? 0, link: dictionaryValue.value(forKey: "link") as? String ?? "", published: dictionaryValue.value(forKey: "published") as? String ?? "", summary: dictionaryValue.value(forKey: "summary") as? String ?? "", title: dictionaryValue.value(forKey: "title") as? String ?? "")
                self.dataArray.append(newsValue)
                
            }
            
            self.newApiTableView.didupdatedData(data: self.dataArray)
           
        }
        // Do any additional setup after loading the view.
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
