Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011008.outbound.protection.outlook.com [40.107.74.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39759492E53;
	Wed,  9 Sep 2026 02:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788922647; cv=fail; b=c+RnFCpujXbyxp1sxtWhA07yeTHgS4ir4EPH9IKOGmCs/wUnn4o0rgp2GzKZK+WO417rzQreezSlcuit7IOIximWTPPeFHKJwmIi0sAfeEtve7jRtlehBqH4A1KcymXgy79CuAjhHrPPShLDPBtAyVKUSoFJ6hqvQFbEtUQ0QcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788922647; c=relaxed/simple;
	bh=dEuOIieV1KKjdN98MGCGf7FCHpKNBPzp5ZwzvQDcts0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EJcjhL4Ax2stY3OeInY8IRp6KbLS1G0VkEilTZhhyBBqjJ8MC6VVkgs7XiAQExNgJ0EeoCEIR6yOODo9LnF/cTrLwMEvvUOgkkeELSgnugfHUgK6CTVRYmfDqCj2P8VbL4zV6CajsXoVPQWq8m8/p5dOJkJjoL7o2ERBujp8a+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=OFMZMcGA; arc=fail smtp.client-ip=40.107.74.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="OFMZMcGA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eZZmQATOhFusShMqbHgCOn5eNZY5rGGJmI88A72sEFREIlCd0zFR51HX84ItjrxpRSfX2hODitBHLooQg1JYXFeybuI9ypb5TTB+VshvsM4vm3bYtcLDFeB7dl/KSkoqiRThoACi0yk3CCRGXy1/NjsrBa73Thxzj49h+MtpVbrhAmyGB4epxNwrid7RVKUgxD1jMiG0C4pIBEVZpaQGujPXdT70OU3C4qbAbGs7cBsFgMUQ/77FzEupCgQOnhWSJjRv4Pl48fJNU0cg952OQ5dQTvl82HdLLV33PmG0htvipiHzNSKAYnIk3K2NZuwRDlrXpbj9/GCChgT1dZ/ljg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dEuOIieV1KKjdN98MGCGf7FCHpKNBPzp5ZwzvQDcts0=;
 b=CtjLeum8/F/s3ghIYup9kLr84bjmqGCTvtVsDS2OGiqwFRSXa5L47LdSEa7RhqsspDmXFDF0YJLX+vYVVxkZUf/sNwM0b0YPsjSnhINE0v9D1awWVorMFLVAV5MEquKRv358GW41lCNF/zZSOg0XE2E+iyu466gHf7wbsxikcOe4v6lcMV7L9MBFMNY8rcn5K7ffJNBP/991/7XRiBZRqHxxl6HrczyRMSUechci7snLZod6an9njdbkuQIyidu6SilQuGwTxuPuqvJrG4I82626o9vgtqUVNUVE9h96m2umwfkLn2rX1ZWhbNBnpUUI+m52UU8Ixo5QHEsvrNHeXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dEuOIieV1KKjdN98MGCGf7FCHpKNBPzp5ZwzvQDcts0=;
 b=OFMZMcGAHxc3QJcEtqPg4sfYcIm/s6AKpjRBGhZFGJMBQxTI5efiGdMpJPhUHW72z+Uaj1UNMQoJEgPHU7/8DbWUYhdCRDqn1oQnAgVDrHTn4LRHRaaKT4aTxT73jkKVLjM8ugVoBf8LQ49hG/qbYjgGcobhH/j613sJICJ29o4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB18490.jpnprd01.prod.outlook.com (2603:1096:604:4c1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 02:57:19 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 02:57:19 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, "biju.das.au" <biju.das.au@gmail.com>
CC: "magnus.damm" <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 13/13] arm64: dts: renesas: Add LVDS overlay for RZ/G3L
 SMARC EVK with ITE6263
Thread-Topic: [PATCH v3 13/13] arm64: dts: renesas: Add LVDS overlay for
 RZ/G3L SMARC EVK with ITE6263
Thread-Index: AQHdNYM2dENTOT1FBkiN1SiTvZIlN7bEwZeAgADdyLA=
Date: Wed, 9 Sep 2026 02:57:19 +0000
Message-ID:
 <TY3PR01MB113466B5A606D636420D7BD5586B02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
 <20260826174854.199139-14-biju.das.jz@bp.renesas.com>
 <CAMuHMdWKpWtp6dXe_1qk+GuV-n065LjHNQBGGEfsOfVz9_T1+w@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWKpWtp6dXe_1qk+GuV-n065LjHNQBGGEfsOfVz9_T1+w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB18490:EE_
x-ms-office365-filtering-correlation-id: e7939a7f-ec1b-46f7-9b2f-08df0e1e105c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|4143699003|11063799006|10067099003|56012099006|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info:
 kru5cwbhklkPJfOzw042+Bur8hzMcklvVthoisktoXGOFKcKyoDylmB2oziq2cCXwImz/9vaHGJO/B0wqWseJvd7VYwj3N3EcPdGxe+127bp5/vP/RQ15Y3tuRcdTBS38AehFOi36LXqGVKeZTjx9Kef73JhGVXHMFsR3dBfOAU9koJpIuM2XSxyzKKrzm8kUqEpCaT/Qe8kxZThr2osoHzL50llzAWJLll2XAIfxDb4WRzY0Y/DO+7R87sSMBztQwUFK9vzPc3WiHmIa4G35nViVMtwqJJ86ntDUFxxImL9GaQlx9Cn2nlfuVSd3aFasGKQ35VwBP1qBaOiRYRVxYIWi1bWKU653b+O0HKRaWzthPp7u1OnKbHMO25Sr0vonJa6gNT4WfsAFB9sdYTMIzmvxF0f/pe9YSYLQorgjMRF0CgrZi12+EtVmhJ9QBBShXxFRlsrJ6v5IsHYfQsDQAXrbh4NsgFc9ZOf2HN7FUWS2AyBL2NPejFN0ANVDRpKphqszmC7mVVuT56RAUvIWuGFNIc8UJyMV0kfNZPnxTXqDIQW3Hzwgd7lopvxjPf2+vXPWNRmX6u3i564IZw27qYzKr8Q/w9PhNffw7HUKdb67pn0Lno7s5kQzTpNj7cHDklSlZTWIzqfp0XSZSPjoNsivGv5LAFyLql95YdyGwomWkILPSaQLAKv7E23nm1gxVtY57Q9EGKHe0WUVYuNWg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(4143699003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TU10anFPUzNKSmgrYTg2bHl5bGM4dmRLV3YvajhXRExkaU5vL0xpZnNHS1Zp?=
 =?utf-8?B?WW5SclZsNDE3UllyL1QramVoOU80cG5yRmhtdHN1Q21xRkx4Ky9pVG14WFBI?=
 =?utf-8?B?OG5hbHdlc1ovMXlYamxreWNaNW5Ba3JPNEFRdGg3VitGSEF6dDRlYldXWkpG?=
 =?utf-8?B?TXFPV0FBTXZZN20xWURlR0dZcW5yU1BnVk9LWjhWVWxHVDJ5ZXkxVGh5N2c0?=
 =?utf-8?B?bnVJbEFaZ1IzYkZYcUZnZ0Q4NmdyTmVaMTVsSktrcExwY2ROSTBNcDJNNVdV?=
 =?utf-8?B?SmdHbHMwUCtERzlkbFNlai91VHlwd3haS2ZzcUF5aGtYM1gvaGwwRTVIVFY1?=
 =?utf-8?B?ejNrcjc0ZE5IMWFwbkZqdVVDRFRQRkFLOTEwUTZrMXhYalY1NG9ZazBFWVE4?=
 =?utf-8?B?U2FUZGJPSkd0K0RuSFJlcEExMnNQSWFFcmsxd3JjNm90WEdWNGlZMlBLSXdL?=
 =?utf-8?B?alhHRmxZUzV4UXdaYk04alNpRW03N1dvNTAreW5kUWZZNCtOOVYxdnY3bk53?=
 =?utf-8?B?cDdIS3p1KzBab1NTM2dVTzZ1Nkh3cmZCUnVxcHoraVJ5cnZ1UitXbjE5SW4y?=
 =?utf-8?B?TE53ZkR6WXFnaGkxVkxubzMxR3JmbzYxWlFIdmIxQVBNTTBEVnc0czFQY2NL?=
 =?utf-8?B?U0grN0JJcU42YmpJWWUxOGN6U0hFc1BxN01lODkzaGpwZkFxc1hJMlRHY2tG?=
 =?utf-8?B?WTIrZ2JkVEUzT05laE53aVhmMmdDTGkrYkNUZDlzK2tGeVppVTdKVFB4b011?=
 =?utf-8?B?ZnZNNzJNYXhtS3ROMWcxOTlRNjRJTndTNndua09FRTMyVUtaSnZCYmZWbGtP?=
 =?utf-8?B?TUpUY3JMekJQbGMyTlZOMm5XaVpTZGwzaVlTQmhtazdYNHZWTUw5UHFQVU52?=
 =?utf-8?B?Q1U5MkozZTNRRjZUSmp0cFRjT3RjazNFcGE3L0huS2I5am9ZQTlJQ0tucFpC?=
 =?utf-8?B?aXY5VXIxUDl0MmdDN2NCUjJRYkpXcU85Q1ZnRlNuc3lUcm9WN1JHdzFuMXlo?=
 =?utf-8?B?TUhYazZEWjN1dUVYSnZ6czhVZGJNa3Y1anRoaHZzQ0hjSjM0UFB1Yk1kWGsv?=
 =?utf-8?B?T1YwWVVSVkxodzA5K1UwbmxsWXRkM2puaGZqTGVJazRJVFlocXJFNTRBZGFi?=
 =?utf-8?B?UTNXVzN1eVQvem92SVVzL1VPN0NqK0NuRzFqc3E1MTR2ZDdNZWtCalVCNUR2?=
 =?utf-8?B?LzJGTTMxRnZxU2NDYVZmanFSNEYxWFYrNzVGRUNpUzB4VXZyRWhLMkxSZFhy?=
 =?utf-8?B?Nld3WHZIaytxeEJTVThkMHVvVWFVaU1DR3o1UlBSZUpCQVNkMW9KNzlUaHQ0?=
 =?utf-8?B?K2crQUxGQVpkUHFPTUdxaCtLdWRxdDc1ZXVLcXExMjdwQitvcVhCSU04dEtX?=
 =?utf-8?B?UlJFMVI2TENLeUR1aUJKUnNmMGZ5Q1RpM1N4S1Y4V3QwVEovdk9YZy9ERzcw?=
 =?utf-8?B?NWEwdkZXNU12b3F2bjlkVGN1UDdzUFJDdFp1bjNwL2RJMHJlT1loNk5jTTg1?=
 =?utf-8?B?ZXpoazV5K2d4Zm9FVG9iTndIRFVIRFBEcDhQa2ZxNVBla1FRaEFIQ21EUFJa?=
 =?utf-8?B?bXZ3SVEwSDRNcGRRRmZIaWczRWxsM3JweGVsbUhrMDdNaHFGWmkxZjlXRHk1?=
 =?utf-8?B?T21FREhkS1ZlRUhaSzVZS29jOFlHRHp0aDJMK2JWOXAzRGVLYUk3WFZkdm8z?=
 =?utf-8?B?SjB0MHNMVW5GV09tdXNvTzdyU1lrRHV6bmY0L3ZLZ1crNUdiNXZLeWZzdlZB?=
 =?utf-8?B?eHdKRzA0RGpwY2JmekFJR3Rjb3FvUnhZK2JZN0NmVlZTcjUvbVNvZnNTR292?=
 =?utf-8?B?ang5WGw5a09QUVh5UWp2TXY3b1pneVNMZVdFRVY3S0N6YW8yMU5XRVhxbmNX?=
 =?utf-8?B?NHkyUXM0WFB6NkJRTGRkbE93SUZRanozVm5odkdlOWM2YmdCbzFsMTJrUU1I?=
 =?utf-8?B?RlFsMVJCZUhyOFNNOUJoLzVqcEhLeEs5TzF5UmlITlQwODVkS1lmSytzam9n?=
 =?utf-8?B?SzZlK1BycGJtVUx3TmcrZWtMWEZHaXh5M2tIazdJOEplT09HSWZxb0I1UlEy?=
 =?utf-8?B?NHp3c2hKcG9TREcvRFl0aTRkdGwyaUJUbG1TdUxmWlhmQVVvOWNsamplUEZX?=
 =?utf-8?B?ODZ6cnI0NEdaVWZyUTIwSEZ0WlRWdFdmNFRQWjFsS3BnZjRCWENES0xTR01a?=
 =?utf-8?B?RmlVWUhYVndVY242YVZ2cWdodVpUSkFJWWI0WGJTZXA5MDczQ3NyMzFqc1p1?=
 =?utf-8?B?RFVLRzAwKzNQZGM2WG80aWl2TU1vdmdhNFRFTU83b0h0RS9vb09kWWxPSXUx?=
 =?utf-8?B?T29HbVRKem85VlpqYmFpQ1lYV0dBdHpJcDU2cFJiTmx6WGVCSC84dz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e7939a7f-ec1b-46f7-9b2f-08df0e1e105c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 02:57:19.5690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SHhYHVnPPqKATu6uI8N05mnjQ5vORIwB7XKlOoriaZNl0fcksDpI8FD1NmGq6CaLlChQKO8rgsAU2tJHwmVhqVGvkRpKbCwrEscBrv4mMFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB18490

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMTMvMTNdIGFybTY0OiBkdHM6IHJlbmVz
YXM6IEFkZCBMVkRTIG92ZXJsYXkgZm9yIFJaL0czTCBTTUFSQyBFVksgd2l0aCBJVEU2MjYzDQo+
IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gV2VkLCAyNiBBdWcgMjAyNiBhdCAxOTo0OSwgQmlqdSA8
YmlqdS5kYXMuYXVAZ21haWwuY29tPiB3cm90ZToNCj4gPiBGcm9tOiBCaWp1IERhcyA8YmlqdS5k
YXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiBBZGQgYSBEZXZpY2UgVHJlZSBvdmVybGF5
IChyOWEwOGcwNDZsNDgtc21hcmMtbHZkcy1pdGU2MjYzLmR0c28pIGZvcg0KPiA+IHRoZSBSWi9H
M0wgKFI5QTA4RzA0NikgU01BUkMgRVZLIGJvYXJkIHRvIHN1cHBvcnQgTFZEUy10by1IRE1JIG91
dHB1dA0KPiA+IHZpYSB0aGUgSVRFIDYyNjMgSERNSSB0cmFuc21pdHRlci4NCj4gPg0KPiA+IFRo
ZSBvdmVybGF5IGVuYWJsZXMgdGhlIExWRFMgY29udHJvbGxlciBhbmQgdGhlIGRpc3BsYXkgdW5p
dA0KPiA+IChEVS9MQ0RDKSwgYW5kIGNvbmZpZ3VyZXMgdGhlIElURTYyNjMgb24gSTJDMi4NCj4g
Pg0KPiA+IFVwZGF0ZSB0aGUgTWFrZWZpbGUgdG8gYnVpbGQgdGhlIG92ZXJsYXkgYXMgYm90aCBh
IHN0YW5kYWxvbmUgLmR0Ym8NCj4gPiBhbmQgYSBjb21wb3NpdGUgLmR0YiAoYmFzZSBEVEIgKyBv
dmVybGF5KS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBi
cC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0t
IC9kZXYvbnVsbA0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwOGcw
NDZsNDgtc21hcmMtbHZkcy1pdGU2MjYzLmR0c28NCj4gPiBAQCAtMCwwICsxLDEwNCBAQA0KPiA+
ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiANCj4gQW55IGNoYW5jZSB0
aGlzIGNhbiBiZSAiKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpIiwgbGlrZSBhbGwgYWxy
ZWFkeSBleGlzdGluZw0KPiBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDhnMDQ2KiBm
aWxlcz8NCg0KT29vcHMsIHdpbGwgZml4IHRoaXMuDQoNCj4gDQo+ID4gKy8qDQo+ID4gKyAqIERl
dmljZSBUcmVlIG92ZXJsYXkgZm9yIHRoZSBSWi9HM0wgU01BUkMgRVZLIHdpdGggSVRFNjI2Mw0K
PiA+ICsgKiBjb25uZWN0ZWQgdG8gTFZEUyBhbmQgTENEQyBlbmFibGVkLg0KPiA+ICsgKg0KPiA+
ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjYgUmVuZXNhcyBFbGVjdHJvbmljcyBDb3JwLg0KPiA+ICsg
Ki8NCj4gPiArDQo+ID4gKy9kdHMtdjEvOw0KPiA+ICsvcGx1Z2luLzsNCj4gPiArDQo+ID4gKyNp
bmNsdWRlIDxkdC1iaW5kaW5ncy9ncGlvL2dwaW8uaD4NCj4gPiArI2luY2x1ZGUgPGR0LWJpbmRp
bmdzL2ludGVycnVwdC1jb250cm9sbGVyL2FybS1naWMuaD4NCj4gPiArI2luY2x1ZGUgPGR0LWJp
bmRpbmdzL3BpbmN0cmwvcmVuZXNhcyxyOWEwOGcwNDYtcGluY3RybC5oPg0KPiA+ICsNCj4gPiAr
JnsvfSB7DQo+ID4gKyAgICAgICBsdmRzLXRvLWhkbWktb3V0IHsNCj4gPiArICAgICAgICAgICAg
ICAgY29tcGF0aWJsZSA9ICJoZG1pLWNvbm5lY3RvciI7DQo+ID4gKyAgICAgICAgICAgICAgIHR5
cGUgPSAiZCI7DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICBwb3J0IHsNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICBsdmRzX3RvX2hkbWlfY29uX291dDogZW5kcG9pbnQgew0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZpdDYyNjNf
b3V0PjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICB9Ow0KPiA+ICsgICAgICAgICAgICAg
ICB9Ow0KPiANCj4gTm8gRERDPw0KDQpUaGUgZHJpdmVyIHVzZXMgcGFyZW50IGkyYyBidXMgYXMg
ZGRjLWkyYy1idXMuIFRoYXQgaXMgdGhlIHJlYXNvbiBub3QgYWRkZWQuDQoNCg0KPiANCj4gPiAr
ICAgICAgIH07DQo+ID4gKw0KPiA+ICsgICAgICAgcmVnXzF2ODogcmVndWxhdG9yLTF2OCB7DQo+
ID4gKyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicmVndWxhdG9yLWZpeGVkIjsNCj4gPiAr
ICAgICAgICAgICAgICAgcmVndWxhdG9yLW5hbWUgPSAiZml4ZWQtMS44ViI7DQo+ID4gKyAgICAg
ICAgICAgICAgIHJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDE4MDAwMDA+Ow0KPiA+ICsgICAg
ICAgICAgICAgICByZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDwxODAwMDAwPjsNCj4gPiArICAg
ICAgICAgICAgICAgcmVndWxhdG9yLWJvb3Qtb247DQo+ID4gKyAgICAgICAgICAgICAgIHJlZ3Vs
YXRvci1hbHdheXMtb247DQo+ID4gKyAgICAgICB9Ow0KPiA+ICsNCj4gPiArICAgICAgIHJlZ18z
djM6IHJlZ3VsYXRvci0zdjMgew0KPiA+ICsgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInJl
Z3VsYXRvci1maXhlZCI7DQo+ID4gKyAgICAgICAgICAgICAgIHJlZ3VsYXRvci1uYW1lID0gImZp
eGVkLTMuM1YiOw0KPiA+ICsgICAgICAgICAgICAgICByZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9
IDwzMzAwMDAwPjsNCj4gPiArICAgICAgICAgICAgICAgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQg
PSA8MzMwMDAwMD47DQo+ID4gKyAgICAgICAgICAgICAgIHJlZ3VsYXRvci1ib290LW9uOw0KPiA+
ICsgICAgICAgICAgICAgICByZWd1bGF0b3ItYWx3YXlzLW9uOw0KPiA+ICsgICAgICAgfTsNCj4g
DQo+IEFueSBzcGVjaWZpYyByZWFzb24geW91IGNhbm5vdCBqdXN0IHJldXNlIHRoZSBleGlzdGlu
ZyAmcmVnXzFwOHYgYW5kICZyZWdfM3Azdj8NCg0KT2ssIHdpbGwgZHJvcCB0aGVzZS4NCg0KPiAN
Cj4gPiArfTsNCj4gPiArDQo+ID4gKyZkdSB7DQo+ID4gKyAgICAgICBzdGF0dXMgPSAib2theSI7
DQo+ID4gK307DQo+ID4gKw0KPiA+ICsmaTJjMiB7DQo+ID4gKyAgICAgICAjYWRkcmVzcy1jZWxs
cyA9IDwxPjsNCj4gPiArICAgICAgICNzaXplLWNlbGxzID0gPDA+Ow0KPiA+ICsNCj4gPiArICAg
ICAgIGl0NjI2MzogaXQ2MjYzQDRjIHsNCj4gDQo+IGhkbWlANGMNCk9rLg0KDQo+IA0KPiA+ICsg
ICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIml0ZSxpdDYyNjMiOw0KPiA+ICsgICAgICAgICAg
ICAgICByZWcgPSA8MHg0Yz47DQo+ID4gKyAgICAgICAgICAgICAgIGRhdGEtbWFwcGluZyA9ICJ2
ZXNhLTI0IjsNCj4gPiArICAgICAgICAgICAgICAgaXZkZC1zdXBwbHkgPSA8JnJlZ18xdjg+Ow0K
PiA+ICsgICAgICAgICAgICAgICBvdmRkLXN1cHBseSA9IDwmcmVnXzN2Mz47DQo+ID4gKyAgICAg
ICAgICAgICAgIHR4YXZjYzE4LXN1cHBseSA9IDwmcmVnXzF2OD47DQo+ID4gKyAgICAgICAgICAg
ICAgIHR4YXZjYzMzLXN1cHBseSA9IDwmcmVnXzN2Mz47DQo+ID4gKyAgICAgICAgICAgICAgIHB2
Y2MxLXN1cHBseSA9IDwmcmVnXzF2OD47DQo+ID4gKyAgICAgICAgICAgICAgIHB2Y2MyLXN1cHBs
eSA9IDwmcmVnXzF2OD47DQo+ID4gKyAgICAgICAgICAgICAgIGF2Y2Mtc3VwcGx5ID0gPCZyZWdf
M3YzPjsNCj4gPiArICAgICAgICAgICAgICAgYW52ZGQtc3VwcGx5ID0gPCZyZWdfMXY4PjsNCj4g
PiArICAgICAgICAgICAgICAgYXB2ZGQtc3VwcGx5ID0gPCZyZWdfMXY4PjsNCj4gPiArDQo+ID4g
KyAgICAgICAgICAgICAgIHBvcnRzIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAjYWRk
cmVzcy1jZWxscyA9IDwxPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxs
cyA9IDwwPjsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcG9ydEAwIHsNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwwPjsNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGJyaWRnZV9pbjogZW5kcG9pbnQgew0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8Jmx2
ZHNfb3V0PjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH07DQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgfTsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgcG9ydEAyIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwy
PjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGl0NjI2M19vdXQ6IGVuZHBv
aW50IHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVtb3Rl
LWVuZHBvaW50ID0gPCZsdmRzX3RvX2hkbWlfY29uX291dD47DQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB9Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIH07DQo+ID4g
KyAgICAgICAgICAgICAgIH07DQo+IA0KPiBObyBhdWRpbz8NCg0KQmluZGluZyBkZXNjcmliZXMg
YXVkaW8gcG9ydCwgYnV0IElURTYyNjMgZHJpdmVyIHN1cHBvcnRzIG9ubHkgdmlkZW8gbW9kZSBj
b21wYXJlZCB0bw0KYm90aCBBdWRpby9WaWRlbyBzdXBwb3J0IG9uIEFEVjc1MzUgZHJpdmVyLg0K
DQpJIHdpbGwgYWRkIGF1ZGlvIGVudHJpZXMgb25jZSB3ZSBoYXZlIGRyaXZlciBzdXBwb3J0Lg0K
SG9wZSBpdCBpcyBvayBmb3IgeW91Pw0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gDQo+ID4gKyAgICAg
ICB9Ow0KPiA+ICt9Ow0KPiANCj4gVGhlIHJlc3QgTEdUTS4NCj4gDQo+IEdye29ldGplLGVldGlu
Z31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdl
ZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0g
Z2VlcnRAbGludXgtbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0
aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQgd2hlbiBJJ20g
dGFsa2luZyB0bw0KPiBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21l
dGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExp
bnVzIFRvcnZhbGRzDQo=
