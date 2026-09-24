Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4300C418360
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790232853; cv=none; b=Mh45QgC6xR6Go8oHFwWYuN5CYF72y6EatIYF4A4kdM7NMoELAZKwhoBOkoea8C37/KNONyjRIXbx05kN98UaUQXg0F7jAgC/c49nzuC8Jkii/3Et9pW0IWaFf/hV9KGZDynHfAYM+xSbnIiBMY507+iLZMLnd/cuCTCWOg2Shzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790232853; c=relaxed/simple;
	bh=pJJ4XpXMtlG54hweUc7WruCWO5RNNm8NBpCqI7fWZZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rnKFbqnZFJEIKOT/tuo2tdTh3P5TxuaNI8VGoQjfC+plsgl5IWBZiO6Ur+tgTEEvX4SwCvd9l8pAMswP7lQn1fwtc7Ygc7E6RU3ZaOpwSze1pefXurwVzu+vlkFDur39PJTz+SZjv/0QpLd+9om+RGBgMxsFDLuVhxrvyHoP0zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LdSpMSxR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ao+Mj4Oy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LdSpMSxR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ao+Mj4Oy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790232845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FpTd5JgQBNZxOTQ5E1xh4waIRSPVZay1TNJaxL2j0i8=;
	b=LdSpMSxRHC6sr2XcIZmndgi3ly8lnG0gd/TJ9QqeGArbFJ75qrZAo17xNDSFbfGPV758At
	D2rlaFhlqn9ifVsknn8qT8nsSXlYtPjUwfQrWcyhggXcGJNbcBAVT9ql6TAwgNLBLWbw+k
	7Va84Jb1nlh4+oj/hRv4cGLyk7C2eQA=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-hvfJOuA9Ovey8X_fUb-Jqg-1; Thu, 24 Sep 2026 02:54:03 -0400
X-MC-Unique: hvfJOuA9Ovey8X_fUb-Jqg-1
X-Mimecast-MFC-AGG-ID: hvfJOuA9Ovey8X_fUb-Jqg_1790232842
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-3a3540f42beso8614771fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790232842; x=1790837642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FpTd5JgQBNZxOTQ5E1xh4waIRSPVZay1TNJaxL2j0i8=;
        b=Ao+Mj4OybVOSZbBPtLONNzytcEmm+SuB4CoyD/ERvvqeByFtlvUZL+12rPsMdcRCMV
         GYejJvBKIDCU4+myOB8zIsksuMjLvbbzf3Pt0QSJt3dfgdBDTc51HU3f3U3486JuPx6+
         Mlrv5sOA0TZlYki+dQ+IG5Z/wdWOWRdEgQa80hUQQi6X5C2UCFyF+t0q1qiED6xdn8A5
         wMHVPXfAk8CQo0C3w89kNLXvTgz6FjAr6duhxb7kDkL7SxKXoVm7Ykn2FzEvmZ1IiBW2
         YQ9vplO7m+Ypq6WqL6+1VjYxYwVDso2F7bBp7x7UdJO6sLP/B+EIVpYMVkWAMVgB30tC
         qP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790232842; x=1790837642;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FpTd5JgQBNZxOTQ5E1xh4waIRSPVZay1TNJaxL2j0i8=;
        b=IDsRVqt1H3wh71L1hDiqcy413CjttTDzTP+a6wrkqWx6FVe8u/oTUDlwF0EAJQ9XV+
         6QWrN6cHn7U/AyYmjm6DGLSz+MHxQoeY6j12s28MNNF06zXogVVYXw0TD8xTlUV5tMlL
         qHSWYMbuAK9NBnbNb5xl3L3Jpn08DsFkKsBce4XeNwUs6lX+VU8xFlM21YzEV0Wfn9/5
         jEIBMXhovMxhdHA3V3detKav734alaCq81X0rH/VARGvJCxhE81V4g2fcjGkh4xg1XD7
         ruFfOeJ0X0WW8Rholo9v2Wkor10rOgjNXEtJHKWI/YFCIbseotULD5mtrF4aeUXQLOH6
         MHQw==
