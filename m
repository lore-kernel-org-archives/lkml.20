Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351B941A922
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790239387; cv=none; b=P3SDAudhhapTImjILaFc4aTNJ2YW7BnsFa+JSMRi90WLfqn44/QUYMY/21icGZTb1/weLouT8nYOkZ1VbAM9/Ahx8A+9XDwOW7yxWSzHWrOsVFr++Dy+Nj84nWRVmHs1J+MC2p4wVgRJF2yreqVjcbY57DEfu/IIaQSTj5XOGbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790239387; c=relaxed/simple;
	bh=ZINkkNePVxUp6INZkL+zer/N7dmLdERgy908FeEeoYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nc+mdUFCrlNsSeq4G/oFweR+E4VHxcFUpR0mcmMLHwVLDjtLA49cCDMTfS7ZluOejLGucqY/kB/YBQsjZrvpY28DevbY0t3JCS8vtSy3nutmFEnbDTVuqxCn/vfPI16wkPEHoodZgpecM319rM/7PeRzhhsBaNebNIu4/AMmVmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=et66aYIj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="et66aYIj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 782631F000FF;
	Thu, 24 Sep 2026 08:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790239385;
	bh=g7iC97x1YvbQ99sPJwCHtHrdFUQ+WqcOk7dlB2a6APM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=et66aYIjsXlKFfY4otqG0Ubk6zuyNmNGJEHhsU+Uafi+5EVrOk7+upf5NGRy82nn7
	 QSjbbFc4o4kYPTctk38b4BCKY2XVADoxNOadbrrN8WNtlvJASc3yzdB3g1DmNMD8Tx
	 SMzasYeE4lf0bJIqsJkQqv6GOpoh8G6tZzA16MzLa0TGVgRIhswDQMZC7W1LDSyQbm
	 VVK/4HF/57WmeYQsprpGjJfIer+nOPRvzLcFDi8hHdW58Qi7iw/s52axzq0spH3CyS
	 0cctl2hGXuv4wBCN73LwR3YfOSVMCoyU2ffExG8czPqyOZ1+P45DeMgfmqsUIoYEZJ
	 9AKMUEuHOwfTQ==
Message-ID: <2db41ce0-a510-4050-a79c-ff1f16640b47@kernel.org>
Date: Thu, 24 Sep 2026 10:43:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH slab/for-next-fixes] mm/slab: do not wake up kswapd in
 __kfree_rcu_sheaf()
