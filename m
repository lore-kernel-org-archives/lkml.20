Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2823442901F;
	Mon, 14 Sep 2026 10:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380815; cv=fail; b=WemPvuNV6Izygxf3Mgt3jwdaItZJpcVUNb7oNm9Qr5EGKtOaOOcgEtzhgHEmD6eZTb4bztj0k9dWcYNkKD704WYXQXcQJhodKsrZM3caCc28Ps7K8NPPkL4n8bvLEiMpTkNvLY1h0a+2CoW6Xr1/uXyNv/jjV+t/OQrvK9f3Ueo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380815; c=relaxed/simple;
	bh=GcpF2/Ccs1xTKymsmsazesti3bxTCaW09XZKggu+UcQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=kKlMZGLi04ew7LP1J/0VN6uv7Pu5mIJxXZLxAavUVdnE395sRQDQ0AyWrAaj3+xciL9f2sTU+nAn5lMl7feRLWrd5vfEoJvsMfTG3keZlnIFF+rUjGLqwXR6RhtoQiRWik/GLgnMeSLkLDPtL9Y5znOnlIiHRuqdeb3Ksg8EFeo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=uWZRaN3s; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="uWZRaN3s"
Received: from pps.filterd (m0516786.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9mAYQ093425;
	Mon, 14 Sep 2026 06:12:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=Odns9
	5JyU8JXD23mqUFgJZZrRJtvO1ackhbbkm5pss4=; b=uWZRaN3sUAXZhax4/32WH
	tlvGfrX6c2jnmDIYewmjLvtx+2lXC2cSbl99xrmhOAKL9LL5DOAvghcInTLBeAo7
	6jCbygQIFrTJsM8Z4Y3Q57Ca0l39ERb7C6t2Dun+XP15XOJEbCRzagzOb4zMLgrv
	TURZ2xXEKXBqhFXk9Cj1U/i8z2UvM6srSepqUKEm69RWQzkZCYV4xyoNaRyNKcMH
	Ic5CSJQahIO+VPS+YYKfrYC9ReFiVGo/N7pBbU/X49fHYdELerwC1W6GBkEvkNSK
	hza0dqHyedoCsDiEQIfSozAuA1ayqNIEi+6vG+n7KvPmnjG0oxyzkJ0w2cP2TgNq
	Q==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013066.outbound.protection.outlook.com [40.107.201.66])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gnqbfbdr9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 06:12:56 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rbdVizLXBcD11sm1Kle+cq2p6Q5jNFkysNVwPRRy2mpgdkOhXWWAMB0cfioCc/VBDN3DFH030xKUiLnB97DE8hxb6HtKLGCUNbMXXWMLorvqBKaiav221XAxcpfboyBWSJy4ye4zG9lyZILaSpTQFwYTRvtt/BaWpvu1gLmk5awHZ9EM6RKGUR8kPB+iy2ZwN46koWWXSzxnrI1oLO6oHrAD987jdgJ2g7TPwOV8+3WorYPIltYjOzL/y0b7wX3n8OBG8DXWOEm400370vPJWYWlFjbGEWM+pDkOqyV6RIJ78Zus4Cv4K026/QOOm4Z9lxEKukeAYHiW5wSo1CZL3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Odns95JyU8JXD23mqUFgJZZrRJtvO1ackhbbkm5pss4=;
 b=lwhUfRxZzJ7NbRdGvg+Wr+tS+0KBbdJ+easwcJt7+/E8IBfRFv9lWFHauUHhBZavkCN+RAbCkD0Bn2Ok/8g+wJmjs84nuuh04Luk/rldcVM8yXUsmIZknTDRYFWQj/YM/5TYwRVRS0OIkKay7uc5aKJaAq9vGGCa9c9pVwnVamJKeiKKB3bdWTQJAGrAscUKsnp1DS2/AQUshwvkVNYuLa3sumG6IMLvaKYvbPERldxNmRwhb6hdJ8DS+K3+aejuvPS7mIETYMqqFjaT/yRcrd+SPB1Lhl2MOqWjWKxAyRXRrSR6R7t2N1WQdBZfXKewxKHp+8BofOOwUBhXx6zrmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by DS7PR03MB8243.namprd03.prod.outlook.com (2603:10b6:8:262::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 10:12:55 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%3]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 10:12:55 +0000
