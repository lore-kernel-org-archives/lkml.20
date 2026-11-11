Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.114
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794392847;
	b=v5GP/63jCI7cZLAp5efKY+QhItRoijz55cnlsqY1/xoWOk646r1YOdwrMJ06TJjMHqyo
	 Lh5jSnRMe9PvrOLIi9iSDw7YdTxX0W5JOoDKM8quU8+cEQIEAmX6P6G/Bkft0sYhbo5uf
	 FwJN5sALihefKVWTo6aaHfcGcHOtLVLBjuoSYFRaT9up+MndPQ8FAjvOm02oRp4dpH9P3
	 Ri5QcuPvrUDdcJCTngOQDUCLnreDfcBzq9unpMJ+dnQYTZHuMLDwU2PVKCmf2TyEufvoJ
	 zNqhF1IFCzriRoiKquatHB4t8+JcM6kdI3MWfhFgJ+45JVceIK0qRCrgUJpUPZn104Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794392847;
	h=DMARC-Filter:DKIM-Signature:Cc:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:User-Agent:To:Subject:
	 Message-Id:In-Reply-To:References:X-Lms-Return-Path:From:
	 X-Original-From;
	bh=+cZ0TkhgcyZX2/tGIJYKpizu09u/oOKdVnqqr23AXvE=;
	b=wdCSilLQBnd0WifFHwthbf9alCQ2Oqam0if/1VVmtIFpLMqdZ2daT9sSaU6icqZuYMji
	 jATdew4+4C3RLpl8L+cPhgJCrS60PMQ8dVcxqPdsF0wlPiyBvMrXfmWiGYFPqiGs/mqMJ
	 JJjuceEq27EYYiaND1QGr3sCKYzdJoZp48veoFDmemrVlKAiu6sl46IIT+MfVe/rVxOtw
	 WmI7kZAshRfjpwdlnBRGe6g0RFvnAkphGcaeeYsr+3BVDhANPGRUQi3Ht2D3KFhUDfz5R
	 tgN1mVGoJnQI3fOsylvvpDZO6LZfWrbAU6DNLXDyVcGMYC5tlBKVMI9Iv9bPWG6sanQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=RCLhcXa5;
	arc=none smtp.remote-ip=209.127.230.114
Received: from va-1-114.ptr.blmpb.com (va-1-114.ptr.blmpb.com [209.127.230.114])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28CB606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C28CB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=RCLhcXa5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1794392840; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=+cZ0TkhgcyZX2/tGIJYKpizu09u/oOKdVnqqr23AXvE=;
 b=RCLhcXa5MQfniyrwMiA7R2RvhztQGtFd1uCMdaPJTgKgIpLcp0NMsEGJsqoKZ9tcH11SmL
 e4/OyjxMvUUa35Mld9yhVK4P42mVZ6n9tGZbXJlgOth/8IaPyQVcBL45uT8j0QMSae0V6q
 gfRY5RaygQJw4acnLWjuAjQVzU4k2HGrFCYqmCud8PaXu/D3FeMSCqKZKRsdBjxSBsSCig
 DfFqe6WywIa8T088V3/oREw2YAM/hODO/TzT+ksnyp9iYH4PetyqztJETNdanq0bOF9ncI
 mRG8CIuo+wtTumnMgS8NbEtUJw2LPwNbRJNQoBjCGZ9tXN9hFWBKkAANnlDJag==
Cc: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, 
	<stable@vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Nov 2026 18:26:58 +0800
User-Agent: Mozilla Thunderbird
To: "David Hildenbrand (Arm)" <david@kernel.org>, <muchun.song@linux.dev>, 
	<osalvador@suse.de>, <akpm@linux-foundation.org>, <azpijr@gmail.com>, 
	<lance.yang@linux.dev>, "Qi Zheng" <qi.zheng@linux.dev>
