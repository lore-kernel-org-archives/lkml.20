Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329B05372D1
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790078222; cv=none; b=GUdk9aWo1ew9ejYWDWx1/2AUBVn1k6jCkyM4bPYjZSGMCL7QOU7pIphMtDJ2kR+XBjef1+6VRzn8gnHMxW/Dkp8gRIJP+8lSqQc1knNL7oqyP/hy9Z9bB9/Ir3Qqg5E+rYW4eAtyq2z/ZACcKFYOWW0Y+R2uKPSicedzpz4Wg+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790078222; c=relaxed/simple;
	bh=lyau2TKjx1fqbQQm8wUSxyNlnq6o502SdazTlNW6nRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RJoSISFjXsu2J1rYp2rZUs4QVPYTUrc397fVZc7pa6F3W0GBVKy8Mxoyu1gYZ4MOvNfNQoK3aPm/v4zuzEv1dqrek73xfNCOv5Iwgctj33lY5kbDWbGD+CXtyf9XsdWzz9GfVACrqOiNDs+dbkf53yAtdPPmQCZy+QwfaKVZICc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZlBUS/Fp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZlBUS/Fp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C659E1F000FF;
	Tue, 22 Sep 2026 11:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790078220;
	bh=yNKXfdAKSjFce+BCn8ttT2uNIN9sCdccO8/ZPfMXC70=;
	h=From:Date:Subject:To:Cc;
	b=ZlBUS/FpVAPPzwkNtXxeEAZ66DF/8Oq5Ra+c9VNoE2ZVXigi1h3C0UGVKMT70KRJ2
	 EkQX15HYYnG19Kv2Z/vgc3H0yhDBQ+4ufZoQ5kvyUNzGbpUOSkwHdV5uPIHrw8+aKy
	 Oplxi0XhRkV6CQooXy2ZaNyQsBThEIusEge+XULX4va9luaf/Fv2ezSnP64Fl6/Ec9
	 +YhaPqHRp6mGKaReDzAIwRa59R3oT/7WYvrUqomA11AtQeVGGGi4vhxGzdMaoHTDmC
	 mRG0gxZzvgZ23KzA+/sfpx54nMaVV/qP489vRqWoR9+1FFMleGFz9c5r6UpnOmtl9h
	 +jTeg+3lb/YqA==
From: "Harry Yoo (Meta)" <harry@kernel.org>
Date: Tue, 22 Sep 2026 12:56:43 +0100
Subject: [PATCH slab/for-next-fixes] mm/slab: do not wake up kswapd in
 __kfree_rcu_sheaf()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-kfree-rcu-dont-wakeup-kswapd-v1-1-42d7e2636f9e@kernel.org>
X-B4-Tracking: v=1; b=H4sIAPpssmoC/yWNQQ7CIBBFr9LM2oktpiZ6FeOCwqCIATIDtknTu
 4t2+V5+3l9BiD0JXLsVmD5efIoNhkMH5qnjg9DbxqB6de4vSmFwTIRsKtoUC846UM0YZNbZoh5
 PZhicIadGaInM5Pzyz99A3no6usQYaSm4+/s+kjq9yJTfEWzbF8y6wiiVAAAA
X-Change-ID: 20260922-kfree-rcu-dont-wakeup-kswapd-a53c11fcef25
To: Vlastimil Babka <vbabka@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>, 
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, 
 Suren Baghdasaryan <surenb@google.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>, "Harry Yoo (Meta)" <harry@kernel.org>
X-Mailer: b4 0.16.0

Since kfree_rcu() can be called under pi_lock (a raw spinlock in the
scheduler), kfree_rcu() itself should never allocate memory with
__GFP_KSWAPD_RECLAIM as waking up kswapd ends up acquiring pi_lock,
which leads to a deadlock.

Reproducing the issue even intentionally was not straightforward.
The set_cpus_allowed_force() path that is called under pi_lock is
exercised very rarely, and competing tasks that allocate memory will
most likely wake kswapd up.

