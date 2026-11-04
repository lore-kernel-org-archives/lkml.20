Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.115
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793792297;
	b=bCoDBUp8WAcT3V+eiozPLnDjLABKGYwJQiPt5ux2iolFi7066pvziwQTPfdzP2C/dsfp
	 RvhtQDhlA9+4lNLz0/qNyOHFrkAt9ntKzjCAZufNHJgocpz8ViR721UxAQ+BZ7e9LA74/
	 ycBTo8RMZtqjF08/hBOR8n8OEV/qACkHlG9NTZgmzM24NfBL78ZSP9bIguiGcMZxtRZ6T
	 HH+BUNpslS29yO/+XmlSI6rs9tNWTPXWwle/ydUNNOpNZUk0BQWq4vrHhjnhfVrgSajJX
	 2/9EqzMomx2JSCK7ZZJOweMdMe9kfruX3MuAn7KtgEzmsE+ZncYDfEgR2w/BlPvfCzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792297;
	h=DMARC-Filter:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=B2IYJG/WkbxxjlsEA9f3yOmd6uJxWrqyQFbI7DL3aRQ=;
	b=LQQFXrPLvRhWuVA/QxBlYDmNrX5TwLCwCa6vlJxVcf/awnVsvILtQKf3ejGBimBuo46m
	 wLbaSQ8uYrnpw6alW/PeQ63TvL/OJKperFv8hbFocZwWcQBJ8hiPI6LzVii9rAt9zacXN
	 M3el83xcT1cuN1v38oz2obwmXUed044N2Ny1MX2s9UKQGd6ehnHMePVPXGpWX4GZr1Bdb
	 b01rKLStnYYqOUqf6Q7UnsBF1dueeqLzp5u5MZGpIXjH5APu/oJZCfLJrNLAjEWorO6jk
	 AiQ8ncWoti7gXZAaqFIyzEIY7AAauK4CdTG3z+3RAkeqoXaahyRgpo+2LiLIMlnCGew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.115
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2115.outbound.protection.partner.outlook.cn [139.219.146.115])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26807606D82C;
	Wed,  4 Nov 2026 11:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26807606D82C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bAOU4S/ZxzmiVWedYlFIzZAuhRh9haFi8Qv4mzDX4UtFG/Unvpc+n2KvC9LWjwdbxslr6PQJOG11Dl58XJBvETOD4omEd1/I9uMzfkWCMk7fkv7btXboAT+XsPmTVyVMCLGXYo9r4qkQ4i2CzDU7OtB0k21KrgpiCdU6bSQD6+2eQZF+6LgGNJ6WFfhRG07wF5tQrKg56/vYjI6pZq3b0ROKkPVKo0TGIMFF4ZnAgztXDwF4mNbYcp6eTuc+Qb5fIx/fXXxtDzJXAbplf//ZYTVjkhrqqxxaGdFv7Bq+jOpGk8Ru8ZuN0BEjuCxf1Ye9OnuKMxuz+Mo3hxi1zRz5mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2IYJG/WkbxxjlsEA9f3yOmd6uJxWrqyQFbI7DL3aRQ=;
 b=E3MznCsjQvDGAMMb/P70VMhycZGKU9BiQig8OqLxj4Ja0ndQ8o5g9z4dlmHAdsu+WseflGOTPyINURd64dId1FAchwB8lrPthA6CXUq9v5fCR+m2KG0NCnTxb5CuK1P04PyzULjBxGLSUlk1SmoaGX8MlPjQTbhhB4408w/1ky5/qcQw4eW492iBrJN0CcBly7wimSl3GrSbG3YOk7vKvbav3keCLsu4+meK/egxJJRiLBodYAultkv2scn5YoHQOj5X76OFsFBsTQkdkV5L/D6FlUSQEHwqXLGXdCzuuQuNddALYUwEc5mZ7TNVHZhQGZ4FsFyPRi9Lkb2WpxTfiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:e::7) by ZQ0PR01MB1320.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:19::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 4 Nov
 2026 11:38:03 +0000
