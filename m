Received: from WA1P291CU003.outbound.protection.outlook.com (mail-polandcentralazolkn19011037.outbound.protection.outlook.com [52.103.53.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9051948643A
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 16:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.53.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791045154; cv=fail; b=NCcP/jKypu4WD2o0Z6LtmsYsqtGKbjWhoulf4wUMDGz14Mtb82mKsqKYOKKl7HL5ZHKYJtJlCZegf7rK7BPpkio3ETzcITA2iaDVA4t8GTm0FbPHxFGuH0zHi4ytNw3bAEY56sRC8CndwdzEfFAfTcHqLWYX8qR9OQKLrdmZz8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791045154; c=relaxed/simple;
	bh=vwkBndSDqOC41jR9ixXEkqZjTYcZHIWAmq0hH1Q64MQ=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=mOtXHHirZ1qI6dv322sTlrR4L8iD2wbKAZZn6OEdIpeHmuym2UXmF/l4kO3UyrTnnuSDwijME08GbJixSTOGKZ3PlxCMwOrEgywjRyJd+O5xE6t4JAbX8j+S3ugpsd+HkLhmIBCQFfyRaT8p5wSVc7Qzox8aTS9McyHz3Sufkzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=k+GFXsvT; arc=fail smtp.client-ip=52.103.53.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="k+GFXsvT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BZ8Kr6Ar7YEZobyrgermcOdnEUhQh8B+nDasRSGGiK8aCQusKr3Sqxf7xAQLNBjDyx3o7AZ4Pdeey6f1qSnCTMCulGvihxkVgMh3Bx2eoNjfRukQGWjeD/JgQesR63riYAj1al7MMAf4OcjGr9gs90pBjvudoFta3yO8nweT3/JjKT/zAKqEncWC/c6SZdqeF78HhB+Ucn/1D+ACP8rpn2YBjzlbdgeSE26FPMu4174yD2zD/bKR8sTsOlXVCSH51v1GRVFO7AvOKhSETpiPt7wnN4AJJzl9eBE+Qb0H/uI6UrFlK+RllcEUjhaX6HiagnXx3vENvhAdOxcL1MAJsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vwkBndSDqOC41jR9ixXEkqZjTYcZHIWAmq0hH1Q64MQ=;
 b=o/iZvKlo0ufbwEkicBKF/yHwI+a80cfs+if985Gmt2POf6/EFN+9ENmqaVwGT78htYdI9n7Ztp74E/eyYBxAm5i3TK+9iWpG9YMMv0iX1dAV7tFLMba6ywVn5WsDg79FDR6r0UKBhxSR3Cbe/hovAFmAKO7dF+Pa6tGXYPJHQmBVnb/rDlqqS2v0gzMueW+ShB/rj/UJraMxtPp+6xyd5o29mgnPSixuM/48IgDwLwFzPdxfNoxPYzabqqkzX74pBvclUkS2n81RBseXyAgx7k9Q4uq6w31rkA3UgXQtW7N+XgTOpUYQlSHnn1x5MZtODB2x8MEK0HA0QWIfvfBzVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vwkBndSDqOC41jR9ixXEkqZjTYcZHIWAmq0hH1Q64MQ=;
 b=k+GFXsvTl2X2/2xXkFWllShKtlVfmTpTVPRHNlbYweIOQGXBdkZvKF7ELqtIteaMohVzOh9K/XSgiHr/y3AIu3MTLwOAwB/bNG1p5RbNUffsEoXv/EowYRV3663s1kSs2bOvEKk2TIkxITQElaroc30s/KmOzszdbTbYEO5CVdT+7/0Rh8/IlMXnrRd6iPZe58hiTkplyMKFPVfsJ6a5hdAshJntCO2GWQPMTsdM8Nl6Kg3bM6LRd+FOafWJESRKTdLy9cLP1fgIh+7d05Yjp4tr+vpjIGjsqIitR6e7sjIx8UF+j1K8wZO9Whcr2BMsfrBQEKedtzEPzpZuT5Cmkw==
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:26::11)
 by WA1P291MB0059.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:10::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Sat, 3 Oct
 2026 16:32:21 +0000
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404]) by WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404%6]) with mapi id 15.21.0472.016; Sat, 3 Oct 2026
 16:32:21 +0000
