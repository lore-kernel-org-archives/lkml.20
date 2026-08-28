Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013009.outbound.protection.outlook.com [52.101.72.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFD5369217;
	Fri, 28 Aug 2026 16:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933616; cv=fail; b=RzywiKOacPBr10NrRj6U+mC+HhT7E43Bv6x51f6EwzWR0z/H20GI3mpgmT7vCqkbHR3LCjBBNpB2fatJR8oex6C1jyTe3UUnBzkhk5gwXam4gCOF7h2kZtWKpjXUOBke9opF9lRPsrJswKl9LF9L3nZc23IwjN9doAASZV1innQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933616; c=relaxed/simple;
	bh=YbhUIMonwNPVBH4nlx2brgITEB8cNTxn1TfSuS86POI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QtWlG8VemvpRTH5vfvqwS07mGJ0oVoLDYQMuI9SfyCyhIKzFMF0DMQCEbnjVbjepokFJxAs3TVd/29uSYWyOHLPJx4RzuIKzvcwwg2rOAtlFLlKD5NJoNUGivVWKHqGIXiYcxP0V/O9Fe0v3NDh1TlWXVre+ulDKOB3AzImPKfc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PQTWzubq; arc=fail smtp.client-ip=52.101.72.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PQTWzubq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sdGhd8Xh0RnIBdht1mHEpj0nGHktC6ebUVzBMKYCHwRw7axqbweE31CZXPWnYb0HnODwBE264AoTfjZTsznTPeylZv3f4RRBUesAm1fi6pRo8V0E/GFormkCySBg8UQCicUi7rn+Kj/n84XLZs8WHhg8YgNa7l81IBfWBrg6oWv/zesKyfIlyfS2umxmnrEgsS1kQWcT4cJlPpOA67WIvMyZrY5I1Kgqv8FeMcpCvAbTk4d6R98Iv3FelLBqynxGIuqROj68e6tGeAyfwutpv1LRjLPF3QCymHFYLgzdrDwMYswzPH3uha84ozjApc+O6uismEEoXaFrvK7fgpPFsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YbhUIMonwNPVBH4nlx2brgITEB8cNTxn1TfSuS86POI=;
 b=ynXu8Cr6S/LN7W6uxv2xsyoC5TlO1Os1lo1+OS9xXCCSzrNJxs2+U6P5/U3ecd94DH537b3uoxzctEM/d4fJ8OejyAyxJ4WJg+omLg91aZABjEq0FAr6B9AkuisEEI5ljTWoRWT15Ts+UnOFXwGYdSkodZd4OU5yT6vaIq+irouEmkXa/2dlgIvD/at3osPLjfZYjb82KRhQmvNDF9bMM78icVz64YlN4be3ZBW+u918TkSrnO2PiIVl+PkJzYM7V/2n5DRmA+aNdoyfTDuZTT0zy/cK+GLphOwlxyoVQiyIhdOgzEy/PtllSSl/5VFgBFK5whg+EXrpgXjPFPJ7iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YbhUIMonwNPVBH4nlx2brgITEB8cNTxn1TfSuS86POI=;
 b=PQTWzubq4e5Qo6ras+hKKdVQAeXrAIxRCzxBufkblqDNc4maKlHyj1TEu1TRoABPSRSBmsmPI3/J1JceV/hZCuJ85WWrCG4ONdbMXfwjEu4AdVdFKY/LtNgDcvx3KrMVp8FGH5VxD0BQVyFwp07AmRaoXZsn74IgKHhDUBm9l7+Yrs1Tcbpi/qT5jtQkVRoDTTpyGbeoVJAYFqE2/xLkUW5RkgZZRqeFxatuINg7PiK/dGx41hdexnk7fnx7d+73JCfnnzmCHz5SQrxQ5zaQCWYgQSPjf3jBGGKbdHsxAmVC2s1eTSIf+3EyXgRi0UFNgPMmc95q6Jzs6tIJD7FGOg==
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::9)
 by AM0PR04MB12122.eurprd04.prod.outlook.com (2603:10a6:20b:747::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 16:13:32 +0000
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0]) by AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0%6]) with mapi id 15.21.0360.006; Fri, 28 Aug 2026
 16:13:31 +0000
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "broonie@kernel.org" <broonie@kernel.org>,
	"lee@kernel.org" <lee@kernel.org>, Frank Li <frank.li@nxp.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>
