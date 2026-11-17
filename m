Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.53.87
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794918596;
	b=XJcJWyzi1poXxw8+aNjCNghdg0AI3GG4TqlaIZmyg23MGNYrKh/RDFbDm/KT8bMZApcq
	 W7njS6G9nC9VYVg9B1lPADgm25BQz4gTmHwMDq2Sy3kd68LpRYb8RedxRSeBqOpMCdUIJ
	 soU6V/qBpNRBzty4CiZMCKJ7soAkshjUofcO094jZDGFHdwaGiKmfqrSlMu/3W9g9tgqP
	 7XYgXDQLy2Ix2oQca+HHfgFgS6TKL3z0ZUfA6hycNFwFqVzoOoPGDSvlmtxLtY61Jp9dd
	 DVbOsAAVKhMRdM08fWBsW92f9A/3U7U10SsN/Bu+mjfWim2B5BXZKmUzqyWRk/Akqjg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794918596;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-slblob-mailprops:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-CrossTenant-rms-persistedconsumerorg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=uttEn4/dl4Sp/ntdQpx9q7G8OSiFFVyQorQKmKBZkRM=;
	b=wOHlL8MVjrdT10TWCGToe4iNF5L5IBp7a+bOkO2lK8DH0AuMWQPUDRxaeDH4f0HxhWLz
	 L1DdBXaxGw6NwgVNMYLwGoXxzD9S3aVFB21O0D809Bwzd15LMLV4LcdxgpwzDrNxi3sWt
	 bZOiIAkveTXqZeG+00KK5znaZaxlmNzlzY7rHBTEmv4QmBUrgReayf/rGIqU3AlpAwy1W
	 VvsfmyxzijgMKwXCvfUDR6aSKLRE3Hi7occoYzr4Ehj8gEC3dnvrfQ8Yx54OA7YzY4Oem
	 OUWMB/lsyDnw/T/y3OqR/1NuOZFaw1yh1K1WnmINbWKC/3k6rhnsyic4+fvoBAnNdhA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hotmail.com;
	spf=pass smtp.mailfrom=hotmail.com;
	dkim=pass header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b="Szs/CXt/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.53.87
Received: from WA0P291CU002.outbound.protection.outlook.com (mail-polandcentralazolkn19013087.outbound.protection.outlook.com [52.103.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AA2606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:29:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99AA2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=Szs/CXt/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cm8eq8+V59OSy/xkP3XpH2oNp7hNtWd3+O/+JW760Q6yg5iZ9poTyGr9aTJecir8RBaOImdRIk5Rc7CZNORKLasZBybkxFG6s6T0JhBL5XzWtsMOVZ0eHCGwaPH/1uaI+dqVktfvnYhq/52Ba0l42/vOztr481k/J8UJqp2EC29jo9/DPx5SvySxSVk7mXg+ZxomKHkYJM/DTPUWVeASf3vbPLdUip4Xa/TItRVExLsLQ2HvTj6tTV3BUe5YPZ8o6Y4kdSjlTj6yAZ3mMI/2M6JotZDpdIZpR9T2a0wFjmsPH2AJjhZV9/p5cm9VIVb3SxpbkbgcXnFQe14HMDbLcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uttEn4/dl4Sp/ntdQpx9q7G8OSiFFVyQorQKmKBZkRM=;
 b=SYakChqj/TD81tGklOS++FByufM9MfXnFdmnFbKokl7XNXdYycqk4VII6BloTSxnrM34Co75tQ50KsVBEYO137VBkIOY5O3EMJjy3WmUwM425H03WvSgnuojwjqWNUM0okykqfmjWfK/O6Bhbekce16akRmzvHce5p3a11MYJPMYd/AxV5EjDTrVeFcyLyU3hL0h3A5AlnY/m022ijCpEGkNv1e/6cop1B0tdJaa1OLPDWH8RwQHMef2vOjkNweFIcTrdh2z9MV+OnfBXQ54AA96amV5n4ZCmSqGhw5NT4Zg8llM+3py6aT0l1rj+WdyeaD0yQ1GrGu+HtF5Rak34g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uttEn4/dl4Sp/ntdQpx9q7G8OSiFFVyQorQKmKBZkRM=;
 b=Szs/CXt/BFhJT/jCSL85ZBD/UivBfPW4YkdzLrX2rp92mSgfT8u1F5ihsg5o/P2ygUbVNhHdzQZSYB+okrZvIra5IGRuFujsosIvHBvSwv/CF8vD2F0MgtkHoF/7V2cJyG9psiaYM3s8LX0U5KkU74ABMAsZD/mz+bTzh8aHccgI3QShVBjeEPdMzKhzHc5UZoMsDyqdDgnjNR53feq+JAPwchG57qDs6OKGLBnDHR4+OQVZE7t6LAKpw8XyVskhaenk5uDe4Bt0ZJ60O28F4gfuXSmjp6zDqIvQd6AkCKvBV80FZeRSWFJF6fmvGWW9gzhu36p0y5cZ/utSr8zMtQ==
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:26::11)
 by WA1P291MB0179.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:10::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 12:29:52 +0000
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404]) by WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404%6]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 12:29:52 +0000
From: =?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?= <habilerenturker@hotmail.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	=?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?= <habilerenturker@hotmail.com>, Daniel J
 Blueman <daniel@quora.org>, Jiri Wiesner <jwiesner@suse.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] x86/hpet: Mark boot-time variables as __ro_after_init
