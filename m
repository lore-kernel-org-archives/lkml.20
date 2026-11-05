Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.120
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793841490;
	b=BVFy1hqpZISzAqOwgLJQmueJsnVveI5Qod2IBg03XPXLO4/ct49OFHyL4baAsr6aBw2I
	 i5Sgs4OT2wTk3vIT6qYKJRgQv5WjzXRG8wBlFSkjnfBh1/Mo0jzFfeJQ5ucpvdkV+MLDc
	 p2A7tjOUpLaeiEC7d6cjEmyhCWyMCxC53l5MqG393TPvxA+UgHfQAvzFG6anPwTZASeqF
	 izgSw/1OWmjlo77Z31zUY3yyCGkACNfWz+YqeMVBQHSp0cK1wymgW7ufFn1CWVUo6SS6E
	 JzmCN+2+iGzIuoSvL7TE4kIjtYdfwskQGXvrY7lBgNrCx5x6ujex2LD6YICl49KfMjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793841490;
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
	bh=qkqlTjihXf/e22k/dpShJLtr2mLQpi/eANZ+msrqkSE=;
	b=TDBfgH+W47wVw/I8IyEvU3bad7iSztg5A7eq/o+6zdaw+858cRGIH0d0oE651HihOOCg
	 F9vfMId5+tqqSGnb1EyLZYMZLxQUplW9GMpFqXbKjQV1Rm1Wy21kGAT+Bc/uoONTMkPFi
	 l/JcstiPByvV8+DX6WVgE5yvUGjXjAppJo8MBQ2D57pGBSXgFBbAo3f6eVWaiDWIa7R4m
	 ykmlMKuN+C4htoxDFG55RIHcoFLpXJ7rCJKDupo1Isaiv+vki8Yi79FwWJ8wcp+0CQIB1
	 Wdr6aTwp8nBI5PFp1ig1uq06C6CmqthplKDqxPy8g92OYzhYCWi7z2f/8mEuyxzFZwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.120
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023120.outbound.protection.outlook.com [52.101.127.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1F0606A336;
	Thu,  5 Nov 2026 01:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED1F0606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bAAXcd3mhWdUqGxuqGOaNnmGbT0Eb5TwFrR1NHrlCuXfYTqp5Iu1WlMFJidBfKrF2FcGLCECJroTTxIZfTrrYsKm+CFX2Ve3JQE3TN0jGHByC85SX46Fe7kB/EK3aNdqbrJw/mKXBkci9qU9ZOhS7/RYhSF0ru3O/WqPKCuquNoenM6L4L7S1FCMmIYXwCOWQZP4GXfj49VhKvNy3kTKYn1IY8pf5fyBaRx3Yf5+0fpHZJ4VjbugZj5JeklbBmc8k8dk+KUkepLspmA9xQxtpsKIVvD1tE6NV+qjUv9j2rXABNQXyZMu0i/Kgg65Kd86jCTvpjZM7qrYfI4ejM0tAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qkqlTjihXf/e22k/dpShJLtr2mLQpi/eANZ+msrqkSE=;
 b=a0l28/OO+71XR3sXTZh3uXF6pMddf5Qq7WODJbWplLg05yQs7ulItODRwavhbbCBtpNW0Ozgh23CmGtDcHfYDw5dLHHNaFLpI14mQyAFenYhNBluXwSbfFHlxZm/p2mrECwk54XvTG87xxIH/rCBwjz8STbnrrVt7Lqg0TQut5zCdUYpMohfwZkb7ZITBfrKSvAthHneLR8ToxODNAIzVzcN6a1XLZWXWW7NVk/MkPhkBMcpvz89ITEJHqJZuf+rdAtVJ1v4bdfV7GGMfDij2yQd2x/pqw3GRCVahZS8C7je93E6inbK68A23DgKkk1cgwCgE14cyvqmFjbYfZvk9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PSAPR06MB4439.apcprd06.prod.outlook.com (2603:1096:301:80::7)
 by TYSPR06MB6921.apcprd06.prod.outlook.com (2603:1096:400:468::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 01:17:59 +0000
Received: from PSAPR06MB4439.apcprd06.prod.outlook.com
 ([fe80::c772:e1f:2c48:f9ac]) by PSAPR06MB4439.apcprd06.prod.outlook.com
 ([fe80::c772:e1f:2c48:f9ac%3]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 01:17:59 +0000
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
Subject: [PATCH v6 1/3] dt-bindings: phy: Add CIX Sky1 USB3 PHY
Thread-Topic: [PATCH v6 1/3] dt-bindings: phy: Add CIX Sky1 USB3 PHY
Thread-Index: AQHdbMN+lCsfGNUR+kSEZ14HaRPuNg==
Date: Thu, 5 Nov 2026 01:17:59 +0000
Message-ID: <20261105011751.4058411-2-hongliang.yang@cixtech.com>
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
x-ms-office365-filtering-correlation-id: 6ea715a1-8507-4570-02f5-08df3adaa134
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|3023799007|6133799003|10067099003|18002099003|261102123227099003|22082099003|56012099006|38070700021|261021121427099003|261026121527099003|261026140227099003|261009223027099003|261028144727099003|261022105027099003;
x-microsoft-antispam-message-info:
 czvueykrUXGB8NMk+XMz1x4gFiSvYXml1kKKP0M3JCC4FOR90+XnYzn+WVdJwrgo8CfuHsJavKdO3TBi2kuxnLuAF/7fPf3PHTYU3vbtSJUgXzUPlhLkdXp3i0P5dEKEOS4ywofzGN28KxP86tlM6tlq17ggzzPham6BPeTpINqHC97QKzxYDEEdTp/czEVt3uWBVIvUQe2wyOKZMSsl+ESFwVT++LlCdIsNnF5jVO6ex3V4yHKkE+PdK8iah+1E2NJaZtd9HNur5a9L/AsyA0uuLofQRUKqT2WvOn0hc42wjSJ4wTLgNRBwwIyTClcfxwWXQ/NhgxGelalBYYjdp8hiocJU0R4fQfhS5xCvM2v4lL9VyxBnUm1GsioX3eg9M7em7Mg93fj5pvBq/pHavu1+JSxbHMGu6N9tJczdgwjiKys6NcPyGCStv234FFfU7SEb5Df2PZXEeI4JWzQYEk2hU6gW7BxORBDQtbD6LfUF0uPidu1GTvjJ/s3CHHQt5lZgxCZaHpw0Gax4c9lKonVCtfQ4v0vSnKUPsoWndO4aBZ2/AUoXeHUJbQ4sdmdgQmiIlN/WrcllB0m9fuu6Sfi0h5nzHz9JmzADqtw89McRSuaYvQXFHy17YVxlw8XYF/saRSJRF7t+grs7xl1fyR/Br+SNfMUZ1ozBjtATt2s=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR06MB4439.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(3023799007)(6133799003)(10067099003)(18002099003)(261102123227099003)(22082099003)(56012099006)(38070700021)(261021121427099003)(261026121527099003)(261026140227099003)(261009223027099003)(261028144727099003)(261022105027099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dXJlNEs3MXlFUERvclFHS1loY2RNaDExM0xMSDBxVCszQzQ2NW83azFEVzRT?=
 =?utf-8?B?YjJtaW1UQ0R5M3V1SVpVNmVGTFBwdHErTG1ZdVpEeThadjNUazZ2cm53dDRL?=
 =?utf-8?B?aHpGWUVtdzNmRHRkbDFubktaNWczeVMyVUJMVTFyNDhRcFBQdkdxL1hackFy?=
 =?utf-8?B?Vlhtb2hrN2NFUjRvbGtlamxVSy9TS0doVXBuWHZvNlRjUEhzZlhHT1JwUjND?=
 =?utf-8?B?K0tZWVhFQjJrekt2RVU1UGtlYnlhZWVRWklIOTdtR29qdFd3WUFDQ3IxSVlF?=
 =?utf-8?B?N1RDUE82c1dqN3YyUTN3UlR0RFg3c21uSFVBT0MyQ3c3VWxCTlNEbytFNEps?=
 =?utf-8?B?OWxJTXdET2FWWnVnMitLNTF5SnhKeXQ1NVVSaUk1TW83RjBrSXNNNHBtVFhw?=
 =?utf-8?B?Y2lFUjNzS1dLOHgyd0hVencrWklHbWdkTElVUWpkWkJzTEJWMW82ZFBJVDdL?=
 =?utf-8?B?eitkSHlyT2FBZy8vZjBCc0JpcDJrZ25RU3pBcEtqYm1jK05WZmFFYUg1OEZ2?=
 =?utf-8?B?ZjJXM2dHNDNXMTg5Y2FIeWhLdXFZaXNkSEdNcHc0aUJEbU41cHdtN3hrbmYr?=
 =?utf-8?B?UnBLRVh0dWUwWkRmcVFFWXhQT3BlbHdhWkdMR3FkNzd0SE1scDZnaEQ2QW94?=
 =?utf-8?B?YjFFVGQ4eVNkaFoycW9iZDVDUHBXT0dRRHVFNmlJSmlKRTF5QlYrYVptYUUy?=
 =?utf-8?B?VDkzTFdlSnV6emRBNE5DcGMwMHJmemRUZ3V2WkdnWjlma0czVlRadm1HbUZ3?=
 =?utf-8?B?c3JTVWU3UU4zM3VzSUhNZTZhYk1IUW5PTU04S1ViYzQrSWdITzJNdDVSMWc1?=
 =?utf-8?B?ajhkdU5LT1NjaElsZVBha2ZrZnEzL2FyMVdPa3hMSDlTTnhkWGRGb1dFT1Mv?=
 =?utf-8?B?MFhoM3ZxNlBXOUc5SEFwaTNLVlAwVnBJNWhiWXlhSjFvWVJCUllSTWVYV05u?=
 =?utf-8?B?aFJYS3RyT2NRWURaeGxoVzl5SkUrTXpkWjNtUnVTY0NiK2IzdWE4SXhoSUpq?=
 =?utf-8?B?RE5idXd4eEVTeGdrNjZ3b21uR1JDMWkvZGRzYkR5eU01SW8xMVlEekxIclIv?=
 =?utf-8?B?NkV6OG9jVi8vc1VkengwcDB2cWYvWU9KSi9vTGxocmZ3SzVRYmc5d3VseFk5?=
 =?utf-8?B?a2dka0ZqYkdWdFpZeTZkSkt2MEVhSTR1Q0IxcFU3MTRmYUhBUExZd04zejZl?=
 =?utf-8?B?aGJZYStTWktlTFNoc0NKbW45RmZsOHR1Tmg4dTVmdk94UnpXbXlvK2YxVFVI?=
 =?utf-8?B?cWtRUjdabDM2S045ODlyR3VoMlpOemNBUng1bE9jZlZNaFZDRmdaRHAzeE5a?=
 =?utf-8?B?Wk1EaDRNd2dvcndyeVdvak8wUXdOQ3g1ckFWZTFLZ1RMajJnbkRNUzBOYjI1?=
 =?utf-8?B?WmNoY2pCWnMzY1ZHbVhubVRhdll1OUp5SkVOSnhIdHBMdmdWeUhsNzZOaWJB?=
 =?utf-8?B?enVDdmYwamVSajdqSS84NnVRU0VOZENMVnVnSFMyajJ3NkdRMnliWXlvZHVp?=
 =?utf-8?B?amZ5SDEvNEp4cmtIamJ5YTNvMHlWME5ob1htdVBVSGZ3bmxJT3o5cjBKeGlx?=
 =?utf-8?B?L3NWNGNBYnZvK2tNKzgxanBGaFZUek1zbGlXbzJwWTVwemVkVkdPWkI5T3Nz?=
 =?utf-8?B?aHM4S293L3JYK1R2T04xaTg1VUE4RjBiQm1CYnBUWEswNGpSNFN4RDdXU2dm?=
 =?utf-8?B?ZjdvTlkzUCtDN1NNcEFlZXBqdDlTNjVDNFhGU1RXWWJpS0tuNk15dGk2Q1pV?=
 =?utf-8?B?SnBFWW9zalhFSlJTdVRJYjgzbEk5K0grU1pDSWlVZXhSamlTVHc2WENuWHAr?=
 =?utf-8?B?aEhhcTQyZHZadE9RYTBQdjcxemtlNXA4UU1XaXFNdE1SS3Z1SzdwNTdldXFX?=
 =?utf-8?B?VlB1UG5sR0I1MzBvaUNGZ0hLNThzazFmeHVTdDNJWnZ5NHhVbmtla29leHRB?=
 =?utf-8?B?SjdEb3hhdDBKbDdBeWh4ZUFOaFdIMmczbGYydVkwczFIOENsQ2tSTmVINWo4?=
 =?utf-8?B?VmNJQTdqNEpqdmZnbTFNdC96cVN2a1Q2QTM0bm1BTVZpWENiYjNweTZJSGc5?=
 =?utf-8?B?L3ExRk5oSWV3S0U5M3pQdjM4NUc0M2M0VkNYSXdPRWdNZHZoc0xwSThreGZS?=
 =?utf-8?B?M1VNSGFFanFtRXpYckR1QTdjdlBpbEtOd281MG1LOFo4NWpUcitkRGdnaytj?=
 =?utf-8?B?SnRHeHRzaXppV2lURGt3YlBzZXBjcXJSSFZ6Wk5kd3FGY2RJaUhrUERtNUlw?=
 =?utf-8?B?bndaTzFBbWlCTXR3QlRlSGJOZTh4cGxZZkdabHhEWHdjNGtwUEk4c3lRblBq?=
 =?utf-8?B?ZHppZmlaaHZBeGxWY0VXWWFRN2NuOFBNQkZqcUl0bURlaDFmK3MyZ2hoL0Ft?=
 =?utf-8?Q?E0yvJaE6X1uzEwKM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7FD2F1B720632940A9B581E086191B84@apcprd06.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ea715a1-8507-4570-02f5-08df3adaa134
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2026 01:17:59.1654
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fxKARU/Y9ywEcKMv7WGxw81anh8kpJYhUOD98BHF8E5KTeiQSjadLESEtiS02RYM3EgN3kH1XSjs4S/gNHO8u6MuTNzaxqRK5zNvc6IjysY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6921

QWRkIGRldmljZSB0cmVlIGJpbmRpbmcgZm9yIHRoZSBDSVggU2t5MSBVU0IzIFBIWSwgYSBtdWx0
aS1wb3J0DQpTdXBlclNwZWVkUGx1cyBQSFkgc3VwcG9ydGluZyB1cCB0byB0d28gVVNCMyBsYW5l
cy4gVGhlIFBIWSBibG9jaw0KZHJpdmVzIGJvdGggbGFuZXMgYW5kIGFsbCBjb25zdW1lcnMgc2hh
cmUgdGhlIHNhbWUgaW5pdGlhbGl6YXRpb24NCnNlcXVlbmNlLCBzbyB0aGUgUEhZIHByb3ZpZGVy
IG5vZGUgaXRzZWxmIGlzIHJlZmVyZW5jZWQgd2l0aCBhDQpzaW5nbGUgI3BoeS1jZWxscyA9IDww
PiBzcGVjaWZpZXIuDQoNClNpZ25lZC1vZmYtYnk6IEhvbmdsaWFuZyBZYW5nIDxob25nbGlhbmcu
eWFuZ0BjaXh0ZWNoLmNvbT4NCi0tLQ0KQ2hhbmdlcyBpbiB2NjoNCi0gRHJvcCB0aGUgcGVyLXBv
cnQgY2hpbGQgbm9kZXMuIFRoZSBwYXJlbnQgbm9kZSBpcyB0aGUgUEhZIHByb3ZpZGVyDQogIHdp
dGggI3BoeS1jZWxscyA9IDwwPiwgYXMgdGhlIGJsb2NrIGRyaXZlcyBib3RoIGxhbmVzIGFuZCB0
aGUgcG9ydHMNCiAgc2hhcmUgdGhlIGluaXRpYWxpemF0aW9uIHNlcXVlbmNlLg0KLS0tDQogLi4u
L2JpbmRpbmdzL3BoeS9jaXgsc2t5MS11c2IzLXBoeS55YW1sICAgICAgIHwgNzMgKysrKysrKysr
KysrKysrKysrKw0KIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAyICsNCiAyIGZpbGVzIGNoYW5nZWQsIDc1IGluc2VydGlvbnMoKykNCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9jaXgsc2t5MS11
c2IzLXBoeS55YW1sDQoNCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcGh5L2NpeCxza3kxLXVzYjMtcGh5LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcGh5L2NpeCxza3kxLXVzYjMtcGh5LnlhbWwNCm5ldyBmaWxlIG1vZGUgMTAw
NjQ0DQppbmRleCAwMDAwMDAwMDAwMDAuLmRjNDcxYjM4NzMzOQ0KLS0tIC9kZXYvbnVsbA0KKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9jaXgsc2t5MS11c2IzLXBo
eS55YW1sDQpAQCAtMCwwICsxLDczIEBADQorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQ
TC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpDQorJVlBTUwgMS4yDQorLS0tDQorJGlkOiBodHRw
Oi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9waHkvY2l4LHNreTEtdXNiMy1waHkueWFtbCMNCisk
c2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCisN
Cit0aXRsZTogQ0lYIFNreTEgVVNCMyBQSFkNCisNCittYWludGFpbmVyczoNCisgIC0gSG9uZ2xp
YW5nIFlhbmcgPGhvbmdsaWFuZy55YW5nQGNpeHRlY2guY29tPg0KKw0KK2Rlc2NyaXB0aW9uOg0K
KyAgVGhlIENJWCBTa3kxIFVTQjMgUEhZIGlzIGEgbXVsdGktcG9ydCBTdXBlclNwZWVkUGx1cyBQ
SFkgdGhhdA0KKyAgc3VwcG9ydHMgdXAgdG8gdHdvIFVTQjMgbGFuZXMuIFRoZSBibG9jayBkcml2
ZXMgYm90aCBsYW5lcyBhbmQgYWxsDQorICBjb25zdW1lcnMgc2hhcmUgdGhlIHNhbWUgaW5pdGlh
bGl6YXRpb24gc2VxdWVuY2UuDQorDQorcHJvcGVydGllczoNCisgIGNvbXBhdGlibGU6DQorICAg
IGNvbnN0OiBjaXgsc2t5MS11c2IzLXBoeQ0KKw0KKyAgcmVnOg0KKyAgICBtYXhJdGVtczogMQ0K
Kw0KKyAgIiNwaHktY2VsbHMiOg0KKyAgICBjb25zdDogMA0KKw0KKyAgY2xvY2tzOg0KKyAgICBp
dGVtczoNCisgICAgICAtIGRlc2NyaXB0aW9uOiBBUEIgcmVnaXN0ZXIgaW50ZXJmYWNlIGNsb2Nr
DQorICAgICAgLSBkZXNjcmlwdGlvbjogUEhZIHJlZmVyZW5jZSBjbG9jaw0KKw0KKyAgY2xvY2st
bmFtZXM6DQorICAgIGl0ZW1zOg0KKyAgICAgIC0gY29uc3Q6IGFwYg0KKyAgICAgIC0gY29uc3Q6
IHJlZg0KKw0KKyAgcmVzZXRzOg0KKyAgICBpdGVtczoNCisgICAgICAtIGRlc2NyaXB0aW9uOiBQ
SFkgcmVzZXQNCisgICAgICAtIGRlc2NyaXB0aW9uOiBQSFkgQVBCIHByZXNldA0KKw0KKyAgcmVz
ZXQtbmFtZXM6DQorICAgIGl0ZW1zOg0KKyAgICAgIC0gY29uc3Q6IGNvcmUNCisgICAgICAtIGNv
bnN0OiBhcGINCisNCityZXF1aXJlZDoNCisgIC0gY29tcGF0aWJsZQ0KKyAgLSByZWcNCisgIC0g
IiNwaHktY2VsbHMiDQorICAtIGNsb2Nrcw0KKyAgLSBjbG9jay1uYW1lcw0KKyAgLSByZXNldHMN
CisgIC0gcmVzZXQtbmFtZXMNCisNCithZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCisNCitl
eGFtcGxlczoNCisgIC0gfA0KKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svY2l4LHNr
eTEuaD4NCisgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Jlc2V0L2NpeCxza3kxLXM1LXN5c3Rl
bS1jb250cm9sLmg+DQorDQorICAgIHVzYi1waHlAOTIxMDAwMCB7DQorICAgICAgICBjb21wYXRp
YmxlID0gImNpeCxza3kxLXVzYjMtcGh5IjsNCisgICAgICAgIHJlZyA9IDwweDkyMTAwMDAgMHg0
MDAwMD47DQorICAgICAgICAjcGh5LWNlbGxzID0gPDA+Ow0KKyAgICAgICAgY2xvY2tzID0gPCZz
Y21pX2NsayBDTEtfVFJFRV9VU0IzQV9QSFkzX0dBVEU+LA0KKyAgICAgICAgICAgICAgICAgPCZz
Y21pX2NsayBDTEtfVFJFRV9VU0IzQV9QSFlfeDJfUkVGPjsNCisgICAgICAgIGNsb2NrLW5hbWVz
ID0gImFwYiIsICJyZWYiOw0KKyAgICAgICAgcmVzZXRzID0gPCZzNV9zeXNjb24gU0tZMV9VU0JQ
SFlfU1NfUlNUX04+LA0KKyAgICAgICAgICAgICAgICAgPCZzNV9zeXNjb24gU0tZMV9VU0JQSFlf
U1NfUFNUX04+Ow0KKyAgICAgICAgcmVzZXQtbmFtZXMgPSAiY29yZSIsICJhcGIiOw0KKyAgICB9
Ow0KZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMNCmluZGV4IDkzYWJiYjMx
NTA2NS4uYjg1N2U1MjllNWUyIDEwMDY0NA0KLS0tIGEvTUFJTlRBSU5FUlMNCisrKyBiL01BSU5U
QUlORVJTDQpAQCAtMjkwMyw4ICsyOTAzLDEwIEBAIFM6CU1haW50YWluZWQNCiBUOglnaXQgaHR0
cHM6Ly9naXRodWIuY29tL2NpeHRlY2gvbGludXgtbWFpbmxpbmUuZ2l0DQogRjoJRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9jaXgueWFtbA0KIEY6CURvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tYWlsYm94L2NpeCxza3kxLW1ib3gueWFtbA0KK0Y6CURvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvY2l4LHNreTEtdXNiMy1waHkueWFtbA0K
IEY6CWFyY2gvYXJtNjQvYm9vdC9kdHMvY2l4Lw0KIEY6CWRyaXZlcnMvbWFpbGJveC9jaXgtbWFp
bGJveC5jDQorRjoJZHJpdmVycy9waHkvY2l4Lw0KIEs6CVxiY2l4XGINCiANCiBBUk0vQ0xLREVW
IFNVUFBPUlQNCi0tIA0KMi41NC4w
