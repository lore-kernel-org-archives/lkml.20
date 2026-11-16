Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794793553;
	b=wF3OptD8IYait/Z567zv+9UAeLpWdLB+HiA30G6EHqJlA1VnE6WYa6XE1/D38upOD1zS
	 /cNTK84IOIxTxMKVw9nLV8c7/oC7+8okEnDM1uL9Cy6EXCmTcygZs7OXC+da7hsr8MVuO
	 NxI/j1D0GPSlpJAhC+vf1D90Z7Z1xihgO/FV5GEoXr57J5cYwpe1ZPVBzhRCIHL8ypDoQ
	 gHPgZ7wqD4Ff4aRi3DR+nTu+KUFiak24rLiEtZmAM6Sxa2bBgYuK23qb30i2rpSQZsYLI
	 Rx15rN3c8Rq+C33LDuCA1CR1kyvocWV6TMvduE3oEfqVV9k25tBwJdZjMvo/ADBfKLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794793553;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Pt8xvDwKeZFNbSLqDy3OvpUkDSrTrAmd4jUA7dH+Zmk=;
	b=PZVob7OTsH+SFHcA7iUGd6I3KwzF9oTiQ/loQtDlrzZ8kZOwCd2o8lN+e9oUgJr2C42r
	 pouBBLQbtvQm2yGe59dPO9lw2GAqT/fjQKG1SMNm1kwVfQ/iSPW5+sxqN43AKC53I3Voc
	 wpc6abuqm2rZ0DqfrxdKwW688QMSU+o7rR8RLebOp7XVisIPKZcCxiUHrFNktndG81Dsp
	 d3QYs4TNye/5DI1V+0aicoBbo87hbHYQUTeFFw2rZtETpEbGlXqEIODcu2+V3hUONTrZK
	 QuJj4p2OV/evDeuMNtuYJ+HOgD+OryBCDbh4NVlA4jx3hMRHBulbikH+LGKCs62n6qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=aI2KzWyP;
	arc=none smtp.remote-ip=91.218.175.168
Received: from mta0.migadu.com (out-168.mta0.migadu.com [91.218.175.168])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD3F606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:45:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BD3F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=aI2KzWyP
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KsT5VlOouw8+wlbQGGPvciVPDA8AmFbkB9L6Bo0igYA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794793550; v=1; x=1795398350;
 b=aI2KzWyPKd0vCzFogv4NuhiGjEgI63Mmu5lZUvGyFwsdnU+MvK/tDbMM71ItaBGcn3cQ+qzs
 WO0ZP5SHGQzKleh+axKi42gwpcHvodN7U4hUDbf6Q9h38G4iD8WLJ1E7IUgxhsy6m3QCC6mXm+T
 OOzxJR4SNX4IBzT/61ITgwEc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 3f9af6bc78a53944;
	Mon, 16 Nov 2026 01:45:50 +0000
X-Mizu-Trace-ID: 3f9af6bc78a53944
X-Migadu-Flow: FLOW_OUT
From: "Xu Xin (vivo)" <xu.xin@linux.dev>
To: xu.xin@linux.dev
Cc: chengming.zhou@linux.dev,
	david@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org
Subject: [PATCH v3 1/2] mm/ksm: extract helper functions for scan cycle cleanup
Date: Mon, 16 Nov 2026 09:45:32 +0800
Message-Id: <20261116014532.310270-1-xu.xin@linux.dev>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116014434.310003-1-xu.xin@linux.dev>
References: <20261116014434.310003-1-xu.xin@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since scan_get_next_rmap_item() is getting too large, extract two new
helper functions, ksm_prune_migrate_nodes() and ksm_reset_unstable_trees(),
to reduce indentation levels, isolate local variables, and improve the
readability of the main scan loop.

No functional change intended.

Signed-off-by: Xu Xin (vivo) <xu.xin@linux.dev>
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
 mm/ksm.c | 54 +++++++++++++++++++++++++++++++-----------------------
 1 file changed, 31 insertions(+), 23 deletions(-)

diff --git a/mm/ksm.c b/mm/ksm.c
index 5e24b5ca8dc8..8db6743ece6d 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -2609,6 +2609,35 @@ static struct mm_walk_ops ksm_next_page_ops = {
 	.walk_lock = PGWALK_RDLOCK,
 };
 
+static void ksm_prune_migrate_nodes(void)
+{
+	struct ksm_stable_node *stable_node, *next;
+	struct folio *folio;
+
+	if (ksm_merge_across_nodes)
+		return;
+
+	/*
+	 * Whereas stale stable_nodes on the stable_tree itself
+	 * get pruned in the regular course of stable_tree_search(),
+	 * those moved out to the migrate_nodes list can accumulate:
+	 * so prune them once before each full scan.
+	 */
+	list_for_each_entry_safe(stable_node, next, &migrate_nodes, list) {
+		folio = ksm_get_folio(stable_node, KSM_GET_FOLIO_NOLOCK);
+
+		if (folio)
+			folio_put(folio);
+		cond_resched();
+	}
+}
+
+static void ksm_reset_unstable_trees(void)
+{
+	for (int nid = 0; nid < ksm_nr_node_ids; nid++)
+		root_unstable_tree[nid] = RB_ROOT;
+}
+
 static struct ksm_rmap_item *scan_get_next_rmap_item(struct page **page)
 {
 	struct mm_struct *mm;
@@ -2617,7 +2646,6 @@ static struct ksm_rmap_item *scan_get_next_rmap_item(struct page **page)
 	struct vm_area_struct *vma;
 	struct ksm_rmap_item *rmap_item;
 	struct vma_iterator vmi;
-	int nid;
 
 	if (list_empty(&ksm_mm_head.slot.mm_node))
 		return NULL;
@@ -2639,28 +2667,8 @@ static struct ksm_rmap_item *scan_get_next_rmap_item(struct page **page)
 		 */
 		lru_add_drain_all();
 
-		/*
-		 * Whereas stale stable_nodes on the stable_tree itself
-		 * get pruned in the regular course of stable_tree_search(),
-		 * those moved out to the migrate_nodes list can accumulate:
-		 * so prune them once before each full scan.
-		 */
-		if (!ksm_merge_across_nodes) {
-			struct ksm_stable_node *stable_node, *next;
-			struct folio *folio;
-
-			list_for_each_entry_safe(stable_node, next,
-						 &migrate_nodes, list) {
-				folio = ksm_get_folio(stable_node,
-						      KSM_GET_FOLIO_NOLOCK);
-				if (folio)
-					folio_put(folio);
-				cond_resched();
-			}
-		}
-
-		for (nid = 0; nid < ksm_nr_node_ids; nid++)
-			root_unstable_tree[nid] = RB_ROOT;
+		ksm_prune_migrate_nodes();
+		ksm_reset_unstable_trees();
 
 		spin_lock(&ksm_mmlist_lock);
 		slot = list_entry(mm_slot->slot.mm_node.next,
-- 
2.34.1

