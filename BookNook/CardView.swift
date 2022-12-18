//
//  CardView.swift
//  Book Nook
//
//  Created by Ghayah Almadi on 16/12/2022.
//

import SwiftUI
import Firebase
import Combine

struct CardView: View {
    
    
    @State private var isliked = false


    @State var card : CardInfo =  CardInfo(title: "BookNook", imageName: "Book" )
    var body: some View {
        
       
                      
                       
        VStack(alignment: .leading)
        {
            RoundedRectangle (cornerRadius: 0)
                .fill(.clear)
            
                .frame(width: 101, height: 160)
                .overlay{
                    VStack(alignment: .leading) {
                        
                        Image(card.imageName)
                            .resizable()
                            .frame(width: 101, height: 148)
                        
                       
                            Text(card.title)
                                .font(.system(size: 15))
                                .frame(width: 102)
                                .multilineTextAlignment(.leading)
                                .fontDesign(.serif)
                                .foregroundColor(Color("L"))

                          

                    }
                   
                }
        }
    }
}





struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
