Class msg.rechercherVoitureDisponibleRpse Extends msg.basic.reponse
{

Property voiture As data.Voiture;

Storage Default
{
<Data name="rechercherVoitureDisponibleRpseDefaultData">
<Subscript>"rechercherVoitureDisponibleRpse"</Subscript>
<Value name="1">
<Value>voiture</Value>
</Value>
</Data>
<DefaultData>rechercherVoitureDisponibleRpseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
