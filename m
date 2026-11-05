Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793912265;
	b=yCFj7FMNr0Ln2Zf++7dUfiFNHORMp05z4lWY4pX/tugyFDnuOEPStI5JgMluk9Q5ZV9u
	 9YsMd3bwnH6bruHgB7BU/NgQBpYiidKK7yETtFBBixcFDQRDB6XLP7zrkznfDvXSCkPkZ
	 TRtzP9R7WIFc5wXZDlNWBtW1kK+sUMeSn1LbH2GqOYP4yOtuj4UfdxZsUgX66W3U5RzGv
	 axeL7GBMMwe2/0iJVISt8GK9xZpSfrwyVldlotbrzpuKhpmJb+NrvzodcFwksGJwjHq5H
	 6gWog1OorlX5LDgllKTsDNoOkvheQz7uVoEnxQCdjBB1U3jKaGkKbRtS3zZ+4b0KHuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912265;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=dVRouAQ60e15ocRevqhuKqhJOtr4RnEhxrGu9kOZJ7w=;
	b=FBuL0GzjpcFYJHux4RyMLZKJmI1eae46x+bBapIdzJyvltV8p+3UtG1d4ucbzagBJ7P8
	 m37S78T6YjTG9ZDnlXRJXb/iNcNn1ijTosna5aLf16dKbw3IVfQ3NISw0fQOhdHHGC5Mr
	 yByGUjLwvbkBT3btysPMD/aePG7y/U8RjcmOxg6+Vxf/exXkRDPWhYnwx3X0M9iCCm65/
	 OKRoVyCJRSGc6hWfo56QawgbrOM0EpJVnj0upiBj+gO5/lP0axhcY5M4agb/u7djeaX7V
	 CCUJoC9JyS+WD2axsaxlWzEPgCD41mJOirPytvluu61RkrH9s05JwezAK9vQTQ+F0Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NR7h8R1W;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB72B606D80F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NR7h8R1W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 666811F008A1;
	Thu,  5 Nov 2026 20:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793912264;
	bh=dVRouAQ60e15ocRevqhuKqhJOtr4RnEhxrGu9kOZJ7w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NR7h8R1WOquh/FhA8p0k+/+Pv1X0RUR6onT5PSAQrKP9tdQ3/ODEVhkOQ4/e955g3
	 Xr1rfAvg4kEI6+wGcgJpeJiCMqjhr7QGWnWOmC+fzcA9T0xVQoI02tzHxc7go6Hjn3
	 Todt74T7PwY9qHf8PJ+i69mYzKU7p1iMQN44L5vUttlrmxayfshEXKbBtJdZmhQZML
	 5s2Q+mXvBghgjxHByMNqrpZm9r+YuHlosTDXHJFIqilVpsJOP8AWIJbvoDd2Mnk5/6
	 1pD4k97nUe+9DZ3wr2Un4Jm+4V3NIX/YiI4hpnWM+8OIHe6gasBSOfzGgjAOyijij3
	 OdwPhwf+D/7AQ==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Thu, 05 Nov 2026 20:57:22 +0000
Subject: [PATCH v2 1/3] Revert "mm/khugepaged: remove definition of struct
 khugepaged_mm_slot"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-khugepaged-latency-fix-v2-1-4384bbfe4606@kernel.org>
References: <20261105-khugepaged-latency-fix-v2-0-4384bbfe4606@kernel.org>
In-Reply-To: <20261105-khugepaged-latency-fix-v2-0-4384bbfe4606@kernel.org>
To: David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6956; i=ljs@kernel.org;
 h=from:subject:message-id; bh=ziMC6cguTgWTEd4kdoyX8HRN50ZLauaFxC4x777zQVY=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLLevD34se91tuVXQxX+5fVX/4uVPJzWfqfsnaXZmgqbs
 4dUWS8GdJSyMIhxMciKKbI8/yK+P0gkbF7nBX83mDmsTCBDGLg4BWAix6Yz/DM7M7dO8vjlJWKT
 P0zP+6jtHezsNLHt1puyzYHq65XKLqgzMmy72dnPOXePl8Tcb7s4K35ULdmzzLNfb/u9jo1C9xM
 nf+YGAA==
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14

