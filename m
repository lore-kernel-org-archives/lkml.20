Received: from mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5279649B46D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789995315; cv=none; b=jWZFKNq7goOvhEIkt8TSdGdICPsySdX8LttK6KHKBL9LoRQDLKGLq8GFeivjFu+M8kh1txgik8OsIDqecmZpNkl5YDfrD/7C3z/srW7YvDKyzJ9SvZO5dGcOXu0DiQn3JxSdBmqyuBSvKrutBxvPspdQ+W7GwaRqCz/VYtXof78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789995315; c=relaxed/simple;
	bh=rgUPJLDIrF/y+IKscmXbwuCMcRf8kaxaT8pd8fmezLw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r2c2xZHDnGUMfIzMoSz3AoGVU5lmeCvt56WAtArCOxXB+ocMTwXHTNgP5WJGS3RZ9nEAlg5jgbjTfc6A7grqW767Qahnz673lMGsSoic4/YxmQr1Jkxngxi2puN7GH8BkKdMkrXQuBM4M/xIjLUCe0zmZNK1cHRg+14tLcJqq3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DrP+J02P; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DrP+J02P"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rgUPJLDIrF/y+IKscmXbwuCMcRf8kaxaT8pd8fmezLw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789995308; v=1; x=1790600108;
 b=DrP+J02PEpoVeB5beppHIPjZOSkeZBChg+3CidSQyBlYxoMENwFiqO01RPFKRzXt77DXfzpq
 Urh7IV1tFXk0VqraFM6vozkw0SkEnApgsIlgtcq/5l6/59myN2hpLUu3f1O7Bg8MW+ENRen3mys
 /qqFpnT8SBdsSA4sx9ZXJB3U=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b9b60e85b785a8f7;
	Mon, 21 Sep 2026 12:55:06 +0000
X-Mizu-Trace-ID: b9b60e85b785a8f7
X-Migadu-Flow: FLOW_OUT
From: Hao Li <hao.li@linux.dev>
To: vbabka@kernel.org,
	harry@kernel.org,
	akpm@linux-foundation.org
Cc: cl@gentwo.org,
	rientjes@google.com,
	roman.gushchin@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Hao Li <hao.li@linux.dev>
Subject: [PATCH v2] mm/slub: make the case handling in __slab_free() easier to follow
Date: Mon, 21 Sep 2026 20:43:22 +0800
Message-ID: <20260921125421.142452-1-hao.li@linux.dev>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are 8 possible transitions in __slab_free():

  a. partial->partial, offlist
  b. partial->partial, onlist
  c. partial->empty, offlist
  d. partial->empty, onlist, exceeding min_partial
  e. partial->empty, onlist, not exceeding min_partial
  f. full->empty, exceeding min_partial
  g. full->empty, not exceeding min_partial
  h. full->partial

(The onlist/offlist distinction does not apply to f, g and h, as a full
slab is on no list.)

Clarify which case each branch handles, and replace the goto with a
return at the end of the skipped block so that every branch explicitly
states its coverage.

Cases 'a' and 'b' are the only paths that need neither list_lock nor
list handling. Give them an early continue: handling them upfront is
much clearer than forcing every other case into a nested block.

Also, read SL_partial once after the loop right where it is used, rather
than re-reading it on every iteration.

No functional change.

Signed-off-by: Hao Li <hao.li@linux.dev>
Reviewed-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
Reviewed-by: Harry Yoo (Meta) <harry@kernel.org>
---
v2:
- Split case-a into its offlist and onlist subcases in the changelog
  and reword the partial->partial comment accordingly (Thanks Vlastimil).
- Drop the shrinker as the example in the list_lock comment (Thanks Harry).
- Polish the wording of the some comments.
- Collect the Reviewed-by tags.
- Use git --patience to generate more readable patch.

