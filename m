Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51F243785C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081221; cv=none; b=NsBbNFNMwNghPXwFYE9Wu32g+Rk1I4I7VVeJ8kx2poqLtOD2yoeLESEikJNvFFUYHftp61bNq24R/iJ415/eD3sWUFgcpRfsvhQigJ2t66xgoo/zGorMZprd9EOiFsM8/+kASoilBVsaA0qmrcbe1isRig6mPfiVKWrKk50JU88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081221; c=relaxed/simple;
	bh=WQP5jeECsdfJbYN7aiwO89HXzHsfXrvg2kRoyi0//rI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qlseQtIaIRoD+iFueb87vwRpDWkJzVwpOFX45+eyjl1l7KOvbkfp7Hviq5cUgFg3UJ3iav3gpZdQ2txqlFGQLrooq9eGHmp0qx0j9TU5cZcS7f1Fr67BH1hM3pR9s5DqiBTfchEDtJNqZ6iMeNVxDyHCH2GAMI8jIEUPug4RZp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h1eg+t/j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h1eg+t/j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 427A51F00893;
	Tue, 22 Sep 2026 12:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790081219;
	bh=Kx1cDLNT/v31qKJcafvn3WkzdrqDUmMJSTVkfFeWiQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h1eg+t/jUhQbuzHrElz3Hf5taYbBwYU0NBlcmQx4+KVtL24Vm0a4MfbxrbPT7+XZu
	 NUzXJB4MtOPLFb0knT7Bkdynn7oV43dCho4gZ9oD7E23+Xf2Owzykm8ZNAO0sGLnnO
	 7FTqSY3HwIBougjUPxzSyzBBIyNjCi1RBcUgzY7XFQU/tkhgM/XoG/sim8vvfAn+++
	 beJtOJj2/ZtvFEVokoQ+cIIPOPIaSQ/dEXfJTrHK+5mmtRhdMb3NTf9jiVrHE/J+HH
	 W76w5Z5owffNApwmpqj/LiwAW/WR30WAic8mUFYf/rMlbOAzYKzu9ocPIcrWi+aSzs
	 y1fyDqDdi/QHQ==
Date: Tue, 22 Sep 2026 13:46:57 +0100
From: Harry Yoo <harry@kernel.org>
To: Hao Li <hao.li@linux.dev>
Cc: vbabka@kernel.org, akpm@linux-foundation.org, cl@gentwo.org, 
	rientjes@google.com, roman.gushchin@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm/slub: refill prefilled sheaves from the barn
Message-ID: <arJwnw_kxbj2RFUe@thinkstation>
References: <20260921094521.141665-1-hao.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921094521.141665-1-hao.li@linux.dev>

