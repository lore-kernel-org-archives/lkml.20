Received: from WA1P291CU003.outbound.protection.outlook.com (mail-polandcentralazolkn19011037.outbound.protection.outlook.com [52.103.53.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8657A38AC90
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 16:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.53.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791045156; cv=fail; b=HfVQ0KTznyW1Vusya5bRH6Ooffkf0cnRQwk8qa+mFzxSKKPA2daVVQ2PqO2OPTa/fGAoofwoFk/0htr7yT1plNBh2E+21xsbKImTT3M6mktnVJ63NpVXFnvkSpVzgO0j8iLUANewdY26LMvnlPd/e97MRDF/+DS0ZqgddsQonqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791045156; c=relaxed/simple;
	bh=5ZSP5dJxhzpF3g4brihhPMmp0Udv6PMzn2B1Z+fm8g0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bgnejKi1zUd5+pZFLGoQHrfc/hAcx9Y4dN5ur9UvbAbB5KJshdXdrE+4vyBHpzrUsSoGzYvCYiwim5xQ4K1YtTXQrje2A0/wXgsWPv00DnZ9NURrpXGSK0ZiM3GclqYjkOOx2yJtBe5apZXhOXcjrZGlTfKHFCyOYg1ZSd3gZpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=sH6bIdJx; arc=fail smtp.client-ip=52.103.53.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="sH6bIdJx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h/xR6p1RQfueAEDwXgsmLEVE5Y08ekZ1oUfYKRPVtFSTnjNknF1Sccv0XrrvLLW+mN1AFT0Qmj2nnCxRe22LGpJsnUJQNWXWjU30g7TpK/XRpmWKsX6vlE4nD4luLlDBsppCglMLMIekCKADJiaGCn/9YRL5mw97IZxj4VXp2vO0er9WqoREAQ2l29FcZawEZAYFc3i1oU5QlR56uapB/Klq9lpgVrzLKIR8RY9B3r8Gu0aTdfS/JS4rRk4OBrmvbulcS0j7Rg1J37qo/LJgVA6YdT3iZJw4kVP8mT4dkHcvdziHXMdmrvRHxaIMqn+3RZFg3qbYBXnuQStZcxGWdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ZSP5dJxhzpF3g4brihhPMmp0Udv6PMzn2B1Z+fm8g0=;
 b=lUTgTq1yoGxw4bhblW29TkajWKwMt7WR/2g1ewnxnbwIRI6/0+oIVgx2KsBkCDJIBeQhoO+bMH4dVfvj5h1VSpentY/gW7VP6yYtu0znDkqoXMYzqVPwN7Sunas/mECsDNfMxtcpE40Ca1pOjqT2OJWZmwnf6j8W2DuHBAMDksU+d2/tyPcR8ZMrG0+zmZdIlhC1fxcho8/PGJ09MW7QPD0dwHzl3X9/8Gr5mK7QAophQNDlivaUHbA3+tIDW0+qiut7JITVM7cdeeqCDmrHG8nwQAAziLTVQi5J8DgWDFN3YcnOSbNrr6olQ0mqHdbt+U8irw+q4uWKRrbrWnR98A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ZSP5dJxhzpF3g4brihhPMmp0Udv6PMzn2B1Z+fm8g0=;
 b=sH6bIdJxIqXS/OHf9nrW04AhNMe4mAI6p6uY+6PRxawfi1tvAHO+PWJKhoYjsZQzdbYlXiw9F2GenyQftaEHDzcK0KNMeXCHZ4ZI9UDhQzjBqyAX/QUHMVJKvrcbzQ2dNQe2mGRfTxCjfyapmbeIl+CFAeXVKpt5Y2KD0QakIVsB6y35BIawwjB+kBdqrsD7+AUfIb4gNDM6mJJ9u6lZJIdOyOQQGjeaTD/2+lyyMacQeI6YmGcRXFbjORn9Nz2+mSSjaYD8EfxDbZxMDxEEqPBegNmV6ciM6H87dG/XfjV99kGZ9hrzjU0IBD3hhzpTmSjtQZTMAqiu/B00ilThZA==
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:26::11)
 by WA1P291MB0059.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:10::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Sat, 3 Oct
 2026 16:32:31 +0000
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404]) by WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404%6]) with mapi id 15.21.0472.016; Sat, 3 Oct 2026
 16:32:31 +0000
From: =?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?= <habilerenturker@hotmail.com>
To: "luto@kernel.org" <luto@kernel.org>, "tglx@kernel.org" <tglx@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org"
	<x86@kernel.org>
CC: "hpa@zytor.com" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?=
	<habilerenturker@hotmail.com>