This partially reverts commit b4c9ffb54b32 ("mm/khugepaged: remove
definition of struct khugepaged_mm_slot"), as a subsequent commit needs to
resurrect this type to store additional data alongside the mm_slot.

The stated intent of the commit was to address a NULL check in
__khugepaged_exit():

	mm_slot = mm_slot_entry(slot, struct khugepaged_mm_slot, slot);

slot can be NULL and mm_slot_entry() is an alias for container_of(), so
this is container_of() a NULL value.

This was benign as there was only 1 field in khugepaged_mm_slot (offsetting
NULL at 0 results in NULL), however it was right to fix this, so retain the
fix.

It also unwrapped KMEM_CACHE() in khugepaged_init(). This was a mistake,
and was itself reverted in commit c14bdcc9f274 ("mm/khugepaged: use
KMEM_CACHE()"). Therefore, retain the KMEM_CACHE() form in this revert.

Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 mm/khugepaged.c | 57 ++++++++++++++++++++++++++++++++++++++-------------------
 1 file changed, 38 insertions(+), 19 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index da91762f6358..aad8797f8d5a 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -66,6 +66,14 @@ static DEFINE_READ_MOSTLY_HASHTABLE(mm_slots_hash, MM_SLOTS_HASH_BITS);
 
 static struct kmem_cache *mm_slot_cache __ro_after_init;
 
+/**
+ * struct khugepaged_mm_slot - khugepaged information per mm that is being scanned
+ * @slot: hash lookup from mm to mm_slot
+ */
+struct khugepaged_mm_slot {
+	struct mm_slot slot;
+};
+
 /**
  * struct khugepaged_scan - cursor for scanning
  * @mm_head: the head of the mm list to scan
@@ -76,7 +84,7 @@ static struct kmem_cache *mm_slot_cache __ro_after_init;
  */
 struct khugepaged_scan {
 	struct list_head mm_head;
-	struct mm_slot *mm_slot;
+	struct khugepaged_mm_slot *mm_slot;
 	unsigned long address;
 };
 
@@ -386,7 +394,7 @@ int hugepage_madvise(struct vm_area_struct *vma,
 
 int __init khugepaged_init(void)
 {
-	mm_slot_cache = KMEM_CACHE(mm_slot, 0);
+	mm_slot_cache = KMEM_CACHE(khugepaged_mm_slot, 0);
 	if (!mm_slot_cache)
 		return -ENOMEM;
 
@@ -446,20 +454,22 @@ static bool hugepage_enabled(void)
 
 void __khugepaged_enter(struct mm_struct *mm)
 {
+	struct khugepaged_mm_slot *mm_slot;
 	struct mm_slot *slot;
 	int wakeup;
 
 	/* __khugepaged_exit() must not run from under us */
 	VM_BUG_ON_MM(collapse_test_exit(mm), mm);
 
-	slot = mm_slot_alloc(mm_slot_cache);
-	if (!slot)
+	mm_slot = mm_slot_alloc(mm_slot_cache);
+	if (!mm_slot)
 		return;
 
 	if (unlikely(mm_flags_test_and_set(MMF_VM_HUGEPAGE, mm))) {
-		mm_slot_free(mm_slot_cache, slot);
+		mm_slot_free(mm_slot_cache, mm_slot);
 		return;
 	}
+	slot = &mm_slot->slot;
 
 	spin_lock(&khugepaged_mm_lock);
 	mm_slot_insert(mm_slots_hash, mm, slot);
@@ -504,12 +514,15 @@ void khugepaged_enter_vma(struct vm_area_struct *vma,
 
 void __khugepaged_exit(struct mm_struct *mm)
 {
+	struct khugepaged_mm_slot *mm_slot;
 	struct mm_slot *slot;
 	int free = 0;
 
 	spin_lock(&khugepaged_mm_lock);
 	slot = mm_slot_lookup(mm_slots_hash, mm);
-	if (slot && khugepaged_scan.mm_slot != slot) {
+
+	mm_slot = slot ? mm_slot_entry(slot, struct khugepaged_mm_slot, slot) : NULL;
+	if (mm_slot && khugepaged_scan.mm_slot != mm_slot) {
 		mm_slot_remove(slot);
 		free = 1;
 	}
@@ -517,9 +530,9 @@ void __khugepaged_exit(struct mm_struct *mm)
 
 	if (free) {
 		mm_flags_clear(MMF_VM_HUGEPAGE, mm);
-		mm_slot_free(mm_slot_cache, slot);
+		mm_slot_free(mm_slot_cache, mm_slot);
 		mmdrop(mm);
-	} else if (slot) {
+	} else if (mm_slot) {
 		/*
 		 * This is required to serialize against
 		 * collapse_test_exit() (which is guaranteed to run
@@ -1773,8 +1786,9 @@ static enum scan_result collapse_scan_anon(struct vm_area_struct *vma,
 	return result;
 }
 
-static void collect_mm_slot(struct mm_slot *slot)
+static void collect_mm_slot(struct khugepaged_mm_slot *mm_slot)
 {
+	struct mm_slot *slot = &mm_slot->slot;
 	struct mm_struct *mm = slot->mm;
 
 	lockdep_assert_held(&khugepaged_mm_lock);
@@ -1790,7 +1804,7 @@ static void collect_mm_slot(struct mm_slot *slot)
 		 */
 
 		/* khugepaged_mm_lock actually not necessary for the below */
-		mm_slot_free(mm_slot_cache, slot);
+		mm_slot_free(mm_slot_cache, mm_slot);
 		mmdrop(mm);
 	}
 }
@@ -2891,6 +2905,7 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
 	__acquires(&khugepaged_mm_lock)
 {
 	struct vma_iterator vmi;
+	struct khugepaged_mm_slot *mm_slot;
 	struct mm_slot *slot;
 	struct mm_struct *mm;
 	struct vm_area_struct *vma;
@@ -2900,12 +2915,14 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
 	*result = SCAN_FAIL;
 
 	if (khugepaged_scan.mm_slot) {
-		slot = khugepaged_scan.mm_slot;
+		mm_slot = khugepaged_scan.mm_slot;
+		slot = &mm_slot->slot;
 	} else {
 		slot = list_first_entry(&khugepaged_scan.mm_head,
 				     struct mm_slot, mm_node);
+		mm_slot = mm_slot_entry(slot, struct khugepaged_mm_slot, slot);
 		khugepaged_scan.address = 0;
-		khugepaged_scan.mm_slot = slot;
+		khugepaged_scan.mm_slot = mm_slot;
 	}
 	spin_unlock(&khugepaged_mm_lock);
 
@@ -2981,7 +2998,7 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
 breakouterloop_mmap_lock:
 
 	spin_lock(&khugepaged_mm_lock);
-	VM_BUG_ON(khugepaged_scan.mm_slot != slot);
+	VM_BUG_ON(khugepaged_scan.mm_slot != mm_slot);
 	/*
 	 * Release the current mm_slot if this mm is about to die, or
 	 * if we scanned all vmas of this mm, or THP got disabled.
@@ -2993,14 +3010,16 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
 		 * mm_slot not pointing to the exiting mm.
 		 */
 		if (!list_is_last(&slot->mm_node, &khugepaged_scan.mm_head)) {
-			khugepaged_scan.mm_slot = list_next_entry(slot, mm_node);
+			slot = list_next_entry(slot, mm_node);
+			khugepaged_scan.mm_slot =
+				mm_slot_entry(slot, struct khugepaged_mm_slot, slot);
 			khugepaged_scan.address = 0;
 		} else {
 			khugepaged_scan.mm_slot = NULL;
 			khugepaged_full_scans++;
 		}
 
-		collect_mm_slot(slot);
+		collect_mm_slot(mm_slot);
 	}
 
 	trace_mm_khugepaged_scan(mm, cc->progress - progress_prev,
@@ -3090,7 +3109,7 @@ static void khugepaged_wait_work(void)
 
 static int khugepaged(void *none)
 {
-	struct mm_slot *slot;
+	struct khugepaged_mm_slot *mm_slot;
 
 	set_freezable();
 	set_user_nice(current, MAX_NICE);
@@ -3101,10 +3120,10 @@ static int khugepaged(void *none)
 	}
 
 	spin_lock(&khugepaged_mm_lock);
-	slot = khugepaged_scan.mm_slot;
+	mm_slot = khugepaged_scan.mm_slot;
 	khugepaged_scan.mm_slot = NULL;
-	if (slot)
-		collect_mm_slot(slot);
+	if (mm_slot)
+		collect_mm_slot(mm_slot);
 	spin_unlock(&khugepaged_mm_lock);
 	return 0;
 }

-- 
2.56.0