CC: Vikash Bansal <vikash.bansal@nxp.com>, Priyanka Jain
	<priyanka.jain@nxp.com>, Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: RE: [EXT] Re: [PATCH v16 4/8] mfd: p3h2x4x: Add driver for NXP
 P3H2x4x i3c hub and on-die regulator
Thread-Topic: [EXT] Re: [PATCH v16 4/8] mfd: p3h2x4x: Add driver for NXP
 P3H2x4x i3c hub and on-die regulator
Thread-Index: AQHdNUcOH4x/3jOMuUuWRgQstv9oGbaxq+0AgAH2kqA=
Date: Fri, 28 Aug 2026 16:13:30 +0000
Message-ID:
 <AS4PR04MB93626CB21700033FA2DD8AF8FBAC2@AS4PR04MB9362.eurprd04.prod.outlook.com>
References: <20260826103819.1614843-1-lakshay.piplani@nxp.com>
 <20260826103819.1614843-5-lakshay.piplani@nxp.com>
 <43e67e46-f93e-4cad-81c6-d489663aa7c0@kernel.org>
In-Reply-To: <43e67e46-f93e-4cad-81c6-d489663aa7c0@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-08-28T16:01:46.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9362:EE_|AM0PR04MB12122:EE_
x-ms-office365-filtering-correlation-id: 8af3a61a-4e12-401d-e9b1-08df051f4d02
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|23010399003|376014|7416014|366016|1800799024|6133799003|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003|921020|38070700021;
x-microsoft-antispam-message-info:
 GzGZerf4+9uYH3YxiTHZ6XpJozyF4axGS+w1cEeB4CELPSyODyuuPJYgflic0x0PPvKAKRnXBy5icZYZdg6fAZ0yY2kPsyfyva1MdO+i+71GWpAo9Hr4PxJOhCekz8xi3/uvzxWxIQj3KYOYrzZrHHuoirLkLtv3BO1JLubfg5pdOCraC0Vb1139zwgvk+RYKeEl1aHZxZU9UsiVE1VWJYpwtrtrQ1aM+cUYvEpmbgtjW1jRhihmvYsLlVW4zVY1V8iYNBRu7ffrroi0ykK9hW+KtWPFWMhxodG2WAPV+PK+uQE2rNFjB6I9FnAk/08Ge6Qmi7G6LMrPuNcfIGzPLTC5fBC7h7tX3CqkkVgQJO+VRf4PymqCEdPaTYXHD9Pw3VZylLQpDMM54UzEA7vswTOS+8txxIxHkruqt9jrFLP4GGNgwkT4RtaZrcd1HeE7vhtys04GG7HdiNvMqYilkiCh0u2RNkNT/80KwLP5Oz0nkCciAwUdg32VsO4yH4ZlPgLSBuJqjOat0k0Rh4rl8RTSH7WQEKg1dsc4a8tu++SZ62JBb35aDTIEV73+p/icfuKP3VrfawlzAupaWMkHDu45G/aVdwHjlp9pJ6beEghk4Ophz5vE6jZCjJs2DRkCM+pPegXse16cEpjBgkoFSspYoMRGl/cdruEXwt63vTWtkXc2dRhHwoFJwO7cx/hO67x8ngxGqHUP8tidfGJ7DOwrrFooO+XraSPRJ5tKNc0ld0DIbvuT8eW69/jo27cR
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9362.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(7416014)(366016)(1800799024)(6133799003)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZllpS2pYODUzRGNpU1p5SFJFWSt3RnBGbDlTOURBYmJlajNDVWlSZzRqd3Rv?=
 =?utf-8?B?THpxVEhueStIR1pGRzRpdVRUT0d1V3FocmJ0Z2xtSk9uR3l0OWZRd3lTYVps?=
 =?utf-8?B?RTdSN3gzYklEU0tPTUNhM3RUUTBia01WNDZ1Y0p3Q1FaTSt3dXNidmRPZVNx?=
 =?utf-8?B?bG9DZEEyemNTNitES1Brb0xyV1BVTFg1R2dkaVVwQ0E0VE4xR0FidlJ6L29W?=
 =?utf-8?B?eUwrZ3U3RHAvSlNIWDRXR2Z5emtRNUxGckJHSjZlamtaU3JvUFVkcXJobnIx?=
 =?utf-8?B?N0YveExwV0lkVmR6dUl3cUh6T0NrMUNQUldUaDQ4V2JMZ25JbmtwUk9LL3U3?=
 =?utf-8?B?SVBoL25yUWt0SkNVV2RJVXhoK0RRU2g1M1lQbERiOE5nNytNRit4QWdVRk5W?=
 =?utf-8?B?L05FM1ViMmw4VEhIcExFbEQrRU11TmxqVXJkWDdudWtqOE5oVlErVmlscTlm?=
 =?utf-8?B?ay82cFUySHpWbXhmcDYyUUt6cnI3YU9CTWFzTS9jZytkVDNCV1hkTlpkeXF5?=
 =?utf-8?B?MGRuNDJuR0VoemswbU9ZRXJYdkNUNEx6WUhXRFpaUmJvSDJiU1AvV1BJYmFw?=
 =?utf-8?B?RkNKTmRBZXliSm9SSG0xd3dpbE5wRWcxUlZsSDFsUTZCR1ZZM0loUGw0N3hV?=
 =?utf-8?B?Qkx2WTgreGx5R2h5SHhqbThySUpWY3hmZkQ2c3VmdkhHTzJ3RzVvZ1JWUklh?=
 =?utf-8?B?dUxUTnBxYkRrakRxMVE3THJHR1pQRHFHSStHZks1aEx1WjdLdFlycVpITDZG?=
 =?utf-8?B?Y2JtOFpBNXkrVU5DL240b0U3RGlUOFRNMzNLdFNWNjRpNGlZcURGYkZ0S3JJ?=
 =?utf-8?B?cTVOVlVnMktrOXhpTDJ3TzBNZlhBdDFzOVNkaWg4ek9HQUFrTXd3eVR1N0ZS?=
 =?utf-8?B?b1lzLzVVb1hZU3hoTFdKb0JIbTlONm0zQWVjU1lONjA4SjI4SCtOdjE1Vy9M?=
 =?utf-8?B?UjJsQW5MdXJSSC9IQU1hb1Bldm9CM1I4endvQkxtRnh1VVdjUnNZTFowVW94?=
 =?utf-8?B?MEZlcXhkS3BNNXBveGNkeXpHWjl0Y0VyWHNVL3ZWM3hKRFU1R3BiRTNTZGV3?=
 =?utf-8?B?Rnp2bXdEb0tRd21OQ0xWZUJ3YTBOTVp3YVlpYWszQTZ0em5iTW5tUy9CdWQv?=
 =?utf-8?B?TXNiejRvTFNKQzl6WnVwanFmbUE4MnVYVzR3VkRadzNxTGxpN1FFTFBGY0JH?=
 =?utf-8?B?NHVzcnVBUjhKQ2hBYTNVM0p3ZjZaeTJPZXlKdTJKMVdmYjR0Z3hNU2QxdUJw?=
 =?utf-8?B?MWpRT3FTSUh3NnhNaVJIUjRaMjkwRkpRVzZYMFJDYktydHpEZmJtWEJGNXhv?=
 =?utf-8?B?dkdnR3RmaUplazNmMTlvV1BpNCtJMERhSnA1Z0RmUzNseFhKVHRoYVJOekYw?=
 =?utf-8?B?SWJneWlVd2NUVlA4MGtZZlYzRDJhZld0K04vWnlHM3FuTHVoMC9UaDA2ZlRn?=
 =?utf-8?B?SWI1RjBQL1BVWGUwblNlcXI5U2c3bWdDbHV5UHNsV2hxTkhaLzhkZW1pZ1RE?=
 =?utf-8?B?K0hNR1Y4MnlyWjc4S3pYR21LbGJOSG4rdUJmTndoSWVZK3JzaEhJUlJmTjU0?=
 =?utf-8?B?UW11eExoMHlQcFVLOEtZYlpLTFVoTEY1bmkzaXZtUFVTMjNyb2dHMFFqZXlm?=
 =?utf-8?B?aGJoMFh3QXE0djVmSEhqKy9CSG03a20xajJvRk9lYmg2REpJcTYxUjYyTThP?=
 =?utf-8?B?cWowYmx1dUJNbi9udm10WHFsWFg2TGVaNHROODJXckV6YkRISFh1NHhZSEpN?=
 =?utf-8?B?dlJlcmhIME53REZvYlhTQ0VBR0dLTEx2cDNGNDFnMlpUNEc4cXd6RTNIMHVI?=
 =?utf-8?B?RDFyM0Mwdy9henlvRUo0aC84UStQMFQzUWJyTWYxd3NtUWxwY2pzWkJONzI2?=
 =?utf-8?B?c3JYZ1FwQ29hdmJGdVFoblZXODRSQ0NhV3E4dkwxVE96dkYySmdDZVlXMTd0?=
 =?utf-8?B?cCtPZm9xMmtoRXNJRWhyeUROQ0JOY3FBQWoxeGg5WVpHUUtwK1B3U1BLR3ZJ?=
 =?utf-8?B?QkhJV0tkMkpIY1lZOWQrZnQyRVlkRFJmSVhicUhPWmpTZEVldGRWbVRBbENw?=
 =?utf-8?B?ajI0anNnQTdKUW02YjU1cUd3VVdJUG1aaWpnTjFvL2ZodGFFN1Y5ZXBrRkgv?=
 =?utf-8?B?ZGk3VmhkTUgwcTFXa0FOVmpkbzV5dWc5MUM0OE9TaUlkYkZSNTlvcUtsYUc0?=
 =?utf-8?B?ZkhRbTluZ3lXWEpFa3ZybGNCd2E5emxHdGd1aWR4US9uVFRhdkdmNzYzcU91?=
 =?utf-8?B?U3VaY0xsaXFYbjRRSzRhTjg0QlpTSzdrOTdVNmxWZmRiUEJOV24zbWxXY0lB?=
 =?utf-8?B?QWh3WndZSjV4MWE5VFNSM3lUY1dBOVh4Wmkrem9jaFkrRURETEx1dz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9362.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8af3a61a-4e12-401d-e9b1-08df051f4d02
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2026 16:13:30.3767
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CmgrKPwY/tNU3KBBYDRtknCXV3Y5cNqS3SGDuhmD5OZ5nCkp+eDl30zX1YN+LMFQ+HicLpZCOFL+RIVmM4UmYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12122

