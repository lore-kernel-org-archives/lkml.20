Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.85
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794488418;
	b=zGAGw2jDZi3aA6KXV+GnpdBdE/91/VEXKBI53rjaxJcPcoEvXqLl1t8rVw3Ry8Bpnu+V
	 OVkLgN4p0rDyUsieDRFXHQq+wK09gu/APaA54AekLDXVNQqH8uGuH1sPKs0lSeLVvawNT
	 Rxcy5hVNPCxxMpAI0jT3EyEz8j1EhbF+CYZQxtRAhky/Y5uLdzWptxzvsndzpbIHlDm51
	 OiUZ1Xz6yLMcu7JC0NwnFiIqKb8rawzU5Udy+PIyGByzhY/KsbS5tQXaVejsQXBMAZXda
	 0cXTy+GH8Iqh0dWOlrzPtzj2rB/+TdJFx8JxKsg7+WsFU5VFWUjK9E3JIhwAAanT0xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488418;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tL9krYLzw1vGXbr6jlGPxdWtdTamdmpD35tBdked0g4=;
	b=qaemDZspjeR5UGCzj+nmcgYdXl6P4b4JymmV9AxbDu1nFB3ykUevD3yR6v/YVCc9PSo9
	 QQfyMLt5qVFzfiLOD6N/MGCoikR86OkvLUff0z7AtaRLtk2CVdgbsexJb5dvwd+cPL8eH
	 R6vdjqQvOefpJvnRElqsE8SayfvDrn1EFD9ColVIIlSjMLG9GiZG7edh3qvs1UgQj+G8H
	 MTSsRr4r/kAzTsDhjIefE5jsTu+hoFhiuW8Q9UsSU9yLHVfrwLmjolcaH90kznbdrvxSi
	 ki4HAjmSeYYNl+VToU/+2ZXVqMqb1hmD8rDij5Ai2ym6FbG3eeSA8BTHExyNQOLJKPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xY4djlso;
	arc=none smtp.remote-ip=95.215.58.85
Received: from mta1.migadu.com (out-85.mta1.migadu.com [95.215.58.85])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2623606A89F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:00:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2623606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xY4djlso
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=lP0vpQ7indg5AzBAUuvMNzwAAkYOsAv9TjMwh2sSEhg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794488415; v=1; x=1795093215;
 b=xY4djlsoItfWwszSsBMyE6ugAaVqFF6HHj06pFfRhihh6OAEdaSyuyldMjvB5iisQFZAUd6r
 yzpXXV1Sfk6ttSAtGccs3hU7bVWPmS9CmAVWpoeRi/FXOSVtviaGmyFqESlUlzSpXjxQHs5jqa0
 AKslJ3lXWSCgJHKPQn2pHlY0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 855efecdfc12cc35;
	Thu, 12 Nov 2026 13:00:15 +0000
X-Mizu-Trace-ID: 855efecdfc12cc35
X-Migadu-Flow: FLOW_OUT
From: "Xu Xin (vivo)" <xu.xin@linux.dev>
To: xu.xin@linux.dev
Cc: chengming.zhou@linux.dev,
	david@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org
Subject: [PATCH 2/2] mm/ksm: add initialization helpers for scan_get_next_rmap_item()
Date: Thu, 12 Nov 2026 20:59:59 +0800
Message-Id: <20261112125959.177881-1-xu.xin@linux.dev>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112125754.176930-1-xu.xin@linux.dev>
References: <20261112125754.176930-1-xu.xin@linux.dev>
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

Extract the new scan cycle detection (including draining per-CPU LRU
caches) and advancing the scan cursor to the first mm_slot into
scan_begin_new_cycle() and scan_get_first_mm().

This keeps the exact execution order intact while making
scan_get_next_rmap_item() cleaner and easier to follow.

No functional change intended.

Signed-off-by: Xu Xin (vivo) <xu.xin@linux.dev>
---
 mm/ksm.c | 70 +++++++++++++++++++++++++++++++++++++-------------------
 1 file changed, 46 insertions(+), 24 deletions(-)

diff --git a/mm/ksm.c b/mm/ksm.c
index 49977bcf04f7..e79e64372e49 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -2640,6 +2640,49 @@ static void ksm_reset_unstable_trees(void)
 		root_unstable_tree[nid] = RB_ROOT;
 }
 
+static bool scan_begin_new_cycle(void)
+{
+	/* Check if the cursor points to the head. */
+	if (ksm_scan.mm_slot != &ksm_mm_head)
+		return false;
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
+	return true;
+}
+
+static struct ksm_mm_slot *scan_get_first_mm(void)
+{
+	struct ksm_mm_slot *mm_slot = ksm_scan.mm_slot;
+	struct mm_slot *slot;
+
+	spin_lock(&ksm_mmlist_lock);
+
+	slot = list_entry(mm_slot->slot.mm_node.next, struct mm_slot, mm_node);
+	mm_slot = mm_slot_entry(slot, struct ksm_mm_slot, slot);
+	ksm_scan.mm_slot = mm_slot;
+
+	spin_unlock(&ksm_mmlist_lock);
+
+	/*
+	 * Although we tested list_empty() above, a racing __ksm_exit
+	 * of the last mm on the list may have removed it since then.
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
@@ -2653,36 +2696,15 @@ static struct ksm_rmap_item *scan_get_next_rmap_item(struct page **page)
 		return NULL;
 
 	mm_slot = ksm_scan.mm_slot;
-	if (mm_slot == &ksm_mm_head) {
+	if (scan_begin_new_cycle()) {
 		advisor_start_scan();
 		trace_ksm_start_scan(ksm_scan.seqnr, ksm_rmap_items);
 
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
-- 
2.34.1

