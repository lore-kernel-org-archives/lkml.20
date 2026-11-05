Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.119
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793841496;
	b=E7gAeKnbxrvwVlDCzEjnEma7DXPeJv5ZifqreUMQgQtwrzaqG49maMr8KAXHk+EX+E0D
	 Z9JLdiS4TM/JZQfAQJpSQzKDj6EwzGXISUDFMNEtYLrWANPeJq2lrZY+wrOBXfy7Pt/XI
	 EsPKhDmmBaVAyVI8DGAIEtUBnYujG56cp0wc5cyzKJQwGFdUSvYMU2Drp2hSavXkLiWNT
	 hXTH93XUPF9iujOyVFPhizswcnOrL4c5wFJRH57Kr6NZY4MvTyvpUWm4LG8AvXQvLF+f8
	 PXiLrw2MZKIReTOwprzvSCHWc1yuMiLHIKgjfTYfxAVjzjP7v+JFvz+C/+j2vPvgE3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793841496;
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
	bh=m0e6oEO5kcHvK/E/i+kvMjfVHYQJ4Iq9seaH+c4b46Q=;
	b=S7lqYQUAHtzFEmRMCGmP5mptIk9GTcKFUW0E23xeIvKKLiXFj6rUgigt5E3HTXCNWhHO
	 ekhiHi79g/jnoeJaMs8FiAN6UoEoIRl1mXBXfMaAbFsSDPHE18x60aldDNbhtorfmH6fv
	 NaPcC7Q9BkWFBV9g6HZyaGpt2WryyO05Ic7jqQvQzGgmoKcRIDkz82JZqjdFuToyWeSbx
	 s1DHrB+JgAnumT438jXOj3Kq1mB0Cm2Ahqry4PuFSVyrFVPx8CseMk3sWLzCT6KcQR5jM
	 gUCo3HxxzfcdxufKi0k8bxcNwbAYmiceOB0YgHZNWk4MmsSkHQDKTbF6bI4qeHBVoyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.119
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023119.outbound.protection.outlook.com [52.101.127.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D05606A33A;
	Thu,  5 Nov 2026 01:18:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93D05606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mjv1aoAdBQmYPE50VgVya+tFdCcmeFtT/LWAHxyAGschBJs6vSHH46Uy7JF6Rov6qVQQNMRFmjzUKS3yx5SbOt938mK1P1jSGESAmukX9MxaeQ3Jst7cH5R4AYk/LlXMb2LUlZFikri58fEigeSKkC/P7yVyMLzZTBATNC04/txLezmEHwAlNsCVg39TQZw1QS3nafWQnaHAmxmyw6Ht42V/oeZ6uYZZ6VK4lkTILuKiYZPPKY1ZkYrN/SXdA2fuGaLb+3qpTwIFmBT3LOlvPtM354j/TcUDU4trO9FXjsPM68kuyA1HkbI3a4dACjUXrk+ol+V/f6hTZZbO8GW2Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m0e6oEO5kcHvK/E/i+kvMjfVHYQJ4Iq9seaH+c4b46Q=;
 b=RYej3aO5cgDFJkUunHeLc77Op+bdaNugjCeDnF2yXbQHas2O4Z4IZ2CBojzhii0lJ9lNJPXQqkNwM5B5KX+AiQtiGA8JSFxZIlTH6GDwoGjrQrW3n+IqTl1CO+yDH/v17b+MarThF4IL0fC5s0wPD7WaZUCeIs2ynBGHSApvf9D/eNrxhBWYXTLm7GFwP7fSLGep81hxwRu6uaXUHnpALAlkkwgNK6JKzSFtl1XQg/Nt+i7LQSeu8+juXHYeb9A6C4QnuS24hOo/7KnUP7ZHiyz22Nt87BC3flyPvJhPcaEyz4v1ZLcy/6K7FEU9vMOEoH5wW6CTOkk4LsLPsYWmtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PSAPR06MB4439.apcprd06.prod.outlook.com (2603:1096:301:80::7)
 by TYSPR06MB6921.apcprd06.prod.outlook.com (2603:1096:400:468::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 01:18:13 +0000
Received: from PSAPR06MB4439.apcprd06.prod.outlook.com
 ([fe80::c772:e1f:2c48:f9ac]) by PSAPR06MB4439.apcprd06.prod.outlook.com
 ([fe80::c772:e1f:2c48:f9ac%3]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 01:18:13 +0000
From: =?utf-8?B?SG9uZ2xpYW5nIFlhbmcgKOadqOWuj+S6rik=?=
	<hongliang.yang@cixtech.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen
	<peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, Roger Quadros
	<rogerq@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, =?utf-8?B?R2FyeSBZYW5nICjmnajmlrDkvJ8p?=
	<Gary.Yang@cixtech.com>, =?utf-8?B?RnVnYW5nIER1YW4gKOauteWvjOWImik=?=
	<fugang.duan@cixtech.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>,
	=?utf-8?B?SG9uZ2xpYW5nIFlhbmcgKOadqOWuj+S6rik=?= <hongliang.yang@cixtech.com>
Subject: [PATCH v6 3/3] arm64: dts: cix: Add USB4/USB5 nodes for Sky1
Thread-Topic: [PATCH v6 3/3] arm64: dts: cix: Add USB4/USB5 nodes for Sky1
Thread-Index: AQHdbMOGQy1poGvkOEu8sXkAij+u5Q==
Date: Thu, 5 Nov 2026 01:18:12 +0000
Message-ID: <20261105011803.4058557-4-hongliang.yang@cixtech.com>
References: <20261105011803.4058557-1-hongliang.yang@cixtech.com>
In-Reply-To: <20261105011803.4058557-1-hongliang.yang@cixtech.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR06MB4439:EE_|TYSPR06MB6921:EE_
x-ms-office365-filtering-correlation-id: 1ffc2f05-8344-47fa-0676-08df3adaa979
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|18002099003|261102123227099003|22082099003|56012099006|38070700021|261021121427099003|261026121527099003|261026140227099003|261009223027099003|261028144727099003|261022105027099003|921020;
x-microsoft-antispam-message-info:
 zzSj5Npa9wFBu724mc0MRziuPhPCqJ3062iuHomgpFRPECW8jnjOqqQJve/8aqQxjSse1wqmmhRbUBoR/y88BTy4vPqw7yjQ+dyloiVJKQp0qYM6blXxxvtoKBq5jFy9H5u75426WtO0PPBfH1ApcSM0OmFQzz8FDf5HlUfWunO2IxJiTI8IZW7b6VN9nfut3nrLBAIMfv3PhuqFzvBWQL+cWfnbuY8TOM0/FyRLEI6jqD0aOUGNoGSuNVPf229Fm5JkwWRjn/n52dqMpZmypLkCaLXgSdB92bOZj9TFwMGMDrs5bgFUQ0CaPt0cNkvUsGQdf8z0DHQZ1xbjiCFexqBcQh0WhN3PUt8Y6J19SBCjfz1ofGnUFtUh9lIUPlJU1PgaZuMzvlEIhyXLCUjGlPYGc9+Ji3bxxnFO1Su5yHEisTwWfVZhMBj3K9sg042SunwxSqGPzRyyVmfe+3LwwjoMvDuWhZS2IVN6Zsx0VL7lz2f/UzLysQ5Uzvn6yLQCjrJg5RVzLyKhk21AfOGeD0LnhZrzxyAstuC5qmvhoeyxhKQHCG2yjZ3SA9Kv25nP8IgsDHY4r3JERsSn9hfXfbVTrwEaSDEiNeXYrKebkXZeLjfqtrchnKOfE3ha/4BhFOwFTn9i/oR4q5AuGeBV4i81oTs2tJ+u84aLcQvbO8uq0XrEOMo9oHfgY+NSz0GbhHcNCIhwx0pOJrBiIAQ5mXM99WkJ9ApBrDylXll75iM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR06MB4439.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(18002099003)(261102123227099003)(22082099003)(56012099006)(38070700021)(261021121427099003)(261026121527099003)(261026140227099003)(261009223027099003)(261028144727099003)(261022105027099003)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZUhHWUhEbFRidmVEbk9PcmVzMUJXZkMwWjMzM20ybmpwQVhrSENlMVpYVkJK?=
 =?utf-8?B?TWNTVjVwdFNSNEc1OC9DbDY0NXpYWkQ1N2F5Q1RzdUxaV0NVeUZUaUlIU09S?=
 =?utf-8?B?UFJvZzA4ZHE4SlkzZUNBRDJ2WEtZdjg0VGNreXpvM1B6OHFycUV2RndIUytn?=
 =?utf-8?B?a2FpNjFRTTB0WFAwdHFSWGhkakxZbFVDTnVEemx5TFIyNzRxam5VQ2RMcGpp?=
 =?utf-8?B?czJwZUt5UzZ3MEYvbCtwWUNFUDhtWUo5cThweW9teHE1dllDRU5NcGlQZ3lp?=
 =?utf-8?B?MS9pZHNBdXJjZUcxS0pMOEM1T25RcjVnTlhCdTVqc2prSEQ5UVJjcFdJWi9r?=
 =?utf-8?B?Tll5SDFNeWNOb3gxaHF0N2UrVzVCMytYelNOY0xYazd6RHlIMWh3QnM2NU5t?=
 =?utf-8?B?NkxVRE96V25UdjdwR3FuNGxhZHI4ZHJzeFdseHlhVGtRRyt5dHlzRzNIVk50?=
 =?utf-8?B?azdEWk5UQStRS21kTnEzb3ZWZUtYMzBKYjg3UHhEeC9ET0QvNnZuOEEyN2hD?=
 =?utf-8?B?bmxKeHgzZjhjWU9xdWlpMU00cVMvdlJVUWFDTHB1ajIvTStHbHZhSzFReHVV?=
 =?utf-8?B?cDNnbjFGbThRRXBqSXNXM1l0TktWV3lPVWV3WXRkaHpqdTY1Zlk3WWJqZ2Ix?=
 =?utf-8?B?TXJaTWFzYm94Ymp3S01pZVVTdXZwTzVxU1o5S0MvTHZsTzRUbFV5eDFRZGU2?=
 =?utf-8?B?QWFFcW5NME1rTVFDcUFBVHBDZW12bitRTGFtZkdlYzFla3JPSTlTMCsrSkxu?=
 =?utf-8?B?MnMxMHZieENwUUtSWmd4V0RQY0M4elRJZHdyVDI0YlZ4YWo4eFduaFBCaVQ0?=
 =?utf-8?B?NnRQd1Z0dTExcFJmT3VUWCtnMDZFdkowNXQwQzdyM1FUVUNTWkRyMTU4cm9N?=
 =?utf-8?B?MTczWlJ5czVEdDZDdkQ0eUMzb0V1SHlodUNPdDVXWnhHS3FZNXZMRUJMTG1L?=
 =?utf-8?B?Ylk5RUpvWHBpOUp6a0dEc1dCKzRqbXVLSWxYdlU4ZWRiTUgrbzgwYzFvQm5i?=
 =?utf-8?B?a05qejRsMDErSTBLTXhrVTJOMTlPOUVzYTBBeWN1YVNDWFkvWlp2TStKWVcz?=
 =?utf-8?B?aFllRGpLODh0alRtcnBSMlZSTHFMa0gyYzRhTWc2aDJzQ09sT1l0MXVVN2xC?=
 =?utf-8?B?Z2QvblQvVTVsaEVqRHhSK1NDRVpHMmFtQ2plSGhqRThmMnJhQ1dUMGQ5NzJZ?=
 =?utf-8?B?SUVhN0xhOWMyamJyczlVSHBwVGd4YjA1OGRPaVBsczQzU3laZHNhUTZQMVJB?=
 =?utf-8?B?NGR6ME1nZzlvUGpKT0QrbUYvV05tc0RKeldLQ0dqYUdaWFN4MUJVd2RCTjhI?=
 =?utf-8?B?TEZBeVZFMmkxdjM5emhzL3E0MmpWcXNqYVpGWE1ic3Y3OGFrdk5DRlZmM1Jm?=
 =?utf-8?B?L3VzeTlReWd4Y1BRMVYza2FBU2o2REpqV0RiYk1YMmU2ZllpU05ta2pmUmRj?=
 =?utf-8?B?RUFlRXh1S2wzdzQwa1FPck9KMnl5aG1ocGJWNVZab0J1SHE5Q2ZsVjhpRFZn?=
 =?utf-8?B?ejM3MmljU0JpODF5a3IrdXFtR0JiVUhlQTdnVzRITmRRajhCL3p0dDc0ejZF?=
 =?utf-8?B?K2I3ZFoyQmFUMXRuMFF5TVpZcFZESlc1UEk1bTkwWjhCSER3NlJJNHcvcFdE?=
 =?utf-8?B?ZVk0ZmhWZUpvWjkydnVyODB5bUdodzE1WXoxeDVFazhNdm40QWNLekY1am5S?=
 =?utf-8?B?cnNCT0ZGWDUyT3hnNU9VbWZOQURTK2NCSWIzV0puNWljQ2RTQnlNK09GZnBV?=
 =?utf-8?B?bWVFRzBnUnVETU5NK3F0K3FlWklYT256QVZDZTlIcTNyc0dMeDZWdm93RnpN?=
 =?utf-8?B?bDc4MUw2enhsVGtSakJvdG93enBHRnkwaCt1VkxrK1NFbTJiUExqcko0M0R5?=
 =?utf-8?B?Um42WS90WktLQk5xMyt2REVQaFdQMk5SWmUyWVFPL3lJNDlsV0NBc3dyZ3Yv?=
 =?utf-8?B?ZWJCd1JvbHJ6anEybjBCb0pkR1A1TWdvZzRhbDVvK0xHWVVOdGZvK29Mcllu?=
 =?utf-8?B?VVZ3SHhqSG10SFljVHpxdWlHTDhGYytNT0V0bXlrbGZvRytHRXlldnpSTXpO?=
 =?utf-8?B?NEZyazlKSjA5SnRCUmltemdjbjB5VE1xMHlpZEJKbTFsRGxQOXNPQkcyNzN1?=
 =?utf-8?B?SmZQU3A4WTFzQTBkcS9ST01hMHpzbFBHNDc1NjdsendiOUtuNktJajNDR0Fm?=
 =?utf-8?B?bEMrWDFDOEcwbllxM2tXRFgwSUI1MWxkYnEvWlUxTDJDMGlWemtITEg3eUlW?=
 =?utf-8?B?eEQzNjBIZGNydHZSTXJ4c3VucThWeXRmU2F3NVY5c2VJbm9xa2UrWjVoTndz?=
 =?utf-8?B?Ry9ZZ3VNVHBZeEQydDRNVmZIMU1ialcreHhRL0tiTXltZW9vV3lVZ1NlWGcy?=
 =?utf-8?Q?QuhujBHrt/fG8UfY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <34914EA749E8394BBBF97F491408B2D1@apcprd06.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ffc2f05-8344-47fa-0676-08df3adaa979
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2026 01:18:13.0215
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xAO7QxzcXT9Mh6Y+JrH41bZMFPkkqjmvBahozqNLQwimaB8/LVkPCwb91gf55y8lC1au6aWLtUHk6WGbk0mhlWl456bBaEXCVun1DtxAfv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6921

QWRkIFVTQjQgYW5kIFVTQjUgY29udHJvbGxlciBub2RlcyBmb3IgdGhlIENJWCBTa3kxIFNvQy4g
RW5hYmxlIFVTQjQNCmFuZCBVU0I1IGluIGhvc3QgbW9kZSBvbiB0aGUgUmFkeGEgT3Jpb24gTzYg
Ym9hcmQuDQoNCkVhY2ggY29udHJvbGxlciBub2RlIGlzIHBsYWNlZCBhdCB0aGUgYWRkcmVzcyBv
ZiBpdHMgZ2x1ZSByZWdpc3RlcnMgaW4NCnRoZSBSQ1NVIGFuZCBjb250YWlucyB0aGUgQ2FkZW5j
ZSBVU0JTU1AgY29yZSBjaGlsZCBub2RlIGF0IHRoZSBjb3JlDQphZGRyZXNzLiBUaGUgbW9kZSBz
dHJhcCByZWdpc3RlciBvZmZzZXQgYW5kIGJpdCBwb3NpdGlvbiBhcmUgcGFzc2VkIGFzDQphcmd1
bWVudHMgb2YgdGhlIGNpeCx1c2Itc3lzY29uIHBoYW5kbGUuDQoNClNpZ25lZC1vZmYtYnk6IEhv
bmdsaWFuZyBZYW5nIDxob25nbGlhbmcueWFuZ0BjaXh0ZWNoLmNvbT4NCi0tLQ0KQ2hhbmdlcyBp
biB2NjoNCi0gRHJvcCB0aGUgc2ltcGxlLWJ1cyBSQ1NVIGNvbnRhaW5lciBhbmQgdGhlIHRyYW5z
bGF0ZWQgcmVnaXN0ZXINCiAgb2Zmc2V0czsgcGxhY2UgZWFjaCBjb250cm9sbGVyIG5vZGUgYXQg
aXRzIHJlYWwgYWRkcmVzcy4NCi0gRHJvcCB0aGUgdXNiNC91c2I1IGFsaWFzZXMgYW5kIHBhc3Mg
dGhlIG1vZGUgc3RyYXAgcmVnaXN0ZXIgb2Zmc2V0DQogIGFuZCBiaXQgcG9zaXRpb24gdGhyb3Vn
aCB0aGUgY2l4LHVzYi1zeXNjb24gcGhhbmRsZS4NCi0gUmVmZXJlbmNlIHRoZSBzaGFyZWQgVVNC
MyBQSFkgdGhyb3VnaCBpdHMgc2luZ2xlIHBoYW5kbGUuDQotLS0NCiBhcmNoL2FybTY0L2Jvb3Qv
ZHRzL2NpeC9za3kxLW9yaW9uLW82LmR0cyB8IDQyICsrKysrKysrKysrDQogYXJjaC9hcm02NC9i
b290L2R0cy9jaXgvc2t5MS5kdHNpICAgICAgICAgfCA4NSArKysrKysrKysrKysrKysrKysrKysr
Kw0KIDIgZmlsZXMgY2hhbmdlZCwgMTI3IGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvY2l4L3NreTEtb3Jpb24tbzYuZHRzIGIvYXJjaC9hcm02NC9ib290
L2R0cy9jaXgvc2t5MS1vcmlvbi1vNi5kdHMNCmluZGV4IDVkNTdkZDllYTI5OS4uZDA3ZmFkMzAy
MDUwIDEwMDY0NA0KLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9jaXgvc2t5MS1vcmlvbi1vNi5k
dHMNCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvY2l4L3NreTEtb3Jpb24tbzYuZHRzDQpAQCAt
ODAsNiArODAsMjIgQEAgcGlucyB7DQogDQogCQl9Ow0KIAl9Ow0KKw0KKwlwaW5jdHJsX3VzYjQ6
IHVzYjQtcG93ZXItb24tY2ZnIHsNCisJCXBpbnMgew0KKwkJCWJpYXMtcHVsbC1kb3duOw0KKwkJ
CWRyaXZlLXN0cmVuZ3RoID0gPDg+Ow0KKwkJCXBpbm11eCA9IDxDSVhfUEFEX0dQSU8wNDFfRlVO
Q19VU0JfRFJJVkVfVkJVUzQ+Ow0KKwkJfTsNCisJfTsNCisNCisJcGluY3RybF91c2I1OiB1c2I1
LXBvd2VyLW9uLWNmZyB7DQorCQlwaW5zIHsNCisJCQliaWFzLXB1bGwtZG93bjsNCisJCQlkcml2
ZS1zdHJlbmd0aCA9IDw4PjsNCisJCQlwaW5tdXggPSA8Q0lYX1BBRF9HUElPMDQyX0ZVTkNfVVNC
X0RSSVZFX1ZCVVM1PjsNCisJCX07DQorCX07DQogfTsNCiANCiAmcGNpZV94OF9yYyB7DQpAQCAt
MTE4LDYgKzEzNCwzMiBAQCAmdWFydDIgew0KIAlzdGF0dXMgPSAib2theSI7DQogfTsNCiANCism
dXNiNCB7DQorCXBpbmN0cmwtMCA9IDwmcGluY3RybF91c2I0PjsNCisJcGluY3RybC1uYW1lcyA9
ICJkZWZhdWx0IjsNCisNCisJc3RhdHVzID0gIm9rYXkiOw0KK307DQorDQorJnVzYnNzXzQgew0K
Kwlkcl9tb2RlID0gImhvc3QiOw0KKw0KKwlzdGF0dXMgPSAib2theSI7DQorfTsNCisNCismdXNi
NSB7DQorCXBpbmN0cmwtMCA9IDwmcGluY3RybF91c2I1PjsNCisJcGluY3RybC1uYW1lcyA9ICJk
ZWZhdWx0IjsNCisNCisJc3RhdHVzID0gIm9rYXkiOw0KK307DQorDQorJnVzYnNzXzUgew0KKwlk
cl9tb2RlID0gImhvc3QiOw0KKw0KKwlzdGF0dXMgPSAib2theSI7DQorfTsNCisNCiAmdXNiM19w
aHk0IHsNCiAJc3RhdHVzID0gIm9rYXkiOw0KIH07DQpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9i
b290L2R0cy9jaXgvc2t5MS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9jaXgvc2t5MS5kdHNp
DQppbmRleCBjMDgxYjYzYTk4NDguLmFlNjZkY2E1Mzg5NCAxMDA2NDQNCi0tLSBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvY2l4L3NreTEuZHRzaQ0KKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9jaXgv
c2t5MS5kdHNpDQpAQCAtNjA2LDYgKzYwNiw5MCBAQCBtYm94X2FwMnNmaDogbWFpbGJveEA4MGEw
MDAwIHsNCiAJCQljaXgsbWJveC1kaXIgPSAidHgiOw0KIAkJfTsNCiANCisJCXVzYjQ6IHVzYkA5
MWMwMzE0IHsNCisJCQljb21wYXRpYmxlID0gImNpeCxza3kxLXVzYnNzcCI7DQorCQkJcmVnID0g
PDB4MDAgMHgwOTFjMDMxNCAweDAwIDB4MTA+LA0KKwkJCSAgICAgIDwweDAwIDB4MDkxYzA0MDAg
MHgwMCAweDEwPjsNCisJCQlyZWctbmFtZXMgPSAiYXhpIiwgInN0YXR1cyI7DQorCQkJcmFuZ2Vz
Ow0KKwkJCSNhZGRyZXNzLWNlbGxzID0gPDI+Ow0KKwkJCSNzaXplLWNlbGxzID0gPDI+Ow0KKwkJ
CWNsb2NrcyA9IDwmc2NtaV9jbGsgQ0xLX1RSRUVfVVNCM0FfSDBfQ0xLX1NPRj4sDQorCQkJCTwm
c2NtaV9jbGsgQ0xLX1RSRUVfVVNCM0FfMF9BWElfR0FURT4sDQorCQkJCTwmc2NtaV9jbGsgQ0xL
X1RSRUVfVVNCM0FfSDBfQ0xLX0xQTT4sDQorCQkJCTwmc2NtaV9jbGsgQ0xLX1RSRUVfVVNCM0Ff
MF9BUEJfR0FURT47DQorCQkJY2xvY2stbmFtZXMgPSAic29mIiwgImF4aSIsICJscG0iLCAiYXBi
IjsNCisJCQlyZXNldHMgPSA8JnM1X3N5c2NvbiBTS1kxX1VTQkNfU1MyX1BSU1RfTj4sDQorCQkJ
CTwmczVfc3lzY29uIFNLWTFfVVNCQ19TUzJfUlNUX04+Ow0KKwkJCXJlc2V0LW5hbWVzID0gImFw
YiIsICJjb3JlIjsNCisJCQkvKiBVU0IzIFR5cGUtQSBjb250cm9sbGVyIDAgbW9kZSBzdHJhcCAq
Lw0KKwkJCWNpeCx1c2Itc3lzY29uID0gPCZzNV9zeXNjb24gMHg0MjQgOD47DQorDQorCQkJc3Rh
dHVzID0gImRpc2FibGVkIjsNCisNCisJCQl1c2Jzc180OiB1c2JAOTFkMDAwMCB7DQorCQkJCWNv
bXBhdGlibGUgPSAiY2Rucyx1c2IzIjsNCisJCQkJcmVnID0gPDB4MDAgMHg5MWQwMDAwIDB4MDAg
MHg0MDAwPiwNCisJCQkJICAgICAgPDB4MDAgMHg5MWQ4MDAwIDB4MDAgMHg4MDAwPiwNCisJCQkJ
ICAgICAgPDB4MDAgMHg5MWQ0MDAwIDB4MDAgMHg0MDAwPjsNCisJCQkJcmVnLW5hbWVzID0gIm90
ZyIsICJ4aGNpIiwgImRldiI7DQorCQkJCWRyX21vZGUgPSAib3RnIjsNCisJCQkJaW50ZXJydXB0
cyA9IDxHSUNfU1BJIDI1MiBJUlFfVFlQRV9MRVZFTF9ISUdIIDA+LA0KKwkJCQkJPEdJQ19TUEkg
MjUyIElSUV9UWVBFX0xFVkVMX0hJR0ggMD4sDQorCQkJCQk8R0lDX1NQSSAyNTMgSVJRX1RZUEVf
TEVWRUxfSElHSCAwPiwNCisJCQkJCTxHSUNfU1BJIDI1MiBJUlFfVFlQRV9MRVZFTF9ISUdIIDA+
Ow0KKwkJCQlpbnRlcnJ1cHQtbmFtZXMgPSAiaG9zdCIsICJwZXJpcGhlcmFsIiwNCisJCQkJCSJv
dGciLCAid2FrZXVwIjsNCisJCQkJbWF4aW11bS1zcGVlZCA9ICJzdXBlci1zcGVlZC1wbHVzIjsN
CisJCQkJcGh5cyA9IDwmdXNiM19waHk0PjsNCisJCQkJcGh5LW5hbWVzID0gImNkbnMzLHVzYjMt
cGh5IjsNCisNCisJCQkJc3RhdHVzID0gImRpc2FibGVkIjsNCisJCQl9Ow0KKwkJfTsNCisNCisJ
CXVzYjU6IHVzYkA5MWMwMzI0IHsNCisJCQljb21wYXRpYmxlID0gImNpeCxza3kxLXVzYnNzcCI7
DQorCQkJcmVnID0gPDB4MDAgMHgwOTFjMDMyNCAweDAwIDB4MTA+LA0KKwkJCSAgICAgIDwweDAw
IDB4MDkxYzA0MTAgMHgwMCAweDEwPjsNCisJCQlyZWctbmFtZXMgPSAiYXhpIiwgInN0YXR1cyI7
DQorCQkJcmFuZ2VzOw0KKwkJCSNhZGRyZXNzLWNlbGxzID0gPDI+Ow0KKwkJCSNzaXplLWNlbGxz
ID0gPDI+Ow0KKwkJCWNsb2NrcyA9IDwmc2NtaV9jbGsgQ0xLX1RSRUVfVVNCM0FfSDFfQ0xLX1NP
Rj4sDQorCQkJCTwmc2NtaV9jbGsgQ0xLX1RSRUVfVVNCM0FfMV9BWElfR0FURT4sDQorCQkJCTwm
c2NtaV9jbGsgQ0xLX1RSRUVfVVNCM0FfSDFfQ0xLX0xQTT4sDQorCQkJCTwmc2NtaV9jbGsgQ0xL
X1RSRUVfVVNCM0FfMV9BUEJfR0FURT47DQorCQkJY2xvY2stbmFtZXMgPSAic29mIiwgImF4aSIs
ICJscG0iLCAiYXBiIjsNCisJCQlyZXNldHMgPSA8JnM1X3N5c2NvbiBTS1kxX1VTQkNfU1MzX1BS
U1RfTj4sDQorCQkJCTwmczVfc3lzY29uIFNLWTFfVVNCQ19TUzNfUlNUX04+Ow0KKwkJCXJlc2V0
LW5hbWVzID0gImFwYiIsICJjb3JlIjsNCisJCQkvKiBVU0IzIFR5cGUtQSBjb250cm9sbGVyIDEg
bW9kZSBzdHJhcCAqLw0KKwkJCWNpeCx1c2Itc3lzY29uID0gPCZzNV9zeXNjb24gMHg0MjQgMTA+
Ow0KKw0KKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7DQorDQorCQkJdXNic3NfNTogdXNiQDkxZTAw
MDAgew0KKwkJCQljb21wYXRpYmxlID0gImNkbnMsdXNiMyI7DQorCQkJCXJlZyA9IDwweDAwIDB4
OTFlMDAwMCAweDAwIDB4NDAwMD4sDQorCQkJCSAgICAgIDwweDAwIDB4OTFlODAwMCAweDAwIDB4
ODAwMD4sDQorCQkJCSAgICAgIDwweDAwIDB4OTFlNDAwMCAweDAwIDB4NDAwMD47DQorCQkJCXJl
Zy1uYW1lcyA9ICJvdGciLCAieGhjaSIsICJkZXYiOw0KKwkJCQlkcl9tb2RlID0gIm90ZyI7DQor
CQkJCWludGVycnVwdHMgPSA8R0lDX1NQSSAyNTcgSVJRX1RZUEVfTEVWRUxfSElHSCAwPiwNCisJ
CQkJCTxHSUNfU1BJIDI1NyBJUlFfVFlQRV9MRVZFTF9ISUdIIDA+LA0KKwkJCQkJPEdJQ19TUEkg
MjU4IElSUV9UWVBFX0xFVkVMX0hJR0ggMD4sDQorCQkJCQk8R0lDX1NQSSAyNTcgSVJRX1RZUEVf
TEVWRUxfSElHSCAwPjsNCisJCQkJaW50ZXJydXB0LW5hbWVzID0gImhvc3QiLCAicGVyaXBoZXJh
bCIsDQorCQkJCQkib3RnIiwgIndha2V1cCI7DQorCQkJCW1heGltdW0tc3BlZWQgPSAic3VwZXIt
c3BlZWQtcGx1cyI7DQorCQkJCXBoeXMgPSA8JnVzYjNfcGh5ND47DQorCQkJCXBoeS1uYW1lcyA9
ICJjZG5zMyx1c2IzLXBoeSI7DQorDQorCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7DQorCQkJfTsN
CisJCX07DQorDQogCQl1c2IzX3BoeTQ6IHVzYi1waHlAOTIxMDAwMCB7DQogCQkJY29tcGF0aWJs
ZSA9ICJjaXgsc2t5MS11c2IzLXBoeSI7DQogCQkJcmVnID0gPDB4MDAgMHgwOTIxMDAwMCAweDAw
IDB4NDAwMDA+Ow0KQEAgLTc4MCw2ICs4NjQsNyBAQCBzNV9zeXNjb246IHN5c2NvbkAxNjAwMDAw
MCB7DQogCQkJY29tcGF0aWJsZSA9ICJjaXgsc2t5MS1zNS1zeXN0ZW0tY29udHJvbCIsICJzeXNj
b24iOw0KIAkJCXJlZyA9IDwweDAgMHgxNjAwMDAwMCAweDAgMHgxMDAwPjsNCiAJCQkjcmVzZXQt
Y2VsbHMgPSA8MT47DQorCQkJI3N5c2Nvbi1jZWxscyA9IDwyPjsNCiAJCX07DQogDQogCQlzNV9n
cGlvMDogZ3Bpby1jb250cm9sbGVyQDE2MDA0MDAwIHs=
