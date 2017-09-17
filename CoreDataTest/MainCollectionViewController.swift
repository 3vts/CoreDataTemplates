//
//  MainCollectionViewController.swift
//  CoreDataTest
//
//  Created by Alvaro Santiesteban on 9/17/17.
//  Copyright © 2017 3vts. All rights reserved.
//

import UIKit
import CoreData

private let reuseIdentifier = "Cell"

class MainCollectionViewController: CoreDataCollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let stack = delegate.stack
        
        //Create fetchrequest
        let fr = NSFetchRequest<NSFetchRequestResult>(entityName: "TestEntity")
        fr.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        
        //Create the FetchedResultsController
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fr, managedObjectContext: stack.context, sectionNameKeyPath: nil, cacheName: nil)
    }
    
    
    @IBAction func addNewTest(_ sender: UIBarButtonItem) {
        let image = UIImagePNGRepresentation(UIImage(named: "Image")!)! as NSData
        
        let test = TestEntity(title: "Title", subtitle: "Subtitle", image: image, context: (fetchedResultsController?.managedObjectContext)!)
        
        print("Just created a test\(test)")
    }


    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let test = fetchedResultsController!.object(at: indexPath) as! TestEntity
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TestCollectionViewCell
        cell.imageView.image = UIImage(data: test.image! as Data)
    
        return cell
    }

}
