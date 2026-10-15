Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37D354B8296
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792052458; cv=none; b=G296AOgPNxxK+aiZrECZPcM3vFc7WE6zoGqEr+4jKP/TzVK5ySaI6+Bzq+BBPwdAyRxE31jjYfTs63tV8Qzzd9jiWi7yV9SbXQVtSlCtMWwz+wtGWhInU1uH5VaLf3+ubz66FJi4c3qRqzIYd1MKaea6d3N48308GeNylu58Fns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792052458; c=relaxed/simple;
	bh=F5wGTE/FgF7+DxZwQR6hrwUobidum0QUlEo4Hxn7PgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RQb8uvz3k3A+SmOte3dwBsobCj9LlHSKBkj1pGKqjDQxA6Nukv0US5eMfqJGBF+GVh4zI4gfpEAgkUlxADM1kwwZihon0Zam4D+q8YJVzdHIxWoLtHWwPv3dZN3duaQwZ/HZmeGhTSPer/EekLE6l0RhRBrsYlbvsHWPSHEwG5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=PfmiqPqt; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="PfmiqPqt"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC0782F;
	Thu, 15 Oct 2026 01:20:50 -0700 (PDT)
Received: from [10.164.19.62] (unknown [10.164.19.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C0883F871;
	Thu, 15 Oct 2026 01:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792052454; bh=F5wGTE/FgF7+DxZwQR6hrwUobidum0QUlEo4Hxn7PgY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PfmiqPqtNGQ2dfYvOxXeKNFpBumxHwD1dnsfs6AQ3si8OoeyswdyPCoLhpbWLXBZB
	 sn3dTCfmjgXTHQN9NCjTotyUhehm0Hyq39Yd/3y4Ew5HkmxlfSbcTNN0vepn7KKauj
	 zSfZsJOHcWrwtnsnxm/y3Cu6cc6e6RTEVvd/wrLE=
Message-ID: <087678bc-41f8-4250-bde9-e9fe9399e67b@arm.com>
Date: Thu, 15 Oct 2026 13:50:45 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/5] mm/page_alloc: convert any movable pageblock on a
 non-movable allocation
To: Rik van Riel <riel@surriel.com>, Johannes Weiner <hannes@cmpxchg.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Brendan Jackman <brendan.jackman@linux.dev>,
 Zi Yan <ziy@nvidia.com>, Kairui Song <kasong@tencent.com>,
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>,
 Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>,
 Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
 Baoquan He <baoquan.he@linux.dev>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>,
 linux-mm@kvack.org
References: <20261007021250.1665929-1-riel@surriel.com>
 <20261007021250.1665929-4-riel@surriel.com>
 <20261014204836.GI371161@cmpxchg.org>
 <5234543d2c1b44706501d2e079b41e95a6a1d200.camel@surriel.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <5234543d2c1b44706501d2e079b41e95a6a1d200.camel@surriel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 15/10/26 2:23 am, Rik van Riel wrote:
> On Wed, 2026-10-14 at 22:48 +0200, Johannes Weiner wrote:
>> On Tue, Oct 06, 2026 at 10:12:48PM -0400, Rik van Riel wrote:
>>> try_to_claim_block() converts a movable pageblock for a non-movable
>>> allocation only when half its pages are free or compatible.
>>> Otherwise the steal path takes pages without converting, and
>>> non-movable content sits in a block still typed movable.
>>>
>>> Convert a movable block on any non-movable claim, however few of
>>> its pages are free, so the block's type matches the allocation it
>>> serves.
>>>
>>> When other pages in the block are freed later, they end up on the
>>> non-movable free lists, directing more non-movable allocations to
>>> the already non-movable page blocks.
>>>
>>> Converting a non-movable pageblock to movable is made stricter:
>>> a movable claim takes a non-movable block only when every page
>>> is free or movable.
>>>
>>> Blocks straddling a zone edge are never claimed;
>>> zone_spans_pageblock() tests for a block wholly inside its zone.
>>>
>>> Assisted-by: LLM
>>> Signed-off-by: Rik van Riel <riel@surriel.com>
>>
>> I like this in theory, but wonder how this behaves in practice.
>>
>> The block is claimed, but the movable constituents aren't proactively
>> kicked out.
> 
> I have code for that, too, but it seems like
> it's a lot easier to get things reviewed in
> small portions.
> 
> If you want I can resend this as a larger
> series, with:
> 1) the pageblock claiming
> 2) per migrate type free lists
> 3) evacuation of movable pages from unmovable 
>    pageblocks, when the kernel free lists fall 
>    below a watermark
> 
> That would be the full extent of the 2MB granularity
> fragmentation avoidance stuff I have here.

I think your patch series applied as-is would regress stuff:
we may have lots of UNMOVABLE pageblocks with lots of
movable allocations, unable to be rescued, hurting mTHP
allocations.

> 
> Just let me know your preference.
> 