Subject: Re: [PATCH v3 2/3] mm: gup: allow long-term pins of CMA-allocated HugeTLB folios
Message-Id: <5f68ffba-9f56-4e31-9e7c-9d110f552efc@bytedance.com>
In-Reply-To: <3a1a3bb5-0b01-4f20-aa0e-74a952544b8c@kernel.org>
References: <cover.1794046188.git.zhengqi.arch@bytedance.com> <586d6c53ab7e4c64d6e89ad3cf0cf7e07dabbfaf.1794046188.git.zhengqi.arch@bytedance.com> <7abb3aa1-385a-422f-86bd-7aac9661c4d8@kernel.org> <423c9b28-ecf2-4fab-817d-2fb326690c73@linux.dev> <3a1a3bb5-0b01-4f20-aa0e-74a952544b8c@kernel.org>
X-Lms-Return-Path: <lba+26af44306+2836a5+vger.kernel.org+zhengqi.arch@bytedance.com>
From: "Qi Zheng" <zhengqi.arch@bytedance.com>
X-Original-From: Qi Zheng <zhengqi.arch@bytedance.com>

Hi David,

On 11/11/26 3:43 PM, David Hildenbrand (Arm) wrote:
> On 11/9/26 04:10, Qi Zheng wrote:
>>
>>
>> On 11/8/26 1:58 AM, David Hildenbrand (Arm) wrote:
>>> On 11/7/26 11:30, Qi Zheng wrote:
>>>> From: Qi Zheng <zhengqi.arch@bytedance.com>
>>>>
>>>> Long-term pinning treats explicitly CMA-allocated HugeTLB folios as
>>>> unpinnable, causing unnecessary migration or pinning failures.
>>>>
>>>> These folios already own their CMA bitmap ranges, and memory blocks
>>>> overlapping CMA areas cannot be offlined. Allow HugeTLB folios with
>>>> HPG_cma to be pinned directly, including in ZONE_MOVABLE.
>>>>
>>>> Fixes: cf11e85fc08c ("mm: hugetlb: optionally allocate gigantic hugepages using cma")
>>>> Cc: stable@vger.kernel.org
>>>> Suggested-by: Muchun Song <muchun.song@linux.dev>
>>>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>>>> Acked-by: Muchun Song <muchun.song@linux.dev>
>>>> Reviewed-by: Oscar Salvador <osalvador@suse.de>
>>>> Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
>>>> ---
>>>>    include/linux/mm.h | 29 +----------------------------
>>>>    mm/gup.c           | 31 +++++++++++++++++++++++++++++++
>>>>    2 files changed, 32 insertions(+), 28 deletions(-)
>>>>
>>>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>>>> index 2d0b8a4c9974f..75dd40265d3f4 100644
>>>> --- a/include/linux/mm.h
>>>> +++ b/include/linux/mm.h
>>>> @@ -2975,35 +2975,8 @@ static inline bool is_zero_folio(const struct folio *folio)
>>>>    	return is_zero_page(&folio->page);
>>>>    }
>>>>    
>>>> -/* MIGRATE_CMA and ZONE_MOVABLE do not allow pin folios */
>>>>    #ifdef CONFIG_MIGRATION
>>>> -static inline bool folio_is_longterm_pinnable(struct folio *folio)
>>>> -{
>>>> -#ifdef CONFIG_CMA
>>>> -	int mt = folio_migratetype(folio);
>>>> -
>>>> -	if (mt == MIGRATE_CMA || mt == MIGRATE_ISOLATE)
>>>> -		return false;
>>>> -#endif
>>>> -	/* The zero page can be "pinned" but gets special handling. */
>>>> -	if (is_zero_folio(folio))
>>>> -		return true;
>>>> -
>>>> -	/* Coherent device memory must always allow eviction. */
>>>> -	if (folio_is_device_coherent(folio))
>>>> -		return false;
>>>> -
>>>> -	/*
>>>> -	 * Filesystems can only tolerate transient delays to truncate and
>>>> -	 * hole-punch operations
>>>> -	 */
>>>> -	if (folio_is_fsdax(folio))
>>>> -		return false;
>>>> -
>>>> -	/* Otherwise, non-movable zone folios can be pinned. */
>>>> -	return !folio_is_zone_movable(folio);
>>>> -
>>>> -}
>>>
>>> Moving code while adding new stuff to it, please don't.
>>>
>>> Move code first, then modify it.
>>>
>>> I don't want to play "find the difference between two pictures" on a Saturday
>>> evening.
>>
> 
> You resent your series way too fast.

