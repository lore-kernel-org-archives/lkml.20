Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A41383993
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787942227; cv=none; b=iJY/OqyYqma4SMzY3qAmN1BP/AL/4t8sKVXQHp7TzG/X3SRKNqtkKLi/TV9ElOTbI/1NtrspFvcAsqaffKA9zChEXWKMtJ2Qz6OXwuvsi5fIfm4llxszlgtwTEmo3+Y5SnHwWJwm2RFbOVQvPX1N4jBRFl34PmjgoNbitXIxpl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787942227; c=relaxed/simple;
	bh=I25lWYt6cViseaUZtP8CeKwfUIj5/ciNKEk4etFYL1w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fH92yCBLt5yM5nFGkcQVyohlKEfRSkj3sen3px4/wwBVlbIQaaBEJOqFn2iiRDcOq6Z5jsFaUB1z7aL2tpEqMlTVt2zQMJM6KBd5wKHzc/rvsPmbMQi08jOWi73v+lGLsaio7Iv7DKeUMg62Wzw4nMMtyd/zsHe4h/29FCqKHw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZ00InjO; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZ00InjO"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84f3ab8750cso1072064b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787942223; x=1788547023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7mVEURHMP319Byv9p6qmQOcjq3woNvQVkr+r4ShGABI=;
        b=CZ00InjOHXHX/H8HcWuRUtfMdLDaC6jCwr9GCNYajPWW77vuhiTUse7xrlq4zJqtLB
         QFxZIEeW/DbD+olttDXAw276gLg4snaZYwZlYc1owsTp93eoN6QRnn4sjK4e9QSCzcsa
         SGsI2S0358nrAiDAGw+j2EQhKdzZOORh86tK08y57cmX65DMBh1IJ/7OIT5USaT2wTUs
         uYf1OOYlOMF9Uej0Di7MQfyQFsZwQvbsx2zUluBkhEHnAOjnHI/KRro1boSz7CW5gnNv
         7hH6OppQmfWglAyuHVlcruCELwFfTIUw8myLyJsnG9cf6DXdOsnmGMw7ptg3aYNVmpRH
         XdvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787942223; x=1788547023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7mVEURHMP319Byv9p6qmQOcjq3woNvQVkr+r4ShGABI=;
        b=l7rkA2V0uQKrB5Y+3nO08y/hGjEX7Xd1XLiv//HVNIhGcimZQoPBIlkmcauc3+Gg5U
         TgjEoUw3+skSiLOmERBQ5lWqxDsjR9oed8KWwq6Ql40+yjUyyeSYSUr7Pst/EwIEzAlV
         RA4YVCpOws+YG8iYDSBjuRzoXW1eaFlr0UQnOpl56bvDfTHpMLEKHaiOBBvyNEeEiwY/
         IHytPg7E3IWjFMYmQSG5aqgGhUwFj/27hOddhkt86i6ULV3TRokTY5lA7k7YnKrJ/0Ze
         sKgjENVcnrJjDKfqxdY0njbhbA7G93JC14nvmeZoPlU1PI9wy+Asf8GaTr1XyLITARQ1
         3UOA==
X-Forwarded-Encrypted: i=1; AHgh+Rp0lScUembjdohgk8l4nSYvTgm+f+iqNdQxsjgvIS804rTpo4vx5ejPCACedNeNcqESk5q6PzftBvfMY4w=@vger.kernel.org
X-Gm-Message-State: AFuF++m68kICtTCjv+slj7LsA60qkB0LstdgRR2obE6DMkqKDZ92MWGf
	v5h1tVLDsndhIawHc2O3YNrIvHJvQN9xSMGPRMDbXrPs0c7nzAmOSXMc
X-Gm-Gg: AR+sD11LVv2ZsuKUVWz8xohn82Cu+bua2GHDf71y8YhlLrUWus/X9K7V7NJ6+4Tp7yB
	IdI4urZ++4XQpLm7VntqjjWI0rmt/OwYj76OuA++sNtRzw0Xt+XkpA9TxHf2HRwyLDeF6ZitNpk
	RQaGzHdnb65nGLF/CpnmaFJHOYhonigj4SLQPTI/Z0ONcT5wK+ytBzFUbnqVxzC+gWFIwGewpkB
	KLfBDt6Et1CfjCzEwxKia2GNqqDDtvqO2dKZ2dQ97ozXz1p3XcTpfkB3YtIX3Vv1PJb5vJOmJ9E
	4y+xeZd9ZQ1kiPyh7RArjfm8iBSJoA3rHiPvz32LMfEvFsrEE9Xcrz7k0K6hY24NduFLpakX3Nx
	AFP1W/qSgxk4iExgFuJ/V/eLf0vR0h6RRxME5sRoXfmfh+vnU7fxn9ycxeekQlSidIjfJhiCJim
	k8iaPl/Os/liEuEk7YE8CUIyCjAKAgZ3RUwJLzTlSDygv9tDENXoZ0PXIxxtYuWjX2hyzWFnGIj
	4Hw5r/AY1D6DjClL2HRGJEoZ7KR
