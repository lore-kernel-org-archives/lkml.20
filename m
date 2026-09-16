Received: from danaos.cslab.ece.ntua.gr (danaos.cslab.ece.ntua.gr [147.102.3.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEAA3B71DC
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.102.3.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789558767; cv=none; b=HHfuAlp6dtxe1w5JtM3V3ELYG5bbAFbSOkdDgn3UA0irOnvSMCdLr5SZ4fn0oIKkRaoXqV0W1lldtbg+1TIiyKkpEak6jhPTB3T09LWD0LQ/joCN61lcTddMXJnYACacBu56J+vTycBdEDZEBkeeq3q5HQNkkFmIt4YbPxn5auM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789558767; c=relaxed/simple;
	bh=iTPbgi6TTWpSnIYUxKADxzx4y1Pw8y2qclg7BMPDqWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WdVI0HL2bCsNcGMZEz37hiBNyjg+wucLxgat4pJLWDomVV0g5UmewMZQe8/OGiu7kjOTDAxWm62no86S5+2vgbHHSBzqb64GmK+0Ah1iHtB3ZEZexMJY7wIGsukE9svbrJ/MYbusCaWn4fDB618Vpng+7vQEUau8bRgV/6bmrUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cslab.ece.ntua.gr; spf=pass smtp.mailfrom=cslab.ece.ntua.gr; dkim=pass (1024-bit key) header.d=cslab.ece.ntua.gr header.i=@cslab.ece.ntua.gr header.b=d47+8HVT; arc=none smtp.client-ip=147.102.3.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cslab.ece.ntua.gr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cslab.ece.ntua.gr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cslab.ece.ntua.gr header.i=@cslab.ece.ntua.gr header.b="d47+8HVT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cslab.ece.ntua.gr;
	s=smtp-cslab; t=1789558744;
	bh=iTPbgi6TTWpSnIYUxKADxzx4y1Pw8y2qclg7BMPDqWA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=d47+8HVTgyT/i/Hi2bUgm9y0um/FjGxgtsCzL2ArQFbb8d+v1ZL9I3nvIgQTAY8CN
	 Wk+ZzIZ7AU8UkFUBUIIYN7y68xKkXeHQItTNLM1EHiV+zwLSjHMbw7Sz8q+XtuEOAJ
	 2fFMAIeiLC2DlFvC+kDAkn7DzmxSaik5QQ0BRVgQ=
Received: from [127.0.0.1] (armor.cslab.ece.ntua.gr [147.102.4.33])
	by danaos.cslab.ece.ntua.gr (Postfix) with ESMTPSA id 141F9120BF6;
	Wed, 16 Sep 2026 14:39:04 +0300 (EEST)
From: Dimitris Charisis <dchar@cslab.ece.ntua.gr>
Date: Wed, 16 Sep 2026 11:38:44 +0000
Subject: [PATCH v2 3/4] maple_tree: fix invalid memory access in
 mt_free_walk()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-fix-maple-tree-range64-rcu-v2-3-0b09de37eb69@cslab.ece.ntua.gr>
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

mt_free_walk() descends to the left-most unvisited "parent-of-a-leaf"
node by checking the condition:

        if ((offset < mt_slots[type]) &&
            rcu_dereference_protected(slots[offset],
                                      lock_is_held(&rcu_callback_map)))
                slots = mte_dead_walk(&enode, offset);

A maple_range_64 node has MAPLE_RANGE64_SLOTS slots. When it's not full,
the last slot carries a struct maple_metadata holding the offset of the
last valid slot. So on a node with MAPLE_RANGE64_SLOTS-1 children *all*
slots are non-NULL. The first MAPLE_RANGE64_SLOTS-1  hold valid pointers
to child nodes, and the last slot contains metadata. The above check
therefore passes for all offsets, and mte_dead_walk() dereferences the
metadata as if it were a node.

To trigger this, a node at least two levels above the leaves has to have
exactly MAPLE_RANGE64_SLOTS-1 valid pointers to other nodes.
maple_arange_64 nodes cannot hit this since they store the metadata in a
separate field.

Fix this by bounding the descent with slot_len which holds the number of
children of a dead node.

Fixes: 54a611b60590 ("Maple Tree: add new data structure")
Signed-off-by: Dimitris Charisis <dchar@cslab.ece.ntua.gr>
---
 lib/maple_tree.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index e86eee43aa0ada6963995cd74495d9344f6ccd06..0b0036c9f848929a7c9a26650ccd935c44aa1376 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -4752,9 +4752,7 @@ static void mt_free_walk(struct rcu_head *head)
 
 		type = mte_node_type(enode);
 		slots = ma_slots(mte_to_node(enode), type);
-		if ((offset < mt_slots[type]) &&
-		    rcu_dereference_protected(slots[offset],
-					      lock_is_held(&rcu_callback_map)))
+		if (offset < mte_to_node(enode)->slot_len)
 			slots = mte_dead_walk(&enode, offset);
 		node = mte_to_node(enode);
 	} while ((node != start) || (node->slot_len < offset));

-- 
2.47.3

