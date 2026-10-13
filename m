Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2092.outbound.protection.partner.outlook.cn [139.219.17.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020E24E9C3A;
	Tue, 13 Oct 2026 10:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889149; cv=fail; b=BXcOmH3lbOfGqm78fXzvtM2ff4+uyP1lUvJbaRAS5Yn6exGm/4sHAEyFUE2pIJwPBi/SnOyByMkklpldot8RzDnnFaF3p90Pmm5sUO24y/erNzSFEF6/yAZTVTsPt+KH7cTAdDb2jv+wZsi3FpLHBtvGbmNp7rc5AyVIP7jL65Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889149; c=relaxed/simple;
	bh=dqIX74IPw+UT0B01cPSa/NmkfYZM0P8YGdKgpMRhgGU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=A3i7U1bE7WisJghS6RJBfALqhMHC7D+Y32JiSOg2HBYNH8UMcyjO90fE1ULvoFqAkwO3oAdtr5cH6HqFmtty/A3FM39Jox0E5ocAiLaAzBwVM0Fqt/nGudRbQFuOO/tL6cY1xoocPh9MRhOwW0QbedZ120FAaOwTr1ZFaL4fuqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JwTVlL6hSAnPzNhGMgBIS/7seisp08NJsocNhaQcO1CvyhFX5JWrJo2Bc9QnqXHfpQvZH2YkBVc9oiCcRvNFsJjNN6OSmvfQsBJQv83sqt2llTJVHWRT5njm1/u2+CA89QEJpyigLtQOnn+ywrXzhxSDtSKmvGdNyCXNPkrSXeqQFmOvjj2R8m0fWplzSp/uQzkxk7yrgqdzm0gZMyuyjyOXw58p2GXsx668RtbCEuKGKzJIATdPujey9nr7ZcYbS2GDEkQKAuThZcBMvBCjCdIJsGdwHPb2XVwyHfJXGIF3mnfUlT/db/5ChBacD4L969RuerQL9V5Ygy5PX++zJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dqIX74IPw+UT0B01cPSa/NmkfYZM0P8YGdKgpMRhgGU=;
 b=Em/olRHCKG/pemhF6Ij70AHo7bosBegDICSv256D8WRmXmoH9qf7mTXchqrFUXK1QFwpCJtocpWgFVNpv84JTqSUbBL7XmJH1S4koiJkNq81Oy7aDlb4nL/q1+gxLy8yliwd99JpxRKmPH5hg1i7YvWDAq7ATqKYNeoU5qsM8Ve1wOFGTJBaUdFk7N/X1mZhvvBO82CquNeUKtF7wWVe1f5HXFSRRaXOPd2GCfMqSOHwtncMZ+OtdbDq0z8uLYXNls8bvJ2YXx4VDiJRuSTH305XYkvz/as3j1EQ9qIOnKPkuK+jWMEspezxjRIP7ux3QhSst+6/15b7Jnr7joQYaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:e::7) by ZQ0PR01MB1128.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:c::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 10:25:08 +0000
Received: from ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn
 ([fe80::d777:e23a:d111:5fa1]) by
 ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn ([fe80::d777:e23a:d111:5fa1%5])
 with mapi id 15.21.0522.011; Tue, 13 Oct 2026 10:25:08 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen
	<Thinh.Nguyen@synopsys.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v1 1/3] dt-bindings: usb: dwc3: Add JHB100 device
 controller PHY adapter
Thread-Topic: [PATCH v1 1/3] dt-bindings: usb: dwc3: Add JHB100 device
 controller PHY adapter
Thread-Index: AQHdRzzjXuT9ARZGdUGDbHIGHUq+Qbba3XSAgAJHa5CAAM0yAIAdebEg
Date: Tue, 13 Oct 2026 10:25:08 +0000
Message-ID:
 <ZQ0PR01MB111105ED4B7FB8DA5253F2FEE69E2@ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn>
References: <20260918071103.24482-1-minda.chen@starfivetech.com>
 <20260918071103.24482-2-minda.chen@starfivetech.com>
 <20260922-colonize-uncaring-c604b3529275@spud>
 <SHXPR01MB0863BEE05D53154B1F61BFE6E6812@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
 <20260924-taps-radiance-b52ebf9077e3@spud>