X-Received: by 2002:a05:6a00:2309:b0:857:7384:b5fc with SMTP id d2e1a72fcca58-8577384c2c3mr2082303b3a.24.1787942223100;
        Fri, 28 Aug 2026 11:37:03 -0700 (PDT)
Received: from aig-kmd-01.. ([120.133.49.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-856a2ea6fa3sm844230b3a.37.2026.08.28.11.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 11:37:02 -0700 (PDT)
From: Yin Tirui <yintirui@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Nico Pache <nico.pache@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	"Liam R . Howlett" <liam@infradead.org>,
	wangkefeng.wang@huawei.com,
	chenjun102@huawei.com,
	linux-kernel@vger.kernel.org,
	Yin Tirui <yintirui@gmail.com>
Subject: [PATCH RFC 1/9] mm/huge_memory: read the huge PMD entry once when splitting it
Date: Sat, 29 Aug 2026 02:33:11 +0800
Message-Id: <1b11fdaa4f5819959505ad72e3d70bad5fc1d343.1787941780.git.yintirui@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1787941780.git.yintirui@gmail.com>
References: <cover.1787941780.git.yintirui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__split_huge_pmd_locked() re-reads *pmd several times to classify the same
entry. The PMD page table lock is held throughout, so read it once into
old_pmd and classify from that.

No functional change intended.

Signed-off-by: Yin Tirui <yintirui@gmail.com>
---
 mm/huge_memory.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index afbb5974bd22..8feabdcf6307 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3143,10 +3143,11 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		unsigned long haddr, bool freeze)
 {
 	struct mm_struct *mm = vma->vm_mm;
+	pmd_t old_pmd = *pmd;
 	struct folio *folio;
 	struct page *page;
 	pgtable_t pgtable;
-	pmd_t old_pmd, _pmd;
+	pmd_t _pmd;
 	bool soft_dirty, uffd_wp = false, young = false, write = false;
 	bool anon_exclusive = false, dirty = false;
 	unsigned long addr;
@@ -3157,7 +3158,8 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	VM_BUG_ON_VMA(vma->vm_start > haddr, vma);
 	VM_BUG_ON_VMA(vma->vm_end < haddr + HPAGE_PMD_SIZE, vma);
 
-	VM_WARN_ON_ONCE(!pmd_is_valid_softleaf(*pmd) && !pmd_trans_huge(*pmd));
+	VM_WARN_ON_ONCE(!pmd_is_valid_softleaf(old_pmd) &&
+			!pmd_trans_huge(old_pmd));
 
 	count_vm_event(THP_SPLIT_PMD);
 
@@ -3193,7 +3195,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		return;
 	}
 
-	if (is_huge_zero_pmd(*pmd)) {
+	if (is_huge_zero_pmd(old_pmd)) {
 		/*
 		 * FIXME: Do we want to invalidate secondary mmu by calling
 		 * mmu_notifier_arch_invalidate_secondary_tlbs() see comments below
@@ -3206,10 +3208,9 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		return __split_huge_zero_page_pmd(vma, haddr, pmd);
 	}
 
-	if (pmd_is_migration_entry(*pmd)) {
+	if (pmd_is_migration_entry(old_pmd)) {
 		softleaf_t entry;
 
-		old_pmd = *pmd;
 		entry = softleaf_from_pmd(old_pmd);
 		page = softleaf_to_page(entry);
 		folio = page_folio(page);
@@ -3222,10 +3223,9 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 			anon_exclusive = softleaf_is_migration_read_exclusive(entry);
 		young = softleaf_is_migration_young(entry);
 		dirty = softleaf_is_migration_dirty(entry);
-	} else if (pmd_is_device_private_entry(*pmd)) {
+	} else if (pmd_is_device_private_entry(old_pmd)) {
 		softleaf_t entry;
 
-		old_pmd = *pmd;
 		entry = softleaf_from_pmd(old_pmd);
 		page = softleaf_to_page(entry);
 		folio = page_folio(page);
@@ -3417,7 +3417,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	}
 	pte_unmap(pte);
 
-	if (!pmd_is_migration_entry(*pmd))
+	if (!pmd_is_migration_entry(old_pmd))
 		folio_remove_rmap_pmd(folio, page, vma);
 	if (freeze)
 		put_page(page);
-- 
2.34.1

