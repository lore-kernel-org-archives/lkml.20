Received: from mta0.migadu.com (out-115.mta0.migadu.com [91.218.175.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FE74B1CF4
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789638146; cv=none; b=fFa5QUVcYoSWVMEIf4SqoNoUQoEN5GzhVtcmWChcteq1ASAZWldD10gs5YSCibHoo+W64NyMWrR5FlhijDTWJ4zTcIRXn9obpbgFx4jUa586vY+8tA+doLYZy4SvuO9ON4B5lhtgCrYec80BGiss0ibQquYA6hWqTxZpJZbvt6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789638146; c=relaxed/simple;
	bh=YYJrWaqktW2v8Vyez8Pxr3lxoWZVgUI/CaHPFaSCn5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VPTEx4d7YAH9NkwoNIegoJKm0UNgCGy8YblrBBgNTVjBDCFkJvIO7PmWUrRTJrl0uLbRyHYbZwvhZ6N1UZ3sogqpCjC5GYSc6/sYCFWg5LxR8jZ2Q1lU2NdrDBqes/9vcqMP0LKpxqkjLp27yyUaDncsG90acC2W/U71q/MZn+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DxjqGOCd; arc=none smtp.client-ip=91.218.175.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DxjqGOCd"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=YYJrWaqktW2v8Vyez8Pxr3lxoWZVgUI/CaHPFaSCn5k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789638126; v=1; x=1790242926;
 b=DxjqGOCdPSGJ4WTAwCwIFAhrQ/Fvlj+SyfjrkBJE8e39jGoh+CkUI/pO7Qhzx1oKXD8g5yYi
 bQ7JZ8I17bmY+QMmLXV+lKZgg9E0EFekzVuGEoduK5qpWstBGubaxMfSnE+QEj0USpTKE/njJyv
 rQtPNdcCsjv3HwXen85Vdg80=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8a1219f40738e52c;
	Thu, 17 Sep 2026 09:42:05 +0000
X-Mizu-Trace-ID: 8a1219f40738e52c
X-Migadu-Flow: FLOW_OUT
Date: Thu, 17 Sep 2026 17:42:00 +0800
From: Hao Li <hao.li@linux.dev>
To: Harry Yoo <harry@kernel.org>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, 
	Pedro Falcato <pfalcato@suse.de>, akpm@linux-foundation.org, cl@gentwo.org, rientjes@google.com, 
	roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/2] mm/slub: introduce slab parking to reduce
 list_lock contention
Message-ID: <aquvTkJ1sf8sbrvQ@fedora>
References: <20260824122004.3652-1-hao.li@linux.dev>
 <20260824122513.3829-1-hao.li@linux.dev>
 <20260824122513.3829-2-hao.li@linux.dev>
 <8d73f087-42e2-454c-8e5f-93c1b64cb969@kernel.org>
 <aqPlMzUIw-4g2iOX@fedora>
 <aqqMIBejvh60JyMO@thinkstation>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqqMIBejvh60JyMO@thinkstation>

On Wed, Sep 16, 2026 at 02:50:06PM +0100, Harry Yoo wrote:
> Apologies for chiming in late, trying to catch up...

No worries at all, thanks for taking a look!

> 
> On Fri, Sep 11, 2026 at 09:06:25PM +0800, Hao Li wrote:
> > On Mon, Sep 07, 2026 at 03:38:22PM +0200, Vlastimil Babka (SUSE) wrote:
> > > On 8/24/26 14:25, Hao Li wrote:
> > Thanks for pointing this out. I looked into this bursty alloc-and-free behavior
> > a bit deeper and ran some further experiments.
> > 
> > The core question we want to answer is: why does such a massive volume of
> > object allocations and frees fall straight through to the node partial list
> > layer, rather than being caught and handled at the barn/sheaf layer? In SLUB's
> > current design, the per-CPU main/spare sheaves act as the L1 cache, the barn as
> > L2, and the node partial list as L3. For the mmap1 benchmark (which heavily
> > stresses the maple tree), the allocation path uses kmem_cache_prefill_sheaf()
> > rather than the generic allocation APIs, and the frees go through kfree_rcu().
> > 
> > Then, here is what happens during allocation: kmem_cache_prefill_sheaf()
> > normally borrows the spare sheaf directly. If the sheaf holds fewer objects
> > than requested, it refills it to capacity from the node partial list layer and
> > this completely bypasses the barn layer.
> 
> Nice observation, Hao!

Thanks, Harry!

> 
> > Once the maple tree finishes
> > allocating a batch of objects, it returns the sheaf back to pcs->spare via
> > kmem_cache_return_sheaf(). So in essence, this prefill path is just funneling
> > objects directly from the node partial list into the maple tree through the
> > spare sheaf. It skips the barn layer.
> 
> Nice observation.
> 
> > Then on the free side: these objects are freed via kfree_rcu, and then
> > rcu_free_sheaf() checks if there is still room on the barn's full list. But
> > since the allocation path never actually pulled from the barn, the full list
> > stays permanently saturated. As a result, rcu_free_sheaf() always falls back to
> > sheaf_flush_unused(), flushing objects straight into the node partial list
> > layer. It skips the barn layer too.
> 
> Nice observation.
> 
> > So looking at this behavior, the benchmark does seem to reveal a gap in this
> > allocation path, where a huge amount of traffic ends up bypassing the barn
> > layer entirely.
> 
> Indeed.
> 
> So, either refilling or flushing partial sheaves bypasses the barn layer.
> This is particularly a problem for prefilled sheaf users because they
> perform refills and flushes more frequently.

Exactly!

> 
> Partial sheaves serve alloc and free for ordinary users, but often times
> that's not the case for prefilled sheaf users.

Yes, prefill is special.

> 
> > To see if we can address this, I draft an experimental patch. It introduces a
> > new field, barn->sheaf_partial, which is a single sheaf rather than a list.
> > 
> > [The patch code is included at the end of this email.]
> > 
> > Whenever kmem_cache_prefill_sheaf() runs, it detaches pcs->spare and checks
> > whether it holds enough objects for the request.
> > 
> > If so, it returns it right away as in the original code.
> > 
> > If not, call __prefill_sheaf_pfmemalloc() and then go into
> > barn_replace_partial_sheaf() to swap the non-full spare sheaf with a full sheaf
> > from the barn. The full sheaf is handed to the caller, while the non-full sheaf
> > is temporarily stashed into barn->sheaf_partial. This largely avoids falling
> > back to the node partial list. If barn->sheaf_partial already has a sheaf, we
> > merge them together, and any resulting full or empty sheaves are placed back
> > into the barn accordingly.
> > 
> > The key idea here is simply to let __prefill_sheaf_pfmemalloc() pull a sheaf
> > from the barn's full list, which makes room on the list for future
> > rcu_free_sheaf() calls.
> 
> And the idea is to provide a place for a partial sheaf to say to avoid
> flushing and refilling it, and which helps avoiding bypassing the barn
> layer.

Yes.

> 
> The reason why we don't need a list of partial sheaves because we want
> to merge them and move the partial sheaf to full or empty list.

Right, and a single partial sheaf is lightweight and sufficient.

> 
> Makes sense to me :-)

