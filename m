Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.234
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794729661;
	b=2TexzMPMaUZ2l5wdm+mytn344jrBjWDBvKeuOKELg5/PYsH/Ki+w+F70X5ViCB4PVYxC
	 fLzg2nxii2LwXb2eTK/sSETIgQdGn3KkL014V/RxC8msmbsKTL0M/9Fe1aM/7YYNUjF7k
	 zPYixuqBkkJhPliw9tYUCKMPTC7c3Yt5n7Q0QQp/NY3Y6TE1hYqcw6FodeyTXtLry0xCT
	 Ql818HuCBvVfLLgldhujdYZGuFWKlUm1pAbONVU+W4Kma22d1OzECQ4NtdnruhEdiOhLb
	 A7+ykhSGEM7bBzBzJLWgwhJPgSp4njM0VdCuIGfLeI3eCwl1KRBwxBC2sJtXpZlJcPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794729661;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=60gsrEbAuJheAzPFFTSSLkUWfF1qdMXOYWZtQkOXi6g=;
	b=jnxYp2cZexC689Wf+kjEM7e89F+PpuKlOQB6+qEKVXEZOx87vWwFrFJ9HibQs7VTkL3d
	 w+h+65kIgXGKSBW4r4HH4AmyNc0MiWq4Q7ISv/M4oIW8CV93LHjXsgWlq1uhTYE65OIWC
	 mvOgxUsFdjnMYDEpUan4cEqqLls9X0+F+DDsfuyUU6A1eHAA6kzOC9EdRlj/uCHziyOMu
	 YoNK9jL2BBEZZhKmJtidD0RfgEwoS94+mLfiBiqisFIKg4P2mR+CQSQoBNXjiZnZJzz88
	 JO6w/uBpUJKhb/bXauaQrre7mpucXCLlC1E2eCRGyI1HSd+Thl+baoWtn9RXSxWuiKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZymTR8c6;
	arc=none smtp.remote-ip=95.215.58.234
Received: from mta1.migadu.com (out-234.mta1.migadu.com [95.215.58.234])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCB5606A33D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFCB5606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZymTR8c6
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=LNnxampF1hSfK2nrRVdNwXWnI4MpuaWWr622AzfxeHY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794729656; v=1; x=1795334456;
 b=ZymTR8c684kM9FwzuUp5zPC5YO4vsYRMv/T6Au3x7vpVPdhuI4FKr9CRPjtUQ4QAGj2l3NFQ
 fULjfxof9/4bYc71ZgSp3MQCPkkth4yb/dnNqbjHDEnGTAGgPg6svqBVzmtq4zafU7uI8YcPN9y
 /VHh7yfsgB/e3UxWWJT/k3uY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 6126331626ea888a;
	Sun, 15 Nov 2026 08:00:56 +0000
X-Mizu-Trace-ID: 6126331626ea888a
X-Migadu-Flow: FLOW_OUT
From: "Xu Xin (vivo)" <xu.xin@linux.dev>
To: xu.xin@linux.dev
Cc: chengming.zhou@linux.dev,
	david@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org
Subject: [PATCH v2 2/2] mm/ksm: add initialization helpers for scan_get_next_rmap_item()
Date: Sun, 15 Nov 2026 16:00:49 +0800
Message-Id: <20261115080049.132515-1-xu.xin@linux.dev>
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

Extract the new scan cycle check into scan_should_start_new_cycle()
and add the helper scan_get_first_mm() that advances the scan
cursor to the first mm_slot.

This keeps the exact execution order intact while making
scan_get_next_rmap_item() cleaner and easier to follow.

No functional change intended.

Signed-off-by: Xu Xin (vivo) <xu.xin@linux.dev>
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
Changes in v2:
- Rename scan_begin_new_cycle() to scan_should_start_new_cycle() and keep
  it simple (David).
- Keep lru_add_drain_all() in scan_get_next_rmap_item() (David).
- Use scoped_guard(spinlock, &ksm_mmlist_lock) in scan_get_first_mm()
  (Lorenzo).
- Keep Lorenzo's Reviewed-by tag as the changes are minor and follow the
  suggested cleanups (please let me know if you prefer otherwise).

 mm/ksm.c | 44 +++++++++++++++++++++++++++++++-------------
 1 file changed, 31 insertions(+), 13 deletions(-)

diff --git a/mm/ksm.c b/mm/ksm.c
index 8db6743ece6d..337fcc9c6322 100644
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
 
@@ -2670,17 +2697,8 @@ static struct ksm_rmap_item *scan_get_next_rmap_item(struct page **page)
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

