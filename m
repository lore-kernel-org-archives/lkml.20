Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=60.244.123.138
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793869997;
	b=sP0hXukbHf3kwDo+Tsah/JsuBqKH5Gcr/lmr9cKaf86kTvAuVcIjzJ9Q90jeXbIuBkK3
	 eR6wjoyVQYJyLPOP78Tacqv960ZQ27I7clFr1CYo4MonZUBs8rE+ahsOCf5S7r+DJoc4u
	 QAfFkgo5kmXjYdOav6AGd9THIFsacfUl7U9t8ivdV1aS0JdYBOth/2P3pb7GQlVceEovZ
	 97JnSTuW+PiZer0QgNhIG9QjsvGq6Y5oGfUY/ERH/cnfYz9APyJpe7czGSZZEXBtmorXM
	 kIABR4Fd9+XISLRfco/scGqw7HgY6/6kdg0VAl3nLPAlEdJtUcbShiOhltXSAu6XzEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869997;
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
	bh=eUL+gY95QEq/q+HcYycmMxaPms3tW6aMxEaKUOGGtPk=;
	b=zRpoDUnIy8gzwn4x7wPeE3oAi/jbJnYi3c/45TcIZwXpZQxKazlGIfKMIm3lxp3CVDry
	 Tezvpgx2KxBgVl6NWI17fwlF8kwrr2/OnvUV7V7stBzDz88CI2TlwHQ4b2QZMv4jSDSES
	 N/eR8otA42VRj5PblctsQ4ucLjipeu5mB0Hf/Dyrx7y/Ceg1zlRnbCllkG+dzNQmD4ABc
	 mEqoDQ6y+6BH1uH0aUU0yae0jdEBjBgAC9XBEkbqj6LI4J3qqIBxafoUV08u4YfrPU80G
	 WoKtNZwpktCxuw6yfPenVb70sCpyvRBzi4PScEoGPHctt10giDlXdsQcphImspb+uHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=temperror header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=qibqj8rN;
	dkim=pass header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=WXLF9Gyc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1F4606A330;
	Thu,  5 Nov 2026 09:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E1F4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=qibqj8rN;
	dkim=pass (1024-bit key, unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=WXLF9Gyc
X-UUID: 1d8003bcd8f911f1b1788b6acf885367-20261105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=eUL+gY95QEq/q+HcYycmMxaPms3tW6aMxEaKUOGGtPk=;
	b=qibqj8rNXhNIYXFtB0lcTFk0L+C8dU34zuwapDaZcmFBj93apSzJ6n6imIezHgY0uYkIu6QmXuJbzp2li/JU0uYjMfu5D4TsekfdLIHYo3FOCMx3WisupANO36WxC0AHth7eo+1XhvAbIqPZPZRfj5+ZsWNRM+oipUinZCEiuqk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:fb1698b7-9dff-405b-be88-b83fe7a8fb5a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:ebd720ee-6961-456c-adce-6d277e14e6ad,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1d8003bcd8f911f1b1788b6acf885367-20261105
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 200763101; Thu, 05 Nov 2026 17:13:07 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 5 Nov 2026 17:13:06 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 5 Nov 2026 17:13:06 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wmgvra2Si7ZjkE10B6Okl4OUf9ZNYp2KXHyjoSmMYapkV5P1hjoSvkXXxcUcDH6yYBwYOHHCMC7r35AlQeUDUjAc4ZWtepI5gteu5/uPrTUb6Ukd3jHoihfVpl+nFbJs8370WG9ZFo2jcDZoh1FPFMjAWpbTjwI4CmoPp2diHJVij0EAsnFNLoUqY2V0YSixctBO4O90jZMIsNnJa4Ntl2tJJHIfZOzA1DLP2ZP+3/SvShSsiGh/x8lp1cca/KnoKX3TUWlB9lwT5ujjEl+mfSGqMO9uZJ39JxXok2zXcHM5WaSXBKwsD03iZKzUqLCDvmBhi3ZBZSsY5PIAGL35xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eUL+gY95QEq/q+HcYycmMxaPms3tW6aMxEaKUOGGtPk=;
 b=ekCoEb2bJRHlK+akKGpHkImMJlQOatSbIM7rQByMPERZrq7Be7tBqaPVJY4kIgiqhuh5AQXcnShMUaAkShope9mbmoZpa3U2IvVykzGL0+PmFDavuJmdNVr1qiIDH/rpbpKaKLw2JMbPXJHRh6m80rC64tECrnQ7sjgls7VMFARTh1ON6vh3dGlz5lHMS6RGjf8oXXEtwQzlC+oZvJLESLMb4Q3c7h1W2rBHxU9Ro/NIv2EtlwA91clCyTCtKFVGjENllFdwgDiCb+svHFuNhd5WVVG65Y+dADuryDWs2XWNdlYDO7lFIohoYlh7JviHu/mdqRXRgCUQu7CdtSTXKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eUL+gY95QEq/q+HcYycmMxaPms3tW6aMxEaKUOGGtPk=;
 b=WXLF9Gyc6Tntovprwcbcb/yPON4EpbVM/apcRwGHksNI+3auzfzyK6FA0MwYYkr4D4x1Z45L6tCQRKOVw4FUOhgcb6yvOeySrJZQhuU5lspSc2P6ZY0NfYobhImOZiJt1lsLJKotkN//cPC/IbXnP7rRWtvVEGq84esSTlxbgmc=
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com (2603:1096:604:471::11)
 by KUYPR03MB10143.apcprd03.prod.outlook.com (2603:1096:d10:97::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 09:13:03 +0000
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02]) by OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02%5]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 09:13:03 +0000
From: =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
To: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
CC: "konrad.dybcio@oss.qualcomm.com" <konrad.dybcio@oss.qualcomm.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"westeri@kernel.org" <westeri@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "YehezkelShB@gmail.com"
	<YehezkelShB@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "sven@kernel.org" <sven@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "andreas.noever@gmail.com"
	<andreas.noever@gmail.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 1/4] thunderbolt: add platform nhi driver
