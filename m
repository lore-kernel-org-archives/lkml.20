Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6B84CA78D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788533477; cv=none; b=KzaK19DL+mTBWj6WXGCRGhcRqWg0VVeZzWQhzDU30QaFfBLCW2HAnAPwgWVkSQrhdgkKL0xeN7pq1V+QavQCrBYPdzRe24MEMzTa0HtRwOxc0tW2R+XVIUOskSAreqJXQF+hm2XgrRBUgNgYFoawPcPD74WiOhdFnAxaEBQKbrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788533477; c=relaxed/simple;
	bh=MseMzIxipqppywZRCvbXLDZ2Hxce+9DKsvZkFrEkbGY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OkV6ns6EeQhSUCLOTFtFTcuN0Ffy8gNWJWaCmcNx8HWZVjwHhI5mmAT5GpsYXIT9qDn3u2sRZUvi5uOFMHumTW3K1E9Jn+pv5WNYgoGfF7hx7mypg6Gasv960CrDBw7wyqw1NUHme3uH9xykpXV0+wi8a1t62btdooBvjtcn150=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DIXq8Q3Y; arc=none smtp.client-ip=209.85.208.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DIXq8Q3Y"
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6a67fdea041so1016740a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788533473; x=1789138273; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mLY/ci2oR2yKic2vb+sEbJUZ8whxHO5esQUdSjd9KzA=;
        b=DIXq8Q3YFH1xaWCz0c5AQ8Tq+S6latX9A/S3BGxz1w72d2DkoK93wLVAtPrRKvolhG
         BMnmcNLIP/Wnehlj3DG/nMibNotaZaNQXaPYo7/gYyGUHVj2P96SMuxf4mbomzSqEI0T
         AqZ3KFGK0bZptNd0BBsB4FZ40yiVE9dt1QA3Ja9nl0mPlVv07UOJQFjGOueAYNPLQz6e
         beo/NIvPIq02QOGujjnBWHIKYAvYiHoOrTAaulyR1jHWNtZvv2cj4Cxh0xnRoVx79wPn
         59CVCY4Q/Ryia2hxuo95xFbiae7Q1dHvRQCmuwbULNk8XGa/6xorEKB2nYeWRhRPb57P
         brBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788533473; x=1789138273;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mLY/ci2oR2yKic2vb+sEbJUZ8whxHO5esQUdSjd9KzA=;
        b=CSSoO+CcIRZ/8wZkSIieJxRvIfHVec43TMpcmZaiIme1Lsv9wf0hIykyQVFIbImdb3
         2ULDgn/nMar+q0F1pp3Su4Dw1cXS9BTqxnoZovNsxROPBk9FsO7kgb26n43gSAYLLmrJ
         quDIDqeBk8i5vnnQo1WVIR8CqtFkM4hpIdr/QHgrKtLJW4krO6ryAaWf7DVfKY5PCeee
         ggLtkdnYsykPs762CZevMItxUWS8SwARlS0XEeQo7m+Y5kbgQXF7dNO/J05dTOELYCdp
         yUw9FLoJOo6t7EscmrSnF5f+tbEw6OvdXQYpRD5fmYvb4ytxXRrDp3fnoQFV76pD7Or9
         O2nw==
X-Gm-Message-State: AFuF++kN1Wts1VmbQWBl6OGlmobLjPhyYbWMFAcd0y4hZeIQxBxUtYwP
	RNAngmDQ+2hywrvgFN3LkJ1R6NKrfbfUID8l0F6htXc6NvnhB0CBKhnMEq0Y1hFTNLlGg0Di/f8
	idnrLZ7Gm4YPO5PdnuQ==
X-Received: from edgi19-n1.prod.google.com ([2002:a05:6402:a593:10b0:6a6:8587:3226])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:52c9:b0:6a6:32f5:5573 with SMTP id 4fb4d7f45d1cf-6a7e8f94ac4mr2595587a12.21.1788533473262;
 Fri, 04 Sep 2026 07:51:13 -0700 (PDT)
Date: Fri, 04 Sep 2026 14:51:12 +0000
In-Reply-To: <5c223d7d-4f7b-420c-8019-d4f343f0f232@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260903155907.1065681-1-tarunsahu@google.com> <5c223d7d-4f7b-420c-8019-d4f343f0f232@oracle.com>
Message-ID: <9huz7bl1134v.fsf@tarunix.c.googlers.com>
Subject: Re: [PATCH] memblock: use binary search to locate candidate regions
From: tarunsahu@google.com
To: Dongli Zhang <dongli.zhang@oracle.com>, dmatlack@google.com, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Mike Rapoport <rppt@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Pratyush Yadav <pratyush@kernel.org>
Cc: linux-kernel@vger.kernel.org, kexec@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Dongli Zhang <dongli.zhang@oracle.com> writes:

> On Thu, Sep 3, 2026 8:59:06AM -0700, Tarun Sahu wrote:
>> Use binary search (memblock_bsearch_start) in memblock_add_range() and
>> memblock_isolate_range() to locate candidate regions instead of linearly
>> scanning from index 0.
>> 
>> Under heavy memory fragmentation (such as KHO page preservation registering
>> hundreds of thousands of disjoint folios), scanning from index 0 on every
>> insertion and isolation results in O(N^2) complexity, causing boot-time
>> memory retrieval to take several minutes (~268s for 393k pages).
>> 
>> Using binary search reduces the worst-case complexity to O(N log N)
>> (and O(N) for sequential appends), cutting KHO memory retrieval time
>> from ~268s to ~50ms.
>
> I encountered this issue with my workload. Initially, it was because I forgot to
> set THP to "always", As a result, there were many 4K pages even though they were
> contiguous.
>
> Indeed, I noticed some delays or hiccups with my workload even with THP set to
> "always".
>
> In the past month, I used something like what I attached at the end of my reply
> to reduce the number of memblock_reserve() calls. I never realized the poor
> performance was caused by memblock_reserve() itself.
>
> [    0.231623] mem auto-init: stack:all(zero), heap alloc:off, heap free:off
> --> delay
> [   38.587378] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=32, Nodes=1
>
> With your patch, I ran several rounds of tests with THP set to "never" (4K
> pages) and no longer noticed any hiccups or delays with my workload.
>
> [    0.247746] mem auto-init: stack:all(zero), heap alloc:off, heap free:off
> [    0.512019] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=32, Nodes=1
>
>
> Thanks to this patch, I no longer have to put up with the delays or hiccups in
> my workload!
>
> Thank you very much!

Glad to know it helped and thanks for testing this.

