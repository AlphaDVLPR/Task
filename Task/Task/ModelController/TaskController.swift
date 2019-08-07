//
//  TaskController.swift
//  Task
//
//  Created by AlphaDVLPR on 8/7/19.
//  Copyright © 2019 AlphaDVLPR. All rights reserved.
//

import Foundation
import CoreData

//Create a class for Task Controller

class TaskController {
    
    //Next we are going to make a Singeton to allow to call this class into other classes
    
    static let shared = TaskController()
    
    //FETCH REQUEST
    
    var task: [Task] {
        
        //We are creating a fetch request to grab information from the "Vault" specifically in task
        
        let fetchRequest: NSFetchRequest <Task> = Task.fetchRequest()
        
        //Next we are doing a simplified do catch to try for the information
        
        return (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
        
    }
    
    //Next we are making some properties for the class
    
    var tasks: [Task] = []
    
    //Now lets make some dope CRUD
    
    //Create
    
    func add(taskWithName name: String, notes: String?, due: Date?) {
        
        if let notes = notes, let due = due {
            
            Task(name: name, notes: notes, due: due)
            
        } else {
            
            Task(name: name)
            
        }
        
        //SAVE
        
        saveToPersistence()
    }
    
    //Update
    
    func update(task: Task, name: String, notes: String?, due: Date?) {
        
        task.name = name
        task.notes = notes
        task.due = due
        
        //SAVE
        
        saveToPersistence()
    }
    
    //Delete
    
    func remove(task: Task) {
        
        CoreDataStack.context.delete(task)
        
        //SAVE
        
        saveToPersistence()
        
    }
    
    //PERSISTENCE STORE
    
    func saveToPersistence() {
        
        //Do catch statement to try for the saved data
        
        do {
            
            try CoreDataStack.context.save()
            
        } catch {
            
            print("There was an error saving the objects \(#function): \(error.localizedDescription)")
            
        }
    }
}
