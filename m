Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794363388;
	b=xCHMfank/10SzP7lSi8eP4r4VYzSKJE8EkLnEiAEQQJ7wrKl02ZtVdUOvH1OwCstgBOL
	 zqwInh97Ngu4+b4DaKmtLKwNqZxbcqTYLJktGqtwUn+DGkl9ns6u4eMDH6wSthwr3YBAI
	 NvF3ko7fFyXGrqyFi3ZgfkFwqKblgEieW/rzoBsDWpCIU76sAbetBNY8GeQpLkW/mfQ80
	 rXqCMlPdfiBSBRES6H0UL66z8J/roaW2T4yJH4z9Fnv2QcKWSmMiTIEC+v9TzQJMeFhBd
	 /531+kg+D52MTanD052W4QuBungPFf+3VosxtyV40K+m5nhS2joqei1kP+3gcypaftQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794363388;
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
	bh=Zjj+1YaXEFcwROJrdQp0HTprLIiye2lIg1ePDQrkiXg=;
	b=pmvMo5wMRV0zIC36DRdQNa/eb++YElU2d1GQoOebxXyTV8ZJ5GSOmAp8uwQyDjGerqnD
	 uz98p6R+dpQzT483BZ0MT6M9R6BXgt0juQhomNdSGagPdLbA6vEKyqQnLxcA/TSJt3Dos
	 ijt/DGrOAUahFOI9M1L8uEOQfK2GLIphX8oxKkLbFO5d0jhpqlDG33U6hQhDFwyEAzwpp
	 5qg9vTiVAYqjSgH0OB8jeIB7p26OrDaW/g2qIqmkrJjF/wZqJyle+JHPl1bKWKDHdZvmd
	 vFpnH28EryQeHtcsgTjyiLJihcH0BNcSXVrY6vRXbfFFiMI05DBm92xRwqlgWlDvhfw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Yevjyf8h;
	dkim=pass header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=TtwZnGHc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D1D606A31C;
	Wed, 11 Nov 2026 02:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88D1D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Yevjyf8h;
	dkim=pass (1024-bit key, unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=TtwZnGHc
X-UUID: e19ff1c8dd7511f18dc8c9802ae25ab1-20261111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Zjj+1YaXEFcwROJrdQp0HTprLIiye2lIg1ePDQrkiXg=;
	b=Yevjyf8htwCRHBNuifpBbEcs2E7RQckxGpKKFJhihNHOgmC4AFXk2d4cv2eRd/TuRtEc+aloizNxfIUR0ZKWdZJwphIx0+1IY2H6esxRCD2I3tQnDgNkiflCC2OXAtfEdmxwi9dH9dwcyCdLXRPmCn3D3Zb3JPshHQ/kGmT1XVw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:781e6371-2c11-4bd3-9ac4-69d7c401a3b7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:f2debb5f-1b4c-4860-998c-597777959174,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|136|836|865|888|898,TC
	:-5,Content:0|15|16|51|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,
	QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
	,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e19ff1c8dd7511f18dc8c9802ae25ab1-20261111
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1749360863; Wed, 11 Nov 2026 10:16:19 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 11 Nov 2026 10:16:17 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 11 Nov 2026 10:16:17 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WSTRFUdI0ZFWQ+AcsmeqnqhdtcshDEw3CXba0DAsqwdsBsF5Ikgj90zp+tOGeo++DNnuPtzoisAgWxNNmh7x1aIsTd3fTnqU6h0cH+jIjqSBFmyDgp1g8WzugMN0gDHm75llr0U7f/lUXGfyaOElSy3kOmun+zy7c3Lr+QKnccyKqqOKVuB+InlF+p62LzJrR7jyUaMIy/7pdj/6TeYNbiwA/MPfZoZ736jDN99B+9ktSoPFUx2SCzTCkUysGERVILEdSaHeyyIoVW2HtJ3rrIBt7foSN4O0EYylVySbjwyyd3SduFLqEcI8ZXbw34vBHtaP5HiXbcImK9Yq7yq+xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zjj+1YaXEFcwROJrdQp0HTprLIiye2lIg1ePDQrkiXg=;
 b=WdSp+HFBluJ80z7koshEp2FtSor8Tt2mB8kGLVnd5RK4OnpkJEl26JtIHJPQps7YPELVsaPAdneOP/dAVA36PyUuzQFwSzFTxl9CUIAD4SVPDlEMiMajFSVcaDuq7LNTKGE4E1XC8o4o6C6lM3vKdGcyyuVpkTEvwOzO1dcJK7r9pWByeF0djgrLj4BEyAcsOOr4s8fNUh/kp4VHgdPah9hgnPhfzsdzpBJlhk2uMagiw6oInpmnsMQNbZwGji7lHkoUfQBcep4A0uIWTeVrqa6t/G1kGwLTtuPrWU3MNmJUd9ZI2IH+huHioR4ogzY9hhJoTMFnqAdKEeb5wwF8Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zjj+1YaXEFcwROJrdQp0HTprLIiye2lIg1ePDQrkiXg=;
 b=TtwZnGHcXqDDlrQ+jtX2iyZEuvMxzYQMTCFkyxiN/nqvm420X6pPep0U4JkUFoX/clmJX/l7QgTE7HAK3MtP6zcLvjdkC+HS5O60rG+kdswvfclQU4LTenRXc/awkrdIyhPpX2TolqwuKjkLdFoM/Jav9n8mIjxDQgF222V+SyI=
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com (2603:1096:604:471::11)
 by SEYPR03MB7271.apcprd03.prod.outlook.com (2603:1096:101:89::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 02:16:13 +0000
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02]) by OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02%5]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 02:16:13 +0000
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
Thread-Index: AQHdaEhNhyk5DpKRske6fm6wB0rq+rcVyIgAgAZDAQCAAEc1AIABM6aAgAAQgYCACp3HgA==
Date: Wed, 11 Nov 2026 02:16:12 +0000
Message-ID: <8f2e74eb3f5884c2d2964fb9192f02120a9f2659.camel@mediatek.com>
References: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
	 <20261030082539.1208733-5-chunfeng.yun@mediatek.com>
	 <20261030085628.GS158991@black.igk.intel.com>
	 <82f1a3227685b241938ccb500b97d1e73212bf36.camel@mediatek.com>
	 <20261103124842.GA158991@black.igk.intel.com>
	 <1dc9e15cdc03e4084eacc45d1c2c90f17e6c47e5.camel@mediatek.com>
	 <20261104080853.GB176724@black.igk.intel.com>
