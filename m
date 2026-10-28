Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793175842;
	b=mBIktRtIMttaamVx7pYVelscHwAtMPomQWr/hU7orThyNBRuSnS1lf8o9MUkbh6bnkLX
	 AUUE2SI3x5ExZgXiYI527qXwVUALf2fdL5ZgThZYLLXW9yeW4mMqthtrPB5Z4HiNSeLf8
	 dYTzGJC4x0Km9NfZKeF6P+CUWFdhDvGYDWBrFbJsVfd1cXL5FtxfX6517Rj+Dk/+M6EyF
	 3EwXeuILJgEWIBn1QuPGVeGXBNAaCzNNrTY/pr9NfNvCdTJs0uXc8r+pkxEYqneMDdmp3
	 pF3EK3I2EAFTU8HvcHI68lkpDiKgAmt1D10c0iBnmhPK4DXQfjH1ak7r0o+8WOLLgEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793175842;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 user-agent:x-ms-publictraffictype:x-ms-traffictypediagnostic:
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
	bh=VHWFYUd5mMqzZ0QOcwiVDpqgCLp00VY6VZDF1RctTbM=;
	b=ONUekC18CQRjW7qgJyerPHZy1s5Q2OzZfh1YIlXfWakas6o2gvy2QFhh9e90hePqLMH3
	 RSJKZZmiEA7YpACSwMBILlzRiVcVFC1V6H83Wm1OwUgg0ZwlteQ9U1sMJUQTcNJXZ3Njs
	 7Akohhrfuptwt6wRJ337FG86wCunj1SQH+GNi9iez2INsGuIlDVFmwMf2DVcKpWQmcE4t
	 FkBUm8vK9Y+PtRN/fVFyIP3qnC2KMVDohU/lencl9hioGpjziTERe1NYDMgtqtWSNz3Nk
	 WnF8T4TPVPmlo1TeyifxRzzl5P4G+ZAPsH2YvHm+Y/ySuY/ocTmbOEMPgRFH3CbVydA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=c0rVfzA6;
	dkim=pass header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=He60dgNY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A601E606A31D;
	Wed, 28 Oct 2026 08:24:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A601E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=c0rVfzA6;
	dkim=pass (1024-bit key, unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=He60dgNY
X-UUID: e7044240d2a811f18dc8c9802ae25ab1-20261028
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=VHWFYUd5mMqzZ0QOcwiVDpqgCLp00VY6VZDF1RctTbM=;
	b=c0rVfzA6tR1JbSJkTOeJ4cLWra2blhEgqiPQzQVreiSsfA9h4CSfksuOf0plcAO/BUZiQftTjXUZMqfPHCwA+m38ysdSWW3zhnXAIgkA06nmZznk8qFawkp2tJqU1P7v6qfwkHDMLLw5m1YpnJa78P52Mt5YG85tTWIrgG/Yeyg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:08ba02ef-996b-4dbf-8441-0f10328be145,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:291e20b,CLOUDID:0b5e83ce-02bc-447e-ab88-2baec399874a,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-
	1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e7044240d2a811f18dc8c9802ae25ab1-20261028
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 512067132; Wed, 28 Oct 2026 16:23:49 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 28 Oct 2026 16:23:48 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 28 Oct 2026 16:23:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GtF8gaEZw2ziuSeW3omsEwEVpa3tKCWlMlNhEdWF+BQcYA9levOnU45ngbJhmL/MSJ62crVFMoOu9nQoEyUZK3AYfLJejQTeDecGQ1lYTk2cdCxjk1pjK2shJ617j7shjR9asPvw4+FbnrV+rGynhIIFinzbmJnI/MY4EQGDnnFnVtOjCLFx1cgknA1P0EeYVETaoujYblqpr4bTy3VYYuDQG970RA+kiDmfYYsw151a28q22iEJdcbx+RhRJp0CO4PZfvhccr24KVcbigmtNzB0/fHCwRMeUGsaYEQXJGxijt9kzf63g+ixyazcswTleUlStQnmQwxeG/obwtuktA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VHWFYUd5mMqzZ0QOcwiVDpqgCLp00VY6VZDF1RctTbM=;
 b=wHgxol4fp106WHlCNWhI08wegawcmlcWT9XWaxB75dyYHShIgO3MC8o2R9Vk1oOdXsWtqr4EvdoBy/ifyxAfF/PYhNb3d6zKz0RT9Fy+aVqnYqIXdLQPYAeDG1763Pezw5YOMJIC1RTK28+m+EVc1Dgrzz51FlTwlKjNmXFqnFXP2XFVjKG/LVbZTTdu3BVkulpk/vfV3+GtM3cdZLmDNckSRmdqwOsVxA/SbYFCoizI1xxvOdd/e47lNX1IjXGJXzf1K9Zsos8wU7su7S1SF11X7kiE9DZ5vxy7VvdPP1Q1b3fBK1Ek3oqQDxTQezpBJqOEEj77voKGefyzX3Qd6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VHWFYUd5mMqzZ0QOcwiVDpqgCLp00VY6VZDF1RctTbM=;
 b=He60dgNYLIVFZx5xzNJBcP2JLD80PQ9/TTmfaoDlOEX8HBrhKvFA6lgB7KGOwoArbsAVsP2X7A4ca+M2LtmMCkWoZaKZalgOvYks+0GKjBqb36QeR4gCpVdihtadJKsEs2e6es97XMVYQ2UcH01G65WkUdBEJDhz9qGjLSE2kmA=
Received: from KUYPR03MB9902.apcprd03.prod.outlook.com (2603:1096:d10:91::20)
 by KL1PR03MB8259.apcprd03.prod.outlook.com (2603:1096:820:113::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 08:23:45 +0000
Received: from KUYPR03MB9902.apcprd03.prod.outlook.com
 ([fe80::9598:2e59:20dd:960b]) by KUYPR03MB9902.apcprd03.prod.outlook.com
 ([fe80::9598:2e59:20dd:960b%5]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 08:23:45 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "tzimmermann@suse.de"
	<tzimmermann@suse.de>, "simona@ffwll.ch" <simona@ffwll.ch>,
	"mripard@kernel.org" <mripard@kernel.org>, "kernel@collabora.com"
	<kernel@collabora.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "maarten.lankhorst@linux.intel.com"
	<maarten.lankhorst@linux.intel.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "airlied@gmail.com" <airlied@gmail.com>,
	=?utf-8?B?SnVzdGluIFllaCAo6JGJ6Iux6IyCKQ==?= <Justin.Yeh@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
Subject: Re: [PATCH v2 11/46] drm/mediatek: Create new mtk_drm_legacy and move
 deprecated code
Thread-Topic: [PATCH v2 11/46] drm/mediatek: Create new mtk_drm_legacy and
 move deprecated code
Thread-Index: AQHdE4Zjkrn63Db3vEmP1GtKyKmmJrcTRD0A
Date: Wed, 28 Oct 2026 08:23:45 +0000
Message-ID: <da7cb2c67e6170eb552b79eeba89e12aa7075703.camel@mediatek.com>
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
	 <20260714114414.184512-12-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-12-angelogioacchino.delregno@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KUYPR03MB9902:EE_|KL1PR03MB8259:EE_
x-ms-office365-filtering-correlation-id: ab3cf838-23ae-4983-26b5-08df34ccc888
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|42112799006|366016|23010399003|1800799024|7416014|376014|261021121427099003|261021123027099003|261022105027099003|56012099006|10067099003|261026140227099003|6133799003|18002099003|22082099003|4143699003|11063799006|38070700021;
x-microsoft-antispam-message-info: zXGO+Jh9uJZLHIgtzNqnbhleOMPUouvtYicw8KnDzJdnRHrU5QB/J4rRj7SqVgbz7m4/BGkjDE593/9ygYILLZtEMpymsY186pYGNLbrozT7qrknqCsA/EzvU6PRhCrlXMoxuaglKlm4Fq/c8oKuiZuMBby8KgJBbUdikU+3HHOkEkYQ6cebMDJNQTUC9aeedOlX0b+iOG0qxd1H2QSx3MIOD9ks0nmz51p/le+42+9o21GCy3kzaECpCRlNjw4hBDUyzjYRA6mamI2EUzp1gDiBdAIv2j5h351QwvXZh868COKFrWcLCdjEfFyz3tGuAYplqM7XVJto2W2olx/+AU9b4VUsevQX1cOYgHJJlEVF+1kJIWVKA9SecZ5Yyi90UerSBFbuvloarT8Y7x9z3HWCbgJlJ8o+7bauUp6UqH7zueJkQ2+qgKesx10qm5W1FZSdwqLD9nXPnMHrIe0fNl2KiHfxA4z1a7YiJtinex+vhDRJYLFerSo/zGCt5E5pQRooFbKPOL4+bLu9bBg7ccPRDauo4Fpj2V6XcpwGqUFGRCd3gxbcozpKvz+zdQD9g7y4a1gy0l8ADuS8rzSR8Osc6vEO8j/V5R0lYsYIOayc5L/XQgSTsB6gJqAaYsJoYLgGnA47hhH2baeFtSyMUB9o1m+1rjLOXvo3CtHlETptB/FGsAcWp8E64mTyDVNHKO9Yc/H6HKTD6SmKSSqee7IIWXrNIggdjJ3RaAT9/hA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KUYPR03MB9902.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(366016)(23010399003)(1800799024)(7416014)(376014)(261021121427099003)(261021123027099003)(261022105027099003)(56012099006)(10067099003)(261026140227099003)(6133799003)(18002099003)(22082099003)(4143699003)(11063799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a1VpREJzT0t1WkNVdzlad1FMWi9xWlN1NnZSRVVYL3NtUmlkNWVuMThLKzZy?=
 =?utf-8?B?NG9uZEk4Ym41N3d1YUh5VW5Rd2Z3cTBYbTZVQTVwOG9qTTQ0RDVPSk5JdklI?=
 =?utf-8?B?SE9kR29xNVJ5dUdHZ0RGRjRuTlRYa0ZDR1FNU0NSUFVEZ1RvTHBSNDVPYzYx?=
 =?utf-8?B?a1ZOTSt0cXBTYWFpbmNWNURUeWZYVDF6TEJ4RlkxMVhxVjFiVGo3LzV0Vm1u?=
 =?utf-8?B?WE9aVHNmdWtKVTAvNzY0UVliTVZkU09hNE9kQzB4cXpWaG9JL0NtTE8vMjB6?=
 =?utf-8?B?S3Y5VzVlME1hWjhEOHRwUkliNTV3c01zNXNjVG1CMlp5Z2JoNlRYMTFTYTJz?=
 =?utf-8?B?dVUyTmdjaGZ2OTVoSzRxcm9Ba0E3OXo0RS9CMGxSaG14ZDFzdHQ2VFBCL0hl?=
 =?utf-8?B?d29RT25CUHlzb0JtcnlnSU0wRzVNUC9WUkdpWEpiU0dxazZGMVJYRDJOVGJ2?=
 =?utf-8?B?VTMvS0JSdGQ5MytrZ0NhSHBmakZzd1dybEJFT2lXUHhDTWxKbjdaamltaEVC?=
 =?utf-8?B?M1AyM3NzYkgvbUZzdHZyeU1FbHZ2TjVmTktZTTlsVmZMSlViM1RwQ25SeThm?=
 =?utf-8?B?N1EvV3pQKzl5NEtNMlJmSXJVY3h4bVMwR0ZwL2pMVXFIVlU1azZDcWpZbUlG?=
 =?utf-8?B?dXZWMHNEamhlam8zN1Z0WFZhK0xuQXc3UjJhMWROU1BkQWpKeDRFUEtnVEpP?=
 =?utf-8?B?TlZNYTcxODRZYVZEcXA4WDlGUXNvMGdoTFdXNG1WY1dXN1Yvakg2WVQxdGRi?=
 =?utf-8?B?d3A1Q3NvNDJGQityUkYvRE5EdzBIZUN5clZIOFFZeHc4cUJZSytFNWFYWXVw?=
 =?utf-8?B?TUhSbkV1K2NzaG8yK2Z2NS9zT1FqcVNvOGhsUFZ4clpveUJocEVTQklmTGdR?=
 =?utf-8?B?dXNGcFRJMWJ4eU45VEZUQWFLYmFQSktYM2VNN1VOYnBBWktZRlFkTjRlZ3ow?=
 =?utf-8?B?M2lCSExRTWZBOGovUWtBOGlrY0Y3UE5VTVU4UGlybDRmeGRUbTMvb3ZaUG9K?=
 =?utf-8?B?QmliSFhMUzJTT1N4ZDVxVG1pSUxDSy9xNUpxM3FVVGR0SU9UdmcvTThLWm1n?=
 =?utf-8?B?THBueVlBbUdUVjgvaXRjSWFQZUJLTEZxWnZMOUk4VnBHOVBJZ1M3Mk1nZUZy?=
 =?utf-8?B?UUVMTWoxRlpPck45cHNtWkloTUd6TEg5ZVJNLzhNenlxWmtwSERuaGxZYkZt?=
 =?utf-8?B?SDFjWlVVOWk0cXQ2cmVKRDh2SGF6MWYrQm5uK3hsL080OGlEekE0UkxWTzdN?=
 =?utf-8?B?QklSS2sreXZjWlJ5WWtmdVc4M1hrNG5Jdk1MREduTDVJTDJITWZ6M1RtQTgw?=
 =?utf-8?B?Wkw0aFgwZitmUEltN21nVVBGR3hpT2JZMHJuTm5EendGRTZ1dVN3WExINFRa?=
 =?utf-8?B?UHJSTHBsZGl6dlIzVi9zd2ZMWFBXd1RIR2MycW1FSHQyc3p1elRSS1ZQM1B6?=
 =?utf-8?B?OUNpcTVyVXlwdHZzVXhGNjNyMERsSUVudG51Ylo2Y1lWeXJmQlA3SFo4eElk?=
 =?utf-8?B?M0ZvamVQaHQzcGh0UDJJNmNYY2Z5NUloc3FMcTlBNXFwTlZXRGprdkdzM0ZX?=
 =?utf-8?B?eHFORHF5RHhhZDJZQUlaL3FCZjhMRjlnR0ZRaGE4YlpJa0xxbFZQTjlZVFll?=
 =?utf-8?B?alFBZ2NIblIwWDNpKy85K29nRkpZUVlhL1pyZkxMS3ZUTTZrT2hHeUNzZzVn?=
 =?utf-8?B?RnF4QkhPY2JUaVBxc3FvNDl0K2ErQ3pvbXY5MWlWNE1OVldkd21nMkJ4UDhE?=
 =?utf-8?B?K2FMMkhUb3A4WjJDSU9wU1pyZzhEYWxxZDU1STBlaGVxQW9sOG9rV0xtdmky?=
 =?utf-8?B?aFNTYUFybkJKYmFmVHRvQWpQRHZrbWxjN2RkT3U0aFJhMFB4WUxFTDRwcXFx?=
 =?utf-8?B?YkM5bXJCQ3dtNVg1OTJ4SVVxWkdZYkdvQnIva1MxSHNmZC9kQldZOHIwTHd4?=
 =?utf-8?B?TVpIWU5IY1cyNHBINVhZQUFyMXN4SGpPbVN5OWdiS21PK0Y2a0srYStEeHJs?=
 =?utf-8?B?QjdkYlFaSzdiWDV5N0RCaGVzWXhGSDFoY2Fka1VTSnFLZEtUMWpvSFVIUzg1?=
 =?utf-8?B?YUpRZGtsWWVCK2k3TXZGN1BvNkw5SDRwU05UTytFMWZCZXVkRzVMaDlpNnB2?=
 =?utf-8?B?UWcyQzEzOW95Y0U1WGJWS1hKZWFtS2VtaGdkWnlwbEg0NXNPQ3g0M01Uai84?=
 =?utf-8?B?OWN5OHM2ZFdTSmhtVzlXMFAzOG9QRDdhMVRkcUpXaTI3N3ErdktFcnRrc1pp?=
 =?utf-8?B?TS9hZmpsZWVTS0FCVzJ6Yks1di83RUVOYkw3RGhBTkdEbDVkUEpNM2l1UVdw?=
 =?utf-8?B?NVpGK2RMQ3FOdU5idVBZNksvSVVWZFAzU2VzUmlPZ241VlJyYjlFZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8DE9740F88E82447A7E7C2F2667C5D28@apcprd03.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: IPMjES9zJZc9lYeK/yiUmzI8LZg+PUX7RDw12C5TaZ5m+5llbh+Zj0uKnfZLrG4z8DxYQ96e+TehrElSCJK/YlZITM/dUnQ5eS0S/RW+duStVkbahgVnbCTNdIJP6A1NfHfbcWnBbEwkqGxZjrma5eL/Cg51UIJTrXNmc8HDNU1J3IpYEEvsr0yyYh0GilCXfe9whVPLAPtPgZ0mqW1QR8cjolIPddGoxEKmcP6Y3z1u56u43zDqupbDPicud2QdTVRUt9XDCj1qnCOGXWwRONCUrBe3FCugElMA5B5S2X5tKLXVbSmPO4Kxg3NzTuOasW8ReFbBcv3y7aFd0TnPDQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KUYPR03MB9902.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab3cf838-23ae-4983-26b5-08df34ccc888
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2026 08:23:45.1312
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sGvbLmaPvaN45ZZsnd+qBj7NxqA5LtqwDXe4/g8blVpYxbNi+JIAfvpYvtw43fzm8EhTCrJlrmN8t+AF4Ledug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8259
X-MTK: N

T24gVHVlLCAyMDI2LTA3LTE0IGF0IDEzOjQzICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gU2luY2UgbWVkaWF0ZWstZHJtIHNoaWZ0ZWQgZnJvbSBoYXJkY29kZWQg
cGVyLVNvQy1wZXItQm9hcmQgcGF0aA0KPiBkZWZpbml0aW9ucyBmb3IgdGhlIGRpc3BsYXkgY29u
dHJvbGxlciB0byBkZXZpY2V0cmVlIGdyYXBoIGJhc2VkDQo+IHBhdGggYnVpbGRpbmcsIHRoZSBm
aXJzdCBvbmVzIGFyZSB1c2VkIGxlc3MgYW5kIGxlc3MsIGFuZCB0aG9zZQ0KPiBhcmUgYWxzbyBk
ZWNyZWFzaW5nIGVhc2Ugb2YgY29kZSBicm93c2FiaWxpdHkgKGhlbmNlLCByZWFkYWJpbGl0eSkN
Cj4gaW4gdGhlIG10a19kcm1fZHJ2LmMgZmlsZS4NCj4gDQo+IFRoaXMgbWVhbnMgdGhhdCB0aG9z
ZSBiaWcgYXJyYXlzIGFyZSBhbG1vc3QgaXJyZWxldmFudCBub3cgKGZvcg0KPiBtb2Rlcm4gY29k
ZSwgb2YgY291cnNlKS4NCj4gDQo+IFNlZW4gdGhlIG5lZWQgdG8ga2VlcCBjb21wYXRpYmlsaXR5
IHdpdGggb2xkZXIgZGV2aWNldHJlZXMsIHRoZW4sDQo+IG1vdmUgYWxsIG9mIHRoZSBkZXByZWNh
dGVkIGFycmF5cyBpbiBuZXcgbXRrX2RybV9sZWdhY3kgZmlsZXMgYW5kDQo+IGFkZCBhIGJpZyB3
YXJuaW5nIHRvIHRob3NlLCBleHBsYWluaW5nIHRoYXQgbm8gbmV3IFNvQ3MgbXVzdCBiZQ0KPiBp
bXBsZW1lbnRlZCBsaWtlIHNvLCBhbmQgbWFraW5nIGl0IGNsZWFyIHRoYXQgaXQgc2hhbGwgZXhj
bHVzaXZlbHkNCj4gY29udGFpbiBsZWdhY3kgYW5kIGRlcHJlY2F0ZWQgY29kZS4NCj4gDQo+IEFs
c28sIGVzcGVjaWFsbHkgd2l0aCB0aGUgcmVzdHJ1Y3R1cmluZyB3b3JrIHRoYXQgaXMgY3VycmVu
dGx5IGluDQo+IHByb2dyZXNzICh3aXRoIE11dGVYIGZpbmFsbHkgZ2V0dGluZyB0cmlnZ2VyLXNv
dXJjZXMgc3VwcG9ydCBhbmQNCj4gb3RoZXIgY2hhbmdlcyB0aGF0IHdpbGwgZm9sbG93KSwgaXQg
aXMgZXhwZWN0ZWQgdG8gc2VlIG1vcmUgY29kZQ0KPiBiZWluZyBtb3ZlZCBpbiB0aGUgbXRrX2Ry
bV9sZWdhY3kgdGVycml0b3J5Lg0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVr
LmNvbT4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8g
PGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gLS0tDQoNCg0K
