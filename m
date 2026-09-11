Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011056.outbound.protection.outlook.com [52.101.57.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5422E7378
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789092396; cv=fail; b=ThFMVyI7dVCfHVI8WwYg/Z6Vwd93hSrhwaSksMsaO4FDX7f78xN6NF/a4qlg24Lcd0qvX3NoO8mVhZyALKSOaYe+akIC3zUHj2m1QzAKySqCKvikRPliQzxYQ62wlj6epTkIlf5xu0nMJmNc0HMl2mxPv/PKEHbEAenj1zwdukY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789092396; c=relaxed/simple;
	bh=t01QdZI2b53CsbEMv2YPaY0QeOo3qJzjU/OKaAkbfRg=;
	h=Content-Type:Date:Message-Id:To:From:Subject:Cc:References:
	 In-Reply-To:MIME-Version; b=mzYx+yBRnxvKr987ExA2BCoErkQ88fW/0iyIzAZbPwc7RWuGvWgfe8VCR1tuJ3iacTTsj6jB6443PvOxxzBc/5ZcbIZi/pn0lGEMNbZhjcX/acjcmvdbp9yVbY7NojcYNyy72u/LiSSp8Xl2iRwHhlw2COLiit8aLBops8JsHCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LmdafTtn; arc=fail smtp.client-ip=52.101.57.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LmdafTtn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bcWhjDLijNhJu2s6iRWz77FkbSFOpqYnAyLFoV2YFllBdYv3cSzPengJpOMemEXSCsEr/WuGcd/1fksRSFKHsm1xZi+/GNvUSpH510kL4qZ3JZi2OMWAEI3SRWhHj/iInjrJZcETqWqWdX0m8N0jDFLvA08zkgrnZhslwy/H8uMRi9F2ew2ybfVzxVSeuBB+lUdUjtxVsijRJSPmI5Q5YCQwOGBQ+33LMxw4omdzsX6PILFc/EXc4PRv58q8dl+k//VgHGx8Y+N9jSh7G5DSpneig7+ohojUdOpmTutkVv24H1VyA38Co935XZvmKlaZpVnqUK2hdm5M5x3VG/6P7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hUzPei/aaVMv0fOBde+MU0Pe4R8As3p3aUp8AA7JYyU=;
 b=G2gledzt7d+ALGZRp55poDLjVBnn9rWwbhNvnIRvaLjsEja5Id1f2A2QJ46E+fLQBK8tHUV8jrumk1kN5Vr45YN43nRY3qW5vYMWDbR80IwJLslUvpc9KikN26+fhxMqycpYH+0dWGEc+lyavyYiyFdg65thYYTdyNjNQAmDoVFuZnFftnlEBjQEl+U1kS8f4aziAfbxV2wj23AjUMRlCHLCsojaKYtN+FZ5jezzVq5hUGVp/UN8Sn2iW86Q00Qgg/tC9/hVbJDer9psM9VxWNvSuEz92H8VLtjQdUUQC7AR91aUwKARUIxSRu17k70cNqjDMnSQ56ZWlRZZMimsig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hUzPei/aaVMv0fOBde+MU0Pe4R8As3p3aUp8AA7JYyU=;
 b=LmdafTtnxuyZI2mHGr7Hmspz8TOYBbiseEWqA+v0VyVNQmGiOiQgs3DzrEu2SnjhQJ5ifK/9ce/k7b+w17Wf9J9v+LV7aMhxdJ9GFjFtu/sdPaaFYPYg/v2XVIwIL6knQmAwlM9x9LixcOvUDfspAnsKiTgnDw4MDFEWntc/57td3+lS/B/X2iJZZJrdjB7V5wMgx5oQCG8bRH4GOZmxqy879//A+elj3TkdkWyGKUiWKUN3+rudbv6UG8is5ZS7GoLjcn7eB+k3ox1V37gdlmdi17V4FAMPdcAdd1ttB7DIF/ADU/u2HS3IDw+jHKQ0ocLpKBEFhB5wNqEBVGhLzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by CH3PR12MB9456.namprd12.prod.outlook.com (2603:10b6:610:1c2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 02:06:30 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 02:06:29 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Sep 2026 22:06:28 -0400
Message-Id: <DLC4BKO9UPN9.2VM6L3Q8KO0NR@nvidia.com>
To: "Kiryl Shutsemau" <kirill@shutemov.name>, "Andrew Morton"
 <akpm@linux-foundation.org>, "David Hildenbrand" <david@kernel.org>,
 "Lorenzo Stoakes" <ljs@kernel.org>, "Baolin Wang"
 <baolin.wang@linux.alibaba.com>
From: "Zi Yan" <ziy@nvidia.com>
Subject: Re: [PATCH v2 05/12] mm/collapse: state what a collapse may do in
 the policy
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, <kernel-team@meta.com>, "Liam R . Howlett"
 <liam@infradead.org>, "Nico Pache" <nico.pache@linux.dev>, "Ryan Roberts"
 <ryan.roberts@arm.com>, "Dev Jain" <dev.jain@arm.com>, "Barry Song"
 <baohua@kernel.org>, "Lance Yang" <lance.yang@linux.dev>, "Usama Arif"
 <usama.arif@linux.dev>, "Vlastimil Babka" <vbabka@kernel.org>, "Jann Horn"
 <jannh@google.com>
X-Mailer: aerc 0.22.0
References: <20260910120238.2529819-1-kirill@shutemov.name>
 <20260910120238.2529819-6-kirill@shutemov.name>
In-Reply-To: <20260910120238.2529819-6-kirill@shutemov.name>
X-ClientProxiedBy: YQBPR0101CA0249.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::7) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|CH3PR12MB9456:EE_
X-MS-Office365-Filtering-Correlation-Id: 6530db24-e409-4f45-f05c-08df0fa94b49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|10067099003|4143699003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	nx0YIxUiD192QS884Pm7tVFhyzoELVLrOeyg20QbNLv2PRRUwKYECwPwxLJrMLdld/K9jNV9n2ZyZmHNmEdzjqm3guJmBqgxEmABpcdpPyY8YUXWzJz/UZWo0brVNWuj6JOFiMx87+ZWy/zHe05RDZuae5jYS/7LvBQBVAfT7eg6dbDT7RAKA70zH3jNJzJNAXY7GNIdXdg4uiqY8dT3X0D+DsYEuFImNVAfA6+MgZqHTmFyopAec5zCAI+uCB54Lolh/Nt2ZWTGFULRPL4Q+7zuZ/P3CQETw2bqFbxQyalYrPfWMBp4U4NfXI1sqG2uJ2g5NphCktpYblWvmphz8zWbLVxaIkXLXsxGRY/GwuDKu55+Q6CSbhLBWTuKSQzZAKRk5CnYM6BUygOISrTWdRNgB0rJDYW94hWQJt2T+VWUDouHmaUke2CBU/yygZy79RsBC9wk9BFdn0KzK3J9m4c0iEJbmwZj286SWlZEdm0pIXMTe+LSD1r6A9dwM3MGs2lFBQy5Uu29S3TA1B5n28az2oqe6O98ZWk0iIveDbYcfR3/nea/2+q+OOIHrfDNtS5alwR3I+ZxzCOeS6T50PAcFv0PM/xyQufY2hDrunbUkn+7l/bNMOXTT/CADKGwijq2dbVwI0g8TmXx89frD+Sxw3RCAWJSzr9Q3ZIj9mA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(10067099003)(4143699003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnlPSGxHSXozR1pzSnU4WHBiRHlxMFJqTmF2Y3M0S1djeXV2UGI5UWRmOFB3?=
 =?utf-8?B?dzVEcWJZSms0Q0V3MDhEVnpyQ2xkTTFEQS9aOU1vQ29TSThwWWpTaDZBQ3dF?=
 =?utf-8?B?MTNkbmlZUVZWUFlqOXVXOGtCZ1IyaTRiUTd0bklER3p5UFBHVzUxZVhqQUdQ?=
 =?utf-8?B?azNud2MzQldRYXV2RDRlMFgvTFFxRUcyMkJLYXF3c3VrcENoVnhJa2ZNZG5o?=
 =?utf-8?B?NGFhSU9kQzZjb3FpUzBVRjFxRkhkNHJKTEVxaGYrMERTS1lxRUVLNWRSR3Y2?=
 =?utf-8?B?Rk5EZU9CczRZS1kyd3Z4bzZVOHRrSU02MEJqT0txdVdmNmdCdVdYZ2lzRWxh?=
 =?utf-8?B?NWJabTd6VnA4MEZhZWNNS1BaVWpwTTloTlQzY016VXdoeUhUU29sYnlMcTls?=
 =?utf-8?B?NHFlOVM0eUx5SDlTNmZyRW5ML1lpRXhBUGNPMk9Wb2dObHFndFNGSVVtc09H?=
 =?utf-8?B?U2ZqT200N1Y0Z2ZJbG9yUDFPMy85VEk0ejlrYjRYanZ0V2o2TlNWa3VqV28v?=
 =?utf-8?B?SnpRMUFlYXFZa3RkR2JwbXNEVWpUZnhKMXlpOTkxcUhRK1Q2RUJMWjBXRjJ0?=
 =?utf-8?B?V3RsQVR1OTVOSnR2S0hZRFJXdTM2SjN6ak1JbFh3a3krUHk0RmVBY2xHSnM2?=
 =?utf-8?B?MjZYN3A1SzNPcjVyQWdvR1JmdEZ0VmROSTkrZE9Rd2p1YTh0T2FTbnhEWmZM?=
 =?utf-8?B?UFV3L2dRdCtremlMOUlBbDlkcXhER2lySDZaQ2tlaTN3eDBsRG5hY2hUd2Vk?=
 =?utf-8?B?bVRmZ1ZDb0EwV3d4TzZiOHVMZVJ5Z05iRlhXdkJDUGVBMzVYSWRnem93QUtQ?=
 =?utf-8?B?M0hOaWdRd2RzOTVlbFJ6aFJ2aTRqRCt1bmNjZG1ZN1lRd3NpdFJDTEdHUTA5?=
 =?utf-8?B?aVpHbHBzOEVFN0NQQ0pFOTNHSUlxbUUyOHN6enFBNTY4cnNoMDJGUE9hTE5q?=
 =?utf-8?B?SitlRlBSeFYvK29kK1loRXVaZWJ5YVJTK29OWlJXZEtLNEVHYUQ0dHpjS0RT?=
 =?utf-8?B?NW9xR2g5N25vUEFYd0pLL2dyNUhlWnBuVEFSWllvcTlFVEtIK0JHSG5SWmM5?=
 =?utf-8?B?UHdYQmFncTF2M2ZIUHNveTVZM0RvY1FGSys5ZEt2RUZrakc5ZVRnWlhYNHVo?=
 =?utf-8?B?Z0xPNXRBbUxSQmpDVXdHcHRyRnluTmExLzhxMHZ4cUFDaTFJZzFhNk9qNHJK?=
 =?utf-8?B?dEJnNDloUzZQc3RlRlptSGF2NEtUMm0xNW5iNjZObGlMWUhOQSt4M21HV1Zj?=
 =?utf-8?B?N0xTODRURjJuQncySVZDK2dxNVZFMUVvSkJjTTlpSGRWcFBLVjhpZU5BWmJh?=
 =?utf-8?B?QmVuSnd4MVhzdGFIeXlsTjUrTEhEQno2Y0ZiR0hxMytwNXkwYnBVa20vUjVO?=
 =?utf-8?B?ekVRSCt3aTBIZnpYa1pENHBNRU9yS2tZVS9GVVY3QUVqVjVQTjdOUVdpNzQv?=
 =?utf-8?B?Tng1ekZkUFdYcE5valNYRmxBWlo0WWJVVldTbm13dkJwR0hnMGVweUIvbXN6?=
 =?utf-8?B?MzBDMU85WWxFb2R2ZTdMRm1YL09TM3hwaW1kKzdOWWFiTjhwck0walY1alFB?=
 =?utf-8?B?c3B4TnVnUW8yaDZSZG5CYnVZUzEyN3pUdGdPdStBZG1lUythWVUvMmdIMjls?=
 =?utf-8?B?L0hFK2dmT25LTDZQSEppaWFybWRGSUsrM1FUWlVnSGt4dHRjU1NrWklnTHVS?=
 =?utf-8?B?MDNmZ21PNlF3V0ErNGlMUGQ1bUd1dFNLU090blhTUFBJREhzMnJzenlJQW8w?=
 =?utf-8?B?MXczbVFLZXAxaFV1YkQ2N2VXanhrRnUrZjdKOG5nTnFIbmxQT3puK0J1cFdR?=
 =?utf-8?B?aUo0M1U5U21qelZVdEF3akR1UlNGZnVNUkltZkM1Q2lkbnJWZUlHUjRoY0d5?=
 =?utf-8?B?aDNZeXo0OGQrZ2JNV1hIUDVSMHdNSzk0RzdFNXExQ0ZCcEl6OFYrdFNadzZ6?=
 =?utf-8?B?SGlGT3lhMDVYS2JOenJNc01rdDRwVUlQeUV6b0Y0Z3MvYnVJQXVSQ2drU3ZG?=
 =?utf-8?B?bU90a2NGY1oreGY4RTM3dkRFR1NHaGpnTnIrNStyZWcxazVVUXlOUVpsV1J1?=
 =?utf-8?B?c2puS1lTcnFtN3RTU251ZEdPb2xvUkdwOWlCSEQ2WUg0UC85L0psSTgySUN2?=
 =?utf-8?B?RkM2dWJCMXhkTE1pazQ4ZnhZclhpektQUEsrUlZjeUNlbGF5STIyT3VyV1k5?=
 =?utf-8?B?d0R0WjFvS0xYTjJNdk9zNjJVL3ZRMnZsTklkd3Z4Q0dxK2JkbTdUT1BueVRK?=
 =?utf-8?B?ZXduUEJocXBpVE1VMlNmc1ZuQ3pTRy9OV2NWRDNwdG41ZmQrekplVjBlamV0?=
 =?utf-8?Q?s9g4Jm4INxgnPWAyd6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6530db24-e409-4f45-f05c-08df0fa94b49
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 02:06:29.8171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QznZgdSMAYqwPYOYqpYU4A5y4SCwTSA/pNn44KcDJWtscaDoG+aNMUKovCbpwuWM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9456

On Thu Sep 10, 2026 at 8:02 AM EDT, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
>
> Tests scattered through the collapse path decide what a collapse is
> allowed to do by asking whether khugepaged started it.  Between them they
> settle:
>
>  - which VMAs are eligible, and how hard to try for a folio;
>  - how many empty, swapped-out or shared PTEs a window may contain, and
>    whether a sub-PMD window is held to a stricter rule than a PMD;
>  - whether a range has to look used, and whether a MADV_FREE'd page is
>    left alone;
>  - whether the PMD is mapped as part of the request, and whether dirty
>    pages are worth writing back and retrying.
>
> None of those is a fact about khugepaged.  Each is something the caller
> decided before asking, and the collapse code should not have to look up
> who called to find out.
>
> Add struct collapse_policy for the caller to fill: khugepaged from its
> own settings, MADV_COLLAPSE from the fact that a user asked explicitly.
> Every test becomes a read of a field, and cc->is_khugepaged goes, having
> no reader left.
>
> khugepaged fills the policy once per scan pass, MADV_COLLAPSE once per
> call.  That is the one change in behaviour.  The max_ptes_* limits and th=
e
> defrag setting behind the allocation mask are sampled once per pass rathe=
r
> than on every table.  A table scanned early in a pass and one scanned lat=
e
> are then judged alike.
>
> collapse_file() also drops a NULL check on the collapse_control.  It has
> one call site, reached only from collapse_single_pmd(), which dereference=
s
> cc unconditionally, so the check was already dead.
>
> Assisted-by: LLM
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---
>  mm/collapse.h   |  31 ++++++++++++-
>  mm/khugepaged.c | 114 ++++++++++++++++++++++++++----------------------
>  2 files changed, 93 insertions(+), 52 deletions(-)
>

Great cleanup! Thanks.

Reviewed-by: Zi Yan <ziy@nvidia.com>


--=20
Best Regards,
Yan, Zi

