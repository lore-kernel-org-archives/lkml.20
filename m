Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.58
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794793631;
	b=lwgF923T5fBDNYZl9NNAaxdnQHPoF0kYQcNXXepktDvbmlXQMMQESAEbqs59/ivfP/Vy
	 qJUPj9We6gzATC23G/OGQj8dj9XLKeObuu0maSUgXXXnrcVyXtDhJiNIieKcNmQd3Q2Ms
	 M9izx9fUUmkokc9EzD2PTRHWmv1FgcsmzVugetICoBZYkzXM2U5Pjv2Vx6550zi59gWpY
	 a2/dBa8gyxg6mzKzCU3viZKS4xYzHiv7PbGHJX7ejub9RAkItJbQqLiY+JzbWqeCvRuLa
	 YYMPFVsqVJOoZUtsk98N6XCkza4pUnTMDOpKlkqFZ+t0kITKjao7YkB8Z+7JXSsGKZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794793631;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7QtOOOgTJEk0ghtIfvYKds3UPcto3kaLflQ2ByCpIHQ=;
	b=Ac+G1Fx1d43lhXelk0tjlfrZCAGhnideTrjoZCB2Ek1GRwFs8XVWr0VrdV7Vagc1OR3k
	 Izrc4rvsJ4FBeoZKHAYn0CTR8gRySHS4uW/7BmXYh162EBWsCB1D9INFMI3Q3p2vnyjnw
	 R/RlV4PE3LyabSEggjsBoLjDNchkzLzzFItGjYKf3OVQ51Yjq/bZyrNk9W0I51zGT9pEj
	 lELWpU0kJpoUhw9cWVo2G7zN8/U3zxBON1AQb+uMzDrUy/otND0FWRR2BkCDgCDqRhSN6
	 TPkG192wfdxZExyHW+sQm0oluqGSjL+h4+iDlZ8w7omn0IcUFF0x4Vc6j20inMS4qUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YbLNnzOG;
	arc=none smtp.remote-ip=95.215.58.58
Received: from mta1.migadu.com (out-58.mta1.migadu.com [95.215.58.58])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EFE606A321
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:47:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62EFE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YbLNnzOG
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DWRrwENmkaJP3hHecdwh0EFbZQASgLdcHnLDgfl/cBc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794793628; v=1; x=1795398428;
 b=YbLNnzOGph4KVAnhewxJqNXw1ifmsZv2ZEW36G5YRi29xFfXqRi7yT7XVb2mzVVkaP0vBAIr
 uyTnpamZ38tGCLHp1v5kIqWb//r447NHp49j6DHMVvtF957Pbw+O3YK/QWtHiLLyVD3d40rNyBn
 CALXc1Fju8iVjWsYykQWAy1s=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 75d66f80df2d3fd7;
	Mon, 16 Nov 2026 01:47:07 +0000
X-Mizu-Trace-ID: 75d66f80df2d3fd7
X-Migadu-Flow: FLOW_OUT
From: "Xu Xin (vivo)" <xu.xin@linux.dev>
To: xu.xin@linux.dev
Cc: chengming.zhou@linux.dev,
	david@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org
Subject: [PATCH v3 2/2] mm/ksm: add initialization helpers for scan_get_next_rmap_item()
Date: Mon, 16 Nov 2026 09:46:55 +0800
Message-Id: <20261116014655.310486-1-xu.xin@linux.dev>
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

Extract the new scan cycle check into scan_should_start_new_cycle()
and add the helper scan_get_first_mm() that advances the scan
cursor to the first mm_slot.

This keeps the exact execution order intact while making
scan_get_next_rmap_item() cleaner and easier to follow.

No functional change intended.

Signed-off-by: Xu Xin (vivo) <xu.xin@linux.dev>
---
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
index 8db6743ece6d..89a3da4a4874 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -2638,6 +2638,34 @@ static void ksm_reset_unstable_trees(void)
 		root_unstable_tree[nid] = RB_ROOT;
 }
 
+static bool scan_should_start_new_cycle(void)
+{
+	/* Check if the cursor points to the head. */
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

