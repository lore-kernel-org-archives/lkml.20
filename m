Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2092.outbound.protection.partner.outlook.cn [139.219.17.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808D146E01D;
	Fri, 25 Sep 2026 08:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790326097; cv=fail; b=AztcXhgX/DuMT/4KgJQmrlGWXpYxMU6oAV/vmSILT+nZKveVlAhy8GY3HCU/VUUtJO863g98J+mnWX1anBMfGXUedNyQamoMnbuz7iBmeUpq3Em0RQSqvm5EQ+fHnWaj72oz+iforMobCFRPxVtKES9vAEgS6knkFioA0Rq8qJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790326097; c=relaxed/simple;
	bh=Cf/PTFTlOdkUKnHcZAhfpkbgu8UuAaf0pPEDI1zKRw0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CO9fIvbhK2+3D6DAsSDwbwqa98f8h21B+NLZzD7TyjUV96orbaNDICP83LR7t2yN3h1ObkMqFYp4iAaWZJRAaLaFifRx1fS8a9diwF9+l1kiUYgoHcpU1DdWhWfBaEtTz7kgMgq6u2oXUkCu0H8wZRkyTB7Xg0QF/In4zhRs5hY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=egKH9sWd3NMl4e/8MHSGQ0zVqFgsg4g8yideeVJ5ABgQh+tqXfnku8MazPR3vy5PkCtcPQg5Ls8eaWIMy0hjDTK6nFsTOvxK7nn7kR5hQF1FOzX9abh0QMnGD2WCscq0NcHriI8TYrGGoHLai8izUob/3lG3RM1o1LzTpV9QvUk9MGpOnKpeittaONpQZf1RQ0Tyouqx4r6lQcy9Odhq2gKtN8LUG16cG3vZN2v+3zNGwLJhu52J6qUjWm/6OXyr1P7ENq2Ul5XJ0em2Igkkdx/0C+HsuYLN2g4/FEnyzFX1kmDv75cS7IiG+7T6k3ZcNxRK09u6mzihY/5dDyCsIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cf/PTFTlOdkUKnHcZAhfpkbgu8UuAaf0pPEDI1zKRw0=;
 b=WEUoCs3QJ66xxHZElgkggLxketFlns7nkA+ugAjp8fLNhOgnTsUQuNZ2BNRBBaFe75qmO/YdYE9cOzMjlzGxUHnpEWLndjqn3VqOU/Y4/JwT9kI7+pdTo0RslcksU2q8MdbPJ0XzmMrANIGF1nUsMAQ6RHzMRI1KVwhSDkDETrJRX+v3jrwpLrlWFTBb1w8zoMpsrBtorCCbBRybmI4nDRT6pF5KyHbacv/1PFyTW8ev1CBTKe8wWr8unUxjdpgSFLyYWRdNmXxbQKhQDhNEnMkQZR041RWoW+FDiduB7edaO3zCAG1eI3GE2T5Dcq/t2MWh9aaq3kB4gKZPfbyJDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14) by SH0PR01MB0890.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:7::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.15; Fri, 25 Sep
 2026 07:14:15 +0000
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::435e:52b5:c524:459c]) by
 SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn ([fe80::435e:52b5:c524:459c%3])
 with mapi id 15.21.0451.014; Fri, 25 Sep 2026 07:14:15 +0000
From: Joshua Yeong <joshua.yeong@starfivetech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "rahul@summations.net"
	<rahul@summations.net>, "anup@brainfault.org" <anup@brainfault.org>,
	"lftan.linux@gmail.com" <lftan.linux@gmail.com>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "pjw@kernel.org"
	<pjw@kernel.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "alex@ghiti.fr"
	<alex@ghiti.fr>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 1/3] dt-bindings: regulator: Add RPMI voltage service
 bindings
Thread-Topic: [PATCH v2 1/3] dt-bindings: regulator: Add RPMI voltage service
 bindings
