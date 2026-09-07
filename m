Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B255221EC
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 18:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788804736; cv=none; b=KyIjqo2cVQqvdOQy563xQ66oioXo5sgo2+vPICvbfSbCWXpgU7aWcDWAdh8ZW+nbW02qyuJZsvjTVzYr+OC5NOQOUY2JkxQk8YGt6biVZRn/laEcospbuw6NCzHu7Y6NxlwxwP4fovbkFwv7TKlyOJ0YlAKEmpmTfviLSny4yKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788804736; c=relaxed/simple;
	bh=QzcJczxkbeS/pYSsNT+urBdCyxcTnTUrjYdSKS5ReGQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TuRNVAPE2gvtibSP+loM/KtaDTX7ShPGR40kOxCeyCczIF66Ecrlgody0v6/0JismA79GqQbl7OsyJUSAVgsiQer6hEr4KaCWjJTXvh0TZeL8R2Dnus9uYQ2mAmSJb7K63ag4/P1dOhTKKLKCo3xYzsXsgFHQRoa7EUIsbOLzGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GrH6PCaS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GrH6PCaS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97E80C2BCF4;
	Mon,  7 Sep 2026 18:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788804736;
	bh=QzcJczxkbeS/pYSsNT+urBdCyxcTnTUrjYdSKS5ReGQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GrH6PCaSr7eVHHhyAc1BrCz4vC5zPKbA+SVWkejlnaxAQ4Pmefnt/eYadIGekki4Y
	 jTOmh4YK9Hb44wQGrgWC/QTAG6ssEpyieMDqb8unw0yOIZ0DmPNIDFeLiQdK6CX2vf
	 rMI9XOjrfQVC6WH6jo1oRFcduA301t0xyJFeV+enYj8wCQf2t4GtI7fj3RomDdR4l+
	 hJfYhcF8hT85J62sMStQVFcUyR5cD0nfpYy9PXbmQRGYLFOudVkEi4XRCGt4AsSm+V
	 Nudy5b5AGwnlEz4tkjmUAv5haxtUQmW3E79wiN/hwD7ej2r4q97iMSXH3SDzWQOeeX
	 d9RFdpDN62C3w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E7AC79FAA;
	Mon,  7 Sep 2026 18:12:16 +0000 (UTC)
From: Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>
Date: Tue, 08 Sep 2026 02:12:14 +0800
Subject: [PATCH v4 10/17] mm/huge_memory: move the racy refcount check into
 unmap_folio()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-swap-thp-cleanup-v4-10-b532a3f20e71@tencent.com>
References: <20260908-swap-thp-cleanup-v4-0-b532a3f20e71@tencent.com>
In-Reply-To: <20260908-swap-thp-cleanup-v4-0-b532a3f20e71@tencent.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Chris Li <chrisl@kernel.org>, Kemeng Shi <shikemeng@huaweicloud.com>, 
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
 Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, 
 "Kiryl Shutsemau (Meta)" <kas@kernel.org>, 
 Shivam Kalra <shivamkalra98@zohomail.in>, Kairui Song <kasong@tencent.com>, 
 Kairui Song <ryncsn@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788804732; l=3389;
 i=kasong@tencent.com; s=kasong-sign-tencent; h=from:subject:message-id;
 bh=NMmN0XNDJPzBYycE2fNg4sNy5B1+ud2QzkGI09EF/lM=;
 b=fDzQ+/qHyyE6OEBlwE+wQ4At5JOIzVAH+4OeBbdSkKrh7F9ey4Pcr6VwmnzyOnG30XZ/YNtz1
 NBVuhaXTnJ/D43G85EoyuROTa9DltenBkGsdyrBvOcY5stu/a3ARKoC
X-Developer-Key: i=kasong@tencent.com; a=ed25519;
 pk=kCdoBuwrYph+KrkJnrr7Sm1pwwhGDdZKcKrqiK8Y1mI=
X-Endpoint-Received: by B4 Relay for kasong@tencent.com/kasong-sign-tencent
 with auth_id=562
