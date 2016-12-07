//
//  ViewController.swift
//  Core Data 3
//
//  Created by Amreth on 12/7/16.
//  Copyright © 2016 Apple Inc. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let student:Student = Student(context:DatabaseController.getContext())
        student.firstname = "Amrethvicheyo"
        student.lastname = "Tith"
        let course:Course = Course(context: DatabaseController.getContext())
        course.courseName = "iOS"
        student.addToCourse(course)
        course.addToStudent(student)
        
        DatabaseController.saveContext()
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        
        let result = try? DatabaseController.getContext().fetch(request)
        
        for stu in result as![Student]{
            print(stu.firstname!)
            print(stu.lastname!)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

