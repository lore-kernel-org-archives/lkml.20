Received: from danaos.cslab.ece.ntua.gr (danaos.cslab.ece.ntua.gr [147.102.3.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EFD2222A9
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 12:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.102.3.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791204927; cv=none; b=mXYVFY10he2lb2SCbufEo/nNr3RP7mX1MwBemgRZniPz6u8RZjlxhdmZOkLa2ckqkbl+2ncO0E/thS8vVVNL655IOB3Gxu14uzk0arwPxgfzP17BgoP3aRlUg0fU5N5+8In4BNhPnEUlp2HnzT+ZyFwr3jJU1wKOETnGQ1Ublu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791204927; c=relaxed/simple;
	bh=RT0cvZhZuYfunz+KKV/LNA7VnNO4f0qqJFRrlvkn7RE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s0urwFZif+6HF3oQkUbUOQI0pK/R33YafY7sb5uf5stzcXgck/qG6lrLkm3Fju+fEfy3z4+ZYok1BarpwJHSTVieXZ+OvbzGAO2YODMP8+YIxVmjXdBhGwmpxYR4EQcpP6ON6FEp3sUXSAg4QKCYgL6o86Khn2YAb+pTyzDmLg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cslab.ece.ntua.gr; spf=pass smtp.mailfrom=cslab.ece.ntua.gr; dkim=pass (1024-bit key) header.d=cslab.ece.ntua.gr header.i=@cslab.ece.ntua.gr header.b=A7ls1Sud; arc=none smtp.client-ip=147.102.3.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cslab.ece.ntua.gr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cslab.ece.ntua.gr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cslab.ece.ntua.gr header.i=@cslab.ece.ntua.gr header.b="A7ls1Sud"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cslab.ece.ntua.gr;
	s=smtp-cslab; t=1791204479;
	bh=RT0cvZhZuYfunz+KKV/LNA7VnNO4f0qqJFRrlvkn7RE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=A7ls1SudXyt2eIr/ey819WhfOElxRY+itA9X5ICt39FFvjh32z04x01RS0n3gHwze
	 uwfej74RVhDDx19sPz406tzbJiK4/pVhHS+oSzK9HxK7qvbVUDURbh51PNGzoRJN2a
	 j+lcrfC/vSU7pk0k9Vyl4reDhJqO3SSB9RDjXTeA=
Received: from [127.0.0.1] (armor.cslab.ece.ntua.gr [147.102.4.33])
	by danaos.cslab.ece.ntua.gr (Postfix) with ESMTPSA id 95FC3120A09;
	Mon,  5 Oct 2026 15:47:59 +0300 (EEST)
From: Dimitris Charisis <dchar@cslab.ece.ntua.gr>
Date: Mon, 05 Oct 2026 12:47:27 +0000
Subject: [PATCH v3 1/2] maple_tree: fix maple_range_64 crashes in RCU mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-fix-maple-tree-range64-rcu-v3-1-ebe7fb278e20@cslab.ece.ntua.gr>
References: <20261005-fix-maple-tree-range64-rcu-v3-0-ebe7fb278e20@cslab.ece.ntua.gr>
In-Reply-To: <20261005-fix-maple-tree-range64-rcu-v3-0-ebe7fb278e20@cslab.ece.ntua.gr>
To: Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Alice Ryhl <aliceryhl@google.com>, 
 Andrew Ballance <andrewjballance@gmail.com>, 
 Suren Baghdasaryan <surenb@google.com>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: maple-tree@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Dimitris Charisis <dchar@cslab.ece.ntua.gr>
X-Mailer: b4 0.14.2

This commit fixes two issues in maple_range_64 nodes under RCU mode. A
maple_range_64 node repurposes its last slot to hold metadata whenever
the node is not full. Both issues arise from mishandling that last slot.

More specifically the two fixes are:

1. Remove mt_clear_meta() function. mt_clear_meta() decides whether the
   last slot of a maple_range_64 node holds a child pointer or a
   struct maple_metadata with the check

        if (unlikely((mte_to_node(next) &&
                      mte_node_type(next))))
                return; /* no metadata, could be node */

   The check expects the pointer to be encoded.  But the only callsite
   of mt_clear_meta() is mt_destroy_walk() on the RCU destroy path, and
   by the time it runs, mte_dead_leaves() has overwritten every slot on
   a full node with a raw pointer, stripping the type information. Thus,
   the check above never returns early for a full node as it should. It
   falls through and then:
           meta->gap = 0;
           meta->end = 0;
   zeroes two bytes of a valid child pointer. Later, mt_free_walk()
   dereferences the corrupted pointer.

  Fix this by removing mt_clear_meta() along with its only callsite.
  mt_clear_meta() is only called for the root of each sub-tree destroyed
  under RCU. Descendant nodes retain their metadata until they are
  freed. RCU readers may use the metadata while traversing a node, but
  do not use cleared metadata to detect that a node has been removed.
  They detect a dead node via ma_dead_node().

2. Fix invalid memory access in mt_free_walk().  mt_free_walk() descends
   to the left-most unvisited "parent-of-a-leaf" node by checking the
   condition:

        if ((offset < mt_slots[type]) &&
            rcu_dereference_protected(slots[offset],
                                      lock_is_held(&rcu_callback_map)))
                slots = mte_dead_walk(&enode, offset);

   On a maple_range_64 node with MAPLE_RANGE64_SLOTS-1 children *all*
   slots are non-NULL. The first MAPLE_RANGE64_SLOTS-1  hold valid
   pointers to child nodes, and the last slot contains metadata. The
   above check therefore passes for all offsets, and mte_dead_walk()
   dereferences the metadata as if it were a node.

   To trigger this, a node at least two levels above the leaves has to
   have exactly MAPLE_RANGE64_SLOTS-1 valid pointers to other nodes.
   maple_arange_64 nodes cannot hit this since they store the metadata
   in a separate field.

   Fix this by bounding the descent with slot_len which holds the number
   of children of a dead node.

Fixes: 54a611b60590 ("Maple Tree: add new data structure")
Fixes: 2e5b4921f8ef ("maple_tree: fix freeing of nodes in rcu mode")
Signed-off-by: Dimitris Charisis <dchar@cslab.ece.ntua.gr>
---
 lib/maple_tree.c | 43 +------------------------------------------
 1 file changed, 1 insertion(+), 42 deletions(-)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index 1aba6cced71307245cbbca26986e14e74b35a14f..0b0036c9f848929a7c9a26650ccd935c44aa1376 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -763,43 +763,6 @@ static inline void ma_set_meta(struct maple_node *mn, enum maple_type mt,
 	meta->end = end;
 }
 
-/*
- * mt_clear_meta() - clear the metadata information of a node, if it exists
- * @mt: The maple tree
- * @mn: The maple node
- * @type: The maple node type
- */
-static inline void mt_clear_meta(struct maple_tree *mt, struct maple_node *mn,
-				  enum maple_type type)
-{
-	struct maple_metadata *meta;
-	unsigned long *pivots;
-	void __rcu **slots;
-	void *next;
-
-	switch (type) {
-	case maple_range_64:
-		pivots = mn->mr64.pivot;
-		if (unlikely(pivots[MAPLE_RANGE64_SLOTS - 2])) {
-			slots = mn->mr64.slot;
-			next = mt_slot_locked(mt, slots,
-					      MAPLE_RANGE64_SLOTS - 1);
-			if (unlikely((mte_to_node(next) &&
-				      mte_node_type(next))))
-				return; /* no metadata, could be node */
-		}
-		fallthrough;
-	case maple_arange_64:
-		meta = ma_meta(mn, type);
-		break;
-	default:
-		return;
-	}
-
-	meta->gap = 0;
-	meta->end = 0;
-}
-
 /*
  * ma_meta_end() - Get the data end of a node from the metadata
  * @mn: The maple node
@@ -4789,9 +4752,7 @@ static void mt_free_walk(struct rcu_head *head)
 
 		type = mte_node_type(enode);
 		slots = ma_slots(mte_to_node(enode), type);
-		if ((offset < mt_slots[type]) &&
-		    rcu_dereference_protected(slots[offset],
-					      lock_is_held(&rcu_callback_map)))
+		if (offset < mte_to_node(enode)->slot_len)
 			slots = mte_dead_walk(&enode, offset);
 		node = mte_to_node(enode);
 	} while ((node != start) || (node->slot_len < offset));
@@ -4885,8 +4846,6 @@ static void mt_destroy_walk(struct maple_enode *enode, struct maple_tree *mt,
 free_leaf:
 	if (free)
 		kfree(node);
-	else
-		mt_clear_meta(mt, node, node->type);
 }
 
 /*

-- 
2.47.3

