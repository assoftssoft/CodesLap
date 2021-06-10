//
//  NewApiTableView.swift
//  CodeLapTaskOne
//
//  Created by Ahmed Baloch on 10/06/2021.
//

import UIKit

class NewApiTableView: UITableView , UITableViewDelegate, UITableViewDataSource,updateTableView {
  
    
    
    
    var dataArray : [NewsData] = []
    override func awakeFromNib() {
        self.delegate = self
        self.dataSource = self
    }
    
    func didupdatedData (data : [NewsData]) {
        dataArray = data
        self.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewApiTableViewCell", for: indexPath) as! NewApiTableViewCell
        
        cell.setData(data: dataArray[indexPath.row], index: indexPath.row)
        cell.delegateUpdateTableView = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func didUpdateTableview() {
        self.reloadData()
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
