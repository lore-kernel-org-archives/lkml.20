Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010059.outbound.protection.outlook.com [52.101.193.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDE555C318
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788881360; cv=fail; b=NjCJX4/WIpA/o6IYbjX/g16/2pMDEJY2usO2q+CZYHcrs3Mp2JYb/LDHUSV2bsytfyvocdBD9iUqsncGQRwEvE1VloJfahl3EQHT+iGGT27R8gi+sPxXi+5Bj99xQOsGRDSGmmGEIjEHg8BPmrt/vUq1RxaJHX+mOu6MI+GyMIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788881360; c=relaxed/simple;
	bh=loX0CJnc2a4hjVorKOZzmqrJFPhUgcLe0vGAQ794xbo=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To:MIME-Version; b=TbQBZQW8jjh3bxrgCWLzindQxfi96b+9oUQFDffbqD0ohLXtDetLmpFQwP1Eh5sM2cQiVQnGVEmY4bD816Bu0QWw7aRsxj/hIw/yZQ5cndV8+wHrXAc1JEw4P18b/jRrXdHTU2jfu+UrcR+N0U5SeOEOfpoAJWh+8qiydnH0HjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=n9NqWbt7; arc=fail smtp.client-ip=52.101.193.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="n9NqWbt7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gZRZ3t30nyRcK5Z4NzbXbOaCk/krQB4JN9NyDUZySluXU73vy6W5J0lo2aryEe/l13Nl4ThGiQ8Qt+eo5H2U2UO9i2sx8w8SofaR1392NxevWpA5FrccvAqP9P7ZiRYnFluO3eZpWSnRCcxPzQa+2L/KNiTxMT/hsebVBRRODmtk/XBQj2QTIGI3ujiJo6y3BW0MsZzaFVdr3ZRpOWEPgZW6dk+TDmiPPLOcXcyy3CoRh7CpA2i2icZiakN4ivZphYYwnVYaq5ebOhVrEdNZ3ljiHZEahtJ0tzhfw87HiEfqbIgEn+MoRXJJBU6vuriGeEl3Y/HhZlU5A4CSKthK7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xYdfURcM05Srfne0YBFdTtcAKg4K3aTt02JcmJL+IRw=;
 b=VvPX/ewBl7AUdU5vlL3pATA0kL0z8fuSRJ2CiieRYyyhcjERkKeIUrMysZMN3WoXktXLqliUmzfSMON/95PMVIWTJforI6rqnoKaQi1+gNBvKC/QIxzKoMb60IMdHKkUtJCfY93R03JfmkQTyUYha9Ya5ov4prJUn+eeP6zWwN3zBN+iTKM3vHhvnvLQ0QbmEiK6ozov/PkNv8PCA75rLFyBBF/dJjX7dc22pTiRUozcI9A8+rVGxoseUmFIZqScIk+FTaCJbIaKAn0UZIJ7WEakZ9bgTsDqsikQHpt1zd589AB8CkX85s/QOdWcQzPoYQP7mlMfwmmpimvglJgo4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xYdfURcM05Srfne0YBFdTtcAKg4K3aTt02JcmJL+IRw=;
 b=n9NqWbt7U7jYTLTm67V5ufJebAnkYaJ0liYvEEacJu7ybXPaTL4thJG/uC1m4Xhqoq4zUG6eIHMG7WfP5sCPfo5+vLrUrUcLpK036munaF3P+JiB8aALZS7p1fHSfqSfjDSss3VNFTA0Xeao/D/vsu3Kx3b3Zo6/HOf5Rl+0ybzhXoFGWXFKWO7I1vxrBF89Yo2lLe3UHkIrOD7qErqUjHlNncqm1NbMK+lU9W98gcsCJLzo16Dg+QSucKeoedmSOJk8RWYrUENKD7Um0tm0G7WYKOS+kz+jbPiqlaZvErlNUcYKInhUoT1RbOAXby77aIVJiezA8eAwSXXoM+qkrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by LV3PR12MB9216.namprd12.prod.outlook.com (2603:10b6:408:1a5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Tue, 8 Sep 2026
 15:29:01 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 15:29:01 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Sep 2026 11:28:59 -0400
Message-Id: <DLA1IE5IS2R3.3GCTKEF3YX83Q@nvidia.com>
Subject: Re: [PATCH v3 05/14] mm/hugetlb: use direct assignment instead of
 folio_change_private()
Cc: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, "Oscar Salvador"
 <osalvador@suse.de>
To: "David Hildenbrand (Arm)" <david@kernel.org>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>, "Andrew Morton" <akpm@linux-foundation.org>, "Muchun
 Song" <muchun.song@linux.dev>, "Lorenzo Stoakes" <ljs@kernel.org>, "Liam R.
 Howlett" <liam@infradead.org>, "Vlastimil Babka" <vbabka@kernel.org>, "Mike
 Rapoport" <rppt@kernel.org>, "Suren Baghdasaryan" <surenb@google.com>,
 "Michal Hocko" <mhocko@suse.com>, "Baolin Wang"
 <baolin.wang@linux.alibaba.com>, "Nico Pache" <nico.pache@linux.dev>, "Ryan
 Roberts" <ryan.roberts@arm.com>, "Dev Jain" <dev.jain@arm.com>, "Barry
 Song" <baohua@kernel.org>, "Lance Yang" <lance.yang@linux.dev>, "Usama
 Arif" <usama.arif@linux.dev>, "Gregory Price" <gourry@gourry.net>, "Ying
 Huang" <ying.huang@linux.alibaba.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Johannes Weiner" <hannes@cmpxchg.org>, "Qi Zheng"
 <qi.zheng@linux.dev>, "Shakeel Butt" <shakeel.butt@linux.dev>, "Kairui
 Song" <kasong@tencent.com>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.22.0
References: <20260907-remove-pg_private-v3-0-6ae22f9d9272@nvidia.com>
 <20260907-remove-pg_private-v3-5-6ae22f9d9272@nvidia.com>
 <54d6b1f8-7fbd-4a08-a9b1-a688f75d82cc@kernel.org>
In-Reply-To: <54d6b1f8-7fbd-4a08-a9b1-a688f75d82cc@kernel.org>
X-ClientProxiedBy: YQBPR0101CA0350.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6b::24) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|LV3PR12MB9216:EE_
X-MS-Office365-Filtering-Correlation-Id: ff7b035e-1626-4ffe-cf45-08df0dbde88b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|10067099003|18002099003|22082099003|4143699003|11063799006|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	WhAxGEsNMT881N+QcRUEU8QHggCR5cu2rTU8Jd5mnAiXnm4vtpGlIaXQZJ5MbMxGrrbcpcVfIxNshKimy2pf+SswT0A7OjBh4tXoLW+YTZR+rBRFy7OQchHrPrdadJioWG7S77fnnB+25AAU0CYtWSA83NP6jl1CzrIEvVTHcbhuWmaJ09pSAE3ZFB/9LqD0T77BA1jyYd2SVP39qWNkriVqRi6e+IBe9dgO9/BFO/oaS7gIhLFPxIJJpK+oBAb7VK5Bv1wXxMhiPBnxq42lvW2k7JWfoKPXfQQoGIu8HvZOPxNZ8W4B5VzLyLml25KEkBzcTUP/S5DS+j/0LP/VJiHg58u6YHctK0vAJL9UNiIwVaeyeOVUD3152NL/C10lH5umTEZjf++ZeNQ6ZNm2TN78+XUL8OFWQx195wazPBLpGx4u2IGH+r7ikOO7XzQLhMmDjY9IfRhCG+tZHhZbPzCcqQEihoM+Cbe3DEetUM4ELhcZmghl/sod1U86AkhQVAQGiuwLxhzoPZnrDZjE4irOr+1b8Mgrbxzs17//zvfGFmNdI2i6taGoBLYS8B/aJBkDaIG+svfDYuhXA7rIxOHqhr2qgDcjArrSCaceT/JQ3RnSeN5CIBtwbuvj24/cG2DtYMavo3tmk+nhNSU6yAKpWRU/rzZ1Q5aGCUtKJobAR0WGsXpRJ6i6MBnTtazD5TopDb7FDOg1j3ktjHaVZw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(10067099003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWQ2V014a3RhZnJ0TzdqOXdsYjhRZEE1QXBpQmM1TXAzTUhkQlZUbDkxcHdZ?=
 =?utf-8?B?THVIZUdHWFFXU09SVEtSa0YvNG1ycDFMZVloaUJ6ZTZzWUhDSS9mMlhsTU1B?=
 =?utf-8?B?OC9kamFYMG1ETkdvSjVtdWsrZHY5M2JqNGR4U0FzZUtPSWZoZXBzQTUyZVha?=
 =?utf-8?B?WDlMbkNZRjMvRzlqejJrOWZZTHdMWUdNZWVPbWZjemNBZDE1dGVISWZSditI?=
 =?utf-8?B?TXRWQXNxcXpRNitKbmthUHk3amRzSlA3RFRwZHIyWW84TXk0MkdBc2d4Nmxi?=
 =?utf-8?B?YkpoUkJBbUdlcmc5MVc4UXJaV2RQSGEzQTdESGo1Y0RLcU9CdHVFWjMzU2dv?=
 =?utf-8?B?VkVzNE9vVHBYY3dnbjF0QisvemQ5czQ2dnpmOGFOOXduMVpYOHpKRU9FbzBv?=
 =?utf-8?B?YjN4eUpHNXBHb0crK2xQQXJqZmFmTElJSXN4Q1BRRlJHSVRWQzlOb1M2SXFu?=
 =?utf-8?B?ZHdqOTJZT21BeVJCaWdLZ3QzU3kvUnNNWWxaWGVnLzBHeVV5LzRjT2FpUGlt?=
 =?utf-8?B?QSs2cHg2dTdybGFVZ25uRGMxVDJ6UnIxaXJJdEhmWWYzdVlkOW1yQW9IYXh1?=
 =?utf-8?B?ck91YklEZ2tyaUxPMklWQ21BUk13cENVcHliRUtmYnFyVWJON3Bsa0NvZ2NE?=
 =?utf-8?B?QzZUUjBwQmo3YXl4N01hVFcxUDFSZjNPMnoyYWovVWVYdld2cmJaaVNzaVVv?=
 =?utf-8?B?YXRvQjNTQ1RlMFBMcCtsTGZBc0FheXNVckwza21Tc3hHN0NrVTRUZEREbXRL?=
 =?utf-8?B?VFNXMGJLUTU0OW1HNFpSSkh0TlJtQS9ibmIzTkdtUnVRbmRTd0FGd25GblhY?=
 =?utf-8?B?cEpNTjBFUEhpRmFUanM5VUxhMktLVFI0aGdPSHdjdmptYUQvaTZDNkJPNVpu?=
 =?utf-8?B?K0lET1RqQ0wxNDU4VjFGcXVnMFBQR3hTMTMrcG43b3BvZ3lKL0JqZG15cS9T?=
 =?utf-8?B?dEZMU3dYMk9HdDNrNXZPdHoydUxrZGVYV3VHMHJJWklXaFM4RmErdTFiSjNI?=
 =?utf-8?B?UGRIVENERGM2cFRGWnU0V1dkMThLMWJKUkpNTkxRQ0ZrbDJiZ1VhMStaZTdn?=
 =?utf-8?B?VVFZN201QS9NZXdHRTRwcE4vaWZMeElDWGpHR2dhRmtCbHRIK0JUSUFWNnBq?=
 =?utf-8?B?R1JiVzRlNVUrRWVJVncydVZrSy8zS3JtaERJMzF1ZXFQSnI2MzNna3I3c3lJ?=
 =?utf-8?B?QmVjcG9CWFYveE1ERTRxTzdWcDBra3BMMisrWDF0U1JRODhCYVI1OHJHZWk4?=
 =?utf-8?B?OFpuUDRkRGpuV1UvVDlKWWNDVFpDbnVJWm9vYkNZV1F0YVNXTVVXc0dDWjYv?=
 =?utf-8?B?SDNCSmx5Tm9UdDl1bUw3UDV2eDFPbEYzTTNrVVpDT2JMd0d4QzRKeXdBQWZC?=
 =?utf-8?B?aE9XRUY1dEdqdkt2VEo0OFdqYWk5RXNVKzViVnhyTkFFeXRsdStmYmU5MUlE?=
 =?utf-8?B?VFN3T0FudnNpME1ha3JwVStYUGtkRTFtN0grWHdGTVZvbzJlTk1nblRCOFg0?=
 =?utf-8?B?eTNNWHdtaUFKaVRsMU9NZURhOFJJazhjK0FSTFNFWXMyd3BlQ0FOeVNOVnFY?=
 =?utf-8?B?d0tlUGNFZEMwUkpwbnNpZ2RvZXZpWnh0QWl0KzBGTzlsM1h2cHgzaXJuRStN?=
 =?utf-8?B?RnFGTGMvQVRQVi9SQkp4bDQyU2JROVBVTDRiZ1p6clVwL3N0RUNqcllHTEh3?=
 =?utf-8?B?amhlbGJOTEtRRDAvaGNwdEdQcWVOZXByTmFybVljdnRCb1lqMnp0WGxwU3lp?=
 =?utf-8?B?VnpFdXhtblYvT3F6ZW5seURVak55dUFpZjRDTUpXb2FPMDUrYTlJeFM4SHl3?=
 =?utf-8?B?Sm1nblN1eEw5cFVZMnBiZ3RzNzlJc2hkb0lyVERnblJVUWpPKy9VVUg0Si9B?=
 =?utf-8?B?K3pIZE5YVTU2Q3o5MllDd2xWRm1TSWcwSWRwclZUWTNwcy9qNnAwVkpKQjJK?=
 =?utf-8?B?KzJYeG1GWURsakU2TmF0K3g0Q1lFbWEzT3lTc2ZOL2hSKzljZ2ExUk5ZaTNI?=
 =?utf-8?B?N1I3RW8wVUZNYmZFN0VjYzZ4SkkxYUtHYSs2Myt0L3BOK0p3cy9naWdaMXpM?=
 =?utf-8?B?OThxYWhFQW54bWt3dmFUOWJRY0hOZ3NFSnRFOUlkOHdBL0pJT0dNUlkxckY2?=
 =?utf-8?B?MXE2b2dBN280dndQRjlGRGtXU29SOERGMW1YQS9PNE45eG1NVit3a09lSW1o?=
 =?utf-8?B?NTkyRUZMZFo3WTVoN1VLcjh3cDZGOHRrWlIxZU5Id1FXTWl1NUYzdktkb21G?=
 =?utf-8?B?VXMwUlErYVM3MURXLytPN2M4T2lhOTBBdk0yMi9tcWxDMFVRVll4SC9xejlx?=
 =?utf-8?Q?8vS29PDwMwshn8Rgla?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff7b035e-1626-4ffe-cf45-08df0dbde88b
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 15:29:01.2807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wNR3hBY/kuhB/Opal72Lu8vRMkW70UzYufgqky2ACddA8GjIdvieP/qJAcbIe5Bh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9216

On Tue Sep 8, 2026 at 11:26 AM EDT, David Hildenbrand (Arm) wrote:
> On 9/8/26 04:56, Zi Yan wrote:
>> folio_change_private() should be used along with folio_attach_private() =
and
>> folio_detach_private(), where adding and remove ->private content requir=
es
>> folio refcount change. add_hugetlb_folio() simply sets folio->private to
>> NULL without refcount manipulation. Change it to direct assignment to av=
oid
>> semantic confusion.
>>=20
>> It prepares for a future commit that remove PG_private.
>>=20
>> No functional change intended.
>>=20
>> Assisted-by: Claude:claude-opus-4-8
>> Assisted-by: Codex:gpt-5
>> To: Muchun Song <muchun.song@linux.dev>
>> To: Oscar Salvador <osalvador@suse.de>
>> To: Andrew Morton <akpm@linux-foundation.org>
>> Cc: David Hildenbrand <david@kernel.org>
>> Cc: linux-mm@kvack.org
>> Cc: linux-kernel@vger.kernel.org
>> Acked-by: Usama Arif <usama.arif@linux.dev>
>> Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>> ---
>>  mm/hugetlb.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>> index a69bd463b1aef..08a538739d785 100644
>> --- a/mm/hugetlb.c
>> +++ b/mm/hugetlb.c
>> @@ -1445,10 +1445,10 @@ void add_hugetlb_folio(struct hstate *h, struct =
folio *folio,
>>  	}
>> =20
>>  	__folio_set_hugetlb(folio);
>> -	folio_change_private(folio, NULL);
>> +	folio->private =3D NULL;
>>  	/*
>> -	 * We have to set hugetlb_vmemmap_optimized again as above
>> -	 * folio_change_private(folio, NULL) cleared it.
>> +	 * The hugetlb flags live in folio->private and are cleared by the abo=
ve
>> +	 * assignment. Restore the hugetlb_vmemmap_optimized flag.
>
> "are cleared by the above assignment" ... isn't "folio->private =3D NULL;=
" as
> self-documenting as it gets? :)
>
> 	"Clear all folio->private flags except hugetlb_vmemmap_optimized."

It looks better. Will change it.

> 	folio->private =3D NULL;
> 	folio_set_hugetlb_vmemmap_optimized(folio);
>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>

Thanks.
>
> It's also pretty odd that we use an atomic here, when just erasing all fl=
ags ...
> but that's something for another day.




--=20
Best Regards,
Yan, Zi

