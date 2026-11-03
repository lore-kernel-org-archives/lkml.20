Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793693627;
	b=pYgwoSuRS1KeLWC6RCnsJCGN/ORgg7/pflXN620nkjwATqvYlg2E9nccSkKet3VnqPls
	 KXesHalZ4xjJGaDAjJ56xY0DpZ+1+fZBDa5oR0GS52jHpMxEo3OlCla0vlK9KD45tGZvd
	 OTtxvY48XyR1fs2v7IVpLCYGntB7StH0CwbYzqwBBva8aSURaD5oDiCmKJCzfTPYLgZYu
	 OG09eZTzIxGnka0ZUiw8A7JAXl9TrlT2J4vPrPP+Q4S7I9XCmyy544hfAKb4/+chrNndW
	 h2PtasZE9EC8bxRBhld5zB8LNrMK3vTm4nzLIdoIwBITzSVN7QBtTHFh1KT6Gz+NLjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693627;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-CACHE:X-CID-P-RULE:
	 X-CID-O-INFO:X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:
	 X-UUID:Received:Received:Received:DKIM-Signature:Received:Received:
	 From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ld-processed:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
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
	bh=vSvdfZjdimYjvNhZYTRDQCQsGi5JFPP6bbO/FRrGE7E=;
	b=tUE7uPXcV1NzF+3K+0w5ckqqrofnaj1VZs0dDjrHRpaup2d9jUHI9j70Slo4ib8OZzoY
	 hd0I+hOYRlMZZiF5fv41PyJ/3uK0UqJGSdpnHzlntaTZ3VVr17fe793CbjuFHAWZTqHn9
	 w9w5RrG8lsxzZXMe1a3fOovXELmpoX5ovhrzysHn1ptKFD9Ka7O/Eti2u0W/QHKmEt7sP
	 Rtv9IinwiJLhWHRfmi6vh5r2un+J/7GGLpeyb/tk3mShut+/tRHeGdh14T9biIkO650bW
	 czhmcofBomz7S9Ggv4sb+zNqsIfqjtGLaxcvuFvxXTHl5d1u1x/jp/Q7bwhOekw2Wlw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=PZ8nuD9q;
	dkim=pass header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=KJkuK7fi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6276B606A324;
	Tue,  3 Nov 2026 08:13:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6276B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=PZ8nuD9q;
	dkim=pass (1024-bit key, unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=KJkuK7fi
X-UUID: 770d6286d75e11f18dc8c9802ae25ab1-20261103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=vSvdfZjdimYjvNhZYTRDQCQsGi5JFPP6bbO/FRrGE7E=;
	b=PZ8nuD9qcG1uHNha3Ql0T1Yjj301oIjCxsqj6YqFOFrEfnbuXFtTb7KHgzWGkUPTQ4z/oWCVx4H+RiM6DHK8ks+qjiBGhFkTZitYYz2ty51MJ0HFf2brKSPz0oFUV2bpcQsgVTEG2lFVsbEL7uwCB8Vg45Qxe3lrqCbBxtad+Pc=;
X-CID-CACHE: Type:Local,Time:202611031613+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:b9dd4cb2-82bc-4015-9fe2-ee44826d4f14,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:a0150cee-6961-456c-adce-6d277e14e6ad,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 770d6286d75e11f18dc8c9802ae25ab1-20261103
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 492815787; Tue, 03 Nov 2026 16:13:34 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 3 Nov 2026 16:13:34 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 3 Nov 2026 16:13:34 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ld6YWUIaineYNsiN8ry57tmfNZaIsP+lnCIFHTJk/Jxrx4rnRlraeZ5vdxwBed8IiGuQF0D1Jhkrq9T98Yhk2tinR+rVFCUH5WWkdxAHL4UklKTSMSRVsIkicacFPs17mV7owJSRP+1yxVRVLzRa3/JVQ3J8H7sTw8iaqXXYCyM8sNOFXxDiD+uALKRRaZEd+39m+L8vOMJz3GmBc7KukAeT1lidHeygBFKMZoNq78K3rdhxizXMYS3vUs7EuMdoTNTfF7qPfKvizQX6BfiTUgh5p7/aCyrel9g4nlO4We14j402fbUe7pGlT3G6bNoqvsyIJpGGGwlqTjMk/jC87Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vSvdfZjdimYjvNhZYTRDQCQsGi5JFPP6bbO/FRrGE7E=;
 b=zI3IfY9t8QaRO9ul3C/RDzSw6xBpim36LJfEFspPxCLS1o6Lrwbi3TBtf4IXdtoBxy0SZdUzhwyE9MpYqxag69W4MW06efUN3lcIZWCjb9Trq+w7v3n6rCOB3JeCsx4DeAI7IKqLLr0OVVEcUGDr00wybptWMDvTKFqj1sYJ6l/YL6RR0A78txduiaqdf9MVgmeOkJvEbnmLCfdyKx+Lf2U89ldDKeHKWZpgwlJ8XAZyBB7DzJ8BBBpLg+C5mBSNgjITk4vsgiiUossDGtvlxNwrLpOCnTv0J0+qgAGJHSHjgAa+H9DUgANUXwnwLl0OXtHtLWKT7KXOY8iktGpd3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vSvdfZjdimYjvNhZYTRDQCQsGi5JFPP6bbO/FRrGE7E=;
 b=KJkuK7fiNrbVAzg4v9lLtUJayQn2JehDxzk/gvLLT9BvaZMs9KkiqlpJxsgbFinwMgVVhbtFwzjIw2tudnT4IU7YNx/ncDreadTnQuRuJUpneIwSaoJgaxGvulm/Thep+w2QQlbSJSKF6F+VFPnAGRqLtaMJ6BU+m6M3ClkvUro=
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com (2603:1096:604:471::11)
 by TYSPR03MB9618.apcprd03.prod.outlook.com (2603:1096:405:85::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 08:13:29 +0000
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02]) by OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02%5]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 08:13:29 +0000
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
Subject: Re: [PATCH 3/4] thunderbolt: improve usb3 adapter link up timeout
 value
