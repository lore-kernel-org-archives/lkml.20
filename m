Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793776200;
	b=upV64oOBNxykyk59nQZ3sTx2jGbzI/vESEyJTDUMr7E1FPs23twDVddX0P24rP9h6qai
	 CdxZ5uLv+I8OTJs1pWGVBEOHP4WXn1P8IScUXXEUScj4yv8/uDuHbcPIJw/2D2Qx8d09p
	 1rExM1Q59vSK0muxCL06HWJq9Rx/dO9Yt7Fi8a1ilflXtTSKQatE8jMUuFTjwUUY0Yt+V
	 8corcp8mJd/oRJZVcX0S1/Q+j4q6EHmAx/s+K+GAPjzG9WWN45qWvb/VRligaqoQCwMuw
	 /gDLoo+Izu48fBf12oQElhkzLWhyUJXiBZEnqruRsYG9JXoPjhy1wPNQCTHx1zqhkFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776200;
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
	bh=YVLAnqKcw+AtrGzEbSBIdF2A5LWdI5gFIep/w3TDmTE=;
	b=n+Bh3UmUQ/CNciYcUbKH4DvfvBnJw7SeZWq1qbjSGa8D9rsIgqQgN0P/ZRWu9Iz/MH4D
	 fQpsf+kRzHUrQ5Y+dMRWCnXsjbAEdNSoN/gPCgYG4981sJV1Np5kuuBwgwsmUM9Rc2sQ5
	 d1n4EkvEqTzZMNtIcdyTlIPMdisfC+RIu5ptTLOK9DMtk+FWb8rjS5li0lfntP/Xk98Ta
	 P8jOfwPlwxUgBLN/FUhQOeVzBPGWxKHf3TGzkdC6iWY9NBKSfldjntJwrJ9xBvYOXAaHc
	 T3Al7Fo/Rk7hCfL2b7YCWpibbe2tuflZZcwShfnoJJxK/fAo7q2ol8JtS+5uqPiKILA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=D7N3pdcb;
	dkim=pass header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=gaCg4SgJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971E1606A31B;
	Wed,  4 Nov 2026 07:09:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 971E1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=D7N3pdcb;
	dkim=pass (1024-bit key, unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=gaCg4SgJ
X-UUID: bc47a9aed81e11f18dc8c9802ae25ab1-20261104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=YVLAnqKcw+AtrGzEbSBIdF2A5LWdI5gFIep/w3TDmTE=;
	b=D7N3pdcbDhVaAvcoSUzufgH+COvR94eZQTWsHeO2JmSLHznUe6TxHVMz91T0ggQyHlTDDpO7B7rvGeFpjwAyCcDHg7FMQwPGJPKIu22MMZ3Cx476/o7RkDqTmuV4hUE/YI92tmAYboMR99WQ0f++eAJ3+YS0iiCyMdcMQ4zycXA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:8f481254-af3f-4763-bc91-3134fa929624,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:58d2907f-3613-4bd1-a0b7-c3a1d3e04ced,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|136|836|865|888|898,TC
	:-5,Content:0|15|16|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,
	QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
	,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bc47a9aed81e11f18dc8c9802ae25ab1-20261104
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1217208261; Wed, 04 Nov 2026 15:09:54 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 4 Nov 2026 15:09:53 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 4 Nov 2026 15:09:53 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KTQ7gCntq+aYuX0oszipV9W67BczrA5sYMf/VJdy0GYDctddR6VqTFUgNVtBiFN2HlsPP9XmxNYW1zpKZ6RhMpTEAe3UgD2FAU8LQsrD37KCXqqHjYcIkpyiMwv/qFuguUYSR279S7ttmBVb4q1hZ6YxXjKfrNZ9lPwBZl/PY5y+JmHuc55H2A9tKvH1IanUtEhSWwlPtBIBLvePwjP6EeK75IkCN7i5dQS2/mD7pgEwV4P7WC2uYFpAldydqyS4N+IcLI5G8HVgN5OX4+Gq3h6RbO9JhBELZdi3jxCwmF5bVasl1I+tWzA1MdYl8ZgBLzC5M8riQ2Yig643u6fo3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YVLAnqKcw+AtrGzEbSBIdF2A5LWdI5gFIep/w3TDmTE=;
 b=c357RT8w9ZnoPPv5HouAS27KWKS1s/cA5MmK25LvsGxn3FFR/2VDsqclgFjmbXRIhV7RVDGqynRHFt5O6UpqHM5XihImYNKM3M58rfidaEm6sPyKBkdxlRT3fj6mDyjAjZRuZmsQzJh8TCMlb2bN2C/VHcoL/ivxMUCD1vSavnKo0J7/AyIHdn1SkhriaDy+KG5ppj126NB+47aFWCxmcJpz5F5/8ganSkGd0wiRU2ihqWdVqeNSGBd9cmQzYKbK037rvUv6SrV4cvifBcDPMHZ+zOA8mzumFjzR36ZNn6b7pKDy5Ri5yPEUK9QszVceXDmCb9aRuiNMpXRWzffELA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YVLAnqKcw+AtrGzEbSBIdF2A5LWdI5gFIep/w3TDmTE=;
 b=gaCg4SgJuu+5VkgiWQz5T1mvD+3crw8DskH3krIwsvJQYthSiFr5avJDP3Q/B/zT/7owhBbzR9g6A4ItVCaIrh0M2PU2PpwS/QYV2fDPOit9y0t1ptCnJj5u3pL8Cg8WrrZts3CSNHuDPbyMGjOyiYv4FGJekrwGmn6v6F2M+GU=
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com (2603:1096:604:471::11)
 by TYPPR03MB9543.apcprd03.prod.outlook.com (2603:1096:405:384::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 07:09:50 +0000
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02]) by OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02%5]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 07:09:50 +0000
From: =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
To: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"westeri@kernel.org" <westeri@kernel.org>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "YehezkelShB@gmail.com"
	<YehezkelShB@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "andreas.noever@gmail.com"
	<andreas.noever@gmail.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 4/4] thunderbolt: prevent pcie tunnel activation/teardown
 warnings
