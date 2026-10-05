Received: from WA2P291CU004.outbound.protection.outlook.com (mail-polandcentralazolkn19012063.outbound.protection.outlook.com [52.103.53.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662E54BE451
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 16:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.53.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791218023; cv=fail; b=Uc/ghhMuy7ivG6Uz5M3/IdXlIEekwdwfV3zqA8ext8swJyIb0B6Vf1/gwoivUJ2HozNqq7sEW/qVAtho9KpX3fA2OwyiWgMOHFTUUUaxTs5ousT/0S6950LCVyeHftpe6NS0KLEV4HAcWJN1tUmDd1FQQULNVu5lxQKnoL7r11Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791218023; c=relaxed/simple;
	bh=hMUA/zqE0RI6WZU++iVE+HNI9x6Mh1tafyMuobE7Mzw=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=V0cWfDEL19WIeTXlk/t4tP3EVhSaWGHJPEkw4rq5QPEbRskaLcDSvB3MKWRmScZWJTe9ckRBOgi4nGYO/o92fxSdM8cdL/qW8sg3qoK8GWexBqERu+Kar6Ic35gRvpe860b7m+VkJpV/eJvJJhaTVT3w8x9W+rwOC0Y2s3serN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=oPt+xaEU; arc=fail smtp.client-ip=52.103.53.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="oPt+xaEU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kCkpEhy7cVlfFRykEofC0fmMYzSvzSkFvNW6HHAeTzY+AMjLcvKUWVtZlj+MYK1AusOZfbUhVFi1gP1rgH8qk2kQZO5BssbWiST59NUIQBYBBP9+SbWxRXwapWY5XiDXllFbcwjApXLwsp7bt2dFnbRn+9Djp958izFxTzvNM3pY+Rj4EgAvvCSKS/Tex17tR3KBr6FMqyM+nHLC0+7PD2W+kSiXpk1+EJSGCnk+9HtG+NLsK5GnnQtLvc9DaDoqReycsFLR+Qcrh2hY2AhstJW84WucR4fOTgaGTQlfAqbzelFPRl5YNXzXZhTK433XMSReFlQPqnGGe15q38++EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hMUA/zqE0RI6WZU++iVE+HNI9x6Mh1tafyMuobE7Mzw=;
 b=UXueyjCe2BBNO2E5IGtH7q2HPRFn2n1D1uTlYahxCDWe/LFDmv+Q2S60ORZgKBuBY0BUjuIPgyZ2SrO9MJOqcP+LXC2H+Jzw1RidI/O5K8/sTrq/VnvBQBhrn2D+sYeHkGAD0Kua4GqKO5K/0OsMjTa+74BcQ2Wxp9VjLSTQiCAEGNTYNaAv96oYUhq0qJD4ANjrZMvtqfKYiMob1IylvpYXrgKUFyq55agcV+Yf9TqjO5ACQcKKtwaSIQHFPlgFKAV98giX85DocNFj0R0RdyyYXBZUYDoqBtkN55g+kXAP4k+zGQtMcJgaVbG31vVbuE0kcW/NyT6yblghoflBFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hMUA/zqE0RI6WZU++iVE+HNI9x6Mh1tafyMuobE7Mzw=;
 b=oPt+xaEUNLOyhJ2v29jFioYZfOA1he4zILGWqKVQeXhLhFiquNKetVfi0HWdWSKfdaxl5k2I6+sB8lEmlF3Q2Fg1H5t9h77+7ggjmSfz1iXH34eq4DtvbQLj62rgeHFNcRgYAC30DbOex5728PcXzBVVSoHdD+YFNfvEA7f7PJzC5oOIpIsfOObL7IMkGBiWjtgyUinb/LckpMrRdqLAoysPLeCUleumOp0LFgl27zZs7Tfo2OXWlteCdJo1r+Pf+XKgw4Xa+ueuCDFi1jMloAsdDrH49oRgs01LahNUxg9puKsbf5OIMn5rL/Is0Znr/53glsBhDFURsSMtqbdMVA==
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:26::11)
 by WA0P291MB101427.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:43::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 16:33:38 +0000
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404]) by WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404%6]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 16:33:38 +0000
From: =?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?= <habilerenturker@hotmail.com>
To: "luto@kernel.org" <luto@kernel.org>, "tglx@kernel.org" <tglx@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org"
	<x86@kernel.org>
CC: "hpa@zytor.com" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?=
	<habilerenturker@hotmail.com>
Subject: [PATCH v2 0/2] x86/vdso: Replace deprecated simple_strtoul() with
 kstrtouint()