SGkgS3J6eXN6dG9mLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCj4gPiArc3RhdGljIGNv
bnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgcDNoMng0eF9pMmNfb2ZfbWF0Y2hbXSA9IHsNCj4gPiAr
ICAgICB7IC5jb21wYXRpYmxlID0gIm54cCxwM2gyNDQwIiwgfSwNCj4gPiArICAgICB7IC5jb21w
YXRpYmxlID0gIm54cCxwM2gyNDQxIiwgfSwNCj4gPiArICAgICB7IC5jb21wYXRpYmxlID0gIm54
cCxwM2gyODQwIiwgfSwNCj4gPiArICAgICB7IC5jb21wYXRpYmxlID0gIm54cCxwM2gyODQxIiwg
fSwNCj4NCj4gU28gZGV2aWNlcyBhcmUgZnVsbHkgY29tcGF0aWJsZT8gV2h5IGlzbid0IHRoaXMg
ZXhwcmVzc2VkIGluIHRoZSBiaW5kaW5nPyBPcg0KPiBleHBsYWluZWQgaW4gdGhlIGNvbW1pdCBt
c2c/DQo+DQoNClllcywgZnJvbSB0aGlzIGRyaXZlcidzIHBvaW50IG9mIHZpZXcuIEFsbCBmb3Vy
IHNoYXJlIHRoZSByZWdpc3Rlcg0KaW50ZXJmYWNlIHVzZWQgYnkgdGhlIGRyaXZlcjsgdGhlIHBv
cnQgY291bnQgaXMgcmVhZCBhdCBydW50aW1lIGZyb20NCkRFVl9DQVBBQi4gVGhlIHgwL3gxIHZh
cmlhbnRzIGRpZmZlciBpbiB0aGVpciBkZWZhdWx0L2RlYnVnIHBvd2VyLXVwDQpjb25maWd1cmF0
aW9uLCBhbmQgdGhlIGRyaXZlciBhcHBsaWVzIHRoZSBEVCBjb25maWd1cmF0aW9uIGR1cmluZyBw
cm9iZS4NCg0KSSB3aWxsIGV4cGxhaW4gdGhpcyBpbiB0aGUgYmluZGluZyBkZXNjcmlwdGlvbiBh
bmQgdGhlIGNvbW1pdCBtZXNzYWdlLg0KDQpUaGFua3MNCkxha3NoYXkNCg0KTlhQIENvbmZpZGVu
dGlhbA0K
