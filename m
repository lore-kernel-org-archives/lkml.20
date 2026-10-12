Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA65D3B71AF
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791801304; cv=none; b=bnL5WpjMOPYE9/bRLgvujYTw9FXjDlxInkHyMEd8VSm/WjubSsDMNqvNvH1N8vU649koe0fbRuE0MfZ9FV0IXxuZPgxjsOU/5T0Fiw8slm8XvElDZKPkfPH0NRwn4NfGhFhNtxM57/yjfKhlMda1/eLgn3VshKMAKqZDumv2wQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791801304; c=relaxed/simple;
	bh=7mPoOADKUkvYW5ZVuoA7QdKSncxImw2HU3nvjwRhcXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mBWr/mN6tHWP5GOu+CZmAuIPLbsiXbganVzTDWEsrc7Jz0b2s8uFNZOLiit/RHqBgiUCKPDPDSHRZIB+vubl0D/sA8O6gUQ3if4ByZH9hT52uq8bcednwwJmFKwTGkJjVYP0KAV3Jz+e1pccS0+q//iE8/XfbXeF6sRWF4nEL1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=icMAw4S7; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="icMAw4S7"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96C2E1655;
	Mon, 12 Oct 2026 03:34:58 -0700 (PDT)
Received: from [10.164.19.62] (unknown [10.164.19.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A9703F66F;
	Mon, 12 Oct 2026 03:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791801301; bh=7mPoOADKUkvYW5ZVuoA7QdKSncxImw2HU3nvjwRhcXM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=icMAw4S70hvgPizVJkQABJCxtd+gmFfyDPnnDMNKclV5o0WnmKAApqsQl/20ZNxXu
	 imeF/mYQKnQcQfc9BKxpsxnSyeJSk22sgaIY1E9MaXMTOZMS2XBG9wyWpehI3sHHEx
	 fg9p5DpQht1bU7Xw7QTSe0Ns0sjHKalma2s4QFtM=
Message-ID: <facd12d4-c1cb-4b9c-ac70-303581e43eb6@arm.com>
Date: Mon, 12 Oct 2026 16:04:54 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC NO CODE] [DISCUSSION] Anti-fragmenting ordered buddy
 allocator
To: Pedro Falcato <pfalcato@suse.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, ryan.roberts@arm.com,
 riel@surriel.com, akpm@linux-foundation.org, david@kernel.org,
 ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, kasong@tencent.com, qi.zheng@linux.dev,
 shakeel.butt@linux.dev, hannes@cmpxchg.org, brendan.jackman@linux.dev,
 ziy@nvidia.com
References: <20261011215412.1181172-1-dev.jain@arm.com>
 <asyUgZVSauks3Vwd@pedro-suse.tail5790ac.ts.net>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <asyUgZVSauks3Vwd@pedro-suse.tail5790ac.ts.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/10/26 1:55 pm, Pedro Falcato wrote:
> Hi,
> 
> On Sun, Oct 11, 2026 at 09:54:11PM +0000, Dev Jain wrote:
>> (I am not posting code yet since it is in experimental stage.)
>>
>> TL;DR
>> -------
>>
>> I am proposing "ordered/bucketed buddy allocator": we divide the buddy
>> freelists into buckets, and prefer lower buckets for allocation.
>> This reduces external fragmentation (and, further reduces it when we
>> reverse the ordering for unmovable and reclaimable allocations) at the
>> cost of regressing the alloc and free paths, which depends on how many
>> buckets you partition into. I think we can partition into 4 buckets and
>> do some tricks to remove any regression.
>>
>> Design 1 is the simplest and the most upstream-friendly method in terms of
>> allocator speed. Design 2 tries to scale better with the number of buckets.
>>
>> INTRODUCTION
>> -------------
>>
>> Apart from dividing the freelists between migratetypes, little attempt
>> has been made to change the algorithm of the buddy itself to reduce
>> external fragmentation proactively (termed as "anti-fragmentation" in
>> academia). Linux has defragmentation (compaction). The analysis below
>> is *not* to claim that compaction does a bad job; I just took up the
>> challenge of anti-fragmentation (because I like to torture myself) and
>> kept digging the rabbit hole.
>>
>> There have been academic papers about replacing the buddy with bitmaps -
>> I did not want a hard NAK from upstream at any attempt to do that, so
>> I preserved the buddy freelists.
> 
> So, I've been looking at LLFree (one of those novel page allocators with
> no buddy and just a bitmap) lately. A few thoughts:

Hi Pedro,

Right, David H. had sent me that paper : )


> 
> LLFree basically divides memory into 2MB pageblocks (with a free pages
> counter), and then later organizes these pageblocks into 64MB "tree roots".
> These tree roots are then borrowed by each CPU and made local (pretty much
> like old SLUB used to do). This localizes most of your allocations and
> pretty much avoids conflicts/cross-talk across CPUs.
> 
> Yes, there is a bitmap. I don't think it's required, and it might actually
> be misguided. The paper itself has other side-goals. One of them is easy
> persistence in persistent DRAM; we don't need that. Another one is minimizing
> the cache footprint of the page allocator; this is misguided (IMO) because
> allocating pages has the side effect of you actually needing to initialize
> the struct pages after the fact; whether the allocator core hangs state off
> the struct page or not is not important, and in fact using struct page there
> might provide cache benefits.

Yeah I had skimmed over it and did not understand the cache benefit claim; the
main benefit seems to be the lockless design.

The critical section under zone->lock is extremely cache efficient right now
as, when it pops a page from the head, it touches 1) the list_head sentinel
of the list which is hot, 2) the page to be alloced whose fields are going
to get touched anyway, 3) the next page's prev pointer, so warming up this
page for the next allocation.


Right now we bounce on different cachelines once the lower order freelists get
empty. The current design is to first index by order, and then by migratetype.

I vibe coded to do the reverse and it does improve cache hits in general. But,
it has a collision with the free_area->nr_free which maintains total free blocks
per order (hence, summed across migratetypes). I'll see if I can send this
patch separately.

> 
> The bitmap does not work well for random order allocations.
> The paper itself was written on Linux 6.0, which (probably) relied quite a
> lot less on things like mTHP (and random-order file pages) than we do now.

Indeed.

> 
> In any case, this paper doesn't necessarily address your fragmentation
> problems, but it does attempt to address fragmentation (and SMP performance)
> through borrowing these pageblocks. I would not be surprised if it had
> a sizeable (positive) impact in fragmentation. I firmly believe that a
> direction similar to the buddy allocator, but with more buddy work pushed
> to the pcpu side (like Johannes's pcp buddy allocator series) is there right
> approach and could have a meaningful effect.

Exactly which I wrote in the other email : ) A cpu is the natural approximation
of tying lifetime together.


> 
> Of course, it doesn't solve other problems like lifetime mixing in allocations,
> and things like slab migration are insanely complicated to pull off.
>  
> 

