//
//  ShoppingListsTableViewController.swift
//  Grozzery
//
//  Created by Leonard Muthoni on 05/06/2021.
//

import UIKit
import CoreData

class ShoppingListsTableViewController: UITableViewController {
    
    var managedObjectContext: NSManagedObjectContext!

    override func viewDidLoad() {
        super.viewDidLoad()

    initializeCoreDataStack()
    }

    // MARK: - Table view data source
    
    func initializeCoreDataStack() {
        
        guard let modeURL = Bundle.main.url(forResource: "MyGroceryDataModel",
                                            withExtension: "momd") else {
            fatalError("Unable to initialize ManagedObjectModel")
        }
        
        guard let managedObjecctModel = NSManagedObjectModel(contentsOf: modeURL)
        else {
            fatalError("Unable to initialize managedObjectModel")
        }
        
        let persistentStoreCoorditor = NSPersistentStoreCoordinator(managedObjectModel: managedObjecctModel)
        
        let fileManager = FileManager()
        
        guard let documentsUrl = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError("Unable to get documents URL")
        }
        
        let storeURL = documentsUrl.appendingPathComponent("Grocery.sqlite")
        
        print(storeURL)
        
        try! persistentStoreCoorditor.addPersistentStore(
            ofType: NSSQLiteStoreType,
            configurationName: nil,
            at: storeURL, options: nil
        )
        
        let type = NSManagedObjectContextConcurrencyType.mainQueueConcurrencyType
        self.managedObjectContext = NSManagedObjectContext(concurrencyType:type)
        self.managedObjectContext.persistentStoreCoordinator = persistentStoreCoorditor
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: <#T##CGRect#>(x: 0, y: 0, width: self.tableView.frame.size, height: 44))
        headerView.backgroundColor = UIColor.red
        return headerView
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