In-Reply-To: <20260924-taps-radiance-b52ebf9077e3@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1111:EE_|ZQ0PR01MB1128:EE_
x-ms-office365-filtering-correlation-id: a6fb6306-756f-40cf-cc4a-08df29144174
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|22082099003|18002099003|10067099003|38070700021|4143699003|261009223027099003|56012099006;
x-microsoft-antispam-message-info:
 07PQ5nG1IlVoeYLvaTRhGR5C5AdRbyThcK9iNhc3OAbQZZNlR5cF+yIghnFVLdJynyw2YkGQrPplOtXbB/UI9E41nLCfPKRdlhWANTvNhszfxapxNXKIUqrJkPASRGR9JL1HcML6NFaWCL0i9JHCH3qOojgY9Lcr2SXDuD5AwZx3Ry3J7NrHm4fsCfbNraWhXdicV2XGSgEs7/N/d+e4ZY145DkhUc7lnRJDfnMk8e4W4VhCGXPFgNwb4KMNMvwJwsyQ7uaLnhNxSt1r2LvhuYvymzbWgUp1YPusuwWvGTgG+PVMqHd/OhzMG2ihjp2Tpg5Qq2MgMfdjR0xO6t9o7cYqfzCmYn76JVuqfNU3wXVQAZ+og+htNsJ/CtHNEj9WKiTn6n8VUDDQs7yC1ChfaSNr0gKAv1moOh+VH/9aI8/l8iSsWaLFeXfdwud+B/rcegyXXIvffukBk2oREUPhpPr1xb2ShNDIVVo5PKeqRkjLywZPNBjPmjTgb6qp3HhI7Rust+G17Bsm+t9DvCiJmm4a3nzW8Q6uaAvJzzYpAeaUPomzQkxzEgEXGfvpAUk2
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(22082099003)(18002099003)(10067099003)(38070700021)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?b0x0V1k4NmlpazRLd3cyYUE4bEFSVU5yRXdrOHlKejVRUFE0U3VJZ3NGNVZP?=
 =?gb2312?B?ZFE3QkpsVjd0dHFKYm44aTdla1pNbUJiYWJrcTFFdzhqc2lLMDBkOUZ2aXh0?=
 =?gb2312?B?UTdyNi8yd3Q3TWJRbDYxRUMxZFdSaVB6dCt2M2hpbHFTQ3Fla2VwWEJDckM0?=
 =?gb2312?B?cEREdDNpMS93UUl3ZlJWYVBEZzVXMUpCK0VrN2FBVVdFNkVGa3ZJRlZYWEV0?=
 =?gb2312?B?TDYxTjJBR3hYc2hQZU40ODlWUGx0QUJLbi9pb0dxTk1FaEcvZTltMFhxR3VV?=
 =?gb2312?B?ZlFpWVRNd1EzMHZDcFkydmVvMUpkdjNZUTlCN3RQK3FOYkplRmVJV2JOb0kz?=
 =?gb2312?B?aXR0a24vNVdDT2t6MWthZnp2SEhmVHZaVEJlUW1qajBEVExTMzdJbnpVOVZ3?=
 =?gb2312?B?S1drRnRCeWplOTU3NXo4Z2pRQUVRcVVwUXlKQUNZVzRyRTNyckhuT2tkLzdS?=
 =?gb2312?B?R3cvWFRvY3E0RjBnZHdRb204ZTdJbzhVN3N1bHBzUStRc1RWWUVWWTNqNng5?=
 =?gb2312?B?RHdPSEp4d0ZQR0lOMnhTMStZVzBuR05DWWhZSi8xTkgxWFpUTFVGVnlmS2FB?=
 =?gb2312?B?VDRZUld0cWJLYUNXTi9aVWkvWWJQSGtUc2RwQTQ2ajAvMVladzFSdTFGSllY?=
 =?gb2312?B?RXEzWEh1Wm83SmF3ZTc3MUJPUzFwVGVJL256cjROTkppK1F5OTRoTjRuUDc4?=
 =?gb2312?B?ZUptdFhmTWRiNUJuWUd5QW1Qb2ZQZDlWUmZUQnpVUk5kbmRLcmtBSHBxdVls?=
 =?gb2312?B?bnlxNU1VcEo3K0hoZVo5encvK1hCL21Hbm52bUdiWkkveVA2TjhLZlUwbEdW?=
 =?gb2312?B?V3hydkJoc1g0U1I3Z01jNFlwa0RHWGMvbE9PRzdRRVdHOERDdzRpSU4vb1NN?=
 =?gb2312?B?VlZYbGZzZmtaSkYzaDlxTXRLZ2xOSkQwRUI0L2d2T09kZUNEUXFGSHlDQ3Fk?=
 =?gb2312?B?SWw1Q0I2YkhoRVpBRXE4ZUtoNnNhdzByZUJMWnNGMkhpTnVOZ213L1hjVmtD?=
 =?gb2312?B?WmY2Y0tmMDM1TkU5RC9YWGNKSnV2aExsdElPejRrZ0lhcmVUK0RUS2hzcjNQ?=
 =?gb2312?B?cjJlVDNXWUdEU3RxMzZoNXhObkRxUmp6VkFSbVB4TnUxeTdvWWJmSHlpQ0o1?=
 =?gb2312?B?SWNkT0dNZklnenBmQWsvdVRHY3Z3dU9NaWxzZ0drSktkL1grcWpNVGNPM1F4?=
 =?gb2312?B?SUtFdU4rN0FqVUVaemFjeHVROGhHbmtkeThkUTgxWVRHbE5NYW1mc1QrTVdS?=
 =?gb2312?B?aVBjUXZUcitjeWtZMzdWbHNkRmo2Y2xQRzdUc0ozRVZxWVJGcE5ldm5OaVJN?=
 =?gb2312?B?Z1ZnUk1pYTBkZzNjemxPY2Z0U2xudVZJTUZqbUlVSTUyT2ZobkcvU2RNaXk5?=
 =?gb2312?B?TXNnQkFsY0dNZVJzdFU0bGplZ3hSRy9sOG9qZE1Fc0w5bVRuU2lLWjIwRHRZ?=
 =?gb2312?B?UldhbitDWXZzeFc1Q3VqcXU5RlNiMFRkc0FPcjl1dnpmeDdYMHZ3NTdqRGQy?=
 =?gb2312?B?TjJ3R3NoVkN0YmxTSEdJdUJISW5namFDUXM4VXFRSXErbDhSckVFaGVtQ2NF?=
 =?gb2312?B?bHBUU09SN2pNb2t0bmxqNWRMSFAwSkFLOXhHaFFOT3B1bzE3dnNDMnBnaUVM?=
 =?gb2312?B?UFFBTmN1VWlvMjIwOHlFSFB3QkxkVmNkRVVmcTRIc0FlYm81ZXl0N0pibndJ?=
 =?gb2312?B?VC9GcXh1c0x5SlhIZFBpOUVMTGxDUEhDVlMvNjRHai92NnFRbFJyeFU1RmxM?=
 =?gb2312?B?bTFBYzBQcHpkNHlvVkhRYmNpTDdHcjhPVzlueEw3b1d2TFFRcTJtUDVBcTJ5?=
 =?gb2312?B?dDB0R210MkdtMEdGdjJndC9nR29xWEUwYnR6dktubk5SZzNDVzV5bnlINlU0?=
 =?gb2312?B?ejU2YXBkYS9NaHNwN0ZRZmpPTjNQUHV5ZnBQUVg1RmRBK2xZbzhZZnRmVDht?=
 =?gb2312?B?bDZZRkVYTlNFRnA5dk80NFBCNDJnTjRyZjN5cHBEQTRtN2NPLzRIRlF2Qldw?=
 =?gb2312?B?OC94YlJxQ0VlKzZKVFRoazBLOFdwaWFselluZmF6UmVOTy9PWC90c084cktp?=
 =?gb2312?B?NUQ5T3dzUjZVSkk4R0wzZDFUZkxPQ1FFVEtxa3dzZXpSY2dBbm1CSi9NakU5?=
 =?gb2312?B?OWxaUjdjSHRzUHlQcG44ZXVjMEliRzBVS3A4RkpTM1BRMllhellHVkRIRjNV?=
 =?gb2312?B?ejdMOU42OGR3WXkrKy9mdzZvanp0TTJjbUdkQXNVaDJSYnpvVUQ0STV5Yndo?=
 =?gb2312?B?UHl4bEhPcGNhUUFUdGp2VGRIVDRBUE5VWWxJbm5ZK1BHNjlWMFZyQm55MTFT?=
 =?gb2312?B?c2FxdThMejF3TWl0ZEwwMUdhMjFNVHlyZFF3VzB1cU1PdUZGUVptQT09?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: a6fb6306-756f-40cf-cc4a-08df29144174
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2026 10:25:08.4055
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ab/32/cyaB819BwDo2davaB+oTNs9WZfxya273lyGWolZQnRoV2wsYjEglEhY2Gkia5Hswpy7JEf6QqJBWmWI+sPr1eRjE0V/lsqFAeFWfo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1128

