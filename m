Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010021.outbound.protection.outlook.com [52.101.229.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5272B52BE2A;
	Tue, 29 Sep 2026 17:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790702665; cv=fail; b=U4UCu6Mo5Vx8qNmix0mI91HdUGpUdvSSmV654vL6T/kSsDVrYZcqNlaO7S+EqbmMnoaMoIvLxKbFglatkU3zKKPSTYEx2XorBp+iMIVss2W6IiT1J3bQMjGm5Xg0UFgXzzMKpK4LfSYSozg2Icg5L9QWg9VttWKeDepATy4ev4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790702665; c=relaxed/simple;
	bh=RRqN0bcaoHl3/R3tZ1hPHjWuA49aLC1T+jYFRGVA2os=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fectvv8X17C/FOBwQc1GWxxJCIZMQCmiuU8TRPbmzZInZuTuM+Qx8y7E9dqHqa/djobEtdtrbHXXVu4eySn6idAtTeeZ1+N4DSP6glsbPgyuG7tN84n9C8JPjLSNyd2mz2GX2ZrfaqOiFwxjr68QB0tGxCss3OtRaM2j22GutJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=DhSb5mzi; arc=fail smtp.client-ip=52.101.229.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="DhSb5mzi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LL7/pHeBOY63XjCMRDzfuW7b5ULRq20XjqsRuTuMMpEwRjF4S4BX6BmOI493YonCxFtY3gj73Kf1AuM27/CeKectB0DfbuWTUEL8iJhQRfCOLSIqMAQOP79ETIFyG37bagmKn0bCnc4ldJn1E+FbZ0DFE3x4jqpABwur5L/yj7GZ4V+Dwz4y2toMbRApyvY3F0+c3uclLWI7Ynu8fQz46BNxpjY/S/9ZTXJVvEA2FuUr8Ewartmb3g6JfHbTOSmFrN9+/aOGj2wcySOqKZVTWW1AeXybXWukM7gn4qH9jj1JNyOTGvgICeLVl2iXON9couhpSNnV++q3U8zHHfKmMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RRqN0bcaoHl3/R3tZ1hPHjWuA49aLC1T+jYFRGVA2os=;
 b=nquYOCIOvcpaamrTOMT8ptcHoEhjdY/W5r27g05FWpTHOe4J3sjLbbG5qTqBAMZC2Bgn+pb/GpN7jpASr3/ZGZ1lVhliL5oQSGGq6PI6Ho5+EmGW8vUz5RnakwseQE8c60ZxTMxE6+x7Hls+KtD/ZWG6lc+sFXv5x1C4YSjuu1LqdhwD9Dmjx2YKfu9GsWm3ZcqAV7760fnivZBbMV59A2V5sJStPTKfDZMkX3zJPlJIGuxQ8fdDJAoj9RHs93eiI9v2WI3t1PQU81sP5L3n8HoY783n/DoR+DjQAxgPr3ce756H+GPPx54w8bgSFOQQsP35z31o0QTG+MojgwzzKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RRqN0bcaoHl3/R3tZ1hPHjWuA49aLC1T+jYFRGVA2os=;
 b=DhSb5mziekeTpvnbP2mo4K2K29Pk+2D6IAyEOH1xa5oO/NOx7saY1kJE+FTD0nh47u9UhfEVtPZhbvLvZvOHfiyJSrcfwn+Fdz79kv8orGN0AyjUTkCne429/rLKLJqsvnPb+p853i0x3VSeFdkSJKW3WT8ZAdewI57DlP3Rqbk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB14556.jpnprd01.prod.outlook.com (2603:1096:604:38d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 29 Sep
 2026 17:24:20 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%6]) with mapi id 15.21.0451.026; Tue, 29 Sep 2026
 17:24:20 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, "biju.das.au" <biju.das.au@gmail.com>
CC: "magnus.damm" <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 12/13] arm64: dts: renesas: Add DSI overlay for RZ/G3L
 SMARC EVK with ADV7535
