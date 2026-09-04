Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85546381E84
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788536020; cv=none; b=ZBYEOLeTcHYfn6OBwR8jVTGoUnDDVtgw9T3/RPDsUV4watGNIC2ya/U4r6z2h7NRzLb13xnEyHI2Nrevv+CMGftqIfmD2VDHsQC/LuBWrDjNklTE+WEoqcyHfK91Z7CFgdQES+wGQFMM0+Ii7mgRAmmRy2K9+Pj/IOtlh6rA4ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788536020; c=relaxed/simple;
	bh=XS3nqehPXvBU2QE/XQ6aKQd2nnMe72lQNj3nM14MBfc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZNtlzfuzIwGiE7K63mDB7hbECugzqU15njy+dkkC1GyLxv/LfVtxYgCqJKAVxWYCRxlRNn5rXaTVVIsYJQtKDGPeN4OLtoMDwc+S4839v3dkH0smwgn5beFodWE1IYur869XJEBohkxrM6zLFuaMY06X4MjLoRoi3nmKxWL4TrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aHs5xdpz; arc=none smtp.client-ip=209.85.208.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aHs5xdpz"
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6a60a4f1ae2so1537432a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788536016; x=1789140816; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MYO1KvVzPLClFw7IZqRu5rT86PANfLF01lGRYL9GdyA=;
        b=aHs5xdpzSh0lhGcXmJd5IUCNQRT0xnXz6jMPGwJYFTYX20UR7kE9TzhEh/oHu2w/Og
         e8Vvfvyc4r930Ugg8DHWnFx3sxed2pJfiYLtVZsDOPHz3eIG3idsHzHB2D79uvPYJEcg
         i1pDweKaPlq8B/JEjxKTJYFkoVzDvbvqUfgtKYn3sdRLJpT8sVjHX/CE6ec2XZbe27Ac
         bXZiCBa9KjY7sqR7dPIdNryA/dhUBpYZqhJvRqyWhA//bQFzd65EgznRTx9w3OmJC8i4
         j0mp+UlNKZ4d8dnKK8b30mS67rTnW8S3OVTfutD4smeUgxYKrHbNFiVGsZ1TDCBfz2cH
         5Fcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788536016; x=1789140816;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MYO1KvVzPLClFw7IZqRu5rT86PANfLF01lGRYL9GdyA=;
        b=Dc0t82lMD0CId7hRjzQej5chZsDVreafbr852RJIGDr3Ixm0nifNQDmGPjzf28rcgB
         I6Cj5/onk8d3/MFiFKnyvafsgcfBCjA6KN9qg1FkfJqhfuAKSC9iuTS5g2RBe1hKk7/0
         7wqQzFC6JxBeSuXmlJBI1wNcK5eih2j8BIgk4L8rnUNp4rVc4Dp4WOz7I8Tvl4eOvJVG
         /4W2DthTO3bJ4vdDrta/eXxAuY56Zf25XjZg/vdZxTbrRdEZYAKgJh8XwdoZS77o0VcD
         q6ccoW3oglvGODxdSnfme+oem6oh9b+I8GqGzC2F/d2NBnYvmytz1DMCrlYfKzbyYgAR
         sO5Q==
X-Gm-Message-State: AFuF++maLzmRljbDDstJORsOVf5Kieb8qsey4wQ9L3mnGVVboJAwlekJ
	kNg1D48HP2ia680O/TaIlOxdJWYP/GYfhOzeb4hko6ji40Q03/YcH5hoHdAAnE4gC1caCgKW8Un
	l4lnfp8Zq3k+SXz9wlQ==
X-Received: from edj28.prod.google.com ([2002:a05:6402:325c:b0:6a7:e24b:5a30])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:f0b:b0:6a7:ee56:815f with SMTP id 4fb4d7f45d1cf-6a7ee568276mr1201539a12.45.1788536016263;
 Fri, 04 Sep 2026 08:33:36 -0700 (PDT)
Date: Fri, 04 Sep 2026 15:33:35 +0000
In-Reply-To: <925c45d9-91dc-406a-9ff5-8c16f3ee0d9f@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260903155907.1065681-1-tarunsahu@google.com> <925c45d9-91dc-406a-9ff5-8c16f3ee0d9f@arm.com>
Message-ID: <9huz4ig51168.fsf@tarunix.c.googlers.com>
Subject: Re: [PATCH] memblock: use binary search to locate candidate regions
From: tarunsahu@google.com
To: Dev Jain <dev.jain@arm.com>, dmatlack@google.com, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Mike Rapoport <rppt@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Pratyush Yadav <pratyush@kernel.org>
Cc: linux-kernel@vger.kernel.org, kexec@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Dev Jain <dev.jain@arm.com> writes:

> On 03/09/26 9:29 pm, Tarun Sahu wrote:
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
>> Signed-off-by: Tarun Sahu <tarunsahu@google.com>
>> ---
>
> I recall noticing this 2 years ago : ) but then abandoned because
> I couldn't think of a usecase.
>
> I have forgotten memblock and no idea on KHO, but are you sure
> this patch won't have negative consequence for the usual cases?
> In other words is this something KHO specific, and in the usual
> cases a linear search is more cache/CPU friendly?
>

Linear search on very large list: A very big problem
Linear search on small list (< 100): Good and almost 100% cache hit
because of next memory prediction by CPU.

Binary Search on very large list: very good thing
Binary search on small list (< 100): Algorithm anyway faster (worst case
cycle 3-4 vs 100 in linear search), yes cache miss is problem but IIUC,
To contribute to latency significantly, the quantity of such cache
misses is very less. Binary search uses more instruction per loop than
linear search, so of course linear search is better in this case, But
that micro/nano seconds latency affect is really an issue here? because
memblock is boot time initialization code. (Except memory hotplug) So No
userspace application like HFT or gaming will be affected by this.

So I believe, binary search wins here. Let me know your thoughts?

> Also below I see you have implemented a custom binary search helper.
> I recall a generic one is there in some .h file somewhere in the
> codebase, perhaps that may be useful, just FYI, ignore if already
> tried that.

This one does lower bound serach:  To find the first element where the
addition can be done instead of trying to find the exact match.

This one has a fast-path unlike to general binary search:

+	if (type->cnt && base >= type->regions[type->cnt - 1].base +
+				 type->regions[type->cnt - 1].size)
+		return type->cnt;

Also, I followed what memblock_search already does, Having its own
binary search.

~Tarun

>
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