DQoNCj4gDQo+IE9uIFRodSwgU2VwIDI0LCAyMDI2IGF0IDA0OjAzOjM3QU0gKzAwMDAsIE1pbmRh
IENoZW4gd3JvdGU6DQo+ID4gPg0KPiA+ID4gT24gRnJpLCBTZXAgMTgsIDIwMjYgYXQgMDM6MTE6
MDFQTSArMDgwMCwgTWluZGEgQ2hlbiB3cm90ZToNCj4gPiA+ID4gQWRkIGR0LWJpbmRpbmcgb2Yg
SkhCMTAwIHNlcnZlciBob3N0IGZpZWxkIFVTQiBkZXZpY2UgY29udHJvbGxlcg0KPiA+ID4gPiBQ
SFkgYWRhcHRlciByZWdpc3RlciBJTyByZWdpb24gYW5kIGl0cyByZWdzLW5hbWUuDQo+ID4gPg0K
PiA+ID4gSSBkb24ndCB1bmRlcnN0YW5kIHRoZSByYXRpb25hbGUgaGVyZSBvciB0aGUgb3RoZXIg
YmluZGluZyBwYXRjaC4NCj4gPiA+IFdoeSBpcyBpdCBub3QgYWx3YXlzIDIgcmVncz8gRWl0aGVy
IHRoZSBkZXZpY2UgaGFzIDIgb3IgaXQgaGFzIDEsDQo+ID4gPiB0aGVyZSBzaG91bGRuJ3QgYmUg
dmFyaWFiaWxpdHkgdW5sZXNzIHRoZXJlJ3MgbW9yZSB0aGFuIG9uZSBpbnN0YW5jZQ0KPiA+ID4g
YW5kIHRoZSBkZmZlcmVudCBpbnN0YW5jZXMgaGF2ZSBkaWZmZXJlbnQgbnVtYmVycz8NCj4gPiA+
DQo+ID4gPiBDaGVlcnMsDQo+ID4gPiBDb25vci4NCj4gPiA+DQo+ID4gVGhhbmtzIGZvciByZXZp
ZXdpbmcuIFRoZSB2aXJ0dWFsIGRldmljZSBjb250cm9sbGVyIGRvIG5vdCBjb250YWluIFBIWQ0K
PiANCj4gSSBkb24ndCBrbm93IHdoYXQgYSAidmlydHVhbCBkZXZpY2UgY29udHJvbGxlciIgaXMs
IG9yIGhvdyBpdCByZWxhdGVzIHRvIHVzYjMuIEknbSBhDQo+IGJpbmRpbmcgcmV2aWV3ZXIsIG5v
dCB1c2IsIHNvIHlvdSdsbCBuZWVkIHRvIGV4cGxhaW4gdGhpcyBtb3JlIGNsZWFybHkuDQo+IA0K
T2theQ0KDQo+ID4gYnV0IG5lZWQgdG8gYWRkIFBIWSBhZGFwdGVyIHNldHRpbmcoc2VsZi1kZXZl
bG9wIGJ5IFN0YXJGaXZlKS4gU28gaGF2ZSAyIHJlZ3MuDQo+ID4gUHJldmlvdXMgaXMgQk1DIFVT
QiBtb2R1bGUgZG8gbm90IGNvbnRhaW4gaXQuIEJ1dCBpZiBQSFkgYWRhcHRlciBiZQ0KPiA+IG1v
dmVkDQo+IA0KPiBBcmUgeW91IHRyeWluZyB0byBzYXkgdGhhdCB0aGUgamhiMTAwIGhhcyB0d28g
ZGlmZmVyZW50IHVzYjMgY29udHJvbGxlcnMgb24gaXQsIG9uZQ0KPiBvZiB3aGljaCBoYXMgZXh0
cmEgbG9naWMgaW1wbGVtZW50ZWQgYnkgU3RhckZpdmU/DQo+IA0KVGhhbmtzo6xJIHdpbGwgYWRk
IHRoaXMgdG8gY29tbWl0IG1lc3NhZ2UgaW4gbmV4dCB2ZXJzaW9uLiANCg0KPiA+IHRvIFBIWSBy
ZWxhdGVkIGRyaXZlciBjYW4gcmVtb3ZlIHRoaXMgLiBCdXQgVGhpbmggc3RpbGwgbm8gcmV2aWV3
IHRoZSBwYXRjaDMuDQo+ID4NCj4gPiA+ID4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTWluZGEg
Q2hlbiA8bWluZGEuY2hlbkBzdGFyZml2ZXRlY2guY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4g
IC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9zdGFyZml2ZSxqaGIxMDAtZHdjMy55YW1sIHwg
MTENCj4gPiA+ID4gKysrKysrKysrKy0NCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gPiA+DQo+ID4gPiA+IGRpZmYgLS1naXQNCj4g
PiA+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL3N0YXJmaXZlLGpo
YjEwMC1kd2MzLnlhbWwNCj4gPiA+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvdXNiL3N0YXJmaXZlLGpoYjEwMC1kd2MzLnlhbWwNCj4gPiA+ID4gaW5kZXggZmJhYmU5OWU5
ZDVjLi5iMmZkOThjMDZiYTAgMTAwNjQ0DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2Ivc3RhcmZpdmUsamhiMTAwLWR3YzMueWFtbA0K
PiA+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL3N0YXJm
aXZlLGpoYjEwMC1kd2MzLnkNCj4gPiA+ID4gKysrIGFtbA0KPiA+ID4gPiBAQCAtMjAsNyArMjAs
MTYgQEAgcHJvcGVydGllczoNCj4gPiA+ID4gICAgICBjb25zdDogc3RhcmZpdmUsamhiMTAwLWR3
YzMNCj4gPiA+ID4NCj4gPiA+ID4gICAgcmVnOg0KPiA+ID4gPiAtICAgIG1heEl0ZW1zOiAxDQo+
ID4gPiA+ICsgICAgbWluSXRlbXM6IDENCj4gPiA+ID4gKyAgICBpdGVtczoNCj4gPiA+ID4gKyAg
ICAgIC0gZGVzY3JpcHRpb246IENvcmUgRFdDMyByZWdpb24NCj4gPiA+ID4gKyAgICAgIC0gZGVz
Y3JpcHRpb246IERXQzMgZGV2aWNlIGNvbnRyb2xsZXIgYWRhcHRlciByZWdpb24NCj4gPiA+ID4g
Kw0KPiA+ID4gPiArICByZWctbmFtZXM6DQo+ID4gPiA+ICsgICAgbWluSXRlbXM6IDENCj4gPiA+
ID4gKyAgICBpdGVtczoNCj4gPiA+ID4gKyAgICAgIC0gY29uc3Q6IGNvcmUNCj4gPiA+ID4gKyAg
ICAgIC0gY29uc3Q6IGFkYXB0ZXINCj4gPiA+ID4NCj4gPiA+ID4gICAgaW50ZXJydXB0czoNCj4g
PiA+ID4gICAgICBtYXhJdGVtczogMQ0KPiA+ID4gPiAtLQ0KPiA+ID4gPiAyLjE3LjENCj4gPiA+
ID4NCg==
