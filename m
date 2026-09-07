Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017D31E3DDE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788753632; cv=none; b=uOHF/TEA2LwDuhNCLfbd8m4VkL1J/jfQTfsMBc6f8TV1YnqYoY1os4nJ7//AjqXykSPNZSLoXURe+KiytqHRQhS4kMPENhxHQJwIyTa1h8StvdIlCRC2UxFcg6YEEzYRQ5yi20qfJsWDzARML8Z31iDxzXPVE5vDiq6QHgdvM/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788753632; c=relaxed/simple;
	bh=6xXvJnEys6s0eOWiQuVH2AYlNtvheC1WGn8R/ksO9sg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LuxVYhSY/mBe/t4wvU4pykuxsIiUeO2eXTESZuPJ2xP3gLsFOCQjR80Sgy3KsI7w9IWCgW1jO5oTSK1YORV79pNKhI3qfgqXkHT34xj59G1WWcvSfVlm2czhCpV+AS3D2WtRfLA3UoB7gtJK18VOXqUne2CdT4sGJP0/CpfqnqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h/1FcwGM; arc=none smtp.client-ip=209.85.208.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h/1FcwGM"
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6a64cb77b0aso2445406a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788753629; x=1789358429; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=um99HQvxm8U8bWkMubZ+aKjTZImXgaTd+AqHI5SXH5Q=;
        b=h/1FcwGMHewnmYkY9KQBte4+UDHqPx/TpUKRdp5iUXEO7gIJZ4J/VM2h9lMcfOILVJ
         cpj/e1dr3G4VhlxCHqiDtGqurdX1G43DlbLdZgv5MutReEr/z3x9VyDusEr9JgeYk0at
         Ha5pXIFh9eMZgavE9nzGd5g1vi9DPo9Nl74NnUl1HQHywv0TesPud/ab5vOsoO1C6cin
         13gq6352wI2bVOtGIb5nb9RLlVPcGIvKUIMDVdNhgEB1q2jqYxnYk9N9dRzbxg/uBteL
         KFV3haV0nIYJgXqyfUigqlHsS+3Srd+I/qexG21oyXTnhLfq5a/sHoVKGHpdrtEGj9zG
         7b8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788753629; x=1789358429;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=um99HQvxm8U8bWkMubZ+aKjTZImXgaTd+AqHI5SXH5Q=;
        b=gtCqN4BdFYuM26xk87ehWiqb4+7n6sdTWaNlb6C5v7D9VLJF8IW0HpzpcczK4M4C/+
         XrR5ykLLUCWZr4krNy4ff6RyyiHm6atuk/OBDHCQz6V9AH/exUHny1ual1G5NyjSCbaA
         CFGb1oTd6+PDMpYy2rJnGzcIJpOiEymKMmH8+5pYpFkneEIp7K+FLI3x9U6ZMLex06Dh
         /OtAcIkhMfl3hUvbb5A5wuMxE8PV5wUQiJSsjFvw53SjNYNfttMHhRFR1TZ48Bkby90l
         Oo3wNU3xNurRDeo4Y9s4Nfv7DDmEgU++nGXQ/lUuZa6uMlt8OsB87zTNAOt3ZZz4HRzj
         YX8Q==
X-Forwarded-Encrypted: i=1; AKwUvBwUNQYACCIUy6zDlGGPT8aPso6qqdQ0R/qLB8LxN8gOAK+G8O285pzmRo/LnGB8LizkQPtSXl/DahAn5xg=@vger.kernel.org
X-Gm-Message-State: AFuF++nyv3HyM9jXAyramTsHHiMBOP0M2cbdKrpAnMDz4HxKoAOdqLOb
	pL/Xhhhn+3wIb84ndfk49ZVaYO3bTBDMq2ftlGMenEOCwgRGFMTjw0F6CKKYUG1sm+Yp7tkwTWk
	YKce40BC9p4KQiSfFlQ==
X-Received: from edqt8.prod.google.com ([2002:aa7:d708:0:b0:6a7:60c4:e4ad])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:3241:b0:6a6:32fa:1e9a with SMTP id 4fb4d7f45d1cf-6a7e90c2f67mr4994847a12.18.1788753628866;
 Sun, 06 Sep 2026 21:00:28 -0700 (PDT)
Date: Mon, 07 Sep 2026 04:00:28 +0000
In-Reply-To: <ap0_lSVF43FP3PPb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260903155907.1065681-1-tarunsahu@google.com> <ap0_lSVF43FP3PPb@kernel.org>
Message-ID: <9huzwlsxk8wz.fsf@tarunix.c.googlers.com>
Subject: Re: [PATCH] memblock: use binary search to locate candidate regions
From: tarunsahu@google.com
To: Mike Rapoport <rppt@kernel.org>
Cc: dmatlack@google.com, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Pratyush Yadav <pratyush@kernel.org>, 
	linux-kernel@vger.kernel.org, kexec@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Mike Rapoport <rppt@kernel.org> writes:

> Hi Tarun,
>
> On Thu, Sep 03, 2026 at 03:59:06PM +0000, Tarun Sahu wrote:
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
>
> We already have memblock_search() ;-)

Yes, I preferred to have saperate function because we need to search
lower bound but not the exact match, as new entry might not exist and
memblock_search will return -1 in that case.

To not duplicate the binary search code, we can update the
memblock_search as the wrapper of memblock_bsearch_start (Approach 1):

diff --git a/mm/memblock.c b/mm/memblock.c
index 88940474b020..d9a71234abcd 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -2096,17 +2096,10 @@ static void __init_memblock memblock_dump(struct memblock_type *type)
 static int __init_memblock memblock_search(struct memblock_type *type, phys_addr_t addr)
 {
-	unsigned int left = 0, right = type->cnt;
-
-	do {
-		unsigned int mid = (right + left) / 2;
-
-		if (addr < type->regions[mid].base)
-			right = mid;
-		else if (addr >= (type->regions[mid].base +
-				  type->regions[mid].size))
-			left = mid + 1;
-		else
-			return mid;
-	} while (left < right);
-	return -1;
+	int idx = memblock_bsearch_start(type, addr);
+
+	if (idx < type->cnt && addr >= type->regions[idx].base)
+		return idx;
+	return -1;
 }

OR Approach 2:

The above approach still introduce two function for doing the search.
So, I thought of updating the memblock_search(..., enum search_type) but
this will require changes to all the places of memblock_search also.

I prefer approach 1, As it will keep the binary_search code
within single function and have two function for two different type
return values.

WDYT?

>
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
>
> I think we can just kill for_each_memblock_type() and open code all loops
> that use it and make memblock_add_range() and memblock_isolate_range() use
> binary search.

Agree, there were three places memblock_add_range, memblock_dump,
memblock_isolate_range, This patch already updating two of them.
The for loop is not complex to be part of the macro, Open code sounds
good to me.


~Tarun
>
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
>
> -- 
> Sincerely yours,
> Mike.
