Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011061.outbound.protection.outlook.com [52.101.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A293F58CC
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762104; cv=fail; b=pu0ooWJ3kPmZV0whWTPbAh2IjySJLrHvPQNG/xOpDkm4r4NXldPXmOI4alaGgJivqJRjW7W80yqjJnBxyzh7kwdDwVU8c5e0uwLEi0N0IIv0ZlecJSjNiLMdXEsRk5SiKxtu98dXGvWpQEZnTkh+Ofy3WKdkzdivvxbH0gYgpUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762104; c=relaxed/simple;
	bh=d9cOD/3JN5eNS+V0OCEn+yqt8H2yUEJzY9YwgJ1cdhY=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To:MIME-Version; b=rS20ENN+r88H8DyJnebdFruqCj10mdSf5CCtFEAyY5+iP6tXpGXSRZcojR8vbieWPocrW7UDEMNmhVd69NeNfI1mfr83UiiFK9zvivfNTWj7b2alO4OVc94AJNavCgR8M92zuxPgifz/SLRQBPIePtPiFok+oMSxN0XctahschI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=o7/lGbUy; arc=fail smtp.client-ip=52.101.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="o7/lGbUy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FPqcSi7Q3p1qP4D4xzCTo7GKXD6B4pK2G+sTZWGYlKDMlCFIOhdwXOGyz1cgbYbQKQ+oKa2UppT9KZiRH4127CJ218jy6Spp+Yl/ksMamLLG4DygrUDOtm0qqQVY6NNbFSzBRwfijS3T/X8TVbZlt7e9Rl6pdmvZqopm1u3uiSstd+a4b4rJM2KYAx7M4odVKSaxkdipkbdVYiUbRNSI1Sk2+CjjVvr5L6amX/A4jECthb8NS9IrSq6QqEar3M5o0Flnk3tM1PG2x/SK36IbY0+6f76/DZRvxa9YTJ0kMDjF2iu0YUWiAci163hEMrUaj3yWIEqM2bTtWOxPjohj2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y3wdiYMff+zOVKYMJAs6nLjaKyXuSNz8qjUccEL5KRs=;
 b=KjNX1U7145Qw2AP5iMgXiiGsPCx8l4qYtOXrLbsHDl0xMQiBpnouYMUSiFawHpKoRF6pnHlsrSFzafNRpNQK73EY8fZ7X/Uezp8BQ++LRXEakS14g8qnA245DYSJsRo7hfsNOF8RFUh9YqBORXiqCvAq/I/PpRUKHeP8PssFrHpdCyHhSsdsxJbqYO8b5Hq10Uo1T+HX2cZR4JehJgNZb1n91C1fKg/6YSGM65gkrEkyC5HivFNgDbDIAIh5jEGOsTMMNW7sJf6sjRKinlVKzhtgMjXA9/36EiMdEHEQqKcZb3GAMMABAR+eGYXVXoAcayPObQ+LlpB0xInzjcsjpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3wdiYMff+zOVKYMJAs6nLjaKyXuSNz8qjUccEL5KRs=;
 b=o7/lGbUyZRF/itNrBsd5MtRP6yPsEsPvzOxF013leL+IDeUgT48HzF5LXkNnDNBVjOI9q1szMuzJWiuEuBcI3u2Q4fd7IC64MBW6Nwd1GzgIi1EEqulgpeYwIm0K7Y0kjyclHwYop2FgXORPRcFyjxK/S5FZsTCFTdWFFT0wRAxX/gvRUKOo9PrsEYLm5u3xPou6qYSbyIUkx1DlzDCSTWmNOFY49NXUQLMPWfMn/Q8l3j22bNECG6Hgzt4bCKgNiVjQ2iwH8j8sagqm5KSqxGKSeYtS7qVqZOkykUwSAzMuJ+0qCxecWwNy+lpcrQ99otE2o/3UemwScN7al7EKBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by PH0PR12MB7886.namprd12.prod.outlook.com (2603:10b6:510:26e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 16:34:50 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 16:34:49 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Aug 2026 12:34:47 -0400
Message-Id: <DKZ0RP174ZWV.1DP8KKRE1LQ6Y@nvidia.com>
Subject: Re: [PATCH 3/5] mm/huge_memory: reduce indent level in
 __folio_freeze_and_split_unmapped()
Cc: <lance.yang@linux.dev>, <hughd@google.com>,
 <baolin.wang@linux.alibaba.com>, <baohua@kernel.org>, <liam@infradead.org>,
 <nico.pache@linux.dev>, <dev.jain@arm.com>, <ryan.roberts@arm.com>,
 <balbirs@nvidia.com>, <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: "Kiryl Shutsemau" <kirill@shutemov.name>, <akpm@linux-foundation.org>,
 <david@kernel.org>, <ljs@kernel.org>, <hannes@cmpxchg.org>,
 <usama.arif@linux.dev>, "Kairui Song" <kasong@tencent.com>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.22.0
References: <20260826162101.1314941-1-kirill@shutemov.name>
 <20260826162101.1314941-4-kirill@shutemov.name>
In-Reply-To: <20260826162101.1314941-4-kirill@shutemov.name>
X-ClientProxiedBy: YQBPR0101CA0078.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::11) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|PH0PR12MB7886:EE_
X-MS-Office365-Filtering-Correlation-Id: 82392067-11a9-423e-42f0-08df038ff29d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|10067099003|22082099003|18002099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	42D5QiT+7C37uQOhnd2uMmVHkdiGW3B8hqKyh1u3sCu+exxfyLo2snWAUd8QDFgowIuNMe5OljafNPxHkm1PUSVBLeRrFD8Yb3A6w6t81Jhbhw0v0qxOqcaYRM78t49zCqc/K6djd71jEqJsVGTvuxYRjzi3ni43h8U6M3CCAVzg/V9i9KfN0u/CEDcNyrVvuelVzTicnWmp4KwBSBkkwxYCDKS/rqninvSTSfs9Oe2s7Cqa4iJuJQZdWhcMKHqLAmgDYfoDz82CUJj3gMuFNEJAqLuzRmX+RpUTQpvqcbOH5GP1nnulwqR7JXKz+B4iN6MTHCBplrkbl2FGHA7TM0bUYZGcSeTJtw4fFzrqwd/9Fihnquigsis/jYHSN0ImXKBuTp7RfNg2cqXcTvFpWqUEyjasysw5a14g3q3CKtzZUIKwy72KjgKxculeYdc0flCuuszBQSnY7DgJQHjURzfmys5L2TStifK6ui5rWOFvgYJaPcdygd74Vxzy4CMkXcZQKDssqSlVZgDbkqEMWjultZ7I+QOXbD1Sz6BLRE4d6P1Zom3ZEDl4HJFsVyqypUOoORWwhIzAwIcmBrXZ+nH2GOPiaMQxX5cuG4iNcU6ewrWtTRTbCh6xKEHT3uIjvGT1j0UBBLTkpY9Stjx3yXC4R05Z3/JATfJ5A+SGGTE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2xqUjJ0NHJkejJ1TjJkQUdCV3lNb1diSnF1emNkQVoyZFhBMS9HSHh4SEV4?=
 =?utf-8?B?QVlSMkJDRGYzZDB3aHNGSE9hUC9vTVY3ZWNxL21qZmtQd2ZkU3dpajJEcG5n?=
 =?utf-8?B?UkRRdythUnZHeU9hem9GVnRMNEpZNS9hOGhEK0hjcjk0Wk9haGZ2YzdQWkZh?=
 =?utf-8?B?WnlvOUkwR1k4YzJqMlF4QW5kR1V1bk9XMm9FcFNMZDdpQWcxRjlydG1PRHlJ?=
 =?utf-8?B?SC8vVnF1V0xrcjlQUzhuNGVLaXJFRHFmU2s1eXRlTXozN0h0UWJqVno2RXl5?=
 =?utf-8?B?UE1FNkp2WnBtZGlDVXMvOHo5dzdwVjhJOXdjdGRkU2wvL0dybXlGWjd5T1Ev?=
 =?utf-8?B?OUgvdjZiaVZieURaZ1pNaFU2Nm5tbVkrTmEzQ0dYV2h4UEhIbFE2Y2VpcGps?=
 =?utf-8?B?dTAyekp6THZqdDdHVkZQOFJJem1ScGlFbHd3SDhVRGp0RGhTK1pOWjNUeWkx?=
 =?utf-8?B?N0k3SHJ3Q2hFbEh2Q3ExMVpIOVFoaFErN21HWXlHbmdtS3U3eWlhRjFYUU9C?=
 =?utf-8?B?ZnNqMGpHUGJXSUx1czlPVXNWL3I0R1BzQzVvNExBRUw0dW5GSkgvWVdEcWRN?=
 =?utf-8?B?MEVQSXZPNndSTTFYUyt3blpkZHZZaEt3YVVCUzZ3WjJzVW1Ra3laY0xsV2Q1?=
 =?utf-8?B?M1M0SFpaZ0FPWnFneStIR2tuTVNHTTRSekQzMUpXSEtHdFhhQ2ptNGFCQ21I?=
 =?utf-8?B?NFA2WWFqd01SWjRNSThXYmlaTUpVSCtPU2ZvNzhzcGd1Q29NWnQ4OFRSaVc0?=
 =?utf-8?B?RUFVSjFLaXBLZEhFT29ZcjZhL0NwTk5MM0pEQ1MxcFNrWldlZGpkTG5iUjV1?=
 =?utf-8?B?ZW5MR0xURElINjBQall6MWhTNklkQjFSUWZtVzdNUkNPdEhLVmhLRXExNFNi?=
 =?utf-8?B?djF6NXRUUkxlRThMc1Y1NENXdGE0ZGk0STJ0Q2RsbXQxMC82VVpSOG1IN1po?=
 =?utf-8?B?N3hNQmdWbHlrNFlkOUlmSDZodkI2NjRUQUJDQWdjYWlVVWJWNEs4T3paQmlE?=
 =?utf-8?B?dHg4M2FhQUFWWDY0MzNwU0pTSmV2V1Z0eG5BN21KYWY1b3VYNmhac2syM0VI?=
 =?utf-8?B?bmZiMzYrcmpLU21EZndIOFVpMXpnZHJidnJsYnZlQkxzc2NXYkRQMXVKNDVT?=
 =?utf-8?B?YndiN1JmVlJ5ekVIbmlDeFdoU08vaXI0OGZKTThDdGJYZmJyc1d1V2IzUWlz?=
 =?utf-8?B?UHVlWGhuS3FxZmY1T3NnUWwvMnhhWDVHVHU5ZFlqclZuMUxpTXk0TTVkMzQx?=
 =?utf-8?B?MzVBQ1B0dnpyd0cyYmlqTEwzVGhtS1paci9VRHdkOHJzcFJQaFU3cm81b0Jk?=
 =?utf-8?B?Zm9lcG96aU9QV3pOYUFtclV4SFRFU0VkMFRGOXVmVXZoT3pmZ2dqVjRINkRD?=
 =?utf-8?B?c3Awd3VHQU9QN05aOWxzMjlJeDJzQUNoZU1QSkpjb05FdWxLQ0FzM1lIbzdE?=
 =?utf-8?B?TmQ0YTZEb2dCTk1LWGg3bitxOTVLcWZqYllMSzd4VS9ESEdzQ2Q5T05zL0t1?=
 =?utf-8?B?Q0FiOXU5WUc1ZjFpLzgxMW5xZ0NveGRyZzdtQ0NSTVYza0NMNFF0cC9rdUd3?=
 =?utf-8?B?M0FHVGJjNWhhTzdmTVdxYjl3OFoyS0J0cWJHWnh4UzlqeDBCS2ZtTFJZWmYv?=
 =?utf-8?B?a0xBUXFpTEpnS0tnSVhLdEVJdDV0N2lTbHFPOEZZZDJHMUtXQWhlNWROcTcw?=
 =?utf-8?B?cENONFF4YVpraUl3L2JmcHl2aUtQR2dhSTI3TS92M2JvcmRWVVo2ZTFhL3BY?=
 =?utf-8?B?aTEydHNjUTNKSFp1NWM5RnRlS21QYUYzVkZJa0VlTW5Ddjk0R25QbUMzUDBi?=
 =?utf-8?B?dzhLa3doZy9Jbk45SzczbG0xSlNla2hnSk5aWldmMmgvcm5UY244ek0vM2ll?=
 =?utf-8?B?YWlqZURlSFdXb1hKREZjSUFkbEFGa3J3dTBjR0NDcEYxejI5RTRaR3crVVhQ?=
 =?utf-8?B?RmpYNjkwWVh3ckhhby83ajE0c1J3ZzAxNjFMTDJRanB5R0dOVGE5dGV0TWZZ?=
 =?utf-8?B?WkZndGJmV09XTzQ0bkVlb0tvQVZ3YmcxTnR0OEpla3VEOWhMSU1rZGFsdDkw?=
 =?utf-8?B?ekpDR21qNStxSndOUUplNjFTVVY5SWdVMzRtWE16WEtqQWN3eXJncit5eW5N?=
 =?utf-8?B?M2Jyck1ZNHh1U2tkckVEMGUwYzFxYUVGcHlPYkxOVDgzNmQyU0NRazdpZytr?=
 =?utf-8?B?SmNDb0JwS2Y2SXZ6RW5YemxyUExSVXIvUkpVM2dIMktNS2g4Q2Vva3VXQUZt?=
 =?utf-8?B?YmM3UUxyQ2krNkVOVXlldk1vRStGQ1RHOXk4ajJmMGo4bHlvYVFiWlRmVHEv?=
 =?utf-8?Q?f+r9FB3hk80UNe6Cjz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82392067-11a9-423e-42f0-08df038ff29d
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 16:34:49.7541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5zC9tHvKUV/J0xg98opYqcukhVw+6pdD/CpZRiKYTcw1HP0dvEx974ICRE2mHstK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7886

On Wed Aug 26, 2026 at 12:20 PM EDT, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
>
> Trivial cleanup: short-circuit the function if folio_ref_freeze() fails.
> It save an indent level for the whole function.
>
> No functional change intended.
>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---
>  mm/huge_memory.c | 233 +++++++++++++++++++++++------------------------
>  1 file changed, 115 insertions(+), 118 deletions(-)
>

Kairui has a series that cleans up __folio_split()[1]. It seems that your
patch 3, 4, and 5 overlap with his changes (e.g., your patch 3 is the
same as his patch 3).


[1] https://lore.kernel.org/all/20260821-swap-thp-cleanup-v3-0-9b43f5163238=
@tencent.com/

--=20
Best Regards,
Yan, Zi

