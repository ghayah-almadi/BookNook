//
//  DropDowmMenu.swift
//  LoginPage
//
//  Created by Israa Kheder on 21/05/1444 AH.
//

import SwiftUI

struct DropDowmMenu: View {
    @State var value = ""
    var placeholder = "Want to Read"
    var dropDownList = ["Want to Read", "Reading", "Read"]
    var body: some View {
        
        Rectangle()
            .foregroundColor(Color("AC"))
            .frame(width: 139 , height: 38)
            .cornerRadius(10)
            .overlay {
                Menu {
                    ForEach(dropDownList, id:\.self){ item in
                        Button(item){
                            self.value = item
                        }
                    }
                } label: {
                    VStack(spacing: 4){
                        HStack{
                            Text(value.isEmpty ? placeholder : value)
                                .foregroundColor(value .isEmpty ? .white : .white)
                                .fontDesign(.serif)
                            
                            Image(systemName: "chevron.down")
                                .foregroundColor(Color("drop"))
                                .font(Font.system(size: 16, weight: .bold))
                        }
                        
                        .padding(.horizontal)
                        
                        //                     Rectangle()
                        //                         .fill(Color("AC"))
                        //                         .frame(height: 2)
                    }
                }
            }
    }
}

struct DropDowmMenu_Previews: PreviewProvider {
    static var previews: some View {
        DropDowmMenu()
    }
}
