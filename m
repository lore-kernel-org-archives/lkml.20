Received: from mta1.migadu.com (out-13.mta1.migadu.com [95.215.58.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A685D4AC16D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 17:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788369908; cv=none; b=ZGmaFbkvPrWadCsbJLc12P6ABPcD2SwLXoMvRprDtbcNg+/2tNO7Ip4+I4OPTPNYXqBBGlVonZWmlboYv2m2qN2GO6nug9uK0/R6qQrSajkmRVNFgtw9t7ME1H2iWHFNDy4pxShSD0apJXtN9K4l0ZrP0oP9BsKJco0W3ZqMIEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788369908; c=relaxed/simple;
	bh=zVLiLCnn5wBW7F2XzqGPz3Kej+qpszl9q97IDvPoC+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WDqs/DdfeZ+r8oByOZ9MNr+CpCgaEFCuce+eFMlmkPTqRptNHpUqQMNM7lwcqFtZeA32EtneLAJuHlS67RRR2giP+FT0viL4qG38zXjLPfJe8M+sBYJSpWramvgrflildic+WYAnkHkK9sedo3tgJ962yDcfG/O/HXfKd4SM1K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=w+K56oHJ; arc=none smtp.client-ip=95.215.58.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="w+K56oHJ"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=zVLiLCnn5wBW7F2XzqGPz3Kej+qpszl9q97IDvPoC+M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788369903; v=1; x=1788974703;
 b=w+K56oHJwIaSsP8L1/hmLxLEpYUy6Zm+NUIPKde0nWwpJSu0Ckzt2k6+FofOzn2gQGJ2jYdb
 sUJpGnx1y+AFPDJ2/9zlYrEVQm9kNdC9aG2br5ZPfIiOARyN6cmrq4Tw3h7lYeP3EwR/VewTCeC
 t7a7y4v9OenGv0ka93Znl5T0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id deb81ae05c943f24;
	Wed, 02 Sep 2026 17:25:01 +0000
X-Mizu-Trace-ID: deb81ae05c943f24
X-Migadu-Flow: FLOW_OUT
Message-ID: <00ad7476-c56b-49ab-a5bd-3f4bbe7c84a3@linux.dev>
Date: Wed, 2 Sep 2026 18:24:58 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mm: remove min_free_kbytes adjustment for THP
To: Zi Yan <ziy@nvidia.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Nimrod Oren <noren@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Brendan Jackman <brendan.jackman@linux.dev>,
 Hugh Dickins <hughd@google.com>, Nirmoy Das <nirmoyd@nvidia.com>,
 Dragos Tatulea <dtatulea@nvidia.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20260901190123.3511535-1-noren@nvidia.com>
 <20260901204449.GK3004@cmpxchg.org>
 <C8541A2F-D6A9-41B0-A3FE-52339A6601F0@nvidia.com>
 <20260901220917.GM3004@cmpxchg.org>
 <69C018F5-A1C8-47AD-9567-3497AA6808EC@nvidia.com>
 <20260902160417.GN3004@cmpxchg.org>
 <583c4718-f763-41f0-b757-02b46655c0b5@linux.dev>
 <A36CC394-0954-437A-B408-359C548DA3E1@nvidia.com>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <A36CC394-0954-437A-B408-359C548DA3E1@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 02/09/2026 18:02, Zi Yan wrote:
> On 2 Sep 2026, at 12:47, Usama Arif wrote:
> 
>> On 02/09/2026 17:04, Johannes Weiner wrote:
>>> On Tue, Sep 01, 2026 at 09:49:58PM -0400, Zi Yan wrote:
>>>> On 1 Sep 2026, at 18:09, Johannes Weiner wrote:
>>>>
>>>>> On Tue, Sep 01, 2026 at 05:09:52PM -0400, Zi Yan wrote:
>>>>>> On 1 Sep 2026, at 16:44, Johannes Weiner wrote:
>>>>>>
>>>>>>> On Tue, Sep 01, 2026 at 10:01:23PM +0300, Nimrod Oren wrote:
>>>>>>>> When THP is enabled, set_recommended_min_free_kbytes() may raise
>>>>>>>> min_free_kbytes using a heuristic that scales with pageblock_nr_pages.
>>>>>>>> Commit f000565adb77 ("thp: set recommended min free kbytes") added this
>>>>>>>> heuristic to help keep pageblocks free and reduce fragmentation for THP
>>>>>>>> allocations.
>>>>>>>
>>>>>>> We've had problems with compaction before when min_free_kbytes was too
>>>>>>> small on large machines. Competing free space scanners do a lot of
>>>>>>> work only to fight over a very small set of possible target pages.
>>>>>>>
>>>>>>> So I'm a bit uneasy that you didn't include any benchmark numbers with
>>>>>>> this that prove basic functionality on larger hosts isn't regressed.
>>>>>>>
>>>>>>>> The recommendation scales poorly with larger base page sizes. With the
>>>>>>>> default arm64 pageblock sizes, the contribution per eligible zone
>>>>>>>> before applying the existing cap of 5% of low memory is:
>>>>>>>>
>>>>>>>>   4 KiB pages:   2 MiB pageblock,   22 MiB per zone
>>>>>>>>  16 KiB pages:  32 MiB pageblock,  352 MiB per zone
>>>>>>>>  64 KiB pages: 512 MiB pageblock,  5.5 GiB per zone
>>>>>>>
>>>>>>> I question whether pageblocks need to be 512M on those machines to
>>>>>>> begin with. After this patch, you're still asking the page allocator
>>>>>>> to optimize grouping such that 512M pages can be allocated at
>>>>>>> runtime. Only now you took away part of the mechanism to do so.
>>>>>>>
>>>>>>> If you're using 512M THPs, I would kind of assume it's on machines
>>>>>>> with a memory size where 5.5G for defrag purposes isn't devastating.
>>>>>>>
>>>>>>> And if you're not, it would make more sense to lower the pageblock
>>>>>>> size to the mTHP size you're actually using. And that would fix the
>>>>>>> "excessive" min_free_kbytes issue as well.
>>>>>>
>>>>>> But lowering pageblock size requires a kernel compilation. That means
>>>>>> maintaining two sets of kernels for different needs.
>>>>>
>>>>> That depends on whether anyone actually wants 512M pageblocks...
>>>>>
>>>>>> The ultimate solution is to enable better compaction to generate
>>>>>> THPs bigger than a pageblock size, like Rik's super-pageblock
>>>>>> proposal.
>>>>>
>>>>> ...or whether we can say, at that point, use gigablocks/cma+hugetlb.
>>>>>
>>>>> And then the static pageblock size for the fallback logic etc. can be
>>>>> a smaller, saner default for everybody.
>>>>>
>>>>> Because the point you didn't address: it doesn't make really sense to
>>>>> have 512M pageblocks on smaller machines, beyond the min_free_kbytes
>>>>> issue: Fragmentation events will poison half a gig at once,
>>>>> should_try_claim_block() becomes harder which results in less
>>>>> conversions and more allocations falling through to stealing, page
>>>>> isolation is more likely to fail, compaction locks and operates on
>>>>> oversized chunks which is bad for latency and concurrency...
>>>>
>>>> I actually wonder why such a big pageblock would still result in a lot
>>>> of fallbacks.
>>>
>>> If you look at try_to_claim_block(), you need half of a block to be
>>> free or compatible with the requested migratetype in order to convert
>>> it. When memory is full, LRU pages are scattered all over, and
>>> compaction is not involved (order-0), this gets more difficult the
>>> bigger the block is. You can get into a situation where LRU reclaim
>>> will not clear sufficient room for conversion in any given pageblock
>>> anymore and you're stuck with the type distribution. A large share of
>>> buddy requests then go permanently through the slower fallback path.
>>>
>>> Usama knows more about this, but we have seen this on GB300 hosts, and
>>> have JUST started to deploy kernels with smaller pageblocks (2M).
>>
>> Yes, just to confirm above, unfortunately, there were too many problems
>> we were seeing in Meta production with 512M pageblock size for arm 64K
>> base page size and just had to switch to 2M.
> 
> Do you mind elaborating on the problems? Johannes has given good arguments.
> I would like to hear more from you, since he said you know more about the
> issues.
The issue that finally pushed us toward 2 MiB pageblocks occurred on
GPU hosts during AI-training checkpointing. We observed significant
latency spikes and workload timeouts.

These hosts had substantial unmovable memory, and order-0 allocations
from TCP paths repeatedly fell back to MIGRATE_MOVABLE free lists.
With 512 MiB pageblocks, try_to_claim_block() often could not meet
the half-pageblock threshold, so allocation fell through to stealing
individual pages.

This contaminated very large movable pageblocks with unmovable pages.
Compaction then repeatedly scanned those pageblocks but could not
evacuate the unmovable allocations. We observed sustained compaction
activity during the latency spikes.

> 
> Thanks.
> 
> 
> Best Regards,
> Yan, Zi

