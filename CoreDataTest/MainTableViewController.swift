//
//  MainTableViewController.swift
//  CoreDataTest
//
//  Created by Alvaro Santiesteban on 9/17/17.
//  Copyright © 2017 3vts. All rights reserved.
//

import UIKit
import CoreData

class MainTableViewController: CoreDataTableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Get the stack
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let stack = delegate.stack
        
        //Create a fetchrequest
        let fr = NSFetchRequest<NSFetchRequestResult>(entityName: "TestEntity")
        fr.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        
        
        //Create the FetchedResultsController
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fr, managedObjectContext: stack.context, sectionNameKeyPath: nil, cacheName: nil)
    }
    
    @IBAction func addNewTest(_ sender: UIBarButtonItem) {
        //Create a new entry anc CoreData takes care of the rest!
        let image = UIImagePNGRepresentation(UIImage(named: "Image")!)! as NSData
        
        let test = TestEntity(title: "Title", subtitle: "Subtitle", image: image, context: (fetchedResultsController?.managedObjectContext)!)
        
        print("Just created a test\(test)")
    }
    

    // MARK: - Table view data source

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let test = fetchedResultsController!.object(at: indexPath) as! TestEntity
        
        // Create the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Sync notebook -> cell
        cell.textLabel?.text = test.title
        cell.detailTextLabel?.text = test.subtitle
        cell.imageView?.image = UIImage(data: test.image! as Data)
        
        return cell
    }
    
    
    //To delete items from a table
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if let context = fetchedResultsController?.managedObjectContext, let test = fetchedResultsController?.object(at: indexPath) as? TestEntity, editingStyle == .delete {
            context.delete(test)
        }
    }
    
}