Thread-Topic: [PATCH 4/4] thunderbolt: prevent pcie tunnel activation/teardown
 warnings
Thread-Index: AQHdaEhNhyk5DpKRske6fm6wB0rq+rcVyIgAgAZDAQCAAEc1AIABM6aA
Date: Wed, 4 Nov 2026 07:09:50 +0000
Message-ID: <1dc9e15cdc03e4084eacc45d1c2c90f17e6c47e5.camel@mediatek.com>
References: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
	 <20261030082539.1208733-5-chunfeng.yun@mediatek.com>
	 <20261030085628.GS158991@black.igk.intel.com>
	 <82f1a3227685b241938ccb500b97d1e73212bf36.camel@mediatek.com>
	 <20261103124842.GA158991@black.igk.intel.com>
In-Reply-To: <20261103124842.GA158991@black.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSNPR03MB9677:EE_|TYPPR03MB9543:EE_
x-ms-office365-filtering-correlation-id: 8c60a64d-45d9-4c06-e394-08df3a429dff
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|38070700021|11063799006|4143699003|56012099006|261021121427099003|261009223027099003|261022105027099003|261102123227099003|261026121527099003|261028144727099003|261026140227099003|261022075727099003|10067099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info: a3RYHo9TR0nvGkD9Ysm0w3KUObtLpj3d/CopdkDnoEpZNAd0rjw9OOJlsrAipKflZuOwIHgV456HEJa/ZTG+Rar7vB688X1Ez/nBlvw9MAB8PHMN3zEdq9yTki1Af5ueuY1U/n3FG5X76ZFupn3tU+mWgDMzaknWHaO/fcONMoZpeqCuzqsqmaF4IKcD9do//EvUc/suSDuNHV9G83ZAipG1Dfd71Ek3EzAP8T8WKZVSETQggnUPRwxEDHTOZMmdEhwT9TTmyl83z9/u4HXEqjAPgZwD2z/3DRFnrkuIPRFSM1qGnsYyokPZMHEgq7hjtHQLn0r11REcBZObppBK4kU6UOYeyfcYFuroFCIOhDtZHewm43ejHvAv05B1C8veQiAhZgWdSZhwHA9amcoD0HeG/NMvOhHBSsWT2IJwf3Ex/rtxuCVBjnhGiBb0EfByaet6itu67D5G6AWD4362a6KGJvGUiRNx6J2Xr1otjcHZloiYhNn30W0Oe3Zl6uInXajIHZozMxMmb00ZSjXsQyzo0w4wH8MXj401m//7kG/sMeWWLqIbMTh5gxCOTN6uBEIeRatL3hNcA5jUVYCNa2RHKQ5F6uFfP2da7zW78yEsGQ0SdGt422G/it1VDO2gR3D1IdLJJjI4S9sfwD1wNTMZ5JTjFqr0RQVrWodiJZ2IpPmbI6VNOBa3gIw97he85/mmtdBnkaXpDQjmbHJuxbQ5kIUOuyKDoOwXS0XIOMs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSNPR03MB9677.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(38070700021)(11063799006)(4143699003)(56012099006)(261021121427099003)(261009223027099003)(261022105027099003)(261102123227099003)(261026121527099003)(261028144727099003)(261026140227099003)(261022075727099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YVNFUWYzRGhZQUVFc0xTd0xjUmtVSzlkeUY1R0EwbVNWWXRDdXhEelFRSm9j?=
 =?utf-8?B?VGIvOVdhWGllWWFveVc1bFE1bVZmQkVtYzBTSW40amVPVW1kZW1IUjlmZlVp?=
 =?utf-8?B?dTRaaFNteS9RazgycUV1cTk5dmZEc1BuaEZES01saGFQVHBReFNnUWdIR3V1?=
 =?utf-8?B?TUhZbngyU2RhOXgzZXk0YlA4RFRqS2ljUEpBRFpETHkrSHdaSlZYK0lORXdT?=
 =?utf-8?B?a2JuVnpuYmhSMUdSb1huQ0d0U0wrZEkvaElZRmZFZ3pHY0hoaEF6anBkb2Yw?=
 =?utf-8?B?cFVFU2JndWNRSzVTNS85NlcxL3laWHdsOUlGUHNXa2E3VXZhc3FYVnN4QW1r?=
 =?utf-8?B?bWxWK1Z1eWNQSmIyRkpzSmJjeElGdFVGTjdjVU1NUDUxRFhjRFhkTGVMVmxD?=
 =?utf-8?B?MGhuK2crMC9FWjBKa1JOdVBJRTZocTFIZUc0VEoyUnZ2bXF2cUo2NSt0S2xL?=
 =?utf-8?B?TXRVbWVmbDlBNUMzZWd0UW9ldE9QN1RmbnBiaUI5bk12RWZrcy9HdGtwVHRB?=
 =?utf-8?B?bk5IUy9EQlQ5dUpTZUZGU3dpTFJSaG1TSTdvN044OXlYakI4MkxydEZjLy9R?=
 =?utf-8?B?Uys2cTZnNnlMT0FJMlRzTUc3MU1WU1ltMGRDTVRSYWN0QUhDTjBGTkRwR0Vm?=
 =?utf-8?B?cDl2ZGJ5Wis2U0RTdFJMZjFVZUFjR29lbEdScGlUSjU3ZURwNzlUM0xtR1Fi?=
 =?utf-8?B?TmpWNExBZmx3T1hrS05xWGY5UENNdk9RNnlta3F5TThLcEtHV00wc0E1T2Uy?=
 =?utf-8?B?Ty9VVGx4azY5SE5MZzAvY25YenBzMjc1RFJ3OFNISzlXWk9CeGZOcFpYbEI4?=
 =?utf-8?B?T3B3bzExT093NmFVK2lyOXpXbEY2aFNrd25qWnFtcSthSzV1Nm1KRmtJOWlX?=
 =?utf-8?B?cGFOQ1dBMjZPcUtQczJpaDZRYzdqL1YwYjJXdS9BU3VlMW5pait1dHVvNUc4?=
 =?utf-8?B?ZnVPVzErNVhmcnlsck1HcS81VC9mbWpzYjMxL2RSUitkSGhnYkpxejFBNjV3?=
 =?utf-8?B?WnFRdm5VZlpNOEpoN1Zjb2xzWjhzeDlZQWV5Z0l0KzFMMHd0c0hVUjNQOWFQ?=
 =?utf-8?B?RHB0YnJkSTh3cFhCV2lLTEdUN0Z0NkcwTUdXZVovdWw3cHJ4bnVETkdJQzlk?=
 =?utf-8?B?RytOb0w2NFNOZEJhZWJSR08wdnhESUlyelU5OVVCc1F5WElpZWEyZloyVVhG?=
 =?utf-8?B?UHJZNW5CWlJlbjZPeUZZTVo0b1NGc3E1dThOL1FIOVF3NU94T3phSk5memdP?=
 =?utf-8?B?dGdtUnFmdW1HNUQ0amZhakxRMTRDS21wMXY1ZG9JWG1SQ2RsZnFhUzhVMmdD?=
 =?utf-8?B?ZCt1TExQd3FyeHIyNTl5eGhac2FxbUpnRVh5cXlNcUdKNlEvai9rcTdIV0o1?=
 =?utf-8?B?UDRQSmcrVjNoM0ZNY21Ba3NybVJIN3NXVVFjQ0xESDU0UW9TZjNJZmxINk5J?=
 =?utf-8?B?cjhhZmRrRlNORFQvMnBOWFVCZTJINk9Ob2l3QnJlbDNlRFA3eGJpVkp3SHpy?=
 =?utf-8?B?RGZvVzAwakNCaGlqOUpWY0twdE5uTjY1RkVtaGVLRUppT25uNms3L3lWRUVv?=
 =?utf-8?B?aEZmNVlNNHdRUTFCMWtqTnptb1Q3aGcvbmxBdGVISHpNNytsL0crY0RHeEdt?=
 =?utf-8?B?MVlJQnNVNFVGU1Nka2JuL3hJOWF3T0Q1RFBKaC9lVGRRekVZWmwrT1IyRlRn?=
 =?utf-8?B?WW91ZXJzT1BZMHI4dmttWmY3b0hDTGZvelp1aTJzRTBMUW51SjhlUXhpamFM?=
 =?utf-8?B?a3MxZHhCMUg1MXJ6cklEZUhMV2cydExQWWdzc0tnaUFhT1FCQ2I1b1FicEZx?=
 =?utf-8?B?TUE5R1JLMlFuL2drVVNaNVVZbm15TFZ1VlZRTXd3QkQrQ25SYWlYT1FXSUIv?=
 =?utf-8?B?UUpSd3ZsZElQY2N5YmdVMDhoUnkxbEFLc2M3cjNaV3ZRak1ha3hvcHF3WEpU?=
 =?utf-8?B?OVpBSVlCRkdPQ2hyYlo5Qy82c01SRThmNkJ2eXNBTXdldy8vQVEzcCtjZklu?=
 =?utf-8?B?bk5vRXlCWEx2Sy9TUWl6TXVFV0RvejhtMlhQSkhzckROSFd5QjhxdTRwR3ds?=
 =?utf-8?B?RGY5SG5hT0hmazhVMTJXaTZVZFByZWdaRFgybnRhRXRSMkpYWXZBZmV5eXI1?=
 =?utf-8?B?RjJ3MHpJWWZ4amE2U3FKZ01uSEgwTW5aL3ZJejZUOGs2RzZjTWNPd2RiV29l?=
 =?utf-8?B?b2RrcmNEejlyaHlDM0tBUmthVlZtVmovSC9lWHFsRjNOY2NDNStET05VWDd4?=
 =?utf-8?B?OHdRa0FOSlBDa0p1dXJOdXR4R1pUWSs1VEpyWWhYRmRTY2pJR2krWHkwSERl?=
 =?utf-8?B?bkxrQXE2TCtVK0JDQWIrbmFwZWZpNkpjZ0dmS1ZvZXozdSt6NHVwY0psNlp4?=
 =?utf-8?Q?kcbQyOD0slVW/Px4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AA0CCD714723894C8F5926195EEF7A5A@apcprd03.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: bgoSgQ5+S3TwHpOy5r3qGXeR4HBJSpW5m1QtabcPW1VU9I4r4jR7r06Si+FOMy8LQOx4wOgEB1a1n569nhVBgJC76LWmJuPHmrAVvOf6zebdNeHZZoKSM8EqWj4VBchwQRGaPCmArvEzDO0346wcK9dBR07KXc8vAe6Za2zTBtVEDbntQfjsqHDKzJrGvM6FEWqcztDUp8qwYrY2U4+k7SN4TQ17AYqkhVkfpVLmNM8RHQsz0+Fm31FpskMnqUEjBX6way1/UZbb5u8YfyAoKJcjOnXiSMYkZsEf4sHZg285UGJVpNp36ZsmY40D4mOMk8g2wKI2X6RhAKFRBlF6Ng==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSNPR03MB9677.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c60a64d-45d9-4c06-e394-08df3a429dff
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 07:09:50.2893
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iGkrTzPOhXJgfGcDrBK2EZ7m1d8y6KfSezHURYVpJjAUThiSEee5pMxz1PYKKZqn3xgd44UF/87+ul0hAKw1iRrpLck5gSz+3ddfiYasFU0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYPPR03MB9543
X-MTK: N

