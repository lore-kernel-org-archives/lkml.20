Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A84489FA5
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790055314; cv=none; b=LAHkPnmYHkVSL5F5klfhiC3qIVkBlSVwfjEW7jUinRXGXju4hpJ79UfiQtJ336YFvxNOAbRcfQ1lBqHbcRUBmx6p4zvQarkK7tuCdzWzXTCfjYMhAGX9p0vLlczAyp8Q1wD1GI/1Dz9cmsMRt9nDypjwZ+9rlFByos+DUxPbIXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790055314; c=relaxed/simple;
	bh=yJ4/zDONc3VCH7yVvFo4yUz4R7da9SYeZ7rFR34pviU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KvROQnuJECF4Y0AEdqlcZrgIi4wQyyF+SoakSx+joiNwZNMKmUMXwkbvN/NHypSUj1Kf+dwWOBIvqONjYF5oCt77GbgLTlcUx50goB4CIWPrcB5lT786j2bpFALbd3WDflI91Pu/jHVvBlOZBpwu+Kx5N+JzbQYWAtzgIRe2V1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PXHJ5KCA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=cYQN3rzp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PXHJ5KCA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="cYQN3rzp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790055311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bfS04+9MgqTJr7/AuJyf/BgMvbHeqVFk8HMCC4JI/vk=;
	b=PXHJ5KCABOnYV7gYljO1rX9sC27ooKUiQNj4HYHhVdyA4/j1d2M116/ZjhEIRAONX9BizT
	4tIhXGD0sddbq/syhvSsCj+q1/k5kgIlvtwkA1QYn/7X6vLdR7OCYH+uEg/RhkWzASCQWo
	0CukFT4hh9Bpddo/qecfRxngltrIDy8=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-SVYkO5SIOeSXamBk1sShAQ-1; Tue, 22 Sep 2026 01:35:09 -0400
X-MC-Unique: SVYkO5SIOeSXamBk1sShAQ-1
X-Mimecast-MFC-AGG-ID: SVYkO5SIOeSXamBk1sShAQ_1790055308
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-5b767214d60so283660e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790055308; x=1790660108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bfS04+9MgqTJr7/AuJyf/BgMvbHeqVFk8HMCC4JI/vk=;
        b=cYQN3rzpBTSfyZ5ycs9TUbyPSjJKoMCoeSYV6yZCxlFsaqJaHpCMNK35gGK600G7Zb
         qEQK37QK4gUHvqaKfCT/GBwPIy+CNp3cWOx+RMGZmu3LbTUCmzZbaDbEmRMqJAjrvAiK
         UyyM5HAJGeSZ2QDQMbOxIP1kaAFsF4UVGDa6B0JwRghSD1nspalxlYt8iou+b1cjqtRQ
         b16KFlvvbWOGLSkxEMa+lpHeZst7BVZHrRokxW9lvQiwjWgtrlM8pdNKH0HRoI3SzA6V
         uIMBhe9hfGWK/dxFHpJmKdQ+z/ri4ulp/b+CUj82yfaij9FgbHRaFlEglTzKVu55gLz7
         Jvfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790055308; x=1790660108;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bfS04+9MgqTJr7/AuJyf/BgMvbHeqVFk8HMCC4JI/vk=;
        b=L48mFfE5pzDoMacSjx2/l7JCyxrRZ+SKo4Pt/zjrgUkSa9VT7yAIs6uqGK47Ub76lI
         +ycPVdM03OALj+mb4wEBNy52JZQ9hXl7dIwxAZBM6spxDlQNLSYKpsB5kQp5qZz4Me9E
         Uq5nm2W11uOwGC7AWzPTo1VuhV80UsVQRdHszrv7KGZ2SSVCi8gap7BXZqaq5qeTbkb5
         iDibe5225wFgbeejEpk2bXwTlNkJ6C4A6NKuwn6bOU9W+v7o/m3T2pMJwHEso6F7OtrA
         cIJ7/izfNUZyjsZGzj9gG2+MSqG6d4d5/0VkXQ3DWQDroHGcgSZ3zcExK46I/UGX3Et/
         oj8w==
X-Forwarded-Encrypted: i=1; AKwUvBwlUrGhTz2xicUWRPPECD1FIgyTB7z8X0LSAjuUVOc21FCSin98y7lJio5w0bUWBAXiFrZ4OXaTtdDfasg=@vger.kernel.org
X-Gm-Message-State: AFuF++nuK/pboh/QQA7KrXvRwvkmPW31CziFTZrddE/gQ9fgleukyXI4
	5vq0GmeQxDNJ1pxcZZaOZkG0cVp04aDzPtf7OgvmQ3mLAJZrf8P8vzFafrQQlhpQjbkdywSFrFG
	qELWM8hZevWxgg0/bUiBuRrFlmW+amXI3sJIRGV3Gl9M927+VqwSCv/Mlg0J3yGYN
