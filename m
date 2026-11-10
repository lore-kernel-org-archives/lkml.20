Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794331171;
	b=CjCNclD/fKGoARm1URgqsW8znYU3DMQ+8g2X5LLFXpcOJUr3PHxXtHyJArcimUs7pXvv
	 CucnfiX9DRjcBR734ATvxnliUx0F8DAkqL5kbKYgsTcoBqoCemtkkAzVG1VKoDaoIBbcp
	 tU4OCcl3mLrG8wu9J1xRdhECYWCPr+llzU0OJMxvl8wB+cw9eEprmZxlqU5hSj77LjzFC
	 ZGdRA4yfiRVw1hb5H3Rulf21G/G/6F16NjQf8v6O1fGoT+3CGISxYaiLDvYiSFy/Ewqfa
	 4G85eirs+SXyhZ9TbcKDHhtpPSTr8lm8XsJ2RM3kG2f9Ik2u3UZqDtaQi50YpBlbQXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794331171;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=HyJSAOI5cV0OZGbq6jv4rygFqgWHpSF5mbAAv1LcAlc=;
	b=wibzE4blPFcntUW5Ty61t8ypcL73kkQKb7oZYHBK5iUhdGyxSnq2LOwcr8dh7YROd9yH
	 2rz4GsE3tPOJdsk2LYhWV17tM0nbgbYBa3Onnb4KW2LWdxraK0/u+rKn4ErC4nGWra+pC
	 97DYGB8JYQUVu1jcqH1279Bl6ehKhW3jrjyCw9Q+9ZLAbnmYj2Z0KOBYrxirsGxvSsxsv
	 TiMIAURVlEi/PbGy7fRc+XvK3JUaMimFxCTnQaQtWy4eEgfdZ+kafKmGiBPUW8TKNJf9F
	 PZypCpFI/xLIbPUf3U5yJLfST8DQCTlBN0sjNU6Qg+Cmu3j0rWnWfj/oG3meySW5x5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WUqKp8IB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FFE606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WUqKp8IB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98AF61F008A1;
	Tue, 10 Nov 2026 17:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794331170;
	bh=HyJSAOI5cV0OZGbq6jv4rygFqgWHpSF5mbAAv1LcAlc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=WUqKp8IBFer85bnNOk/GOLP5YcXGtPvGoq98qr8JaB/oDyynxkHd2pe1tBBXiBjfz
	 mQddxWnP0TI4X4nUiclpz7v0TFphw89j+dwn/6S9ckj2voxSViM/4FSEOXE/KgsqHO
	 Q+kIQyQGpuaCDnO9WJ4vtHeNujAZEkBxYjVlsHZU2LI0BJUT0Twlp4+JsfDRYffJCx
	 kSvDQtekguoO+a/kblY4CuM2gOOdqJb8q8f3gZ9gL/YDSdHuXWi6/2PdgIQFJ3WgLQ
	 V3rc2NuONIKym2WThsgXPEvWLCRNSW6mn60Ye9pczhk4O7rkS5sISbQ48vFYcQYziK
	 yFE70+yOv/Bgg==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Tue, 10 Nov 2026 17:19:12 +0000
Subject: [PATCH v3 2/3] mm/khugepaged: scan mm's more efficiently under
 mmap_lock contention
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
Message-Id: <20261110-khugepaged-latency-fix-v3-2-6eea743cf9a3@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6746; i=ljs@kernel.org;
 h=from:subject:message-id; bh=/+O/N71sBontPdzFFvWWsWrpO/LB8NaZnq+rO9eNFgk=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLI+B4nKv+DmPJn/KTWww2l1qumRcNNPnw6eNnGUWJHD8
 0NNP7m7o5SFQYyLQVZMkeX5F/H9QSJh8zov+LvBzGFlAhnCwMUpABNRXcfIMGeVwsHiE6unl/UL
 Zk1kuzW1OqpVU/C53d9FCvlyGvGZsgz/vaoulRba/t/9KfVvx4a/bPYSDPu+6R+7yb+9nv3Nv/0
 TWQE=
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14

khugepaged scans VMAs in collapse_scan_mm_slot() in the same mm until it is
about to be torn down, prctl(PR_SET_THP_DISABLE) disables THP for it,
mm->mmap_lock contention occurs, or all its VMAs have been scanned.

When lock contention causes the function to bail out, khugepaged doesn't
keep track of where it left off, so when the mm is next scanned, it starts
from address 0 again.

If there's a lot of mmap_lock contention this can significantly slow down
collapse later in the mm, since the /sys/.../pages_to_scan budget can run
out before the end of the mm is reached.

The budget is incremented (as tracked in cc->progress) at a rate of 1 page
per ineligible VMA, but the budget is only checked once eligible VMAs are
encountered.

Then, it only takes the combined total of ineligible VMAs and eligible but
non-collapsible pages to exceed the /sys/.../pages_to_scan budget for the
rest of the mm to be skipped.

For a system with 4 KiB page size and default sysctl settings this only
requires 4096 ineligible VMAs/uncollapsible pages to be skipped before this
happens.

Resolve the issue by simply tracking the last examined address in the
khugepaged_mm_slot object, so when the mm is resumed, the scan starts from
where it left off.

Additionally, skip to the next candidate if a VMA cannot be collapsed.

This issue was noticed during some work in which an mm was instantiated
with a large number of small VMAs under significant mmap_lock contention,
during which collapse was observed to take 10.8s. With this patch applied
it took 3.6s to collapse the same mm.

Also, while here, update a couple VM_BUG_ON()'s to VM_WARN_ON_ONCE()'s.

