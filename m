Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.72
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793692167;
	b=RTG939lEJ2ubV2mbn1fKfyb/RHiaI+QjRWidwXt+5fOX73Yj8rbVCb6hgTbZu+e1pkIM
	 xHo2mSOQSfSbm2vrwTZXH39+hV0155CSZftoki0tvo2Bvkb02uhaJzHNaJQQIi8sFN63L
	 Sf5feX9deQKsaV0MA6gjUS/olsyGWTwCQgrpU//kmFkl0yQHwScg0TmZZFHbQQ+278xFD
	 c7NtO4ceE0tyhCjPMBfOh3pow33yHwY0kFGfs/nkHAl+RsaEYMSXn+AuKTmNv/MDygDpI
	 o38QW75I7a3qhWPjfRLMqKLKJljIsO0R8xZSLVS8VkDxPqXKa9vfzRNWlC1Ooq7FMug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793692167;
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
	bh=0E2Ohx2G5VmfYwMHqm7Hfqq8NfH2LC1irryr5yrxACE=;
	b=Q7Nx6p3rpqEs6VhtEgOsUFzHXqoFyzATcrks2ZhGEz0hjzypcSsFIelFtEtIY4FGcmhS
	 WKMh9eCJrnswAy7qgeYbFI6/ZpGTtB90mQqOw5nnSOGVjbvFq7dbW9qhc/smMawHZqz8y
	 URTvfASZwKMh2Dfz5HDQGAltBxQlgXY/nvHXpqN/HHSRkY+LmoKyS7ooENK0Jj6AIM7CR
	 s2FE9Mb5iYwl1UR/ytBPolWCpGl5CNkEpp/A6H5UzxSs4BsI86IA7rIz+IwARpzS9i2Oa
	 F2zTEf2pC7/k6QAK8/fb44yt6ZhT9sq9WfWpUubpwSAnlCAYQdypiJZh6ZUvvqhhLkg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.72
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022072.outbound.protection.outlook.com [40.107.75.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3A6606A329;
	Tue,  3 Nov 2026 07:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E3A6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KYcTivij9n2Xquh1XnLb5AzyW5h0ItqIneIRlR0yE7MaHuaOW42LEKmjdZ9k/Fi8t9cXMyZauMuY1zcHTH2WSHjacE1gsbgSV0whVuFFtVJ/38WPeru4NI6qNcl/LXkbA0e62IDo6c9ztS581knzhZj9qpuKy/VwZZVWraztfGAwwJERAuDtI7gbCtYMqNY76Ro3F0z1KTD5i2LMzc3BdWEP06VtXljzHT72uWaEXtGQeZDrPuWoaRKqNgTS+FNaGeRz/7MlJyIdIbKuL081wBcOL5IhmeAwe4CZ/351ry8z2Ifzm28SC5Af9ej/XXlnlbz/TW0ff45bcnGWKene2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0E2Ohx2G5VmfYwMHqm7Hfqq8NfH2LC1irryr5yrxACE=;
 b=XjqLlaUbQsV2iAlkEyFC2N7KN/xyoXUjH2dWMUzzWvgCzDrKQCw7qRni2rQGnYBGsHEqiDaM6PVgBalRsrRoJ8TRTLtKFpid/K11cedYABBoTbtlFYCl7u10u8U0foXMDuxxFTSsoUlhSl4lZ5MEIxTg8ucTt0HnYRE6ygn9CbV1gZvERRt54tPWiC1t7d+wrKQlLCryd8K4waRW0eq8xGTO1fNVfJ+V0mlr9ppKnEaJuyo/b5QeR1/0S6V5VK4NT8l1vtOp/bwlNgbC7Tmcyamij63+6IsaAjjJPpIPTJOh6BC9QVxrcCp2DpNj+yFp0bziI237gqouEzIMBhsRXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PSAPR06MB4439.apcprd06.prod.outlook.com (2603:1096:301:80::7)
 by KL1PR06MB6396.apcprd06.prod.outlook.com (2603:1096:820:e1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 07:49:21 +0000
Received: from PSAPR06MB4439.apcprd06.prod.outlook.com
 ([fe80::c772:e1f:2c48:f9ac]) by PSAPR06MB4439.apcprd06.prod.outlook.com
 ([fe80::c772:e1f:2c48:f9ac%3]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 07:49:20 +0000
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
Subject: [PATCH v5 1/3] dt-bindings: phy: Add CIX Sky1 USB3 PHY
Thread-Topic: [PATCH v5 1/3] dt-bindings: phy: Add CIX Sky1 USB3 PHY
Thread-Index: AQHda2fVjAFAnVdLW0KPatOpefM98g==
Date: Tue, 3 Nov 2026 07:49:20 +0000
Message-ID: <20261103074913.1971025-2-hongliang.yang@cixtech.com>
References: <20261103074913.1971025-1-hongliang.yang@cixtech.com>
In-Reply-To: <20261103074913.1971025-1-hongliang.yang@cixtech.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR06MB4439:EE_|KL1PR06MB6396:EE_
x-ms-office365-filtering-correlation-id: 620c2a22-ae66-472a-49ae-08df397ef816
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|38070700021|56012099006|261009223027099003|261028144727099003|261026121527099003|261021121427099003|261026140227099003|261022105027099003|10067099003|18002099003|22082099003|261102123227099003|3023799007;
x-microsoft-antispam-message-info:
 yd0yloTCcDDosRr4L0wh0AxOyc8VLgwePb3kiEvW6O0exp16uaWAcmMNISP3vWUVSofFTYdfCKAL3cAucLCphsDnppM/DbD/axadwagoDxGwLQIn71uRxuFmX5g1d3+cAuiDN7oByR2wqgNca4fES7qqt15yIsggw8jNdZd9NROjppgKjIaSLH8ebinVhZekoixWqW/ZFjVzdfSv7+WY1hfKlZvauFOdo2yif2uFCYU5ujFmL/3u5w5jZWoou6MTcFtHLQ05vn9snmDXyLw3QK6qxEkP1GnnKfzlRcoprhmtLgmEjINEyv23Ps32wah/TbZwv1HS07zUgAjm2o3TbF2MU4vpBJFK1Hzoegg1ATVt1GxLAcoT57P4t5CqDfhpyqpy0eOIAZsHvf2IBelSBLGSHzEOrXxUfl12wt3+M+zBLd5aERBO7k7uBui9m5DeT6i2qLr+ZWBopa61M8Y5nYL9HPdTthSc82Owyn47jV07mTkqqGex+9oENYEJ14zYm1v5jSv3hDwWggSEVCsJFvzj6a5o+gKDAl+1BwYR0u5UmKfpxEiIVB0lKcdAzWdKYWaFXraW93kCzBSAETUe20/8XHc0oJmQLgKUNbaZcGMWYcnAt2JpHfbZYTQpxZUF/T6ptXIyIsSLjhRd04qljWL+Ii58Veg0tnDYafrGV+A=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR06MB4439.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(38070700021)(56012099006)(261009223027099003)(261028144727099003)(261026121527099003)(261021121427099003)(261026140227099003)(261022105027099003)(10067099003)(18002099003)(22082099003)(261102123227099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RHVlY1d3VXk0TXV2Y0NkR21hRmpwa0ZjUjM0MVN1MktMVEwyWDRQZmdXeG83?=
 =?utf-8?B?M1drYXU4YlFaSnZlajhCM0I3aWl2ckk2Vko2R1VYd05PZEFmdU16d3JjdVdR?=
 =?utf-8?B?L290WEtnNFhZU2MyOGpoOUtBNjhFRzJidnJnLytIaGVUZVVDbEdzRkNDNWhP?=
 =?utf-8?B?dE9OekV0SHZlYmV1Qmpud2VyZWxCQzBuaDNqOHRNRUVja1lVOEtoaGk2dE4y?=
 =?utf-8?B?aE5KbG5LUTlkQW1WdDNjOXU1M3V6SnRUejdzZ0hhcVo1TXk1eWtNb29meHpR?=
 =?utf-8?B?YnBCQTAyUGVXZnZQbU1iTDNBcnkrTlFQY1NyVmFkRGQrdGlVaUpEVXJiSVRW?=
 =?utf-8?B?dzloWGlqY2F4aVlDanRVSEtodjlwRE1IS3JRcG9kZ3FaQ3VVZGh4d1FmWlc5?=
 =?utf-8?B?VWtIbVRIUGNHL2dJWExiRkxsK1lBUzJReC9EZm9VS3VCc0pvNjZwNjIySmY2?=
 =?utf-8?B?VFlJQzhXaStVL3hKNlJCMndvYUUyN0gvRWlPeDBWT29OVnNFRWFnbDhzMGNw?=
 =?utf-8?B?RHVvckZWRUNTMm1USUdrbTUzaEZQVGhlY2phN01qdEZlR3NMWlZCZ3BzOTJN?=
 =?utf-8?B?QU1CMHZjaGFybkZxYU8wNG1XaFNkbjR5Nld6MzJMMnQvdmdLcWdXK1E2RTRF?=
 =?utf-8?B?bGUraUxnclZ2Y2Qwd2p1NHlITHdSZkd4NjB3aFFOa2Z1VlFJY21NTGN0WGtx?=
 =?utf-8?B?RzBpaG5DT1dseUhkc05yWDIyWnkzV3RDMExLT2pxaEtqKzFRVDFHUHNuZjQz?=
 =?utf-8?B?UTVKYUtsQ2pid25pRm12UXJxQ0RnWUVjRVpoWWNXQ0NoOEtneTJ5UkVBR3Ba?=
 =?utf-8?B?M0dZbDh3emIyVllxNkt3UWQwR1JLd2QwS2ZXMmJGcU0rOTgwYTJ3VTFKL3Vv?=
 =?utf-8?B?NmZUNEZiQ3FCQnVvVWV0MW5aU3NZeU9QWXNNa2xjQkxlREgzcERtcFZRZHRq?=
 =?utf-8?B?N2dpblFERHhaR2ErSjZidGhrK1BRYnlQZlhyUHAvYklhNjZja1Jva0daTCtk?=
 =?utf-8?B?d3NENXVDVytGekRraC8vQ1Bqbmk3U0FEZDFIbnpWa2hWMlI4RGdHQlNUYlRt?=
 =?utf-8?B?L3JwMTE5NXBkcHR5eFNVcnpGbWpsZWY1NjVCTldKQjRkR0sxTjU3ZmZFVnFi?=
 =?utf-8?B?S25penBxbmJnSkNYZ1hJamxDWTFmV1d1a0ZZMldBTTFSV1BDTlNsb3dCWUt2?=
 =?utf-8?B?OU5LNm9odjI1NnBYdWFsOWdGejRDR3owckVUWDBwMmJ1VUdyZU9JbHpGWk5Q?=
 =?utf-8?B?WWdKYmlXSTJGYlBoUG15R1pRYnhCYi92UngxWXNmMWMzcVpyRyswNllLUC9q?=
 =?utf-8?B?b3hhdjQ4RWhKT1dyUWQ5TmQyRlFlY0dNSlhtRkZ3TjNDcjhyRkp3ZStSb1Vn?=
 =?utf-8?B?eHJTOWo0b0pkTHZPRnZ2TTAzb0g0RWd0ekNMYkNmcDI3Y0Y2eEEyRUEvZm16?=
 =?utf-8?B?OGhMZlhpcEJTQXVCV1lyVGc0Y1pJYk9IQ3BXVkg3bHdreFhWNmxibnplL3pr?=
 =?utf-8?B?cFpRVGk2bk9WS1Q5c0Jta3VxNitkVVp6dDI0L3lXeERKV3FpK1lkUEVDMG1V?=
 =?utf-8?B?eHhqOFRrRGwrait5Ry83a25JTkZpTU1qQ3JqZjdwQ01ZcVNsc0ZaSXlicGdZ?=
 =?utf-8?B?OHFJSDFVa0xBVXJTMVhtN1N3N2hRdUxpR3Fncm5tSStCRjRvMVZVTm52RWdE?=
 =?utf-8?B?bEluQnY1Sm9NUFJRQU1tSWpBMXd0S3RYTW1vZSswZUtqL3NuREhSMENxQmlL?=
 =?utf-8?B?aDhXUVh2QTg2bzBLdVIrTFk1OVhiN1h1WWZDVXRlc1d2aDNYaEQrcU5GcnhW?=
 =?utf-8?B?cmZyTm44T3pCa3RJajRZWXF3YWVCdnlvS2g1dnZaQUpEdFVrcFhRWkVRTUc1?=
 =?utf-8?B?OXhjWkFLNGtRY093WDU1NzBFQ3dMMEZBNWNnMVdVellqQnlVczAzZmtyWjRu?=
 =?utf-8?B?NFRSK3ZOTGx3VWNjRUw0aGFZU0tNYWY1VkJNbHhMZDFtV3RJUlFlUGNmK0dR?=
 =?utf-8?B?b29pdkV6UHpMajRUN1ZMbnBoNWJMTlBkRG9EcTRRdmhsUCt6R0pBKzEwRENq?=
 =?utf-8?B?Vis0TW9xTmJCOEh1QWxjL05qNVZXNmVFUDFTUVQ0MnZPd2lnQ1pyeVRzTVlO?=
 =?utf-8?B?aXh3U0dZclJGR1M0OCtwOWszeGNLeUxYdWo1SjBrWW55MktxUWF2YzB4Nkl2?=
 =?utf-8?B?QlNON25GOTRZcVJsZUl4cUhZcy9DTHRlMnh4UUNOQk01YVZ5OU9iNlIwZjRh?=
 =?utf-8?B?WXBnM1hWRlN5ZXovR0VWQ0d6ejdjQ1Rremwzdmd5ZVdNeXdqMHNEeFlZVmlK?=
 =?utf-8?B?c0NUczVTbHR2VitMQVl5SXRCUDNZN3FEbEZWc2l2MzczS2ZUOG95Ym5sWHVP?=
 =?utf-8?Q?pv1JtarVPz+Ly2Fo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FDA799047D7D484A86B0C506F6E73D57@apcprd06.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 620c2a22-ae66-472a-49ae-08df397ef816
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 07:49:20.0480
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V7uFly6604C1KcogZBs+gdMpk4aAUKD7VB2l9YPNv81R7xiKpa++4paFDjnJ1X+BNqC4BpB26cIB1xM8zOMuz2+zEHv+4/NEj5+LRmPwnlc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6396

QWRkIGRldmljZSB0cmVlIGJpbmRpbmcgZm9yIHRoZSBDSVggU2t5MSBVU0IzIFBIWSwgYSBtdWx0
aS1wb3J0DQpTdXBlclNwZWVkUGx1cyBQSFkgc3VwcG9ydGluZyB1cCB0byB0d28gVVNCMyBsYW5l
cy4NCg0KU2lnbmVkLW9mZi1ieTogSG9uZ2xpYW5nIFlhbmcgPGhvbmdsaWFuZy55YW5nQGNpeHRl
Y2guY29tPg0KLS0tDQp2NCAtPiB2NToNCi0gQWRkZWQgdGhlIE1BSU5UQUlORVJTIGVudHJpZXMg
Zm9yIHRoZSBiaW5kaW5nIGFuZCB0aGUgZHJpdmVyDQogIGRpcmVjdG9yeS4NCiAuLi4vYmluZGlu
Z3MvcGh5L2NpeCxza3kxLXVzYjMtcGh5LnlhbWwgICAgICAgfCAxMDcgKysrKysrKysrKysrKysr
KysrDQogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAy
ICsNCiAyIGZpbGVzIGNoYW5nZWQsIDEwOSBpbnNlcnRpb25zKCspDQogY3JlYXRlIG1vZGUgMTAw
NjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvY2l4LHNreTEtdXNiMy1w
aHkueWFtbA0KDQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3BoeS9jaXgsc2t5MS11c2IzLXBoeS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3BoeS9jaXgsc2t5MS11c2IzLXBoeS55YW1sDQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0K
aW5kZXggMDAwMDAwMDAwMDAwLi41YjAyNWE0OGM4NDQNCi0tLSAvZGV2L251bGwNCisrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvY2l4LHNreTEtdXNiMy1waHkueWFt
bA0KQEAgLTAsMCArMSwxMDcgQEANCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIu
MC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCislWUFNTCAxLjINCistLS0NCiskaWQ6IGh0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3BoeS9jaXgsc2t5MS11c2IzLXBoeS55YW1sIw0KKyRzY2hl
bWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KKw0KK3Rp
dGxlOiBDSVggU2t5MSBVU0IzIFBIWQ0KKw0KK21haW50YWluZXJzOg0KKyAgLSBIb25nbGlhbmcg
WWFuZyA8aG9uZ2xpYW5nLnlhbmdAY2l4dGVjaC5jb20+DQorDQorZGVzY3JpcHRpb246DQorICBU
aGUgQ0lYIFNreTEgVVNCMyBQSFkgaXMgYSBtdWx0aS1wb3J0IFN1cGVyU3BlZWRQbHVzIFBIWSB0
aGF0DQorICBzdXBwb3J0cyB1cCB0byB0d28gVVNCMyBsYW5lcy4gRWFjaCBwb3J0IGlzIHJlcHJl
c2VudGVkIGFzIGENCisgIGNoaWxkIG5vZGUgb2YgdGhlIFBIWSBjb250cm9sbGVyLg0KKw0KK3By
b3BlcnRpZXM6DQorICBjb21wYXRpYmxlOg0KKyAgICBjb25zdDogY2l4LHNreTEtdXNiMy1waHkN
CisNCisgIHJlZzoNCisgICAgbWF4SXRlbXM6IDENCisNCisgIGNsb2NrczoNCisgICAgaXRlbXM6
DQorICAgICAgLSBkZXNjcmlwdGlvbjogQVBCIHJlZ2lzdGVyIGludGVyZmFjZSBjbG9jaw0KKyAg
ICAgIC0gZGVzY3JpcHRpb246IFBIWSByZWZlcmVuY2UgY2xvY2sNCisNCisgIGNsb2NrLW5hbWVz
Og0KKyAgICBpdGVtczoNCisgICAgICAtIGNvbnN0OiBhcGINCisgICAgICAtIGNvbnN0OiByZWYN
CisNCisgIHJlc2V0czoNCisgICAgaXRlbXM6DQorICAgICAgLSBkZXNjcmlwdGlvbjogUEhZIHJl
c2V0DQorICAgICAgLSBkZXNjcmlwdGlvbjogUEhZIEFQQiBwcmVzZXQNCisNCisgIHJlc2V0LW5h
bWVzOg0KKyAgICBpdGVtczoNCisgICAgICAtIGNvbnN0OiBjb3JlDQorICAgICAgLSBjb25zdDog
YXBiDQorDQorICAiI2FkZHJlc3MtY2VsbHMiOg0KKyAgICBjb25zdDogMQ0KKw0KKyAgIiNzaXpl
LWNlbGxzIjoNCisgICAgY29uc3Q6IDANCisNCitwYXR0ZXJuUHJvcGVydGllczoNCisgICJedXNi
LXBvcnRAWzAtOWEtZl0rJCI6DQorICAgIHR5cGU6IG9iamVjdA0KKyAgICBkZXNjcmlwdGlvbjoN
CisgICAgICBBIHNpbmdsZSBVU0IzIFBIWSBwb3J0L2xhbmUuDQorDQorICAgIHByb3BlcnRpZXM6
DQorICAgICAgcmVnOg0KKyAgICAgICAgbWF4SXRlbXM6IDENCisNCisgICAgICAiI3BoeS1jZWxs
cyI6DQorICAgICAgICBjb25zdDogMA0KKw0KKyAgICByZXF1aXJlZDoNCisgICAgICAtIHJlZw0K
KyAgICAgIC0gIiNwaHktY2VsbHMiDQorDQorICAgIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxz
ZQ0KKw0KK3JlcXVpcmVkOg0KKyAgLSBjb21wYXRpYmxlDQorICAtIHJlZw0KKyAgLSBjbG9ja3MN
CisgIC0gY2xvY2stbmFtZXMNCisgIC0gcmVzZXRzDQorICAtIHJlc2V0LW5hbWVzDQorICAtICIj
YWRkcmVzcy1jZWxscyINCisgIC0gIiNzaXplLWNlbGxzIg0KKw0KK2FkZGl0aW9uYWxQcm9wZXJ0
aWVzOiBmYWxzZQ0KKw0KK2V4YW1wbGVzOg0KKyAgLSB8DQorICAgICNpbmNsdWRlIDxkdC1iaW5k
aW5ncy9jbG9jay9jaXgsc2t5MS5oPg0KKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcmVzZXQv
Y2l4LHNreTEtczUtc3lzdGVtLWNvbnRyb2wuaD4NCisNCisgICAgdXNiLXBoeUA5MjEwMDAwIHsN
CisgICAgICAgIGNvbXBhdGlibGUgPSAiY2l4LHNreTEtdXNiMy1waHkiOw0KKyAgICAgICAgcmVn
ID0gPDB4OTIxMDAwMCAweDQwMDAwPjsNCisgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0K
KyAgICAgICAgY2xvY2tzID0gPCZzY21pX2NsayBDTEtfVFJFRV9VU0IzQV9QSFkzX0dBVEU+LA0K
KyAgICAgICAgICAgICAgICAgPCZzY21pX2NsayBDTEtfVFJFRV9VU0IzQV9QSFlfeDJfUkVGPjsN
CisgICAgICAgIGNsb2NrLW5hbWVzID0gImFwYiIsICJyZWYiOw0KKyAgICAgICAgcmVzZXRzID0g
PCZzNV9zeXNjb24gU0tZMV9VU0JQSFlfU1NfUlNUX04+LA0KKyAgICAgICAgICAgICAgICAgPCZz
NV9zeXNjb24gU0tZMV9VU0JQSFlfU1NfUFNUX04+Ow0KKyAgICAgICAgcmVzZXQtbmFtZXMgPSAi
Y29yZSIsICJhcGIiOw0KKyAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47DQorDQorICAgICAgICB1
c2ItcG9ydEAwIHsNCisgICAgICAgICAgICByZWcgPSA8MD47DQorICAgICAgICAgICAgI3BoeS1j
ZWxscyA9IDwwPjsNCisgICAgICAgIH07DQorDQorICAgICAgICB1c2ItcG9ydEAxIHsNCisgICAg
ICAgICAgICByZWcgPSA8MT47DQorICAgICAgICAgICAgI3BoeS1jZWxscyA9IDwwPjsNCisgICAg
ICAgIH07DQorICAgIH07DQpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUw0K
aW5kZXggOTNhYmJiMzE1MDY1Li5iODU3ZTUyOWU1ZTIgMTAwNjQ0DQotLS0gYS9NQUlOVEFJTkVS
Uw0KKysrIGIvTUFJTlRBSU5FUlMNCkBAIC0yOTAzLDggKzI5MDMsMTAgQEAgUzoJTWFpbnRhaW5l
ZA0KIFQ6CWdpdCBodHRwczovL2dpdGh1Yi5jb20vY2l4dGVjaC9saW51eC1tYWlubGluZS5naXQN
CiBGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2NpeC55YW1sDQogRjoJ
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21haWxib3gvY2l4LHNreTEtbWJveC55
YW1sDQorRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9jaXgsc2t5MS11
c2IzLXBoeS55YW1sDQogRjoJYXJjaC9hcm02NC9ib290L2R0cy9jaXgvDQogRjoJZHJpdmVycy9t
YWlsYm94L2NpeC1tYWlsYm94LmMNCitGOglkcml2ZXJzL3BoeS9jaXgvDQogSzoJXGJjaXhcYg0K
IA0KIEFSTS9DTEtERVYgU1VQUE9SVA0KLS0gDQoyLjU0LjA=
