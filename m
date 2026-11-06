Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793987416;
	b=fXDQVlmwRZu4n3DCEzKibcHYLwvRqJNxhNuPdzwFXI60ly4rhdhZ09WujZIdMiIIfCdm
	 0VVjfTiquQlb9+KECio1OrhfgKwMZYvlX8ZgOKm9ONqPxFKmjrtLKkxdPMp74glbNQ5dR
	 2mGnmlKyubIHf+o1jIQvp3mllGlEgRTdHRBErqZfUlDXNPGA1+PXtSmjAijrycDYiZigF
	 bm9iYNSKF0r8XjTPzxsLSH7ON4pdhyfO/NfS3I2GW90+QR/BKFxDdSNE0uHavlUXrhuDc
	 X9HNIhf6u5RxQHC5P3XG4J3qxfeA8qRzcCcFT1Nv6ms9FG0lbVhRaq6tXxodTnywadA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987416;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=BnnkrLBDIOF3ryis613NWNf1pYsRv2SOtis6XbCWIQU=;
	b=FkunaE0ZiqZDOPy0WbiiwFQkfx/IDu/WpcZS97YyIR+8a6uke2B4F2g7Vd6IoFhOrXEQ
	 SF8CAc7WkdWdf9C7EIM6zVjxO3WvmSWorrl93/rLNnG8PKrnuukSQMKzJaLdY/en0K4cD
	 iKJ2o2Ttqf1cR33lvUjky7F+8GkcUYW8KEvxCB32fnB8YwbwEdF5LyO3/ZtVnzyHtcfzX
	 Pz56SAFJ68KNKUmChwImTn7hauDSi/hxyxowZZzMQzEYDAhPvewII14XrrsD1zgKIqygu
	 RXBVsd8ndpp1KKDHLMVXBK2w7MSnfFLFrtzwM+2xR8N6D5zxAlTblnxHieoIhc9TREw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZonrmaN+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC07A606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZonrmaN+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20C971F008A7;
	Fri,  6 Nov 2026 17:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793987415;
	bh=BnnkrLBDIOF3ryis613NWNf1pYsRv2SOtis6XbCWIQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZonrmaN+/FMDB1mJ0VM9VxShp8vWLeWgjOb8D1wbDx7UsgsxSm8LPV3VFU35EkNGm
	 a0rFU1BCza+W6Kbu86HFV3DXQ2tekxZc5tjAJRMud2L9DLKciKjmi2ClSXHXbLNoH3
	 HJEARahBmj5UIi7Kx9w0etD5p1u2BCi5nzH/pmkQQBrOgf7hH7ZxxjZBbjcMb55ua8
	 F2AxgAWWwYPouLSVW89+eKFT4Y7+otdcEEmOuIZYv5WtYpwxROVK+6s1l7rSVL2tFf
	 /pQwN2c3JNNCCAeN3gXsGLk4ggkpJfmKKPssx7GWWhZ63ntUx5eX2xVzLiWgPcAOqp
	 Djoq5jQn/e3lw==
Date: Fri, 6 Nov 2026 17:50:07 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, 
	Gregory Price <gourry@gourry.net>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, Kairui Song <kasong@tencent.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH 2/2] mm/page_alloc: only skip kswapd nodes below their
 kswapd watermark
Message-ID: <au4SKZKfJoE0ZgAw@gremlin>
References: <20261106172620.318113-1-joshua.hahnjy@gmail.com>
 <20261106172620.318113-2-joshua.hahnjy@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106172620.318113-2-joshua.hahnjy@gmail.com>

On Fri, Nov 06, 2026 at 09:26:19AM -0800, Joshua Hahn wrote:
> Commit 19c5fb83f2a4 ("mm: page_alloc: avoid kswapd thrashing due to
> NUMA restrictions") makes get_page_from_freelist() skip any node whose
> kswapd is active to avoid piling on an already-pressured node that is
> constantly churning to make free space that is immediately consumed.
>
> But kswapd can also be woken up for order 9 requests with THP defrag
> set to defer. This means that a fragmented node with plenty of free
> memory will have a kswapd thread continuously spinning and preventing
> order 0 pages from allocating on the node. This causes the opposite
> problem of piling on pressure on all other nodes.
>
> This behavior was observed on some Meta production workloads running on
> 2-NUMA systems, where processes with a preference for node0 allocations
> continuously allocated order 0 pages on node1, despite node0 having
> hundreds of GB of free memory.
>
> To prevent piling pressure on any one node, only skip a node during
> page allocation if the zone also fails the watermark kswapd is
> reclaiming it up to. This is the high watermark, or the promo watermark
> if NUMA balancing memory tiering is enabled. Make sure to mask the
> reserve flags so that __GFP_HIGH / atomic requests in the slowpath
> do not get a relaxed version of the check.
>
> This preserves the existing fix to prevent piling memory on the local
> node, while also preventing memory pileups on non-local nodes when
> the local node has memory.
>
> On a 2-NUMA VM with a 60G node0 and a 20G node1, with THP enabled=always
> and defrag=defer, I ran a process that prefers allocating on node0.
> With a fragmented node0:
> - Before the patch, 66% of faults were served from node0
> - After the patch, 100% of faults were served from node0
>
> Suggested-by: Daniel Hodges <hodgesd@meta.com>
> Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
> ---
>  mm/page_alloc.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 5423ff4805f84..8e8a2c8d6e6a4 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -3882,14 +3882,18 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
>  		}
>
>  		/*
> -		 * If kswapd is already active on a node, keep looking
> -		 * for other nodes that might be idle. This can happen
> -		 * if another process has NUMA bindings and is causing
> -		 * kswapd wakeups on only some nodes. Avoid accidental
> -		 * "node_reclaim_mode"-like behavior in this case.
> +		 * If kswapd is already active on a node and the zone is below
> +		 * its kswapd watermark for this request, keep looking for other
> +		 * nodes that might be idle. This can happen if another process
> +		 * has NUMA bindings and is causing kswapd wakeups on only some
> +		 * nodes. Avoid accidental "node_reclaim_mode" behavior.
>  		 */
>  		if (skip_kswapd_nodes &&
> -		    !waitqueue_active(&zone->zone_pgdat->kswapd_wait)) {
> +		    !waitqueue_active(&zone->zone_pgdat->kswapd_wait) &&
> +		    !zone_watermark_fast(zone, order, kswapd_wmark_pages(zone),
> +					 ac->highest_zoneidx,
> +					 alloc_flags & ~ALLOC_RESERVES,
> +					 gfp_mask)) {

I know this code is hardly the cleanest, but you're now adding a 3rd condition
to a branch that was already complicated enough to have a massive comment and
duplicating a block of code that already dupliclated twice here.

You're also then going against the convention of

	mark = ...
	if (... !zone_watermark_fast(zone, order, mark,
					 ac->highest_zoneidx, alloc_flags,
					 gfp_mask)) {

(Obviously yours varies on alloc_flags too)

And also inlining the mark value.

Could you clean this up a little given this isn't a fix?

In general extending functionality should pay down some technical debt if
possible, it's ok to add a preceding patch in the series to do something like
that.

>  			skipped_kswapd_nodes = true;
>  			continue;
>  		}
> --
> 2.53.0-Meta
>

--
Cheers, Lorenzo
