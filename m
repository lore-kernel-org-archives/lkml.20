Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011011.outbound.protection.outlook.com [52.101.62.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12962931FB
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789352664; cv=fail; b=sW815oUowwJI+jr4Q2Fx8QmB5gLjcthkhIahD7qk47XnVQOl2MWla9q135kBTc6b5DdDkVoL5TD6Tir4In/+fSVwjW8lQ/B2Czi5Cv/v7X6nF9aiNQGBd4hszr+2ogMm5RvISBRZeSo9auKP7O5umBlsI9yxnWfUux3xi9zvq6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789352664; c=relaxed/simple;
	bh=osTjKQ2gAP5I3gZyLW8ReHffHqpU1QaQloH2raq6hYM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=JcCEkzUMZTF+TnkfiX/Gf0OD3xQaUEo5kCyWY8RskiM/ZjH9O27KG0OOhvlQmHCUhnC3WV5l6n3ryvyql12/t6y8XgEhsUOqnrHRtaJkpIRBASKagSkLr2Dc14rKBLAYCN5z6bkjjq6ReG3jNaYYWk86x8TV/zKo2x6dpbSX4CE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KBemojQH; arc=fail smtp.client-ip=52.101.62.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KBemojQH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y9B6VK3iYGrP99iu3trhB0yw7Z5OmiMG4b/hRE/v0Ez+pfFB0RysLqQdMx/VpPLkLcS98H1/G9VidRjJXf7U1Wnlqq4YJvfm4yX3/yFJTkcFwD4fAPeJ06oGsmtbtuVmk4YAOIfB+bKhkAG5/BzUYRE9XJTTTBEJBW3P5NMr7L/EB3TUJFcWg/MQ0lJ4pIZprGlNtWqWPwzgYrHt3hhcd2hD11BP8dH8OfC2u3vHt4rvv2OLISKfIE/I9BJ2HWlE1OyNVtmFzrRWcj7vd+i0iUFkivBeVfhTaO33/hIVaaZRyw2agIkU6YTxrz6kLZlhs3LF5nnEZ4WRO+ZrTrdeLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2exs/HrKls73cpHbMG/JtXwC2lJhkBDc5l1lfu+a19A=;
 b=R06FrhrbtlnarqHSbcUcmo8Uj1qUolZclU0MGfzN8cFsld1jd1w7V7/VfEY3rEUzzwaOyHOEt21t+6alBVSb1AWQ1BUJKlLZgVHm7tMnxp6i6JhCFXOyMxrRXcPXuTvjLMwakGliajNVBxGW/HBrnPEpmjVilyndeuLjrDKZEFPk6z8VjFI+gLQR1u04PEt+Eft+6aigv+3HTlPpqwCZq+fdBlowG+oYJoSuF1/ul8cIPEho1Apu93q22stv4IrQeEAO9VZq+Fwck7RaG0iIo3Up7i2nNPMbRJntLWeHRFd//S+SRQh5R3XlXjhiua0NpAbuOn/bKNotfppgqpC7KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2exs/HrKls73cpHbMG/JtXwC2lJhkBDc5l1lfu+a19A=;
 b=KBemojQHJA2qARIkMsaKZhCRxM+pV7F1dqmn8CtYP4YfCgk4kyAoWYCf6tmz7pEWNqwarmWr6XZH2g1hvCYHtq1bnfJtdhzyIVO3PHDYI8I1+UHN83vnmWsHcMPu18L07UE63uLEQJrkHzZoSaeiMST7xitXmLAGNDUXhZN1kTcHZvFiVFCjz/tWn7pG+ZXlP0krtH8VjYcrzvJegnhoN94giG590cfLKkEorXJ2z0CtYPtwkREFBgLA5Vu+7g9mwxsZ1m4vP+H9Ipua+3vLI6KhFco1Qnnt8flkpcXYSYC9UTtql7BjPNAMR0YyXpCjpLS1fy1Yhgile5ZP4S3+lg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 02:24:16 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 02:24:15 +0000
From: Zi Yan <ziy@nvidia.com>
Date: Sun, 13 Sep 2026 22:23:59 -0400
Subject: [PATCH v4 01/16] mm/zsmalloc: replace PG_private with pointer
 comparison
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-remove-pg_private-v4-1-848550f7574e@nvidia.com>
References: <20260913-remove-pg_private-v4-0-848550f7574e@nvidia.com>
In-Reply-To: <20260913-remove-pg_private-v4-0-848550f7574e@nvidia.com>
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
 Zi Yan <ziy@nvidia.com>, Minchan Kim <minchan@kernel.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: BLAP220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:32c::14) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|DS0PR12MB6486:EE_