From: =?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?= <habilerenturker@hotmail.com>
To: "luto@kernel.org" <luto@kernel.org>, "tglx@kernel.org" <tglx@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org"
	<x86@kernel.org>
CC: "hpa@zytor.com" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?=
	<habilerenturker@hotmail.com>
Subject: [PATCH 0/2] x86/vdso: Replace deprecated simple_strtoul() with
 kstrtouint()
Thread-Topic: [PATCH 0/2] x86/vdso: Replace deprecated simple_strtoul() with
 kstrtouint()
Thread-Index: AQHdU1TD//gcqG/c80qFU37dgOrMeg==
Date: Sat, 3 Oct 2026 16:32:21 +0000
Message-ID: <20261003163216.11547-1-habilerenturker@hotmail.com>
Accept-Language: tr-TR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: WA2P291MB0187:EE_|WA1P291MB0059:EE_
x-ms-office365-filtering-correlation-id: 00a82918-1271-4310-6b74-08df216be60f
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799012|38102599003|55001999006|25010399006|24021099003|4140399003|31061999003|8060799015|19110799012|8062599012|2607281247196008|53005399003|40105399003|102099032|3412199025|440099028|1710799026;
x-microsoft-antispam-message-info:
 =?utf-8?B?R1g0K2pzN3I4bnByZktQeXFHWnlOaG5OWXJkTFI1aGRaMHdaK2ZRT1Q4VnZB?=
 =?utf-8?B?akppVjlWVnN5Q3lsV25MZUtpUUJxMGhUVjBtMEJidXQzdlh6T21vOS9UL0RU?=
 =?utf-8?B?Vi85OUNUc2hmbStjcVl2bHc1cUtXRkFneFZ2UTdkWkxFTlRWOVNhWmFINnM3?=
 =?utf-8?B?VHBLM21LclJ3bG5lU2F3U0pLbnozYmtsYVAyTlBGaGhMcnRhazloVVNXV3Rp?=
 =?utf-8?B?V25hQzh3YkZzaTFMQm15RUtzVEdJeGpkRDVmdHFFSmQ3QXpLb3EwdHg3eUU2?=
 =?utf-8?B?Sko3NFNENnByRDJhNHB2bHVpWmVpVy9xR2l5eXI2b2Q5SFN2ZjhLeWp0L0NE?=
 =?utf-8?B?T3Y3RkhRcFhJWjl2bmpha2JCSE1xc29YMjIrM0VpNUJ0WXJlZDFWcWs0MXp5?=
 =?utf-8?B?TkNraGdQV1J2NEJzWHJXQXZqMUtqRit1b0x4aW5ESDJHOUtHSXdGakt2M1hv?=
 =?utf-8?B?ZWlVZTFKZCtBa1BFMFBYRlN3T095bnFDamhXUlJqL04wcUMvTW1PWWJmZmRy?=
 =?utf-8?B?QnNTSUovSmpkd1lPOGN2ZitNMktadUdtY0hwNWtBSE9nS0d0S0lkVDlONzFx?=
 =?utf-8?B?UXFrKzE5dFlUb0ozK25KRVpTSFhKeGdKajlieUFXYmpLSWdwVkQ3WnA1TjdF?=
 =?utf-8?B?Q2JaTkFxakJMd0kwRW14bUhkdkNJRTViZXEwK1c4Rk5rWGJENHdYOEpGb3NI?=
 =?utf-8?B?YnA2VDNpaXVuaWl4VXl5Q1RLZjBHZytnOFBMSC9PdDFTRmZtdExwa2JtZ01o?=
 =?utf-8?B?TTZtdWgrMWlLVndzeGlxSUwxVkFwUEI1NFpVUEttN09iSGg2RjVYK2w1Qm1K?=
 =?utf-8?B?Z0I5aEhCb21PaC93R1ExMHRJYXBleFlOMTdidGM1UHZNdDM2OG9WUmZZYUdx?=
 =?utf-8?B?QU0xczQ1UGRHVmVnWXRQUmdBc0EyQjhQM00xZ1BWcG5ZdzIvaFpyU0psNldY?=
 =?utf-8?B?dUwyQVJtVm8zaHB3SkFSaklwakVlVXdVUERIc1dDQWJnTmpyOXM1U2srSWVW?=
 =?utf-8?B?T1lNM1hLVTdiNXpHTlR5REM4NVJ1Vkt0c3JrdGx0bTEzUjFzT1Z5aFlQd21H?=
 =?utf-8?B?YVdPVmJUU3ZxRkttTTkrUUhOV1dDYnhIZXI2dGpEMmVjWjJmeXE1aTdpeThu?=
 =?utf-8?B?Wk50Q0NqaUN1QWNsRElYSElMVU92eDFqRG52YmUrNXhDc3JuZ0ZMNG1ESllq?=
 =?utf-8?B?RnVraGM1OFFpZ2oxMUl3eUZRR3FOazBFaGxLZ1k1dGFqM2EwVlhYTU52ZmI3?=
 =?utf-8?B?UnlKTkJSWlRENWFBV1hURjN6L2JjSUc4emd1MkRReWEwcTdLSUM3anJyV0pK?=
 =?utf-8?B?cDdhTnVTZDc0bzU0N2hIUDRaOGF2eDNIbXkxaHlZNEhJeGhOYkIxQmFJWmUy?=
 =?utf-8?Q?gQGM6PG6rrHJu4WacL1W9ZOLisLntCnA=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UFdETjZxT0ZGdGJxTlVXZ2hOZlZSYS9yZFpjQ0l1RTB4THhOQ2RjVFZHTWpJ?=
 =?utf-8?B?M2hqTHNoWEd2UjZ2cDVpZ2NvZGVRbU5mOGIvU0UwcktuVTZFT3BLNkJJSkV3?=
 =?utf-8?B?cVVzbHlCVk9hdllvZ0VIb1hIbHNOSEtJVXd5a2wvN3FPUGJWc2NEbFl1dFhz?=
 =?utf-8?B?OFlmMFBmVy9hWHhwbzNMbFZuS2NoZDRFSHo5OG9ya2hvRjd6eXAzSTFQT2tD?=
 =?utf-8?B?blhCeUhJSm1jUStnc1JFRzF5NGpHTUd0Z0lUTlVBZ3dFWlBZNkRrYm9ST25h?=
 =?utf-8?B?YTJYenRXYy9samQ4OXlMcFkxakN6S29MOFplQlNaTUdoODRxcVFFdlJ6c0pL?=
 =?utf-8?B?Slk1REEvekNxc0w5YjVoZy8vVDNnbkhBWlhjMUdYTkJNUVNuMml4VzQvSVJJ?=
 =?utf-8?B?RCtaZ3RYc29jMkNsT05LSjNCNFFtRWdjUGgrT1dxSkczTm5LOFl0ZUJQK2tU?=
 =?utf-8?B?eGRYZHU0TkFFTUFON0FwZEFwT2szKy9ETFk3RFMzbzYrTmQwTFhBNnZLTFdR?=
 =?utf-8?B?a2hWVDUrWENjblJweHhQSXcxTitaWXpUNldHUDR6Um1zQ1Y5RFRqUUplZ1Jj?=
 =?utf-8?B?WCtOUllDbWFQbmJaMW8xQ1lDRnVYN3UvbmVqZWp2alZScXpKYXVHWVl2TFY5?=
 =?utf-8?B?NWFYb3A2blZZaGlxQ0JmbmlLZVhhSDZGbE4wc1VWc3ZLYXBRNG11TTFBVmFY?=
 =?utf-8?B?andPTGJVaWt2Uyt5Qy84aCtpQXZTMFh1ZWh4R1RjTWpBWkUyY3A2RFRPYnFy?=
 =?utf-8?B?VjRnR09CSVA2T2gyYnZXajh3cU95QjlzSWdCMjVTTmlyY2YveDhjQ1EvdGJh?=
 =?utf-8?B?MzJQTHZhTytUSTdEL2JaVXFrSlNXZWRiN0xKS0NEL0NSTk5MckEzSll5bUN1?=
 =?utf-8?B?VVp5S3RmV0Q0dG9TbnorQUlHM1NHYVVUY3NaT0ZVNG55VWRidVozZTQ5c2s2?=
 =?utf-8?B?aTlrTDcyQS95VCtJcnF6N1dqalozUVc5cEk1T3NzOElRUFVENmdTZzlPbWRw?=
 =?utf-8?B?ZlI1TGo4WDNmSThXZkRTSFFQRHNWN3dqdDFtVDBpejRncXZPMFJxbkZrMnJU?=
 =?utf-8?B?Y0xNV0RmTzM4WkFDLzFEZVZRUkd2Y0sweHJpaXNiY1pSV2FWUkx4N0lTZjZ5?=
 =?utf-8?B?REo2aVRyRFB4WlN1OGUzZGJGMnZxb1dqemhoYUoyWlRxY3hQbTk0VVhvUERZ?=
 =?utf-8?B?WlVzRkZWR2YxZDZIREwzcXB5SUZiS2JyL1N1ZmtLOU9aWlJnU1VKUUVXTWwv?=
 =?utf-8?B?TC9UU3hjT0h4MTAzUzdJWjFXbndWUlZKajBVOXRSZzhqNkJQdWc3d3dTYlJl?=
 =?utf-8?B?RjZyY2QzSi9hNjk5Y1ZIbnJjVGNXakp2azNacjZDQjJWWFZNTWx3SFUrOEY1?=
 =?utf-8?B?Qm9PVFhUWEJJckV4eXM5aWptUjRPeTFWbEZpdXRXbzZ4dDhlU3NhUCt1eVJC?=
 =?utf-8?B?cWc5NVRESkZFRHczLzdEVkk1eVcvRUVqV0g1WHhkWTNpcmNtb2VuUjBZUkVB?=
 =?utf-8?B?Q3oyUlJGUVJRQXRlOFBHUDk0Q3p0Q2M5TWJCNlZ3c1lxTDN2Si9rckpnZ1Ra?=
 =?utf-8?B?dXpNOUdSWmdQckUrck8xazZBWHRkb3ZhREkrWWJIdVpVaGJRYWZ3U2l4bG5N?=
 =?utf-8?B?ci9CdFpWRVo5ZEMwa1RXZVhDQWJEZWErUlF6SUxTaDhXSTFpZ3ZwWE8zeUxs?=
 =?utf-8?B?WjhwdWFDZm05SEJmY2IvU0xLV29UK0Z1a21Sa0F2NUV4S0FZUHJxOUhFOUg4?=
 =?utf-8?B?d21DWGNJOXVKVG83NlVVVjVoNENQQ2JLeGIyQ2NrNXNLeFN2YkZNSjZlZUJq?=
 =?utf-8?B?WFZtc1NScjZxNnU4dURLMlRyZHZRU2xlVzFQNzBEaEdJU2pTVWE0Y2xGNTR1?=
 =?utf-8?Q?FKKNLDDmuBEd+?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D415A8A0ED2FB44BA061F603A851FEDD@POLP291.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 00a82918-1271-4310-6b74-08df216be60f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2026 16:32:21.4527
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA1P291MB0059

