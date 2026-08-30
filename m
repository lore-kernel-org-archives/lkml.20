Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0882DFA3A
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 05:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788066853; cv=none; b=kYc1OpEs/Wo4tmOI4eST3+NVV4gVmYTltMoHWn6XiQShpiI3DlIovcA0Zw4zrvX2Eaj6qjbraXh7Ep4MrCMN+1DXhQGBc+HNv98VTS184f+8LsFJmUDG07u9QuRJPYpTmpOaeFoC61uz3enrS8wN0xY8taERTUvMqvf1OsbU3R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788066853; c=relaxed/simple;
	bh=HkCP7VGJZpo8tqbPFVRl/GGgUC8qiBQ05t6gcGsjZ+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UvcAlzCt8fx4yH0Gcn7XldpQYUe52Yn/gllwWS2Z/jcheDSxq0CGoiGPdrP3vscyf6rNCafNr1O8JzAZsOThIev4LObOyQBF2/8pIntyt/SPb7y0NHsb7u3c0P8bDVQshlnEYO0JKjGggkto/6P4WIGW21dyPi6N0GFDR0H/Vfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai; spf=pass smtp.mailfrom=crusoe.ai; dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b=iScyj66Q; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b="iScyj66Q"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc1c3d79b9bso2055307a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 22:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1788066851; x=1788671651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Qq90Jf7KadtS5HpHzOCYry3UrGmes12BSmNzbFVazM=;
        b=iScyj66QET0xUCMvPK83i8rJ3H4sZEfq7RHfA7W1Mdi6nzXjChdeeOE/xUeipZhsVD
         Qk0kWqII5Tozx2TXVyJmb48mXFd1p6elHe84WdZDRmXxpcxYJAdhL6fhXuvX8r7pUQY8
         /uH/S4kD1cATvKAo3O5P+NSaVnAG9UZWwDcCt4idt43dd9I6ZBVHXcyu3DHtasnUbL/Q
         UGp7hXH+cpl/nnu5AF0c+IlMj+UzypwUZx4LaOr5Omo6GFXNfn4Hxb3OFw2K7j4tY5fl
         YLeBgtnqC38CpCXrpGR0UlAOOcenWQlR6lOyvSPYqPdpHVn1SzDL5HnhWmdsXMTB4Res
         T2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788066851; x=1788671651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Qq90Jf7KadtS5HpHzOCYry3UrGmes12BSmNzbFVazM=;
        b=OlVGNfrAzgWdCuHhfbszcJMDUU5VMmZzt+XenOU39Eky+8jlhUHjwFNzePwmz69IZa
         eEECtin5sqy8HWsK3X42vTzCdut0/oSFPk3QtpTrfOWcXtkDAz0dV73FK+RaYVzWTRKk
         gWyeg/WMexGqsUVEjToWYSKzgKU+tIOxdaySh+fdI1OvwdjbrWQugg3dGNeQ/hFnQ9OI
         X34cXkqyrtC6a4EpGyd/zPS6S4DSOljMl4MUlOytCpLnYnDp0Qpu6wj5DxtCU2c+eBMt
         H3e6JcF39qQT6046eqHABEg9X8BaXGfsuw3o7wInX62vPSTaZLP1AMvPPjykHbERQSwB
         eCfw==
X-Forwarded-Encrypted: i=1; AHgh+Rpg8QZDTmDzOuEXL/+XLCwGf70KNOLzrEI5tebO3m5sUMQKzuTC76f4VluzdBhFbuorlgRMIAs37vfN2wM=@vger.kernel.org
X-Gm-Message-State: AFuF++kxiHN5ShNLiaEY1Ve0lp69J7BfR0HmrQR8Uvy5xRFZ3FBRp/+j
	TIA0TmgM1p1OJaGpfOB62EAbZWwBqNIm8CawdMrjXMqovvEMf06O7rjqrH3wV2HBC+g=
