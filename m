Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CAD336886;
	Mon, 14 Sep 2026 10:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380812; cv=fail; b=TPvUUNNVITqGxXXp0U9xBIzLaltKg9ivzDR/vQa6IDkVLmo+jddp6WoggvBjWVOFyKY0wQ0j6rU5I49iO8XY1PWAonIZL6dBoAzZYHsQqTWw9hMaI6pbVPH1aUzfrx3X091/OdHkD8SBA6sHzASujcBZQlsJnNb8xD9e6uuV8kA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380812; c=relaxed/simple;
	bh=xB6qye3SvNj3Y5KNpF2fpneTtAG+UNi871kopSp+htg=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=CANo6gG6nkuB2gLFLcMJ4mPD5SBHykLpgTEE3ow6pUllBCbXu/SiyTjfwOIJHlKEXXAGZkcYZkHs1iRuOHRDyfOY+5UXh27LYrsQ0yu3J0Hcplgs6OOpr8EYNkIwF2xX8OFzTZfaWfQzC424B3hztPydLgJGGGh/Uv2Z/QH445U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=DVTc3LB3; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="DVTc3LB3"
Received: from pps.filterd (m0516786.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9mD2r093469;
	Mon, 14 Sep 2026 06:12:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=5ySeQEQonFXcwhvS28KJdmeU4sQ
	7dwOwVrHAAkOhro0=; b=DVTc3LB3bFnaY5vVztESRpzK2lO+JoQ4les8i14mK7J
	llxS7Bhh5zMNPzkMQ/tHqm6mdho8UcICOgTIXZdWMoSIt9uR066rQV8bcdkgZhO4
	mJMj+pdmrizaoeK3y49ol71R8/AOUVhKU+LlK/GVO4QUKRSCFOvaI24f4taez43Q
	s0Ab1C//66WHG1sZyZ7niwexBzDUkx4v9cicJePBT5LfP8mqmoIqARpMTGrCxSKL
	y+6eswiKGEHj03lyPT2A/eHF9ghO/HM4d+pyK9sps8dDAyN5foS+iBRFhzz42V+a
	Xuocw22n/cCKzZdbSofmN3KvFaK/LDqfoCZRvH/TSrQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013060.outbound.protection.outlook.com [40.107.201.60])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gnqbfbdqx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 06:12:48 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v2C6TVVhQCUwcxnEIC8vlGIK5/ZzvMLeH9gMzGe83lE1KvKRS/MpnWAlmF1Cte8sGVOiW3iBsyXGnpMMlZAe8OKV7TP7z/PPKIyfYv617PwZRazB8uvbM+uEBIjqh4p9n29J5sYfqJhCw6U2RMu/F1lijz6QSnme9LOwQ3H7K3u4O1RuNPQBBOOinCqi5O4AMnkMH5fTdOFHMInHVHO9wxrTtEr29PSwCRXVpBzJVvN96PDtt4re94fxsRrI/c+lxDRlTnJm6WdgO5kVqHaU9HxmizuEAsAxD+rWYnNpk+0896M8YcH7Gdp0CkFaxoGeMpcrcIQHIZf3dx5mfFNjDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ySeQEQonFXcwhvS28KJdmeU4sQ7dwOwVrHAAkOhro0=;
 b=x07qaoMfjv95A93scPlyQYYzNZ6YAQUrLk4q3y2lEjTAnp+K4H895AtF+fWKCeFGQEycG36p1KJTwqDr1bOAyIyN/ankG9HIA/sCzuZrT2v1kFTKQUI4tDobc9rxyTk+9Pj6ciBcCVl8xvp6glDLqO3maFuEqmWm2iGvRu/FOR8vlg7oke79rM8sbUM+K6IhB7xfbJ0a0FqgJWkYiRCx/xIVNe+lVJRpNCsQa8eqUHLl17Ft5WG9Hi6zhjFIYhH3IDs+Ut3N7YmN4G0PKF/8LlWfemUta92bnhVyXjhYWihrpIMjq3/971+7txhRsBllR8pb8eKJwEZ7FnV5DbBshg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by DS7PR03MB8243.namprd03.prod.outlook.com (2603:10b6:8:262::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 10:12:46 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%3]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 10:12:46 +0000
From: =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>
Subject: [PATCH 0/3] ASoC: adau1977: small fixes to make the driver more
 usable
