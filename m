Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55E048E0F2
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790055303; cv=none; b=HQeeIkY2fkok1Mehj4dFQzuApcH5cBUC5AfQv+qCKUYn8MoS8vNN/lx4nnVh7ZmkRbyTIqyYqxw6bePdbpGGvaoUkLgN8gi1Bo3sbFkDmSnQ54HKuykBzPQuQF1LagkKGN0P1yI4k11wolrNAWLMticrh5Xaa1CADjpr7SoZEiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790055303; c=relaxed/simple;
	bh=/bavorzbX6fdsAS1auZYVgDQ9isR87ThoKZFo3OyPWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZUpAQeQ2EN1gENrInRl1YpYctKXNbILk08gim0b2AR/IgYT0TDjzYU9ue4JWnmVrPSwW5KRwHQB7VZNaWD6BO6W44B860KPvSmjQN8MXtO11c03gwTGzpayL7eDXZobU4fw5DUvsf4ipze3EWmYW2nN2AGuKN/c5jw2xnUII824=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zb9Az9dY; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=gODo+R0A; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zb9Az9dY";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="gODo+R0A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790055300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OVe9F9UnqicBMpqnz2rAf3G6pQga7qmnVnonC4zTIr8=;
	b=Zb9Az9dY3swZEZQ/31UW2k5RBfNs56Dlas7yzhSDLs30jWdNOfeQDCtm32UtsEoQj+q1ms
	qKTlH1+baoO75yr9pCzdKNayC0qFOZgBgyDw/yHjEjPAiCBhrHJx1CYJKgKXABraunIQ9e
	sO+yslki8c3Qc9p+NvXJaEjLwF1RpHw=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-EQA0pumqOOaPSmIR5ALlbQ-1; Tue, 22 Sep 2026 01:34:59 -0400
X-MC-Unique: EQA0pumqOOaPSmIR5ALlbQ-1
X-Mimecast-MFC-AGG-ID: EQA0pumqOOaPSmIR5ALlbQ_1790055298
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-5b667b38b04so1993639e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790055297; x=1790660097; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OVe9F9UnqicBMpqnz2rAf3G6pQga7qmnVnonC4zTIr8=;
        b=gODo+R0AQXrBI8e0ZFq/n4JuC+i92NOwD/co52yPAu1WhfuwGok4rZjqdt+bQqAZ+A
         s2m3fregqRkikh7mVPP+RJN9ydqtxfro420Rc7/lI5ZfSn41oibwV3677hsEg57HP7SN
         un6zN2Mcljhc0PSFyenWTKdsSPBH/qt56CPiAlbIapXta4saDMJ0IBh0CMCE3mFZtcKJ
         zDNiCmtZ+N198dkst3RpNWUo1uwQ4S6CWpEFu10VKn3+2/RVO2er/G8yamYkmhVbQBSb
         PxLE+fbgTbHeLa8MwElUyR0/m/WTsnEX22jgTCH5cK4aBzZnUUmI463zeVe1moY+AUn8
         XSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790055297; x=1790660097;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OVe9F9UnqicBMpqnz2rAf3G6pQga7qmnVnonC4zTIr8=;
        b=qtyLTEJaJafIvHOrBKovN3rfGvltCOUigFkwEY0sIv+FKuvt9C79CCAvE8ArGifl1R
         SAckYi8Js2ut3DOOVOIxUPHom5LdoD2sIMaU8r2jctYwgu1MAn/qT8pliFTy0ckPk+/q
         2bvrqb0JblM/0dLDlj6i1XIZqUveP5iQAPSaPymtCo541VgoFkTYS+kDeicRRHi2yI0s
         CkWtoJ9e0YsNKnlhSYhQRGz4q3ejCaF+XmMXtuSU0ElngMPxXm4aym7lasyWKnAUNmNM
         86hPF1x9rCZTds9D4xQcFRp9barinjQ2neUgf3Fh6RK6ZvKX7Bwy/xsqO5ZRAXYKDu6e
         Jnyw==
X-Forwarded-Encrypted: i=1; AKwUvBxdyp4DsllJS4fo6XHHKRmbLTOYx9nIVFLFO51bFnSx5Fqk9LM7RaTe04a4bJLntJF+LLLaFKlVgzj6ZxU=@vger.kernel.org
X-Gm-Message-State: AFuF++mYnvaF8cS8r5t3uteRWuyfBmvR0+SDifioiO3kpEMnW680pOAu
	KIzGuXOJPslaQJiRy6lfWE4WbHJwnG8E8eq/vtHW9ys8qBO1qD04r6iHdPc/OkVsCZpqlrbUoZQ
	yhYeqPu3p6Khz5PHQbQE+hBRaQPA3EchTWHl1Z7maV/Win5KOP1chxZrlI+SzSsBr
