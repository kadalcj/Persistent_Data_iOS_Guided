//
//  ViewController.swift
//  GD_Y_XXXX
//
//  Created by Sul on 2019/10/20.
//  Copyright © 2019 Sul. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    var realm: Realm!

    @IBOutlet weak var name_y_xxxx: UITextField!
    @IBOutlet weak var npm_y_xxxx: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        realm = try! Realm()
    }

    
    @IBAction func submitBtn(_ sender: Any) {
        let student = Student()
        
        student.name_y_xxxx = name_y_xxxx.text!
        student.npm_y_xxxx = npm_y_xxxx.text!
        
        try! self.realm.write {
            self.realm.add(student)
        }
        
        performSegue(withIdentifier: "tableVC", sender: Any.self)
        
        name_y_xxxx.text! = ""
        npm_y_xxxx.text! = ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

