Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793686622;
	b=nV2VUrf2nOtNmuKBSzG35mnqntcku/6j8TExvedeJwzZegXBnYGJhv/OYBfUGMd8RRf2
	 u5m/Bryo0vOGYJqB0On9FMCRT0YipxlyjOYSAaHmf8x5Ex7njEbHubkCXPgdnEhhPOXr6
	 HTDLPETjm3+tl8q/WWlVk4NaxipRe186IctdWcGrQI2CZ8D3Aajb+5WbHyS5xA2021Nqi
	 HVpZ/pALMUxbeboQJHb4KwQJvu9q0KFsZx8lZgE5unO5rX04kwY9QYT7J6OkEXRF4PKVL
	 5pvTgGoX3iTGBnsmepFQe9Ff9tUR488IFBq96Byi1zmE4lUtxl9KLNeHSB3GQo4q0bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793686622;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Zw9DY6JBG5hvTm4us+YQpe0Js+JZjCI3PBXegYRAl0M=;
	b=4W4ebT0DxfRos1KTMpvDC9mNQWOGhicZa3mBi2gTaQ65iKGOgLtA+50n9b/eq9dC6/gs
	 6eALm3rL/m7jzROo5Gx3LhdBz/UgnkIv4PXeqWMH/RVO75F/XApgGgQStDUga6PmWURRW
	 gPAgluZvFzaYMjkyi8AN0Y8m29ZhSEG17/zmE04N0zcRWY4Q69NCTwk8VUBfkvSyrursA
	 lXXcGHC3eL2Y47RDWcBO1bzKhthuaQCKtxVB1xZtlyNvaO6Z6YF2jWkP/wKNOio4aqp/J
	 SxufYLdEySjKZrqRdNTSJgRvawHnIRBqTB5hrbJpawHttCTIQ6eqXceDn6FA6UeEuWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QTIe28Au;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kWV7p3ym;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31978606D803
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:17:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31978606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QTIe28Au;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kWV7p3ym
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793686621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zw9DY6JBG5hvTm4us+YQpe0Js+JZjCI3PBXegYRAl0M=;
	b=QTIe28AuGvFKnccwuRdt+lDPpPlpIy/qL9C+YjLcfEL0tesItmQ63yszWqi/PpayuSwVRK
	Lo7/6A/6MiL7nHzV/dCnyRrLSUi0v32PQw78T4VuVg84w5PVUMT8oq7ojpTy4aP5LOFMbJ
	tJ+Q/5uuixzavxzCkKRgXK5Uavv6P/4=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-cPCLWqYyN42eb8czgHI_wg-1; Tue, 03 Nov 2026 01:16:59 -0500
X-MC-Unique: cPCLWqYyN42eb8czgHI_wg-1
X-Mimecast-MFC-AGG-ID: cPCLWqYyN42eb8czgHI_wg_1793686618
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-3ab345bb334so17423701fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793686618; x=1794291418; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zw9DY6JBG5hvTm4us+YQpe0Js+JZjCI3PBXegYRAl0M=;
        b=kWV7p3ymx+mKJkvp+9TahPSLHG8MJwX0pwpSSpX2r0+d2kpuI2kWMC5zYyRpAWI+lr
         or1DwR7BO6063Ef8MRYvEjJNSLN5K0DEy3p4IHrSIk0nz5pG04WBxcLafxs66oUCTydm
         qVEZNLn00LyXkFV57EYlM4+j+coEbJQPMssT2kF84XF3WxQt3hdlseIqEQvwR6v++L5W
         qsbbeXQVLF1Qv144aIVDq9pRnbIItamCXsEdgQ+ITfhJEKSMyh/F7McPnz3UUvJrLqH+
         wpN8lGAAtW2DJ+WN13kaSYEO1Nqndr2DX4MGDawgKDNdHrLdb9m/3Kv4rwfJ7P2esulE
         f+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793686618; x=1794291418;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zw9DY6JBG5hvTm4us+YQpe0Js+JZjCI3PBXegYRAl0M=;
        b=gIKW2fUPyAaWufgLSxK7RmMPOmVJ37UFbtR4pNuPnd0HuJ5qOHduTlZ8Re7/78fuPx
         KjtKvJycs3TLGuAAPA1woezZW2ZwNDO1KI3dqRWe6+yHoab+mT5YPXPoiwBX+zqnlVBZ
         tyri9bfZenaYu9WV95HQ0xY/GOUm0N1SQ9+B6PX/W9jnHnX8xuUxSoW4BWB3rxH/vsjh
         gwjpjP4svhXQjimj72eAna/N9MpRQsQybTwAGoAF1yIBSgZFNbXjzeQhHW/6VPKYRjme
         84Sdejqebcx7ndzE4N9qjMRTjPh8edkAXxiUGopNPMj6x7HxbLYQX58rlBIfWw+CE40R
         ujLw==
X-Forwarded-Encrypted: i=1; AKwUvBzG23F0PPGJ+K5cBCvrF/mVAMgAFiXdM5xDuneqFFCrVJUzmgEBgwsOYxymWskrqv0gtK2Y9jVS0G1/bWE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/L6up3go9EH2tyQfrr4eRUS6EEDpC5vxExU5Ab1czNAhoPiYFu
	DqRYwMJoU7sbu8vx1zxv5spujeWEevqNuVauAVHqQbcin/pZyS09lrM7nuNJrjmyaKR7m2nHHt0
	lgX+aZnJbOyjxu9wsOSRwhJ618mFWiqv+sGJYxsM4wDivMNW+arqWBhhbOrpAgMmP
