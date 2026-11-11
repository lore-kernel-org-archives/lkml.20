Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794364642;
	b=XpHbJG1j3Axngxnz/Wli3Fc76AhKdHr0Q1S+knxit4b6hLgP2OHOIlwdSCejJpCasTpZ
	 H5NuqPEZsks0r8Maez3nGOIKGiJCuuLFzM1eNBzSMBhXHMcqxU81SCAXXss6plB4ZbzaP
	 Vg35KIfVU7FNgonvvGdNxnLpPSwrMRISI3u1hBHYeszBRxykucsfDgBHV+dKBCUlt7hi5
	 B7May+YjJrR1FJnKDA2zaNk8rTPBJdjBWMEKAnavrX9TCKO8ZmIu6sSCtsE3gV3hIkJGV
	 ms6LQYS0deHrwRyvy/ZLWgKRIWNC4agb4hfYdVI//7jlWAyq2aJPqIC8pqZ0BxMg1Tw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364642;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ld-processed:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-MTK;
	bh=Si0aZhvz0OnvUFG+irad13f9ta+Dlpg6mymEb3Fg3TI=;
	b=RFHgxgCOz81grdXH/CHM5K8X9UVYgmg7JvR5ec5vvUusAtcLr2KvFzRVheyYkUHrzEYK
	 xnd/monGMbmxrh6MHQlnwzVo4ou/c6JO65RrrBRBRfkc7SEqZuC0UeSnEqWx5a1Gg3UsM
	 h/C2OKmRF2wfj0KcY8cSDCii/81z7V7Q/11mL8RWvV0U2aY9d5hjUuPqYA/uphS4ZHjEc
	 5BV5MFxcSqIbdMgSWYclG8S/CT9EasPa7KNndx74VmaVljjuczMhfFepUyxuIuDtiV24Y
	 xIB3nZfxvyW11OV/X3ESbBr6hXsWvfz+4GDRbMVJSIcqlIbx4xrZIV7pjA7foV6fitg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Hhk3IYNK;
	dkim=pass header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=hRlbkD8q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292DB606A320;
	Wed, 11 Nov 2026 02:37:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 292DB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Hhk3IYNK;
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=hRlbkD8q
X-UUID: ce02250cdd7811f18dc8c9802ae25ab1-20261111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Si0aZhvz0OnvUFG+irad13f9ta+Dlpg6mymEb3Fg3TI=;
	b=Hhk3IYNK3kVSQ2DAHlsp7W1Gks8Yujqeo1p7d50vmPpPhQc+L7suXQwM8DlKw+t4JAHp07C8NGCw5tk6bU91UZNDMcuVKsTDfIzUdZzJsa23D4vwsvpopPJZQDZbCw+LheqkRhoVfIpIoM6ri0uaNFHTdzfSF6G6ozsv/BAUnYc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:6d4d4809-bdb5-4a2e-9239-7d7be50ee504,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:993c2066-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|51|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ce02250cdd7811f18dc8c9802ae25ab1-20261111
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1891453849; Wed, 11 Nov 2026 10:37:14 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 11 Nov 2026 10:37:13 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 11 Nov 2026 10:37:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J9fZRS7IKVj7UaWFGqTlrB6aKLZOAchIA/N0wJ0CBhodc97p8fwCJfZxQVnNIopUibVpZ4rdl2TNT0trqy5H73gnB1pHAQ3R8bYjExB7QJb0nwkSa0yJOIff+M/w9T3K9JxEyrXeZanS6uWFDy4HGKdQMmUdtTtmCQji6DCoXnzuafjKMuxCG3lpgGPphML2vRGLj2PcChYWZ3nTdOm3vLyQuEPWizylnGnN+uL/y3vU5WStxMSNyrCa6dz2NuziTN2tPOL4pF5Ifg+WV+hoG9QP6X4Skzex9zFWHT0fE08j1t2NA8c/QfZZGszXKpnkSDveloObPSKN9j/ZQ+g/JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Si0aZhvz0OnvUFG+irad13f9ta+Dlpg6mymEb3Fg3TI=;
 b=btJ32gkIqAdGBDqw9U0JsvrGGoIcwmvdFb/C4JEMVJ6ZaoXAyOBEvTP91F4/FvcFGqQzUXelE07MFnoqyBUpclIDhqEpN1JevFotOIIZ2YXoap8if4iPl5eaTDD+ElGpgvnOLFLRHoTruKVeRcspSnHCmWM49B2SjcvMFoyxLNpP6cKkqTWztHvT3MZkxOJ0ZhTtAj1x+ruG39jynMeMkw+QzRf4DwCiXSNl1GRjd+SCzAcj4zbuXYXx4VI25WPMQeGCuXfD4yyO6lqpMflnw8C4hm7/h38KeRUvAclNPL8VWUtDMVv+K4AypuEF3OGdxis4XdYgZJzIoeR3eyrwVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Si0aZhvz0OnvUFG+irad13f9ta+Dlpg6mymEb3Fg3TI=;
 b=hRlbkD8qwubiJTL9qKtKrzbMmzF3dYUgQsTw7OpueB2yVUmOXcY07ZRI/eWX5E+RkuYwV5lBEHDPgnbSCy25zBexj57EwZFM32t67ReVIvo2LirJsVNqmS0u2lbEqC1+95Ic3lfUPLcxU3fG6Qb+tuq6qw+Xf0FlMEzrFGFsCgI=
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com (2603:1096:604:471::11)
 by KUXPR03MB10579.apcprd03.prod.outlook.com (2603:1096:d10:6b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Wed, 11 Nov
 2026 02:37:10 +0000
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02]) by OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02%5]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 02:37:10 +0000
From: =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
To: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
CC: "konrad.dybcio@oss.qualcomm.com" <konrad.dybcio@oss.qualcomm.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "westeri@kernel.org"
	<westeri@kernel.org>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "YehezkelShB@gmail.com"
	<YehezkelShB@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "sven@kernel.org" <sven@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "andreas.noever@gmail.com"
	<andreas.noever@gmail.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2 2/7] thunderbolt: Move ICM mailbox functions to icm.c
 and internalize interrupt work