Received: from ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn
 ([fe80::d777:e23a:d111:5fa1]) by
 ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn ([fe80::d777:e23a:d111:5fa1%6])
 with mapi id 15.21.0592.009; Wed, 4 Nov 2026 11:38:03 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen
	<Thinh.Nguyen@synopsys.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: usb: starfive,jhb100-dwc3: Add clock
 number limit
Thread-Topic: [PATCH v2 2/3] dt-bindings: usb: starfive,jhb100-dwc3: Add clock
 number limit
Thread-Index: AQHda19e7H7xChM4cUKPYvyz/AZHQrccPEkAgAGO3VA=
Date: Wed, 4 Nov 2026 11:38:02 +0000
Message-ID:
 <ZQ0PR01MB1111D38AFE09916AA2EB0AE9E6682@ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn>
References: <20261103064836.71059-1-minda.chen@starfivetech.com>
 <20261103064836.71059-3-minda.chen@starfivetech.com>
 <20261103-aspiring-spotted-loris-fab3df@quoll>
In-Reply-To: <20261103-aspiring-spotted-loris-fab3df@quoll>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1111:EE_|ZQ0PR01MB1320:EE_
x-ms-office365-filtering-correlation-id: 670a2265-dde8-46d5-b273-08df3a6815f1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|38070700021|4143699003|56012099006|261022105027099003|261022075727099003|261026121527099003|261028144727099003|261026140227099003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 MOmgF3bDFcJ9Et9/J64qyDk9qUHn9EUXdJ/nWZez/bVMFohJkguopZNeqHtqRT9tbmOzmjWvtqu8E2Qw6afcpwzRhaLUTkXwkNVphBzMvHyaYXdQVi4rUTIdCdBsxOOhx2mINqifIhl2FLMi8qBS65OuZjl1YJ2/4FfcBI9SEDuEPKedNgsXvfXGYSYfG2UShzUcalNvK99mk7Vh0gJo7E0+jssbfF03nZSG3bsjZjXIg1qvyTLFvFvNWuYYwlpw2QKiNhv+kJTYZSyTSAyVhBUcHXml+clnFnurt35PW8+5zgdf8EWR7UDJt+aaiAJMzN/6zWr4k8LFvFR/2uqjTM4ffE0dIWVnmGFNYoH+DXmahLDRYWY3h0VjxTesaLsY7/0Gc8IXnOyIlefFk8TTWxRVZJ8LYfTL8EH53fp1hoXRTs1a7RnVt/BaYjkKqOSwQayU6/Fb/iVyXRnhKP8lBykU2/5QebPm0I6gJU2fjEPwkOQX5fjU+RR5g1t9tH6wPcE1qGvvFp1JbPZknpbCHAD++es/0f+0QM0HOJ7K3Y0YxKN6V91XInGMdGhyIN+d
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(4143699003)(56012099006)(261022105027099003)(261022075727099003)(261026121527099003)(261028144727099003)(261026140227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?REh4QTR2c1VkZ01Xc1I2S25VdlZtaitHSGtwMCtId1g0eVZOUEhTM0h5cUFN?=
 =?utf-8?B?bDhjbHFPaEJFVnpLVVNmTERvYlZ4cGc2N1lhNVJERjBmZUxsVk5EYldZdzNR?=
 =?utf-8?B?WWtOVStlSjltT0N1b0hid2o5MnJ3cStwVUpBUnBsZmxrTUFqTktpUWRlRzBj?=
 =?utf-8?B?YzlMTXVCVERyU3hMWnVvT1E0REh2YjFCYzhKUkM1UjhaNng5OUZBNUY3ZnJQ?=
 =?utf-8?B?cGYyeFVncDgvaXBUTW1hMXNPZzJKMFVSRm1BVnVpcnFjeTRwMXNJUjBSSXM1?=
 =?utf-8?B?clZReEZZVlZpSXd1c0hDckkrWGIvU0l3WXRvOWlrcEVibWlYRmxuYzlLZXVp?=
 =?utf-8?B?aEJwSTJOdlR4Wk9BSzM1cVoyODJ1R3A3cUduZVJwWFNTSUJMNWF3b2NUeENW?=
 =?utf-8?B?L3BsNmJVYVFzNFRKWURGTDlkclBPdlJNTWo3Ym51elVqSEJndUU5OTlsK09Q?=
 =?utf-8?B?TUtkb3ZTWldOWDhtQk5TT2xoOVNHa0F3aFVPV0wvdE9FTkRRZlM2Rlk3cWFC?=
 =?utf-8?B?b0lnamhsOGhHckRlL1JuK0x1VDRZYnRPRXR6SytIcVdJNTN5aE9ibm1xUFJ6?=
 =?utf-8?B?b0g2MklYQVE1Q0dua3FrUExaWXlRZXUvbjBzVWtJTTJjR3hOTW5WUlhQM1da?=
 =?utf-8?B?TzMrY0E3VXp2bXBJNjRQY0pSanNJU0o3RDVRcXZlQXpkZFg5SStCR2FaYUZC?=
 =?utf-8?B?WHVZaVJ6NllZUGExazdQYjFHUjVsTXdJL2NBSnJZR0xveEdxK0JEN1FBOEFR?=
 =?utf-8?B?OU9JbUNuWGc5blk2dTJZWngzS2l5UzRla0dadUprZEJPN3ZNdEhJbCt4Wmor?=
 =?utf-8?B?ODU4SnRLeGR0M0dwREpHOXgrWlJqUDBMUFFaS0lqeDZhU3Vqc2lSUDFMQm4v?=
 =?utf-8?B?SCtMdjloTVVrY3d1L3NsMi9SS29VYXlDdEE0eENrVm5ad01EWHlzcUhWQTJW?=
 =?utf-8?B?ckxpdnZabUhiUlR1Z0d4THVISGdNZDdVL1FKUEFoNk83SVEyTElqbk90UC9Y?=
 =?utf-8?B?eDVKeENrTCszRlRsOTM1SUIyS2RRUWFWNWNkeWR1TCtkeE5EeENQYUFXNzhG?=
 =?utf-8?B?aVVHMlFoTTV3aUJmdjJVZXROTkVHTTl5eTNRaDd3b1dOMGtoNElwUDJoaURF?=
 =?utf-8?B?eWNKUkFNSGIzWnh3M05Vd3ZhTlU5c2llUEpxQUozNEcyTlJvWXBqaWVTTkpG?=
 =?utf-8?B?cmMzeWhCUFF6NGtSRzcvR1FzVUZWeFlLaWRnclhOd1JOVEtpY1RHa3lYZnMv?=
 =?utf-8?B?cmEzenh3blg2V1ZNRE9CY1paZ1BBQS9QMVNsckFubVc2eEpBdC96ek5YVEFh?=
 =?utf-8?B?OE9xZEt0UThNMy8rQmJKdnRFUnlVVEk5aWNCa3dqSHhoRE1uYmlTTDMweTZp?=
 =?utf-8?B?bzNkbDdoZVh5eWN0SXpyRWoyQnNpQnRvbkNnSkxVQ0p3cTFJOTNKcEZ1ejNI?=
 =?utf-8?B?RW9PQ2dCNkg5N1Ryc3pJTWNTLzBtTnJ2bVZmVFBHN3lNM0dXOFRYMTRFSmVG?=
 =?utf-8?B?dk5tVSsyZE9DV2lJcDNlQ1pjeFQ0b3QxSmFXNWd2dXJHTk52OEg4ZzNDSjhr?=
 =?utf-8?B?VEUyLzZGcnY1eEV1ZnVwM0QwVHhMSUtGbW55a3pYQ2paQnpFM3dZTEkwcVk2?=
 =?utf-8?B?VVcyMDg0K2dLMlBDTjkveHUrcllwam1sMmwrUVdXT2JoNDJoMkZQTHVPaGpz?=
 =?utf-8?B?RC9TY294WGxrcE5Rdkl2SmEwdVhHMDFZSjhyckNwdjZ2ZUNyZXVqVU1DL0Fx?=
 =?utf-8?B?dDdFZy9ZME1YajNHTlRZK1Q0a3F0RzlBcU5ldENjL21qcFhNb1J0RlNubVU1?=
 =?utf-8?B?VzVVV3JrNDhnVzdScWd2bllFajZUOHZ4SzNkM3lES3FZL1crMzljYTgzbVFZ?=
 =?utf-8?B?aVRVdWZUNHVzRkwrV3c0cXRlWnZPbUJnVTBQYlc0NkdYRGJxVkViU0g2SmtF?=
 =?utf-8?B?a3ZXZi8xK25zU0FxWVFlVjA5V3I1b3VXcm93V3JSc2lOMVA2blh1Vko3bkhy?=
 =?utf-8?B?VENuZHVGbmJUQXZvWnpJVUJJZ3FNQVFWUHk3V0ZFRmVQUnk4R2hyZ1dhUE5W?=
 =?utf-8?B?OG1aS1RjVHhoVmVCcXRYZ3dtR3o3YmdOTEhOeG5NYXRFRVhYeGFzZE1kSnVB?=
 =?utf-8?B?RENmV0xzL1ZuK2RUMDIvRTVGY29EcXVVS3hsY3RyNml4RFJlMm5mMFNjb0o1?=
 =?utf-8?B?aDcyVFQ0NllNbmlCOGRndm5DdnZHZXRoanErQjZVSllySm14WW1qSG1GbDU5?=
 =?utf-8?B?VEZpQ1RiQ0NPQWVvZDREZFk2dUNBZllKU2xUUUNVekRoYm03cXJxanVZbWJl?=
 =?utf-8?B?WmE5MGdzeUQ2djM3RkUweDJDOUxLWnJRdVpWa0ozTTRmYjFsTWNVdz09?=
Content-Type: text/plain; charset="utf-8"
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
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 670a2265-dde8-46d5-b273-08df3a6815f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 11:38:02.8508
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a7Q0RfFbmVxaopAndgmQW9D+sYJFEh3GF4bz09sNgliMxSWxnY9mHNOII6UMkkyRhdK6wcS10XjVpQOcSC5UL6NFMT3aZ/dNZAwN+6EjDPI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1320

PiANCj4gT24gVHVlLCBOb3YgMDMsIDIwMjYgYXQgMDI6NDg6MzVQTSArMDgwMCwgTWluZGEgQ2hl
biB3cm90ZToNCj4gPiBTdGFyRml2ZSBKSEIxMDAgZGV2aWNlIGNvbnRyb2xsZXIgZG8gbm90IGNv
bm5lY3Qgd2l0aCBQSFkgYnV0IGNvbm5lY3QNCj4gPiB3aXRoIGRpZ2l0YWwgYWRhcHRlciBtb2R1
bGUuIFNvIGl0IGRvIG5vdA0KPiANCj4gUGxlYXNlIHVzZSBhbnkgZ3JhbW1hciBjaGVjayB0b29s
Lg0KPiANCk9rYXkNCj4gPiBjb250YWluIGNvcmUgcmVmZXJlbmNlIGNsb2NrLiBTbyB0aGUgbWlu
aW1hbCBjbG9jayBudW1iZXIgaXMgMiAoZ2x1ZQ0KPiA+IGxheWVyIG1haW4gZW5hYmxlIGNsb2Nr
IGFuZCBkd2MzIGNvcmUgYnVzIGNsaykuIFNvIEFkZCBtaW5JdGVtIDIgdG8NCj4gPiBjbG9jayBh
bmQgY2xvY2stbmFtZXMgaXRlbXMuDQo+IA0KPiBTbyB0aGUgYmluZGluZyBpcyBjb21wbGV0ZWx5
IHdyb25nPyBJIHNlZSBubyBsb2dpYyBpbiB0aGlzIGV4cGxhbmF0aW9uLg0KPiBZb3UgY2xhaW0g
ZGV2aWNlIERPRVMgTk9UIGNvbm5lY3Qgd2l0aCBhIHBoeSwgd2hpY2ggd291bGQgaW1wbHkgc29t
ZQ0KPiByZW1vdmFsLCBidXQgeW91IGRpZCBub3QgcmVtb3ZlIGFueXRoaW5nIGJ1dCBtYWRlIGl0
IG9wdGlvbmFsLiBTbyBpdCBkb2VzDQo+IGNvbm5lY3Qgd2l0aCBhIHBoeT8NCj4gDQo+IEltcG9z
c2libGUgdG8gcGFyc2UvdW5kZXJzdGFuZC4NCj4gDQpUaGFua3MgZm9yIHJldmlldy4NCkNvbXBh
cmVkIHdpdGggbm9ybWFsIHVzYiB3aXRoIFBIWSwgVVNCIGRldmljZSBuZWVkIHRvIHJlbW92ZSBy
ZWZlcmVuY2UgY2xvY2suDQogDQpCZWxvdyBpcyBVU0IgZGV2aWNlIGR0cyBleGFtcGxlLCAgSSB3
aWxsIGFkZCB0aGlzIHRvIGNvbW1pdCBtZXNzYWdlLg0KICAgIHVzYkAxMDY4MDAwMCB7DQogICAg
ICAgIGNvbXBhdGlibGUgPSAic3RhcmZpdmUsamhiMTAwLWR3YzMiOw0KICAgICAgICByZWcgPSA8
MHgxMDY4MDAwMCAweDEwMDAwPiwNCiAgICAgICAgICAgICA8MHgxMDY5NTgwMCAweDEwMD47DQog
ICAgICAgIHJlZy1uYW1lcyA9ICJjb3JlIiwgImFkYXB0ZXIiOw0KICAgICAgICBjbG9ja3MgPSA8
JnVzYmRjcmcgMzA+LA0KICAgICAgICAgICAgICAgICA8JnVzYmRjcmcgMzE+Ow0KICAgICAgICBj
bG9jay1uYW1lcyA9ICJtYWluIiwgImJ1c19lYXJseSI7DQogICAgICAgIC4uLi4NCiAgICB9Ow0K
DQpCZWxvdyBpcyBub3JtYWwgdXNiIHdpdGggUEhZIGV4YW1wbGUgZHRzIHNldHRpbmcgaW4gZHQt
YmluZGluZyBkb2MoZG8gbm90IHJlcXVpcmUgdXNiIFBIWSBzZXR0aW5nKQ0KICAgIHVzYkAxMTgw
MDAwMCB7DQogICAgICAgIGNvbXBhdGlibGUgPSAic3RhcmZpdmUsamhiMTAwLWR3YzMiOw0KICAg
ICAgICByZWcgPSA8MHgxMTgwMDAwMCAweDEwMDAwPjsNCgkJcmVnLW5hbWVzID0gImNvcmUiOw0K
ICAgICAgICBjbG9ja3MgPSA8JnVzYmNyZyA5PiwNCiAgICAgICAgICAgICAgICAgPCZ1c2Jjcmcg
NT4sDQogICAgICAgICAgICAgICAgIDwmdXNiY3JnIDY+Ow0KICAgICAgICBjbG9jay1uYW1lcyA9
ICJtYWluIiwgImJ1c19lYXJseSIsICJyZWYiOw0KICAgICAgICAuLi4uDQogICAgfTsNCg0KU28g
dGhlIGNoYW5nZSBpcyBjb21wYWN0IHdpdGggdHdvIGtpbmRzIG9mIGR3YzMgVVNCIGNvbnRyb2xs
ZXIuDQo=
