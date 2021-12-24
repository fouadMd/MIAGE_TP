/// 
Class BP.reserverVoiture Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='msg.reserverCategorieVoitureDmde' response='msg.reserverCategorieVoitureRpse' height='2000' width='2000' >
<context>
<property name='voiture' type='data.Voiture' instantiate='0' />
</context>
<sequence xend='200' yend='700' >
<call name='Rechercher Voiture dispo ' target='Reservation' async='1' xpos='200' ypos='250' >
<request type='msg.rechercherVoitureDisponibleDmde' >
<assign property="callrequest.categorie" value="request.categorie" action="set" />
<assign property="callrequest.dateDebutReservation" value="request.dateDebutReservation" action="set" />
<assign property="callrequest.dateFinReservation" value="request.dateFinReservation" action="set" />
</request>
<response type='msg.rechercherVoitureDisponibleRpse' >
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
<assign property="context.voiture.nom" value="callresponse.voiture.nom" action="set" />
<assign property="context.voiture.plaque" value="callresponse.voiture.plaque" action="set" />
<assign property="context.voiture.categorie" value="callresponse.voiture.categorie" action="set" />
</response>
</call>
<if name='test voiture trouvée' condition='response.codeRetour="KO"' xpos='200' ypos='350' xend='200' yend='600' >
<false>
<call name='enregistrer' target='Reservation' async='1' xpos='335' ypos='500' >
<request type='msg.creerReservationDmde' >
<assign property="callrequest.dateDebutReservation" value="request.dateDebutReservation" action="set" />
<assign property="callrequest.dateFinReservation" value="request.dateFinReservation" action="set" />
<assign property="callrequest.voiture.nom" value="context.voiture.nom" action="set" />
<assign property="callrequest.voiture.categorie" value="context.voiture.categorie" action="set" />
<assign property="callrequest.voiture.plaque" value="context.voiture.plaque" action="set" />
</request>
<response type='msg.creerReservationRpse' >
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
</response>
</call>
</false>
</if>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