>
> Dongli Zhang
>
>
> diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
> index 7c4d86daf86d..03e1f914c800 100644
> --- a/kernel/liveupdate/kexec_handover.c
> +++ b/kernel/liveupdate/kexec_handover.c
> @@ -67,6 +67,8 @@ union kho_page_info {
>  static_assert(sizeof(union kho_page_info) == sizeof(((struct page *)0)->private));
>
>  static bool kho_enable __ro_after_init =
> IS_ENABLED(CONFIG_KEXEC_HANDOVER_ENABLE_DEFAULT);
> +static phys_addr_t kho_preserved_batch_start __initdata;
> +static phys_addr_t kho_preserved_batch_end __initdata;
>
>  bool kho_is_enabled(void)
>  {
> @@ -610,25 +612,58 @@ static struct page *__init
> kho_get_preserved_page(phys_addr_t phys,
>  	return pfn_to_page(pfn);
>  }
>
> +static void __init kho_preserved_memory_batch_flush(void)
> +{
> +	phys_addr_t size;
> +
> +	if (kho_preserved_batch_start == kho_preserved_batch_end)
> +		return;
> +
> +	size = kho_preserved_batch_end - kho_preserved_batch_start;
> +	memblock_reserve(kho_preserved_batch_start, size);
> +	memblock_reserved_mark_noinit(kho_preserved_batch_start, size);
We can also combine these two function. IIUC, kho_preserved_batch_start
does not overlap with other reserved regions so, they will be mutually
exclusives ranges and can directly be marked noinit while adding to
reserved list.

~Tarun

> +
> +	kho_preserved_batch_start = 0;
> +	kho_preserved_batch_end = 0;
> +}
> +
> +static void __init kho_preserved_memory_batch_add(phys_addr_t phys,
> +						  unsigned int order)
> +{
> +	phys_addr_t size = 1ULL << (order + PAGE_SHIFT);
> +	phys_addr_t end = phys + size;
> +
> +	if (kho_preserved_batch_start == kho_preserved_batch_end) {
> +		kho_preserved_batch_start = phys;
> +		kho_preserved_batch_end = end;
> +		return;
> +	}
> +
> +	if (phys == kho_preserved_batch_end) {
> +		kho_preserved_batch_end = end;
> +		return;
> +	}
> +
> +	kho_preserved_memory_batch_flush();
> +	kho_preserved_batch_start = phys;
> +	kho_preserved_batch_end = end;
> +}
> +
>  static int __init kho_preserved_memory_reserve(unsigned long key, void *data)
>  {
>  	union kho_page_info info;
>  	struct page *page;
>  	unsigned int order;
>  	phys_addr_t phys;
> -	u64 sz;
>
>  	phys = kho_decode_radix_key(key, &order);
>
> -	sz = 1UL << (order + PAGE_SHIFT);
>  	page = kho_get_preserved_page(phys, order);
>
> -	/* Reserve the memory preserved in KHO in memblock */
> -	memblock_reserve(phys, sz);
> -	memblock_reserved_mark_noinit(phys, sz);
>  	info.magic = KHO_PAGE_MAGIC;
>  	info.order = order;
>  	page->private = info.page_private;
> +	kho_preserved_memory_batch_add(phys, order);
>
>  	return 0;
>  }
> @@ -1687,8 +1722,13 @@ static void __init kho_mem_retrieve(void)
>  		.leaf = kho_preserved_memory_reserve,
>  	};
>
> -	if (kho_radix_walk_tree(&kho_in.radix_tree, &cb, NULL))
> +	kho_preserved_batch_start = 0;
> +	kho_preserved_batch_end = 0;
> +	if (kho_radix_walk_tree(&kho_in.radix_tree, &cb, NULL)) {
> +		kho_preserved_memory_batch_flush();
>  		goto err;
> +	}
> +	kho_preserved_memory_batch_flush();
>
>  	return;
>
>> 
>> Signed-off-by: Tarun Sahu <tarunsahu@google.com>
>> ---
>>  mm/memblock.c | 38 ++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 36 insertions(+), 2 deletions(-)
>> 
>> diff --git a/mm/memblock.c b/mm/memblock.c
>> index 9ce86349a29f..88940474b020 100644
>> --- a/mm/memblock.c
>> +++ b/mm/memblock.c
>> @@ -160,6 +160,11 @@ static __refdata struct memblock_type *memblock_memory = &memblock.memory;
>>  	     i < memblock_type->cnt;					\
>>  	     i++, rgn = &memblock_type->regions[i])
>>  
>> +#define for_each_memblock_type_from(i, memblock_type, rgn, start)	\
>> +	for (i = (start), rgn = &memblock_type->regions[i];		\
>> +	     i < memblock_type->cnt;					\
>> +	     i++, rgn = &memblock_type->regions[i])
>> +
>>  #define memblock_dbg(fmt, ...)						\
>>  	do {								\
>>  		if (memblock_debug)					\
>> @@ -591,6 +596,33 @@ static void __init_memblock memblock_insert_region(struct memblock_type *type,
>>  	type->total_size += size;
>>  }
>>  
>> +/**
>> + * memblock_bsearch_start - Find the first region index where rend > base
>> + * @type: memblock type to search
>> + * @base: base physical address of the candidate range
>> + *
>> + * Returns the first region index that could potentially overlap @base.
>> + */
>> +static int __init_memblock memblock_bsearch_start(struct memblock_type *type,
>> +						  phys_addr_t base)
>> +{
>> +	int mid, low = 0;
>> +	int high = type->cnt;
>> +
>> +	if (type->cnt && base >= type->regions[type->cnt - 1].base +
>> +				 type->regions[type->cnt - 1].size)
>> +		return type->cnt;
>> +
>> +	while (low < high) {
>> +		mid = (low + high) / 2;
>> +		if (type->regions[mid].base + type->regions[mid].size <= base)
>> +			low = mid + 1;
>> +		else
>> +			high = mid;
>> +	}
>> +	return low;
>> +}
>> +
>>  /**
>>   * memblock_add_range - add new memblock region
>>   * @type: memblock type to add new region into
>> @@ -651,7 +683,8 @@ static int __init_memblock memblock_add_range(struct memblock_type *type,
>>  	base = obase;
>>  	nr_new = 0;
>>  
>> -	for_each_memblock_type(idx, type, rgn) {
>> +	for_each_memblock_type_from(idx, type, rgn,
>> +				    memblock_bsearch_start(type, base)) {
>>  		phys_addr_t rbase = rgn->base;
>>  		phys_addr_t rend = rbase + rgn->size;
>>  
>> @@ -827,7 +860,8 @@ static int __init_memblock memblock_isolate_range(struct memblock_type *type,
>>  		if (memblock_double_array(type, base, size) < 0)
>>  			return -ENOMEM;
>>  
>> -	for_each_memblock_type(idx, type, rgn) {
>> +	for_each_memblock_type_from(idx, type, rgn,
>> +				    memblock_bsearch_start(type, base)) {
>>  		phys_addr_t rbase = rgn->base;
>>  		phys_addr_t rend = rbase + rgn->size;
>>  
>> -- 
>> 2.55.0.970.g62bdec98f9-goog
>> 
>> 
