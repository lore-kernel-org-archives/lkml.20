Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332704A92DA
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789551145; cv=none; b=N9vvgcp7RPbPXXnLQQ4/KKRpRNgx3aFs38PS9423zbIGTd1I+eP9NHrNcw2C7gqnK3BF+AFUxDnfq8hFS46/pcObNZodWmGSEa/IkToJNRhufcGhGBiCJWWnfHgxwUVU8+rszW1K/4+WRT4KpkJTKYLkxSsNhILUVtk39bvo6Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789551145; c=relaxed/simple;
	bh=xPfHrLAIT8TrgLbrZTJBVNz5G3dEyFo5cSFn4PiWwQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q87roTyg2Tnl5oTIJ1Z0VkPX8SNZBUL8WiECNLvYBsLBtkIgMQIAF3eUjvoBOTBM2k4yRUEWlECSoE40tpWIqa/iQwl6tUjSdFCU6yXnlcHAQLNsR50ywjjSF2bhAOKjkj3njo/m7B2iR4n3mjZo5zxjgfAqBr5KkQkHmSqBTDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=MLVZXFX/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YfyXnvTX; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="MLVZXFX/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YfyXnvTX"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 32B7E1D000CC;
	Wed, 16 Sep 2026 05:32:11 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 16 Sep 2026 05:32:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789551131; x=
	1789637531; bh=VZjknc0p/C+R8pDyx3LdCEi2GInRJhvEJIZP2SLKlcM=; b=M
	LVZXFX/Kuiq8X+YYRcBc1YBWna6pgosUG0gRELvtrMeG4CO36/1bvwg+iiqfFAFS
	hPcJEKcA+snrhq9XvC0wfl44NLIo7scVEQaFjkPI1/+JTzfHJlt3LX3phHIid5/z
	p2KXrmIh2v/MaRVFhmSUJIxlw4pVmL+z22MtSlEmd/uzMPKdKHcKL0TOAR8EmuqX
	0Q2NpculsEpXyz1SMKmcn1kou3ZOxyZRTwFWOBoi5ANwEnxwFI9+T35Q64Uoj/rL
	ui5EgW4PiI7q5MRfiHel0Pa3fqY+n6JTI+QKrXHnJB23dsUie3YIbZgZEdvodPn8
	KmDCLf7GMo/94+LGeZCVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789551131; x=1789637531; bh=V
	Zjknc0p/C+R8pDyx3LdCEi2GInRJhvEJIZP2SLKlcM=; b=YfyXnvTXHaUXnUrgK
	4/wBUAY/sbRU7rqY+kBe1JI9doG6Pc17SNzv7jRsctmAhlzr8DDyJgZaGB/kkJOP
	k+vbETcwY9iXFRsC+TNoVBJvyecHVHF54y/QqZogIlVWnULb5vpRP15zMhSt6FmL
	5pdRbK5iPSdX0gT//6MJu63l9EKEyVZTKk4tzofoN02iygwbfIza9/zY9AiPeXRX
	4cVh2+7H6w//Z/gpvZ3t5CsF6Z841t5GNANqfMZ/fwulDkj0nJpepcQjUlD69RcT
	/VNyYA8A6qZcltcJAlfGzdsx5eIcWMKDcSYsuMYZHKsrZFNDKZA6xEWqbfWqkeiD
	vaRhQ==
X-ME-Sender: <xms:GmKqam0Tk5dNLBxuCfh5NzN1yHkuvy6LNp4DlzwS4UsItCrXq0Th0Q>
    <xme:GmKqalDy02Rcf2XqP6FOElR5WPBLbwkhYZv_o8Pqqkzob6nTjVce14dNe3rXdAYO0
    AvmsA-_DHsN_7xxbeYG-YwmVdoNQrVY2gO3xuAuPYGZH9Kh0Wr9QegC>
