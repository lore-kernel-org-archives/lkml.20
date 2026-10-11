Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7466013B5B3
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 21:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791755675; cv=none; b=N95OCDnWv/cUvc3M3Vds16gXTmHhWBgdpMayiKkL4pW5wEekhg0aI3NUM4vLu/1zVdKdtFFb8zJXq+geI4FaGFfaffQulKCRAozPFSvL+AJ+1zXUYD5/cL8U+VzpZAI+P6sj8/ZbK/y+q1xtK70t9D1tKBx7kL+u4/O/dUccLUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791755675; c=relaxed/simple;
	bh=CjXAODnEAHZt/ze1fUVx1lc4eAYVC7QnfQvq3wkUGQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TM6PeiTsnrk0fFBaIU8sxY1my3B7dM4Z2fuXT8nhRw+DSb/45Vumw8akvObjPJoOptTilxV2dFaTcGLp7WkCnhaGvtJzPIjH/K0zyVoOUK+4XbVj37byIuS8qGEY2USd2F8n7r8YQnwQT5o/n2HMyd8XvTByFz6qhK8ALzcAQKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Nrd5Q4bI; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Nrd5Q4bI"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6D371684;
	Sun, 11 Oct 2026 14:54:27 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-01.blr.arm.com (cesw-amp-gbt-1s-m12830-01.blr.arm.com [10.164.195.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4CDA93F673;
	Sun, 11 Oct 2026 14:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791755671; bh=CjXAODnEAHZt/ze1fUVx1lc4eAYVC7QnfQvq3wkUGQQ=;
	h=From:To:Cc:Subject:Date:From;
	b=Nrd5Q4bIex4K5sPIo2WaDht5vD3RyakVYy9IJYIO9FKsHf5pHCQgeNYIqobBzV6qt
	 eiK0xJa6NEGswHMWKnHVim461hZYvugiI0n8yMnzJV4YvFeWj0FkHUR0UGwXliHz2n
	 dnLbuGmq6SencPcF4fPUfw63RNMz5p820DS9VWZM=
From: Dev Jain <dev.jain@arm.com>
To: linux-mm@kvack.org
Cc: Dev Jain <dev.jain@arm.com>,
	linux-kernel@vger.kernel.org,
	ryan.roberts@arm.com,
	riel@surriel.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	hannes@cmpxchg.org,
	brendan.jackman@linux.dev,
	ziy@nvidia.com
Subject: [RFC NO CODE] [DISCUSSION] Anti-fragmenting ordered buddy allocator
Date: Sun, 11 Oct 2026 21:54:11 +0000
Message-ID: <20261011215412.1181172-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

(I am not posting code yet since it is in experimental stage.)

TL;DR
-------

I am proposing "ordered/bucketed buddy allocator": we divide the buddy
freelists into buckets, and prefer lower buckets for allocation.
This reduces external fragmentation (and, further reduces it when we
reverse the ordering for unmovable and reclaimable allocations) at the
cost of regressing the alloc and free paths, which depends on how many
buckets you partition into. I think we can partition into 4 buckets and
do some tricks to remove any regression.

Design 1 is the simplest and the most upstream-friendly method in terms of
allocator speed. Design 2 tries to scale better with the number of buckets.

INTRODUCTION
-------------

Apart from dividing the freelists between migratetypes, little attempt
has been made to change the algorithm of the buddy itself to reduce
external fragmentation proactively (termed as "anti-fragmentation" in
academia). Linux has defragmentation (compaction). The analysis below
is *not* to claim that compaction does a bad job; I just took up the
challenge of anti-fragmentation (because I like to torture myself) and
kept digging the rabbit hole.

There have been academic papers about replacing the buddy with bitmaps -
I did not want a hard NAK from upstream at any attempt to do that, so
I preserved the buddy freelists.

IDEA
----

There is a correlation between allocating from one side of memory, and
reducing external fragmentation. Biasing on one side implies the
probability we fragment already fragmented sections is high. This may also
enable smarter compaction by directing the free-page scanner toward
higher-address regions. This also circumvents the discussion around
a "fragmentation score" which is dependent on the size of the
block we are considering.

The idea itself quite obviously improves clustering of allocations: I
observe reductions in 'compact_stall' and 'anon_fault_fallback', and some
large improvements when the number of buckets is high (like, compact_stall
going down from 4000 to 5 with almost no hit in execution time for a kernel
compilation). The obvious downside being slowing down the allocator (which
needs to be tested more widely). The content below is mainly on how
to minimize that.

PROBLEM
-------

The number of buckets is inversely proportional to allocator performance.
The critical section under the zone->lock is extremely fast.

The overheads are the following:

1) Alloc: What is the first free bucket which has the required order? We
don't want to naively scan across the buckets.

Then, the more surprising one, which becomes more visible as the number
of buckets increase:

2) Free: When we do pfn->bucket lookup (which needs to happen in a
cache-effective manner) and free into that bucket, if this is not the
"active" bucket we were allocating from, then we are going to miss the
cache. The inactive bucket list_head is cold, and the page at its head
is also cold. We are going to perform some cold operations to insert it
into its (bucket, order) freelist.

