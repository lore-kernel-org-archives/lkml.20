Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794880355;
	b=iohNZAeL3STaysRkF996TkXxleVBLm4DfkoaZnDCU984dOPVuK3noAKCd61kb2wojqoE
	 2qo27OODQBV5pkKXlwhughiLgacR0xSEDsW1eM0XzykwbeWtofy8lgwTC+08oLe7KYvBC
	 6eBgUUqp7zobRk2/Y9e5GWA/PxMMNXRjD59G0KX2tUkjRIoHxcF2OhNQj+sw5NWBAk2vu
	 l0a3gZtoG4uztMNgrbwULfSJuHO16Iuv56wZx/lCTNL6Z9boxrckj+8kF3HhgOaMqN8iR
	 J/PBTfl8IqIrW0YnWJ1Znfnk9NnYrvDm23VDjW1OLmw1mumUn5XW59xQL9ZsG+Fz2LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794880355;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=R9FDV9LumLwaqMr3fWi1CRMLzPuNQVlo3nMvXwW4siU=;
	b=KnMLjOHm64z5P9GtWiMVw6h518rJnA2BC3rjx76Up7z8IzKsXPPPMIiSABA2BuMFnRY5
	 lzUL8mkWL0R2z1RIm56pFR+UW9sQ+z/O1UX3vIMiA0CwKr9vHyuFIYf1qEMHk6vnukjiE
	 hW0c/36EHt60C416W8FaQP+N6U2FgedpY/dHHhfAiPQtOVUiGYH8oCID2WiF92FMJjAoQ
	 hg8lJ8+1H/qrI2W2oQ0kMqhNVY7SfPdwt/KxjbVK/+gpG4NcFG3/rl4GfESUqsrkmVX5E
	 z27LDSnNYPJ2P4LxucX77MbVA91fF2RdkzoNhyma8Qn9TL8VFisqIllaInW8d7smw9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="F/HxyvAJ";
	arc=none smtp.remote-ip=91.218.175.121
Received: from mta0.migadu.com (out-121.mta0.migadu.com [91.218.175.121])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BAF606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:52:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44BAF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=F/HxyvAJ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2O4eEcW1l7j4Rs7t0E8EUthAkAbvzAeMUpu0A8UhMSc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794880353; v=1; x=1795485153;
 b=F/HxyvAJcB8YtJNg9x94+tZqUz2sQeFdv/Odm7E5qzW8ansC4ROhk6rHTK65ruoW9Rag0e3f
 S5kbUsk/gWwfLSx+ofPuRryDJqa/3FAAWv4adU0fXCknlID3fYGkGEREVVqJ65pVHqCRiqghmKi
 TbJdONBE1sCeKrH1CFmiDSjg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id e29ae49de9410c07;
	Tue, 17 Nov 2026 01:52:33 +0000
X-Mizu-Trace-ID: e29ae49de9410c07
X-Migadu-Flow: FLOW_OUT
From: "Xu Xin (vivo)" <xu.xin@linux.dev>
To: xu.xin@linux.dev
Cc: chengming.zhou@linux.dev,
	david@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org
Subject: [PATCH v4 2/2] mm/ksm: add initialization helpers for scan_get_next_rmap_item()
Date: Tue, 17 Nov 2026 09:52:25 +0800
Message-Id: <20261117015225.618954-1-xu.xin@linux.dev>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117015009.611551-1-xu.xin@linux.dev>
References: <20261117015009.611551-1-xu.xin@linux.dev>
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

Extract the new scan cycle check into scan_should_start_new_cycle()
and add the helper scan_get_first_mm() that advances the scan
cursor to the first mm_slot.

This keeps the exact execution order intact while making
scan_get_next_rmap_item() cleaner and easier to follow.

No functional change intended.

Signed-off-by: Xu Xin (vivo) <xu.xin@linux.dev>
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
---
Changes in v4:
- Drop redundant comment in scan_should_start_new_cycle() and
  update the comment in scan_get_first_mm() to refer to
  scan_get_next_rmap_item()'s list_empty() check (Lorenzo).