Thread-Topic: [PATCH] x86/hpet: Mark boot-time variables as __ro_after_init
Thread-Index: AQHddo9YVXcm+DqNU0WkNQyfDE7BTQ==
Date: Tue, 17 Nov 2026 12:29:52 +0000
Message-ID: <20261117122949.60297-1-habilerenturker@hotmail.com>
Accept-Language: tr-TR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: WA2P291MB0187:EE_|WA1P291MB0179:EE_
x-ms-office365-filtering-correlation-id: d8bd30f7-6648-4a81-d32d-08df44a67acb
x-ms-exchange-slblob-mailprops:
 qdrM8TqeFBvhuFgLLe5qs4jWk9CHdv0AHliBZFaAR887ICifwRkpSNk3ttexRwDys3lZjj/CBP2B9Ob+85jndG03VSeJ4Gh/BeifiGK1QFqYCOu9KWghWdt69D7+zOFqG+GvBN+vMScHYZ8aX0lf0RLDSHRjzJB2CkpNeoJTaBITWrSLzenlBK7wNw4Raw1lgoywdC/JS0guNFNZn8TLhZ5KR1Okru0dfA38LVvWOnsxa+rjUA9j2RG15ES14AxZFuNbl+qRW7CcIPrH9ubgum545BQI+Fv/rIelGdpLO2UjN3vYm1EVI9DRiIs3rnpKGPjmrdxV6U1UOEIu9cHg78f6LeB71/4vcDTgfytN+ENPA7pNpUTT7Cd1JLtRoor26wpUwWtrEkU79S7XBEmfj4ij6uMn4bNKHoVY8D5JrSPcIRzJlmuWmQwC89JK5kgfAdzH0/EnrqoCjNmgksGAi6E262plq3BGEDLvs4OqNqudKV/M5Hrck3xMTogk0Uiz9XecGsowVx/w1a2UBhvTthz4QNnCj1WWooFeEC8bvjFPp/zIOBBszFt2e2LLgO7vdYqoZNQeqROabI5tvXzw5ZelkOIHcS+UC61YMIbsNMt+jKAk07JmE0O5m8qmcfkY1ESXqBrqFw7d1wYbQ7UkTxD6d/I6XnZrCvb9wXpWu2yufeUYbUrmmyHncmkbq6uPYydwGnHsuDjKcnHgW07KgUDwKJkWfQvuiyJ2EE93Rgnggj3srQ2RNt7ioSeP+vkjOCfM54xn8JMyE678HURethyX9CaA64jW
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799012|51005399006|8062599012|8060799015|25010399006|41001999006|31061999003|24021099003|15080799012|38102599003|440099028|3412199025|102099032|40105399003|1710799026;
x-microsoft-antispam-message-info:
 =?utf-8?B?YnZ4QzhtYmlhVUljblBCcVFMMFNXWWV5OFgxdnh1clVSakYyNWlYT0lyODNU?=
 =?utf-8?B?clQxMkhkbUwybENMYWFIR0pzNHltbzJyaTRwM3phbUUwUkQ5bHU0VmQwaWVk?=
 =?utf-8?B?c2YxN3p3NERJZmpDeWNrS2hsTzlIQW1yY0FZc29IdVN2K3VCV0p2TWRyakt1?=
 =?utf-8?B?dDU5eGtLLzIwaG4yWGR6QkE5WDJJVXBYQko3QzF2cVBYYkJzeEdYYjFwT1Jl?=
 =?utf-8?B?SG9wc2hPaFpocTQyZkh5aVMwUXR6VkZLcXI4SHhEMW8rdVpWZStBSjh4Uk0z?=
 =?utf-8?B?K1Z2Rjc5N2RMdjN0dXJpU0NlaWUwTUlZbzk2Wi9EY3l1bEI2OUhzKzdUNjhI?=
 =?utf-8?B?S2hjZ0Q5ZklDTFZjVVRkZ3RzWnY3MG1lby90SUlGMDNieFlOTEprbElwM25G?=
 =?utf-8?B?aUtnNUMzRzlHNTgzMTk2eldteEFWVXFobEE3RnlhZG5WaU1Ob2ZINVlpVlli?=
 =?utf-8?B?L2JhVzVGbjI0c2ZXWklnUHVSV09sNHUzbW0wcEw2d3lkdEVtV0gydkEvUnJq?=
 =?utf-8?B?V2htdFlQSElnZmNsRE9DNDZVdmFBZTVlMHlRNFUzNGpnWlcwRE03cGZSdVRZ?=
 =?utf-8?B?MHZUeW9KbE5pelVRUy9rYjRlK2lCQ3ZFTTgxdHFMc2pYL3MyRWlPVnBRbzdH?=
 =?utf-8?B?K0dJS0lVZlZUSXB4cjNlTzhRbkNLVG0vTmpPcEplWVRXekFnd0FwblgvYzYv?=
 =?utf-8?B?RmlkYXNMKzgzODFvSTdzVTROSWdQUEJ5YWU2cWphNmwyeXFZQUlxaE8zK1hs?=
 =?utf-8?B?T1hPYTAxU3AxeFQwSFkrZjNvK3lKWmk2Tlh2bmcrTXRheDhvRkRzbzl1dGtQ?=
 =?utf-8?B?d2o5LzhqZnY3WEE1YUpPRDRQTGoxbFhLRmpMcm5CZGYxRFVoMU1CMENUMnRQ?=
 =?utf-8?B?YWFRUENQVlh0TVNWczhENmJBTW9INUtUanFickhvWm1LUHBLV0F1Nms3MXkw?=
 =?utf-8?B?Z3paMWY3dEVHUGRSMXFIMUZ1QmUwRmxUajZiaXRPamVaRG01RTZtbWcvTFR3?=
 =?utf-8?B?WU5KaUtXQWdoRDZyL3daOXVYaFkwTnQvbndsUWUydWlMRERZK1hPeG5rYzJt?=
 =?utf-8?B?RDk0RGJudVlyYlFQMlU1bEdvV2tEVkZkSWJSODR4THRKTWZoYW1mV0FDTHVt?=
 =?utf-8?B?M3FXSjcrRGRlditPaGlrdXNMRXJ4ZWVtcXloazRIQlVwYklXd1FIM3dLc0VB?=
 =?utf-8?B?UmYybzlZN24xM3NoV0F2UWx1WWJaS0F5MzFQY3FTZGpLVkZLNDlBYkxPbm4w?=
 =?utf-8?B?czkxRzk5YUpmOGcySTdoWnJ0b2VUU0QwNStndkRLdEVYTGhPZ2F2V3RWNXlK?=
 =?utf-8?B?WVJkQnZvNmd6dzN0dkZ4ZjRKbkkxME1WTlVlSzZsS1JKQVdyWTRvUmF2T3Br?=
 =?utf-8?Q?jFjK6qYl1KADvTrhbw5afCWuS0BR4z6s=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TlNuT09yNE1KMGtuSTVlTGRIQ0orcm1OSTVTYVEwVnMxRmI4Z3hFamRmbW9a?=
 =?utf-8?B?VjZZZXpPeWpOaVhETnhsVkwwYnY0dWRWa1M3L21RTUZmRlRQc1VkY2o5YXA1?=
 =?utf-8?B?QzJIVU13WE1wOWdLbklVcysxYkk5bkFEYllLTWpTMW9Eb0VteFd6RDFIUFBM?=
 =?utf-8?B?VWgyemErTzZtNk1oMVpTamNyQzFFaDBYVzJTYlZsaHF4b2VWNllBMjJUNVYy?=
 =?utf-8?B?TlF1V2xsQW9PenMzRjQ0N0VIK3RDS3ZQNThBY2wvUHFGUTQrcmo0NVZpMWpO?=
 =?utf-8?B?Nk1kSXRyc1ZHcXNQcDVPL2dzK05aVUp1K0dYMmJqZkZ1dVhybXlTSHpaKzYw?=
 =?utf-8?B?TisrVzNVcFNJZWJNV1dNaStpN2xQOEpTOHJzRHJDMzAwbW9OYmJpejhYN1J0?=
 =?utf-8?B?YVZKZVN6OERNVlRjbnlpY094QnM5T0JGTkp4UWJRWkJvbnlkME95NXVsUHBT?=
 =?utf-8?B?OVA4SE1lV1dzNGxnaTl2WUYrd29tUHVxVUYyS2ZSV2RITi93R1BPYTg0YVdF?=
 =?utf-8?B?ck9jWXZwS0RIbnNGT0h5b3RoL0ZnVHJTeUQwdTNzTkFZT1VGR2VhQW1lY3U2?=
 =?utf-8?B?Z0dNNTFkTFozbzByMEUyeDNnMUc1emljNnoraUtyVm9wVGp0cUhCUUZHWCtS?=
 =?utf-8?B?L3B5SUtkUldVb1pCUUlrYWpHUE1VcUtmejBIMm4xeGwwVnh2R0NsUjd0dThv?=
 =?utf-8?B?RTNRVjlJRmYvcFhqMmJHYXo2TUFBOG9KdzQrM2t1TkxncjV1TUprSXk3a2ow?=
 =?utf-8?B?NUJuZktLeURRK0F6d0hCVTNJdVZBbU85VzdOSFBKWHRhN1R6cDJ5ZXp2eE1S?=
 =?utf-8?B?bW43djlEV0xwdTFjSTZCQzV3ZUFsUGNpam81NU1QQTFHK3FHTnJycW9lc0g1?=
 =?utf-8?B?eE9lcWlEWXlyeFp6OW9NT1dmclg5aVJCajMyeGdpTHpuTmRXS2RqcDA0VVc0?=
 =?utf-8?B?Q3BTNlU3K1JQNDVDYVVXRytyZnAyZmVzRncyZDdVakYvOHRVeFdaUVNNVTRP?=
 =?utf-8?B?c2NBemQydXd3VGNUMFRFR0ZEbDJLeVB6TmlKcGxGQVRNalNyUEJwVlo2N3lC?=
 =?utf-8?B?NzBWMENuakJlVTc0VDZmM2c0Z0lGdTRGck8wRzFNd0UyS0lnSjViL3hSSHBN?=
 =?utf-8?B?U0FhZGNLazB2YWNNK2pKRGRWWXVsc0hvNXZlVzI5aE1ocEF1Q2FFcFdnUnBR?=
 =?utf-8?B?U21uZE5Sdk5IZUZJYXZHQmhWRE5lblBJQjlNNUN3SlIyWFlXQ0dvSTlwRlBi?=
 =?utf-8?B?bXAzQVI5Q2l0TXA1QjJDM3FTM2VrbnJQeEp6WnBlcWVCMTVWVzg3cEFmOU5r?=
 =?utf-8?B?WjZSNy9zeDdVeWxiR014ZEVVMlMzZXVBZ1NpUUpJT1JkOXNtb2ZNd1A3OVlU?=
 =?utf-8?B?NW9DRXhVZU5pRkVkd240U2RZbGFZbGx5SlYxL1V6NkVWMFU1aUg5dkpVenJY?=
 =?utf-8?B?M2I5Ym44R2Y5OEFZZzZsZHpHWEF1QndLNHZKRmFlTVNEMVJhdjIzNVc1d0tr?=
 =?utf-8?B?cGdwVXRHVE9yZEpDdVZJVUlQWk9BSWxRc3NiTVU0L3l3Q1VEYkxBWlZOeGpC?=
 =?utf-8?B?aTkySEVaNTVhTTZ3VzRHcUk4V0xvclMwUWsyQVJDb25mQ3dsM2luV2NNYUth?=
 =?utf-8?B?dXYrRTNUOHhMYW1QM2pKZklhOW1sdUQvcGViUTZVTVdLOVBxZWVmWkhCemxw?=
 =?utf-8?B?UVUzRTFFUEkxRUVjcXhSVGp4UndxdmkxVWJiaGNDQkNQM0FEK2hCdGQ2OE85?=
 =?utf-8?B?V0dUL2NnOThaNDU0TnVZSWRKWW9sQ3VXVlZ1aGJFSUh4Wkx1WWNpWDRZL3FX?=
 =?utf-8?B?WDRqTm1WcE1IQmlYVm5Bb3U1R3BaMXh2WlVRajhrZGNHdDFScnpNcUtqL1RQ?=
 =?utf-8?Q?7vV1rHGWqQ4Us?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BB25A78F9715914C96C3312D014FB5DF@POLP291.PROD.OUTLOOK.COM>
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
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-2112e.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d8bd30f7-6648-4a81-d32d-08df44a67acb
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 12:29:52.5007
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA1P291MB0179

