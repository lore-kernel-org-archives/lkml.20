Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792739159;
	b=Y4HdrnWXyKGCgUp+QIiwyKfhQihIy5bc/QayJR6D4mdACRmabWAgoZlXoO2kikdybDU/
	 /sypuq3V63tqTA2/nb7sZq/TuvxuBVi5k9GbFagUBhGnzWg2S+VJ53kzI2SnXSAX8uStP
	 oHmxTxmJe2UxV/6OO8Ym3daBHww4wHYPXDTrarU9qFw7Gk1IBU1dppN9cikRN+9jePdVA
	 HN9o5fefRvQTSEKm7Uqq63E/razE4yXv12Wo+IpSSBvWlAROVS0aRQKDNAps60VXgS26U
	 IHSJe5K5sZSsjaRD8ucRYpiB3XHraeRIyuGD+rcypGmePyOrX6Q7JCIU+W5Bf7OGAvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792739159;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 msip_labels:x-ms-exchange-messagesentrepresentingtype:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-sharedmailbox-routingagent-processed:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
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
	bh=AJmmhMhbpqEP/8tmwF3wbbCSvRZW2t8TMcJ8IKwtNhM=;
	b=mm+FUmFWbjjOBoS//9V2sdhJ5thFv/dxNOnVYnijB4AusZUEP+2kTJYw2i9K6BTGkGas
	 JKJsqkNv9kXyFnFIACBFch4I34J4D5yR/pIB3LBo9PInCIuVT3Wd/m1OHoCxV4qHOmXP8
	 5kPJ9B9GGoYjKGd85Txo0c8ifphNPBvlqMdMN5TW7fFkf61kBNS1oQ6jtrpb9zdmq73Lp
	 +rsYTCDY9SM+c/pnNXbP/F8K7LNAB/oB2v2nsCM4lA0KYLWRKl3ptSojBOiiIBHGh0ZUN
	 woqBxlBnJsLJUS2RQgAhrjode58vxZtIwPMVQ1Kjq+MbAAL/1xVEPZl0NjmPd/Pz5yQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=vs1Lqydb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.30
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011030.outbound.protection.outlook.com [52.101.70.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8A7606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:05:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C8A7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=vs1Lqydb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RsLIk1LryX4nPU/D1DaQqgrsYhd8qBgi+w7CUPtQweOlVYLttQ2mAFmH8unH+ON6Nh6+tPdgNfpOMENDcu4J48W1J3cp7SeoVXDhnMuqpI7ctEOG9ubOGmZZfnCMFquz9TZjCE3/XM4foNtnIHxshPv2ThackuzKQCuSXlKgUA8NLlhxgz2s+AYAsNb1cwownT1sijPLlxl/kfoM/cbAUL2RGRGA5g8eo+ltQDvDEm11RnGxxJKcq3oXuFBUZOZj+B2uBRQVyZbagXF3A3hHQ5LVoeSlVuEgzjallEZT7Oj1ZDiY3Gax/rBqa/vdYquGXi/1Iva1p4jQyss79+E1Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJmmhMhbpqEP/8tmwF3wbbCSvRZW2t8TMcJ8IKwtNhM=;
 b=ZbLFDv0h8LbCtHXpG19FGiO+pcyZ6XkDRpJYhdM66HD7mqtYsA9PEXc7Vu7SS10A1nRaaGiYuEzUV90aB0zPTRwN2e+RCdpmDB7WY5Pg8Szj+1YqOJs1KaaKuoxkj+u5PWUIOHtfEVau+4/9NnwmNsr5dOvPuuoeAapQM1CgXJ/pZpDqGjpo9m7dkaTgbsl5uzaSbPoppnpLEIeUE2tNVgNXYQjO8BjHAxMl4acYE27OBq68aD1JP4IznYxsGAo6Og7eb5LKF/GaRmhlAsOxN/y25TgtVo7uoG3ibAxymeajb/jP2YrIGwfodj8Md164Ty9FpKSR4d8JAvUPZHDFYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJmmhMhbpqEP/8tmwF3wbbCSvRZW2t8TMcJ8IKwtNhM=;
 b=vs1LqydbHulrCpGDaHAxR+WPzQYQ6KaRWlx/7bIwkMu9dq1xL6id8b6zTDqp8TCo7TTvOQEVKUqoVE6RyK738gIzwTz5ewYQr9VywR8m4x9a4WUyfa49awEVXVE4H3+mNqj+6OYdc0w8iRFhA54O9S5pRxpPLkJqf4KaGmq44ShBrgDRKjQLxQX0Rl7iBz0p0z8d62YfRal1/+egI7DAvtH3IIwRAEj2Z7DfSXmc1G9tGvjT7pPxrnsTp3mwWWJpKXRPG/+KKOwCAbbWDyGLp+IAVlbKC91l2ptMjH/RrzmF32JaP4JSkjdRrV+fBfOtpCE2/KHwmUYOsAZuKrRNyg==
Received: from AS8PR04MB8820.eurprd04.prod.outlook.com (2603:10a6:20b:42f::13)
 by GVXPR04MB10562.eurprd04.prod.outlook.com (2603:10a6:150:214::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 07:05:55 +0000
Received: from AS8PR04MB8820.eurprd04.prod.outlook.com
 ([fe80::35d2:bfbc:a06e:fcb]) by AS8PR04MB8820.eurprd04.prod.outlook.com
 ([fe80::35d2:bfbc:a06e:fcb%7]) with mapi id 15.21.0546.017; Fri, 23 Oct 2026
 07:05:55 +0000
From: "Bough Chen (OSS)" <haibo.chen@oss.nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, "Bough Chen (OSS)"
	<haibo.chen@oss.nxp.com>
CC: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "michael@walle.cc"
	<michael@walle.cc>, Bough Chen <haibo.chen@nxp.com>
Subject: RE: [PATCH v4] mtd: spi-nor: clear the default read_sr2 opcode for
 Octal DTR flashes
Thread-Topic: [PATCH v4] mtd: spi-nor: clear the default read_sr2 opcode for
 Octal DTR flashes
Thread-Index: AQHdYhHR2/Yd7MVVY061vtNTfMDGBrcJYnvVgAFTQnA=
Date: Fri, 23 Oct 2026 07:05:55 +0000
Message-ID:
 <AS8PR04MB88203C0D0623BCD048C10C7090642@AS8PR04MB8820.eurprd04.prod.outlook.com>
References: <20261022-spi-nor-fix-v4-1-fba3ec3d2b5e@nxp.com>
 <87o6cmovny.fsf@bootlin.com>
In-Reply-To: <87o6cmovny.fsf@bootlin.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8820:EE_|GVXPR04MB10562:EE_
x-ms-office365-filtering-correlation-id: 6c24ce9f-d401-4b33-907f-08df30d4151c
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|366016|23010399003|376014|1800799024|7416014|6133799003|18002099003|22082099003|261022105027099003|261022075727099003|3023799007|11063799006|5023799004|4143699003|261009223027099003|10067099003|261021121427099003|56012099006|38070700021;
x-microsoft-antispam-message-info:
 Dur4Tfc12ZOlzIe2kICeAbjkCOffm16VCDZLTF3WJ3zjCIW3jSKOHOiyKivY3y+Ca5BSZ46te+oO7KWlzuX50kGEXVvSy8WVg9l+cBfBmNTF2gctVsDQqBNMLmy6GnHv+xkN2iUPtcI5OL17MVMHDCQ+C3PtQzGE+LgoOcvdS4iid1E0lusleZR8fo8kY5hlgcOQJMaTkg67D5TXEkSzDjbBRVvBIfOfdt7LmIHn6XXT/65wqPsCAegxGoJZxM9kY+iSqUNPVZOx2YDgredjfur6TVE3Kt2iaYQHeDWi5JVazwg40+FB7I8wBzr5ylMEWPJnxFg8XNaeJ8Z8eD1p1pLXySXLwk7LCoundgu+lu/GBoWo8VR+hhljFM9fx/yfJ4OfdwYp5LmID8bV3LoaEITmwgAX0/mgbbRw5/3G6niCitYqLQFrD50V39l1R2rO1ZMw+sRA+Lfnf1ldybzw8eFp5h92FbSLdzyL/JN6tFEePc0dFqMDDhyBJIXa4EzquPpUHx7aJbepe42AxGGW0tyndZzYaKW1pb/vdymiuXlOpUzqHT0MIjbDPaf5ZAotUULRv1RIwWi/LCrtjKR3HEv/3WuxkCs8dmHJS+9fa9RQ5g+tmYKEPaO+OsAwICfzyVOFOvk3F5lpocd2V55Dwp6CmscH9lnOwYg722gocWN3i0FYsjRbiJ+lK5LoYkzcMAW9bCSSVEjfeoi/S6GMYS+nmvQ9tNaQvK0RWrvEd8A=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8820.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(376014)(1800799024)(7416014)(6133799003)(18002099003)(22082099003)(261022105027099003)(261022075727099003)(3023799007)(11063799006)(5023799004)(4143699003)(261009223027099003)(10067099003)(261021121427099003)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZmNJVCtUdGIwUUlrempXbXFzUFJnS1VWQjNPZjhPOEhkeGt4dkpBMGZLZWNq?=
 =?utf-8?B?bXNVYzVnNFUyRUdTeThZMnRoczUrRHNvQmN2MkU2TGhwUVd3UTV4T0RlRDFa?=
 =?utf-8?B?V1lIdlpTNTZWamtBZyttS1dMU1Vod2diQ0NkNmYxRUlESmtOelNKV3FwTmlL?=
 =?utf-8?B?SEtDQkJZQkIvOG1mdlpVSlY5bzdnMlArTW5yWDI0R1NyN0krQWVLYzJwSC96?=
 =?utf-8?B?dkZYYjZXMG5PRmR5NFdTdTJwVENzR1lWZWs3b2lRUXVXSWpzazdybElzc1JP?=
 =?utf-8?B?eEF2Q2RBN21BZGxtVG94eHZyQTVDNXFEeG9XWGp1Q3NFWXkwdGFCeHZTZU1s?=
 =?utf-8?B?eHRiVmp2ejR2VTVlenMzRkFJZnFDbXptV3RhNkhmanQ2bER4VFNPV3BQR3c1?=
 =?utf-8?B?MUN6T2pSUHJaVDBaOHVkNTQxaHhDSlVWNmpJay9kZ3BzRU5qWDJqR24xcWlt?=
 =?utf-8?B?WGp5am5VV2hlc0dzNm95ZFFkYjNEblczYTlJNTBPYjdLZHlxTld6ckVUeGhJ?=
 =?utf-8?B?NDhSRWJYOGxIUTRvTHZ3VDNHNEU0K3FxNGFkWHcxaHVDU3JPcmNTRWVuVHQx?=
 =?utf-8?B?dm1Xdm4rMDVtRFlQWmxMcnZBNXZnUlJOTXF4RndCUklJVHF5NmJKMUdFSkNL?=
 =?utf-8?B?WHltclZJTEdCdndEWEhMbm5aNUxBTEQ4dFF3dzcwOHA1MUwzYnh2MjZZVmlu?=
 =?utf-8?B?WEhRblc4WnFqcW8xUFdzTWJJSG56MXV1TE9QZ0tINVk4akJDNjQ5VXhMaEti?=
 =?utf-8?B?ZnJYUG5hRWxqYWFvWGx6VlRMMjdReStCaUQ2eWFUaGRjK2lWTEczdTNkWlNZ?=
 =?utf-8?B?YTNzY2J0b3Fpbnc4NzVpa29iaU1vT2hnZFdwM1JqaGt1NzgrY3dLcnNDY2NI?=
 =?utf-8?B?VlVyR0xCenowZ3cwNGdjRUxYQ0QrRkREeDROSFp6TVB3aWNOTVJxbHViTlBx?=
 =?utf-8?B?RER5K1NQYVRBcWN6Y2Q1aUtNbDdxWE5Vc3FwU09aZWRtOGNSMFA5N1BMVVhP?=
 =?utf-8?B?U1p0MFliYTZ4WG1NcEZIcmxmSFFaZUU3VXBsU2pvbHFEVG56Wit2RGFzNU10?=
 =?utf-8?B?K0gzYUpXM2JBTHRBUnpoTExxMFFjdlRlZ0lTNkg4akNGTzJFNHQxZ1VZcHJ2?=
 =?utf-8?B?djgwNXN6cUs2V2l2b3BmYTFHNnhhNmVBRHJtM2M2akdQdTBVb1VZZ1d1K0xJ?=
 =?utf-8?B?R3NKK2VHMHdZTElKTTlIUXJmREdtQmpsSXJDbk1EVXRvRGdZVXRaTzYzUFBV?=
 =?utf-8?B?T1RZSXFuRm16QkVpVW43c1QzQUlqYjRJVkE5Z0JsbllxakdxWEdHZzlpZW9N?=
 =?utf-8?B?ZHFiMTI0MXBtdkpCSk5Yai9rNVB5dkhYZHp6NThDNi8xSitjMjEyUG5ldE5y?=
 =?utf-8?B?OFAxWmY0Z1pLUXFZUSt2NzlPTVlqTEpkV0xkZjNlMlVJOHljNjI3azhQNmxp?=
 =?utf-8?B?M0dEb1B4czAyYTA1SFAxcmovN2FoaW4wQ3A5QkdFUHNiSTB0SXkraVV6NkND?=
 =?utf-8?B?SXVITUExRWJ4TjNPa2VoU3NPUVF5NW1FWjJPTGRyMmhMVjZUMjhITWJwS2RH?=
 =?utf-8?B?aHl6RC9jZHl1NzhkcFk0MmNEaW56R0RMb2FSdGtJOVBSL0I4WEx6cGl6bVhF?=
 =?utf-8?B?NjZicDZHMXp6N3RyaWJjWGdZeFBGTnNSVG9FNVBDQURXSHZPY3V0bml1clVy?=
 =?utf-8?B?YXV3MHVRTkNPUXpWamF5ZUZTWElxN3lIN3prZU5HVStUcnJEMURpTkNTUGtV?=
 =?utf-8?B?YlpscmJKQzlhT2llRktwcGxOTVdYWGZSZDhKd1VLaXpsalJUVnNPQWxVdkhr?=
 =?utf-8?B?cFJhVm1tb2ZkbS9mb0FaVFd3bDhiNGRlcGFHcXlzN1MySnpCMytjWjVKSkNI?=
 =?utf-8?B?czJxVXFYSWFwZWRsdHBTaWU4NUREZ1hRa3JyeDc0bE00WXVqMzVoSmY1R2lQ?=
 =?utf-8?B?cGJBb2RzMURhK2paT2lUT0lkeFpLZkFEL1ZEME41SXFTYmVzaVB5YzNZVHpo?=
 =?utf-8?B?eTdOV0xpSlcwaTAzTytjS201blluSXRJbFpTaURUdFMzeDNiWjJTbnlFTzZO?=
 =?utf-8?B?ZDF5U005eDJtakQ1WFUyQmNxT2x0MVN1QWNENkVOMzBvQlp0bXpoODRzQUtV?=
 =?utf-8?B?MDA3RXVEb2lEa3JuTUE1V3JUWHVwOGRZTXY2Q0IvVmdKS01GMUlydFBEVVhG?=
 =?utf-8?B?SC9XR05WRDVDTFBTaG1tYUdwN0xBbVVHM2hndG5ibldxZXpCdmdPZnFpSDdL?=
 =?utf-8?B?UXpFdEJLWlRxSUNkOEpkUjV3eklDRm1oZ0w3ZFA5NWN0c1BJbnMvQlhSbjRz?=
 =?utf-8?Q?tLgieZyNQEpHZiwvFz?=
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
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8820.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c24ce9f-d401-4b33-907f-08df30d4151c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 07:05:55.5242
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bVjGLIh0slMY7fIwUXey9zULtPAQxJX4O4M/0EAWcsQ+mYoBIxnkl0QJ9QDWYvcxLjkVd8m7RwMz650ht5Vx1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10562

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNaXF1ZWwgUmF5bmFsIDxtaXF1
ZWwucmF5bmFsQGJvb3RsaW4uY29tPg0KPiBTZW50OiBUaHVyc2RheSwgT2N0b2JlciAyMiwgMjAy
NiA2OjUxIFBNDQo+IFRvOiBCb3VnaCBDaGVuIChPU1MpIDxoYWliby5jaGVuQG9zcy5ueHAuY29t
Pg0KPiBDYzogUHJhdHl1c2ggWWFkYXYgPHByYXR5dXNoQGtlcm5lbC5vcmc+OyBNaWNoYWVsIFdh
bGxlDQo+IDxtd2FsbGVAa2VybmVsLm9yZz47IFRha2FoaXJvIEt1d2FubyA8dGFrYWhpcm8ua3V3
YW5vQGluZmluZW9uLmNvbT47DQo+IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+
OyBWaWduZXNoIFJhZ2hhdmVuZHJhDQo+IDx2aWduZXNockB0aS5jb20+OyBsaW51eC1tdGRAbGlz
dHMuaW5mcmFkZWFkLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGlteEBs
aXN0cy5saW51eC5kZXY7IG1pY2hhZWxAd2FsbGUuY2M7IEJvdWdoIENoZW4NCj4gPGhhaWJvLmNo
ZW5AbnhwLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NF0gbXRkOiBzcGktbm9yOiBjbGVh
ciB0aGUgZGVmYXVsdCByZWFkX3NyMiBvcGNvZGUgZm9yDQo+IE9jdGFsIERUUiBmbGFzaGVzDQo+
IA0KPiBPbiAyMi8xMC8yMDI2IGF0IDE4OjQ1OjE2ICswOCwgaGFpYm8uY2hlbkBvc3MubnhwLmNv
bSB3cm90ZToNCj4gDQo+ID4gRnJvbTogSGFpYm8gQ2hlbiA8aGFpYm8uY2hlbkBueHAuY29tPg0K
PiA+DQo+ID4gVGhlIGNvcmUgZGVmYXVsdHMgb3Bjb2Rlcy5yZWFkX3NyMiB0byB0aGUgbGVnYWN5
IFJEQ1Igb3Bjb2RlICgweDM1KSwNCj4gPiBhbmQNCj4gPiBzcGlfbm9yX2NhY2hlX3NyX2xvY2tf
Yml0cygpIHJlYWRzIFNSMiBkdXJpbmcgc3BpX25vcl9pbml0KCksIGkuZS4NCj4gPiBhZnRlciB0
aGUgZmxhc2ggaGFzIGJlZW4gc3dpdGNoZWQgdG8gaXRzIHJ1bnRpbWUgcHJvdG9jb2wuIE9uIGFu
IG9jdGFsDQo+ID4gZmxhc2ggcnVubmluZyBpbiA4RC04RC04RCBtb2RlIHRoZSBvcGNvZGUgaXMg
ZXh0ZW5kZWQgcGVyIGNtZF9leHRfdHlwZQ0KPiAoZS5nLg0KPiA+IDB4MzUzNSksIGJ1dCBSRENS
IGlzIG5vdCBhIHZhbGlkIHJlZ2lzdGVyIHJlYWQgdGhlcmU6IHRoZXNlIHBhcnRzDQo+ID4gYWNj
ZXNzIHRoZWlyIHN0YXR1cy9jb25maWd1cmF0aW9uIHJlZ2lzdGVycyB0aHJvdWdoIGEgdmVuZG9y
LXNwZWNpZmljDQo+ID4gaW5kaXJlY3Qgc3BhY2UsIGlmIGF0IGFsbC4gVGhlIGZsYXNoIGRvZXMg
bm90IGFuc3dlciwgdGhlIHJlZ2lzdGVyDQo+ID4gcmVhZCB0aW1lcyBvdXQgYW5kIHByb2JlIChv
ciByZXN1bWUpIGZhaWxzIChvbiBpLk1YIEZsZXhTUEk6DQo+ID4gLUVUSU1FRE9VVCBhbmQgYSBj
b250cm9sbGVyIFdBUk4oKSwgc2VlbiB3aXRoIGEgTWljcm9uIE1UMzVYVTAxRyBhbmQNCj4gYSBN
YWNyb25peCBNWDI1VVc1MTM0NUcpLg0KPiA+DQo+ID4gQ2xlYXIgcmVhZF9zcjIgb24gZXZlcnkg
cGF0aCB0aGF0IGVuYWJsZXMgOEQtOEQtOEQsIHNvIHRoYXQNCj4gPiBzcGlfbm9yX3JlYWRfc3Ix
X2FuZF9zcjIoKSBkZWdyYWRlcyB0byBhbiBTUjEtb25seSByZWFkIGFuZCBubw0KPiA+IHVuc3Vw
cG9ydGVkIGNvbW1hbmQgaXMgaXNzdWVkLiBBIG1hbnVmYWN0dXJlciBkcml2ZXIgdGhhdCBnZW51
aW5lbHkNCj4gPiBuZWVkcyBhbiBTUjIgcmVhZCBpbiB0aGlzIG1vZGUgY2FuIHN0aWxsIGluc3Rh
bGwgaXRzIG93biBvcGNvZGUgaW4gYQ0KPiA+IGxhdGVyIGZpeHVwLg0KPiA+DQo+ID4gLSBzcGlf
bm9yX3BhcnNlX3Byb2ZpbGUxKCk6IHRoZSBjb21tb24gY2FzZS4gVGhlIHhTUEkgUHJvZmlsZSAx
LjAgdGFibGUNCj4gPiAgIGRvZXMgbm90IGRlc2NyaWJlIGFueSBTUjIvUkRDUiByZWFkLCBhbmQg
aXQgcnVucyBiZWZvcmUgdGhlDQo+ID4gICBtYW51ZmFjdHVyZXIgbGF0ZV9pbml0Lg0KPiA+IC0g
bXQzNXh1NTEyYWJhX3Bvc3Rfc2ZkcF9maXh1cCgpOiBzb21lIG10MzV4dTUxMmFiYSBiYXRjaGVz
IGxhY2sgdGhlDQo+ID4gICBQcm9maWxlIDEuMCB0YWJsZSBhbmQgZW5hYmxlIDhEIGhlcmUgaW5z
dGVhZCwgd2l0aCB0aGUgQkZQVCBRRVIgZmllbGQNCj4gPiAgIGxlZnQgYXQgYSByZXNlcnZlZCB2
YWx1ZSBzbyByZWFkX3NyMiBrZWVwcyBpdHMgUkRDUiBkZWZhdWx0Lg0KPiA+IC0gc3BpX25vcl9u
b19zZmRwX2luaXRfcGFyYW1zKCk6IG5vbi1TRkRQIHBhcnRzIHRoYXQgZW5hYmxlIDhEIHZpYQ0K
PiA+ICAgU1BJX05PUl9PQ1RBTF9EVFJfUkVBRCBrZWVwIHRoZSBSRENSIGRlZmF1bHQgdG9vLg0K
PiA+DQo+ID4gQ01QICh0aGUgb25seSB1c2VyIG9mIFNSMiBiZXlvbmQgcXVhZC1lbmFibGUgaW4g
dGhlIGxvY2tpbmcgY29kZSkgaXMNCj4gPiBXaW5ib25kLXNwZWNpZmljIGFuZCBpcyBub3QgcGxh
Y2VkIGluIFNSMiBvbiB0aGVpciA4RC1jYXBhYmxlIHBhcnRzLA0KPiA+IHNvIG5vIG9jdGFsIGZs
YXNoIGxvc2VzIGEgdXNhYmxlIFNSMiByZWFkIGJlY2F1c2Ugb2YgdGhpcyBjaGFuZ2UuDQo+ID4N
Cj4gPiBGaXhlczogYjdiNjM0NzU5MDNjICgibXRkOiBzcGktbm9yOiBDcmVhdGUgYSBsb2NhbCBT
UiBjYWNoZSIpDQo+IA0KPiBJcyB0aGlzIHN0aWxsIHJlbGV2YW50Pw0KDQpJdCBqdXN0IHRyaWdn
ZXIgdGhlIGlzc3VlLCBidXQgbm90IHRoZSByb290IGNhdXNlLg0KSSB3aWxsIHJlbW92ZSBpdCBp
biBuZXh0IHZlcnNpb24uDQoNCj4gDQo+ID4gRml4ZXM6IDYzNDg5MDAyZDM5NyAoIm10ZDogc3Bp
LW5vcjogUmVmYWN0b3IgUmVhZCBTdGF0dXMvV3JpdGUgU3RhdHVzDQo+ID4gc3VwcG9ydCIpDQo+
IA0KPiBXaWxsIGJlIG1lcmdlZCBpbiB0aGUgbmV4dCBjeWNsZSwgc28gQ2M6IHN0YWJsZSBpcyBw
cm9iYWJseSByZXF1aXJlZC4NCg0KWWVzLCB3aWxsIGFkZCBpdC4NCg0KPiANCj4gPiBTaWduZWQt
b2ZmLWJ5OiBIYWlibyBDaGVuIDxoYWliby5jaGVuQG54cC5jb20+DQo+ID4gLS0tDQo+IA0KPiBS
ZXZpZXdlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4NCg0K
VGhhbmtzIQ0KDQpSZWdhcmRzDQpIYWlibyBDaGVuDQo+IA0KPiA+IENoYW5nZXMgaW4gdjQ6DQo+
ID4gLSBGb2xsb3dpbmcgdGhlIFNhc2hpa28gcmV2aWV3IGFuZCBNaXF1ZWwncyBwcmVmZXJlbmNl
LCBrZWVwIHRoZQ0KPiA+ICAgY2FwYWJpbGl0eS1iYXNlZCBjbGVhciBidXQgY292ZXIgZXZlcnkg
cGF0aCB0aGF0IGVuYWJsZXMgOEQtOEQtOEQsIG5vdA0KPiA+ICAgb25seSB0aGUgeFNQSSBQcm9m
aWxlIDEuMCBvbmU6DQo+ID4gICAgIC0gc3BpX25vcl9wYXJzZV9wcm9maWxlMSgpICh0aGUgY29t
bW9uIGNhc2UsIGFscmVhZHkgaW4gdjMpLA0KPiA+ICAgICAtIG10MzV4dTUxMmFiYV9wb3N0X3Nm
ZHBfZml4dXAoKTogc29tZSBiYXRjaGVzIGxhY2sgdGhlIDhEIGNvbW1hbmQNCj4gPiAgICAgICBp
bmZvIGluIFNGRFAgc28gUHJvZmlsZSAxLjAgcGFyc2luZyBtYXkgbm90IGNsZWFyIGl0LA0KPiA+
ICAgICAtIHNwaV9ub3Jfbm9fc2ZkcF9pbml0X3BhcmFtcygpOiBub24tU0ZEUCBwYXJ0cyB1c2lu
Zw0KPiA+ICAgICAgIFNQSV9OT1JfT0NUQUxfRFRSX1JFQUQuDQo+ID4gLSBDaGVja2VkIGFsbCB2
ZW5kb3IgZHJpdmVyczsgTWljcm9uIGlzIHRoZSBvbmx5IG9uZSB0aGF0IGVuYWJsZXMgOEQNCj4g
PiAgIG91dHNpZGUgUHJvZmlsZSAxLjAgcGFyc2luZy4gTWFjcm9uaXggYW5kIEN5cHJlc3MgcmVs
eSBvbiBQcm9maWxlDQo+ID4gMS4wLg0KPiANCj4gV2luYm9uZCBhcyB3ZWxsIChzZWUgbXkgVzI1
UXh4UFcgc2VyaWVzKS4NCj4gDQo+IFRoYW5rcywNCj4gTWlxdcOobA0K
