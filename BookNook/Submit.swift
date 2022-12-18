//
//  Submit.swift
//  Book Nook
//
//  Created by Ghayah Almadi on 06/12/2022.
//

import SwiftUI
import Firebase


struct Submit: View {
    
    //text field
    @State var Title = ""
    @State var Author = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    init(Title: String = "", Author: String = "") {
        self.Title = Title
        self.Author = Author
        
        
        
        
    }

        var btnBack : some View { Button(action: {
            self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                Image("ic_back") // set image here
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    Text("Go back")
                    
                }
            }
        }
       var body: some View {
        NavigationView{
            
            ZStack{
                Color("BG")
                    .ignoresSafeArea()
                
                
                VStack(alignment: .leading){
                    
                    
                    HStack{
                        
                        //navgation
//                        NavigationLink(destination: Explore(book: <#Book#>).navigationBarBackButtonHidden()) {
//                            Image(systemName: "chevron.backward")
//                                .foregroundColor(Color("AC"))
//                                .font(.largeTitle)
//                                .padding(.top)
//                                .padding(.trailing, -10)
//                        }
                        
                        
                        
                        Text("Add Book")
                            .font(.system(size: 45))
                            .fontDesign(.serif)
                            .foregroundColor(Color("AC"))
                            .padding()
                    }
                    
                    
                    HStack(alignment: .center){
                        Text("Help us expand our library! Tell us a little about the book")
                            .font(.title)
                            .multilineTextAlignment(.leading)
                            .fontDesign(.serif)
                            .foregroundColor(Color("L"))
                            .padding(.vertical, 50.0)
                    }
                    
                    //textField
                    VStack(alignment: .leading){
                        
                        
                        Text("Book Title")
                            .foregroundColor(Color("L"))
                            .fontWeight(.bold)
                            .frame(width: 100 , height: 50)
                        
                        TextField("  Book", text: $Title)
                            .font(.headline)
                            .foregroundColor(Color("L"))
                            .frame(width: 360,height: 50)
                            .background(Color("GA"))
                            .mask(RoundedRectangle(cornerRadius: 90, style: .continuous))
                            .padding(.bottom)
                        
                        
                        Text("Author")
                            .foregroundColor(Color("L"))
                            .fontWeight(.bold)
                        
                        TextField("  Author", text :$Author)
                            .font(.headline)
                            .foregroundColor(Color("L"))
                            .frame(width: 360,height: 50)
                            .background(Color("GA"))
                            .mask(RoundedRectangle(cornerRadius: 90, style: .continuous))
                        
                        
                            .padding(.bottom)
                        
                        
                        //button
                        
                        VStack(alignment: .trailing ){
                            
                            
                            Button(action: {
                                print("")
                            }) {
                                HStack (alignment: .center){
                                    
                                    Text("Send!")
                                        .font(.system(size: 22))
                                }
                                .foregroundColor(Color("BG"))
                                .frame(width: 200,height: 45)
                                .background(Color("AC"))
                                .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
                                .shadow(radius: 4, x: 0, y: 2)
                                .padding(.leading, 75)
                                
                                
                            }
                        }
                    }
                    
                    
                    
                    
                    Spacer()
                }
            }
            
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: btnBack)
        }
    }
}

struct Submit_Previews: PreviewProvider {
    static var previews: some View {
        Submit()
    }
}