Thread-Topic: [PATCH v2 2/7] thunderbolt: Move ICM mailbox functions to icm.c
 and internalize interrupt work
Thread-Index: AQHdcQmWLY2bl9PD1EOhoEDMJupi0rcnXDKAgADM04A=
Date: Wed, 11 Nov 2026 02:37:10 +0000
Message-ID: <96d0fa5237bd831fa49968f93f0d38bfbc6a4ecc.camel@mediatek.com>
References: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
	 <20261110114925.722014-3-chunfeng.yun@mediatek.com>
	 <20261110142403.GB259790@black.igk.intel.com>
In-Reply-To: <20261110142403.GB259790@black.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSNPR03MB9677:EE_|KUXPR03MB10579:EE_
x-ms-office365-filtering-correlation-id: 001e3ca6-fc40-4c3b-b1da-08df3f9caf95
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|22082099003|18002099003|10067099003|38070700021|11063799006|4143699003|56012099006|261026121527099003|261028144727099003|261102130727099003|261022075727099003|261022105027099003|261026140227099003|261009223027099003;
x-microsoft-antispam-message-info: Ufkq08Q+hkuR4DWsqVXNrImZ8RB6DDCqldPM4F2p6d7uRQZ3Md1p9EiTBgXafztS+++y6x9Nib6NaD9TUMMlJ+f4oPDHdqFQ39yVxyLgVgKaoM3UuEhuSvLFeVtyKMGUa/n4FFH0eK2o6JxU9Z05lzbKDuguO14xH1Pb8KVZqDIeXymcrl+ajbqIafThKsKtMA0xwnVAZQG01pjQBDstsOckO6KshZ7f1mUFHQ9PHung9cQVUfT1cs+N2PRfAEL8OBwTY0BNrPtlPrs/CvgCqCep/hiPkm79D4RMYwj0e+szPR2Owb08dMLFMFpV6DFV5/gF5Y8y77lVhebvNDUNny+CvYmzmnmEqijQKnVbTo+kwWhNcnhnQEWzRrwsNNg8XNmYhQYp3Ug74//m/Wxj9SS1iQanqenKQMkOrhj/57cttD6gxne+taueOJZp8LrjjvBa6kk2MIbcBY/PWwDDkkWcw52YMyHsPLlIlDNYhHq/xuhiv2iiPuK+rYttwhn0WHQMSuEba4fqbXxA2jqwpAx2LR9JXbfwx0gI7FP/6I3DxHRkJn7vtHNK78cYrBSSWyaebiOp1B9m8rAYcWQNW3dkQ/GVeR7KhUIUtcE3RwjGw6P/B4E7pt3nhOeEQ96kl+O79ziMKOJ1nULL4sD1ew8maQVQzMOyf9H2Py4hjYaSVR/v6Yoboi67vQ9fAIky75D4Q8oXNhLS1Heb2Drjmw9WxdxEsAzUozyTjap5Zu0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSNPR03MB9677.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(10067099003)(38070700021)(11063799006)(4143699003)(56012099006)(261026121527099003)(261028144727099003)(261102130727099003)(261022075727099003)(261022105027099003)(261026140227099003)(261009223027099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SDlrWElnWFowaW0rZUlOOHRrTldpZG5xS0tGajMwZnY4V1ZTYTU3L1Q4WkRq?=
 =?utf-8?B?QXJHOFc5WVFPcWZFRWNncmRXeHBpRkpzUVphV1MvOEl0ZkRBZkVKd3FwVmo3?=
 =?utf-8?B?WVp1OUhndFQ2QUhoL0s3UW5hZDd0THoyc1d0MTR2WnR0REkzb21uNXV5QUI3?=
 =?utf-8?B?elY0ZWVCNUZsbk1TOHQ1a2FxeWxOZ095b3drWUQ3ZytiaWtpbWo0Yk94V0lB?=
 =?utf-8?B?M1pCbklmSkhtTlNkRzNxNEl3SWo4WnZNUHMxVER5NlpvTFJlOEtVMHFVendq?=
 =?utf-8?B?L1RSc2FKak9kMXFBRldvbml5eXVGQVAwZ0JLUGxnOEgybjMra2o5MjBNVTIv?=
 =?utf-8?B?cjZJNmdTYmtrMy8vdzcvSHJqcGlCdWlkUXVNMXVGQiswVGhiRmcyUDVTVjFW?=
 =?utf-8?B?b1NrMGJEUkJLaTZ1MFVJN09ybFlQRXlTbmNYbCt0VG1wOGsramk0MEdVZGJI?=
 =?utf-8?B?OWNPMk5UdURIbmVsS2dtOVpTTkpMYjVSQWJnYURyUnpIL095U1RiTG10N2M4?=
 =?utf-8?B?OGpLQ3VHM29ZRlBSaDA3bzkvYjZldmtsam4rU1lNRy9qU2JLMkJ0b1FKMGZx?=
 =?utf-8?B?OHJnaDBvLzRpRHN5NUpXTEJHYlI4anIwUnlMRHhsVk9WNWZpTE40NWFsay92?=
 =?utf-8?B?emd6Q3grY05FNlBMc0NjcVdTNmZXRzFjN20vT2J2My8xQlBTeHFwaXNVaS9I?=
 =?utf-8?B?MFNEV3VUaFpxQThJR01mNlZpZndiaDJuMW5JRVRJYVp2TUt4OW5sNG03TSs2?=
 =?utf-8?B?QmVBR1FDMmJnM21QYTYzYWoycnAyVENSbUlBeVB2WHl1M095N3hJcmZnSytT?=
 =?utf-8?B?U05LUW9IZ1NWV3QwNnNRNjdoK2hoMHRxNk1sQTBIRS96RGttZ0xJTDFyMkh3?=
 =?utf-8?B?NmM4OWhDcjBnK2IwempIandFNzRvVU1KTjRQS1RYbDN3WkxtVDlnNzFSY2J3?=
 =?utf-8?B?RS9KMWYvMXZ6am5tVTcxQzJUSFM3QWRITzFVMVVxWElINXBWb3FOWlpITStG?=
 =?utf-8?B?YmRROGltYU9oNGZlVkJZdkJzMmdkMG1pclo0T0phbHJkVFVQVGVCaEllcmQ5?=
 =?utf-8?B?SkxBM1dTRWhGdVJNQUZiMXlhUzByZXJjVDJjNTEzMVNQUElxaVRQSStFWU1m?=
 =?utf-8?B?NzJ3WVRlVkhHWXFWSUdyQy8raHk4cU5tbnNXY1FXRklrUFloLzJ5Um5Obk42?=
 =?utf-8?B?WW1FeHlnNiswbjc3Kzk2SjJsTTJmdGhtWmRPdGhjN1J5TTk3TndMQnRGMjVr?=
 =?utf-8?B?VDBiY290ZnlMaTc1aWFaV043RnFlU0xPZEdsSUN3b05MTE1nWGw2U2JHQ2FG?=
 =?utf-8?B?Y0hnbDNienNTMEEvbWNqeWtENWhmK2pqSjRaQlZ0ei9qWm9tSTMxc09RZS9S?=
 =?utf-8?B?UUhZZS9YZzM0aWJWQVM4OTJQWGtTcktacFV2cmtHNXVMK2E0VllueXV6aVN5?=
 =?utf-8?B?OGl2V2VuWi9MWlBEdW5VUWJWV0thaTJJNGhPRDNZNytPNW0xOGNsdDBqblBs?=
 =?utf-8?B?ekRUQ2ZrSHBRZFZuYU4zVEZiZ2JGaEVqVzY4cVpMSHc5S2Y1N293WFRRSFJt?=
 =?utf-8?B?K05iU21OMFBUNy9uWWlPOXd5UHpQQlJTdURLdUVNNkgzcnR6ZzhjRURnbENH?=
 =?utf-8?B?WGZRNllZRzRYSDdoVFRiNVBScFZBTTBqNGhscG5ndG92ZmorUnNXTTdoMWNx?=
 =?utf-8?B?TThUOTVzR092amNyMk9pbWplWk9leDJ1QVIxY1lQdityYWxFNjdWc2pPSWpE?=
 =?utf-8?B?SVdhN0hxWTVId3QrY3QzdVRJQ1BEMHBUY3BtUzhBdVZUV0xBTEZ1R0xMTFFu?=
 =?utf-8?B?WkNaOSs1TW43dnJyNDlIUEMzU0dSYlJ2K05ZVTN2ZDZGMk8vSHRkdGtIZG53?=
 =?utf-8?B?Q04zNlZzd0dZbWFHMzV6ZDY1dGt3dU92SkFZWCt0ajNiVFZQaUF4MysxMEhj?=
 =?utf-8?B?TTNvbVc3NVhzSjRCYnhlbkJ4OGx5TmxuVVhUaUVKOCtkQktFSU80OEwzR1NZ?=
 =?utf-8?B?OVhpcytQSVBTc2dXUEM3Wklhb3hEdmpMQ25oVmVuaTlxTVVEVDR0d3dFMFBa?=
 =?utf-8?B?OGZHQitmM3BUK29vVGdMSy9BR0pHUExmeDc2cTE4M2tCeHZUVUd1UU55bkUv?=
 =?utf-8?B?ZUUvSDRsbThrc0o2VDArZ0I2dTRCRk9ocmIzN2dhdU53NTIxUm9qdFFEVTdw?=
 =?utf-8?B?NG1JclI4NUIrUnhwOXlQQkNLQXdScnoremtlUXhPQmFQRXk3N3VXMjk0OGxS?=
 =?utf-8?B?WXRPWjJTS3BtUm9QeHZGT0F1QXZnc1N4N0VlSVlJWFlwLzdJakloUStxY2lF?=
 =?utf-8?B?UjMxbzNtc1IraDZKNUJJQnBlRC9WUGZKbk5TUWpuZ2NGdEl0TEN3bmRhSWRJ?=
 =?utf-8?Q?ZfzaktCITrIeGRrk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F225795AB26112448497101AF87D0DAD@apcprd03.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: sXRLDYeA+QJ3b5lDVH0XaOn7AxqLS/o7zXFItFmc72yF5gskiZIPE/t5ADUksdF/4QehBFJYheNeGVpXI6o/K6D6wOrLmW+Ai35rNISuiU3z4nh6zlTGk7/JdJ+VXhe3NWbkeoCobQUhZgmivdAFDSEiUNfpTJYC+tP9RaTLzEYji9ymg45BY+tmAEnkPgTeMcVcrB5gHfnv+ZyKqtWeSIn11j/HQHnvxsc2mTPp/uMDNtCX2uyd6m87JfvEEa1EaP3X/OW9Na1Nv3YbalVeYkdZSZssxWagjav050uD27qZAvN+tiuYGlw+2DGtEfPwE+2OsW5YVdb+0f7UVLHLVA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSNPR03MB9677.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 001e3ca6-fc40-4c3b-b1da-08df3f9caf95
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2026 02:37:10.2933
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Iqd27QR1eEuOjA2SvVk+zyeGKWdvlN255UaiZCRXAQDYQTGhePK3+LGr9aqP2y2H4IJbhyF3sbY0rl2e9ukYGerUgcBBdePIMejjTUA2ork=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR03MB10579
X-MTK: N

