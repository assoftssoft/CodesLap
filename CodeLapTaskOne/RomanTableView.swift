//
//  RomanTableView.swift
//  CodeLapTaskOne
//
//  Created by Ahmed Baloch on 10/06/2021.
//

import UIKit

protocol openViewOnController {
    func didOpenViewOnController(atindex : Int)
}

class RomanTableView: UITableView ,UITableViewDataSource , UITableViewDelegate, openViewDelegate{
   
    var dataArray = [[String : Any]]()
    var openViewOnControllerDelegate : openViewOnController?
    override func awakeFromNib() {
        self.delegate = self
        self.dataSource = self
    }
    
    func didUpdateData(data : [[String:Any]]) {
        self.dataArray.removeAll()
        self.dataArray = data
        self.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RomanTableViewCell", for: indexPath) as! RomanTableViewCell
        cell.setData(data: dataArray[indexPath.row], index: indexPath.row)
        
        cell.openDelegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    func didOpenViewController(atindex: Int) {
        self.openViewOnControllerDelegate?.didOpenViewOnController(atindex: atindex)
    }
   
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    

}
