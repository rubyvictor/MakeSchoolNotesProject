//
//  ViewController.swift
//  RealmDemo
//
//  Created by Chris Orcutt on 12/17/15.
//  Copyright © 2015 Make School. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

  //get the default Realm
  let realm = try! Realm()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //comment the below lines to see your data persist between app launches
    try! realm.write {
      realm.deleteAll()
    }
    
    let chris = Person();
    chris.age = 23
    chris.name = "Chris"
    print("Saving the chris variable")
    try! realm.write {
      realm.add(chris)
    }
    
    let jeremy = Person()
    jeremy.age = 21
    jeremy.name = "Jeremy"
    print("Saving the jeremy variable")
    try! realm.write {
      realm.add(jeremy)
    }
    
    let zack = Person()
    zack.age = 19
    zack.name = "Zack"
    print("Saving the zack variable")
    try! realm.write {
      realm.add(zack)
    }
    
    let people = realm.objects(Person)
    print("Printing all returned objects (chris, jeremy, and zack objects)")
    for person in people {
      print(person)
    }
    
    let justChris = realm.objects(Person).filter("name = 'Chris' AND age = 23")
    print("Printing all returned objects (chris object)")
    for people in justChris {
      print(people)
    }
    
    print("Modifying the chris object")
    try! realm.write {
      chris.age = 100
    }
    
    let modifiedPeople = realm.objects(Person)
    print("Printing all returned objects (modified chris, jeremy, and zack objects)")
    for person in modifiedPeople {
      print(person)
    }

    print("Deleting the zack object")
    try! realm.write{
      realm.delete(zack)
    }
    
    let remainingPeople = realm.objects(Person)
    print("Printing all remaining objects (modified chris and jeremy objects)")
    for person in remainingPeople {
      print(person)
    }
    
    
    
  }
}