X-Gm-Gg: AYBFou1jiSqK1mM6fu5sKK+OVuOoXhHtPzzbWpeTpi5ys6zTe7m16ML99bm61ye5/CW
	A96Jkuuxbek3wnLc171PyzPU+33l2MlJ/kzSwm4tM3Itva6IRs6O16ZBlhnTpO4yvEcXzfXaexb
	06SX1gRxX2YgurNxHnQ+8/Sx/WIrLCcsqC0mUF6Byjl5ozondVxVbXMJ0zvE3vGFd8bOI9mdKQ/
	H7sItVAJ2rbaZJplmvXrRSMXwnLYwFXVJp3i4wEJ1gA2n3WJI/INgtITN6R9AYbZT755QPPt6jC
	KR0CFKUJ/H0zMKVtpjWDhqqkHYtbKZQu6aZqnK3Tq9KAWCn1uqT7pOSX8J0AzwHxhcqUc+3NGiL
	xWcP2mzVNm7B9yIhlt494
X-Received: by 2002:a05:6512:12cc:b0:5b6:183c:5c9e with SMTP id 2adb3069b0e04-5b8c1959154mr3783083e87.60.1790055297566;
        Mon, 21 Sep 2026 22:34:57 -0700 (PDT)
X-Received: by 2002:a05:6512:12cc:b0:5b6:183c:5c9e with SMTP id 2adb3069b0e04-5b8c1959154mr3783074e87.60.1790055297099;
        Mon, 21 Sep 2026 22:34:57 -0700 (PDT)
