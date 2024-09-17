//
//  ListViewModel.swift
//  TodoList1
//
//  Created by Ujjwal Arora on 22/08/24.
//

import Foundation
class ListViewModel : ObservableObject {
    let itemKey = "ItemKey"
    @Published var items : [ItemModel] = [] {
        didSet{
            saveItems()
        }
    }
    init(){
        getItems()
    }
    func getItems() {
       guard
            let data = UserDefaults.standard.data(forKey: itemKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        self.items = savedItems
    }
    func delete(offset : IndexSet){
        items.remove(atOffsets: offset)
        
    }
    func moveRow(from : IndexSet , to : Int ) {
        items.move(fromOffsets: from, toOffset: to)
    }
    func addItem(title : String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    func updateItem(item : ItemModel){
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] = item.updateCompletion()
        }
    }
    func saveItems(){
        if let data = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(data, forKey: itemKey)
        }
    }
}
