Class data.Reservation Extends (%Persistent, %JSON.Adaptor)
{

Property dateDebutReservation As %TimeStamp;

Property dateFinReservation As %TimeStamp;

Property voiture As data.Voiture;

Storage Default
{
<Data name="ReservationDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>dateDebutReservation</Value>
</Value>
<Value name="3">
<Value>dateFinReservation</Value>
</Value>
<Value name="4">
<Value>voiture</Value>
</Value>
</Data>
<DataLocation>^data.ReservationD</DataLocation>
<DefaultData>ReservationDefaultData</DefaultData>
<IdLocation>^data.ReservationD</IdLocation>
<IndexLocation>^data.ReservationI</IndexLocation>
<StreamLocation>^data.ReservationS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
