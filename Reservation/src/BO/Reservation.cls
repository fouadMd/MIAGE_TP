Class BO.Reservation Extends Ens.BusinessOperation
{

Property Adapter As Ens.OutboundAdapter;

Parameter ADAPTER = "Ens.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method rechercherVoitureDisponible(pRequest As msg.rechercherVoitureDisponibleDmde, Output pResponse As msg.rechercherVoitureDisponibleRpse) As %Status
{
    
    set pResponse = ##class(msg.rechercherVoitureDisponibleRpse).%New()

    set sql = "select plaque from data.Voiture where categorie = '"_pRequest.categorie_"' and plaque not in ("
    set sql = sql_" SELECT voiture->plaque FROM data.Reservation where voiture->categorie = '"_pRequest.categorie_"'"
    set sql = sql_" and ((dateDebutReservation >= '"_pRequest.dateDebutReservation_"' and dateDebutReservation <= '"_pRequest.dateFinReservation_"' ) "
    set sql = sql_" or (dateFinReservation >= '"_pRequest.dateDebutReservation_"' and dateFinReservation <= '"_pRequest.dateFinReservation_"' ) "
    set sql = sql_" or (dateDebutReservation <= '"_pRequest.dateDebutReservation_"' and dateFinReservation >= '"_pRequest.dateFinReservation_"' ) "
    set sql = sql_" or (dateDebutReservation >= '"_pRequest.dateDebutReservation_"' and dateFinReservation <= '"_pRequest.dateFinReservation_"' )) "
    set sql = sql_  " ) "

    set statement=##class(%SQL.Statement).%New() 
	do statement.%Prepare(sql)
	set SQLrequest = statement.%Execute()
    do SQLrequest.%Next()
    set plaque = SQLrequest.%Get("plaque")

    $$$TRACE(plaque)
    set tsc = ##class(data.Voiture).plaqueExists(plaque , .idVoiture)
    if (tsc) {
        
        $$$TRACE(idVoiture)
         
        set pResponse.voiture = ##class(data.Voiture).%OpenId( idVoiture ) 
        Quit $$$OK

    }
    else {
        set pResponse.codeRetour = "KO"
        set pResponse.libErreur = "voiture non disponible"
        Quit $$$OK
    }
}

Method creerReservation(pRequest As msg.creerReservationDmde, Output pResponse As msg.creerReservationRpse) As %Status
{
    
    set pResponse = ##class(msg.rechercherVoitureDisponibleRpse).%New()

    set reservation = ##class(data.Reservation).%New()
        set reservation.voiture = pRequest.voiture
        set reservation.dateDebutReservation = pRequest.dateDebutReservation
        set reservation.dateFinReservation = pRequest.dateFinReservation
        set tsc = reservation.%Save()
        set pResponse.codeRetour = "OK"
    
        $$$TRACE(tsc)
        Quit $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="msg.rechercherVoitureDisponibleDmde">
        <Method>rechercherVoitureDisponible</Method>
    </MapItem>
    <MapItem MessageType="msg.creerReservationDmde">
        <Method>creerReservation</Method>
    </MapItem>
</MapItems>
}

}