Therefore the existence of the deadlock was verified with a modified
kernel that has a lockdep map for waking up kswapd:

  ======================================================
  WARNING: possible circular locking dependency detected
  7.2.0-rc1-slab-for-next+ #10 Not tainted
  ------------------------------------------------------
  git/6660 is trying to acquire lock:
  ffff8e524533c550 (&p->pi_lock){-.-.}-{2:2}, at: _raw_spin_lock_irqsave+0x12/0x20

  but task is already holding lock:
  ffff8e57bffff1a0 (&pgdat->kswapd_wait){....}-{3:3}, at: _raw_spin_lock_irqsave+0x12/0x20

  which lock already depends on the new lock.

  the existing dependency chain (in reverse order) is:

  -> #2 (&pgdat->kswapd_wait){....}-{3:3}:
         __lock_acquire+0x5a4/0xc50
         lock_acquire.part.0+0xb7/0x240
         lock_acquire+0x70/0x170
         __raw_spin_lock_irqsave+0x44/0x80
         _raw_spin_lock_irqsave+0x12/0x20
         __wake_up_common_lock+0x31/0xa0
         __wake_up+0x20/0x40
         kswapd_wakeup_wake+0x7e/0x110
         wakeup_kswapd+0x295/0x320
         wake_all_kswapds+0xac/0x1a0
         __alloc_pages_slowpath.constprop.0+0x282/0xf80
         __alloc_frozen_pages_noprof+0x32a/0x360
         alloc_slab_page+0x2e/0x160
         allocate_slab+0x82/0x420
         new_slab+0x52/0xb0
         refill_objects+0x13d/0x190
         refill_sheaf+0x5d/0xd0
         __pcs_replace_empty_main+0x230/0xb10
         [...]

  -> #1 (kswapd_wakeup){-.-.}-{0:0}:
         __lock_acquire+0x5a4/0xc50
         lock_sync.part.0+0x75/0x100
         lock_sync+0x36/0x70
         might_wakeup_kswapd+0x61/0xa0
         __kfree_rcu_sheaf+0x33/0xd90
         kvfree_call_rcu+0x1d4/0x3b0
         set_cpus_allowed_force+0x163/0x220
         cpuset_cpus_allowed_fallback+0x18b/0x240
         select_fallback_rq+0x1e6/0x250
	 [...]

  -> #0 (&p->pi_lock){-.-.}-{2:2}:
         check_prev_add+0xe6/0xe00
         validate_chain+0x51e/0x6e0
         __lock_acquire+0x5a4/0xc50
         lock_acquire.part.0+0xb7/0x240
         lock_acquire+0x70/0x170
         __raw_spin_lock_irqsave+0x44/0x80
         _raw_spin_lock_irqsave+0x12/0x20
         try_to_wake_up+0x77/0xa90
         default_wake_function+0x27/0x60
         autoremove_wake_function+0x23/0xb0
         __wake_up_common+0xb8/0x170
         __wake_up_common_lock+0x51/0xa0
         __wake_up+0x20/0x40
         kswapd_wakeup_wake+0x7e/0x110
         wakeup_kswapd+0x295/0x320
         wake_all_kswapds+0xac/0x1a0
         __alloc_pages_slowpath.constprop.0+0x282/0xf80
         __alloc_frozen_pages_noprof+0x32a/0x360
         alloc_slab_page+0x2e/0x160
         allocate_slab+0x82/0x420
         new_slab+0x52/0xb0
         refill_objects+0x13d/0x190
         refill_sheaf+0x5d/0xd0
         __pcs_replace_empty_main+0x230/0xb10
         [...]

  other info that might help us debug this:

  Chain exists of:
    &p->pi_lock --> kswapd_wakeup --> &pgdat->kswapd_wait

   Possible unsafe locking scenario:

         CPU0                    CPU1
         ----                    ----
    lock(&pgdat->kswapd_wait);
                                 lock(kswapd_wakeup);
                                 lock(&pgdat->kswapd_wait);
    lock(&p->pi_lock);

   *** DEADLOCK ***

  3 locks held by git/6660:
   #0: ffff8e519f0e9e20 (&type->i_mutex_dir_key#6){++++}-{4:4}, at: lookup_slow+0x2d/0x60
   #1: ffffffff8a31c460 (kswapd_wakeup){-.-.}-{0:0}, at: kswapd_wakeup_wake+0x4d/0x110
   #2: ffff8e57bffff1a0 (&pgdat->kswapd_wait){....}-{3:3}, at: _raw_spin_lock_irqsave+0x12/0x20

  [...]

