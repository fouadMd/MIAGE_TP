Class msg.creerReservationDmde Extends (Ens.Request, %JSON.Adaptor)
{

Property dateDebutReservation As %TimeStamp;

Property dateFinReservation As %TimeStamp;

Property voiture As data.Voiture;

Storage Default
{
<Data name="creerReservationDmdeDefaultData">
<Subscript>"creerVoitureDmde"</Subscript>
<Value name="1">
<Value>dateDebutReservation</Value>
</Value>
<Value name="2">
<Value>dateFinReservation</Value>
</Value>
<Value name="3">
<Value>voiture</Value>
</Value>
</Data>
<DefaultData>creerReservationDmdeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