Content-Language: en-US
To: "Harry Yoo (Meta)" <harry@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>,
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Suren Baghdasaryan <surenb@google.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Sashiko <sashiko-bot@kernel.org>
References: <20260922-kfree-rcu-dont-wakeup-kswapd-v1-1-42d7e2636f9e@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <20260922-kfree-rcu-dont-wakeup-kswapd-v1-1-42d7e2636f9e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/22/26 13:56, Harry Yoo (Meta) wrote:
> Since kfree_rcu() can be called under pi_lock (a raw spinlock in the
> scheduler), kfree_rcu() itself should never allocate memory with
> __GFP_KSWAPD_RECLAIM as waking up kswapd ends up acquiring pi_lock,
> which leads to a deadlock.
> 
> Reproducing the issue even intentionally was not straightforward.
> The set_cpus_allowed_force() path that is called under pi_lock is
> exercised very rarely, and competing tasks that allocate memory will
> most likely wake kswapd up.
> 
> Therefore the existence of the deadlock was verified with a modified
> kernel that has a lockdep map for waking up kswapd:
> 
>   ======================================================
>   WARNING: possible circular locking dependency detected
>   7.2.0-rc1-slab-for-next+ #10 Not tainted
>   ------------------------------------------------------
>   git/6660 is trying to acquire lock:
>   ffff8e524533c550 (&p->pi_lock){-.-.}-{2:2}, at: _raw_spin_lock_irqsave+0x12/0x20
> 
>   but task is already holding lock:
>   ffff8e57bffff1a0 (&pgdat->kswapd_wait){....}-{3:3}, at: _raw_spin_lock_irqsave+0x12/0x20
> 
>   which lock already depends on the new lock.
> 
>   the existing dependency chain (in reverse order) is:
> 
>   -> #2 (&pgdat->kswapd_wait){....}-{3:3}:
>          __lock_acquire+0x5a4/0xc50
>          lock_acquire.part.0+0xb7/0x240
>          lock_acquire+0x70/0x170
>          __raw_spin_lock_irqsave+0x44/0x80
>          _raw_spin_lock_irqsave+0x12/0x20
>          __wake_up_common_lock+0x31/0xa0
>          __wake_up+0x20/0x40
>          kswapd_wakeup_wake+0x7e/0x110
>          wakeup_kswapd+0x295/0x320
>          wake_all_kswapds+0xac/0x1a0
>          __alloc_pages_slowpath.constprop.0+0x282/0xf80
>          __alloc_frozen_pages_noprof+0x32a/0x360
>          alloc_slab_page+0x2e/0x160
>          allocate_slab+0x82/0x420
>          new_slab+0x52/0xb0
>          refill_objects+0x13d/0x190
>          refill_sheaf+0x5d/0xd0
>          __pcs_replace_empty_main+0x230/0xb10
>          [...]
> 
>   -> #1 (kswapd_wakeup){-.-.}-{0:0}:
>          __lock_acquire+0x5a4/0xc50
>          lock_sync.part.0+0x75/0x100
>          lock_sync+0x36/0x70
>          might_wakeup_kswapd+0x61/0xa0
>          __kfree_rcu_sheaf+0x33/0xd90
>          kvfree_call_rcu+0x1d4/0x3b0
>          set_cpus_allowed_force+0x163/0x220
>          cpuset_cpus_allowed_fallback+0x18b/0x240
>          select_fallback_rq+0x1e6/0x250
> 	 [...]
> 
>   -> #0 (&p->pi_lock){-.-.}-{2:2}:
>          check_prev_add+0xe6/0xe00
>          validate_chain+0x51e/0x6e0
>          __lock_acquire+0x5a4/0xc50
>          lock_acquire.part.0+0xb7/0x240
>          lock_acquire+0x70/0x170
>          __raw_spin_lock_irqsave+0x44/0x80
>          _raw_spin_lock_irqsave+0x12/0x20
>          try_to_wake_up+0x77/0xa90
>          default_wake_function+0x27/0x60
>          autoremove_wake_function+0x23/0xb0
>          __wake_up_common+0xb8/0x170
>          __wake_up_common_lock+0x51/0xa0
>          __wake_up+0x20/0x40
>          kswapd_wakeup_wake+0x7e/0x110
>          wakeup_kswapd+0x295/0x320
>          wake_all_kswapds+0xac/0x1a0
>          __alloc_pages_slowpath.constprop.0+0x282/0xf80
>          __alloc_frozen_pages_noprof+0x32a/0x360
>          alloc_slab_page+0x2e/0x160
>          allocate_slab+0x82/0x420
>          new_slab+0x52/0xb0
>          refill_objects+0x13d/0x190
>          refill_sheaf+0x5d/0xd0
>          __pcs_replace_empty_main+0x230/0xb10
>          [...]
> 
>   other info that might help us debug this:
> 
>   Chain exists of:
>     &p->pi_lock --> kswapd_wakeup --> &pgdat->kswapd_wait
> 
>    Possible unsafe locking scenario:
> 
>          CPU0                    CPU1
>          ----                    ----
>     lock(&pgdat->kswapd_wait);
>                                  lock(kswapd_wakeup);
>                                  lock(&pgdat->kswapd_wait);
>     lock(&p->pi_lock);
> 
>    *** DEADLOCK ***
> 
>   3 locks held by git/6660:
>    #0: ffff8e519f0e9e20 (&type->i_mutex_dir_key#6){++++}-{4:4}, at: lookup_slow+0x2d/0x60
>    #1: ffffffff8a31c460 (kswapd_wakeup){-.-.}-{0:0}, at: kswapd_wakeup_wake+0x4d/0x110
>    #2: ffff8e57bffff1a0 (&pgdat->kswapd_wait){....}-{3:3}, at: _raw_spin_lock_irqsave+0x12/0x20
> 
>   [...]
> 
> Fix this by always avoiding waking up kswapd in __kfree_rcu_sheaf().
> Note that there are two paths that might wake up kswapd:
> 
>   1) __kfree_rcu_sheaf()
>      // __GFP_KSWAPD_RECLAIM might wake up kswapd
>      -> alloc_empty_sheaf(GFP_NOWAIT)
> 
>   2) __kfree_rcu_sheaf()
>      // Let's say __kfree_rcu_sheaf() doesn't pass GFP_NOWAIT
>      -> alloc_empty_sheaf(__GFP_NOWARN)
>      -> kmalloc_flags()
>      -> slab_alloc_node()
>      -> alloc_from_pcs()
>      -> __pcs_replace_empty_main()
>      // Free a sheaf in an allocation path when the sheaf becomes empty
>      // and refilling the sheaf fails

