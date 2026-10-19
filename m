Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023088.outbound.protection.outlook.com [52.101.127.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4971D4EE870;
	Mon, 19 Oct 2026 12:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792412259; cv=fail; b=L5bEsC/w0MIeGffI8RD61foqaSwtfwPOpsz5HfqcL3lqs5B6/SSSFu6HuC0OI8nmmLJw3114PDi0Fvxcx1gfvHGh7WPD4aRSA923l6aqenxu1h95lKMYPla8MJtTRWEUwTBptEPOrUT0TNuZmS7oOTjnSMXu8En+YuJBEp3qMeI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792412259; c=relaxed/simple;
	bh=MDk9aDvqyhcNERvp3x6dvd3gaM0bLYvyo1ArommVhSU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kHD9IlOcgd7RkpfcoXiya/cVtKkukvVGggZ0V+1wEF44f3ZepylkqTGdp7H/pkUXxip2Ox1XEQhDoZAMA6usSjqncCxD2IHXYgcnPnABnxTKOHajlJRei8MgiC6bdyQB7/8OqRrm4rYNHE1cVVqGy9G/iEgjXRFzStrkETjsg94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rzl7TysHPq6bK2hAMbftao9Of8TkcJ5V8F4zBW6XXXyXnB8vJSyKrz1bFF7jeZniK1jRjy4sCMVdqyO5oC4KXS20O9xb8dC8zTNR0otSmINfog2GYnyEwiFnES8G/y8dK05jyCmM9mQp8mQpoXV083CChlEA+z5Qoveo7bzkgnx/p9bXaOyz6rr1RF/elX/Ircbg2hfdL3y6oZW9cG0fe+avffLDzrgkSeoRF5tzf4adRVCphLlay38TzLnNUHPNlS7q9SKkLuLLAbFg6qxBOtzeEuqA2s/VUl5A2xnJ2vACq1lgfRXtm1B9CxK3fDgfX1a4id0qk++L9U6arC3mHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDk9aDvqyhcNERvp3x6dvd3gaM0bLYvyo1ArommVhSU=;
 b=xqXL7TPvYSAQnbF4tcOf+6Mx6oBiy8rpRwoPUqjOuv0qIafuogfutK54dD3YGV3xbSVVcLbC2ox/TzEpit6Q5xC4eCxWDWM4UsslDr/+84nTAckOsQZfH/isGDldPEXId/BIkEk701NQUKMfkZ4XSWbGXlxN4MyNRbziUF7JsuzQUwKhIMCUSB8WNnG6Pb8GA3PnIqBHyEvEHF/LSZRe6f2l5KD3TVk6sgAxS0jOsG4TUoRPNAefyocLXMeLkeZaeBJecajS9eLu7DClLakpEyDl1N4ucTbqnZ5VbhlqMtCBYxwQ+vcIpyg7ACbGPI17jhEX4geI+8h12+4TDEcrwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from KUYPR06MB8673.apcprd06.prod.outlook.com (2603:1096:d10:8b::5)
 by TYNPR06MB8528.apcprd06.prod.outlook.com (2603:1096:405:3d0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 12:17:35 +0000
Received: from KUYPR06MB8673.apcprd06.prod.outlook.com
 ([fe80::2b5f:4b04:8fc6:747c]) by KUYPR06MB8673.apcprd06.prod.outlook.com
 ([fe80::2b5f:4b04:8fc6:747c%2]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 12:17:35 +0000
From: =?gb2312?B?Sm9ha2ltICBaaGFuZyAo1cXHv8fsKQ==?= <joakim.zhang@cixtech.com>
To: Rob Herring <robh@kernel.org>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "perex@perex.cz"
	<perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v3 1/4] ASoC: dt-bindings: Add Cadence I2S-SC controller
Thread-Topic: [PATCH v3 1/4] ASoC: dt-bindings: Add Cadence I2S-SC controller
Thread-Index: AQHdV9A2NV62TPNWeUuoFGF/mpke47b1QoWAgA9tUSA=
Date: Mon, 19 Oct 2026 12:17:35 +0000
Message-ID:
 <KUYPR06MB86738724B8F4C11542D0A62E82982@KUYPR06MB8673.apcprd06.prod.outlook.com>
References: <20261009092552.2377960-1-joakim.zhang@cixtech.com>
 <20261009092552.2377960-2-joakim.zhang@cixtech.com>
 <20261009141837.GA1661224-robh@kernel.org>
In-Reply-To: <20261009141837.GA1661224-robh@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KUYPR06MB8673:EE_|TYNPR06MB8528:EE_
x-ms-office365-filtering-correlation-id: dc649b9d-61b8-4f31-2d07-08df2ddaf54c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|261009223027099003|10067099003|56012099006|3023799007|22082099003|18002099003|4143699003|38070700021;
x-microsoft-antispam-message-info:
 JNoaNuylJ8PI/ZrHE0K0/DcxlRmq5heDPvR9Os/bxfDDC+h0jxMuM042w876yNl4ba6tndaUA46r9ZkrW1lrbY8g7FNTlXPp+SZDU0wjjgKicZLmEzHUrkhjTljdRjWtJ0RMnlub0wFLB58eqfkeZfUQCoKqDPKiM78Oc+byDMu3VvgLU39tO9IAYgap3aI5PY9HpWmIFGRAWuA6VC90RDF9+T9J9vwYcmoI3KGYWLbeippB6Zf7IZZnUd/ayPJn5AnwmSV2/UMgqTmx9I9ziJ1cU1QioiZFhBxs1kIt70R67T8BtZBvmfM3PLtnbzo8X8gS2mX/JTAXfTyZ+EPmbjPXNGlgBOrl2hlDuWGUQFMszTulp/28iNf9XvlKp0RIq5RR1TrqJV+M7iaBtot8t3VjP7c3fFNy+Ni2fUFvArqASDEGSE4EnJ6UTQmwJckvothXEXyZHQgLl4zhTz/ftO9LF732A/NBCt2aWmmIyFiZS4vAuGrQDQmDW6KHipYV2XD/TDOFtsZ0mqAn91qAzYqc0F4qkS4E2RCiMjtPqJ+GSwV0BIZvQ+GT4k34XabriJcg/vrVnGWNVB2LAqJOPa8IIe9SMZQ/hQ7jkQ1sk5m8YJzAWZpiIqZn+aplacZ/NQt5JGQCTtckzbKRXgOq4TkeJJzowKWn2v+YesP4jpg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KUYPR06MB8673.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(261009223027099003)(10067099003)(56012099006)(3023799007)(22082099003)(18002099003)(4143699003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?QkNHTUNhNEhjSGFmUUlGeHYwL0c4UE9LbTkyV0hKY21Rd0xSbWZZZjhDVVpX?=
 =?gb2312?B?Z0lUK0k4RDZmaUd3c3hwcDRYS0UrR3ZZem03SDFhQmYyR2crRGZFOGd2VDFk?=
 =?gb2312?B?SXdDUkF1czlIWTM1di9HeFNkQWYyc3I0TUdIeTdwc3VZbTR6cWh5ZmRBd2J4?=
 =?gb2312?B?YzVTV2FUY2VuZjZEOWdHT0FrSi8zMDJIMTVIaEFhajBINDRHQm1IY2dKT0tR?=
 =?gb2312?B?YTdoWktYUTdkZXQ0ZyswQ2duejZrVkVaVFcwK3gyU09BMTJ4cHFwUGZydUJj?=
 =?gb2312?B?ei9QalV0MWFyRE5ZY1ZBT1hZYUhxUVh2OFRUcVRZMlVINmdmRWxWZG9vb0k1?=
 =?gb2312?B?M1FTY0h2aW5ObnlZWUhJVms5UTdDQlB1WG9RRlkvY3dxbUR0Vm85cTQ5cEkx?=
 =?gb2312?B?VytSRUVUa1JrQ1hDaGE0WldVSFIvWG02cE84NllIRGhQZ1RyN0FUbWhOallq?=
 =?gb2312?B?VWlUOTNCR3dmbDQ4NW5ZOC9HaWxTWSt1ckJNWXduSzRNaFhMQ0xHWVZKa2Zj?=
 =?gb2312?B?QXJEYnYvWUZxYVVXRlo4VlFyTFN4UGZXayt5bThSN09WaU1VSExmek0rUFVU?=
 =?gb2312?B?ZHVKN3J4TXYxZW5kRy9TNTdpODdvWHdFbEhDSG5QNGROMHd4Y2xMTTJyeGtn?=
 =?gb2312?B?bklZWVZDQ0g4SGFleVQ5REJwNE1oRng0VGZBdzM0Ym9Dc1F5aG1NSjI0SFhI?=
 =?gb2312?B?SzR4RXMzY0J0OGY4N1ZrQlJKT3JTTlFIRVZCUWUrQnJ2SU9rRlpkaGxSWjJP?=
 =?gb2312?B?REdSMEErSHVmeGZ0ZUVVSTJJS2NhNDNFUTZrUDQ3OWRTczR5RHViNzFpY1hs?=
 =?gb2312?B?aFI2bzFFdTFEaEkyYzVsdmVVWTFlYlZ6ZW9KU09VUlNFVVg0ZDZMWUJvMzVI?=
 =?gb2312?B?ME1FQUcwOUMvNWFDWVFpSVlwNGtiU2JYUlY3SnRyOUdhSE9VemZYZUwyMVc3?=
 =?gb2312?B?MTJySnIzemdsYWF3cVFpdU5kRWRlRC9vdFJvc0tPN0xVaEZUM0lHOEtSVUNG?=
 =?gb2312?B?L2FENnA4dXltL1U3TGo1WTFTTDZ1eUZnUjhvYUdCWnVFaGpVdzFiYnhYbDlD?=
 =?gb2312?B?V1M2UW9WNXAzOGZxeS9wVGxCWXRKMS9qWlJPL2pHa0dWbWdTNytVN29LREQw?=
 =?gb2312?B?cnlMZVp1SHM3eDlTTC9tRjE5WUhHem40ZDcxazhQaDkwc3pOOTRhVkUyMzNv?=
 =?gb2312?B?UFVpek16UVQwTnpNbit1YlF5enU5M1hQNFl2ZGxHMlFVUzM1QUJUdEUzMXoy?=
 =?gb2312?B?Q2xRTGphQ2RZNjltMUV2eDFKanplc1dpVWZCQnp1a1JJUC8yYktQYmY2aExa?=
 =?gb2312?B?bkxrMVJTOVVReUlJbzQrc2N0azBUQ2k0WFRTOHpON3IwaWxzRjE3c0V3UEsr?=
 =?gb2312?B?L1hJeXhyYTFlLzR2aFk0UGprT0cyTEluVUEydERjLzNZbG9ueUNJRFhxd1lv?=
 =?gb2312?B?dS93ZVFENHJKL2xydVpsa2JxZUs0TEozVDM3ZUMxTFY2N3JOVjBqZEZZVmh4?=
 =?gb2312?B?ZkEyNjBLM092SjhnYldGQ2Yyc3R6MU91ZXpIa3FMemhyYmtza1REWnM0Tlph?=
 =?gb2312?B?bEtTa0JDMks5WmIzaSsyUG15RSt5RysxcG9iU0NTaFk5a3dIMUFnVE0rSktk?=
 =?gb2312?B?MXVDeVNCemxZUUpoeWN1aE96NDJJbEZTSGdtR0Z1ZC9LRGgveWpsVlVpMHBW?=
 =?gb2312?B?bE9vR25KYzFsRmRDQ3Z4UVFuZGRNQ2thdkIxaS9ra0djeitxSkxJaXQzVDBa?=
 =?gb2312?B?b1AzaGE3WDdQQ0hBSDY3alQwRlZlM0FZWUFNQ2crYTdleGtBL1ZOVDJxWkJh?=
 =?gb2312?B?aUFSUWFKSTN6aERDRzhyTWNualgrRHFpOWNmUFM0ZHlSZzNiQ2lhQWxLT0Yx?=
 =?gb2312?B?UEFaUGRETUpoc2t2QkVoOFdUUHh6ZFdHVjVSOWpSU2kxbmtDa05iRzdBWW5y?=
 =?gb2312?B?ZzkxRksxakZGRVd5QnEzeFBsNXdtcWdZTzZxUlUxc3FxbkJqVlBHWnZyanRm?=
 =?gb2312?B?QjFRM0d4b2FCdTVVaHNaQ242OE9oQXN1QmIxQVdGTU5MWUNKQ0VtWTcvc0VO?=
 =?gb2312?B?dnNPZHZWTDlQQUE5TVdZNVFaVTBqSXE1cmR2SmN3STNUNXZiMHhkQlpVY2o5?=
 =?gb2312?B?V0dGSEFlZFRzQkNxRDNkSWNaYnVOZngxZlNpN2IyNXJ2MzRicHZEdHhQNVFH?=
 =?gb2312?B?MzR1dGtURDFseG9XdWlPcHJEUlRqNXM4d0ZWa2hRSUIrQk0zalRHVnZEdHdn?=
 =?gb2312?B?c0NnZE1vM28zMExZcEFXdlFjWmpBaGx2YVhGMWgyWWpFcHY2L2FWOXMwck1w?=
 =?gb2312?B?NGxTbHR5aDFRWkUyOU4rbllqTHNKODZyQ0hrWkRXa2JzYWlZak9qdz09?=
Content-Type: text/plain; charset="gb2312"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: dc649b9d-61b8-4f31-2d07-08df2ddaf54c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2026 12:17:35.1400
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uggoe0uuwUIFBG01pYBg2luzbK3u2xBJFhH3fMf2N0p84Awd8Hp1FYyqqQwAN8DrmA7YV6joG9cLQ7BGvgk3lXYyIElEbf9ifMBTkl0IMUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYNPR06MB8528

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9iIEhlcnJpbmcgPHJv
YmhAa2VybmVsLm9yZz4NCj4gU2VudDogRnJpZGF5LCBPY3RvYmVyIDksIDIwMjYgMTA6MTkgUE0N
Cj4gVG86IEpvYWtpbSBaaGFuZyAo1cXHv8fsKSA8am9ha2ltLnpoYW5nQGNpeHRlY2guY29tPg0K
PiBDYzogbGdpcmR3b29kQGdtYWlsLmNvbTsgYnJvb25pZUBrZXJuZWwub3JnOyBrcnprK2R0QGtl
cm5lbC5vcmc7DQo+IGNvbm9yK2R0QGtlcm5lbC5vcmc7IHBlcmV4QHBlcmV4LmN6OyB0aXdhaUBz
dXNlLmNvbTsgcC56YWJlbEBwZW5ndXRyb25peC5kZTsNCj4gY2l4LWtlcm5lbC11cHN0cmVhbSA8
Y2l4LWtlcm5lbC11cHN0cmVhbUBjaXh0ZWNoLmNvbT47IGxpbnV4LQ0KPiBzb3VuZEB2Z2VyLmtl
cm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5r
ZXJuZWwub3JnOw0KPiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2MyAxLzRdIEFTb0M6IGR0LWJpbmRpbmdzOiBBZGQgQ2FkZW5jZSBJ
MlMtU0MgY29udHJvbGxlcg0KPiANCj4gRVhURVJOQUwgRU1BSUwNCj4gDQo+IE9uIEZyaSwgT2N0
IDA5LCAyMDI2IGF0IDA1OjI1OjQ5UE0gKzA4MDAsIGpvYWtpbS56aGFuZ0BjaXh0ZWNoLmNvbSB3
cm90ZToNCj4gPiBGcm9tOiBKb2FraW0gWmhhbmcgPGpvYWtpbS56aGFuZ0BjaXh0ZWNoLmNvbT4N
Cj4gPg0KPiA+IEFkZCB0aGUgRFQgYmluZGluZyBmb3IgdGhlIENhZGVuY2UgSTJTLVNDIGNvbnRy
b2xsZXIgaW50ZWdyYXRlZCBpbiB0aGUNCj4gPiBDSVggU0tZMSBhdWRpbyBzdWJzeXN0ZW0uIEky
Uy1TQyBpcyBhIGZ1bGwtZHVwbGV4IHN0ZXJlbyBjb250cm9sbGVyDQo+ID4gc3VwcG9ydGluZyBz
dGFuZGFyZCBJMlMsIGxlZnQvcmlnaHQtanVzdGlmaWVkIGFuZCBEU1AgZm9ybWF0cywgcGx1cw0K
PiA+IFRETSBvcGVyYXRpb24gd2l0aCB1cCB0byAxNiBzbG90cy4NCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEpvYWtpbSBaaGFuZyA8am9ha2ltLnpoYW5nQGNpeHRlY2guY29tPg0KPiA+IC0tLQ0K
PiA+ICAuLi4vYmluZGluZ3Mvc291bmQvY2l4LHNreTEtaTJzLXNjLnlhbWwgICAgICAgfCA5MyAr
KysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA5MyBpbnNlcnRpb25zKCsp
DQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9zb3VuZC9jaXgsc2t5MS1pMnMtc2MueWFtbA0KPiA+DQo+ID4gZGlmZiAtLWdpdA0K
PiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL2NpeCxza3kxLWky
cy1zYy55YW1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQv
Y2l4LHNreTEtaTJzLXNjLnlhbWwNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4
IDAwMDAwMDAwMDAwMC4uM2ZkZjIzMzRjNDkyDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9jaXgsc2t5MS1pMnMtc2Mu
eWFtbA0KPiA+IEBAIC0wLDAgKzEsOTMgQEANCj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpICVZQU1MIDEuMg0KPiA+ICstLS0NCj4g
PiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9zb3VuZC9jaXgsc2t5MS1pMnMt
c2MueWFtbCMNCj4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1h
cy9jb3JlLnlhbWwjDQo+ID4gKw0KPiA+ICt0aXRsZTogQ2FkZW5jZSBJMlMtU0MgY29udHJvbGxl
cg0KPiA+ICsNCj4gPiArbWFpbnRhaW5lcnM6DQo+ID4gKyAgLSBKb2FraW0gWmhhbmcgPGpvYWtp
bS56aGFuZ0BjaXh0ZWNoLmNvbT4NCj4gPiArDQo+ID4gK2Rlc2NyaXB0aW9uOiB8DQo+ID4gKyAg
VGhlIENhZGVuY2UgSTJTLVNDIGNvbnRyb2xsZXIgaW50ZWdyYXRlZCBpbiB0aGUgQ0lYIFNLWTEg
YXVkaW8gc3Vic3lzdGVtLg0KPiA+ICsgIEl0IHN1cHBvcnRzIGZ1bGwtZHVwbGV4IHN0ZXJlbyBw
bGF5YmFjayBhbmQgY2FwdHVyZSBpbiBzdGFuZGFyZA0KPiA+ICtJMlMsDQo+ID4gKyAgbGVmdC9y
aWdodC1qdXN0aWZpZWQgYW5kIERTUCBtb2RlcywgYXMgd2VsbCBhcyBURE0gb3BlcmF0aW9uIHdp
dGgNCj4gPiArdXAgdG8NCj4gPiArICAxNiBzbG90cy4gVGhlIHRyYW5zbWl0dGVyIGFuZCByZWNl
aXZlciBhcmUgc3RhcnRlZCBhbmQgc3RvcHBlZA0KPiA+ICt0b2dldGhlcg0KPiA+ICsgIGJ5IHRo
ZSBjb250cm9sbGVyLg0KPiA+ICsNCj4gPiArYWxsT2Y6DQo+ID4gKyAgLSAkcmVmOiBkYWktY29t
bW9uLnlhbWwjDQo+ID4gKw0KPiA+ICtwcm9wZXJ0aWVzOg0KPiA+ICsgIGNvbXBhdGlibGU6DQo+
ID4gKyAgICBjb25zdDogY2l4LHNreTEtaTJzLXNjDQo+ID4gKw0KPiA+ICsgIHJlZzoNCj4gPiAr
ICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+ICsgIGludGVycnVwdHM6DQo+ID4gKyAgICBtYXhJ
dGVtczogMQ0KPiA+ICsNCj4gPiArICBjbG9ja3M6DQo+ID4gKyAgICBtYXhJdGVtczogNA0KPiA+
ICsNCj4gPiArICBjbG9jay1uYW1lczoNCj4gPiArICAgIGl0ZW1zOg0KPiA+ICsgICAgICAtIGNv
bnN0OiBoc3QNCj4gPiArICAgICAgLSBjb25zdDogaTJzDQo+ID4gKyAgICAgIC0gY29uc3Q6IGF1
ZGlvLWNsazANCj4gPiArICAgICAgLSBjb25zdDogYXVkaW8tY2xrMg0KPiA+ICsNCj4gPiArICBy
ZXNldHM6DQo+ID4gKyAgICBtYXhJdGVtczogMQ0KPiA+ICsNCj4gPiArICBkbWFzOg0KPiA+ICsg
ICAgbWluSXRlbXM6IDENCj4gPiArICAgIG1heEl0ZW1zOiAyDQo+ID4gKyAgICBkZXNjcmlwdGlv
bjoNCj4gPiArICAgICAgT25lIERNQSBjaGFubmVsIGZvciBpbnN0YW5jZXMgd2lyZWQgZm9yIGEg
c2luZ2xlIGRpcmVjdGlvbiwgZWl0aGVyDQo+ID4gKyAgICAgICJ0eCIgb3IgInJ4Iiwgb3IgdHdv
IGNoYW5uZWxzIGZvciBib3RoIHRyYW5zbWl0IGFuZCByZWNlaXZlLg0KPiA+ICsNCj4gPiArICBk
bWEtbmFtZXM6DQo+ID4gKyAgICBtaW5JdGVtczogMQ0KPiA+ICsgICAgbWF4SXRlbXM6IDINCj4g
PiArICAgIGl0ZW1zOg0KPiA+ICsgICAgICBlbnVtOiBbIHR4LCByeCBdDQo+ID4gKw0KPiA+ICsg
ICIjc291bmQtZGFpLWNlbGxzIjoNCj4gPiArICAgIGNvbnN0OiAwDQo+ID4gKw0KPiA+ICtyZXF1
aXJlZDoNCj4gPiArICAtIGNvbXBhdGlibGUNCj4gPiArICAtIHJlZw0KPiA+ICsgIC0gaW50ZXJy
dXB0cw0KPiA+ICsgIC0gY2xvY2tzDQo+ID4gKyAgLSBjbG9jay1uYW1lcw0KPiA+ICsgIC0gcmVz
ZXRzDQo+ID4gKyAgLSBkbWFzDQo+ID4gKyAgLSBkbWEtbmFtZXMNCj4gPiArICAtICIjc291bmQt
ZGFpLWNlbGxzIg0KPiA+ICsNCj4gPiArdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+
ICsNCj4gPiArZXhhbXBsZXM6DQo+ID4gKyAgLSB8DQo+ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmlu
ZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oPg0KPiA+ICsNCj4gPiArICAgIGF1
ZHNzX2RtYWM6IGRtYS1jb250cm9sbGVyIHsNCj4gPiArICAgICAgICAjZG1hLWNlbGxzID0gPDE+
Ow0KPiA+ICsgICAgfTsNCj4gDQo+IERyb3AuIFdlIGRvbid0IHB1dCBwcm92aWRlcnMgaW4gZXhh
bXBsZXMuIFdoYXQgZXhhbXBsZSBtYWRlIHlvdSB0aGluayB5b3UNCj4gbmVlZGVkIGl0PyBBbmQg
aWYgeW91IGRvLCB3aHkgbm90IHRoZSBjbG9jaywgcmVzZXQsIGFuZCBpbnRlcnJ1cHQgcHJvdmlk
ZXJzPw0KDQpZZXMsIHdpbGwgZHJvcCwgdGhhbmtzLg0KDQpKb2FraW0NCg==
