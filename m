Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.117
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793841515;
	b=t6hGUL2OHKOPs6FTHRlQ4qAFd9+aUvrpZt/CbSWr8oVf4lepfaFh5m1Hsmlp0D4+E7wL
	 /kyYYTtTOt3hjarPl4buLTbvUqW+c6xxwWV0yL3h6C/BLMpDKmlrpQEjL5qBg3zLaAKOp
	 Tx8Z2mAPs/1oAxMB4/KpYt86f9YQcduGFM+KUk7hWZEL1/qW4rGpvVEjRJN1sqc5JW40O
	 wGKR41fDRyHTcBC7p1b2TbCvT+kvZaTN6Ni1goez/WBmF03gSHMWB/ribqBE0OE0WZbBP
	 vTssLrb8psG7+Z2f4Glb4+Cn1UK0VJM7xZHL0OeOPSNcCxIKFMEReGDQx7q4MYq7qew==
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
	bh=CMxOE8cRk9+SOvFR3xEmGCedeJsIHc27BIE/Df5h6rI=;
	b=zzcBiTVmhA5td35fQAlfd5rbn+FiPfqnOGvU4MetUd34Ms2OhVkqXqTYaclKt1mOJL6+
	 qiM9mEhxRuQH9/mzW3YPZ6/cyymOR5AQ+Ts14bLCthca6Ehhg9JPYebEy31jVn0zSr/1E
	 m0UavvzxI3QWGVGcTOKfr73R30M4+39CiJMwSAbkq2vsxwACSsWHv7GnXfaxfHzOGb8vh
	 l2fbJYuleS7PieLEezVWICWf9AQ/NYcoRADkSxg6DP83vT1tw5HOfVPSR8eIhRMh2XVLk
	 94qFFIReaxXbin5wj0U5iUHL2pcHmz/DYadhG7ldMEmP+966Wuowtcd/Q4rQSob7IHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.117
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022117.outbound.protection.outlook.com [52.101.126.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8086082BDE;
	Thu,  5 Nov 2026 01:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A8086082BDE
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mMvBqiDdyPcT8h+d/qWegC/hGPU/fI0cCGVSH04Aud/shSPxuduGilAyJcBs/P02W3ghlyIOm/06TX68qlr1WkxK5h1uQT2jPtlf5olsmy9QunVHJzQ+cqx6HA2KaYJ7+0LE7zoGUXEvdED90NjaLwLIt1TbehLTslcRHchvC/0RzGm1x09VXCSA0zexyseoMuMaNgN95sBQTqVMShr6dbd/A09ySWi4i413d0NUR0ew1mXOwio5ZIqHRrNBpR20IW+lhoukXYNWAOdouMCEvvDqzhUEOCS1J4rNcRArH8tWhvutl2K4dvp4EJiQduJZv34fNYILho3+MPiwjPNkTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CMxOE8cRk9+SOvFR3xEmGCedeJsIHc27BIE/Df5h6rI=;
 b=Yxa0H4bYCLPzFH2viQGLROyd1uV1VVYbnQT2shWULHrB2IyrFgtWs9cQBcYYC3IDG69jBTfKhSoM5px89pqLtGn3qEcHD38fl+c7VnLpN1ixnWS2dwqpH/WHZnSYTLrcDcL2CHPW4zslYYghnRAUsPUXT6nMGcR3200RHbYzrOU9MlRru7rrsoY0ULe40XzjJ7bgHNIYt2oZbLvZnXVCHLuUilN2kgPY2s0nmiT1TKFOMTix0E45kZ+u6K2S8eJY+k+MmHgAFdlrnUMC8h2/eDi30g32BSlY92AgZnQgBqDzfRQ24zI8OLu/x4eH+g0Kdwte9Q3YAqEahmqK6kllUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PSAPR06MB4439.apcprd06.prod.outlook.com (2603:1096:301:80::7)
 by TYSPR06MB6921.apcprd06.prod.outlook.com (2603:1096:400:468::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 01:18:30 +0000
Received: from PSAPR06MB4439.apcprd06.prod.outlook.com
 ([fe80::c772:e1f:2c48:f9ac]) by PSAPR06MB4439.apcprd06.prod.outlook.com
 ([fe80::c772:e1f:2c48:f9ac%3]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 01:18:30 +0000
From: =?utf-8?B?SG9uZ2xpYW5nIFlhbmcgKOadqOWuj+S6rik=?=
	<hongliang.yang@cixtech.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
CC: =?utf-8?B?SG9uZ2xpYW5nIFlhbmcgKOadqOWuj+S6rik=?=
	<hongliang.yang@cixtech.com>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>
Subject: Re: [PATCH v5 2/3] phy: cix: Add CIX Sky1 USB3 PHY driver
Thread-Topic: [PATCH v5 2/3] phy: cix: Add CIX Sky1 USB3 PHY driver
Thread-Index: AQHda2fWWEMWb4+fB0qcKiINsZlp4LccCF6AgAKn7QA=
Date: Thu, 5 Nov 2026 01:18:30 +0000
Message-ID: <20261105011825.4058785-1-hongliang.yang@cixtech.com>
References: <20261103074913.1971025-3-hongliang.yang@cixtech.com>
 <b717872c0f75e16980675d17a5fbbca91b9c8a3a.camel@pengutronix.de>
In-Reply-To: <b717872c0f75e16980675d17a5fbbca91b9c8a3a.camel@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR06MB4439:EE_|TYSPR06MB6921:EE_
x-ms-office365-filtering-correlation-id: dd0291f3-61dc-4234-95bc-08df3adab3ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|18002099003|22082099003|56012099006|38070700021|4143699003;
x-microsoft-antispam-message-info:
 3/TNJoMeqXpdw+k8gVkRR46cFd5lNoe4NixnjkxlWjN634C8tVONmiwS9QIiM2UzpoEykdSDbyvcDF4GmAIOAYb5N5fAuZgbX5wF5uAg5ukOcoDEqu9J4vbMr/lDX/PLe3q0TolZvYz4TdLQN9SVFKOnt5Mmt3EFGdKgmE/ij0N9vYfE0ZGhIFRw2UqNFkOMZ1X33NwW+DAcwKU2UsNy5p5WPdf0Z3ru4cFDDoUKhWNL0hpfSFjVq+K8eJri4dugW6hQQmPUaFNHH3Beov3s081WzajVV6fLLtbpehKBMuiLaISvuiub4Vez1U6WAjLTZND5ftGb3GFcTwTn25s+8HtBdk5Y6syU1ch3IDgOrXo2JZV5bhgnEaGHX2yfDjMFrPIxbspqJypt/n59WTnomAhFc/N00pN6fWQuRVeSxXGg+uoCZekTRQQ93K1NW9Cgj2y/6Sh3/hVusygXi8RRQAZbX42s1xhnLMrhYNYWHMgiwz9QPS0mfIwhvXFpbFrn5kboiC4/MvE4JfsVUvhizh7bn9c7yzzx2qvyKqgH2KdJ3agvIWUljjmuxugh29UOueKhTWbbnY4nAznqUSmMQAHO1s733+6CXp959dxW/gNegZtwmYn2VdwO38QPxwoAV4ftOGEonLbb4jpJZSuMMZkH4FRYc0oEC5yP1isLFdWm7dYypzVqUv14+cL5HzOjayQVAi+sgtpu86txwnP5vCzEhk7z4XftKkL4W9kgxiU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR06MB4439.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(18002099003)(22082099003)(56012099006)(38070700021)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VkdKNzRmZDJjVXVXa1pqNXl0VlhTcytXVWhIU2dMeGNwMzVNeWtRc3EydnRC?=
 =?utf-8?B?dlA5eHJYcTZiZ0VhdXFHZlNqK2RLemRnSWN2aWhZM2pLUHpJbi9EMHN5Vzg4?=
 =?utf-8?B?c05hQ1YxRmRFNE04Vm85bGNGRVkwODlkZGd1U3c0ZGlhRmU0emNaV29OWTZs?=
 =?utf-8?B?cnNDQjRyODNFZDdQQVJYVVByMDBvTFVsRDR4bHRuWlhxbTZtclpqMUV6U1p5?=
 =?utf-8?B?bWI5eDNLdS9vVGF3akF4c3ZzUmZ0bEN4eW9JN2NLT1FNSXEzb0UrSjVpczNO?=
 =?utf-8?B?STRBQXljd2VBNEdLTS81b09meDBKV2NEc1QvbUZKZ1JnTzh5ZHlXd1plK1Zv?=
 =?utf-8?B?a3laTW9aM0lDU3hsVVZQWFRBVzdVcFhPRzZDTEhwZjBvZnJKV2ZseEhVOEt2?=
 =?utf-8?B?b1VMSHRQTnFzWHNldVBXTlJkY0RFejZScnA1WnBYUUhFSk8zN0N4QUVlM1Nn?=
 =?utf-8?B?dUE5TDNQb1k2TDN3UWlpQ0ovWVdUZWZ3N3daeDd1cXkrajNReHd3MU1scXBP?=
 =?utf-8?B?aC9tZ0E0d2R6SWRsbFZaL2Y1VW1HaWl4T2ZSczNEbWRhUk43UDF0UU5CRlZs?=
 =?utf-8?B?NFRaUWpXL0dETHRmSUo3V2NTTmFlaDh1OHhPc3RSdzZJTUxoTC9XaUF3R1lp?=
 =?utf-8?B?Y1JrbGpsaHJBZ3VDcm4xZ3lGbnF2YlZVWTdYeVFQY2RET3BhdjVyTXpJSVdn?=
 =?utf-8?B?Qm0ya3RJRWppNHh0RTFjdUo1Z3J5YTRCQXp1VVYrakhsMDE2dGFyQ1ZWZ3pm?=
 =?utf-8?B?UlNQSmlVbnpEZGZYMXlnTEdvaUtmUDBlY3JSS0RiVDh2SXVMSXo2Sm1Rd2Fq?=
 =?utf-8?B?TklhUTdpS01abEhMRGRTeUJseEVIdU5uTG12Zjl3RmRDamVZdWt0NmZ6R2tw?=
 =?utf-8?B?ZTBpVjIwZWt3b05OVkExK0lWR2dZZVRrblBnZFUxdm40d2IvM1FBYlpMWlQ4?=
 =?utf-8?B?VVdkdVUzRzIya2pIR2xKYWZtYkhHTEFSdDZ3dDV5d3dCVVZyQXFHMEZiSGt6?=
 =?utf-8?B?RFo1c2haYWQ4SmFpZjdmMGVUNlFRY2pGQ3NMOERwWjMxTFY0SDk1WTk1TFdn?=
 =?utf-8?B?TzVCK1JBS21oNkdCSWNxNG5NQ21GRjJmNDdXT213SE9tSzBZV1ZyaTE3K2h2?=
 =?utf-8?B?T09pc05ad0xhTlRsTFNQYlBQYk9veWdEZEVWdkc3ZE9WcGxGMjUzcitMcjZD?=
 =?utf-8?B?Ri9IZ3ZpdGlxOUZ4TGVEc0ZsT0VIZUI0MmllQWxsSndqeHNCQjROT0dRSkxX?=
 =?utf-8?B?U2dEeHJCbUtzdnp6cXl1T3JmQUZrbjJYS2JGdWtHL1VzcWRQcUVxbG94WXJv?=
 =?utf-8?B?WUwyOUJBZXMreTJPdVFpOWJZUmsrbm9nL2Z2MTRQZUVucDRxNzdkR1pUUUxt?=
 =?utf-8?B?UGsyZ09xUUlUR2oxUE5oS3JTM01Gb0lMaVlYRXJoUGJxOFlxNGlYNXF0L1Iv?=
 =?utf-8?B?MHI5N2pFUDF3NEphVDVDWkJtWTVhQnllalhYb09WazFCc29PU0NRaG1rblFY?=
 =?utf-8?B?UG50bENNblU2SWVxYTVIRTRrVkNQdmZudXp3V0dZTmdlYXBIdExRMW5aaEkv?=
 =?utf-8?B?WHlaUXVJR2R5Q1RhV0hlY09pZXNHNUpDWFh1dUVKUjNNbVBCNG8yUHFZaHBR?=
 =?utf-8?B?cE8rcFNJcU5ZWVdDalBFU3ZXclEybGtzWUVWVE5IMFdqU1hTblJyTDJHZWZ2?=
 =?utf-8?B?OEVlY1dzQjIzeU1NT3V1Zi8xdVdrM3N0UnA4NERlVzZuM0lYNnVWMVpMaW55?=
 =?utf-8?B?bWFRWDh5TVQ0TzlIcGY4WS9xa090NFlvWnVZZm9oTytqLyt6SGJxMUtPNzRW?=
 =?utf-8?B?N1FQWExnTzZWb1FIeDhpSjI5ZXhWN2M2N2JaTFo5aHdydmo3OVV5QmV1VkRR?=
 =?utf-8?B?Qk11bDY5NXQreDBodWc3UWNZWGx4eDVzZTQ4NVhJcGlwYWJOekxQQWJ0MGVt?=
 =?utf-8?B?YlJER1I3STFVZEEzd1ozcVd4T1AzTzlPYzd2SU1seGpmU2o0bTIrdGRWMDVP?=
 =?utf-8?B?Z3Fva2NRN2FXVUZ6V2hrU3ZUREpaRHRJRWRwWXQxdEF3dWUvN3FoUG45eVFk?=
 =?utf-8?B?b3BUbXg1aWVYWUtZckVuZy93ZjVhWXBXbzJWVGdBajl4b1d2ZWdmcDVzMExO?=
 =?utf-8?B?SzFnYjFkdjdFNjQ5bGt0NFJtL0wweUc1czhhbTZXQXJGNUkxN3RYdC9seGtq?=
 =?utf-8?B?TDlMNm5hQzBGV1ZmN0p3bER0am9QYmhxNm9OS3RMdzlqU0xYay9BMElZS2tp?=
 =?utf-8?B?bGJYQzNwNUFlR2tSVUpUMzU4di9aVWRlaFQxT0dvMEZiODJlQTVSaW14OEFX?=
 =?utf-8?B?NDFpS3Z0WktNa09QblFNRFdDZVBkMlZGNnh1QVRUSW9FeEM3Ly9na1Y3cmdE?=
 =?utf-8?Q?86YWZgShVV1HZcuY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ED078AE2E240F946BEEBC454425BCE31@apcprd06.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: dd0291f3-61dc-4234-95bc-08df3adab3ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2026 01:18:30.1002
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nZU6nik+WlMcvBwyNkuYJ5JCLIGXzNHeCgkSiL06IW2eigkJFdvSz8NTVThFKGL5tmvjgWN7jvy0INaWDhbuglKO3h2fx3UloovTKwbIZYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6921

VGhhbmtzLiBBbGwgcmVzZXQsIGNsb2NrIGFuZCByZWdtYXAgYWNxdWlzaXRpb24gZXJyb3IgcGF0
aHMgaW4gdjYgcmV0dXJuDQpkZXZfZXJyX3Byb2JlKCk7IHRoZSBkZXZfZXJyKCkgKyBQVFJfRVJS
KCkgcGF0dGVybiBpcyBnb25lLg0KDQpIb25nbGlhbmc=
