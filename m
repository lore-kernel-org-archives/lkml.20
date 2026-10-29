Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793254773;
	b=w2kLRsauy25+DNQRabE3JuD4u8He1vic0HsSGue1MoYGV8BAoAd4MwDGYo5FEnm/y1cC
	 0TbAhr+9czO8D6+ZXd4Svp700pWzmD5IMRZd07CNMjd/WjhP/oZnTcf03w3QGpgMk1nED
	 F6jm8qVPSXWOWqqan9qz+Qu5C5gtmNYRqwttdu4E9Sj9vlNYY6apeD2+0vkGDF+DMm7GM
	 ZAs1d1JDZhx467XoCfRu0WnG0gRNNXOlYoL/fl33wel3r6JvneFOZcmUKTMhNIfuWeGJy
	 dJa0sujpOdl55xYEdiH1LoVUOlCqmsOHdXktxXKyJLQMUlQywB4mNDyUwPrwBBBRx8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793254773;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=mZElNr4luEtzZZ0O/K8I6GXZDNPe8XWgMVKSP+jJ9n8=;
	b=RuhYr8ksw/YQwI9U1Cmkxr7WkXaOs/IOE/u5aPM4P5/+29NGQYfsALSoNGRM4Q0f+PCf
	 jHwzdkGKnHvp6lUc+5xX8G1s2ftqS4thkWvn6R1gNuj7EKiPIJo+z81c0eeCaWW4dwjSx
	 hfYpqkLgEsokv9oQPUfDQWjFY8IaXeJtFkxWx/RjxCqdWNQbX456FyZCHIpN7RhwtvMfa
	 U+0NsuSDXcGBoBnhnukH4qzDEyevO5+MYARn73iky74MYcVapIA81kxgLjE1TvlJPvWM4
	 eh2X1MWkQTdeMyQDjVxVflo+JXvCmcVdaK7sFGStGpWV9w8iMJGyt0MChekThZ6mc9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=t0GaDORo;
	arc=none smtp.remote-ip=91.218.175.172
Received: from mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAA7606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:19:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECAA7606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=t0GaDORo
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XbuiEYOxIfwUc/1yQoSDFfJ/vqmXXN2lOdBbPBDeo00=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793254769; v=1; x=1793859569;
 b=t0GaDORoxdS6kVlTG2PkR06Y2gIQMt7yWZDAXFsJ7F0rZA7IjYMDoHcHOVnTx3NHpSGlTCP+
 37zPYUuOl991HVgAVy/qNFW36HDpQW42nQ7yyY7gLiLAoJPKcqb+08KmrDGlxr/2HziuNEbaXuL
 P6FenMZ29S3Km+cP1jfp30i8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b10954797ac84e40;
	Thu, 29 Oct 2026 06:19:29 +0000
X-Mizu-Trace-ID: b10954797ac84e40
X-Migadu-Flow: FLOW_OUT
Message-ID: <8fe9539a-1a0b-44a0-aec9-032235e8fee3@linux.dev>
Date: Thu, 29 Oct 2026 14:19:17 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (macOS/Intel)
Subject: Re: [PATCH] mm/compaction: annotate data race for
 zone->free_area[order].nr_free
To: Dev Jain <dev.jain@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Brendan Jackman <brendan.jackman@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: teawater <zhuhui@kylinos.cn>
References: <20261028090747.68086-1-hui.zhu@linux.dev>
 <548d9950-cc77-4c1b-b78a-34e304adb989@arm.com>