Thread-Topic: [PATCH v2 0/2] x86/vdso: Replace deprecated simple_strtoul()
 with kstrtouint()
Thread-Index: AQHdVOdGEFME1CmCYEiR4tyQgN+odg==
Date: Mon, 5 Oct 2026 16:33:37 +0000
Message-ID: <20261005163335.6716-1-habilerenturker@hotmail.com>
Accept-Language: tr-TR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: WA2P291MB0187:EE_|WA0P291MB101427:EE_
x-ms-office365-filtering-correlation-id: 565663d5-a1f5-4025-5fcf-08df22fe6889
x-microsoft-antispam:
 BCL:0;ARA:14566002|55001999006|8060799015|19110799012|8062599012|31061999003|24021099003|38102599003|15080799012|25010399006|51005399006|40105399003|2607281247196008|102099032|3412199025|440099028|1710799026;
x-microsoft-antispam-message-info:
 =?utf-8?B?djNzTHVRODNvRFFFenpyNnFWVkpxVC9xLzZpby81N0NFN1hpbXhDQlNSSGgy?=
 =?utf-8?B?TytUYjFPZTYxdDBKVEdMbDFJeDE2U1czMUdmVEl3YmE0NURmRkZtc1kzVjNm?=
 =?utf-8?B?YjA3RlNwZE5UTEoyTlpKRzdTa3k2U0dWODNCZDZvTi9TMVFPU3Z2RjQrN1VO?=
 =?utf-8?B?RWxkYVVmSmU3RjZzbTJMNkxDbWltcDBUTFVYbnlSYUw4OGRGaWdsS3AweVBE?=
 =?utf-8?B?NTIwcFF3TE9ZVi9KVlNXbllKVFg5cTJIaU1SbUNsU0lrNmNpTHEzQXc5ME5h?=
 =?utf-8?B?RG10eEZBSTIzblJUcUZISXg5a05hYU5JckEvNDJ0VjZWYjBYb041VUN4c2dh?=
 =?utf-8?B?YlllL21CY2pQZ2R4MmJlZmExTWdIYnBuQUl1RXBvdklYVUU1QUlrcGRvazJF?=
 =?utf-8?B?STNvclRZNWVNazloL01kdjE0dDJEZFpnRlRGeFFXWG54ZWp6NklKK2l5dUlB?=
 =?utf-8?B?U1ptckVxbkJNbHRTN3pPUUE5QVl5OGJXc3IvbmVVYnRLQ0FZRDEwYy9NSlAx?=
 =?utf-8?B?cUZGYjZHRTY5WDRmcnVrK3lOTGtkeDAzcDcxOUFCZVViYzladDQ1NGNsTGg3?=
 =?utf-8?B?UHQ2NmM4aUVKMHZUdHR4VlZLTzBzWklzTWVlM3hvU0U3bk8xTmNEQWZqMjdh?=
 =?utf-8?B?bEVEN1k1L2VadzVyZXBLMktlK3VTZ1p1MUNFYk1ISTVLNE9HcTdWRjkrWGN0?=
 =?utf-8?B?WjEzamUydWhVOW1aaXB0WGVVTnlYRjBLcG40UFRLSkVtb2NqRVhlTSttSldo?=
 =?utf-8?B?bTJiZ0k0NlpUb2R0dTU4UnpRVUNqbzFNQU9RbGc0SkpoeHdpWmpuVlJHQmlE?=
 =?utf-8?B?blhndGs1UXIzYTVXemo3MVpCZDlObTJzSGZuOXRhUU9NdlNnbnJzOE0rNXlH?=
 =?utf-8?B?NTBheXFxaFFUWXNoM25TS2FyNzI5akwxZDlaS1BwdU9BQkNVWGZVSldMckNG?=
 =?utf-8?B?UDlaRXZWZ09EemtvNkpUaG5DUmIvVFBIOW1sU2dxS3M1bGp3QkpOQ2VzNHhu?=
 =?utf-8?B?d2VZdC9odTYyWVNNTjQ5MXlScjJISVdyNHZzV3o2NGRxN3RxNFk4Vk92NlEv?=
 =?utf-8?B?S0FkbXRjSThTVFhPOFVGbUZSQW0wTm9ENks0L1Y1REhVaDE5RDkwQnpuekdv?=
 =?utf-8?B?WEJudmVjcitMUnVYNWdFSXRuQnk3cGNwekxjazV6aTRXZ05nY0lpTUJwMHJR?=
 =?utf-8?B?aXQwWitENU9ObWhtVDlDeTRjSVQvZm1aQzJJN0wzRElPNHFYamZnYXNuVFQy?=
 =?utf-8?B?djcxRXZwRUQzb2ZxbS82WHF2R0FjZmk2dW9qTm1tR3krQTRnWEx5ZHhvZFlj?=
 =?utf-8?B?ZVhiaUJTUDRURHhublJZaUZmRnFmUjZJeFYxeEEwU2psSmd2d2tzWllDRmVO?=
 =?utf-8?B?LzY0NitFbWdnUmc9PQ==?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aVQ1blBFbDdWMHpqU2ZJZ3MzYlEzQkI5a3lkRjNZZlRaUy9DTzB4RytrR0J0?=
 =?utf-8?B?d0JUTlRtVHJGVjRVK0paa0dyZm9JOHd5UXJ5YXpvYzllSm9RemxETGwzQXpj?=
 =?utf-8?B?QUFKc2J0NW1yQTM2YnZtb2VFNEFNcTFkVU1lZEVOR3hVd0dTUGtkWVR3Rkty?=
 =?utf-8?B?cm9NakhteUJnRWV0d09mYmZQeTJuM25kYjVjVWMrWUtndEN0TjRRT2RZaHV5?=
 =?utf-8?B?a3BYdHljR0x1WXB1Y3lRb0d5VTdudEIybW1vWnhtdVo2VEhsQmtGYzkzaVVi?=
 =?utf-8?B?TlF5YVZGNUNISi9JSERCbnF3aGc3UlZBUEVNMmk4NmFPb05QWWhGK2R1WXRi?=
 =?utf-8?B?b1U5aEZhVjBmMyt1eUcwVjZoYU1BekNibnVmS1NYVnRaL2RtU2QrM0NYS0lG?=
 =?utf-8?B?UUdzUzlEeFkvWnlYbDRmS25mWnNmRUduQ3V1K1ROVXd3VkZ2ZEpQVkNEcWJY?=
 =?utf-8?B?ZGNGTWhHcy9zcEFQUGVJV2QwbFFQR2Y4VDdNOWszUWgwYUJaMlZ6VGpRYm9R?=
 =?utf-8?B?dkJDZlFIVnhWZHpvclVhbGhPSXFtL1N1SlN2N1lpbmNEYzdpWUMwS3VzSmF5?=
 =?utf-8?B?clNQQWRuZXFlVVRjYXZkYU5qeUtDQmJGbEozNDNLcnhodjR6cEhPOTRHWnFM?=
 =?utf-8?B?akRnK3pOWi9TQmdVZmVMbVhMTlczQ0Z6bmxWOWRxczhXU0t2cVhGaHNBcmxC?=
 =?utf-8?B?eFBjUkszS0dGL1pHYTl6cGhEL3pvb0IvL0hia0ZXTTZrdE5SanNsZG5MMzR6?=
 =?utf-8?B?Kzh2blAvSGlOR0Y2eVZtWVJETzZleUp4dFFQdzZGbkpGYkx0V0EwMGlhN1Z1?=
 =?utf-8?B?TGJ1aWVvUTRiWC9jTXp4VG5wSWRUWFVqOHBCZEVnNHFoNGpyVzNkZFNNK0hX?=
 =?utf-8?B?UlVOaVllbld0N2hhZ0lUQmxyUHhtME5nNmk3YzgxeXZ6MDFIS2hkOVpIWDFl?=
 =?utf-8?B?OUF0ZW5GN0FxaGZjdzF2MWg2ZC9uM1gvS0JaR3ZFWGhPRzdJZUZBSzgyaXVK?=
 =?utf-8?B?QmdlZGcyLzZKanpkSTFmK3FabEZlRzFaWVNXMTZRamRoTFBKdlBFQkN3d2xo?=
 =?utf-8?B?T2g2YWNWTFQwVU1zRUYyRU9zUW9aWGZOdzNPQUJkeUgxcCtuZ01yK1ExNlFC?=
 =?utf-8?B?Z05rVHhQSEJENUNmQ3FRODFKcks3c2p1NUFWYUZYSkZZQVlpUHY5eHVUQVEw?=
 =?utf-8?B?Wk5tbXV2VUgrbmJGNVU3aEhBRFNVY0pSei9sTGlwUDZNdDVTNTRiRUJOWUdl?=
 =?utf-8?B?WGVqdWJsVG4xQkVJSVFFZlBPM3lOaE40ckJ3SU80czdMZEM1QmJxMmJRTmJT?=
 =?utf-8?B?cTlDR0hZSGVNcENJUVY3a1FjeVZOaGJwb3lsMzlRWUhITytsaWR0MUJ6WUZZ?=
 =?utf-8?B?ckxRUG00S2t0cjdVUjBzWDBnUUd4WjNyNTJJT2xPc2RSQkg1ci9pUXJydEph?=
 =?utf-8?B?cTRiWGkwcWRyKzkxeTR2U2VBdVhiUUkzTTllQ2JXZW5FUk00RmlzaEhVOWs4?=
 =?utf-8?B?bUtQZ1YzN2R6L1JUK3ZKRG5pUmViRWM1dFMvejVGcElVTys3SityMldQY3lr?=
 =?utf-8?B?N3BqekRSTTFRWTRQaUJxV0NZdVBIaVBoMUdDMURHUDgycnZBbk1Pd3Y2ZFZ1?=
 =?utf-8?B?KzBKeXVTWFNuZnl6RUNoUmJKbkJyUlEvbWpKc2o3YWNLMlEzYllMWUpQS1cz?=
 =?utf-8?B?UzRNdU0wTGFQVFNSNHUxZ1o3cUU3R2JHTGdJdSs0WW9EZnd4eE9wUDgzQmNV?=
 =?utf-8?B?WDhPalA2NkZZSGx0Q2h4NWtwZzlYV1U3UXVKWTdYaDBseDVDcDZoVkt3d3JU?=
 =?utf-8?B?bUM1R3RhR3Y2WTR3cDBuOWV1LzFkanRlY0l4and0Y0FDWFpvbEVJMHZsaUZ0?=
 =?utf-8?Q?Vcv0ILa1eMPp+?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <80CD141B459CE24DBFB996701265D91C@POLP291.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 565663d5-a1f5-4025-5fcf-08df22fe6889
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2026 16:33:37.9992
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA0P291MB101427

