//
//  CameraView.swift
//  SugaryAI
//
//  Created by Shatha Almukhaild on 06/09/1446 AH.
//



import SwiftUI

struct CameraView: View {
    @Binding var image: CGImage?
    @State var isFlashOn: Bool = false
    var body: some View {
                ZStack {
                    
                    if let image = image {
                        Image(image, scale: 1, label: Text("Camera feed"))
                            .resizable()
                            .scaledToFill() // Ensures the image fills any IOS screen
                            .frame(width: getScreenBounds().width, height: getScreenBounds().height)
                            .clipped() // Prevents overflow
                        
                        
                        // Color.black.ignoresSafeArea()
                        
                        VStack{
                            
                            Spacer()
                            HStack(spacing: 250){
                                
                                Button(action:{
                                    isFlashOn.toggle()
                                }){
                                    if !isFlashOn{
                                        Image(systemName: "bolt.slash").resizable().frame(width: 30, height: 30).foregroundStyle(Color.white)
                                    } else{
                                        Image(systemName: "bolt.fill").resizable().frame(width: 20, height: 30).foregroundStyle(Color.white)
                                    }
                                    
                                    
                                }
                                Button(action:{}){
                                    
                                    ZStack{
                                        Circle().fill(Color(hex:0x7B7B7B)).opacity(0.41).frame(width: 38, height: 38)
                                        Image(systemName: "xmark").resizable().frame(width: 16,height: 16).foregroundStyle(Color.white)
                                    }//End of ZStack
                                }
                            }// End of HStack
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            HStack(spacing:250){
                                Button(action:{}){
                                    Image(systemName: "info.circle.fill").resizable().frame(width: 35, height: 35).foregroundStyle(Color.white)
                                }
                                
                                
                                Button(action:{}){
                                    
                                    Image(systemName: "photo.on.rectangle.angled").resizable().frame(width: 40, height: 35).foregroundStyle(Color.white)
                                }
                                
                            }
                            
                            HStack{
                                Button(action:{}){
                                    ZStack{
                                        
                                        Circle()
                                            .fill(Color(hex:0xD9D9D9))
                                            .frame(width: 80, height: 80)
                                        Circle()
                                            .fill(Color(hex:0x838383))
                                            .frame(width: 66, height: 66)
                                        
                                    }
                                    
                                    
                                }
                            }
                            Spacer()
                            
                        }//End of VStack
                    }
                  else {
                       Color.black.ignoresSafeArea() // Black background when no image
                       VStack {
                           Image(systemName: "xmark.circle.fill")
                               .resizable()
                               .frame(width: 50, height: 50)
                               .foregroundColor(.red)
                           Text("No Camera Feed")
                               .foregroundColor(.white)
                               .bold()
                       }
                   }
               }// End of ZStack
               .ignoresSafeArea()
          }// End of Body
    }// End of Struct


#Preview {
    CameraView(image: .constant(nil))
}

// Extension to make the UI Adaptive to All Screen Sizes
extension View{
   func getScreenBounds() -> CGRect{
   return UIScreen.main.bounds
   }
}

// Extention to use hex for colors
extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
