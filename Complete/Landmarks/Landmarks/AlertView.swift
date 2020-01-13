//
//  AlertView.swift
//  Landmarks
//
//  Created by Toni Tani on 13.1.2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct AlertView: View {
    
@State private var showingAlert = false
    
var body: some View {
Button(action: {
self.showingAlert = true
}) {
    Text("Show Alert")
        .font(.headline)
        .foregroundColor(Color.gray)
}
.alert(isPresented: $showingAlert) {
Alert(title: Text("Alert in SwiftUI"), message: Text("How was that"), primaryButton: .default(Text("Awesome")), secondaryButton: .destructive(Text("Cancel")))
    }
  }
}
struct AlertView_Previews: PreviewProvider {
static var previews: some View {
    AlertView()
  }
}
