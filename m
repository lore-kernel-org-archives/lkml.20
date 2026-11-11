Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794364027;
	b=GQuGtKsk/Zpas51vwcc4LFi5b0OkBRK+G27U3o5IypgJ5maV13Rhdl6hAQbAl3U+Gllv
	 cUxWDilDwBG7kQD4XYcr2oobdNosYiwsHgT99zkrve1L03FdIE7UtgSLu5KyG37DhS6W+
	 7FlVArleXozJ9IJv7QNuKOlof8OITOweYoNgBf0Own9W5a2KemS5fUYvSpyWukJmQ1emd
	 YN4ZuYSxoD8LNhzs+wGC2UK+nAOdivG4flt7N0gct2gA+6N0FIJqaAFDPow7wfRhrfOWU
	 Ow/HOFi4xFN9s27rbgLWekuGcQIiWtcS7re/KNo35EKHc34x9Sxg1D1701mRmzFHB8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364027;
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
	bh=HRqBPReMKl/4beX9odE8hyq3PZMlxUPjr3cXW5RJbQg=;
	b=Y4wXO9ozQcATGlYdyM0pVRMM/Am5tnqHuT/w+bzHgLKw8Q8dWeOfG9JMelPjUMTwyHc6
	 +q2MusvtdhOrywrTbW4pO2Ge3fyb/WF2REkKRLdhFS7eTbQmgBPwTwJwg6xi633la8VYp
	 9fcfYL9HRPa4oXh2TeTEgdVBBH1oIZ4jsHcvsHh0dujN2jw6LhepI5SIfAR2aqk6Enc0T
	 w3IVOXcXJqcjyyV+pVxyF6ZgdQ7v1eu4FvgJD3FaZKoMhdjJ/59GGJKWT3UxdgIkLZWVV
	 VZP1Xj0onvfu9MXcunv0XSQUg+YmZLICGcmrA/v13HhPvExh6yCtc2+OcXW1LL5rxoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=mE0HZ8M6;
	dkim=pass header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=iFPAsYCj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBDE606A324;
	Wed, 11 Nov 2026 02:27:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FBDE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=mE0HZ8M6;
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=iFPAsYCj
X-UUID: 608069d6dd7711f18dc8c9802ae25ab1-20261111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=HRqBPReMKl/4beX9odE8hyq3PZMlxUPjr3cXW5RJbQg=;
	b=mE0HZ8M6LIP4R7k+PrcM3CCO2ABY3X4Twwt3HgK4NbuoK5ypAXx3Z0TqNCDN19qq1eb9LSyvdZhFgef4wYROU1idW0IN503LCDb3MfYACemwCcWKYKUdiQB2WjH66UF6S6Q79Iegn1p8eLQzv1au1s4rL7MzKyYVAUt+uePBHa0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:5d1a9003-7025-47fe-b071-a1ab78b2e176,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:ac1d2066-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|51|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 608069d6dd7711f18dc8c9802ae25ab1-20261111
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2049320446; Wed, 11 Nov 2026 10:27:01 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 11 Nov 2026 10:27:01 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 11 Nov 2026 10:27:00 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQlZAgvODZYVO6zcQmdLJuBA7H3SHDKHC4NWHYCT+FIITxnPpUwtBOxYY6f1YbNXjy3CQe+gi2k7yhys2OqShCzW0pzOrmWWwLvhR6rVIRxV4hlwrGzZwr+s2tOPmmZov+rD+MXDZJ6rHt5Xh9IQwl0Bad4XCfsghiBmla6XoWs5sAbyLk89lAyeDYJ63I6W01/2hIUTkP7CxlfompnoSGJQYO1WEvoZFOsukWEDYhrSVLMEyjErpLWSM8e2V0ufr1Z3pVKZTvspPgC0YGaig5VtgdgIm7bw/oW63rN9psmeqPzkHQle+K7intDgvUie+ej8saz2iITQeC0eTr5wNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRqBPReMKl/4beX9odE8hyq3PZMlxUPjr3cXW5RJbQg=;
 b=q+KMYGjNx6B+IiaPASeVjBu4BeTCyVVOuL9s/v8PjK3exImv3rWuwYn1TW1Wb110thbUfrFrWiRixSsL0i+aizJTiM9h1A58M80xZXdtPMpFuIpi9oWtd0WqdiaEAsNDKZRgCYg68B0R/SRgybznffvOASkUaHLwyvIKAFlDs/ILA9ikI0/1l66ZWNE+EWjMmh+RJ8/cgZjxXDp/gehtSa+YC7NXOC24crbpnQfpNL4F3NgLFRGn1G84I+POLke0kDsrhU5X68HxmTK2ZfyjYqR5A0y8uEl+lan8gXi+tBHguPWcmEYoAiL2okJr1EoVSfykFJMSNRhpzzpF8nxjEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRqBPReMKl/4beX9odE8hyq3PZMlxUPjr3cXW5RJbQg=;
 b=iFPAsYCjvUKLXEH8JJiW3tPXcWX7AxlM17wdMcV6fvfqOM9g58IRB8775y2YuF3QJiFVUbL6Q5eK5f+tIhKjDU5+8uwAT6dqNkBeSp33+Jjt7e2SUm2JPax3dVIu66ehKMezPYYKNyKF7XP+6/tYwuKVrxPKNmYZD6KNgiYTp2Q=
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com (2603:1096:604:471::11)
 by SEYPR03MB8077.apcprd03.prod.outlook.com (2603:1096:101:16b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 02:26:52 +0000
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02]) by OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02%5]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 02:26:51 +0000
From: =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
To: "konrad.dybcio@oss.qualcomm.com" <konrad.dybcio@oss.qualcomm.com>,
	"westeri@kernel.org" <westeri@kernel.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, "YehezkelShB@gmail.com"
	<YehezkelShB@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "sven@kernel.org" <sven@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "andreas.noever@gmail.com"
	<andreas.noever@gmail.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2 1/7] thunderbolt: Prefix NHI core functions with tb_
 and tb_ring_
