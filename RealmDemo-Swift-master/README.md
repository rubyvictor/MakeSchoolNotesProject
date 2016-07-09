
#Realm Demo Application

This application demonstrates how to save, retrieve, modify, and delete objects locally using the Realm framework.

When running the demo, all the interesting stuff is output to the console. The main app interface does nothing. 

Remember that Realm persists data across app launches. For the purpose of learning how to use Realm, the following lines have been added to the project:


      try! realm.write {
        realm.deleteAll()
      }


The above code deletes all objects in the default Realm when the app is launched. If you would like to  persist data between app launches, you must comment out the above code.

The Realm data model we are using is located in the `Person.swift` file. All of the Realm interactions are located in the `ViewController.swift` file. All other files are not used.