T24g5LqMLCAyMDI2LTExLTEwIGF0IDE1OjI0ICswMTAwLCBNaWthIFdlc3RlcmJlcmcgd3JvdGU6
DQo+IA0KPiA+IA0KPiA+IC0tLSBhL2RyaXZlcnMvdGh1bmRlcmJvbHQvbmhpLmMNCj4gPiArKysg
Yi9kcml2ZXJzL3RodW5kZXJib2x0L25oaS5jDQo+ID4gQEAgLTM1LDggKzM1LDYgQEANCj4gPiDC
oCAqLw0KPiA+IMKgI2RlZmluZSBSSU5HX0UyRV9SRVNFUlZFRF9IT1BJRAlSSU5HX0ZJUlNUX1VT
QUJMRV9IT1BJRA0KPiA+IMKgDQo+ID4gLSNkZWZpbmUgTkhJX01BSUxCT1hfVElNRU9VVAk1MDAg
LyogbXMgKi8NCj4gPiAtDQo+ID4gwqBzdGF0aWMgYm9vbCBob3N0X3Jlc2V0ID0gdHJ1ZTsNCj4g
PiDCoG1vZHVsZV9wYXJhbShob3N0X3Jlc2V0LCBib29sLCAwNDQ0KTsNCj4gPiDCoE1PRFVMRV9Q
QVJNX0RFU0MoaG9zdF9yZXNldCwgInJlc2V0IFVTQjQgaG9zdCByb3V0ZXIgKGRlZmF1bHQ6DQo+
ID4gdHJ1ZSkiKTsNCj4gPiBAQCAtOTY0LDY1ICs5NjIsNyBAQCBpbnQgdGJfcmluZ190aHJvdHRs
aW5nKHN0cnVjdCB0Yl9yaW5nICpyaW5nLA0KPiA+IHVuc2lnbmVkIGludCBpbnRlcnZhbF9uc2Vj
KQ0KPiA+IMKgfQ0KPiA+IMKgRVhQT1JUX1NZTUJPTF9HUEwodGJfcmluZ190aHJvdHRsaW5nKTsN
Cj4gPiDCoC4uLg0KPiA+IC0NCj4gPiAtdm9pZCBuaGlfaW50ZXJydXB0X3dvcmsoc3RydWN0IHdv
cmtfc3RydWN0ICp3b3JrKQ0KPiA+ICtzdGF0aWMgdm9pZCBuaGlfaW50ZXJydXB0X3dvcmsoc3Ry
dWN0IHdvcmtfc3RydWN0ICp3b3JrKQ0KPiA+IMKgew0KPiA+IMKgCXN0cnVjdCB0Yl9uaGkgKm5o
aSA9IGNvbnRhaW5lcl9vZih3b3JrLCB0eXBlb2YoKm5oaSksDQo+ID4gaW50ZXJydXB0X3dvcmsp
Ow0KPiA+IMKgCWludCB2YWx1ZSA9IDA7IC8qIFN1cHByZXNzIHVuaW5pdGlhbGl6ZWQgdXNhZ2Ug
d2FybmluZy4gKi8NCj4gPiBAQCAtMTMzMSw2ICsxMjcxLDggQEAgaW50IHRiX25oaV9wcm9iZShz
dHJ1Y3QgdGJfbmhpICpuaGkpDQo+ID4gwqAJaWYgKCFuaGktPnR4X3JpbmdzIHx8ICFuaGktPnJ4
X3JpbmdzIHx8ICFuaGktDQo+ID4gPmludGVycnVwdF9tYXNrKQ0KPiA+IMKgCQlyZXR1cm4gLUVO
T01FTTsNCj4gPiDCoA0KPiA+ICvCoMKgwqAgSU5JVF9XT1JLKCZuaGktPmludGVycnVwdF93b3Jr
LCBuaGlfaW50ZXJydXB0X3dvcmspOw0KPiA+ICsNCj4gDQo+IFRoaXMgaGFzIHdlaXJkIGluZGVu
dC4NCndpbGwgZml4IGl0LCB0aGFua3MNCg0KPiANCj4gPiDCoAluaGlfcmVzZXQobmhpKTsNCj4g
PiDCoA0KPiA+IMKgCS8qIEluIGNhc2Ugc29tZW9uZSBsZWZ0IHRoZW0gb24uICovDQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdGh1bmRlcmJvbHQvbmhpLmggYi9kcml2ZXJzL3RodW5kZXJib2x0
L25oaS5oDQo+ID4gaW5kZXggYTM2YzYyYzQ5YTVjLi4zZGQ2YWNlNjE1MGQgMTAwNjQ0DQo+ID4g
DQoNCg==