At least on my system, increasing the size of struct zone did not
contribute to overhead (for free areas <= 64). I may not have
increased it enough.

DESIGN COMMONALITY
------------------

All designs aim to prefer low addresses for movable allocations,
and high addresses for reclaimable/unmovable allocations. The
"SOLUTION COMMONALITY" is: keep things tight in cache. We pay cycles
when the bucket we were allocing from starts becoming empty, and we need
to find the next bucket. The crux is to amortize that cost somehow.

DESIGN 1
--------
We divide the zone into 4 buckets of equal length. Then, allocation first
chooses the migratetype, iterates the available buckets from left to
right for movable allocations, and right to left for unmovable/reclaimable.
When freeing, we do a pfn->bucket index lookup, and free into that
(migratetype, bucket, order) freelist.
Note that we change the indexing to the above: currently the index is
(order, migratetype), making order list heads for the same migratetype
distant. This is problematic if we want to scan order lists for the
same buddy unit.

We may be needlessly scanning the lists when the bucket is empty. So,
we can make a bucket "active" and allocate from the active bucket, till
we cannot. Then we iterate from the start and make a bucket active.

This algorithm does not scale well with the number of buckets, but is
the simplest.

DESIGN 2
--------

The aim now is to increase the number of buckets. Suppose the active bucket
is F, wherein active means, this is the bucket we will keep allocing from
until we cannot.

ALLOC TIME: We request an order-x block, search the order freelists on this
bucket, and can't find anything. Now, we need to find the first bucket
with an order-y freelist nonempty, y >= x.

We can use a "bucket-local" bitmap: for the active bucket, maintain a
local bitmap, kept on the cacheline of the order-0 list_head. On every
pop and free from the active bucket, we will update this bitmap to
indicate whether order-x list is nonempty.

Once this bucket becomes nonactive, publish this local bitmap into the
zone-scoped bitmap, and use that bitmap to quickly find the first
bucket which has a block >= order-x.

FREE TIME: if we are freeing a PFN belonging to a non-active bucket ...
we DO NOT need to free to its bucket yet! Free this into a lockless linked
list kept in the zone->lock cacheline (just like trylock_free_pages).
The crux is that we do not need to make these blocks visible to the
buddy yet either for allocation or buddy coalescing, since allocation
from those buckets is not going to happen until the active bucket
is in use.

Once the active bucket can no longer satisfy the request, we drain this
list (or, when a threshold is crossed, to prevent unbounded
work under spinlock).

So we have amortized cache misses across non-active frees.

The problem starts when this bucket jumping becomes very frequent. It
is a sign we are under memory pressure. We should then call into the
slowpath and free enough pages. But, we really shouldn't be using
huge number of buckets under memory pressure, since there is no point
of "anti fragmentation" now. The bucketed allocator helps us to delay
compaction and reclaim. So we need a way to switch.
