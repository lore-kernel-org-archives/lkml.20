Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.106
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793841483;
	b=St/aNtu7qdQkxv5iywIVEqe3EUFsrWvMpfs4niWUtulHK83//0UwDL1jC7ERCotz2EgE
	 rgK1k6G9tOuJLYAxrdJuh2I3K6JJHiqRc2Dv1ujDApRMw2RIj2ImB1PCx8q+8aknHEY4v
	 cxdCEj5xKSR24YHWjlpgd2pjpdZpbhco5Z14BeEuvx4UHDRlQxd4frGDm0q6ZeEG6NAVk
	 b29GrCLzf7jtXidSKIvMtwmarG3an8Rt2plBdSODKz12Jvi564JliLpPnSr9iuWPN5WIr
	 YHBiAR2Nt+j5qLCCh6NqfX3yr3DSQ6FDftnuOAozaqZvEd86/w1EsvOhtXtDkBfJQrw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793841483;
	h=DMARC-Filter:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ocoQLkq/0y7+ACccrtllEdiwwNtneeJuyQHQow5YuAU=;
	b=KqaOwP8h+HzLIdbkuklWGhdFvilI7zHE+A9ZHn3N1X6Q6T5rLE1pRYw/rXzq71p//sz2
	 yTT6WWGKDOc9FjQ4c2rNNDIC0FFHE4QHUYnHo2ndetgenXzg6NYpjwvsPSqm4V1CgXxUb
	 IAiCylQ+G9OMGUIXTb33mdrCbqBFgKaVfo4Bfsl9gUyHrhBq6iwkfcMOqpMrPula9mRec
	 YRRoRXJuN7S3ln1O6KkP/KqOyOlu9yAgH9AniYD16mYZVaDMrH1j4vENMeop9gZBoPMJn
	 VeTV06L7qwQd675lYe+vWrW/JomN3JqMIgE88Q1sByi9vMoWJCBgln6+gnGAfi/8KAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.106
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023106.outbound.protection.outlook.com [52.101.127.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD03606A31B;
	Thu,  5 Nov 2026 01:18:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DD03606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jn4R87OKc3tt7tOdE4xQH+9N9ZRx4+AZAlx6l8oKNipXtjjylFNpFtPHcrC6akmdpgUAfcRMu908U22guCNPvWCngvhJchpuppgviI38ZKnoSzcL3W6EiBITfHGIH0gK7QjfkTc00xC8s+Z8TIh7yai7eUrDjk2xsuuVXKTkQH/WK4swu5zfGPGAK0C/h7tW/CsdX11IzrpercB6vNNvWcKOR1nAVYbYbFpoechGCUTk+EQtNx+XQDcQorxm2VqCpqj1nB3YWAeCz10aUqabXbSKCYp9g8EKfh7h2cuL+Z+9r0hnbZpDeecIW1ZFIQzPWLO3OKZFlS/jJQTBAMg31A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ocoQLkq/0y7+ACccrtllEdiwwNtneeJuyQHQow5YuAU=;
 b=gbABxiznlSBYPZzsE9V7dDWMB8GPfL8pV/PADUwgmpoOaHfoyy8juBislKkkvhS5Nq6fhTYsWIRi+TI2t6NhEBk47Rr6leZwFv/DPDOhCygJlh3Fvl1A4lI4zQ3KIYw2BnEOB2rhlj7DJwByhRoP/AKlpXu0odTmEMVNkT3+KBNYGjrkt1IjP+z/O2JtGUirLX9bv6+UZlLQ417J2PbiNWcWqZC8dlJoq5G401vo/hM0LWmIduBHbLbULrKyd53ehB3ZLxojBTrYHsvaqajNW4z0GzAMAt6nLmnYoYcvelBELzntdlN+4fz+IQAqBp23ewgv8eCCrpqBo6o0CUf1+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PSAPR06MB4439.apcprd06.prod.outlook.com (2603:1096:301:80::7)
 by TY0PR06MB5260.apcprd06.prod.outlook.com (2603:1096:400:207::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 01:17:57 +0000
Received: from PSAPR06MB4439.apcprd06.prod.outlook.com
 ([fe80::c772:e1f:2c48:f9ac]) by PSAPR06MB4439.apcprd06.prod.outlook.com
 ([fe80::c772:e1f:2c48:f9ac%3]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 01:17:56 +0000
From: =?utf-8?B?SG9uZ2xpYW5nIFlhbmcgKOadqOWuj+S6rik=?=
	<hongliang.yang@cixtech.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	=?utf-8?B?R2FyeSBZYW5nICjmnajmlrDkvJ8p?= <Gary.Yang@cixtech.com>,
	=?utf-8?B?RnVnYW5nIER1YW4gKOauteWvjOWImik=?= <fugang.duan@cixtech.com>
CC: "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>,
	=?utf-8?B?SG9uZ2xpYW5nIFlhbmcgKOadqOWuj+S6rik=?= <hongliang.yang@cixtech.com>
Subject: [PATCH v6 0/3] phy: Add CIX Sky1 USB3 PHY support
Thread-Topic: [PATCH v6 0/3] phy: Add CIX Sky1 USB3 PHY support
Thread-Index: AQHdbMN99FmueAqJVkeDNl5gof275g==
Date: Thu, 5 Nov 2026 01:17:56 +0000
Message-ID: <20261105011751.4058411-1-hongliang.yang@cixtech.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR06MB4439:EE_|TY0PR06MB5260:EE_
x-ms-office365-filtering-correlation-id: 4cde4f7a-13b0-4066-d3a0-08df3ada9fc5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|3023799007|6133799003|10067099003|261102123227099003|18002099003|261102130727099003|38070700021|56012099006|261021121427099003|261022075727099003|261026121527099003|261022105027099003|261026140227099003|261009223027099003|261028144727099003;
x-microsoft-antispam-message-info:
 mM48Xqk+CABPuMf1T8XXoWkJg0YErhusJvJ4BaIwCdW1L63ZcyCTe2MrOhHd5oqZHxzZPfaWemFZ5bHahkR4VikoZFu1qGqLyMkS+9aAi8nOkrlern8FxLdd0M+vI504cQglEC626TQW08dVGbDahrYDaeEhQOxVxikxwjpgTvc6innTEL6Sv2jZEU7TULLro4mUY1y0TldVfn3lc8Ky3x+OxYSwDFou+QD29km4NAczemPlH2DbuhU4sJnK4KVeSyr3GKpGVH1ZtIL7i/pcMDXQzperVZ57Q3F2AQbs05IoamWSuEWftQjDLrv3H8hKobI/R0/ncWCjXVyZHHV/HSnRrVsgzBj303By2KV2E6VIj4l+hjyoYW5mYXTJvd2KKC/k2z7rXcCBWj9gV32PJieeqoNTVnrzg7cZLv2LRUEqP6XsQykIgI62v3yb0w/SvmrdXJwyL+J1IZUVD8hN/50W08DCP0YvQsLB7LsFDGlgNmJzVoKPGfxdneI3W13uKTbPvXlhzQIOlJWcx0f2FK/SQcv3mPGPTs6fVKVHsLaIttiRnFA1xjmJ1Re8SrkuBjHKrCIKPXZo7EnENluIv2yY0zJV38dQye19/FR/2djb6Wgc9OnJipBbpvn3B9+JqA2fBNNz2B/khTYv6jOIvKTS/N3gboFqBHoAFKB+WKbzoJLHH+/Cy0g6431dO4iYl7dNT6qYdIVRPb88N/M+mU4LH9tyv1fGc9eR5JDPRDE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR06MB4439.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(3023799007)(6133799003)(10067099003)(261102123227099003)(18002099003)(261102130727099003)(38070700021)(56012099006)(261021121427099003)(261022075727099003)(261026121527099003)(261022105027099003)(261026140227099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S01iL1B6OFdKWFNRY21YM253cS9sRWtwOXgyeG5iOHRtcWZsNzF0Y2tWUEFL?=
 =?utf-8?B?OUZINi9sOUEzeU1yR3dHOWhPQVQweHFCeFgrY3NLeHB2VllicVBGTjFYTk1t?=
 =?utf-8?B?T0dWWkJXYUVsTi9seHdLcEVMY3VqRFhaNS8ycEc2ZWdGSTVTLzJTZTRUSVFH?=
 =?utf-8?B?RUNrN0dWOEQ1UEovOVZudG16bmhFRUtxRmZNaldMSDJ4U3BERDM2OTNGWWRD?=
 =?utf-8?B?NExvSE1ydEcvcXVxS3BKckFFRGdzWGdZWC90aGNieXIvaU5TTkxwZFNKaWxS?=
 =?utf-8?B?MU5NUG4xTjJSS3BZaGRHMk9pNTd3bE41em1qb2J5Ky9INzhYMkhYT1VDZFFV?=
 =?utf-8?B?SjEwd3NORlhXR2NQblFjVkVEc2ZqK3B2Z0RNMEdxRmd3d3BxTEJqcVlwSHFS?=
 =?utf-8?B?ekhpNmlKSStTUi9FTVhTQmJLZ1Fwc0NxYkZEeWZRT0dPNGlPRVFqQk9SWEhm?=
 =?utf-8?B?RG1NeUtSekFpL0VBMDJKY2s2OTRJOUZqZHhEOWxjNWRERS9qckYrOWR3YVgr?=
 =?utf-8?B?NjJrOTFvUnEwNWpMVUNNWXdmeDlWMisxekgybFVlUU52RXFxaTlUUVBJVEF2?=
 =?utf-8?B?T3d4RVdPeFdiTkJzOWp5U3VFMkhQM1p3N0NhcGVBUjlOTkFQRVRzK2dnTmxh?=
 =?utf-8?B?NURRaytpc1NBMlprTlJkVUlQUHR1RDlYWGxKMk1JTk1WYjBYNEw5WHJ2NWpq?=
 =?utf-8?B?UlZKSDVseVh1OTZKWXBwcHBDL09uQWg4UkRXZ0laRUxtQnFTaWhDODFSajE4?=
 =?utf-8?B?VEdycUpaMVdqS2tyQjlhWURsSlRvd0VWTWIwcVFjNFQvSDNBa2pxOXNKcklX?=
 =?utf-8?B?Tzl6UTZIMzV2SDViSW5XNGFLVm9Dd0RwbTVGTjV2M2VhZnVGWVN3S200S0RQ?=
 =?utf-8?B?RW9oQXd0c0FxVjZIcWZhbnU5RUI1MHBmUnZzSUVMMnpDVmxoemFLM3JQTEk4?=
 =?utf-8?B?TnBvL01WbXpCaEN5V3R3T3lBcGRFS2x2R3ZpQ0R6N0NZcXh0OVA3dmFaRXFl?=
 =?utf-8?B?aTFma1JCY2lGVzZXU0hlK1VZRmVhUDRRdTNZTzAxSVVGd2owb2U5TGNDSXpZ?=
 =?utf-8?B?dUZ1SmNVc1FWbCtTV2V4a2hSU05ERVRKbzRXWTBkcFFHcG04RkRYVW1JcUtR?=
 =?utf-8?B?ZmtyNTM2TFJWNmViZ3d2UmZSWGY0dWJ4bW9nZDlRdW1hRXVTSUtrSFRER05s?=
 =?utf-8?B?NUd5WXVBNzlwNXk0dkxvMFlWMXptWmVQa3pnTVZXQWpNRCtJMnYzZ0g2VWd3?=
 =?utf-8?B?NDVrTzBkT2cvbjUyb0MxV1NDOGxTeGUwbEZGZHVtekEvNmg1d29Dd0NqeWIr?=
 =?utf-8?B?TmJ1VS80TFFWSjJTWVhkTmlnVVdvSzRvYWhRQllwSXYrdTNiRmxUekU0allQ?=
 =?utf-8?B?eXplSkJoK0RRcmlWekMyYzh2Y1VzZzZaRkpPc1ZPZmxwRSt2aXlKeUhTL0tT?=
 =?utf-8?B?cjN3QTIrSFFFV21qVk4zSm1yck9lRFdiWmsyQXg0REd3blhKTE5WRWtZL1Rq?=
 =?utf-8?B?ZFF5WFVyYTNFUVBrYTNWd280TnJjTlIzUXBnNzc2VGxOY3lDTmZPbGVWamdy?=
 =?utf-8?B?d1lhaThGK0lSNUZUQUhaZ3RTYXE1bG9lN2cyL1N2OFV2VFdPVWprYUZuQWRj?=
 =?utf-8?B?LytkTDZTNzVYRm51VWhjK2s0NWc3TVJWaHJhNWVCN1hJTmJBajR1Z2ExbjI2?=
 =?utf-8?B?dHM3bTR2RExNMGRPcXBNUzRrcnpoRUFoS1RkVDlEcnBJd3lxb0k4SXRhNERa?=
 =?utf-8?B?QjVoaXhUYW5iOTRmNkpwbFdVUHczYllVZ0REVkVXZVZBYnZXNWk4VTlPRTlq?=
 =?utf-8?B?WmJNbk9ZVlNzUU1tcExub1JJT1IzYVVOZDZ6em42SlppWnpyUkVOQVUrZm43?=
 =?utf-8?B?aytjWVBSZGhGbENES1Z0K28yclpxZGRzQjZSKzlCbTNyQkRUa2NTSU9COTNP?=
 =?utf-8?B?U1RsUU1hM3BabFhMV3c2RnhDRTJkMUJVRUczbGJSaHpTZmNhMVBKNCtmWUFO?=
 =?utf-8?B?TFpodXdhY0NDcDlLTnMvYUJuUHBibTl5aW5iQ0hwckYreUVzY3REQ1Q1emNH?=
 =?utf-8?B?bVQySW1Ea2tocHY1NVNZbjNIOHBFWkg4MWhuZkNXR3NrTFVWZjNlWTBSUmQz?=
 =?utf-8?B?MVFaZk9jdXRRU1NmQlp3bVpuSEJZM3dhRU9Va0xzU3dkbERnSVgzVjI4TUh3?=
 =?utf-8?B?aEt6RllLdnlRVUhEM3lpVHBZSFMrRDYwYllXSDBYSkRCbCs3dkxEVzViZ29Y?=
 =?utf-8?B?WHQ2cGZOTVVjTGdVSXBWK3ZPa0cxbmhKb05wdHViRkkrR2dnam41Vzl2d2t2?=
 =?utf-8?B?Mi83Z2lwZ2IwMTd1andUZ2NqKzd1TWlJVU5teG1OQWZ5QjlCVlMzRWRmVVAz?=
 =?utf-8?Q?m67SuJprXJ2F6FWU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9F08F847201B0C40B56CDCBBA75C250A@apcprd06.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4439.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cde4f7a-13b0-4066-d3a0-08df3ada9fc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2026 01:17:56.7386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nBdhf8W2tABw74FGnwgYYS5vJ+hiPIEGLKBNdT3JobL7VqU2tvGD7zOK+cRz+9frIgky3jRd7ZKzdj7ChKa88mxkH7mgknmU+VkDc/hihYI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5260

VGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciB0aGUgVVNCMyBQSFkgaW50ZWdyYXRlZCBpbiB0
aGUgQ0lYIFNreTENClNvQy4NCg0KUGF0Y2ggMSBhZGRzIHRoZSBkZXZpY2UgdHJlZSBiaW5kaW5n
LCBwYXRjaCAyIHRoZSBQSFkgZHJpdmVyLCBhbmQNCnBhdGNoIDMgdGhlIFNvQyBub2RlIHBsdXMg
dGhlIGJvYXJkIGVuYWJsZW1lbnQuDQoNClRoZSBQSFkgcHJvdmlkZXMgdGhlIFN1cGVyU3BlZWQg
bGFuZXMgZm9yIHRoZSBDYWRlbmNlIFVTQlNTUA0KY29udHJvbGxlcnMgb2YgdGhlIFNvQy4gVGhl
IGJsb2NrIGRyaXZlcyBib3RoIFVTQjMgbGFuZXM6IGl0IGlzDQpleHBvc2VkIGFzIGEgc2luZ2xl
IFBIWSBwcm92aWRlciB3aXRoICNwaHktY2VsbHMgPSA8MD4sIGFuZCBpdHMNCmluaXQvZXhpdCBj
YWxscyBhcmUgcmVmZXJlbmNlIGNvdW50ZWQgc28gdGhhdCBib3RoIGNvbnRyb2xsZXJzIGNhbg0K
c2hhcmUgaXQuDQoNClRlc3RlZCBvbiBSYWR4YSBPcmlvbiBPNiAoU2t5MSkgdG9nZXRoZXIgd2l0
aCB0aGUgVVNCU1NQIGNvbnRyb2xsZXINCnNlcmllczogdGhlIFBIWSBwcm9iZXMgYW5kIFVTQiAz
LnggZGV2aWNlcyBlbnVtZXJhdGUgYXQgU3VwZXJTcGVlZC4NCg0KVGhlIGNvbnRyb2xsZXIgZGV2
aWNlIHRyZWUgbm9kZXMgdXNlIHRoZSBQSFkgcGhhbmRsZSBhZGRlZCBoZXJlOyB0aGUNClVTQlNT
UCBjb250cm9sbGVyIHNlcmllcyBpcyBwb3N0ZWQgc2VwYXJhdGVseS4NCg0KVGhlIHNlcmllcyBh
cHBsaWVzIG9uIHRvcCBvZiB2Ny40LXJjMS4NCg0KQ2hhbmdlcyBpbiB2NjoNCi0gRHJvcCB0aGUg
cGVyLXBvcnQgY2hpbGQgbm9kZXM7IHRoZSBQSFkgcHJvdmlkZXIgbm9kZSBpdHNlbGYgaXMNCiAg
cmVmZXJlbmNlZCB3aXRoICNwaHktY2VsbHMgPSA8MD4gYW5kIHRoZSBkcml2ZXIgZXhwb3J0cyBh
IHNpbmdsZQ0KICBQSFkgaW5zdGFuY2Ugc2hhcmVkIGJ5IGJvdGggY29udHJvbGxlcnMuDQotIFNl
bGVjdCBSRUdNQVAgaW4gdGhlIFBIWSBLY29uZmlnLg0KLSBVc2UgZGV2X2Vycl9wcm9iZSgpIGZv
ciB0aGUgcmVzZXQsIGNsb2NrIGFuZCByZWdtYXAgYWNxdWlzaXRpb24NCiAgZmFpbHVyZXMgaW4g
dGhlIHByb2JlIHBhdGguDQotIENvcnJlY3RlZCB0aGUgbWFpbCBzZW5kZXIgbmFtZTogdjUgd2Fz
IHNlbnQgd2l0aCBhIG5vbi1BU0NJSQ0KICBkaXNwbGF5IG5hbWUgaW4gdGhlIEZyb20gaGVhZGVy
LCB2NiB1c2VzIHRoZSBwbGFpbiBBU0NJSSBuYW1lDQogIHRoYXQgbWF0Y2hlcyB0aGUgU2lnbmVk
LW9mZi1ieS4NCg0KQ2hhbmdlcyBpbiB2NToNCi0gRG9jdW1lbnRlZCB0aGUgb3JpZ2luIG9mIHRo
ZSBQSFkgaW5pdGlhbGl6YXRpb24gc2VxdWVuY2UuDQotIFJldHVybiAtRU5PREVWIGluc3RlYWQg
b2YgLUVJTlZBTCB3aGVuIHRoZSBPRiBtYXRjaCBkYXRhIGlzIG1pc3NpbmcuDQotIFVzZSBkZXZf
ZXJyX3Byb2JlKCkgd2hlbiBjcmVhdGluZyB0aGUgY2hpbGQgUEhZcy4NCi0gRHJvcHBlZCB0aGUg
dW51c2VkIGRldl9zZXRfZHJ2ZGF0YSgpIGNhbGwuDQotIEd1YXJkZWQgYWdhaW5zdCB1bmRlcmZs
b3cgaW4gc2t5MV91M3BoeV9leGl0KCkuDQoNCkNoYW5nZXMgaW4gdjQ6DQotIEZpeGVkIHRoZSAj
c2l6ZS1jZWxscyBwcm9wZXJ0eSBvcmRlciBhbmQgcmVtb3ZlZCB0aGUgdW51c2VkIHBoeS5oDQog
IGluY2x1ZGUgYW5kIHRoZSByZWR1bmRhbnQgc3RhdHVzIHByb3BlcnRpZXMgb2YgdGhlIFBIWSBw
b3J0IG5vZGVzLg0KDQpIb25nbGlhbmcgWWFuZyAoMyk6DQogIGR0LWJpbmRpbmdzOiBwaHk6IEFk
ZCBDSVggU2t5MSBVU0IzIFBIWQ0KICBwaHk6IGNpeDogQWRkIENJWCBTa3kxIFVTQjMgUEhZIGRy
aXZlcg0KICBhcm02NDogZHRzOiBjaXg6IEFkZCBVU0IzIFBIWSBub2RlcyBmb3IgU2t5MQ0KDQog
Li4uL2JpbmRpbmdzL3BoeS9jaXgsc2t5MS11c2IzLXBoeS55YW1sICAgICAgIHwgIDczICsrKysN
CiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKw0K
IGFyY2gvYXJtNjQvYm9vdC9kdHMvY2l4L3NreTEtb3Jpb24tbzYuZHRzICAgICB8ICAgNCArDQog
YXJjaC9hcm02NC9ib290L2R0cy9jaXgvc2t5MS5kdHNpICAgICAgICAgICAgIHwgIDE0ICsNCiBk
cml2ZXJzL3BoeS9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKw0KIGRy
aXZlcnMvcGh5L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArDQogZHJp
dmVycy9waHkvY2l4L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgIHwgIDIxICsNCiBkcml2
ZXJzL3BoeS9jaXgvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgfCAgIDYgKw0KIGRyaXZl
cnMvcGh5L2NpeC9waHktY2l4LXVzYjMuYyAgICAgICAgICAgICAgICB8IDQwNCArKysrKysrKysr
KysrKysrKysNCiBkcml2ZXJzL3BoeS9jaXgvcGh5LWNpeC11c2JkcC5oICAgICAgICAgICAgICAg
fCAyODkgKysrKysrKysrKysrKw0KIDEwIGZpbGVzIGNoYW5nZWQsIDgxNSBpbnNlcnRpb25zKCsp
DQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9w
aHkvY2l4LHNreTEtdXNiMy1waHkueWFtbA0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3Bo
eS9jaXgvS2NvbmZpZw0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3BoeS9jaXgvTWFrZWZp
bGUNCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9waHkvY2l4L3BoeS1jaXgtdXNiMy5jDQog
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvcGh5L2NpeC9waHktY2l4LXVzYmRwLmgNCg0KDQpi
YXNlLWNvbW1pdDogNjYyOGU3ZDRjNmIyNWM4ZDE4ZjEzNDVlM2EyMGQyMTgyOWFhZTdlNA0KLS0g
DQoyLjU0LjA=
