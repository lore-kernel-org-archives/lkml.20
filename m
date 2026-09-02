Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023094.outbound.protection.outlook.com [40.107.159.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A31C4A5EC1;
	Wed,  2 Sep 2026 18:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788373229; cv=fail; b=cKTsC/SSKoTd4QUK1H6bfijJJMzRcRmvG8t0wcpYE4XOmg48wXhYFhDuYZALThK5xrdfOUq22Cdx4xCdS5OxADjrgK3adAb5IGTYgonOb1KO+6bGUfHSmig0pbLcXrDfJsq2Grk2Nzo+hegZL0yVgzcQ9EYYAS7lXVnCx+UeIAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788373229; c=relaxed/simple;
	bh=ZKeX6vFceZ/JyZfVUjDsx1gLv/3fbxeAu9mk/przZY4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cB+Urtl4/YBvVZwwWQeSk2N9UMhOh2xEcnbds3/xcoXhwpOK/rmY+H8JcTPRp8RhRVMyVGCY+ruHW3Ov7Cujz28JjHX4eT/pfomSKt9tm9UhYV2SU+wVRZzy0VumOeQjKZOVi74h/YpWO9Koavy/vkyOX2bcYPtYK0ec8hUB//0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.com; spf=pass smtp.mailfrom=phytec.com; dkim=pass (2048-bit key) header.d=phytec.com header.i=@phytec.com header.b=fmWrepW1; arc=fail smtp.client-ip=40.107.159.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.com header.i=@phytec.com header.b="fmWrepW1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kcGrfyRvrdG3NjWD/AYL4e4ptvbyM/7t/zd4RMza6irevtFrrnBa+XOryc4ubSQTLT/f3SoRKlmKmNgrl8slN800z0+Xnyczj2gIbHcXOFayS2Wg5PwtxqI0UgdCWTA3CpBk9gLX6YetfuXT2u+HcZ71DzFuJIi+mEi7H7RicOBK68ZMYpcvBF1+ZBAjbVN+4LDxdRSDcTN6+cOEiqkRfZ6vRC27G+vDOpgDiaPj29vfukpiwqw/KrNavOfnufSJfiS24HyHtDc8LCHngRmgOdQnpGmwM6x8DlVd7QNUXMn2c9gj6fAFrHjX7KQq0MqTuQFTOo3RJKkT2rvDrLK/YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKeX6vFceZ/JyZfVUjDsx1gLv/3fbxeAu9mk/przZY4=;
 b=dU0QbYuBjhi77Zbt5mcDCMkZ4fomrAsjdoHGpXxRYYXtMfJI6epxilJa1DQnAIhcSzRxYqkAaE2P7Yhja0i1i9t94OZlonz1ikVk9J88nZ8/JB5KcgjyCFPsBUnESPfFXySl19ea0O3s+9CvuSi3P1VPR1RDdPJfQmlpFx7sINtMh5MyXP2hOESHv3p5nbydXpTYPaZyWPUR34XHcb0PSKHRTq2ZrnRP3cceQhtIBImDCpyDWrP24MrTsZ/CR6KsFeu9IcQwYBv3zsGI4IZlkopGsjG/Y5UjDSfX+DOnzzIhakkc+kQTkXCdLefFjRHHFXyZTFUidPJ+K8GgyKRXkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.com; dmarc=pass action=none header.from=phytec.com;
 dkim=pass header.d=phytec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKeX6vFceZ/JyZfVUjDsx1gLv/3fbxeAu9mk/przZY4=;
 b=fmWrepW16muSiLm679L/i0OZPK7B+xUc/Q5hGhh26C24ZX9jg2DjHmW00kkSHkUPXeKve/6Q/2HfLrG5d1mYMPTZB1q4Nj1xXawYTc5D9qAQTrsW7R4xmlcV2/XiGSPBjVOM9CWCy0ZXAAjbHs1EZDZa6D/LfO1qGE+abLQQWoy2Ik2T/4IG2HxD/QyXN4Eg36bB2scKx26PzNfbg9o0WfKoEILQ/UwRyjWRBxenyJh5eHAj/JAkCkrsO3I4rsn84WPNh0S5qpB5b/c161Hi5cmrkIYOU8VAi3KdC7+3Vmnv6qEhu0Lz+N/YD3tiPZHXRxItseGJXvDTmz3QH5kLjw==
Received: from DU0P195MB1745.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:3b7::10)
 by DU0P195MB1568.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:34f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 18:20:22 +0000