X-Gm-Gg: AYBFou2bc5mJwkVvEnv29x1G0BNKR3OUBM7Y1VvvS0l8KWNFpDQ9hRGW9/3QyLShx5A
	2EyONfb5s2rJOv8pvCX5NmbJ0+uiXSToi+sy9qDqIYbwW3LOfrh/aMbMzgVhQLjBbkqEpLB5F9v
	Q+BTFQ2LXsFQk1vxJW1B+FP2NdQjOD6UEROyTq4n7oYdDx5dd92pKTY0gFm3sgIwE4uIAQDuf10
	VLWKquKd+H/oMGTcRLjIWDFujS/gXmW9LBRkrgqU4U3VRyvZWcLG07xrETToPA0nTNrlApt0Hbq
	WH1JazSyoyfmobc9ZjcvYQaHs8oqGpY8JH42C8wRBexfVwTSrIVH7zoTyNxJkINh8RyNmU/ZRa+
	yU/W6nBu0emIK24f5zL0mO+07/rz/+Zo9chhn21T2o7AbBfBz+awcmHxvppb13UuCU96kXA==
X-Received: by 2002:a05:6512:3b2c:b0:5bf:a34f:7088 with SMTP id 2adb3069b0e04-5bfd9595d46mr4417778e87.61.1793686617923;
        Mon, 02 Nov 2026 22:16:57 -0800 (PST)
X-Received: by 2002:a05:6512:3b2c:b0:5bf:a34f:7088 with SMTP id 2adb3069b0e04-5bfd9595d46mr4417761e87.61.1793686617497;
        Mon, 02 Nov 2026 22:16:57 -0800 (PST)
Received: from fedora (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe073e0f9sm1964634e87.54.2026.11.02.22.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 22:16:56 -0800 (PST)
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
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v17 05/12] mm/hmm: migrate collection in HMM pagewalk - pte level
Date: Tue,  3 Nov 2026 08:16:22 +0200
Message-ID: <20261103061629.972669-6-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103061629.972669-1-mpenttil@redhat.com>
References: <20261103061629.972669-1-mpenttil@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mika Penttilä <mpenttil@redhat.com>

Implement the needed hmm_vma_handle_migrate_prepare() function
which is mostly carried over from migrate_device.c's
migrate_vma_collect_pmd() function.

Also implement the migrate_vma_split_folio(), for splitting
pte mapped large folios. It is also mostly from migrate_device.c,
with care taken to reference folio before releasing page table
lock.

With HMM pagewalk based migration, the idea is that
hmm_vma_handle_*() are responsible for faulting,
and the pfn collecting part. hmm_vma_handle_migrate_prepare*()
do the migration decisions (with HMM_PFN_MIGRATE), possibly split
folios, and insert migration ptes/pmds.

Collected folios stay locked while hmm_range_fault() may still fault
other pages of the range. This cannot self-deadlock: only anonymous
folios are collected, so no page cache or invalidate_lock ordering is
involved; faults are confined to the single vma, where a non-KSM
anonymous page is mapped only once (and that mapping is now our
migration entry); and when migrating only the faulting pte is faulted,
never our own entries. A KSM page's second mapping just fails the
collection trylock, and a swapcache folio still referenced by other
swap entries is not collected. Reclaim and direct compaction under the
fault only trylock folio locks.

HMM pagewalk based migration is enabled in later commit, for
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
 mm/hmm.c | 294 ++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 293 insertions(+), 1 deletion(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index 854d2c090b20..ec9280ef2682 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -495,6 +495,71 @@ static int hmm_vma_handle_absent_pmd(struct mm_walk *walk, unsigned long start,
 #endif  /* CONFIG_ARCH_HAS_PMD_SOFTLEAVES */
 
 #ifdef CONFIG_DEVICE_MIGRATION
+/**
+ * migrate_vma_split_folio() - Helper function to split a THP folio
+ * @folio: the folio to split
+ * @fault_page: struct page associated with the fault if any
+ * @hmm_vma_walk: walk in progress
+ * @ptep: pte_t * for unmap and unlock ptl
+ *
+ * Always drops the pte lock associated with @ptep.
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
+	/*
+	 * Take the reference while still holding the PTE lock, so the folio
+	 * cannot be freed once the lock is dropped. folio_lock() may sleep,
+	 * so it can only be taken after dropping the PTE spinlock. The fault
+	 * folio is already referenced and locked by do_swap_page().
+	 */
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
@@ -505,6 +570,11 @@ static int hmm_vma_handle_migrate_prepare_pmd(const struct mm_walk *walk,
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
@@ -512,8 +582,230 @@ static int hmm_vma_handle_migrate_prepare(const struct mm_walk *walk,
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
+	/*
+	 * NUMA hinting (protnone) entries are not reported valid, but the
+	 * page can still be migrated as is.
+	 */
+	if (!(hmm_pfn[0] & HMM_PFN_VALID) &&
+	    !(pte_present(pte) && pte_protnone(pte)))
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
+			/* Like pte_none(): only anonymous memory can be populated */
+			if (!vma_is_anonymous(walk->vma))
+				goto out;
+			*hmm_pfn &= HMM_PFN_INOUT_FLAGS;
+			*hmm_pfn |= HMM_PFN_MIGRATE;
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
+	/* Only anonymous memory can be migrated to device memory */
+	if (!page || !folio_test_anon(page_folio(page)))
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
+		/*
+		 * A swapcache folio still referenced by other swap entries
+		 * can't be migrated (see migrate_device_pages()), and faulting
+		 * one of those entries later in the walk, with no retry
+		 * allowed, would block on the lock we hold.
+		 */
+		if (folio_test_swapcache(folio) && !folio_free_swap(folio)) {
+			if (fault_folio != folio)
+				folio_unlock(folio);
+			folio_put(folio);
+			goto out;
+		}
+
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
+		*hmm_pfn |= HMM_PFN_VALID | HMM_PFN_MIGRATE;
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