Content-Language: en-US
From: Hui Zhu <hui.zhu@linux.dev>
In-Reply-To: <548d9950-cc77-4c1b-b78a-34e304adb989@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2026/10/28 18:30, Dev Jain 写道:
>
> On 28/10/26 2:37 pm, Hui Zhu wrote:
>> From: teawater <zhuhui@kylinos.cn>
>>
>> KCSAN reports a data-race on nr_free which also exists on mainline:
>>
>>    BUG: KCSAN: data-race in fast_isolate_freepages+0x284/0x1550 mm/compaction.c:1589
>>
>>    race at unknown origin, with read to 0xffff9894ff3dcb60 of 8 bytes by task 179078 on cpu 12:
>>     fast_isolate_freepages+0x284/0x1550 mm/compaction.c:1589
>>     isolate_freepages+0x52/0x650 mm/compaction.c:1722
>>     compaction_alloc_noprof+0x36e/0x3e0 mm/compaction.c:1850
>>     compaction_alloc+0x21/0x30 mm/compaction.c:1880
>>     migrate_folio_unmap+0x7f/0x820 mm/migrate.c:1177
>>     migrate_pages_batch+0x37e/0x1200 mm/migrate.c:1762
>>     migrate_pages_sync+0xce/0x560 mm/migrate.c:1928
>>     migrate_pages+0x8c6/0xc20 mm/migrate.c:2037
>>     compact_zone+0x539/0x10b0 mm/compaction.c:2660
>>     compact_zone_order+0x1b8/0x230 mm/compaction.c:2795
>>     try_to_compact_pages+0x20b/0x630 mm/compaction.c:2851
>>     __alloc_pages_direct_compact+0x98/0x2b0 mm/page_alloc.c:3722
>>     __alloc_pages_slowpath.constprop.0+0x452/0xdf0 mm/page_alloc.c:4401
>>     __alloc_pages_noprof+0x28a/0x2d0 mm/page_alloc.c:4794
>>     alloc_pages_mpol_noprof+0x1b1/0x470 mm/mempolicy.c:2270
>>     alloc_pages_noprof+0x7a/0xe0 mm/mempolicy.c:2347
>>     io_mem_alloc_compound io_uring/io_uring.c:2848 [inline]
>>     io_pages_map+0xb9/0x330 io_uring/io_uring.c:2892
>>     io_allocate_scq_urings+0x231/0x300 io_uring/io_uring.c:3933
>>     io_uring_create+0x29c/0x9c0 io_uring/io_uring.c:4091
>>     io_uring_setup+0xb6/0x100 io_uring/io_uring.c:4203
>>     __do_sys_io_uring_setup io_uring/io_uring.c:4230 [inline]
>>     __se_sys_io_uring_setup io_uring/io_uring.c:4224 [inline]
>>     __x64_sys_io_uring_setup+0x66/0xe0 io_uring/io_uring.c:4224
>>     x64_sys_call+0x1816/0x1d90 arch/x86/include/generated/asm/syscalls_64.h:426
>>     do_syscall_x64 arch/x86/entry/common.c:51 [inline]
>>     do_syscall_64+0x70/0x2a0 arch/x86/entry/common.c:81
>>     entry_SYSCALL_64_after_hwframe+0x76/0xe0
>>
>>    value changed: 0x00000000000002f4 -> 0x00000000000002f5
>>
>> nr_free is only updated with zone->lock held, but fast_isolate_freepages()
>> and fast_find_migrateblock() read it locklessly to skip an order that has
>> no free pages.  page_alloc.o is excluded from KCSAN, so the writer is not
>> instrumented and the report is of unknown origin.
>>
>> The race is benign: a stale zero only skips the order for this round, and
>> a stale non-zero just finds an empty MIGRATE_MOVABLE freelist under the
>> lock.  Annotate both reads with data_race(), following commit
>> af1c31acc853 ("mm/vmstat: annotate data race for zone->free_area[order].nr_free").
>>
>> No functional change intended.
>>
>> Signed-off-by: teawater <zhuhui@kylinos.cn>
> teawater? What?

Oops! Should be:

Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>

>
>
>> ---
>>   mm/compaction.c | 12 ++++++++++--
>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/mm/compaction.c b/mm/compaction.c
>> index f1b2060eb2016..499ec7ceaa3ed 100644
>> --- a/mm/compaction.c
>> +++ b/mm/compaction.c
>> @@ -1601,7 +1601,11 @@ static void fast_isolate_freepages(struct compact_control *cc)
>>   		unsigned int order_scanned = 0;
>>   		unsigned long high_pfn = 0;
>>   
>> -		if (!area->nr_free)
>> +		/*
>> +		 * Access to nr_free is lockless as it is only a hint; a stale
>> +		 * value is harmless. Use data_race to avoid KCSAN warning.
>> +		 */
> The comment is noise, the reason of using data_race() is a well-known fact.
>
> Apart from that, do we have the same problem with zone_watermark_ok? It also
> uses area->nr_free without zone lock.

Yes, __zone_watermark_ok() has the same lockless read of area->nr_free
(mm/page_alloc.c:3646), but it does not need annotating.

mm/Makefile sets KCSAN_SANITIZE_page_alloc.o := n, and all writers of 
nr_free
live in that same translation unit (__add_to_free_list() at page_alloc.c:792
and __del_page_from_free_list() at page_alloc.c:843, both static 
inline). With
both sides uninstrumented, no watchpoint is ever installed and KCSAN cannot
report it.

That is also why the compaction report says "race at unknown origin": 
the read
side in compaction.c is instrumented, the writer in page_alloc.c is not, so
KCSAN infers the race without being able to attribute it
(kernel/kcsan/core.c:687). af1c31acc853 hit the same thing in vmstat.c.

The race is equally benign: a stale zero fails the watermark check and the
allocator retries; a stale non-zero passes it, and __rmqueue() re-checks 
under
zone->lock via find_suitable_fallback() (page_alloc.c:2266).

So annotating page_alloc.c:3646 would be a documentation-only change to 
another
subsystem, silencing a report that cannot occur. I'd keep this patch 
scoped to
mm/compaction. If the KCSAN exclusion for page_alloc.o is ever lifted, 
it will
need the annotation then -- but that means sweeping the whole file.

I also checked the remaining readers of free_area[].nr_free; all are under
zone->lock: show_mem.c:378, page_reporting.c:188, page_alloc.c:2266.

Best,
Hui

>> +		if (!data_race(area->nr_free))
>>   			continue;
>>   
>>   		spin_lock_irqsave(&cc->zone->lock, flags);
>> @@ -2031,7 +2035,11 @@ static unsigned long fast_find_migrateblock(struct compact_control *cc)
>>   		unsigned long flags;
>>   		struct page *freepage;
>>   
>> -		if (!area->nr_free)
>> +		/*
>> +		 * Access to nr_free is lockless as it is only a hint; a stale
>> +		 * value is harmless. Use data_race to avoid KCSAN warning.
>> +		 */
>> +		if (!data_race(area->nr_free))
>>   			continue;
>>   
>>   		spin_lock_irqsave(&cc->zone->lock, flags);