X-MS-Office365-Filtering-Correlation-Id: 4445d94f-c001-49b0-1e03-08df12074583
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|366016|376014|1800799024|22082099003|18002099003|921020|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	6yhzzQF71JECsu+nTD9dpwNs7PRdNk5FSFPxKsEsfUMb5CYLIKzeWBejkF+NM6KPXyZkYU08E0XDi7Wi7+Fao/HQ9d36NZVm8pFHkqf+efUqLgvTmWHVLO0KVfGetC9ejUdTRY6yMWN3lSDeBsV8mHKqhX+lLpj0UIoljSa3xyVJBn7M7qSVaMS08ZHaDLWwibYgnjPle2JzAkINXjaNJsIcFZAT1cfo/YRtl9PuOCjaIxYYbpzA0wvUnqnIPfqEnBfTDcUqQj23Wdf4IA9vs7kOzP4Y5sxTrt3mJa2bbSMm2YzhemLcDTZ57d4WSOG0LvGCn8n5SBup5WRTtCtSefu9t+Wmh06VbWUgW3ayTJ3SG9iZs5Ip5Mcq7TsJBd/QC5A+giyeXHKiWMBTdCihTE0AehVgCaUnRCH8UTyHSVxLZkEmRZa3GzKqdZqD5VYA6GSCYRI/1vjpD//iv8WDq3X3KtWRGkkJXJpoIREygSDff1SwDv/EBclHAnXgwrLL0rGW9z2/3twMIfHEAOJW4tkTe9WkLTgufImrclncJZKf8LLMvZITxgdMYXDHdgnHpp/eKZklb3N5+z3a+vEvRUrPNQEFw6vBR/Z12PciniNlsLR5ojhyBaDpjL5y5oSaVPyAa/eSVKE+NIzcKBnkPtPFjL4xqNfWHVtquRgJb3VupecS3RUUXhSnHojz3oZ/sB8v9IVVdRuRUyyH8dWItg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(366016)(376014)(1800799024)(22082099003)(18002099003)(921020)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWxHbXFXRnMyS2NFb0ZPRFhFcXl2R0M5WHBXSzVtR2RnNUZDYklDaVNBOEFm?=
 =?utf-8?B?VC9kQzBnMG13U3QwUmphUlhvRWJsVHVCVmhFZnUrOCtLcHJ5ZXpQYnNHVm1u?=
 =?utf-8?B?bG5GMUJUbUNtMFRCUUtKY0drNk9tM2w2STdON2ZobHhSSHVGWVVRMXBVaTlU?=
 =?utf-8?B?NFlqTDlTTFpSdGdyeEYxT2xIV3NoelJ0RnZ5TzdSL2JqOXZSNTZ0SmkvMGR3?=
 =?utf-8?B?SmFtTWg0akFrY2VleVZ3QXVJMjJ3cnJPSnd4OWJZdGl2Vngyak9GMUNoMC9M?=
 =?utf-8?B?T3BlVUxFbkxIbG9BZ0FUUDBrV3R0NHNYK01heGNZUE1acVJPcnlVNWRsdVc4?=
 =?utf-8?B?WFpaTlE5L2I4OE9SUHF3YVJiNHcwTHpEcGhJa21BY0hIUTNkTW8vdlpHb29O?=
 =?utf-8?B?SzU1d2krV1N3ZE01SW95M09QclJvZE1kdVFaRGdtTlVxaUFFcENTbmZHeWtt?=
 =?utf-8?B?TDZwNGhnQ0lHeUFncVZqS3JGWTVHRE5keFlzU2JHdld6dDRXdmxqQjhPTVFj?=
 =?utf-8?B?MXY5WGRrTTNEMVhsVUcrcHNHZG5GZDg5MTIxMUlOZ2hIRGJJMFdkZ3RyQity?=
 =?utf-8?B?OEVEcmZuRzR1eXI0bFBvYVA4bnIyQ0k1ZHRjRm8zZ0xjQ3NybzlkOUI5K1JB?=
 =?utf-8?B?ME5aQjdlS2N5WENHcXNDa1ZreWpaOTJvSFdjMlFCaHpYOC9DdWttWWRYWENZ?=
 =?utf-8?B?d3U0d20wWU9nRVViUXVsaExkMng2dXl3cE1wU0lIdkdndGdCR09jTVEvcEZT?=
 =?utf-8?B?ZCtrejNCdHNZcnBMamdsem1FZzJHYUJBWVZiWjlPSkNKVndvYnIrNWFRUDBs?=
 =?utf-8?B?aEo3VDM1d0dGa3ZXR1I5S1hQQnlFRlYyTDZSOHNaM2VwdHk5eEY4UThVTjJR?=
 =?utf-8?B?THl3OVJCZDFLMm1QaG81TzBvSnhxVkt0OHhHZXFXa09iaDFnZHdqeHBVSUFr?=
 =?utf-8?B?OFlzMUdzSkpRRmxZeDhSQ3FUMWczNEM0RUgwZGFLaUhjR1IzTGVBVWdwbFFK?=
 =?utf-8?B?djkra0Q2ZjVOTFZmQ2FRakh2am5rOVBIMUgwT09HcG9yUGxsSGFoOWxCQ3Bm?=
 =?utf-8?B?My92MHJVMk5VVG5qSWtrQnA0dnQwcHZXZ2g0dldiTzZEK0NDc3lpRTVMU0RF?=
 =?utf-8?B?eDd1N2NOQWR6dmhXRFdlaTFUa0E0eWpsTjlEUkdtenBXcXZ5K24wd0g3RDli?=
 =?utf-8?B?T0M3WjM1YU02WHJQUTMvTEJNZ1dSRXlTSUtMdGMzdktBUTVUVEpPUExBTkUz?=
 =?utf-8?B?di93RWFleURrR013TmJZb1BkV0dNUHc5ajQxWWsyTW1uR0VvTW4zckVXNlRl?=
 =?utf-8?B?K3hvZ0RXUWNoSk44L25GMmRmaWJ6QWE1dHRUK0dYQmZnU2M3b2Z0Vnk2bXRE?=
 =?utf-8?B?M2hsanlWbHhRWm9HYmdHbWtFc0tycFFTdXlIRzJVQk85QnBLdkJON1RnNXht?=
 =?utf-8?B?QmtaY2ZxdmlGSkhWUVlFRnM3U2tlZ3dVT3JobkZTWHppWkFSWVpmc1ZMYXVk?=
 =?utf-8?B?ak1YTU84Z0plZGRlYW1DVXRVOXNGeXlBaDRGa1ZoT1lUZGIrNlAycWhVYzk5?=
 =?utf-8?B?ekdNdGZncEd2QXJESDcvSnJwRkpWblpsM1BXVUxOL1NBNFhpZUhqMzlkVUlW?=
 =?utf-8?B?N0hRTjVHSjBtckZPMEgxVkVKTmFnL0QzSklhWFF1ZVpjOG1GL0JYUlMyQnRR?=
 =?utf-8?B?cDNtSGR4VFpkQm1mZ0hTYytvQTAzeDhhUmR4VjhuU2NJQUczd0tONzNKbEZu?=
 =?utf-8?B?K3BEYjgwR2t3R21OOXpqK29HSlA0ZzJZQlR5N0lic0VyMGFZam5KMzVrNXdW?=
 =?utf-8?B?aTVBazF5bzFkVkVUcHlWQzNBbVV5TjRsQUt0QnFwc2JYc1VjSDEzSUgyWWNQ?=
 =?utf-8?B?T0dpVW1IdHhCOGNtWnl6TFYvVUdsSUVQaE5uem52L3dTRDlNRnlGa3ZGRTB0?=
 =?utf-8?B?T3d2VU5jYitHNmNMMGlpTDBRV0dLRFNZc0szbTk4VENVem9OWDJXS0REUk0v?=
 =?utf-8?B?ejhJS1V0SzUwL015a0hBSEw3Q3JldVg3ZGRia1BWT2RNMGx4aTh3QjRjNHRC?=
 =?utf-8?B?dWhJRzVWZ0Y3VmRRS2lQTXRGQWNqM01PQnlOeHg2dmhoOXdsUTUrc3Y1UGNn?=
 =?utf-8?B?Y2tNWXpOWG1kRTZlZ3ErcGl4aXVmUDlMWHV3TmhRRzFKY3hHQWdBMHo1N1Zm?=
 =?utf-8?B?MktqNWdzUHFNOTdKeFVSanBSSUllV1U1NENxYUY2eDNTZDNlak1zRmlwV3Jo?=
 =?utf-8?B?UklEbjQ5d3kxKzFRdVJCTmRXQ3BqcWlGQjNjOUFkazlzWEEvNXIzcVpGeHZC?=
 =?utf-8?Q?11p2b55ZOPfFyT7YsU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4445d94f-c001-49b0-1e03-08df12074583
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 02:24:15.1173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nYBX3Z08IQu38SfiPWm12H/T5UYoSBVn3zWXzMBMfIlF3n+uGCaQ2mhn1UZZ8byD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6486