So that's this

                /*
                 * we must be very low on memory so don't bother
                 * with the barn
                 */
                sheaf_flush_unused(s, empty);
                free_empty_sheaf(s, empty);

Now I wonder if we should just use the barn then, lol. We either took the
empty sheaf from there, or there was none, so we don't risk overfilling it
with free sheaves.

Well but I guess sheaf_flush_unused() could end up in freeing paths anyway.
But that's a bulk free which doesn't involve sheaves at least.
We could also distinguish which callers of refill_sheaf() can continue with
a partially refilled sheaf. This one likely can so we'd not have to be
flushing, ever?

>      -> free_empty_sheaf()
>      -> slab_free()
>      -> free_to_pcs()
>      -> __pcs_replace_full_main()
>      // However free path always assumes it's safe to wake up kswapd
>      -> alloc_empty_sheaf(GFP_NOWAIT)

Would be great to avoid all this from kfree_rcu().

> Drop __GFP_KSWAPD_RECLAIM in both cases. Note that the kfree_rcu() is
> not the only user of free_to_pcs() path, but it should be fixed as it
> can be invoked under pi_lock.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/message/20260831-b4-kfree_rcu_hotfix-v1-1-4f0fb882638b%40kernel.org
> Fixes: ec66e0d59952 ("slab: add sheaf support for batching kfree_rcu() operations")
> Link: https://lore.kernel.org/linux-mm/20260831143500.x-saxdAs@linutronix.de

Fixed up per your reply.

> Assisted-by: LLM

Changed to (per below)

Assisted-by: LLM # dicovery and verification

> Signed-off-by: Harry Yoo (Meta) <harry@kernel.org>
> ---
> The discovery and verification (w/ a modified kernel) of the bug was
> assisted by LLMs.
> 
> More speicifically, the first path was pointed out by Sashiko, and
> the second path was discovered by LLM while reviewing the commit with
> review-prompts [1].
> 
> Harry Yoo reviewed those findings and manually crafted the patch based
> on that.
> 
> [1] https://github.com/masoncl/review-prompts
> 
> I believe the right direction to address this issue is to make
> kfree_nolock() work in any context and replace it with kfree_rcu()
> in the scheduler. However for now it won't work under pi_lock,
> and resolving that would be a longer journey.

Indeed.

> Address this issue by dropping __GFP_KSWAPD_RECLAIM, for now.

Applied to mm/slab.git slab/for-next-fixes, thanks!

But still could discuss a better solution per above.

> ---
>  mm/slub.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/slub.c b/mm/slub.c
> index 54ec12503357..544cff39762c 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -5969,7 +5969,8 @@ __pcs_replace_full_main(struct kmem_cache *s, struct slub_percpu_sheaves *pcs,
>  	if (!allow_spin)
>  		return NULL;
>  
> -	empty = alloc_empty_sheaf(s, GFP_NOWAIT, SLAB_ALLOC_DEFAULT);
> +	/* Don't wake up kswapd, it will cause deadlock under pi_lock */
> +	empty = alloc_empty_sheaf(s, __GFP_NOWARN, SLAB_ALLOC_DEFAULT);
>  	if (empty)
>  		goto got_empty;
>  
> @@ -6128,7 +6129,6 @@ bool __kfree_rcu_sheaf(struct kmem_cache *s, void *obj, unsigned int free_flags)
>  		struct slab_sheaf *empty;
>  		struct node_barn *barn;
>  		unsigned int alloc_flags = to_alloc_flags(free_flags);
> -		gfp_t gfp = allow_spin ? GFP_NOWAIT : __GFP_NOWARN;
>  
>  		/* Bootstrap or debug cache, fall back */
>  		if (unlikely(!cache_has_sheaves(s))) {
> @@ -6157,7 +6157,8 @@ bool __kfree_rcu_sheaf(struct kmem_cache *s, void *obj, unsigned int free_flags)
>  
>  		local_unlock(&s->cpu_sheaves->lock);
>  
> -		empty = alloc_empty_sheaf(s, gfp, alloc_flags);
> +		/* Don't wake up kswapd, it will cause deadlock under pi_lock */
> +		empty = alloc_empty_sheaf(s, __GFP_NOWARN, alloc_flags);
>  
>  		if (!empty)
>  			goto fail;
> 
> ---
> base-commit: 4ebdb8a6231bde47d21597d5d0a193dcf85164ac
> change-id: 20260922-kfree-rcu-dont-wakeup-kswapd-a53c11fcef25
> 
> Best regards,
> --  
> Cheers,
> Harry / Hyeonggon
> 