This patch is also a prerequisite for the next patch in the series.

Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 mm/khugepaged.c | 46 ++++++++++++++++++++++++++++------------------
 1 file changed, 28 insertions(+), 18 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index aad8797f8d5a..7d1414a9b2a5 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -69,23 +69,23 @@ static struct kmem_cache *mm_slot_cache __ro_after_init;
 /**
  * struct khugepaged_mm_slot - khugepaged information per mm that is being scanned
  * @slot: hash lookup from mm to mm_slot
+ * @address: the next address inside that to be scanned
  */
 struct khugepaged_mm_slot {
 	struct mm_slot slot;
+	unsigned long address;
 };
 
 /**
  * struct khugepaged_scan - cursor for scanning
  * @mm_head: the head of the mm list to scan
  * @mm_slot: the current mm_slot we are scanning
- * @address: the next address inside that to be scanned
  *
  * There is only the one khugepaged_scan instance of this cursor structure.
  */
 struct khugepaged_scan {
 	struct list_head mm_head;
 	struct khugepaged_mm_slot *mm_slot;
-	unsigned long address;
 };
 
 static struct khugepaged_scan khugepaged_scan = {
@@ -2921,7 +2921,6 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
 		slot = list_first_entry(&khugepaged_scan.mm_head,
 				     struct mm_slot, mm_node);
 		mm_slot = mm_slot_entry(slot, struct khugepaged_mm_slot, slot);
-		khugepaged_scan.address = 0;
 		khugepaged_scan.mm_slot = mm_slot;
 	}
 	spin_unlock(&khugepaged_mm_lock);
@@ -2939,7 +2938,7 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
 	if (unlikely(collapse_test_exit_or_disable(mm)))
 		goto breakouterloop;
 
-	vma_iter_init(&vmi, mm, khugepaged_scan.address);
+	vma_iter_init(&vmi, mm, mm_slot->address);
 	for_each_vma(vmi, vma) {
 		unsigned long hstart, hend;
 
@@ -2948,38 +2947,46 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
 			cc->progress++;
 			break;
 		}
-		if (!collapse_possible_orders(vma, vma->vm_flags,
-					      TVA_KHUGEPAGED)) {
+		if (!collapse_possible_orders(vma, vma->vm_flags, TVA_KHUGEPAGED)) {
+			const unsigned long next =
+				ALIGN(vma->vm_end, HPAGE_PMD_SIZE);
+
 			cc->progress++;
+			/* Check for overflow. */
+			if (unlikely(next < vma->vm_end)) {
+				vma = NULL;
+				break;
+			}
+			/* Unable to collapse, skip to the next candidate. */
+			mm_slot->address = next;
 			continue;
 		}
 		hstart = ALIGN(vma->vm_start, HPAGE_PMD_SIZE);
 		hend = ALIGN_DOWN(vma->vm_end, HPAGE_PMD_SIZE);
-		if (khugepaged_scan.address > hend) {
+		if (mm_slot->address > hend) {
 			cc->progress++;
 			continue;
 		}
-		if (khugepaged_scan.address < hstart)
-			khugepaged_scan.address = hstart;
-		VM_BUG_ON(khugepaged_scan.address & ~HPAGE_PMD_MASK);
+		if (mm_slot->address < hstart)
+			mm_slot->address = hstart;
+		VM_WARN_ON_ONCE(mm_slot->address & ~HPAGE_PMD_MASK);
 
-		while (khugepaged_scan.address < hend) {
+		while (mm_slot->address < hend) {
 			bool lock_dropped = false;
 
 			cond_resched();
 			if (unlikely(collapse_test_exit_or_disable(mm)))
 				goto breakouterloop;
 
-			VM_WARN_ON_ONCE(khugepaged_scan.address < hstart ||
-				  khugepaged_scan.address + HPAGE_PMD_SIZE >
-				  hend);
+			VM_WARN_ON_ONCE(mm_slot->address < hstart ||
+					mm_slot->address + HPAGE_PMD_SIZE > hend);
 
-			*result = collapse_single_pmd(khugepaged_scan.address,
+			*result = collapse_single_pmd(mm_slot->address,
 						      vma, &lock_dropped, cc);
 			if (*result == SCAN_SUCCEED)
 				khugepaged_pages_collapsed++;
 			/* move to next address */
-			khugepaged_scan.address += HPAGE_PMD_SIZE;
+			mm_slot->address += HPAGE_PMD_SIZE;
 			if (lock_dropped)
 				/*
 				 * We released mmap_lock so break loop.  Note
@@ -2993,12 +3000,16 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
 				goto breakouterloop;
 		}
 	}
+	/* Every VMA has been examined, so reset. */
+	if (!vma)
+		mm_slot->address = 0;
+
 breakouterloop:
 	mmap_read_unlock(mm); /* exit_mmap will destroy ptes after this */
 breakouterloop_mmap_lock:
 
 	spin_lock(&khugepaged_mm_lock);
-	VM_BUG_ON(khugepaged_scan.mm_slot != mm_slot);
+	VM_WARN_ON_ONCE(khugepaged_scan.mm_slot != mm_slot);
 	/*
 	 * Release the current mm_slot if this mm is about to die, or
 	 * if we scanned all vmas of this mm, or THP got disabled.
@@ -3013,7 +3024,6 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
 			slot = list_next_entry(slot, mm_node);
 			khugepaged_scan.mm_slot =
 				mm_slot_entry(slot, struct khugepaged_mm_slot, slot);
-			khugepaged_scan.address = 0;
 		} else {
 			khugepaged_scan.mm_slot = NULL;
 			khugepaged_full_scans++;

-- 
2.56.0

