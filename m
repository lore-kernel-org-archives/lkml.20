Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793760255;
	b=vCkR6ra8f6j1C01K+2YotxUwQL84IIU11fVUnH724/SMDiXndWHHy5Q73MgLINfSBdYy
	 ayFhh6W8x8WtBD68eH/8KPuLRWnzvhLw0Afu+7YxVIeCnaNRnYd1RgV55oSPd8kXjdu18
	 qvguZdRJjs2l1YT6VEPUwTIgv9qTBOq1ffiZTZ+EbXF3fKIDKxSQlC1V2g4A4YXmMlMn4
	 KT4ppA14n8KGU7omNvrM114C9F+TQAvIS6VcEh2lfPVLsB6ZPHLTo94MBP/H65Ey1rndd
	 Wl0LM3YQtoOm5whKeN4zS3O8Ikyn869ZjMbyrqCWXoSmErE0pPrX1CYXi00YdXMdISQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793760255;
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
	bh=GJeFp4MMD3V4OUueF/5Q/haTFs8V7ZJfckdF+CkllWY=;
	b=pexFikN14wGVwxtvLW0v5VBYc/piUyYPZJupyGi4Cl1gaS/hkEs4aC34ChmAtqPnobrz
	 0YJIpGhyHqm8pFYCxuCTAz9lckIKgonkqax/aUBAyY+Do0yY6/ERyoQAG5tHAqyvOCPdo
	 hkCdLea27/yIVu34bhCAUZzySxT/cx+kD11cZYua7MSejfTDWd5HfAcUUK6Y5QGrzOvZi
	 7DaWwcAAfatrGGeNTK9zcQxTszZDrtfTTQ3TQJN1vUV/tuQEtZSiWSbo+3o4m8MtGf2/Z
	 xVuuSfQtsJkTJye1d9r+pqm3UgvWwvZihxM5WO3X0NqKFmHml0xgNsWmFG3us+bTNGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=cVyyzNt4;
	dkim=pass header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=lAyrQ23O;
	arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F91606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 02:44:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99F91606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=cVyyzNt4;
	dkim=pass (1024-bit key, unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=lAyrQ23O
X-UUID: 9c61146ad7f911f18dc8c9802ae25ab1-20261104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=GJeFp4MMD3V4OUueF/5Q/haTFs8V7ZJfckdF+CkllWY=;
	b=cVyyzNt4s5LMfsLElBqkl9UCc2NhtX4z9rLKL/YkQDrvx9Mf9yT1KspRGmxLpicQhckMksUOkUTKy1TkbSCdRaA/0eqSLK//Ha6pWZ2s3lETRDoHsVZybBtN0r/Fa5RLWy0OPWXHdaZ0VBg3vdaWn7A9Sy/Ztvw7FNmIj7stdbc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:6a08822f-37b1-40b4-a246-0782dc1d7434,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:7f1b0349-d564-49d2-951c-a4827fe1473d,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9c61146ad7f911f18dc8c9802ae25ab1-20261104
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <santino.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1010965019; Wed, 04 Nov 2026 10:44:09 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 4 Nov 2026 10:44:09 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 4 Nov 2026 10:44:09 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DmkUHfkcWfs1k3engscTKkPkhX4135EINT4RD43ki0aMFzTDHI70O31OdAeO+BZfwTPWfBMV4tfXyuo1GZCJWVhyJ9/3IWK1j6XYFNgG/L0GhNr68wBY4l8U2CJIzOXrw5ppC6U0OiAFzhifLX9jVe7FELxOVvoBTA4oNYNCG1rvK7mdM3JdUUcp3O5r+fYcTpqPbCqPILqkScavEm151o8x/rizZMk12S1lsMRbMvQepKSKkjkw+wpoDz4OJ34334AQJIVpKhms5fpqrYNLeDiTwhJU1B8mUeZMVI9Z/cYj5XpTj5RWPLYj0zpnrjkdv4XznegY9ZdUlE0q46gW0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJeFp4MMD3V4OUueF/5Q/haTFs8V7ZJfckdF+CkllWY=;
 b=h9U6hUO9V5twAnCHOuDLEStqv5btHXefXtgnn8xh+IKOdkRNwqdX/ajVma3SsT/5e2UvvR93TO4s8UmcNU+XgFkBXNdWfOGKfdak87arSMcWIXnMykJwiRxJ/mj1J5Jyos4CwKHdCZb1NYEZuP2f3cKEWRH1NY7kv3HbjOsHC239ASBdVtzJHlm40JR7wGhueFWX9LUCDuY6ULovsxBLM6g4kwNdkjTq810HdqcJ8bR67I1HA7RjC3aWoF1+pcWu3YItfUqy2A6DR73U9QkX4F0pameWzGFwoJj66WuEsgXOyblG/Gy8K5T8m0U6SWyoo3/4fY+Ecfkin2r/Q0+eBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJeFp4MMD3V4OUueF/5Q/haTFs8V7ZJfckdF+CkllWY=;
 b=lAyrQ23O5bR4OQrc9e2EL6LE3+lVH2jORNZL0nulrdBpjMfPwEk6UrmIMXY6WR0LExB170CkZQ45s9wpGEaBmu0myHTC8NbjwmAeif7SVDXezCOzDElpfl0mj8vihY7WMZlnXiGWWNNwJtJiXylkN/fInmrhyjos2dS7eHPStiU=
Received: from SI2PR03MB5579.apcprd03.prod.outlook.com (2603:1096:4:12d::11)
 by TY0PR03MB6631.apcprd03.prod.outlook.com (2603:1096:400:210::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 02:44:06 +0000
Received: from SI2PR03MB5579.apcprd03.prod.outlook.com
 ([fe80::4ee5:9484:c82c:d53b]) by SI2PR03MB5579.apcprd03.prod.outlook.com
 ([fe80::4ee5:9484:c82c:d53b%7]) with mapi id 15.21.0569.011; Wed, 4 Nov 2026
 02:44:05 +0000
From: =?utf-8?B?U2FudGlubyBXYW5nICjnjovkv4rlgpEp?= <Santino.Wang@mediatek.com>
To: "jonathan.cameron@oss.qualcomm.com" <jonathan.cameron@oss.qualcomm.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?RnJlZC1XWSBDaGVuICjpmbPlqIHlrocp?= <Fred-WY.Chen@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?TGlnaHQgQ2hlbiAo6Zmz5pix5YWJKQ==?= <Light.Chen@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, Arnab Layek <Arnab.Layek@mediatek.com>
Subject: Re: [RFC PATCH 03/11] soc: mediatek: dram-ecc: add tracepoints
Thread-Topic: [RFC PATCH 03/11] soc: mediatek: dram-ecc: add tracepoints
Thread-Index: AQHdaqwXBpoEdYDYRUmr/at48P7k8rcbM5IAgAIDwQA=
Date: Wed, 4 Nov 2026 02:44:05 +0000
Message-ID: <3cc31b2f5cc226561c7c6642bcaeb85d3e22e9ff.camel@mediatek.com>
References: <20261102092334.138759-1-santino.wang@mediatek.com>
	 <20261102092334.138759-4-santino.wang@mediatek.com>
	 <20261102115758.00005a16@oss.qualcomm.com>
In-Reply-To: <20261102115758.00005a16@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5579:EE_|TY0PR03MB6631:EE_
x-ms-office365-filtering-correlation-id: b748dff5-1e8b-4416-2f62-08df3a1d7e13
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|10067099003|22082099003|18002099003|38070700021|4143699003|11063799006|261102123227099003|56012099006|261026121527099003|261022075727099003|261022105027099003|261028144727099003|261026140227099003|261021121427099003|261009223027099003;
x-microsoft-antispam-message-info: M1R6eRwoBxU2oEvlP0YevvZjpTFRp7MPGPJmsbjvvpN+DFj5wXsxtxM+0CmQHNvR2v74E5zoXpxZs/+yGdmHir2XQ/NnBvziVVsBvjwA59dxwPaFk2oP5ReH1b0W+JLFOWWBFFIgjjba/iCUIXC6qWAIgVzB/mtUuo63O1vy3VLzeeg6nIYPJm3qXMbqqSV0ffB7IWxGaak3s23kck5Ro0p92+ruon/S4szEweT76IZ/h/eYuzuWWZbYad5wQf+xVQkSaocL4r/tTVIJ32WJ+jrDGXVMmytunNoSEIWZzUgRezVe9xihtpZ7oa9ocHgSruoev8+FNxSa56BvG5RehNx9M9uuMnxRpZbyWmj+v6iB2GrRwKj+3xxA6a0dQ06MtEX4fU+nJWB3ru4xAR4M1BC5FIcd/9nIa2G0afO3GLxAmwkr/mj1YsUhj99HoNnTvKw40AfTtM36gm5SOs9AH8EajrIvZ1giCYp+ixWPC8Z5jjaIugLBevO4dVYwNna/o4ZGKSgXMuB06A2J3hHnGLnOCnoe7ymHcATgxGoXg91eQh2l5XgVa7asVrDB9+wUoxipUt44Fvn9asFJg331zF9+JeYtgJI2oyfWEc9Ks51kZwsLMjneb6ZnMUrGPJaUjL1XffCH+LlWTdY84ttAq/SRL+6BSiu5SJZrcmQwWAguaRPqVmpC535pI/42r1hSLGho5b7wWQjaFr+BP8+7N0p60LZLptFK64DwHcpraQ8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB5579.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(22082099003)(18002099003)(38070700021)(4143699003)(11063799006)(261102123227099003)(56012099006)(261026121527099003)(261022075727099003)(261022105027099003)(261028144727099003)(261026140227099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TEdReXl1UitvdXpsdTRLODRJUXEvbG1YazEzYlJYOEd0dzgwUlpqQUxxSFNp?=
 =?utf-8?B?c3ZUdUFiYksxOXVVTmJDM1B2b3U3TjY0L1Y2N2tJMkhsWm5GMmFrQU5wSDBs?=
 =?utf-8?B?cHFEK2JpNnRkOWQzNkNqekpYVWV0UTZHcjZQVGg2WUxScVF5Z1JLWUw1ajNp?=
 =?utf-8?B?em02TzIzalRJdmRnK0kxbm5tQTVIaXVvMGp5STVtNjFpVWNPUjkxancrTkto?=
 =?utf-8?B?ZnNLa2Q2KzhzZkZ4WDNra3VKWEdjODZmYkJZV1ZCdUp5TGM5NFp2SU0zYitR?=
 =?utf-8?B?R3FveXFPYzV1RmhTSDg2Vnp5cDlRZ2I4V3FDbjZGRDRiUnRIWHdaY3NSSmht?=
 =?utf-8?B?VUZTMUF6ckUyZkZLQzU5YStBNlNqeGp2MlVsMkRtelhFell4YkRYQlNTZ3Rv?=
 =?utf-8?B?TzhPYmFKYVdLT0U0cHFiV2lLVGVmQVVtcnlJN1VkL3hwV1pFZkJ4aWlMcVh1?=
 =?utf-8?B?eWk4Rm1UT0JyK2lqclNBSjJMc2lKY0FDaWdDUW5xSndPQmFMblAvSFl5aFVr?=
 =?utf-8?B?bnBDeUpqaDNoZmxaNUc4WVNJNGw5N01HS1prTmdDVFhEUUxUUEQvMHd3VmZu?=
 =?utf-8?B?dXRNNlQzS3lKalVPakVmeWlkajBBWEY3bkxZWEZVU0NTLzExM3hFTUk1QWlR?=
 =?utf-8?B?dlJGT0oydnpZQ3l2REJUWGtIUUhzUThvY1JCZjZWSDg5NytvSDR4QmpZbFRZ?=
 =?utf-8?B?Q2kzSDBPNnk4T1BIdmxIZ0hmRVlFY3E3T1YyNEpYblhVYzQyOXRmUDFOMXRj?=
 =?utf-8?B?bk5oNE9YMXEvTjZYZDFnak5ZbHBwcU84SDMwWHVmM3U4TGpkM1BHVTlKU1k1?=
 =?utf-8?B?aWJNVTdYMkJWQ2ZBSlBUK21ITUFUL1RDS1BNM3pnbGlwdXJEbUpSeS9TdTZh?=
 =?utf-8?B?cGNybDU0N0svRTk3ZEMwbmgwaUhBd3JJL2ZBS0FsOUo3NFE4SFBhTk5CNnFJ?=
 =?utf-8?B?NUw5ckhiMWZDd2hhbkxnQTE5WEJGeUcxYXJoaVNJUk9qZzNUSmVWVk9RNzN1?=
 =?utf-8?B?V09lQ0FsU1N4SU5FdFlOd1AxM3dzU0RiREk0dmloWWt1UXB6akFvNDRIb0Rw?=
 =?utf-8?B?YVhlaFZCdllnWnRVNEF3SFZESTRxMHZhNWNqU25QWHlZNTk5S1dGWTc0V3JY?=
 =?utf-8?B?a0xEcW5lNE15eXkvaUk3SDg3aUgrZG04YkdTdHVnY2VDWG1lSFAyRG8yblZC?=
 =?utf-8?B?ekRjeERab1U0R1ZyNjB2Z2ZMN3B1YUdVOWhDT1E0Q1BtSEFxMGNUQThhSkV3?=
 =?utf-8?B?N1Y5eGViL0JuOXhueEpKYVFxdFJNaXc2and5RHdWUm82Y0VIMU9FT3ZhSHkv?=
 =?utf-8?B?S2djL0N0bnlCZi9jdzdEL1JrT0NtbUl6UFFpTGp3dExkb1JtSWJPeEVSUXgv?=
 =?utf-8?B?ZmdBL0wxZHord2wxU2RtZlV1eHFSSEx4RVZOOHJiQ1V6eXhDcHRudU1NQjJT?=
 =?utf-8?B?TDhZVmZjbTg5WlR3R0IrdkRpcjhSdUZtUTdXcWp3NEJYelFuQXJWTXkrY3p3?=
 =?utf-8?B?WEI1aU1aRHNHY2E5UnBjdndsNGJhaG01bzdtVEhidHBvR2NyTkxtT0JSQldL?=
 =?utf-8?B?ZVJ6Q21DZnR5enpmV003MUtEOWxoOGMyY3lqQklEVDloeWNlZ0NXTXRWd2hn?=
 =?utf-8?B?NVJIcllCNHdMMEFxK09JVmloS2VlWVVDeU01VllPZllYSllHbTFsbGJOUGxu?=
 =?utf-8?B?SzlYVWx3OFg5dHFBWE9pbVFyTTFjQS91bzJhUURoRzQwRCtmUC9qMUNwQkFL?=
 =?utf-8?B?T3pBaUJvVmQzUXR5RkJsb1VkeTNZRHBVb2VIMW9nSXpVNW14TENxbzJHZC9H?=
 =?utf-8?B?d3lXUWM5M2tkRE9LSlN5M3pnZHV2QzVTVXhPaHNTTWYvMXU2dURMcHh5a1pq?=
 =?utf-8?B?TGd5K3JZbnNObjB6RVdUMmk3bit3R3J2VFV4MXl5NlFZZEhEYU15d0lqVEI2?=
 =?utf-8?B?WVFkeFBETHZsczB4OVduSjBIR1ZQa1BGL0hSUEdqSVNHMmpkY05DLzVUZTdz?=
 =?utf-8?B?Z1hLVVVMMDFCOWR5NlgweGw5d0UvY2dLS210SVp0U0hvSTBDL29DNHByYks1?=
 =?utf-8?B?Y2JVTUQ3UUJCQTFtUVoxRE9wSXp4dnVYQU5WWU9oOXJvdHpiV2o2eFZVQ3I1?=
 =?utf-8?B?ZjV5VzFoOXd1ZU9Xc25OVWd1aWM2bjhBMUdjdFgvT0FsRGowdGZGRlhnKzhz?=
 =?utf-8?B?dlZCa0pyOWF5NWprck1oMklNWVA2MzJaanVsRlI4cHRnM3lHTktaMnlGMXVj?=
 =?utf-8?B?RlFGdTVuZEdYb05mQ29sR1F0K1ArWDIyVTBzTVNwVk9Sc0FCL2Z0cGlvK1Jx?=
 =?utf-8?B?SHdDaXM1cXZTNFNvZFNYeS81dDVwZ2FtcEUyOVNKd2lnbVZ3RXYrQ0ZlbURM?=
 =?utf-8?Q?N95HLPj73dnr4WjU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC560192B9947F41B7B4766ACDE8E9D4@apcprd03.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: s2CNYiIs6q/qiQNs9+Sfxsfwqw4pSHVNEPTlsmLCTP3fllwLpWnLNN9bg+CgHmFvF0IBtcbcyCk4AdPypbVXMgXWJvF/hvEintN50V4BAdLvCla85dVpDuTWhH/fW5alesSSGAYKEtumsPUM68v+8opmIxn97zwbxWXB2IAAiQWVsQCHeviRFillrXqD11SaYZNaYHdoo0j/oPxa9NHNlwkzREcqS2Ja5dqJnSeZrR1cCrnVkOoaaKqhtb007vu8V8Iq1cuN/NGpM0BIetnxq18TUFiIMmAEdyLMxoB8kg6uXZarFjFs52mMEfLJgy9DlZPvIHa8YlXrK4frTxQFBQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5579.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b748dff5-1e8b-4416-2f62-08df3a1d7e13
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 02:44:05.3455
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CMrDqgPxzKwaMVRRRYF4LOTPKEn5HT5eXak2XPoqjf+iM2JkV7KVlugndh8dxs1iaW7tYQ4NtiKJ0Xt1FCwmVB2F6/Dq1YMDtUNM6C2If14=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6631
X-MTK: N

SGkgSm9uYXRoYW4sCgogIEkgY2hlY2tlZCBVRUZJIDIuMTEgQXBwZW5kaXggTi4yLjUgYW5kIE4u
Mi42LiBCb3RoIHNlY3Rpb25zCiAgZGVmaW5lIE5vZGUsIENhcmQsIE1vZHVsZSBhbmQgRGV2aWNl
IGZpZWxkcywgYnV0IEkgY291bGQgbm90CiAgZmluZCBhbiBleHBsaWNpdCBjaGFubmVsIG9yIHN1
YmNoYW5uZWwgZmllbGQgaW4gTWVtb3J5IEVycm9yCiAgU2VjdGlvbiAyLgoKICBPbiBNVDg5OTIs
IHRoZXNlIGlkZW50aWZ5IHRoZSBEUkFNIGNoYW5uZWwgYW5kIHRoZSBzdWJjaGFubmVsCiAgd2l0
aGluIHRoYXQgY2hhbm5lbC4gQ291bGQgeW91IGNsYXJpZnkgd2hpY2ggc3RhbmRhcmQgZmllbGRz
CiAgb3IgZW5jb2Rpbmcgc2hvdWxkIHJlcHJlc2VudCB0aGVzZSB0d28gaW5kaWNlcywgcGFydGlj
dWxhcmx5CiAgdGhlIHN1YmNoYW5uZWw/CgpUaGFua3MKU2FudGlubwoKT24gTW9uLCAyMDI2LTEx
LTAyIGF0IDExOjU3IC0wODAwLCBKb25hdGhhbiBDYW1lcm9uIHdyb3RlOgo+IAo+IEV4dGVybmFs
IGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVu
dGlsCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4KPiAKPiAK
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9kcmFtLWVjYy9jb3JlL3RyYWNl
LmMKPiA+IGIvZHJpdmVycy9zb2MvbWVkaWF0ZWsvZHJhbS1lY2MvY29yZS90cmFjZS5jCj4gPiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi45YThiMjBlNDgwNjkK
PiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL2RyaXZlcnMvc29jL21lZGlhdGVrL2RyYW0tZWNj
L2NvcmUvdHJhY2UuYwo+ID4gQEAgLTAsMCArMSw2IEBACj4gPiArLy8gU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IEdQTC0yLjAKPiA+ICsvKgo+ID4gKyAqIENvcHlyaWdodCAoYykgMjAyNiBNZWRp
YVRlayBJbmMuCj4gPiArICovCj4gPiArI2RlZmluZSBDUkVBVEVfVFJBQ0VfUE9JTlRTCj4gPiAr
I2luY2x1ZGUgInRyYWNlLmgiCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvbWVkaWF0ZWsv
ZHJhbS1lY2MvY29yZS90cmFjZS5oCj4gPiBiL2RyaXZlcnMvc29jL21lZGlhdGVrL2RyYW0tZWNj
L2NvcmUvdHJhY2UuaAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAw
MDAwMC4uZDYwM2ZjMzhmMGE3Cj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9kcml2ZXJzL3Nv
Yy9tZWRpYXRlay9kcmFtLWVjYy9jb3JlL3RyYWNlLmgKPiA+IEBAIC0wLDAgKzEsMTE5IEBACj4g
PiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KPiA+ICsvKgo+ID4gKyAq
IENvcHlyaWdodCAoYykgMjAyNiBNZWRpYVRlayBJbmMuCj4gPiArICovCj4gPiArI3VuZGVmIFRS
QUNFX1NZU1RFTQo+ID4gKyNkZWZpbmUgVFJBQ0VfU1lTVEVNIG10a19kcmFtX2VjYwo+ID4gKwo+
ID4gKyNpZiAhZGVmaW5lZChfVFJBQ0VfTVRLX0RSQU1fRUNDX0gpIHx8Cj4gPiBkZWZpbmVkKFRS
QUNFX0hFQURFUl9NVUxUSV9SRUFEKQo+ID4gKyNkZWZpbmUgX1RSQUNFX01US19EUkFNX0VDQ19I
Cj4gPiArCj4gPiArI2luY2x1ZGUgPGxpbnV4L3RyYWNlcG9pbnQuaD4KPiA+ICsKPiA+ICsvKiBk
cml2ZXIgbGlmZWN5Y2xlIC0gc3RhdGU6IDA9aW5pdCwgMT1leGl0ICovCj4gPiArCj4gPiArVFJB
Q0VfRVZFTlQobXRrX2RyYW1fZWNjX2xpZmVjeWNsZSwKPiA+ICvCoMKgwqDCoCBUUF9QUk9UTyhp
bnQgc3RhdGUpLAo+ID4gK8KgwqDCoMKgIFRQX0FSR1Moc3RhdGUpLAo+ID4gK8KgwqDCoMKgIFRQ
X1NUUlVDVF9fZW50cnkoCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fZmllbGQoaW50
LCBzdGF0ZSkKPiA+ICvCoMKgwqDCoCApLAo+ID4gK8KgwqDCoMKgIFRQX2Zhc3RfYXNzaWduKAo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBfX2VudHJ5LT5zdGF0ZSA9IHN0YXRlOwo+ID4g
K8KgwqDCoMKgICksCj4gPiArwqDCoMKgwqAgVFBfcHJpbnRrKCIlcyIsIF9fZW50cnktPnN0YXRl
ID8gImRyaXZlciByZW1vdmVkIiA6ICJkcml2ZXIKPiA+IGluaXRpYWxpemVkIikKPiA+ICspOwo+
ID4gKwo+ID4gKy8qCj4gPiArICogRUNDIGV2ZW50cyAtIHNwYS9jaGFubmVsL3N1YmNoYW5uZWwv
cmFuay9iYW5rL3Jvdy9jb2x1bW4KPiA+IGRlY29kZWQgZnJvbSB0aGUKPiA+ICsgKiBFQ0NFUlJf
SU5GTzAvMSBlbnRyeSB0aGF0IGRldGVybWluZWQgc2V2ZXJpdHkgKHNlZQo+ID4gZ2hlc19ub3Rp
Zmllci5jKSwKPiA+ICsgKiBtaXJyb3JpbmcgQVRGIGRyYW1fZWNjL210ODk5Mi9maXEuYydzIGRl
Y29kZS4gTm8gYWdlbnQvbWFzdGVyCj4gPiBJRDogQVRGJ3MKPiA+ICsgKiBHSEVTIHZlbmRvciBz
ZWN0aW9uIGRvZXNuJ3QgY29tcHV0ZSB0aGVtIChzZWUKPiA+IG10a19kcmFtX2VjY19ldmVudC5o
KS4KPiA+ICsgKi8KPiA+ICsKPiA+ICtUUkFDRV9FVkVOVChtdGtfZHJhbV9lY2NfY2UsCj4gCj4g
V2h5IHB1c2ggdGhlc2UgdGhyb3VnaCBhIGN1c3RvbSB0cmFjZXBvaW50P8KgIFRoaXMgbG9vayB2
ZXJ5IHNpbWlsYXIKPiB0byB3aGF0Cj4gaXMgaW4gdGhlIE1lbW9yeSBFcnJvciBTZWN0aW9uIDIg
Q1BFUi4KPiAKPiA+ICvCoMKgwqDCoCBUUF9QUk9UTyh1NjQgc3BhLCB1OCBjaGFubmVsLCB1OCBz
dWJjaCwgdTE2IHJhbmssIHUxNiBiYW5rLAo+ID4gdTMyIHJvdywKPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB1MTYgY29sdW1uKSwKPiA+ICvCoMKgwqDCoCBUUF9BUkdTKHNwYSwgY2hh
bm5lbCwgc3ViY2gsIHJhbmssIGJhbmssIHJvdywgY29sdW1uKSwKPiA+ICvCoMKgwqDCoCBUUF9T
VFJVQ1RfX2VudHJ5KAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBfX2ZpZWxkKHU2NCwg
c3BhKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBfX2ZpZWxkKHU4LCBjaGFubmVsKQo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBfX2ZpZWxkKHU4LCBzdWJjaCkKPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgX19maWVsZCh1MTYsIHJhbmspCj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIF9fZmllbGQodTE2LCBiYW5rKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBfX2ZpZWxkKHUzMiwgcm93KQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBfX2Zp
ZWxkKHUxNiwgY29sdW1uKQo+ID4gK8KgwqDCoMKgICksCj4gPiArwqDCoMKgwqAgVFBfZmFzdF9h
c3NpZ24oCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fZW50cnktPnNwYcKgwqDCoMKg
ID0gc3BhOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBfX2VudHJ5LT5jaGFubmVsID0g
Y2hhbm5lbDsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX19lbnRyeS0+c3ViY2jCoMKg
ID0gc3ViY2g7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fZW50cnktPnJhbmvCoMKg
wqAgPSByYW5rOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBfX2VudHJ5LT5iYW5rwqDC
oMKgID0gYmFuazsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX19lbnRyeS0+cm93wqDC
oMKgwqAgPSByb3c7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fZW50cnktPmNvbHVt
bsKgID0gY29sdW1uOwo+ID4gK8KgwqDCoMKgICksCj4gPiArwqDCoMKgwqAgVFBfcHJpbnRrKCJz
cGE9MHglMDE2bGx4IGNoPSV1IHN1YmNoPSV1IHJhbms9JXUgYmFuaz0ldQo+ID4gcm93PSV1IGNv
bHVtbj0ldSIsCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBfX2VudHJ5LT5zcGEs
IF9fZW50cnktPmNoYW5uZWwsIF9fZW50cnktPnN1YmNoLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgX19lbnRyeS0+cmFuaywgX19lbnRyeS0+YmFuaywgX19lbnRyeS0+cm93LAo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX19lbnRyeS0+Y29sdW1uKQo+ID4gKyk7
Cj4gPiArCj4gPiArVFJBQ0VfRVZFTlQobXRrX2RyYW1fZWNjX3VjZSwKPiA+ICvCoMKgwqDCoCBU
UF9QUk9UTyh1NjQgc3BhLCB1OCBjaGFubmVsLCB1OCBzdWJjaCwgdTE2IHJhbmssIHUxNiBiYW5r
LAo+ID4gdTMyIHJvdywKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1MTYgY29sdW1u
KSwKPiA+ICvCoMKgwqDCoCBUUF9BUkdTKHNwYSwgY2hhbm5lbCwgc3ViY2gsIHJhbmssIGJhbmss
IHJvdywgY29sdW1uKSwKPiA+ICvCoMKgwqDCoCBUUF9TVFJVQ1RfX2VudHJ5KAo+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBfX2ZpZWxkKHU2NCwgc3BhKQo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBfX2ZpZWxkKHU4LCBjaGFubmVsKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBfX2ZpZWxkKHU4LCBzdWJjaCkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX19m
aWVsZCh1MTYsIHJhbmspCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fZmllbGQodTE2
LCBiYW5rKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBfX2ZpZWxkKHUzMiwgcm93KQo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBfX2ZpZWxkKHUxNiwgY29sdW1uKQo+ID4gK8Kg
wqDCoMKgICksCj4gPiArwqDCoMKgwqAgVFBfZmFzdF9hc3NpZ24oCj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIF9fZW50cnktPnNwYcKgwqDCoMKgID0gc3BhOwo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBfX2VudHJ5LT5jaGFubmVsID0gY2hhbm5lbDsKPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgX19lbnRyeS0+c3ViY2jCoMKgID0gc3ViY2g7Cj4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIF9fZW50cnktPnJhbmvCoMKgwqAgPSByYW5rOwo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBfX2VudHJ5LT5iYW5rwqDCoMKgID0gYmFuazsKPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgX19lbnRyeS0+cm93wqDCoMKgwqAgPSByb3c7Cj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIF9fZW50cnktPmNvbHVtbsKgID0gY29sdW1uOwo+ID4gK8KgwqDC
oMKgICksCj4gPiArwqDCoMKgwqAgVFBfcHJpbnRrKCJzcGE9MHglMDE2bGx4IGNoPSV1IHN1YmNo
PSV1IHJhbms9JXUgYmFuaz0ldQo+ID4gcm93PSV1IGNvbHVtbj0ldSIsCj4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBfX2VudHJ5LT5zcGEsIF9fZW50cnktPmNoYW5uZWwsIF9fZW50
cnktPnN1YmNoLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX19lbnRyeS0+cmFu
aywgX19lbnRyeS0+YmFuaywgX19lbnRyeS0+cm93LAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgX19lbnRyeS0+Y29sdW1uKQo+ID4gKyk7Cj4gCgo=
