//
//  Explore.swift
//  Book Nook
//
//  Created by Ghayah Almadi on 06/12/2022.
//

import SwiftUI
import FirebaseStorage
import Firebase
import Kingfisher

struct Explore: View {
    //for the searchbar
    @State var SearchText = ""
    
    //for the adView
    var numOfImges = 5
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    @State var CurrentImg = 0
    
    //arry of cards
    @State var arrayofCards = [
        CardInfo(title: "Mistborn", imageName: "Book"),
        CardInfo(title: "BookNook", imageName: "0")
    ]
    
    //dataBace call
    @StateObject private var portalModel = BookModel()
  //  @State var bookobject: Book
   // @EnvironmentObject var book: BookModel
    
    

    
    
    var body: some View {
        NavigationView{
            
            //background color
            ZStack{
                Color("BG")
                    .ignoresSafeArea()
                
                //title
                VStack(alignment: .leading){
                    Text("Explore")
                        .foregroundColor(Color("AC"))
                        .font(.system(size: 45))
                        .multilineTextAlignment(.leading)
                        .fontDesign(.serif)
                        .padding(.bottom)
                        .padding(.leading,20)
                    
                    //navgation and searchbar
                    HStack(alignment: .top){
                        
                        
                        //navgation
                        NavigationLink(destination: Submit() .navigationBarBackButtonHidden())  {
                            
                            Image("B+")
                                .resizable()
                                .frame(width: 60, height:45)
                                .padding(.trailing,-20)
                            
                            
                        }
                        
                        
                        
                        //searchBar
                        HStack{
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.white)
                            
                            TextField("Search", text: $SearchText)
                            
                        }
                        .font(.headline)
                        .padding()
                        .frame(width: 335, height: 45)
                        .background(
                            RoundedRectangle(cornerRadius: 50)
                                .fill(Color("GA"))
                        )
                    }
                    
                    
                    
                    //Ad View
                    
                    ScrollView(.vertical) {
                        VStack{
                            
                            GeometryReader { proxy in
                                TabView(selection: $CurrentImg  ){
                                    ForEach(0..<numOfImges) {num in
                                        Image("\(num)")
                                            .resizable()
                                            .scaledToFill()
                                            .tag(num)
                                        
                                    }
                                }
                                
                                .tabViewStyle(PageTabViewStyle())
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .padding()
                                .frame(width: proxy.size.width, height: 200)
                                
                                
                                
                                .onReceive(timer, perform: { _ in
                                    withAnimation{
                                        CurrentImg = CurrentImg < numOfImges ? CurrentImg + 1 : 0
                                    }
                                })
                            }
                        }
                        .frame(height: 205)
                        .padding(.top, -15)
                        .shadow(radius: 4, x: 0, y: 3)
                        
                        
                        
                        
                        
                        //Books scrollView
                        VStack(alignment: .leading){

                            
                            Text("Books For You")
                                .font(.title)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color("L"))
                                .fontWeight(.bold)
                            
                            
                            ScrollView(.horizontal) {
                                HStack(spacing: 20) {
                                    
                                    
                                    //to call specific data from firestore
                                    ForEach(portalModel.booksArray, id: \.id) { i in
                                        VStack {
                                            
               
                                            NavigationLink(destination: Home(book: i), label:{
                                                //kingFisher to pull the img from the link
                                                KFImage(URL(string: i.coverimg)).resizable()
                                                    .scaledToFill()
                                                    .frame(width: 101, height: 160)
                                            } )
                                           

                                            
                                            // i. is to call that specific data needed
                                            Text(i.title)
                                                .font(.system(size: 15))
                                                .fontWeight(.bold)
                                                .frame(width: 102)
                                                .multilineTextAlignment(.leading)
                                                .fontDesign(.serif)
                                                .foregroundColor(Color("L"))
                                            
                                            Text(i.author)
                                                .font(.system(size: 12))
                                                .fontWeight(.bold)
                                                .frame(width: 102)
                                                .multilineTextAlignment(.leading)
                                                .fontDesign(.serif)
                                                .foregroundColor(Color("L"))
                                           


                                        }
                                    }
                                }
                                
                                .frame(height: 200)
                            }
                            
                            .scrollIndicators(.hidden)
                            
                        }
                        
                        
                        VStack(alignment: .leading){
                            
                            Text("Arabic Books For You")
                                .font(.title)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color("L"))
                                .fontWeight(.bold)
                            
                            ScrollView(.horizontal) {
                                HStack(spacing: 20) {
                                    
                                    ForEach(portalModel.booksArray.filter { $0.language.contains("ar") }, id: \.id) { i in
                                        VStack {
                                            
                                            
                                            NavigationLink(destination: Home(book: i), label:{
                                            
                                                KFImage(URL(string: i.coverimg)).resizable()
                                                    .scaledToFill()
                                                    .frame(width: 101, height: 160)
                                            } )
                                            
                                            Text(i.title)
                                                .font(.system(size: 15))
                                                .fontWeight(.bold)
                                                .frame(width: 102)
                                                .multilineTextAlignment(.leading)
                                                .fontDesign(.serif)
                                                .foregroundColor(Color("L"))
                                            
                                            Text(i.author)
                                                .font(.system(size: 12))
                                                .fontWeight(.bold)
                                                .frame(width: 102)
                                                .multilineTextAlignment(.leading)
                                                .fontDesign(.serif)
                                                .foregroundColor(Color("L"))
                                        }
                                    }
                                    
                                }
                                .frame(height: 200)
                                
                            }
                            .scrollIndicators(.hidden)
                            
                        }
                        
                        VStack(alignment: .leading){
                            
                            Text("English Books For You")
                                .font(.title)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color("L"))
                                .fontWeight(.bold)
                            
                            ScrollView(.horizontal) {
                                HStack(spacing: 20) {
                                    
                                    ForEach(portalModel.booksArray.filter { $0.language.contains("eng") }, id: \.id) { i in
                                        VStack {
                                            
                                            NavigationLink(destination: Home(book: i), label:{
                                            
                                                KFImage(URL(string: i.coverimg)).resizable()
                                                    .scaledToFill()
                                                    .frame(width: 101, height: 160)
                                            } )
                                            
                                            Text(i.title)
                                                .font(.system(size: 15))
                                                .fontWeight(.bold)
                                                .frame(width: 102)
                                                .multilineTextAlignment(.leading)
                                                .fontDesign(.serif)
                                                .foregroundColor(Color("L"))
                                            
                                            Text(i.author)
                                                .font(.system(size: 12))
                                                .fontWeight(.bold)
                                                .frame(width: 102)
                                                .multilineTextAlignment(.leading)
                                                .fontDesign(.serif)
                                                .foregroundColor(Color("L"))
                                        }
                                    }
                                }
                                .frame(height: 200)
                            }
                            .scrollIndicators(.hidden)
                            
                        }
                        .padding(.bottom, 40)
                    }
                    .padding()
                }
            }
            
            .onAppear(perform: {
                portalModel.getDataFromDatabase()
            })
        }//End Navigation view
        .environmentObject(portalModel)

    }
    
}
struct Explore_Previews: PreviewProvider {
    static var previews: some View {
        Explore()
    }
}

