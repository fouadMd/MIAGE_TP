Class BO.Voiture Extends Ens.BusinessOperation
{

Property Adapter As Ens.OutboundAdapter;

Parameter ADAPTER = "Ens.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method creerVoiture(pRequest As msg.creerVoitureDmde, Output pResponse As msg.creerVoitureRpse) As %Status
{
    
    set pResponse = ##class(msg.creerVoitureRpse).%New()
    set voiture = ##class(data.Voiture).%New()
    do ##class(Transform.WsVoitureToVoiture).Transform(pRequest.voiture,.voiture)
    set tsc = voiture.%Save()

    set pResponse.codeRetour = "OK"

    Quit $$$OK
}

Method deleteVoiture(pRequest As msg.deleteVoitureDmde, Output pResponse As msg.deleteVoitureRpse) As %Status
{
    
    set pResponse = ##class(msg.deleteVoitureRpse).%New()
    if (##class(data.Voiture).consulterParPlaqueExists(pRequest.plaque,.idVoiture)){
        set tsc = ##class(data.Voiture).%DeleteId(idVoiture)
        if 'tsc{
            set pResponse.codeRetour = "KO"
            set pResponse.libErreur = "Erreur technique lors de la suppression"
            QUIT $$$OK
        }
    }
    else{
        set pResponse.codeRetour = "KO"
        set pResponse.libErreur = "Plaque introuvable"
        QUIT $$$OK
    }
    set pResponse.codeRetour = "OK"

    Quit $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="msg.creerVoitureDmde">
        <Method>creerVoiture</Method>
    </MapItem>
    <MapItem MessageType="msg.deleteVoitureDmde">
        <Method>deleteVoiture</Method>
    </MapItem>
</MapItems>
}

}