X-Gm-Gg: AR+sD13P2ILz8Tu9GqW4QG6fkuqXqItA4Saro2SlDLMuvLtOHXi3GyfvE1j9mod+IXt
	dTOI8OMkMO34VsLPhwviVqN5llm7ajJpB/o2d3mAMPl5swES1C1/ejWOdyVqEQTnBYvAXHWxRJE
	NPAHrRnQR6t5rHXE5l5RaLnIPXqF5hgjNeTvOq1TMhtIxJKt0FxHmUWmRY0dZaeaf98PWhJoSr+
	ih8oT6hK3HvXNPqjUo+puwwWy2kAHzfM09fQxSPyKyK1FJk00q5pq/jSFi4hbYuNB2OlTmOgRSo
	R06lFbyo+L5IVaS1ZPkXEQBieESCqHS4s5HzJObO0H/WJR+I5BIAVDrV6fGNHb2s5yP08MtzIK6
	JUPdsw50N1UESRCp3mV+ej8XdbKpf8oyIvT8Z9gedmMNByMo70IMFFTeVQGvAy1KLdHLjJ8cytO
	hjfRJ4U4pIfsYMZ9GDiT9v4cyT8dorlPQaoeYtTt3Bt4x4H/3ykEcpjpT8x1Ep2L+TAek1mULqV
	M2rx1VZPdKmHhW3bN0vUZeKk5xS7elS3IKl
X-Received: by 2002:a05:6a21:998a:b0:3c4:2b8b:e88f with SMTP id adf61e73a8af0-3d26646a960mr24213242637.5.1788066851383;
        Sat, 29 Aug 2026 22:14:11 -0700 (PDT)
