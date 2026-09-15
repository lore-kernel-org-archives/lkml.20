Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E96A3E3178
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789485256; cv=none; b=qOMZ0cGBg7IAkW+2Znrh1T4a5bfMDWrNQdhxddnYPxafJ4k1SgTbdyBe/9VzvfoAR/G9q/r7mTMINdn9MWGEFGMpWZgo2WRml6F6ZVhLm9OWteuVCB5N9UbwzWpqS1LAThKyT/k8FXV3zcMBFLt/t+h7P38MzR+Ra7mwqdhuyLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789485256; c=relaxed/simple;
	bh=+h78PPLa2IjO0G8Uq8nhnCRf8ngw619E7eCCzLg7U4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nMqtPoXOV5zN+S3Wbq4n2626Sy+zjAaTR27XpgagkaGBM8NGlgkrWAMp7q/mF0lJZaKGS3Z4gw0SiQWt3wM3YuyyWAiMnRDWOi40fPsXBVyCtRD76rzRS607M/BU5JfyIwvWqtakrDAui9+B8pxLnsHJyY7o9AT2yRsUGgRRZdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=n97/zZ/q; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="n97/zZ/q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=2g
	qlmp1JcN66P7HZPc4Um7qYp+zXpL8XMfS9Kv/SGok=; b=n97/zZ/qD5hDTvMo0p
	ulmKvaQeDCsFVeiRcIatjgNxTEKFZlDElrp4M26FvDkrqJP2ILZDY44bMIx8j5/j
	xDVXY3HMYPvd1z1CHVqjhVDzmn7BzPHtBF4oB9M8+Fuj3JL0U0RHgB1w0jl0VVyj
	z7wNXXzG0ZuqsaNPCrG8MUVbc=
Received: from VM-0-3-ubuntu.. (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wAn2xWOYKlqc0VUAw--.40469S6;
	Tue, 15 Sep 2026 23:13:21 +0800 (CST)
From: Longlong Xia <xialonglong2025@163.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: Longlong Xia <xialonglong@kylinos.cn>,
	David Hildenbrand <david@kernel.org>,
	Xu Xin <xu.xin@linux.dev>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/14] mm/ksm: add advance_scan_mm_slot() helper
Date: Tue, 15 Sep 2026 23:12:18 +0800
Message-ID: <20260915151236.5200-5-xialonglong2025@163.com>
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
X-CM-TRANSID:_____wAn2xWOYKlqc0VUAw--.40469S6
X-Coremail-Antispam: 1Uf129KBjvJXoWxuFyUJw1xuFWUur1fKw48JFb_yoW5uw4kpF
	4jgFZ8Kr45Ar12gryxKr48ArWYvw40gr48Gw43Cws29r1ag345JF18Gay8JryYkFy8Wwnx
	Xa1YvFs8Gry7K37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07URE__UUUUU=
X-CM-SenderInfo: x0ldz0pqjo00rjsqjki6rwjhhfrp/xtbC9xFBOmqpYJFR0wAA3t

From: Longlong Xia <xialonglong@kylinos.cn>

Factor the four mm-slot cursor advances in scan_get_next_rmap_item()
and unmerge_and_remove_all_rmap_items() into a helper. Assert that
ksm_mmlist_lock is held.

No functional change intended.

Assisted-by: Zcode:GLM-5.3
Signed-off-by: Longlong Xia <xialonglong@kylinos.cn>

---
 mm/ksm.c | 34 ++++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/mm/ksm.c b/mm/ksm.c
index 18d037f571d3..aa33522627c7 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -1119,6 +1119,22 @@ static inline void folio_set_stable_node(struct folio *folio,
 		   (void *)((unsigned long)stable_node | FOLIO_MAPPING_KSM));
 }
 
+/*
+ * Move the ksmd cursor onto the mm slot that follows @mm_slot in the
+ * ksm_mm_head list, and return the new cursor (@mm_slot may be
+ * &ksm_mm_head to (re)start from the first slot).  Called with
+ * ksm_mmlist_lock held.
+ */
+static struct ksm_mm_slot *advance_scan_mm_slot(struct ksm_mm_slot *mm_slot)
+{
+	struct mm_slot *slot;
+
+	lockdep_assert_held(&ksm_mmlist_lock);
+	slot = list_entry(mm_slot->slot.mm_node.next, struct mm_slot, mm_node);
+	ksm_scan.mm_slot = mm_slot_entry(slot, struct ksm_mm_slot, slot);
+	return ksm_scan.mm_slot;
+}
+
 #ifdef CONFIG_SYSFS
 /*
  * Only called through the sysfs control interface:
@@ -1215,15 +1231,12 @@ static int remove_all_stable_nodes(void)
 static int unmerge_and_remove_all_rmap_items(void)
 {
 	struct ksm_mm_slot *mm_slot;
-	struct mm_slot *slot;
 	struct mm_struct *mm;
 	struct vm_area_struct *vma;
 	int err = 0;
 
 	spin_lock(&ksm_mmlist_lock);
-	slot = list_entry(ksm_mm_head.slot.mm_node.next,
-			  struct mm_slot, mm_node);
-	ksm_scan.mm_slot = mm_slot_entry(slot, struct ksm_mm_slot, slot);
+	advance_scan_mm_slot(&ksm_mm_head);
 	spin_unlock(&ksm_mmlist_lock);
 
 	for (mm_slot = ksm_scan.mm_slot; mm_slot != &ksm_mm_head;
@@ -1253,9 +1266,7 @@ static int unmerge_and_remove_all_rmap_items(void)
 		mmap_read_unlock(mm);
 
 		spin_lock(&ksm_mmlist_lock);
-		slot = list_entry(mm_slot->slot.mm_node.next,
-				  struct mm_slot, mm_node);
-		ksm_scan.mm_slot = mm_slot_entry(slot, struct ksm_mm_slot, slot);
+		advance_scan_mm_slot(mm_slot);
 		if (ksm_test_exit(mm)) {
 			mm_slot_remove(&mm_slot->slot);
 			spin_unlock(&ksm_mmlist_lock);
@@ -2662,10 +2673,7 @@ static struct ksm_rmap_item *scan_get_next_rmap_item(struct page **page)
 			root_unstable_tree[nid] = RB_ROOT;
 
 		spin_lock(&ksm_mmlist_lock);
-		slot = list_entry(mm_slot->slot.mm_node.next,
-				  struct mm_slot, mm_node);
-		mm_slot = mm_slot_entry(slot, struct ksm_mm_slot, slot);
-		ksm_scan.mm_slot = mm_slot;
+		mm_slot = advance_scan_mm_slot(mm_slot);
 		spin_unlock(&ksm_mmlist_lock);
 		/*
 		 * Although we tested list_empty() above, a racing __ksm_exit
@@ -2758,9 +2766,7 @@ static struct ksm_rmap_item *scan_get_next_rmap_item(struct page **page)
 	remove_trailing_rmap_items(ksm_scan.rmap_list);
 
 	spin_lock(&ksm_mmlist_lock);
-	slot = list_entry(mm_slot->slot.mm_node.next,
-			  struct mm_slot, mm_node);
-	ksm_scan.mm_slot = mm_slot_entry(slot, struct ksm_mm_slot, slot);
+	advance_scan_mm_slot(mm_slot);
 	if (ksm_scan.address == 0) {
 		/*
 		 * We've completed a full scan of all vmas, holding mmap_lock
-- 
2.43.0