Got it.

> 
> Now we have discussions in to threads, congratulations ;)
> 
>> ;), got it.
>>
>> I moved the code to resolve a build dependency.
>>
> 
> Why can't that be resolved differently? What is the dependency?

The dependency is that the new check wants to use
`folio_test_hugetlb_cma()`, which is a HugeTLB-specific inline helper
from `include/linux/hugetlb.h`.

`folio_is_longterm_pinnable()` currently lives in `include/linux/mm.h`,
while `include/linux/hugetlb.h` already includes `linux/mm.h`. So I
can't simply use `folio_test_hugetlb_cma()` from `mm.h`

> 
>>>
>>>> +bool folio_is_longterm_pinnable(struct folio *folio);
>>>>    #else
>>>>    static inline bool folio_is_longterm_pinnable(struct folio *folio)
>>>>    {
>>>> diff --git a/mm/gup.c b/mm/gup.c
>>>> index 2b405cce2ca5c..f41701c603500 100644
>>>> --- a/mm/gup.c
>>>> +++ b/mm/gup.c
>>>> @@ -2216,6 +2216,37 @@ struct page *get_dump_page(unsigned long addr, int *locked)
>>>>    
>>>>    #ifdef CONFIG_MIGRATION
>>>>    
>>>> +bool folio_is_longterm_pinnable(struct folio *folio)
>>>> +{
>>>> +#ifdef CONFIG_CMA
>>>> +	int mt = folio_migratetype(folio);
>>>> +
>>>> +	/* These HugeTLB folios own the CMA memory, so they can be long-term pinned. */
>>>> +	if (folio_test_hugetlb(folio) && folio_test_hugetlb_cma(folio))
>>>> +		return true;
>>> More hugetlb hackery ... don't like that, sorry.
>>
>> Agree.
>>
>>>
>>> I think this just goes down to a problem we discussed a while ago that is
>>> independent of hugetlb: we'd need some way to identify that the the page was
>>> actually allocated by the CMA owner, and it's not just some other movable
>>> allcoation that ended up there.
>>>
>>> For something generic non-hugetlb thing, can't we call into CMA to ask whether
>>> the current chunk is marked allocated?
>>
>> The existing bitmap is set before allocation completes, so the range
>> may still contain borrowed movable pages. A set bit alone cannot
>> establish ownership.

The more accurate code path is as follows.

Assuming the 2M buddy allocation is successful, page P is borrowed from
the 1G CMA area.

Now, proceed to request a new 1G huge page:

only_alloc_fresh_hugetlb_folio
--> alloc_gigantic_frozen_folio
     --> hugetlb_cma_alloc_frozen_folio
         --> cma_range_alloc
                 /* set bitmap!! */
             --> bitmap_set(cmr->bitmap, bitmap_no, bitmap_count);

                 <time A>

                 /* may fail */
                 alloc_contig_frozen_range

         /* set HPG_cma!! */
         folio_set_hugetlb_cma(folio);

At time A, for page P, a bitmap was set, but HPG_cma was not set.

If a concurrent FOLL_LONGTERM pin uses the bitmap alone to determine
ownership, it could incorrectly allow P to remain pinned. If
alloc_contig_frozen_range() fails, cma_range_alloc() clears the bitmap
bits, while the long-term pin on P remains.

HPG_cma is set only after explicit CMA allocation succeeds. It records
the folio's own CMA ownership, whereas a set bitmap bit can represent
another allocation's in-flight reservation. Therefore, the bitmap
alone cannot replace HPG_cma in this check.

>>
>> A generic query may need separate ownership tracking, such as an
>> owned_bitmap recording successfully allocated pages. Its updates and
>> lookups would also need to handle concurrency with fast GUP.
> 
> Or simply two bitmaps? "trying allocation - allocated"

As a fix, perhaps this is a bit too complex? :(

Alternatively, we could adjust the timing for setting the bitmap, though
this might introduce new concurrency issues.

Thanks,
Qi

