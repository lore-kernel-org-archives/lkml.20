Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010069.outbound.protection.outlook.com [52.101.228.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC5048E0C5;
	Wed,  9 Sep 2026 08:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788941205; cv=fail; b=bZhR+D/xqul8nj9cauY+lxAdbo0xhrwFJ9JmvTA78mCpBuuS+X9D9LUa98+dnlrkN9IOFyf8hpuuZnz3vCVvVStCS5RmD4u1MwGHP/4o9gAajJAvuknSH0TiQIWrzW6xNf1nBtMZJCzQZKTYXWOQujqm/w+fD2Q4AbpvNNtm/a0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788941205; c=relaxed/simple;
	bh=4GeaMZ/f+a/Omssyc8gOQzLbQAYkjVh3sziPS/y4hA0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cGpM1NHhndUaEaVYe3fw/CwRGEnTjIgkbXGnX8ITSWLTWfZP3HkNKlZbG8SeXiPpSr4ban+3DC9S0WwaNmeoMg5FA3z46ipddbXiDIYvU1ZByUICVR+rGVrHtzbP9Mw630FoNkVrIuIGxoc+IL6IpSNto6qbXL+hT4HevrbQyBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=GdtPT4hL; arc=fail smtp.client-ip=52.101.228.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="GdtPT4hL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=twcr8T9ugFWUZBlr9pbTgD7IwgEy8j+hU8A3f0t7KE5bwy1LQLyHcqwdhPiH+Y5+1y/RdOIl1CnPMAof3WNehRIWvI2FaLm0CNjVgFjWlejChTTMXqpp3eshTDfVFX0JoaTrOmE6a3gcFrW7TjFH3usBRqMjVMFh9CEXI1tZfnMR8NTiRzaiypqH8m0yywm70pzUmiQIgiZVXjK15R2H8x3jLBD13TRZ7KYXcH/1ADKNyMm2Ia6xqbUJW1xsfVJijZ2vKDrGjvmoYEFhp1xMLqvoSlL99WspOg9DjMWKTKzqczyvt105cKSRqxkurVBov2jRhizZM3TtHIheIu0M5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4GeaMZ/f+a/Omssyc8gOQzLbQAYkjVh3sziPS/y4hA0=;
 b=SWbU/FVosTEjnZqkl6oAYzMFs0DzSyIoNVNO0rGfTwVzZdPv9u/KquyWvBdfswZTqXXUgGd1kaqgA/Qzc7dIvOAJbHPxljVcg4IREbtV0+AHEKj/gxwo5pzJpPREDyimFwV7qVoNAymsq4TKX/cmJva6yBwLryTVDwXgqVV6e+7NFVq0RAqz3LHIMYupiRovgGrtvyCBgowC/fr0pcvzsB1ctI/GP3BDx9RSzltITbi3oTRcTQgpcqHsEcV6EHfE6tKdStOq1ZJeadu7aBnoIJnGiuiDVOtW61J19qtR/40A5iBzeSXtTesr2ySuhBqSD4YIXDAMnaPeOzK9CI7hEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4GeaMZ/f+a/Omssyc8gOQzLbQAYkjVh3sziPS/y4hA0=;
 b=GdtPT4hLJukDYZ4mKLAgbE4w9AmOjRA5lvRb071SpGAXmTsyR1myPGKFU7qs1N1IX+Kc8snzWPW9+722tf3zrgBmQmBzDYs6LXse4D1awwvIV98VLsnL48PbFF4/IGmHRXbocaT5bCWw07PcIN3Oud32zCSyl4Ng1NIGJku0Tg8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB14153.jpnprd01.prod.outlook.com (2603:1096:604:361::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 08:06:40 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 08:06:40 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: "biju.das.au" <biju.das.au@gmail.com>, "magnus.damm"
	<magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 13/13] arm64: dts: renesas: Add LVDS overlay for RZ/G3L
 SMARC EVK with ITE6263
Thread-Topic: [PATCH v3 13/13] arm64: dts: renesas: Add LVDS overlay for
 RZ/G3L SMARC EVK with ITE6263
Thread-Index: AQHdNYM2dENTOT1FBkiN1SiTvZIlN7bEwZeAgADdyLCAAFNxgIAABiDA
Date: Wed, 9 Sep 2026 08:06:39 +0000
Message-ID:
 <TY3PR01MB1134699FCC82D261E0E54AFCB86B02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
 <20260826174854.199139-14-biju.das.jz@bp.renesas.com>
 <CAMuHMdWKpWtp6dXe_1qk+GuV-n065LjHNQBGGEfsOfVz9_T1+w@mail.gmail.com>
 <TY3PR01MB113466B5A606D636420D7BD5586B02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdWQAAugUtYNgkKrY=TFZbiAa61=jBg_fj__L+hRUBCR_A@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWQAAugUtYNgkKrY=TFZbiAa61=jBg_fj__L+hRUBCR_A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB14153:EE_
x-ms-office365-filtering-correlation-id: 7361bbe5-c8d5-452d-9867-08df0e494732
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|10067099003|4143699003|3023799007|18002099003|22082099003|11063799006|56012099006|38070700021;
x-microsoft-antispam-message-info:
 Q0ZP707A4niMJXrJ1HF+/+bBdparU142jnpNAVptmIK4o8Dpt97yV4Uh7tzMr6YlzMYTSdtWtAXUaJ8KgV17Emw+aWpDL9A91JSZM939oL6+beYO/DIu1YnrLWpo7mVPlf4k6hA1L+JPlcLRoTKBTtnBmt3+XxOiTfuIde4yW9+dhy+MeVCerrj74HMH4z82/Wb70RDo8eTTNpM4jxMxBcldBlUByU/3QIZGYCDVAATd5IFc8kgf4ztljFi+jq0clzleoLz4XBIA9UozDt0EUDIcugPEf50xBIZuydpmu10dnTRBzkmz2wr2dBkLmPJPUn14fo/R8Fgv4Od8TXcd659oDLzR5MTWXw0cR8e98EniwtbNmxo7SDo6PRTTBJCNTTUfGMCaxNdyi4d1ANXmaM17VFXJ4lOnj6WnCDqz6L13NS9sxL647XoasQfRZtu1ezmfFfiZceHwGQBw50v0BNxlbvNXpNjRe+knRKqqGXgswOXDejV4o80x5Npd56R3XgcptWRx0UR3LJk9h2Uepz8JWAaM+6RqlxpCmkGLFOTaP+lf/oMWZ6MntRXcU93WcrAa9uf2ojJGflRqBkCYoG5NvvXxyibHVmwrERP3mm4YN8e0kmCKm/SU6oPRBuxVOpwt1Kl9maSkiarVqCkfJxynto6V7VlDRIXYWVU1sQs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(4143699003)(3023799007)(18002099003)(22082099003)(11063799006)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S0JNaDg5cm9zSG1uSzJZaERhdU1WOG10MG9HNDhqN29Oc3lxdE42MDRXYmNE?=
 =?utf-8?B?eE1zcDhPNTQyWnRqY2c4MFlqTHZzSFpCeFFzeHQzNW9YZDFreC93eHo5Q2kr?=
 =?utf-8?B?MTVrdklHa1F4bEZqaXpjay9XYldXcXhvUytkMGVNRVFrNnNoY25Da0dNUGZK?=
 =?utf-8?B?ckZCQW5YNk1qTlZKdFZxdC81YXhXeDhoSjNadlVYRmV1cEhtWmhrUVNTR2xx?=
 =?utf-8?B?NmVqdjJvK0Z6UTRBdW80RWFxZEJQM1g5REQ2T1l0TmRqQmpKcE1YTUFTaEpr?=
 =?utf-8?B?SnVpc3lyV0NhVUlsWUhXUTR6M1VmSnJQVE1qRHBFS29HRXpOOWkwY1BNQXAy?=
 =?utf-8?B?L1doN1JXcW9kWGh6U21JazdvTEFVYzY4OHZUcnNVQytLUkJQZm1ib2svTzVX?=
 =?utf-8?B?WnRtSW10REZlZXdKbEhQZFRCT0M5NytpSm1Qa3RST2h5RitRTzVMSFpQOGcv?=
 =?utf-8?B?RnlEazZ3NGZCSjd2eXdSbnZaMnp0NytTVGFIcjl1eGswbUdVVzJ6OFJIWmZ2?=
 =?utf-8?B?Rlh2YUVMS1djSzN6VnVWcWVpWjN3YisvNzJPZFl5dkgvQ0RsNEFBZmhQYndT?=
 =?utf-8?B?L0xNbDZtcFNnYXRJN0xCWWNUVkVuRGpEVXo3K29QMXB5WU9VcWJrNHVtbnk5?=
 =?utf-8?B?SlpQdXllWGExNE85NGxFTUFuWFJPMWF0cnZLYXpOeS9YbGV2NUh3aXJybUZJ?=
 =?utf-8?B?Q05FcWg5VXFTbnZkMGNDWXg0Um5mY0JvVWtjZW9WZVhvdkkyQnV5NkpEWFdF?=
 =?utf-8?B?TS9jYnRUN0F2VDBVdmxaOWJveEl1eG1VOW8vNVpvamNETU5PTVhneFYvZXVw?=
 =?utf-8?B?UVNwUE9WTk9TdVVad1kxM2lnVHNBWVp6ZkpsYk5BcXQwUDVxNlBBZnJ1TmRz?=
 =?utf-8?B?MHB1YWxrZEVhd2ErSEw5ZFpuZlR1U0JQdEl1SmJHNlhVYU1hMFVrMkVxUFFw?=
 =?utf-8?B?MmlYeVd4N2ovQzRGUUJqbm1SRlMrd2F0RjRpeE9SdXhpUHNBeVZ0bDVwQ2Ez?=
 =?utf-8?B?TkxYZXFUTkhzV3huY0lvSGtya0J6T2NVR1BjaDZMYnNpM29laEp3WE9pdlpQ?=
 =?utf-8?B?YnJwS3gxRUFrSjRoMmpJQnd1QWk1RVE5cXlscUFhVDErS1NGcm81UFpUaG43?=
 =?utf-8?B?ZlFNZzhnTFR3cmRER1kvMkROOXNSK1puTitzdFZVMHo0QlRaaEpUMjF4R1Ju?=
 =?utf-8?B?MDljWC9WRUN1b3lHVGJCRDBpSVR3eEhMU2JwU1paSGdrTUlPSkY4UldvWHBP?=
 =?utf-8?B?M1Vsc2g5R3pxL2VNaWRnZ1FPZTM2eUcxVmhsWklKYms0Vmh5L0JBS1BQcXMz?=
 =?utf-8?B?b1BRQTZFbjE0cHUxK2RySGd0MzdKaWRUK1dVL2F1MEJJNlpQOUpSdUFHRUty?=
 =?utf-8?B?cTdHejB0RnRCL3hkWVJXSmZ2a3M3YTZvSTR5cGJwOHJudEVvbEplTmg5Z1Ba?=
 =?utf-8?B?bkduRDNPdGxDM3lNNVA1L2syYk0zc1Z2L3RMTzlOYlZaeDA2YndLZlBwLzNy?=
 =?utf-8?B?UUNGZk1tbVVnazQ0aUEyRUNYdkNMbW5DUGlVVGdmN2xLcy9UNGVVSDZubDJ2?=
 =?utf-8?B?eld3Zi9CRHIvbkRhSnJYcldIUXNjcWFNNlhDSHRMQk5nVGhlbFR3SExBY2Nr?=
 =?utf-8?B?L1I0WmRsMGlDSjFNMHlmTlFuVjBRczVJZ1ZzREc3aFZRbXBjaEc4OVF3cDVs?=
 =?utf-8?B?SXZZZ0NyNE41a1JhaXdOWFc2Mk9kRkZUdmNselNEYlJMcnFnR28wUkh3czlG?=
 =?utf-8?B?T2g2RUU2TmtSbWpwSmcrTVBoS2dmV2kyWnZzMUxwVE9JNm5hWWJrQ1dnKzM2?=
 =?utf-8?B?N2ZGVlJVNDJYK3h5YTdFcmY1c3E2T3M4TXcvK1pZMGZXU3A4M29JTzZNdnpU?=
 =?utf-8?B?b0dTcTROVXJRc0p6Uk82SGUxVGs4SDVBbTRDc09SMjRYeGYzNzhkQVJ1K2p1?=
 =?utf-8?B?NUpsQ3dMZ1RTUWljS1Uyc2Rnb3M3T08zVVJuQmF2VjFuMVM5cEw4dW00Tm9r?=
 =?utf-8?B?NEw5QjgyZ2hENkl3RUpWdGg4ZDhpbmlGOXhBSjZrazFyL0REak9WZnJoTXdx?=
 =?utf-8?B?blN0cnZSMXdUaFdlbFFiTkM4M0tUeFFIS0VRWWE4aXdHS0xlVGZ0RlRjQW1L?=
 =?utf-8?B?TE9oL3p5QTNWRHVsdjY1ODlXSU5qeS93SjNGRkliODg4UHM2WjVQV2VyZUNz?=
 =?utf-8?B?ajBWY2xuYzc2NnB2ZnROcWtIYjlHNVJRQUFvVFRDcUordnpGT1dpOVloZHFa?=
 =?utf-8?B?TS83UHVna09adDE2WVpRY09QeGh6bWxhOFYveEFBdmQ1OUVPSzM5Tm5uL2tP?=
 =?utf-8?B?RVEvTkxhME9SUFNBbjRNRWFTOTd0WjlRWG43Wm0yZ1g4bkd0Vkt5UT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7361bbe5-c8d5-452d-9867-08df0e494732
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 08:06:39.8759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 59ySRkeGY1gFJ2qhngm0inA5KMUaLW8NFdhxVY0T4YRueR+0d1Tzl5ZO2zEI72LFLwVgIYBIf/PkycPsTfW91jso9CYwDArAK9tZOr26cGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB14153

SGkgR2VlcnQsDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHZWVy
dCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTZW50OiAwOSBTZXB0ZW1i
ZXIgMjAyNiAwODo0NA0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDEzLzEzXSBhcm02NDogZHRz
OiByZW5lc2FzOiBBZGQgTFZEUyBvdmVybGF5IGZvciBSWi9HM0wgU01BUkMgRVZLIHdpdGggSVRF
NjI2Mw0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFdlZCwgOSBTZXB0IDIwMjYgYXQgMDQ6NTcs
IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiBGcm9t
OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPiBPbiBXZWQsIDI2IEF1
ZyAyMDI2DQo+ID4gPiBhdCAxOTo0OSwgQmlqdSA8YmlqdS5kYXMuYXVAZ21haWwuY29tPiB3cm90
ZToNCj4gPiA+ID4gQWRkIGEgRGV2aWNlIFRyZWUgb3ZlcmxheSAocjlhMDhnMDQ2bDQ4LXNtYXJj
LWx2ZHMtaXRlNjI2My5kdHNvKQ0KPiA+ID4gPiBmb3IgdGhlIFJaL0czTCAoUjlBMDhHMDQ2KSBT
TUFSQyBFVksgYm9hcmQgdG8gc3VwcG9ydCBMVkRTLXRvLUhETUkNCj4gPiA+ID4gb3V0cHV0IHZp
YSB0aGUgSVRFIDYyNjMgSERNSSB0cmFuc21pdHRlci4NCj4gPiA+ID4NCj4gPiA+ID4gVGhlIG92
ZXJsYXkgZW5hYmxlcyB0aGUgTFZEUyBjb250cm9sbGVyIGFuZCB0aGUgZGlzcGxheSB1bml0DQo+
ID4gPiA+IChEVS9MQ0RDKSwgYW5kIGNvbmZpZ3VyZXMgdGhlIElURTYyNjMgb24gSTJDMi4NCj4g
PiA+ID4NCj4gPiA+ID4gVXBkYXRlIHRoZSBNYWtlZmlsZSB0byBidWlsZCB0aGUgb3ZlcmxheSBh
cyBib3RoIGEgc3RhbmRhbG9uZQ0KPiA+ID4gPiAuZHRibyBhbmQgYSBjb21wb3NpdGUgLmR0YiAo
YmFzZSBEVEIgKyBvdmVybGF5KS4NCj4gPiA+ID4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQmlq
dSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiANCj4gPiA+ID4gLS0tIC9kZXYv
bnVsbA0KPiA+ID4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDhnMDQ2
bDQ4LXNtYXJjLWx2ZHMtaXRlNjI2My4NCj4gPiA+ID4gKysrIGR0c28NCj4gDQo+ID4gPiA+ICsm
ey99IHsNCj4gPiA+ID4gKyAgICAgICBsdmRzLXRvLWhkbWktb3V0IHsNCj4gPiA+ID4gKyAgICAg
ICAgICAgICAgIGNvbXBhdGlibGUgPSAiaGRtaS1jb25uZWN0b3IiOw0KPiA+ID4gPiArICAgICAg
ICAgICAgICAgdHlwZSA9ICJkIjsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICAgICAgICAgICAg
cG9ydCB7DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGx2ZHNfdG9faGRtaV9jb25f
b3V0OiBlbmRwb2ludCB7DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cmVtb3RlLWVuZHBvaW50ID0gPCZpdDYyNjNfb3V0PjsNCj4gPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgfTsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgIH07DQo+ID4gPg0KPiA+ID4gTm8g
RERDPw0KPiA+DQo+ID4gVGhlIGRyaXZlciB1c2VzIHBhcmVudCBpMmMgYnVzIGFzIGRkYy1pMmMt
YnVzLiBUaGF0IGlzIHRoZSByZWFzb24gbm90IGFkZGVkLg0KPiANCj4gTmVhdCB0cmljay4gRG8g
eW91IGtub3cgd2hlcmUgdGhhdCBpcyBoYW5kbGVkPyBJIGNvdWxkbid0IGZpbmQgaXQuDQoNCmh0
dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y3LjMtcmMxL3NvdXJjZS9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL2l0ZS1pdDYyNjMuYyNMNTI3DQoNCkNoZWVycywNCkJpanUNCg==
