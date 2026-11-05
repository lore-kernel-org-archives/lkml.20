Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793912272;
	b=X6YZJ2WDCl0q4XtfMirn6tYXkULkmn3WGrqQAKO9GEKkk7GJFGI0ciCWrtJUSz7h1oQC
	 GBQbP7uFPfRfQtrwVDSxWfxC+UCkrVbKH10jaZBJZca2UIA+sf6xvT/tyTRUX5rkmvqPv
	 iuxfHfVIQdIieRE2SPPvzHmfD6nk9wMijy8b9rRWYpZShgLCoIASKl53iC2wdmkK0yH4j
	 HPbH0kx6Z8wxDzMhQSjgzmpzR3zQDjuUyXpEjfR0DzgjXvO32yoMzXguKdHpLb740iEEM
	 656LwUuymGv9DEyWqRCzIKYTQ4kBWsyOnu+UYvJ0n+fxHo0SPONqcdiNeb5VhYsVKBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912272;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=7xdqtRluB5cup6GxSgXqpPix6FEngw788DfFRYAFbYQ=;
	b=47jNTfgQnEPAGduGz2K+RwtL/nlEYRTvoBjsfLu/7GsIP59cOcJ3hr7Xi56Kl+2LHFGe
	 dD7X/82nDxUdwUV4oBsUFs2Th1eHV2XvIFRchG02xCyOqwjSBM6lS1l0GNO6FcMJk3Ckw
	 5u4lr1Nog5Ft56XCils/AyF9LkPVw374TvJQk2mYHOHApPcEtSPodO+E4y6XfeS7NWda5
	 +oFlEmb0+l9OjLZ4hXs3QSMoO0anMxZ2bQ3QnGEepKGJKx4hnomc8bB+67+4KxmEn1gu1
	 CZahM6TdS0jchihZyalqBNLruOKCEqSWe9kDcVybOoRR9NJAu/zu/lJOe7zMv9YmVAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LQj2IY9n;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3E4606D810
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LQj2IY9n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74F3F1F0089F;
	Thu,  5 Nov 2026 20:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793912271;
	bh=7xdqtRluB5cup6GxSgXqpPix6FEngw788DfFRYAFbYQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LQj2IY9nFKHkOEffPPb8K+DnflcDR5ZszPHu6UFORi8e716U0QBk48/uh4E6uCBEt
	 uMAtwlHbzn6NA9/Sl+pittFtC+t9OMIDdJ1XO08NYpVhs6E9BwdzSOfpAq6Ukym0e9
	 NP6bNxv29/hrPbR3qLXmXc2trCNPFAz0rNnCMbY1keGlWQaaENF7BOeDsg4ZnmBoik
	 m+mLIpuCLc8IpzZBhqEhk+GHyDBGeXH59shKfBJRbgvGn7bmawmYw6suu4crfCSfWf
	 y0FNroeQlCxN2DGv6kibMzQsTkI4m9UMWOuq6vPspGW5jX9HKlDvfrja73qUWQ+hlt
	 EWONfDc7SALcA==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Thu, 05 Nov 2026 20:57:24 +0000
Subject: [PATCH v2 3/3] mm/khugepaged: release contended mmap read lock
 after scanning enough VMAs
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
Message-Id: <20261105-khugepaged-latency-fix-v2-3-4384bbfe4606@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4235; i=ljs@kernel.org;
 h=from:subject:message-id; bh=wTj1jzVxGSI+LKIQFtrQdvwrFwZUi3YFGMYMG09Fs1g=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLLevD2oIB2c1mZ//msz+7SM5suGYQde6kyWXil4/JY4o
 03fxoabHaUsDGJcDLJiiizPv4jvDxIJm9d5wd8NZg4rE8gQBi5OAZjIbneG/3WBB1cp3L14TXpN
 yTNFebNw787vLg8fepuey85Z6qfZr8/wP2HV91N+hueELS7P25HDFaA/V5iTe9+/Z2xXsmWKhDt
 m8gIA
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14

