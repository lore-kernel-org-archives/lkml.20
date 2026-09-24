Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022120.outbound.protection.outlook.com [52.101.126.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3AB42DA3F;
	Thu, 24 Sep 2026 07:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790235199; cv=fail; b=JQ9L6mtPqu8Tc396o4ucWL/mOFAFhzBJFQSgZ4u01XjYOj9rrrXOtcrxbNt+ftN/p+IlDEgRbIMBwPvbC4SbipY+xj/ahEXHx7EJTK9TifFLwDGtZ89g+4RswnsVuI9G/Y4ZW2OtM+8CVnZpNheAbgSg3qW08vzyARWYL9IDLn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790235199; c=relaxed/simple;
	bh=eCNvNbXianm5AkuJTEctEcsecnfeHvxS8I3ZvG6A6ZU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BojOyDBLed2K0seesk0L3mbjdp8pe3r34ls4heb6OM8Bj9p5tIgmJgyQyEH6HTJ0lme49glwVa9eapjS2rkcmyaSRlwrch0edd1UfZc8Nsr6Smgmm5peUlK0XVehnWUpQVlUGRyPnnBnJ0XSuNLz+Qss5rz6PMQjOOEqdIfT9gc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VPRgKgs3uc9LLOu98E58wdiE4rzKehjFUvIjShsGkuJ6DLz7w09C6dKJMXKEN+uVBd7oBLE9v3kY9Nd+dA+EdoaAHfgjubs7kjA9U96JqT0I5AtAfuDLzzpI4BjJB3JpPZp5CsXhLmJBzSUP3VtVCa9ajZ5FvVCmWpx6qy0hcNnILjaEJUA20H9QvoZHglgwfWfygP1y9uqWi+nXcc+HPcELIBO7aekdtKYhl9tJIfMsJFQLf7hkJDBSMJGE0ZyICO2NlFgIW8XXqMr3fuQV9uxMUNwzNg3sakutm0iVOBFujYerziu6g7KAt6W/U0vJupE4BNbtzCT/2AvYsQ/+jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eCNvNbXianm5AkuJTEctEcsecnfeHvxS8I3ZvG6A6ZU=;
 b=oYTk13Z+J2cmQBV78J0SP7x0q7LrbMH3MFVy2IQBMAA0Agm1S+rgfpFQkhjO7QLNGbrpaaHRGyS8jfLlH8LfJIm8z2LNjtT+1hzG6/8i9P+nps+IzpndQNBQ6kaRZrquxC66o/7xeBu2UJ3b1pBNy0aLPB2q1wiyzE2MIz7dHzR+fqGPfFLnHgwNvM3LphcOLwVbFO8uLgIKZxuRI+KsGIppPjGJUGTJOWS7xuP+FyQDE0PmOdS+n8TMU7QT6Wkq/Uy8NkoxGbF1oq2Dytcjcu/M6UAa4V1ghtpm6nWewuggIroMWlIGdW35JZfwbCDJ+NZnX96KWYZWCmTUxrVXJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from OSNPR06MB8686.apcprd06.prod.outlook.com (2603:1096:604:498::15)
 by TYNPR06MB8808.apcprd06.prod.outlook.com (2603:1096:405:3c5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 07:33:12 +0000
Received: from OSNPR06MB8686.apcprd06.prod.outlook.com
 ([fe80::917f:53b:e702:5918]) by OSNPR06MB8686.apcprd06.prod.outlook.com
 ([fe80::917f:53b:e702:5918%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 07:33:12 +0000
From: =?gb2312?B?Sm9ha2ltICBaaGFuZyAo1cXHv8fsKQ==?= <joakim.zhang@cixtech.com>
To: Mark Brown <broonie@kernel.org>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
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
Thread-Index: AQHdSoSVrVbrgfH17kmJH9qI6OmYMbbapu0AgAKx8RA=
Date: Thu, 24 Sep 2026 07:33:12 +0000
Message-ID:
 <OSNPR06MB86866A7DE38DC5AD8197BF6E82812@OSNPR06MB8686.apcprd06.prod.outlook.com>
References: <20260922112134.4167305-1-joakim.zhang@cixtech.com>
 <20260922112134.4167305-2-joakim.zhang@cixtech.com>
 <arKPdM4bYsAeAKtr@sirena.co.uk>
In-Reply-To: <arKPdM4bYsAeAKtr@sirena.co.uk>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSNPR06MB8686:EE_|TYNPR06MB8808:EE_
x-ms-office365-filtering-correlation-id: 84a35093-991d-4c47-787c-08df1a0e16fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|38070700021|4143699003|10067099003|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 9o+63BeGPyHILXatjaHl6b6t3jA/xxy54AGXg7M7BLP5FOjnbdbj5ckk8ud3Hfaw7HejuRJ13FBzOdREuqw54SIHkjqGGaMmRmTAxfl6C5Anr+OUUg/PUEJyYVwM7UyR9IDm32RFu0IR/3b1T6eer1iSGxkuHkGVDC9GYhCNl0hL092Q6m7bh0oB1TFAjk7XBKrI22H0VAvQ9adKJ8Dj0bcK82J9gQZAA5mlYdZAGKJtNpw72ynvDPNdo9tDjTRLcejtfRDYErq35or2sDTOaTvVVSVmKtLUWoBmj3YbbZ7RGZ+FXrcMUwrLavz+G97AxAECzua3QoMjrv4rFkuhWnu6CMmOUh9Ok/x/JFrhtrjfjI6raNKeTqdv9ffqLoddwJtp7IZtdXtszDLUqFKtNMfZ2GFAzkfa55x5N7ofl5BrImQ3GOPpMp2QAzE5bEjbFZ+ExpXeZ4Cb9U7D1QJ26IXk+FyI3Qg91/tnqz0wk+FJyQBQDKg+xsP5vlzAQ6KESyTqGC+3YAVBpf1IqoBG2og/jHNgZtfHx/ogy0ZvI4mUuDCXoHaoFA+WNsaSTrV1qm33dzTDVCPfqhCBrQ73gQcQeFqsm6wiSkhkjbCV6Zf1DmO4/65s7+sTbwiY24IUBMw9M4XPw0Bmn/IZOiOjenZK3WaiAzopcS/N/RIsiVEQjG9q27sJactnvSV/HdZPKt3txl9wKJAwULKCiai3Ps+cP1RNB3SsOUoSUHuVW3g=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSNPR06MB8686.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(4143699003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?bGJGWVB0SytheVJjVlcxYzVxNlFxbEM1a1RZYXFRLytIemt0d05EeERDYkVS?=
 =?gb2312?B?S3R0WE9xWWpzMjcvSXhvY1JyMEtjanlwckhyL2hiZ2lvUnFZb0FOTS91VGor?=
 =?gb2312?B?UWRvTHl6VjZmYllXRUhEeURyUmZ1dHRMR3lXVDlMYzk5dTJkSnNsTzlaTlY3?=
 =?gb2312?B?VDcwUDBYSnVXMmdySGNxQ0ZZVHdhRFJhNkJrMGl3Slg2NjRkVkF1c1ZsaUd4?=
 =?gb2312?B?UmZ5NS9aamU3U0llbTljRXc3NmgvZ0Rnc2x5UzlMVlR3VEhmWnA1REFKZStM?=
 =?gb2312?B?ckRXQmxMREU0dkxyOEtXZmc4eXVUenlTSnlVVWlOWUU1MVpzK3lGbzBuMjBt?=
 =?gb2312?B?Smo0MTlSSW12cjljSFFSRXVseTJ4aVcyNnA4WVRiYnBOS2dpenRVWmtzSXVR?=
 =?gb2312?B?amJEc3U5OE1sZXNCS1FMUmZqazM3ZEphTEQwYTl5TXBPbytya1VuekE0M2Jm?=
 =?gb2312?B?YUlwWWxtM2o0TVQxVE1mSVY2YjlIRWk0anJNTDB6U3p3cU5SQTRnM002blVO?=
 =?gb2312?B?MXRLejRQWDlGZ0JFUThBeDFIVjRrS2d5QUZMZ2tKQVlseFl0UGIxaWJTRHoy?=
 =?gb2312?B?YUw1R0RQNU5iYTYrS0o3YXlyaW11RDJzL1kvV3hrV29OTnlLUWFHcGJqMEJP?=
 =?gb2312?B?YTY1cEJLTE1rdW8wRVptOVhYODIwRFJNYm00QUlkN0twQ0V1UGUrYU8xTkxs?=
 =?gb2312?B?SGQzQW1Ld3Y2Z29xM2h0aFp4QUZWWlpYanpjejJpVjlITjlLVnp3U3RXR3I4?=
 =?gb2312?B?SUozdzdQbUJ3QXUxa2NNWkpaUGc2RzNrNkhXNjBodzJvVTVUZmlKRk1SN2xX?=
 =?gb2312?B?eW1lYkFaVTcyK0xQWU5mTjIrVkxaVlRRTEVCUFZmQU4waG5md1JXV2IraEhh?=
 =?gb2312?B?SXg3bklkQkZ6L2RKNnlORUQ0NW1ZVm13K1B3KzRRMUJUL0RIcEtYK2FzTjR4?=
 =?gb2312?B?SC9wUmsrdWlRbkkyR3A2M1JSYXNnaWdOaDZjZHdjU1hpdExzUk4vdkdhSHVN?=
 =?gb2312?B?dG5yd2JhL1AyUVh3dHp0MU1NbjNjeXE0YXRTcUl0Q2tXdW5mWjNpTVUyWlJE?=
 =?gb2312?B?d0pCcVJwanNWVStyUDYrYlZKZzczNFI3VW81eGZaMTQ4U1REOVBzUzFCQVlu?=
 =?gb2312?B?OXJMRkdnWWk3bTAxajREV2xrL1EzUEUrYUZGYmpqTm5mK1ZqVnAzMUhWNlJH?=
 =?gb2312?B?eUlURWVYa2k5enovL1NNbmlFaHhLbk9EMHg2eXE0R1kxMittZjllRjJ4T1FU?=
 =?gb2312?B?Z1BYbkpPS3VPSzB3TmNGK1lkNzJmWmxKeEt2Qy85bk9lRmZtZ2c2YjRueXFS?=
 =?gb2312?B?SXN5eGh3NnhhVUFZckJ2YWRYamo1L2JLTWRwOFNIRlcvd0p3YXpDMjlZeUhE?=
 =?gb2312?B?NWpleEtZR0c0OEc5Y2hWUkV2Q1V0VGx4YkR3dG52UmRIb2dleC8yZzBzNzZ0?=
 =?gb2312?B?WHVPaVFTbTlSY2MzWWs2YlFGbGtING1wdjhyMURXWGFRMUJqY1ZWcWRJcGgw?=
 =?gb2312?B?TUlQT3c3MTBZSDVaV1pWSnF2dHBkS2V5MFFsTVR5REg4dmptSFN4S2RWWWo2?=
 =?gb2312?B?WGduVzZpTjNDTTRiRlRzRFd6RzExU2lsUUdyTm9yaXhVdzJHZWsvMmtoUzYr?=
 =?gb2312?B?OFRXSDFDWkZIU3Q3TWRxNzVBM0xUQjhjTFFoWUFYWFZQYXR2L2ozR250OFBI?=
 =?gb2312?B?T1d3amp5b0JjelIycmJKanF6ZjB6ZlBpRU5pdmtNcGhDbUhTbG14Ni90M2FY?=
 =?gb2312?B?OVZPbGppNjdDMlF5aVlldUxaS2tHeGdtdXhWeXdWckEvL05rNmd2Wnltbnpt?=
 =?gb2312?B?dWJmY2R4TC9mczExUmFoVW1tKzRYSWtrbUNZLzgzMWhnQkZ6ZC9BZlpONnZF?=
 =?gb2312?B?azgzUE5BcGlEL1lTL05udlFrSjhETzJ5Snl2NVg3NThrZ3I4OWlieTRMUzVt?=
 =?gb2312?B?VURwczRhZURuZTZBbEQ3ZmsydVh6aWYyYm1lUkEyTm9jSjZoT2FZN3FETHhw?=
 =?gb2312?B?UVUydk5lUUxWLzJwckYzZkJSakwrbWJWcUpRMm03SVJVY1pXcEN2WnFXMlBi?=
 =?gb2312?B?R3hMWHBzTWkzcWFXOENsRXFHcWlwdGxGZWxsVHlyNDJNVi9LRXRqL0c3dnR6?=
 =?gb2312?B?MlIyRkkrZFczdkg3YkoyNFh5QmlwN2N3Rmc2ZkNpVlVQSFRXQkdIbVo4bkdy?=
 =?gb2312?B?K1YwNU81dUpwVUJ4RGw5c1FJUU1PaHU2aE9xRXFuNHZWUFRlSnM5MGRSREtw?=
 =?gb2312?B?anlINW5iTGRpNy96R3g1QTZqMFBEU2NrZWxFUUF3VUVhemZTMVZlWGIwSldr?=
 =?gb2312?B?b01HeHhmS2ZsLzd0UGdnY0JPa0dJRFgyMVQ2dEdzS1pQWDlwRHg2dz09?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSNPR06MB8686.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84a35093-991d-4c47-787c-08df1a0e16fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2026 07:33:12.6700
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CQkjQredjXFQSmUkhVpt9azB3oJq2OWLZH2gVU/CRPry/TO3b5Ijk/I7U8SH/RVnlqeonvY7Wp7Wl6V81WA4qbv8G/yLEKLWgEJ/TLLCAJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYNPR06MB8808

DQpIZWxsbywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXJrIEJy
b3duIDxicm9vbmllQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIFNlcHRlbWJlciAyMiwg
MjAyNiAxMDoyNCBQTQ0KPiBUbzogSm9ha2ltIFpoYW5nICjVxce/x+wpIDxqb2FraW0uemhhbmdA
Y2l4dGVjaC5jb20+DQo+IENjOiBsZ2lyZHdvb2RAZ21haWwuY29tOyByb2JoQGtlcm5lbC5vcmc7
IGtyemsrZHRAa2VybmVsLm9yZzsNCj4gY29ub3IrZHRAa2VybmVsLm9yZzsgcGVyZXhAcGVyZXgu
Y3o7IHRpd2FpQHN1c2UuY29tOyBwLnphYmVsQHBlbmd1dHJvbml4LmRlOw0KPiBjaXgta2VybmVs
LXVwc3RyZWFtIDxjaXgta2VybmVsLXVwc3RyZWFtQGNpeHRlY2guY29tPjsgbGludXgtDQo+IHNv
dW5kQHZnZXIua2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFk
Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvNF0gQVNvQzogZHQtYmluZGluZ3M6IEFkZCBD
YWRlbmNlIEkyUy1TQyBjb250cm9sbGVyDQo+IA0KPiBPbiBUdWUsIFNlcCAyMiwgMjAyNiBhdCAw
NzoyMTozMVBNICswODAwLCBqb2FraW0uemhhbmdAY2l4dGVjaC5jb20gd3JvdGU6DQo+IA0KPiA+
IEFkZCB0aGUgRFQgYmluZGluZyBmb3IgdGhlIENhZGVuY2UgSTJTLVNDIGNvbnRyb2xsZXIgaW50
ZWdyYXRlZCBpbiB0aGUNCj4gPiBDSVggU0tZMSBhdWRpbyBzdWJzeXN0ZW0uIEkyUy1TQyBpcyBh
IGZ1bGwtZHVwbGV4IHN0ZXJlbyBjb250cm9sbGVyDQo+ID4gc3VwcG9ydGluZyBzdGFuZGFyZCBJ
MlMsIGxlZnQvcmlnaHQtanVzdGlmaWVkIGFuZCBEU1AgZm9ybWF0cywgcGx1cw0KPiA+IFRETSBv
cGVyYXRpb24gd2l0aCB1cCB0byAxNiBzbG90cy4NCj4gDQo+ID4gK3Byb3BlcnRpZXM6DQo+ID4g
KyAgY29tcGF0aWJsZToNCj4gPiArICAgIGNvbnN0OiBjaXgsc2t5MS1pMnMtc2MNCj4gDQo+IFNo
b3VsZCB0aGVyZSBiZSBzb21lIGdlbmVyYWwgQ2FkZW5jZSBmYWxsYmFjayBmb3IgdGhpcyBpZiBp
dCdzIGEgQ2FkZW5jZSBJUD8NCg0KWWVzLCBjZG5zLHNreTEtaTJzLXNjIHNob3VsZCBiZSBiZXR0
ZXIuDQoNClRoYW5rcywNCkpvYWtpbQ0K
