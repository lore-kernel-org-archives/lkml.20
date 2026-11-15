Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.84
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794729643;
	b=Hr9PuGY6lNeLnzjnAq8PUve2Oy5dcXUjBcNBJgrCYhJ6X3t7z7b7Vv+cu51BnOIWkSxm
	 VzqHH9P5XmSl7kp1yBrFVIK/f/x2JTs9MDeUwhoDB6B/WMPLu84f9ptIFXMxHi9E1s7n7
	 EJmJqcZhdrYHOnCfm2cHHyX5NYPcN5NzpF21yi3F6R6OvFNe8eOdEwRr8LduYBzES1CHf
	 GkhdiRZtnw9KNhuNaLIzDMcoKpw/qoaeqQi7hYEkiFmq03RL9jvOl0cz9dscjfOjwcahm
	 Knt7mR7wWOBKOigmuloqlIWnqbkrdFAw/Q3vC9o7FrkSH8ErWNth7iXAouhkcIaYnig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794729643;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Pt8xvDwKeZFNbSLqDy3OvpUkDSrTrAmd4jUA7dH+Zmk=;
	b=vhy2NlUdeAHB9f3nlQL03a7jgVkm9HJBDMrwBv0E4YwGsuTZT6dz+5JDMBKk+joL2GHG
	 KN6WaFPZWjiSXw+lFLZzBnvacgo19aMt8uNMyiLHzSmtdVR9YwdDHFo+cBJyHi9zsyz0c
	 YbiIulEy5oumbklBB2SoSvholVWzWlZcaJitLlVEK5kf2qZdqAjJvJsOdejiBRaiKJRzs
	 XIH9lEf3/yoFyZl9Kd0/xf5++WclLnFssFxbgTvKBe5wbwT9oEQ7vJdCWnTYPYKOsdHFL
	 SY1U0DGFGM3TXQMUkN2giC0zY4qcezxfjUxuwsL2xT8fAhFtA3NI4KTQ2GoX3GxnnuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="o5/eFKoU";
	arc=none smtp.remote-ip=91.218.175.84
Received: from mta0.migadu.com (out-84.mta0.migadu.com [91.218.175.84])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BF0606A899
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:00:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9BF0606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=o5/eFKoU
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KsT5VlOouw8+wlbQGGPvciVPDA8AmFbkB9L6Bo0igYA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794729639; v=1; x=1795334439;
 b=o5/eFKoUpKx8HigQzKWUi4AYgpp0HzJrxq3jRocTYu/5tfZUv0eMO3lj7PYBkPmYqRf9zbOS
 bzA8rXYvZU0HTcGOIEG+F1fF8Ra1F6/vW9rwQPVXJ+/uKn0SVGE9zI32MvhGtQddvSpwHz+VJAI
 MUf0lSMKVeqD57ZdXrfOb9JQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 8fe9c4ef923e859d;
	Sun, 15 Nov 2026 08:00:39 +0000
X-Mizu-Trace-ID: 8fe9c4ef923e859d
X-Migadu-Flow: FLOW_OUT
From: "Xu Xin (vivo)" <xu.xin@linux.dev>
To: xu.xin@linux.dev
Cc: chengming.zhou@linux.dev,
	david@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org
Subject: [PATCH v2 1/2] mm/ksm: extract helper functions for scan cycle cleanup
Date: Sun, 15 Nov 2026 16:00:32 +0800
Message-Id: <20261115080032.132397-1-xu.xin@linux.dev>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261115075832.132109-1-xu.xin@linux.dev>
References: <20261115075832.132109-1-xu.xin@linux.dev>
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