X-ME-Received: <xmr:GmKqalCok96vdfStz8Fb45zbiUy68qfiXmh-M8fnNrwHtrwku2D0aHIjrzA>
X-ME-Proxy-Cause: dmFkZTE31qL+uaIHQKQPvpaICSxxs7QGWvIquuW8cKaqYQWKvt9pKCqy5bgk//TApl3wTl
    ad4FQSRAknjhMkzVuMAZNh0T12ywqROLvU4AnUXGVwd2kiN78Ar+1NR+fesCkATu1LALh1
    4LvX/9qk4pAfO725ECjoAkI82P3z755hZxEkAV0An15e7Wr2vIbgLFM815SfkNmTU/eBmL
    ORNXO2IPaHkpkCtL9iOfg4dR3lpAdl3Xvq/Y35opAbs/zzbuDBIkBs44NTO3w5x5Bedurt
    thFl4kzzMjhv7UlAxOBz4vPRXQMYZm6skstaNA0N2ZkZEKrpjBUX5624wA8G4zEpHd89m6
    KXTYej14sW09tJrBdAp3d4HB9MXT4L4MezAAL6IbBLYswZE69EF55PCj8RxbWAkwuyzzG6
    3eV3kRyv9ioa9frL1lMv2Ig9L6oSX+iS1yh3YdrC2oa5iC9wBbBDQVHOkoQLRVhwwYSF9y
    BaXPplCt7AbFeRMIlUi0FkKnU0DzXNVabvq761FK2+hCChs4TzseTw2OmNJJmyl9uou8TD
    41QD65UoEfBiXN3u3JWlvwJ03m9GGUEgFEMAvlEsNYVcGulTcZyg/mLPwqd+pY5wdumqrw
    1EhPEiEiI9haXtlPLWdC/ZEmT5if8erQK6qCtu861Z8aH3oXaHHcCuejQe4A
X-ME-Proxy: <xmx:GmKqauNifBrek_ZY7LrYgJmW9qlZe5n5Cdj7F8PUdwCEA9dfzO7NgA>
    <xmx:GmKqanO_0RcCQ-Vm61_T91HzmzDweYVlm685UHbI3RAMNsaLhzzFkg>
    <xmx:GmKqaqtxfGsoD7p--oMtZnfA4mkhhMzT5b0Wt426IcwkD5zkd6TN3w>
    <xmx:GmKqak8nX_ApM2n_NkyHmQCt8EUdem6gSq09QSylaaP4oPdYzxyXeQ>
    <xmx:G2Kqal2afISyidU-kcTDriSWsbkYxotMorm48qfr7vvBurOdtj-wqgQB>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Sep 2026 05:32:10 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	"Liam R. Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>
Subject: [PATCH v3 09/12] mm/collapse: open-code collapse_single_pmd() in its two callers
Date: Wed, 16 Sep 2026 10:31:36 +0100
Message-ID: <20260916093145.4022188-10-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916093145.4022188-1-kirill@shutemov.name>
References: <20260916093145.4022188-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

collapse_scan_pmd() and collapse_run_pmd() each have a clear locking
contract.  The scan is called with mmap_lock held for reading and returns
with it still held.  The collapse is called without it.

collapse_single_pmd() kept that boundary inside itself.  It dropped the
lock on some paths and not others, and reported which by way of a bool its
callers had to carry along and then act on.

Open-code it in the two callers.  Each scans under the lock it already
holds and, when the scan found work, gives the lock up before running the
collapse.
khugepaged's lock_dropped and madvise_collapse()'s mmap_unlocked both go:
the code dropping the lock is now the code that wanted to know.

khugepaged's walk carries on to the next table while the scan keeps
refusing, and ends once a collapse has taken the lock from under it.
madvise_collapse() re-finds its VMA after a collapse, which it did before,
and now uses a NULL vma to say that it has to.  It still reports the drop
to its own caller, from the line that does it.

The lock is given up and taken again at the same points as before.  No
functional change.

Assisted-by: LLM
Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/khugepaged.c | 103 +++++++++++++++++++++++-------------------------
 1 file changed, 50 insertions(+), 53 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index b6fc2c78e3e2..9e6b2af6519e 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2846,28 +2846,6 @@ static enum scan_result collapse_run_pmd(struct mm_struct *mm,
 	return result;
 }
 
-/*
- * Try to collapse a single PMD starting at a PMD aligned addr, and return
- * the results.
- */
-static enum scan_result collapse_single_pmd(unsigned long addr,
-		struct vm_area_struct *vma, bool *lock_dropped,
-		struct collapse_control *cc)
-{
-	struct mm_struct *mm = vma->vm_mm;
-	enum scan_result result;
-
-	result = collapse_scan_pmd(vma, addr, cc);
-	if (result != SCAN_SUCCEED && result != SCAN_PTE_MAPPED_HUGEPAGE)
-		return result;
-
-	/* The collapse takes its own locks, so give this up */
-	mmap_read_unlock(mm);
-	*lock_dropped = true;
-
-	return collapse_run_pmd(mm, addr, result, cc);
-}
-
 static void collapse_scan_mm_slot(unsigned int progress_max,
 		enum scan_result *result, struct collapse_control *cc)
 	__releases(&khugepaged_mm_lock)
@@ -2930,7 +2908,7 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
 		VM_BUG_ON(khugepaged_scan.address & ~HPAGE_PMD_MASK);
 
 		while (khugepaged_scan.address < hend) {
-			bool lock_dropped = false;
+			unsigned long addr;
 
 			cond_resched();
 			if (unlikely(collapse_test_exit_or_disable(mm)))
@@ -2940,23 +2918,30 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
 				  khugepaged_scan.address + HPAGE_PMD_SIZE >
 				  hend);
 