khugepaged walks an mm's VMAs under the mmap read lock in
collapse_scan_mm_slot(), checking for ineligible VMAs first, and skipping
them if encountered.

It charges cc->progress 1 page against the /sys/.../pages_to_scan budget
when these are encountered, however only checking this budget once an
eligible PMD-spanning VMA is encountered.

It can therefore hold the mmap read lock for a long time if there are a
large number of ineligible VMAs present in an mm, over which time no mmap
write locks (and thus no VMA write locks) can be acquired.

Address this by checking whether the mmap lock is contended after every
KHUGEPAGED_MAX_VMA_SCAN_BATCH VMAs walked, that is a quarter of the
pages_to_scan budget, and if so dropping and re-acquiring the mmap read
lock before resuming the walk from the per-mm cursor.

As the walk is resumed from the cursor rather than the VMA that was current
when the lock was dropped, the cursor must never move backwards. A VMA
ending at the top of the address space causes ALIGN() to wrap the cursor to
zero, so treat such a VMA as the last in the mm rather than skipping past
it.

This was tested locally with ~1M ineligible VMAs mapped ahead of a
collapsible region of memory, and resulted in a reduced mmap_lock hold time
of 170us down from 95ms.

This was also observed to reduce mmap_lock stalls in concurrent threads of
a similar duration. Note that a reader re-acquiring the lock can currently
steal it from a writer that is queued but not yet running, so the full
benefit to writers depends on the separate rwsem change at [0].

Local measurements indicated no change for ordinary use cases, so this is
all upside.

This work came out of investigations into mmap stalls when getting latency
numbers for an unrelated patch series.

[0]: https://lore.kernel.org/all/20261105-rwsem-dont-steal-from-queued-writer-v1-1-275e070f426f@kernel.org/

Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 mm/khugepaged.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 216c4b8d28c4..eaa01dae5a03 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -66,6 +66,12 @@ static DEFINE_READ_MOSTLY_HASHTABLE(mm_slots_hash, MM_SLOTS_HASH_BITS);
 
 static struct kmem_cache *mm_slot_cache __ro_after_init;
 
+/*
+ * The number of VMAs to walk before checking for, and relieving, mmap lock
+ * contention, as a function of the pages_to_scan budget.
+ */
+#define KHUGEPAGED_MAX_VMA_SCAN_BATCH(pages_to_scan) ((pages_to_scan) / 4)
+
 /**
  * struct khugepaged_mm_slot - khugepaged information per mm that is being scanned
  * @slot: hash lookup from mm to mm_slot
@@ -2910,6 +2916,7 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
 	struct mm_struct *mm;
 	struct vm_area_struct *vma;
 	unsigned int progress_prev = cc->progress;
+	unsigned int nr_vmas_batch = 0;
 
 	lockdep_assert_held(&khugepaged_mm_lock);
 	*result = SCAN_FAIL;
@@ -2942,15 +2949,35 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
 	for_each_vma(vmi, vma) {
 		unsigned long hstart, hend;
 
+		/* Relieve mmap lock contention after walking a batch of VMAs. */
+		if (nr_vmas_batch++ >= KHUGEPAGED_MAX_VMA_SCAN_BATCH(progress_max)) {
+			nr_vmas_batch = 0;
+			if (mmap_lock_is_contended(mm)) {
+				mmap_read_unlock(mm);
+				cond_resched();
+				mmap_read_lock(mm);
+				vma_iter_set(&vmi, mm_slot->address);
+				continue;
+			}
+		}
+
 		cond_resched();
 		if (unlikely(collapse_test_exit_or_disable(mm))) {
 			cc->progress++;
 			break;
 		}
 		if (!collapse_possible_orders(vma, vma->vm_flags, TVA_KHUGEPAGED)) {
-			/* Unable to collapse, skip to the next candidate. */
-			mm_slot->address = ALIGN(vma->vm_end, HPAGE_PMD_SIZE);
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

-- 
2.56.0

