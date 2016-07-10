//
//  ViewController.swift
//  Times Table
//
//  Created by Sam on 5/11/16.
//  Copyright © 2016 Sam. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet var slider_obj: UISlider!
    var current_selection:Int = 0
    var num_of_items:Int = 50
    @IBOutlet var table_view: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return num_of_items
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tables") as UITableViewCell!
        
        if current_selection > 0 {
            let value:Int = current_selection * (indexPath.row + 1)
            
            cell.textLabel!.text = "\(current_selection) X \(indexPath.row + 1) = \(value)"
        }
        
        return cell
    }
    
    
    @IBAction func getSliderValue(sender: AnyObject) {
        var value:Double = Double(slider_obj.value)
        
        value *= 10
        current_selection = Int(value)
        
        print("Selected value is \(value); Int is \(current_selection)")
        
        table_view.reloadData()
    }


}

