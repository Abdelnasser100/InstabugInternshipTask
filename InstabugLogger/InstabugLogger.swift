//
//  InstabugLogger.swift
//  InstabugLogger
//
//  Created by Yosef Hamza on 19/04/2021.
//

import Foundation
import  CoreData

public class InstabugLogger {
    
    public static var shared = InstabugLogger()
    let identifier: String  = "com.Instabug.InstabugInternshipTask11"       //Your framework bundle ID
    let model: String = "TestModel"   //Model name
    
    lazy var persistentContainer: NSPersistentContainer = {
            
            let messageKitBundle = Bundle(identifier: self.identifier)
            let modelURL = messageKitBundle!.url(forResource: self.model, withExtension: "momd")!
        let managedObjectModel =  NSManagedObjectModel(contentsOf: modelURL)
            
            let container = NSPersistentContainer(name: self.model, managedObjectModel: managedObjectModel!)
            container.loadPersistentStores { (storeDescription, error) in
                
                if let err = error{
                    fatalError("❌ Loading of store failed:\(err)")
                }
            }
            
            return container
        }()

    
    
    
    // MARK: Logging
    #warning("Implement the following")
    public func log(_ level: Int16, message: String) {
        
           let context = persistentContainer.viewContext
                let contact = NSEntityDescription.insertNewObject(forEntityName: "Logging", into: context) as! Logging
        let fetchRequest = NSFetchRequest<Logging>(entityName: "Logging")
        
        
            contact.level = level
            contact.message = message
        
        if message.count > 1000{
        do{
            let persons = try context.fetch(fetchRequest)
            for (index,person) in persons.enumerated() {
                context.delete(person)
                
                try context.save()
            }
        }catch{
            print(error)
        }
            
        }else {
                do {
                    try context.save()
                    print("✅ Person saved succesfuly")
                    
                } catch let error {
                    print("❌ Failed to create Person: \(error.localizedDescription)")
                }
        }
    }

    // MARK: Fetch logs
    #warning("Implement the following")
    
    
    public func fetchAllLogs() -> Any {
        
        let context = persistentContainer.viewContext
               
        let fetchRequest = NSFetchRequest<Logging>(entityName: "Logging")
               
         do{
                   
            let persons = try context.fetch(fetchRequest)
                   
            for (index,person) in persons.enumerated() {
                print("Person \(index): \(person.level) \(person.message ?? "N/A")")
                    return person.message!
                   }
                   
            }catch let fetchErr {
                print("❌ Failed to fetch Person:",fetchErr)
            }
        fatalError("Not implemented")

    }
    
    #warning("Implement the following")
    
    public func fetchAllLogs(completionHandler: (Any)->Void) {
        
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Logging>(entityName: "Logging")
               
         do{
                   
            let persons = try context.fetch(fetchRequest)
                   
            for (index,person) in persons.enumerated() {
                completionHandler("Person \(index): \(person.level) \(person.message ?? "N/A")")
            }
                   
            }catch let fetchErr {
                print("❌ Failed to fetch Person:",fetchErr)
            }
    }
}
