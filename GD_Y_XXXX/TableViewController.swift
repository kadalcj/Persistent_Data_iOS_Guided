//
//  TableViewController.swift
//  GD_Y_XXXX
//
//  Created by Sul on 2019/10/20.
//  Copyright © 2019 Sul. All rights reserved.
//

import Foundation
import RealmSwift

class TableViewController: UITableViewController {
    var realm: Realm!
    
    var studentsData: Student!
    var studentsDataList: Results<Student> {
        get {
            return try! Realm().objects(Student.self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        realm = try! Realm()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentsDataList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        
        let data = studentsDataList[indexPath.row]
        
        cell.textLabel!.text = data.name_y_xxxx
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let data = studentsDataList[indexPath.row]
            
            try! self.realm.write ({
                self.realm.delete(data)
            })
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
