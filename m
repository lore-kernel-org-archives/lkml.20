Received: from mta1.migadu.com (out-72.mta1.migadu.com [95.215.58.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856534A92C0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788367637; cv=none; b=d8ghmcx9rbBY3wplKhvrGIQivtPsgX34XRUTyaYr+NEg9qNGpGd9mdro6Hy7Bx8G4JiTR51LRV2WToeKqnUbs4L5dQTgU5RZ798hPUe7ornOrila+xOSzMKYkRh6pAc89feskC52rnQ7XZDUxqGdJjxP2TAEi0+0f2OW+3NiqhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788367637; c=relaxed/simple;
	bh=Y4pHs4Y3EiBbkU7VVftsLC18a5d9QR/DWz6/s/ZFOvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h1u3vEDyieaTg6Z4O4o/UouueXqyNMq6tf+lXKn+q+qrqWdE8qUOVpm2YF1igbw15SSqsb3XSuJ5ip/e0am3cDBNWY8+rEVHi2ofeDlwljojHrTZDOAI8y9YExkT5J/mgnw/4TWBJawoHzUvO38JhdA5pY90uiySw6TghlmhZQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=f0XoB4DU; arc=none smtp.client-ip=95.215.58.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="f0XoB4DU"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Y4pHs4Y3EiBbkU7VVftsLC18a5d9QR/DWz6/s/ZFOvw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788367633; v=1; x=1788972433;
 b=f0XoB4DUONwwosIt9VVgUyLKwM8B/LT1Cav6ciQpYXg9QlGL1BAMqNUWPpetB+fJKjkrhUv+
 cdgOaOnYzX9sRFk6V41dMHJEUyBmn5JCQ6wQzS3xPgITKehWiS8PsOVnrigs4YIIx5wVWGoLivo
 95pMQp6opvv0JKKwzivrf01A=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b46acf156380a251;
	Wed, 02 Sep 2026 16:47:12 +0000
X-Mizu-Trace-ID: b46acf156380a251
X-Migadu-Flow: FLOW_OUT
Message-ID: <583c4718-f763-41f0-b757-02b46655c0b5@linux.dev>
Date: Wed, 2 Sep 2026 17:47:10 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mm: remove min_free_kbytes adjustment for THP
To: Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>
Cc: Nimrod Oren <noren@nvidia.com>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <brendan.jackman@linux.dev>, Hugh Dickins
 <hughd@google.com>, Nirmoy Das <nirmoyd@nvidia.com>,
 Dragos Tatulea <dtatulea@nvidia.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20260901190123.3511535-1-noren@nvidia.com>
 <20260901204449.GK3004@cmpxchg.org>
 <C8541A2F-D6A9-41B0-A3FE-52339A6601F0@nvidia.com>
 <20260901220917.GM3004@cmpxchg.org>
 <69C018F5-A1C8-47AD-9567-3497AA6808EC@nvidia.com>
 <20260902160417.GN3004@cmpxchg.org>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <20260902160417.GN3004@cmpxchg.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 02/09/2026 17:04, Johannes Weiner wrote:
> On Tue, Sep 01, 2026 at 09:49:58PM -0400, Zi Yan wrote:
>> On 1 Sep 2026, at 18:09, Johannes Weiner wrote:
>>
>>> On Tue, Sep 01, 2026 at 05:09:52PM -0400, Zi Yan wrote:
>>>> On 1 Sep 2026, at 16:44, Johannes Weiner wrote:
>>>>
>>>>> On Tue, Sep 01, 2026 at 10:01:23PM +0300, Nimrod Oren wrote:
>>>>>> When THP is enabled, set_recommended_min_free_kbytes() may raise
>>>>>> min_free_kbytes using a heuristic that scales with pageblock_nr_pages.
>>>>>> Commit f000565adb77 ("thp: set recommended min free kbytes") added this
>>>>>> heuristic to help keep pageblocks free and reduce fragmentation for THP
>>>>>> allocations.
>>>>>
>>>>> We've had problems with compaction before when min_free_kbytes was too
>>>>> small on large machines. Competing free space scanners do a lot of
>>>>> work only to fight over a very small set of possible target pages.
>>>>>
>>>>> So I'm a bit uneasy that you didn't include any benchmark numbers with
>>>>> this that prove basic functionality on larger hosts isn't regressed.
>>>>>
>>>>>> The recommendation scales poorly with larger base page sizes. With the
>>>>>> default arm64 pageblock sizes, the contribution per eligible zone
>>>>>> before applying the existing cap of 5% of low memory is:
>>>>>>
>>>>>>   4 KiB pages:   2 MiB pageblock,   22 MiB per zone
>>>>>>  16 KiB pages:  32 MiB pageblock,  352 MiB per zone
>>>>>>  64 KiB pages: 512 MiB pageblock,  5.5 GiB per zone
>>>>>
>>>>> I question whether pageblocks need to be 512M on those machines to
>>>>> begin with. After this patch, you're still asking the page allocator
>>>>> to optimize grouping such that 512M pages can be allocated at
>>>>> runtime. Only now you took away part of the mechanism to do so.
>>>>>
>>>>> If you're using 512M THPs, I would kind of assume it's on machines
>>>>> with a memory size where 5.5G for defrag purposes isn't devastating.
>>>>>
>>>>> And if you're not, it would make more sense to lower the pageblock
>>>>> size to the mTHP size you're actually using. And that would fix the
>>>>> "excessive" min_free_kbytes issue as well.
>>>>
>>>> But lowering pageblock size requires a kernel compilation. That means
>>>> maintaining two sets of kernels for different needs.
>>>
>>> That depends on whether anyone actually wants 512M pageblocks...
>>>
>>>> The ultimate solution is to enable better compaction to generate
>>>> THPs bigger than a pageblock size, like Rik's super-pageblock
>>>> proposal.
>>>
>>> ...or whether we can say, at that point, use gigablocks/cma+hugetlb.
>>>
>>> And then the static pageblock size for the fallback logic etc. can be
>>> a smaller, saner default for everybody.
>>>
>>> Because the point you didn't address: it doesn't make really sense to
>>> have 512M pageblocks on smaller machines, beyond the min_free_kbytes
>>> issue: Fragmentation events will poison half a gig at once,
>>> should_try_claim_block() becomes harder which results in less
>>> conversions and more allocations falling through to stealing, page
>>> isolation is more likely to fail, compaction locks and operates on
>>> oversized chunks which is bad for latency and concurrency...
>>
>> I actually wonder why such a big pageblock would still result in a lot
>> of fallbacks.
> 
> If you look at try_to_claim_block(), you need half of a block to be
> free or compatible with the requested migratetype in order to convert
> it. When memory is full, LRU pages are scattered all over, and
> compaction is not involved (order-0), this gets more difficult the
> bigger the block is. You can get into a situation where LRU reclaim
> will not clear sufficient room for conversion in any given pageblock
> anymore and you're stuck with the type distribution. A large share of
> buddy requests then go permanently through the slower fallback path.
> 
> Usama knows more about this, but we have seen this on GB300 hosts, and
> have JUST started to deploy kernels with smaller pageblocks (2M).

Yes, just to confirm above, unfortunately, there were too many problems
we were seeing in Meta production with 512M pageblock size for arm 64K
base page size and just had to switch to 2M.

> 
>> Basically it indicates at some point kernel allocates a lot of
>> unmovable pages that use many 512MB pageblocks and the life time of
>> these unmovable pages are so diverse, leading to all these
>> pageblocks remain unmovable and free pages spread across all these
>> pageblocks. I thought bigger pageblocks can keep unmovable pages
>> constrained within fewer pageblocks, leaving more contiguous free
>> memory.
> 
> The idea is that the pageblock maintains contiguity for the largest
> size you routinely expect to allocate.
> 
> The page allocator is very passive right now, and it doesn't work
> super reliably. But even in the current regime, smaller blocks have a
> better chance of containment.
> 
> For example, when the ever-growing page cache runs out of movable
> block space, it spills into unmovable free space. When the next
> unmovable request finds no space, it runs LRU reclaim - which is more
> likely to free space in one of the many movable blocks. And so the
> next block is poisoned. Smaller blocks have a better chance of filling
> up natively, means less pressure to spill into incompatible ones.
> 
> And the higher min_free_kbytes, the more likely there are still native
> options when the zones are down to the watermarks. E.g. better odds
> there is still unmovable free space, you just need to reclaim some
> movable/reclaimable space elsewhere to satisfy the watermarks.
> 
> I've been working on making this more robust with the huge page
> allocator / defrag_mode stuff: instead of falling back and poisoning a
> block, invoke reclaim/compaction to produce a neutral block that can
> be converted entirely.
> 
> It's the same idea as the higher min_free_kbytes and watermark
> boosting, but it is more targeted at the end result: readily available
> space in compatible or convertible blocks.
> 
> But with that active regime, oversized pageblocks are even
> worse. You'd pay ongoing compaction work to produce a level of
> contiguity that you don't actually need.
> 
>>> Seems to me the excessive min_free_kbytes is just a symptom of a
>>> deeper problem.
>>
>> Yes, our anti-fragmentation mechanism does not work as we expected,
>> so that we need an excessive min_free_kbytes to get khugepaged working.
>> I wonder why reclaim cannot get the extra free memory instead of
>> reserving it via min_free_kbytes. Maybe we need a watermark boost
>> when some consecutive THP allocations are seen to achieve similar
>> effect of boosting min_free_kbytes?
> 
> I'm just wondering what the easiest way forward is to fix the ARM 64k
> page problem.
> 
> Yes, optimally, reclaim would work to satisfy compaction space by
> itself. We've seen it fail at that before, though.
> 
> How critical set_recommended_min_free_kbytes() is today is a question
> that neither of us has a clear answer to. It's from 2011 and a lot has
> changed. However, knowing Andrea, I'm willing to bet he added this
> based on seeing a need in testing data. And I would actually expect it
> to work better now with proactive compaction, since that has a better
> chance of turning low-order chunks of that volume into pageblocks that
> can be converted instead of needing a poisoning steal.
> 
> It's a change of long-standing behavior for everybody. It has a
> regression risk and requires careful evaluation and testing.
> 
> Meanwhile, adjusting the pageblock size on 64k page arm configs has a
> much smaller blast radius, appears to be the right move ANYWAY given
> what pageblocks are for, and makes the min_free_kbytes a non-issue.

