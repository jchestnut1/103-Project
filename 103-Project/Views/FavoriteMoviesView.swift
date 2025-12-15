//
//  FavoriteMoviesView.swift
//  103-Project
//
//  Created by Jay Chestnut on 12/10/25.
//

import SwiftUI

struct FavoriteMoviesView: View {
    
    @State private var newItem: String = ""
    @State private var movieList: Set<String> = [ "Avengers End Game", "Spider-Man No Way Home", "Avengers: Infinity War" ]
    @State var showAlert: Bool = false
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.gray.opacity(0.3)
                    .ignoresSafeArea()
                
                VStack{
                    HStack{
                        
                        Text("🍿 Movie List")
                            .font(.largeTitle)
                            .foregroundStyle(Color.black)
                            .bold()
                            .padding()
                    } //END HStack inside of VStack
                    
                    
                    List{ //** ForEach is used for Arrays, if you have Set you have convert to an Array.
                        ForEach(Array(movieList), id: \.self){ movie in
                                Text(movie)
                        }
                    }
                    .listStyle(.plain)
                    .padding(.horizontal, 20)
                    
                    HStack{
                        TextField("Add new Movie Title...", text: $newItem)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius:20)
                                .stroke(Color.gray, lineWidth: 1)
                                .opacity(0.5)
                            )
                            .padding()
                        
                        
                        Button(action: addMovie) {
                            //movieList.append(newItem) //use if you have an Array
                            Image(systemName: "plus.circle.fill")
                                .padding()
                                //.background(Color.blue)
                                .foregroundStyle(Color.blue)
                                .imageScale(.large)
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
                        //movieList = movieList.sorted()
                    }
                }
                
                label : {
                    Image(systemName: "arrow.up.arrow.down.circle")
                        .imageScale(.large)
                }
                .padding(.horizontal, 20)
            }
        }  //End: NavigationView
        
        .alert("Duplicate Movie", isPresented: $showAlert){
            Button("Ok", role: .cancel){}
        } message: {
            Text("This Movie Already Exist")
        }
    } //End: Body View
    
    
    func addMovie() {
        let trimmedMovie = newItem.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedMovie.isEmpty else { return }
        if movieList.contains(trimmedMovie){
            showAlert = true
        } else {
            movieList.insert(trimmedMovie)
        }
    } //END: Function addMovie
} // END: MovieListView


#Preview {
    FavoriteMoviesView()
}
