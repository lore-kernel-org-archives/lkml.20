Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE7BB31E82E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789974447; cv=none; b=btiJK931DuguKCvG9xWHGzOSGdabw6GFzTO0QHuy6w1T1/RrHR1Hv74CH0W62cCeBh5zdtXy0JH6Dgjr/c1K5uJp+gvr7Zmqd4oqP18K7VxXACuIb2bgBlplPuWKt3e8lPW3o/BoP94F43jCdL0di/xeHJADVvvLSxYMCQ3gcZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789974447; c=relaxed/simple;
	bh=m1QdZ/Hm+98ilJl7TB+DXpR549wphng53e2SVlfWEzo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=F3cAw+0v3e9UgoFTlhYQ2lZkLTfxm9dYFkPqLmXsE0rMY113mc7zo3wdkN1bl900K+Jm8lYIOBi4Dj1XRqO9wLsunW8FhXhl/gP/UBAvFOGO8bYJgRlYYZnAfZEYSbqhdp09LQhi5YywaIuqI2ymw/PQm00N0NK/OnxzaDQjqDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=FxDHtHQr; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="FxDHtHQr"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84217175A;
	Mon, 21 Sep 2026 00:07:18 -0700 (PDT)
Received: from [10.164.19.30] (unknown [10.164.19.30])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A32793F86F;
	Mon, 21 Sep 2026 00:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789974442; bh=m1QdZ/Hm+98ilJl7TB+DXpR549wphng53e2SVlfWEzo=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=FxDHtHQr4WfgB3nbBYQjT1jkO08pSgurjoKEOszdKh7BoIVhb691+Lrpbb4EVSfAt
	 V5vWHdUwOiBpU7JqHcW46hXHhDcWfqaNUpnCPF4C/d8dY/DMpF1T8BJmrKc8ojAdlY
	 9vQnhZNbVXpT1EliLnVQzmJFnd9cynhJrivnK6S0=
Message-ID: <62b4c932-4717-4366-906b-21aceae0c24b@arm.com>
Date: Mon, 21 Sep 2026 12:37:16 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Dev Jain <dev.jain@arm.com>
Subject: Re: [RFC 0/2] mm: page_alloc: pcp buddy allocator
To: Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org
Cc: Vlastimil Babka <vbabka@suse.cz>, Zi Yan <ziy@nvidia.com>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Rik van Riel
 <riel@surriel.com>, linux-kernel@vger.kernel.org
References: <20260403194526.477775-1-hannes@cmpxchg.org>
Content-Language: en-US
In-Reply-To: <20260403194526.477775-1-hannes@cmpxchg.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 04/04/26 1:10 am, Johannes Weiner wrote:
> Hi,
> 
> this is an RFC for making the page allocator scale better with higher
> thread counts and larger memory quantities.
> 
> In Meta production, we're seeing increasing zone->lock contention that
> was traced back to a few different paths. A prominent one is the
> userspace allocator, jemalloc. Allocations happen from page faults on
> all CPUs running the workload. Frees are cached for reuse, but the
> caches are periodically purged back to the kernel from a handful of
> purger threads. This breaks affinity between allocations and frees:
> Both sides use their own PCPs - one side depletes them, the other one
> overfills them. Both sides routinely hit the zone->locked slowpath.
> 
> My understanding is that tcmalloc has a similar architecture.
> 
> Another contributor to contention is process exits, where large
> numbers of pages are freed at once. The current PCP can only reduce
> lock time when pages are reused. Reuse is unlikely because it's an
> avalanche of free pages on a CPU busy walking page tables. Every time
> the PCP overflows, the drain acquires the zone->lock and frees pages
> one by one, trying to merge buddies together.
> 
> The idea proposed here is this: instead of single pages, make the PCP
> grab entire pageblocks, split them outside the zone->lock. That CPU
> then takes ownership of the block, and all frees route back to that
> PCP instead of the freeing CPU's local one.
> 
> This has several benefits:
> 
> 1. It's right away coarser/fewer allocations transactions under the
>    zone->lock.
> 
> 1a. Even if no full free blocks are available (memory pressure or
>     small zone), with splitting available at the PCP level means the
>     PCP can still grab chunks larger than the requested order from the
>     zone->lock freelists, and dole them out on its own time.
> 
> 2. The pages free back to where the allocations happen, increasing the
>    odds of reuse and reducing the chances of zone->lock slowpaths.
> 
> 3. The page buddies come back into one place, allowing upfront merging
>    under the local pcp->lock. This makes coarser/fewer freeing
>    transactions under the zone->lock.
> 
> The big concern is fragmentation. Movable allocations tend to be a mix
> of short-lived anon and long-lived file cache pages. By the time the
> PCP needs to drain due to thresholds or pressure, the blocks might not
> be fully re-assembled yet. To prevent gobbling up and fragmenting ever
> more blocks, partial blocks are remembered on drain and their pages
> queued last on the zone freelist. When a PCP refills, it first tries
> to recover any such fragment blocks.

