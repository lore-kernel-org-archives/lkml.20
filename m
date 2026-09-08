Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011056.outbound.protection.outlook.com [52.101.57.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9712F60B2
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 02:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788836209; cv=fail; b=owxIyY7cc5+GMfo/cObos1AJbD9pVQxOukL/ayWVy39cAf+/csKxplYHwfJWSl1g7Heec2Yulo4Plnc/nmKav/+RnF50nfBwHkk40KAYfiM4EZSFeg2rznhndhJSzFk7rSaAw0eIpOIUoKUURjQNCyeVF42h4iPZwnP7Rah+5Dc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788836209; c=relaxed/simple;
	bh=mVKkZ2CDSFxR9TTuEmFhW1WwhqEtHNwYb9eF0KTJgfI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=C1OQwB8xIKsxe2AJBmSJoIDci9B1e/y6taI4qvrSyLPxDNca7ky8xharbHZ8OSRohopaClvJH0ffgUoX8Jvyp3zJKEOX1X4a02P8tsc163DhrmUZreEDSQK98xz9YlVxEhTTNxMiVEaKCpF5GQ/eGjQZXZPGSyAW4ZVhZ5/AVs8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oTajnPSM; arc=fail smtp.client-ip=52.101.57.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oTajnPSM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QdiicOlXeWJPZQVkO43huVeOL7I6LCs5l4B60zoOU0yn7HKlPC82AB8NGgTq9d2c7gIfu84fV6CJ4rB4WGkM78nsjzngy8AaitFD2yrKUwyby3WsOqZEKzAuR2rZXhu7jaVIjKWcivCPDVPlUEnXa23IIPAZvnZxr1N558Ktz+HBRYZgWN2BDswHl6EPkrFsFWg+c/83iiCOzrLazlNT8pMCxax1lcMEHEQgwfGiYtyPmnqaPWbMQz2RfGSxTBTq0R3pa3VvRgLM0L30vs61w95+7x3q5VS1fC4/peQKac8cIAHeeiQWJlJG3shTaABwsaVukSVDU5wvP0XqMYCPaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjC5CJHRzG8QdypZ6ubvFNHEuZD/7E08tlsthr2EnQQ=;
 b=yhNA0KuRo2XsutAwTZ9WJfhxkQ6ujJoIRImLX9P/xcjyIrqoKBuk26Y4tiOeztXq4wcOOlvA7gGCofx3j8FwJB6Yo9mZIpwJIoan3jH/aBse7es3d8j+UcyFQuKaENdiqu1ubOX1kQ9ls+YqnyODiyY8sTOuODTdthhsVSsriwgNLM9csyG8+3XP7PKtpb4leF0Xl6F29Tbr7WmrWF1/D4CSCJijsmWyPxvW2LFGTcAavYu32XDUZFfzCdNQ5OIDdJuMpgE6xhvM9hXfPJC580pgmjWQqIvzxfbzGz23rha6CbzuUlKhKExSt0Lxwg+mDvgjMI40d7Za8aDoVsmE0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjC5CJHRzG8QdypZ6ubvFNHEuZD/7E08tlsthr2EnQQ=;
 b=oTajnPSMvWzC2VZ2oBlE03fgPSustZjUqZ1yrAcnGkYUukm03lFsJ1y63nrNx2j0befDJspzhRUXeFDl+m8HP+ql1SyPn7hbOxPZULm+wGVa8sMWCleFRetcB1GbIIrImJa/MQpbw4j/kxqu8DIa/rBR7awztUiWsMk+NTmjZNDkZo9T/i5N5UpP1YRjtRClOKFfYrwGeqG+Zw5cbx9G9WB9ibfX2IaA/SsG6BBEP5kHnK/irtIMG7Offl65eHrjK7ygL2puUIkkyJ7sL3s38ID2ux+gNNxhz8LJdYg50isdBuRFqLPZTp/ercYo+YZ0izOVrpOvXqKEX8iDaPn3NQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by DM6PR12MB4435.namprd12.prod.outlook.com (2603:10b6:5:2a6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 02:56:33 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 02:56:33 +0000
From: Zi Yan <ziy@nvidia.com>
Date: Mon, 07 Sep 2026 22:56:12 -0400
Subject: [PATCH v3 05/14] mm/hugetlb: use direct assignment instead of
 folio_change_private()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-remove-pg_private-v3-5-6ae22f9d9272@nvidia.com>
References: <20260907-remove-pg_private-v3-0-6ae22f9d9272@nvidia.com>
In-Reply-To: <20260907-remove-pg_private-v3-0-6ae22f9d9272@nvidia.com>
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
X-ClientProxiedBy: DS1P221CA0011.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:8:451::11) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|DM6PR12MB4435:EE_
X-MS-Office365-Filtering-Correlation-Id: 47267f97-fe5a-4b74-94e7-08df0d54ca47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|921020|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lJ3hkClREwk7uYPSAP59BXC81Sx03w9QMxfz0LwoQBrgKwmcepM5w5FrGXQMAUb88wuIkC2z5lT0w8wK+vOwyZ5F4WWazxQih4THGXjleLsEHsO2LhgjP1Tx4eKFMidGAeG8zTE2ZgnH6yVUAjoLsH60oVNAGtZXguUdvQ7qH6MasWvy5qCUL9Kr/VpgU7R0AbLWHvzDlaSGpEJTt0HEVxXBB7rii+8b70GGIbhlZfdjAaq1jtsHJPUfqNqBzj2h/cc/jj8btwd+iiOtgrEIpBZLsJ44BiOQoY4lKfC76voOC2z/tN4LxdsxkzvzKBezHz1VM3ML5M8OGHpkcTMzLJ3upNVwvqF2/UERQF8aGF2rnKbTcbuqNvtOtmlAZ79hJzlzMFZydaBRkoO5GWurLSAUWUssHrEG/btY6YrijCfrPSqMchECZTRFx4pzVFo/b33fjrpHOQwQu1uER7uta0ARSgoEVy5urWvHkExdl3FFzB8jkjyYPVCillFta8u7t2AcQ9B7d+tf8dtMV2qlhSiM6lAFHkq3mDjtbtjDz4B/cFq1r1t3DAsPXKK87hb4uzpbxi7EorcLJzT7eiTcwZoeXw6iOnxaCmF+wRt32Y/a10H0OaztVf5Hs7ANZ1RF2D660mfOMQu8gEwGj45RXh8H2ZgMosRqCLXPenUNhywvIjl924chsqwD5j5kYtwqx8Z742awim93ey7RH9+NWg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(921020)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elEvZ1dSZnZvbUNwOWNCRHd0UFlJTGRyYjJLeGQ5eFd4a0k0QjFURnhicEs4?=
 =?utf-8?B?eFlBS3lKaXAzMzgvOEl0OW9yZ3dWazVpYllKRnArdnVCQUVMSjRoaXZzZUpG?=
 =?utf-8?B?TFJnWWdhMnc5cU5yakQxUGErdWNDMjRyT3VCTWhPVWdMWlM1NEEwWnA0ZFRB?=
 =?utf-8?B?MVgyK2tZTy9OM3VFK3MzQ1NpcDAwRXJyN1J1a0w3T2lLTkNIN3VXSWZUWDhZ?=
 =?utf-8?B?TVB3U1lCZGZBdmlreUhnMURFdlZpQ21Hc0JhUDF5MXpMU2pvaXBFSGJqYmpW?=
 =?utf-8?B?UEIxQ3NYMWtHdUkzYy9EOHkxZmVLbVBsSWpoZndTVmIvUlZScGtsclZyZ2ZD?=
 =?utf-8?B?TjhlMjhsYzJTdHZTaVdZb2d1NDlRK1ovTVdQVU9EQjN2Tk15SkQ3VEFlNHU2?=
 =?utf-8?B?YmRrcEI5QzkrNDVHY0gvNitHYjV6dEFPUTFpenRoY3c5OWZBdFMwYUVyK05m?=
 =?utf-8?B?MS9HbzhqSkJiYU5qbVppV0lNV3RiOWhsbk5SVm9vK2lHWjU5Zjh2eEdQaWNY?=
 =?utf-8?B?ZGVhcnA5ekVicXdQZGhycFlXM1hzWis2L2E2NVQ5RHI4d0p6WWFoZkcwZ0NP?=
 =?utf-8?B?b3owdE5sQVU0N1FiZUZsSXRzRnVETFk2Y3NwRHNnOUxvOUtwc3R4bk1CV1Zj?=
 =?utf-8?B?TnFTRE94YWREUjhrdzVUMjl4WU94a0gwak9iK0lkUkUzSlFGbGNFZGVSR1hp?=
 =?utf-8?B?eUFGMXB3ay9rK21LdDh2VWJ1SXkxYjFpMkEzZHRZRy90L2NaVVhQMElOa0RE?=
 =?utf-8?B?M1M4TjVOY2Jma3JzNWIxZEZ3UHBJK3FvM1FsS2MyUDZIYkQ1TzFOaDZURGQ3?=
 =?utf-8?B?SzRoQTJzM3A0eHRWUVMzTmJxTnI4TllwSzlsVkFTL1RXalJOc0pJeXpuRzJR?=
 =?utf-8?B?YUxNYmFzNGcxL042UjFRWFlCeCtCMzFqMW56bU0wVFo1NExOZ28rMVc5WHJ0?=
 =?utf-8?B?aFBYUXZzWTBMb1YyeUk1dWhRT2k4eVBBUEg3a2FjdmhiVjhUc0hJbDNScmNi?=
 =?utf-8?B?aUkwZGRkcFNwOW1CV2lUUzJZV0JTR0tST3MzRk1NbG5XdzB6NkNMc0tEYkFw?=
 =?utf-8?B?N1h2Q09tYnpVM2dXQVpPM2Z6NTg1TVZkZHJ1a1ZkUDNmcVRXNW95Z1U4bk1H?=
 =?utf-8?B?OE1sSzlET21VM290T01IMXpvOTNGL1Y0aHJDbEhrcW9sUklkYUdrZHRpaWZ1?=
 =?utf-8?B?SVhuOS9jd1Z1bHEwRkUwSGtjc1VkTm5rVVlxdlNlV1c1Y05OTDNYSGZZY2VF?=
 =?utf-8?B?Y1JHYjlST0hqajhPVFRqOVFwaFpTUjJERHE3TVkrNlJvSnFTWEw5cW1rU29o?=
 =?utf-8?B?SlhLZlI0SlVPWld3RHVvamIwZktIY01RdHJVeHFSekFEa25YSEpFdFJ0TUtz?=
 =?utf-8?B?RDFvMWNpWU10OG4zODJjL1B2ZXM1bHYwWWl0TVgxenlIYmovYXJ1Z0ZybENI?=
 =?utf-8?B?RkhscEptR0ZwdkRjT1hVZExxc3VadzdJb1hMTE11NWtVTUVtVXhvclZ5bEta?=
 =?utf-8?B?bkxnYldKdUJsN2c0dTBVOERaWUdJNUdZdlBtS1ZNVXh6eGk4UGJ2NnNoYWIw?=
 =?utf-8?B?bzBMK2J0OWZSNWpON01ROG5BMVFFd1ltWFEvNzZ0cVorbnlGQmI4dTArYmpZ?=
 =?utf-8?B?TEprYWdmaW8xS0N5dmRqQnZEaW1DK1ZGTEV6dE94aGViZlNSOEZjcFJDZ1h2?=
 =?utf-8?B?cDBYbk5IZE0zamhqZXZCNW0wWVNlOStVN0x6bXRSZjhtR1lWTnNkb1pDZyta?=
 =?utf-8?B?L2cxWStUN2czdnZzT2hDb29GVElEUWdvQW8yVHVuYzJXVk4zVU1TNGxuSEhp?=
 =?utf-8?B?K1RtTlZhVzl6UkgyQkR0VnZHcythQ1crbUdlVUNsL2JjbXc5ZHIvTThxZ2tP?=
 =?utf-8?B?NlZBZFlBQzMwMzYxWVVTL3d6TzNsb3pET0VsaHJISDZpRlZNSDgxQXdsR1Bt?=
 =?utf-8?B?WTFVMlZjd2RrRkJPYnFJcUxXN1NIaWFkS2V1bVNGa0dXc205NVZrZkxnQWQr?=
 =?utf-8?B?QnZNOEh6OXVET0JIMTFGUFh3OEg3RmUxUk42ZktlbFFWSGpWc2d2QmpGbzV5?=
 =?utf-8?B?Sk0zb2d0dHBXeHlPZXVIWjNUMHV1V05Ea3NnVS8xR2pGWmdRK2dDTzdWMHhI?=
 =?utf-8?B?aExzODk0TGRUc3BXakRrdktQUG0zN1FZNWUzd3drajdRNnQ2VnA3Zm1qaXQy?=
 =?utf-8?B?OU5CMmVzbjNzbVY5bjRFd2ljRjBJcDhhOS82dU1jQjhOMC92L1hVR29PR2hY?=
 =?utf-8?B?TWNla0s1U3FFbXQzUHpBQUd0MTVmUldMVXByQUZlS2pqZ2VmTFVtNGVjOXl0?=
 =?utf-8?Q?i8i3t6R3m31T/OTzj2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47267f97-fe5a-4b74-94e7-08df0d54ca47
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 02:56:33.2863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UAeZ19wRUdSzNzY7oGnASUIyFu3AhQ0355xC5gB3Myy3r+hjl6sGVJMNKdO+gRdj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4435

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
Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 mm/hugetlb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index a69bd463b1aef..08a538739d785 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1445,10 +1445,10 @@ void add_hugetlb_folio(struct hstate *h, struct folio *folio,
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

