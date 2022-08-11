convert j02.png -duplicate 50 -distort SRT '916,401 %[fx:1+0.007*t*t] 0 %[fx:916-(116/50)*t],%[fx:401+(199/50)*t]' t.png
