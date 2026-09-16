Received: from danaos.cslab.ece.ntua.gr (danaos.cslab.ece.ntua.gr [147.102.3.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5E04EBAEB
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.102.3.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789558771; cv=none; b=B7cy7/kqRTYDWzdfTIPyX+MOZgyij9hgpaHFhYMxkfcA/zLqD9HSSRSP+zqFahDnz4sXE//LcOvLdXpvfavzOlTbus+KR8UGhqBDgnXBxGifzqv+nJpgFP2ACbTFQW2Fmbk09nVEiC+tXSn+OrZv2hv2QnzTQcC58IhuYVAZ/JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789558771; c=relaxed/simple;
	bh=Y1SFoLhBIFd6pX1RkY73sxEGVjFfj6zsBKMG2Gysrbc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t+L16o/28m11eLDwIITAaYAT3RN76lbxsIUguwqPBZkXBKWKmIqgwu2OFAGiN2f1VXd9KP+7nXyije60P4pdjXsj8g92H0BKXxH03z0IEY9vh8xpRBoJqkirwGmQ+qIA+25thzZ1xp7KbQC4rsuHnq8YcI0HtBu/A/CifiXAExo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cslab.ece.ntua.gr; spf=pass smtp.mailfrom=cslab.ece.ntua.gr; dkim=pass (1024-bit key) header.d=cslab.ece.ntua.gr header.i=@cslab.ece.ntua.gr header.b=am3FPyaP; arc=none smtp.client-ip=147.102.3.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cslab.ece.ntua.gr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cslab.ece.ntua.gr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cslab.ece.ntua.gr header.i=@cslab.ece.ntua.gr header.b="am3FPyaP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cslab.ece.ntua.gr;
	s=smtp-cslab; t=1789558743;
	bh=Y1SFoLhBIFd6pX1RkY73sxEGVjFfj6zsBKMG2Gysrbc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=am3FPyaPipHW4yX/qhIBiB5rBHVCCgYrVvR5SqtJPa9iSeMr8VPph3LDHi6EOXYpB
	 s0Wa3dIj0xBT7vXVWvPd1UKqgpMqJiLry8OmcvSeYEum6F4N0INbzu3xaR/3el0fIC
	 fSSSRo1RyjZYPYtqc9Y3TdQM4w5A3kisb/jPoHWs=
Received: from [127.0.0.1] (armor.cslab.ece.ntua.gr [147.102.4.33])
	by danaos.cslab.ece.ntua.gr (Postfix) with ESMTPSA id CA559120B7D;
	Wed, 16 Sep 2026 14:39:03 +0300 (EEST)
From: Dimitris Charisis <dchar@cslab.ece.ntua.gr>
Date: Wed, 16 Sep 2026 11:38:42 +0000
Subject: [PATCH v2 1/4] maple_tree: remove mt_clear_meta() to fix a pointer
 corruption
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-fix-maple-tree-range64-rcu-v2-1-0b09de37eb69@cslab.ece.ntua.gr>
References: <20260916-fix-maple-tree-range64-rcu-v2-0-0b09de37eb69@cslab.ece.ntua.gr>
In-Reply-To: <20260916-fix-maple-tree-range64-rcu-v2-0-0b09de37eb69@cslab.ece.ntua.gr>
To: Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Alice Ryhl <aliceryhl@google.com>, 
 Andrew Ballance <andrewjballance@gmail.com>, 
 Suren Baghdasaryan <surenb@google.com>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: maple-tree@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Dimitris Charisis <dchar@cslab.ece.ntua.gr>
X-Mailer: b4 0.14.2

mt_clear_meta() decides whether the last slot of a maple_range_64 node
holds a child pointer or a struct maple_metadata with the check

        if (unlikely((mte_to_node(next) &&
                      mte_node_type(next))))
                return; /* no metadata, could be node */

The check expects the pointer to be encoded.  But the only callsite of
mt_clear_meta() is mt_destroy_walk() on the RCU destroy path, and by the
time it runs, mte_dead_leaves() has overwritten every slot on a full
node with a raw pointer, stripping the type information. Thus, the check
above never returns early for a full node as it should. It falls through
and then:
        meta->gap = 0;
        meta->end = 0;
zeroes two bytes of a valid child pointer. Later, mt_free_walk()
dereferences the corrupted pointer.

Fix this by removing mt_clear_meta() along with its only callsite.
mt_clear_meta() is only called for the root of each sub-tree destroyed
under RCU. Descendant nodes retain their metadata until they are freed.
RCU readers may use the metadata while traversing a node, but do not use
cleared metadata to detect that a node has been removed. They detect a
dead node via ma_dead_node().

Fixes: 2e5b4921f8ef ("maple_tree: fix freeing of nodes in rcu mode")
Signed-off-by: Dimitris Charisis <dchar@cslab.ece.ntua.gr>
---
 lib/maple_tree.c | 39 ---------------------------------------
 1 file changed, 39 deletions(-)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index 1aba6cced71307245cbbca26986e14e74b35a14f..e86eee43aa0ada6963995cd74495d9344f6ccd06 100644
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
@@ -4885,8 +4848,6 @@ static void mt_destroy_walk(struct maple_enode *enode, struct maple_tree *mt,
 free_leaf:
 	if (free)
 		kfree(node);
-	else
-		mt_clear_meta(mt, node, node->type);
 }
 
 /*

-- 
2.47.3

