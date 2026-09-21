Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011015.outbound.protection.outlook.com [40.93.194.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAEB318EEE
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789957717; cv=fail; b=JXOBWq15n6vpA5J1J//VoTSobooBjksX7E+u7nTLqmi2mNOAytCPBwLuHXiM9rBh8VC9CUoFCAuc0+4cizdpGCCMS8umD6MJGpQD8sSbMfXaeiyqB0FaseqMVW5c9lusIYpwfi43EAiGX6xIgyChSQTAgTJgGOCwNBbu2z3y06g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789957717; c=relaxed/simple;
	bh=uSEaIrTziSkLh5lFpWUjcvjwYLMPTgaowU0RnVrAcwg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ECXCdm0eVd+o7hSsMbkxJt6PPd1ErSbXPGwlqT07lRaOkPil8wU5QtpKlIM6fGWmIuOiS3ZXBZoX8x+bejbbwLCjrjt+UpFBN6KN4WORiySUgOelHwOymkmzLR/S/AngzaYCPhMrcp5skM0a5ZFzjr1V7fqyOqYivl+wHm5C2EI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nMS3g1zQ; arc=fail smtp.client-ip=40.93.194.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nMS3g1zQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fxM5anxAK2KhXA7EARoBUwSkzgPh8hyWPN5Eh18kAnBfAtkLQTdjtzAqVurTSnTw5LgtikD2uiy8NHQDjM8H9lzDnxnHDcTStcK9gzlHMAu0+tEp5qaqZNKIXiyWgii6Wmz+Mt92r5ZO0uitG+Olmz6LHNIHaQNULrJyBdVbrHUePrMxdLWhk/jET9TEIjohmZTzF4WAkvl1vRXZSVFYCpuBFEb9LrXcgJZlFDqnEhC206Dwl4B6Hdk6nIRh8XMcStaq3cHMWb1piJvV0ery2VgSXMWikzrCGBl37SWJ6CJJ+4yvRZW9rujWLjQlPFc2wTF5y2rEJCSLZvjaa+GzkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97eh6l6ca/PexFZAn/b073tcJjBasi3c+cVODHPaN4U=;
 b=qgMOYFuxm7mOC5mjo8A34RHapWLJlkMv/PWg9dApYNzEdIXAsR9E0wnU13RapKJUhGaja+kAyq2G0pEBaqDZYBLfbb72Zn68vgE16XkJH0s1CAJdT2Eybx8tiZ0Qn+tmfFjoDIYxHRxaZQof54ih3RceCINViWKAyewjM5fyYuG8OcRNh5rDrj2ysgRjgAmPORCqn0FzWbbEd58BiXgmlMrbGTfs8ZCKBxHDxz80jMgq04/5KnJIg+P5EJ5Sy5hpCdlknm0C0BqKuA3ISiuCmff9pIE83dpLn6XIz6alinM+oEJSyJw3Bz8/CfSEt/IPtD/92dLDNU+Hw3BkkO36rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97eh6l6ca/PexFZAn/b073tcJjBasi3c+cVODHPaN4U=;
 b=nMS3g1zQ6bJ3BzcLLgFxXfU1EnR7Zrfwc+g2jhCKou+PDNltufVDhtvR0ImuzLAhPwp8a7YHv5fv+KAEALah8Nkx4snS5QA5yCk/3QMTdbKemPq14GWpvIMNSowSnSfXgT42veb+WvDXdpUMY9kKUlxUyGBD0Y7/PJWv7aEpkEWt8hc8Crimry/qNWuMkJYM0C6qOf2WS0i9FqRHP3NF2RRnK1spJ6bZt36XHqjiihl4C0OhYMDZ/gAmGnf7aByeBJKfOxNP7Y56qYwy9ZnIAZa4fclX/HlBjDqEQ9BWPlBQRBmh/3fKgb/MQ4V505zP5ivpuc9KORaa+iVTQch6fA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by DM4PR12MB7719.namprd12.prod.outlook.com (2603:10b6:8:101::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 02:28:25 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0428.014; Mon, 21 Sep 2026
 02:28:25 +0000
From: Zi Yan <ziy@nvidia.com>
Date: Sun, 20 Sep 2026 22:28:01 -0400
Subject: [PATCH v5 05/17] mm/hugetlb: use direct assignment instead of
 folio_change_private()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-remove-pg_private-v5-5-bb68b6a21869@nvidia.com>
References: <20260920-remove-pg_private-v5-0-bb68b6a21869@nvidia.com>
In-Reply-To: <20260920-remove-pg_private-v5-0-bb68b6a21869@nvidia.com>
To: David Hildenbrand <david@kernel.org>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Muchun Song <muchun.song@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, 
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
 Gregory Price <gourry@gourry.net>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Alistair Popple <apopple@nvidia.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
 Kairui Song <kasong@tencent.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Zi Yan <ziy@nvidia.com>, Oscar Salvador <osalvador@suse.de>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: BLAP220CA0020.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:32c::25) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|DM4PR12MB7719:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b42c40c-a04e-4220-6a05-08df178803bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|921020|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Vxez3A1L6u3eP075yRyU4lHAIdv7D23z8uVwqUcbdw9Mlk3j/oviLss7UOrms0EKv7ZnT5iACjU2yOj2keGwKjAX6znG7IcAaNGiG3uxvloEfKiz80zr4JvL6BgDHeYvZRJbQi2YWrI8ddMGGKvZCyHxZfxDcqRvP4XIVAVSWw2n8X+3LG/P1GflRRNWIk4LCZmvO/SxWk09UaMp7St7RXGcNwRE+pAZP+5YDxQSVzf+eAyTvRfAcIjpnpODARG9LABQDyMxbTfr2PTzLZmQWslAcLoOHp6o1DmPI26lpvlBK1wlSPQOhz0cz3q+NEAFaJ4XeEeVwduQZ5DJhxO5EBwt8fQlJJCp5sMPps5S5LokfDTl2XqJyIrHHoXJjRyZt4wAZdg1LXOJEfgxZGsqh84zg0BKLQaLywOX6qIUJ9pBoJ2lSIvTwc1AqRQZbAwMHTPzPvxDHk/3kzyPxQnvxahB0K1OXjTHX4H+f7r0ZMFD8P5SAxczjalyhbDAnGibcxZhronu0FByiBECnoPkeTyYCUZSB3TC8e+/bD96YdwXWnV7PpzbD6JdanhsKgOBtw5TYrVk3woJHyqTvXB8iC1cldwHWAmZTNDFItYBEdlHq0rt/C1xavWFOUpeEDEGA3gSKu0JPrLLGCD+SZx6sPNcCJCGQFQCglPEY2XqSVWhtUM/z3WBSmRS6dL7Gk3q85f1vsv8IqMTBaUxgMkzuQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(921020)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmFWbHV3bGNlV0JndXpURDFmY0ZzY1VBdmNWRmdmenk5cEU3T05uczJvcWtu?=
 =?utf-8?B?bEJkbS9oc0w4Ulh2WnRwbXZaS0RjVXRnUDlDUGtvaFhZUWczM2FaeXBiMkhN?=
 =?utf-8?B?SWQwSW9PMjh5Z08zeHhZeFR2d2lCdllXQTVndmFqNURsdzBrYmZ4QTNuZ3BL?=
 =?utf-8?B?ME5vKy9qakFSSGVReC83RlFuRVhJc3FFUmMrdEdGamVTbWJqMG9HUzN6NUk1?=
 =?utf-8?B?R09SR0Q0bXF0TkVnWlZ3dytkSGptVTc2L1ZFUUJDVVoxaGdodnN3OEt0VEVC?=
 =?utf-8?B?bTdjc015Sy9BWWpsL1doTU4yUERBbUJVWEVYR0RNOHBPSFFLNXFRMTZLaUZn?=
 =?utf-8?B?OFdwcUFhS01Pdnc5b3J0STNuWTlxOVk0VGlQY2VQaUNvU3hzK3FmZWs3R0Q2?=
 =?utf-8?B?L2ZoTi9uWWRYZU5nMkNNTDFmMU9JdlBOL1BPM3FScEo3dnMxZnNKRVI0Kzdh?=
 =?utf-8?B?dVJmd1BuTTNZbTZJSzJkRUJtaDhEQVN6QkNjS1N6MThvbnJpVTY4MDUzckFQ?=
 =?utf-8?B?bGpyKzNWakhFczNZSnYzQjNEcVJuc0VvcWNVdFJWZkJCTmRhMW9wYTZMcFg4?=
 =?utf-8?B?dkNrZ05Uay9YbnhINDRNaWtIclpiTmpOZVY3UVVvOHNYeE9XWThZT0VKTWor?=
 =?utf-8?B?ckZjYkZRY0E3M0RvREdSaThlVGprMHQ2TlZqWCtFcGtlVi94aTBVbTNoUDlV?=
 =?utf-8?B?ZzBlUkQwMlA4anhoSWRLYTZPcGY4aFhBa2t1QmsvS3h4T1pNc1Q2bWpzZTFR?=
 =?utf-8?B?dTJVZEYrT21vb2lpUy9VNERodjFudlVUS3FaNWxIcURBcGFXSVlJdExGMkRu?=
 =?utf-8?B?NXB4Uy9TZDlLS1YrcWxaZDBYclBMV3NHVTFzaXRrKzB6bHFrWnpXS2x3eWFE?=
 =?utf-8?B?RWpGRXRPL284bklCQ2pQWWNua3h1a2VDU1Zaa3FrK1MyQ3ZXSHNmamphUjY3?=
 =?utf-8?B?eE1ZdEpHb0tOc0sycjhJbFdpakVZc081TmFJa3pEVVRKL1I2UE5ySlZCZE9z?=
 =?utf-8?B?UFQ3RmFpRFdUdlo5ZEhFSzR5VDROWlRaVkUxaWxtZmpRbUFxMU9oZzY2N1lE?=
 =?utf-8?B?R1BIK0lGSTZGYnVwUGxzVWt2YzluSmdMWlU2ejJ1YXVVR0hTK1BlNkdYTUpy?=
 =?utf-8?B?RFlKaFU2VnNMM0ZJU2FadFlMYzZvTnBZOTh3eGs3K0g3K3VVcEFJVXE5MHJk?=
 =?utf-8?B?RDUveFduQzBUc1UvTTdMdTJ0UUFaVXE2alFaMVJDTkhrSGtRbU5rV21mSTdo?=
 =?utf-8?B?cWhvOENZZVRRb0pqY051SXhiZENPUWg3NXVsQ0Q0UXJSR3c3R2xiczhVSHJk?=
 =?utf-8?B?ZENoWENKZ29zTzlyUWxjaElyVktTelZpZGU5WTFFd3R4aUsrS1RuRXVaWDRD?=
 =?utf-8?B?UmlDQ0hoRENwRFZFZVl6M1k3Zk02c0RYTW10STR3RjZ3WStxTU5Gc1dBL3Vq?=
 =?utf-8?B?ZGVuTGIrSjBXUmZaNmp5UkNvNk9ITUVaQUtRTi9TVTdlVmUzWDdzUjJIcXJG?=
 =?utf-8?B?Q1RCdXRFMFlmd2xXRG5KdG4raytsR3dpSG5heXBUdENrazJLc3FUTzUzeXVD?=
 =?utf-8?B?WGs2ZnludEdrd1g2am1NdHplT3pCdjZYRE4wclNEbnFHWlRvekwvZ2R1cmRs?=
 =?utf-8?B?Tm5DV2VzOXpSb1I1NjZWR2RTVnYxNTNha3Bub29BZ0s4Tm9zbDhFRGsyZmNP?=
 =?utf-8?B?cS95VzEyMnNNT0NucmNpaUw0M1U1ZG9UN0JxdFVhSFllNzJQendBbVBLT0w3?=
 =?utf-8?B?cEFLYXh4dmdjS3h3bndlajk0c2xaWVV6NXFFSDJPb0JXQWMxbm9Uc2FxRVZL?=
 =?utf-8?B?emVTWlBHSzA0cm1PWmFQSjdPQ3ZFa2NFSEpvOUV2SDNvTU10MTR1ZGtlajIv?=
 =?utf-8?B?ZHBhRUx1ZTRPYkN6dTQyMDAwZnh1NjhMOUlSSnhmU0tNNWcvZmtmMlI4ajJ0?=
 =?utf-8?B?SDJxSHFTaUM4d1lid3ptRTdqMjhuRERNY0NzQnlYYlVWM0RUQnIwTXF3M29S?=
 =?utf-8?B?ajYrQUlOcEVOOVlqUzVQSmM2M2V1SzZzUWFUdEhkcCtYRnNoQXBuY1lVVzVZ?=
 =?utf-8?B?NXdrVGJZOHQ3K0EzVGtaWSs4RFhGaVBqQkVCaFhsY1ZZelBpUDNGbWZsV0NP?=
 =?utf-8?B?VHV4QnQwcXg5dUgxZFFzMzdkRHdYaFU4eTZUdjJyOHNtTGdiYWZaU3ZUZThu?=
 =?utf-8?B?RnIwaXhIeit1UDRvYXY5M1E0c213SnBFbTM4SHcrVnh4c2lKeXpsUTgyOVVB?=
 =?utf-8?B?TFc1ZVB6ZmFxcVpqa3VtOCtEUWtWd0d4cTl0OWN5M2l2eEtIejR5c1F0WEhL?=
 =?utf-8?Q?XlTvHV93WoTfPhaZRF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b42c40c-a04e-4220-6a05-08df178803bb
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 02:28:25.7081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aoyc3uThrgPBHCmaZSWhS1Oa7lpHpL/qk50BqEa5v2wuvXyJAwswaHmj9FVHVNjm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7719

folio_change_private() should be used along with folio_attach_private() and
folio_detach_private(), where adding and remove ->private content requires
folio refcount change. add_hugetlb_folio() simply sets folio->private to
NULL without refcount manipulation. Change it to direct assignment to avoid
semantic confusion.

It prepares for a future commit that remove PG_private.

No functional change intended.

Assisted-by: LLM
To: Muchun Song <muchun.song@linux.dev>
To: Oscar Salvador <osalvador@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Acked-by: Usama Arif <usama.arif@linux.dev>
Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 mm/hugetlb.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 2003439ea13c6..7b27c3c5c3e58 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1446,11 +1446,8 @@ void add_hugetlb_folio(struct hstate *h, struct folio *folio,
 	}
 
 	__folio_set_hugetlb(folio);
-	folio_change_private(folio, NULL);
-	/*
-	 * We have to set hugetlb_vmemmap_optimized again as above
-	 * folio_change_private(folio, NULL) cleared it.
-	 */
+	/* Clear all folio->private flags except hugetlb_vmemmap_optimized. */
+	folio->private = NULL;
 	folio_set_hugetlb_vmemmap_optimized(folio);
 
 	arch_clear_hugetlb_flags(folio);

-- 
2.53.0

