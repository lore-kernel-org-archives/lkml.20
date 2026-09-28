Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022115.outbound.protection.outlook.com [52.101.126.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B92364AA4;
	Mon, 28 Sep 2026 05:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790573398; cv=fail; b=rICFpvFDktt1hZSwgtLb2j3KbclapO89bFrfMdzZT3Re6W6xU0d2SNAuQpF1zzbPszVTs8fDJZALZ/M5FU+m/djxQEoY3s25rG5+mO2wfRYN37zfg9d+BHPhs4QTjotd5E07rlzSSC3+y9RUK7cVwU399Q4lop9DdSpccTq0aS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790573398; c=relaxed/simple;
	bh=whM+Fpqx9trPTiePvrGSGRk2aZMShquUQgnU5rxniVs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Y0zA5L7HkZf8Y0xCGs1fgKd8wRlvXW9zNC5/cb9TzUODEhlKkd+fRZ4+oQz6mXJHR7a8r38kSomFeVSH+3cB9oMcFSZut17AZWoB7Hg9vMsXRZ6h6lBlAo4A37ifKVXIZd8m2z+hGUVoucDiMndYnLIpsU9lnVy5NMXUK5vH/kw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V/kAEXiJ3PLBF5LrtUEmPy9SFUMBdcs2eTG/cG8I167CPM23qmJcWYU1d1VgmmG4f1u+Iq0UsL6XTW3kioypkXBcVAqwwS8e1fRKbWo8VjlzcKxvNs9wtfc57wS9K4tBG0wNf25uVECdsq8YsG/y5EO3oA8Ro/0YK0/+NWo+JrBboR5semoLl0BBWAhg1q/O6UDaIrsgMvCNU106JisMqfzIsksCw5yyf0usImrRRbEr7wqtvgv13r9n/Kvh+BzSn6y6A7iDhbsbao8evYfTMKbd6nSfaFi51PANtjur5HItRA33zTCZV0hA9lFqvqoJTPUSPJH2dmyMGF/sc18nAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=whM+Fpqx9trPTiePvrGSGRk2aZMShquUQgnU5rxniVs=;
 b=S0EcLH2L/2OISsdYbVrvgISX4/AJONYSSBFzavwpy3qj9CQ6Ygy2bJZSf3w4gQxMh3rv/HuLkpTsJWjrJr6cfS5SUMDoRpUmfLGrvaaikHEy2mLnwO113dMDZ0/j+Nz/QQsBSyQ4TK50S320DKLqtNbcGBA7cf09B+2RMNEwDllkoP0nqWFFSjlm6RthZcRceqopG3HEOKQBro4TPyfGx49tXnZAzAFWVHLig06uEtgyccyTmdfGkTDZZvlQsqY/xzRreo6ZN+bByn+BFcnH3EtvSw4F/Hk7fsANbrNgWcMFx2JeC0/tsj3GYr8X+qRaKl9YuzPjHNRHk5yR61StlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from KUYPR06MB8673.apcprd06.prod.outlook.com (2603:1096:d10:8b::5)
 by SE3PR06MB8455.apcprd06.prod.outlook.com (2603:1096:101:329::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 05:29:51 +0000
Received: from KUYPR06MB8673.apcprd06.prod.outlook.com
 ([fe80::2b5f:4b04:8fc6:747c]) by KUYPR06MB8673.apcprd06.prod.outlook.com
 ([fe80::2b5f:4b04:8fc6:747c%3]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 05:29:51 +0000
From: =?utf-8?B?Sm9ha2ltICBaaGFuZyAo5byg5by65bqGKQ==?=
	<joakim.zhang@cixtech.com>
To: Rob Herring <robh@kernel.org>
CC: Mark Brown <broonie@kernel.org>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "perex@perex.cz"
	<perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 1/4] ASoC: dt-bindings: Add Cadence I2S-SC controller
Thread-Topic: [PATCH 1/4] ASoC: dt-bindings: Add Cadence I2S-SC controller
Thread-Index: AQHdSoSVrVbrgfH17kmJH9qI6OmYMbbapu0AgAKx8RCAAeU7AIAEAV4g
Date: Mon, 28 Sep 2026 05:29:51 +0000
Message-ID:
 <KUYPR06MB8673F78D6984AC1934C3F190828D2@KUYPR06MB8673.apcprd06.prod.outlook.com>
References: <20260922112134.4167305-1-joakim.zhang@cixtech.com>
 <20260922112134.4167305-2-joakim.zhang@cixtech.com>
 <arKPdM4bYsAeAKtr@sirena.co.uk>
 <OSNPR06MB86866A7DE38DC5AD8197BF6E82812@OSNPR06MB8686.apcprd06.prod.outlook.com>
 <20260925122954.GE677989-robh@kernel.org>
In-Reply-To: <20260925122954.GE677989-robh@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KUYPR06MB8673:EE_|SE3PR06MB8455:EE_
x-ms-office365-filtering-correlation-id: 9eaba2f8-84c1-45bf-75a8-08df1d218508
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|38070700021|4143699003|10067099003|56012099006|5023799004|22082099003|18002099003;
x-microsoft-antispam-message-info:
 Hn9fBMBgNxJX93/5MXDa9ZikfhVKSIte+df03AZC2EQHpCSqgia219uqY+mpS0P8hNp7BV9h2VNq8ed6yOD8uEgSUDkrIoDgu1z0QhDhM2lw054e2ncyml8M+53ItjwL2q9YKtSflL/nG78+vFZCwXaJz5KUF8f3N1LOx5swNIx3NrRHERwu613diqLu66bNAWYWLSFVe6xaRVt9w0fJajHPXY49JH9BxXZmlbdDeJp0nnFwXDeuEKL8vCeID09RXA/RVI3ceVqgWKw9MYzmc3PfLiCRt9JhqJm3SIxG2PnnilAZjX6rha7AUyFKJonW01TcN78LL83dg9gS7gTNwzAuiR402AP2o2xo54E98XJf5511e2PolQQkwE3c603iGVi+9Ox6lCOlxFeo/iG1Y9FS0s69UCI71SvZnCCLNzFBaP7aNpIAdtzRna4vT37SGJAaBtZatN1UOQAtT4jzUR6GaRTIQEa3/qAsDLz6VS+pl9Oxa1FKM4Tk7FLla+66rEX0K3Tv2yxRN/5Uq+BgGStZ+f5KmM1z5N4ArRVKgYFXK+LoTdR1qUkitQ6aeDiZWY7eM4QvOQf7wXUrzOpgRNJL8OnLkUsVizaAUVPuRDpWgcnqUtQKe1ZFLEoz5tra8NsrDNQB6WEgBLenSe8eMUunUBL8+Nx07N/ZVevOtw2A8ffqGjrlfJxpCoSVR3jKlLcflX3rtaDrVy/rYCrc79cZfhEQ9i9kH3nyQ1Yl6f4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KUYPR06MB8673.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(38070700021)(4143699003)(10067099003)(56012099006)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T2p4TnVjTkJ4QUdSRitaRG9EUURIU3UvT3F4ZXQ4cDk2SS94dzY3OWpSWjNy?=
 =?utf-8?B?anZQZVdQc0xtZjN4SC93S2EyVml0YW9YbmpTY2h4NFZqS0lPa1hpaitPMzgy?=
 =?utf-8?B?VjNVeHZyMFhSMzlFdzByQm9nNUxYUXZoQnJEWmFxcmwvZDEwd2VJTWQ2QUUr?=
 =?utf-8?B?L0UrSElVTDA1M0VLRjFzR0NFV09mV2xwd1A2dm9BRkIwM0JQNFB1dUdMVWtO?=
 =?utf-8?B?ZTZBYWlxMnRJRnpxLzFCQ1h1OG9rVGxXUE16QWFVR09mQXBTRmNRTjdCaEFJ?=
 =?utf-8?B?RHBEay9iVFNWQ3hrbDRQbnI4b3I4bVlEa2c3OE1STE9JbWtYNkVxNkpKUUhL?=
 =?utf-8?B?R3pOY1hISGN3QXpIRW1xTDl4bStaNS9MMUo2TDI3Uk1LRzdoZW1Dajd6VlhI?=
 =?utf-8?B?aFpFVXhkMXh3RGFCRVJjUklYZmpHMExFNTdiNDJsazdUOHpHaVQ1KzJNVW04?=
 =?utf-8?B?bFdHUDhYdzk0T24xTFhiTm44VkNlaWNqL0UvbER2UmdrV29JSGIxUTc1aGs3?=
 =?utf-8?B?SjZHVjFLMFpkVW9Obmlwa1ZsYW5TeGNrNnNSRTFzeU1MVXBBZHhWc3cxNkhJ?=
 =?utf-8?B?c2UzUkZXSlN6a2dzMU8xaFRMTWY2UUI5U2JxcG9QM1RiZjUzR3ZhNmJGQUZo?=
 =?utf-8?B?Q1RWck9tcnVhbmR6S0x3aExBUWtzZWdhZy9XUnlEK3FmRzdlQWhQUFVRL01K?=
 =?utf-8?B?cjYvYk5nWXY0RlpqU0RFeElETmd2MlQ5V2dTUUozVG9ZNURHaFNTT29ubnl5?=
 =?utf-8?B?R0NYb2U5R1JRQVp0dTFsSU53WVRvbjc5bmIrTS91QkpwSUNqV0hmVUxYS3Z5?=
 =?utf-8?B?cHZ2WVdTamdVTTBOZ29MVitVSDByRCtnZ0lUeGRyRWR1SnMrckV1dWVaTUdE?=
 =?utf-8?B?algrVVl6bVBiT1hQdzVqSERsUnk3aituQXlRbzhFWEZWekVQKzM2RHV3c1l5?=
 =?utf-8?B?eFdWRHpZL21zTjF0WWs2WVFhTUNBT2UxODg4QllHZUlqUHFOMGlhbnNHMEty?=
 =?utf-8?B?ekpGRzAyZGhHbkdrVGY5MlVMSU1PZEVCVklmVGVOeXVMSkdtUW02R2ZpQXF6?=
 =?utf-8?B?MlJIWWw3Zkp5dFBtYzlxeE5TK0xkSS9DODZJcTdhN3ZKQm0xSGtZVG90aXV6?=
 =?utf-8?B?OXBZWklYS3ZIZFBNakdOcEVWanNSVWZnV2UwNCtsdHoxSjdVbmtHekdLNmJS?=
 =?utf-8?B?MysxV3JMdG9lQk9ZZkFTenVOcUdqQVoxNzJzN0NYbURXL2ZnR0lMSUJSS0NO?=
 =?utf-8?B?WnYvckRiRGc4RWhSaldIVE5EeFZKV0pHaW56T3kzL0NwYktPMk0vbDRoc3c0?=
 =?utf-8?B?Z3BPek8rTjRSWk05SFJVcE52WjBzUUlqMFhPRkx5enRVbWhWejdFZms0V1Fm?=
 =?utf-8?B?cU01WWxPYysxWTlKVW9sR1U3SWZpNHFPN3Q1cG5jWm9qdThaUGhHUjN1VHYy?=
 =?utf-8?B?U3dHMy9WQ0o0aTNiSWtnU2N3cjAzMFZzcDBYR2M2RXhGU2Q1WUVncEtIK0JV?=
 =?utf-8?B?OTdOUUp2ZVBFV05qVGVBOGw1VllHWU8rQTJLTEFQb2VQU0Rhanp2MS9HalAx?=
 =?utf-8?B?MGpPQ0JLRmJxQjlyU0cyQTFWWmJTdTZVMlhhWURLK1NROXFjd0VhODdvOGVS?=
 =?utf-8?B?RmxhMjV5cktEbllUL1FIaXhEUGlsc1Y5aGVQK0Y2WXhoVERuTlQydkpXa3JH?=
 =?utf-8?B?QkpxZ0lXWGFDcXRmM0FWeGgwa090SzVpYjdXM3VnRFB0a1RmaCtHQVA3RFRR?=
 =?utf-8?B?R0RJN0NBM1JwN3lKUDIyL3NvblBZRGhSSFk5ZUI0SHlhUTB6SnZUcTlHSDZa?=
 =?utf-8?B?QlQ4ajVFQXRwMWRvaEVYbzBUYUtWbGFEdThxbXoyMll3VzNLSGRmQXRCY0hD?=
 =?utf-8?B?MnBEUWJEZkRMbkhCRHN3RVdCQUI1Y0lCNFNtVnByeXFQWjgxNmhwdFNiSWFi?=
 =?utf-8?B?RFVKK3pZTXRJU1o5MUxJR3RVU1dOblZRREN1V2QrNUh0ODMxblA2TFZlN2Nu?=
 =?utf-8?B?MjV3TUR6OGJhZXVvbTFtODJOcXU1bXFxd0NyNndtLy9SNE40bGgvMGFWdVll?=
 =?utf-8?B?SmdlQzFZMjIrSWJwSXhQSVJoanBYUW45eXM0U0ZYUVZ5dTUzZXpUU0ZlM2Zr?=
 =?utf-8?B?ZmlsL01Qc2p2dWhkL2luRDBzTkNlbDRvZzh2dmtmem5CMExtTjJyazVxdU55?=
 =?utf-8?B?blBVNHZ2WFhYV0ZkSVFCQlhxNThIOS84bldzZldSYUJwQUtsRi9WK1d4V2NK?=
 =?utf-8?B?dTQxN0Q4cnJ2cEhYOWRpaGJJNnBFVytLT2k5Q1hYamNBM3M1aHJIanBNVGhx?=
 =?utf-8?B?UytjM1NuOW1qc2lBZkNTaFBaWjhGSVJlSHBaeHZTcGEvS0tiUEozZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KUYPR06MB8673.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eaba2f8-84c1-45bf-75a8-08df1d218508
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2026 05:29:51.2678
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f/woUKcLVUJBc68F2pxEda4w3xnqxgeruWoCvW32Bx0HrGJuBm9SsE0MuOPjvrB8n1Wzgi5YSa44k7AcAsxDETWz9SoX5oEzSjn5yrpojb8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB8455

DQpIZWxsbyBSb2IsDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBS
b2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0KPiBTZW50OiBGcmlkYXksIFNlcHRlbWJlciAy
NSwgMjAyNiA4OjMwIFBNDQo+IFRvOiBKb2FraW0gWmhhbmcgKOW8oOW8uuW6hikgPGpvYWtpbS56
aGFuZ0BjaXh0ZWNoLmNvbT4NCj4gQ2M6IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz47
IGxnaXJkd29vZEBnbWFpbC5jb207IGtyemsrZHRAa2VybmVsLm9yZzsNCj4gY29ub3IrZHRAa2Vy
bmVsLm9yZzsgcGVyZXhAcGVyZXguY3o7IHRpd2FpQHN1c2UuY29tOyBwLnphYmVsQHBlbmd1dHJv
bml4LmRlOw0KPiBjaXgta2VybmVsLXVwc3RyZWFtIDxjaXgta2VybmVsLXVwc3RyZWFtQGNpeHRl
Y2guY29tPjsgbGludXgtDQo+IHNvdW5kQHZnZXIua2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2Vy
Lmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWFybS1r
ZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvNF0gQVNv
QzogZHQtYmluZGluZ3M6IEFkZCBDYWRlbmNlIEkyUy1TQyBjb250cm9sbGVyDQo+IA0KPiBFWFRF
Uk5BTCBFTUFJTA0KPiANCj4gT24gVGh1LCBTZXAgMjQsIDIwMjYgYXQgMDc6MzM6MTJBTSArMDAw
MCwgSm9ha2ltICBaaGFuZyAo5byg5by65bqGKSB3cm90ZToNCj4gPg0KPiA+IEhlbGxvLA0KPiA+
DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogTWFyayBCcm93
biA8YnJvb25pZUBrZXJuZWwub3JnPg0KPiA+ID4gU2VudDogVHVlc2RheSwgU2VwdGVtYmVyIDIy
LCAyMDI2IDEwOjI0IFBNDQo+ID4gPiBUbzogSm9ha2ltIFpoYW5nICjlvKDlvLrluoYpIDxqb2Fr
aW0uemhhbmdAY2l4dGVjaC5jb20+DQo+ID4gPiBDYzogbGdpcmR3b29kQGdtYWlsLmNvbTsgcm9i
aEBrZXJuZWwub3JnOyBrcnprK2R0QGtlcm5lbC5vcmc7DQo+ID4gPiBjb25vcitkdEBrZXJuZWwu
b3JnOyBwZXJleEBwZXJleC5jejsgdGl3YWlAc3VzZS5jb207DQo+ID4gPiBjb25vcitwLnphYmVs
QHBlbmd1dHJvbml4LmRlOw0KPiA+ID4gY2l4LWtlcm5lbC11cHN0cmVhbSA8Y2l4LWtlcm5lbC11
cHN0cmVhbUBjaXh0ZWNoLmNvbT47IGxpbnV4LQ0KPiA+ID4gc291bmRAdmdlci5rZXJuZWwub3Jn
OyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsNCj4gPiA+IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiA+ID4gU3Vi
amVjdDogUmU6IFtQQVRDSCAxLzRdIEFTb0M6IGR0LWJpbmRpbmdzOiBBZGQgQ2FkZW5jZSBJMlMt
U0MNCj4gPiA+IGNvbnRyb2xsZXINCj4gPiA+DQo+ID4gPiBPbiBUdWUsIFNlcCAyMiwgMjAyNiBh
dCAwNzoyMTozMVBNICswODAwLCBqb2FraW0uemhhbmdAY2l4dGVjaC5jb20gd3JvdGU6DQo+ID4g
Pg0KPiA+ID4gPiBBZGQgdGhlIERUIGJpbmRpbmcgZm9yIHRoZSBDYWRlbmNlIEkyUy1TQyBjb250
cm9sbGVyIGludGVncmF0ZWQgaW4NCj4gPiA+ID4gdGhlIENJWCBTS1kxIGF1ZGlvIHN1YnN5c3Rl
bS4gSTJTLVNDIGlzIGEgZnVsbC1kdXBsZXggc3RlcmVvDQo+ID4gPiA+IGNvbnRyb2xsZXIgc3Vw
cG9ydGluZyBzdGFuZGFyZCBJMlMsIGxlZnQvcmlnaHQtanVzdGlmaWVkIGFuZCBEU1ANCj4gPiA+
ID4gZm9ybWF0cywgcGx1cyBURE0gb3BlcmF0aW9uIHdpdGggdXAgdG8gMTYgc2xvdHMuDQo+ID4g
Pg0KPiA+ID4gPiArcHJvcGVydGllczoNCj4gPiA+ID4gKyAgY29tcGF0aWJsZToNCj4gPiA+ID4g
KyAgICBjb25zdDogY2l4LHNreTEtaTJzLXNjDQo+ID4gPg0KPiA+ID4gU2hvdWxkIHRoZXJlIGJl
IHNvbWUgZ2VuZXJhbCBDYWRlbmNlIGZhbGxiYWNrIGZvciB0aGlzIGlmIGl0J3MgYSBDYWRlbmNl
IElQPw0KPiA+DQo+ID4gWWVzLCBjZG5zLHNreTEtaTJzLXNjIHNob3VsZCBiZSBiZXR0ZXIuDQo+
IA0KPiBOby4gQ2FkZW5jZSBoYXMgbm90aGluZyB0byBkbyB3aXRoIHNreTEuIEl0IHdvdWxkIGJl
IHRoZSBhYm92ZSAqcGx1cyogYSBDYWRlbmNlDQo+IGZhbGxiYWNrIGNvbXBhdGlibGUuDQo+IA0K
PiBJJ20gb24gdGhlIGZlbmNlIHdoZXRoZXIgYSBDYWRlbmNlIGNvbXBhdGlibGUgaXMgdXNlZnVs
LiBGb3IgY29tcGxleCBJUCAoZS5nLiBQQ0llLA0KPiBVU0IsIGV0Yy4pLCBJUCB2ZW5kb3IgZmFs
bGJhY2tzIGhhdmUgcHJvdmVuIHRvIGJlIG5vdCB1c2VmdWwuIEZvciBzaW1wbGUgSVAgYmxvY2tz
LA0KPiB0aGV5IGNhbiBiZSB1c2VmdWwuIEl0IGFsc28gZGVwZW5kcyBpZiB0aGVyZSBpcyBhIGgv
dyBtYW51YWwgd2hpY2ggY2FuIGJlIHVzZWQgc28gd2UNCj4gY2FuIHJlYWxseSBkZWZpbmUgdGhl
IGNvcnJlY3QgbnVtYmVycyBvZiBjbG9ja3MsIGludGVycnVwdHMsIGV0Yy4gUGVyaGFwcyBJMlMg
aXMgc2ltcGxlDQo+IGVub3VnaC4NCg0KDQpVbmRlcnN0b29kLCB0aGFua3MuDQpUaGUgaW50ZWdy
YXRpb24gaXMgbm90IHN0b2NrIENhZGVuY2UgSVA6IHRoZSB0d28gYXVkaW8gcmVmZXJlbmNlIGNs
b2NrcyBmZWVkaW5nIHRoZSBwYXJlbnQgbXV4IGFyZSBTQ01JIGNsb2NrcyBwcm92aWRlZCBieSB0
aGUgc3lzdGVtIGZpcm13YXJlLCBhbmQgdGhlIHJlc2V0IGFuZCBBUEIgY2xvY2sgY29tZSBmcm9t
IHRoZSBDSVggYXVkaW8gc3Vic3lzdGVtIENSVSwgc28gYSBnZW5lcmljICJjZG5zLGkycy1zYyIg
YmluZGluZyBjb3VsZCBub3QgZGVzY3JpYmUgdGhlIGNsb2NrIG1vZGVsIGFjY3VyYXRlbHkuIFRo
ZXJlIGlzIGFsc28gbm8gcHVibGljbHkgYXZhaWxhYmxlIENhZGVuY2UgbWFudWFsIGZvciB0aGlz
IElQIHRvIGJhc2UgYSBnZW5lcmljIGJpbmRpbmcgb24uIFVubGVzcyBhIHNlY29uZCBpbnRlZ3Jh
dG9yIG9mIHRoZSBzYW1lIElQIHNob3dzIHVwLCBJIHdvdWxkIGxpa2UgdG8ga2VlcCB0aGUgQ0lY
LXNwZWNpZmljIGNvbXBhdGlibGUgb25seTsgdGhlIGZhbGxiYWNrIGNhbiBiZSBhZGRlZCBsYXRl
ciB3aXRob3V0IGJyZWFraW5nIGV4aXN0aW5nIERUcy4NCg0KSm9ha2ltDQo=