In-Reply-To: <20261104080853.GB176724@black.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSNPR03MB9677:EE_|SEYPR03MB7271:EE_
x-ms-office365-filtering-correlation-id: f2092a54-b8e4-4a92-e898-08df3f99c22c
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|38070700021|10067099003|11063799006|4143699003|56012099006|261022075727099003|261022105027099003|261021121427099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info: tqLtICzk760B7UHunigeXGwEumxohcxFy7ThbqUdxjoA9alzshVUzgze9VwBcq77ur8VCauoHp8ghqR0H1V4uzT5yfxKfAAzfbRA7q+3RYQBgcHYINeLhQ+ywBTx1OlVxY1hYobFm/E9PtrEmKyvYWRn5kUHX6m0RgS5b6a/4Lvxmssq35intreMzFJ1rsu8ux2QO3jJqDUwaboBEJKRQHSrGcgoGez/sl4q/sj0JbTdJavXxmAso11GsytxE4VnHECiInlpO+XCSn9OTnXH0Kbum39hp6sHVN8T1HHSBDW5llihQACjbCdXa7ufD61bidSE/doXqLqRFUuJATYFRQ5ok/rhDY5qElUbJC+M+5KWqH471L8tRIXExTD7mPNVnLf8MCv+q0onuXccEh2dvRWJlr7HN4KlS1yApIpAFG+im7t1bkoz0B3sw6zx+im3Ij2kBoi7vCuCURsXzf4/nk27+vQfOWuTXS3BLHi44HUHs4IbkkYY+Bvr1SIvJ1kKHX2rRQKQIUGeTFkcRXm3aWXg+lxL29LRsCB89rWXt9n8cGAD/nfYHnffJItaoG5nWDqU4y2TimKLdLvHQ3HYwPtE68WB9HRFWCQ5N1lH42wR8eMnwTmF2MD/jTc5WC65ysuxTs5JsI5FnPhG2nQ2yg6ujWDBGFkqQtzAcrw3vVO2nz4VbR/3ZhifEliqgg9oJ/SBjaJwo5yzVRZ66IFdldJKUJeUS/Rdf2XPsqfedWE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSNPR03MB9677.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(38070700021)(10067099003)(11063799006)(4143699003)(56012099006)(261022075727099003)(261022105027099003)(261021121427099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R29vdlBvQnBLVys0VStYK2d6N0VOUmtwU3owMFNwalRyczRVR3R4UUVXa2N4?=
 =?utf-8?B?UHQrWkQwMHBkR01icS9abTBjd0Ira1c3cTFqaXd0MW9rZzA2cFEwNFdtcENl?=
 =?utf-8?B?QlhFV3ZsY085V2ptejh2dVZOSGQ2SEdtSE9WZ2tIVkYyMlNIWHNGR3BONmZK?=
 =?utf-8?B?S2c1RmVxMzlKYUVZdU1XNENZcWFKY0M2Sko2djlrRWNaTkM5clBpM1dUei9D?=
 =?utf-8?B?OGJ0UjJNbkZ0a2ptck00bGl3QisxZ3p2bmw1VE9oaUR0c0Z2VkhqTVhxaVdu?=
 =?utf-8?B?SnJtWWxNY1FpQTBMQmxZNVB4Q1VwbFZPcVVlK0gzMU8xMjhlZXphMHp2YnpY?=
 =?utf-8?B?MGNQNEExK0x3UFRPdGg0TG9haksrd0ZDcnJLSkZSK012YWwrUXREYUFjcGda?=
 =?utf-8?B?M3IyRUtlUVU2alN6elR2cU5oSlRZY2l0aGZ1WThXM1lzV2ZVSCt2Z01BcjUv?=
 =?utf-8?B?eEMvZkNwSldBbm5ZQjJwdndtcDdTOW1XZFptVVlzZnBPa1k2WmtDZnVQYUpz?=
 =?utf-8?B?bEl3OXhJTEZTRmxwRVlOUU1qUG05UVhNSWVkTWdjeXFtK1hMT2xiZi9sSkNp?=
 =?utf-8?B?VFRrUSs5QXhNY3RaQVZJSGZJWFZUZmplKzZadkZsczl6RG1Tb3RiM1hiZTda?=
 =?utf-8?B?eHYwbW40OWNQS0xWTXZWKzFwOGU0OVZ2MzI3MTM2aGo5OUhxeDVMYzJGRmtr?=
 =?utf-8?B?ZEVjNmtLM2RDazdGWWtmeFdnZ1pZRXFQWm54MXVvWldteHVuS2o5UG96aUs5?=
 =?utf-8?B?OHhJeXM0a0hDZFhpZXY4eEViQW1FWVdYREVrbXVTYlY1VEJDSVM2MllEaENR?=
 =?utf-8?B?ejdpMC94OUFpZzJFT1JVSTFFR2ZEMWlJSUhaQXJiMDRHL2l2a2FXNkpidFAw?=
 =?utf-8?B?NHVBNS9MNGFmOGI5ME9GbEFkS20wQ3F1SUdVa0sxV1VhRW1IUHhXMytuTFp5?=
 =?utf-8?B?dEtWSFpsRWhjajI4bXYxY09sekR5a3dOU3pKQmNXaXZWQ2xVWVNYVllFRTdT?=
 =?utf-8?B?cU1XR243dEg2S3lEMXV5bnBBSUlZUmh6bjFwaW9tOWJKQ2RyY0Vvd3JWTnNP?=
 =?utf-8?B?N2RXWUM2azFLOWdlN2lTUnp2NFRtb3NoMkZ2Z1lsbkROK3ZTUmZvQmFVSnZq?=
 =?utf-8?B?cEJWd2hLb2xRbHpYdHJVQmMyVW8yUlNHbGQxR0FIa05sMW96c25GS1Z3NHVN?=
 =?utf-8?B?Z1dZOUJWdHFtdVFYenExSS9XcmFGQ0FXc052SDlMa1VOZTI0b3d4VmIwKzI4?=
 =?utf-8?B?SkYxTlNLbXRZTUN6WkhheUd5OXVZdjNza3JIdFNNcUlsY0Z0TzNNanpCQnVD?=
 =?utf-8?B?TUlMNFFQTlp6NC9Ob2dGTmZacU54K3JuMmpjSnd5Tk5kWmhETVF0M25VbWZa?=
 =?utf-8?B?N05JN2dDbU9HZUdLNU5MZnowai9VRjFxdDZsckhEUzVRQmgzbU1hL21kSEZk?=
 =?utf-8?B?MUFoTFQzcE9DZ2VhdzFBMGVrYXBrb0o4SWFFcDdodlRjTTA3dUJ3SnlPcXBo?=
 =?utf-8?B?Mko0NllManlxUEpBOTJKNmlxbUx3L1pSY1o5N2FOYVNMclJUWDlsakR4UHZF?=
 =?utf-8?B?bDdobXRzaVdhSm4vRzlibmc0RkZvREt5ZXdwNTQ3alI1OW1yV01yTXB1VmZm?=
 =?utf-8?B?Qk14czdMT3VkWmk2VzhFc3F4WVBaQVZnMDJlQWhvaE52Z3hYN2tXekpQdVBS?=
 =?utf-8?B?YWo4Qk9LMW0vbWpsd0RoOGhTUUg3Y0JVK1UrQ3dxTnNJYjRZVVlGdUtsRXhI?=
 =?utf-8?B?WDFaSEFvOVI2eXJ4aVpDSFZ5OUJGMEc5SEN1SUFEL0FmLzVpWDZwbUt2NGNL?=
 =?utf-8?B?YUlIUm5hZjdWYnhpRXlRVGZWWENVVUNYa0t5Q0hLRTc4S1FuNEVlT2hpb3ov?=
 =?utf-8?B?WHFQQWR6ayszQnZNY3ZUUGp4VWo2NktnTVFaUG9tNE8waGs2MzArUnZ2VjRZ?=
 =?utf-8?B?cTE0ZjZVWFpqZnlmNjVsSzZIOTZmTGV5cWhsZ0ZXYThRR2FUWWFoaTMvcGk4?=
 =?utf-8?B?bXVScmdqMkEybVpmeFlWaEY3UWd4M1g3WTRab2RWdmFtdEo0QTFLdldzSTZP?=
 =?utf-8?B?WW92Ui84UThYWEFmUUxwNHJzd2VmcGpwUldGMDUwZUpsT2wrVzUvUWg2Qm5i?=
 =?utf-8?B?cXZuVnpONFZYWkhCS2MxQlQ0djVXSXB4N3lKRmYzZDhXbVc0RGlPQmdMczZq?=
 =?utf-8?B?NEhrZEtxRjIwaXdNakx2RkxyZnU3VUtEYTJHMnZsQTh3cTJBTGpxdzdqSllS?=
 =?utf-8?B?dERORnVDbUNtbHMxVkRQeTRwbHpUYWZTYmNMQTZ1VHlKa2dObEJNczhsYWgv?=
 =?utf-8?B?RVFoZHVpSXRoemxSeVRBcHBXQTBVS1c3cnZrMlczUVJveXJleWsvbGFkc1lm?=
 =?utf-8?Q?ziclihOXveQGuXXk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <257936A0EAC3E74198E9F461A4F53D8C@apcprd03.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: KCo6yjuPLjGMxwLCHXQFmEvZI7TkmLp22YppgPgkY8/hoa6l/8GdzLUtSDwSieO6KogVpEpEyzGKMS7PEXb5zG1rmxyBje3GOUTUGXDZF3+Ar7ZVKoPKNdRSROCNv78hkCOc9f2imQ444AluFHIUzN1EmtFBSxiavIRUQUrPg95bmQv6Im4aGuvoVQC0JFxkFmH4IK1+szRiivv1cTT8sLLz7IEEdaBfMQIJJyx5iYj9EoyantKZ8jBXzOHWXlaN2ezV+9aNAQU7mOHZhhY4+dsvFnYOQuICLqSgavJ8gpxbpZikZiy6VgQze96wkz6+Q4tUDIXYH7kAGypyu6pSvg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSNPR03MB9677.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2092a54-b8e4-4a92-e898-08df3f99c22c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2026 02:16:12.9758
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UF1Xkn/auOjxwjmL5VV/Iwn1UIKXVcB3rDzUiYFlRWtWpc4piivnRFHmdoX6QlOvkeUC7nasEM6UV58+tgM9FUkMhqPLATFZW4Afbph8I0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7271
X-MTK: N

T24g5LiJLCAyMDI2LTExLTA0IGF0IDA5OjA4ICswMTAwLCBtaWthLndlc3RlcmJlcmdAbGludXgu
aW50ZWwuY29tIHdyb3RlOg0KPiBIaSwNCj4gDQo+IE9uIFdlZCwgTm92IDA0LCAyMDI2IGF0IDA3
OjA5OjUwQU0gKzAwMDAsIENodW5mZW5nIFl1biAo5LqR5pil5bOwKSB3cm90ZToNCj4gPiBPbiBU
dWUsIDIwMjYtMTEtMDMgYXQgMTM6NDggKzAxMDAsIG1pa2Eud2VzdGVyYmVyZ0BsaW51eC5pbnRl
bC5jb20NCj4gPiB3cm90ZToNCj4gPiA+IEhpLA0KPiA+ID4gDQo+ID4gPiBPbiBUdWUsIE5vdiAw
MywgMjAyNiBhdCAwODozMzo1MUFNICswMDAwLCBDaHVuZmVuZyBZdW4gKOS6keaYpeWzsCkNCj4g
PiA+IHdyb3RlOg0KPiA+ID4gPiBPbiBGcmksIDIwMjYtMTAtMzAgYXQgMDk6NTYgKzAxMDAsIE1p
a2EgV2VzdGVyYmVyZyB3cm90ZToNCj4gPiA+ID4gPiBPbiBGcmksIE9jdCAzMCwgMjAyNiBhdCAw
NDoyNTozOVBNICswODAwLCBDaHVuZmVuZyBZdW4gd3JvdGU6DQo+ID4gPiA+ID4gPiBXaGVuIHVz
YjQgZW50ZXIgc2xlZXAgbW9kZSwgZWNobyAxIHRvIGF1dGhvcml6ZWQgb2YNCj4gPiA+ID4gPiA+
IHN5c2ZpbGUsDQo+ID4gPiA+ID4gPiB3aWxsIHdha2V1cCB1c2I0IGRyaXZlciwgYnV0IGZhaWwg
dG8gY3JlYXRlIHBjaWUgdHVubmVsLA0KPiA+ID4gPiA+ID4gY2F1c2UNCj4gPiA+ID4gPiA+IHRo
ZSB3YXJuaW5nIGR1ZSB0byBhIHJhY2UgY29uZGl0aW9uIGJldHdlZW4gc3dpdGNoDQo+ID4gPiA+
ID4gPiBkaXNjb25uZWN0DQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gSXQncyByb3V0ZXINCj4gPiA+
ID4gd2lsbCBtb2RpZnkgaXQuDQo+ID4gPiA+IA0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gZHVy
aW5nIHJlc3VtZSBhbmQgdXNlciBhdXRob3JpemF0aW9uDQo+ID4gPiA+IFvCoCAyNzguODMxMTg2
XSB1c2I0X2hpIE5WREE4MTAwOjAwOiAwOjE6IGlzIHVucGx1Z2dlZCAoc3RhdGU6DQo+ID4gPiA+
IDcpLA0KPiA+ID4gPiByZXRyeWluZy4uLg0KPiA+ID4gPiBbwqAgMjc4Ljk0MzAzMV0gdXNiNF9o
aSBOVkRBODEwMDowMDogMDoxOiBmYWlsZWQgdG8gcmVhY2ggc3RhdGUNCj4gPiA+ID4gVEJfUE9S
VF9VUC4gSWdub3JpbmcgcG9ydC4uLg0KPiA+ID4gPiBbwqAgMjc4Ljk1MTEyNV0gdXNiNF9oaSBO
VkRBODEwMDowMDogMDoxOiBsb3N0IGR1cmluZyBzdXNwZW5kLA0KPiA+ID4gPiBkaXNjb25uZWN0
aW5nDQo+ID4gPiA+IFvCoCAyNzguOTU3ODE5XSB1c2I0X2hpIE5WREE4MTAwOjAwOiAwOjQgPC0+
IDE6MTYgKFVTQjMpOg0KPiA+ID4gPiBkZWFjdGl2YXRpbmcNCj4gPiA+ID4gW8KgIDI3OC45NjQ3
OTRdIHVzYjRfaGkgTlZEQTgxMDA6MDA6IGRlYWN0aXZhdGluZyBVU0IzIERvd24gcGF0aA0KPiA+
ID4gPiBmcm9tDQo+ID4gPiA+IDA6NCB0byAxOjE2DQo+ID4gPiA+IFvCoCAyNzguOTcyNzM3XSB1
c2I0X2hpIE5WREE4MTAwOjAwOiBkZWFjdGl2YXRpbmcgVVNCMyBVcCBwYXRoDQo+ID4gPiA+IGZy
b20NCj4gPiA+ID4gMToxNg0KPiA+ID4gPiB0byAwOjQNCj4gPiA+ID4gW8KgIDI3OC45ODA1MDRd
IHVzYjRfaGkgTlZEQTgxMDA6MDA6IDA6IFRNVTogbW9kZSBjaGFuZ2Ugb2ZmIC0+DQo+ID4gPiA+
IGJpLQ0KPiA+ID4gPiBkaXJlY3Rpb25hbCwgSGlGaSByZXF1ZXN0ZWQNCj4gPiA+ID4gW8KgIDI3
OC45OTEyNjVdIHVzYjRfaGkgTlZEQTgxMDA6MDA6IDA6IFRNVTogbW9kZSBzZXQgdG86IGJpLQ0K
PiA+ID4gPiBkaXJlY3Rpb25hbCwgSGlGaQ0KPiA+ID4gPiBbwqAgMjc4Ljk5OTUxMV0gdXNiNF9o
aSBOVkRBODEwMDowMDogMDoxOiB0b3RhbCBjcmVkaXRzIGNoYW5nZWQNCj4gPiA+ID4gNjYgLQ0K
PiA+ID4gPiA+IDY2DQo+ID4gPiA+IFvCoCAyNzkuMDA2NDA4XSB1c2I0X2hpIE5WREE4MTAwOjAw
OiAxOiBsaW5rIHdpZHRoIHNldCB0bw0KPiA+ID4gPiBzeW1tZXRyaWMsDQo+ID4gPiA+IGR1YWwg
bGFuZXMNCj4gPiA+ID4gW8KgIDI3OS4wMTM3NjNdIHVzYjRfaGkgTlZEQTgxMDA6MDA6IDA6NyA8
LT4gMTo5IChQQ0kpOg0KPiA+ID4gPiBhY3RpdmF0aW5nDQo+ID4gPiA+IFvCoCAyNzkuMDE5NTg3
XSB1c2I0X2hpIE5WREE4MTAwOjAwOiBhY3RpdmF0aW5nIFBDSWUgRG93biBwYXRoDQo+ID4gPiA+
IGZyb20NCj4gPiA+ID4gMDo3DQo+ID4gPiA+IHRvIDE6OQ0KPiA+ID4gPiBbwqAgMjc5LjAyNjQ2
OF0gdXNiNF9oaSBOVkRBODEwMDowMDogMToxOiBXcml0aW5nIGhvcCAxDQo+ID4gPiA+IFvCoCAy
NzkuMDMxMzM1XSB1c2I0X2hpIE5WREE4MTAwOjAwOiAxOjE6wqAgSW4gSG9wSUQ6IDggPT4gT3V0
DQo+ID4gPiA+IHBvcnQ6DQo+ID4gPiA+IDkNCj4gPiA+ID4gT3V0IEhvcElEOiA4DQo+ID4gPiA+
IFvCoCAyNzkuMDM4NTQ2XSB1c2I0X2hpIE5WREE4MTAwOjAwOiAxOjE6wqDCoCBXZWlnaHQ6IDEg
UHJpb3JpdHk6DQo+ID4gPiA+IDMNCj4gPiA+ID4gQ3JlZGl0czogMzIgRHJvcDogMCBQTTogMA0K
PiA+ID4gPiBbwqAgMjc5LjA0NjUzNl0gdXNiNF9oaSBOVkRBODEwMDowMDogMToxOsKgwqDCoCBD
b3VudGVyIGVuYWJsZWQ6IDANCj4gPiA+ID4gQ291bnRlcg0KPiA+ID4gPiBpbmRleDogMjA0Nw0K
PiA+ID4gPiBbwqAgMjc5LjA1MzgzNF0gdXNiNF9oaSBOVkRBODEwMDowMDogMToxOsKgwqAgRmxv
dyBDb250cm9sDQo+ID4gPiA+IChJbi9FZyk6DQo+ID4gPiA+IDEvMA0KPiA+ID4gPiBTaGFyZWQg
QnVmZmVyIChJbi9FZyk6IDAvMA0KPiA+ID4gPiBbwqAgMjc5LjA2MjI1OV0gdXNiNF9oaSBOVkRB
ODEwMDowMDogMToxOsKgwqAgVW5rbm93bjE6IDB4MA0KPiA+ID4gPiBVbmtub3duMjoNCj4gPiA+
ID4gMHgwDQo+ID4gPiA+IFVua25vd24zOiAweDANCj4gPiA+ID4gW8KgIDI3OS4wNjk3MzBdIC0t
LS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQ0KPiA+ID4gPiBbwqAgMjc5LjA3NDMz
NV0gdXNiNF9oaSBOVkRBODEwMDowMDogUENJZSBEb3duIHBhdGggYWN0aXZhdGlvbg0KPiA+ID4g
PiBmYWlsZWQNCj4gPiA+ID4gW8KgIDI3OS4wODA0MjZdIFdBUk5JTkc6IENQVTogNSBQSUQ6IDI0
MzMgYXQNCj4gPiA+ID4gZHJpdmVycy90aHVuZGVyYm9sdC9wYXRoLmM6NTg3IHRiX3BhdGhfYWN0
aXZhdGUrMHgxYTQvMHg1YjANCj4gPiA+ID4gLi4uDQo+ID4gPiA+IFvCoCAyNzkuMjIwMjg1XSBD
YWxsIHRyYWNlOg0KPiA+ID4gPiBbwqAgMjc5LjIyMjcyMl3CoCB0Yl9wYXRoX2FjdGl2YXRlKzB4
MWE0LzB4NWIwIChQKQ0KPiA+ID4gPiBbwqAgMjc5LjIyNzA2OF3CoCB0Yl90dW5uZWxfYWN0aXZh
dGUrMHgxNDAvMHg0OTgNCj4gPiA+ID4gW8KgIDI3OS4yMzEyNDFdwqAgdGJfdHVubmVsX3BjaSsw
eDE4MC8weDQ5MA0KPiA+ID4gPiBbwqAgMjc5LjIzNDk4MF3CoCB0Yl9kb21haW5fYXBwcm92ZV9z
d2l0Y2grMHg3NC8weGIwDQo+ID4gPiA+IFvCoCAyNzkuMjM5NTAwXcKgIGF1dGhvcml6ZWRfc3Rv
cmUrMHgyMTQvMHgyNzANCj4gPiA+ID4gW8KgIDI3OS4yNDM0OThdwqAgZGV2X2F0dHJfc3RvcmUr
MHgyMC8weDcwDQo+ID4gPiA+IC4uLg0KPiA+ID4gPiBbwqAgMjc5LjI4ODg4OF0gLS0tWyBlbmQg
dHJhY2UgMDAwMDAwMDAwMDAwMDAwMCBdLS0tDQo+ID4gPiA+IFvCoCAyNzkuMjkzNDk3XSB1c2I0
X2hpIE5WREE4MTAwOjAwOiAwOjcgPC0+IDE6OSAoUENJKToNCj4gPiA+ID4gYWN0aXZhdGlvbg0K
PiA+ID4gPiBmYWlsZWQNCj4gPiA+ID4gDQo+ID4gPiA+IA0KPiA+ID4gPiByb290IGNhdXNlOg0K
PiA+ID4gPiANCj4gPiA+ID4gVGhlIHdhcm5pbmcgd2VyZSBjYXVzZWQgYnkgYSByYWNlIGNvbmRp
dGlvbiBiZXR3ZWVuIHN3aXRjaA0KPiA+ID4gPiBkaXNjb25uZWN0DQo+ID4gPiA+IGR1cmluZyBy
ZXN1bWUgYW5kIHVzZXIgYXV0aG9yaXphdGlvbjoNCj4gPiA+ID4gDQo+ID4gPiA+IMKgwqAgMS4g
V2hpbGUgdGhlIHN5c3RlbSB3YXMgaW4gcnVudGltZSBzdXNwZW5kLCB1c2Vyc3BhY2UNCj4gPiA+
ID4gZXhlY3V0ZWQ6DQo+ID4gPiA+IA0KPiA+ID4gPiDCoMKgwqDCoMKgwqAgZWNobyAxID4gL3N5
cy9idXMvdGh1bmRlcmJvbHQvZGV2aWNlcy8wLTEvYXV0aG9yaXplZA0KPiA+ID4gPiDCoMKgIDIu
IFdyaXRpbmcgdG8gdGhpcyBzeXNmcyBhdHRyaWJ1dGUgd29rZSB1cCB0aGUgVVNCNA0KPiA+ID4g
PiBjb250cm9sbGVyDQo+ID4gPiA+IChuaGlfcnVudGltZV9yZXN1bWUpLg0KPiA+ID4gPiDCoMKg
IDMuIER1cmluZyByZXN1bWUsIHRoZSBkb3duc3RyZWFtIHBvcnQgMDoxIGZhaWxlZCB0byBjb21w
bGV0ZQ0KPiA+ID4gPiBsaW5rDQo+ID4gPiA+IHRyYWluaW5nIHdpdGhpbiB0aGUgdGltZW91dCBh
bmQgd2FzIGRlY2xhcmVkIGxvc3Q6DQo+ID4gPiANCj4gPiA+IE9rYXkgd2UgZ2V0IHRoZSB3YXJu
aW5nIGJ1dCB0aGUgYmlnZ2VyIHByb2JsZW0gaGVyZSBpcyB0aGF0IHdoeQ0KPiA+ID4gdGhlDQo+
ID4gPiBsaW5rDQo+ID4gPiBkb2VzIG5vdCBjb21lIHVwIGFueW1vcmU/wqANCj4gPiBZZXMsIGl0
IGlzIG9uZSBjYXNlDQo+ID4gPiBVbmxlc3MgeW91IHVucGx1Z2dlZCB0aGUgcm91dGVyIGFzIHdl
bGwuDQo+ID4gaXQgaXMgYW5vdGhlciBvbmUuDQo+ID4gDQo+ID4gaWYgdGhlIGRyaXZlciBhbHJl
YWR5IGtub3cgdGhlIHJvdXRlciBpcyBkaXNjb25uZWN0ZWQsIHdoZXRoZXINCj4gPiBzdGlsbA0K
PiA+IG5lZWQgdG8gbG9vayB1cCB0aGUgcGNpZSB0dW5uZWw/IGl0IHdhbnQgdG8gZG8gaXQsIEkg
d2lsbCBhYmFuZG9uDQo+ID4gdGhpcw0KPiA+IHBhdGNoLg0KPiANCj4gSSB0aGluayBpdCBtYWtl
cyBzZW5zZSB0byBmaXggaXQgYnV0IEkgd2FzIG1vcmUgY29uY2VybmVkIGFib3V0IHRoZQ0KPiBs
aW5rDQo+IGlzc3VlIHlvdSBzZWVtIHRvIGhhdmUgdGhlcmUuIFRoZSBsaW5rIHNob3VsZCBiZSBy
ZS10cmFpbmVkIG9uY2Ugd2UNCj4gcnVudGltZQ0KPiByZXN1bWUgaWYgdGhlIHJvdXRlciBpcyBz
dGlsbCBjb25uZWN0ZWQuIFRoZXJlIGNvdWxkIGJlIG1hbnkgcmVhc29ucw0KPiBmb3INCj4gdGhp
cyBidXQgSSB3b3VsZCBjaGVjayB0aGF0IHRoZSBQRC9yZXRpbWVyIGZpcm13YXJlcyBhcmUgdXAt
dG8tZGF0ZQ0KPiBhdA0KPiBsZWFzdCBhcyB0aGV5IG1heSBjb250cmlidXRlIHRvIHRoaXMuDQpJ
IHRlc3QgaXQgYnkgc29tZSB1c2I0IGh1YnMsIG9ubHkgb25lIGVuY291bnRlciB0aGUgZGlzY29u
bmVjdGlvbiBpc3N1ZQ0KaW4gcnVudGltZSByZXN1bWUgLCBpdCBpcyBJbnRlbCBVU0I0IEV2YWx1
YXRpb24gRG9jayBFVkIuDQoNCg0K