VGhpcyBwYXRjaCBzZXJpZXMgcmVwbGFjZXMgdGhlIGRlcHJlY2F0ZWQgc2ltcGxlX3N0cnRvdWwo
KSBmdW5jdGlvbgp3aXRoIHRoZSBzYWZlciBrc3RydG91aW50KCkgdmFyaWFudCBpbiB0aGUgeDg2
IFZEU08gc2V0dXAgY29kZS4KClRoZSBzaW1wbGVfc3RydG91bCgpIGZ1bmN0aW9uIGlzIGRlcHJl
Y2F0ZWQgYXMgaXQgc2lsZW50bHkgaWdub3JlcwpvdmVyZmxvd3MuIFByb3BlciBib3VuZHMgYW5k
IGVycm9yIGNoZWNraW5nIGFyZSBpbnRyb2R1Y2VkLgoKSGFiaWwgRXJlbiBUw7xya2VyICgyKToK
ICB4ODYvdmRzbzogUmVwbGFjZSBkZXByZWNhdGVkIHNpbXBsZV9zdHJ0b3VsKCkgd2l0aCBrc3Ry
dG91aW50KCkKICB4ODYvdmRzbzogUmVwbGFjZSBkZXByZWNhdGVkIHNpbXBsZV9zdHJ0b3VsKCkg
d2l0aCBrc3RydG91aW50KCkKCiBhcmNoL3g4Ni9lbnRyeS92ZHNvL3Zkc28zMi1zZXR1cC5jIHwg
MyArLS0KIGFyY2gveDg2L2VudHJ5L3Zkc28vdm1hLmMgICAgICAgICAgfCA2ICsrKysrLQogMiBm
aWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgotLSAKMi40Ny4z
Cgo=
