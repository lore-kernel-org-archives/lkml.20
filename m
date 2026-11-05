Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793912268;
	b=fIUOBixjw4K78Zz+qNgsuS3JKvm0PROrjWnXCXE8oaubLAfZbgwXbXwJgSqZv3ZUjfAw
	 ORtoxzxcdVBZtY3dqdkOR46OXAGLudI5jRw9Dd9Xi9829u4/dU1fpklFfnNDtLJgliOti
	 JUjmHcx7Pykmz/wNt9Aeqv6yzrdYp8hNDyhsJVoDyiNxL36HOoVqyHbiVtyuP2Rcode8g
	 TIZ/dYLKKUtJmo+/642y6KqCgFsbqN6VQNplb0EkVxv9127Z63dPHEZsujKS9+fDuVXqH
	 NkS4Kn3HjjCnIaPbm7fk7HQO/bFHFexDa7L+hDnX6NQz3//aVuK0LceIydd4EP5mIcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912268;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=QfJg8wkFPeif1+e98mwm8oEPJ/2Ruuy8X0jDmVvrlO4=;
	b=07ptA2dl2fofHVAvtORVshuHQ0igxV/+rPfP9AR9UTC+WQlXxR3jNr7YINqbc20MnUXE
	 8inU1v5pSQ0DG6Ce+VcZgWbnUd4KzfFtkIN+iNlKjp+G+pmM8e22rLPJUnsJu//pHH03n
	 84EvjMsOL+x14R297LAoFslLdqBTFeN1BwMnt6ttwWzx1nhuNn4w9x/TFHQD/1YxZEjOK
	 ihBNZd11Yjm3iTEViuBArQtV0k7iYpBhUJyIojoZOjc86ab1zyjwDzWFdv66t2GiDVnKT
	 gC8uqGoGX0HitOiTSgfWNEJLxF31YOTAQrjKnGvWhEnxuuJAKefV7tNXWCp+ELqiIAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C9PRLCVq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CCB606D828
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C9PRLCVq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E825E1F008A6;
	Thu,  5 Nov 2026 20:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793912268;
	bh=QfJg8wkFPeif1+e98mwm8oEPJ/2Ruuy8X0jDmVvrlO4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=C9PRLCVq9Hxv5W1z4+P9L1x56gY2K2TKoPRUr4Dz6ZOCqf619N3jfuUuHtyMvHvFA
	 goEDfiaU6p5euWj6UJmvCbq4z5SGk4ERxOMd6VDt7FTHbzUrT+xxOvijkA5wxjq9v9
	 iWDYU+6GJDYitX7lZuiIsEx8qD4kVVl/vHy38T8+uaawJ4yHdgvBpmSzjDV486LT8d
	 fbJKZ1GFfRprc2cgPAGuOpsBg2aCxh4VXXwuSdJO2rf+TlGRJoP5qKfUI24RXd6+Pr
	 QD+F0AECKGGwv3w4RozSM5tLKyV7oYE4WTXQV6p/RON/z3CezGMhOT/DQX3nyVF3fv
	 /oadnkNpbiJ7Q==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Thu, 05 Nov 2026 20:57:23 +0000
Subject: [PATCH v2 2/3] mm/khugepaged: scan mm's more efficiently under
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
Message-Id: <20261105-khugepaged-latency-fix-v2-2-4384bbfe4606@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6463; i=ljs@kernel.org;
 h=from:subject:message-id; bh=majzr9fTZ+ztvtfMwTgPIbuLZbdLbln8kr4/AIX1TW4=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLLevD1YdfOA4cSSU8saCoQdj7/SkbNKqp7xIqtGOVip+
 cDidctXdJSyMIhxMciKKbI8/yK+P0gkbF7nBX83mDmsTCBDGLg4BWAiu7cwMqycLJRrE2nJaFSU
 sfdzd1i/uPB9u0de9yfKBj2IM/m/1Jvhf8qhr2EFjpo9d7wvtGwvkV4Tys/pfHVla+npuSvPb9y
 uxQIA
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
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 mm/khugepaged.c | 38 ++++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index aad8797f8d5a..216c4b8d28c4 100644
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
 
@@ -2948,38 +2947,38 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
 			cc->progress++;
 			break;
 		}
-		if (!collapse_possible_orders(vma, vma->vm_flags,
-					      TVA_KHUGEPAGED)) {
+		if (!collapse_possible_orders(vma, vma->vm_flags, TVA_KHUGEPAGED)) {
+			/* Unable to collapse, skip to the next candidate. */
+			mm_slot->address = ALIGN(vma->vm_end, HPAGE_PMD_SIZE);
 			cc->progress++;
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
@@ -2993,12 +2992,16 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
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
@@ -3013,7 +3016,6 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
 			slot = list_next_entry(slot, mm_node);
 			khugepaged_scan.mm_slot =
 				mm_slot_entry(slot, struct khugepaged_mm_slot, slot);
-			khugepaged_scan.address = 0;
 		} else {
 			khugepaged_scan.mm_slot = NULL;
 			khugepaged_full_scans++;

-- 
2.56.0

