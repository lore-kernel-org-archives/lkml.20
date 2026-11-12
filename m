Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=60.244.123.138
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794470431;
	b=iiNXSGU+89Z0oRd9KUihSDURdCTxapbrbx5qBsg+dmG65SeQD2tSrS0LxE/DIqKVQBzc
	 3nHXdBwXsFK0nFWaYGCXt2chMQc1ziOn1uUVa9ZmpH9JamApkf7saNwtRYGtjHZxCAHhj
	 zvp7caB6M+UfEIQHIw0DR7dDdFPOEV00dxOj63qOTTF53MKdIdG7h7gz+jQ3VBjlYOxE8
	 qkemdbK9P1EzCWQgbmo3d1+qs9YMZawD1vb3UA9VlhbdXqYo78AOTJ1PCLxlc8biPp4El
	 CBJ8SW1AkHNurQpLIFWeiBehmsg6Wf3H/lFhOkH48M15A6rYC1tOX8d8B3B1PJFCW6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470431;
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
	bh=XiN/FpVBHCKVz8Vj+MNSwwvOdDoNV3cfjiE2ZBv5Xmc=;
	b=VyZKKxinKz132e+WgYeB3LMtCFlVuIlHbnWWcWmKGSdUS2/WpUzVfZHU3t4k1/UxzEgJ
	 VoCpwYuUpX2p42mZiMCrg7eV1C2LLBBa1oAYWIAEYEWyevM3jH6TaOol9NzK7+YIbPegv
	 WHRye3Wlr07fmUmLPTFFyGmtN+0jd4LvhIUjFe/5glCGGIf0zeGzJ+8xe6zHql3pxzLdR
	 zBYwCzCR6Rf/3TpUGmYC4ywqvHmYL41uXaVbWt8InxrmNuBp1rko9bjTBkE7/FvjWlogw
	 zhrCTRJYwCYs0PyCewnjhJL/4SUPzFA9zaO4TqY1d7EBLNHvHynz5sgvbxf/T09RhcQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=OZ1d7KNl;
	dkim=pass header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=RaRgOAcz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CAC606A331;
	Thu, 12 Nov 2026 08:00:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2CAC606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=OZ1d7KNl;
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=RaRgOAcz
X-UUID: 1d8a044ade6f11f1b1788b6acf885367-20261112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=XiN/FpVBHCKVz8Vj+MNSwwvOdDoNV3cfjiE2ZBv5Xmc=;
	b=OZ1d7KNllQN3+syMUwzJSN/WryGLc58jDlAv2ymYvnncUOWLHkkESlhHcW9fXHR6U38ViOCAJxufvQ7B1IRnw7gj/wh/BgpqQzzvIjkqVXQd+LuBJheZmUDG0GzHZx0Tlo0jKXRJNPfGhTJRK5ksXmGfsm/UbQjr91f54TijNSM=;
