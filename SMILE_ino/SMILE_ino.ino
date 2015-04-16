
int amarelo1=2;
int amarelo2=3;

int verde1=4;
int verde2=5;

int azul1=6;
int azul2=7;

int vrecebido = -2;


void setup() {                
  
  pinMode(amarelo1, OUTPUT);
  pinMode(amarelo2, OUTPUT);   
  pinMode(verde1, OUTPUT);   
  pinMode(verde2, OUTPUT);   
  pinMode(azul1, OUTPUT);   
  pinMode(azul2, OUTPUT); 
  Serial.begin(9600);  
  
}


void loop() { 


  if (Serial.available() > 0) {
        vrecebido = Serial.read();
    }

    if (vrecebido > 0) {
        if (vrecebido == '1'){
            digitalWrite(amarelo1, HIGH);
            digitalWrite(amarelo2, HIGH);
        }  
        if(vrecebido=='2'){
          digitalWrite(verde1, HIGH);
          digitalWrite(verde2, HIGH); 
        }
        
        if(vrecebido=='3'){
          digitalWrite(azul1, HIGH);
          digitalWrite(azul2, HIGH);
        }
        else if (vrecebido == '0'){
           digitalWrite(amarelo1, LOW);
           digitalWrite(amarelo2, LOW);
		   digitalWrite(verde1, LOW);
           digitalWrite(verde2, LOW); 
           digitalWrite(azul1, LOW);
           digitalWrite(azul2, LOW);   
        }
        vrecebido = -2;
    }
  
  
  
}

