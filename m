Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B5A3E0C57
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789485260; cv=none; b=q3D21ovGO9gfpwk8dqPikASHhYNV/HsV3Gr6Mzu9YsCEfuk0yeDQu6AfuS7VC2qU8oCJh8PJ52RZD0NmXHs1tSyx8uzKfUaW/IsEcedfQ7SuH5VNorxueDrYZUwxDw9NtbONoXaeW07X2/+tuQdXd4Hd/WSGw74PybCyjd2EnKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789485260; c=relaxed/simple;
	bh=M6SIR8WirwvgYqDCnL2rODt9VmGKbSd+JdE5BlTYpe4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L3dzAerzZsVgV9B4PrMtso8fEVfn1+82YlzOd4WUu1Sj/UAQHVlyRcYHZPkznVrVb2bSEtQ0lcZLMbZ1MB+l/DWbhoKTSBqsYLu+TnT0/8xF9aNdlbexNseXPYaTIRogS5qohW+dq02hf35xflC3UPWj07sO8rd/x+KxQMvGXKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=mW2YydQ2; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="mW2YydQ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Sv
	09B+MaJGyVcGZqapK5SgsF5E0P5ewgC7egR+zOg9M=; b=mW2YydQ2/Df4qOjQZl
	WJUurtKDSLzDtccttVq3nN9SgLQEm6EgJfhZYIRdn5vZhOnT21sedebXH+GPvAsz
	UtO8c6RS+ndCRGd38QYIHn82M9bdRvKglhejZfJ8OjV2j+BtSE1alusPKgSWvtq8
	qxF1OwzNtftoXWAO8cPfWOqus=
Received: from VM-0-3-ubuntu.. (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wAn2xWOYKlqc0VUAw--.40469S12;
	Tue, 15 Sep 2026 23:13:24 +0800 (CST)
From: Longlong Xia <xialonglong2025@163.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: Longlong Xia <xialonglong@kylinos.cn>,
	David Hildenbrand <david@kernel.org>,
	Xu Xin <xu.xin@linux.dev>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/14] mm/ksm: extract ksm_begin_full_scan() from scan_get_next_rmap_item()
Date: Tue, 15 Sep 2026 23:12:24 +0800
Message-ID: <20260915151236.5200-11-xialonglong2025@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915151236.5200-1-xialonglong2025@163.com>
References: <20260915151236.5200-1-xialonglong2025@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAn2xWOYKlqc0VUAw--.40469S12
X-Coremail-Antispam: 1Uf129KBjvJXoW3Jr4kKFykWF48tr15XFWUurg_yoW7WF43pr
	Wak3yakrs5Ar10grWfJr48CrWavrWkKw48Jw13Cw4xCwn8KryIqF1xt3W0qFy5CFykZwnI
	va1jkF1DCrsay3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jU0edUUUUU=
X-CM-SenderInfo: x0ldz0pqjo00rjsqjki6rwjhhfrp/xtbC9xRCO2qpYJRR-QAA3B

From: Longlong Xia <xialonglong@kylinos.cn>

Extract the once-per-full-scan setup into ksm_begin_full_scan() to
shorten scan_get_next_rmap_item().

Move next_mm out of the if block. Reset address and rmap_list only when
starting a new mm, preserving both cursors when resuming a scan.

No functional change intended.

Assisted-by: Zcode:GLM-5.3
Signed-off-by: Longlong Xia <xialonglong@kylinos.cn>

---
 mm/ksm.c | 108 ++++++++++++++++++++++++++++++++-----------------------
 1 file changed, 64 insertions(+), 44 deletions(-)

diff --git a/mm/ksm.c b/mm/ksm.c
index 59887a2b4406..8884964d5a53 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -1137,6 +1137,64 @@ static struct ksm_mm_slot *advance_scan_mm_slot(struct ksm_mm_slot *mm_slot)
 	return ksm_scan.mm_slot;
 }
 
