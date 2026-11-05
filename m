Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.117
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793841515;
	b=vlxbSXT3XCfrFHyP8GRtY0z1ZGTUll8N/A7dArloIIBWfXFLSogdDoo0C46ttPgBe9s0
	 DH9Gmn9Xo546ml4x2UJgpAEXRNy42wieyPs6IwNZbipdSCh4UyVY81P72q7Jh21Oa0lQ+
	 rR8BUzM8hcNhHyTPI4TsQue5B0selY3NTCfvH9X4zirnDLLE5nndi1ejNG+QLKkHsUt8y
	 SS2Sh62xjOBQZET9cCkrFlDIL9dYxdMo2VW5kRgcAOKEAN+vcqD/WfK/eBiW0E8r04ZUe
	 EmMNNi73mPjhaiEj0+UNBio0RE7e3UJTVclw7AR3MgWVhlis9ZAeknnnPopbDpLKH/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793841515;
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
	bh=Fxk/d0vRFsy7TZdg1AKNuX4V1llC0WLv54UM7uixpJc=;
	b=ght5R26p8ZuBYxuucCs/26ndoDrOe9WQGzTHajb3bTIodbk6J/6SLooKgCNSFjdrk04O
	 y067nNNdp/kMAxOni7BsetoKqQa7XI/dIpb2xn/nyWMlw3geYz5/4Iq/g7MDuNsJuLLDq
	 3VJzh2++cmp226sc1gNtiQThlmOMpyDHtY2Q+oLa4pSKXhgiouxzbKbFfnVzmFfR8XZru
	 nmU1sHRxha8O6lxjI2p2pD7W/dy2w0kXcHm7ZD3XXkuR+L//BpOZj4uRmQEV6cB0TjpJd
	 FuhOgLvaKUZWDoRYhSamIQDAoX/QsM7MDuoNdnJMhndMToUqI52ntmTdBviPLq2bNOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.117
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022117.outbound.protection.outlook.com [52.101.126.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0796082BE7;
	Thu,  5 Nov 2026 01:18:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D0796082BE7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8T4WYhYQh5reg3NxDU2/OLVESxtCJWWx3S455HoxLPWes/8QDEBQZNhoiaAJJoJQMaHvs0VttQDivRBXdPkIAK1inYlBa1LdZcqsR0CZ8AH0NZsCe6cd1TgPBKVSakA0MQSy0oC0BNsLwAcnL0hNVwzlHP0vzGfFFpR41SfnF9grnWSdXQQLlFKAkx1pG/XNtxvH05dqonBVltsibkgMfFdiMMejs7mRxwf4EqtzMswB1dA2WcJXxjuQxm8Dxid8AtNTrn11ydjQNTVRlQNQC/IbED2LtGPKi0RDel9H9M3uC+quc2c3tI7In8K0H4h/4tZ/Au4sWDVVbcdNU4cMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fxk/d0vRFsy7TZdg1AKNuX4V1llC0WLv54UM7uixpJc=;
 b=WEQ90N2onylNVHp8loWwhF9nObAIa3R9PgzAWhM+SmeKnaFFw1l3T/0aMGibHHNXQJgSkkHCzMRlyw0u+VK2nzQU8PT+TKD9A1UzkCypx/XZwxj4d1MCg4EWm7rwJS8m19ztSuEdI67aoBCRYtvxjYeWEjEkuRa8OCLpxUa9xsBod45zjHVQ54tWjAHHBSMfxfhFYTBqxprwZWaM6s9oOnbMewQWvpLVpo7iSvvNvTDSZ2LmfqQltbt6MdRVS8+utZCiCN2+O+I0Frv3TTSuesn3NT27Cbq7KDgQhz75+TPcUGQBl+thJvnP9m+vtEXqyfvlgKdexiHYL+ajvJOVaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PSAPR06MB4439.apcprd06.prod.outlook.com (2603:1096:301:80::7)
 by TYSPR06MB6921.apcprd06.prod.outlook.com (2603:1096:400:468::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 01:18:32 +0000
Received: from PSAPR06MB4439.apcprd06.prod.outlook.com
 ([fe80::c772:e1f:2c48:f9ac]) by PSAPR06MB4439.apcprd06.prod.outlook.com
 ([fe80::c772:e1f:2c48:f9ac%3]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 01:18:32 +0000
From: =?utf-8?B?SG9uZ2xpYW5nIFlhbmcgKOadqOWuj+S6rik=?=
	<hongliang.yang@cixtech.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
CC: =?utf-8?B?SG9uZ2xpYW5nIFlhbmcgKOadqOWuj+S6rik=?=
	<hongliang.yang@cixtech.com>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>
Subject: Re: [PATCH v5 2/3] usb: cdns3: Add CIX Sky1 glue driver
Thread-Topic: [PATCH v5 2/3] usb: cdns3: Add CIX Sky1 glue driver
Thread-Index: AQHda2fmb5kzM5xl90uIP03GIHDimrccB+SAgAKoaIA=
Date: Thu, 5 Nov 2026 01:18:31 +0000
Message-ID: <20261105011825.4058785-2-hongliang.yang@cixtech.com>
References: <20261103074929.1971195-3-hongliang.yang@cixtech.com>
 <81dcaef70174ea7746bbc5a31777770717c14357.camel@pengutronix.de>
In-Reply-To: <81dcaef70174ea7746bbc5a31777770717c14357.camel@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR06MB4439:EE_|TYSPR06MB6921:EE_
x-ms-office365-filtering-correlation-id: 06d909f3-487d-42e3-248d-08df3adab4e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|18002099003|22082099003|56012099006|38070700021|4143699003|261026140227099003|261028144727099003|261022105027099003;
x-microsoft-antispam-message-info:
 NejnXVDEQEMHR16i+VgR23AwCsvPtX5H57J5LRb0/MJyWsv53mJo9dYfUqOKwxIt/ZXnJh8kR0x2Sruf+N6wIOKaKjF6xccjyiEKhkO0CMgX3TcVlnVI0StgrF/mqrHFgHTQoxRbvXXvQPFCXsiFPRtbNGVfbXzJNGLthbOnlnyykKws4qr5tlg5ik2Y3WCqwSpvfCEQsQr56KINR+YqQqrKwrJDMv7wzqfG6UFHmvVL+TT1sm+RAH3wrUdTCYAXXmOWcsJQPW0r2ONh0ltza8zykzTc4+Qm7AiNRS8hfPlNze0eZy4QT1PpW3P0kCJH+Cu3m5m6KGCOrFRvrSIUVIH0IElvBXZFWAapdaSuTag+Nt+z9MKJHmPRn33pQlV4E4/DZWMwfW31DGvFPtTFlcZrMFHcjA0A0HW0yP5F6d9/lS/7yFaY0iITPr14EKpvKnKZOHqvccj00csTNQvdqECMhHPpwHXLrz7kQXpQBZK2x2NCYpu2y33FPfdnj/TMolhaaSUkU1PcZdUv20GSQLl2Er0RBuVfee7bi5YRo6Uu/DEGcuLJxdwzQA+uqZ1+ftI2UnqWYhufr4/+gSQUKas6gSKYe0hD23nJJK8G5EFbivPfACqUpcXaZLuGADro1Dfpmd60YaLEYdVKR1l3D9mWpCs0IbnejlfUxj0LCZzohDAtOCHa3G7KT76aSnu35REMuzdGjfwDpat7Xj052B67W57KPH95Frb7TUvw/ro=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR06MB4439.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(18002099003)(22082099003)(56012099006)(38070700021)(4143699003)(261026140227099003)(261028144727099003)(261022105027099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y3lOSEg3T0YyTXRLenNnS1dVek5GSTcwZW5oUXZLR1M2aTdvM3NSZVNmOTk0?=
 =?utf-8?B?ekhYY0pqb1NTc2NoWkE0bkJXS0NGRkxCeWRKOVhsZEVRUmIxSmFuNnJuOHkr?=
 =?utf-8?B?Z3JqaTN4eG1tNURWOWZqMXpIa1dEbnpRLzgyY0dzRWRrWVZhbDhaT0RUSHda?=
 =?utf-8?B?cE1ETktmZzNENkJHRVhzbnJJSXBoS2Z6M201VVRMbHptVmtuY3dHNnlzRUgv?=
 =?utf-8?B?ejkxWlcvMjI1T0s4YjNCMnl0RlVNL3N6OFFkQjNHU1UvZ3N1N3dKT1Y1Wndk?=
 =?utf-8?B?WGl5Q3o3S0dIVVRHbm1QKzNNdlJ5REpXamo0M2tzTURCaGNaQVVNLzhNMGxz?=
 =?utf-8?B?bFdZaXFCN0U4U0VPUTNjQndGb2lvNkMxd3dPbEJTSnhKdG9uREY5VjJ4RW5q?=
 =?utf-8?B?c3pFMGhmOEdiM3lid0pjVjM5REdIUnU1NnNlRWNaSDVocjk4Qk5lVmNSR055?=
 =?utf-8?B?YlduYTNTY1A0dGFUOXRQWlhxQTBDdVFZL0ZrNVFYRUFFM244b2x6dlM4VU1n?=
 =?utf-8?B?NmpMQldPQy9CVDZPLzlFU2FCYVhyMHVjZFVPekF4Z25SeGFqU3MwUnJHMzhk?=
 =?utf-8?B?dmZCeHZVVG5IbFlFL2ptOTVKVEN0ZGEvYUlMMlJWSFk0dTNLdVBENmxVUWkv?=
 =?utf-8?B?Z2o0LzVEV2Q4WENCcEh3ZERxSWdVZndoUGg5dXRQcGc4Z1I3Tm9VS1JCYnJ5?=
 =?utf-8?B?ajZiTUZpREFVenZOaklidWg2U29kMzg5MzN1Z3JCLzFTRlVqR1NwYmRxV3pq?=
 =?utf-8?B?UTJvU3hQTjhJR2V2QWRlUzlzSEVwTnBrTGZKMzAwVHdKWDhmQjA1ZVZadVJv?=
 =?utf-8?B?NFdLOU4yOE5Hd3dGRW96OWI1b21JeGp3VEhKME96QXI3N3o3Q1htV01iUy9q?=
 =?utf-8?B?aEdKWjdYbGZyOU5JaGxUVVFqQ1VzR3hxV0kyY0UxSFd4UXg0bjBLaFFyL3N4?=
 =?utf-8?B?Y3VsSE5ZL09qNlV4cHA2aktzYlJpUEF3OVVkSktxS0w1VVdhNzRFWVRRTWRR?=
 =?utf-8?B?bHZ0YzVYRVkxWjFZMmRmZGdxbDFrZ0ZJMURnbzNUbWFkdDVDbUg1Z3E4WC9U?=
 =?utf-8?B?MkIrMmVHRTJiOWM0czVqUVZ0YURkRDdDSzhOUW00NHBzRDU3RWtwY0pBc09M?=
 =?utf-8?B?LzJGckZRWW9pOGFPd0Q5MGxaQWMxNEUvMVAvdXZiQlRJTDY3cGxCcDNVU2RL?=
 =?utf-8?B?MzZRV3pnVDZZSEFqbnU5eGs0SE4xY2duT25ZdTVndzVZc0RBOGtCOE1mN0VR?=
 =?utf-8?B?eFR4SE5rM0dCWVRGUDRXbzROSVhPZzh2UnBiYWo1RWhkWGFxK1l5VDNNTlpt?=
 =?utf-8?B?dUhnT3Y1VHhiajlPV09saGFZaU9mMzE0c1VMb0ZkYWJ0NHRDMElpNFdyRjBS?=
 =?utf-8?B?YWJMY1h5NlhDOEtLNTBubHlHcGUvNUdHVkt3ZHpCbjhNMm5teHp6MzZNVXkr?=
 =?utf-8?B?SjRYa0R6cXhnMGI5eFJYSWsxbStTK2ZaeVJnZmVrY2ppSlpTWUI5ckZsVk9J?=
 =?utf-8?B?VkpEK0E3OFZKQkUvZzd6QzNId0g4MEc0NFBLR1RCODloUDZOVEMzZnByWjh5?=
 =?utf-8?B?a3JqSlRJbHVtaTVnQTdINk8zektRK21naTJnTHRMS2J1MlA3ZlZ2YjVnVXEz?=
 =?utf-8?B?b3NsTUNpVXd3WVdFRUdhOWxWeWhTbnlrS3RLTzFnYU1QeHdqdytNQ1kvRjZi?=
 =?utf-8?B?TzQ1ampHMHFQSXZ5TWpTMU1KMzdjZ1pVdGtQU09UZEF2OWx2ZnQ3ekZkQ2NC?=
 =?utf-8?B?Wlp4Mk5LY3dCdm5YL0E4ZGFMRjlZc3pMNEt5QklweUFqNXR5S3dndllONEtI?=
 =?utf-8?B?SVBOc2F0bHpSUGxwcmk4M08va3Bic3lyOXpia2VGM2FxL3VoT1FWR2Rua3pL?=
 =?utf-8?B?K1ROYTZXZDlvNWVNNW9paGhUMHBJMXRZa04yek5pRDhzOWJhenFQYmxHOGdY?=
 =?utf-8?B?QzJGMzNNYnlSZEZjejFpRjdtaXp5cXd5SHhadDdPRjlNLytkZFpIWm15TUM0?=
 =?utf-8?B?UWtZajdxMmh5U0I1SmpPUXRnZFdlUSt1aWVOOHpEbi95eEVOTjNHeFQvaDFI?=
 =?utf-8?B?T2dRSzdvK2JFMTZFbWVhQ3hGZUhudDloNEJIa3V0VkZzU2NIajZXb002U3hz?=
 =?utf-8?B?WjZ2K0t3MCtSVTVRUTdmU2g1RG9mclBOU21zVFd6N3FBWFh3UUN6WUNZbjFj?=
 =?utf-8?B?TGtpZjBtcDBUYjluRkp3NE9ETVRlVG1nellQZkxvWlljelQ0R0VXMDJidzlD?=
 =?utf-8?B?ejVaczduZ3pWRVhBMFV3Unh0aWJaejhTeGQ0M0hHaEtIQVV0MWZGb3dzSWR5?=
 =?utf-8?B?aFA5OVkyUFdpZzhlWUowaUxVSDVuSUdmODRiRE9UenlKamVvejRTOWZSMTAx?=
 =?utf-8?Q?J8MJLqJoXzXmG5pU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <835FA529E6F250418C8FCDC2656A2DC5@apcprd06.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 06d909f3-487d-42e3-248d-08df3adab4e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2026 01:18:31.5014
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qZCEvkM0rZ5hGmCMd2H9+SMesls0NI/rfwvpv2Pdz+ib1AZzksnfpoUGtc2JiP/BJJSUo0NMIhqNzcEwZpVZIS2VFfYWOn5n3TBhnFzyKws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6921

U2FtZSBhcyBhYm92ZTogdjYgdXNlcyBkZXZfZXJyX3Byb2JlKCkgZm9yIHRoZSByZXNldCwgY2xv
Y2sgYW5kIHN5c2Nvbg0KYWNxdWlzaXRpb24gZmFpbHVyZXMgaW4gdGhlIGdsdWUgZHJpdmVyIGFz
IHdlbGwuDQoNCkhvbmdsaWFuZw==