X-Forwarded-Encrypted: i=1; AKwUvBzxKu1ChOgCGduQcCM1g0UxyN6nmesli6zbciYZIM6+mytUXur8oIjb2ZDR+iOEW6lq+YuQwo5B0VJh8IY=@vger.kernel.org
X-Gm-Message-State: AFuF++num60cfW6o6D/bmTERBfZWrK5QUua/ILXCGTBW6ZIWR4hw6nyx
	UiPjvHqF6OpDYGkNs7SnNN52BPCB2xmG53YE7bqUKJ0tH7ZE6BkFWWTUcpJZTKu5/O9lscSJ0Ba
	cR/TXXDMFXIwDR/sC6750j9lqG7nuPxA8HgZiUUKehgTV9AP7IZzypyW9OHrQYRhT
X-Gm-Gg: AYBFou2ZnmNL4gJ7ISjeL5eKEuXWjRGFst2Z1Yu5/KuwW9hXJTLflNQjQrFPMdKl1ZN
	4lbcqlNiG7SULW0jRNLmISfQz/7kZCso1JT1jWHrSLORrkjQYBKYEDL2jbhYWLRPszsmUsAdygD
	R8DAHGOui1zVoOCExxcNZU5cJ66sb080u+4qsYj7TNQva6l4n9nVFuvcf5Jci4DIkraR7cCbluA
	qU1NHrcLhvL0C8EhDMGjAbz5rKzoRUV8vIPSzGe7pHfAnGvLXGIW+dgE08l+y5dsvzq2qiMtjQB
	giEFJ9LZ+DK/wNwVQcCOf2ZNeBWS10jGx2MDnUtMlHicKKBmUJswXvznZDiOWlTIr39s2Z2Ac4N
	q23NEcYgmFVs4fMmkciNS
X-Received: by 2002:a05:651c:211b:b0:3a3:74b7:fc0c with SMTP id 38308e7fff4ca-3a63c4090b9mr3873541fa.24.1790232841667;
        Wed, 23 Sep 2026 23:54:01 -0700 (PDT)
X-Received: by 2002:a05:651c:211b:b0:3a3:74b7:fc0c with SMTP id 38308e7fff4ca-3a63c4090b9mr3873461fa.24.1790232841170;
        Wed, 23 Sep 2026 23:54:01 -0700 (PDT)
Received: from fedora (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a63bf57909sm4803141fa.29.2026.09.23.23.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 23:54:00 -0700 (PDT)
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
Subject: [PATCH v15 08/11] mm/hmm: implement rollback for device page migration in HMM pagewalk
Date: Thu, 24 Sep 2026 09:53:10 +0300
Message-ID: <20260924065313.899730-9-mpenttil@redhat.com>
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

During the migration pagewalk, the PTE table could be cleared
and/or changed into PMD leaf or even another PTE table while
dropped locks.

In these cases the possibly inserted migration ptes are gone.
We have to however undo the collecting done so far, so unlock
the folios and drop reference taken.

During the pagewalk we notice such scenarios if going to
recollect a pfn but have already committed to migrate the entry
with HMM_PFN_MIGRATE, in which case rollback.
If we encounter migration ptes they are just skipped to
allow for restart own walks.

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
 include/linux/hmm.h | 22 +++++++++++++
 mm/hmm.c            | 76 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 98 insertions(+)

diff --git a/include/linux/hmm.h b/include/linux/hmm.h
index 4f56f3419cb4..b08ebc1343dd 100644
--- a/include/linux/hmm.h
+++ b/include/linux/hmm.h
@@ -111,6 +111,28 @@ static inline unsigned int hmm_pfn_to_map_order(unsigned long hmm_pfn)
 	return (hmm_pfn >> HMM_PFN_ORDER_SHIFT) & 0x1F;
 }
 