VGhpcyBwYXRjaCBzZXJpZXMgcmVwbGFjZXMgdGhlIGRlcHJlY2F0ZWQgc2ltcGxlX3N0cnRvdWwo
KSBmdW5jdGlvbgp3aXRoIHRoZSBzYWZlciBrc3RydG91aW50KCkgdmFyaWFudCBpbiB0aGUgeDg2
IHZkc28gc2V0dXAgY29kZS4KClRoZSBzaW1wbGVfc3RydG91bCgpIGZ1bmN0aW9uIGlzIGRlcHJl
Y2F0ZWQgYXMgaXQgc2lsZW50bHkgaWdub3JlcwpvdmVyZmxvd3MuIFByb3BlciBib3VuZHMgYW5k
IGxpbmVlciBlcnJvciBjaGVja2luZyBhcmUgaW50cm9kdWNlZC4KCkNoYW5nZXMgaW4gdjI6Ci0g
Rml4ZWQgdGhlIGxvZ2ljYWwgc2hvcnQtY2lyY3VpdCBvcGVyYXRvciBidWcgaW4gcGFyc2luZyBl
cnJvciBwYXRocwogIHdoZXJlIGludmFsaWQgaW5wdXRzIGNvdWxkIHRyaWdnZXIgZGVjZXB0aXZl
IHdhcm5pbmcgbG9ncy4KLSBSZWZhY3RvcmVkIGVycm9yIGhhbmRsaW5nIGludG8gYSBsaW5lYXIg
ZmxvdyB3aXRoIHVubGlrZWx5KCkgbWFjcm9zCiAgdG8gYXZvaWQgYnJhbmNoIG1pc3ByZWRpY3Rp
b24uCiAKSGFiaWwgRXJlbiBUw7xya2VyICgyKToKICB4ODYvdmRzbzogUmVwbGFjZSBkZXByZWNh
dGVkIHNpbXBsZV9zdHJ0b3VsKCkgd2l0aCBrc3RydG91aW50KCkKICB4ODYvdmRzbzogUmVwbGFj
ZSBkZXByZWNhdGVkIHNpbXBsZV9zdHJ0b3VsKCkgd2l0aCBrc3RydG91aW50KCkgaW4KICAgIHZk
c29fc2V0dXAKCiBhcmNoL3g4Ni9lbnRyeS92ZHNvL3Zkc28zMi1zZXR1cC5jIHwgMTEgKysrKysr
KysrLS0KIGFyY2gveDg2L2VudHJ5L3Zkc28vdm1hLmMgICAgICAgICAgfCAxNSArKysrKysrKysr
KysrKy0KIDIgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
Ci0tIAoyLjQ3LjMKCg==
