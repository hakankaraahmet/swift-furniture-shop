//
//  ContentView.swift
//  swift-furniture-shop
//
//  Created by Hakan Karaahmetoğlu  on 31.05.2023.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
      Text("Furniture Shop")
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