On Mon, Sep 21, 2026 at 05:41:13PM +0800, Hao Li wrote:
> Currently, when the prefill API refills a non-full sheaf, it takes the
> objects from partial slabs and never from the full sheaves in the barn,
> so once the barn's full list becomes saturated, it stays saturated.
> 
> For objects freed via kfree_rcu(), every RCU sheaf then has to be
> flushed to slabs because the barn's full list has no room.
> 
> To fix this, let the sheaf refill from the barn first, and introduce a
> partial sheaf in the barn, which holds the leftover objects [1].
> 
> Only the prefill path needs the partial sheaf. The generic allocation
> path (__pcs_replace_empty_main()) exchanges an empty sheaf for a full
> one from the barn, so nothing is left over. The prefill path refills a
> sheaf that is not necessarily empty, so taking objects from the barn
> usually leaves leftovers, and the partial sheaf is where they are
> kept. refill_sheaf() only takes objects from partial slabs and never
> involves the partial sheaf.
> 
> The sheaf is refilled by copying objects from the partial sheaf, and
> then from a full sheaf taken from the barn if it is still not full. A
> sheaf that objects were copied from stays in the barn as the partial
> sheaf if it still holds objects, or goes on the empty list if it is
> empty. The sheaf being refilled is never replaced.
> 
> The gain comes from two sides: every full sheaf taken out makes room on
> the barn's full list for a future RCU sheaf, and refilling from the
> barn is cheaper than refilling from partial slabs under list_lock.
> 
> Note that putting the sheaf with the leftover objects on the full list
> instead would not work: it would occupy room on the full list, so the
> list would stay saturated and rcu_free_sheaf() would still keep
> flushing.
> 
> An earlier version of this patch swapped sheaves instead, to minimize
> the memcpy overhead. As Harry Yoo pointed out [2], replacing the
> caller's sheaf loses cache affinity, filling it directly is more
> straightforward, and testing showed no measurable difference between
> the two approaches, so the approach he suggested is used.
> 
> Tested with will-it-scale mmap1 (192 processes, one-minute runs) on the
> maple_node cache.
> 
> throughput: 27778727 -> 34500556 (+24.2%)
> 
> metric                       baseline           patched        change
> =====================================================================
> alloc_fastpath                 54,124            56,696        +4.75%
> alloc_slab                  7,100,651           159,739       -97.75%
> barn_get                          849       194,460,392    +22904539.81%
> barn_get_fail                       2               217    +10750.00%
> barn_put                          851       182,306,701    +21422544.07%
> barn_put_fail             260,400,484       145,522,675       -44.12%
> cmpxchg_double_fail         1,029,204           334,228       -67.53%
> free_add_partial          326,694,687       181,935,790       -44.31%
> free_fastpath                  13,297            15,611       +17.40%
> free_rcu_sheaf          8,332,839,104    10,490,535,227       +25.89%
> free_remove_partial         7,099,788           158,297       -97.77%
> free_slab                   7,099,788           158,297       -97.77%
> free_slowpath              10,969,156           782,851       -92.86%
> objects                        15,295            14,849        -2.92%
> objects_partial                15,295            14,849        -2.92%
> partial                         1,604             2,336       +45.64%
> sheaf_alloc               137,757,895       141,208,076        +2.50%
> sheaf_flush             8,332,823,922     4,656,725,764       -44.12%
> sheaf_free                137,757,883       141,208,072        +2.50%
> sheaf_prefill_fast      3,337,502,163     4,196,506,116       +25.74%
> sheaf_prefill_slow                685               400       -41.61%
> sheaf_refill            8,343,794,364     4,657,509,724       -44.18%
> sheaf_return_fast       3,337,502,411     4,196,506,382       +25.74%
> sheaf_return_slow                 437               134       -69.34%
> slabs                           1,604             2,336       +45.64%
> total_objects                 102,656           149,504       +45.64%
> 
> Here is what the important metric changes mean.
> 
> barn_get and barn_put: refills now take full sheaves out of the barn,
> and RCU sheaves are put into the barn again. Before, the barn's full
> list was saturated once and hardly ever consumed.
> 
> barn_put_fail: more than half of the RCU sheaves are now put into the
> barn instead of being flushed. The rest are still flushed because they
> arrive while the barn's full list is at its limit.
> 
> sheaf_refill and free_add_partial: fewer objects are taken from partial
> slabs to refill sheaves, and fewer slabs are added to the partial list,
> by the same percentage.
> 
> alloc_slab and free_slab: the partial list is almost never empty when a
> refill looks at it, so slabs are almost never allocated and freed again
> only to serve refills.
> 
> After the test, the maple_node cache holds 1604 slabs without the patch
> and 2336 with it. After a manual shrink
> (echo 1 > /sys/kernel/slab/maple_node/shrink), it holds 485 without
> the patch and 563 with it. So most of the extra slabs are held only by
> objects sitting in sheaves and are returned by a shrink, and what
> remains is a small difference, because objects handed out from the barn
> come from many more slabs than a refill from partial slabs would use.
> 
> Link: https://lore.kernel.org/linux-mm/aqPlMzUIw-4g2iOX@fedora/ [1]
> Link: https://lore.kernel.org/linux-mm/aq0ylDidEHa2kg4X@thinkstation/ [2]
> Signed-off-by: Hao Li <hao.li@linux.dev>
> ---

Looks good to me,
Reviewed-by: Harry Yoo (Meta) <harry@kernel.org>

-- 
Cheers,
Harry / Hyeonggon
