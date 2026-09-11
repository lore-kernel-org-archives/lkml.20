Received: from mta0.migadu.com (out-166.mta0.migadu.com [91.218.175.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2F2443C2B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125918; cv=none; b=DNjQAVIvj9P57SsCq30MBVlz38OlLR4aEtraE+8QHo8YGiVffQhqlB1w4HzD1ASruQf0DhcGuKjJ/0QMtDy52aKwZN/oUs42y3omp1T7gmcE0xGumxE1j8xamzEz95HCK8qgRyuvezygY/3ehFUd4ZJ9QN6tS6e81RnkpJ4SnJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125918; c=relaxed/simple;
	bh=f7vgrWFnlwg6/255249tFUq+HYEzRsS+Tx+IgMJ6FWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IyINEiJzlQXzjhlwLj7wxjbiAiN0c/TjQPWBQQA1A+zo6Ah4cz3p06onMMHD6qVtQGDt6JK3iRfoMlooPRJMbtCXpHB+QPf8JPBQ4N5uCStMFxVo8Og9IAmXWIUQtFeMVzcscbP0nLvojfZt/H2Wot0scK5oMPsIGz4sKBKnLlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=e0LLpN1Q; arc=none smtp.client-ip=91.218.175.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="e0LLpN1Q"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=f7vgrWFnlwg6/255249tFUq+HYEzRsS+Tx+IgMJ6FWc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789125901; v=1; x=1789730701;
 b=e0LLpN1QAFDTi03psw8032fBWzWfOK8x9wggSKZtflhDdr6SRUzes6831HJ3yAQne8g4D4t5
 lon7fg0waEgbyxnC1o6TZ8J77LKM3LV5lno5wLHrfWt0HFEAMqHRlwBhxk1AdZntuJG0wHqys5K
 hjqXX6K91JggntSRPvvFJlE8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 363801b648538b55;
	Fri, 11 Sep 2026 11:24:51 +0000
X-Mizu-Trace-ID: 363801b648538b55
X-Migadu-Flow: FLOW_OUT
Date: Fri, 11 Sep 2026 19:24:45 +0800
From: Hao Li <hao.li@linux.dev>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: harry@kernel.org, akpm@linux-foundation.org, cl@gentwo.org, 
	rientjes@google.com, roman.gushchin@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Pedro Falcato <pfalcato@suse.de>
Subject: Re: [RFC PATCH 0/2] mm/slub: reduce list_lock contention with slab
 parking
Message-ID: <aqPg5YRKdaZiBj9b@fedora>
References: <20260824122004.3652-1-hao.li@linux.dev>
 <a3e5581a-e039-45bb-b570-a01158b154bb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3e5581a-e039-45bb-b570-a01158b154bb@kernel.org>

On Mon, Sep 07, 2026 at 03:44:08PM +0200, Vlastimil Babka (SUSE) wrote:
> On 8/24/26 14:19, Hao Li wrote:
> > This patch series might sound a bit wild, but the initial numbers don't
> > look too bad so far. I would really appreciate any feedback and
> > discussion :)
> > 
> > On a will-it-scale mmap1 run with 192 processes, list_lock is the top
> > contention point: __slab_free() and __refill_objects_node() together
> > spend 44% of cycles in native_queued_spin_lock_slowpath. The free
> > slowpath takes the lock mainly to add slabs that became non-full to the
> > partial list.
> > 
> > By adding extra instrumentation to __slab_free(), I collect the following
> > data for the maple_node cache (in counts):
> > 
> >   partial->partial    843017414
> >   full->partial       550719384
> >   partial->empty      17459564
> >   full->empty         2
> > 
> > We can see that full -> partial transitions account for a significant
> > proportion, and optimizing them can help reduce lock contention to some
> > extent.
> > 
> > This series introduces the parking mechanism to address this issue.
> > When the trylock fails during a full -> partial/empty transition,
> > __slab_free() parks the slab on a per-node llist instead of waiting. The
> > paths that consume the partial list (sheaf refill, alloc slowpath,
> > shrink, cache destruction) unpark the slabs after taking the lock, and a
> > delayed work covers the case where none of them runs.
> > 
> > Patch 1 cleans up the case handling in __slab_free(), no functional
> > change. Patch 2 introduces the parking mechanism.
> > 
> > Tested with will-it-scale mmap1 (192 processes).
> > 
> > Summary data
> > ------------
> > 
> > throughput             29237910 -> 35585663  (+21.7%)
> > alloc_slab,free_slab   -52%
> > cmpxchg_double_fail    -85%
> > 
> > perf data without this patchset:
> > - 44.22% [kernel] [k] native_queued_spin_lock_slowpath
> >    43.48% native_queued_spin_lock_slowpath
> >     - _raw_spin_lock_irqsave
> >        - 23.80% __refill_objects_node
> >        - 19.12% __slab_free
> > 
> > perf data with this patchset:
> > - 30.39% [kernel] [k] native_queued_spin_lock_slowpath
> >    29.82% native_queued_spin_lock_slowpath
> >     - _raw_spin_lock_irqsave
> >        - 29.06% __refill_objects_node
> > 
> > Additionally, the number of partial slabs and the number of objects show
> > no noticeable change before and after applying this patchset, indicating
> > that this change has a negligible impact on slab fragmentation.
> > 
> > Detailed data
> > -------------
> > 
> > metric                              before             after             delta      change
> > ==========================================================================================
> > alloc_fastpath                     155,417           168,534            13,117      +8.44%
> > alloc_slab                      55,679,646        26,702,510       -28,977,136     -52.04%
> 
> It's interesting that this is reduced so much. Is it because parked slabs
> cause more slabs to stay around for reuse, despite they are unparked
> immediately when trying to allocate/refill? That seems odd?

Yeah, it does look counter-intuitive at first glance. My understanding is that
the parking mechanism helps by bypassing the partial list spinlock, allowing
partial slabs to be parked onto the llist locklessly at any point. Because of
this, the refill path gets to see and reuse more partial slabs instead of
having to allocate fresh ones so frequently.

> 
> > alloc_slowpath                           0                 0                 0      +0.00%
> > barn_get                             2,715             2,771                56      +2.06%
> > barn_get_fail                            2                 0                -2    -100.00%
> > barn_put                             2,715             2,770                55      +2.03%
> > barn_put_fail                1,370,488,457     1,668,257,974       297,769,517     +21.73%
> > cmpxchg_double_fail              3,827,935           549,427        -3,278,508     -85.65%
> > free_add_partial             1,684,340,964     2,161,921,625       477,580,661     +28.35%
> > free_fastpath                       31,766            32,979             1,213      +3.82%
> > free_rcu_sheaf              43,855,689,417    53,384,314,553     9,528,625,136     +21.73%
> 
> This metric (and others with similar numbers) should not be affected by the
> change. Does it mean the benchmark has a fixed time to run, but manages to
> do more work in that time thanks to the increased throughput?

Exactly! In fact, the increase in free_rcu_sheaf matches the throughput gain
almost 1:1. A ~21% increase in throughput naturally translates to ~21% more object
allocations and frees.

> 
> > free_rcu_sheaf_fail                      0                 0                 0      +0.00%
> > free_remove_partial             55,678,459        26,685,274       -28,993,185     -52.07%
> > free_slab                       55,678,459        26,701,099       -28,977,360     -52.04%
> > free_slowpath                  107,771,739        63,197,344       -44,574,395     -41.36%
> > min_partial                              5                 5                 0      +0.00%
> > object_size                            256               256                 0      +0.00%
> > objects                             14,504            14,336              -168      -1.16%
> > objects_partial                     14,504            14,208              -296      -2.04%
> > objs_per_slab                           64                64                 0      +0.00%
> > park_slab                                -     2,147,963,530                 -      absent
> > partial                              1,398             1,367               -31      -2.22%
> > sheaf_alloc                    743,660,288     1,284,618,991       540,958,703     +72.74%
> > sheaf_capacity                          32                32                 0      +0.00%
> > sheaf_flush                 43,855,651,858    53,384,274,983     9,528,623,125     +21.73%
> > sheaf_free                     743,660,280     1,284,618,967       540,958,687     +72.74%
> > sheaf_prefill_fast          17,585,335,850    21,378,958,833     3,793,622,983     +21.57%
> > sheaf_prefill_oversize                   0                 0                 0      +0.00%
> > sheaf_prefill_slow                   2,060             2,051                -9      -0.44%
> > sheaf_refill                43,963,424,505    53,447,473,167     9,484,048,662     +21.57%
> > sheaf_return_fast           17,585,336,335    21,378,959,334     3,793,622,999     +21.57%
> > sheaf_return_slow                    1,402             1,277              -125      -8.92%
> > slabs                                1,398             1,369               -29      -2.07%
> > total_objects                       89,472            87,616            -1,856      -2.07%
> > unpark_event                             -       315,397,838                 -      absent
> > unpark_slab                              -     2,147,963,530                 -      absent
> > 
> > derived                                                  before             after      change
> > =============================================================================================
> > PARK_SLAB / FREE_ADD_PARTIAL                                  -            99.35%      absent
> > UNPARK_SLAB / UNPARK_EVENT                                    -              6.81      absent
> > PARK_SLAB - UNPARK_SLAB                                       -                 0      absent
> > page allocator churn (alloc_slab + free_slab)       111,358,105        53,403,609     -52.04%
> > 
> > Note that some metrics have very small absolute values (such as
> > alloc_fastpath, partial, slabs, and total_objects) and are subject to
> > noise. Across multiple test runs, their rate of change fluctuates
> > between positive and negative, which supports the hypothesis that this
> > is measurement noise and demonstrates that this patch has no noticeable
> > impact on these metrics.
> > 
> > For metrics with large absolute values, their trends are distinct. The
> > data indicates that the primary benefit of this approach is
> > significantly relieved pressure on the buddy system, with page allocator
> > churn reduced by 52%. Additionally, free_slowpath decreases by 41%, and
> > cmpxchg_double_fail decreases by 85%.
> > 
> > The PARK_SLAB / FREE_ADD_PARTIAL ratio reaches 99.35%, which indicates
> > that the vast majority of partial slabs are added back to the partial
> > list via the parking mechanism, reflecting that the lock stayed
> > saturated and nearly all additions avoided waiting for the lock. The
> > ratio of UNPARK_SLAB / UNPARK_EVENT shows that each unpark event
> > processes roughly 6 slabs. PARK_SLAB - UNPARK_SLAB being 0 confirms
> > that no parked slabs are left stranded.
> > 
> > I also observe increases in both sheaf_alloc and sheaf_free, which
> > could currently be attributed to faster allocation and free paths
> > resulting from the overall performance improvement. However, I'm not
> > sure about this, which is part of why this is posted as an RFC.
> > 
> > Based on slab/for-next.
> > 
> > Hao Li (2):
> >   mm/slub: make the case handling in __slab_free() easier to follow
> >   mm/slub: introduce slab parking to reduce list_lock contention
> > 
> >  mm/slub.c | 326 +++++++++++++++++++++++++++++++++++++++++++++---------
> >  1 file changed, 274 insertions(+), 52 deletions(-)
> > 
> > base-commit: e7f630142df2afccce90555e4972e60008222311
> 

-- 
Thanks,
Hao