From: =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>
Date: Mon, 14 Sep 2026 12:12:37 +0200
Subject: [PATCH 3/3] ASoC: adau1977-i2c: add OF match table for I2C
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260914-asoc-adau1977-fixes-v1-3-aa2f0cabd728@analog.com>
References: <20260914-asoc-adau1977-fixes-v1-0-aa2f0cabd728@analog.com>
In-Reply-To: <20260914-asoc-adau1977-fixes-v1-0-aa2f0cabd728@analog.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MM0P280CA0012.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:a::31) To BN9PR03MB5977.namprd03.prod.outlook.com
 (2603:10b6:408:132::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|DS7PR03MB8243:EE_
X-MS-Office365-Filtering-Correlation-Id: 240330d1-3a7a-45db-124d-08df1248be8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	1EMXXS3R82XhY0oNsfasiYElZVHJog8KpevxkjEa2Bg0c7mgODnSonPcH61HgJrsHsMhABhlTDNyYT2aqUj6LJgVu8ckYl6XuyV02KHCTu1kbDVtNhm4m+SYPItq4Jf4cb3N8olVj1g+8wKIF11gIQbHmXYu/E01ZU4DymxxctDag2I6r/jtaf8Z/Npr1Oew9Eg+NahfE6htVNKa7p3ZLU2tRqIU5WS5sFvrBjDEFBIalCGUq++muKMsRCQz0dsFFA+cX+8sivWU8dWza9z5p6XynurPmGf+IBli8X9NtyqTD+/C2lWH7vbSw9pGgA5GRoufabKQmv50ILCfJ/AH569bt57rWNs2RNOtUXjsU92g6uVhs0IKBMIxIphffGGFYsoCSJdroGxzTgsJyp17frCKDOwbG1O/llHOPcQzxxSRMroTcyKq6cohP3La8iSEjWFgUeXq1QmB93viZOrwXmij7BrpEPonewjeh4C/vXKp9Hc1WpuA7oy4sM63o54wcbIf00lKLtrYnyzFgpEc1aDO6vEG1Cq/iL2/SMDn2OsqcBNuNOr89czyEv33tg+msbLLGM9P1pFeHRaO4EvB67txi5HQ0bO4VKctWYIF7cWK/L+oalfRBo0JdjnFxV0SEjSUM4lPOXWyBKfxDPJbVMO3kmKJ8Gs9V0thtf0qsoU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnRLSW9tdnJmcEJuRHZwWnZZRUU0SWt2bjZNaGQzc0F4cUhobGdTUjArVE9P?=
 =?utf-8?B?dUZoV1dWUUVQZVh2a2Z0ZWdUZ3lmZm5tOVZiR3NIQ0ExNkRDcWpvNmswRG9p?=
 =?utf-8?B?QnN4eEJ1ZFFEdXphUTBPWGJDbVBEQkZVS1dNbEZmRkpBZjRFQnRQMytONk55?=
 =?utf-8?B?WHFXYUpZZEE5bEk1cHBKdGFHaWNsbVUzQlJaaDdSYXNiTWUraTBFMHF2cm4y?=
 =?utf-8?B?QkZ4S3JiVGZVQjdPR0VhVkp0OCtYek5UNzJnODRQYUZ4T0M2OEFjQXFSQnd1?=
 =?utf-8?B?a292SGtoZFZuNmc1a21UQ3RJa0p3NGRhdlNXZjJOdWRQVVVPNkpLVTFsdGpQ?=
 =?utf-8?B?Y3dtN1FXWlF3MUhzWXVSYk9iNkk3ZDRUUHMvRHVzRnpMUGJsVlFrcm1zaFNL?=
 =?utf-8?B?RzRPclVMRGsxNjN5OENTaFBkcWJQTVd2NE5KUzZIWFF2VE9QN0o3eDNqQlR0?=
 =?utf-8?B?UVlUeklKR2hyZ09kajg1dVJiSVZxSERtUG9Fc1huVEhMYVZXKzk3c29uZHc3?=
 =?utf-8?B?Z1NxMWhzVFVzTGVPVTlGd1llUXYzMlR2MkV6a2ZwYk1TWWY1bzMzMFJMa21k?=
 =?utf-8?B?QnFNYVRxWE5laDA5M0pMeFIyV3RUQ0xCUmZwMDFpWlQ2N3YyVklsdFhNbllM?=
 =?utf-8?B?VjhRVWtTZ3VxN2dhV2FOZ2ZXTmExYk8xKytwUlM1N1BYazhhWmpxMHhRWStH?=
 =?utf-8?B?QVo3RzFpWVVhaUt0K2pFM0VhTWFtTlBjc2ltaDk4OFBMbHR1SG9tNTBjbGwr?=
 =?utf-8?B?MU9BZnJFMlNuT1lUcG0rWklreW9xTC8xRHlMT2xjMWhEc2UvTW1NYThPUnRv?=
 =?utf-8?B?Ym8xWmdIbmFmQjB3WFZvWDhnK2QyUVMxc1g0NmR6Z29uUSs4Vm1vT21zM1Qv?=
 =?utf-8?B?SzdIUkVWSDJkay9veXI3aHAvbXpSRkljb1IzNEJkZWpVeE1YQTNmdWp6SVNP?=
 =?utf-8?B?RkNNZ3lBUjgvUndhM1UybVlwVlBNYU4xQ1pUVDNFVXlSWnhQZEY2d1hQY1c4?=
 =?utf-8?B?NzBzMVlIdDJzVjJnemdJWmg4WFNuT3o0Szd4bGtNL1FHOTFtbGx1aU5PQ0Ji?=
 =?utf-8?B?SDFNNDNSQllqenZDaGxxa04vNzZkUk51Z1Z4cmdlVHNESlcrWHJmTXQwRmRP?=
 =?utf-8?B?V3hoakdsSW9MaUs2azlqUDNlM2w2UVV5UTlQYXpKVUVCcmRNZm5xdXErR1dF?=
 =?utf-8?B?VUlrOVR2WmxLemFyYUZ6cER0YUlkb1o3cC8xVlN0WU9IS2N3dmw3dktRNEtR?=
 =?utf-8?B?WEZmYTRRT3BybWw1aE9QY1hDaFVBZmpWclV0aTVJUWNGMHRqdkRRZ0pnelMv?=
 =?utf-8?B?YmJNaXd4VVp3ZGRBWlFtTGxNMzZOblJGTDFUeVZJMFJrK2tSVTBVK2tyNHhZ?=
 =?utf-8?B?NVQrbXl2WjNycWU5SnBCZXlIaFBhN0M5Q1FDcjg3dnBBRTNVQTZlNUdBd0M4?=
 =?utf-8?B?bVJlNDdHdkZWdU04WmNRTGE2aDQ1RDBBbFNHMlBFaUJ0RDE3ZnE2NE5TV3N6?=
 =?utf-8?B?QXRhT2xjUTEvMVRnZVgyeGtDWGM5QzFrbndOTzV4Nk5Zb3V5SWxzRkJ0anRO?=
 =?utf-8?B?bHhzSGJSYVNsRkhuU05ISkxra0hOQjAvVm11d3A1bEF6UEliMXBLOUdjdlBI?=
 =?utf-8?B?ZUhvdmZTSms2TXJZOEI3MXM3QzhDWFVBNG16QWI3NVllNmp5NVEwYWZHM05j?=
 =?utf-8?B?R3h5Sjl2UVcvMFhGaFZYbVJOcVprd3o0R1ZLcHlsQjlPYlI1U2dEeXUxS2Rh?=
 =?utf-8?B?dTdMU3lUUmRQRjZMMVBCU2lOcCtHRDF1QUJscUxpYUkyZFEvTUorM0xBeWta?=
 =?utf-8?B?b3NkRkY4OUZhcmJ1Uk54V2RoSkgwempaN1pHZzU0bzg4ayt4c3FqOTlQWEUz?=
 =?utf-8?B?bGNHY3dnUUVmbERmckp6UG54Q1A0QmUyd2UyZFVBYlVtalBDU2txSDhyR1Jh?=
 =?utf-8?B?Qko4ajNwS3Z0aW9HMkd5bmVnS2NWRk1kbFdzNUV2VFUvay8xUXJnWG03L2d6?=
 =?utf-8?B?TjBiSGdwQlk2OW9qOUVNWDlsaEhsb1pmNkxHU3VKa0srWHNicm5zT2h4VCtS?=
 =?utf-8?B?V3N6emhvNDEwb2hGbVlDWEdTajJnaTZQSnFnc0Y4TUpDTm9peTNTYXZKUU9h?=
 =?utf-8?B?NW5icGR2Tmc4bmNzYkJ4UldKMjd2MFpyamxZUmNTUFlWa0dPTWtVUSt2R1Bu?=
 =?utf-8?B?cTdXSnN3VU52R2VDZUllL3FXWFNHRnRKTWFvc3FaY3JiVFZmMVNQU3V3MlFl?=
 =?utf-8?B?NTdZSDJwb2NmU1hJOVdEenhyZTlLYWdZb0syd1JSazRVcTdVS0daWjM1M2cw?=
 =?utf-8?B?NlJWTzZuc1ZjeWJPZkcxbHpqWHJtZmRSc3Nxek9mcmFrTGV6OU9SZz09?=
X-Exchange-RoutingPolicyChecked:
	CugpSCIK+gP6xSm1cq3RTLYtRErGEbaQdcFDBlqsNUGpSS7fEGs5KcWcaCa2XaJW9i/BNZvrUwr3sktqLctV8evNHD11Rh/RtaL/hhRcqk/fwqUiyWrhjNc3MlOh+pdGgBX49EXy+qYNUzaSbCuXmNKa6KxUldbtmXIs3v9lw011DkkM9dL4RsorLeCI3ov+G9SB3WSBB+E2x1UmWCkbDiHe7zfz+vlCE6KusJni3CVKAwUA86w99GmHg6kh9jeBg5H2tjULsNEbyoJjFdXZyOB2UmpvCXxdfDNAeT4EcECnngJeOib+Hf8Z2YTfR5rSUrWyYNpSeIlRkmc3BuXGgw==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 240330d1-3a7a-45db-124d-08df1248be8e
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 10:12:55.4622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GDsGkBTVcUIbMAgH8NToLvrublKYvWbA+AKhetE+YHMbw3SG4OQYFteJZlUpveBUI9wIH+MdpLxNenuxw0U6ggdp2KZF9C22wMxg93MrVOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB8243
X-Proofpoint-ORIG-GUID: x__L92NAMoZLzLODEDxVtag1qLF1s1MI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE0NiBTYWx0ZWRfX2YyT3ieqDZWv
 3Lx0M322yAh8P9cTTdrCc+AlaYbtPFHE4ZcBfJceHoIA5StWNT4bwAI+BsC1GRRZkcMmhLQycBd
 0g16YpvPQtVeaGwNX7DxL45Q19odAMPx+WAFcy8HN2TirC2xF/+L
X-Proofpoint-GUID: x__L92NAMoZLzLODEDxVtag1qLF1s1MI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE0NiBTYWx0ZWRfX6FaXm2leLIug
 Ge8jL479i3MYBaF2M7duU/Y3pfGehI+02p4RAcjPkSU0ydoNv2br+QOyN5c4bNiRuL4s4PAmrIC
 6o112mw2yDsfHg29bO1f3PAzKwQvtYalXLy1+iImbn8uADDdCP5ZKKJfB+yFTUknuZu01EsHhyL
 Jpz2m68cEzHxRJvox4xE+gVQYAJT1xKKl9DRwXPHYBPsS1jm/mZauJVWPaT5UlZUznLiCJbVf9O
 1dG6KwbVapfmH1AjRQiGs4l4UOz2QWT4KeJGJ9DM1+uIeQZpEL3X85sadLJglC/1PWHELiMoeUP
 WRvoHfFTLdoRoJUraU50VnUxjcJ9/hovQxXEjRqowOuSjVRulJdaeJWXh/kaJpmVcO1zhqNsHSN
 P0l7mS7XDTs3ZXR/bm3QBBpO1bQyjVj8S6cG+qg1DGoDc1UaJ2JmYl/IvV/OZKCmVKjABZG8/qk
 XqE/MorrauCbe0HkyXg==
X-Authority-Analysis: v=2.4 cv=Z6J5j3RA c=1 sm=1 tr=0 ts=6aa7c8a8 cx=c_pps
 a=2KosHvP3s5kmPOqSYQ0Nog==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=ZQxX5BWu6Z8IJBb2zLX7:22
 a=gAnH3GRIAAAA:8 a=rIqaAT42GdJbuDyKmwsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140146

Like for SPI, the I2C driver needs an OF match table for the kernel to
be able to automatically load the driver when built as a module. Add
one.

Signed-off-by: Alvin Šipraga <alvin.sipraga@analog.com>
---
 sound/soc/codecs/adau1977-i2c.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/codecs/adau1977-i2c.c b/sound/soc/codecs/adau1977-i2c.c
index d1c6c4ddf506..5a11cafdff36 100644
--- a/sound/soc/codecs/adau1977-i2c.c
+++ b/sound/soc/codecs/adau1977-i2c.c
@@ -34,9 +34,18 @@ static const struct i2c_device_id adau1977_i2c_ids[] = {
 };
 MODULE_DEVICE_TABLE(i2c, adau1977_i2c_ids);
 
+static const struct of_device_id adau1977_i2c_of_match[] = {
+	{ .compatible = "adi,adau1977" },
+	{ .compatible = "adi,adau1978" },
+	{ .compatible = "adi,adau1979" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, adau1977_i2c_of_match);
+
 static struct i2c_driver adau1977_i2c_driver = {
 	.driver = {
 		.name = "adau1977",
+		.of_match_table = adau1977_i2c_of_match,
 	},
 	.probe = adau1977_i2c_probe,
 	.id_table = adau1977_i2c_ids,

-- 
2.54.0