X-CID-CACHE: Type:Local,Time:202611121600+08,HitQuantity:2
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:7a2bedb7-b5ad-4e2a-a75a-0dc5a5d6c204,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:d851a58d-b3e7-4795-ae33-b1b4d51e21d7,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|51|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1d8a044ade6f11f1b1788b6acf885367-20261112
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2010474937; Thu, 12 Nov 2026 16:00:24 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 12 Nov 2026 16:00:23 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 12 Nov 2026 16:00:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b0dNFXB66Nxk1lSMu0vBCZCgyNY07C1CAEYHRiRY1oyZWtLiEJktZ41eoOU5ZyGAPT1p9rgHdbiHCrItzzo4hXh2OoD9DfIbkGIz5R0He4S+dWJLc8v5kXvE9/V5XO9x9wOqyI3Ccc2zrPHyOc3sk7+0+4+/WwTdNOqH4D1J1uEglKohdgP2fgvBD7XlbsjC7Po66Y7dwAFirJkfYASlzRq1Ygrp36H9Z6uMaWDIqQySduzjxxjPSzV8IEx9Rmh0JyxA7OLFsCsuoGIyXABeITDIINKyzhX46O3Mfrxra/D95qLZ9jSeqhZUoXvPUJNkOe6Rm3wgaDmReocIL8yDiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XiN/FpVBHCKVz8Vj+MNSwwvOdDoNV3cfjiE2ZBv5Xmc=;
 b=MZFPrH5sVPFb9sVdeea7QXYq3t8sVwMrQNxS3TfXFvKXDuEmxYaReUOmmjec9aepO72nt55GAdkBhJop2EwaLPu10V5mql5U8ox6ne57FyoU8uXxDIDz8fXR4lZjCUkjvMc5YeyGaHIcKvpngHvtE36h2blX1s7tGkwSG9hdUhRuJqoby7EaO5DHeoeOwGY+Vpm+T9WOAzLXcL86Xqd6jHq7mqT441dFwlAz+HCLV9sd5pyrgW8HYJZaiDckT1VBfPAx7xMlCujETAP2w7vphm9BIYo7duZowF1Mf0cR9VaM3OY3QnFDSzAqyGHPCyPxxFWxocwWGFkBIqQCSLBM8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XiN/FpVBHCKVz8Vj+MNSwwvOdDoNV3cfjiE2ZBv5Xmc=;
 b=RaRgOAczpwnDJ0O2S/KjdUlIMuzJsJbsS4lKwWfDHSs9NUziYB3l/+q0NzcqgP+RtPL0lFprnextZCxgIGEk+reihD+Y0e5Yd6/DjIhYSXTIQ3yuoPeKh9eOYJK75btoD0G+5JS5KUQzBgPPJ7BtL6mVr8V+23OfCJOFmO4Pr08=
