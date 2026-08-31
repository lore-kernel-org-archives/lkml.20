Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011032.outbound.protection.outlook.com [52.101.52.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CEC37BE63
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788204366; cv=fail; b=IuU/4qENgzC4EdYTWpYt+xqDNkGFGoBXrvYwqUZ1APU35u/NLqgUv4V8R+TtwP0vTTxovvsGswgMvtRtoLVgppnyltf7yPmhUuJ6pc3CJj2SVHlagCCnr4rjjBevravvI4MvygqY0QKWIHv5tR25fbVncVKjuXG8ybnKc4p8ico=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788204366; c=relaxed/simple;
	bh=8jlFdDODyZlFrhTLDaeGC0klQCsofdQZAo9FGoa88FU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=aESCtOCSNPjJHDODtrpIM5rb8vDSjepCfm0Zi/E1M1/n28XKTfg7C2t7++L8GmDHJrwclsu71YNJurIhRviHCfkBxfyO6LxKztFvsVo3i+aDN+PoeETEfJn2YjrAsRX/aeiPvU7oZpSh8sopixHDEyewb+6OM1DKDDDkGiqmX18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=edQ5/6Tj; arc=fail smtp.client-ip=52.101.52.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="edQ5/6Tj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZaQIo8u6zhHq3L6VlpizFkdu93/wYAvB1f3bFi3Yb8NLWfmFpePf79ZoWh3AXVMat2j/kUqStdTkcqsL0U8TZJDPkv5f+CXaQcQy0PGfIjtjKZ3zt1vMjbS94I//BKUjGS5rW5LxjCwptbvne+8RdecR4frJXlOx+GlMRzejbjMxHi6l4wN35YWx/9R05tQOckMQdhnwpaQyUntYNwwDKzHTmLW5beuSAXQlZ+ljIrxqvtJ08YXJUxYb1jlhQJcLSbGAWmwluj6M9W3OPHWP+febz5ptmYuhYBDaGNJrR/49Wak/1py/HlP/1YWo7DqB2tu3Irl98wAEdrf7mn2j3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ud/5c5NQOwKcoKiwoMOzwwhJ2lktYT3uPQHkeLYi4m0=;
 b=LdQHPAZXTl2VJ2MHlJ5D9Ijmfo/zbkwDya33txyZhtP1F+L2J+LJur1rerkVqmjJfkzDX+M4jkS41nN/OKrS22R4P9K0DzCbcsYun1ar0pA5ep2Nx8jywF/GaQeoZZUGcXrRUTFGHiFyMRBp8bsEcShGcZ5KR4iqlXawwyG/jbfp/PReiWWYmROPMKqUkxiLQ1i5gk3F785vQ4ejaCRvhuOWh8icOOCy+5LZx5fgLd7Gv8FrgqJXAad/LfCaML72TqhVYRdpUjzbFS1mLR333oTRInGhkgJzcZUJsA9Qy9HB7h6Yc6hwzXNg910xyoaG/vFzJcHPQqwsBzuQclsNLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ud/5c5NQOwKcoKiwoMOzwwhJ2lktYT3uPQHkeLYi4m0=;
 b=edQ5/6Tjll32gUNg/nQQg+j6m6VEL9z1FOw/cvDIRED8Vp+x1AKipgT9YBe/DM0TqySbws2L2Hc/cd6p6Q6EMbl29Eke+XGQD+4SYvIxuQxbKcm73LYOUcXyDWn5ApoVqBeazca0RcYHrWTAtFdakJkM01FpdA+CNypjExvI+5RzwnXDG8ITeb7nFmfU/uECdJSUQOzAZ2Bghwgxxs87RXdUD0/6jgUrjuSetvQC9AOUY/8eEKSDoK5AYtuTGEGQDOngatB6DBJzDeYWvS/8DtxwRo2tIoPeMzpcT6PtDVyMNfxJed7hpCIqVYazLPlgDIB9WYzqfOXokFLXxQC14g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by SA1PR12MB8742.namprd12.prod.outlook.com (2603:10b6:806:373::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Mon, 31 Aug
 2026 19:25:49 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 19:25:48 +0000
From: Zi Yan <ziy@nvidia.com>
Date: Mon, 31 Aug 2026 15:25:28 -0400
Subject: [PATCH v2 05/14] mm/hugetlb: use direct assignment instead of
 folio_change_private()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-remove-pg_private-v2-5-3668159cd9e8@nvidia.com>
References: <20260831-remove-pg_private-v2-0-3668159cd9e8@nvidia.com>
In-Reply-To: <20260831-remove-pg_private-v2-0-3668159cd9e8@nvidia.com>
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
X-Mailer: b4 0.15.2
X-ClientProxiedBy: YQBPR0101CA0186.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::29) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|SA1PR12MB8742:EE_
X-MS-Office365-Filtering-Correlation-Id: fd467de8-06e8-4053-fe0c-08df0795a80c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|56012099006|10067099003|11063799006|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	BL14zDQDiHxEMjKvnOxmbBNELQxYNkNetC6upPDP12HpQJGeu0+qeTTsmIS5TapNFL1P8/dVYdXMNwcEKJFSYmAm8lJIKbka/mI4GjVvL/6uT8rXjmxLS34OeYo/ofyhiXhBBqOms+Uzo3+00QihIU6HLzzNOju1C8qVZ5k9S3pE4TuzHqdpdKwW6ZT1f3NqUbEBPke+MTBtmoWEgyzwd3uhNi7fSvNceEbvJjgMPJlciNPhQtSN7+eTmVwWTT0Lj0aYgGaJiYD7mSsp4f/I/55vtOx0Htq4vzmMQ7ijqcAFKCB64xQl5wOkwBmipwz5fvbD1h9AkdvVaptAdvM5tQecywo7ZMQUVfoVDiuNtaGCZZFaPVa+y0HLA+QE+DmAfhlL281t01GeeY0QowPO9755JjdghTPAibx7j7/pVoWVE0TaPELAZ8sixbP3mWJ0EnnaX7VG5/bIiY5fywyt6zZnUGVggzaE6A0M+ycNAekTXhEG3I8N3Mb88EykHeM4hry0hBcNtJTz4Hh9YFNFvjFqjgx5Ch+EJv3kYPtGqrX3PjPDd/nrs9ZHapcxx7LvVjigJgJ4azJOnDMIHIAVHj7bLxqDDgEvI9NnqeMZ8RAEviErlzHbKPKi04B7n1AreozmQvuupiLc7wjwWIvuifPy9eegKHmd9AV1pVNnrXD56YhB4UUuEIEaIRL7m3BIDk0G87FmT5snOYYrJsaO/g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUZRQ3JhRkxSOFNQb2pmK0ZmSE1vMzkvRnhwQ21ncG4wYkNYdE5kVkliU3RX?=
 =?utf-8?B?ZE1TVmVNbVB4NkZMcE5LV0FzRnVLOWpNMEpYM3N0V3R5Vm1BZkdwU0ZNNUQy?=
 =?utf-8?B?V2U1YnphMjFhMXZSY0llU09MSHpKclNWNTRNMWNQd3Rtclc5K1NlVVI5VDFL?=
 =?utf-8?B?cTJ1UDd0M0ltNE9ITXRXMjdLZmlHTGR5TFV2WUNhbkhlbmpqd3FiMGVzV1Qw?=
 =?utf-8?B?Wm80djgxMnRibDgzR0puUkZSa3I4cVp6RTBEd1NrQkxEU3V3VmQvTmd3RDVK?=
 =?utf-8?B?ZmVlTmdyM3pwZ2JUTGltQWdVN3FaTHhVMHFkTWpLT0EvWHA2WWV2LzJHa1NO?=
 =?utf-8?B?d2JFTDBEZnFNeWREVnR5Z3pEYXpGR0dWUCthbjkyK1VGeHYzYm9YMjZkZlUz?=
 =?utf-8?B?SUNWdnN3S2VGZy9KV0h5ZUQxdDVZTFBQUUtNdGE5YVEwVVJCWXd2YklhdnRi?=
 =?utf-8?B?eEp6TUh2dHY1dXBOSmozYzF6d1JFQWNYV0dvRTVNUE1JNldKODVSQkJSWmY0?=
 =?utf-8?B?dmJKSm55MkpCb2VlRDlrOVpLaTlVamdNQVY0OFVxZXJPcXdoMFNKbUVWZTB1?=
 =?utf-8?B?NmJNVDM4NE5zQmgrYWFVSTNzL2tEdktpbExOS0VLRXVoeFFCZXdyVCtmbFox?=
 =?utf-8?B?S1RkWGFzNmRmUXNxRjJKcUxsazNKclF6SGRYUzNkMHBPc0RVWDVOR3JtckR5?=
 =?utf-8?B?c1RjSm1rbU04eFVTTXp3NjJsckIrNjNzbWZlRmdETGRiYTlUVFJxdjJGRDhv?=
 =?utf-8?B?WndiV2tGeUJBS0pKVXB6NENBVG1JbjRyTWhLRVo0ZTQ2NkQ2OGpmMkQ3ck5N?=
 =?utf-8?B?emNNTVN5OThFazhQS3V3RDBqN3IrMVJ2dUhialNLbTRCemlnTFMyVDYrMnNy?=
 =?utf-8?B?cFl6eXVKSHF0bjArWktGY29BSE0xWEFEVDBkQUFpTkQwQ2ZLT3BZb3pYMW9r?=
 =?utf-8?B?Ym04ZnBlSG1PRWZUdUJ0ZDdCNlcvUzZXYnRVZjVrWEZkQVk0WW9vT0l2ZjBN?=
 =?utf-8?B?UFI1NDJNbEhtUG5EMGhvb0dwZXA3VEJaWDlVN08vcFhDSWx3SGkzMnI5Q3Vm?=
 =?utf-8?B?SXhQZkpZNVV4RzFiY2ZyR3FQQXNPRVYvd2xrTzcyOWFwbkVROVlETHlkeTQ4?=
 =?utf-8?B?ZHZYQVpsOGI5V21RZnBmc05US21IMm9ieHdZS2hYc0d0d1RLY3gzVW5EWlFU?=
 =?utf-8?B?YzcxeGdiSDFjSmF6c1gxRzMzSHYxQU5oYVBUcHhSL1kxclc2ck9KTmp4Yitk?=
 =?utf-8?B?U3laaUh6YityLzVWWkRtb1dSa2VQT2hZaS8rbEhPYUM2c2tGRTJxRjlhZTA2?=
 =?utf-8?B?ckJaclNJZ09rTUo3MHByU2xISWRxZGVYWjE4NTkrTW4yd2NBZDRaQzYxeVpD?=
 =?utf-8?B?U3kxdUNxZ0Y1WGZpcW1QUkRGM0tUelM5SVk4Ym9rbFBvZ1FERkh5VW4xZzBX?=
 =?utf-8?B?Q3B2cjN0QjQ2VHQySEs2Z2JzdmVyQm1CQ2toSFJGM1N4WEc0bS9jaG01cUdE?=
 =?utf-8?B?cElwR2hiL05STDY0OFkvRTJrWW1KT1R3YUZLT2lla1I2aFRXZ2ZJRzROcSt2?=
 =?utf-8?B?MHZGOEorcVVqNmV4U0hjQmM3MFFUUDU0TzkxQXgvQTd5WHFqWHpkbDRaOTdK?=
 =?utf-8?B?STBld3E2VGVmTXo1MTlmYUlwS2FJMlUxelU3bSs1T2xDYUdnYzEzOU8yNGd1?=
 =?utf-8?B?V1g0Q0RLSVhKZXZYQkpvU0NJMjlia0N3NlZVQ2taSmxpeHd6VzAwL1BkRWsx?=
 =?utf-8?B?cGc1WithM1BxM3VRRXljZ1BDVzZFRmRsUGtrK2J2VmllOHlwcXJvSjczQmwz?=
 =?utf-8?B?WTU5WndmMzZpKzh6Z3dYam5FM1VvQUJNMEFiWG10dlcyS0xtYkV1bnZSdkxt?=
 =?utf-8?B?VE5UNDhhdldUSWx6NTJncnJnKzRUZGcycFZ4dEdlbDlBQmNvTEJKblpJSnNt?=
 =?utf-8?B?MkFDcHNUSi8yM3IwQk04ZEEzZVlxM3JxekdWUzArNnZVUTlhdGV1Uk9XZE1Y?=
 =?utf-8?B?S3R3UHRJR1dwQnI5czR0ajQwZlBQdTdNY2h3K3lsaUp4R29pUWZ5MjdUSWtC?=
 =?utf-8?B?MXcyM3RiNTZCa2NRWlR3aksrcko4MXNEblczT3NNSGdyMUJnMHV4b2tKY0x1?=
 =?utf-8?B?UUxWVVFlaVYxSGYxQ0l5bVZFR3ZldjRmd3hoWm9yOXVSMm54NnN3MGpWMDg0?=
 =?utf-8?B?ZnI0K25KeFZCUHhRRFdqeEtoVTVqeTFrZHVYN1pveVo0Z1ByZDR6VG0zNWhH?=
 =?utf-8?B?TzUyeTFrR3czV1cwK0RjNi9YSGJITU5zbWhwbTJaeU5CVklvc3IyaUNDY29x?=
 =?utf-8?Q?yv3EdPx76dGhc4nUeB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd467de8-06e8-4053-fe0c-08df0795a80c
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 19:25:46.2009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zHxBdQtF19AMJHjBPJGz1w0taoBJXuZcxhy+U1gc6RmIJbIINUhzl+DJkkUUGm8o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8742

folio_change_private() should be used along with folio_attach_private() and
folio_detach_private(), where adding and remove ->private content requires
folio refcount change. add_hugetlb_folio() simply sets folio->private to
NULL without refcount manipulation. Change it to direct assignment to avoid
semantic confusion.

It prepares for a future commit that remove PG_private.

No functional change intended.

Assisted-by: Claude:claude-opus-4-8
Assisted-by: Codex:gpt-5
To: Muchun Song <muchun.song@linux.dev>
To: Oscar Salvador <osalvador@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Acked-by: Usama Arif <usama.arif@linux.dev>
Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 mm/hugetlb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 7857728457952..4b6753b87162d 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1433,10 +1433,10 @@ void add_hugetlb_folio(struct hstate *h, struct folio *folio,
 	}
 
 	__folio_set_hugetlb(folio);
-	folio_change_private(folio, NULL);
+	folio->private = NULL;
 	/*
-	 * We have to set hugetlb_vmemmap_optimized again as above
-	 * folio_change_private(folio, NULL) cleared it.
+	 * The hugetlb flags live in folio->private and are cleared by the above
+	 * assignment. Restore the hugetlb_vmemmap_optimized flag.
 	 */
 	folio_set_hugetlb_vmemmap_optimized(folio);
 

-- 
2.53.0