Thread-Topic: [PATCH v3 12/13] arm64: dts: renesas: Add DSI overlay for RZ/G3L
 SMARC EVK with ADV7535
Thread-Index: AQHdNYM2OFCQ4o48x0aVqLD39GjT9rbEv+WAgCFDInA=
Date: Tue, 29 Sep 2026 17:24:19 +0000
Message-ID:
 <TY3PR01MB113468C17D117363ED869A4BB868C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
 <20260826174854.199139-13-biju.das.jz@bp.renesas.com>
 <CAMuHMdXM9HEZigwC+rDcJd52c+XMGZ6+8fK+5+kDYFYkSQMt2g@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXM9HEZigwC+rDcJd52c+XMGZ6+8fK+5+kDYFYkSQMt2g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB14556:EE_
x-ms-office365-filtering-correlation-id: a71a334b-d3a0-4325-c5c2-08df1e4e7f3c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|3023799007|38070700021|4143699003|10067099003|11063799006|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 iYv8xuQJTHLmuGlsifvHLAlJVJN8wpbdc3dW7/9LoAZPNrETCsH/Hn9/pZN84eq3ep8GPmPas/goGZ25BRAZOFPnZiyuwc5LXjdP6KxQVkZMTQrmz7XKqTR32rRj0BzjE5j3sbVvd6uaBWLp1/iqWsPi6yYHWiE7YjrM75/mgORP23gLVX2aVGd9Q8BZZwbjnRP4FfkeWHeH6tYsLI7Ur70M7pjIE26h//d7+Boe4cEOPPdeNzbmQuEN5QY+MLPOIrMI5mfMTUj85hFtFpZqxqGB7+r1vq4TONlFbiPWzfcdVsFKtX+LXWV932qbudbJ3dfHN0rirw3x2UwsunSIVC/IsLo0Q32LBie1mFjGtE5uq2OZCbtnoOCHwpliBeoUejpUY+OplYv5iYr8RHVXsX6BRGsCFg1FxtxY+CythtEYcB0Y0uLQuP6e+R3fPpY3NtzfZcbFLsz/l+gdIDD93Wke6CftrIjOqynI6lBlx+4JfOj7KzvtDk7LIvZhkP1GmCMGx1uYazSZR1IajEhQ4Od1vSHi4XVDfmg80hFS8mlzjZwDyoNGMbjrghQj1GJdDs3oQYdtd+Hqub1Y0rIcNOPIYD8rbe4ISyVUE5OLYUG+9TIHk6XlpcI0ue9zxfANp1hpsIHQEylx17dt0lz73UCR5/zJ/GCIJi7tNKvlrf8qKdruUJ/jO7dOrExa3AZS+oTBicPVcGojw51h+lAMyNsjkdeVJ4Mh7XJTuMo6aL4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(3023799007)(38070700021)(4143699003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Sk5WT0ZUK3lVTGlUczYwLzBtd3RMTVNOTDFWdUpDNTFGc1FzQ1JiTEprSjM5?=
 =?utf-8?B?UVdKK0dwOFRYWXhUb2N1NDdkYXZoUit6ZTIxbWVsWnpnV3k4ODlJdkEwRzRZ?=
 =?utf-8?B?TjliYXp1TWFiUk8wSi9tQWZBMlc5dXVBNEtOenV1bHE1d0k1WjB5c3FTVXZP?=
 =?utf-8?B?ZkV2b3RoOGZmVGFKaGJFQlJzOXVFUjFHd3A4SENiYXFobDFGTlUxc1JWNmc0?=
 =?utf-8?B?MlNSVXVkUnl2Z2lhZ1hFUEtpQWdwTFVuWnJyMzJod3QwS2czOUZtT0V3RTBE?=
 =?utf-8?B?cGxvNlh2MmU1VFovSUw0U1BKU0xkamtuRE96OVB4UVBDc3duSjVYQzJJMUlF?=
 =?utf-8?B?QU9Vbmc2eWlpMGZlSXlwNTNpL3lVRExCQ1NRSUNrZGNHZ3ZSSUQvbG9qNFBZ?=
 =?utf-8?B?TG9GVFFkQ09IY3E4RGtvZGljamg2SjQ1SGZxZkpwWFczaTJIZGZUeTZXV3pD?=
 =?utf-8?B?dGNxY0Fib1R0YlJnei9FMTk4eC9hdGlOY21pdFlaTSsvY1ptTUJXdlNydHNF?=
 =?utf-8?B?Tk4xMVhlWVRFYTk4NGljSGlmTFErUDVDeldPaktkZit4N1AvQ1FsMVN2dFhx?=
 =?utf-8?B?eEREU0MzRFJOZW85TW1FeEhIaXpZWEJPZXFPcmU4cHVvSW0reG5oQ1dZSzM5?=
 =?utf-8?B?OE1BdUVBUkVYOEgweDVIaDVuTmplR0YyZjdUK0piRStEU2hudGNZR3EvWC9F?=
 =?utf-8?B?T3EydDZiLy9DdnA1SGs3WU1aQUFLVmxSeEk3eFRmUGUwUFA1OFJoNXV6VHMx?=
 =?utf-8?B?aURqclBET0Y5WTlZZ2ZWbFRTRFB6VzE4K3VpcDZhblBxSFZxb0VPc0I2M0Fn?=
 =?utf-8?B?YUdYUytNVm03dEhXRVN0U0ZCMDUyOURFUDhDT3lsNHZnQW54NDJjRUVURlZD?=
 =?utf-8?B?Y2JlUXFaVzQ4NnJRUmU2aWE3cHVPeXpWcTBGNitNNkZad2YvaHcwNXNnL0py?=
 =?utf-8?B?bTY0K1BBQnV3czRySHdIWDhWS3lFV0VZWVR6YnFJUEs0TUhnVDRoRXpybnNm?=
 =?utf-8?B?QzR5MkRocXJZTkQ3OGN0b0ZkaXUzZkZsdXBqbGFrZ0UzVG1JTXZPSTdtQ0Yy?=
 =?utf-8?B?VXNaOFRyVXJxZlB2REhCN04vNThLZkE5bHhXQms5NGVwbGxoVHBTN04zMzRk?=
 =?utf-8?B?SFVrLzFKRS9TOXJhYmNhdTczMlBFSmZnWENQb0w1dzRwR2xwMlhYNUJBSWNJ?=
 =?utf-8?B?TWtjYUZIbC9FZGtscnMvUlIxR3c5bFNpa0xvSlQ4OWJMVTRSQjM5UUFKaTVi?=
 =?utf-8?B?NWxHNjBvTUN1L1lNMUVERXVzbWcrNkR1VVgxSk40NStRRnM5c29IcmtrWlpQ?=
 =?utf-8?B?TEVmaVBjUkZOVWV5SUFzbzNHNUlBMW1FRm1Sc2tacG9icGVQcGlSdDZOOE5x?=
 =?utf-8?B?c2JLbU1XT0Q1Rzg3bHJoK2JjOHFzZHVSMEVhMFc4Tk9GZm9BVjRBZExEc1Z1?=
 =?utf-8?B?bCtBandCSFYzWVZDazIwT2pTTXorRzAwRTFETDF3K25pbG1INlhPSXB2Q0la?=
 =?utf-8?B?MDNuZDBJdlcxNTRWa3JoSFo4djdURlpFUTJaaytJZFg2V2p6d2t4REpFcnY1?=
 =?utf-8?B?aWlmWHJyNE1TdXh0bi9EQTBSakRrLzVHaS80TWw4RDg2T2E4OWl2Z1RJSHdY?=
 =?utf-8?B?N3NLWnJLQTdMcVVZYjV5VlZHVTVKVlRaNytBaUNmWHY3MU5YMnJKNUw2STha?=
 =?utf-8?B?SHFTWUdVWG5GWUtyejBRaFQwcytYcHc4UXNmQXg4UlZTK0JQWlpTRnpBdmtH?=
 =?utf-8?B?UThRZCtEa1B3bm92VmJVd2JTNUdic2IzN0NXMStkeC9xK25NQTVBRktxWHdq?=
 =?utf-8?B?d2VXRnJqV0p5cm5Cdys1TkJ5WXdVYklENHUrTmZlQ0lTbHMrOE9ndk1NYnd1?=
 =?utf-8?B?WVRnL3MreXM5YTkrVVVxWXZadjNFU0Z3TlF3Y0FOaGhVU0hkNkRZdlU5Y00r?=
 =?utf-8?B?ckd3U2VTNHh3emRMakJ5bE5VMUFaTDl5RU9lNDN0OTdMSlBmZ3dJazNlRXdk?=
 =?utf-8?B?Z015MFZmVGVLNVNrbzRSSmZPeXJPQ0VyQitnTUgvWlBEWWVIajNFTjlFUmR5?=
 =?utf-8?B?NFJlandXU2crUFhhcUozU3FiQ2pVMnZ2Ky9zKzU5OG5WUklWdUorb1M2c2dm?=
 =?utf-8?B?Q2daOG0raEpINHM5YkNvWkpLRWE0bmFINXEwRUFOMGUrWm4rOFVsVjluZ0Iw?=
 =?utf-8?B?VDNacDBsbVdUMEFWYktRdERmT0QzQlViVWxQZ2ExTm1WUnhuVTc5cmNjQTBK?=
 =?utf-8?B?ekdYNEkzTFE5dDZSOXc5VjVMZDNCUU1lTzh5aE42Tm1HeGVtUWlRaXE3cTFi?=
 =?utf-8?B?ajJGMGZIdWY4c3RWay9BL2RxUUpwNkpDODhFRjJNMlBCMCtOTzQrQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a71a334b-d3a0-4325-c5c2-08df1e4e7f3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2026 17:24:20.0470
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hjF0Vkpei7g5rLIMUckmVBsyBwCt2gmxyzi5BCu4QDY6G8nKPREMgq/H+b+5ck3ckSeXGEvtZLjXRS0yUWKRMKM1iKlBNvW7HiaEqT0+cUI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14556

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDA4IFNlcHRlbWJlciAyMDI2IDE0OjI1DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjMgMTIvMTNdIGFybTY0OiBkdHM6IHJlbmVzYXM6IEFkZCBEU0kgb3ZlcmxheSBmb3Ig
UlovRzNMIFNNQVJDIEVWSyB3aXRoIEFEVjc1MzUNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBX
ZWQsIDI2IEF1ZyAyMDI2IGF0IDE5OjQ5LCBCaWp1IDxiaWp1LmRhcy5hdUBnbWFpbC5jb20+IHdy
b3RlOg0KPiA+IEZyb206IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4g
Pg0KPiA+IEFkZCBhIERldmljZSBUcmVlIG92ZXJsYXkgKHI5YTA4ZzA0Nmw0OC1zbWFyYy1kc2kt
YWR2NzUzNS5kdHNvKSBmb3INCj4gPiB0aGUgUlovRzNMIChSOUEwOEcwNDYpIFNNQVJDIEVWSyBi
b2FyZCB0byBzdXBwb3J0IERTSS10by1IRE1JIG91dHB1dA0KPiA+IHZpYSB0aGUgQW5hbG9nIERl
dmljZXMgQURWNzUzNSBIRE1JIHRyYW5zbWl0dGVyLg0KPiA+DQo+ID4gVGhlIG92ZXJsYXkgZW5h
YmxlcyB0aGUgRFNJIGNvbnRyb2xsZXIgd2l0aCBhIDQtbGFuZSBkYXRhIHBhdGggYW5kIHRoZQ0K
PiA+IGRpc3BsYXkgdW5pdCAoRFUvTENEQyksIGFuZCBjb25maWd1cmVzIHRoZSBBRFY3NTM1IG9u
IEkyQzIuDQo+ID4NCj4gPiBVcGRhdGUgdGhlIE1ha2VmaWxlIHRvIGJ1aWxkIHRoZSBvdmVybGF5
IGFzIGJvdGggYSBzdGFuZGFsb25lIC5kdGJvDQo+ID4gYW5kIGEgY29tcG9zaXRlIC5kdGIgKGJh
c2UgRFRCICsgb3ZlcmxheSkuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8Ymlq
dS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+
IA0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVz
YXMvcjlhMDhnMDQ2bDQ4LXNtYXJjLWRzaS1hZHY3NTM1LmR0c28NCj4gPiBAQCAtMCwwICsxLDk1
IEBADQo+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+IA0KPiBBbnkg
Y2hhbmNlIHRoaXMgY2FuIGJlICIoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkiLCBsaWtl
IGFsbCBhbHJlYWR5IGV4aXN0aW5nDQo+IGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEw
OGcwNDYqIGZpbGVzIChhbmQgYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3J6ZzJsLXNtYXJj
LmR0c2kpPw0KDQpPSyB3aWxsIGZpeC4NCj4gDQo+IA0KPiA+ICsvKg0KPiA+ICsgKiBEZXZpY2Ug
VHJlZSBvdmVybGF5IGZvciB0aGUgUlovRzNMIFNNQVJDIEVWSyB3aXRoIEFEVjc1MzUNCj4gPiAr
ICogY29ubmVjdGVkIHRvIERTSSBhbmQgTENEQyBlbmFibGVkLg0KPiA+ICsgKg0KPiA+ICsgKiBD
b3B5cmlnaHQgKEMpIDIwMjYgUmVuZXNhcyBFbGVjdHJvbmljcyBDb3JwLg0KPiA+ICsgKi8NCj4g
PiArDQo+ID4gKy9kdHMtdjEvOw0KPiA+ICsvcGx1Z2luLzsNCj4gPiArDQo+ID4gKyNpbmNsdWRl
IDxkdC1iaW5kaW5ncy9ncGlvL2dwaW8uaD4NCj4gPiArI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2lu
dGVycnVwdC1jb250cm9sbGVyL2FybS1naWMuaD4NCj4gPiArI2luY2x1ZGUgPGR0LWJpbmRpbmdz
L3BpbmN0cmwvcmVuZXNhcyxyOWEwOGcwNDYtcGluY3RybC5oPg0KPiA+ICsNCj4gPiArJnsvfSB7
DQo+ID4gKyAgICAgICBvc2MxOiBjZWMtY2xvY2sgew0KPiA+ICsgICAgICAgICAgICAgICBjb21w
YXRpYmxlID0gImZpeGVkLWNsb2NrIjsNCj4gPiArICAgICAgICAgICAgICAgI2Nsb2NrLWNlbGxz
ID0gPDA+Ow0KPiA+ICsgICAgICAgICAgICAgICBjbG9jay1mcmVxdWVuY3kgPSA8MTIwMDAwMDA+
Ow0KPiA+ICsgICAgICAgfTsNCj4gPiArDQo+ID4gKyAgICAgICBkc2ktdG8taGRtaS1vdXQgew0K
PiA+ICsgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImhkbWktY29ubmVjdG9yIjsNCj4gPiAr
ICAgICAgICAgICAgICAgdHlwZSA9ICJkIjsNCj4gDQo+IE5vIGRkYy1pMmMtYnVzPw0KPiANCj4g
PiArDQo+ID4gKyAgICAgICAgICAgICAgIHBvcnQgew0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGRzaV90b19oZG1pX2Nvbl9vdXQ6IGVuZHBvaW50IHsNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmYWR2NzUzNV9vdXQ+Ow0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIH07DQo+ID4gKyAgICAgICAgICAgICAgIH07DQo+ID4gKyAg
ICAgICB9Ow0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArJmRzaSB7DQo+ID4gKyAgICAgICBzdGF0dXMg
PSAib2theSI7DQo+ID4gKw0KPiA+ICsgICAgICAgcG9ydHMgew0KPiA+ICsgICAgICAgICAgICAg
ICAjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4gPiArICAgICAgICAgICAgICAgI3NpemUtY2VsbHMg
PSA8MD47DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICBwb3J0QDEgew0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgIHJlZyA9IDwxPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBk
c2lfb3V0OiBlbmRwb2ludCB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBk
YXRhLWxhbmVzID0gPDEgMiAzIDQ+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcmVtb3RlLWVuZHBvaW50ID0gPCZhZHY3NTM1X2luPjsNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICB9Ow0KPiA+ICsgICAgICAgICAgICAgICB9Ow0KPiA+ICsgICAgICAgfTsNCj4gPiAr
fTsNCj4gPiArDQo+ID4gKyZkdSB7DQo+ID4gKyAgICAgICBzdGF0dXMgPSAib2theSI7DQo+ID4g
K307DQo+ID4gKw0KPiA+ICsmaTJjMiB7DQo+ID4gKyAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwx
PjsNCj4gPiArICAgICAgICNzaXplLWNlbGxzID0gPDA+Ow0KPiA+ICsNCj4gPiArICAgICAgIGFk
djc1MzU6IGhkbWlAM2Qgew0KPiA+ICsgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImFkaSxh
ZHY3NTM1IjsNCj4gPiArICAgICAgICAgICAgICAgcmVnID0gPDB4M2Q+Ow0KPiA+ICsNCj4gPiAr
ICAgICAgICAgICAgICAgaW50ZXJydXB0cy1leHRlbmRlZCA9IDwmcGluY3RybCBSWkczTF9HUElP
KEssIDMpIElSUV9UWVBFX0VER0VfRkFMTElORz47DQo+ID4gKyAgICAgICAgICAgICAgIGNsb2Nr
cyA9IDwmb3NjMT47DQo+ID4gKyAgICAgICAgICAgICAgIGNsb2NrLW5hbWVzID0gImNlYyI7DQo+
ID4gKyAgICAgICAgICAgICAgIGF2ZGQtc3VwcGx5ID0gPCZyZWdfMXA4dj47DQo+ID4gKyAgICAg
ICAgICAgICAgIGR2ZGQtc3VwcGx5ID0gPCZyZWdfMXA4dj47DQo+ID4gKyAgICAgICAgICAgICAg
IHB2ZGQtc3VwcGx5ID0gPCZyZWdfMXA4dj47DQo+ID4gKyAgICAgICAgICAgICAgIGEydmRkLXN1
cHBseSA9IDwmcmVnXzFwOHY+Ow0KPiA+ICsgICAgICAgICAgICAgICB2M3AzLXN1cHBseSA9IDwm
cmVnXzNwM3Y+Ow0KPiA+ICsgICAgICAgICAgICAgICB2MXAyLXN1cHBseSA9IDwmcmVnXzFwOHY+
Ow0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgYWRpLGRzaS1sYW5lcyA9IDw0PjsNCj4gPiAr
DQo+ID4gKyAgICAgICAgICAgICAgIHBvcnRzIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAjc2l6
ZS1jZWxscyA9IDwwPjsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcG9ydEAw
IHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwwPjsNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFkdjc1MzVfaW46IGVuZHBvaW50IHsNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50
ID0gPCZkc2lfb3V0PjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH07DQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgfTsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgcG9ydEAxIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJl
ZyA9IDwxPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFkdjc1MzVfb3V0
OiBlbmRwb2ludCB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHJlbW90ZS1lbmRwb2ludCA9IDwmZHNpX3RvX2hkbWlfY29uX291dD47DQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB9Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIH07
DQo+IA0KPiBObyBhdWRpbz8NCg0KT2ssIFdpbGwgYWRkIEhETUkgYXVkaW8gc3VwcG9ydC4NCg0K
Q2hlZXJzLA0KQmlqdQ0KDQo=