-			*result = collapse_single_pmd(khugepaged_scan.address,
-						      vma, &lock_dropped, cc);
-			if (*result == SCAN_SUCCEED)
-				khugepaged_pages_collapsed++;
+			addr = khugepaged_scan.address;
 			/* move to next address */
 			khugepaged_scan.address += HPAGE_PMD_SIZE;
-			if (lock_dropped)
-				/*
-				 * We released mmap_lock so break loop.  Note
-				 * that we drop mmap_lock before all hugepage
-				 * allocations, so if allocation fails, we are
-				 * guaranteed to break here and report the
-				 * correct result back to caller.
-				 */
-				goto breakouterloop_mmap_lock;
-			if (cc->progress >= progress_max)
-				goto breakouterloop;
+
+			*result = collapse_scan_pmd(vma, addr, cc);
+			/* Nothing to do here, and the lock is still ours */
+			if (*result != SCAN_SUCCEED &&
+			    *result != SCAN_PTE_MAPPED_HUGEPAGE) {
+				if (cc->progress >= progress_max)
+					goto breakouterloop;
+				continue;
+			}
+
+			/*
+			 * A collapse takes its own locks and is slow enough
+			 * that a writer should not wait behind it, so give the
+			 * lock up.  That ends this walk: vma and the mm are
+			 * whatever the collapse leaves them.
+			 */
+			mmap_read_unlock(mm);
+			*result = collapse_run_pmd(mm, addr, *result, cc);
+			if (*result == SCAN_SUCCEED)
+				khugepaged_pages_collapsed++;
+			goto breakouterloop_mmap_lock;
 		}
 	}
 breakouterloop:
@@ -3225,7 +3210,6 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
 	unsigned long hstart, hend, addr;
 	enum scan_result last_fail = SCAN_FAIL;
 	int thps = 0;
-	bool mmap_unlocked = false;
 
 	BUG_ON(vma->vm_start > start);
 	BUG_ON(vma->vm_end < end);
@@ -3248,25 +3232,40 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
 	lru_add_drain_all();
 
 	for (addr = hstart; addr < hend; addr += HPAGE_PMD_SIZE) {
-		enum scan_result result = SCAN_FAIL;
+		struct vm_area_struct *found;
+		enum scan_result result;
 
-		if (mmap_unlocked) {
+		/*
+		 * A collapse gives the lock up, so the VMA has to be found
+		 * again after one: it can shrink while nothing is held.  A scan
+		 * that finds nothing to collapse leaves the lock alone, so a
+		 * range that is already collapsed walks on without relocking.
+		 */
+		if (!vma) {
 			cond_resched();
 			mmap_read_lock(mm);
-			mmap_unlocked = false;
-			*lock_dropped = true;
-			result = hugepage_vma_revalidate(mm, addr, false, &vma,
+			result = hugepage_vma_revalidate(mm, addr, false, &found,
 							 cc, HPAGE_PMD_ORDER);
 			if (result != SCAN_SUCCEED) {
 				last_fail = result;
-				goto out_nolock;
+				goto out_locked;
 			}
-
+			vma = found;
 			hend = min(hend, vma->vm_end & HPAGE_PMD_MASK);
 		}
 
-		result = collapse_single_pmd(addr, vma, &mmap_unlocked, cc);
+		result = collapse_scan_pmd(vma, addr, cc);
+		/* Nothing to do here, and the lock is still ours */
+		if (result != SCAN_SUCCEED && result != SCAN_PTE_MAPPED_HUGEPAGE)
+			goto tally;
 
+		/* The collapse takes its own locks, so give this up */
+		mmap_read_unlock(mm);
+		*lock_dropped = true;
+		vma = NULL;
+
+		result = collapse_run_pmd(mm, addr, result, cc);
+tally:
 		switch (result) {
 		case SCAN_SUCCEED:
 		case SCAN_PMD_MAPPED:
@@ -3288,17 +3287,15 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
 		default:
 			last_fail = result;
 			/* Other error, exit */
-			goto out_maybelock;
+			goto out;
 		}
 	}
 
-out_maybelock:
+out:
 	/* Caller expects us to hold mmap_lock on return */
-	if (mmap_unlocked) {
-		*lock_dropped = true;
+	if (!vma)
 		mmap_read_lock(mm);
-	}
-out_nolock:
+out_locked:
 	mmap_assert_locked(mm);
 	collapse_control_release(cc);
 	kfree(cc);
-- 
2.54.0

