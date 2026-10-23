Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.58
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792740086;
	b=v2E+5GHV2fjdv4+BTXN2gffAE/1vwUchN8N5oiIBeYVqM8Hj1yr1JK/CDEf3xob7YyVS
	 nHbbArgUv3zdJ0/E/HpEiyuOjnxX6lQcFV3ykdVMccYwCdq6zl7T2SmMVKCdvTwICiaP0
	 d5p3E+FLfGLHA1DzEWeZS2CthobhyTJ/Cr9xflvEwu22PQmHchGETrTIEtxCWR4Fq14LF
	 s+COKvHDBur+cOtd2OXY/c5JuZu3Bhq/CsFvXqIatVEd+atcW4DuYaVfK3irCopbJ0o2d
	 OR3ib5m2yUD1ZpRBTFOhtqgHzo7k5V+bSj07SheyW/9H0iAwPULFOag6bKPbS3L8z8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740086;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=jS7Nx9Hg72tCF5iYSwDNRegJlI9Y+Crzbgkhm2yDvjg=;
	b=PIXHJ4B2rwTR8QZvFjjj2O056sb2Qz3LgryaMBazpLtipjcb6YUsJB8neh1TRR2m1WY1
	 d/nrL2pBUjsnqxqvj2FVGupeij430U2EU26zcZhQNvEju7pjRRa/+SVj69eB+Ez93J6GO
	 vYxtofNFPZX8kT4cntEwWK7Fdz7EKW2VjrVyEAZ1vNQGddc8rnv55LvIH/qppLTvXnxwh
	 5a3YQcORIp2t+RXKd/vMvyXTWrXG2TpotGw3mFX/Miafb1BiKqGHwK+2m7PZjxFn1PtL/
	 d8RY9Yc4E0l7AZwRBG+8KqqcowI9GANhmhfbcdHiM30lxt9RjN8BhRotNB7U0ewWW2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jVcRHdR6;
	arc=none smtp.remote-ip=91.218.175.58
Received: from mta0.migadu.com (out-58.mta0.migadu.com [91.218.175.58])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EE1606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:21:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7EE1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jVcRHdR6
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=TDAEQuMA1li4CsA0Bz8PTsar+qPlc8LSFD7g31MoXcw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792740082; v=1; x=1793344882;
 b=jVcRHdR67p+JaGaKQkppRS5YtYVhdsU3gan/w3yN66JLJfgSO9cD+OFY5kt0cbYRub1/dImT
 TguXFFh74TLfjfGUSoUJq/aP4CbBgCPhYmXL69hT5uoSGorqPDW9QjdY+dR7gD5rm21A63nfEUM
 9oVuBWNjP8sRH3dm7qy9QlH4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0a1a4bd446dd5578;
	Fri, 23 Oct 2026 07:21:22 +0000
X-Mizu-Trace-ID: 0a1a4bd446dd5578
X-Migadu-Flow: FLOW_OUT
Message-ID: <256915fd-d26e-4809-a126-e33140e52c39@linux.dev>
Date: Fri, 23 Oct 2026 15:21:16 +0800
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
Subject: Re: [PATCH v2 4/5] mm: hugetlb: avoid recursive CMA allocation during
 migration
To: Muchun Song <muchun.song@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Qi Zheng <zhengqi.arch@bytedance.com>, david@kernel.org, osalvador@suse.de,
 akpm@linux-foundation.org, azpijr@gmail.com
References: <cover.1792651104.git.zhengqi.arch@bytedance.com>
 <35120f1e65b135ebc7885a85bb39baab90882820.1792651104.git.zhengqi.arch@bytedance.com>
 <6e6986a0-b5b4-4ca2-b230-63088f30704f@linux.dev>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <6e6986a0-b5b4-4ca2-b230-63088f30704f@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/23/26 3:02 PM, Muchun Song wrote:
> 
> 
> On 2026/10/22 15:31, Qi Zheng wrote:
>> From: Qi Zheng <zhengqi.arch@bytedance.com>
>>
>> Contiguous allocation can migrate allocated HugeTLB folios or replace 
>> free
>> HugeTLB folios while holding a CMA allocation mutex. Allocating a
>> replacement through CMA would recurse into that allocation path once
>> non-gigantic HugeTLB pages can use CMA.
>>
>> Pass allow_cma through the migration and fresh allocation helpers, and
>> disable it for MR_CONTIG_RANGE and free folio replacement. Move the CMA
>> attempt into the common allocation path, retaining the gigantic size
>> restriction. Honor hugetlb_cma_only even when allow_cma is false.
>>
>> The existing gigantic migration restriction is unchanged.
>>
>> Assisted-by: LLM
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> ---
>>   include/linux/hugetlb.h |  4 +--
>>   mm/hugetlb.c            | 69 +++++++++++++++++++++--------------------
>>   mm/mempolicy.c          |  2 +-
>>   mm/migrate.c            |  3 +-
>>   4 files changed, 40 insertions(+), 38 deletions(-)
>>
>> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
>> index 5029c72418631..38612f7b3478f 100644
>> --- a/include/linux/hugetlb.h
>> +++ b/include/linux/hugetlb.h
>> @@ -736,7 +736,7 @@ struct folio *alloc_hugetlb_folio(struct 
>> vm_area_struct *vma,
>>                   unsigned long addr, bool cow_from_owner);
>>   struct folio *alloc_hugetlb_folio_nodemask(struct hstate *h, int 
>> preferred_nid,
>>                   nodemask_t *nmask, gfp_t gfp_mask,
>> -                bool allow_alloc_fallback);
>> +                bool allow_alloc_fallback, bool allow_cma);
>>   struct folio *alloc_hugetlb_folio_reserve(struct hstate *h, int 
>> preferred_nid,
>>                         nodemask_t *nmask, gfp_t gfp_mask);
>> @@ -1172,7 +1172,7 @@ alloc_hugetlb_folio_reserve(struct hstate *h, 
>> int preferred_nid,
>>   static inline struct folio *
>>   alloc_hugetlb_folio_nodemask(struct hstate *h, int preferred_nid,
>>               nodemask_t *nmask, gfp_t gfp_mask,
>> -            bool allow_alloc_fallback)
>> +            bool allow_alloc_fallback, bool allow_cma)
>>   {
>>       return NULL;
>>   }
>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>> index 6b08074d11f52..c1a8d00be11ac 100644
>> --- a/mm/hugetlb.c
>> +++ b/mm/hugetlb.c
>> @@ -1362,18 +1362,8 @@ static struct folio 
>> *dequeue_hugetlb_folio(struct hstate *h, gfp_t gfp_mask,
>>   static struct folio *alloc_gigantic_frozen_folio(int order, gfp_t 
>> gfp_mask,
>>           int nid, nodemask_t *nodemask)
>>   {
>> -    struct folio *folio;
>> -
>> -    folio = hugetlb_cma_alloc_frozen_folio(order, gfp_mask, nid, 
>> nodemask);
>> -    if (folio)
>> -        return folio;
>> -
>> -    if (hugetlb_cma_exclusive_alloc(order))
>> -        return NULL;
>> -
>> -    folio = (struct folio *)alloc_contig_frozen_pages(1 << order, 
>> gfp_mask,
>> -                              nid, nodemask);
>> -    return folio;
>> +    return (struct folio *)alloc_contig_frozen_pages(1 << order, 
>> gfp_mask,
>> +                             nid, nodemask);
>>   }
>>   #else /* !CONFIG_ARCH_HAS_GIGANTIC_PAGE || !CONFIG_CONTIG_ALLOC */
>>   static struct folio *alloc_gigantic_frozen_folio(int order, gfp_t 
>> gfp_mask, int nid,
>> @@ -1841,37 +1831,47 @@ static struct folio 
>> *alloc_buddy_frozen_folio(int order, gfp_t gfp_mask,
>>   static struct folio *only_alloc_fresh_hugetlb_folio(struct hstate *h,
>>           gfp_t gfp_mask, int nid, nodemask_t *nmask,
>> -        nodemask_t *node_alloc_noretry)
>> +        nodemask_t *node_alloc_noretry, bool allow_cma)
>>   {
>> -    struct folio *folio;
>> +    struct folio *folio = NULL;
>>       int order = huge_page_order(h);
>>       if (nid == NUMA_NO_NODE)
>>           nid = numa_mem_id();
>> -    if (order_is_gigantic(order))
>> -        folio = alloc_gigantic_frozen_folio(order, gfp_mask, nid, 
>> nmask);
>> -    else
>> -        folio = alloc_buddy_frozen_folio(order, gfp_mask, nid, nmask,
>> -                         node_alloc_noretry);
>> +    if (allow_cma && order_is_gigantic(order))
>> +        folio = hugetlb_cma_alloc_frozen_folio(order, gfp_mask, nid, 
>> nmask);
>> +    if (!folio) {
>> +        if (hugetlb_cma_exclusive_alloc(order))
>> +            return NULL;
>> +
>> +        if (order_is_gigantic(order))
>> +            folio = alloc_gigantic_frozen_folio(order, gfp_mask, nid, 
>> nmask);
>> +        else
>> +            folio = alloc_buddy_frozen_folio(order, gfp_mask, nid, 
>> nmask,
>> +                             node_alloc_noretry);
>> +    }
>> +
>>       if (folio)
>>           init_new_hugetlb_folio(folio);
>> +
>>       return folio;
>>   }
>>   /*
>> - * Common helper to allocate a fresh hugetlb folio. All specific 
>> allocators
>> - * should use this function to get new hugetlb folio
>> + * Common helper to allocate a fresh hugetlb folio. All special 
>> allocators
>> + * should use this function to get new hugetlb folio.
>>    *
>>    * Note that returned folio is 'frozen':  ref count of head page and 
>> all tail
>>    * pages is zero, and the accounting must be done in the caller.
>>    */
>>   static struct folio *alloc_fresh_hugetlb_folio(struct hstate *h,
>> -        gfp_t gfp_mask, int nid, nodemask_t *nmask)
>> +        gfp_t gfp_mask, int nid, nodemask_t *nmask, bool allow_cma)
>>   {
>>       struct folio *folio;
>> -    folio = only_alloc_fresh_hugetlb_folio(h, gfp_mask, nid, nmask, 
>> NULL);
>> +    folio = only_alloc_fresh_hugetlb_folio(h, gfp_mask, nid, nmask, 
>> NULL,
>> +                           allow_cma);
>>       if (folio)
>>           hugetlb_vmemmap_optimize_folio(h, folio);
>>       return folio;
>> @@ -1911,7 +1911,7 @@ static struct folio 
>> *alloc_pool_huge_folio(struct hstate *h,
>>           struct folio *folio;
>>           folio = only_alloc_fresh_hugetlb_folio(h, gfp_mask, node,
>> -                    nodes_allowed, node_alloc_noretry);
>> +                    nodes_allowed, node_alloc_noretry, true);
>>           if (folio)
>>               return folio;
>>       }
>> @@ -2103,7 +2103,7 @@ static struct folio 
>> *alloc_surplus_hugetlb_folio(struct hstate *h,
>>           goto out_unlock;
>>       spin_unlock_irq(&hugetlb_lock);
>> -    folio = alloc_fresh_hugetlb_folio(h, gfp_mask, nid, nmask);
>> +    folio = alloc_fresh_hugetlb_folio(h, gfp_mask, nid, nmask, true);
>>       if (!folio)
>>           return NULL;
>> @@ -2139,14 +2139,14 @@ static struct folio 
>> *alloc_surplus_hugetlb_folio(struct hstate *h,
>>   }
>>   static struct folio *alloc_migrate_hugetlb_folio(struct hstate *h, 
>> gfp_t gfp_mask,
>> -                     int nid, nodemask_t *nmask)
>> +                     int nid, nodemask_t *nmask, bool allow_cma)
>>   {
>>       struct folio *folio;
>>       if (hstate_is_gigantic(h))
>>           return NULL;
>> -    folio = alloc_fresh_hugetlb_folio(h, gfp_mask, nid, nmask);
>> +    folio = alloc_fresh_hugetlb_folio(h, gfp_mask, nid, nmask, 
>> allow_cma);
>>       if (!folio)
>>           return NULL;
>> @@ -2219,7 +2219,8 @@ struct folio *alloc_hugetlb_folio_reserve(struct 
>> hstate *h, int preferred_nid,
>>   /* folio migration callback function */
>>   struct folio *alloc_hugetlb_folio_nodemask(struct hstate *h, int 
>> preferred_nid,
>> -        nodemask_t *nmask, gfp_t gfp_mask, bool allow_alloc_fallback)
>> +        nodemask_t *nmask, gfp_t gfp_mask, bool allow_alloc_fallback,
> 
> alloc_hugetlb_folio_nodemask() now ends with two adjacent boolean
> arguments.
> 
> Call sites such as "false, true" are difficult to understand without
> looking up the prototype.
> 
> Could you please add a comment at the caller to document this?

OK, will do.

> 
> Thanks,
> Muchun

