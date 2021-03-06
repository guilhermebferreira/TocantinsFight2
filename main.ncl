<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- Generated by NCL Eclipse -->
<ncl id="main" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		<descriptorBase>
			<importBase documentURI="descritores.ncl" alias="desc"/>
		</descriptorBase>
		<connectorBase>
			<importBase documentURI="conectores.ncl" alias="con"/>
		</connectorBase>
	</head>
	<body>
		<port id="pVideo" component="mVideo"/>
		<media id="mVideo" src="media/video/video.mp4" descriptor="desc#Video">
			<property name="bounds"/>
		</media>
		
		<!-- Statics Medias-->
		<media id="mInteratividade" src="media/images/interactive.png" descriptor="desc#Interatividade"/>
		<media id="mButton1" src="media/images/bt_lutadores_up.png" descriptor="desc#Menu1"/>
		<media id="mButton2" src="media/images/bt_disputa_up.png" descriptor="desc#Menu2"/>
		<media id="mButton3" src="media/images/bt_tw_up.png" descriptor="desc#Menu3"/>
		<media id="mButton4" src="media/images/bt_sair_up.png" descriptor="desc#Menu4"/>
		<media id="mBtFighter1" src="media/images/bt_lutador_1_up.png" descriptor="desc#SubMenu1"/>
		<media id="mBtFighter2" src="media/images/bt_lutador_2_up.png" descriptor="desc#SubMenu2"/>
		<media id="mBtCampeonato" src="media/images/bt_campeonato_up.png" descriptor="desc#SubMenuD1"/>
		<media id="mBtCard" src="media/images/bt_card_up.png" descriptor="desc#SubMenuD2"/>
		<media id="mInfoFighter1" src="media/images/LUTADOR_1.png" descriptor="desc#Details"/>
		<media id="mInfoFighter2" src="media/images/LUTADOR_2.png" descriptor="desc#Details"/>
		<media id="mCampeonato" src="media/images/FIGHT_INFO.png" descriptor="desc#Details"/>
		<media id="mCard" src="media/images/CARD.png" descriptor="desc#Details"/>
		<media id="mRefresh" src="media/images/bt_back.png" descriptor="desc#Refresh"/>
		<media id="mBack" src="media/images/bt_back.png" descriptor="desc#Back"/>
		<media id="mSubBack" src="media/images/bt_back.png" descriptor="desc#Back"/>
		<media id="mSubBackFight" src="media/images/bt_back.png" descriptor="desc#Back"/>
		<media id="mTvLogo" src="media/images/tvlogo.png" descriptor="desc#TvLogo"/>
		<!--<media id="mTwitter" src="http://tweepromo.heroku.com/arena?q=UFC" descriptor="desc#TweetBox" type="text/html" />-->
		<media id="mTwitterManager" src="media/lua/twitter_manager.lua" descriptor="desc#TweetBox"/>
		<media id="mGridMaker" src="media/lua/grid_maker.lua" descriptor="desc#Full"/>
		<!--======================================================-->
		<!--                     INITIALIZATION                   -->
		<!--======================================================-->
		<link xconnector="con#onBeginStartN">
			<bind role="onBegin" component="mVideo"/>
			<bind role="start" component="mInteratividade"/>
			<bind role="start" component="mTvLogo"/>
		</link>
		<!-- F6 (INFO) Abre menu para interatividade -->
		<link xconnector="con#onKeySelectionStartNStopN">
			<bind role="onSelection" component="mInteratividade">
				<bindParam name="key" value="INFO"/>
			</bind>
			<bind role="start" component="mButton1"/>
			<bind role="start" component="mButton2"/>
			<bind role="start" component="mButton3"/>
			<bind role="start" component="mButton4"/>
			<bind role="stop" component="mInteratividade"/>
		</link>
		<!--======================================================-->
		<!--              CONTROLE LUA                            -->
		<!--======================================================-->
		<!-- Atribui vazio à propriedade service.currentKeyMaster do nó settings para que o foco saia-->
		<!-- -->
		<link xconnector="con#onEndSet">
			<bind role="onEnd" component="mTwitterManager"/>
			<bind role="set" component="settings" interface="service.currentKeyMaster">				
				<bindParam name="var" value=""/>
			</bind>			
		</link>
		
		<link xconnector="con#onBeginSet">
			<bind role="onBegin" component="mTwitterManager"/>
			<bind role="set" component="settings" interface="service.currentKeyMaster">				
				<bindParam name="value" value="mTwitterManager"/>
			</bind>
		</link>
		
		<!--======================================================-->
		<!--              BOTÃO LUTADORES                         -->
		<!--======================================================-->
		<link xconnector="con#onKeySelectionStartNStopN">
			<bind role="onSelection" component="mButton1"/>
			<bind role="start" component="mBtFighter1"/>
			<bind role="start" component="mBtFighter2"/>
			<bind role="start" component="mBack"/>
			<bind role="stop" component="mButton1"/>
			<bind role="stop" component="mButton2"/>
			<bind role="stop" component="mButton3"/>
			<bind role="stop" component="mButton4"/>
		</link>
		<!-- Seleciona lutador 1, mostra informações -->
		<link xconnector="con#onKeySelectionStartNStopN">
			<bind role="onSelection" component="mBtFighter1"/>
			<bind role="stop" component="mBtFighter1"/>
			<bind role="stop" component="mBtFighter2"/>
			<bind role="stop" component="mBack"/>
			<bind role="start" component="mSubBack"/>
			<bind role="start" component="mInfoFighter1"/>
		</link>
		<!-- Seleciona lutador 2, mostra informações -->
		<link xconnector="con#onKeySelectionStartNStopN">
			<bind role="onSelection" component="mBtFighter2"/>
			<bind role="stop" component="mBtFighter1"/>
			<bind role="stop" component="mBtFighter2"/>
			<bind role="stop" component="mBack"/>
			<bind role="start" component="mSubBack"/>
			<bind role="start" component="mInfoFighter2"/>
		</link>
		<!--======================================================-->
		<!--              BOTÃO DISPUTA                         -->
		<!--======================================================-->
		<!-- Abre submenu sobre disputa -->
		<link xconnector="con#onKeySelectionStartNStopN">
			<bind role="onSelection" component="mButton2"/>
			<bind role="start" component="mBtCampeonato"/>
			<bind role="start" component="mBtCard"/>
			<bind role="start" component="mBack"/>
			<bind role="stop" component="mButton1"/>
			<bind role="stop" component="mButton2"/>
			<bind role="stop" component="mButton3"/>
			<bind role="stop" component="mButton4"/>
		</link>
		<!-- Informações sobre o campeonato -->
		<link xconnector="con#onKeySelectionStartNStopN">
			<bind role="onSelection" component="mBtCampeonato"/>
			<bind role="stop" component="mBtCampeonato"/>
			<bind role="stop" component="mBtCard"/>
			<bind role="stop" component="mBack"/>
			<bind role="start" component="mSubBackFight"/>
			<bind role="start" component="mCampeonato"/>
		</link>
		<!-- Informações sobre os CARD -->
		<link xconnector="con#onKeySelectionStartNStopN">
			<bind role="onSelection" component="mBtCard"/>
			<bind role="stop" component="mBtCampeonato"/>
			<bind role="stop" component="mBtCard"/>
			<bind role="stop" component="mBack"/>
			<bind role="start" component="mSubBackFight"/>
			<!--<bind role="start" component="mCard" />-->
			<bind role="start" component="mGridMaker"/>
		</link>
		<!-- Abrir TweetBOX  -->
		<link xconnector="con#onKeySelectionStartNStopN">
			<bind role="onSelection" component="mButton3"/>
			<!--<bind role="start" component="mTwitter"/>-->
			<bind role="start" component="mTwitterManager"/>
			<bind role="start" component="mBack"/>
			<bind role="stop" component="mButton1"/>
			<bind role="stop" component="mButton2"/>
			<bind role="stop" component="mButton3"/>
			<bind role="stop" component="mButton4"/>
		</link>
		<link xconnector="con#onSelectionStartStopN">
			<bind role="onSelection" component="mButton4"/>
			<bind role="start" component="mInteratividade"/>
			<bind role="stop" component="mButton1"/>
			<bind role="stop" component="mButton2"/>
			<bind role="stop" component="mButton3"/>
			<bind role="stop" component="mButton4"/>
		</link>
		<link xconnector="con#onKeySelectionStartNStopN">
			<bind role="onSelection" component="mBack">
				<bindParam name="key" value="BACK"/>
			</bind>
			<bind role="start" component="mButton1"/>
			<bind role="start" component="mButton2"/>
			<bind role="start" component="mButton3"/>
			<bind role="start" component="mButton4"/>
			<bind role="stop" component="mBack"/>
			<bind role="stop" component="mBtFighter1"/>
			<bind role="stop" component="mBtFighter2"/>
			<bind role="stop" component="mTwitterManager"/>
			<bind role="stop" component="mRefresh"/>
			<bind role="stop" component="mBtCampeonato"/>
			<bind role="stop" component="mBtCard"/>
		    
		</link>
		<link xconnector="con#onKeySelectionStartNStopN">
			<bind role="onSelection" component="mSubBack">
				<bindParam name="key" value="BACK"/>
			</bind>
			<bind role="start" component="mBtFighter1"/>
			<bind role="start" component="mBtFighter2"/>
			<bind role="start" component="mBack"/>
			<bind role="stop" component="mSubBack"/>
			<bind role="stop" component="mInfoFighter1"/>
			<bind role="stop" component="mInfoFighter2"/>
		</link>
		<link xconnector="con#onKeySelectionStartNStopN">
			<bind role="onSelection" component="mSubBackFight">
				<bindParam name="key" value="BACK"/>
			</bind>
			<bind role="start" component="mBtCampeonato"/>
			<bind role="start" component="mBtCard"/>
			<bind role="start" component="mBack"/>
			<bind role="stop" component="mCampeonato"/>
			<bind role="stop" component="mCard"/>
			<bind role="stop" component="mSubBackFight"/>
			<bind role="stop" component="mGridMaker"/>
		</link>
		
		<!--======================================================-->
		<!--                 CONFIGURAÇÕES                        -->
		<!--======================================================-->
		<media id="settings" type="application/x-ginga-settings">
			<!-- defineque midia pode realizar a capitura das teclas -->
			<property name="service.currentKeyMaster"/>
		</media>
		
	</body>
</ncl>
