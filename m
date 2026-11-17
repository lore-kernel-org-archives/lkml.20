Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=52.103.66.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794920364;
	b=I6hlE1A/aw958tGueMv7LxUCotoNIhI5/FqLLlgCrsNdDFPZyD2auSkBuDq9QxDxbYlV
	 30MKoFDO8QU4/mDlYFuq9l8K46roNxQWClyFIOqWSFkW7/grrChYvR8YnD07PvNGsGksL
	 CdAi9gEwCO105HthXpSGWd3BI1wgeSGXrKdhI2n/MIgOvsbpyftL9JjEpfJAyeXjywIZA
	 7NGhS1ZvW8yTgWC5NMCm/wlcr/rIGwtRHqY5dS8n4LRVuO/6C2PGw8lIUdG8nZpht0N5D
	 FQ5Q5Dp5/DgIsgvBz+lH/AGdtanUebycLoj+40r3GQ8p9uG0csXXzr/joZoIBXdfcJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920364;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-slblob-mailprops:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-CrossTenant-rms-persistedconsumerorg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=M2XB2/dEITFTwbK0u8XS8M30W42GcoAKWde8CDThEGk=;
	b=NHv2JhEo3IvtgABYfoAU2jKHnFr/NkEjKKZkD/w9wAkKBhDnQi9Rt7L+Pma3XXRhRTJJ
	 3x4tmKkEOykCLA1ueCbc+/OvpX48XVpWeYpqZNa8UFyogTAt7R4hRZHAmPD1KbHoKvS7T
	 K2ipaENP7Nck/E6aSK2F83MmD/Rgmjoxe/d7HMP285hNAvBB8VyYG7hrBgP29ttxW8t8E
	 QUP3X1MGVDDuH8LltaM5EcbsQmMAF6+LhHdIU1zr1a9yQI8fZXFzifbLQXt5MzTvlkqRe
	 TG1p53II6qRuePr+t5Dyw+TjToW3dnjvq7Irwv8VyeqWj8bp9uhTP4hra+XFP2f6O7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.jp;
	spf=pass smtp.mailfrom=outlook.jp;
	dkim=pass header.d=OUTLOOK.JP header.i=@OUTLOOK.JP header.a=rsa-sha256 header.s=selector1 header.b=cLbzDezO;
	arc=fail smtp.remote-ip=52.103.66.1
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazolkn19010001.outbound.protection.outlook.com [52.103.66.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD95606A331;
	Tue, 17 Nov 2026 12:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDD95606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=OUTLOOK.JP header.i=@OUTLOOK.JP header.a=rsa-sha256 header.s=selector1 header.b=cLbzDezO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rj5lXO54F6sAihQyd1YnMTREFvC9ZKS30xtKjxAbDzj518OGl0ILfcJxADKdvJOS8zHnpKyyeE8CBeEVp1dPQSK0ngesG2due3kTOlNGgMBnF/D6VDsiRcQyrgKfdEz0m6m2BBvVKbl0COd+UYfZ3QFsLIpMqVgdXH6XVP2lCtHcNVYT7eCj9G8StBHT2LetS5ncPiVagUCucqD9lSlgViRVinVXocDiZ158IT3KRjKeoZ4lRoTVvHYiHwbCoRdEbqhLlyhjdh5k2F4kP4/vhtjE/50e0hTvTIXsX1HcOLMvxLHmBuTlQT4SbTvIUHX3I5W14gGFgTQidSVn/btXhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2XB2/dEITFTwbK0u8XS8M30W42GcoAKWde8CDThEGk=;
 b=jmLtYBKY7bhEUAzbm9GEMtnyeazLD8SbEQ3MwzusY+59Q3q39PHM73sw9AZ4TkiemoQ4Ues4ygqeBFXcfFLKM+ynL6hj02Fy1PaQs4mrtifznI1MFIgy+fOZHOOg/EbGZK/aEczCwaCUI0ZgJHCIlBEF9Euy2DQdrq4II/FMsM0DDFf0AT5MyWIif17mJQF4HjQh5GDnm04saIYSw9CHZtZ10kXnPl8PyeddRJZqwbYrbwRPC0EIl9EOmWggG/gNoj8TcOR9CKqQYBmRALpU6ekxGOxjpmt6/CKJ1V0LHzTVaqFtF+yvlEKHQ6zmSGn+5sr6ChKvCMK6cSwZ9yDs/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.JP;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2XB2/dEITFTwbK0u8XS8M30W42GcoAKWde8CDThEGk=;
 b=cLbzDezO9oq5yKOzOT5hDTwsUuzZ8DjJ/yZv9uDttp1epTlFSdYBveChvGHFrRodEVtneY15dVBelf7Bjmgq0AKIPTegbInomKXsp9eoPI86WQ8h6oFAY2fT/f3kejQMB+oqdK4A8OMrlot+NFSLMwt1gYbK+9t4r0/wTOnZykjx8sphXqkIH9MkovEQiqkNz9+IgnV7JbhEDJ0XfXiZNEk2wpyt8IRL9/++4dM4XJvzMae48l6MQLjJA4pZTW1sBgl8DfYYQjb6Mt+X2OPQuZq82a5lIV4gMvdV07wnutvV8x7E21wiwog3hla54s4eooHF5gD7MuToVMQg2mDA9g==
Received: from OS7PR01MB14363.jpnprd01.prod.outlook.com
 (2603:1096:604:388::11) by OSCPR01MB16379.jpnprd01.prod.outlook.com
 (2603:1096:604:342::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 12:59:18 +0000
Received: from OS7PR01MB14363.jpnprd01.prod.outlook.com
 ([fe80::eeff:dfdb:bd3b:591b]) by OS7PR01MB14363.jpnprd01.prod.outlook.com
 ([fe80::eeff:dfdb:bd3b:591b%6]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 12:59:18 +0000
From: Keisuke Tsukuda <tkdkei@outlook.jp>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sven Peter
	<sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, "asahi@lists.linux.dev"
	<asahi@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] usb: roles: wait for callbacks during unregister
Thread-Topic: [PATCH v2 0/2] usb: roles: wait for callbacks during unregister
Thread-Index: AQHddpN02QiGmt2o3UaR1fV5LDHdqA==
Date: Tue, 17 Nov 2026 12:59:17 +0000
Message-ID: <20261117125825.27629-1-tkdkei@outlook.jp>
Accept-Language: en-US, ja-JP
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS7PR01MB14363:EE_|OSCPR01MB16379:EE_
x-ms-office365-filtering-correlation-id: f5f401a8-d654-4d20-50ad-08df44aa96f1
x-ms-exchange-slblob-mailprops:
 xgbIMsDSu2bc7yhuK2afLsfZGs5LbJY2wFevO0rKudod+8ZGkX2EOWKAT2AVQdG1UY3aCMqEmacla2BuFlYh8L8UtLuAYjerwKyFgqBbpLyeQhahd2AWMPENQIRu0jwRJQkqgXumjZgk1fB4KFNCLr2VxhUJs/xLw+UmyPB4MJphT8PPyUMXOcxWqk79zanOkQ8+pwNR47BB3IHYFcy9BEyFCtbkkW7TnZBeenwape/A+cMk4IWxJpR6yJjGmIrokFIRej8xQ4Dkf2NFsRsBOy5b+wjqSFYrKh2d9GpbrJIXHKumQeK1F1W11feSQVF/KejNkEDTk7Z6EH2LK6PSRqFqu9pc0fjEVNhEAG/jdR0sDc/ou52S5+VWLnBlTjGW0aWF5nUKdd+AgS0aOMNtE6RjASWTqDD+62Ongp8SkYPuM+mra5vlrTWPmAh89TRmdtKeJeP523PanW3TxB7qF/FNr1I9zYQX7k7RqhF5l7SCA9qhPlY+XoD8F0AQGSGGbZIHKSvKZIeiMkDa2ChmP7/4DGXOBA5hNdlNvLTF7ysmZAUvufa3La8J9ysEqpC0eTEmZvuexRyDwqU/o/od9mkkEzpkCwCDFJYaC1Zo+177pq4RpUU4ilNVXuIqb0tXEXOFc3ndupK7vhp1wsvAwoisCNy9CxOKIBCjlxVd0bckHSKq4Cqh62YdFgD0BemTGP+ZDdtzOMQXYkRScxWiVnAeJpgckMozzFiHD2Ve+Yy3usfD+t9rwGSmNsgyEVI5JUX0NodwEs/NJ/qx21fn5qPAR1UhyAlO
x-microsoft-antispam:
 BCL:0;ARA:14566002|38102599003|15080799012|25031999004|31061999003|24021099003|25010399006|5062599005|41001999006|8062599012|51005399006|8060799015|19110799012|4302099013|440099028|3412199025|26104999009|102099032|10035399007|40105399003|1602099012|12091999003;
x-microsoft-antispam-message-info:
 =?utf-8?B?YmV2VnNOTW9ZakZjRGhzNHh3WG02elp1emxTTmo0S3htUDhqWm5jUGM0SC9x?=
 =?utf-8?B?czB6K0xJWkVuZ0NSaTlzZnRzZm5zcktMZHFhckc4SU43RlZaUythazNsUXBp?=
 =?utf-8?B?T1ZFS3dYNGZpWlpRVk1MRVltY1lSMVFOKzc5NE9ra0lxVVdxUzlaSHRpVHlR?=
 =?utf-8?B?L1FRbDhjQjNPMFFQU0ZDOVhsRVN5QW5QRXROM0tXbHZYbWk3NUdNbUdLajBw?=
 =?utf-8?B?Z2xqenRzdllxb2RlYnhYN1o1VzMzVDZubUN0eDVGeVR0aGg3Uk1FTUs2THFm?=
 =?utf-8?B?MHFGWGZWTHhhMGpDQnA0RlFzQm05WDBYU2RrWG03OFpPQnBIWHYvQkg4L1Fp?=
 =?utf-8?B?elpnaDd4OVBPNWtCNHJpQXBoYUNzdHNvTEZXUmlMSlFQbEY2VHJQSldVZkVl?=
 =?utf-8?B?N2VpMDcwSXJtSTgzTTVGaFgxbGRFdUc2dGJxa2NodzVzTVdNWU5OajhmZjI4?=
 =?utf-8?B?Ujd2UktYYjBJQ3krZmduNjMvSGcvZTFOQXVyTTR3bkg1ZUZqQjJLb2NlcTdz?=
 =?utf-8?B?eDNscEg2RllsN3NYcXF5dEpUd2lRazdDS3JIOFFjeG5Db1lmTXR2NFNiZ3Zq?=
 =?utf-8?B?QkVtbzBqVFFtRy9rVUVuWFFKbVZmUTRxN1NHSVJ6ZHR1OWJ2anA4UEFsaS9a?=
 =?utf-8?B?Z0FFajdpcElibk5pcDdjc00yNXR3UFpkMjVaWDJBclBydjZIbkRLNXJKN3ph?=
 =?utf-8?B?VE1QQ2VHL2RmWkRSR2EzbDRRd0NIRVlLU2pxWXptdkxjRWFTY2Rza0VUZHg4?=
 =?utf-8?B?TnhwYmdWeWt5QU04MHNxQjUrUWxoeEFYekV1SDc2dG4ySWY5NWNtZEcvSThT?=
 =?utf-8?B?aGx2ak5QUng3MEhnbnQ0KzVzQ3dnUldMYjVvTmJnVk5HYXBCK2xZaWt6Mmdj?=
 =?utf-8?B?ZHptQmVBdk9WRWpDYmE5b255RmpRaFdpTlMzZU9Qc2pySXpHMzhuRlBtOTZH?=
 =?utf-8?B?ZkpFaHZ2RXpXR3ZZS1lJRzNtVHVmNU9UTjQ2ZWlreDlHMVg5OEFHb1lVdDR1?=
 =?utf-8?B?RmdTTXZKV0hnU0hIMWRjdHhoU0piUjNUSFpDeUU0KzZ3ZEdNUXdDL1JmWE4x?=
 =?utf-8?B?WnF2cisrZWVYb0Q1eHpSVlZHTnU0cjJCQUJpQll5dUEzZTl6SnRiWUxNMmda?=
 =?utf-8?B?eUl0M0VvMWRlRVdJU1d2ZGlhV2dlbEdiTUt4dUl6UUFSWmwvL3BZY2FXMStC?=
 =?utf-8?B?R09DYWZtNUF4SmpOMVMzcXZRSFltWDUwQWd1V2I2b3cyUHRwcnhkV05iZmN6?=
 =?utf-8?B?Y0NlL0ZoQVR1RlZ4RUduZGl1ak5uQjNLQ1ZzOUJkRmhzdXJzeWQzSUk2K205?=
 =?utf-8?B?NytVNXFueUFwZXNsMTMzdlVpdVdOSzJ1UzVXQ3YwZE9IOFNMMkNZd2txNVVq?=
 =?utf-8?B?UGlud0QwOUlyM1JhVkhDZUl4RWZ1U0RTckF3QUpUZUtNWWFTSmg3U0VSUVdF?=
 =?utf-8?B?TnY4QmdwdlZtSmxWODNIWm9HcEZvSWZMNjhTUzlWMjV5YWY1aW5zaXVWUklU?=
 =?utf-8?Q?lsIwVqZ7gCm5a2ZoB8RO7Ph8TpL?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RytVcE8yYXcwd2V6WmRQb3hqWjJ5bHgyTkY5cmVJamQ1c0hYOTJ6MFg4eHJW?=
 =?utf-8?B?Ui9wc3dvRkpPNlo2V3RrTzFZUzdQSmlMT2wyWEU2WnIxSUJIM0JkNzZYbm1h?=
 =?utf-8?B?Mm42dVRtcXE2R1IyQlhEdlJ2L24xS3pHOFdHR1lna0FCQ0FwTEE1T0s3NTBX?=
 =?utf-8?B?ZkFETUFpMXQ2UThmL2tIaFNoK1JPd3NSVEdjVTFXTlFLZXlwVnBZSm83OXdy?=
 =?utf-8?B?eG9SN1JuYk5VZWVFUko4WTRwek9hcjBTcTRmSGtpb0dvVTh6NFZFMHFaZ0dU?=
 =?utf-8?B?N1FaVTM1amZ2NkZ2YUFqMU45VWVvaWFQdXN5T1pJakc4aE9TbDk1TGs3WVpI?=
 =?utf-8?B?SU1LQmNPYVdVRisxWmlJd2hxSjRqdkw1SHRUZFhCcnVpTVgrcWlyemVrbS9F?=
 =?utf-8?B?eDN5cWk5UzFybDNZNm1ybXlBZ2JoTGt3Q3c5WkErVC9uUmdLZ0NLZHRuN3Nr?=
 =?utf-8?B?aXpRSU5YVmM4VlRSWFlOSmtpaytqaVNKS1N3bUQ5V0psa3NLRm9OdnJUUGky?=
 =?utf-8?B?TUV3K0pPZ0tJb2NKa2dNbXFEQTEzK2NsS0R1RHhIcC9pVG4zOXZxUGRPRTNh?=
 =?utf-8?B?R2paZFl0TWVLbHcwcVBoMHBEbmlHVVg3U1VhSmJHaElGY200SnpkUG5UaFlR?=
 =?utf-8?B?MUVEK0ROTnY1TU1zT0pjTFlBRWVYTmo0NkpScmcvdTBxeWpRUFp1dEdrcG53?=
 =?utf-8?B?L0Z6bFpQOS9NbFpLT0YwTHNFQ2h0b2NqK3RIdjVBWVRIaGdFa1ZCSEJiTmpZ?=
 =?utf-8?B?VU12QnJhckVBSkRXd0hSVHVvUWhwSjBielZJSmdsdDJ2T3ozM0lqYy9Wc0dL?=
 =?utf-8?B?UjdWTHlVUW1RMkpDT1Fydm9vY0xMbDdsNUNPMnNlTEltN01LMFJmOEoyTzc3?=
 =?utf-8?B?WDZWczM0MWRhc2Z4aEloVEtFVHdvSVRwSmtVSEZnWTVJZlYzOENLSE1uK2Yv?=
 =?utf-8?B?d3JMcVdYMDVsL0tqU1FtWE9YRGtrSENuRm0wV2FZS0lYRElIN3VNQ29iNDRC?=
 =?utf-8?B?eE8ydnloYS82aFlYaGx0N3dtcU5vcVhVZDFLcllDeW5RcDcyeWt1N0VrVm9D?=
 =?utf-8?B?T2RNWms5amg0UzhTWE1oR1M5dGJMN3RvOHlYSytUV2VscXpMeHMxL1A2b1ZH?=
 =?utf-8?B?NloremxOcDl0MjF3aGZEM21STlFLYXlRN21PckFhenZOK2pMMDQwemJMejNv?=
 =?utf-8?B?a1NZTXJNbkxrNG55YlE4YTR1d0hWWnMvYk9rTndyYVEwTExpZnh2NDBxTVJr?=
 =?utf-8?B?aVA2OW5XN1Q4K3RNa0h2SVBrUVg4M2pLbDlpTTVIUDFlbzJXT2h0dEpoZUhF?=
 =?utf-8?B?aTZnOW13YU04eTF2R0tRRnJZcXhuYmFtZ0RaUCtDSXYyVUVxS2srVjNranVu?=
 =?utf-8?B?WjJJdjhTSEpOaHphdXFIQ1BmQVF6b1JtbHNDV0xKMUZDeHRwQ2ZSWkd4Y29D?=
 =?utf-8?B?SlZmRUZ0dGJLREU0TDFlUmcxTzJzN0t3cTNDV1UrRlJxVzhucUtrMVJHcnhw?=
 =?utf-8?B?bmlrak9aMmg1VEdCSThTcHRTNFl4NU5ZMS9EVHBxTWYzd1ZMOGdGU3g3VDZN?=
 =?utf-8?B?dkpvVDlrVE1FdSszeHl5bWZ6ZFRKVFY1WHYxRmJSWTlwZm9GNEg4MWk5c1F1?=
 =?utf-8?B?VFZlVjhhdzA3RXNqWXJibjFoRENpUGhZNnFmZVVDd3ZDUytqb1d4OVZGMVU2?=
 =?utf-8?B?Q2FFM2lWV2hBaGtkdVc5QlB3NlVja3lwdnlGbzJzSVlmcTRSSERJcUJ0NHdG?=
 =?utf-8?B?cTQweXY0QWpSN0F5WDdoYllzaW5HRjk0aUhFb2g0enl3Y0NBSW5pS2ZzbmhZ?=
 =?utf-8?Q?6x8a9ksx0ZpZKHtPNUAw2jTHAA2hnQ/BQZAtI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-3-msonline-outlook-b83fc.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB14363.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: f5f401a8-d654-4d20-50ad-08df44aa96f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 12:59:17.7326
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16379

QSByb2xlLXN3aXRjaCBwcm92aWRlciBjYW4gYmUgdW5yZWdpc3RlcmVkIHdoaWxlIGEgc2V0L2dl
dCBjYWxsYmFjayBpcwpydW5uaW5nLiBUaGUgY29yZSBjaGVja3MgdGhlIHJlZ2lzdGVyZWQgZmxh
ZyBiZWZvcmUgdGFraW5nIHRoZSBzd2l0Y2ggbG9jawphbmQgY2xlYXJzIGl0IHdpdGhvdXQgdGFr
aW5nIHRoYXQgbG9jaywgc28gdW5yZWdpc3RlciBjYW4gcmV0dXJuIHdoaWxlIHRoZQpjYWxsYmFj
ayBzdGlsbCB1c2VzIHByb3ZpZGVyLW93bmVkIG1lbW9yeS4gQSBzeW50aGV0aWMgcHJvdmlkZXIg
cmVwcm9kdWNlcwp1c2UtYWZ0ZXItZnJlZSByZXBvcnRzIGluIGJvdGggY2FsbGJhY2sgcGF0aHMg
d2l0aCBLQVNBTi4KClRoZSBjb3JlIGZpeCBtYWtlcyB1bnJlZ2lzdGVyIHdhaXQgZm9yIGNhbGxi
YWNrcyBvbiB0aGUgc3dpdGNoIGxvY2suIFRoZQpBcHBsZSBEV0MzIHJvbGUgY2FsbGJhY2tzIHRh
a2UgYSBwcml2YXRlIGxvY2sgdW5kZXIgdGhlIHN3aXRjaCBsb2NrLCB3aGlsZQppdHMgcmVtb3Zl
IHBhdGggY3VycmVudGx5IGhvbGRzIHRoZSBwcml2YXRlIGxvY2sgYXJvdW5kIHVucmVnaXN0ZXIu
IFBhdGNoIDEKbW92ZXMgQXBwbGUncyB1bnJlZ2lzdGVyIGNhbGwgYWhlYWQgb2YgdGhhdCBsb2Nr
OyBwYXRjaCAyIGFkZHMgdGhlIGNvcmUKc3luY2hyb25pemF0aW9uLiBUaGlzIG9yZGVyIGtlZXBz
IGludGVybWVkaWF0ZSBzdGF0ZXMgZnJlZSBvZiB0aGUgbmV3IGxvY2sKaW52ZXJzaW9uLgoKT24g
QVJNNjQgUUVNVSB3aXRoIExpbnV4IDcuMy40IGFuZCBtYWlubGluZSA3LjQtcmMyICgwNjdjNWMy
NGNlZjIpLApLQVNBTiByZXBvcnRlZCB1c2UtYWZ0ZXItZnJlZSBpbiBzZXQgYW5kIGdldCBjYWxs
YmFja3MgYmVmb3JlIHRoZSBjaGFuZ2UuCkFmdGVyIGJvdGggcGF0Y2hlcywgdW5yZWdpc3RlciB3
YWl0ZWQgZm9yIHRoZSBjYWxsYmFja3MgYW5kIG5laXRoZXIgdGVzdApyZXBvcnRlZCBLQVNBTi4g
QSBsb2NrZGVwIHRlc3QgbW9kZWxpbmcgQXBwbGUncyBjYWxsYmFjay9yZW1vdmUgbG9jayBvcmRl
cgp3YXJuZWQgZm9yIHRoZSBvcmlnaW5hbCBvcmRlciBhbmQgbm90IGZvciB0aGUgbmV3IG9uZS4g
QXBwbGUgRFdDMyBoYXJkd2FyZQp3YXMgbm90IHRlc3RlZC4KCkNoYW5nZXMgaW4gdjI6Ci0gU3Bs
aXQgdGhlIEFwcGxlIGxvY2stb3JkZXIgY2hhbmdlIGFuZCB0aGUgcm9sZS1zd2l0Y2ggY29yZSBm
aXggaW50byB0d28KICBwYXRjaGVzLCB3aXRoIHRoZSBBcHBsZSBjaGFuZ2UgZmlyc3QsIGFzIHJl
cXVlc3RlZCBieSBIZWlra2kgS3JvZ2VydXMuCi0gQWRkIENjOiBzdGFibGVAdmdlci5rZXJuZWwu
b3JnIHRhZ3MgdG8gYm90aCBwYXRjaCBkZXNjcmlwdGlvbnMuCgpUaGFua3MgZm9yIHRoZSByZXZp
ZXcsIEhlaWtraS4KCnYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjYxMTEyMDI0MTAx
LjgzMzIxLTEtdGtka2VpQG91dGxvb2suanAKCktlaXN1a2UgVHN1a3VkYSAoMik6CiAgdXNiOiBk
d2MzOiBhcHBsZTogdW5yZWdpc3RlciByb2xlIHN3aXRjaCBiZWZvcmUgdGFraW5nIGxvY2sKICB1
c2I6IHJvbGVzOiB3YWl0IGZvciBjYWxsYmFja3Mgb24gdW5yZWdpc3RlcgoKLS0tCiBkcml2ZXJz
L3VzYi9kd2MzL2R3YzMtYXBwbGUuYyB8ICA0ICsrLS0KIGRyaXZlcnMvdXNiL3JvbGVzL2NsYXNz
LmMgICAgIHwgMTggKysrKysrKysrKysrKystLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDE2IGluc2Vy
dGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgo=
