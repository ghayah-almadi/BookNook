//
//  Home.swift
//  LoginPage
//
//  Created by Israa Kheder on 19/05/1444 AH.
//

import SwiftUI
import FirebaseStorage
import Firebase
import Kingfisher



struct Home: View {
    
    var book : Book

    func buttonPressed(){
        print("Button Pressed")
    }
    

    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 0){
                HeaderView()
            }
        }
        
        .coordinateSpace(name: "SCROLL")
        .background(Color("BG"))
        .ignoresSafeArea(.container, edges: .vertical)
    }
    
    //HeaderView
    @ViewBuilder
    func HeaderView()->some View{
        GeometryReader{proxy in
            let minY = proxy.frame(in: .named("SCROLL")).minY
            let size = proxy.size
            let height = (size.height + minY)
            
            KFImage(URL(string: book.coverimg))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height:height, alignment: .top)
            
                .cornerRadius(-6)
                .offset(y: -minY)
            
            
        }
        .frame(height:330)
        //        background(Color("BG"))
        VStack(alignment: .leading ,spacing: 0.0){
            HStack(alignment: .firstTextBaseline){
                Button(action: {
                    buttonPressed()
                    
                }){
                    Image(systemName: "chevron.backward")
                        .padding(.leading, -61.0)
                        .font(.system(size: 30)).foregroundColor(Color("L"))
                }
                //                .padding(.trailing, 40)
                
                
                Text(book.title)
                    .foregroundColor(Color("L"))
                    .multilineTextAlignment(.center)
                    .padding(.top, 23.0)
                    .font(.system(size: 27, weight: .semibold))
                    .fontDesign(.serif)
            }
        }
        
        VStack(alignment: .center){
            Text(book.author)
                .font(.system(size: 18))
                .foregroundColor(Color("L"))
                .fontDesign(.serif)
            //                    .padding(.leading, 28.0)
        }
        
        RatingView(rating: 3)
        DropDowmMenu()
            .padding(.top, 24.0)
        
        VStack(alignment: .leading, spacing: 3.0){
            
            Text("About the book")
                .padding(.leading, 12.0)
                .foregroundColor(Color("L"))
                .font(.system(size: 16))
                .fontDesign(.serif)
                .fontWeight(.medium)
            Spacer()
            Text(book.description)
                .padding(.leading, 22.0)
                .foregroundColor(Color("L"))
                .font(.system(size: 15))
                .fontWeight(.medium)
                .fontDesign(.serif)
        }
        .padding(.top, 21.0)
        HStack(){
            Text("Community reviews ")
                .foregroundColor(Color("L"))
                .font(.system(size: 16))
                .padding(.leading, 13.0)
                .fontDesign(.serif)
                .fontWeight(.medium)
            Spacer()
            
            Button( action: {
                buttonPressed()
                
            }){
                Image(systemName: "square.and.pencil").padding(.trailing, 17.0)
                    .font(.system(size: 30)).foregroundColor(Color("AC"))
            }
        }
        .padding(.top, 8.0)
        Reviews()
    }
}