Subject: [PATCH 1/2] x86/vdso: Replace deprecated simple_strtoul() with
 kstrtouint()
Thread-Topic: [PATCH 1/2] x86/vdso: Replace deprecated simple_strtoul() with
 kstrtouint()
Thread-Index: AQHdU1TJ8y/ObaaJ1k6wmTICg8rkXg==
Date: Sat, 3 Oct 2026 16:32:31 +0000
Message-ID: <20261003163216.11547-2-habilerenturker@hotmail.com>
References: <20261003163216.11547-1-habilerenturker@hotmail.com>
In-Reply-To: <20261003163216.11547-1-habilerenturker@hotmail.com>
Accept-Language: tr-TR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: WA2P291MB0187:EE_|WA1P291MB0059:EE_
x-ms-office365-filtering-correlation-id: b25b1dc6-4a01-4cb1-6e86-08df216bec07
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799012|38102599003|55001999006|25010399006|24021099003|51005399006|31061999003|8060799015|19110799012|8062599012|2607281247196008|40105399003|102099032|3412199025|440099028|1710799026;
x-microsoft-antispam-message-info:
 =?utf-8?B?RVBmcGcvRVJtdExYdkoyNEx6b2M0OXBzbG4wTkdpVGtFMldYVUkrMi9DVnpi?=
 =?utf-8?B?T3NOYktVVDM0UDduVDM4aDNkU2dwMzNja29iWGVzUU5Nd1MvZjFEZkxCZ09K?=
 =?utf-8?B?M3lYemQ4Qk5iQmNHNWEzR0lWaDhLMXZlbkdaTlNoeTgvVDZjMWxjTXZOYlRS?=
 =?utf-8?B?T25qemh2ZjdMMzgyR0pNdmwyNklueVhydHRWZ2JSTXBZRUxYQ3hCTFZybjRW?=
 =?utf-8?B?bWZmTE9tY2tPNzVUQkNOMjlBT3pPZ2VjZW1hQ0JycC82ZWh4Q1NUS2dRWElm?=
 =?utf-8?B?ZHRZZVV1bFBoNmVhRENhdGdqUnBMUUNIQ003T0VpTDBmSW03Z3FvQ0lQcGN4?=
 =?utf-8?B?K0g2b3kybVpoL1V6bjMvRTRkb2szSi9kUEdFbW5iSmNGTGRsZWVzSXlOYjJL?=
 =?utf-8?B?bGs2UkR6cEhIRm95NUlMaW1VVDZBS294cFVuRWVqZkh2TUV6RWR0b0ZxTTJh?=
 =?utf-8?B?a3VpRE9BSEVSMzV6RlNyOGppM2VVenROZWRqYUE5VmJOVlc2RDRiaU5wWG5x?=
 =?utf-8?B?N1RtM1JoWVNSRFhOVE5JeXpSR1RMYkV2Qy9jcFJ5eGUyeXVmMElGMGpVZjVs?=
 =?utf-8?B?L1hPNXhybHkxZ1lJeGRMQkFkdE15L1FmNVIySGN1a2psZW1KSkptL01CRHhs?=
 =?utf-8?B?KzRtaHZoNisxRDFqb25zNTlpRzBTUTNBdWROZmVSMnppUXVuaVd0cW5TME9o?=
 =?utf-8?B?cDdraU1DblBzOGdMeE1LYTl4dFhxaVk3WVVNU3h3VFk1OGg3TWNIRDBMTjcv?=
 =?utf-8?B?WmdkZWs0Q3dvNlhXTmVDdnhQUUI1TzAvejZkT0dNbjByMlRzUUlFK0RPUHBF?=
 =?utf-8?B?Y1BueWFXalJEMDNSellVZ0FZTmNmRUNqRXNWUkdDeGJLaU5JOTl3cnJkdHJH?=
 =?utf-8?B?YTF5WEFPMFRvd09tQlZZempBM0QzSkFRS05rOHlyVHd2QXRVdUxnWUY3ZkQv?=
 =?utf-8?B?WjVlUys2Q2N1K05KZWVPRWtzZVkrVVRWcmUxK0V0YjErVkl5NGdSREt4QklW?=
 =?utf-8?B?cllCVllJUUswUDU3bk1FbG1Md2xoQU4zMzl4ek5CUUpoZ1oya1FhSFpVS1o3?=
 =?utf-8?B?RXRnSnRTelRTQzlHUFJWRjVmcXNVcGFHcndDWU1wR2hOQXhLYnZ1M0NLQjJ2?=
 =?utf-8?B?MWpDTElXSTZjZE5zTTEyZStBSGhrQU5FU0RIYVZoYTFWNG81VWVMU1NnSVp2?=
 =?utf-8?B?dkdYTUdRYXhMS0JyNmFhdWd1eDVpREpLUUJxbWZVNkw0a2Y5VFErVElVQ09r?=
 =?utf-8?B?b3Y2REVXcEpqdU4wMnh2aWhYa3laQ1FsOWt3QldzT2RreEhQTi9LQlUrTTI4?=
 =?utf-8?B?VzBVeVEyaEI1VHc4clE0T2U3am5URXhoRmE0V3BJMVV4WVFISVFESm56SUc2?=
 =?utf-8?B?RmVsSW9nenJ2a3c9PQ==?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?akhwOWdqQW4rVTlwQzlOVmVvRHMyZmw0WXc3T0wxM1Q0dnRMQ1l2aHhGclVI?=
 =?utf-8?B?Q0NKYlRkZjFhbndtY1cwSFVTSlgzZnVONkVITXdvaXhUT2lDR2VScC9pNnd4?=
 =?utf-8?B?bDJMOXJTYlkyK3Y3Qk5pdHdGMVJLeHptYVJta3pwbXpWNUJHMFFZMjk3QXNn?=
 =?utf-8?B?SGREVkxsc04zbnZBTTM1NkJaWG5SdUl6MTNONHpXNkYybXZqZTlhYlpmSEh6?=
 =?utf-8?B?ZkEvRXoybEFOM0Q0eTFib0wyV2hoMHBqQVpsemFVWDFhK3YveHBITFhGeWtG?=
 =?utf-8?B?M0VsdXdPZkRnckFZdlI1dWZtTXRnanhucU5MR0NNUzMyclNxNmlGZFhwRXJD?=
 =?utf-8?B?VDNEMGlpZFpJS3FzdlRwOUFHTFdpcEtFYmhuQ0M2c1JkWUY5eGdFY2x3SEJB?=
 =?utf-8?B?ak5xTTllMWVabDYveHM0QjdxV0NVSVpVRzhqZ055MkxwbHZEUFdIdjdUWVZi?=
 =?utf-8?B?Ykt1L2RoYkFBejd5ajV3a2NCRWJiMXRUelJZVFpseVFWRWpyUngrUis5T21G?=
 =?utf-8?B?US9mdHJ3UjJVNlZuMWx0VUljY21ON2JJNVhWTUpCMGRDZnlPQnVYV3dRc1E3?=
 =?utf-8?B?bzlCQU5rZkV5Wlh5ZXFkaExvZFVuRzArZjBHRGNPbFl3a1oyYXNUWE1QaVZn?=
 =?utf-8?B?LzNydGJLVTdweVNIakVFVGVVSmhkWVo2dDBVR0QzZ0pzOFAzYUtjTi85Vk5E?=
 =?utf-8?B?MDRYSlc5UjFobUhaS245d0pIdEdlbWNKU1dEU1VUZUIyWG1mNUZSM2dITGlj?=
 =?utf-8?B?NVlCb2JrbVVhb1RYK1pDNGs0a2xETkdiU3pjUkNnTlBVMDF0SlB6TDZ6eGpS?=
 =?utf-8?B?NHRUYmxkNm9Ya1FJcnhZbEh3dGoyRXJkMktrRW1JcCt2eC83c2lhWkdseWsz?=
 =?utf-8?B?WFZybXpWK01TczNOWklHbjY0VllTRUs4MUdXOVJiN015S3duWEJDZkhySVZ1?=
 =?utf-8?B?cnI3Y1ErZjRCSi84ZlVSM09WQ3FuSlBjb2ZXYXpzWjR6QjJnS1JtSWM3VVpV?=
 =?utf-8?B?MExacVhhZGlkMm8wa2FES2tKSDlGT0U1K3RvV25tbC9LNVpidHFRd1FyUDRv?=
 =?utf-8?B?aWFtS0xrbllaTWlXUi9CL1BFRFY3bFpKZXhNZHNtL1ZhMkpXcnFqMkxSelp5?=
 =?utf-8?B?THdvZ2lTU1Y5ckVCWlc5YmREWWtCTUlOTkxGM0JOeUFpWlJna011UjREV1o1?=
 =?utf-8?B?MzhjZ2N3OVViWUsxNFpjY0V1U1grR2g1V1FkWSt0d0EzQVlDZzRoSSthVWhJ?=
 =?utf-8?B?d0IxMVZhaVI0OWY1M3ArN1pnOHZIWC9ia2hIamJuanRaK1ZTWkdXNWtsSk4v?=
 =?utf-8?B?WG5Nc29DS0wyMHl6QWZ2WFF1V3dRK2dCbUFpZ2dkVVl0R1B1VFAyU0oxbU1S?=
 =?utf-8?B?VzRCRDRlS3NNOXlkUkllRmhycWxBcjZaTlI3azI0d0dRWVM4RTB2U2RvK3lJ?=
 =?utf-8?B?bm5MYlpraERERU5WRVdnTGdrYmxmV1dwVGMzekc2bEpNeTc4T21STzJ3bHhX?=
 =?utf-8?B?YnN4SDZpMk5HVWVyeGJYNGh2THhqYWM4R1ZxaDBQeHMvWklCelNTYTFiTE5M?=
 =?utf-8?B?QXVkSktNZW9RcDVZdHRhbnExd1ROVHRZcmVQd2lOL0FMWlROY1JiSGVkTU81?=
 =?utf-8?B?Y0gxQXBKTk1Dem1SWXZUS1p6TWErRDk2M0lERFROdHNaVGxtTXkzcFpudS9s?=
 =?utf-8?B?a3NPc2tsT1pWTExFTGZFUkNWckh6bXpHRjB4Z1NSTlVoZWJOREtPN0pBeTBS?=
 =?utf-8?B?emNoZnIySldSeVhqY3ZUQjlieXcwUko4MEdPYmxzYVV3WFRZbjdSZFdTZS9i?=
 =?utf-8?B?MEFBMjkweWw3WGxGRkZJaUh0Z0tzS25qTnhrSVJtd051NUhwckMvY3VIVzJF?=
 =?utf-8?Q?ByI3lAszzMmIN?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EFBB26F41E84DB4FB910085AEE593F90@POLP291.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-2112e.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: b25b1dc6-4a01-4cb1-6e86-08df216bec07
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2026 16:32:31.4753
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA1P291MB0059

