Class msg.rechercherVoitureDisponibleDmde Extends (Ens.Request, %JSON.Adaptor)
{

Property categorie As %String;

Property dateDebutReservation As %TimeStamp;

Property dateFinReservation As %TimeStamp;

Storage Default
{
<Data name="rechercherVoitureDisponibleDmdeDefaultData">
<Subscript>"rechercherVoitureDisponibleDmde"</Subscript>
<Value name="1">
<Value>categorie</Value>
</Value>
<Value name="2">
<Value>dateDebutReservation</Value>
</Value>
<Value name="3">
<Value>dateFinReservation</Value>
</Value>
</Data>
<DefaultData>rechercherVoitureDisponibleDmdeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