VGhlIGZvbGxvd2luZyB2YXJpYWJsZXMgYXJlIG9ubHkgd3JpdHRlbiBkdXJpbmcgZWFybHkgYm9v
dCBvciBfX2luaXQKZnVuY3Rpb25zIGFuZCByZW1haW4gcmVhZC1vbmx5IGF0IHJ1bnRpbWU6Cgog
LSBocGV0X2Jsb2NraWQ6IHNldCBvbmNlIGluIGFjcGlfcGFyc2VfaHBldCgpIChfX2luaXQpCiAt
IGhwZXRfbXNpX2Rpc2FibGU6IHNldCBvbmx5IGluIGZvcmNlX2Rpc2FibGVfaHBldF9tc2koKSAo
ZWFybHkgUENJIHF1aXJrKQogLSBocGV0X2ZyZXE6IHNldCBvbmx5IGluIGhwZXRfZW5hYmxlKCkg
KF9faW5pdCkKIC0gYm9vdF9ocGV0X2Rpc2FibGU6IHNldCBvbmx5IGluIGZvcmNlX2Rpc2FibGVf
aHBldCgpIChlYXJseS1xdWlya3MuYykKICAgYW5kIF9faW5pdCBzZXR1cCBmdW5jdGlvbnMgKGhw
ZXRfc2V0dXAoKSwgZGlzYWJsZV9ocGV0KCksCiAgIGhwZXRfaXNfcGMxMF9kYW1hZ2VkKCkpCgpN
YXJrIHRoZW0gYXMgX19yb19hZnRlcl9pbml0IHRvIHByb3RlY3QgdGhlbSBhZ2FpbnN0IHVuaW50
ZW5kZWQgcnVudGltZQptb2RpZmljYXRpb25zLgoKU2lnbmVkLW9mZi1ieTogSGFiaWwgRXJlbiBU
w7xya2VyIDxoYWJpbGVyZW50dXJrZXJAaG90bWFpbC5jb20+Ci0tLQogYXJjaC94ODYva2VybmVs
L2hwZXQuYyB8IDggKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva2VybmVsL2hwZXQuYyBiL2FyY2gv
eDg2L2tlcm5lbC9ocGV0LmMKaW5kZXggMGVkZjBmZTBhYzJiLi42ODE2NjBiOGU1NDggMTAwNjQ0
Ci0tLSBhL2FyY2gveDg2L2tlcm5lbC9ocGV0LmMKKysrIGIvYXJjaC94ODYva2VybmVsL2hwZXQu
YwpAQCAtNTEsOCArNTEsOCBAQCBzdHJ1Y3QgaHBldF9iYXNlIHsKICAqIEhQRVQgYWRkcmVzcyBp
cyBzZXQgaW4gYWNwaS9ib290LmMsIHdoZW4gYW4gQUNQSSBlbnRyeSBleGlzdHMKICAqLwogdW5z
aWduZWQgbG9uZwkJCQlocGV0X2FkZHJlc3M7Ci11OAkJCQkJaHBldF9ibG9ja2lkOyAvKiBPUyB0
aW1lciBibG9jayBudW0gKi8KLWJvb2wJCQkJCWhwZXRfbXNpX2Rpc2FibGU7Cit1OAkJCQkJaHBl
dF9ibG9ja2lkIF9fcm9fYWZ0ZXJfaW5pdDsgLyogT1MgdGltZXIgYmxvY2sgbnVtICovCitib29s
CQkJCQlocGV0X21zaV9kaXNhYmxlIF9fcm9fYWZ0ZXJfaW5pdDsKIAogI2lmIGRlZmluZWQoQ09O
RklHX1g4Nl9MT0NBTF9BUElDKSAmJiBkZWZpbmVkKENPTkZJR19HRU5FUklDX01TSV9JUlEpCiBz
dGF0aWMgREVGSU5FX1BFUl9DUFUoc3RydWN0IGhwZXRfY2hhbm5lbCAqLCBjcHVfaHBldF9jaGFu
bmVsKTsKQEAgLTY0LDkgKzY0LDkgQEAgc3RhdGljIHZvaWQgX19pb21lbQkJCSpocGV0X3ZpcnRf
YWRkcmVzczsKIHN0YXRpYyBzdHJ1Y3QgaHBldF9iYXNlCQkJaHBldF9iYXNlOwogCiBzdGF0aWMg
Ym9vbAkJCQlocGV0X2xlZ2FjeV9pbnRfZW5hYmxlZDsKLXN0YXRpYyB1bnNpZ25lZCBsb25nCQkJ
aHBldF9mcmVxOworc3RhdGljIHVuc2lnbmVkIGxvbmcJCQlocGV0X2ZyZXEgX19yb19hZnRlcl9p
bml0OwogCi1ib29sCQkJCQlib290X2hwZXRfZGlzYWJsZTsKK2Jvb2wJCQkJCWJvb3RfaHBldF9k
aXNhYmxlIF9fcm9fYWZ0ZXJfaW5pdDsKIGJvb2wJCQkJCWhwZXRfZm9yY2VfdXNlcjsKIHN0YXRp
YyBib29sCQkJCWhwZXRfdmVyYm9zZTsKIAotLSAKMi40Ny4zCgo=
