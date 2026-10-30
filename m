Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793351855;
	b=T9KS5xvqgFi3ICfQKn9nvcoTuJBwo5x/WL/vWXsQrv59RHYFQdCjwOaCYimiqX6Bi7k/
	 KgRIyeKtowZmUq72pkRHLO9heGNB9nTGhLd2LaOwRBj+a7hml7pQsNdrGwyoRtqxIz/ia
	 94D6/UabivWXDiS6hZwQCoZtCc3BEV1fIOZn5x+A8ltpJ5mGcruIoDcS5DBsQ8IyyfddF
	 OMgGJea0848zxX/XcqVo6DzRR3QzVT0pdbAM1IZ0GNLMPgxqZikM3v2c50gl5Ch7xPby1
	 9YHHQdQ2WDNwCf5dF0B6sKlQDiXvwFRyDQXKGzmVglSjX0HzXqUISqrDyX8quzG8WGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793351855;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=y4m2dew9P9rIjGkRdz/958V+AeBzbsXSeXdzgk/SJkY=;
	b=Ssr6q8MSuAEOIOxJHBSrULr0rO+HAP8gAe66Sh7Mj+XMcPwCkAmKoEBmdooGCRTfO/83
	 k0gOWGbtfblRA+u6O1U69P2DZ8tlFyp1S0gYZ4VFbSbgIIPmvcwqWyalw/rHUbUMTUUS/
	 Kpfj9su5Nssm9RbOv5cfzIQOERahbQGEE7dKZbMg+62R4Na6IWjSSuiMun/VmldFGGf3H
	 Oo5EhSEBsRXhfQXwd+6eiRGGBnTwDh81k2qovEeP78V8sS2+uLMZG3qpitVS4gU/FJLC1
	 ZhB1k0Ff6EpRhqrJhl3Kc7FF6T5l8r7e4udQ1ebnffY1AqMGwBXD064ZEs2M94bKnUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dscb0HDQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDB0606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dscb0HDQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DC511F00A02;
	Fri, 30 Oct 2026 09:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793351854;
	bh=y4m2dew9P9rIjGkRdz/958V+AeBzbsXSeXdzgk/SJkY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=dscb0HDQHU3LPRAvgHZNwJlDdA4XbzTW3mtu4h3cji8yu9GCCy/NPOmI9BCMwsrP6
	 T0W2hIPak8ju7SRvguPnASEdKD7kqk/GzAlER6nx8cAjoee9W8UnRv+c/PeJVeB20A
	 w3kjcXnmu4b41kmCTuLOpQnm6sS/BB2Pao3J0g5rxBb5Ya7iUaOD73UE4jvoPheLLf
	 bHZ9mcuXQ4uu9n6IQa6jIpOSa66R20oB4r7kxRl2FLvbUbki76zQ4VNrw0qXIPigTA
	 igAUCS9TWrpAcE0p+cYdpZiVVr8FSlIcxHVt6rkXpxddipFNTCNO5lQ2IWD8ldfzRj
	 1+u6s2Wb/+InA==
Message-ID: <88f26b45-4f00-43bc-8369-b27a2cf48f2d@kernel.org>
Date: Fri, 30 Oct 2026 10:17:29 +0100
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
Subject: Re: [PATCH v2] mm/compaction: annotate data race for
 zone->free_area[order].nr_free
To: Hui Zhu <hui.zhu@linux.dev>, Andrew Morton <akpm@linux-foundation.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <brendan.jackman@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Hui Zhu <zhuhui@kylinos.cn>, stable+noautosel@kernel.org,
 Dev Jain <dev.jain@arm.com>
References: <20261030025507.115248-1-hui.zhu@linux.dev>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Content-Language: en-US
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <20261030025507.115248-1-hui.zhu@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/30/26 03:55, Hui Zhu wrote:
> From: Hui Zhu <zhuhui@kylinos.cn>
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
> Fixes: 70b44595eafe ("mm, compaction: use free lists to quickly locate a migration source")
> Fixes: 5a811889de10 ("mm, compaction: use free lists to quickly locate a migration target")
> Cc: stable+noautosel@kernel.org # KCSAN annotation only, no functional change
> Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
> Reviewed-by: Dev Jain <dev.jain@arm.com>
> Acked-by: Zi Yan <ziy@nvidia.com>
> ---
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

Could it say something more useful? E.g. "opportunistic lockless check.
false non-zero is ok, we inspect the freelist under lock. false zero is ok,
we just miss this order"

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

Ditto.

> +		 */
> +		if (!data_race(area->nr_free))
>  			continue;
>  
>  		spin_lock_irqsave(&cc->zone->lock, flags);