Thread-Index: AQHdSylV/+AHvSJ/TkisWFCqzwhgHrbcn7gAgAGZTwCAAFYf0IAAQt4AgAAPfqA=
Date: Fri, 25 Sep 2026 07:14:14 +0000
Message-ID:
 <SH0PR01MB0841C933DE1E00C4012BDF53F9802@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
References: <20260923070014.1340761-1-joshua.yeong@starfivetech.com>
 <20260923070014.1340761-2-joshua.yeong@starfivetech.com>
 <9c0ae39b-d214-40f5-b010-cdea14ccc774@kernel.org>
 <c2c57bf0-e610-4353-93a4-84edfd08e767@sirena.org.uk>
 <SH0PR01MB08411AA7F403A71D2D7470A6F9802@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
 <0db3ed29-8bb8-4dc3-a4cb-cc5b9bf2e893@kernel.org>
In-Reply-To: <0db3ed29-8bb8-4dc3-a4cb-cc5b9bf2e893@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SH0PR01MB0841:EE_|SH0PR01MB0890:EE_
x-ms-office365-filtering-correlation-id: d1bda444-99d4-4e9e-b43c-08df1ad49b3d
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|4143699003|56012099006|10067099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 vYsVSQSDo8v6rqb0VWMlI29Jj06H1aazMsTkypisoQu4g1T40zVkFWaBULprTTeqUQBdtX2OXu9ENSY7wFTZPdoCvZ+Zsh+MHfgk8jEvJQ+MUZ9dfKh5XNLa34g/kMd7bE3pu9HBiNL7hJFk5xyD0Q/wo0DYjXrPv5J3VZuqfR2xBjF0xm1ShICmsW+nKPymTEidtQYiShrVWIi8yjfrbOgnXME1Q0YUO7lqrrpXp7liC6UyDxl9p3MOGgWXbcrRHsQY5cQXie7BoAbNWyu+goPzm0HBqcBNzXuK34pOd18nWeTQCitoV79ZPpGFkt9OoDWb+DBPNKW7GtjJI4eJepJKgVB9wE3dgzBAtSVfmRWHno1la5nXnNMr0wUGlGid6qfaPlKXuGf30NRAazmRm6ym3NrCxT455U14/43yzWb8PJ0tk4FZVXHx1lUTb9qN3g4AZfaXcyAsu1EDpBRCWmFwljM7EUbTbIPsYJSMTg2VrHVXdcFelJsvMWXCBjHZ65hp80ZYJsSBDLop9vRZbzdAQuOky6ztKxrK9fY5bvXYPQlEDt/qJSHOJCKvsqC1
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Uk1rNW1pMWxESnRIN0Y4OWFtVzVQU0k2TlVDdGdpcFUzNDdLRDJFNEc3OWc5?=
 =?utf-8?B?YThiSUJBNkpUbVpEeHBFaEZHZXlRMW9hcUhGWW1TbTBEY3l6QW5lanAxRVMz?=
 =?utf-8?B?VnpnYUg4TTBmaXM0NGFZS0dydnNIcWhtY1hiU2ZSeDgrRVJwMHZEajZXWEFQ?=
 =?utf-8?B?d2RPVkZGQ3Z1bnVOajlER3k0R1VpNjNlYW5iMGZaSlo3c0xOVGxEeG5ab2dL?=
 =?utf-8?B?MlZMWXphSjMzVktFRzd2Nmp2SzFvdUFVemlua0dhMlZicEtvOVVkd2hLekZK?=
 =?utf-8?B?cklqTUdNQzdUUUtxWU1aZExNVW1KdTBFQXo2ZWZGYjhaR0cycVVkT1lhMlp1?=
 =?utf-8?B?VlBZUmdodjF4ZVRySEUzNXFUcXNGdTRKejFiTHNCM3lKbTZiOWhrWHdwWE9p?=
 =?utf-8?B?Tk1FM3RIYW1kNDV6cFFxbE9oNGRHdGRNUWFyQjQvTkxLS3N2a2dCNWovQ3RL?=
 =?utf-8?B?dGxPNElhZHFqN1ZYSnNOUVkzTzZDU0l0ZGx5WEk3dVJZcjVzTVVURURYaWxi?=
 =?utf-8?B?eVdvcGNyZkwzandyb2QvQUd1ay9ZWWY4RytOT0twSjQ1alFVWEo4dG9FSXRS?=
 =?utf-8?B?NiticTRCSDNheFE1d0ZGN014aUtBME8vWVlCcjc3Q1l4QlBOU3ZBamIzTWdV?=
 =?utf-8?B?YUJjN0FDTTJySHRSMGMvZjJJNzVIN2pPd094SkNhNHFreXdnMzVaMzRvU2hT?=
 =?utf-8?B?TU90S2Vabk40VXdWYWtTc1lqRG5MN01yeCtTbXV0RlgxZ21wRkNyV2lOam1Z?=
 =?utf-8?B?OCsrTDkvN1ZTUWN4TytaUHVKUGtob1VkMS95eC85K3ZaRU9hUlhSeGVmdzhL?=
 =?utf-8?B?SzJmK2FtRjJVL0s5YWFldlRIbUE4MHZOOW0yVUV0SS9FOEpUNnRKY1JzZkQ1?=
 =?utf-8?B?MVZYNzNOQUVMVUp5alI4b0VLNCt2cEZOd0p6WmMxVHVvRGVpYis1a2lGemtN?=
 =?utf-8?B?TUtibFZUbW9uZ1g5eTFHZ2NUc1NqTmFvRnI3M2hFWG5nSFNNRFcySHhvcG1l?=
 =?utf-8?B?WXNYcEhrbXBLZXVFNDFUNWNlQ3l0Z0lkWlUzMXNkZ09NcXNBRDV2TXZQNEZs?=
 =?utf-8?B?S1Y5ZFRua21Lb21OWW1VWC9qclNmMGNtZFlFcGlJWDFmbmJsYkFSUHg3aWNa?=
 =?utf-8?B?VWYrNVp6eURsVVpaNVlseUE3SXNibDkwdCt6TTBKbm1SdmdEMFBKbHlJTnBD?=
 =?utf-8?B?OVVPeXhLYkZPMEkxbWdtWDBTa20rbDNhbmh3T2l6MDNMeVpUWlIyRWZxOGc1?=
 =?utf-8?B?WDVkZCsyTlFXaklQdklRZ3JjZkNhbW1zZFdydUVaWXF6a3l0OUJiK2ZIdE4y?=
 =?utf-8?B?SFR0VnVET3p5MUNQa1pqQktnYllUQ3M5d0Rsd2RxNEljclQrYkgxTE5YQlVQ?=
 =?utf-8?B?dmdDNEhxeXZ6Wkg0Y2xSd0ZFc2JWLzRPYlRNbE1icjh1eU5oaGtzVXFESDVk?=
 =?utf-8?B?VUtySytZYkZmWmFCd2F2QVNQNkU1QnV5VzhBRFA4NE5MeE9lMGlrdkgzaisx?=
 =?utf-8?B?RGNhUXR3RnRFNG1TMUhtT1M4bEZaR0I2aTZJdDdPT0UwT1BKSW9VR2hsWGQy?=
 =?utf-8?B?ZlpIRmtQek1DdzFzT2dpNE5UYkNEUTJOMjZsTkozQkhLOWNIcDAySi9TMS9C?=
 =?utf-8?B?RlI4K0ZvSGtubEtJMFdpdDlsUjdGcHFlMCtUem82RU5TcHRzT0J1TWc3b01p?=
 =?utf-8?B?WDluemZIelRUYTQvWGFOZ2R3WEIyaGExN2VlZ0Z4aFdnNjNpNjQzaHR5WDBE?=
 =?utf-8?B?MUR1MHlVR25CQmkrUmViQldiQmhKc0VTUGV0NGFNOW9MaVJTcFBjbWhvL0JP?=
 =?utf-8?B?SWVLN3d1U0ZXZ212aE1MNmxjdm5OcmhnYXRiKzdRa203MGdtMjFIbkVRbmw5?=
 =?utf-8?B?SkpWTmNRZVBRcUNhcGFReEdGYWJVV0dKUVZiRk9MVjdRMWpxbnpudWFvQ0Vk?=
 =?utf-8?B?Q096eSt5bWVIUHQ1dit0U2hsTzBFK2ZCakRRMy9seGQzR0pGRWRRUENWVkVn?=
 =?utf-8?B?THp1WEw1MmFGK0NYRlRnZ2N4Zk5nUGMyZjhLWCtFbUN2M29wdEtsNjkxVGNn?=
 =?utf-8?B?RW9GUUtabHltdW0zb3NLd2ZxVkw0cHBBb0pQSUx5dVlKQUZTcHZCWk15Y2Yw?=
 =?utf-8?B?TG1UYk1YZVh0bVhIRklBQ0RMN2JjZ0hyRGIrTGhVSW90M3QxNlB5VFkvRVJq?=
 =?utf-8?B?MGxpMVFQUXdZRHJIL3pZNWhUWG1NWkFRWkZndFVyT3lTd3BTdVdYd3daRnM1?=
 =?utf-8?B?ZHdVY0tYUkdlWHV1SmhsdU83VG5KQyt4M3EyU0ViMHNzK3Y0aCtWYTlXUm5Y?=
 =?utf-8?B?N0RtVGdrR1N0S1JIeXBFaSs5bzJqVTFrc2JLVmtjcWo5VjBCYStabU9uR3VR?=
 =?utf-8?Q?qfIw/Sg30kwZIeb4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: d1bda444-99d4-4e9e-b43c-08df1ad49b3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2026 07:14:14.9047
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lGNasuGTdpQbkj0xonOJ+OdvZUKEyuUXaJhVI+CxsAr23HQ5W0BVdFM33yBlKS5PMyu7ne65UVLTI2YauWtkDJ+bzkGE7MSvGFLVsVnsbVM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SH0PR01MB0890

