//
//  ContentView.swift
//  swift-furniture-shop
//
//  Created by Hakan Karaahmetoğlu  on 31.05.2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var selectedIndex : Int = 0
    private let categories = ["All","Chair","Sofa","Lamp","Kitchen","Table"]
    var body: some View {
        ZStack {
            Color("Bg").edgesIgnoringSafeArea(.all)
            ScrollView{
                VStack(alignment: .leading){
                    AppBarView()
                    TagLineView().padding()
                    SearchAndScanView()
                    ScrollView(.horizontal , showsIndicators: false){
                        HStack {
                            ForEach(categories.indices, id: \.self) {i in
                                CategoryView(isActive: i == selectedIndex, text: categories[i]).onTapGesture {
                                    selectedIndex = i
                                }
                            }
                        }.padding()
                    }
                    Text("Popular").font(.custom("RobotoConsensed-Bold", size: 24)).padding(.horizontal)
                    
                    ScrollView (.horizontal, showsIndicators: false){
                        HStack {
                            ForEach(0 ..< 4) { item in
                                ProductCardView(image: Image("chair_\(item + 1)"), size: 210)
                            }.padding(.trailing)
                        }.padding(.leading)
                    }
                    
                    Text("Best").font(.custom("RobotoConsensed-Bold", size: 24)).padding(.horizontal).padding(.top)
                    
                    ScrollView (.horizontal, showsIndicators: false){
                        HStack {
                            ForEach(0 ..< 4) { item in
                                ProductCardView(image: Image("chair_\(item + 1)"), size: 180)
                            }.padding(.trailing)
                        }.padding(.leading)
                    }
                  
                }
            }
           
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

struct AppBarView: View {
    var body: some View {
        HStack {
            Button(action: {}){
                Image("menu").padding(10).background(.white).cornerRadius(10)
            }
            Spacer()
            Button(action: {}){
                Image("profile").resizable().frame(width: 35, height: 35).cornerRadius(10)
            }
        }.padding(.horizontal)
    }
}

struct TagLineView: View {
    var body: some View {
        Text("Find the \nBest").font(.custom("RobotoCondensed-Regular", size: 28)).foregroundColor(Color("PrimaryColor")) +
        Text(" Furniture!").font(.custom("RobotoCondensed-Bold", size: 28)).foregroundColor(Color("PrimaryColor"))
    }
}

struct SearchAndScanView: View {
    @State private var furnitureSearch : String = ""
    var body: some View {
        HStack {
            HStack {
                Image("search").resizable().frame(width: 20,height: 20).padding(.trailing, 8)
                TextField("Search Furniture" , text: $furnitureSearch)
            }
            .padding().background(.white).cornerRadius(10).padding(.leading)
            Button(action: {}){
                Image("scan").resizable().frame(width: 30,height: 30).padding(10).background(Color("PrimaryColor")).cornerRadius(10).padding(.trailing)
            }
        }
    }
}

struct CategoryView: View {
    let isActive : Bool
    let text : String
    var body: some View {
        VStack (alignment : .leading, spacing: 0) {
            Text(text).font(.system(size:18)).fontWeight(.medium).foregroundColor(isActive ? Color("PrimaryColor") : .black.opacity(0.4))
            isActive ? Color("PrimaryColor").frame(width: 15, height: 2).clipShape(Capsule()) : nil
            
        }.padding(.trailing)
    }
}

struct ProductCardView: View {
    let image : Image
    let size : CGFloat
    var body: some View {
        VStack{
            image.resizable().frame(width: size, height: 200 * (size/210)).cornerRadius(20)
            Text("Luxury Swedian chair").font(.title3).fontWeight(.bold)
            HStack(spacing: 2){
                ForEach(0..<5){i in
                    Image("star")
                }
                Spacer()
                Text("$1299").font(.title3).fontWeight(.bold)
            }
        }.frame(width: size).padding().background(.white).cornerRadius(20)
    }
}