RFC:
https://lore.kernel.org/linux-mm/20260824122513.3829-1-hao.li@linux.dev/
---
 mm/slub.c | 98 +++++++++++++++++++++++++++++--------------------------
 1 file changed, 51 insertions(+), 47 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index 54ec12503357..9c13d6887092 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -5751,76 +5751,80 @@ static void __slab_free(struct kmem_cache *s, struct slab *slab,
 		new.inuse -= cnt;
 
 		/*
-		 * Might need to be taken off (due to becoming empty) or added
-		 * to (due to not being full anymore) the partial list.
-		 * Unless it's frozen.
+		 * partial->partial: if the slab was on the node partial list,
+		 * it stays there, and if it was off, it stays off, so we need
+		 * no list handling and no list_lock.
+		 *
+		 * Note that "continue;" in a do-while goes on to evaluate the
+		 * condition below, so we do perform the freelist update.
 		 */
-		if (!new.inuse || was_full) {
+		if (!was_full && new.inuse)
+			continue;
 
-			n = get_node(s, slab_nid(slab));
-			/*
-			 * Speculatively acquire the list_lock.
-			 * If the cmpxchg does not succeed then we may
-			 * drop the list_lock without any processing.
-			 *
-			 * Otherwise the list_lock will synchronize with
-			 * other processors updating the list of slabs.
-			 */
-			spin_lock_irqsave(&n->list_lock, flags);
-
-			on_node_partial = slab_test_node_partial(slab);
-		}
+		/*
+		 * The slab might need to be taken off (due to becoming empty)
+		 * or added to (due to not being full anymore) the partial
+		 * list.
+		 *
+		 * Speculatively acquire list_lock prior to cmpxchg(), as
+		 * performing cmpxchg() before lock acquisition races with
+		 * concurrent partial list operations.
+		 *
+		 * If the cmpxchg does not succeed then we will retry.
+		 */
+		n = get_node(s, slab_nid(slab));
+		spin_lock_irqsave(&n->list_lock, flags);
 
 	} while (!slab_update_freelist(s, slab, &old, &new, "__slab_free"));
 
-	if (likely(!n)) {
-		/*
-		 * We didn't take the list_lock because the slab was already on
-		 * the partial list and will remain there.
-		 */
+	/* partial->partial: we didn't take the list_lock. */
+	if (likely(!n))
 		return;
-	}
 
-	/*
-	 * This slab was partially empty but not on the per-node partial list,
-	 * in which case we shouldn't manipulate its list, just return.
-	 */
+	on_node_partial = slab_test_node_partial(slab);
+
 	if (!was_full && !on_node_partial) {
+		/*
+		 * partial->empty, offlist: a bulk refill has taken the slab
+		 * off the partial list and will put it back, so its list
+		 * handling is not ours to do.
+		 */
 		spin_unlock_irqrestore(&n->list_lock, flags);
 		return;
 	}
 
 	/*
-	 * If slab became empty, should we add/keep it on the partial list or we
-	 * have enough?
+	 * full/partial->empty, exceed: we have enough partial slabs already.
 	 */
-	if (unlikely(!new.inuse && n->nr_partial >= s->min_partial))
-		goto slab_empty;
+	if (unlikely(!new.inuse && n->nr_partial >= s->min_partial)) {
+		/* partial->empty, onlist, exceed */
+		if (likely(!was_full)) {
+			remove_partial(n, slab);
+			stat(s, FREE_REMOVE_PARTIAL);
+		}
+		/* else, full->empty, exceed: it is on no list to remove from */
+
+		spin_unlock_irqrestore(&n->list_lock, flags);
+		stat(s, FREE_SLAB);
+		discard_slab(s, slab);
+		return;
+	}
 
 	/*
-	 * Objects left in the slab. If it was not on the partial list before
-	 * then add it.
+	 * At this point, only three cases remain:
+	 *   full->partial
+	 *   full->empty, not exceed
+	 *   partial->empty, onlist, not exceed
 	 */
+
+	/* full->partial; full->empty, not exceed */
 	if (unlikely(was_full)) {
 		add_partial(n, slab, ADD_TO_TAIL);
 		stat(s, FREE_ADD_PARTIAL);
 	}
-	spin_unlock_irqrestore(&n->list_lock, flags);
-	return;
-
-slab_empty:
-	/*
-	 * The slab could have a single object and thus go from full to empty in
-	 * a single free, but more likely it was on the partial list. Remove it.
-	 */
-	if (likely(!was_full)) {
-		remove_partial(n, slab);
-		stat(s, FREE_REMOVE_PARTIAL);
-	}
+	/* else, partial->empty, onlist, not exceed: it stays on partial list */
 
 	spin_unlock_irqrestore(&n->list_lock, flags);
-	stat(s, FREE_SLAB);
-	discard_slab(s, slab);
 }
 
 /*
-- 
2.55.0

