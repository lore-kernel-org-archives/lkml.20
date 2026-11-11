Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.74
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794361920;
	b=DWB/yjGnRI3vGKt9RxCal/mhXNNvkd7SxuPKHM2eq8I9dd4YmKVvcxUqZBmGU9UMB/zs
	 fE4i7vIEoRFsdISRj48LAs4/0f78AWtQfXfILpQibQj3jTqUy5AnwAyi4IhjCI4Koo67S
	 Jm4A6R61o9pNm5gXenz6qQDR8PYiYJaMf4Kd2WfPUcht7YRCYwDtqk3cEuDUCkPsv+do6
	 lO+ULyTzwtTVDhZv2syfZ3iQUXZ734haEmnCG4mWKOAhSquo4H3QT1Tt/ZwLyfIPN8XDk
	 Ub33e11V215l1OHoFIP1G3WQfdUn55JpX9rRdSfL8ygCvnxJ1kzrW8cVDXplCD1dwrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794361920;
	h=DMARC-Filter:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
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
	bh=A3QpOHwa4dRWfI1yvebZ9NBJxhVo9n4dzWsYm3AaPQ0=;
	b=OKqwqe7paYFOMcIkbujfA+4TUzitSgJyHKyXcWkZ2NpWteCYedelySAoNQtTViNTC+0M
	 kuoU0cwMRE1Y4LZY1eaH0WjDoqk1uG+nJZsc866LAAju9+mQVfxKL0Mtkk4nSPyUF3DhW
	 z1qI5lB7rcxJsyDGo3RmdJ0KrqoLSocwA4QKxkRQ6iCbsp36gQJYlT/TRe5zT3pmB4Qwc
	 IoPLAiA7W97fN/vjgc81hJIguhvBRmIJfjS3mJ1E+Iz7g2SxFhjnqDu+RNQRmVcf8oJML
	 +mCUJQiEmVue8WotaJ0pRygEhUvFgE9IgHKLBIvbYCCrwUEpkzTn/Bbv9HkAnnKS2RA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.74
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023074.outbound.protection.outlook.com [40.107.44.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D328606A326;
	Wed, 11 Nov 2026 01:51:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D328606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ETl/+1w4iNM5ccNkhcej2L+OsdZEin8N7MvMBpBD2s75vEVLLguSQFm1YEzZ8GaQG2X6oQo/ANwZ/ym54+pxgmcvbmEvsUITxr4cP7voQN+Cr5x4SszAnSqHr4YDB44GHJp23LeKc2ZC2eiJC9nCslTtkyzYAkVG50dZfG9eKtU6n4qWnDslW34DHtpyMv7Y9OXidVrJ1tQZ0mnfGeqrCn2336fdERJBZWzdFTCnvScGQppCzp8hLwkAbtETn1MLBqoIFA6e3vRAjOU+M53H+hW9dU0WLOwaODEOLlBCHi59tgFz48NQQmgxdW6Lw7OeZxGfoMOVgNPvCDM6PgdndQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A3QpOHwa4dRWfI1yvebZ9NBJxhVo9n4dzWsYm3AaPQ0=;
 b=yqIJoh2CTo2msILN8/F0iFCxFE9KSa3g7er2Re+RqgC7DXk7A5YN9qBbNwE+uvO2Sty8tTIDGOAIJfJVIKIu/OLRnin4WWnaw676WDncmF7Lx3qqat1LvzJDweyAKOdt8ldueGqCJ5ni78/JuoNneSnPgozHnK1ZeV4yKIoGE7Jpnb4u4Xx9IT9QCVJdxLYARS8oGe6uYW3qZJcZgFlKE+rO1XspMJPStNsTQDZEKAEW38r05djzJvo6vhxGrMVzNS++6kDt+ps0w5wAiOFTleNt+SjX6T/1M+hIY2X/0/WCohyO0r7yM31hwjj/7vPYkyxuiPAXud37sB4MEiIeIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from KUYPR06MB8673.apcprd06.prod.outlook.com (2603:1096:d10:8b::5)
 by SE2PPF193AB2F94.apcprd06.prod.outlook.com (2603:1096:108:1::7c7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 01:51:55 +0000
Received: from KUYPR06MB8673.apcprd06.prod.outlook.com
 ([fe80::2b5f:4b04:8fc6:747c]) by KUYPR06MB8673.apcprd06.prod.outlook.com
 ([fe80::2b5f:4b04:8fc6:747c%2]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 01:51:54 +0000
From: "Joakim  Zhang" <joakim.zhang@cixtech.com>
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
Subject: RE: [PATCH v5 0/4] ASoC: cdns: Add Cadence I2S-SC and I2S-MC
 controller support
Thread-Topic: [PATCH v5 0/4] ASoC: cdns: Add Cadence I2S-SC and I2S-MC
 controller support
Thread-Index: AQHdbdziB1/5JI/3t0epEAGn29v7N7cisb6AgAVv5eA=
Date: Wed, 11 Nov 2026 01:51:54 +0000
Message-ID:
 <KUYPR06MB8673D4320D21D9C86EF9F4A582712@KUYPR06MB8673.apcprd06.prod.outlook.com>
References: <20261106105208.1246554-1-joakim.zhang@cixtech.com>
 <179406277372.3424803.9881358554237732478.b4-review@b4>
In-Reply-To: <179406277372.3424803.9881358554237732478.b4-review@b4>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KUYPR06MB8673:EE_|SE2PPF193AB2F94:EE_
x-ms-office365-filtering-correlation-id: 15348a0f-c158-48b8-5ff0-08df3f965cc7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|18002099003|22082099003|10067099003|38070700021|56012099006|4143699003|261022105027099003|261026140227099003|261028144727099003;
x-microsoft-antispam-message-info:
 DilxjgM8KWT3cYebG8+nBfoqYaW9IB57RWwiNH1TRZgtV5y73xtafuY91AK36JSiaOnO2M+15/HCps5OBaM/JZf6shaaRfb1I6r2aJYlBEqrGUaYLErbNN3LZiuxfAlz7zaIN9y9FOTV7QEyaJTtUQcdubFva8C1h1YkX0hPff6HLP6nYbZS+mJ37vEkbFZGXLJhUQCS8U/oYE3vZbIWQlc9V2nm7BOwbGfCtFOyVtQkOYPg2t6KJnwPpmqd/NK9Jv2Jjq/RhdB+w3xzpBpo1me+2r5JlBAGEDODuUUrNZg+ETrshAjtnd28r2AW8aa0hnIIJqgGskw5PdiQrbX+YlY2DMgF1A0I1kVWUOMkx5Fehy5BU52W2P5EYwxBTjKBTLya02ye5i/rem0GGSJ6m7Ey01JTBlKN3AQMixn/4cuaXBFv3m09kDzJt86P/gOSYfF9dBdreTkkMwuzRcWDCIS9mJYMM5dsJCAgzNDIUjWFWBoJzoKBg0yYiLYc0S8tCeKJ3CPGN7QHmCLVgw/+Vv3OnGxuIetrlCo5iWaJOE+y+VCK9TcxgxJ54nqo/eY5qJuvuFdhiSRRiZSsoWo40FKqofUmDBKECof13B5z32JenABsgpWslInKvPWIOYKwQxbOsND1nbvYdjU7BjITGJRI4pTiiFX4ETbjYxan3mjTVVVHIP/tFrIwyPa+Tbc3amus1yXgwRPyxZfGFZd3HQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KUYPR06MB8673.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(18002099003)(22082099003)(10067099003)(38070700021)(56012099006)(4143699003)(261022105027099003)(261026140227099003)(261028144727099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a0RzQWpoa2ZXNk9vd1AyR2c5YllpYm02WWRJcjU1dmp2b0E4MFZUbUJhY1Z2?=
 =?utf-8?B?LzhGUlZGOW9uSzgrMkU5V1BJMTlNZXZSNDNoZjk0N2xBN09BUSsyQ0N0TE1S?=
 =?utf-8?B?c0kyWXdCbDJKRzI1S3dQM2RlWUd6L1ZtU0gyQklqZTJXT0xOMnYraWhsWm5v?=
 =?utf-8?B?VlpwaXJhcXZMUVZ3Ty9kMlJFZmdmQWJkUjJTWTJkMndQVkttL1lqa3FjNk1W?=
 =?utf-8?B?ZThGSnpsMmQyNy9lRXFmODY5L1lGaW9VRWNEdnlEY01YM1d0UkgxRW93Qytx?=
 =?utf-8?B?Zlg1SkhvRXNFV05EWlNPdmF5emd5Y3YxSkJJS0kxc2JZZmJwcjhZbWlYKzVH?=
 =?utf-8?B?RU05dHZsaXJxczJvWWtnTnFNcWFzemltYUo4N0ZYeFd1RFdKRzhwYkJsQ0Mv?=
 =?utf-8?B?ZkMrQkM4NUZQVlRUbzR0cFZseEdsdVlJYzRDSExUalg4blFtSGFFV3ByVFpp?=
 =?utf-8?B?UE9DVXIzRFZNdUtWTkVtRDM1RlMrYWVMVXBCL2pZT3IzQWtqNXdRVnBGclZ0?=
 =?utf-8?B?MXNuRzQyaVVWRDBMQklaZkNXYVpsK1hIUTJxVmcwUEp1NXM1dmNqMzNna3Nm?=
 =?utf-8?B?TWo0QWc4ZUZqejd4RWprTTNYcUFXZ2dVWDYvMzI5UndvTzh5VWRib2RiL01p?=
 =?utf-8?B?c0JqQlI1TWd3RHV5SnhWM1ViRHUvYzk3SXM5YmQyUU5VR0FDcmxCcXFvbHhG?=
 =?utf-8?B?bVFPQTJGUkZySmhMUnRQMW9EVEg0Qm1wWTBiTG9pWmxRNnJscGh0TDRMQy81?=
 =?utf-8?B?d21ua1hrK3c2OFJSZHp1MzE3N0w2NHZHNmpCb0Vwbk92bFBzN2o3SEczT3FW?=
 =?utf-8?B?Mkh6bThrZTFzVzFOR1h0OGhKaElmT3ZrbC9oZWRzMC9DS1V4dXAySnpOemQv?=
 =?utf-8?B?Q3FHSmNZY0FTcGp5cWNXSytJUThEY3QzR1FtNU0vRWJpTGlDOUVqTVpybmJz?=
 =?utf-8?B?V2J2MHd5UU9vRmdNcnFEV3NPNFBUdHNrc1EwQzljaFFScjdMTGcrd3g0bjVn?=
 =?utf-8?B?UFlNT2xuUnlVSmN5V2UrOStOcTQ1YUJxblB3WHBSL0FPWkYrdEhCTlgvbVFK?=
 =?utf-8?B?dlU5b0pheXJFWWhmbGlpc0tTekJlc3JmaStLdXZrUTFuOFVNZVVvTTl1c1Uw?=
 =?utf-8?B?UnRMQ2xZdjBhTmtBMVdYaWZkRUZpUFZkNlFUVCthZFdqNWhPaVFkVWhMcGlM?=
 =?utf-8?B?TmFNbWl1cVNvS25YbVdHaFVxVmw4MlM1dXYzdE9BTDYzMUYvM2pCQ2J4OVkv?=
 =?utf-8?B?WnF1ZURqb01mbklCTjhCcXl1ZGJqS2kwaytaeFNuWjcwUjRXNU9vczZUVHRa?=
 =?utf-8?B?MnJsWHA3TVJndHA5Y2orSW5GbkJaenhhRGZtWitMbDM3dVpyamxLWHBGUlpp?=
 =?utf-8?B?cjlZb3JKTmxBMTBBbmRENFBqTTQycXRMUzZSYlgrd0VWWlFKbk1wYnpWWHRr?=
 =?utf-8?B?Y1M3Q09yR0w3QlgvKzRmaGZVd05xS056aFlGNjdoSy9YVlRCRGdtY1VZOGFh?=
 =?utf-8?B?V003MTlMc3hseHJUVkNUanJRRmJGcGtoZlV4WUx2a2xpTEFZeUtmOGwxOXh1?=
 =?utf-8?B?akxnZ0NjN2l5eTFLKytWdUJ4KzFldGRFNTQzL3VNWHVZVjVreDFYcG93SmRn?=
 =?utf-8?B?TGJXYkhrVTB1L0wxdGF3TmZFcDFEYmFja241ejg4U08yT3p3ZG9uSEpaclBR?=
 =?utf-8?B?cW14L1Z0enZ4cDRhVGNwR0VUN2x4MnlxcEtKZWZtclpCOVk4SHFjSEFPK0xu?=
 =?utf-8?B?SFNya3Nubk90WVgzOEx6bjBRZHByUXdSSmpUdWUra3Z4c0xPOFlVOEhYRS9V?=
 =?utf-8?B?NmJYa24rN2EyamlVUjBXbldHTGM2ZEplbTZEN2tMN1ZtZ2pYdGhCVm54NkpO?=
 =?utf-8?B?VElIdWpHRXZXc0JwWktOK2t6UGNpWklFR29mK01LWE9wMjh2aWR1V3J6MHZD?=
 =?utf-8?B?QjR6RHFsQWdROFZtYzJWSnZTTlQ5Q2EwcDgyNTVGZ1grRFN3OGJtZWtqVFlT?=
 =?utf-8?B?eGNxRDhkWU1CYkFrMGhSQ1BGSnEwdmlDaGdVWVEwVUlIcmcycVZHWk9zaWw1?=
 =?utf-8?B?L0JBYlF1NXpINUwxVGNLUHVreERLRGo5Q0FvZWRmcitGVFFiaVVSZEFCV0No?=
 =?utf-8?B?d3NkNGYrVDltUXUrY1h1SUppTFBjM0tDekE4ZHRydWlxRkNieUtmaCtwajJJ?=
 =?utf-8?B?T1BUQnl3WHpObC8zUlllSnFnUDFGdGtBUTloMXJnWmtmSHpUZHhNYS9ibVBy?=
 =?utf-8?B?U0VGNUR2NkRuejRZUUhsS3A4bElXd01raE9ISFAyaXY1a21Ud2xLckRvdzRa?=
 =?utf-8?B?NHhXeDJ5RVhDUVZJSUpZaWVkaUNOeDNqUUdTQW83Njg0THRkblA3UT09?=
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
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KUYPR06MB8673.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15348a0f-c158-48b8-5ff0-08df3f965cc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2026 01:51:54.3121
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HaQQR7p35Ss76cO7jUWP8fdgGtuLofEfis7t269cdS79I5r5O8oPFMmBzYuD/1PBU8HLXgjdPwtSJsHP8OnbKn6AmNBINAbgArK0wqtW1xw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2PPF193AB2F94

DQpIZWxsbyBNYXJrLA0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
TWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPg0KPiBTZW50OiBTYXR1cmRheSwgTm92ZW1i
ZXIgNywgMjAyNiAxMDo0NiBQTQ0KPiBUbzogSm9ha2ltIFpoYW5nICjlvKDlvLrluoYpIDxqb2Fr
aW0uemhhbmdAY2l4dGVjaC5jb20+DQo+IENjOiBsZ2lyZHdvb2RAZ21haWwuY29tOyBicm9vbmll
QGtlcm5lbC5vcmc7IHJvYmhAa2VybmVsLm9yZzsNCj4ga3J6aytkdEBrZXJuZWwub3JnOyBjb25v
citkdEBrZXJuZWwub3JnOyBwZXJleEBwZXJleC5jejsgdGl3YWlAc3VzZS5jb207DQo+IHAuemFi
ZWxAcGVuZ3V0cm9uaXguZGU7IGNpeC1rZXJuZWwtdXBzdHJlYW0gPGNpeC1rZXJuZWwtDQo+IHVw
c3RyZWFtQGNpeHRlY2guY29tPjsgbGludXgtc291bmRAdmdlci5rZXJuZWwub3JnOw0KPiBkZXZp
Y2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGlu
dXgtYXJtLQ0KPiBrZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHY1IDAvNF0gQVNvQzogY2RuczogQWRkIENhZGVuY2UgSTJTLVNDIGFuZCBJMlMtTUMNCj4g
Y29udHJvbGxlciBzdXBwb3J0DQo+IA0KPiBFWFRFUk5BTCBFTUFJTA0KPiANCj4gPiBGcm9tOiBK
b2FraW0gWmhhbmcgPGpvYWtpbS56aGFuZ0BjaXh0ZWNoLmNvbT4NCj4gPg0KPiA+IFRoaXMgc2Vy
aWVzIGFkZHMgc3VwcG9ydCBmb3IgdGhlIENhZGVuY2UgSTJTLVNDIGFuZCBJMlMtTUMgY29udHJv
bGxlcnMNCj4gPiBpbnRlZ3JhdGVkIGluIHRoZSBDSVggU0tZMSBhdWRpbyBzdWJzeXN0ZW0sIHRv
Z2V0aGVyIHdpdGggdGhlaXIgRFQNCj4gPiBiaW5kaW5ncy4NCj4gDQo+IFRoaXMgaXMgYmFzaWNh
bGx5IGZpbmUgLSB0aGVyZSBhcmUgc29tZSBzbWFsbGVyIGlzc3VlcyBidXQgdGhleSBjYW4gYmUg
Zml4ZWQNCj4gaW5jcmVtZW50YWxseS4NCg0KWWVzLCB0aGlzIGlzIGp1c3QgdGhlIGJhc2ljIHZl
cnNpb24gc2luY2UgdGhpcyBJUCBoYXMgYWxzbyBiZWVuIHRlc3RlZCBhbmQgd2UgaGF2ZSBpZGVu
dGlmaWVkIHNldmVyYWwgaXNzdWVzLiBUaGVzZSB3aWxsIGJlIGFkZHJlc3NlZCBhcyB3b3JrYXJv
dW5kcyBpbiB0aGUgZnV0dXJlLiBUaGUgY3VycmVudCB2ZXJzaW9uIGlzIGRlc2lnbmVkIHRvIGZh
Y2lsaXRhdGUgcmV2aWV3IGFuZCByZWZsZWN0cyB0aGUgb3JpZ2luYWwgZGVzaWduIGludGVudGlv
biBvZiB0aGUgSVAuDQoNClRoYW5rcywNCkpvYWtpbQ0K