+/*
+ * ksm_begin_full_scan - start a new full scan of all mergeable mms
+ *
+ * Called when the scanning cursor has come back around to ksm_mm_head:
+ * drain the per-cpu pagevecs, prune the migrate_nodes list and reset
+ * the unstable trees for the new pass, then move the cursor onto the
+ * first mm slot.  Returns the new cursor, which is &ksm_mm_head itself
+ * if a racing __ksm_exit removed the last mm from the list.
+ */
+static struct ksm_mm_slot *ksm_begin_full_scan(void)
+{
+	struct ksm_mm_slot *mm_slot;
+	int nid;
+
+	advisor_start_scan();
+	trace_ksm_start_scan(ksm_scan.seqnr, ksm_rmap_items);
+
+	/*
+	 * A number of pages can hang around indefinitely in per-cpu
+	 * LRU cache, raised page count preventing write_protect_page
+	 * from merging them.  Though it doesn't really matter much,
+	 * it is puzzling to see some stuck in pages_volatile until
+	 * other activity jostles them out, and they also prevented
+	 * LTP's KSM test from succeeding deterministically; so drain
+	 * them here (here rather than on entry to ksm_do_scan(),
+	 * so we don't IPI too often when pages_to_scan is set low).
+	 */
+	lru_add_drain_all();
+
+	/*
+	 * Whereas stale stable_nodes on the stable_tree itself
+	 * get pruned in the regular course of stable_tree_search(),
+	 * those moved out to the migrate_nodes list can accumulate:
+	 * so prune them once before each full scan.
+	 */
+	if (!ksm_merge_across_nodes) {
+		struct ksm_stable_node *stable_node, *next;
+		struct folio *folio;
+
+		list_for_each_entry_safe(stable_node, next,
+					 &migrate_nodes, list) {
+			folio = ksm_get_folio(stable_node,
+					      KSM_GET_FOLIO_NOLOCK);
+			if (folio)
+				folio_put(folio);
+			cond_resched();
+		}
+	}
+
+	for (nid = 0; nid < ksm_nr_node_ids; nid++)
+		root_unstable_tree[nid] = RB_ROOT;
+
+	spin_lock(&ksm_mmlist_lock);
+	mm_slot = advance_scan_mm_slot(&ksm_mm_head);
+	spin_unlock(&ksm_mmlist_lock);
+	return mm_slot;
+}
+
 #ifdef CONFIG_SYSFS
 /*
  * Only called through the sysfs control interface:
@@ -2633,65 +2691,24 @@ static struct ksm_rmap_item *scan_get_next_rmap_item(struct page **page)
 	struct vm_area_struct *vma;
 	struct ksm_rmap_item *rmap_item;
 	struct vma_iterator vmi;
-	int nid;
 
 	if (list_empty(&ksm_mm_head.slot.mm_node))
 		return NULL;
 
 	mm_slot = ksm_scan.mm_slot;
 	if (mm_slot == &ksm_mm_head) {
-		advisor_start_scan();
-		trace_ksm_start_scan(ksm_scan.seqnr, ksm_rmap_items);
-
-		/*
-		 * A number of pages can hang around indefinitely in per-cpu
-		 * LRU cache, raised page count preventing write_protect_page
-		 * from merging them.  Though it doesn't really matter much,
-		 * it is puzzling to see some stuck in pages_volatile until
-		 * other activity jostles them out, and they also prevented
-		 * LTP's KSM test from succeeding deterministically; so drain
-		 * them here (here rather than on entry to ksm_do_scan(),
-		 * so we don't IPI too often when pages_to_scan is set low).
-		 */
-		lru_add_drain_all();
-
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
-
-		spin_lock(&ksm_mmlist_lock);
-		mm_slot = advance_scan_mm_slot(mm_slot);
-		spin_unlock(&ksm_mmlist_lock);
+		mm_slot = ksm_begin_full_scan();
 		/*
 		 * Although we tested list_empty() above, a racing __ksm_exit
 		 * of the last mm on the list may have removed it since then.
 		 */
 		if (mm_slot == &ksm_mm_head)
 			return NULL;
-next_mm:
 		ksm_scan.address = 0;
 		ksm_scan.rmap_list = &mm_slot->rmap_list;
 	}
 
+next_mm:
 	slot = &mm_slot->slot;
 	mm = slot->mm;
 	vma_iter_init(&vmi, mm, ksm_scan.address);
@@ -2811,8 +2828,11 @@ static struct ksm_rmap_item *scan_get_next_rmap_item(struct page **page)
 
 	/* Repeat until we've completed scanning the whole list */
 	mm_slot = ksm_scan.mm_slot;
-	if (mm_slot != &ksm_mm_head)
+	if (mm_slot != &ksm_mm_head) {
+		ksm_scan.address = 0;
+		ksm_scan.rmap_list = &mm_slot->rmap_list;
 		goto next_mm;
+	}
 
 	advisor_stop_scan();
 
-- 
2.43.0

