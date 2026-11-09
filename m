Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.61
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794193816;
	b=F+sL68nckyEmZAoVM4d9AY99om/5/mJtR+wXY8OhhmBpi8tiLjuPEsW2Uf9NkBs8ikmC
	 l86LZ/GYFHuVOs6WvVkDZBfWJKWrXZ5DyCWXGjYzREjLwJUh8BMYaqCPUPQfp1+7INnGE
	 0daSptFnkEF8URk2OvLBPRHiV6yZNrLZNOW2jN/ci0TGxUWbXUWEeE/aKF4dp1bivYeKK
	 dbXljEosX7XZqia9edNKZdgpfXZIeMyBYopLWyadpLVOIyMd0mb4VOfwyp+XCZNX4KaWL
	 D9xO299FM29Ymn0RmhUb9ZJJoJncGDC2TU3JJyEpuMlWtWnp98FUiHJ/bcMTIgjIQ1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794193816;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=R7YFoYH+pqizVWJtbykpYVkcry3ho5h+U0NhjdmQOV4=;
	b=qxNnLJnO3e49CdXdi8cTiSIhlIZupAjRsrFVIMuU6u2nhtSztWfOiMoyh8oSoL5lYcNx
	 v2i0htyva3umGQwFcIY7/WWVTR33Do73IO/bZ3jHE3s3xGv65WNc+V1aM9rIlg/57sBr6
	 pfptbJM96y2+Y2KbvxFqeT+JjjDb7hU6nXov92GVL9KBtCkr3SuW09R/6XtEKcqD9cZdO
	 En2Ljs211NF/wtyg1pc0sPMn5Fhw57iuAXzFPC2Yiw9IB7wMxwXCtD/tCfyPyYPDs8MvA
	 eYSl8IyyRO6BURpbjuwBu2j+09UMvDxt2XW8MX2H3IcZy0qbD/ZYs+J8QVVaAJ1vHZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gtbDVREB;
	arc=none smtp.remote-ip=95.215.58.61
Received: from mta1.migadu.com (out-61.mta1.migadu.com [95.215.58.61])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE27E606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:10:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE27E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gtbDVREB
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7Na7xjzcQd16juEXNoMu7pYk4KLFnTP5KHehCh6IFWE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794193813; v=1; x=1794798613;
 b=gtbDVREBKlXmZiiQn37nboEHI2/a0a20du9yKFge83pgGuSGnnJnWOdvyIUGVWhK9MPfmf8b
 RX9ADc8PDttBKuZ8wChz8b+rwNyNdarOiNrWfZR3x4yHDAAzQhnU5Xp0wtDMKweiSWKCeHnDzs5
 W45HOEGmg5bHLrY9e6j8bN9s=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1ae66134428fd04f;
	Mon, 09 Nov 2026 03:10:10 +0000
X-Mizu-Trace-ID: 1ae66134428fd04f
X-Migadu-Flow: FLOW_OUT
Message-ID: <423c9b28-ecf2-4fab-817d-2fb326690c73@linux.dev>
Date: Mon, 9 Nov 2026 11:10:02 +0800
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
Subject: Re: [PATCH v3 2/3] mm: gup: allow long-term pins of CMA-allocated
 HugeTLB folios
To: "David Hildenbrand (Arm)" <david@kernel.org>, muchun.song@linux.dev,
 osalvador@suse.de, akpm@linux-foundation.org, azpijr@gmail.com,
 lance.yang@linux.dev, Qi Zheng <zhengqi.arch@bytedance.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, stable@vger.kernel.org
References: <cover.1794046188.git.zhengqi.arch@bytedance.com>
 <586d6c53ab7e4c64d6e89ad3cf0cf7e07dabbfaf.1794046188.git.zhengqi.arch@bytedance.com>
 <7abb3aa1-385a-422f-86bd-7aac9661c4d8@kernel.org>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <7abb3aa1-385a-422f-86bd-7aac9661c4d8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/8/26 1:58 AM, David Hildenbrand (Arm) wrote:
