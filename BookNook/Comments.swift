//
//  Comments.swift
//  LoginPage
//
//  Created by Israa Kheder on 24/05/1444 AH.
//

import SwiftUI

struct Comments: View {
    var body: some View {
        VStack(alignment: .trailing){
            
            //profile image , user info , tweet
            HStack(alignment: .top, spacing: 12){
                VStack {
                    Image("noor")
                               .resizable()
                               .frame(width: 56, height: 56)
                               .aspectRatio(contentMode: .fit)
                               .clipShape(Circle())
//                    Circle()
//                        .frame(width: 56, height: 56)
//                        .foregroundColor(Color(.systemCyan))
//
                }
                
                //user info & tweet caption
                VStack(alignment: .leading, spacing: 4){
                    Text("Sara Ahmed")
                        .font(.subheadline)
                        .bold()
                        .fontDesign(.serif)
                    // review comment
                    Text("just finshed reading it, not bad but tbh I dont understand the hype, maybe its just not for me.")
                        .font(.subheadline)
                        .fontDesign(.serif)
                        .multilineTextAlignment(.leading)
                }
            }
            .padding()
            // action button like
            HStack(){
                Like()
//                Button{
//                    //action
//                } label: {
//                    Image(systemName: "heart")
//                        .font(.system(size: 17)).foregroundColor(Color("AC"))
//                        .multilineTextAlignment(.trailing)
//
//                }
            }
            .padding(.trailing, 27.0)
            Divider()
                .padding(.top, 3)
        }
    }
}

struct Comments_Previews: PreviewProvider {
    static var previews: some View {
        Comments()
    }
}