Received: from KUXPR03MB9665.apcprd03.prod.outlook.com (2603:1096:d10:5b::5)
 by SEZPR03MB8323.apcprd03.prod.outlook.com (2603:1096:101:196::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 08:00:17 +0000
Received: from KUXPR03MB9665.apcprd03.prod.outlook.com
 ([fe80::8ca:d69a:ceac:a9ea]) by KUXPR03MB9665.apcprd03.prod.outlook.com
 ([fe80::8ca:d69a:ceac:a9ea%4]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 08:00:16 +0000
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
Subject: Re: [PATCH v2 6/7] thunderbolt: decouple the waiting time of
 TB_PORT_UNPLUGGED and TB_PORT_UP
Thread-Topic: [PATCH v2 6/7] thunderbolt: decouple the waiting time of
 TB_PORT_UNPLUGGED and TB_PORT_UP
Thread-Index: AQHdcQmfLQb1GsotT0ucFPCfFLUzQ7cnYOkAgAK0t4A=
Date: Thu, 12 Nov 2026 08:00:16 +0000
Message-ID: <5a2d702efc2ad6466de898d10bb117bd632f6b54.camel@mediatek.com>
References: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
	 <20261110114925.722014-7-chunfeng.yun@mediatek.com>
	 <20261110144056.GE259790@black.igk.intel.com>
In-Reply-To: <20261110144056.GE259790@black.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KUXPR03MB9665:EE_|SEZPR03MB8323:EE_
x-ms-office365-filtering-correlation-id: 55582814-b72e-4645-3c6b-08df4092fd45
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|22082099003|18002099003|261009223027099003|56012099006|4143699003|11063799006|261026140227099003|261028144727099003|261022105027099003|261102123227099003|261021123027099003|261022075727099003|261026121527099003|261021121427099003|38070700021|10067099003;
x-microsoft-antispam-message-info: gwKvBpRRN3oRWMwZcs8FuG4PkjKUyK/7mxXgso8ZwYiwCB39ySzNIuDG/l1eYfjHeLwRgBa6AoIyDqKJN85Vn434yqYfVlMsIC+NtdZPtNrqfHGhlbd76aczxNKjF4NT3H197ZgTp+wBzZR8k5dEgxU1s4fbQROefOH+s2xxuOxzicrt3SF/DiLsoMM2kdaCtITBNqRsogVDh5/l/l6ADN3Qrx1X0AyG3nEkoBvQpQt1QKNln4IBmYnlSTyLHPAEwgBuL0bi8bdTMSMBTIivJXvpa+qcYjcrhOEqKAEYBaCwJgG6jQegp5HJlrMwJk1gZp59t47P6S3m3lx9bMerx2bjZ81O4qBUqDpbPtlNolWQGTHLRuvrMJEa6P67Ko3i6D59Bamja2SqD9PUYjP6rIucsv8Smq/ioqcPwfgqtiPGWgjR0pShmNa8JPYKFq5J7+pWH28xEmpzz23fGKOg1ND/orC18x4B5BV03igzFisHN5Gf912S2b2Ka9fRD2tqaclM7mqooIsf74cpJxuPxJGKmf/fhcpaxgf/Jfb5dAwIVYywIYnOBytMDwkC0QTM6tPhvwSx3VfY9zM+iaEdQduH6Tu7V04gA8H9aOEbCMCPuOdZS9cn509PYDzNnF98WvWjbe7Hk7VS/oCwcycpsA8SAoaPQzJlJvAYFs9I4y4LnxNbDE3SZjdy3UGz7RvWX/sxMUuFfxVWzJIizmq8+A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KUXPR03MB9665.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(22082099003)(18002099003)(261009223027099003)(56012099006)(4143699003)(11063799006)(261026140227099003)(261028144727099003)(261022105027099003)(261102123227099003)(261021123027099003)(261022075727099003)(261026121527099003)(261021121427099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bE9IZmFkaHlOZEFFS0N6T08zZGtXSXRFSGJycUpHRFZyOHl2TmNYbHl1Nkdj?=
 =?utf-8?B?WjBmNnYvMk9Da3ZPbnhkWG9mZDA2SWFqY0hvNStJV1c3ODJaVnpkTHlFSTl0?=
 =?utf-8?B?Qld1ZzVtYlp0RlFxQXVhSXJKcFdaei93WHN0Mjk5cnF3VVNPS3RoNitCTzJQ?=
 =?utf-8?B?dUdFUUUzZnhmMUVYRFhzUWx1ejdNZnA3N1ZaVUxQWjA1Y2Z0REw0ZVNTSUcy?=
 =?utf-8?B?ZDYrQUVNYnNZSUcwdlRnVHRSK0tyTmRUQkt6VnpVNGZnbUsrS0lvT0Q1YWxC?=
 =?utf-8?B?MjJsZVg0QzVDVFQwUEdBNWNRMi9vWS9oRjRLaFVhK3pvQmlIL0FudldxTyt2?=
 =?utf-8?B?MTdYeTQyakJGVG1LUlhoNDNyZFM3UEdMRlhaMlY2dnBlUytzSm02Lzh5UitX?=
 =?utf-8?B?cU15QkxPK1NsR1o4NUt4MmsraktLTjRDa1k5a0hkRzhUSEpRSTZwRGdSTjF6?=
 =?utf-8?B?R2RGejhmNUo3NE0ycSt5WVBHc0x4cG16Qmd2YlRwdFYrTGxXRU1VZUtSRWpJ?=
 =?utf-8?B?dDZmc3FwQ0hlUkNOM25yTnRlM1BybFpJL09QSGJaU0liM2YyNVZTQ21FNFBY?=
 =?utf-8?B?VmhPWEpBQ084aUVlY3poU2tVQ0NwMXBTZTVPVDJzSTVJcUhnVEEyd0laeGt0?=
 =?utf-8?B?dldtN01JZTBnT3ZXVDFFQy9NdzRHbTRBbGl4VVBDejU4TW9OU1NEcy9JaWwy?=
 =?utf-8?B?MXdFNUdKcnplK3NieVJLaGtEZ3pqU0U2cXhKaUNtZFMxOGpGbFRjZFJ4Sklj?=
 =?utf-8?B?cUtlSDdWNWwyVUhsQVUxYTVBcjhpQjlObEVtdkhJSk9WdVY5RTVjdzhuM0dq?=
 =?utf-8?B?bHlldkRxL1BOM1N4cTJRM2x4UE1NSnF2ZEExMTh0aFRKL1hoWVJhQTBqbklp?=
 =?utf-8?B?Y2tjdTdYVStZbHE5MlRPTy90OFZ3ZThubzEzWDRvOUM5Smt6UGxtWXo1OGQ0?=
 =?utf-8?B?ZGJ0UkdSNktsYjd4U2ZxNEU1TG9OdWxkdFp1U1I0OEFTdCtRbll2cGFTRUcv?=
 =?utf-8?B?NElqeHc0NGlGN1YyTk5ieStsUmYxcjNEV0MxdUhlcE9YMEF3bzZEOElGY25B?=
 =?utf-8?B?STdtNXljb3JDQkMrUDNxdWlCZ3dwWTZHVENldy9lT2dKWmRTeVRHOTFhVkZN?=
 =?utf-8?B?V0lwalkyajVyUUxGUmVMQ3MrWmdielZqQ3hkV0pGWEZKcURBQmZiWktnKzNG?=
 =?utf-8?B?NnN1ZGRjdnRYSkpKRWpBM1BxN0ppQ2dKNEk5UFIxQ2drbWc4UE1pcjNocCtC?=
 =?utf-8?B?a3JXbVZ3T1UrL2lGbDhxazZUTDNzTlNKbGQ3U2VHTEp2dm50OURFSjd0NkpV?=
 =?utf-8?B?aVp1SjBkTE82RzhjYlM5UzY5SmZiZHpHbnNKZ01Nblo2M0xHOE8yZ013dmNu?=
 =?utf-8?B?dEtBVXc5Vmk5VkpuRFI1ejF4OG5BYzBDbzZKUmJDOW9PTmFzemJobnB0ZXBU?=
 =?utf-8?B?dDhja0Z4dk0xOG1OeFhmMjQ0NC80UExVSWpQWUM3cVo2SzRBc0hBZmtQK1Qr?=
 =?utf-8?B?eGJwMDVtdVMwL1VWNnNBSzUxQkJ3WU12UUUxMFZQTjlCOW5haGQwKzk2Ymcw?=
 =?utf-8?B?dUNXNTdGdE9TZVdmYlVQdGRYalZ6QWhJc0l2aTFIQXBCY2RaV0IyZUIzdkZX?=
 =?utf-8?B?WmFOYzhyd2tKZEtaa2gxZWdaMVdUUEdYeHJ6S1FrbXlEV1JtWWZrVGJBRlpG?=
 =?utf-8?B?K2IyTXNoUjlXb0pvZHJJYUg2S1hyc21IS1RPSXd5TEdqMVA2Qk5BTlB6UjVY?=
 =?utf-8?B?NXVGY2UvVFhXWDNjdzdwVEhvZmpCUWlLV2JqMXU5T0x4ZzRRcHlpN28wV2tV?=
 =?utf-8?B?Q3JRRkVWMzZEWkJzbU1pall1VUN6T3JDR21RTmRBcDFqMkxLdHo0OEtjV0ty?=
 =?utf-8?B?ZHV6L2NMc2paWnhRRThLMm9UR21QcmJDMUtoUkE3YTE3OG5qcU5zbUlvdkJN?=
 =?utf-8?B?SUovVmIrZE5tYjNkbkZXUEh3a1hxZU45akU0bTc5ak0vZ2JtN3dpcUtSK3d2?=
 =?utf-8?B?akZXSkVLb3hCaTdYYm1CUmw5eWxBbWhpWWdMMTY1RG1iQ3diZHQ3eVdvNVVY?=
 =?utf-8?B?WU1tZGtjeHppZG9ycFVWeU1vajdwZ3lRdGpOWEF4ZDZzcS9DTThQSFZ6MFp1?=
 =?utf-8?B?eUxkWkNaekNERXpyNFQwbGdudWVTdjR2QnB5cWRzQ2wvRTZLUFVKMXFsREI5?=
 =?utf-8?B?REx3Umx5bEhpd2Njc1J0S1cwUTlwalhTbVZHMHdnMEVuaHQ5a0pYellPOGRi?=
 =?utf-8?B?SHhNdFNyRldwdzlhbnI5NkMxNGNkSnZWcGpTWUFtS0xRellNWmhNOFRkeHo3?=
 =?utf-8?B?MFFkWVZKSTVvQW80dU9MdS9JS0gwRGl2TG1zODkyUlB2THhyaVIweGtjLzh5?=
 =?utf-8?Q?TL3yYdHfpAr9EK9U=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DBF10EF4CA37044A9C8DCB09254D522C@apcprd03.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: hQX8q0ijE7sgHRUAAQCwFzXRYocwRkXL355vFu/EwOjhqENnABA5NqRUzWGDfULnlbnCZsUQVPOfi1mgr+u/etoQaLfDPcsSZXQ+WE9WOqbMYAs6eZVXdJVIwtPnjQ1I2F+VA36Buw6d7pMqbm5f1FMd4WaR8NfK1ako3k61nkH5tLRg8pdBApXGpC48IuJ5RIoIiC6i66p0fFtWgw9NtnF4dW9qxFyrlkukkhSwiuR/KpQtJqmJqwrK29DxUl/mzcUL2IUsxV42iqpZZyPu1tbaMRn0ahz5RPM5BdOwGY8g7bbylQr8fkty5h1lj0q1VUcXzK4IHwq/DzMXhqcOLg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KUXPR03MB9665.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55582814-b72e-4645-3c6b-08df4092fd45
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2026 08:00:16.8052
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bpXkfVQ8y2rSMZAHhrl5AnKtJbaAorzIIIw5KZMs2Ug9ICo1hYe0FmGxJfTxyoT7DGUt7lZTd4oU8Mp7WnCIUbFQG5QVTemkWQgN84Pu/Os=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8323
X-MTK: N

T24g5LqMLCAyMDI2LTExLTEwIGF0IDE1OjQwICswMTAwLCBNaWthIFdlc3RlcmJlcmcgd3JvdGU6
DQo+IE9uIFR1ZSwgTm92IDEwLCAyMDI2IGF0IDA3OjQ4OjU0UE0gKzA4MDAsIENodW5mZW5nIFl1
biB3cm90ZToNCj4gPiBXaGVuIHVzYjQgaXMgd29rZSB1cCBieSBkZXZpY2UgZGlzY29ubmVjdCwg
bm8gbmVlZCB3YWl0IGZvciAycywNCj4gPiB1c3VhbGx5IHRoZSBwaGFzZTJ+NCB0YWtlcyBhdCBt
b3N0IGFib3V0IDIwMG1zLCBhbmQgZW50ZXJzIHRvDQo+ID4gVEJfUE9SVF9DT05ORUNUSU5HLCBp
ZiBpdCBpcyBzdGlsbCBpbiBUQl9QT1JUX1VOUExVR0dFRCBhZnRlcg0KPiA+IDQwMG1zLA0KPiA+
IHRyZWF0IGl0IGFzIGRpc2Nvbm5lY3RlZC4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHVu
ZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gbmV3IGNo
YW5nZXMNCj4gPiAtLS0NCj4gPiDCoGRyaXZlcnMvdGh1bmRlcmJvbHQvc3dpdGNoLmMgfCA4ICsr
KysrLS0tDQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3RodW5kZXJib2x0L3N3aXRjaC5j
DQo+ID4gYi9kcml2ZXJzL3RodW5kZXJib2x0L3N3aXRjaC5jDQo+ID4gaW5kZXggN2RhZWU4M2M3
ZWQ4Li5lMTI1NDZiZmI4NjkgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy90aHVuZGVyYm9sdC9z
d2l0Y2guYw0KPiA+ICsrKyBiL2RyaXZlcnMvdGh1bmRlcmJvbHQvc3dpdGNoLmMNCj4gPiBAQCAt
NDg5LDggKzQ4OSw5IEBAIGludCB0Yl9wb3J0X3N0YXRlKHN0cnVjdCB0Yl9wb3J0ICpwb3J0KQ0K
PiA+IMKgICogV2FpdCB1cCB0byAyIHNlY29uZHMgZm9yIGEgcG9ydCB0byByZWFjaCBzdGF0ZSBU
Ql9QT1JUX1VQLiBJZg0KPiA+IMKgICogd2FpdF9pZl91bnBsdWdnZWQgaXMgc2V0IHRoZW4gd2Ug
YWxzbyB3YWl0IGlmIHRoZSBwb3J0IGlzIGluDQo+ID4gc3RhdGUNCj4gPiDCoCAqIFRCX1BPUlRf
VU5QTFVHR0VEIChpdCB0YWtlcyBhIHdoaWxlIGZvciB0aGUgZGV2aWNlIHRvIGJlDQo+ID4gcmVn
aXN0ZXJlZCBhZnRlcg0KPiA+IC0gKiBzd2l0Y2ggcmVzdW1lKS4gT3RoZXJ3aXNlIHdlIG9ubHkg
d2FpdCBpZiBhIGRldmljZSBpcw0KPiA+IHJlZ2lzdGVyZWQgYnV0IHRoZSBsaW5rDQo+ID4gLSAq
IGhhcyBub3QgeWV0IGJlZW4gZXN0YWJsaXNoZWQuDQo+ID4gKyAqIHN3aXRjaCByZXN1bWUsIFdh
aXQgYXQgbW9zdCA0MDAgbXMgZm9yIGxpbmsgdG8gc3RhcnQNCj4gPiBjb25uZWN0aW5nLA0KPiAN
Cj4gcm91dGVyDQpBQ0sNCj4gDQo+ID4gKyAqIGlmIHRpbWVvdXQsIG1lYW5zIHRoZSBkZXZpY2Ug
aXMgZGlzY29ubmVjdGVkKS4gT3RoZXJ3aXNlIHdlDQo+ID4gb25seSB3YWl0DQo+ID4gKyAqIGlm
IGEgZGV2aWNlIGlzIHJlZ2lzdGVyZWQgYnV0IHRoZSBsaW5rIGhhcyBub3QgeWV0IGJlZW4NCj4g
PiBlc3RhYmxpc2hlZC4NCj4gPiDCoCAqDQo+ID4gwqAgKiBSZXR1cm46DQo+ID4gwqAgKiAqICUw
IC0gSWYgdGhlIHBvcnQgaXMgbm90IGNvbm5lY3RlZCBvciBmYWlsZWQgdG8gcmVhY2gNCj4gPiBA
QCAtNTAxLDYgKzUwMiw3IEBAIGludCB0Yl9wb3J0X3N0YXRlKHN0cnVjdCB0Yl9wb3J0ICpwb3J0
KQ0KPiA+IMKgaW50IHRiX3dhaXRfZm9yX3BvcnQoc3RydWN0IHRiX3BvcnQgKnBvcnQsIGJvb2wg
d2FpdF9pZl91bnBsdWdnZWQpDQo+ID4gwqB7DQo+ID4gwqAJaW50IHJldHJpZXMgPSAyMDsNCj4g
PiArCWludCB1bnBsdWdnZWRfcmV0cmllcyA9IDQ7DQo+IA0KPiBSZXZlcnNlLWNocmlzdG1hcyB0
cmVlDQpBQ0sNCg0KVGhhbmtzDQo+IA0KPiA+IMKgCWludCBzdGF0ZTsNCj4gPiDCoAlpZiAoIXBv
cnQtPmNhcF9waHkpIHsNCj4gPiDCoAkJdGJfcG9ydF9XQVJOKHBvcnQsICJkb2VzIG5vdCBoYXZl
IFBIWVxuIik7DQo+ID4gQEAgLTUxOSw3ICs1MjEsNyBAQCBpbnQgdGJfd2FpdF9mb3JfcG9ydChz
dHJ1Y3QgdGJfcG9ydCAqcG9ydCwgYm9vbA0KPiA+IHdhaXRfaWZfdW5wbHVnZ2VkKQ0KPiA+IMKg
CQkJcmV0dXJuIDA7DQo+ID4gwqANCj4gPiDCoAkJY2FzZSBUQl9QT1JUX1VOUExVR0dFRDoNCj4g
PiAtCQkJaWYgKHdhaXRfaWZfdW5wbHVnZ2VkKSB7DQo+ID4gKwkJCWlmICh3YWl0X2lmX3VucGx1
Z2dlZCAmJg0KPiA+IHVucGx1Z2dlZF9yZXRyaWVzLS0pIHsNCj4gPiDCoAkJCQkvKiB1c2VkIGR1
cmluZyByZXN1bWUgKi8NCj4gPiDCoAkJCQl0Yl9wb3J0X2RiZyhwb3J0LA0KPiA+IMKgCQkJCQnC
oMKgwqAgImlzIHVucGx1Z2dlZCAoc3RhdGU6DQo+ID4gNyksIHJldHJ5aW5nLi4uXG4iKTsNCj4g
PiAtLSANCj4gPiAyLjQ1LjINCg0K
