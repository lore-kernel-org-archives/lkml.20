Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793256356;
	b=c2p3yA4ffmBW3mh6u1SJb3Im5cB0k98GaEoMYoLCCuegyiG/717uidoUPm4DMvWviiwS
	 QoZd0GU6MUlaX7aJcsRApT1Vq6zGjEhBc6Y2RK2gmpiOEiQ22PsRbuevI0hUUiOd9bIyP
	 bS55ZAq2w0xS5pxcuzPRvlWH51ZuoTsJpORFcCZBV/MW6T4EQCI/h6NV79fj54AV4S97H
	 DRACDWgZwnfkCqW4Yd2LSUibArbzLzmf1o1M+RDwuEYk0ICasOcWv2rtNDkxL0L7Byd5N
	 ava5gCM7k8epYDu3OF6jyXUxJ8AnZ7AmvTwypvpKbE9bkiXh/sznL2SuxSUVBaSyWNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793256356;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=1HZdEtGRBinobOm262LWtghp2oUY3RgVs+/v7S0ZtPM=;
	b=5glZme6ockYXbRTB+8cSFpLBXf0jYrtxzmnVXU672NQOGlaYOWMZR3F9Tc3Yg+PUzG/H
	 vK7NPlWWbBU/7FqD/uXryfTwBduRBPpBX8TsqtYSa3e5iKrOq58iYrNe1mGnxCZ/NhGgt
	 NWUBnI9mVRU0MkYh6iCgp0iWX+bVvbapZ60BrzxhFn8fEV3gR61J3v/G7CrD2yp5sYSFG
	 /tUifofm1OQadOgScKJG4oj0yOFEkQE3oe3GeMeJTFQi6eeZ79JpQ+q+hxFkytGT6O5gu
	 Y1LSXYjVcEUoDfcK3ZQQSGNbkiEFCZrFdTPSiavXjAx19KlmpRpYGANwfJajBfhUURA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=erkwwRoG;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FE12606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:45:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FE12606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=erkwwRoG
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92D5B1682;
	Wed, 28 Oct 2026 23:45:51 -0700 (PDT)
Received: from [10.163.153.30] (unknown [10.163.153.30])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D8E93F673;
	Wed, 28 Oct 2026 23:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793256354; bh=wEceBPDAoI7jkb3PQGl1/s7MQmUjV8j5qCga2ORy3jo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=erkwwRoG6+fk1Y3jDeJ13nGzcRLsYy0R9OCVLIYLTULcKkEtbklrmnBpAtpbme0Mp
	 yc1Ho19txmvw15SBggNRsxjjRXm0L55bGaaQLANavxQ2otIesqDLYAA7aE0p+al4JJ
	 L0F9uugIDa/NKe4ON8P8/Xt9RLydxLcoTZ9T4d4Q=
Message-ID: <dd2ee501-fdba-4853-8f8a-e0e78d068148@arm.com>
Date: Thu, 29 Oct 2026 12:15:47 +0530
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
Subject: Re: [PATCH] mm/compaction: annotate data race for
 zone->free_area[order].nr_free