T24gRnJpLCBTZXAgMjUsIDIwMjYgYXQgMDg6MDc6NDBBTSArMDIwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPiB3cm90ZToNCj4gT24gMjUvMDkvMjAyNiAwNDoyMSwgSm9z
aHVhIFllb25nIHdyb3RlOg0KPiA+IE9uIFRodSwgU2VwIDI0LCAyMDI2IGF0IDEwOjAwOjA2UE0g
KzAxMDAsIE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4gd3JvdGU6DQo+ID4+IE9uIFdl
ZCwgU2VwIDIzLCAyMDI2IGF0IDEwOjM1OjA4UE0gKzAyMDAsIEtyenlzenRvZiBLb3psb3dza2kg
d3JvdGU6DQo+ID4+PiBPbiAyMy8wOS8yMDI2IDA5OjAwLCBKb3NodWEgWWVvbmcgd3JvdGU6DQo+
ID4+DQo+ID4+Pj4gKyAgICB2b2x0YWdlLXNlcnZpY2Ugew0KPiA+Pg0KPiA+Pj4gVGhlcmUgaXMg
bm8gc3VjaCBzZXJ2aWNlLiBEb24ndCBpbnZlbnQgbmFtZXMuIFNlZSBEVCBzcGVjLg0KPiA+Pg0K
PiA+PiBMb29rcyBsaWtlIGl0IGNvbWVzIGZyb20gdGhlIFJQTUkgc3BlYzoNCj4gPj4NCj4gPj4g
ICAgDQo+ID4+IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1ub24taXNhL3Jpc2N2LXJwbWkvYmxv
Yi9tYWluL3NyYy9zcnZncnAtdm9sdGENCj4gPj4gZ2UuYWRvYw0KPiA+Pg0KPiA+Pj4+ICsgICIj
dm9sdGFnZS1kb21haW4tY2VsbHMiIG9uIHRoZSBwcm92aWRlciwgYSBjb25zdW1lciBsaXN0cyAg
DQo+ID4+Pj4gKyAidm9sdGFnZS1kb21haW5zID0gPCZwcm92aWRlciBET01BSU5fSUQ+IiBhbmQg
bmFtZXMgZWFjaCBlbnRyeSANCj4gPj4+PiArIGluICAidm9sdGFnZS1kb21haW4tbmFtZXMiLCB0
aGUgd2F5IGl0IG5hbWVzIGEgdm9sdGFnZSBwb3dlciANCj4gPj4+PiArIGRvbWFpbi4gQm90aCAg
cHJvcGVydGllcyBiZWxvbmcgdG8gdGhlIGNvbnN1bWVyLCBzbyBhIGNvbnN1bWVyIA0KPiA+Pj4+
ICsgYmluZGluZyBkZXNjcmliZXMgdGhlbQ0KPiA+Pj4+ICsgIGl0c2VsZjoNCj4gPj4NCj4gPj4+
IEFuZCB3aGVyZSBkbyB5b3UgZXhwbGFpbiB3aGF0IGlzIHRoYXQgInZvbHRhZ2UgZG9tYWluIiBh
bmQgd2h5IGl0IGlzIA0KPiA+Pj4gY29tcGxldGVseSBkaWZmZXJlbnQgdGhhbiBldmVyeXRoaW5n
IGVsc2Ugd2UgaGF2ZT8NCj4gPj4NCj4gPj4+IE5vLCBkb24ndCBjb21lIHVwIHdpdGggeW91ciBv
d24gbmFtaW5nIGZvciBzdGFuZGFyZCB0aGluZ3MuDQo+ID4+DQo+ID4+IFRoYXQgYWxzbyBsb29r
cyBsaWtlIHdoYXQgdGhlIHNwZWMgc2F5cyAoc29tZSBvZiB0aGUgZGVzY3JpcHRpb24gaXMgDQo+
ID4+IGNvcGllZCBwcmV0dHkgY2xvc2VseSBmcm9tIHRoZSBzcGVjKS4NCj4gPiANCj4gPiBUaGUg
UlBNSSBzcGVjaWZpY2F0aW9uIHVzZXMgdGhlIHdvcmQgdm9sdGFnZSBpbnN0ZWFkIG9mICdyZWd1
bGF0b3InIGluIHRoZSANCj4gPiBrZXJuZWwgaGVyZS4gV2UgbmVlZCBzb21ldGhpbmcgbGlrZSBw
b3dlci1kb21haW4tY2VsbHMsDQo+ID4gcGVyZm9ybWFuY2UtZG9tYWluLWNlbGxzIG9yIGNsb2Nr
LWNlbGxzIHRoYXQgaXNuJ3Qgc3VwcG9ydGVkIGJ5IHJlZ3VsYXRvciANCj4gPiBmcmFtZXdvcmsu
IFdoaWxlIEkgaGF2ZSBubyBwcmlvciBoaXN0b3J5IG9uIHRoZSByZWd1bGF0b3IgZnJhbWV3b3Jr
IGJ1dCANCj4gPiB0aGUgUlBNSSB2b2x0YWdlIHNlcnZpY2UgZHJpdmVycyB0cnlpbmcgdG8gdXBz
dHJlYW0gaGVyZSBuZWVkIHNvbWUgDQo+ID4gbWVjaGFuaXNtIHRvIG1hcCBqdXN0IHRoZSBkb21h
aW4gaWQgdG8gdGhlIFJQTUkgc2VydmljZXMuDQo+ID4gDQo+ID4gVGhlIGRyaXZlciB3b3VsZCBz
dGlsbCB3b3JrIHdpdGggdGhlIGV4aXN0aW5nIHZvbHRhZ2UgZGV2aWNlIHRyZWUgc3RydWN0dXJl
Lg0KPiA+IEkgdW5kZXJzdGFuZCBvdGhlciBkcml2ZXJzIG1heSBub3QgdXNlIHZvbHRhZ2UtZG9t
YWluIGxpa2UgUlBNSQ0KPiA+IHZvbHRhZ2Ugc2VydmljZSwgc28gSSBvbmx5IGFkZCB0aGUgc3Vw
cG9ydCBmb3IgdGhpcyBvbiB0aGUgUlBNSQ0KPiA+IHZvbHRhZ2UgZHJpdmVyIGFuZCBub3Qgb24g
dGhlIGZyYW1ld29yayBzaWRlLg0KPg0KPg0KPiBBcyBkaXNjdXNzZWQgb24gSVJDICNkZXZpY2V0
cmVlLCB0aGF0J3MgZWl0aGVyIHBvd2VyLWRvbWFpbnMgb3INCj4gcmVndWxhdG9yIHN1cHBsaWVz
LiBJZiB5b3UgbmVlZCBhbnl0aGluZyBlbHNlLCB5b3UgbmVlZCB0byBleHBsYWluLiBOb3Qgd2Uu
DQoNClRoaXMgaXMgdGhlIGhvdyB0aGUgZXhpc3RpbmcgcmVndWxhdG9yIHdvdWxkIGxvb2sgbGlr
ZSB0aGlzLg0KDQp1c2VyLWFwcC1hIHsNCgljb21wYXRpYmxlID0gIi4uLiI7DQoJdmRkLXN1cHBs
eSA9IDwmdm9sdDE+Ow0KfTsNCg0KcnBtaS12b2x0YWdlIHsNCgltYm94ZXMgPSA8MHgwYyAweDEw
MDQgMHgwMD47DQoJY29tcGF0aWJsZSA9ICJyaXNjdixycG1pLXZvbHRhZ2UiOw0KDQoJcmVndWxh
dG9ycyB7DQoJCSNzaXplLWNlbGxzID0gPDB4MDA+Ow0KCQkjYWRkcmVzcy1jZWxscyA9IDwweDAx
PjsNCg0KCQl2b2x0MTogcmVndWxhdG9yQDEgew0KCQkJcmVnID0gPDB4MDE+Ow0KCQkJLi4uDQoJ
CX07DQoJCS4uLg0KCX07DQp9Ow0KDQpXaGlsZSB0aGUgYWJvdmUgbWV0aG9kIHdvcmtzIGJ1dCBJ
J20gdHJ5aW5nIHRvIGdldCB0aGUgZW50aXJlIHNpbXBsaWZ5IHRvIHRoZSBmb2xsb3dpbmcuDQoN
CnVzZXItYXBwLWIgew0KCWNvbXBhdGlibGUgPSAiLi4uIjsNCgl2b2x0YWdlLWRvbWFpbnMgPSA8
JnJwbWktdm9sdGFnZSAweDAxPjsNCn07DQoNCnJwbWktdm9sdGFnZTogcnBtaS12b2x0YWdlIHsN
CgltYm94ZXMgPSA8MHgwYyAweDEwMDQgMHgwMD47DQoJI3ZvbHRhZ2UtZG9tYWluLWNlbGxzID0g
PDB4MDE+Ow0KCWNvbXBhdGlibGUgPSAicmlzY3YscnBtaS12b2x0YWdlIjsNCn07DQoNClRoZSB1
c2VyIGRvZXMgbm90IG5lZWQgdG8gbWFwIGFueSBvdGhlciBpbmZvcm1hdGlvbiB1bmRlciAvcnBt
aS12b2x0YWdlL3JlZ3VsYXRvcnMvdm9sdDEgLCBzaW5jZSB0aGUgdmFsdWUgYXJlIGJlaW5nIGRl
Y2lkZWQgYnkgdGhlIHBsYXRmb3JtIG1pY3JvY29udHJvbGxlci4NClRoZSBmaWVsZHMgbGlrZSAn
bmFtZXMnLCAnIHJlZ3VsYXRvci1tYXgtbWljcm92b2x0JyBhbmQgJyByZWd1bGF0b3ItbWluLW1p
Y3Jvdm9sdCcgYXJlIGJlaW5nIGRpc2NvdmVyZWQgZHVyaW5nIHJ1bnRpbWUgaW5zdGVhZC4NCg0K
DQo+DQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo=