Received: from fedora (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d46e0966sm191742e87.55.2026.09.21.22.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 22:34:55 -0700 (PDT)
From: mpenttil@redhat.com
To: linux-mm@kvack.org
Cc: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>,
	David Hildenbrand <david@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Balbir Singh <balbirs@nvidia.com>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>
Subject: [PATCH v14 06/12] mm/hmm: migrate collection in HMM pagewalk - pte level
Date: Tue, 22 Sep 2026 08:34:15 +0300
Message-ID: <20260922053421.4092027-7-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922053421.4092027-1-mpenttil@redhat.com>
References: <20260922053421.4092027-1-mpenttil@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mika Penttilä <mpenttil@redhat.com>

Implement the needed hmm_vma_handle_migrate_prepare() function
which is mostly carried over from migrate_device.c's
migrate_vma_collect_pmd() function.

Also implement the migrate_vma_split_folio(), for splitting
pte mapped large folios. It is also mostly from migrate_device.c,
with care taken to reference folio before relasing page table
lock.

With HMM pagewalk based migration, the idea is that
hmm_vma_handle_*() are responsible for faulting,
and the pfn collecting part. hmm_vma_handle_migrate_prepare*()
do the migration decisions (with HMM_PFN_MIGRATE), possibly split
folios, and insert migration ptes/pmds.

HMM pagewalk based migration is enabled in later commit, for now
now hmm_select_migrate() returns 0.

Cc: David Hildenbrand <david@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leonro@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Balbir Singh <balbirs@nvidia.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Suggested-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Mika Penttilä <mpenttil@redhat.com>
---
 mm/hmm.c | 262 ++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 261 insertions(+), 1 deletion(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index e6469ef4ae6a..b3b79d13c797 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -489,6 +489,63 @@ static int hmm_vma_handle_absent_pmd(struct mm_walk *walk, unsigned long start,
 #endif  /* CONFIG_ARCH_HAS_PMD_SOFTLEAVES */
 
 #ifdef CONFIG_DEVICE_MIGRATION
+/**
+ * migrate_vma_split_folio() - Helper function to split a THP folio
+ * @folio: the folio to split
+ * @fault_page: struct page associated with the fault if any
+ * @hmm_vma_walk: walk in progress
+ * @ptep: pte_t * for unmap and unlock ptl
+ *
+ * Returns 0 on success
+ */
+static int migrate_vma_split_folio(struct folio *folio,
+				   struct page *fault_page,
+				   struct hmm_vma_walk *hmm_vma_walk,
+				   pte_t *ptep)
+{
+	int ret;
+	struct folio *fault_folio = fault_page ? page_folio(fault_page) : NULL;
+	struct folio *new_fault_folio = NULL;
+
+	if (folio != fault_folio)
+		folio_get(folio);
+
+	pte_unmap_unlock(ptep, hmm_vma_walk->ptl);
+	hmm_vma_walk->ptelocked = false;
+
+	if (folio != fault_folio)
+		folio_lock(folio);
+
+	ret = split_folio(folio);
+	if (ret) {
+		if (folio != fault_folio) {
+			folio_unlock(folio);
+			folio_put(folio);
+		}
+		return ret;
+	}
+
+	new_fault_folio = fault_page ? page_folio(fault_page) : NULL;
+
+	/*
+	 * Ensure the lock is held on the correct
+	 * folio after the split
+	 */
+	if (!new_fault_folio) {
+		folio_unlock(folio);
+		folio_put(folio);
+	} else if (folio != new_fault_folio) {
+		if (new_fault_folio != fault_folio) {
+			folio_get(new_fault_folio);
+			folio_lock(new_fault_folio);
+		}
+		folio_unlock(folio);
+		folio_put(folio);
+	}
+
+	return 0;
+}
+
 static int hmm_vma_handle_migrate_prepare_pmd(const struct mm_walk *walk,
 					      pmd_t *pmdp,
 					      unsigned long start,
@@ -499,6 +556,11 @@ static int hmm_vma_handle_migrate_prepare_pmd(const struct mm_walk *walk,
 	return 0;
 }
 
+/*
+ * Install migration entries if migration requested, either from fault
+ * or migrate paths.
+ *
+ */
 static int hmm_vma_handle_migrate_prepare(const struct mm_walk *walk,
 					  pmd_t *pmdp,
 					  pte_t *ptep,
@@ -506,8 +568,206 @@ static int hmm_vma_handle_migrate_prepare(const struct mm_walk *walk,
 					  unsigned long *hmm_pfn,
 					  bool *unmapped)
 {
-	// TODO: implement migration entry insertion
+	struct hmm_vma_walk *hmm_vma_walk = walk->private;
+	struct hmm_range *range = hmm_vma_walk->range;
+	struct migrate_vma *migrate = range->migrate;
+	struct mm_struct *mm = walk->vma->vm_mm;
+	struct folio *fault_folio = NULL;
+	enum migrate_vma_info minfo;
+	struct dev_pagemap *pgmap;
+	bool anon_exclusive;
+	struct folio *folio;
+	unsigned long pfn;
+	struct page *page;
+	softleaf_t entry;
+	pte_t pte, swp_pte;
+	bool writable = false;
+
+	// Do we want to migrate at all?
+	minfo = hmm_select_migrate(range);
+	if (!minfo)
+		return 0;
+
+	WARN_ON_ONCE(!migrate);
+	HMM_ASSERT_PTE_LOCKED(hmm_vma_walk, true);
+
+	fault_folio = migrate->fault_page ?
+		page_folio(migrate->fault_page) : NULL;
+
+	pte = ptep_get(ptep);
+
+	if (pte_none(pte)) {
+		if (vma_is_anonymous(walk->vma)) {
+			*hmm_pfn &= HMM_PFN_INOUT_FLAGS;
+			*hmm_pfn |= HMM_PFN_MIGRATE;
+			goto out;
+		}
+	}
+
+	if (!(hmm_pfn[0] & HMM_PFN_VALID))
+		goto out;
+
+	if (!pte_present(pte)) {
+		/*
+		 * Only care about unaddressable device page special
+		 * page table entry. Other special swap entries are not
+		 * migratable, and we ignore regular swapped page.
+		 */
+		entry = softleaf_from_pte(pte);
+		if (!softleaf_is_device_private(entry))
+			goto out;
+
+		if (!(minfo & MIGRATE_VMA_SELECT_DEVICE_PRIVATE))
+			goto out;
+
+		page = softleaf_to_page(entry);
+		folio = page_folio(page);
+		if (folio->pgmap->owner != migrate->pgmap_owner)
+			goto out;
+
+		if (folio_test_large(folio)) {
+			int ret;
+
+			ret = migrate_vma_split_folio(folio,
+						      migrate->fault_page,
+						      hmm_vma_walk,
+						      ptep);
+			if (ret)
+				goto out_error;
+			return -EAGAIN;
+		}
+
+		pfn = page_to_pfn(page);
+		if (softleaf_is_device_private_write(entry))
+			writable = true;
+	} else {
+		pfn = pte_pfn(pte);
+		if (is_zero_pfn(pfn) &&
+		    (minfo & MIGRATE_VMA_SELECT_SYSTEM)) {
+			*hmm_pfn = HMM_PFN_MIGRATE;
+			goto out;
+		}
+		page = vm_normal_page(walk->vma, addr, pte);
+		if (page && !is_zone_device_page(page) &&
+		    !(minfo & MIGRATE_VMA_SELECT_SYSTEM)) {
+			goto out;
+		} else if (page && is_device_coherent_page(page)) {
+			pgmap = page_pgmap(page);
+
+			if (!(minfo &
+			      MIGRATE_VMA_SELECT_DEVICE_COHERENT) ||
+			    pgmap->owner != migrate->pgmap_owner)
+				goto out;
+		}
+
+		folio = page ? page_folio(page) : NULL;
+		if (folio && folio_test_large(folio)) {
+			int ret;
+
+			ret = migrate_vma_split_folio(folio,
+						      migrate->fault_page,
+						      hmm_vma_walk,
+						      ptep);
+			if (ret)
+				goto out_error;
+			return -EAGAIN;
+		}
+
+		writable = pte_write(pte);
+	}
+
+	if (!page || !page->mapping)
+		goto out;
+
+	/*
+	 * By getting a reference on the folio we pin it and that blocks
+	 * any kind of migration. Side effect is that it "freezes" the
+	 * pte.
+	 *
+	 * We drop this reference after isolating the folio from the lru
+	 * for non device folio (device folio are not on the lru and thus
+	 * can't be dropped from it).
+	 */
+	folio = page_folio(page);
+	folio_get(folio);
+
+	/*
+	 * We rely on folio_trylock() to avoid deadlock between
+	 * concurrent migrations where each is waiting on the others
+	 * folio lock. If we can't immediately lock the folio we fail this
+	 * migration as it is only best effort anyway.
+	 *
+	 * If we can lock the folio it's safe to set up a migration entry
+	 * now. In the common case where the folio is mapped once in a
+	 * single process setting up the migration entry now is an
+	 * optimisation to avoid walking the rmap later with
+	 * try_to_migrate().
+	 */
+
+	if (fault_folio == folio || folio_trylock(folio)) {
+		anon_exclusive = folio_test_anon(folio) &&
+			PageAnonExclusive(page);
+
+		if (pte_present(pte))
+			flush_cache_page(walk->vma, addr, pfn);
+
+		if (anon_exclusive) {
+			pte = ptep_clear_flush(walk->vma, addr, ptep);
+
+			if (folio_try_share_anon_rmap_pte(folio, page)) {
+				set_pte_at(mm, addr, ptep, pte);
+				folio_unlock(folio);
+				folio_put(folio);
+				goto out;
+			}
+		} else {
+			pte = ptep_get_and_clear(mm, addr, ptep);
+		}
+
+		if (pte_present(pte) && pte_dirty(pte))
+			folio_mark_dirty(folio);
+
+		/* Setup special migration page table entry */
+		if (writable)
+			entry = make_writable_migration_entry(pfn);
+		else if (anon_exclusive)
+			entry = make_readable_exclusive_migration_entry(pfn);
+		else
+			entry = make_readable_migration_entry(pfn);
+
+		if (pte_present(pte)) {
+			if (pte_young(pte))
+				entry = make_migration_entry_young(entry);
+			if (pte_dirty(pte))
+				entry = make_migration_entry_dirty(entry);
+		}
+
+		swp_pte = swp_entry_to_pte(entry);
+		if (pte_present(pte)) {
+			if (pte_soft_dirty(pte))
+				swp_pte = pte_swp_mksoft_dirty(swp_pte);
+			if (pte_uffd(pte))
+				swp_pte = pte_swp_mkuffd(swp_pte);
+		} else {
+			if (pte_swp_soft_dirty(pte))
+				swp_pte = pte_swp_mksoft_dirty(swp_pte);
+			if (pte_swp_uffd(pte))
+				swp_pte = pte_swp_mkuffd(swp_pte);
+		}
+
+		set_pte_at(mm, addr, ptep, swp_pte);
+		folio_remove_rmap_pte(folio, page, walk->vma);
+		folio_put(folio);
+		*hmm_pfn |= HMM_PFN_MIGRATE;
+		if (pte_present(pte))
+			*unmapped = true;
+	} else {
+		folio_put(folio);
+	}
+out:
 	return 0;
+out_error:
+	return -EFAULT;
 }
 
 static int hmm_vma_walk_split(pmd_t *pmdp,
-- 
2.55.0

