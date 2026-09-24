Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C293C410D36
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790232849; cv=none; b=A9HP28awQOkkuSpQ+4WEg3SOTF97q2cUh9DT20hwwFCinNoNwGs/5VLupDFnVwI5hboHD5Rmr/5QhuqCs8j3W8IUjaK13GmpuIQCNKIWKboas7qzWoqwA/XwRmEODtYlwXNDUBRT0e8Hd/+MkRmte+mpo+jEIY/ZEgZoox61tx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790232849; c=relaxed/simple;
	bh=1LPu3V9Ei+sHzoWF2SKd5yIugDRbYsEKXozoa/7EZmM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LquGSS9j5UoUf7Ag3cXcDuU265eTAiWjvEHhR+eav8U603Mh6UzdxYbWem91L9hduXASYTl4NRUE09usffg/t2XLIx4EVU/4cfzQCSCIFmCHz0TOUzPY8DRGDHF2XxyG4Q4lOQZbeTtH3bcZHjEUbNU1Ijsq8vBPDA85GvpkR3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LtOYRA/c; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=OHzKLovn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LtOYRA/c";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="OHzKLovn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790232831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sKufge1uGAYO+MtJk2WzsKER/XWhb707zmmEu/uQZ4Q=;
	b=LtOYRA/cC6ac6vuo5MVaw4avQXg154tpb35+411NPIa6i0AhUB/OwJNOMpVLLTW9OjynAl
	da0bKBUky5Nu0FRhfpZffTQUkL9IwIWrrhjbSIDMNAWdeeOulv91RHdRcfvjvdccaP3cth
	TsWW7n+Djh8VmuZrEzDbn2ezLzDSp+Y=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-MbqZQIKHOVC4UwFBZmNFsw-1; Thu, 24 Sep 2026 02:53:50 -0400
X-MC-Unique: MbqZQIKHOVC4UwFBZmNFsw-1
X-Mimecast-MFC-AGG-ID: MbqZQIKHOVC4UwFBZmNFsw_1790232829
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-3a1fa5bb969so7167291fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790232829; x=1790837629; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sKufge1uGAYO+MtJk2WzsKER/XWhb707zmmEu/uQZ4Q=;
        b=OHzKLovn3u/e7vudiLAugY2JB93YoeiWSXxPWf3yCVu8UhEM98IyfLiB6pp6QwSngW
         OSYIsW4nQB+vm5TFaRbmlL5P8Zu0poeip4DZOCZ5flqGddbHdPb+CK8aqOSIl1mvz1/W
         dhs8Qop1gzO8n2b0WRMSPVieXJy0VktuZPt2kgF7GF+2uJM0GoHP5jmojoMaiObFh3lJ
         7YbPpI8SPlwnAaMFy2PAMjI2l91JgntJJLFpUfDIVnbEFi7fSE+NFKinP23bdO1WSGzG
         GHLBbt5/8sby+GOE22xfYgBxGRmcfuUxuxvtv4Qj5jObwwuQOUwY0UmuvxuhVM95rn1+
         xEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790232829; x=1790837629;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sKufge1uGAYO+MtJk2WzsKER/XWhb707zmmEu/uQZ4Q=;
        b=Xp/X8iX1BSZXuTvE7z0aPFEqUqjigyA6jAMbA3nrjo7Rdtwttk6pOT/4D4voYQegAz
         ETFDIde8WCTjwEv3r1qcE/Z0Paj7fG59x1XZyT7URwaDZovG/OV4LkI1nUbS+3Wa+I4Q
         MFfI38SACmAMofkThZyf825Zx8RyN9qtjpqTv0CqyIfkDeLU5NaHC07rpsExw/Okuppb
         8YrH86peladctVubW/hkTesrt26tOERQtibRw+Z21WFKvNqm1GMB5a4ydZTgXJCNz5Z8
         9q8nRNjkzHH2UlPy1VlTn1tyLY4r2YvBF5oXrPcGofRreXyIZubHmVFmX6VgNFLhdlNY
         M4yA==
X-Forwarded-Encrypted: i=1; AKwUvBy5JU59nt8x+FEx+S++5zZwGiAmkFyZHyD2BA4aN+4C8eaBdOSSP9bc7CaODKYJjr8IIZm12kjxaNKc6T0=@vger.kernel.org
X-Gm-Message-State: AFuF++lcANiM628LfiK8dSwr3ISKUM1FfMefvTOwZy9Ul/yMQ4HYtFgh
	vfsb0Tz+R/G7ikRoiGNVaHhwjeOMNCW6HMb6x4h9LUE/CWU4EAf60shsMIEeYj+/MHmqnptZJdf
	rRtDH0JnkQJOBZCC3lSley0sdPV99E+G0lzG3WBC/pCXXObwjCNIc8i44HzRUYxan
X-Gm-Gg: AYBFou0XzVVCa3b5ilZILbje6HIbRUprc3C6vrjMjI1ChzG5cRDr75W05JHe49MV6mf
	QQJqW+8fOMkyitMcrxPIhBxx0aw4q3xzKDU6AxMZCuItBAxm8o6BsXi+FA9lVCFNCy3tR5NEQ6W
	4VKVlHIAmd5DMQmw9Bqz6PSSwkz+m9BHCNELzUMJRouxptQe3r0DUzag/kAvn+PE3hNgnTsQSSM
	2Z+dBlETJYvhEaR0UBCin6CdMlRapGbXh+Mg+96c7TzrbQEeihqsYXeppybK1ccoam4YOpzSmvE
	2c7DdLYaM3bgEKTDfwZiuPg6J5p2h+REFnmvqb0yaZYy4dNatvD+ogIop7i8Scj9Ztwqxvsy4yK
	NLn8xy8P8/S5P44IvoJFC
X-Received: by 2002:a2e:a58e:0:b0:3a5:d070:9ffd with SMTP id 38308e7fff4ca-3a63bf294a6mr3893291fa.2.1790232828685;
        Wed, 23 Sep 2026 23:53:48 -0700 (PDT)
X-Received: by 2002:a2e:a58e:0:b0:3a5:d070:9ffd with SMTP id 38308e7fff4ca-3a63bf294a6mr3893181fa.2.1790232828134;
        Wed, 23 Sep 2026 23:53:48 -0700 (PDT)
Received: from fedora (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a63bf57909sm4803141fa.29.2026.09.23.23.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 23:53:47 -0700 (PDT)
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
Subject: [PATCH v15 05/11] mm/hmm: migrate collection in HMM pagewalk - pte level
Date: Thu, 24 Sep 2026 09:53:07 +0300
Message-ID: <20260924065313.899730-6-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924065313.899730-1-mpenttil@redhat.com>
References: <20260924065313.899730-1-mpenttil@redhat.com>
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
 mm/hmm.c | 263 ++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 262 insertions(+), 1 deletion(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index 25f537c87b5f..a60b66963049 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -491,6 +491,63 @@ static int hmm_vma_handle_absent_pmd(struct mm_walk *walk, unsigned long start,
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
@@ -501,6 +558,11 @@ static int hmm_vma_handle_migrate_prepare_pmd(const struct mm_walk *walk,
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
@@ -508,8 +570,207 @@ static int hmm_vma_handle_migrate_prepare(const struct mm_walk *walk,
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
+				if (fault_folio != folio)
+					folio_unlock(folio);
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
 
 #else
-- 
2.55.0