Thread-Topic: [PATCH v2 1/7] thunderbolt: Prefix NHI core functions with tb_
 and tb_ring_
Thread-Index: AQHdcQmVv4uT5Db9bk2yFBHw9HxRLLcnP8QAgADmXwA=
Date: Wed, 11 Nov 2026 02:26:51 +0000
Message-ID: <a9de1106109278a5031a03d3fe40975a57057e64.camel@mediatek.com>
References: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
	 <20261110114925.722014-2-chunfeng.yun@mediatek.com>
	 <7fb5ae20-c4f3-4aad-8d7a-a37a6ad15fb7@oss.qualcomm.com>
In-Reply-To: <7fb5ae20-c4f3-4aad-8d7a-a37a6ad15fb7@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSNPR03MB9677:EE_|SEYPR03MB8077:EE_
x-ms-office365-filtering-correlation-id: c0c74dc4-e159-4db2-25e9-08df3f9b3ecf
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|22082099003|18002099003|6133799003|10067099003|4143699003|11063799006|261102130727099003|261009223027099003|261102123227099003|261028144727099003|261021121427099003|261022075727099003|261026140227099003|56012099006|261022105027099003|261026121527099003|38070700021;
x-microsoft-antispam-message-info: dHGWOjXKPV72LT47lsW3lNyixnkQ2lvoFfgZ8uN1hYuhq8MVPxo0fAm412v+lALfPUxzRFLD/es9KzjfHWWTLGL/MXuimLGIWFAERfk3+MoDlXQ5kGs6/bqTwKyEOXv1LXDg8rTpok7VtlxiOQ9Uf0Z++jpMWz8KLw2L+7IJQmi5SSCvVh+z06oj+SgU5orfc6hidjWzrdvP4lBSKX02nqJflGVcb+ubCTxuH5hmnmbmoBNSRAL9LDlOfwKcApsdrYft4MCdUImm0iOM3aGsbAB4VucE1W84g1kCxzOrpGBsqofF9eztd6cOj3DofUJSU/PZUrDVBRcvXkCKWf1k4fVrR3jhVDyKu0lTOC0Pu8dP++jtAnANMfMdhXHwfQ/gZsXboKJ/Jr+55KhAskSM/oqDL51nhdB9+0mie/nV+bNksrQ1MN8FOZ0+3VXs3FSDcVAmNrA9QwPrKl+Xkv0QJ/okIL6ODx3I/Wo2SMl7mZdYl1dLGR/ulywO9LGeMR93qO7EfsURqgZDjgIEQHYavLC1EQHqL0MVandNGgq/KrenfwBOpkwxJRWVMHOfD2VDpm+jFIv1hN8O1g29rHGeUAMFCPbXvYekCSxx8opVK52LYwweRasy38O6m+MS/hS+iDDpZRlNllCQDcC2+1ZzhnJ8Qon+CfDyM/07GX9L6PvftNu3nmsYpwztdVScOTxdtKWAgu4T2sNtDN1fL9fhuN1zRB1C9eae5cjDmFIGi58=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSNPR03MB9677.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(22082099003)(18002099003)(6133799003)(10067099003)(4143699003)(11063799006)(261102130727099003)(261009223027099003)(261102123227099003)(261028144727099003)(261021121427099003)(261022075727099003)(261026140227099003)(56012099006)(261022105027099003)(261026121527099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bVhqdU43QTNIVnJLMUVtRTU0b2N5aDlyei9EcUNLS2piUk92U1BHTEhIbnov?=
 =?utf-8?B?MXc0WlNLaGtzVTB0ZXV4bktjUm5pT1pXQllqM3Y0Tm1DRml2bG1Od1c2eGFl?=
 =?utf-8?B?SGo4TDNzSlFBRTVRME5vTjZTcXI0d0NoeTM2TFcrTlR5V2U3ZnFrcGMwV0ha?=
 =?utf-8?B?SmExSjlzQXhFUWlLYXVXTVRQQ1NxNW1UK3gvOHUxcy9uUFpGSjd1Q3lvZHFk?=
 =?utf-8?B?bmUvbmd1RU4wdEFZaUxsVFRBOGhKU01keURZZjYxdXJMU2RKMFhqNVFVU1U3?=
 =?utf-8?B?bHdaOHFaWGF6Z2dxN3JveW13eGNVcTVWZ3l3d3cxS2hkam93TE5MMlY3YjN2?=
 =?utf-8?B?QlFEdmo0S1h2VitFNEE0ZEUyMWtaOTh1cDJnbmlDdzdjOFY4NUw2TWdCdi9L?=
 =?utf-8?B?SHlIWWpOUjNNNnJMbkMyVFg2ZjdlZTgrRlZGNEZPMko5STNYVHJUWmNHeGdi?=
 =?utf-8?B?M3ZySXhPVGV4ZmNKREk3dFAzMnBLVHRTQ0d1MVcweUhleHN4ZUh5ZktNWTB2?=
 =?utf-8?B?QTAyYW83dG1YbWNKU0RlT2E4QnAzVDBVYlpmZmloWHhkczdhaE03Zkk0WTVD?=
 =?utf-8?B?TFZrSDV5ZlB5TGxUSWttME9STWkvcTRRSWQ0ZGVpQmszajV5am91ZkJIUm1n?=
 =?utf-8?B?T3podGlpOFRTR21yK2NIUHFIeCtoU0o4ditrRHo5T1RVbitXQ2o3eUVDSUdB?=
 =?utf-8?B?RGF1dmZFaklQMUNIY1pCQzRVdFZSQzRFRnA0SW94Ui9VU1pJZEkzYVIrYUc4?=
 =?utf-8?B?SUk5c1ZxMCtvRCtpa0k0aVdFVWVPcWpiUmdvWjU4a3lmLzNhT2ZhZ3YvSmY3?=
 =?utf-8?B?ZDJPTEZEa2dlQ3lmOWlGYmlaZHc1ZktyTExxUUZrNjVDeVhYUGVlWFR0OXB5?=
 =?utf-8?B?STRhbmVtd2ZpQm1Tam5hTmhMbGM4eDgyaHdERTJtMXpJVlluMWU1dDZ3SGxZ?=
 =?utf-8?B?bHE5UEZNWmRLUWdFaUVMNUhsdUNKVnZ5K0lTSE84TlVzWE1rZDRYZlM0ejkv?=
 =?utf-8?B?WGVHZlZVR2NMbE9LQXl1Zld0L09sZUpMU1IwV0RuNFc1Rlphek9kT0Q5aE1k?=
 =?utf-8?B?M29KZ1Y2Q2loVGh2K3QwTXdvbCtHTWhPNWtoVmlwc3FsODg0eDB0ZE9rSlZ6?=
 =?utf-8?B?Z2R4ZGFiMjR1ZU5YVWZ3RG5VTk5xRnVaY243Rm1yOUtWdG82clhtWFp1Tmxw?=
 =?utf-8?B?Q3l4dlJoODZ1SEhsS3YwUG5kdTJQNVh3YTBJbUFCQkEva0U1VklqMUZFbzFK?=
 =?utf-8?B?K0hMZWUzR2Y1NEpRUTZhMHRNZmR5UE9ZeXd3bDBRZmxSUVA1VzV0bng3a1RD?=
 =?utf-8?B?TFd4Z1dLdHFIOGlueUQ3NmpoejdMYURZaERscEZDcDRVcDNNRUlUQVJhd2hC?=
 =?utf-8?B?WG53VVBmUEtvUnFsbTJmb2JuTmZwY05tRjNvd0UrT296N3VKWnFiRUorYnVQ?=
 =?utf-8?B?OHMvRkxyeUo2UnVBeTNLTWtQYXZ5UjRoUmZPMVpVMUJIRVZhdjZDaTlua1Ft?=
 =?utf-8?B?L285SGFUVHB0bVowWVJIUXd6bWlacDZ2TG5VcUVaR3R1WEliMkVBcnhXalZa?=
 =?utf-8?B?bkdsbC9HK1BycG5aTXA1emc3SFl4WTdvUU1xTE9YYzQ1S2MzL2dURExCK3Nm?=
 =?utf-8?B?aXE3WkdvVFFIdmZTYlNRbkpIL1pKVmN6T2JqejdCU0FTQ2djVGhuT3hGeEV4?=
 =?utf-8?B?bkJDVTdQdXo1eVZnU2ttYTBNa2gycFZzY1kraTVoUWZleG9CTW5ZRlVzZ0s3?=
 =?utf-8?B?WmtzYVhhenZuUWI0S3p4bzFvcGJCWk5EZE9UU0RRRHlwYnpQTWZsa2xncU5u?=
 =?utf-8?B?VXh3VWFsWVJIMG44eVB0dGdVTlBuRTRwQmFWVFNSWWQ5cGVmRVIrOXo1ZWMy?=
 =?utf-8?B?SkF0ODluNGtldGZseG43eFFOODBiRWxJbm5UbDlIMGsxNUJ0aW1xZ3JKaHRn?=
 =?utf-8?B?cTlCdHNiN0x3M2tjZDUwVzFJdlJPV1AxeW1zem1WTFFscXJoVlZ5a0pYWEVY?=
 =?utf-8?B?NmxKcGVaT2JZdmJzdG5LYXdwUXNDS2tsU3VrTVlLTGU0b1IzUzNRY3pYeHV3?=
 =?utf-8?B?VTZMd0xTWlFINy9hM2JkUE80SU5QdUlFc0MwWE12SGRpVXpsM2pYc3NwWjNQ?=
 =?utf-8?B?M3RQZlhhak1lVUg3QzQrU0t4SURuZm1SczJYRjJPMGFPZngwTHptL281bklK?=
 =?utf-8?B?U0JvcVVHN2lhY3R5bHNQbTFyaGN3N1FyZG9NZ3c0a0xvdlVHSVJCQjFyTTJk?=
 =?utf-8?B?MjU4c083OXlkNDlWWGRmVWMrSUFzWVBid1hOakdlTG1jSUtyL2I2MWFFd0Fv?=
 =?utf-8?B?WThUUUR3aGlRVjBybC9kQkVONjFqODliblJxelNZT3FTVjArMTZIOUhtMlRK?=
 =?utf-8?Q?HAS1CGvu6cMEMJu8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <551BBD75B5694B46A6969059EB80C124@apcprd03.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: vmwViiq1QUy3kcNAYNstLfZlHfYOs/dTGdSSdv7gTwqZC/YS8aiQK6dpyws7ka3G/PxHhaMsiyoK+8PWXCqO7cDXEDdpBqk9Jdy3gZtKmYbX4i275rJOiNawBALTW33riPX9IOoaO927hZXh4WYVUJQCmwqmXh/LdUdF5m0EXvrioSzXyIwtNYV9TLly5DLbaZ3SodF4e0vV121Oq62cmETxS4BXOeZFKkjJAI6cmSbWHM8Bey5sKbGjNmpwkbW5RJIziDZ/1RIznoVFJKE7Ymn3X52upxkdfC46rUZ8WWFF7HCY9dHFIZkPyYZsaDsbeArjqaqyCKSeRiuuvUQsJA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSNPR03MB9677.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c74dc4-e159-4db2-25e9-08df3f9b3ecf
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2026 02:26:51.5857
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vuEj6p7WWZxYgPmB40UGdx2rqBBsyW+jBlrPBLocN2fn99gX0I7KnajCtp3BBVEKY7YRTHTwRg7W/9RcIGzA8+jClniPXtQy5ze0/e3/9pU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8077
X-MTK: N

T24g5LqMLCAyMDI2LTExLTEwIGF0IDEzOjQyICswMTAwLCBLb25yYWQgRHliY2lvIHdyb3RlOg0K
PiANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4g
YXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUg
Y29udGVudC4NCj4gDQo+IA0KPiBPbiAxMS8xMC8yNiAxMjo0OCBQTSwgQ2h1bmZlbmcgWXVuIHdy
b3RlOg0KPiA+IEluIHByZXBhcmF0aW9uIGZvciBtb2R1bGFyaXppbmcgUENJZSBOSEkgc3VwcG9y
dCBhbmQgYWxsb3dpbmcgUENJZQ0KPiA+IGFuZCBwbGF0Zm9ybSBOSEkgZHJpdmVycyB0byBiZSBi
dWlsdCBhcyBzZXBhcmF0ZSBtb2R1bGVzIGF0b3AgdGhlDQo+ID4gVGh1bmRlcmJvbHQgY29yZSBm
cmFtZXdvcmssIHNldmVyYWwgTkhJIGZ1bmN0aW9ucyBhbmQgc3RydWN0dXJlcw0KPiA+IHdpbGwN
Cj4gPiBuZWVkIHRvIGJlIGV4cG9ydGVkLg0KPiA+IA0KPiA+IEN1cnJlbnRseSwgc2V2ZXJhbCBv
ZiB0aGVzZSBmdW5jdGlvbnMgbGFjayBzdGFuZGFyZCBzdWJzeXN0ZW0NCj4gPiBwcmVmaXhlcywN
Cj4gPiByaXNraW5nIG5hbWVzcGFjZSBwb2xsdXRpb24gb3IgY29sbGlzaW9ucyBhY3Jvc3MgdGhl
IGZsYXQga2VybmVsDQo+ID4gc3ltYm9sDQo+ID4gbmFtZXNwYWNlOg0KPiA+IA0KPiA+IC0gcmlu
Z19tc2l4KCkgbGFja3MgYW55IHN1YnN5c3RlbSBwcmVmaXggYW5kIGRpdmVyZ2VzIGZyb20gYWxs
DQo+ID4gb3RoZXINCj4gPiDCoCBleHBvcnRlZCByaW5nIGZ1bmN0aW9ucyBpbiB0aGUgZHJpdmVy
LCB3aGljaCB1c2UgdGhlICJ0Yl9yaW5nXyINCj4gPiBwcmVmaXguDQo+ID4gLSBuaGlfcHJvYmUo
KSwgbmhpX3NodXRkb3duKCksIGFuZCBuaGlfcG1fb3BzIGxhY2sgdGhlIHN0YW5kYXJkDQo+ID4g
InRiXyINCj4gPiDCoCBwcmVmaXggdXNlZCBhY3Jvc3MgdGhlIFRodW5kZXJib2x0IHB1YmxpYyBp
bnRlcmZhY2UgKHN1Y2ggYXMNCj4gPiBzdHJ1Y3QNCj4gPiDCoCB0Yl9uaGkgYW5kIHN0cnVjdCB0
Yl9uaGlfb3BzKS4NCj4gPiAtIG5oaV9tc2koKSBpcyBuYW1lZCBhZnRlciBQQ0kgTVNJLCBldmVu
IHRob3VnaCB0aGUgSVNSIHNpbXBseQ0KPiA+IHNjaGVkdWxlcw0KPiA+IMKgIHRoZSBpbnRlcnJ1
cHQgd29yayBhbmQgY2FuIHNlcnZlIGFzIGEgZ2VuZXJpYyBJU1IgZm9yIG5vbi1QQ0llDQo+ID4g
cGxhdGZvcm0NCj4gPiDCoCBjb250cm9sbGVycyBhcyB3ZWxsLg0KPiA+IA0KPiA+IFJlbmFtZSB0
aGVzZSBmdW5jdGlvbnMgYW5kIHN5bWJvbHMgdG8gY29uZm9ybSB0byBUaHVuZGVyYm9sdA0KPiA+
IHN1YnN5c3RlbQ0KPiA+IG5hbWluZyBjb252ZW50aW9ucyBiZWZvcmUgZXhwb3J0aW5nIHRoZW06
DQo+ID4gDQo+ID4gLSByaW5nX21zaXjCoMKgwqDCoMKgwqAgLT4gdGJfcmluZ19tc2l4DQo+IA0K
PiBNYXliZSBuaGlfIGluc3RlYWQ/IGB0YmAgaXMgdXNlZCBmb3IgdGhlIHNvZnR3YXJlIGNvbm5l
Y3Rpb24gbWFuYWdlci0NCj4gcmVsYXRlZCBmdW5jdGlvbnMNCkkgY2hlY2tlZCB0aGUgaGVhZGVy
IGZpbGUgaW5jbHVkZS9saW51eC90aHVuZGVyYm9sdC5oLCBhbG1vc3QgYWxsDQpmdW5jdGlvbnMg
dXNlIHByZWZpeCB0Yl8gb3IgdGJfcmluZ18gZXhjZXB0IG9uZSB1c2luZyB1c2I0Xywgc28gdXNl
IHRiXw0KaGVyZQ0KDQp0aGFua3MNCj4gDQo+IEtvbnJhZA0KDQo=