Hi Johannes,

I have been working on anti-fragmentation algorithms in the buddy. After
thinking a lot I converged onto a "per-cpu, per-pageblock" buddy allocator
of sorts. Overall I think we can kill two birds with one stone -
performance and external fragmentation.

I will list my ideations here (perhaps something clicks to anyone) in no
particular order, and then show how I eventually reach a design similar to yours:

Suppose we are trying for order-2 allocs. An order-0 alloc request comes
on a cpu, the pcpu list is empty, the zone freelist for order-0 is empty.
We end up breaking an order-1 or higher block, even when other cpus may
have order-0 free pages.

I figured that just by disabling pcp lists, we can delay triggering
compaction (got 2% more order-2 THP allocations without triggering
compaction/reclaim) by not hiding order-0 free pages from order-0 alloc requests.
So, a "PCP stealing" algorithm may be needed.


I then thought of a "sorting" algorithm on the freelists: either sort
by PFN (causing allocations to cluster on the lower half of memory space)
or by fragmentation score (per pageblock). Any such sorting algorithm
requires two things:

1. When to trigger the algorithm - can't be wasting time doing sorting on
every alloc and free

2. What portion of the list to sort: sorting should not push a block
recently freed to the back of the list because it is cache hot, so let us take
a major portion of the list from the tail and sort it

3. The sorting algorithm should be cheap: bucket sort by sqrt(RAM) number of
buckets or some other number if sorting by PFN, or bucket sort by frag score,
buckets being [0, 511]).

All of this helps, but the more fundamental problem is that for a block of contiguous
memory, their lifetimes are *not* tied together.

Consider VMA1 of Process P1 and VMA2 of Process P2, being the only allocators
(by the process faulting in) and contending on the zone lock. Usually a process
will start faulting into the VMA contiguously. So, if we have four pages:

0 0 0 0

and both processes are faulting in, then the configuration most probably would
look like

1 2 1 2

meaning that VMA1 will have pages 0 and 2, VMA2 will have pages 1 and 3, because
dropping the zone lock will cause the other one to enter, and so on. Had this not
been the case, we could have got "1 1 2 2" which is clearly better.

(Although we have pcp lists which consume from zone lists in batches, the
logic above quickly starts holding true because the lifetime of each order
list on the pcp is not tied together, so eventually the pcp is filled with
non contiguous memory).

I then researched around and found that reclaim is one of the biggest factors
of fragmentation, but again the fundamental problem is lifetime. I found out
an attempt to do reclaim in blocks:

https://lore.kernel.org/all/exportbomb.1164300519@pinky/

which got reverted: active and inactive pages are clustered together.


So then I thought, how do I tie the lifetime together? Probably have a
task_struct steal a block of memory? That sounds like something very
complex to get right. Instead, I can use a CPU being an analogue to
the process.

So now the zone just becomes a provider of blocks.
A process when faulting in, assuming doesn't get bounced around cpus
like anything, can now get allocations physically close to each other.

The crux is that doing allocations from a global state like the zone
means that just as you drop the lock you let the other guy enter, which
breaks contiguity. Having contiguity per cpu means the same process can
use it up.

I would assume implementing a pure per-cpu based allocator could get you
blazing fast performance, with all of the above extfrag benefits,
at the cost of figuring out an algorithm for cpus to steal from other cpus.

I assume some bitmask tricks could work wherein each cpu advertises free
blocks to the other.

I think there are existing cpu-stealing concepts in scheduler etc which
we can borrow, and perhaps I should also take a look at slab once again
for per-cpu ideas (although they had a radical sheaves change which I am
not familiar with).

I will play around with your patchset and see if I can improve it!


> 
> On small or pressured machines, the PCP degrades to its previous
> behavior. If a whole block doesn't fit the pcp->high limit, or a whole
> block isn't available, the refill grabs smaller chunks that aren't
> marked for ownership. The free side will use the local PCP as before.
> 
> I still need to run broader benchmarks, but I've been consistently
> seeing a 3-4% reduction in %sys time for simple kernel builds on my
> 32-way, 32G RAM test machine.
> 
> A synthetic test on the same machine that allocates on many CPUs and
> frees on just a few sees a consistent 1% increase in throughput.
> 
> I would expect those numbers to increase with higher concurrency and
> larger memory volumes, but verifying that is TBD.
> 
> Sending an RFC to get an early gauge on direction.
> 
> Based on 0257f64bdac7fdca30fa3cae0df8b9ecbec7733a.
> 
>  include/linux/mmzone.h     |  38 ++-
>  include/linux/page-flags.h |   9 +
>  mm/debug.c                 |   1 +
>  mm/internal.h              |  17 +
>  mm/mm_init.c               |  25 +-
>  mm/page_alloc.c            | 784 +++++++++++++++++++++++++++++++------------
>  mm/sparse.c                |   3 +-
>  7 files changed, 622 insertions(+), 255 deletions(-)

