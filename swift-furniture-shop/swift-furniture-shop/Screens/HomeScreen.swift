//
//  HomeScreen.swift
//  swift-furniture-shop
//
//  Created by Hakan Karaahmetoğlu  on 6.06.2023.
//

import SwiftUI

struct HomeScreen: View {
    @State private var selectedIndex : Int = 0
    private let categories = ["All","Chair","Sofa","Lamp","Kitchen","Table"]
    var body: some View {
        NavigationView {
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
                                    NavigationLink(destination: DetailScreen(), label: {
                                        ProductCardView(image: Image("chair_\(item + 1)"), size: 210)
                                    }).navigationBarHidden(true).foregroundColor(.black)
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
                
                // Custom Bottom NavBar
                
                HStack{
                    BottomNavBarItem(image: Image("home"), action: {})
                    BottomNavBarItem(image: Image("fav"), action: {})
                    BottomNavBarItem(image: Image("shop"), action: {})
                    BottomNavBarItem(image: Image("user"), action: {})
                }.padding().background(.white).clipShape(Capsule()).padding(.horizontal)
                    .shadow(color: .black.opacity(0.15), radius: 10, x: 2, y:6)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
