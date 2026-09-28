Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023108.outbound.protection.outlook.com [52.101.127.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EEF360ED0;
	Mon, 28 Sep 2026 05:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790573754; cv=fail; b=UtaifdWoj9p5IIl73r1+actueHigoqRoIGrs4cKF1gc1r1aWcQvUiOUqvt0UrP2QP7UeVAORhUwAUaI+sn4lklWBfQqzQaOelH8cM5u/RD+p4qg+FYAMieENHdQZVutwEhLDyGxWeOkTwPGfNNYKq6JiYALYxxBN+C+g1QmtLtw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790573754; c=relaxed/simple;
	bh=ExHsOCdhqRtM0EGVum9pvLffwO0/mX7lHRfDgzf+oQQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=caJLEhPEf0lYU/pR68qa9LjSq/t7Eo6IgkY9gW15vnoio4vxFcdRZpYvdJ/AZs5JzVqS9Ep3prNjgEwkKK7QYOMXzTfYxXSjP8sn9BlMRF9WIn/pEFFcxZZnk5wpYtbhALfaU1tF1nhx9Ktc9jN3vXeEw1g0uyaGH0+EZDik8Fg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ssj5Dw+6XJjuqxPzTbySDOvXToMnEh9BcKtNhcMwDoa3sp3TaPZSdvkVuwBU2md2viPJTY3zQfhJnh/xZeFfxcWeyzmqWJdTY7QASjQuq55FW4s95H3KXkTeqRzmhXVniwQiiR+9iRgXgGt2BJe5OOktL5VpjVxpiWLkGIrn+KZr3Aagn3Hpd/7adcrl9jO+EqROawpVzovnVN2q+qwvniHEQp148chPM4NCKNdSKerHTWzlaMHE+37rlUv/42rok0t+oulh/DOCztDn++x/2kQPC8HXYNaj0CginAohcmWYbzvTu985754FDPD0KzSKqIjR8qQs8A8UivdlzJTw1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ExHsOCdhqRtM0EGVum9pvLffwO0/mX7lHRfDgzf+oQQ=;
 b=Xdd+6jsEt511P6gHqhMW+aGsaJnC8ST9pNOKtHd0MDKvhNcWiTcbbClm6v01igIVw6wtUoyvLrc0vS7dQSNifkDDP686EGlWwg+IoB5JDJhIgo/vEqTqcBmP1ZyUVyyEcBHd2NeiCjc71uLbQ3kAKjcS3gxq2NIIFMfZKekHHw0IpPA4fvP9RGLjjjDw8bc9OTj2ZrtHppfCe1AHrwB22XurSEflGJ7Vzpsappa0K91Z1sGZuEt5Oqke4LA/oexRt/HSrrd9f+N99B7DCnM7ZAlOPQYU5n0JKwlgmo11Y/H7NsFJCFEfLZj0qsyfIHfqX966GEMyKje7Kuw7WUNL9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from KUYPR06MB8673.apcprd06.prod.outlook.com (2603:1096:d10:8b::5)
 by KL1PR06MB6905.apcprd06.prod.outlook.com (2603:1096:820:12a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 05:35:47 +0000
Received: from KUYPR06MB8673.apcprd06.prod.outlook.com
 ([fe80::2b5f:4b04:8fc6:747c]) by KUYPR06MB8673.apcprd06.prod.outlook.com
 ([fe80::2b5f:4b04:8fc6:747c%3]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 05:35:47 +0000
From: =?gb2312?B?Sm9ha2ltICBaaGFuZyAo1cXHv8fsKQ==?= <joakim.zhang@cixtech.com>
To: =?gb2312?B?Sm9ha2ltICBaaGFuZyAo1cXHv8fsKQ==?= <joakim.zhang@cixtech.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com"
	<tiwai@suse.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
CC: cix-kernel-upstream <cix-kernel-upstream@cixtech.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 0/4] ASoC: Add Cadence I2S-SC and I2S-MC controller
 support
Thread-Topic: [PATCH 0/4] ASoC: Add Cadence I2S-SC and I2S-MC controller
 support
Thread-Index: AQHdSoSUZk9J7FeHtE6bVdPiAf3V9bbjgA7A
Date: Mon, 28 Sep 2026 05:35:47 +0000
Message-ID:
 <KUYPR06MB86737353932D060B975FE4D1828D2@KUYPR06MB8673.apcprd06.prod.outlook.com>
References: <20260922112134.4167305-1-joakim.zhang@cixtech.com>
In-Reply-To: <20260922112134.4167305-1-joakim.zhang@cixtech.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KUYPR06MB8673:EE_|KL1PR06MB6905:EE_
x-ms-office365-filtering-correlation-id: 2249e992-9ca6-47bb-3162-08df1d22591e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|38070700021|56012099006|10067099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info:
 2qx5QePi/0mx+KUIYSoPtUSD21VAlP9hWhmIkHLMLKCwtG0X/y5BpwldHOnsFvhsEVVVJIp/fOPN1S1zr941RiIMr0NSMx9cFu1UBEjKbPuR0/4IOC0fczz1zzwtpgcmApYofHLK90u3lAQxAGrlyH7vLgDhYOLLOtbT/CJSMgg609K9Gd16ioSr5JZJZMDsnEzj2NdlkfKHK/KusAhpPf0oaRu1fIPPIJVE3XztFQoD2EZTqk/L1sRhZG4J+GkPUCdLvN96A6fBZfo9wTkVnBg+qQDCqxR4bpdgFwU7GTxYK0oWVkq6HI2vsDYjA2QgenEmYUk8nTkUKiEdTeydo+v/9C0Y9fzuzrWUncpThYVL0uXv6pBYdILqqU8DSyVXS0Ep3UwnDSyBc5yakW6eiXjwaaOi3RO/1XCfraWBrm1JpkqL6rkjw8oGqwyQhMOPgbe1pzTVZEG2ASHowkzXeq289q/03sOWRHCZV89gKOMcqX7YOjypK3M8XoMgq2PG2gxtNXzX5nPVZRPzahGx8i0xSAe6ajyZv8A18RdvQnq3F4h1NmP7CRXoMxT34aGuucOIkBpoTA/5M+VceitEZXuMBHBUMH6fUA4hvRH2udAmQTjdX2P0LtghYEMhzLuAOt4NWQUcuyprJLm5cORNxaFDLXO5Xo5hyv/IgirRU8Rggj1Ws58lQ4RM9Jsq7+ubh36F9BiHlplHPs//yDwplQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KUYPR06MB8673.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(38070700021)(56012099006)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?Q0QycndqMmdDbGloN3E5SHNzWDJNSzNlcEJKaVJzSjFZNXRGRnAxSFR0czh0?=
 =?gb2312?B?OUlMQ09OR2xiaUlrK21HUkRnWHFiNFZqT2FKenJrR0R5WEpnQVJndEZWdHhh?=
 =?gb2312?B?blk1RHNMYjZxUTFIZ0FzcFQ1eGViRDJVS2xROHpnVCt1OHJMQUZkbkdIQ1d1?=
 =?gb2312?B?c2pwa1AxYUlUQU9CRlY0QTB5UW1jNTZKb2ZmTUg3M0NzcC9JM2RBdnJhaEtT?=
 =?gb2312?B?MjhoUnpwSkhreGM4WXRJK1J4MmFaRXVYb05mSVJGMThlZEFqaEczQkJ5WEFa?=
 =?gb2312?B?SGNSZlExMkRIbUZqNENwWnN2NVBWc1dGb3JXMzYyNHZBaGNHazZITDJKK1Vh?=
 =?gb2312?B?ZGd4OHlGM0ZMQnFBWTdRY0t5NW15ZmhIZDJKelVOSDRROUk1VjRzeFdwTjNi?=
 =?gb2312?B?WUZVREQzcytQa1JvMzFvY0MrLzlweCs0SEUxZTM0K3kwZm1UUnVaNU5zRG9V?=
 =?gb2312?B?dFRyODJvTlJBWk5ydTUvU1YwZVc5Ujd6MTJ5UjVhL1lJb2tKai9xcnRvdlcy?=
 =?gb2312?B?ck4yWWlDUWVHWWZqN0RGNmkrR0VCQ05oc0xhV0RqQTA1b1htT2xjN3BhdmM0?=
 =?gb2312?B?N0tvWEtRbzdnRERlSXg5bXF5UXp5VkVHc1o3Y1Y1OFRCT3lBb2t2c0tvcHZr?=
 =?gb2312?B?b0ZUVkZHL29Od3Uzd2ZlYzl6RXBOcVJjR29IeWp2RTFNWlZZNFI5bENtNURG?=
 =?gb2312?B?QlNmTTgrKzlUNGI5UjBUOWpaa2JFZDNUZmRwMWVJVGRjakpuQVZTZkx3SkFN?=
 =?gb2312?B?emZxUi8zd0ZWRUhUSVhsR25qOEZZT1g1SCsxL3JhaG9sSDk2MGlwV2tzVXhm?=
 =?gb2312?B?UklHOHFFQUE0RUUyQUxmV29pbFVjYURlU1crRU9Ua0F3OGV1UDRkajhkSnY4?=
 =?gb2312?B?R21VRmJ0Q1hFcUpUNlhCaDl2b2s1KzJITHJrNHNKdDVjTG91Q3Rrakt4WDYv?=
 =?gb2312?B?S3JqSURXY1Y0bWdPa3dKTE9xa3N1NjYxOGtXU2YxblpvQ1lFV09jQ0RnUnFj?=
 =?gb2312?B?Y1RqTVBpS2U3dnM5VWdPZDlQN21LSnprNnN3U1g3MEcvL1RUWE52dGVYSDRD?=
 =?gb2312?B?c0FodTJmTk5CQnZtVlBvZVl3QTVhNi9PMFA5SlVvZ09zY052MFdKTHRGeVZN?=
 =?gb2312?B?OFVySDRSOEs2eVFxYnU2UHR6K3htdm1iajdZNHBITmZsMERBU21pNFRkTUdn?=
 =?gb2312?B?NnZIVWswUURWVDBYUE5wVUE2YXJ0K01WWk12NjA1V2pZQzBFVDZGRFo2eW9x?=
 =?gb2312?B?N0JLNEVzNXVDTE45My9kWEF2eVBycGt6MmludUczOHo2aVVpZWFMQVpVbmlZ?=
 =?gb2312?B?am5GTUhRSkRHVU4rcU1nVkc4Nk4xVkRob0M1T3B0R1BKUFFBcGR3L2orOWRE?=
 =?gb2312?B?MjBWLzJlajNFc21OdFl1MEkzY01sM3dLK1FVRVRKZVdsclV6bFFSMXBvMzB6?=
 =?gb2312?B?dk1oNjc2eEs1dldQa09GNWhQL2V1bHFkOWtaZnN4cFhGckd1bnVYQTB5bG9Z?=
 =?gb2312?B?VThQcHlWY3h5V0ZSbkVGaENSSFZmWWVDMXdxTktRVnVOZ21IYUNkZ2FMTXdn?=
 =?gb2312?B?WVlSU3dseWRoamNYVW5VSisxSzRXbTRFQzNEdEtyK0hjRThKM2ducVNaV0lK?=
 =?gb2312?B?Ym1USFQyQ3JQendSaE1hRHFtQ1p3YkRMNFBzeXJqUzVTMXZ4YVJNZlZJVXVt?=
 =?gb2312?B?SzhxZ3c2VXBHbjY2OWJFNWdEUlVpemJGcU0vYVF5bGpIVnhrOWh2b1g5b3dL?=
 =?gb2312?B?UjFvWkdyU0xRc1BSUGdHeXZ3cEFFTVlDNnNjTm5VdFB3bWhoR2pTWW9MR1Az?=
 =?gb2312?B?S2lBZFpZUVg1Znd2eUgzVUZpVlJSOWE1bzJoYTltZXZSQVhmQ0RaNUNqU3Vp?=
 =?gb2312?B?L1pJZ3hWeWRSTFFyZmxxZmpDWG5KdUxSRlhIQzlscnpWQTNWRSttOUxjQUll?=
 =?gb2312?B?U3lsd3hvSWJIaGdkSnkwV3Avemd6UVRmTmxjVTdCN3NjNHNDRklKaUpYVXJY?=
 =?gb2312?B?WUpqb1RDZ01pdlVSOXgzL3FvZzQ5L0o1WXBlTWRydE1wYVE1SkJxcHdaVkhG?=
 =?gb2312?B?UWk3MjJONnhzVFB5VGVDYU1icjBweUl6ZUh6MWF5eTh1VTcvQm51b3hXT3dD?=
 =?gb2312?B?YzNsU0wxU3ErVjI2M1hxTDhUR0pxWWFHcSsvM0I5SGJQVU5wSEovdDdMNjlw?=
 =?gb2312?B?VXd2ZEU5NHZPWlAySmVmaDhRaDZhd3pWQUhwYlRLSWdBK2pWeU11N01ZcTR1?=
 =?gb2312?B?VW9qUFBHclUrSkRzNkVBM0oySm5GU245cEpLSm9ERVpWa2RXM01oa0lFYTd3?=
 =?gb2312?B?NnphQkVIanZRS3V1cExqakVkUnNsWjVxSlV4d1U0UUoySUErbFBjdz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2249e992-9ca6-47bb-3162-08df1d22591e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2026 05:35:47.0858
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vJaCXkr7bjDPle5f0CUqc6du2Yk785ICZ+0QYJWonLFAfPqkXtlkO+ziuifZJpddFtwCIup47OxDM/W/l0o9022eURrv3PP8Oqo2mus4Yx4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6905

DQpIZWxsbywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBqb2FraW0u
emhhbmdAY2l4dGVjaC5jb20gPGpvYWtpbS56aGFuZ0BjaXh0ZWNoLmNvbT4NCj4gU2VudDogVHVl
c2RheSwgU2VwdGVtYmVyIDIyLCAyMDI2IDc6MjIgUE0NCj4gVG86IGxnaXJkd29vZEBnbWFpbC5j
b207IGJyb29uaWVAa2VybmVsLm9yZzsgcm9iaEBrZXJuZWwub3JnOw0KPiBrcnprK2R0QGtlcm5l
bC5vcmc7IGNvbm9yK2R0QGtlcm5lbC5vcmc7IHBlcmV4QHBlcmV4LmN6OyB0aXdhaUBzdXNlLmNv
bTsNCj4gcC56YWJlbEBwZW5ndXRyb25peC5kZQ0KPiBDYzogY2l4LWtlcm5lbC11cHN0cmVhbSA8
Y2l4LWtlcm5lbC11cHN0cmVhbUBjaXh0ZWNoLmNvbT47IGxpbnV4LQ0KPiBzb3VuZEB2Z2VyLmtl
cm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5r
ZXJuZWwub3JnOw0KPiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IEpvYWtp
bSBaaGFuZyAo1cXHv8fsKQ0KPiA8am9ha2ltLnpoYW5nQGNpeHRlY2guY29tPg0KPiBTdWJqZWN0
OiBbUEFUQ0ggMC80XSBBU29DOiBBZGQgQ2FkZW5jZSBJMlMtU0MgYW5kIEkyUy1NQyBjb250cm9s
bGVyIHN1cHBvcnQNCj4gDQo+IEZyb206IEpvYWtpbSBaaGFuZyA8am9ha2ltLnpoYW5nQGNpeHRl
Y2guY29tPg0KPiANCj4gVGhpcyBzZXJpZXMgYWRkcyBEVCBiaW5kaW5ncyBhbmQgQVNvQyBDUFUg
REFJIGRyaXZlcnMgZm9yIHRoZSB0d28gQ2FkZW5jZSBJMlMNCj4gY29udHJvbGxlcnMgaW50ZWdy
YXRlZCBpbiB0aGUgQ0lYIFNLWTEgYXVkaW8gc3Vic3lzdGVtLg0KPiANCj4gSTJTLVNDIGlzIGEg
ZnVsbC1kdXBsZXggc3RlcmVvIGNvbnRyb2xsZXIgc3VwcG9ydGluZyBzdGFuZGFyZCBJMlMsIGxl
ZnQvcmlnaHQtanVzdGlmaWVkDQo+IGFuZCBEU1AgZm9ybWF0cywgbW9ubyBvcGVyYXRpb24gbWFw
cGVkIG9udG8gdGhlIGxlZnQgYXVkaW8gY2hhbm5lbCwgYW5kIFRETQ0KPiBvcGVyYXRpb24gd2l0
aCB1cCB0byAxNiBzbG90cyBwZXIgZnJhbWUuDQo+IA0KPiBJMlMtTUMgaXMgYSBtdWx0aS1jaGFu
bmVsIGNvbnRyb2xsZXIgd2hpY2ggbW92ZXMgdXAgdG8gMTYgY2hhbm5lbHMgdGhyb3VnaCBhDQo+
IGNvbmZpZ3VyYWJsZSBzZXQgb2YgaXRzIDggZGF0YSBwaW5zLCBlYWNoIHBpbiBjYXJyeWluZyB0
d28gc2xvdHMsIGFuZCBleHBvc2VzIGENCj4gdHJhbnNtaXQgREFJIGFuZCBhIHJlY2VpdmUgREFJ
IHdoaWNoIGNhbiBhY3QgYXMgY2xvY2sgcHJvdmlkZXIgb3IgY29uc3VtZXINCj4gaW5kZXBlbmRl
bnRseS4NCj4gDQo+IEJvdGggZHJpdmVycyByZWdpc3RlciB0aGUgZG1hZW5naW5lIFBDTSBoZWxw
ZXIsIHNlbGVjdCB0aGUgYXVkaW8gcmVmZXJlbmNlIGNsb2NrDQo+IHBhcmVudCBmb3IgdGhlIDgg
a0h6IG9yIDExLjAyNSBrSHogc2FtcGxlIHJhdGUgZmFtaWx5LCBrZWVwIHRoZSBtaW5pbXVtDQo+
IGZ1bmN0aW9uYWwtY2xvY2sgdG8gYml0LWNsb2NrIHJhdGlvIHJlcXVpcmVkIGZvciBzYWZlIGNs
b2NrIGRvbWFpbiBjcm9zc2luZywgYW5kDQo+IHN1cHBvcnQgcnVudGltZSBhbmQgc3lzdGVtIHN1
c3BlbmQvcmVzdW1lIHdpdGggcmVnY2FjaGUgcmVzdG9yZS4NCj4gDQo+IEpvYWtpbSBaaGFuZyAo
NCk6DQo+ICAgQVNvQzogZHQtYmluZGluZ3M6IEFkZCBDYWRlbmNlIEkyUy1TQyBjb250cm9sbGVy
DQo+ICAgQVNvQzogY2RuczogQWRkIENhZGVuY2UgSTJTLVNDIGNvbnRyb2xsZXIgZHJpdmVyDQo+
ICAgQVNvQzogZHQtYmluZGluZ3M6IEFkZCBDYWRlbmNlIEkyUy1NQyBjb250cm9sbGVyDQo+ICAg
QVNvQzogY2RuczogQWRkIENhZGVuY2UgSTJTLU1DIGNvbnRyb2xsZXIgZHJpdmVyDQo+IA0KDQpJ
IGhhdmUgY29sbGVjdGVkIGFuZCByZXNvbHZlZCBzb21lIGlzc3Vlcy4gVGhlIHJlbWFpbmluZyB1
bmFuc3dlcmVkIHF1ZXN0aW9ucyB3aWxsIGJlIGRpc2N1c3NlZCBmdXJ0aGVyIGluIHYyLiBFc3Bl
Y2lhbGx5IHJlZ2FyZGluZyBzb21lIGlzc3VlcyByZWxhdGVkIHRvIHRoZSBuYW1pbmcgb2YgImNv
bXBhdGlibGUiIGFuZCAicHJvcGVydHkiLg0KDQpUaGFua3MsDQpKb2FraW0NCg==