Received: from MBP-Krishna-Iyer.civet-hops.ts.net ([2601:645:c68a:b830:d101:1d:112c:715e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa37fa5sm22595810eec.29.2026.08.29.22.14.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 29 Aug 2026 22:14:11 -0700 (PDT)
From: Krishna Iyer <kiyer@crusoe.ai>
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Krishna Iyer <kiyer@crusoe.ai>
Subject: [PATCH 2/6] mm/damon/ops-common: handle hugetlb folios in folio mkold/young rmap walkers
Date: Sat, 29 Aug 2026 22:14:03 -0700
Message-ID: <20260830051407.50008-3-kiyer@crusoe.ai>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260830051407.50008-1-kiyer@crusoe.ai>
References: <20260830051407.50008-1-kiyer@crusoe.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

damon_folio_mkold_one() and damon_folio_young_one() assume the folios
they walk are mapped by normal PTEs or THP PMDs.  When the folio is a
hugetlb folio, page_vma_mapped_walk() returns the huge PTE in pvmw.pte
with its page table lock held, but the walkers treat it as a normal
PTE: they read and age it with PAGE_SIZE-granularity helpers, which is
wrong for huge PTEs (up to PUD level), and notify secondary MMUs for
only PAGE_SIZE of the mapping.

Add hugetlb branches to both walkers.  The mkold walker reuses
damon_hugetlb_mkold(), which the virtual address space operations set
has been using for hugetlb aging: it clears the young bit of the huge
PTE via set_huge_pte_at() and calls mmu_notifier_clear_young() spanning
the whole huge page size.  The young walker gets an equivalent new
helper, damon_hugetlb_young(), which reads the huge PTE with
huge_ptep_get() and consults the page idle flag and
mmu_notifier_test_young() like the existing PTE branch.

Locking mirrors what page_vma_mapped_walk() provides: the huge PTE's
page table lock is held inside the walk, and for shared hugetlb
mappings (the only ones subject to huge PMD sharing), rmap_walk_file()
already holds i_mmap_rwsem, satisfying hugetlb_walk()'s locking
requirements.

This is currently dead code: both rmap walkers are only reachable
through damon_get_folio(), which rejects hugetlb folios since they are
not on the LRU lists.  A following commit will let the physical address
space monitoring primitives opt in to hugetlb folios.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Krishna Iyer <kiyer@crusoe.ai>
---
 mm/damon/ops-common.c | 63 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 52 insertions(+), 11 deletions(-)

diff --git a/mm/damon/ops-common.c b/mm/damon/ops-common.c
index f5fe92b825bb..62004206ca31 100644
--- a/mm/damon/ops-common.c
+++ b/mm/damon/ops-common.c
@@ -193,10 +193,20 @@ static bool damon_folio_mkold_one(struct folio *folio,
 
 	while (page_vma_mapped_walk(&pvmw)) {
 		addr = pvmw.address;
-		if (pvmw.pte)
-			damon_ptep_mkold(pvmw.pte, vma, addr);
-		else
+		if (pvmw.pte) {
+			/*
+			 * For hugetlb folios, page_vma_mapped_walk() sets
+			 * pvmw.pte to the huge PTE with its page table lock
+			 * held.
+			 */
+			if (folio_test_hugetlb(folio))
+				damon_hugetlb_mkold(pvmw.pte, vma->vm_mm, vma,
+						addr);
+			else
+				damon_ptep_mkold(pvmw.pte, vma, addr);
+		} else {
 			damon_pmdp_mkold(pvmw.pmd, vma, addr);
+		}
 	}
 	return true;
 }
@@ -221,6 +231,24 @@ void damon_folio_mkold(struct folio *folio)
 
 }
 
+#ifdef CONFIG_HUGETLB_PAGE
+static bool damon_hugetlb_young(pte_t *pte, struct vm_area_struct *vma,
+		unsigned long addr, struct folio *folio)
+{
+	pte_t entry = huge_ptep_get(vma->vm_mm, addr, pte);
+
+	return (pte_present(entry) && pte_young(entry)) ||
+		!folio_test_idle(folio) ||
+		mmu_notifier_test_young(vma->vm_mm, addr);
+}
+#else
+static bool damon_hugetlb_young(pte_t *pte, struct vm_area_struct *vma,
+		unsigned long addr, struct folio *folio)
+{
+	return false;
+}
+#endif	/* CONFIG_HUGETLB_PAGE */
+
 static bool damon_folio_young_one(struct folio *folio,
 		struct vm_area_struct *vma, unsigned long addr, void *arg)
 {
@@ -232,16 +260,29 @@ static bool damon_folio_young_one(struct folio *folio,
 	while (page_vma_mapped_walk(&pvmw)) {
 		addr = pvmw.address;
 		if (pvmw.pte) {
-			pte = ptep_get(pvmw.pte);
-
 			/*
-			 * PFN swap PTEs, such as device-exclusive ones, that
-			 * actually map pages are "old" from a CPU perspective.
-			 * The MMU notifier takes care of any device aspects.
+			 * For hugetlb folios, page_vma_mapped_walk() sets
+			 * pvmw.pte to the huge PTE with its page table lock
+			 * held.
 			 */
-			*accessed = (pte_present(pte) && pte_young(pte)) ||
-				!folio_test_idle(folio) ||
-				mmu_notifier_test_young(vma->vm_mm, addr);
+			if (folio_test_hugetlb(folio)) {
+				*accessed = damon_hugetlb_young(pvmw.pte, vma,
+						addr, folio);
+			} else {
+				pte = ptep_get(pvmw.pte);
+
+				/*
+				 * PFN swap PTEs, such as device-exclusive
+				 * ones, that actually map pages are "old"
+				 * from a CPU perspective. The MMU notifier
+				 * takes care of any device aspects.
+				 */
+				*accessed = (pte_present(pte) &&
+						pte_young(pte)) ||
+					!folio_test_idle(folio) ||
+					mmu_notifier_test_young(vma->vm_mm,
+							addr);
+			}
 		} else {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 			pmd_t pmd = pmdp_get(pvmw.pmd);
-- 
2.54.0

