//
//  ViewController.swift
//  tableview
//
//  Created by holdtime on 2018/1/18.
//  Copyright © 2018年 www.bthdtm.com 豪德天沐移动事业部. All rights reserved.
//

import UIKit

let kNumber:Int = 30
let kShowText = "Hello Man?\nAre u ok?\nMi band?"
let kCellIdentifier = "identifiercell"
let kCellLabelTag = 100
let kEstimatedRowHeight:CGFloat = 50

class ViewController: UIViewController {

    var tCellAnimationStates:[Bool] = Array<Bool>(repeating:false, count:kNumber)

    @IBOutlet weak var tTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tTableView.estimatedRowHeight = kEstimatedRowHeight
        tTableView.rowHeight = UITableViewAutomaticDimension
        // Do any additional setup after loading the view, typically from a nib.
    }
}
// MARK: tableView datasource delegate
extension ViewController:UITableViewDataSource,UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tCellAnimationStates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellIdentifier, for: indexPath)
        if let label:UILabel = cell.contentView.viewWithTag(kCellLabelTag) as? UILabel{
            label.text = kShowText
            label.numberOfLines = Int(truncating: tCellAnimationStates[indexPath.row] as NSNumber)
        }
        
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if let label:UILabel = cell.contentView.viewWithTag(kCellLabelTag) as? UILabel{
                tableView.beginUpdates()
                let status = tCellAnimationStates[indexPath.row]
                tCellAnimationStates[indexPath.row] = !status
                label.numberOfLines = Int(truncating: !status as NSNumber)
                tableView.endUpdates()
            }
        }
    }
    
    // MARK: tableview separatorline alignment

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tTableView.separatorInset = .zero
        tTableView.layoutMargins = .zero
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.separatorInset = .zero
        cell.layoutMargins = .zero
    }
}

