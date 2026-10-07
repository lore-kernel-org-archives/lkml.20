Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE073486E62
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 14:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791381962; cv=none; b=NGe9SBIUnTcd64SWEQF8Y7U6wfMu+yKM0H+LQHevKCtecDD90mxI95PmOagEs/8+zGizm2XADkSjx4mWIqwrYQm/DFPxF2QmsFCRW1IeWWJiooTAjsVoiGOrKJd0YacH+scb7Ox2cbR6vyZECn5zKSYsxs8beA2Z8qc0w20fKrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791381962; c=relaxed/simple;
	bh=tseqSqDZVClwUqO3pixW2DIHxy8FD8fL11njnN3NWYk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=G2dEwMGeVhY7bxPMRxQYcKOzyJzypfukb537fJ3BYyB2DSletWyFOC0dN53cf7na7M4hfjw1Dz41TYBduaUMT5Ccq7x/esiQatXzmWQNnq3m+IiB1o27rL5QVSrJXe+D5w0lgM8SC+GOsAHP8fBtq+jzekLNBXbAQLX7dZFOTKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NJvOAEEC; arc=none smtp.client-ip=209.85.218.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NJvOAEEC"
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c2dd399f761so452568966b.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 07:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791381953; x=1791986753; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rU5wB6bHQgxWOlREbKkjzu4hbbXBoycTkgMxfiJ0Mmc=;
        b=NJvOAEECb5tPBn9BAyOUWVG9Z4ld+M06a8SlM0RbeQDv8d8KgjPEJiIgpbGLoW8+hu
         Wuxkxr8C6YLFLkP09Zeo4+NxFYWoBqK22i/QC0CNEuq+MrMZ6BxMDEQXklCx6CokIKYu
         IrCyDmPNYDyFKjKehRPIaSZOoj2Joo4efBpScANKErHtjh7vA5rmAmpNgPcyMZzNVSCl
         buoDGTNeAdcsreOomZaac0lLPSsI+zU5zI0OSi8xHaHOgXZX6knRWZ3s5lrM7NyFdqG4
         5+N8hyTSMFjjyY5jWc6pj/unnARJ9EVvfD4EFPUZNKuqGXL8BJ0WoJESIjeFTMj3+8nD
         f3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791381953; x=1791986753;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rU5wB6bHQgxWOlREbKkjzu4hbbXBoycTkgMxfiJ0Mmc=;
        b=FvTAJpNmLDcnS7msMZfndTwOAfbQNLQPJ9OAUq/1lgJIZyZYEVlvQP3iz88SCcR0sn
         feoijz62/acE+eKWmtEY/L5loQ+29yS+AdrMKYTGyUS7EyuLpP+iy9RTQY6j8Fq3zRYX
         FQTIPeJ4U8igbjj22lRTXhMoov4385H3M4P29ByUgGx+P8TTOxof3V/2J+BzDSicVTEo
         iZ1E2zWofpggL/doD98xiKgnnOEcyPp8lAbmL807b9IBUbJPYp/3Z06P0c/heyJITsK3
         4KVZQgQ+voUPy+hRh+HZDpVoE61g0meM8WYG1DwFcwGJjGCoEAMei5Epjlnv15oCwvS1
         T7+w==
X-Forwarded-Encrypted: i=1; AKwUvBx1fEZpCZ+fQsocvlociTEMhOGwqH7p04lA98+7Bhm1wR2JYsM5yo00Unhf3zxmZe/hqngTHwC8Kxyn3zg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUkYHZFg/v63euIBErMe++l8omvREyWmHiV60MLH0nbiFkThYa
	62gXTHgETZ3PmCit0dJuFkIEb548+cNpET93PNVz6sqC4IA0vU7uAcQ58Slfa99Xbtg3AIZ+qjT
	hiMOIxjLkjByCqUxpMg==
X-Received: from ejac25.prod.google.com ([2002:a17:906:3d9:b0:c2d:c729:d7a])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:7956:b0:c29:f5d5:5a9c with SMTP id a640c23a62f3a-c317c088215mr242709366b.38.1791381952681;
 Wed, 07 Oct 2026 07:05:52 -0700 (PDT)
Date: Wed, 07 Oct 2026 14:05:51 +0000
In-Reply-To: <2vxz8q4dlgrq.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260926092448.4090401-1-tarunsahu@google.com>
 <20260926092448.4090401-2-tarunsahu@google.com> <2vxz8q4dlgrq.fsf@kernel.org>
Message-ID: <9huz1pa1txkw.fsf@tarunix.c.googlers.com>
Subject: Re: [PATCH v3 2/2] memblock: use binary search to locate candidate regions
From: tarunsahu@google.com
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	dmatlack@google.com, Mike Rapoport <rppt@kernel.org>, kexec@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dev.jain@arm.com, 
	Pratyush Yadav <pratyush@kernel.org>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Pratyush Yadav <pratyush@kernel.org> writes:

