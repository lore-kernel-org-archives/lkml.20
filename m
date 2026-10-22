Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.67
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792666355;
	b=cJCSJRxmWp4QIXpowzv/xw635TivCJrKoT/9NpYHfy/vXzk+SFaQsl4ioify6/KY8B+0
	 zZMEzTt2neYRtU4fpPegld8jRGJUKpCWQ9S3BWNYQBCw208c/8tneJJk0cO4xx/rhpS8R
	 gljPFneHn63J+f2VSAf0lH39fSxDWURukPMiIOgYYAHbScpainUZWj4kt7Du/ZaNpKIjV
	 pkKrKxONmiwTyFKZnxk4Al9Jl58rAvgBH67dCRXLPFURwHBwvdSyUc+Ij3DLZm/AXeKW4
	 Y+EcPYVbCnqkZOkl3iREHIO6RLk2O9J0d6t7fkemzCCJaZ0X48KcKGx/L0E1+0m837g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792666355;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=w9Dd2ssvJRSBtfdoXr+5jlyWjNNmYog2TOK/zngVrrk=;
	b=dI5JqBuquKkwmjpYVMXigOMXY5k2wIoxIVqO8Y9ag5nkViIDOl8qxGX2ZvTVLS1/8jb5
	 85NqY8j0La8wuc+KeQizTJEChDMMGHF2hsBiWKelNZTnP0uhVSdRTrwtonTC4T32T+d/n
	 mQDMEkvniUcWI31JinD7n4V6v2P8RtPjPsTIOyM1X0FGeewiZ7Cn6RnZYfzoCbL3Pkap8
	 j/qClEMcT/RhQj7V8YdNyQlgDux5IzCy9kQtrPnPrbbq1PFU7wXLVs5DJiGRv8zgDYBl6
	 /DSldUUUIHjOO6C9j6CX0TnuQWopnQoIDEo6aIwifkf2dP8dlCh4HUe6P7y3fHGj6CQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=jx0FNzRq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.67
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012067.outbound.protection.outlook.com [52.101.48.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEC8606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:52:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAEC8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=jx0FNzRq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vA0EkeEEIOMonwt73K9c7L5lwU0BM+zudUraQP/sz5ZN0VYTGRE2dk/zol7m/zbZ7JJquVTs8wEV/X0ImdSbY0nMER9eWPp49uHktFPDPFXrqc5SY9jzLmvlXAVF+b3u9mPHxdEjuC263EGcpiaM9iPrWeH228Wd0Euor49sGqGdIK+5Fuhjn6Dlf8w3WAI0RAsFUPJ4rCX8bA2KSPmoU6VfRR6yf9SjJjXn3g1uDZKJJ2mY4QcJG+GOLAiorGXQE/MKO1xTS3zko9AujUReKPfOkoEoRJBYYWU6t39piNI0S/icsCYIMj5wWmBw7ng6sTYr1e135TWsR+dqMWJowg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9Dd2ssvJRSBtfdoXr+5jlyWjNNmYog2TOK/zngVrrk=;
 b=CYzvYyO458/7xPfssNzTmUByikPUIU+mc4PBHQg057nMPGJ/z1Dj53ZlPzGoepJryfnFb0JqH870MKJcpN+Z1s+7yFcwRVM71VxJ+g5wu2FGH3TRrNTN/GjU4aisr5MXtz4eXcN9DpIGixXPIBmCzrKEN+zYavLuMykBOMPmmPjibTYNzS3L67RK6+sNCtei+HUXAQy6e8zfCgtnfIwfboHVFU4cRknoux/tTv8odEm33NdkH4oOGw079/Yei6PsHI0xiwjNK7LzBt/BLICifu4VHMGoMDpMk3M4EMfT96QhITL+AWtSHuBO17LWFsBptQ2sX5DI1eg4PkWhPXKwaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9Dd2ssvJRSBtfdoXr+5jlyWjNNmYog2TOK/zngVrrk=;
 b=jx0FNzRqpb2D4pO+bh0PmjVXDsQZk/0PAkI8uWR1W3DNFalv8kJPzxKJXQ0X1P8+ZvzFUmZ5s1MI4ZUWf370RpaHzfCILgTPVffVOdaLoaVdbgrodGIvzpuMC/P+VfGDrCnsK5PsutiQjPtAqPybIW8KvHJE1Iqj+eUPySSLqSI=
Received: from PH5P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::16)
 by DS7PR12MB5958.namprd12.prod.outlook.com (2603:10b6:8:7d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Thu, 22 Oct
 2026 10:52:30 +0000
Received: from CY8PEPF0000005D.namprd21.prod.outlook.com
 (2603:10b6:510:34a:cafe::2d) by PH5P220CA0004.outlook.office365.com
 (2603:10b6:510:34a::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.17 via Frontend Transport; Thu,
 22 Oct 2026 10:52:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY8PEPF0000005D.mail.protection.outlook.com (10.167.247.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.0 via Frontend Transport; Thu, 22 Oct 2026 10:52:29 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 22 Oct
 2026 05:52:28 -0500
Received: from [10.136.45.54] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 22 Oct 2026 05:52:24 -0500
Message-ID: <3c39b754-1f17-430d-8f3b-292b7e3f3691@amd.com>
Date: Thu, 22 Oct 2026 16:22:18 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] mm/memory: drop PROCESS_PAGES_NON_PREEMPT_BATCH
To: Pedro Falcato <pfalcato@suse.de>, Shivank Garg <shivankg@amd.com>
CC: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand
	<david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett"
	<liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport
	<rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
	<mhocko@suse.com>, Ankur Arora <ankur.a.arora@oracle.com>, Peter Zijlstra
	<peterz@infradead.org>, Borislav Petkov <bp@alien8.de>, Bharata B Rao
	<bharata@amd.com>, K Prateek Nayak <kprateek.nayak@amd.com>,
	<x86@kernel.org>, <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
References: <20261022-clear-pages-batch-v1-1-13d3bd0b876e@amd.com>
 <atndhWpGDvs4vHoN@pedro-suse.tail5790ac.ts.net>
Content-Language: en-US
From: "Salunke, Hrushikesh" <hsalunke@amd.com>
In-Reply-To: <atndhWpGDvs4vHoN@pedro-suse.tail5790ac.ts.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PEPF0000005D:EE_|DS7PR12MB5958:EE_
X-MS-Office365-Filtering-Correlation-Id: 0123ed2d-04f2-4589-1a88-08df302a9134
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|7416014|376014|36860700016|1800799024|18002099003|22082099003|5023799004|4143699003|11063799006|261021123027099003|261009223027099003|261021121427099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Xccun1NrrYRaM5boGtOZ84izmYv993svUPrppevW8kD4d14yFFqeX8/pb0i8exiFyPX6ux2+uEfTI67edFgaX78grP0xhorYc8JU4HM3pz8tSaiSMwhlgk8wi6tqtV6fuj9Po2KHR4fZ+A5kRiD9pgF5vGqFBsLcLySFDcDwjbf1kA3NvpBedFZ43/GAValskPj/0q3eOa6MHuyndUV7v1+9//RFTWiykkpoAF77HhDwPHmAQNLkaJ1SBuedPs8zT1XI4qyZSM9jhT/5dTl119kazmeO3ja+8nmMppnjxoioBwOPHtJJMXcHrlw7CInNuyiiGsvtVuxnEJUoTJPqKwPivKtWy1bI+3s/NIN0KAzJaBAsEz5W2+lgO8ecn5blanUcV8mhkzQYZEDpjIdEVlfomFKXRaAKzBgJVU3V5lWTAjMToKMl0ee8zF25504eMpjwDHuWQhGEAPczgLDVOczU4Sz5+jTR15MBAvyxth0VPTDC7xZSf84mZKTKJKm/SX4X1edfSahEod/rUraStnntJwamalx/0lXQuju+vPVBe+YKI7CTSjjhNUmCIcntOY67XM9sEuhA+ajhznLMZN1+gSY/am6pQlNNtx4Fm3bYIGm4g11/2OTHoPZeNOqfMEK2ejBwXExaSbdU9WlWVwP+1PouUQZNkiQ0h4ot41s=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(7416014)(376014)(36860700016)(1800799024)(18002099003)(22082099003)(5023799004)(4143699003)(11063799006)(261021123027099003)(261009223027099003)(261021121427099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Z+6iifCh2146QOlud7nEeRfiZjyt4oT38Ko6wMc49PCHZY6hi5NnRiYvJKftCvM6I4oS7JotgLqJFalefPCskbekFcExD+KMIuMrCrqBG8Nt64+a7PK3qzoF+qzLzsixdSg1zSECSMkZNzpkIpYWSofphGzVjnqXUDDClLJ+LghAVcNRWwqLZlcRTz0pCN5REd8mVcqJu1cSSnd2+wqiV/5wNaHXucPtof7PqXrh/RwaEaZshtU8y6buh9Kn9lgPxxPJgpGMEwETiSI39zQ7VvygzgHwSgbP/gGsY3YDehWiKywM0+HMC3XPgIecrwgW2Ui8psoIdcdKIlXceY+nQ8QQRuQDyDoDQ80m3ssOfR6ahKhNr+Or7llJ2UDh6v4oWnWw9zyvWNGQStxTwGDKqgwdda6gHhZ0JY8gSkVgvezmBIOH4PNBxbrgVyFSZCk7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 10:52:29.1880
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0123ed2d-04f2-4589-1a88-08df302a9134
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY8PEPF0000005D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5958

On 22-10-2026 15:28, Pedro Falcato wrote:

> On Thu, Oct 22, 2026 at 08:14:30AM +0000, Shivank Garg wrote:
>> clear_contig_highpages() clears the whole range at once under
>> preemptible models. Otherwise it clears PROCESS_PAGES_NON_PREEMPT_BATCH
>> pages at a time, with a cond_resched() in between. The batch is 32MB if
>> the architecture defines clear_pages(), and one page otherwise.
>>
>> Since commit 7dadeaa6e851 ("sched: Further restrict the preemption
>> modes"), architectures that support lazy preemption only offer the
>> full, lazy and RT preemption models, also with PREEMPT_DYNAMIC. x86 is
>> one of them, and it is the only architecture that defines
>> clear_pages(). So the 32MB batch is never used: whenever
>> clear_contig_highpages() runs under a cooperative model, the batch is
>> one page.
>>
>> Make that explicit. Clear the whole range when CONFIG_PREEMPTION is
>> set, and one page at a time with cond_resched() in between otherwise.
>> Drop PROCESS_PAGES_NON_PREEMPT_BATCH, which has no other users.
>>
>> PREEMPT_DYNAMIC kernels also have CONFIG_PREEMPTION set, and
>> cond_resched() does nothing on any of these kernels. So a build-time
>> CONFIG_PREEMPTION check is enough, and preempt_model_preemptible() is
>> not needed.
>>
>> No functional change intended.
>>
>> Suggested-by: David Hildenbrand <david@kernel.org>
>> Signed-off-by: Shivank Garg <shivankg@amd.com>
>> ---
>> This came up in review of the copy_mc_highpages() series [1]. Pedro
>> pointed out that most architecture are full or lazy preempt, so mm does
>> not need to check the preemption model at runtime or batch the copy for
>> cond_resched(), and simple per-page fallback is enough for non-preemptible
>> models. David suggested doing the same for the zeroing path, and
>> this patch does that.
>>
>> [1] https://lore.kernel.org/all/20261019-batpagecopy-v2-1-d75e7d0dfaae@amd.com
>> ---
>>  include/linux/mm.h | 28 +---------------------------
>>  mm/memory.c        | 29 ++++++++++++++++-------------
>>  2 files changed, 17 insertions(+), 40 deletions(-)
> Awesome!
>
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index 35f5fc43861a..1083d0645d63 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -5269,7 +5269,7 @@ static inline void clear_page_guard(struct zone *zone, struct page *page,
>>   *
>>   * When running under preemptible models this is not a problem. Under
>>   * cooperatively scheduled models, however, the caller is expected to
>> - * limit @npages to no more than PROCESS_PAGES_NON_PREEMPT_BATCH.
>> + * clear one page at a time and call cond_resched() in between.
> Why can't clear_pages() itself do cond_resched()?

clear_pages() is also used from contexts that cannot sleep. The page
allocator zeroes via clear_highpages_kasan_tagged(), which uses
clear_pages() for __GFP_ZERO/init_on_alloc in post_alloc_hook() and
for init_on_free in __free_pages_prepare(). Those run in whatever
context the allocation or free happens in, so clear_pages() can't call
cond_resched().

Regards,
Hrushikesh