T24gVHVlLCAyMDI2LTExLTAzIGF0IDEzOjQ4ICswMTAwLCBtaWthLndlc3RlcmJlcmdAbGludXgu
aW50ZWwuY29tDQp3cm90ZToNCj4gSGksDQo+IA0KPiBPbiBUdWUsIE5vdiAwMywgMjAyNiBhdCAw
ODozMzo1MUFNICswMDAwLCBDaHVuZmVuZyBZdW4gKOS6keaYpeWzsCkgd3JvdGU6DQo+ID4gT24g
RnJpLCAyMDI2LTEwLTMwIGF0IDA5OjU2ICswMTAwLCBNaWthIFdlc3RlcmJlcmcgd3JvdGU6DQo+
ID4gPiBPbiBGcmksIE9jdCAzMCwgMjAyNiBhdCAwNDoyNTozOVBNICswODAwLCBDaHVuZmVuZyBZ
dW4gd3JvdGU6DQo+ID4gPiA+IFdoZW4gdXNiNCBlbnRlciBzbGVlcCBtb2RlLCBlY2hvIDEgdG8g
YXV0aG9yaXplZCBvZiBzeXNmaWxlLA0KPiA+ID4gPiB3aWxsIHdha2V1cCB1c2I0IGRyaXZlciwg
YnV0IGZhaWwgdG8gY3JlYXRlIHBjaWUgdHVubmVsLCBjYXVzZQ0KPiA+ID4gPiB0aGUgd2Fybmlu
ZyBkdWUgdG8gYSByYWNlIGNvbmRpdGlvbiBiZXR3ZWVuIHN3aXRjaCBkaXNjb25uZWN0DQo+ID4g
PiANCj4gPiA+IEl0J3Mgcm91dGVyDQo+ID4gd2lsbCBtb2RpZnkgaXQuDQo+ID4gDQo+ID4gPiAN
Cj4gPiA+ID4gZHVyaW5nIHJlc3VtZSBhbmQgdXNlciBhdXRob3JpemF0aW9uDQo+ID4gW8KgIDI3
OC44MzExODZdIHVzYjRfaGkgTlZEQTgxMDA6MDA6IDA6MTogaXMgdW5wbHVnZ2VkIChzdGF0ZTog
NyksDQo+ID4gcmV0cnlpbmcuLi4NCj4gPiBbwqAgMjc4Ljk0MzAzMV0gdXNiNF9oaSBOVkRBODEw
MDowMDogMDoxOiBmYWlsZWQgdG8gcmVhY2ggc3RhdGUNCj4gPiBUQl9QT1JUX1VQLiBJZ25vcmlu
ZyBwb3J0Li4uDQo+ID4gW8KgIDI3OC45NTExMjVdIHVzYjRfaGkgTlZEQTgxMDA6MDA6IDA6MTog
bG9zdCBkdXJpbmcgc3VzcGVuZCwNCj4gPiBkaXNjb25uZWN0aW5nDQo+ID4gW8KgIDI3OC45NTc4
MTldIHVzYjRfaGkgTlZEQTgxMDA6MDA6IDA6NCA8LT4gMToxNiAoVVNCMyk6DQo+ID4gZGVhY3Rp
dmF0aW5nDQo+ID4gW8KgIDI3OC45NjQ3OTRdIHVzYjRfaGkgTlZEQTgxMDA6MDA6IGRlYWN0aXZh
dGluZyBVU0IzIERvd24gcGF0aA0KPiA+IGZyb20NCj4gPiAwOjQgdG8gMToxNg0KPiA+IFvCoCAy
NzguOTcyNzM3XSB1c2I0X2hpIE5WREE4MTAwOjAwOiBkZWFjdGl2YXRpbmcgVVNCMyBVcCBwYXRo
IGZyb20NCj4gPiAxOjE2DQo+ID4gdG8gMDo0DQo+ID4gW8KgIDI3OC45ODA1MDRdIHVzYjRfaGkg
TlZEQTgxMDA6MDA6IDA6IFRNVTogbW9kZSBjaGFuZ2Ugb2ZmIC0+IGJpLQ0KPiA+IGRpcmVjdGlv
bmFsLCBIaUZpIHJlcXVlc3RlZA0KPiA+IFvCoCAyNzguOTkxMjY1XSB1c2I0X2hpIE5WREE4MTAw
OjAwOiAwOiBUTVU6IG1vZGUgc2V0IHRvOiBiaS0NCj4gPiBkaXJlY3Rpb25hbCwgSGlGaQ0KPiA+
IFvCoCAyNzguOTk5NTExXSB1c2I0X2hpIE5WREE4MTAwOjAwOiAwOjE6IHRvdGFsIGNyZWRpdHMg
Y2hhbmdlZCA2NiAtDQo+ID4gPiA2Ng0KPiA+IFvCoCAyNzkuMDA2NDA4XSB1c2I0X2hpIE5WREE4
MTAwOjAwOiAxOiBsaW5rIHdpZHRoIHNldCB0byBzeW1tZXRyaWMsDQo+ID4gZHVhbCBsYW5lcw0K
PiA+IFvCoCAyNzkuMDEzNzYzXSB1c2I0X2hpIE5WREE4MTAwOjAwOiAwOjcgPC0+IDE6OSAoUENJ
KTogYWN0aXZhdGluZw0KPiA+IFvCoCAyNzkuMDE5NTg3XSB1c2I0X2hpIE5WREE4MTAwOjAwOiBh
Y3RpdmF0aW5nIFBDSWUgRG93biBwYXRoIGZyb20NCj4gPiAwOjcNCj4gPiB0byAxOjkNCj4gPiBb
wqAgMjc5LjAyNjQ2OF0gdXNiNF9oaSBOVkRBODEwMDowMDogMToxOiBXcml0aW5nIGhvcCAxDQo+
ID4gW8KgIDI3OS4wMzEzMzVdIHVzYjRfaGkgTlZEQTgxMDA6MDA6IDE6MTrCoCBJbiBIb3BJRDog
OCA9PiBPdXQgcG9ydDoNCj4gPiA5DQo+ID4gT3V0IEhvcElEOiA4DQo+ID4gW8KgIDI3OS4wMzg1
NDZdIHVzYjRfaGkgTlZEQTgxMDA6MDA6IDE6MTrCoMKgIFdlaWdodDogMSBQcmlvcml0eTogMw0K
PiA+IENyZWRpdHM6IDMyIERyb3A6IDAgUE06IDANCj4gPiBbwqAgMjc5LjA0NjUzNl0gdXNiNF9o
aSBOVkRBODEwMDowMDogMToxOsKgwqDCoCBDb3VudGVyIGVuYWJsZWQ6IDANCj4gPiBDb3VudGVy
DQo+ID4gaW5kZXg6IDIwNDcNCj4gPiBbwqAgMjc5LjA1MzgzNF0gdXNiNF9oaSBOVkRBODEwMDow
MDogMToxOsKgwqAgRmxvdyBDb250cm9sIChJbi9FZyk6DQo+ID4gMS8wDQo+ID4gU2hhcmVkIEJ1
ZmZlciAoSW4vRWcpOiAwLzANCj4gPiBbwqAgMjc5LjA2MjI1OV0gdXNiNF9oaSBOVkRBODEwMDow
MDogMToxOsKgwqAgVW5rbm93bjE6IDB4MCBVbmtub3duMjoNCj4gPiAweDANCj4gPiBVbmtub3du
MzogMHgwDQo+ID4gW8KgIDI3OS4wNjk3MzBdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0t
LS0tLS0tLQ0KPiA+IFvCoCAyNzkuMDc0MzM1XSB1c2I0X2hpIE5WREE4MTAwOjAwOiBQQ0llIERv
d24gcGF0aCBhY3RpdmF0aW9uDQo+ID4gZmFpbGVkDQo+ID4gW8KgIDI3OS4wODA0MjZdIFdBUk5J
Tkc6IENQVTogNSBQSUQ6IDI0MzMgYXQNCj4gPiBkcml2ZXJzL3RodW5kZXJib2x0L3BhdGguYzo1
ODcgdGJfcGF0aF9hY3RpdmF0ZSsweDFhNC8weDViMA0KPiA+IC4uLg0KPiA+IFvCoCAyNzkuMjIw
Mjg1XSBDYWxsIHRyYWNlOg0KPiA+IFvCoCAyNzkuMjIyNzIyXcKgIHRiX3BhdGhfYWN0aXZhdGUr
MHgxYTQvMHg1YjAgKFApDQo+ID4gW8KgIDI3OS4yMjcwNjhdwqAgdGJfdHVubmVsX2FjdGl2YXRl
KzB4MTQwLzB4NDk4DQo+ID4gW8KgIDI3OS4yMzEyNDFdwqAgdGJfdHVubmVsX3BjaSsweDE4MC8w
eDQ5MA0KPiA+IFvCoCAyNzkuMjM0OTgwXcKgIHRiX2RvbWFpbl9hcHByb3ZlX3N3aXRjaCsweDc0
LzB4YjANCj4gPiBbwqAgMjc5LjIzOTUwMF3CoCBhdXRob3JpemVkX3N0b3JlKzB4MjE0LzB4Mjcw
DQo+ID4gW8KgIDI3OS4yNDM0OThdwqAgZGV2X2F0dHJfc3RvcmUrMHgyMC8weDcwDQo+ID4gLi4u
DQo+ID4gW8KgIDI3OS4yODg4ODhdIC0tLVsgZW5kIHRyYWNlIDAwMDAwMDAwMDAwMDAwMDAgXS0t
LQ0KPiA+IFvCoCAyNzkuMjkzNDk3XSB1c2I0X2hpIE5WREE4MTAwOjAwOiAwOjcgPC0+IDE6OSAo
UENJKTogYWN0aXZhdGlvbg0KPiA+IGZhaWxlZA0KPiA+IA0KPiA+IA0KPiA+IHJvb3QgY2F1c2U6
DQo+ID4gDQo+ID4gVGhlIHdhcm5pbmcgd2VyZSBjYXVzZWQgYnkgYSByYWNlIGNvbmRpdGlvbiBi
ZXR3ZWVuIHN3aXRjaA0KPiA+IGRpc2Nvbm5lY3QNCj4gPiBkdXJpbmcgcmVzdW1lIGFuZCB1c2Vy
IGF1dGhvcml6YXRpb246DQo+ID4gDQo+ID4gwqDCoCAxLiBXaGlsZSB0aGUgc3lzdGVtIHdhcyBp
biBydW50aW1lIHN1c3BlbmQsIHVzZXJzcGFjZSBleGVjdXRlZDoNCj4gPiANCj4gPiDCoMKgwqDC
oMKgwqAgZWNobyAxID4gL3N5cy9idXMvdGh1bmRlcmJvbHQvZGV2aWNlcy8wLTEvYXV0aG9yaXpl
ZA0KPiA+IMKgwqAgMi4gV3JpdGluZyB0byB0aGlzIHN5c2ZzIGF0dHJpYnV0ZSB3b2tlIHVwIHRo
ZSBVU0I0IGNvbnRyb2xsZXINCj4gPiAobmhpX3J1bnRpbWVfcmVzdW1lKS4NCj4gPiDCoMKgIDMu
IER1cmluZyByZXN1bWUsIHRoZSBkb3duc3RyZWFtIHBvcnQgMDoxIGZhaWxlZCB0byBjb21wbGV0
ZQ0KPiA+IGxpbmsNCj4gPiB0cmFpbmluZyB3aXRoaW4gdGhlIHRpbWVvdXQgYW5kIHdhcyBkZWNs
YXJlZCBsb3N0Og0KPiANCj4gT2theSB3ZSBnZXQgdGhlIHdhcm5pbmcgYnV0IHRoZSBiaWdnZXIg
cHJvYmxlbSBoZXJlIGlzIHRoYXQgd2h5IHRoZQ0KPiBsaW5rDQo+IGRvZXMgbm90IGNvbWUgdXAg
YW55bW9yZT/CoA0KWWVzLCBpdCBpcyBvbmUgY2FzZQ0KPiBVbmxlc3MgeW91IHVucGx1Z2dlZCB0
aGUgcm91dGVyIGFzIHdlbGwuDQppdCBpcyBhbm90aGVyIG9uZS4NCg0KaWYgdGhlIGRyaXZlciBh
bHJlYWR5IGtub3cgdGhlIHJvdXRlciBpcyBkaXNjb25uZWN0ZWQsIHdoZXRoZXIgc3RpbGwNCm5l
ZWQgdG8gbG9vayB1cCB0aGUgcGNpZSB0dW5uZWw/IGl0IHdhbnQgdG8gZG8gaXQsIEkgd2lsbCBh
YmFuZG9uIHRoaXMNCnBhdGNoLg0KDQpUaGFuayB5b3UNCg0KDQoNCg==