> On Sat, Sep 26 2026, Tarun Sahu wrote:
>
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
>>
>> memblock_search() open codes the same binary search, so reimplement it on
>> top of the new helper.
>>
>> Signed-off-by: Tarun Sahu <tarunsahu@google.com>
>>
>>  mm/memblock.c | 53 +++++++++++++++++++++++++++++++++++----------------
>>  1 file changed, 37 insertions(+), 16 deletions(-)
>>
>> diff --git a/mm/memblock.c b/mm/memblock.c
>> index 59dda7d085f3..87c71435c80c 100644
>> --- a/mm/memblock.c
>> +++ b/mm/memblock.c
>> @@ -586,6 +586,33 @@ static void __init_memblock memblock_insert_region(struct memblock_type *type,
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
>
> In some testing I did of this patch some time ago, I recall that this
> check didn't have much of a difference on performance. The binary search
> is the real optimization.
>
> Do you think this check is worth keeping?

Yes, This is true. After giving it a second thought. Binary search is
fast enough to find the candidate. Also it will be very common that
Incoming reserved entries are not only from single provider (KHO). Hence,
reserved list will have the entries that might cause above condition to
fail.

I will remove this. But if anyone wants this optimization in future. can
revisit this.

>
> Other than this, I only have a couple minor nitpicks below.
>
> Regardless of these small comments, this patch LGTM so feel free to add
>
> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
>

Thanks for reviewing it.


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
>> @@ -609,7 +636,7 @@ static int __init_memblock memblock_add_range(struct memblock_type *type,
>>  	bool insert = false;
>>  	phys_addr_t obase = base;
>>  	phys_addr_t end = base + memblock_cap_size(base, &size);
>> -	int idx, nr_new, start_rgn = -1, end_rgn;
>> +	int idx, start_idx, nr_new, start_rgn = -1, end_rgn;
>>  
>>  	if (!size)
>>  		return 0;
>> @@ -644,8 +671,9 @@ static int __init_memblock memblock_add_range(struct memblock_type *type,
>>  	 */
>>  	base = obase;
>>  	nr_new = 0;
>> +	start_idx = memblock_bsearch_start(type, base);
>>  
>> -	for (idx = 0; idx < type->cnt; idx++) {
>> +	for (idx = start_idx; idx < type->cnt; idx++) {
>
> Nit: why have start_idx as a separate variable? Why not assign idx to
> the result of memblock_bsearch_start() directly?
>

Right! thanks.

~ Tarun

>>  		struct memblock_region *rgn = &type->regions[idx];
>>  		phys_addr_t rbase = rgn->base;
>>  		phys_addr_t rend = rbase + rgn->size;
>> @@ -809,7 +837,7 @@ static int __init_memblock memblock_isolate_range(struct memblock_type *type,
>>  					int *start_rgn, int *end_rgn)
>>  {
>>  	phys_addr_t end = base + memblock_cap_size(base, &size);
>> -	int idx;
>> +	int idx, start_idx;
>>  
>>  	*start_rgn = *end_rgn = 0;
>>  
>> @@ -821,7 +849,9 @@ static int __init_memblock memblock_isolate_range(struct memblock_type *type,
>>  		if (memblock_double_array(type, base, size) < 0)
>>  			return -ENOMEM;
>>  
>> -	for (idx = 0; idx < type->cnt; idx++) {
>> +	start_idx = memblock_bsearch_start(type, base);
>> +
>> +	for (idx = start_idx; idx < type->cnt; idx++) {
>
> Same here.
>
>>  		struct memblock_region *rgn = &type->regions[idx];
>>  		phys_addr_t rbase = rgn->base;
>>  		phys_addr_t rend = rbase + rgn->size;
>> @@ -2062,19 +2092,10 @@ void __init memblock_mem_limit_remove_map(phys_addr_t limit)
>>  
>>  static int __init_memblock memblock_search(struct memblock_type *type, phys_addr_t addr)
>>  {
>> -	unsigned int left = 0, right = type->cnt;
>> +	int idx = memblock_bsearch_start(type, addr);
>>  
>> -	do {
>> -		unsigned int mid = (right + left) / 2;
>> -
>> -		if (addr < type->regions[mid].base)
>> -			right = mid;
>> -		else if (addr >= (type->regions[mid].base +
>> -				  type->regions[mid].size))
>> -			left = mid + 1;
>> -		else
>> -			return mid;
>> -	} while (left < right);
>> +	if (idx < type->cnt && addr >= type->regions[idx].base)
>> +		return idx;
>>  	return -1;
>>  }
>>  
>> base-commit: 1f18d740165163910df64d3063e1ad31648bc5e0
>
> -- 
> Regards,
> Pratyush Yadav