zsmalloc uses PG_private to indicate first zpdesc in a zspage chain. It is
equivalent to check zpdesc == zspage->first_zpdesc. Replace
is_first_zpdesc() with zpdesc == zspage->first_zpdesc in obj_allocated().

For get_first_zpdesc(), first_zpdesc is from zspage->first_zpdesc, so
replace is_first_zpdesc() with first_zpdesc->zspage == zspage, the second
requirement of a zspage chain, where all zpdescs point to the same zspage.

is_first_zpdesc(), is only used in VM_BUG_ON_PAGE(), so performance impact
should be negligible. While at it, change VM_BUG_ON() to
VM_WARN_ON_ONCE_PAGE().

It prepares for a future commit that remove PG_private.

No functional change intended.

Assisted-by: LLM
To: Minchan Kim <minchan@kernel.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Acked-by: Johannes Weiner <hannes@cmpxchg.org>
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 mm/zpdesc.h   |  2 +-
 mm/zsmalloc.c | 24 ++++++------------------
 2 files changed, 7 insertions(+), 19 deletions(-)

diff --git a/mm/zpdesc.h b/mm/zpdesc.h
index b8258dc78548d..4fd81c2e80769 100644
--- a/mm/zpdesc.h
+++ b/mm/zpdesc.h
@@ -26,8 +26,8 @@
  * with memcg_data.
  *
  * Page flags used:
- * * PG_private identifies the first component page.
  * * PG_locked is used by page migration code.
+ * The first component page has zpdesc->zspage->first_zpdesc == zpdesc
  */
 struct zpdesc {
 	unsigned long flags;
diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 11be37c431718..7ef80e0da6267 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -290,11 +290,6 @@ struct zs_pool {
 	atomic_t compaction_in_progress;
 };
 
-static inline void zpdesc_set_first(struct zpdesc *zpdesc)
-{
-	SetPagePrivate(zpdesc_page(zpdesc));
-}
-
 static inline void zpdesc_inc_zone_page_state(struct zpdesc *zpdesc)
 {
 	inc_zone_page_state(zpdesc_page(zpdesc), NR_ZSPAGES);
@@ -476,11 +471,6 @@ static void record_obj(unsigned long handle, unsigned long obj)
 	WRITE_ONCE(*(unsigned long *)handle, obj);
 }
 
-static inline bool __maybe_unused is_first_zpdesc(struct zpdesc *zpdesc)
-{
-	return PagePrivate(zpdesc_page(zpdesc));
-}
-
 /* Protected by class->lock */
 static inline int get_zspage_inuse(struct zspage *zspage)
 {
@@ -496,7 +486,8 @@ static struct zpdesc *get_first_zpdesc(struct zspage *zspage)
 {
 	struct zpdesc *first_zpdesc = zspage->first_zpdesc;
 
-	VM_BUG_ON_PAGE(!is_first_zpdesc(first_zpdesc), zpdesc_page(first_zpdesc));
+	/* the first zpdesc must point back to this zspage */
+	VM_WARN_ON_ONCE_PAGE(first_zpdesc->zspage != zspage, zpdesc_page(first_zpdesc));
 	return first_zpdesc;
 }
 
@@ -838,7 +829,8 @@ static inline bool obj_allocated(struct zpdesc *zpdesc, void *obj,
 	struct zspage *zspage = get_zspage(zpdesc);
 
 	if (unlikely(ZsHugePage(zspage))) {
-		VM_BUG_ON_PAGE(!is_first_zpdesc(zpdesc), zpdesc_page(zpdesc));
+		/* only first zpdesc holds the handle */
+		VM_WARN_ON_ONCE_PAGE(zspage->first_zpdesc != zpdesc, zpdesc_page(zpdesc));
 		handle = zpdesc->handle;
 	} else
 		handle = *(unsigned long *)obj;
@@ -853,9 +845,6 @@ static inline bool obj_allocated(struct zpdesc *zpdesc, void *obj,
 
 static void reset_zpdesc(struct zpdesc *zpdesc)
 {
-	struct page *page = zpdesc_page(zpdesc);
-
-	ClearPagePrivate(page);
 	zpdesc->zspage = NULL;
 	zpdesc->next = NULL;
 	/* PageZsmalloc is sticky until the page is freed to the buddy. */
@@ -1006,8 +995,8 @@ static void create_page_chain(struct size_class *class, struct zspage *zspage,
 	 * 1. all pages are linked together using zpdesc->next
 	 * 2. each sub-page point to zspage using zpdesc->zspage
 	 *
-	 * we set PG_private to identify the first zpdesc (i.e. no other zpdesc
-	 * has this flag set).
+	 * The first zpdesc has its zspage->first_zpdesc set to itself, no
+	 * other zpdesc has this set.
 	 */
 	for (i = 0; i < nr_zpdescs; i++) {
 		zpdesc = zpdescs[i];
@@ -1015,7 +1004,6 @@ static void create_page_chain(struct size_class *class, struct zspage *zspage,
 		zpdesc->next = NULL;
 		if (i == 0) {
 			zspage->first_zpdesc = zpdesc;
-			zpdesc_set_first(zpdesc);
 			if (unlikely(class->objs_per_zspage == 1 &&
 					class->pages_per_zspage == 1))
 				SetZsHugePage(zspage);

-- 
2.53.0