Date: Mon, 14 Sep 2026 12:12:34 +0200
Message-Id: <20260914-asoc-adau1977-fixes-v1-0-aa2f0cabd728@analog.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJPIp2oC/yXMywqDQAyF4VeRrA04KvHyKuIizqRtulCZaCmI7
 +7ULj8O/znAJKoY9NkBUT5quswJLs/Av3h+CmpIhrIoqehcjWyLRw68u65p8KFfMWzJB6moppY
 JUrlGuYcUDuPftk9v8dvvCs7zAt9IPjd3AAAA
X-Change-ID: 20260914-asoc-adau1977-fixes-86cde36468a6
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MM0P280CA0074.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::28) To BN9PR03MB5977.namprd03.prod.outlook.com
 (2603:10b6:408:132::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|DS7PR03MB8243:EE_
X-MS-Office365-Filtering-Correlation-Id: d4af0e0e-a326-42a7-8c88-08df1248b907
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	ToB0pV0KKvTyYy3KJX++ShSV3dotbCZCRGmvYB0kpwMl2xFxt4XqEn82XW/tTRLdJZYqD3awpE5V4yHZiDcQwuqznilNHiurcEtlnC7X4B7abFFsBV3hr9fJ66twIYo1CSB/SI+Sz03efRkaYJnGx4Q9KdTj52pfbQSB0XbkBkRzfbZVkjT8cp+DbbZmtShrzEm4JiVW9w7Gmikjr2NYTXtl7EFZ55bYKtAChfPU6rrreJt6EOKIuYpOsZ6ORwlwJnqFqCMyio6z6rZvoIEBvN2DGYhfJACVzDTMbhn+QC2mZPOzg0hJkMLqsM9QOi18k2EpO6SiP6Z6gW0hwUyH7hGa+4C3EC2V8jgzEQeGMQSaU24iGF0N7gtJrjS9gmcaQleQvpLVhk4NnCo6PkV1oLO4OIoQONwiB74EOsqSOr4KQ0HAdQygJF1P3FjF1SbBEAR7EgMfa47LxuBpIkxdBWeqDIaGcqLar9tBFuF/ABaMZEWiTF+UijQvScM5SDZ08Ck0o10F0uNQ4PzIx+fuj972uFs/aZDNX4ffPqe/6aXbQ3nlaFPv8+w1TjLVgxcn4Q5NqS3RjlW50YDFL0rExN5CLrsdeDcthVjha2lLMTE0n3nc0A6qaU1blYpnKUw4OqSMumHarBstdc2u9PMUFWBg4peCPPNd5dREJ2kY3wo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlZZRnNMNWFqVHFYdERzVmlIWk5nZ01ZQnJ4MmZ6T1ExdlBzYTd4OU5YSGVQ?=
 =?utf-8?B?YjJuVHNLZWhzWDA0YVY4UFcvNE1EV3RlbnhmS3Q1RWpVemxGY0tNWXg1eFZJ?=
 =?utf-8?B?aG00Zkk1YnRtcit4QUgwSEZYWElnbFBkZWFRWTZqR3h6OExsMVY5c2xaWlla?=
 =?utf-8?B?RUI0RjdFWVVEbHpVb1d5anFudytCM25PbERSdDhYRHBsWm52aCtrdW5kQ3dX?=
 =?utf-8?B?T0luaGdnQ0psMXNtSXFTb3VvL2FpSVU5MHc0VDcrbWZEK1BEc1NLcjRUdEZt?=
 =?utf-8?B?Ny9XOUlpajI5bjZqNm00dGVNaVZJdWFlM1pyVW4xWVRRSktMRVhlcXV3Q2tz?=
 =?utf-8?B?YWc3U0dTTlVWUGR0N21ycDdUWmZVYjUxUVlDSC9IQnVoU0VWeitMV3Zqdklk?=
 =?utf-8?B?b2Zlc0VwVzJ5MEs4YWlEbklkOVdRc0NRU1NtYXg4VWpiRjNvRlhVMFhONDR5?=
 =?utf-8?B?dEZhUXFFQWI0Rm1YWmpDcWVPM1VnN2RieTlOTW5xa29PcjVTNC9NcTd2U00w?=
 =?utf-8?B?K0xUQzJVSURsK3NXRVpSN0Q5Q2t6RUJOd3czYncrN084dng2aHB4N1lRam5u?=
 =?utf-8?B?M1B1aGwydFU5dDkvL3l1dlN4WENXcURHNjJuK0xrTHIzYjFocnBxUURlU2Jt?=
 =?utf-8?B?L1EyQkhJcEx1a2Y0WEtuMWswSW5QSTQ1YTVDamlCYUo4dldQWVc1dFJlVmZ1?=
 =?utf-8?B?QzFmVE44ZjFTRkxHNFpMOFZSSE5hTGZVUFhOb29rRjVzeGlyWjJTTk9IdElw?=
 =?utf-8?B?alUzK2xqNlFEUkxQV1p1QUM2cWw0TVhrTTByMlNkV2xHYWkzWVMyMTloc0lN?=
 =?utf-8?B?SjNCTTd3dktTMzREbnF0STFvV0R6bkRud2wvL3hoTE8yUWE0ZjBUWXRJQk4y?=
 =?utf-8?B?cmNpMHhvTGlidUhjVSs1L3F5a1Yyb1JwQXBCK3lOREhESHkvWWY2U2tnYmx3?=
 =?utf-8?B?d3Z1WmlLRS80VGtLc1AvWTVHUVJTUTVyMFc4S3R4eHgzMVp3L2xMbHZ6dE1G?=
 =?utf-8?B?VDhrYm5RZjk4bUFFdE5LYTYxRlZQNWh3NzVaWXc5eWJuUklRcnF0ME5od2Js?=
 =?utf-8?B?VUpVdjdrMnp6V0dBTklCVkVLdzhaMzMrbk9sYTloQ2tHeVVoZ3ZBTHkwODJh?=
 =?utf-8?B?OWJTVVNvSjF0OWE4ODYzU014d1IwNHRxRlhhOFEzRFluVHdvdSthRkg1TGIz?=
 =?utf-8?B?MmkycmIrVmtNbTZPNzlpb0JWbisrb2owQ3hYTHU3VjFiSDlQSUplWUR4NU9v?=
 =?utf-8?B?aHZhemdiZ2k4Qkl5aE80RGhMZDNLeTljMzJHbjJHUGEyT2lWSmxVVit5MmJv?=
 =?utf-8?B?V1R5eXB2dmxWWDVZdmdSamszUXBZOTN3YUYzeXYwbXEzdG0vSFpGeU1ldlgx?=
 =?utf-8?B?NSsxRmdReXNmN3lJaTV0Ly9zT1Myb3JjeGRkM1REOGw2bDFTekNKQkN5RzZN?=
 =?utf-8?B?NHpEMCtmYmoxWG1mdFZLdG1kbG9INFFSZG9pejRPM3cydmJlbUtQbW9ZTkZH?=
 =?utf-8?B?UkE5MnJCcyt1d09DaVlYUWRHM0dTUlZNSnRyQTdoQ3h3em00Y1k1ZEpBNkNG?=
 =?utf-8?B?cWxENUdxMFJBT0wvM2gvaWdhY3AvcGlYVmNGQ0pqdWFKZVlWK0cvMkt3ZGhP?=
 =?utf-8?B?VjRFdDQxeGFXSS9XWmRMYlZMTmxReGVHZ1RzRkVIRi91M2xkTHp0bm9teHlM?=
 =?utf-8?B?ekowOXVWMGhodXVuSGlGMnFBYzRiYjlDeVdHSWZjWnJyemdlYkQvZzNWNEFY?=
 =?utf-8?B?ZFZQdG53TTJqUTQwejd3aFl5M0hHTVZWbzdWTldBL1lwQU9BUDAwTkNaM3pp?=
 =?utf-8?B?Qm4wMTFkQkk5RUhSVnNydmJvaFdOVGlTU0pMaGxSeVpCZGZ4KzNSOEdKVk1N?=
 =?utf-8?B?aEMrVEZFcHJsN1U2bGcyWlJjMTRXNy95RUNiOE82NlNDRE50TDhMOGwwSGs5?=
 =?utf-8?B?S21icHBVakl1QTd2Uml2c3N5UlZKZ29LNjBkQXV3TkNaV29nd3NYSVplZlYw?=
 =?utf-8?B?Sm5SdUtLUGNtSUZnRytTSlZ3cHJXakhoWkdtUVB1NDJWTVV5WHByZTNkZEVw?=
 =?utf-8?B?a2t2TWVzcmtmMFIvbWx5V3lwTk1tTnpGcmRmbm1xemsrYkVKS1BOaUhBbXR6?=
 =?utf-8?B?TlplNzluNzJjNmdqcmRxVmI5cy80Z0NrSUFBV1ltYmhRR2hDTFYrdVFGSHhE?=
 =?utf-8?B?N2FJdnR0a1ljQWo2YnR1ZzdPbE54OWE1dFY0dHh2WGZTQlQ1em4yQzV4ZzVa?=
 =?utf-8?B?SzE5VUtoOHQ2VzAzT0V4M0ZWZjBTVzFPS0kzMWdVb1N6ajk0UUhEcndlWWRv?=
 =?utf-8?B?cUY2bEZlOWVTUUVuQ3RVSWlvV3B5SHBnSkljVi9wYnZzVThQdVJPZz09?=
X-Exchange-RoutingPolicyChecked:
	3zJLLvFRnUfRsq1LmOXA7XOPVE3XaidKyO9dJAr+hT8A4xr52vzZs7o/VWSid6txu/19+80ZU6cygSnoKhwliKnNWVtuHJjedj/rRpsbXwvvsJ+1QSP01XZoUeDhVIWQ7FcHjLdADfjCiskBzQJOLWsrteTI0K8+cfp01HV4dFKpnS2gbBlSfjcGU4TcE/eWpm/fazrz8MqB4YDfV1UZhrsil2uI3LnnUNbZmLlpbqtPv3eAh2Ag/t2Mds7VgOslzoyJYEUoRtUV4Z2owL98OaA2lKBWhCAUlS4bb7Ph5VHo2+Nq0Q8CxDhOrarlONu4qORcrw4vXnpetal11+lFNA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4af0e0e-a326-42a7-8c88-08df1248b907
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 10:12:46.3365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: woZjSWaS/BCEO3WZnKeearifr4Mt5gjlMXUQI1GQ6+lz7Xxw0Y/mx3f1Rf4vvRCVrFTUEL4FvJ6+K5Pyrep2vGVRKR89l2P4DKSBCoybN7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB8243
X-Proofpoint-ORIG-GUID: JooZvlVhCvhZow81pKeZDDQd24XvBjzd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE0NiBTYWx0ZWRfX7jz5sQL0F8Yj
 rGkXGhtW4/q80vMNQl/KgChJPEot+SPDQExPPDZhs03++FxNy6zHNx4NHTTGlovcp1KOebNiVQV
 jWPER4ID1PKyh23z4HPGMpaso1LJDLpb94XQOwCWc0z7x1U5kf7/
X-Proofpoint-GUID: JooZvlVhCvhZow81pKeZDDQd24XvBjzd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE0NiBTYWx0ZWRfX8Um4t/+LvPkD
 6KKJ9daU8f2YYvktwD6W8taTE946XQ0m+j3ubtOi/lyb8xn99mdA4MQOJ/inKgNmoxR5szf5YDL
 +jpUkFgGDELvZzBhq7AsvU86CRba7+m9PIS9EtcwmwD85tB5I8EQF5L9Uog42xTlbPAxOXElQez
 YTFKmTf+JBGQcSAFyvIJRo3dc9tZQGohp6Q5f1loe090BH8gvlAJ/OAQsPZqKBOLYAftBsk04o2
 G6f5am5NpncV3184kzuMVIog7AEtYXII2e2nMDKHURncZggYjJ3I0lvL5II/3hPJCzkj+2RJ+C+
 6u33yuzfvzj2e4isYfIkdOY0xkWOPDRNyZjIjDoBamTGHdSr44swnR9P+Hx02M0rptF6FAtA42H
 +u7z4jETZe/UJXJQ/SS7i0xpLFs/6puhMZX90fGxtuzbr+8L+9A48URt9zSYozmM5ITS6d4dFA4
 B5qpf8/JNRCn/xNkjQw==
X-Authority-Analysis: v=2.4 cv=Z6J5j3RA c=1 sm=1 tr=0 ts=6aa7c8a0 cx=c_pps
 a=qSo88s0AsKk38onbse8luQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=ZQxX5BWu6Z8IJBb2zLX7:22
 a=gAnH3GRIAAAA:8 a=yVrfK3Zxd5-cNMfNHGcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140146

Here's a few fixes I encountered were needed in order to use this driver
as a module together with the simple audio card.

Signed-off-by: Alvin Šipraga <alvin.sipraga@analog.com>
---
Alvin Šipraga (3):
      ASoC: adau1977: make the Kconfig symbols user selectable
      ASoC: adau1977-spi: drop __maybe_unused and of_match_ptr()
      ASoC: adau1977-i2c: add OF match table for I2C

 sound/soc/codecs/Kconfig        |  4 ++--
 sound/soc/codecs/adau1977-i2c.c |  9 +++++++++
 sound/soc/codecs/adau1977-spi.c | 12 ++++++------
 3 files changed, 17 insertions(+), 8 deletions(-)
---
base-commit: 7e125889f1705fc6326679a3db3b4159f7a8c87e
change-id: 20260914-asoc-adau1977-fixes-86cde36468a6

Best regards,
--  
Alvin Šipraga <alvin.sipraga@analog.com>