> On 11/7/26 11:30, Qi Zheng wrote:
>> From: Qi Zheng <zhengqi.arch@bytedance.com>
>>
>> Long-term pinning treats explicitly CMA-allocated HugeTLB folios as
>> unpinnable, causing unnecessary migration or pinning failures.
>>
>> These folios already own their CMA bitmap ranges, and memory blocks
>> overlapping CMA areas cannot be offlined. Allow HugeTLB folios with
>> HPG_cma to be pinned directly, including in ZONE_MOVABLE.
>>
>> Fixes: cf11e85fc08c ("mm: hugetlb: optionally allocate gigantic hugepages using cma")
>> Cc: stable@vger.kernel.org
>> Suggested-by: Muchun Song <muchun.song@linux.dev>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> Acked-by: Muchun Song <muchun.song@linux.dev>
>> Reviewed-by: Oscar Salvador <osalvador@suse.de>
>> Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
>> ---
>>   include/linux/mm.h | 29 +----------------------------
>>   mm/gup.c           | 31 +++++++++++++++++++++++++++++++
>>   2 files changed, 32 insertions(+), 28 deletions(-)
>>
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index 2d0b8a4c9974f..75dd40265d3f4 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -2975,35 +2975,8 @@ static inline bool is_zero_folio(const struct folio *folio)
>>   	return is_zero_page(&folio->page);
>>   }
>>   
>> -/* MIGRATE_CMA and ZONE_MOVABLE do not allow pin folios */
>>   #ifdef CONFIG_MIGRATION
>> -static inline bool folio_is_longterm_pinnable(struct folio *folio)
>> -{
>> -#ifdef CONFIG_CMA
>> -	int mt = folio_migratetype(folio);
>> -
>> -	if (mt == MIGRATE_CMA || mt == MIGRATE_ISOLATE)
>> -		return false;
>> -#endif
>> -	/* The zero page can be "pinned" but gets special handling. */
>> -	if (is_zero_folio(folio))
>> -		return true;
>> -
>> -	/* Coherent device memory must always allow eviction. */
>> -	if (folio_is_device_coherent(folio))
>> -		return false;
>> -
>> -	/*
>> -	 * Filesystems can only tolerate transient delays to truncate and
>> -	 * hole-punch operations
>> -	 */
>> -	if (folio_is_fsdax(folio))
>> -		return false;
>> -
>> -	/* Otherwise, non-movable zone folios can be pinned. */
>> -	return !folio_is_zone_movable(folio);
>> -
>> -}
> 
> Moving code while adding new stuff to it, please don't.
> 
> Move code first, then modify it.
> 
> I don't want to play "find the difference between two pictures" on a Saturday
> evening.

;), got it.

I moved the code to resolve a build dependency.

> 
>> +bool folio_is_longterm_pinnable(struct folio *folio);
>>   #else
>>   static inline bool folio_is_longterm_pinnable(struct folio *folio)
>>   {
>> diff --git a/mm/gup.c b/mm/gup.c
>> index 2b405cce2ca5c..f41701c603500 100644
>> --- a/mm/gup.c
>> +++ b/mm/gup.c
>> @@ -2216,6 +2216,37 @@ struct page *get_dump_page(unsigned long addr, int *locked)
>>   
>>   #ifdef CONFIG_MIGRATION
>>   
>> +bool folio_is_longterm_pinnable(struct folio *folio)
>> +{
>> +#ifdef CONFIG_CMA
>> +	int mt = folio_migratetype(folio);
>> +
>> +	/* These HugeTLB folios own the CMA memory, so they can be long-term pinned. */
>> +	if (folio_test_hugetlb(folio) && folio_test_hugetlb_cma(folio))
>> +		return true;
> More hugetlb hackery ... don't like that, sorry.

Agree.

> 
> I think this just goes down to a problem we discussed a while ago that is
> independent of hugetlb: we'd need some way to identify that the the page was
> actually allocated by the CMA owner, and it's not just some other movable
> allcoation that ended up there.
> 
> For something generic non-hugetlb thing, can't we call into CMA to ask whether
> the current chunk is marked allocated?

The existing bitmap is set before allocation completes, so the range
may still contain borrowed movable pages. A set bit alone cannot
establish ownership.

A generic query may need separate ownership tracking, such as an
owned_bitmap recording successfully allocated pages. Its updates and
lookups would also need to handle concurrency with fast GUP.

> 
> If that's too hard, we could add a temporary hugetlb hack.

For this fix, I'd prefer to keep the current check.

> 
> But we all hate hugetlb hacks. :)

+1.

> 

