Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=52.101.126.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793692170;
	b=lpkNgXaZbpYPSDILa8X5uaXL9umkRjlRlSccXnvFQXN1tf4MdkahmxcfcPFHubNmJMWt
	 JibUjw6MyDkHrIu55nX/RnZsaHLKo4QY9WODA4nmpzZee9RIbP0EDwAdPBrijowQ07wki
	 v+4YXn8s5MJ/mxZ+dg6Io7weAXn/UKciOm/zKgvPlCdEtvrAdLkilYf/ZfXuc5w+EHSqo
	 F1dDFKhDPZA2AzOSlM4VTLbGS2Ss7BhuJCKFFhP4CSFRuoqkPDBi80YpTDm6zpho0meZJ
	 5IORWiMFS7NxAfLfj+9/VCAtZXHQ7W/9+MLrT/JsT/2ukUjLLN1xiBt0oYDjrzl72mA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793692170;
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
	bh=euR2H+kOrAuRLrNu8Mj5tzhav5en6KxWqqG7ibKT3DA=;
	b=BM/LjzvNH46rv1pK00rWhjCdHblTM/jppnXTW02H5zbPV7aDlkVRf+sx0FLjl9JkYuMB
	 ic0P3ngFBxi3BVlQROwXbJQQSACJuEFiLM29lHqkNxHY6tpn8J036u1zTg3EvvfmPzZRM
	 V4S89DWMBg6UOATS2w0ufZljO/7M6jFPcgL50IFqDedGijbSbqRPsgnJInhmVFu+kEtRt
	 qZJXDvz2AGgpw8QS+fZMBdy9DD0tNzacqieHP2BsIhDkNYkwa5/ctG1QFSQ3DML0o4z1P
	 hz5i29w3/FZpQeynopEC+LXeL2ae+sKworesph8ZF584Rio671McoaA+L1ZCjHW41Gg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=fail smtp.remote-ip=52.101.126.124
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022124.outbound.protection.outlook.com [52.101.126.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA84606A330;
	Tue,  3 Nov 2026 07:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DA84606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oUhWKkbEcv3a59i4Y+SCRHAgNV587KPl0ClvcF5jXIv/3BNrdUCXVVXTo+xPQR0BD6HJLpjOIor56flDplbCalhyHow2hAJG2BG+SieD2D4oIBnxjUH2usOntDkv2358ov4xQGux20LygFMm3dEOGuFvG11OeTgrYETVp61LogWx5klVUhaux2W/KiKJsVkySFExiWWx/n6Gpqkbrhd35qcvmxcljR52F6K94p3pIeKMrPIvroqQZmIM35q7bl2PQj53TYX2MpTQdcK3xhzbdYTXxFJRH7Vq5eRykeotyCUzjYJQ27I1qyUggvOAdzvgLKZWyrkfJkgkYn0ctti4EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=euR2H+kOrAuRLrNu8Mj5tzhav5en6KxWqqG7ibKT3DA=;
 b=cuVBnsLBsaIIk6pXI+GYCd7QuzAfyWeFurY6TSWZ0qF2wC2lTfHJSAJ5P/D/7tI7hnoS/7oWhq7RksIIr/ghfUdJDcb14mXcz3hQd6lPHmATIZlC2goygc/4oTQiXB6z/NVOeLQDtXV2BVso8tyczCFzxDId/Ky/2ZVz5QHv90arJjma9GHEYWct95EoSBAVN7Bqb0fpiYyrtvSGrt/0GFJeGFm8s0MmDtPQ17xf38ftei7f1udEg+64YEn9eg/tJutkaWIScX+JT5fkCv5r5Aq0JrEwZeC3hz9VQ5zIsURytrQqTpjRl8OENwmtOsb/5U/G82cRksr86JBUzXj/cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PSAPR06MB4439.apcprd06.prod.outlook.com (2603:1096:301:80::7)
 by SI3PR06MB8753.apcprd06.prod.outlook.com (2603:1096:4:2a5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 07:49:25 +0000
Received: from PSAPR06MB4439.apcprd06.prod.outlook.com
 ([fe80::c772:e1f:2c48:f9ac]) by PSAPR06MB4439.apcprd06.prod.outlook.com
 ([fe80::c772:e1f:2c48:f9ac%3]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 07:49:24 +0000
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
Subject: [PATCH v5 3/3] arm64: dts: cix: Add USB3 PHY nodes for Sky1
Thread-Topic: [PATCH v5 3/3] arm64: dts: cix: Add USB3 PHY nodes for Sky1
Thread-Index: AQHda2fY2kTh5bnrokaSWOj4MPzCqQ==
Date: Tue, 3 Nov 2026 07:49:24 +0000
Message-ID: <20261103074913.1971025-4-hongliang.yang@cixtech.com>
References: <20261103074913.1971025-1-hongliang.yang@cixtech.com>
In-Reply-To: <20261103074913.1971025-1-hongliang.yang@cixtech.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR06MB4439:EE_|SI3PR06MB8753:EE_
x-ms-office365-filtering-correlation-id: cebd3565-0adc-4f53-855b-08df397efab7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|38070700021|56012099006|261009223027099003|261028144727099003|261022075727099003|261022105027099003|261026140227099003|261021121427099003|10067099003|22082099003|18002099003|261102123227099003|3023799007;
x-microsoft-antispam-message-info:
 rVt2msMe1k2GTm2++S0o+kp4wQm6eWdsT/4wjsCoW76fgzzAHDzBu87e76bHbTnThXRiW/M/QzILEdZsGyoBsTAgFvItBGYkivz+vLgjhdGvlcj8n6kS+PI8Eysy7elWrufA7nb6T6svb1zxLylgaQkf57pHqWJ3tw/EcW9p8wnZeXNROsSl2EpM9djr+D8Z+YIKEP18KkH0aBHNRtPTQ1q50O0ncG0zze515VXT6XJ45OU5YbgImDRCfKpI0uT7VOjBv952Da8CapadE6WLDgFWI3806n/lMbJlKquicjg8w9sIGVbk8evi/Iw17OFweXtAQ6UnBiioaRMx28ht2bO5bfatee8t5Mu5qmyNBhtl0WcfBkZkqF8C/K2L7F6TY3vufjmfJuIbzmPs6aUHxSkchq8oNC3nDmyCADgNO6nvxoroeC7407XB6RNh5t1Ohvj1Vu7P5R9QG88gLaPeyzpPaOw70k5n64oWDV5ag02su507wLDT6+t9o8zsShc61LcES81KkQWaezDSpT386wIqsJrTZrq1IZ9xBGkj7k17mPk1HGbNn/4uZbzOUcIntFWzPFRr+xciG+k5p29uNeh6N7jdYfupMwuiArVSFJbpApO4VOAhWZ7To3ETqhFV5oBVO5vyInNcVXynpJZ7hX3R6WaUJEEnkiKKpyKWKhZvUga6pCERGeIi4RnCPj+o01KXYj8iFLs9Tf/C43Fp3A==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR06MB4439.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(38070700021)(56012099006)(261009223027099003)(261028144727099003)(261022075727099003)(261022105027099003)(261026140227099003)(261021121427099003)(10067099003)(22082099003)(18002099003)(261102123227099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NldkbGo1TWtHY253b3lKRWZXUy81LzBWbThUR2dtVXIrOEhCV1NYUVpDOUJi?=
 =?utf-8?B?S0t2U2VaWSttK3pNdmhGbTVUYm1HTjBickpFMzZDSWVjZkM3TmNibDlTVlQ2?=
 =?utf-8?B?MEQwWGY4N25aQjJML2Z4SDFCaE1BWWROZVRrcUpJcTlNVVVreEhsUWxBQ0M5?=
 =?utf-8?B?SXNpSzZnQWRWMUx3QnI3bHZSaWRDdWpxeHVQb2NQZ3JqdEFyQytZUEJKWEFW?=
 =?utf-8?B?aXI5TTUxaHZsMkV6b0QxTXBGeXYzc3lNVnh4QzMzd2JzYVJFNjkwTGFnUGNv?=
 =?utf-8?B?ZVZlTkVzbVVDUHVjdGRBekM0WHhENm1mVUJDN0svQTRIaGY5VVJIOXJXQW1M?=
 =?utf-8?B?T2VLampZV0hiSXlUcm9velYvZ293VHdqb3Uwbm1XMGRIcFVRZHpGK3ZsNUJD?=
 =?utf-8?B?U0srLzVEenJlL0d6OHNmZE9vdTVDamxnZDJteDB0cElWQXgzeU9ieXJwQm55?=
 =?utf-8?B?ZWNOUE0rV1RhYUhCdVNMS3VDWWFFTnJBT1lXZkZxN2VGZXJxZExtdWdJbXll?=
 =?utf-8?B?NC9jcmVhR3FwcE92ZVVKV3dGZGF5QnZZWmVYVnBjQklvbUVSa3NDdzBjcUJ0?=
 =?utf-8?B?Y0VmaU5aZFdTTit0WVVxckpIZGIxM3FISHpicmFTN2xWWTNnM2QrOGhVOVBO?=
 =?utf-8?B?eGxGOVhSU3l0NHJGYmlnditPZ29vT0Nqd1BUU1Y3LzJMWmE4WjBMakc3TXA1?=
 =?utf-8?B?K0ZYejJUbnZrVlMrMy9jYUQ5WjYwbFBzbE1XaG80NmZzdU5FSmR2VTlnVzVE?=
 =?utf-8?B?NjlOUmJsdmZwc1lnblJGdXlBU245SlM3R0piSHVFSHFZSFNpRjI2VXFMZGhk?=
 =?utf-8?B?QmxnUXVzSTNIT2M0WFE1TTFnU2F1QXlsVU9MSFkzdnd0bnRPVlZoVFF0cVRX?=
 =?utf-8?B?ajBBQzlLa2ptZ0RjeUhmUGRnSXcwanpITzlQUGNDZktnSll1UUR1alJVMEdB?=
 =?utf-8?B?YU9ScXlIVUxTVzdYWjhlOHdYekNXMTJNUkUvODRFV0hxenlqOHdOV1pxK0NG?=
 =?utf-8?B?MUVBYnk3UGF3ZVErOEFnaWdGVlQyYTBrMzZpdUxUczUwNi8wbU12MVJqaDhH?=
 =?utf-8?B?WW1RN2F1VXZnWWtncitRZ0twdmdyUVRJM1lwS2JXMGFRT0NLT0luaDBtbW1Z?=
 =?utf-8?B?Sk1OcWFtTG9WbTU0bDFPT09pNTRzV2k1aUYybTVSeWYrUS94eEhLM0Q1MmtI?=
 =?utf-8?B?NThzK2JhSHhJSllKZGVsT2hCOTl0WjF6WTBSMytQeFVVbGo4aGdLUEpDMmZH?=
 =?utf-8?B?VDRXeVF0RW5TNE5vVXRjTk1TYnNEZ0FmbXJFcGdCbnRYY29xVXVzK3lWYkhy?=
 =?utf-8?B?akVZK3hhakhKTDlpY0RHZ0FqOHQyZDl2bjRzTDhvS2w3T3JJNjRKVFpKLzIv?=
 =?utf-8?B?Vk50VDkrR1hFRXE2dXBUUHBJTGhmVnlQY0JRUTRuclJ5WCsyaTlEeVhtblg4?=
 =?utf-8?B?UDN4RUp5NXZjbmlVWmg1MmlBQ0pHNGViTkNQMG51WjIyUTdxZW1zbnZsNzd4?=
 =?utf-8?B?SGpwa3lyeUs4dS9jczFqOGZaYTlxTW1rN3ozM3M1Rm5vdzZMMzhRL2k5QTZJ?=
 =?utf-8?B?L1hjd0U1Ny9oRElkUnBZNC91VzBQN1NWSEUwTzVHL2c0em5ZMnorRzJDcnk1?=
 =?utf-8?B?QUtLZUxWNCtsdjRwZm9sWU9rZnpTaHNRU1J1R0JIYXZ3cmJLUTQ5THBwUjNW?=
 =?utf-8?B?REluSFYwZVJyU0xNWkRDVVVUMDVHMnpFaDNwdEpoNnVqSVhyZ0FaOEM5azZt?=
 =?utf-8?B?UW1uSmREZ2NrcUVsNkdGc3hONmZFYVlocU5jMFZrK3g0NWF3TUVtRi9EMkNt?=
 =?utf-8?B?ZlRBSExpd2xnK3p5YjNxaTR6QXU5TVVmYnVVekxyNFFpMGtKMkJWSmFvS1Uv?=
 =?utf-8?B?b0pDWXR3YlpvckpybjVrLzAzWERoVVBQQU5rQ0U2Wmk5NkdPYTh2YjBQNXJO?=
 =?utf-8?B?OVV6M0tvVEN0Y0xPMEpNWU9tcHhFNitFS2cxQUMzNVZBbmRCa3h0NzFMN1Nx?=
 =?utf-8?B?dW5tZ2JtT0NOYURLTXJQT3lmT3NZaDZIMlZ3NlhsQmxWU1Vmdk5jY09lbUZN?=
 =?utf-8?B?emthblJMZ3VNZExSYkdlb3JZM3ZjRXllWTdWNUJJbWtFSVFBMFNEbTVRMll4?=
 =?utf-8?B?V3c2bU85a3M3QWcxNjZPQkE2UHBrQUQvbHhNUWFWYkZMcHUxaW9ldEVNSW1U?=
 =?utf-8?B?STB1RTk2UUh0QVIwTzZ5K1RBRTR2MThoZE9vS21jU05pc0tQYXR1VXZlWjRx?=
 =?utf-8?B?N0xZMEZadkZVU0htVWxXVGw2WEsyYWpUWXBLcUswa0hVd25hUFpHK0xXSE50?=
 =?utf-8?B?bU5mRzNNWXdJL1R2YUhydUxQNlNLNUFLbFUyZzhlb3NrRkxONzQyM29nSWhU?=
 =?utf-8?Q?LvjTS/IDEDeCfOZs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5032A639E4383740BF617D1E93213984@apcprd06.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cebd3565-0adc-4f53-855b-08df397efab7
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 07:49:24.4855
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KIuVD91PD3pXC6gnYryit1FG9RhExL+z1sJSeiPelGiIm0q0PRxWAqwMN4vrkkuSyHpCq3GlAnUcIQmnsbP970ar+P4zXG/snY14/Ct9SIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI3PR06MB8753

QWRkIHRoZSBVU0IzIFBIWSBub2RlIGZvciB0aGUgQ0lYIFNreTEgU29DIGFuZCBlbmFibGUgYm90
aCBQSFkgcG9ydHMNCm9uIHRoZSBSYWR4YSBPcmlvbiBPNiBib2FyZC4NCg0KU2lnbmVkLW9mZi1i
eTogSG9uZ2xpYW5nIFlhbmcgPGhvbmdsaWFuZy55YW5nQGNpeHRlY2guY29tPg0KLS0tDQp2NCAt
PiB2NToNCi0gRml4ZWQgdGhlICNzaXplLWNlbGxzIHByb3BlcnR5IG9yZGVyIGluIHRoZSBQSFkg
bm9kZS4NCi0gUmVtb3ZlZCB0aGUgdW51c2VkIHBoeS5oIGluY2x1ZGUuDQotIERyb3BwZWQgdGhl
IHJlZHVuZGFudCBzdGF0dXMgcHJvcGVydGllcyBvZiB0aGUgUEhZIHBvcnQgbm9kZXMgYW5kDQog
IHRoZSBjb3JyZXNwb25kaW5nIGJvYXJkIG92ZXJyaWRlcy4NCiBhcmNoL2FybTY0L2Jvb3QvZHRz
L2NpeC9za3kxLW9yaW9uLW82LmR0cyB8ICA0ICsrKysNCiBhcmNoL2FybTY0L2Jvb3QvZHRzL2Np
eC9za3kxLmR0c2kgICAgICAgICB8IDI1ICsrKysrKysrKysrKysrKysrKysrKysrDQogMiBmaWxl
cyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jv
b3QvZHRzL2NpeC9za3kxLW9yaW9uLW82LmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvY2l4L3Nr
eTEtb3Jpb24tbzYuZHRzDQppbmRleCBlMzljODc3NzRjMTIuLjVkNTdkZDllYTI5OSAxMDA2NDQN
Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvY2l4L3NreTEtb3Jpb24tbzYuZHRzDQorKysgYi9h
cmNoL2FybTY0L2Jvb3QvZHRzL2NpeC9za3kxLW9yaW9uLW82LmR0cw0KQEAgLTExNywzICsxMTcs
NyBAQCAmczVfZ3BpbzIgew0KICZ1YXJ0MiB7DQogCXN0YXR1cyA9ICJva2F5IjsNCiB9Ow0KKw0K
KyZ1c2IzX3BoeTQgew0KKwlzdGF0dXMgPSAib2theSI7DQorfTsNCmRpZmYgLS1naXQgYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL2NpeC9za3kxLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2NpeC9z
a3kxLmR0c2kNCmluZGV4IDBhODIwZjQ1ZmViOS4uMDZhMzExZWUxNGVmIDEwMDY0NA0KLS0tIGEv
YXJjaC9hcm02NC9ib290L2R0cy9jaXgvc2t5MS5kdHNpDQorKysgYi9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL2NpeC9za3kxLmR0c2kNCkBAIC02MDYsNiArNjA2LDMxIEBAIG1ib3hfYXAyc2ZoOiBtYWls
Ym94QDgwYTAwMDAgew0KIAkJCWNpeCxtYm94LWRpciA9ICJ0eCI7DQogCQl9Ow0KIA0KKwkJdXNi
M19waHk0OiB1c2ItcGh5QDkyMTAwMDAgew0KKwkJCWNvbXBhdGlibGUgPSAiY2l4LHNreTEtdXNi
My1waHkiOw0KKwkJCXJlZyA9IDwweDAwIDB4MDkyMTAwMDAgMHgwMCAweDQwMDAwPjsNCisJCQkj
YWRkcmVzcy1jZWxscyA9IDwxPjsNCisJCQkjc2l6ZS1jZWxscyA9IDwwPjsNCisJCQljbG9ja3Mg
PSA8JnNjbWlfY2xrIENMS19UUkVFX1VTQjNBX1BIWTNfR0FURT4sDQorCQkJCTwmc2NtaV9jbGsg
Q0xLX1RSRUVfVVNCM0FfUEhZX3gyX1JFRj47DQorCQkJY2xvY2stbmFtZXMgPSAiYXBiIiwgInJl
ZiI7DQorCQkJcmVzZXRzID0gPCZzNV9zeXNjb24gU0tZMV9VU0JQSFlfU1NfUlNUX04+LA0KKwkJ
CQk8JnM1X3N5c2NvbiBTS1kxX1VTQlBIWV9TU19QU1RfTj47DQorCQkJcmVzZXQtbmFtZXMgPSAi
Y29yZSIsICJhcGIiOw0KKw0KKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7DQorDQorCQkJdXNiM19w
aHk0XzA6IHVzYi1wb3J0QDAgew0KKwkJCQlyZWcgPSA8MD47DQorCQkJCSNwaHktY2VsbHMgPSA8
MD47DQorCQkJfTsNCisNCisJCQl1c2IzX3BoeTRfMTogdXNiLXBvcnRAMSB7DQorCQkJCXJlZyA9
IDwxPjsNCisJCQkJI3BoeS1jZWxscyA9IDwwPjsNCisJCQl9Ow0KKwkJfTsNCisNCiAJCXBjaWVf
eDhfcmM6IHBjaWVAYTAxMDAwMCB7DQogCQkJY29tcGF0aWJsZSA9ICJjaXgsc2t5MS1wY2llLWhv
c3QiOw0KIAkJCXJlZyA9IDwweDAwIDB4MGEwMTAwMDAgMHgwMCAweDEwMDAwPiwNCi0tIA0KMi41
NC4w
