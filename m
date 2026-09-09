Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022075.outbound.protection.outlook.com [52.101.126.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB96632B13E;
	Wed,  9 Sep 2026 05:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788932114; cv=fail; b=YP2FvNmVseFyIrHLujGidL5utjKx4n5R024NluFxh+ZIbwf2P2nQaU20ZEFNpM8BZjv11msAfUSC7zmPmssT2bN/3fcF6ja6KcKfO+Abg1tD4OvigD0QY9JY9mexyW1Rd/5O49WycA3uKUD4KXsSDUw5ABGXJM559l54NcFKkv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788932114; c=relaxed/simple;
	bh=ITRuMVPXrYLT2kzwrRKpWj7N6S+3yauHcHmQV7FL0Lk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZmLMwPznwjY+kCEuPt5Pm4t0Hy4ZavgCK47opi6K9NRNbA9q1Tc+2U20SymX3bxPh5UlghaZckEIrIbRUFkp+vJ/XLl00WeM3WfNv747a/4ED/SCWoZK42uoAPBTnzcyXilUgJDra8AXWh5X7L5jZAiTTTeHoziBUz277MNhEQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=FrH1kxOK; arc=fail smtp.client-ip=52.101.126.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="FrH1kxOK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qfBmvvoUcv1ee9xq/mG1UDQOa7W9OIZHxWGz16/07OAHBIN40SwvDS8fqDufIZbVnz86PSiWic9C3Bs0aXULA//azHFgbfKFuW4CdG0bipJGataz95L/0bzKQbkBTqA+JFyar+qHsebBdt7sGuLXYui92K+B+xw+mHq9yYC9MV0D5IYmuM+4cOjZQg5VSUdrTyM2EPpDLHlduIrUwq1rsC08QjRncUps/manhQYBvjV5CGmqM2Sjt75/p5dNpvcclptqeoCfi09EUed7VPrLQ+wlfZChRVhOoK8qFWaxOowkNvNAy4xacDpZI5IAmZL5GmHgvsgIi5lgFmwdJ3ywtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ITRuMVPXrYLT2kzwrRKpWj7N6S+3yauHcHmQV7FL0Lk=;
 b=KqbXkx2GVO0E4HdOMa/J3WI6T6vR8htqxQjL+AD4L8G5VqCTaOmVkGxkMc8w9b8el9cSsPy8z/L/z2dhQXf9ezFN1VY72CEcwhrqKGnBz1aMnwLXkz6V57sIotOeRvRQEsnzF60GtevO8frqB9wnOs59mOmRToc6iWx8ViKhssaJW6cTTcdMRswUkIaP0NTzxBMjVivjc/sEKAWlhQ2FVNIF6Qh94PXDjxdX+K9xpRLpOzhr69hWxDMNBNJCIkyrSlbClKyJec2Hw1ZSwPuVBhnBEKslQrO5SJZdjq3fDOOLzKOjrdRdp7gxPs1qsHkO7kIstdzTB+xMZT+QosRKyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITRuMVPXrYLT2kzwrRKpWj7N6S+3yauHcHmQV7FL0Lk=;
 b=FrH1kxOKUmSPiYYDX8k1hHx9emPvlvWwV0J5VzfsbBz2cFyKY+ybExhqa9JPX3DFe41664H46M+YxFzFhU/vyN2tRnGxjIpvKHjkPK+SV9/ZrnaMxTEJneg7XPY1ffdoWFcKkDQroptQCDnecepgC69ypr9VYl8pKJzeKgYxp0QX+H6/gJGgQTsc8jgAwrcVG+MNNSwhZA/2UClCdr0VJUgmUhRAatD1NDaQqzDzGGhE9bMNTip1N7Rig1vIWBBAwjR2vJtavtr7stRYsuIGFr1A17f6JUorndIY/czIRIqTnS7oHuTPShWUawCSp6NRt4XqsjMnYO0Nb0SQQwqJ7g==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by JH0PR06MB7268.apcprd06.prod.outlook.com (2603:1096:990:96::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 05:35:09 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19%3]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 05:35:09 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Philipp Zabel
	<p.zabel@pengutronix.de>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject:
 =?big5?B?pl7C0DogW1BBVENIIDEvOF0gZHQtYmluZGluZ3M6IGkzYzogRG9jdW1lbnQgdGhl?=
 =?big5?Q?_AST2700_I3C_controller?=
Thread-Topic: [PATCH 1/8] dt-bindings: i3c: Document the AST2700 I3C
 controller
Thread-Index: AQHdOgYGnk2AFkBmnEiGGqUqF4qN8bbCsC8AgAMVV8k=
Date: Wed, 9 Sep 2026 05:35:08 +0000
Message-ID:
 <OSQPR06MB72529022B91B6480A927385F8BB02@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20260901-b4-i3c-hci-ast2700-v1-0-19909e7cbd7e@aspeedtech.com>
 <20260901-b4-i3c-hci-ast2700-v1-1-19909e7cbd7e@aspeedtech.com>
 <20260907-imaginary-economic-oyster-57cdd6@quoll>
In-Reply-To: <20260907-imaginary-economic-oyster-57cdd6@quoll>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|JH0PR06MB7268:EE_
x-ms-office365-filtering-correlation-id: c7cd7b17-3e56-4109-c9db-08df0e341c8f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|366016|10067099003|6133799003|3023799007|18002099003|22082099003|56012099006|4143699003|38070700021;
x-microsoft-antispam-message-info:
 5FnUqGRpjCP/igRauHJ/pv8dAxFRvxY1BJQzpuhvv5azPVsUj/Kgs4gR+BfNYw0a0x3XgKGo9ZPIqAZWsh4LBFN1eyk6fphWImE2YiOg8X96Mw4FsLThSZTtqwB52OMjUgYKK8RRw8QQEZRmIQuFUz3C98mQm7qJzvIFzz5uXMw2OTP+UP0/SOo7xAmAAnT7gEt/CU6XYK3BJIDCgc2MxC2K6s98iGYlTTNXx4xNRogLd7oJwseXboqViwhsx4JGCgLNodMfgIjhrDEaUfnKOWvNWg+lBJU4gKnpIwbSsskByiK6ZVKEjhe4YLA4nnVngsnaNSDSEk+nHbbJ517x0gr+Wqy28tX53D4pMTFUOdDk9MIpj+g+vvb3IonKk+rK4LRG2hROlC2yPO3H0AJ4+4y5BaoYYJGZ2fXbUEJDB2VvY1/X9YBNBnA2fTNT7LLDT8mlfI4C78nHh0RZUl/c3VEuV7HhxLE6dJfYw3TjAiV9s1vVHzKn/yUI4nelx/wif48r50fl7JJJN8i9xUgtcFJP24jZd27x544/pBhvtVCBW+qgh3MAGu8xgcbv9kJYt0Z4mQmOhoPo0MO/YmSTqmwWx3iYzx01LUxoW6w1POBIozWRf8RA57F/s8xbwrhNGlbEP017js6vqRFLUG2YcAT1982qP13UTDU4abZ46F/5LW4TOxnl7dVZzKuUW/w4vP3+NcaebEzvoOsEM/ry8CzV+jYNW/bOpu6ZP5M2PHM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(56012099006)(4143699003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?big5?B?b1hyK2xZRmFpaE9kUTZXT2E2MWpjVmpXN3BBYit2RGN4WndvdzEzb3lUd3JxcG1T?=
 =?big5?B?RmlWOVdRWE85bmFYRU9haEJGWWVBVWM4NEMvL2Z6Q3I1cnVaSnNsbUlmbXpSUHVz?=
 =?big5?B?UmtmcnNQWGd0VzNydTBjZ0I1RGJlT0FaZUZhSFExTWxTNm4wK0pEUnVINWRNbGVF?=
 =?big5?B?WXY3WU41OTV0dlBWY2xKaDVGbXl1SXdTZlhoZzZySGI3SGkvZmRxbWRyV3NuMVNs?=
 =?big5?B?blFqV2Qxck5jZGt5STVndTJWTnRxeFlFNGRIdEpyS0tLSHNCM2xMZG9EV29NSzRz?=
 =?big5?B?ajRNNld5UHNaM0dwNjB1c1ZFcnZkWE50YWNrQ0h2N25kaDZsdkxZM3I3b1Zwa3Rt?=
 =?big5?B?bVB6ZTlra251dktNa3FJR1c3aUxFMEMrU2ZET1d0VHBiZVF1K1BhRXFUNkhFU2hP?=
 =?big5?B?SE5LSzh4V3RFVlZWd2VxclBxVXp6dkxTamV4aUVFSFdtUnNEUnBPZzlzMG00K2lj?=
 =?big5?B?Qk1xMlBLZGJNUkxidVRVRzVmV0t3Mm1hd0sxRWVYODVYRy9Ib01FMWFiQlRTY1BM?=
 =?big5?B?Qzd5eFA2enVBZVNQN3lRdVh2cGdDUDZ2QWZlS044NkJkK3NCcEVSbXBuMjd0T0Zv?=
 =?big5?B?SlI4VytXTjFDVGZud3V5NmxwVEhiVjk5NDhwS1A1aHU0MktLK1VkZ2pDM2NkZzJm?=
 =?big5?B?S3o1RjVEWUpKeVJsWXorUURvbDN3NXBOdlhHc0hUc1pHNjFreUZHL0p3c2s2SGkw?=
 =?big5?B?Qllic1NOVVZJa0NWSUhkVzVPMXEvUzRKb3gzck8ybFAxV1FMc0daZVk3emxHczRL?=
 =?big5?B?K2ZBQWtnQ3FYenpCU004ZFNkTk1saUlQdDUxelhCbGY5Y0dudlYyZHNORnZrdi9l?=
 =?big5?B?UjYrZ0N1SGpxdmYwRkxzTW9MTUF2a1FIbk9WNHhsd2JIaC9BTC94NnBjaVowV3I4?=
 =?big5?B?YXloQVk0eVlpNTZ5dFc1R2dEOGNmbmY4d1EzZTl4dS9mbzhEa1ErY1czNDVtTStU?=
 =?big5?B?d0hwUVE3b0FDT0RnQWpuNHZOa0pyZURoVW42bDRieVoxU1NuM09YM3VENFRPMk9F?=
 =?big5?B?ZGh6N3pwNHJndHgzbG9YVXB1VndIUTIrdURlbmZ0alBJRDZ6T1JNNFdqR1JvNkVk?=
 =?big5?B?V1JBZTgxL2ZMVXFiQW1EeVZHcTVUbm9vd2JvMDNDcHJqaUlyR0xRc3JORU9HVk9U?=
 =?big5?B?M3hwM3FqV3pxQis2ckVvM0VMREpKVU5rZm9VNG94OS8zR0xoQVpUUVVJV2l3ejNX?=
 =?big5?B?UWEyazlsKys4Z1FHSjVHcTRXeXJadUdVOTNBVENZc01HaWtjMjR0Vkc4RU5sWkpS?=
 =?big5?B?aER6OGFqT082MUFmLzNMZ05EYVA3YW9rUTB1Z3h3dlRtdUx0WXZ0c0hudCtQWURD?=
 =?big5?B?aks2QzN4Vll3emQzdmp6azFSejZXK1AxSjl5cVRyUmMvbzlleHdNeW9VbUNqQ2Rh?=
 =?big5?B?UWYzS3EvU2dwN053OFRXY25qT2lTQ2Y5RC9SOXJ4eGVxbFVvb2UzZnpmYVp0N1ZW?=
 =?big5?B?WG50Wlo4ZjRxOVhQUXV4WXZ4anYvd3ZUWGIwWjhtQzQzRnk2OVoySmszbGMzVlRv?=
 =?big5?B?ZFJqZlAyYlJTcTNvd2VvY0JtY09WbDRqdWQ4Vjh3ZWkxSlFTNUNtZytNU0NuaSs4?=
 =?big5?B?N0Y4U0VkS2xCVVE4bUk5YlkrSHRtWERWU2Y4djczQ1l4MUlxOWVscHoyK1NERGFo?=
 =?big5?B?THdoVHlzZnBuZENKYkw4alBKWFdjaDY1S1doUXd6K1NBKzR3cXp0U0NwamdRRlBG?=
 =?big5?B?azZvb3Y0cDNhY0xSc3F4aHdKclU0OVRJRTlDdkpUbmRxcUpuQnJ4a3NYUDJ4aXVq?=
 =?big5?B?VVh0eHk2S09WWWlUdm0yMHFWRGxSamNQa1N5M3QwV3d1YlpCOVJpZEYyRkRhZ0lW?=
 =?big5?B?L085czhjRmRzcFRVbmV2ZThVN0dYZ0gzMi8yVW02cWdsUjFFM2Y4NktPWm10Q1dq?=
 =?big5?B?Q2VNVFVuWW00eGRNUy85WmNTb0Fpd1ozSDVlaHhXa2N5RGcrZ2J6ZmQ0S25aS1dH?=
 =?big5?B?cmhNUDlwbWp1L0NWbXBPMnpkSlEzV0VOMWw0SjBGWTFQYThjVUpjR0xjU01mTXVZ?=
 =?big5?B?VnFEWEtVU2J1azl5QlAweGNSZWZISXIvV0FUSnUrTXdEc25xTFIxUHNJdmVyZ01l?=
 =?big5?B?cmVFNmhiMEFudHRMc0FIZEtoTE94RkdUeTkvbmFDamFlY3dMS3BXYUZrYlAyVElw?=
 =?big5?B?aDM5YTE4S0l6dCtwR0ZqbUttMjhBWldaSVpmWHJCQjRzRjdqbEN2OUptQ0xkdDdu?=
 =?big5?B?b2FDcGtmQWNpWGJJVVRiSWQ4WVdCQT09?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7cd7b17-3e56-4109-c9db-08df0e341c8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 05:35:08.9910
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8AWbPf3ANHrb+AFZ6p8EDqX5Y32QM4qBk+R13XmX6Q8l6a6OhnNaOoU5vUVRBRUkc3ggvXekUPDUXJLneJBZfoOs+bqL5//OeKOPJTiOTiY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7268

PiA+IFRoZSBBU1QyNzAwIEkzQyBjb250cm9sbGVyIGltcGxlbWVudHMgdGhlIE1JUEkgSTNDIEhD
SSBwcm9ncmFtbWluZwo+ID4gbW9kZWwsIGV4dGVuZGVkIHdpdGggYW4gQVNQRUVEIGluLWhvdXNl
IGNvbnRyb2wgYmxvY2sgYW5kIGEgUEhZCj4gPiBwcm9ncmFtbWluZyB3aW5kb3cgYWR2ZXJ0aXNl
ZCB0aHJvdWdoIGFuIEhDSSB2ZW5kb3IgZXh0ZW5kZWQKPiA+IGNhcGFiaWxpdHkuIEZvbGxvdyB0
aGUgZXhpc3RpbmcgYXNwZWVkLGFzdDI2MDAtaTNjIHByZWNlZGVudCBvZgo+ID4gZGVzY3JpYmlu
ZyBTb0MgaW50ZWdyYXRpb25zIG9mIGEgY29tbW9uIEkzQyBJUCBpbiB0aGVpciBvd24gc2NoZW1h
LgoKPiBXaGF0IHByZWNlZGVudCBleGFjdGx5Pwo+Cj4gQXJlIHlvdSBub3cgYnJpbmdpbmcgc29t
ZSBMTE0gc2xvcCBhcmd1bWVudHMgaGVyZT8KCk15IHJlYXNvbiBmb3IgcHJvcG9zaW5nIGEgc2Vw
YXJhdGUgc2NoZW1hIHdhcyB0byBrZWVwIHRoZQpBU1QyNzAwLXNwZWNpZmljIHByb3BlcnRpZXMg
KHJlc2V0IGxpbmVzLCBwdWxsLXVwIHN0cmVuZ3RoLCBhbmQKdGltaW5nIG92ZXJyaWRlcykgYW5k
IHRoZWlyIHZhbGlkYXRpb24gdG9nZXRoZXIuIEV4dGVuZGluZwptaXBpLWkzYy1oY2kueWFtbCB3
aXRoIGEgY29uZGl0aW9uYWwsIGFzIHdhcyBkb25lIGZvcgptaWNyb2NoaXAsc2FtYTdkNjUtaTNj
LWhjaSwgaXMgYWxzbyBhIHBvc3NpYmxlIGFwcHJvYWNoLCBidXQgSSB0aGluawp0aGUgdHJhZGUt
b2ZmIGNvbWVzIGRvd24gdG8gaG93IG11Y2ggQVNUMjcwMC1zcGVjaWZpYyBjb250ZW50IHdvdWxk
CmVuZCB1cCBpbiB0aGUgc2hhcmVkIGZpbGUuIG1pY3JvY2hpcCBvbmx5IG5lZWRlZCBvbmUgY29u
ZGl0aW9uYWwKcHJvcGVydHkgKGNsb2NrcyksIHNvIGZvbGRpbmcgaXQgaW4gYmFyZWx5IHRvdWNo
ZXMgdGhlIHNoYXJlZCBzY2hlbWEuCkFTVDI3MDAgbmVlZHMgYSBjb25zdHJhaW5lZCB0d28tZW50
cnkgcmVzZXRzL3Jlc2V0LW5hbWVzIHBhaXIsCnB1bGwtdXAgc3RyZW5ndGggYW5kIGVpZ2h0IHRp
bWluZyBvdmVycmlkZXMsIHdoaWNoIHdvdWxkIHR1cm4gaW50byBhCm11Y2ggbGFyZ2VyIGNvbmRp
dGlvbmFsIGJsb2NrIG1peGVkIGludG8gYSBmaWxlIGV2ZXJ5IG90aGVyCm1pcGktaTNjLWhjaSB2
ZW5kb3IgYWxzbyBoYXMgdG8gcmVhZC4KClRoYXQgc2FpZCwgdGhpcyBkZXBlbmRzIG9uIHdoZXJl
IHRoZSB0aW1pbmcgcHJvcGVydGllcyBlbmQgdXAuIElmCnRoZXkgbW92ZSBpbnRvIGkzYy55YW1s
IGFzIGdlbmVyaWMgcHJvcGVydGllcywgcGVyIHRoZSBwcm9wb3NhbApiZWxvdywgd2hhdCdzIGxl
ZnQgQVNUMjcwMC1zcGVjaWZpYyBzaHJpbmtzIHRvIHRoZSByZXNldCBsaW5lcyBhbmQKcHVsbC11
cCBzdHJlbmd0aCwgY2xvc2VyIHRvIHRoZSBzYW1lIHNpemUgYXMgbWljcm9jaGlwJ3Mgc2luZ2xl
CnByb3BlcnR5LiBBdCB0aGF0IHBvaW50IEknZCBsZWFuIHRvd2FyZHMgZm9sZGluZyBBU1QyNzAw
IGludG8KbWlwaS1pM2MtaGNpLnlhbWwgdmlhIGlmL3RoZW4gdG9vLCByYXRoZXIgdGhhbiBrZWVw
aW5nIGEgc2VwYXJhdGUKZmlsZSBmb3Igc3VjaCBhIHNtYWxsIHJlbWFpbmRlci4KCj4gPiArICBh
c3BlZWQscHAtc2NsLWhpZ2gtbnM6Cj4gPiArICAgIGRlc2NyaXB0aW9uOgo+ID4gKyAgICAgIFB1
c2gtcHVsbCBTQ0wgaGlnaCBwZXJpb2QuIE92ZXJyaWRlcyB0aGUgdmFsdWUgZGVyaXZlZCBmcm9t
IHRoZQo+ID4gKyAgICAgIGkzYy1zY2wtaHogYnVzIHJhdGUuClsuLi5dCj4gPiArICBhc3BlZWQs
c3ItcC1zY2wtbG93LW5zOgo+ID4gKyAgICBkZWZhdWx0OiA0MAo+ID4gKyAgICBkZXNjcmlwdGlv
bjoKPiA+ICsgICAgICBTQ0wgbG93IHBlcmlvZCB1c2VkIHdoaWxlIHByZXBhcmluZyBhIHJlcGVh
dGVkIFNUQVJUIG9yIFNUT1AKPiA+ICsgICAgICBjb25kaXRpb24sIGtlcHQgc2VwYXJhdGUgZnJv
bSB0aGUgcHVzaC1wdWxsIFNDTCBsb3cgcGVyaW9kIHRvCj4gPiArICAgICAgc2F0aXNmeSB0aGUg
TUlQSSBJM0MgY2xvY2sgc3RhbGxpbmcgcmVxdWlyZW1lbnRzLgoKPiBQcm9iYWJseSBJM0MgbWFp
bnRhaW5lcnMgc2hvdWxkIHdlaWdodCBpbiBoZXJlIGFuZCBoZWxwIC0gc2hvdWxkIHRoZXNlCj4g
YmUgbWFkZSBnZW5lcmljIGZvciBhbGwgSTNDIGNvbnRyb2xsZXJzPyBJIGFtIHN1cnByaXNlZCBz
b21lCj4gInN0YW5kYXJkIiBJM0MgY29udHJvbGxlciBuZWVkcyB0byBjb25maWd1cmUgdGhpcyBh
cyB0aGUgc2luZ2xlIG9uZS4KPiBObyBvdGhlciBldmVyIG5lZWRlZC4uLgoKSSBjb25zaWRlcmVk
IGRvaW5nIHRoaXMgdG8gYmVnaW4gd2l0aCwgYnV0IGNob3NlIHRvIG1ha2UgdGhlbSB2ZW5kb3It
c3BlY2lmaWMKZm9yIHRoZSBpbml0aWFsIHByb3Bvc2FsIHRvIGtlZXAgdGhlIHNjb3BlIHNtYWxs
LiBJIGNhbiBtYWtlIHRoZW0gZ2xvYmFsCnByb3BlcnRpZXMgZm9yIGkzYyBpZiB3ZSBnZXQgY29u
c2Vuc3VzLgoKQmlsbHk=