Thread-Topic: [PATCH 3/4] thunderbolt: improve usb3 adapter link up timeout
 value
Thread-Index: AQHdaEhK0ddQHI/Ay0WjaabTK8WForcVxvCAgAY+jIA=
Date: Tue, 3 Nov 2026 08:13:29 +0000
Message-ID: <1a0454774660f90e1b6b475baa3931ebedb020e4.camel@mediatek.com>
References: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
	 <20261030082539.1208733-4-chunfeng.yun@mediatek.com>
	 <20261030085045.GR158991@black.igk.intel.com>
In-Reply-To: <20261030085045.GR158991@black.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSNPR03MB9677:EE_|TYSPR03MB9618:EE_
x-ms-office365-filtering-correlation-id: 951e79c1-db46-403f-cfc9-08df398257d4
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|38070700021|261021123027099003|11063799006|4143699003|56012099006|261009223027099003|261028144727099003|261022075727099003|261026121527099003|261021121427099003|261026140227099003|261022105027099003|10067099003|18002099003|22082099003|261102123227099003|6133799003;
x-microsoft-antispam-message-info: IalX84IoYlytfHgpR3qVnQc+8rr/FDusNDa2fpPYJI+AKhYYexh+7LnvNh4yfaPvMKSUuoTdWwyXNqAo+cZ/inJ7Ig9Lsdg90C39lS69Xw9NQ5w50yCgHn15iFXA/W46ysozy2PSYAwNo6vuGDJ18LptVtz4n3LjvK2CTTqwDwUKDDDpG2Pz+uwbtq/uQ0SZyF7AaSZDax8Xb8avKvBqAAEaEk1kO56aT7utmEdSkDzrP8EcgIGXa6tGH3I9EqBPHD9gi5dlg6O7lbDKuteCMaURoBl974Rm5muBxHrEcOpFGJ7Qxsg5BriMuUSFNgLhyysLSwozJ/mjwfBmnmL4kbFmPBt5PHBT6ESVbLzgjyM/hNB9UIxrTzSCgti4p2tbRgwpo+HB73u0tbri/OSskZ7scQykoSM/wYF7KiL6uysH8IClf1BDojVrLtMesldjbRnhYTtrC+2h5+M4wqjOPDXc42iai06GOfYJvkP46nHOTkrqybcZWLp50fAhlvHWLAyn7dPSVzhy8jYTl1ZEtD4/lRk/8rxO+2Y7OM35hAOb6CkmqdtDkFSBTur2fKhVPadphE3deBzJpCxe9gJZc9LNj4fe87DSXIZP6gPSUEWtaeLx+TMd/2p7rqCpHknMFOLAgDX19/vjneNxuIiIJN32G2jWkPLDY7ffcqBm1M3VmG4XiEjW2XadXLXa5lZLzGV/hLqSYr4BGXlM2/TmbapYLD2hLSm5f7lbBOHPDRE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSNPR03MB9677.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(38070700021)(261021123027099003)(11063799006)(4143699003)(56012099006)(261009223027099003)(261028144727099003)(261022075727099003)(261026121527099003)(261021121427099003)(261026140227099003)(261022105027099003)(10067099003)(18002099003)(22082099003)(261102123227099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VXlyOFhKZ1F1dWorckhrT3hxREcxL3pWV3d1ZzA4UEFvYTRyeSt6OUhST0lY?=
 =?utf-8?B?MG1UeGx1aCt6TnVFODVSdENhTlFTNndnK3NQbjBHRWZYMnFrRHB3U2xFZVhl?=
 =?utf-8?B?bTBIOE5yOVlTOWU2VTVrblgwNzhLbHJxVk9JTWVESjdHam9SMUU3NmNYMk16?=
 =?utf-8?B?UmtkV0RJNXBNYkdyd1ljRXplN0pJZGtTMG5wRCtCYVNVNmY4dFdYbEdTanor?=
 =?utf-8?B?aG1nSytjaVZwbmJ3VkpJZmQrb2gxUU1ZWHhTSys5dmtCaGZ3NUs3bTZsdGh4?=
 =?utf-8?B?ZnhsN0RNbFFXMkF3UkZWVFdrYnpLMXFGSWIxNFFmTFVVZUxlNk5tdi9YWVZq?=
 =?utf-8?B?cUJZV2hBM3liS3VrMTNKZ2d2UmVJUE1jTTBwZXRuMVJEcUZrakRxeTd4NG8z?=
 =?utf-8?B?MVFGMW1TaTN1UWNDVWZCbVB4OTljL2llSTF2em05ZzBUYnM3d2xJbmlHdVJv?=
 =?utf-8?B?N0N1Yk5LYlpSTHE4bmh1RHRidHNyOTFVQ09pdzFGZlppS2swbjRPVzVibGdP?=
 =?utf-8?B?blYybWtKOFhmb2NEZVUvUDdKclJVNU45aWUyWGM2ZHYzUUpLU0xSNG9wMHJa?=
 =?utf-8?B?aE01VkxqbGtsS1VPNDQxU2ZXS3lnY3VLajBMekdBUElqWnFvV3dicHhoOGZL?=
 =?utf-8?B?RmhOU05BUlhkUUl3TDhIWUtPSUxORmZQcTR2TlRwSzUxRm1KR2NYVHY1Zmlt?=
 =?utf-8?B?ZkNCUGJqQTlDbVhWNGEvQis3R3VHaTBDdUlSOG4zOWFuUjczalZ2dnozU3lr?=
 =?utf-8?B?ZEhJVkVqS0JTMTFQckFtOHNrZTB6a1N5bVhXU0RoaU9CSEF3RXlHbXZlWlhB?=
 =?utf-8?B?R3JNeFc3NTNwWHhNR1diTUlrWE9UTmwzSitDUllwbndSWkEwM3IrenM0OGNt?=
 =?utf-8?B?SzFRa1crSnFjOCtmZnZOck5lVUlxempWcDVBMFhrNDhKNW9FQko0NEdVOGVY?=
 =?utf-8?B?MDU3YWEwY2txWEFSWVA3MGdxcnhIeCtpeXJwU1RnVlRiVGIyekUzRDJWZWk3?=
 =?utf-8?B?Q0tkVkMwNXhPdGsxUThGYnJ3cjlNM1hNZVBaUkgyRWFpcmlyOXNMSmVycVda?=
 =?utf-8?B?VjhnNVdYM1pQc01ONEtYUFJZNitjYldNa0JrMWtUZFVwbnlLbThjUkR5eWtZ?=
 =?utf-8?B?Z3dVdEllV1krVkJjak9ldy9iRUYwRlU1MlNuSzE5VFhrL0x6NS9UZ3FBRnZt?=
 =?utf-8?B?WUxnK05yc0diY1BNeUJ6ZUFtWWx4RWluZXNxbUI5dHdkUGNNRldUY1FjMSti?=
 =?utf-8?B?THp3TWhlSjZDS0hoV05jdjhlL1FwbVFwdGhOeXl2SUI5YWdtQkE5QnhSSDJV?=
 =?utf-8?B?bEcxeWdMRkY5cXFUOVpick9SZUY2bXNXSUpiYnoxOVZsb0M5VndQbVJIOW5L?=
 =?utf-8?B?MmE1eldNVmovR25mRGtEM1lLRXhScXJyUTdIdTRqMXRiUHZZNS9MVk9iZ21a?=
 =?utf-8?B?NVA5UHVodjJ4VjZiNFdReXdFbVpWNDJsdVI1cEVxVmVzVFFxZDk4c0pkM3FT?=
 =?utf-8?B?ZGhmV2ZVMEtGMUxpZ0VVanpka3RqV05zcUNjNmFIRUhlRW14cVI2c2VkMCtK?=
 =?utf-8?B?VndSK0ZiVVRtTytCdWdsd1hOd2lkZ1Y3T2hxams5ZURYcFY5R3l6akYzaHl1?=
 =?utf-8?B?U3ZKMXdyY0lMMHFGSEN0V095elVUeHZrY2V4OW05eXFwcmJRUUhCTm9oR0hN?=
 =?utf-8?B?RWd2dzBhUFkwRER0b0JWNkZEV01WcG9hNEVMY3RjNXgvaGZvMGVycGx5TXIw?=
 =?utf-8?B?Q1NuRHZmUDJXeVgwaStnb056dGxGYzcyU0E3YzdmM2dlSEdlU1hpZkJBdnoz?=
 =?utf-8?B?OWNKVlBiRG1tUFJzVWRsdm9lNjNabEVEYytId0Jpblk3WHB0a0orQ2R0ZElx?=
 =?utf-8?B?SUtRL1hrVmk5ZHFNSHpzYnR1aHFyMUF5WHBMYjFkMnRzRkRrUTB0bFFaZzRE?=
 =?utf-8?B?TENSWGZ1KzBtL2xzMExkbEhKQzRTbDRGSlo3UVBrSS9iZGpuQkRrcXdkZjA2?=
 =?utf-8?B?dkdMVjJIaVZmeG5qWGZDQ0ljUlhpd1E3REl6YnV5KzhWWjArYnltTFhyVVc2?=
 =?utf-8?B?eGtJMWhOeTE0dzhEYWx5NXNRRStLNTNQRDBXZzBHcnYydHhQTmhPZFl4WU14?=
 =?utf-8?B?MUMvUFhIQ0NlT1dRdk05clBuOGdwakpoei9Kd3dpVTJQZmRyT25BTThHU0Y3?=
 =?utf-8?B?dEhhVUNwTi9YeWwzbTVoOTZuSDRRQSs0cjdMeTJQditLejRzWlVXemUySDF0?=
 =?utf-8?B?TjA3NU1yUVJiUk5Lam50QVFUY0xxbmR0SEcwS25BRkNELzFaVk04b21jUUJv?=
 =?utf-8?B?bCtpK2hlajdvOURPZHhTUXdqVzBYenIwcEl3enI2dFFtQ0xyUzhjL0RMaHBF?=
 =?utf-8?Q?tkhqHUUotItvVmrc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <21FFF0366951214DB65E1856D61F3C21@apcprd03.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: v8c4thR8kb33yRsLP5hJ1SINflnQwSHTmhE6m3RyLkdv+XynWgP9uNuBaKMTJAhQ0rJhSWI0szLKeKAsAGLU6xAllURg6qVcfz7VItuKjzbmewslsvXwNQljkdlNVBlQ4ADOb7S1qEnBCltnHJ2x0l+QjN1iptn7hAfM18jgiHddvL4au1q8nw/xTSDe6MMXWOgPx97wtkrz1pSEE9DNFHgF1tk71SDykLi6cM3AoHFuKK5rAMhdGNyL1HNCP388yf1uhuzo7fSYqN7pFKpiPmk2OUKYqFQBjUJ51PpD3BVfzfZNhnudnu67UA5jQ33a1rWRDKJQG+4QR6tKWnFiAw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSNPR03MB9677.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 951e79c1-db46-403f-cfc9-08df398257d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 08:13:29.0820
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hKOxT4PiUFOFwcwe6ek0xv/9FceCfaX2X3y2zowCh7qJ5jdc6891DCw28ohz9D/5WQSv8tVW8ekuiR9nLxU0ldS2UQejF4GvhT+3i7PBnzo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB9618
X-MTK: N

T24gRnJpLCAyMDI2LTEwLTMwIGF0IDA5OjUwICswMTAwLCBNaWthIFdlc3RlcmJlcmcgd3JvdGU6
DQo+IE9uIEZyaSwgT2N0IDMwLCAyMDI2IGF0IDA0OjI1OjM4UE0gKzA4MDAsIENodW5mZW5nIFl1
biB3cm90ZToNCj4gPiB3aGVuIHBsdWcgaW50byBhIHVzYjMgZGV2aWNlIGludG8gdXNiNCBodWIn
cyBERlAgdG8gdHJpZ2dlciB1c2I0DQo+IA0KPiBVU0IgMyBkZXZpY2UgaW50byBVU0I0IGh1Yidz
IGRvd25zdHJlYW0gZmFjaW5nIHBvcnQgdG8gLi4uDQpPaw0KPiANCj4gPiBkcml2ZXIgd2FrZXVw
LCBlbmNvdW50ZXIgdXNiMyBsaW5rIHVwIHRpbWVvdXQgaXNzdWUsIHRoZW4gY2F1c2UNCj4gPiB1
c2IzIGh1YiBkaXNjb25uZWN0Og0KPiA+IA0KPiA+IHVzYjRfaGkgTlZEQTgxMDA6MDA6IDA6MTog
ZmFpbGVkIHRvIHJlYWNoIHN0YXRlIFRCX1BPUlRfVVAuDQo+ID4gSWdub3JpbmcgcG9ydC4uLg0K
PiA+IHVzYjRfaGkgTlZEQTgxMDA6MDA6IDA6MTogbG9zdCBkdXJpbmcgc3VzcGVuZCwgZGlzY29u
bmVjdGluZw0KPiA+IHVzYjRfaGkgTlZEQTgxMDA6MDA6IDA6NCA8LT4gMToyMCAoVVNCMyk6IGRl
YWN0aXZhdGluZw0KPiA+IHVzYjRfaGkgTlZEQTgxMDA6MDA6IGRlYWN0aXZhdGluZyBVU0IzIERv
d24gcGF0aCBmcm9tIDA6NCB0byAxOjIwDQo+ID4gdXNiNF9oaSBOVkRBODEwMDowMDogZGVhY3Rp
dmF0aW5nIFVTQjMgVXAgcGF0aCBmcm9tIDE6MjAgdG8gMDo0DQo+ID4gLi4uDQo+ID4gdGh1bmRl
cmJvbHQgMC0xOiBkZXZpY2UgZGlzY29ubmVjdGVkDQo+ID4gdXNiIDItMTogVVNCIGRpc2Nvbm5l
Y3QsIGRldmljZSBudW1iZXIgMTANCj4gPiANCj4gPiBDb21wbGV0ZXMgbGluayB0cmFpbmluZyBh
dCB+MS40OHMgYW5kIHRyYW5zaXRpb25zIHRvIFRCX1BPUlRfVVANCj4gPiBhZnRlcg0KPiA+IGNo
YW5nZSB0aGUgdGltZW91dCB0byAyLjVzOg0KPiA+IA0KPiA+IEluIHRoZSBVU0I0IHNwZWMsIFBo
YXNlIDUgKExpbmsgRXF1YWxpemF0aW9uKSBhbG9uZSBpcyBhbGxvd2VkIHVwDQo+ID4gdG8NCj4g
PiAxMDAwIG1zLiBXaGVuIGFkZCB0UGhhc2UzICgxMDAgbXMpLCB0UGhhc2U0ICgxMDAgbXMpLCBh
bmQgcmV0aW1lcg0KPiA+IHRyYW5zYWN0aW9uIGRlbGF5cyAodENtZFJlc3BvbnNlID0gNTAgbXMp
LCB0aGUgcGh5c2ljYWwgbGluayBpcw0KPiA+IGFsbG93ZWQgYnkgc3BlYyB0byB0YWtlIDEyMDAg
bXMgdG8gMTUwMCBtcysgdG8gY29tcGxldGUNCj4gPiBpbml0aWFsaXphdGlvbi4NCj4gPiANCj4g
PiBoZXJlIGFyZSB0d28gcmV0aW1lcnMgaW4gdGhlIGxpbmssIGlmIG1vcmUgcmV0aW1lcnMgYWRk
IGl0LCBuZWVkDQo+ID4gbW9yZQ0KPiA+IHRpbWUNCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBD
aHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gwqBk
cml2ZXJzL3RodW5kZXJib2x0L3N3aXRjaC5jIHwgMyArKy0NCj4gPiDCoDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy90aHVuZGVyYm9sdC9zd2l0Y2guYw0KPiA+IGIvZHJpdmVycy90aHVuZGVyYm9sdC9z
d2l0Y2guYw0KPiA+IGluZGV4IGQyMmQ4ZGI4Zjg5MC4uZTdlZTk2MzljNTRjIDEwMDY0NA0KPiA+
IC0tLSBhL2RyaXZlcnMvdGh1bmRlcmJvbHQvc3dpdGNoLmMNCj4gPiArKysgYi9kcml2ZXJzL3Ro
dW5kZXJib2x0L3N3aXRjaC5jDQo+ID4gQEAgLTUwMCw4ICs1MDAsOSBAQCBpbnQgdGJfcG9ydF9z
dGF0ZShzdHJ1Y3QgdGJfcG9ydCAqcG9ydCkNCj4gPiDCoCAqLw0KPiA+IMKgaW50IHRiX3dhaXRf
Zm9yX3BvcnQoc3RydWN0IHRiX3BvcnQgKnBvcnQsIGJvb2wgd2FpdF9pZl91bnBsdWdnZWQpDQo+
ID4gwqB7DQo+ID4gLQlpbnQgcmV0cmllcyA9IDEwOw0KPiA+ICsJaW50IHJldHJpZXMgPSAyNTsN
Cj4gPiDCoAlpbnQgc3RhdGU7DQo+ID4gKw0KPiANCj4gVGhpcyBpcyB1bnJlbGF0ZWQgY2hhbmdl
Lg0Kd2lsbCByZW1vdmUgaXQuDQoNClRoYW5rcw0KPiANCj4gPiDCoAlpZiAoIXBvcnQtPmNhcF9w
aHkpIHsNCj4gPiDCoAkJdGJfcG9ydF9XQVJOKHBvcnQsICJkb2VzIG5vdCBoYXZlIFBIWVxuIik7
DQo+ID4gwqAJCXJldHVybiAtRUlOVkFMOw0KPiA+IC0tIA0KPiA+IDIuNDMuMA0KDQo=