+/*
+ * hmm_pfn_collected() - is this pfn entry prepared for migration ?
+ * If collected the folio's refcount is increased and the folio
+ * is locked.
+ */
+static inline bool hmm_pfn_collected(unsigned long hmm_pfn)
+{
+	return (hmm_pfn & (HMM_PFN_VALID | HMM_PFN_MIGRATE)) ==
+		(HMM_PFN_VALID | HMM_PFN_MIGRATE);
+}
+
+/*
+ * hmm_pfn_rollback_collected() - undoes the collection of hmm_pfn
+ *
+ * Note for total rollback the folio's refcount has to be put
+ * and folio has to be unlocked.
+ */
+static inline unsigned long hmm_pfn_rollback_collected(unsigned long hmm_pfn)
+{
+	return hmm_pfn & ~(HMM_PFN_VALID | HMM_PFN_MIGRATE | HMM_PFN_COMPOUND);
+}
+
 /*
  * struct hmm_range - track invalidation lock on virtual address range
  *
diff --git a/mm/hmm.c b/mm/hmm.c
index 9fdd945cc026..daf83f809151 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -95,6 +95,11 @@ enum {
 			      HMM_PFN_P2PDMA_BUS,
 };
 
+static void hmm_vma_handle_migrate_prepare_rollback(const struct hmm_vma_walk *hmm_vma_walk,
+						    unsigned long start,
+						    unsigned long end,
+						    unsigned long *hmm_pfn);
+
 static int hmm_pfns_fill(unsigned long addr, unsigned long end,
 			 struct hmm_vma_walk *hmm_vma_walk, unsigned long cpu_flags)
 {
@@ -111,6 +116,8 @@ static int hmm_pfns_fill(unsigned long addr, unsigned long end,
 		}
 	}
 
+	hmm_vma_handle_migrate_prepare_rollback(hmm_vma_walk, addr, end, &range->hmm_pfns[i]);
+
 	if (migrate && thp_migration_supported() &&
 	    (minfo & MIGRATE_VMA_SELECT_COMPOUND) &&
 	    IS_ALIGNED(addr, HPAGE_PMD_SIZE) &&
@@ -282,6 +289,8 @@ static int hmm_vma_handle_pmd(struct mm_walk *walk, unsigned long addr,
 		return hmm_record_fault(addr, end, required_fault, walk);
 	}
 
+	hmm_vma_handle_migrate_prepare_rollback(hmm_vma_walk, addr,
+						end, hmm_pfns);
 	pfn = pmd_pfn(pmd) + ((addr & ~PMD_MASK) >> PAGE_SHIFT);
 	for (i = 0; addr < end; addr += PAGE_SIZE, i++, pfn++) {
 		hmm_pfns[i] &= HMM_PFN_INOUT_FLAGS;
@@ -412,6 +421,9 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 
 	new_pfn_flags = pte_pfn(pte) | cpu_flags;
 out:
+	hmm_vma_handle_migrate_prepare_rollback(hmm_vma_walk, addr,
+						addr + PAGE_SIZE,
+						hmm_pfn);
 	*hmm_pfn = (*hmm_pfn & HMM_PFN_INOUT_FLAGS) | new_pfn_flags;
 	return 0;
 
@@ -450,6 +462,9 @@ static int hmm_vma_handle_absent_pmd(struct mm_walk *walk, unsigned long start,
 		if (softleaf_is_device_private_write(entry))
 			cpu_flags |= HMM_PFN_WRITE;
 
+		hmm_vma_handle_migrate_prepare_rollback(hmm_vma_walk,
+							start, end,
+							hmm_pfns);
 		/*
 		 * Fully populate the PFN list though subsequent PFNs could be
 		 * inferred, because drivers which are not yet aware of large
@@ -568,6 +583,48 @@ static int migrate_vma_split_folio(struct folio *folio,
 	return __migrate_vma_split_folio(folio, fault_page);
 }
 
+/*
+ * Due to dropping ptl locks for splitting for instance, would we
+ * overwrite already collected pfns? This could happen when pmd
+ * pointing to a page table has vanished and been replaced
+ * with a leaf pmd, or another page table.
+ * In that case unref and unlock the folios,
+ * the pfns of which were collected from the disappeared
+ * page tables.
+ */
+static void hmm_vma_handle_migrate_prepare_rollback(const struct hmm_vma_walk *hmm_vma_walk,
+						    unsigned long start,
+						    unsigned long end,
+						    unsigned long *hmm_pfn)
+{
+	struct hmm_range *range = hmm_vma_walk->range;
+	struct migrate_vma *migrate = range->migrate;
+	struct folio *fault_folio = NULL;
+	enum migrate_vma_info minfo;
+	struct folio *folio;
+	unsigned long i;
+
+	minfo = hmm_select_migrate(range);
+	if (!minfo)
+		return;
+
+	WARN_ON_ONCE(!migrate);
+
+	fault_folio = migrate->fault_page ?
+		page_folio(migrate->fault_page) : NULL;
+
+	for (i = 0; start < end; start += PAGE_SIZE, i++) {
+		if (hmm_pfn_collected(hmm_pfn[i])) {
+			folio = page_folio(hmm_pfn_to_page(hmm_pfn[i]));
+			if (folio != fault_folio)
+				folio_unlock(folio);
+			folio_put(folio);
+			hmm_pfn[i] = hmm_pfn_rollback_collected(hmm_pfn[i]);
+
+		}
+	}
+}
+
 static int hmm_vma_handle_migrate_prepare_pmd(const struct mm_walk *walk,
 					      pmd_t *pmdp,
 					      unsigned long start,
@@ -722,6 +779,11 @@ static int hmm_vma_handle_migrate_prepare(const struct mm_walk *walk,
 	pte = ptep_get(ptep);
 
 	if (pte_none(pte)) {
+		hmm_vma_handle_migrate_prepare_rollback(hmm_vma_walk,
+							addr,
+							addr + PAGE_SIZE,
+							hmm_pfn);
+
 		if (vma_is_anonymous(walk->vma)) {
 			*hmm_pfn &= HMM_PFN_INOUT_FLAGS;
 			*hmm_pfn |= HMM_PFN_MIGRATE;
@@ -769,6 +831,10 @@ static int hmm_vma_handle_migrate_prepare(const struct mm_walk *walk,
 		pfn = pte_pfn(pte);
 		if (is_zero_pfn(pfn) &&
 		    (minfo & MIGRATE_VMA_SELECT_SYSTEM)) {
+			hmm_vma_handle_migrate_prepare_rollback(hmm_vma_walk,
+								addr,
+								addr + PAGE_SIZE,
+								hmm_pfn);
 			*hmm_pfn = HMM_PFN_MIGRATE;
 			goto out;
 		}
@@ -897,6 +963,13 @@ static int hmm_vma_handle_migrate_prepare(const struct mm_walk *walk,
 }
 
 #else
+static void hmm_vma_handle_migrate_prepare_rollback(const struct hmm_vma_walk *hmm_vma_walk,
+						    unsigned long start,
+						    unsigned long end,
+						    unsigned long *hmm_pfn)
+{
+}
+
 static int hmm_vma_handle_migrate_prepare_pmd(const struct mm_walk *walk,
 					      pmd_t *pmdp,
 					      unsigned long start,
@@ -1117,6 +1190,9 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
 		if (ptep) {
 			lazy_mmu_mode_enable();
 			hmm_vma_walk->ptelocked = true;
+		} else {
+			/* The pte table is gone */
+			hmm_vma_handle_migrate_prepare_rollback(walk->private, addr, end, hmm_pfns);
 		}
 	} else {
 		ptep = pte_offset_map(pmdp, addr);
-- 
2.55.0

