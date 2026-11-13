Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794540105;
	b=FyVqAyzilljaj9SkEf+LKJradtH395qjdJusKkxatlbPoL2WZJeZFC0igxqNdjTn3J6t
	 7jdnjt2kv4p+MGT+hbiU37PZgT8xYt68Vo0/WG/RM8sHoAhNS6+ycBJA4ebOdgjohSNKA
	 sA/t65u/U0BXQCfBce4qnVbaHRI4rNEDEmlX7HlLXQKdrHvMaCb2RubDoz0SI7EVx//02
	 7w524n1WVrpL3T7vLnswYb4ePLAteT++zBp8xTQPrkph//NatMxw81s6AzFA2wt5WeJk0
	 ajD+APje49eYA9sO7HJQTzrEsu6RHtTSQyZL2+JbkKp8MccIN+QB2P861uz2xjshh+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794540105;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:X-Mailer:Message-ID:In-Reply-To:References:Content-Type:
	 X-MS-Reactions:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=68o9g584xkn2oa7671GxsnuHQqyteC9n1uJT2DR6q7U=;
	b=srMZseREp0J4td5bYQBxXCcyIq7Vckao7AahIgMdmsDU5ROqZNIXtdrZenn1m8u+/U1S
	 v87S1q/7Z4tnKtnecE48a9oerHS10TsHyvpvr6bfwgw5fLCWpHuH/TtCLKkR9Znz8BMyv
	 gF9ajCQoURFY4YpkadCAaQURlRScMY97qu9FE3AWOytdNVWEhR/v/FHsVh1ensijsGUAR
	 zCnuTyw7sLAs3lnw74baZfiIC3Bgon+vB12tioQ4Ey2bphNnzPgQRnkje4K9oEjca7jRL
	 cumRInNBMdy7/JIshWL14N48SjTe8fgL82BqFaF4NWL/2Zzj67eJnEwgjtSMXXEJthg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=byWX0jAh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.7
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012007.outbound.protection.outlook.com [40.93.195.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637BE606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:21:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 637BE606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=byWX0jAh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hCoUZWUkWSsvddwKcVpeR4DP/aRUCNtfWhi2rI9gCDXICUlDAcZKFYbEB9CdjN6E+YkQYDwhCMcICHSwAh6B9CdVTmP9xyEn04+xNRrgTpfMk7KCNLVdd5lhfQx2T9OZWiET0vrXIlJyf0Sb3UTW+x3Ozlu1KbJu5u3ROiaVQdQvGdCXxolXafdelKVKpfE/a7aYuHvLixVphHvZ4eCEmLm8Q1xoxAoo15VDms4I1DrU5aV2T9DGaixcdqC+jsfLod0tse6EQmT/KgUppT71Xj9AXngfbGADGq/qUXn32LlENAd8y/TbM5MrmXcAU56mjLgCn/givc2+9vh7ug5anw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=68o9g584xkn2oa7671GxsnuHQqyteC9n1uJT2DR6q7U=;
 b=XyiLUbZyJwGs95Fy74aGnkr/MeWQ1YM6jJU5zf+4acd1+9UlKA+sqGwylmVeIgNKf93vY/pCq+mhHtEx707MFxvDu45ZSginXVNn8vgGgQshFz8dge6UNZ4A5NYT4qmQBiz8xuqVMpoflrOdtFONrjiqDfNgNjBnQXkEdDkVwIB0Jp9ZjKnQG3/7K5Xv/O1CBDKZfjWgHH6VKWp2LpxKPfTE4PDVscEAdGwAX32e7mMIttHOu/X3Qn28wfG2s/vWQ0fC/Abp2stb3nco/14DXUNdqW76cpqIaM0XnroDHQm1Brf8Xz5Xltg0uXIlUc3ojOhKUOKuIsgm4uGxqSE/Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=68o9g584xkn2oa7671GxsnuHQqyteC9n1uJT2DR6q7U=;
 b=byWX0jAhoIwT9VYuHGOc/vOtsyPDs3zD6MbORA3iNac/DZNV8SJokFjSW/K9JzLy28AY7G90YH3N52IuV0fboIFr5MTCdUzqt2ET1sOds7heMSO1KwwLBWzTYg3GeN1XJbLZC1PxOqYh+Ob6sS0cH/0igCuzAiES+hFc+AIdxnoaKmcCm7Mp4vFmeHBAwWXwThX69zFK7Ji2XEyrB23uTTeJQg2RiWVdMK6hrwBq2OJhuWmMZuEgWO2ksEY0tgdzsBXrt8MrIvX21PIEpz/kP5VVk6PveaIQ6w5Hx2CMCySSYeK/oRKYK23w8cHmBbGBjdbOlYqVcw9BXNqg9eMxtA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by IA4PR12MB928846.namprd12.prod.outlook.com (2603:10b6:207:12d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 13 Nov
 2026 03:17:17 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0615.007; Fri, 13 Nov 2026
 03:17:17 +0000
From: Zi Yan <ziy@nvidia.com>
To: Zhiteng Qiu <qiuzhiteng@hygon.cn>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Alistair Popple <apopple@nvidia.com>,
 Xin Hao <xhao@linux.alibaba.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Yuan Zhong <zhongyuan@hygon.cn>, Shifei Ge <geshifei@hygon.cn>,
 Jianyong Wu <wujianyong@hygon.cn>, Shijie Huang <huangsj@hygon.cn>,
 Yibin Liu <liuyibin@hygon.cn>, Fengyu Wang <wangfengyu@hygon.cn>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] mm/migrate: don't batch the TLB flush when there is
 nothing to batch
Date: Thu, 12 Nov 2026 22:17:13 -0500
X-Mailer: MailMate (3.0r7038)
Message-ID: <1BC0AD09-DDF0-4BA1-B959-4F88C25EA144@nvidia.com>
In-Reply-To: <20261112010357.2739389-1-qiuzhiteng@hygon.cn>
References: <20261112010357.2739389-1-qiuzhiteng@hygon.cn>
Content-Type: text/plain
X-MS-Reactions: disallow
X-ClientProxiedBy: BLAPR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:208:32b::28) To IA0PR12MB8374.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|IA4PR12MB928846:EE_
X-MS-Office365-Filtering-Correlation-Id: facde21a-12e0-4ac6-0e69-08df41349ef6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|23010399003|1800799024|376014|18002099003|22082099003|10067099003|56012099006|261026140227099003|261102123227099003|261022113327099003|5023799004|11063799006|261021121427099003|261028144727099003|261022105027099003|261026121527099003|261021123027099003|261022075727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	wg7kxRBro/okuy3A8XZ/itL+JAYUgpNyT++obXNSKt0d7+xpxdBFAwmZioFsuCa5LQI6waN3j0fZhm5XWgKOYoA/PJiT4HuO82Q7HGQ7g5rOg39hj3YnzQtORkiF65s5r614/F9r9VeGfBsqP8bztWXY0yOxeEfKmAYFoLHW+NnSeDgS9SptSLAihoiwgH3kAkh3xxpXy+gVRpvqSOzuTn/u2pAvUsGZh7FwiSgqpHvq2AO1n5aIttmGTAKtjYZxcZEVz88jSpXRFmSQI8rcEMydFO/WvRso03fFGjtevcMf+IUWp3B1GaI5X4Uwe4bmhD51QEs/IGKAlP3Ky6Rs0lvCKIcXliQJHEtIbJOcDrajzo1fEon2ruC+ssUdN3mT5GopBnwmbCIvfEBUOAPWss7gkpyng2r2q/r6E1BMODND4sx4k2d+i9osjR3vGVciAYnpGS+ME8QR51A6/LvCVJSAN3eboinXo4mcxYauRpvsrntbzTrzK1fgjd2dJiuhugiijRvIUuTLP75uTVNC4zvmUY5TgTciKUWYIz7dmn8EwwTZqoVyYQhynzE4zn/4XG2vlxPfA36KUjybXz7riZxHWjS1XXtTYcwIb7Z8C3jLNN1Wi0xRVrXu9M3nYoWOb5SDVn6FB2LiIhDlXEDbQuAFucVRxyFWeYJn6lSOL7A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(23010399003)(1800799024)(376014)(18002099003)(22082099003)(10067099003)(56012099006)(261026140227099003)(261102123227099003)(261022113327099003)(5023799004)(11063799006)(261021121427099003)(261028144727099003)(261022105027099003)(261026121527099003)(261021123027099003)(261022075727099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kKK4Gg+sq8zGMZWWv3r6Z0YTsprPDl6x2eip90lU2aqUBN+9hzTfz9Okc+45?=
 =?us-ascii?Q?o6t2pbabzW3z7Ojdb6kIBcezdeG7Ose0dUUzbPNISQ116FdsrqzQMSqG7bLs?=
 =?us-ascii?Q?vK8xg7QYccMBU0IBtreXmdDNUojjuXrKKYm/hcmkjG6CMNzxujMBLNrXhRdR?=
 =?us-ascii?Q?JlMZqvBAz9286EkpO5BHCRpuR/8OcaM5E/HNquUs0uQiMWSoIAwuc1VkD0Co?=
 =?us-ascii?Q?J8bbvYMif96ZZgC2+3tenFXoBwNk9r4xJUZDAMK+vcggYG0lBbTe5S/Q+eo3?=
 =?us-ascii?Q?GZD6aBA60MCSKkVBLK7nKbh5mzFiogTD8nZ1R9OElCQpAOaFu7Vix12nNaQS?=
 =?us-ascii?Q?Gka4XQtxcFcolnP+nlF5DtiYfDa5raxoIlUMu8ac+I/JEtKnybvLudqsPMAI?=
 =?us-ascii?Q?4fKwD2bdK9MRgp0gH1zjLxcn9/KXly25rc5YtaGiwjwPYcgKUmxv2lXh4W/p?=
 =?us-ascii?Q?pF3Qmp5QIUaFNzgkfWb2kCfaq0OM4DdJxekmt3qYSla1YPN0X/lVQ/mkoShd?=
 =?us-ascii?Q?HflgBey3q/drP2AEHsLiXGwQopW4GlUI9CYI687OKWf8xLnPjjL6vDfLYFG5?=
 =?us-ascii?Q?P5OiwMsScJHlWEG/850LT4tpyfI6zc6lYo3KI31zsbcqgsZfmUs/EQJi13xF?=
 =?us-ascii?Q?i+qNHauRUKVBKDw/JDeFbObxM43p3NUpOi/CmrbgJ2EMtIe08xcMiRPtmH9j?=
 =?us-ascii?Q?IS60+3kM6drMUS4q+fJA/WX10lcgw78T3Qk6QKppP2OGSlZwfjxNcHAQS5RM?=
 =?us-ascii?Q?IULND8pMbVzdgKJgDycI/HrD+/UhN5Tnl/l1F6KyGXUJgjmwnWg1v++Uwhkx?=
 =?us-ascii?Q?yBHIxSPwTFrM0VFyDZ7vRlRUJ8f7psMlT4p2xKrFHJn+0ZLJECyZGCZx1RPu?=
 =?us-ascii?Q?lZ62z4H/TxNEBK9WMzbJvhaU4h9tqazJTiK6bpJbrBDPK0b64v7YvE6VhUUH?=
 =?us-ascii?Q?50TJchbozdgsgX6kooTeQmclUIkFnrdVLMGTYzexBnUcU+s0CCtreBLdg5R3?=
 =?us-ascii?Q?NpZNJMSSiwBWiTp7AS/igszu/zIwzsQ/14HMuki4QU0bncX14aYgsjZpJfdJ?=
 =?us-ascii?Q?5XA1xXXatPIXeyQlUzoQqJmvZNEmnyee22xW6/jYKifzyU4z4jwe6NvmkYOk?=
 =?us-ascii?Q?ekaPrYc4+V3dilKuh5YtDNisbe4+ztjJW+BhMDuZk4phkBK8cxE/XkrM9EwV?=
 =?us-ascii?Q?ElDeeqC6XfoNhUJbJbnvl15aKcB/jHg+UrPtrW9/wP4tE+1qANVxwfkPey8N?=
 =?us-ascii?Q?2HIBOgTF483ItYp0cZQ2SZ+ve2pXuAsK4y9fJI4VnaByImIjc+4/EK1AiS6d?=
 =?us-ascii?Q?2BfgyKVAGkTHuY4ynKN3t6hH/QqqtrRi90SXuX0hncodCC2NHKm1TufJIlzr?=
 =?us-ascii?Q?EWfZT/R39EzPfoz2IuuBtFpbkxHGVkI3M9/rqqRqVVIHSIHwjoOj4ACN0XbN?=
 =?us-ascii?Q?bjtl5A9Zdvru8jI4Wg6U+X1Y3Db2AXL486JbmrUQkuYNclwkWifrpKjBKwYR?=
 =?us-ascii?Q?AirejiEWHdZI2RxtDXGu+jrqV5DlCagRrhapMPAFzuvZRvrwr8+XHX05ds8T?=
 =?us-ascii?Q?liGTSAn7pfpAFH8lF46IWP/FC6NyFUU+0XdNj9tSzlXIz8XyabPONRPcunn/?=
 =?us-ascii?Q?Mcr5YNMqeRYljuBdBlXl1u+aexQ5osfbWr7ErllnsO15OvdbQFjubKDPRncU?=
 =?us-ascii?Q?fG04t2phG/v71gmKyf4qi7SptCJSYHA7TXyRHoS4vwrqAFTh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: facde21a-12e0-4ac6-0e69-08df41349ef6
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 03:17:17.1976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kN25E6prTOArXwcYDM1XtJpTUYRT16wEwR2TKqGyNSAFY+Y6iGWWBPNQGSPFO4Cr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB928846

On 11 Nov 2026, at 20:03, Zhiteng Qiu wrote:

> NUMA balancing migrates one folio at a time, but since commit
> 7e12beb8ca2a ("migrate_pages: batch flushing TLB") it still unmaps
> with TTU_BATCH_FLUSH like any other MIGRATE_ASYNC migration.  When the
> batch contains one small folio mapped only once, there is nothing to
> batch, and the batched unmap can leave mm->tlb_flush_batched pending,
> so the NUMA scanner's next change_pte_range() can call flush_tlb_mm()
> before changing the PTE table.  With migrations running concurrently,
> that state keeps being refilled, and on this workload the scanner
> often flushes the whole mm as it walks the PTE tables.
>
> This slows scanning and keeps mm->tlb_flush_pending raised longer.  On
> x86, a migration that unmaps a PROT_NONE PTE while
> mm->tlb_flush_pending is set gets true from pte_accessible() and needs
> a flush too; with batching, the resulting arch_tlbbatch_flush() is a
> full flush.  The two feed each other.  In one run, 33% of the
> migrations overlapped a scan pass, although passes covered only 9% of
> the time.
>
> On a 2-socket, 384-CPU x86 machine without INVLPGB, with v7.3, a
> 120 GiB anonymous working set on 4 KiB pages and 384 threads (three
> balancing on/off pairs per kernel):
>
>                                      v7.3          patched
>   throughput loss from balancing     13.0-16.5%    0.5-6.3%
>   TLB interrupts per migrated page   202-210       12.7-13.6
>   average scanner mmu_gather time    ~90 ms        ~6.7 ms
>
> The mmu_gather times were measured in separate instrumented runs.
>
> So don't ask for a batched flush when the batch holds a single small
> folio that is not mapped shared; try_to_migrate_one() then uses
> ptep_clear_flush() for each PTE it encounters.  Large folios retain
> their existing flush behavior.  migrate_pages_batch() computes the
> flags, since it knows how many folios it is migrating.  PMD-mapped
> THPs are not affected, since set_pmd_migration_entry() flushes them
> regardless of TTU_BATCH_FLUSH.
>
> Signed-off-by: Zhiteng Qiu <qiuzhiteng@hygon.cn>
> ---
> Changes in v4:
>  - Compute the try_to_migrate() flags in migrate_pages_batch() with a
>    helper and pass them to migrate_folio_unmap() instead of a bool, as
>    suggested by David.
>  - Go back to v2's check, limited to small folios, using
>    folio_maybe_mapped_shared() as Zi suggested.  folio_mapcount() would
>    stop being a good hint for large folios once try_to_unmap() batches
>    them better (David).
>  - Shorter comment (Zi).
>
> Changes in v3:
>  - Use folio_mapcount() for the check, as Ying suggested.
>  - Cut the changelog down.
>
> Changes in v2:
>  - Pass the try_to_migrate() flags directly and use single_folio in
>    the VM_WARN_ON_ONCE(), as suggested by Ying.
>  - Rewrote the changelog after looking into why b99a342d4f11 does not
>    avoid the flush here.
>
> v3: https://lore.kernel.org/r/20261109122915.2150586-1-qiuzhiteng@hygon.cn
> v2: https://lore.kernel.org/r/20261107143456.1590658-1-qiuzhiteng@hygon.cn
> v1: https://lore.kernel.org/r/20261106041628.1177963-1-qiuzhiteng@hygon.cn
>
> The table was measured on v7.3 with the same check as v4.  On mm-new
> with v4, three balancing on/off pairs gave a 1.9-2.9% loss and
> 13.2-14.6 TLB interrupts per migrated page.
>
> I re-ran the tests on v4: mm/migration selftests 6/6, LTP move_pages
> and migrate_pages 14/14, 30 minutes with compaction forced every 30 s,
> and 4.5 hours of NUMA balancing racing with fork(), MADV_DONTNEED and
> move_pages(), 4 of them on a CONFIG_DEBUG_VM kernel, all without
> warnings.  Splitting partially mapped 2 MiB THPs during NUMA migration
> still gets the batched flush (0.115-0.120 TLB interrupts per migrated
> page), and 64 KiB mTHP and a MAP_SHARED mapping shared by two processes
> behave like base.
>
> No Fixes: tag, as this is a performance trade-off that has been there
> since v6.3 and nobody has reported it as a regression.  Happy to add
> one if you think it should have one.
>
>  mm/migrate.c | 29 +++++++++++++++++++++++++----
>  1 file changed, 25 insertions(+), 4 deletions(-)
>

LGTM.

Reviewed-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
