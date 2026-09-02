Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBD14AFE06
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788367332; cv=none; b=BkRNeqgz2KQKof3tbeCtN9nN5rQx3RvO1GvSh+uCOhyaJSSDCYag+72z9g5fxcbTUaf8ughvYjcueV3EnJCO/xqJ6gEbkmk8FiSUAYAi5XUs0RFAdGT5wMnaZ6XRdi8kY/OnHp5oLO/FfO8Z8BNol8Dws+a7/iYbKmZiXwLTL4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788367332; c=relaxed/simple;
	bh=Jo1elrFbMDdqBgOXmM2ZQ9Tr44znn4OzuQHjhFi1vQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dDarZiMSGsEVM93lOPLGS9iVE0WoxP8K0+2lB1Nu+E2AQGQcSZywkcE72acD/OlEnHHamwwrlVs/CPNdggruaMpVNdiACmmfqs58JjfFWjxAIvxbhZOkXgl96Af8eOTvn8eJpwlKYAmodX9/st4baySTKfCXMSCnAuQSWOsJpB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ng3r09yI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ng3r09yI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D29581F000E9;
	Wed,  2 Sep 2026 16:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788367326;
	bh=zSCE6tfU3OOKoy1uKyUKYorlWK8V4jpcRy6mW/6lq08=;
	h=From:Date:Subject:To:Cc;
	b=Ng3r09yIN/Rg69sbbU68f2e0J4GvQ1H08DpuJmxeKXzHbL+jSRAM2+y1l0iv9NZZS
	 BLTnCyef/QPKJyaX8urjMUB3ZQJ7Ett0/vZ3CI4w2Px+SebIB5AAJOmsL9G8+3Bc7g
	 ObKFIVdoK6bWucxeLONqgE1gPYtG3AeZ1LXP9Eh5ZPofdWyjC+YCgJR3O+gJOZfZzh
	 0jL/RsNMOX3GVfYqq4vn8hApYwJEt5V9aqSW2qmYYBbgEbhsPz5BNCn4jEz9xQSWns
	 9Mzc4xD8T/6nD+xl2hufNb6VcCoBIZ10kL4RMkmQPLYcTPj1MuwJ/U0mTKo25p41Wn
	 JRCwfO2UKMIPg==
From: "Harry Yoo (Meta)" <harry@kernel.org>
Date: Wed, 02 Sep 2026 17:41:54 +0100
Subject: [PATCH v2] mm/slab: take n->list_lock in
 __slab_try_return_freelist() to avoid race
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-slab-fix-aba-v2-1-d1ece15a8417@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MMQvCMBBG/0q52YMYpRAnF3Hp4C4dLsnFHpS2J
 CVYSv67seP7Pt7bIXEUTnBrdoicJck8VdCnBtxA04dRfGXQSrfKKI1pJItBvkiW0LcqXExwxjN
 DVZbI9Tpy777yIGmd43bU8/m/Ai0vQvfs3LYaNeLjnq+WR+hLKT+ug6bejQAAAA==
X-Change-ID: 20260902-slab-fix-aba-d60f39fc9dee
To: Vlastimil Babka <vbabka@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>, 
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Hyunwoo Kim <imv4bel@gmail.com>, "Harry Yoo (Meta)" <harry@kernel.org>
X-Mailer: b4 0.14.3

