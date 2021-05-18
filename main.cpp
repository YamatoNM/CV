#include <iostream>
#include <fstream>

using namespace std;
int k = 0;
    string d;
    int i = 0;
     bool more = 1;
struct Date
{ 
    string oras , nume , prenume,varsta, telefon;
}c[100];   

int main()
{
  
    fstream fout;

     fout.open("phone.txt", std::ios::out ); //deschiderea fisierului phone.txt, in cazul in care acest fisier nu va fi gasit, el se va creia automat

    
 
    while (more)
    {
        cout << "Itroduceti Orasul:";
        cin >> c[i].oras;
        cout << "Itroduceti Numele:";
        cin >> c[i].nume;
        cout << "Itroduceti Prenumele:";
        cin >> c[i].prenume;
        cout << "Itroduceti varsta:";
        cin >> c[i].varsta;
        cout << "Itroduceti numarul de Telefon:";
        cin >> c[i].telefon;
        cout << "Doriti sa mai adaugati persoane in cartea telefonica (1-DA, 0-NU)";
        cin >> more;
        i++;
    }
fout<<"----------------Agenda Telefonica----------------\n";
 fout<<" Orasul\t Nume\t Prenume\t Varsta\t Telefon\n ";
    for (int j = 0; j < i; j++)
    {
      fout << c[j].oras<<"\t"<< c[j].nume<<"\t"<<c[j].prenume<<"\t"<<c[j].varsta<<"\t"<<c[j].telefon<< endl;
    }
    fout.close();
    fout.open("phone.txt");


    cout << "Introduceti numele persoanei a carui date doriti sa aflati:";
    cin >> d;
      for (int j = 0; j < i; j++)
      {
        if (c[j].nume == d)
        {
        cout <<" "<< c[j].oras<<" "<<c[j].nume<<" "<<c[j].prenume<<" "<< c[j].varsta<<" "<<c[j].telefon<<"\n";
        k++;
        }
        
      }
    fout.close();
    
    fout.open("phone.txt", std::ios::out );
    fout<<"----------------Agenda Telefonica----------------\n";
           fout<<" Orasul\t Nume\t Prenume\t Varsta\t Telefon\n ";
    
      for (int j = 0; j < i; j++)
      {
        if (c[j].nume != d)
        {    fout << c[j].oras<<" "<<c[j].nume<<" "<<c[j].prenume<<" "<<c[j].varsta<<" "<<c[j].telefon<< endl;
        }           
      }
       if(k==0)
      {
        cout<<"In agenda telefonica nu a fost gasita persoana: "<<d;
      } 
      
      fout.close();
}
      
 