X-Gm-Gg: AYBFou0bIqva9ha0AhkYfGvmy5lax7IeEkhsr/FdWlKHhYgJmBAn7OcyHdxt72Qu88W
	HU5hsgyC+1Xzyhxjn+J4xdaLTVOY367/KGCXCrjharar4eD4i6AsPjMF59c5g+CaOZqitvLy6QP
	M5/Yh0ziVmwiPeRVXQvwmi3oNbtN9NBaoFyRV44AVOq64swAsnNFYrVhn0OtSbCQZVGrh7aslRR
	E+MpmJdO84OejJRnlq3NECjlriYzgH0xNveWyzKs9eD8BhVzgWENDjvxSwbXQOziYilq0fwJYEf
	2PZP341CXDuxKdrLoMS0TghAeTCx9KadjRE1hxDec2JSa95NjGBZz5TKiBYOP1xnsyWrJDebcfv
	qtR8FXoIqFhpms75apqwh
X-Received: by 2002:a05:6512:4884:b0:5b6:10bc:dc47 with SMTP id 2adb3069b0e04-5b8d2945a50mr296474e87.30.1790055308114;
        Mon, 21 Sep 2026 22:35:08 -0700 (PDT)
X-Received: by 2002:a05:6512:4884:b0:5b6:10bc:dc47 with SMTP id 2adb3069b0e04-5b8d2945a50mr296458e87.30.1790055307602;
        Mon, 21 Sep 2026 22:35:07 -0700 (PDT)
Received: from fedora (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d46e0966sm191742e87.55.2026.09.21.22.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 22:35:05 -0700 (PDT)
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
Subject: [PATCH v14 09/12] mm/hmm: implement rollback for device page migration in HMM pagewalk
Date: Tue, 22 Sep 2026 08:34:18 +0300
Message-ID: <20260922053421.4092027-10-mpenttil@redhat.com>
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
index a67a23e54551..e64444cbc62a 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -93,6 +93,11 @@ enum {
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
@@ -109,6 +114,8 @@ static int hmm_pfns_fill(unsigned long addr, unsigned long end,
 		}
 	}
 
+	hmm_vma_handle_migrate_prepare_rollback(hmm_vma_walk, addr, end, &range->hmm_pfns[i]);
+
 	if (migrate && thp_migration_supported() &&
 	    (minfo & MIGRATE_VMA_SELECT_COMPOUND) &&
 	    IS_ALIGNED(addr, HPAGE_PMD_SIZE) &&
@@ -280,6 +287,8 @@ static int hmm_vma_handle_pmd(struct mm_walk *walk, unsigned long addr,
 		return hmm_record_fault(addr, end, required_fault, walk);
 	}
 
+	hmm_vma_handle_migrate_prepare_rollback(hmm_vma_walk, addr,
+						end, hmm_pfns);
 	pfn = pmd_pfn(pmd) + ((addr & ~PMD_MASK) >> PAGE_SHIFT);
 	for (i = 0; addr < end; addr += PAGE_SIZE, i++, pfn++) {
 		hmm_pfns[i] &= HMM_PFN_INOUT_FLAGS;
@@ -410,6 +419,9 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 
 	new_pfn_flags = pte_pfn(pte) | cpu_flags;
 out:
+	hmm_vma_handle_migrate_prepare_rollback(hmm_vma_walk, addr,
+						addr + PAGE_SIZE,
+						hmm_pfn);
 	*hmm_pfn = (*hmm_pfn & HMM_PFN_INOUT_FLAGS) | new_pfn_flags;
 	return 0;
 
@@ -448,6 +460,9 @@ static int hmm_vma_handle_absent_pmd(struct mm_walk *walk, unsigned long start,
 		if (softleaf_is_device_private_write(entry))
 			cpu_flags |= HMM_PFN_WRITE;
 
+		hmm_vma_handle_migrate_prepare_rollback(hmm_vma_walk,
+							start, end,
+							hmm_pfns);
 		/*
 		 * Fully populate the PFN list though subsequent PFNs could be
 		 * inferred, because drivers which are not yet aware of large
@@ -550,6 +565,48 @@ static int migrate_vma_split_folio(struct folio *folio,
 	return 0;
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
@@ -693,6 +750,11 @@ static int hmm_vma_handle_migrate_prepare(const struct mm_walk *walk,
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
@@ -740,6 +802,10 @@ static int hmm_vma_handle_migrate_prepare(const struct mm_walk *walk,
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
@@ -916,6 +982,13 @@ static int hmm_vma_walk_split(pmd_t *pmdp,
 	return ret;
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
@@ -1142,6 +1215,9 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
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

