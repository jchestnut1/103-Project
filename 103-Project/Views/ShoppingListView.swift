//
//  ShoppingListView.swift
//  103-Project
//
//  Created by Jay Chestnut on 12/8/25.
//

import SwiftUI

struct ShoppingListView: View {
    
    @State private var shoppingList: [String] = ["Eggs", "Bread", "Milk"]
    @State private var newItem: String = ""
    
    var body: some View {
       
        NavigationView{
            ZStack{
                Color.gray.opacity(0.3)
                    .ignoresSafeArea()
                
                VStack{
                    Text("Grocery List")
                        .font(.largeTitle)
                        .foregroundStyle(Color.green)
                        .bold()
                        .padding()
                    
                    List{
                        ForEach(shoppingList, id: \.self){ item in
                                Text(item)
                        }
                    }//End List
                    
                    HStack{
                        TextField("Add new Grocery item...", text: $newItem)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius:20)
                                .stroke(Color.gray, lineWidth: 1)
                                .opacity(0.5)
                            )
                            .padding()
                        
                        
                        Button(action: {
                            shoppingList.append(newItem)
                            newItem = ""
                        }){
                            Image(systemName: "arrowshape.up.fill")
                                .padding()
                                .background(Color.blue)
                                .foregroundStyle(Color.white)
                                .cornerRadius(30)
                        }
                    } //End: HStack
                    .padding()
                    
                    
                    
                    
                }
            } //End: ZStack
            .navigationBarTitle("My Shopping App", displayMode: .inline)
            
            .toolbar {
                Menu{
                    Button("Sort A -> Z"){
                        shoppingList = shoppingList.sorted()
                    }
                    
                    Button("Reverse Order"){
                        shoppingList = shoppingList.reversed()
                    }
                }
                
                label : {
                    Image(systemName: "arrow.up.arrow.down.circle")
                        .imageScale(.large)
                }
                .padding(.horizontal, 20)
            }
        }  //End: NavigationView
    } //End: Body View
} // END: ShoppingListView

#Preview {
    ShoppingListView()
}