VGhlIHNpbXBsZV9zdHJ0b3VsKCkgZnVuY3Rpb24gaXMgZGVwcmVjYXRlZCBiZWNhdXNlIGl0IGV4
cGxpY2l0bHkgaWdub3JlcwpvdmVyZmxvd3MuIFJlcGxhY2UgaXQgd2l0aCB0aGUgcHJvcGVyIHZh
cmlhbnQsIGtzdHJ0b3VpbnQoKSwKaW4gdmRzbzMyX3NldHVwKCkuCgpJdCB3YXMgZGV0ZWN0ZWQg
d2hpbGUgcnVubmluZyBhIHN0YXRpYyBhbmFseXNpcyBvbiB0aGUgdXNlIG9mCnNpbXBsZV9zdHJ0
b3VsKCkgaW4gdGhlIGtlcm5lbC4KClNpZ25lZC1vZmYtYnk6IEhhYmlsIEVyZW4gVMO8cmtlciA8
aGFiaWxlcmVudHVya2VyQGhvdG1haWwuY29tPgotLS0KIGFyY2gveDg2L2VudHJ5L3Zkc28vdmRz
bzMyLXNldHVwLmMgfCAzICstLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2VudHJ5L3Zkc28vdmRzbzMyLXNldHVw
LmMgYi9hcmNoL3g4Ni9lbnRyeS92ZHNvL3Zkc28zMi1zZXR1cC5jCmluZGV4IDg4OTQwMTNlZS4u
NWJkNDVhZTMyIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9lbnRyeS92ZHNvL3Zkc28zMi1zZXR1cC5j
CisrKyBiL2FyY2gveDg2L2VudHJ5L3Zkc28vdmRzbzMyLXNldHVwLmMKQEAgLTMwLDkgKzMwLDgg
QEAgdW5zaWduZWQgaW50IF9fcmVhZF9tb3N0bHkgdmRzbzMyX2VuYWJsZWQgPSBWRFNPX0RFRkFV
TFQ7CiAKIHN0YXRpYyBpbnQgX19pbml0IHZkc28zMl9zZXR1cChjaGFyICpzKQogewotCXZkc28z
Ml9lbmFibGVkID0gc2ltcGxlX3N0cnRvdWwocywgTlVMTCwgMCk7CiAKLQlpZiAodmRzbzMyX2Vu
YWJsZWQgPiAxKSB7CisJaWYgKGtzdHJ0b3VpbnQocywgMCwgJnZkc28zMl9lbmFibGVkKSB8fCB2
ZHNvMzJfZW5hYmxlZCA+IDEpIHsKIAkJcHJfd2FybigidmRzbzMyIHZhbHVlcyBvdGhlciB0aGFu
IDAgYW5kIDEgYXJlIG5vIGxvbmdlciBhbGxvd2VkOyB2ZHNvIGRpc2FibGVkXG4iKTsKIAkJdmRz
bzMyX2VuYWJsZWQgPSAwOwogCX0KLS0gCjIuNDcuMwoK