Thread-Topic: [PATCH 1/4] thunderbolt: add platform nhi driver
Thread-Index: AQHdaEhJ4pguqtEuU069KUF8fxIinrcVxh8AgAfHDgCAAAP+gIABqfkA
Date: Thu, 5 Nov 2026 09:13:02 +0000
Message-ID: <bf8472b20b9732874804cc497b85ac52844b9c3d.camel@mediatek.com>
References: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
	 <20261030082539.1208733-2-chunfeng.yun@mediatek.com>
	 <20261030084750.GP158991@black.igk.intel.com>
	 <c93100aad298d4ae1751ec60f037eb903f398658.camel@mediatek.com>
	 <20261104074823.GA176724@black.igk.intel.com>
In-Reply-To: <20261104074823.GA176724@black.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSNPR03MB9677:EE_|KUYPR03MB10143:EE_
x-ms-office365-filtering-correlation-id: 90a5dc38-30fb-4143-0789-08df3b1cfec6
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|6133799003|10067099003|22082099003|18002099003|38070700021|56012099006|4143699003|11063799006|261022105027099003|261102123227099003|261028144727099003|261022075727099003|261021121427099003|261009221727099003|261009223327099003|261009223027099003|261009221227099003|261009220027099003|261026121527099003|261026140227099003;
x-microsoft-antispam-message-info: AVCTbE6Q2+Qg80Ali6SvmMWLYJRtEA3Inlud6Kz6mXJgDRHyhFHNzk2id56PmQMgX6un5oRipR1QXdGK/i5uzaTVEXiuCNaySKXgv5QmMKbAXx4GN6YM9QkH6kqQwq7t8zCNLfsLUR8QaQGLMhloV4joCW2hmH4OOMJZZU015uqJlfI8m5BxO8y5G4laDzUrVrbv3YjIsbAr7lt7f+r/XR5TL0h1Om9jDn5tf6KVQs9uYMJmWtqpwWVWXEczSmOwMMEGfEPpbLngfsm0jhMmVAnEEhXN/6YKw+FbjfyALrWS5I7gHuVHMjh6SKRz5wm5+tHqhvi9xmp0Vu1QzOLTm+fY+HrSVWvqeS135ogYkL0d6CO5EjpZIYeh0Oku8GVCBSjnLz8j1wEbHovPr4Vy8xIm9KGeFBFTOQSpDguGsNc3xqAppDqtESlD/DahtmG2xeaZA8Gdjf8IesnUXI6j2A5/pbGDJyczNs7n/7pH260iEfkz54mnqCa9ju5P3PbI7Le9/bOsZPeArfwAGqHNPdvAzNrH4/XkYa5kfFKwKtrPFzNNZhRnSQMwFiYhk5H1VgIu6N1gRq05jfiqM1JVVSAoWjOB1Hq5v4JgGqO1YrFmGiZR90ZvDDgflf4vlKj07kfTMT7HG87PqbEFf9H+ktMJIkrh2Kt5hdPyQVdRudBxvijAuFqS40nEPCk/jKFF2wEBTz8WLUi6Zq/Ip2Vq6R6DGqySW1FmLm2qHGT4XmA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSNPR03MB9677.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(6133799003)(10067099003)(22082099003)(18002099003)(38070700021)(56012099006)(4143699003)(11063799006)(261022105027099003)(261102123227099003)(261028144727099003)(261022075727099003)(261021121427099003)(261009221727099003)(261009223327099003)(261009223027099003)(261009221227099003)(261009220027099003)(261026121527099003)(261026140227099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eklibGl6WU1pcnVROE0wSG45VUhKWkdRU3huTW1PKzlUblJ2d1ROZjBsSm9o?=
 =?utf-8?B?MWJKTyttNGxhOTd6bkNYWnM4YU9XanVVUlREa2Z6QTNWOEV4NDRnSmVCMVNz?=
 =?utf-8?B?ZlVsQUQxRzZSbmtESk8zczh5Sm1MSk1HbzZZdEQxOVBRVUUrM1UwUHNSRlpG?=
 =?utf-8?B?QVpjVHFPZjhSM1lxTVBPQXpNaWFtRytDRWl5aHhuNjNBd1JlUCtUd2Uxd2VK?=
 =?utf-8?B?NEQ1NlF4K3EvMmN6bjM2ZEVveTVMeThkREJMWG90bC9yczYxdGpWVFhta29n?=
 =?utf-8?B?RkY5emxiZ21tcE9CeHRZa1h1NFllcWN4OGNQaDFpbTkxNlBjVkt0V3pIUUFP?=
 =?utf-8?B?OGovYng3SXNaOGc5T3FjU01NU1hUODNTM2dpZWkyNmVFeVk1M1FYaHlrZEk0?=
 =?utf-8?B?TlM4SDBzVHRhT2YvclRhL1FFNzNrTkMvUHdOckQ0eU9FYjRFZlVNWWFzV2Y5?=
 =?utf-8?B?S21yT0hpRWxqcDR1K3BxeUNrdm1ENkIybjFoeC8xMi90UWRpR1J1c0Vabkgx?=
 =?utf-8?B?dVpCdzFsTkNMUGVRTGlNNzAwamhSSUV1T1ZaK3FOZWtBNnJQMHNpSTF5SStV?=
 =?utf-8?B?dXRudU8wSnFyK3pWclJ6dEwwNzN6dEdhYWlIdG9kcjZHSk1rUlNncnU3ZER0?=
 =?utf-8?B?ekhONkRJM3BGUFhDOXNyTXBYd3BLZ3BZYmdCakNJZ1RaYzluZWhhQmNjbjNu?=
 =?utf-8?B?VSs0enRhY2tiaEU1cGM1VWcwQTNxS3NicnFqNXI3aVMxaUo5ZEU0ZmU4VzdM?=
 =?utf-8?B?Z3J0RU93MThQckdWQ3JQbitndUJVaW93RE4xbnlzQmk0TnA0N0RLaHZQLzNG?=
 =?utf-8?B?WUdMN0NSR3EvQWV1ait6bzJ6dmQ3cVBhblhjckdwQkhQT25McGJyaFRJY2lD?=
 =?utf-8?B?bnhSREJiSVAvMkNlWWxoYUdaa3lvUGo4em5jUm5Qb25ZeExMa21veUszN1ps?=
 =?utf-8?B?K2VSblAwR21YWTFXR2YwdnRNWmc2U0xES2RoQ3djZ1VCZ3FmRVNWU1dlTEVr?=
 =?utf-8?B?VjlEYlFjQVlySkp4ZWE4K3hLa1QzZ2dLQ1ZFSGdNa2c5TEw3QXlPMEsxYzJs?=
 =?utf-8?B?MythYjdXaVRnN2p6RWxXUGh5YzF6SmJHUkJ2N3JITk9aakluSlE0enBJaFBM?=
 =?utf-8?B?STN0M2xINTFBMVNNekE4aDAvUjhhTi9peldreUhBYitTeHFuSlVwNEhLa2sr?=
 =?utf-8?B?WEd0YU5rVER3OWY3MmtNM3JhbXJ2QlhvbzY3cnFUcWIrTWthZVlRdUFZakJ3?=
 =?utf-8?B?NzA0Y2xrTythaWphRDFDd2F3U0dZcUlKYm5nYW50dllCdmg1a1Z1VnZjZStz?=
 =?utf-8?B?ZkxjMkJyRmhrZVJaWGtHbysvOU5uOUpuQUM0aUphOEUrTHQrc1d0UnZCU0NT?=
 =?utf-8?B?TXdnVWtkcnpMZ2xOeXl1TUhwZFRsejNTN1lsZXdUTk45R0Z4MnN2bzg5SmE0?=
 =?utf-8?B?bGhoTjBWdHE3YmxsQmo4eElaTmM1cEEyTk5DMHhhb3E2MDBpb1hZYWxpVXdr?=
 =?utf-8?B?ZHlkbi8ramlFTm04blAvc0NMVytHaGk3OGlCY2Z2TGZwb3BzMmtTN1N4L2My?=
 =?utf-8?B?T1lvT0lJM09mNk00L3dxb2FOcGg0VDVTM1pDTkZ1TU8zSmx6aXdGYithK2JC?=
 =?utf-8?B?MUZqMmdXdmliT2dpZ1hobnYwcFExbWQ1ZzZNNzNUbThVbVRxKzIyQVpIeity?=
 =?utf-8?B?WCt6TXNMM3M1YmpkTTdDTlV1b0RhR3BkTGxrSDR5MEhheGx2K3JlVWdjMUUw?=
 =?utf-8?B?VXBUeUo2NG13ZFdtc3NFSXhmS1lGbzBMT3JuSXB2UWZtTTZWTTNCVFVhSjR5?=
 =?utf-8?B?MUYrdW43b3R1cytQbGZJbnVWcDdDSkZUSW85ZVN2cDh1QXFUaWtuLzRyb2dI?=
 =?utf-8?B?cms3dkpGaTBHcUhxVlNTdGRKU0twTEE2R0tzK000b0V3M1FWckY1dzVhWG9P?=
 =?utf-8?B?UUN0VGIrTGluSGIrNlBkb2pNbVp3b1FFVTZNZThVRFdMWUJzd2pRZnd0STc5?=
 =?utf-8?B?dGY5eCtRSzRyOEhaclpFd3dDc28yQzBNdXRKRVdsR2VBVFg4WE8vczFqUnZh?=
 =?utf-8?B?T2crczl4ajV6dUNrcStteFN6RzRsUFdKYmxHNkFWblVGVzZxUUdJTzIwUmJp?=
 =?utf-8?B?L3pUVDcrVWVGVnFwQ2ovTkRQWGFFdmxSQnNoejN6VmpLNmNvalpuOWFjYVdW?=
 =?utf-8?B?UDJwd1pYeWVDOWRZOVFUc2UvdkxsZ2VpelhvcVhSc1pkSCtFZlc0b0k5Vk1i?=
 =?utf-8?B?d1FBUGcxd3JuWVllTlRJRDd3K3VkekVrVXRNVjNMVG5qRW5YTFlLd2FPMGtn?=
 =?utf-8?B?KzZOTE1oMC9WcEtCS2FtV05xZjhaVVQ0cjZ1K0VUN3NBMFFzUVkrVDNBcVJV?=
 =?utf-8?Q?OHxFNoH8QwQJ/WW0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AD2A3E8A7994BD4B920B5620B6B85883@apcprd03.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: J9OEnuoasz/hxxlw0Arf+paUXHgxTS0zgDbNHHu7mfRRh0l4DawvSIacFY7SZ4bPzOZpe6mc/2nMosqeJJkekEz9kLjd2QB4KsPrHmg4jK3jQUPm+D4QOU32BytanY5u/XsGVgVrbUIak5wCnuULMqJD/U+JbcQogxw38UE6ldE0NbvwPkV2eTEEvQ40BQJ3dyO0Ecusp0A8+HY93n0//pj+FKRLZwgdXufi1sgT8VcxBpkGViWYAMp8OlQhAgdw2IZLmv0LXTiaCdPKlmKnUH9H0CT/646zJjI186+MfI1Wmyj/YAlbs7dJJ6uUJuIBISfVNp5zyQYvWAg3YaWNdg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSNPR03MB9677.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90a5dc38-30fb-4143-0789-08df3b1cfec6
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2026 09:13:02.8869
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3BicCech9WDW2LXh1288m3D0zbnIbTEiG9YTnpNiD2RPTRCmpOc475xKB8wgCBBoLtegdEc2RHRf6PsZccrkleiOsbbhrgOnx/SEJy2u+io=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUYPR03MB10143
X-MTK: N

T24gV2VkLCAyMDI2LTExLTA0IGF0IDA4OjQ4ICswMTAwLCBtaWthLndlc3RlcmJlcmdAbGludXgu
aW50ZWwuY29tDQp3cm90ZToNCj4gSGksDQo+IA0KPiBPbiBXZWQsIE5vdiAwNCwgMjAyNiBhdCAw
NzozNDowN0FNICswMDAwLCBDaHVuZmVuZyBZdW4gKOS6keaYpeWzsCkgd3JvdGU6DQo+ID4gPiAN
Cj4gPiA+ID4gK3sNCj4gPiA+ID4gKwkvKg0KPiA+ID4gPiArCSAqIGF2b2lkIGRldmljZSBsaW5r
IGZhaWwgZm9yIHBjaWUgdHVubmVsDQo+ID4gPiA+ICsJICovDQo+ID4gPiANCj4gPiA+IFdoYXQn
cyB0aGlzP8KgDQo+ID4gZXhwbGFpbiB3aHkgY2FsbCB0aGVzZSBmdW5jdGlvbnMsIHdpdGhvdXQg
ZW5hYmxlIHBtIG9mIG5oaS0+ZGV2LA0KPiA+IHRiX2FjcGlfYWRkX2xpbmsoKSAtPiBkZXZpY2Vf
bGlua19hZGQoKSB3aWxsIGZhaWwNCj4gDQo+IERvIHlvdSBoYXZlIHRoZSBfRFNEIHdpdGggdGhl
ICJ1c2I0LWhvc3QtaW50ZXJmYWNlIj8NCj4gdGJfYWNwaV9hZGRfbGluaygpDQo+IHNob3VsZCB0
YWtlIGNhcmUgb2YgcnVudGltZSByZXN1bWluZyBib3RoLg0KWWVzLCBhZGQgaXQgaW4gcGNpZS91
c2IzIG5vZGVzIGluIEFDUEkuDQoNCj4gDQo+ID4gPiBBbmQgdGhlIGNvbW1lbnQgc3R5bGUgaXMg
bm90IHRoZSBleHBlY3RlZC4NCj4gPiB3aWxsIGZpeCBpdC4NCj4gPiANCj4gPiA+IA0KPiA+ID4g
PiArCXBtX3J1bnRpbWVfc2V0X2FjdGl2ZShuaGktPmRldik7DQo+ID4gPiA+ICsJcG1fcnVudGlt
ZV9nZXRfbm9yZXN1bWUobmhpLT5kZXYpOw0KPiA+ID4gPiArCWRldm1fcG1fcnVudGltZV9lbmFi
bGUobmhpLT5kZXYpOw0KPiA+ID4gDQo+ID4gPiBUaGlzIG1lYW5zIHdlIG5ldmVyIHJ1bnRpbWUg
c3VzcGVuZD8gVGhlbiB0aGlzIGlzIG5vdCBnb29kLg0KPiA+IE5vLCBqdXN0IGVuYWJsZSB0aGUg
ZGV2aWNlJ3MgcG0gYW5kIGdldCBhIGNvdW50IHRvIGxpbmsgcGNpZS91c2I0J3MNCj4gPiBkZXZp
Y2UsIGFuZCB3aWxsIHJlbGVhc2UgbGF0ZXIuDQo+ID4gDQo+ID4gPiANCj4gPiA+ID4gKw0KPiA+
ID4gPiArCXJldHVybiAwOw0KPiA+ID4gPiArfQ0KPiA+ID4gPiArDQo+ID4gPiA+ICtzdGF0aWMg
aXJxcmV0dXJuX3QgbmhpX3BsYXRfaXNyKGludCBpcnEsIHZvaWQgKmRhdGEpDQo+ID4gPiA+ICt7
DQo+ID4gPiA+ICsJc3RydWN0IHRiX25oaSAqbmhpID0gZGF0YTsNCj4gPiA+IA0KPiA+ID4gRGlk
IHlvdSBydW4gY2hlY2twYXRjaC5wbCBhZ2FpbnN0IHRoaXM/IElmIG5vdCBwbGVhc2UgZG8uDQo+
ID4gPiANCj4gPiA+ID4gKwlzY2hlZHVsZV93b3JrKCZuaGktPmludGVycnVwdF93b3JrKTsNCj4g
PiA+ID4gKwlyZXR1cm4gSVJRX0hBTkRMRUQ7DQo+ID4gPiA+ICt9DQo+ID4gPiA+ICsNCj4gPiA+
ID4gK3N0YXRpYyBpbnQgbmhpX3BsYXRfaW5pdF9pcnEoc3RydWN0IHRiX25oaSAqbmhpKQ0KPiA+
ID4gPiArew0KPiA+ID4gPiArCWludCByZXQ7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKwlJTklUX1dP
UksoJm5oaS0+aW50ZXJydXB0X3dvcmssIG5oaV9pbnRlcnJ1cHRfd29yayk7DQo+ID4gPiA+ICsN
Cj4gPiA+ID4gKwlyZXQgPSBkZXZtX3JlcXVlc3RfaXJxKG5oaS0+ZGV2LCBuaGktPmlycSwNCj4g
PiA+ID4gbmhpX3BsYXRfaXNyLA0KPiA+ID4gPiBJUlFGX05PX1NVU1BFTkQsDQo+ID4gPiA+ICsJ
CQnCoMKgwqDCoMKgwqAgZGV2X25hbWUobmhpLT5kZXYpLCBuaGkpOw0KPiA+ID4gPiArCWlmIChy
ZXQpDQo+ID4gPiA+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKG5oaS0+ZGV2LCByZXQsICJyZXF1
ZXN0DQo+ID4gPiA+IGlycQ0KPiA+ID4gPiBmYWlsZWRcbiIpOw0KPiA+ID4gPiArDQo+ID4gPiA+
ICsJcmV0dXJuIDA7DQo+ID4gPiA+ICt9DQo+ID4gPiA+ICsNCj4gPiA+ID4gK3N0YXRpYyB2b2lk
IG5oaV9wbGF0X2V4aXQoc3RydWN0IHRiX25oaSAqbmhpKQ0KPiA+ID4gPiArew0KPiA+ID4gPiAr
CWRldm1fZnJlZV9pcnEobmhpLT5kZXYsIG5oaS0+aXJxLCBuaGkpOw0KPiA+ID4gPiArCWZsdXNo
X3dvcmsoJm5oaS0+aW50ZXJydXB0X3dvcmspOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsJcG1fcnVu
dGltZV9wdXRfbm9pZGxlKG5oaS0+ZGV2KTsNCj4gPiA+ID4gKwlwbV9ydW50aW1lX2Rpc2FibGUo
bmhpLT5kZXYpOw0KPiA+ID4gPiArCXBtX3J1bnRpbWVfc2V0X3N1c3BlbmRlZChuaGktPmRldik7
DQo+ID4gPiA+ICt9DQo+ID4gPiA+ICsNCj4gPiA+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgdGJf
bmhpX29wcyBuaGlfcGxhdF9kZWZhdWx0X29wcyA9IHsNCj4gPiA+ID4gKwkuaW5pdCA9IG5oaV9w
bGF0X2luaXQsDQo+ID4gPiA+ICsJLnNodXRkb3duID0gbmhpX3BsYXRfZXhpdCwNCj4gPiA+ID4g
KwkuaW5pdF9pbnRlcnJ1cHRzID0gbmhpX3BsYXRfaW5pdF9pcnEsDQo+ID4gPiA+ICt9Ow0KPiA+
ID4gPiArDQo+ID4gPiA+ICtzdGF0aWMgaW50IG5oaV9wbGF0X3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpDQo+ID4gPiA+ICt7DQo+ID4gPiA+ICsJc3RydWN0IGRldmljZSAqZGV2
ID0gJnBkZXYtPmRldjsNCj4gPiA+ID4gKwlzdHJ1Y3QgdGJfbmhpICpuaGk7DQo+ID4gPiA+ICsN
Cj4gPiA+ID4gKwluaGkgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKm5oaSksIEdGUF9LRVJO
RUwpOw0KPiA+ID4gPiArCWlmICghbmhpKQ0KPiA+ID4gPiArCQlyZXR1cm4gLUVOT01FTTsNCj4g
PiA+ID4gKw0KPiA+ID4gPiArCW5oaS0+ZGV2ID0gZGV2Ow0KPiA+ID4gPiArCW5oaS0+b3BzID0g
Jm5oaV9wbGF0X2RlZmF1bHRfb3BzOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsJbmhpLT5pb2Jhc2Ug
PSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UocGRldiwgMCk7DQo+ID4gPiA+ICsJaWYg
KElTX0VSUihuaGktPmlvYmFzZSkpDQo+ID4gPiA+ICsJCXJldHVybiBQVFJfRVJSKG5oaS0+aW9i
YXNlKTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArCW5oaS0+aXJxID0gcGxhdGZvcm1fZ2V0X2lycShw
ZGV2LCAwKTsNCj4gPiA+ID4gKwlpZiAobmhpLT5pcnEgPCAwKQ0KPiA+ID4gPiArCQlyZXR1cm4g
ZGV2X2Vycl9wcm9iZShkZXYsIG5oaS0+aXJxLCAiZ2V0IGlycQ0KPiA+ID4gPiBmYWlsZWRcbiIp
Ow0KPiA+ID4gPiArDQo+ID4gPiA+ICsJcmV0dXJuIG5oaV9wcm9iZShuaGkpOw0KPiA+ID4gPiAr
fQ0KPiA+ID4gPiArDQo+ID4gPiA+ICtzdGF0aWMgdm9pZCBuaGlfcGxhdF9kb19yZW1vdmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwNCj4gPiA+ID4gYm9vbA0KPiA+ID4gPiByZXNldCkN
Cj4gPiA+ID4gK3sNCj4gPiA+ID4gKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Ow0K
PiA+ID4gPiArCXN0cnVjdCB0YiAqdGIgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsNCj4g
PiA+ID4gKwlzdHJ1Y3QgdGJfbmhpICpuaGkgPSB0Yi0+bmhpOw0KPiA+ID4gPiArDQo+ID4gPiA+
ICsJLyoNCj4gPiA+ID4gKwkgKiBPbiBzeXN0ZW0gc2h1dGRvd24vcmVib290IGZvcmNlIGEgaG9z
dCByb3V0ZXIgcmVzZXQNCj4gPiA+ID4gc28NCj4gPiA+ID4gdGhlDQo+ID4gPiA+ICsJICogQ00g
YXNzZXJ0cyBEUFIgb24gY29ubmVjdGVkIHRidDMgZGV2aWNlcyBiZWZvcmUgdGhlDQo+ID4gPiA+
IHJvdXRlciB0cmVlDQo+ID4gPiA+ICsJICogaXMgcmVtb3ZlZCAoc2VlIHRiX3N0b3AoKSkuDQo+
ID4gPiA+ICsJICovDQo+ID4gPiA+ICsJaWYgKHJlc2V0KQ0KPiA+ID4gPiArCQluaGktPmhvc3Rf
cmVzZXQgPSB0cnVlOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsJcG1fcnVudGltZV9nZXRfc3luYyhk
ZXYpOw0KPiA+ID4gPiArCXBtX3J1bnRpbWVfZG9udF91c2VfYXV0b3N1c3BlbmQoZGV2KTsNCj4g
PiA+ID4gKw0KPiA+ID4gPiArCXRiX2RvbWFpbl9yZW1vdmUodGIpOw0KPiA+ID4gPiArCXdhaXRf
Zm9yX2NvbXBsZXRpb24oJm5oaS0+ZG9tYWluX3JlbGVhc2VkKTsNCj4gPiA+ID4gKwluaGlfc2h1
dGRvd24obmhpKTsNCj4gPiA+ID4gK30NCj4gPiA+ID4gKw0KPiA+ID4gPiArc3RhdGljIHZvaWQg
bmhpX3BsYXRfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gPiA+ICt7
DQo+ID4gPiA+ICsJbmhpX3BsYXRfZG9fcmVtb3ZlKHBkZXYsIGZhbHNlKTsNCj4gPiA+ID4gK30N
Cj4gPiA+ID4gKw0KPiA+ID4gPiArc3RhdGljIHZvaWQgbmhpX3BsYXRfc2h1dGRvd24oc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiA+ID4gK3sNCj4gPiA+ID4gKwluaGlfcGxhdF9k
b19yZW1vdmUocGRldiwgdHJ1ZSk7DQo+ID4gPiA+ICt9DQo+ID4gPiA+ICsNCj4gPiA+ID4gKw0K
PiA+ID4gPiArI2lmZGVmIENPTkZJR19PRg0KPiA+ID4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBv
Zl9kZXZpY2VfaWQgbmhpX3BsYXRfb2ZfbWF0Y2hbXSA9IHsNCj4gPiA+ID4gKwl7IC5jb21wYXRp
YmxlID0gInRodW5kZXJib2x0LXBsYXRmb3JtIiB9LA0KPiA+ID4gDQo+ID4gPiBOb3Qgc3VyZSBp
ZiB0aGlzIGlzIGNvcnJlY3Q/IFNob3VsZCB0aGlzIGhhdmUgbWVkaWF0ZWssLi4uID8NCj4gPiBz
dGlsbCBuZWVkIGEgY29tbW9uIG9uZSwgYW5kIGFsc28gYWRkIGEgbWVkaWF0ZWssdGh1bmRlcmJv
bHQ/DQo+ID4gDQo+ID4gYnV0IHRoZSBjdXJyZW50IHBsYXRmb3JtIGlzIHJ1bm5pbmcgb24gdWVm
aS9hY3BpIGJ1dCBub3QgYmFzZWQgb24NCj4gPiBkdHMsDQo+ID4gDQo+ID4gc2hvdWxkIEkgYWRk
IGEgZHQtYmluZGluZyBmb3IgaXQ/DQo+IA0KPiBUaGVuIG5vLCB0aGF0IHdpbGwgYmUgYWRkZWQg
d2hlbiB0aGVyZSBpcyB1c2VyIGZvciB0aGF0Lg0KPiANCj4gPiA+ID4gKwl7IH0NCj4gPiA+ID4g
K307DQo+ID4gPiA+ICtNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBuaGlfcGxhdF9vZl9tYXRjaCk7
DQo+ID4gPiA+ICsjZW5kaWYNCj4gPiA+ID4gKw0KPiA+ID4gPiArI2lmZGVmIENPTkZJR19BQ1BJ
DQo+ID4gPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGFjcGlfZGV2aWNlX2lkIG5oaV9wbGF0X2Fj
cGlfbWF0Y2hbXSA9IHsNCj4gPiA+ID4gKwl7ICJBQ1BJMDAxNSIsIDAgfSwNCj4gPiA+IA0KPiA+
ID4gU2FtZSBoZXJlLCB3aGVyZSBpcyB0aGlzIElEIGRlZmluZWQgaW4gdGhlIEFDUEkgc3BlYz8N
Cj4gPiBzZWUgYWNwaSBzcGVjIHJlbGVhc2UgNi41LCBzZWN0aW9uIDUuNi43IERldmljZSBDbGFz
cy1TcGVjaWZpYw0KPiA+IE9iamVjdHMsDQo+ID4gVGFibGUgNS4yMDU6IEFDUEkgRGV2aWNlIElE
cw0KPiA+IA0KPiA+IEFDUEkwMDE1DQo+ID4gVVNCNCBob3N0IGludGVyZmFjZSBkZXZpY2UuIFNl
ZSBMaW5rcyB0byBBQ1BJLVJlbGF0ZWQgRG9jdW1lbnRzDQo+ID4gdW5kZXINCj4gPiB0aGUgaGVh
ZGluZyDigJxVU0I0IEhvc3QgSW50ZXJmYWNlIFNwZWNpZmljYXRpb27igJ0NCj4gDQo+IE9rYXks
IEkgbWlzc2VkIHRoYXQuIFRoZW4gdGhpcyBpcyBmaW5lLiBUaGFua3MuDQo+IA0KPiA+ID4gPiAr
CXsgfQ0KPiA+ID4gPiArfTsNCj4gPiA+ID4gK01PRFVMRV9ERVZJQ0VfVEFCTEUoYWNwaSwgbmhp
X3BsYXRfYWNwaV9tYXRjaCk7DQo+ID4gPiA+ICsjZW5kaWYNCj4gPiA+ID4gKw0KPiA+ID4gPiAr
c3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbmhpX3BsYXRfZHJpdmVyID0gew0KPiA+ID4g
PiArCS5wcm9iZSA9IG5oaV9wbGF0X3Byb2JlLA0KPiA+ID4gPiArCS5yZW1vdmUgPSBuaGlfcGxh
dF9yZW1vdmUsDQo+ID4gPiA+ICsJLnNodXRkb3duID0gbmhpX3BsYXRfc2h1dGRvd24sDQo+ID4g
PiA+ICsJLmRyaXZlciA9IHsNCj4gPiA+ID4gKwkJLm5hbWUgPSAidGh1bmRlcmJvbHQiLA0KPiA+
ID4gPiArCQkub2ZfbWF0Y2hfdGFibGUgPQ0KPiA+ID4gPiBvZl9tYXRjaF9wdHIobmhpX3BsYXRf
b2ZfbWF0Y2gpLA0KPiA+ID4gPiArCQkuYWNwaV9tYXRjaF90YWJsZSA9DQo+ID4gPiA+IEFDUElf
UFRSKG5oaV9wbGF0X2FjcGlfbWF0Y2gpLA0KPiA+ID4gPiArCQkucG0gPSAmbmhpX3BtX29wcywN
Cj4gPiA+ID4gKwl9LA0KPiA+ID4gPiArfTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArbW9kdWxlX3Bs
YXRmb3JtX2RyaXZlcihuaGlfcGxhdF9kcml2ZXIpOw0KPiA+ID4gPiArTU9EVUxFX0FMSUFTKCJw
bGF0Zm9ybTp0aHVuZGVyYm9sdCIpOw0KPiA+ID4gPiArTU9EVUxFX0RFU0NSSVBUSU9OKCJUaHVu
ZGVyYm9sdC9VU0I0IHBsYXRmb3JtIGhvc3QgaW50ZXJmYWNlDQo+ID4gPiA+IGRyaXZlciIpOw0K
PiA+ID4gPiArTU9EVUxFX0xJQ0VOU0UoIkdQTCB2MiIpOw0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy90aHVuZGVyYm9sdC90Yi5oDQo+ID4gPiA+IGIvZHJpdmVycy90aHVuZGVyYm9sdC90
Yi5oDQo+ID4gPiA+IGluZGV4IGU4Njg0NTc2MmUyMi4uNmRmZGM0N2UwNWQyIDEwMDY0NA0KPiA+
ID4gPiAtLS0gYS9kcml2ZXJzL3RodW5kZXJib2x0L3RiLmgNCj4gPiA+ID4gKysrIGIvZHJpdmVy
cy90aHVuZGVyYm9sdC90Yi5oDQo+ID4gPiA+IEBAIC03NjgsOCArNzY4LDYgQEAgZXh0ZXJuIGNv
bnN0IHN0cnVjdCBkZXZpY2VfdHlwZQ0KPiA+ID4gPiB0Yl9yZXRpbWVyX3R5cGU7DQo+ID4gPiA+
IMKgZXh0ZXJuIGNvbnN0IHN0cnVjdCBkZXZpY2VfdHlwZSB0Yl9zd2l0Y2hfdHlwZTsNCj4gPiA+
ID4gwqBleHRlcm4gY29uc3Qgc3RydWN0IGRldmljZV90eXBlIHVzYjRfcG9ydF9kZXZpY2VfdHlw
ZTsNCj4gPiA+ID4gwqANCj4gPiA+ID4gLWludCB0Yl9kb21haW5faW5pdCh2b2lkKTsNCj4gPiA+
ID4gLXZvaWQgdGJfZG9tYWluX2V4aXQodm9pZCk7DQo+ID4gPiA+IMKgaW50IHRiX3hkb21haW5f
aW5pdCh2b2lkKTsNCj4gPiA+ID4gwqB2b2lkIHRiX3hkb21haW5fZXhpdCh2b2lkKTsNCj4gPiA+
ID4gwqANCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvdGh1bmRlcmJvbHQuaA0K
PiA+ID4gPiBiL2luY2x1ZGUvbGludXgvdGh1bmRlcmJvbHQuaA0KPiA+ID4gPiBpbmRleCA1NzUw
MmRhMjkwODAuLjIxMmM4ZmVhNjU3MSAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvaW5jbHVkZS9saW51
eC90aHVuZGVyYm9sdC5oDQo+ID4gPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvdGh1bmRlcmJvbHQu
aA0KPiA+ID4gPiBAQCAtNTMyLDYgKzUzMiw3IEBAIHN0cnVjdCB0Yl9uaGkgew0KPiA+ID4gPiDC
oAl1MzIgKmludGVycnVwdF9tYXNrOw0KPiA+ID4gPiDCoAlib29sIGdvaW5nX2F3YXk7DQo+ID4g
PiA+IMKgCWJvb2wgaW9tbXVfZG1hX3Byb3RlY3Rpb247DQo+ID4gPiA+ICsJaW50IGlycTsNCj4g
PiA+IA0KPiA+ID4gWW91IGFyZSBtaXNzaW5nIGtlcm5lbC1kb2MuDQo+ID4gd2lsbCBmaXggaXQu
DQo+ID4gDQo+ID4gVGhhbmtzDQo+ID4gDQo+ID4gPiANCj4gPiA+ID4gwqAJc3RydWN0IHdvcmtf
c3RydWN0IGludGVycnVwdF93b3JrOw0KPiA+ID4gPiDCoAl1MzIgaG9wX2NvdW50Ow0KPiA+ID4g
PiDCoAl1bnNpZ25lZCBsb25nIHF1aXJrczsNCj4gPiA+ID4gLS0gDQo+ID4gPiA+IDIuNDMuMA0K
PiA+ID4gDQo+ID4gDQoNCg==