X-Original-From: Kairui Song <kasong@tencent.com>
Reply-To: kasong@tencent.com

From: Kairui Song <kasong@tencent.com>

The check only exists to avoid the expensive PMD-splitting unmap of a
folio that cannot be split anyway.  Move it from __folio_split() into
unmap_folio(), right before the PMD split, so both the anon and file
split helpers get the early check without repeating it.

unmap_folio() now returns -EAGAIN if the check fails and the split
helpers propagate the error.  folio_split_unmapped() drops its own
copy of the check: it works on already unmapped folios and the
definitive folio_ref_freeze() in __folio_freeze_split_anon() still
catches unexpected references.

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/huge_memory.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index c5279c0d0e59..17bd2c053210 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3538,13 +3538,17 @@ void vma_adjust_trans_huge(struct vm_area_struct *vma,
 		split_huge_pmd_if_needed(next, end);
 }
 
-static void unmap_folio(struct folio *folio)
+static int unmap_folio(struct folio *folio)
 {
 	enum ttu_flags ttu_flags = TTU_RMAP_LOCKED | TTU_SYNC |
 		TTU_BATCH_FLUSH;
 
 	VM_BUG_ON_FOLIO(!folio_test_large(folio), folio);
 
+	/* Racy check if we can split the page, before we split PMDs */
+	if (folio_expected_ref_count(folio) != folio_ref_count(folio) - 1)
+		return -EAGAIN;
+
 	if (folio_test_pmd_mappable(folio))
 		ttu_flags |= TTU_SPLIT_HUGE_PMD;
 
@@ -3559,6 +3563,8 @@ static void unmap_folio(struct folio *folio)
 		try_to_unmap(folio, ttu_flags | TTU_IGNORE_MLOCK);
 
 	try_to_unmap_flush();
+
+	return 0;
 }
 
 static bool __discard_anon_folio_pmd_locked(struct vm_area_struct *vma,
@@ -4006,7 +4012,9 @@ static int __folio_freeze_split_anon(struct folio *folio,
 
 	if (folio_mapped(folio)) {
 		need_remap = true;
-		unmap_folio(folio);
+		ret = unmap_folio(folio);
+		if (ret)
+			return ret;
 	}
 
 	local_irq_disable();
@@ -4104,7 +4112,9 @@ static int __folio_freeze_split_file(struct folio *folio,
 	if (shmem_mapping(mapping))
 		end = shmem_fallocend(mapping->host, end);
 
-	unmap_folio(folio);
+	ret = unmap_folio(folio);
+	if (ret)
+		return ret;
 
 	xas_lock_irq(xas);
 
@@ -4312,15 +4322,6 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 		i_mmap_lock_read(mapping);
 	}
 
-	/*
-	 * Racy check if we can split the page, before unmap_folio() will
-	 * split PMDs
-	 */
-	if (folio_expected_ref_count(folio) != folio_ref_count(folio) - 1) {
-		ret = -EAGAIN;
-		goto out_unlock;
-	}
-
 	if (is_anon)
 		ret = __folio_freeze_split_anon(folio, new_order, split_at,
 						true, list, split_type);
@@ -4359,7 +4360,6 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 		free_folio_and_swap_cache(new_folio);
 	}
 
-out_unlock:
 	if (anon_vma) {
 		anon_vma_unlock_write(anon_vma);
 		put_anon_vma(anon_vma);
@@ -4407,9 +4407,6 @@ int folio_split_unmapped(struct folio *folio, unsigned int new_order)
 	VM_WARN_ON_ONCE_FOLIO(!folio_test_large(folio), folio);
 	VM_WARN_ON_ONCE_FOLIO(!folio_test_anon(folio), folio);
 
-	if (folio_expected_ref_count(folio) != folio_ref_count(folio) - 1)
-		return -EAGAIN;
-
 	return __folio_freeze_split_anon(folio, new_order, &folio->page,
 					 false, NULL, SPLIT_TYPE_UNIFORM);
 }

-- 
2.55.0