Commit ba7425312607 ("mm, slab: add an optimistic
__slab_try_return_freelist()") incorrectly assumed that nobody has freed
an object to the slab as long as slab->freelist is NULL and cmpxchg
succeeds.

However, as reported by Hyunwoo Kim [1], other CPUs might have freed
an object to the slab, insert the slab to the partial list, then
allocated an object from the slab, and be in the middle of removing
the slab from the list under n->list_lock.

Since __refill_objects_node() puts the slab back on pc.slabs
outside n->list_lock, it might insert the slab into that list while
the slab is concurrently being removed from n->partial.
This led to a list corruption, as reported by Hyunwoo Kim [1]:

  list_add corruption. next->prev should be prev
  (ffff888100000248), but was dead000000000122.
  (next=ffffea000416e410).
  kernel BUG at lib/list_debug.c:29!
  Oops: invalid opcode: 0000 [#1] SMP NOPTI
  CPU: 1 UID: 65534 PID: 144 Comm: poc Not tainted
  7.2.0-16172-gcf72cbb39da8-dirty #1 PREEMPT(lazy)
  RIP: 0010:__list_add_valid_or_report+0x80/0xd0
  ...
  Call Trace:
   alloc_from_new_slab+0x183/0x300
   ___slab_alloc+0x31c/0x890
   __kmalloc_noprof+0x3d4/0x800
   lsm_blob_alloc+0x2d/0x50
   security_msg_msg_alloc+0x26/0x90
   load_msg+0x1aa/0x210
   do_msgsnd+0x91/0x800
   do_syscall_64+0x109/0x5d0
   entry_SYSCALL_64_after_hwframe+0x77/0x7f
  ...
  Kernel panic - not syncing: Fatal exception

This is a classic ABA problem where cmpxchg succeeds but the state has
changed since __refill_objects_node() took the freelist from the slab.

As Vlastimil Babka mentioned [2], it should be rare to return more than
one slab (due to the racy read of slab->counters in
get_partial_node_bulk()). Therefore, instead of introducing additional
complexity, acquire and release n->list_lock twice in the worst case.

Return the slab directly to the partial list and hold n->list_lock
across the cmpxchg and add_partial(). This is similar to the initial
version of commit ba7425312607 [3]. This is enough to avoid the race as
the list manipulation is serialized by n->list_lock. While at it,
bring back unlikely() hint now that the condition is unlikely.

Reported-by: Hyunwoo Kim <imv4bel@gmail.com>
Closes: https://lore.kernel.org/linux-mm/apPa-cGLcyt90l-E@v4bel [1]
Link: https://lore.kernel.org/linux-mm/ae25c193-b95f-40c1-83b6-1c2546467e41@kernel.org [2]
Link: https://lore.kernel.org/all/20260421-b4-refill-optimistic-return-v1-1-24f0bfc1acff@kernel.org [3]
Fixes: ba7425312607 ("mm, slab: add an optimistic __slab_try_return_freelist()")
Cc: stable@vger.kernel.org
Signed-off-by: Harry Yoo (Meta) <harry@kernel.org>
---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/apPa-cGLcyt90l-E@v4bel
---
 mm/slub.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index f9b56cb439e7..5cbbacb8ee32 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -5684,6 +5684,8 @@ static bool __slab_try_return_freelist(struct kmem_cache *s, struct slab *slab,
 				       void *head, int cnt)
 {
 	struct freelist_counters old, new;
+	struct kmem_cache_node *n;
+	unsigned long flags;
 
 	old.freelist = slab->freelist;
 	old.counters = slab->counters;
@@ -5695,9 +5697,16 @@ static bool __slab_try_return_freelist(struct kmem_cache *s, struct slab *slab,
 	new.counters = old.counters;
 	new.inuse -= cnt;
 
-	if (!slab_update_freelist(s, slab, &old, &new, "__slab_try_return_freelist"))
+	n = get_node(s, slab_nid(slab));
+	spin_lock_irqsave(&n->list_lock, flags);
+
+	if (!slab_update_freelist(s, slab, &old, &new, "__slab_try_return_freelist")) {
+		spin_unlock_irqrestore(&n->list_lock, flags);
 		return false;
+	}
 
+	add_partial(n, slab, ADD_TO_TAIL);
+	spin_unlock_irqrestore(&n->list_lock, flags);
 	return true;
 }
 
@@ -7296,10 +7305,8 @@ __refill_objects_node(struct kmem_cache *s, void **p, gfp_t gfp, unsigned int mi
 			void *head = object;
 			void *tail;
 
-			if (__slab_try_return_freelist(s, slab, head, count)) {
-				list_add(&slab->slab_list, &pc.slabs);
+			if (__slab_try_return_freelist(s, slab, head, count))
 				break;
-			}
 
 			do {
 				tail = object;
@@ -7312,7 +7319,7 @@ __refill_objects_node(struct kmem_cache *s, void **p, gfp_t gfp, unsigned int mi
 			break;
 	}
 
-	if (!list_empty(&pc.slabs)) {
+	if (unlikely(!list_empty(&pc.slabs))) {
 		spin_lock_irqsave(&n->list_lock, flags);
 
 		list_for_each_entry(slab, &pc.slabs, slab_list)

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260902-slab-fix-aba-d60f39fc9dee

Best regards,
-- 
Cheers,
Harry / Hyeonggon

