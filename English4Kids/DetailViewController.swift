//
//  DetailViewController.swift
//  English4Kids
//
//  Created by Ngoc on 8/25/16.
//  Copyright © 2016 GDG. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var stringTitle: String!
    var dictData: NSDictionary!
    var arrayKeys: NSArray!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self

        createDataWithName(stringTitle)
        
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.title = stringTitle
        
        
    }
    
    func createDataWithName(title: String){
        
        var path: String = ""
        
        if(title == "Transportation"){
            path = NSBundle.mainBundle().pathForResource("TransportationsList", ofType: "plist")!
        }
        
        if(title == "Birthday"){
            path = NSBundle.mainBundle().pathForResource("BirthdayList", ofType: "plist")!
        }
        
        if(title == "Fruits"){
            path = NSBundle.mainBundle().pathForResource("FruitsList", ofType: "plist")!
        }
        
        if(title == "Home"){
            path = NSBundle.mainBundle().pathForResource("HomeList", ofType: "plist")!
        }
        
        if(title == "Book"){
            path = NSBundle.mainBundle().pathForResource("BookList", ofType: "plist")!
        }
        
        
        dictData = NSDictionary(contentsOfFile: path)!
        
        arrayKeys = dictData.allKeys
        
        func compareNames(s1:NSString, s2:NSString) -> Bool {
            return s1.capitalizedString < s2.capitalizedString
        }
        
        arrayKeys = arrayKeys.sortedArrayUsingComparator {
            (obj1, obj2) -> NSComparisonResult in
            
            let p1 = obj1 as! String
            let p2 = obj2 as! String
            let result = p1.compare(p2)
            return result
        }

        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return arrayKeys.count
    
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let key = arrayKeys[indexPath.row] as! String
        
        cell.textLabel?.text = key
        
        cell.imageView?.image = UIImage(named: "\(dictData[key]!)")
        
        return cell
        
    }

    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return 75
    
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        print("\(indexPath.row) - \(arrayKeys[indexPath.row])")
        
        let v3 = self.storyboard?.instantiateViewControllerWithIdentifier("V3") as! ItemView
        
        let key = arrayKeys[indexPath.row] as! String
        
        v3.path = dictData[key]! as! String
        
        self.navigationController?.pushViewController(v3, animated: true)
        
        v3.title = arrayKeys[indexPath.row] as? String
        
    }

}