Awesome, thanks!

> 
> > Here are the numbers with just this experimental patch applied (without the
> > parking patch):
> > 
> > baseline: 28779879
> > after experimental patch: 35550211 (+23.5%)
> > 
> > metric                              before             after             delta      change
> > =============================================================================================
> > aliases                                  0                 0                 0      +0.00%
> > align                                  256               256                 0      +0.00%
> > alloc_fastpath                      23,259            59,287            36,028    +154.90%
> > alloc_node_mismatch                      0                 0                 0      +0.00%
> > alloc_slab                      10,171,378         4,796,346        -5,375,032     -52.84%
> > alloc_slowpath                           0                 0                 0      +0.00%
> > barn_get                               441       193,807,528       193,807,087  +43947185.26%
> > barn_get_fail                            0               377               377         new
> > barn_put                               441       181,694,607       181,694,166  +41200491.16%
> > barn_put_fail                  272,868,220       156,335,632      -116,532,588     -42.71%
> > cache_dma                                0                 0                 0      +0.00%
> > cmpxchg_double_fail                744,975           357,255          -387,720     -52.04%
> > cpu_partial                              0                 0                 0      +0.00%
> > cpu_slabs                                0                 0                 0      +0.00%
> > destroy_by_rcu                           0                 0                 0      +0.00%
> > free_add_partial               337,390,126       162,178,648      -175,211,478     -51.93%
> > free_fastpath                        5,204            14,081             8,877    +170.58%
> > free_rcu_sheaf               8,731,794,372    10,816,953,777     2,085,159,405     +23.88%
> > free_rcu_sheaf_fail                      0                 0                 0      +0.00%
> > free_remove_partial             10,170,229         4,794,785        -5,375,444     -52.85%
> > free_slab                       10,170,229         4,794,785        -5,375,444     -52.85%
> > free_slowpath                   18,697,056        11,563,127        -7,133,929     -38.16%
> > hwcache_align                            0                 0                 0      +0.00%
> > min_partial                              5                 5                 0      +0.00%
> > object_size                            256               256                 0      +0.00%
> > objects                             14,774            14,596              -178      -1.20%
> > objects_partial                     14,774            14,596              -178      -1.20%
> > objs_per_slab                           64                64                 0      +0.00%
> > order                                    2                 2                 0      +0.00%
> > order_fallback                           0                 0                 0      +0.00%
> > partial                              1,913             2,544               631     +32.98%
> > poison                                   0                 0                 0      +0.00%
> > reclaim_account                          0                 0                 0      +0.00%
> > red_zone                                 0                 0                 0      +0.00%
> > remote_node_defrag_ratio               100               100                 0      +0.00%
> > sanity_checks                            0                 0                 0      +0.00%
> > sheaf_alloc                    145,870,437       151,536,660         5,666,223      +3.88%
> > sheaf_capacity                          32                32                 0      +0.00%
> > sheaf_flush                  8,731,787,311     5,002,740,743    -3,729,046,568     -42.71%
> > sheaf_free                     145,870,431       151,536,655         5,666,224      +3.88%
> > sheaf_prefill_fast           3,500,187,266     4,331,383,393       831,196,127     +23.75%
> > sheaf_prefill_oversize                   0                 0                 0      +0.00%
> > sheaf_prefill_slow                     322               646               324    +100.62%
> > sheaf_refill                 8,750,484,664     5,014,304,944    -3,736,179,720     -42.70%
> > sheaf_return_fast            3,500,187,348     4,331,383,596       831,196,248     +23.75%
> > sheaf_return_slow                      240               443               203     +84.58%
> > slab_size                              256               256                 0      +0.00%
> > slabs                                1,913             2,544               631     +32.98%
> > slabs_cpu_partial                        0                 0                 0      +0.00%
> > store_user                               0                 0                 0      +0.00%
> > total_objects                      122,432           162,816            40,384     +32.98%
> > trace                                    0                 0                 0      +0.00%
> > usersize                                 0                 0                 0      +0.00%
> > 
> > derived                                                  before             after      change
> > =============================================================================================
> > page allocator churn (alloc_slab + free_slab)        20,341,607         9,591,131     -52.85%
> > 
> > As we can see from the data, barn_get and barn_put spike significantly, which
> > shows a large part of the traffic is redirected into the barn. This eases slab
> > alloc/free churn and cuts page allocator allocations/frees by 52.85%.
> 
> Cool!
> 
> > All in all, I feel we could probably focus on evaluating and pursuing this
> > experimental patch first. For maple tree performance specifically, it seems
> > like it might be the better fit compared to the parking mechanism (which is
> > probably better suited for generic allocation pressure outside of maple tree).
> 
> Sounds good.
> 
> Keeping eyes on seeing if we do (or don't) need the parking idea after
> this.

Yeah, we can always revisit it if needed.

> 
> [ now moving on to the actual code... ]

Thanks, and formal patch will follow later.