To: Hui Zhu <hui.zhu@linux.dev>, Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Brendan Jackman <brendan.jackman@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: teawater <zhuhui@kylinos.cn>
References: <20261028090747.68086-1-hui.zhu@linux.dev>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20261028090747.68086-1-hui.zhu@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 28/10/26 2:37 pm, Hui Zhu wrote:
> From: teawater <zhuhui@kylinos.cn>
> 
> KCSAN reports a data-race on nr_free which also exists on mainline:
> 
>   BUG: KCSAN: data-race in fast_isolate_freepages+0x284/0x1550 mm/compaction.c:1589
> 
>   race at unknown origin, with read to 0xffff9894ff3dcb60 of 8 bytes by task 179078 on cpu 12:
>    fast_isolate_freepages+0x284/0x1550 mm/compaction.c:1589
>    isolate_freepages+0x52/0x650 mm/compaction.c:1722
>    compaction_alloc_noprof+0x36e/0x3e0 mm/compaction.c:1850
>    compaction_alloc+0x21/0x30 mm/compaction.c:1880
>    migrate_folio_unmap+0x7f/0x820 mm/migrate.c:1177
>    migrate_pages_batch+0x37e/0x1200 mm/migrate.c:1762
>    migrate_pages_sync+0xce/0x560 mm/migrate.c:1928
>    migrate_pages+0x8c6/0xc20 mm/migrate.c:2037
>    compact_zone+0x539/0x10b0 mm/compaction.c:2660
>    compact_zone_order+0x1b8/0x230 mm/compaction.c:2795
>    try_to_compact_pages+0x20b/0x630 mm/compaction.c:2851
>    __alloc_pages_direct_compact+0x98/0x2b0 mm/page_alloc.c:3722
>    __alloc_pages_slowpath.constprop.0+0x452/0xdf0 mm/page_alloc.c:4401
>    __alloc_pages_noprof+0x28a/0x2d0 mm/page_alloc.c:4794
>    alloc_pages_mpol_noprof+0x1b1/0x470 mm/mempolicy.c:2270
>    alloc_pages_noprof+0x7a/0xe0 mm/mempolicy.c:2347
>    io_mem_alloc_compound io_uring/io_uring.c:2848 [inline]
>    io_pages_map+0xb9/0x330 io_uring/io_uring.c:2892
>    io_allocate_scq_urings+0x231/0x300 io_uring/io_uring.c:3933
>    io_uring_create+0x29c/0x9c0 io_uring/io_uring.c:4091
>    io_uring_setup+0xb6/0x100 io_uring/io_uring.c:4203
>    __do_sys_io_uring_setup io_uring/io_uring.c:4230 [inline]
>    __se_sys_io_uring_setup io_uring/io_uring.c:4224 [inline]
>    __x64_sys_io_uring_setup+0x66/0xe0 io_uring/io_uring.c:4224
>    x64_sys_call+0x1816/0x1d90 arch/x86/include/generated/asm/syscalls_64.h:426
>    do_syscall_x64 arch/x86/entry/common.c:51 [inline]
>    do_syscall_64+0x70/0x2a0 arch/x86/entry/common.c:81
>    entry_SYSCALL_64_after_hwframe+0x76/0xe0
> 
>   value changed: 0x00000000000002f4 -> 0x00000000000002f5
> 
> nr_free is only updated with zone->lock held, but fast_isolate_freepages()
> and fast_find_migrateblock() read it locklessly to skip an order that has
> no free pages.  page_alloc.o is excluded from KCSAN, so the writer is not
> instrumented and the report is of unknown origin.
> 
> The race is benign: a stale zero only skips the order for this round, and
> a stale non-zero just finds an empty MIGRATE_MOVABLE freelist under the
> lock.  Annotate both reads with data_race(), following commit
> af1c31acc853 ("mm/vmstat: annotate data race for zone->free_area[order].nr_free").
> 
> No functional change intended.
> 
> Signed-off-by: teawater <zhuhui@kylinos.cn>
> ---

Thanks. With the SOB fixed:

Reviewed-by: Dev Jain <dev.jain@arm.com>

Is a Fixes: tag required? I think stable backport would be overkill but
Fixes makes sense as this leads to a reproducible stack trace?


>  mm/compaction.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/compaction.c b/mm/compaction.c
> index f1b2060eb2016..499ec7ceaa3ed 100644
> --- a/mm/compaction.c
> +++ b/mm/compaction.c
> @@ -1601,7 +1601,11 @@ static void fast_isolate_freepages(struct compact_control *cc)
>  		unsigned int order_scanned = 0;
>  		unsigned long high_pfn = 0;
>  
> -		if (!area->nr_free)
> +		/*
> +		 * Access to nr_free is lockless as it is only a hint; a stale
> +		 * value is harmless. Use data_race to avoid KCSAN warning.
> +		 */
> +		if (!data_race(area->nr_free))
>  			continue;
>  
>  		spin_lock_irqsave(&cc->zone->lock, flags);
> @@ -2031,7 +2035,11 @@ static unsigned long fast_find_migrateblock(struct compact_control *cc)
>  		unsigned long flags;
>  		struct page *freepage;
>  
> -		if (!area->nr_free)
> +		/*
> +		 * Access to nr_free is lockless as it is only a hint; a stale
> +		 * value is harmless. Use data_race to avoid KCSAN warning.
> +		 */
> +		if (!data_race(area->nr_free))
>  			continue;
>  
>  		spin_lock_irqsave(&cc->zone->lock, flags);