Fix this by always avoiding waking up kswapd in __kfree_rcu_sheaf().
Note that there are two paths that might wake up kswapd:

  1) __kfree_rcu_sheaf()
     // __GFP_KSWAPD_RECLAIM might wake up kswapd
     -> alloc_empty_sheaf(GFP_NOWAIT)

  2) __kfree_rcu_sheaf()
     // Let's say __kfree_rcu_sheaf() doesn't pass GFP_NOWAIT
     -> alloc_empty_sheaf(__GFP_NOWARN)
     -> kmalloc_flags()
     -> slab_alloc_node()
     -> alloc_from_pcs()
     -> __pcs_replace_empty_main()
     // Free a sheaf in an allocation path when the sheaf becomes empty
     // and refilling the sheaf fails
     -> free_empty_sheaf()
     -> slab_free()
     -> free_to_pcs()
     -> __pcs_replace_full_main()
     // However free path always assumes it's safe to wake up kswapd
     -> alloc_empty_sheaf(GFP_NOWAIT)

Drop __GFP_KSWAPD_RECLAIM in both cases. Note that the kfree_rcu() is
not the only user of free_to_pcs() path, but it should be fixed as it
can be invoked under pi_lock.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260831-b4-kfree_rcu_hotfix-v1-1-4f0fb882638b%40kernel.org
Fixes: ec66e0d59952 ("slab: add sheaf support for batching kfree_rcu() operations")
Link: https://lore.kernel.org/linux-mm/20260831143500.x-saxdAs@linutronix.de
Assisted-by: LLM
Signed-off-by: Harry Yoo (Meta) <harry@kernel.org>
---
The discovery and verification (w/ a modified kernel) of the bug was
assisted by LLMs.

More speicifically, the first path was pointed out by Sashiko, and
the second path was discovered by LLM while reviewing the commit with
review-prompts [1].

Harry Yoo reviewed those findings and manually crafted the patch based
on that.

[1] https://github.com/masoncl/review-prompts

I believe the right direction to address this issue is to make
kfree_nolock() work in any context and replace it with kfree_rcu()
in the scheduler. However for now it won't work under pi_lock,
and resolving that would be a longer journey.

Address this issue by dropping __GFP_KSWAPD_RECLAIM, for now.
---
 mm/slub.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index 54ec12503357..544cff39762c 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -5969,7 +5969,8 @@ __pcs_replace_full_main(struct kmem_cache *s, struct slub_percpu_sheaves *pcs,
 	if (!allow_spin)
 		return NULL;
 
-	empty = alloc_empty_sheaf(s, GFP_NOWAIT, SLAB_ALLOC_DEFAULT);
+	/* Don't wake up kswapd, it will cause deadlock under pi_lock */
+	empty = alloc_empty_sheaf(s, __GFP_NOWARN, SLAB_ALLOC_DEFAULT);
 	if (empty)
 		goto got_empty;
 
@@ -6128,7 +6129,6 @@ bool __kfree_rcu_sheaf(struct kmem_cache *s, void *obj, unsigned int free_flags)
 		struct slab_sheaf *empty;
 		struct node_barn *barn;
 		unsigned int alloc_flags = to_alloc_flags(free_flags);
-		gfp_t gfp = allow_spin ? GFP_NOWAIT : __GFP_NOWARN;
 
 		/* Bootstrap or debug cache, fall back */
 		if (unlikely(!cache_has_sheaves(s))) {
@@ -6157,7 +6157,8 @@ bool __kfree_rcu_sheaf(struct kmem_cache *s, void *obj, unsigned int free_flags)
 
 		local_unlock(&s->cpu_sheaves->lock);
 
-		empty = alloc_empty_sheaf(s, gfp, alloc_flags);
+		/* Don't wake up kswapd, it will cause deadlock under pi_lock */
+		empty = alloc_empty_sheaf(s, __GFP_NOWARN, alloc_flags);
 
 		if (!empty)
 			goto fail;

---
base-commit: 4ebdb8a6231bde47d21597d5d0a193dcf85164ac
change-id: 20260922-kfree-rcu-dont-wakeup-kswapd-a53c11fcef25

Best regards,
--  
Cheers,
Harry / Hyeonggon

