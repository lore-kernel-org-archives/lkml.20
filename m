Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.120
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793841488;
	b=M/AwlfszUVbLEfu7ho17c/TgBn+WC3O4VkuTRW525IQY0PrSuJqGtWG0DbGyHRmcMuS/
	 Crd6Yy0HJ1DXeKBL5caPvJMQnL7buN0HzA1f/064JcUdRAh1mrQV//u6qoP2Um0z5LJ0M
	 6gP7NS/V4CPfj8nwCrzCQBkFaM9/OVEchGtZQA/0XdvPLakveaSUMq1mw/9spG5lBjjNk
	 pO1+x6pm55V/1EWJuarIRCpd69vqzjW9w+1mx6QN2MNRe0gDHNBdo2Vh+SUNzLi8YkBSq
	 gWqpueYu0ru5H+8GWtbpq9Ep7yZSfSpXNXbOZzOhob614sUn+M2MK86rbZr+vweFXZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793841488;
	h=DMARC-Filter:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
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
	bh=VcnbjJ7PCQI/zx2Xv/viQa9NsVNyNsIC6XML6O7LE4w=;
	b=khWFySILPVWy1Bw90enJF/wWP/1z2iGo0/EPMTuICdaBj4j2GbeTSTjHWtI1Fn2fTnEe
	 /Jx/0A7GGHvkKwFgKqZYTDELTwqUiDLG9OE3Xm3xp90N2E9avghsCsCJe414wbXiFJVSZ
	 vj0rQkSRr0BdC+wQNcvr58sAh7SVRVj2R/mxWl0WOkhprsZcIGf0xakab4uQTvYjnpAIR
	 nWBHPy6qQBGOOSgeJg6ozq+BDoMyvjd8FMEPsrbrQTxj0AYw+Isa6DT3WBbK3ZYs0idQl
	 lOzHRMmV0tAkEQf7iTQGlGRtRET9GVQtBc9ylwlEiS9vGLRa2dXsA8G33tCoF/BIhLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.120
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023120.outbound.protection.outlook.com [52.101.127.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7AD606A328;
	Thu,  5 Nov 2026 01:18:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B7AD606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F/+W1n/FUQdmXhlYVyozXoZYVuppLshiguSBTi2Dj0fRoiGmyOPrabHPqUqiloT2gylaLER8jyyfZAZjfPuCqvhTmxuY6vsJvQPkzyjjBFI0BmKqfAzqS4zwai0CjbDs1hN/OF6ElksylgQsaRQq2k5fFsgQheFteMwNfJM6xL6ILRjiq0rFWTZV+S77kJDf84+IPhJJQo0x49K30pwHka0ilyTZIaeocRP7tJ83atom8DZ7yULh0eWqmH5Wj/G1XxmT53Vc+kdUr2hRJ1rt1XqH5QydFTT8fqnvm3bxaIG+acupA3jtyOvDIHXVvp6ZSogwD3M3bwxrsAVtbg96YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VcnbjJ7PCQI/zx2Xv/viQa9NsVNyNsIC6XML6O7LE4w=;
 b=TvXaHxkYKQpJfBEcWsK0qwmphK8Pl8QTiRY4V7VBhGQIX2pXsJAXnNKxQHtLInjznSp2IbW0fmvv5cx18sPO4yxGFNqFJaYSBIO9r11naF0JWRxlI6kF4tkKs2rx+n6v+NRLd851hzHfIrFV35+AgdRTkkh67x47TsK6lvxQaao+r88ZiJgr9LJu/TTdxxR3dRdDjULdgdr9qHR5Q1CYtlszYtYhEkZgZ9E8gEv9xtHT6DlKHAcfenRI/isWnsgN6P33ItDi6rRtkMR6wxpUdYeWyYmABbmAKiJ8uBZ975ChW9/WqU05jKZ69OwyzRyicv6VfcuUwg70HB5V/7bMeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PSAPR06MB4439.apcprd06.prod.outlook.com (2603:1096:301:80::7)
 by TYSPR06MB6921.apcprd06.prod.outlook.com (2603:1096:400:468::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 01:18:02 +0000
Received: from PSAPR06MB4439.apcprd06.prod.outlook.com
 ([fe80::c772:e1f:2c48:f9ac]) by PSAPR06MB4439.apcprd06.prod.outlook.com
 ([fe80::c772:e1f:2c48:f9ac%3]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 01:18:02 +0000
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
Subject: [PATCH v6 3/3] arm64: dts: cix: Add USB3 PHY nodes for Sky1
Thread-Topic: [PATCH v6 3/3] arm64: dts: cix: Add USB3 PHY nodes for Sky1
Thread-Index: AQHdbMOACq8ByRvfqEuXr7a7RIL6oA==
Date: Thu, 5 Nov 2026 01:18:02 +0000
Message-ID: <20261105011751.4058411-4-hongliang.yang@cixtech.com>
References: <20261105011751.4058411-1-hongliang.yang@cixtech.com>
In-Reply-To: <20261105011751.4058411-1-hongliang.yang@cixtech.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR06MB4439:EE_|TYSPR06MB6921:EE_
x-ms-office365-filtering-correlation-id: a54b790e-cc96-469a-d3d2-08df3adaa335
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|10067099003|18002099003|261102123227099003|22082099003|56012099006|38070700021|261021121427099003|261026140227099003|261009223027099003|261028144727099003|261022105027099003;
x-microsoft-antispam-message-info:
 Fw4r6oskQ84c4cmNGUrkWfhNswhyBsrx31TWvXD5NmkITjopYY5lgytq7eQoIZx9FXx+6hhisI+lL3L8ZzYIr2c0o8E0atDXeca/DHaviV2CKGVYaRsLtGi7/hACyK6f7s2oZw+7bzCZfii5bqboNgqjwCQVEaGMLiO5Ka+LE/SYfNniP3CHrZeR+eiZQVreNKli8U1Y8xaD+Co4kxd8QCgicVanA2ain1xZd3m8eMbTR5mk6F8rWsiJHhyaKZuqs5xd0pnPbKUuYQZIXK1hAoccZ1SpKYVEKYEc8SS1jIJ67Mv2UETBZlYXTs8jddgw0EtyylCBXOiYErRS0x7oshWz/T5BgvAwOdmNSpujeA5HTgEUTTZSsLVIaD1ZWg59iYOu4wr4MZM0/fofMAZHR0iVsKSlbZM/ROXgZI7HFDXO+MkbLoBgTbOrLpDAXmp+Rr0+9AIvNCNgXa6AbwHGi07Y1qnye9hzVkwhGiVL+3kb4p9/dnS3e+lfqtaqZO6ALrn0g8hV4MGJNJRRQAGMtMBEYwHPNx9wF5tai8opE/6wEcoF3HvL80j7EXzNks9/LoBBmm51DmnaRPI+2s7351zr3iwGF6qYMGS/RPspMU4w8C+rSxRrOwC0K8nSOl2qwUAaOE+aj++iN0TXjp4KPGpn7bN/js+koPz3z7rM9f/BBd+0UpWV5T2RP/lVVt9XxeH14xbthiTnFkrealuTMajXMEoCsoWYU6ogtUUpzR4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR06MB4439.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(10067099003)(18002099003)(261102123227099003)(22082099003)(56012099006)(38070700021)(261021121427099003)(261026140227099003)(261009223027099003)(261028144727099003)(261022105027099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cTR2dmlEQTJCdTRFVDRYcmZpNGJlbkQ3OUdFaGZJbWppaDBkeVQ5U3lqQ3pS?=
 =?utf-8?B?VXRaaHZiYWVmYTd5WWlyTW5Nc3Z4TEdxd3QxUUhpVTZ6dlVVUm4xTXdUZkhu?=
 =?utf-8?B?TWU4YXUwKzBEbjJ6S2hXYWt6YXNLai85MUVEWS9GakE1Z05LSmxsU1J2WjVL?=
 =?utf-8?B?UzJYMlJsU1RBVFNTSlhBM2lXOTEvVnVSa1B2RXVLb0lweWtTdk5jRWYrMVN6?=
 =?utf-8?B?YXdLOEc3S0NmTDFWTlpCUFU3VDUzMEdZdXB6S25MOW1xQ2FxVEY2blFTeEsw?=
 =?utf-8?B?ZHdoY1plcklEWjV0a09LSlRZUi9CQm9QZU1zMHF1N2ZWbm1SMlluMUxJL1dy?=
 =?utf-8?B?eCtocVlySWlDVFZROGQrRW13U3k0eWRHRTJRWVBFNlNMR1RiaHpIcVk5K21O?=
 =?utf-8?B?VWZweFk2Z3FVTExjbEJXQXpZMG90T1lmbVk3YytZekJzSFZQUjBHM0lTaEpI?=
 =?utf-8?B?NkIzWWV5anBLWkRrRnhVN2xGaEVqdE9ab3kwY1ZoTlFIUEovTFNvaElXUjds?=
 =?utf-8?B?R0pIVU96MlNoREJXbFNiQXFQdGYzTHRlK2lqc2ZYMXQzOTl2czlDL1JnZlNR?=
 =?utf-8?B?QitaVW5TbVJObk1wQ05RQzI3SWVMdUczMUsrdnY1dXpmbktJTkU4Q3p4Rysw?=
 =?utf-8?B?djlJSDdHMjI4dGt0dldvT0pNY0lzWFN1bzZMK0liWTlmenVuem1sODZyeUhl?=
 =?utf-8?B?WXZxQkEyZ1NJQkVmMHlsYUxaaHdzNVN0T0t4bEprQldBQ2M5Zk5vQXBwU1RP?=
 =?utf-8?B?b0tzWEwxUDJMdmI5cjlYSDlxRGNzOGR3dHBxL092S1JFK21qNDd3L3ZKSUh5?=
 =?utf-8?B?OTI2bEVGYzFxZTV6MlJTVlBmTE51RkNram1pdUQ3NitqbWFRSTlWaHdEQUEy?=
 =?utf-8?B?YUFuM0RSOTZmMXl2cFluRHNtWGRLNUt6VEhBNjRSZnhDVzVZbWN1c2oxZ3Vo?=
 =?utf-8?B?RHdRbTIzUnNsNVZneklCYnVCNnBNSzhNbzlTcHB2RkdBR1pJMlo2aWw0b0dQ?=
 =?utf-8?B?TmpWcjNiWFVKTUxZRERPbC83TFVhTnFhZEJtKzVWN1NFNkFkWTdzVE9YK3Zr?=
 =?utf-8?B?YUlFalorcFd6aDB4NUJSbzJKYlBRbzJzQXNxOFU5VlFaRndFdXYzMzUzL1hK?=
 =?utf-8?B?R2UreTZlbENBR1M5L29MNWxTb0ZoTWdRUU9ZMHFaRWd2akNYMWpoK0U5eUVE?=
 =?utf-8?B?UVRDWE82R2tvYXYyeFRTMjM5aGV2OVZRSFNMeVpTcFVNL3JSMWdWemc0aGMx?=
 =?utf-8?B?ZVBaNjBwRVpTbEhtcGJwakptZk0vMGtXcjR4bzZIbitjM2R4OXdiOHlyWXQv?=
 =?utf-8?B?KzN1VjMySElyNXB1N2UxazVoWTdxR01NRXM5S0c2UjNydE1CK2FLaG5Zb04y?=
 =?utf-8?B?eEdlNmUrZi8wbmdPWVRwSnB4cHkzaXRVUmp6SjQrMWxSeXJycHErR1R6VVl0?=
 =?utf-8?B?bFVXQ2RzWi9zM2hxbmNZV3lNYjltYWpJS1RuTDFvc0REUUQ0bTViK2pHMEph?=
 =?utf-8?B?eXRxQnExRk1jaGZhbHQ4bFRDb21IOGJGb01rV2E1dlBFWUJNLzQ2bmpJM3Iv?=
 =?utf-8?B?MzZ6bmxOa3NIWmFBdzJQaVlQakE3SEhqNjRmVWN4OGdtUm84bUZZNHZKTFJX?=
 =?utf-8?B?N2Z0d1pnYzdDUVlOSUkxWDJuMFN6ajRLR1U3QVg5NzU0V29SNzJxbjJQb29s?=
 =?utf-8?B?OWV6K0Z1bGRCRGpKeEl0YTJQYThYZC9Ca0JldnlZeXQ0V0MwdXFGYk0rRTRu?=
 =?utf-8?B?aHlaQVcxZU1nM09uaGtua0lYYVRoNlZmcURsYXVUVStyNVFFZ0hhN0Y0azha?=
 =?utf-8?B?NmU2ZS9zcmUvMXVoVElMNFNEZlJTd2NUdTVRaVltQWZFRGJvTUhGUU53TzE4?=
 =?utf-8?B?VmNoaXdna0lSMTAxbWI0K3JjMmsraTJtTmRFaWw0VXRjUGxOcSt0alVzdmt3?=
 =?utf-8?B?a0NmK0kydDZkTHVtQzJnZ01WOTBWTXpVMGc3MTdrR2lBQUFRTUtuVHFUNDdQ?=
 =?utf-8?B?N1BIU1NQc0V4T2FNMVBUZTBNejlOalQxSmZzSVVFcDczamZ0SFdIWEhSR0JT?=
 =?utf-8?B?aFpmSFlQVW1Jc1BPN1BFSllwZHBBZVpsVmxRdHI2N0JwbUhRMXZxSlNHdFRs?=
 =?utf-8?B?ckZYREIxVktwcE9UYUxEYjB2MzNaTTRBbndGNmhLaWhOajMwWnRyZHIvaHds?=
 =?utf-8?B?dE1BaWVRSlAvNjZjN1loYmExRlZVc1VqYzVaQmJPa0pPeGIxTnBOSUQySEJu?=
 =?utf-8?B?RjA5RmlLOXFNMXMxNTdsQjJCd1Fnb0c4SVM3YVpkQ205b1VtcFgvSUdHc0ll?=
 =?utf-8?B?OVRPQzV0SXJRK2tMYzlCUTVhcml2anFYdE1CYjFwc2RkVDNuZSsvVHE4NXl6?=
 =?utf-8?Q?buVFh+tE0UJD3M3o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E5B90E81F321F0468E43A36AF400A1CE@apcprd06.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a54b790e-cc96-469a-d3d2-08df3adaa335
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2026 01:18:02.4872
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dKG/MXUbQTbxmETn7ZJZA8xoCWNHtJEQA1e0th4f4WYDNrYnUPnWHm95cmiNu58MKmya7hHeelfifTB9qKmXlAo/VRh5IQUpL+MpCn6Rfc8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6921

QWRkIHRoZSBVU0IzIFBIWSBub2RlIGZvciB0aGUgQ0lYIFNreTEgU29DIGFuZCBlbmFibGUgdGhl
IFBIWSBvbiB0aGUNClJhZHhhIE9yaW9uIE82IGJvYXJkLg0KDQpTaWduZWQtb2ZmLWJ5OiBIb25n
bGlhbmcgWWFuZyA8aG9uZ2xpYW5nLnlhbmdAY2l4dGVjaC5jb20+DQotLS0NCkNoYW5nZXMgaW4g
djY6DQotIERlc2NyaWJlIHRoZSBQSFkgYXMgYSBzaW5nbGUgcHJvdmlkZXIgd2l0aCAjcGh5LWNl
bGxzID0gPDA+IGluc3RlYWQNCiAgb2Ygb25lIGNoaWxkIG5vZGUgcGVyIHBvcnQuDQotLS0NCiBh
cmNoL2FybTY0L2Jvb3QvZHRzL2NpeC9za3kxLW9yaW9uLW82LmR0cyB8ICA0ICsrKysNCiBhcmNo
L2FybTY0L2Jvb3QvZHRzL2NpeC9za3kxLmR0c2kgICAgICAgICB8IDE0ICsrKysrKysrKysrKysr
DQogMiBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL2NpeC9za3kxLW9yaW9uLW82LmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9k
dHMvY2l4L3NreTEtb3Jpb24tbzYuZHRzDQppbmRleCBlMzljODc3NzRjMTIuLjVkNTdkZDllYTI5
OSAxMDA2NDQNCi0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvY2l4L3NreTEtb3Jpb24tbzYuZHRz
DQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2NpeC9za3kxLW9yaW9uLW82LmR0cw0KQEAgLTEx
NywzICsxMTcsNyBAQCAmczVfZ3BpbzIgew0KICZ1YXJ0MiB7DQogCXN0YXR1cyA9ICJva2F5IjsN
CiB9Ow0KKw0KKyZ1c2IzX3BoeTQgew0KKwlzdGF0dXMgPSAib2theSI7DQorfTsNCmRpZmYgLS1n
aXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2NpeC9za3kxLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL2NpeC9za3kxLmR0c2kNCmluZGV4IDBhODIwZjQ1ZmViOS4uYzA4MWI2M2E5ODQ4IDEwMDY0
NA0KLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9jaXgvc2t5MS5kdHNpDQorKysgYi9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL2NpeC9za3kxLmR0c2kNCkBAIC02MDYsNiArNjA2LDIwIEBAIG1ib3hfYXAy
c2ZoOiBtYWlsYm94QDgwYTAwMDAgew0KIAkJCWNpeCxtYm94LWRpciA9ICJ0eCI7DQogCQl9Ow0K
IA0KKwkJdXNiM19waHk0OiB1c2ItcGh5QDkyMTAwMDAgew0KKwkJCWNvbXBhdGlibGUgPSAiY2l4
LHNreTEtdXNiMy1waHkiOw0KKwkJCXJlZyA9IDwweDAwIDB4MDkyMTAwMDAgMHgwMCAweDQwMDAw
PjsNCisJCQkjcGh5LWNlbGxzID0gPDA+Ow0KKwkJCWNsb2NrcyA9IDwmc2NtaV9jbGsgQ0xLX1RS
RUVfVVNCM0FfUEhZM19HQVRFPiwNCisJCQkJPCZzY21pX2NsayBDTEtfVFJFRV9VU0IzQV9QSFlf
eDJfUkVGPjsNCisJCQljbG9jay1uYW1lcyA9ICJhcGIiLCAicmVmIjsNCisJCQlyZXNldHMgPSA8
JnM1X3N5c2NvbiBTS1kxX1VTQlBIWV9TU19SU1RfTj4sDQorCQkJCTwmczVfc3lzY29uIFNLWTFf
VVNCUEhZX1NTX1BTVF9OPjsNCisJCQlyZXNldC1uYW1lcyA9ICJjb3JlIiwgImFwYiI7DQorDQor
CQkJc3RhdHVzID0gImRpc2FibGVkIjsNCisJCX07DQorDQogCQlwY2llX3g4X3JjOiBwY2llQGEw
MTAwMDAgew0KIAkJCWNvbXBhdGlibGUgPSAiY2l4LHNreTEtcGNpZS1ob3N0IjsNCiAJCQlyZWcg
PSA8MHgwMCAweDBhMDEwMDAwIDB4MDAgMHgxMDAwMD4sDQotLSANCjIuNTQuMA==
