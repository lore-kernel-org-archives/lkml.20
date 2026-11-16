Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794866405;
	b=aBf8Ru8x4GrsfHh8p+Gd7qKw3rxo7Si4xhaifcDN6IX09JkOkCi80WQxG+xiXclJ0iKd
	 W+S/wEhbl6Z0jDR44tTXFYtqcgdrPLrPb7bBESCc7CsvZO7+WKdViRMfZjtvG/VG9fRnN
	 kNtv8mq+e0LW7yxnsEbr70COYfm/hZlPNu8hizYdu8ZOrY1Jd7XVotNI+pgFFOeDncyGm
	 zvEaJSSkvDTrZoa7d+mgfszk2m1W4NurqnIbaclqhnjsWGg7N5ZLvemSalGV8u4EIoMkc
	 4lTk2NSYMfgqpX8H+bzhh6pWbNMxJNh8fIRdR53Ns0cpiNQWzfjUEBASZd5AaTULk8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866405;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=nh1oZ3B2UCp0B0Cmav37zbAnlzaISBIOg5wd9YX5mYE=;
	b=uu2kH7DnpBoJtaLCKT+FbMweOpBPEGtXzgyJRBj1I9yziyUdYTksoI3xQ+3rQuoOsbZA
	 isXFsBVqzLEfF9n4pas969X5UfiEpnSlKoDH6Nebk0yJ35P5JIQU13s9ywAcVUleLfSAW
	 Mix4Kmz2kUV8O0P9XEvDIiZgpxMPBkuRdjtADivI6GWRLd3vmqkL3VgR2XhaCZoqOgMgA
	 hFgQcqvOHOgo/CFvSiFQzQlitCUuwSJTRl31QnWUMFoHP02qgF3FKFuWf4eUKH4wd4z8e
	 KDsguzcJuMoUbTmLShv3QHSua5wbYxInSK7/BM6dAipuqoEej31CWrOhpqG/h5ofLxw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=YJFVXeZf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.36
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012036.outbound.protection.outlook.com [40.93.195.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1539E606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1539E606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=YJFVXeZf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zkr0FqGJXRIPrCj4NPW7To1EP/Q8Z5wtgEZ52jLQ3Lk2XhQM2MyYIVrlyWJYbyrsdQLd6tS7MsQ4PcMgNeRnPfFyA1onvpxWJURAIB1l0xWxhszysIV33vbf0HsnAVjVFpZ23RmjHIsFCsb9o0qlNKznmit8PGIsEwWkq86/WNqv9+aKpDCi/3EW7wHRQkxyGwykYvjpA7fluHOgTaLqazMj8uY2cvL/Xzk8PpCQs4X3RhXnpwYvp+2pGkcEkoA440gATltdDrYXUGFkb+NUUWLAfftJk5fQj7jVj+w4jcgh3Px1XdgtnQ06cJqzm2NMLyYL4jUiX6c3f3My99YviA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nh1oZ3B2UCp0B0Cmav37zbAnlzaISBIOg5wd9YX5mYE=;
 b=biVTq1LLM2wemzMkNjED354Fy0IZTpCrMdlTjwCNxyuEGPWRpxkSUu5I7edd1DPfln+aTQ/J1l//PKlUZbQcQgwn3fqgi2YFgaHRP9hsoH0zP0O51IO2oHlrHROcw+BKIVh28erKYjfoYBy9mTX6KHDQuckP0gBNPm7E37//ruljytILo8I9P+5VWK2PEg1elMZhUQEPBUppe+kwFuBT+4JuVo4mgeBmlmS8ZhkaIUQROxU9qNjoKlZm87h5lMv4ujD44cS7mC0TR1M0fPRkA2E9KNWbtTU5t0gWD5aOSKZ8Tnys2oFpFjJyNLVJT6NmirGXI0HLzILVEzwNfAsRag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nh1oZ3B2UCp0B0Cmav37zbAnlzaISBIOg5wd9YX5mYE=;
 b=YJFVXeZfinU2H1mAQVulUKIG94+il8V/TTjwGBtTarr4t6aJlHkVxxh0HK6vdfvipwPrvUURZcDnQ5BryHCIfnn4yfhFhFCDtiqrrXUkL50iAyGF9l00PzAJzvPHEO8EtPBdV3cHO+7MEBU8D7S8DRjLAQJUyqxzrIDgHyxVdrIO/F4UHRhqPSDNI/7b38shlGM5famd2Hv0RP3rBOchF61Gi4nfZwQ1QOA4keyLTFC8jzKjYsasCpObkoXB+G4EW0mwAUeqf31aTPdLAJ1SzAH5nEZWuH7sIC/iAU7//pX4zat12ku2uDOqCDw4hxgEQ76v9lxRwcC5XSivWmWH8w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by CY5PR12MB6298.namprd12.prod.outlook.com (2603:10b6:930:21::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 22:00:00 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0615.009; Mon, 16 Nov 2026
 22:00:00 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Nov 2026 16:59:59 -0500
Message-Id: <DMWZ1COHLFJ8.3NI53X0OT1I2W@nvidia.com>
Subject: Re: [PATCH 1/3] mm/page_alloc: drop unused gfp_mask from
 zone_watermark_fast()
Cc: "Lorenzo Stoakes" <ljs@kernel.org>, "Liam R. Howlett"
 <liam@infradead.org>, "Mike Rapoport" <rppt@kernel.org>, "Suren
 Baghdasaryan" <surenb@google.com>, "Michal Hocko" <mhocko@suse.com>,
 "Brendan Jackman" <brendan.jackman@linux.dev>, "Johannes Weiner"
 <hannes@cmpxchg.org>, "Qi Zheng" <qi.zheng@linux.dev>, "Shakeel Butt"
 <shakeel.butt@linux.dev>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, <kernel-team@meta.com>
To: "Joshua Hahn" <joshua.hahnjy@gmail.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Vlastimil Babka" <vbabka@kernel.org>, "David
 Hildenbrand" <david@kernel.org>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.22.0
References: <20261113235238.3595412-1-joshua.hahnjy@gmail.com>
 <20261113235238.3595412-2-joshua.hahnjy@gmail.com>
In-Reply-To: <20261113235238.3595412-2-joshua.hahnjy@gmail.com>
X-ClientProxiedBy: BLAPR03CA0173.namprd03.prod.outlook.com
 (2603:10b6:208:32f::35) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|CY5PR12MB6298:EE_
X-MS-Office365-Filtering-Correlation-Id: eba38fc6-8fe5-41f1-3981-08df442cf5bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|18002099003|22082099003|11063799006|4143699003|56012099006|10067099003|261026140227099003|261028144727099003|261021123027099003|261021121427099003|261102123227099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	9O7Fy3ma1k9UuRTvjqXl4htKjADAlgvC6hyYo6C4v/HypekVhInBQfJ7pywqDuzbSaOz4zPBUuv3P/Go4awt+V0WGN5qijCM00uBQlYRuk8Rv2oNHWixkubkoSTXPrRx3gIleeH6fXPGrZkp/INgEL4scns9aUwyxUUmdTD5PTMW0k4t2bkzTdXSb8wpimghwvu2YsPN2jlAd5yniq09gL+z0a4fq9At1Foxtai6yYcVbScvA0Jd57GHjOEbXKODt2kO8dvaeREe0pEvzAVZd7DnOBChrClniHj4N5R5Uq1YFS7A39KCl6K7wDdiPNK0AmuLQZ6XMeYgWGkAy82gJQC7PBoOZvGBXMtTXiTMf+NVo0RcAlhMIQw8VCurf4DMHx8/4wOVjxfqNAGd8SDQbyt16SXAsA7anra5z94oIWRWFy0R1xpJ5uYxZQn7Q8sQsRNIa8sMk0QN+sbGL24mUSCAqvUb0KtLf2MN8+FF/3S6wZzn67sgx58Ob/x3sGEfkvoRe9ZIkcMPwjiCaenmYGS4y32uyiGYWHkgsDa1AKigREeAhp3gruMN57kbBtNmx2QcwKuekFX4+Y2rgThYYihl+1sif2XMKFNC4ANs4YtZmKMnU0Wj8TgLdsdRxB0dMyZS6arvbKqomr6CE3x+QOfa0eSc/6Lx46hBymvhvc0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(10067099003)(261026140227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzdzWlljQ0FmeVBXa1FnTGd4eFd5alhKVkkycytqcHR1T3VTbVNqU0RhL01n?=
 =?utf-8?B?N0JSa1lheVdCK3dyc2dKM3ErYnN5a2JLTUV2ZGRxR05YN1ZnWS9EKzZWcjJt?=
 =?utf-8?B?VHdYS3FhRWFtejh2VlN3SXduN0NrQVdFQmRnMEpyTXFVYTIwdzExVmV5L01q?=
 =?utf-8?B?VDhuTUJNWTRlbEQyaDdnbzUvaHQ2OFdpeEZwZDh2MWJTVU15SUQvQVlIdnBT?=
 =?utf-8?B?eEsxUnovOHNmTTBKU3pybnU5UVNzcVJWNDZrVmh0a3k5dU5vQm5tckpwSE4r?=
 =?utf-8?B?eVpKa2wwU3pvT292Sm02MTZnV2NaZ1IrbHZWa0JkLzY4aDhwOVRWTFRMUno5?=
 =?utf-8?B?V2lWdE4yaXFrL1FNNTFZRHMrWDdheG5VejBtblFHOTVqMklIdmo4L3VaaFln?=
 =?utf-8?B?d3pxLzV3RGhEWHgrZlRBNU50aVhmay9pUEgyU092b0prQXMxa2RDVkRveXd2?=
 =?utf-8?B?em1NaXdBTXFEZGp5czVRcm0zdlAxRFZ4NWIyNkpoN0tSN2xITk9kQlg2dnhw?=
 =?utf-8?B?SXhZSmpYZThwYmlLMVdId3YwY29wRUxDMXBkbVg3czJSTWZzcVNkRnVHbHc4?=
 =?utf-8?B?aHk4SjNxcTIrenY1QXhtaUxnMCtaSVVvY3NzdnpjOHdSZU1FQnA3d0lxcWNt?=
 =?utf-8?B?ZjFKWGxSb0FJcjliR2JsVExkN09MYVAwNHFRT0tRVG52bTIrcmU1bGFYVmR4?=
 =?utf-8?B?WHdBVXliTi9TckNGWGFJSWY4ZzU3TWhLc1h6NEw2RWh4L3Q1b2dZWGxRNWl4?=
 =?utf-8?B?NWdDOWdXcUtvWmpmdWtINGRIVGlycEE3dndpMHpPSVZVUjdwNXVSTTF1UVpH?=
 =?utf-8?B?YTVpZ0xyYlo0Nzl4Qlp2UHhXdHBmYzhROG95aHVmQzBlbm1ZRkh5TmViZkx4?=
 =?utf-8?B?L014ekxScy9PSzd3emRMUmF1UHVSc1AvbjJDUmRjZ21QQ28vVlRGVG10dzcx?=
 =?utf-8?B?ZTlLYmNGWnVVd2NmWnNOYmw3cFlMR1NmYm5UdW5VcEhCVlF3cTFVMzRCL0py?=
 =?utf-8?B?ZFJXemVCL0ZYQ053NTB0a05sWVp5emhHSzlYdGJpMmlMNG00SnVGMzN1OW83?=
 =?utf-8?B?Tzg0THdDU2Ftc0xCOHpmeUtDZ2FNQktQeTBYcU5KZThVRjZXa21lQ2Z5Qmwr?=
 =?utf-8?B?SmY1SktHVnU5ZHc1dTNOV3NoRXZLVHpTN2s2cWhMNEpJQTgzanIxd2tSVmkr?=
 =?utf-8?B?bGUwUHJkNXg2a3gzN295RTVRdGJBSUVQMlZUdnJKMDZvSTRXdko3QmlrczVS?=
 =?utf-8?B?YjJ2azBmQUdiR3o5ZXJyNktlRmZSdlFtY2MrMHBJMjhySUsvYThzL1pYMHBu?=
 =?utf-8?B?MnJRakt3dWo0ZkxHUnloOTJ0eGJ2ZDdUb3lGRnFIM3VzQVBDTXlseFA0ak10?=
 =?utf-8?B?YlhZRkp6TldLdW82b3YwcS9EY1MxOGZlQkY2Rktkb2RHekwxS1ZQdUtEYkFG?=
 =?utf-8?B?akVKYzdmSFBTYm5yYVNITENYSGNQdXRjR3lRNVN0MjVFemNrMkZjVllmY0lK?=
 =?utf-8?B?eVlYRG5ZK0hGbEV2VldvMHlmSUR4WjVuS01hOUF6S2hiY3JKME9zNEhoZ3BT?=
 =?utf-8?B?RytUTjQrcHRlYm84TG00dC9nM09mU095MWtIS3hpQk4rbElvTEt5SE54MVE4?=
 =?utf-8?B?a2hXR0FMYVdkZjN6WkVmcWx4YURYZHE3NEJzZjJxS2N0eEdieDlhZWtBVjA1?=
 =?utf-8?B?cHBvWFZ1dXZHZkt6Qk9RUEFVbWxRd3g1UXhvWFovL1VDN0FINGdCRXdSVVhB?=
 =?utf-8?B?M014MmlkM1RHbTBmZHkyT3hSWnY2S0pFNTI4YjZTcXk2eFBKeVJ5WmRPWWRx?=
 =?utf-8?B?cFBVdTRPcjdPNGpteE1sUStXYXkvTTRZaUwzV3pNN2RvdnpGbnFjQk9QcS9i?=
 =?utf-8?B?NHNJVHp6SC9CR3RsTStUb3Q5YU1QUFcrSXBtcmxhUnR6OVJjUXJtV0prN1RP?=
 =?utf-8?B?UGtlRnFETUZtTE0yYW1WQm93Z1k0VjRDeXZEWk5vV0JtdURKeTdQeGFENW53?=
 =?utf-8?B?dUdxYmRnWmNmN0NhK21JTTF3SVFxVXJ3SzlqZjV3YVBRTWJLQU80b0JXaVJi?=
 =?utf-8?B?R3BxT0JJWngzZmxCWXpjdWQwRWxUTWRQQit5UXZveHlmWEhteGNFS3VLYW1G?=
 =?utf-8?B?SDA2RG8yUjRJR3RTNTNIZ3JSZXhObS9ENEhoemRrZHJtUlZnR0ZJVVNTbXN4?=
 =?utf-8?B?NFBJOHlYQkxldFJUZFdHQVFGUTQ4Rm5NWjYwTTJILzBhMWlocWRKc1FiTWUw?=
 =?utf-8?B?eitVTVM4MHVNWVJ6KzdYL2MrWUpoWVQ1UWpNNFBGdEc1NVdOQ1Bnc1grTS9s?=
 =?utf-8?Q?b77155XsaW8/jwBKrZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eba38fc6-8fe5-41f1-3981-08df442cf5bb
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 22:00:00.3184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eQ8WpIGjc97ceGussFlDOIvnKUkFVNW1rl9IN4kSAkm5YChkfhpkzdKEgx/aAD5f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6298

On Fri Nov 13, 2026 at 6:52 PM EST, Joshua Hahn wrote:
> zone_watermark_fast() has not used its gfp_mask argument since commit
> 2973d8229b78 ("mm: discard __GFP_ATOMIC") switched the watermark boost
> check from __GFP_ATOMIC to ALLOC_MIN_RESERVE.
>
> Remove the argument, no functional changes intended.
>
> Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
> ---
>  mm/page_alloc.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>

LGTM.

Reviewed-by: Zi Yan <ziy@nvidia.com>

--=20
Best Regards,
Yan, Zi