- Add Reviewed-by tags.

Changes in v3:
- Initialize mm_slot = ksm_scan.mm_slot in the else branch when continuing
  the current scan cycle, fixing an uninitialized variable warning/bug
  (kernel test robot).
- Drop Lorenzo's Reviewed-by tag due to the v2 bug fix.

Changes in v2:
- Rename scan_begin_new_cycle() to scan_should_start_new_cycle() and keep
  it simple (David).
- Keep lru_add_drain_all() in scan_get_next_rmap_item() (David).
- Use scoped_guard(spinlock, &ksm_mmlist_lock) in scan_get_first_mm()
  (Lorenzo).

 mm/ksm.c | 47 ++++++++++++++++++++++++++++++++++-------------
 1 file changed, 34 insertions(+), 13 deletions(-)

diff --git a/mm/ksm.c b/mm/ksm.c
index 8db6743ece6d..80d036baa88e 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -2638,6 +2638,34 @@ static void ksm_reset_unstable_trees(void)
 		root_unstable_tree[nid] = RB_ROOT;
 }
 
+static bool scan_should_start_new_cycle(void)
+{
+	return ksm_scan.mm_slot == &ksm_mm_head;
+}
+
+static struct ksm_mm_slot *scan_get_first_mm(void)
+{
+	struct ksm_mm_slot *mm_slot = &ksm_mm_head;
+	struct mm_slot *slot;
+
+	scoped_guard(spinlock, &ksm_mmlist_lock) {
+		slot = list_entry(mm_slot->slot.mm_node.next,
+				  struct mm_slot, mm_node);
+		mm_slot = mm_slot_entry(slot, struct ksm_mm_slot, slot);
+		ksm_scan.mm_slot = mm_slot;
+	}
+
+	/*
+	 * Although the caller scan_get_next_rmap_item() tested list_empty(),
+	 * a racing __ksm_exit of the last mm on the list may have removed
+	 * it since then.
+	 */
+	if (mm_slot == &ksm_mm_head)
+		return NULL;
+
+	return mm_slot;
+}
+
 static struct ksm_rmap_item *scan_get_next_rmap_item(struct page **page)
 {
 	struct mm_struct *mm;
@@ -2650,8 +2678,7 @@ static struct ksm_rmap_item *scan_get_next_rmap_item(struct page **page)
 	if (list_empty(&ksm_mm_head.slot.mm_node))
 		return NULL;
 
-	mm_slot = ksm_scan.mm_slot;
-	if (mm_slot == &ksm_mm_head) {
+	if (scan_should_start_new_cycle()) {
 		advisor_start_scan();
 		trace_ksm_start_scan(ksm_scan.seqnr, ksm_rmap_items);
 
@@ -2670,21 +2697,15 @@ static struct ksm_rmap_item *scan_get_next_rmap_item(struct page **page)
 		ksm_prune_migrate_nodes();
 		ksm_reset_unstable_trees();
 
-		spin_lock(&ksm_mmlist_lock);
-		slot = list_entry(mm_slot->slot.mm_node.next,
-				  struct mm_slot, mm_node);
-		mm_slot = mm_slot_entry(slot, struct ksm_mm_slot, slot);
-		ksm_scan.mm_slot = mm_slot;
-		spin_unlock(&ksm_mmlist_lock);
-		/*
-		 * Although we tested list_empty() above, a racing __ksm_exit
-		 * of the last mm on the list may have removed it since then.
-		 */
-		if (mm_slot == &ksm_mm_head)
+		mm_slot = scan_get_first_mm();
+		if (!mm_slot)
 			return NULL;
 next_mm:
 		ksm_scan.address = 0;
 		ksm_scan.rmap_list = &mm_slot->rmap_list;
+	} else {
+		/* Continue scanning the current mm. */
+		mm_slot = ksm_scan.mm_slot;
 	}
 
 	slot = &mm_slot->slot;
-- 
2.34.1