Received: from DU0P195MB1745.EURP195.PROD.OUTLOOK.COM
 ([fe80::48f:7e75:c707:d440]) by DU0P195MB1745.EURP195.PROD.OUTLOOK.COM
 ([fe80::48f:7e75:c707:d440%6]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 18:20:22 +0000
From: Nathan Morrisson <nmorrisson@phytec.com>
To: "nm@ti.com" <nm@ti.com>, "vigneshr@ti.com" <vigneshr@ti.com>,
	"kristo@kernel.org" <kristo@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "sashiko-reviews@lists.linux.dev"
	<sashiko-reviews@lists.linux.dev>, "afd@ti.com" <afd@ti.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"upstream@lists.phytec.de" <upstream@lists.phytec.de>
Subject: Re: [Upstream] [PATCH v4 1/2] dt-bindings: arm: ti: Add bindings for
 PHYTEC AM67x based hardware
Thread-Topic: [Upstream] [PATCH v4 1/2] dt-bindings: arm: ti: Add bindings for
 PHYTEC AM67x based hardware
Thread-Index: AQHdCLZYgQ7onOgaZkKfc6F+K/l22ba7/f8A
Date: Wed, 2 Sep 2026 18:20:22 +0000
Message-ID: <648d3128d73c6b27c1fa9a3fb1ff5b39156810e6.camel@phytec.com>
References: <20260630173131.3000303-1-nmorrisson@phytec.com>
In-Reply-To: <20260630173131.3000303-1-nmorrisson@phytec.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0P195MB1745:EE_|DU0P195MB1568:EE_
x-ms-office365-filtering-correlation-id: 06416a07-853f-444c-fef8-08df091eda52
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|10070799003|366016|38070700021|11063799006|10067099003|22082099003|18002099003|56012099006;
x-microsoft-antispam-message-info:
 t7JBIj5H6lp1jxY6dr248HO37q/y+sVkLwmJKHfx9u/YSBbxrMeLNBVOlhYVegBMTdimi++eC/4I8VP+GFyKuhrGZJEQlMwyRfNVsibkDBJrGye2pB+lpI+6NPF+fIPTPHb4j2O4e6GvkKn/GcEvViH14idRp/Hn0ThLxioO4fzPzmTktEHRMtRqK3gSZNcvJKDTCK//u2JSouuS3HvUvWMYzySuTyOXx4Mn7QX7d6NzNXWnYM0zrC1dFrmCvIvDQlf1AY3zn9s8DXJN0vqfE27Fkm2ky4zwJG8LWXNWjp93SxY288r0/vMMARxw3Lm5B16qfA0FMvbln+WYFv5fce+aT3b97zaYnrMJr5ijzib6I76Z4peVd3jtzJyejIrU3fkr1COR7XTL92fNPLrxEgnL78g57y7CC9H2SOJ1eo5LFyIZ0CiiZFNP6s8HXixCob81PMpvBx3W0UChksiuHN5Zw24v4RVj3e6IhSa6hz+4S02ACW2vEXYd5987AMW/iLMaAEKiZCxtsIr5LsHEXuNtg8szgJa6oLfJWweUy+QIvDs5Nsa4VmgFEiu0YwXkNoiNQ9StyIkn6Y/VsbC9OkZ/hQ+Y160FSef7+CxxKm5AjiiJ9PYCYPJ+2VTW89vabMJvRMU1jtFqYYhsqp+D/Czm5SB2zZocY3OpnCnpoq+FFOWjyqgt1wAkVkQ2Lpi9kYZ84yAvP684wfKMzyfeyB9rkXxb3GhxwTKGy5vp+40=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0P195MB1745.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(10070799003)(366016)(38070700021)(11063799006)(10067099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c21nNVBFSnljcE53NVZkdlhOYnNDbitBNjlrSi9jKzZtZzVZSFF6UVJWZUpK?=
 =?utf-8?B?Ym5KM3A4THJLd1VZV0Z6ak5FSUZTQzlVSmlGRkVFK3h2cDZnM2s2dSt0dHNj?=
 =?utf-8?B?M1A0R0VPRDkvb1A5K2hadlVJTDZBZisyZkZKenVOZFVYbEZsN0dOMUJ2dUtl?=
 =?utf-8?B?SmRLOUsvMW9QenFDcDFTYmdoeU5KQU5FS3FoNnBhTTNHM0pDaWRzV25CYm1w?=
 =?utf-8?B?bFZrZE9heUF6VHp2cDlDN045SmJWTXpRZ0ErYlkrMTNsN0RudUtNOG5EQzlu?=
 =?utf-8?B?RXhmVWcycHRXeWNjd3lPcDdQWmE0K1hQaEFNd1crdUpocGpsVlVHd1hxclJz?=
 =?utf-8?B?SlVOYjNmdnozeW9vUjd1SGFFWUg0MndNVFVFS1pkNysxMEtHMi8wTFFMRzMw?=
 =?utf-8?B?dXpCVCtCdzJLQUcwcnhDS1h0aGNGY1JoRVlZRGdhWk9lMThmR3V1aUhNbnda?=
 =?utf-8?B?VEFDTCtwMXdIZ0VYWFI5NGIwa0VQS2pXV250L0ZWZmh1NWV1c1ZQcVp0bG5T?=
 =?utf-8?B?elFyWEFlTHhxc05DWHlXUXY5S2hodTN1bDA0WDlWeWhwV0haNXJaK2MvTUhK?=
 =?utf-8?B?K1l2TFBmRjVON1F0NDNCa1pWWWFPQy96OXhrRGE4bGhXYTM3bGRKTGNVSEl1?=
 =?utf-8?B?cmdEcjhEb2dabVhEV1BHR2YyNVNUN0c0ZlFKZ2txOG1hL21DSGVvbHhnZ2tz?=
 =?utf-8?B?d0J0aUUycTFrdUFLZUdRdTllSWg3RmQydDYxQmMxSTV6aWtzQjdROHJsSG1J?=
 =?utf-8?B?Ynl3ZVZzYWVYMDN1dU5yNUpBOGI5K3c5b2ZBcE44NWhCdjdQd3NuNkdSWWlE?=
 =?utf-8?B?VnhoVGlDc0RNMkhOU0NxYklNMG5VYjYxQnlnSnVHQzFxQ2p6bENmeUdnekRh?=
 =?utf-8?B?VUgwSVIzcDRjVlIzM1VZbUxRb2pNNmhDZ2wycHU2Qk4za0RnSmVVRE9Vd2oz?=
 =?utf-8?B?UnZoa0taR3cvQWY2c2wxR1BEMllwU25lTUFaeEVFNWh5Z24rR0lYM0dnZjdq?=
 =?utf-8?B?UTQyT2g1ei8zeDVHUzNtdjZyQzFwczYzbWwyTkNvaDR1MHVYZlJZSC9DTUNC?=
 =?utf-8?B?RTN0ZnlwbmdRVmtWd2hXM0VjVmNpckdod0p6UmczRk9ON1dBVEtkYy9NRTho?=
 =?utf-8?B?Y0pnMUMyZzF5QnRIaW51Ynh1SlR4aDZEektTMDNYUmM5YjBxdzV5TlJ4ZGJY?=
 =?utf-8?B?MCtSNHlqWjhEckRhcmtsclBseHcrT0ZKODloaTJYU3hjbU9QWmhXSlhDa1Uy?=
 =?utf-8?B?Z3dFWkxKM0VieEdkNWhoOGk3WUplbnNJZzNrMTAzemhIRmVYSXVLL1ZVeGc1?=
 =?utf-8?B?VHJSeGpFc0VMSmtYa0dvMk5Oa3phWElZK1R5Z05xcllOUExtRUFCczZiTlBD?=
 =?utf-8?B?MldHMXJjUlgvc1JqczVaNnVERmgzK3N1dlNZTlRISFFMR0lBdEZHcHhHVkc5?=
 =?utf-8?B?YUE4Z1poVzBsZUNHOW5yODZyVzdhY3N5MW5ubHlnRVdJTDVWVnBKQ1p0R1RH?=
 =?utf-8?B?Q2NKWGJZQ0IxWU9zaXJLZkI4OGFEaTMxN0pHK20vVUhBc2tEbDZrQTZuMjRi?=
 =?utf-8?B?YURPMFF6eGRSQ0UrQUxpMDQ3dUJWc042QXp6eHIyOExkb1g1ODdyRVJGM0ti?=
 =?utf-8?B?Ky8ySy9aR01EYzNwbTF1ZE83VXExcjl4d0JUUytLOStKYlFHT1FPdEFOZlNO?=
 =?utf-8?B?NWpLOUtDcUdTSWdsVVhqbXRrVW1jNFVXTENqd2l5S0tnYTFiRlFuQVFKOXY3?=
 =?utf-8?B?UG92d1dnTUR0WnkvWW8reEZ5R0FsNVpMNlVNdXpDUDgySGIvaEVSTTFQSGM4?=
 =?utf-8?B?ZGVGVFBNVmFVNFg5Uk1ialdHQ3FwYWpabzhzMnI2ZXFvODE4WEEyNk01WXEz?=
 =?utf-8?B?bDdSRlk2aEQ0dlpXeUtWdzJDR2lCQjJKSEpTQ0hCdGJPZ1hHRkFQQnJ4VHhl?=
 =?utf-8?B?NTQxTmZlOW9SS0czUTdSRHpZWWRrTzg3NnpYcmQyV0htSnUySXBIaFIyQlBJ?=
 =?utf-8?B?N1kxdXhmUTVzb1hSYmJzNUttMEtxTDE5Z0Z4S2RHUUtqR0x0QlZiM0pObXZO?=
 =?utf-8?B?NXp6dFZXeVVMUjRjcXNUTEFsK2R2SUx0aWlZekFaaXRwejNvVjdlTXR5MVQy?=
 =?utf-8?B?VjU0OW1uZUNYNzU1UnNBbkJqcTd2UVVjVC9FUVJWM005TForbjV4TUhYa00r?=
 =?utf-8?B?R2ZpRDBodUhuQmpJcDJlTnlLdVh5ZHM0ekNlWHpvZGVjR3JFUWJPQUJ3U045?=
 =?utf-8?B?cXQ2VWZ0Z3hNN2hGRG1leVVEaytKcVNJQmJmZE9BRjdKaDlMS3RnaUROUXUy?=
 =?utf-8?B?T3FDSUVkdkdVRVV1YWNZOHpLU2RVaWE4VWZSMkJvVk5GdHlsL21VUHZmYnJw?=
 =?utf-8?Q?w+kVuYR9rNL5Za7ez05W5nRvRMhclW4tHSmmyis1PnvFS?=
x-ms-exchange-antispam-messagedata-1: ubwJIpj6B95dXPY3BLDFDQ3o2x3H2d6S7u8=
Content-Type: text/plain; charset="utf-8"
Content-ID: <745FC50611E94B479210DBB8D6540AD3@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: phytec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0P195MB1745.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 06416a07-853f-444c-fef8-08df091eda52
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 18:20:22.6413
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1sY8OMRpgiE2hA0JgT2FcPKiXrlcx7U9EevFO4bgQ1jOHHeZ5dAaw5XV4Ygv6wSFZgVJT0C67rRiL8iQHG87kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P195MB1568

SGVsbG8sDQpJIGp1c3Qgd2FudGVkIHRvIGNoZWNrIG9uIHRoZSBzdGF0dXMgb2YgdGhlc2UgcGF0
Y2hlcyBhbmQgc2VlIGlmIHRoZXJlDQppcyBhbnkgZnVydGhlciBhY3Rpb24gcmVxdWlyZWQgYnkg
bWUuDQoNClJlZ2FyZHMsDQpOYXRoYW4NCg0KT24gVHVlLCAyMDI2LTA2LTMwIGF0IDEwOjMxIC0w
NzAwLCBOYXRoYW4gTW9ycmlzc29uIHdyb3RlOg0KPiBBZGQgZGV2aWNlIHRyZWUgYmluZGluZ3Mg
Zm9yIHRoZSBBTTY3eCBiYXNlZCBwaHlDT1JFLUFNNjd4IFNvTSBhbmQNCj4gcGh5Qk9BUkQtUmln
ZWwuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBOYXRoYW4gTW9ycmlzc29uIDxubW9ycmlzc29uQHBo
eXRlYy5jb20+DQo+IEFja2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2No
aXAuY29tPg0KPiAtLS0NCj4gTm8gY2hhbmdlcyBpbiB2NA0KPiANCj4gwqBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3RpL2szLnlhbWwgfCA3ICsrKysrKysNCj4gwqAxIGZp
bGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS90aS9rMy55YW1sDQo+IGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS90aS9rMy55YW1sDQo+IGluZGV4IDY5YjU0NDFjYmYx
YS4uYWU0NzE5MGQxZjgyIDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvYXJtL3RpL2szLnlhbWwNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2FybS90aS9rMy55YW1sDQo+IEBAIC0yMjIsNiArMjIyLDEzIEBAIHByb3BlcnRp
ZXM6DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSB0aSxqNzIycy1ldm0NCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqAgLSBjb25zdDogdGksajcyMnMNCj4gwqANCj4gK8KgwqDCoMKgwqAg
LSBkZXNjcmlwdGlvbjogSzMgQU02NyBTb0MgUEhZVEVDIHBoeUJPQVJELVJpZ2VsDQo+ICvCoMKg
wqDCoMKgwqDCoCBpdGVtczoNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoCAtIGVudW06DQo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIHBoeXRlYyxhbTY3NTQtcGh5Ym9hcmQtcmlnZWwNCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBwaHl0ZWMsYW02Ny1waHljb3JlLXNvbQ0KPiAr
wqDCoMKgwqDCoMKgwqDCoMKgIC0gY29uc3Q6IHRpLGo3MjJzDQo+ICsNCj4gwqDCoMKgwqDCoMKg
IC0gZGVzY3JpcHRpb246IEszIEo3NDJTMiBTb0MNCj4gwqDCoMKgwqDCoMKgwqDCoCBpdGVtczoN
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBlbnVtOg0KDQo=
