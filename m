Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794331166;
	b=idS3xJ/B+ASzrYi6LiCeUwHmGr09KWzWy+ZvzoQV7zRzQhFuV0bDaHN/ISP44Pd7V/Da
	 Dt099DYzV6YmW8MYQLK04Nla4S3xw58fKaDppB4R0i66VPVhq4DF4HZ6T3JBjF1ro5qgP
	 vU73GgZ14HHaXHvfkjmvHGe/68fP3SfOb70K5d5BOyISWXd2DxhJ+BYGPmW44nhYi/Sqz
	 /BfJNzchN8DiWc7W8smpqyRfg4E7++kk/siRPzsJ5Ze4R7I3G7w3dTltw79/z0li6OOoY
	 QXQ6baJxn2vVfo8ecnO6NDScIRsK5y9+5A5CxvBTPZrFRbT8xQ6Dl0LJNw4T7fbZDCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794331166;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Q08LJgBXqC70Kqo0f8ZLQKUivwcGqkAeqrOIIemSoaw=;
	b=wIlS7cFQbCzJjz0kyY1qQPH0NYg0HMoRLVuMJuMXhnaCGATgPRAygXMNGg7m8ZLpb2RG
	 iHtq9zkpepCesLHnnLDKyj5dWvYy9jjaekUjfNWpr3rF7tQiiSbJTNQf86j3LfeXcrGdH
	 Wc93bz55vEVHiBZ4CnwJvgnY+GMU221FTgKQl+biTcWJWSPmdjetQ87QwNPd30FNT4oOA
	 Rl1yjQVhvPw096R+dcS8JU/vbdPL3ktY8ZYUX1wbsshOjwdGaqWeh1wTXgE3FRQl0Pzy8
	 clORfiOv++pPa/fVpU3rFFxk2u15mBzu5fLotL34OJayzRGaFi0p9QnldLIMihtSzjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="lgJA/pqD";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80210606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lgJA/pqD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E4F51F0089F;
	Tue, 10 Nov 2026 17:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794331166;
	bh=Q08LJgBXqC70Kqo0f8ZLQKUivwcGqkAeqrOIIemSoaw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lgJA/pqDt9ZXlQMB1lpweF4fOIjhAzvoQvaSENR1T918mJzYbS99/E+N+41gGzUee
	 /iMs1AedXwbAcNbaw5P59wOxnX7RN8qus55EB/UOIXZIYUQPTAEdZ3Ir2PfTGJVV56
	 qCcA+sz5pEFu0ijD3jwNCDajjm/fS0U8G/LW4AjzItVnOricy985GkzN48v/duEmBq
	 GzZ/W9y3VAkOYHLulVAgb+ahSFuU2xhFeQH1zF7HUlE7zSulE1cDIkfRNKp5lHZQt+
	 +sgCrDeCIafN/akMXdSL+Ibtm+hYj2quYExWcY5QwZKnLmD0Xi0vHlvyNkRMg0HekF
	 DrR39lPXZJkQA==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Tue, 10 Nov 2026 17:19:11 +0000
Subject: [PATCH v3 1/3] Revert "mm/khugepaged: remove definition of struct
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
Message-Id: <20261110-khugepaged-latency-fix-v3-1-6eea743cf9a3@kernel.org>
References: <20261110-khugepaged-latency-fix-v3-0-6eea743cf9a3@kernel.org>
In-Reply-To: <20261110-khugepaged-latency-fix-v3-0-6eea743cf9a3@kernel.org>
To: David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, 
 "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7074; i=ljs@kernel.org;
 h=from:subject:message-id; bh=0UZEhupM8Hvng7+lLXwSgnWUGWUT6iuTlrA4ZmSC5gc=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLI+B4lW9PUemae/3M5kX6/S3sdbk/U3Mc1/qW+7M+EZ+
 0ZuXY+AjlIWBjEuBlkxRZbnX8T3B4mEzeu84O8GM4eVCWQIAxenAExEgoHhr+jlvISzX047vwrn
 41Mqez915bnNCkYsG1bydtgdW13vtYzhr4ykjtuh5PcbbokVzPAOrc872tbfkh/5Z+LTa0qJj15
 psgAA
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
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
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

