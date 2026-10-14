Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70900556BBD
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791991189; cv=none; b=HV0+vr174jY4uBaqTddtPyEY6FoXVgZb+3GpGn//44nogcWNVyoBGLshvCVViFPeeiUI/dPMjQnIRGEhpOE7oYgWiRFcle5qAnW0jZS2rl/wv+C76xX4KyrF5tRC5pDSn5Vm7xJHD2jLLM0bSnZaOkIZbvuYMY42TQ7WbVUpaPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791991189; c=relaxed/simple;
	bh=G2zxJe7GkogARtt1gntYhVDlCaUhHR/DtdzwRUUPBoU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UFMI4Je1QZp2bRu3F1ZTM25c9SaA8XyL43hdfddbBVErH9PRKgwhttDo7Oiu2YtRkb0BsGGV3sAP8VoPFFx3qlw4fmXQF+F1VeXaY1SiJgxiTY7zdlsZPgeeGdEg6wjM2ThlnpMSYPdmGVB2elgSJFSbS5aqWUme5h+IarDRQlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ekmv/T98; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ekmv/T98"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A90A1570;
	Wed, 14 Oct 2026 08:19:41 -0700 (PDT)
Received: from [10.164.19.62] (unknown [10.164.19.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B3D203F7B4;
	Wed, 14 Oct 2026 08:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791991184; bh=G2zxJe7GkogARtt1gntYhVDlCaUhHR/DtdzwRUUPBoU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ekmv/T98bpIvaHBhsd3Np8JFa4AXGh0U8naVNgmgRHhXbADZG08EVfjO+LBvGzXaW
	 5HWbLznXThc2VrsN8RGBFCjQCcWCSFXQysQtIzsh84Fn6B6l7KGfLOUAQwQdnOBfeM
	 PkWzuET0KheocgrkI7o5YrHPLaG0q34frAxnaCJw=
Message-ID: <7b547b9b-3b30-4486-87ba-c9ff0e2dab56@arm.com>
Date: Wed, 14 Oct 2026 20:49:36 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/5] mm/page_alloc: count a merged buddy's pages under
 the merged type
To: Rik van Riel <riel@surriel.com>, linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Brendan Jackman <brendan.jackman@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
 Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>,
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>,
 linux-mm@kvack.org
References: <20261007021250.1665929-1-riel@surriel.com>
 <20261007021250.1665929-3-riel@surriel.com>
 <55f51fb8-9777-424a-b45f-a6a5bd9a4693@arm.com>
 <038db2e68469e74077264a490e104391bdffe35e.camel@surriel.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <038db2e68469e74077264a490e104391bdffe35e.camel@surriel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 14/10/26 7:57 pm, Rik van Riel wrote:
> On Wed, 2026-10-14 at 19:46 +0530, Dev Jain wrote:
>>
>>
>>> +++ b/mm/page_alloc.c
>>> @@ -993,6 +993,11 @@ static inline void __free_one_page(struct page
>>> *page,
>>>  			account_freepages(zone, 1 << order,
>>> migratetype);
>>>  		} else {
>>>  			__del_page_from_free_list(buddy, zone,
>>> order, buddy_mt);
>>> +			/* The buddy's free pages join the merged
>>> block's type. */
>>> +			if (unlikely(buddy_mt != migratetype)) {
>>> +				account_freepages(zone, -(1 <<
>>> order), buddy_mt);
>>> +				account_freepages(zone, 1 <<
>>> order, migratetype);
>>> +			}
>>>  		}
>>>  
>>
>> MAX_PAGE_ORDER > pageblock_order confuses things so much : (
> 
> I'm not a fan, either. It trips me up every time.
> 
>>
>> Sashiko raises something:
>> https://sashiko.dev/#/patchset/20261007021250.1665929-1-riel%40surriel.com
>>
>> Although feels like it is exaggerating.
> 
> I suppose if we switch the two lines around, doing
> the increment on migratetype before decrementing
> buddy_mt we could avoid that transient underflow?

That would become a transient overflow. See below.


> 
>>
>> My concern is for systems with a high diff between MAX_PAGE_ORDER and
>> pageblock_order. So on arm64 systems with 64K pagesize but pageblock
>> size as 2M (and PMD size 512M), the pageblock order is 5. We use this
>> configuration to reliably get TLB optimization from contpte size
>> mappings.
>>
>> Will we then repeatedly overflow the pcpu counter into the zone
>> counter,
>> regressing stuff?
> 
> The per_cpu_pages struct does not seem to keep
> counts on a per migratetype basis at all. It
> has per migratetype lists, but only one
> pcp->count.
> 
> Also doesn't the pcp only carry order zero
> pages currently?
> 
> I don't really understand your worry.

Sorry I was not talking about the pcp list (also, pcp carries
order 0 till 3?)

In __mod_zone_page_state, we use the per-cpu variable pcp->vm_stat_diff,
and when it overflows or underflows past a pcp->stat_threshold, we
push the diff to the global (zone) state.

The reason we do so is to optimize by batching zone operations into
per-cpu local operations.

My concern is that for large delta, we will always overflow
or underflow, defeating the purpose of the per-cpu caching.

So on said arm64 systems, we may frequently enter your

if (unlikely(buddy_mt != migratetype)

branch, and if pcp->stat_threshold is not enough, we may repeatedly
overflow and underflow, defeating this per-cpu optimization.

> 
>>
>> Perhaps I am overthinking. Your approach is clean, but perhaps we
>> could
>> also do:
>>
>> void account_freepages_move(zone, order, buddy_mt, mt)
>>
>> 	/* PCP-types do not have per-migratetype free counts. */
>> 	if (likely (buddy_mt < MIGRATE_PCPTYPES && mt <
>> MIGRATE_PCPTYPES))
>> 		return;
> 
> Wouldn't that throw off the counts when we merge
> e.g. a MIGRATE_UNMOVABLE page with a MIGRATE_MOVABLE
> buddy?
> 

As you said, in account_freepages(), there is currently
no conditional based on MOVABLE and UNMOVABLE. So we
are essentially doing -x and +x, netting to zero.

So we could write my function, make it clear that currently
this is not needed for the MIGRATE_PCPTYPES, as opposed
to MIGRATE_CMA and MIGRATE_HIGHATOMIC which have separate
accounting.

> With your test we would only ever do the free count
> adjustment for mismatched types if one of the pages
> was HIGHATOMIC or CMA. That leaves the common case
> without coverage.
> 

