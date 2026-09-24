Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D2D418342
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790232835; cv=none; b=iEVLm8iAGFJK454YrcFCdeiGqqZYvporr4tFIcbt7lR7TI5wN6xteOl6G79q6rBSaRB38L9YHMeyiFGp2sPLMLq+92rrj6xBYahqANnk9LwLOVRvmIrEcJpdKFQ7qx2MaVo2zu8+Y7AlhP2M3nTQaKWIx9L3My2EqDJs0Vit2vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790232835; c=relaxed/simple;
	bh=VrmX+POa5H5GflwtqXqdfjjgLIkBtAzF+h//OZga+AY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iXEn9fldaqEW/RE4cDieMFOh9sEaIaM/FrDAUVz8DbYfL5XmzDZWiAP4c+nhPY6/7zHHReR6jBXBVMYAEspTVQnzEuSkR5veLydrUuhwINs9ST1kLdpFwAJ805TlfqtP4kP+47Z91TkzVAipfX+w9SqsBISkrpfcV7AoAn9lr+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EMqr4TXK; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fkCbbLc5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EMqr4TXK";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fkCbbLc5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790232822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kki3z56ATUJrZFB3MBKMIKwGUeQgKMm6Uy7jrjVIGAU=;
	b=EMqr4TXKXe0tgZaaXEXNblm2wTy4LEK6EJsBY+tZ5jBePu1JFSYm67sodHjnKkjA3BjjkL
	J4B65SaYytivESNTnM3mhg0gOunQ4HWqfDS/ed+Vm6ucPUSTRFogCinnsEPeAaAv+9TIww
	BUNMVQdwl9SV+EdQLnYyp98sJeBUxlQ=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-z4E4nGeiPdKyEYzt4XNNTA-1; Thu, 24 Sep 2026 02:53:40 -0400
X-MC-Unique: z4E4nGeiPdKyEYzt4XNNTA-1
X-Mimecast-MFC-AGG-ID: z4E4nGeiPdKyEYzt4XNNTA_1790232819
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-3a27721662eso7920391fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790232819; x=1790837619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kki3z56ATUJrZFB3MBKMIKwGUeQgKMm6Uy7jrjVIGAU=;
        b=fkCbbLc58K5rCEyBgVACOVqL/2ZXUdHf64ppWFjd9maFuX0gk7Hw2xQpotJ4Oavf/s
         JpLelxEDoC/x+xpOOccOltjXAQBuz7yFI6eqcJwTIe1im8HXjzenfDF6w84MieN5iy8j
         KDQ4soYP69Bdyt5YCZhqU1/57uf02gceQQlqxYe5J/fXkmPrnj/fP8yhkrEEP/5ry+Yt
         HtzomuuGGBNSqwZFCJZidvOxH2gJ2cD2Vc/Mm41gm7eUIyl7MorhMaEzNNhhlcwCU8rH
         bunJqtzKLAoIwJNT60lHMfiOguiD2jMfaUx9E1YZdfoCqqjYwEiOCY0gdwi0jROrmB/T
         qtHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790232819; x=1790837619;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kki3z56ATUJrZFB3MBKMIKwGUeQgKMm6Uy7jrjVIGAU=;
        b=Pqiygt/BmfNycEkleHuqxvDM+yC1i3klcynWK7VjU04TPV/1+adOSqD7WTYt9910As
         m1qEj9mMZhTxIcuOd79mbJ/eZv2naecZ32Lftkk3C2rXf/2dvB3idv5rtn1TOPHloBaD
         Zs5a8nc0VKe/n5I9whCqkQdta7UMya3YMnkkqM2NlJi9J6IW/USiyo+6j1Go7tjkqla7
         +7hc4FJu+8rfPzEjNR7+v89zgqEPWCXOJU9jbSfh6qhDlOHy94+6l/fDWCxF3XEnwqRT
         zTcu9UrfwXkfWm+QzpKFHDM0XhpXvGDhOVTiLkC+e0CqCgX9pmWAJeYOkRug2j4qW27G
         II7A==
X-Forwarded-Encrypted: i=1; AKwUvBz4ndll8MOULD3rEGrno24i+JKdPokLHSaunogRRznBuBdtGbxcDOwwx8fuHMYYs1uBNECjXdmNQJssCxs=@vger.kernel.org
X-Gm-Message-State: AFuF++m1XdnW1gxI3BX/wMjmgw7hwhZAnUbkHBWJjkec8AnHCZENo2jK
	PPD3S7T2IrT+xvb4H1877Hw1vtobXlHCjZ6GL+X0WL3ax55NkFRbDg6IhJUxedTzvVjTu0wNSJw
	yeq++/GA933ZpiWa4akJWLsgB44JZJudLzTRyn7SQLXIJccJRX+Dan8li+2ZKDcrz
X-Gm-Gg: AYBFou1/HV/95XKbHhUmORACJFCUWI3ZCdmrxvFdWRNmwfsSzColriFKczy3NsjJEYY
	HZk5Ihcqfi+AFthuDE5Gi3nFQbLm61kf2lnHi966irP4f5RXR1KUBXGeJjp+1Ep6Dl0NYMOmESS
	DEufOB9ZUBUW/QpsFulJ+9QaUj3W12Zlj/cNIE2oBVrfb0tFpenoJEz7iefJ2ArRznPIhW99r7K
	fw7eBwaXierNeYpk7QBhhqenE2jOS88HOuqLphzXlQ1HwpwT+88d0OU63luUA9GjuxkRH+bsywD
	oBvmop3FpKcMwCtg9l7qU3ZadV94dhXr/CmdrNWAqL85fx7MRN3FkYqlCJf/OEPOLULM9AAWJ4U
	fkpbsgbgz3Po6O2gN8w3JN8zdZZU5B/Y=
X-Received: by 2002:a05:651c:b0a:b0:3a3:749e:319b with SMTP id 38308e7fff4ca-3a63de182e4mr2715091fa.15.1790232819299;
        Wed, 23 Sep 2026 23:53:39 -0700 (PDT)
X-Received: by 2002:a05:651c:b0a:b0:3a3:749e:319b with SMTP id 38308e7fff4ca-3a63de182e4mr2714961fa.15.1790232818795;
        Wed, 23 Sep 2026 23:53:38 -0700 (PDT)
Received: from fedora (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a63bf57909sm4803141fa.29.2026.09.23.23.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 23:53:36 -0700 (PDT)
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
Subject: [PATCH v15 03/11] mm/hmm: preparations for HMM to participate in migration
Date: Thu, 24 Sep 2026 09:53:05 +0300
Message-ID: <20260924065313.899730-4-mpenttil@redhat.com>
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

For migration to happen after hmm_range_fault(), the vma has to
retrieved. Luckily, pagewalk already resolves that for us, so
just have to save it for further use. For migration, mmap_lock
has to be hold for the whole operation, so vma stays stable.
In case lock-drop behavior is requested, return an error while
migrating. Also, rename some struct hmm_vma_walk fields to solve
namespace collisions, and we are later introducing more
xxlocked fields so be unambiguous.

Take care also of firing the mmu_notifier when migrating.

Also, prepare for differencies of how mm_struct * is retrieved
in fault and migrate_vma paths.

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
 include/linux/migrate.h |  49 +++++++++++++++++-
 lib/test_hmm.c          |   2 +-
 mm/hmm.c                | 110 ++++++++++++++++++++++++++++++++++------
 3 files changed, 144 insertions(+), 17 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 280ec9a866c7..01c5f62a56e9 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -5,6 +5,7 @@
 #include <linux/mm.h>
 #include <linux/hmm.h>
 #include <linux/mempolicy.h>
+#include <linux/mmu_notifier.h>
 #include <linux/migrate_mode.h>
 #include <linux/hugetlb.h>
 
@@ -108,6 +109,29 @@ static inline void softleaf_entry_wait_on_locked(softleaf_t entry, spinlock_t *p
 	spin_unlock(ptl);
 }
 
+enum migrate_vma_info {
+	MIGRATE_VMA_SELECT_NONE = 0,
+	MIGRATE_VMA_SELECT_COMPOUND = MIGRATE_VMA_SELECT_NONE,
+};
+
+static inline enum migrate_vma_info hmm_select_migrate(struct hmm_range *range)
+{
+	return MIGRATE_VMA_SELECT_NONE;
+}
+
+static inline void hmm_fill_migrate_vma(struct hmm_range *range,
+					struct vm_area_struct *vma,
+					unsigned long start,
+					unsigned long end)
+{
+}
+
+#ifdef CONFIG_MMU_NOTIFIER
+static inline struct mm_struct *hmm_range_fault_mm(struct hmm_range *range)
+{
+	return range->notifier->mm;
+}
+#endif
 #endif /* CONFIG_MIGRATION */
 
 #ifdef CONFIG_NUMA_BALANCING
@@ -151,7 +175,7 @@ static inline unsigned long migrate_pfn(unsigned long pfn)
 	return (pfn << MIGRATE_PFN_SHIFT) | MIGRATE_PFN_VALID;
 }
 
-enum migrate_vma_direction {
+enum migrate_vma_info {
 	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
 	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
 	MIGRATE_VMA_SELECT_DEVICE_COHERENT = 1 << 2,
@@ -193,6 +217,29 @@ struct migrate_vma {
 	struct page		*fault_page;
 };
 
+// TODO: enable migration
+static inline enum migrate_vma_info hmm_select_migrate(struct hmm_range *range)
+{
+	return 0;
+}
+
+#ifdef CONFIG_MMU_NOTIFIER
+static inline struct mm_struct *hmm_range_fault_mm(struct hmm_range *range)
+{
+	return range->notifier ? range->notifier->mm : range->migrate->vma->vm_mm;
+}
+#endif
+
+static inline void hmm_fill_migrate_vma(struct hmm_range *range,
+					struct vm_area_struct *vma,
+					unsigned long start,
+					unsigned long end)
+{
+	range->migrate->vma   = vma;
+	range->migrate->start = start;
+	range->migrate->end   = end;
+}
+
 int migrate_vma_setup(struct migrate_vma *args);
 void migrate_vma_pages(struct migrate_vma *migrate);
 void migrate_vma_finalize(struct migrate_vma *migrate);
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 6911daa9f854..cd88e8177d0a 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -145,7 +145,7 @@ static bool dmirror_is_private_zone(struct dmirror_device *mdevice)
 		HMM_DMIRROR_MEMORY_DEVICE_PRIVATE);
 }
 
-static enum migrate_vma_direction
+static enum migrate_vma_info
 dmirror_select_device(struct dmirror *dmirror)
 {
 	return (dmirror->mdevice->zone_device_type ==
diff --git a/mm/hmm.c b/mm/hmm.c
index 2f1e98c6b644..4e9542aedc25 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -21,6 +21,7 @@
 #include <linux/pagemap.h>
 #include <linux/leafops.h>
 #include <linux/hugetlb.h>
+#include <linux/migrate.h>
 #include <linux/memremap.h>
 #include <linux/sched/mm.h>
 #include <linux/jump_label.h>
@@ -28,15 +29,23 @@
 #include <linux/pci-p2pdma.h>
 #include <linux/mmu_notifier.h>
 #include <linux/memory_hotplug.h>
+#include <asm/tlbflush.h>
 
 #include "internal.h"
 
 struct hmm_vma_walk {
-	struct hmm_range	*range;
-	bool			*locked;
-	unsigned long		last;
-	unsigned long		end;
-	unsigned int		required_fault;
+	struct mmu_notifier_range	mmu_range;
+	/* Set once mmu_range is armed with mmu_notifier_invalidate_range_start() */
+	bool				mmu_armed;
+	struct vm_area_struct		*vma;
+	struct hmm_range		*range;
+	unsigned long			start;
+	unsigned long			end;
+	unsigned long			last;
+	/* fault and lock drop related fields */
+	bool				*mmlocked;
+	unsigned long			fault_end;
+	unsigned int			required_fault;
 };
 
 /*
@@ -95,7 +104,7 @@ static int hmm_record_fault(unsigned long addr, unsigned long end,
 
 	WARN_ON_ONCE(!required_fault);
 	hmm_vma_walk->last = addr;
-	hmm_vma_walk->end = end;
+	hmm_vma_walk->fault_end = end;
 	hmm_vma_walk->required_fault = required_fault;
 	return HMM_FAULT_PENDING;
 }
@@ -400,6 +409,58 @@ static int hmm_vma_handle_absent_pmd(struct mm_walk *walk, unsigned long start,
 }
 #endif  /* CONFIG_ARCH_HAS_PMD_SOFTLEAVES */
 
+static int hmm_vma_capture_migrate_range(unsigned long start,
+					 unsigned long end,
+					 struct mm_walk *walk)
+{
+	struct hmm_vma_walk *hmm_vma_walk = walk->private;
+	struct hmm_range *range = hmm_vma_walk->range;
+
+	if (!hmm_select_migrate(range))
+		return 0;
+
+	if (hmm_vma_walk->vma && (hmm_vma_walk->vma != walk->vma))
+		return -ERANGE;
+
+	hmm_vma_walk->vma = walk->vma;
+
+	if (end - start > range->end - range->start)
+		return -ERANGE;
+
+	if (!hmm_vma_walk->mmu_armed) {
+		hmm_vma_walk->start = start;
+		hmm_vma_walk->end = end;
+		mmu_notifier_range_init_owner(&hmm_vma_walk->mmu_range, MMU_NOTIFY_MIGRATE, 0,
+					      walk->vma->vm_mm, start, end,
+					      range->dev_private_owner);
+		mmu_notifier_invalidate_range_start(&hmm_vma_walk->mmu_range);
+		hmm_vma_walk->mmu_armed = true;
+	}
+
+	return 0;
+}
+
+static void hmm_vma_post_range_fault(struct hmm_vma_walk *hmm_vma_walk)
+{
+
+	struct hmm_range *range = hmm_vma_walk->range;
+
+	if (hmm_select_migrate(range) &&
+	    hmm_vma_walk->mmu_armed) {
+		/*
+		 *  The migrate_vma path has the following initialized,
+		 *  so take care of fault path below.
+		 */
+		if (range->notifier) {
+			hmm_fill_migrate_vma(range,
+					     hmm_vma_walk->vma,
+					     hmm_vma_walk->start,
+					     hmm_vma_walk->end);
+		}
+		mmu_notifier_invalidate_range_end(&hmm_vma_walk->mmu_range);
+	}
+}
+
 static int hmm_vma_walk_pmd(pmd_t *pmdp,
 			    unsigned long start,
 			    unsigned long end,
@@ -594,6 +655,11 @@ static int hmm_vma_walk_test(unsigned long start, unsigned long end,
 	struct hmm_vma_walk *hmm_vma_walk = walk->private;
 	struct hmm_range *range = hmm_vma_walk->range;
 	struct vm_area_struct *vma = walk->vma;
+	int r;
+
+	r = hmm_vma_capture_migrate_range(start, end, walk);
+	if (r)
+		return r;
 
 	if (!(vma->vm_flags & (VM_IO | VM_PFNMAP)) &&
 	    vma->vm_flags & VM_READ)
@@ -646,12 +712,12 @@ static int hmm_do_fault(struct mm_struct *mm,
 			struct hmm_vma_walk *hmm_vma_walk)
 {
 	unsigned long addr = hmm_vma_walk->last;
-	unsigned long end = hmm_vma_walk->end;
+	unsigned long end = hmm_vma_walk->fault_end;
 	unsigned int required_fault = hmm_vma_walk->required_fault;
 	unsigned int fault_flags = FAULT_FLAG_REMOTE;
 	struct vm_area_struct *vma;
 
-	if (hmm_vma_walk->locked)
+	if (hmm_vma_walk->mmlocked)
 		fault_flags |= FAULT_FLAG_ALLOW_RETRY | FAULT_FLAG_KILLABLE;
 
 	vma = vma_lookup(mm, addr);
@@ -670,8 +736,8 @@ static int hmm_do_fault(struct mm_struct *mm,
 		ret = handle_mm_fault(vma, addr, fault_flags, NULL);
 
 		if (ret & (VM_FAULT_COMPLETED | VM_FAULT_RETRY)) {
-			if (hmm_vma_walk->locked)    /* needed by sparse */
-				*hmm_vma_walk->locked = false;
+			if (hmm_vma_walk->mmlocked)    /* needed by sparse */
+				*hmm_vma_walk->mmlocked = false;
 			else
 				WARN_ON_ONCE(1);    /* broken fault handler */
 			return HMM_FAULT_UNLOCKED;
@@ -694,19 +760,31 @@ static int hmm_range_fault_locked(struct hmm_range *range, bool *locked)
 {
 	struct hmm_vma_walk hmm_vma_walk = {
 		.range = range,
-		.locked = locked,
+		.mmlocked = locked,
 		.last = range->start,
 	};
-	struct mm_struct *mm = range->notifier->mm;
+	/*
+	 *  Could be serving a device fault or come from migrate
+	 *  entry point. For the former we have not resolved the vma
+	 *  yet, and the latter we don't have a notifier (but have a vma).
+	 *
+	 */
+	struct mm_struct *mm = hmm_range_fault_mm(range);
 	int ret;
 
+	/* Migration is incompatible with mmap lock drop */
+	if (locked && hmm_select_migrate(range))
+		return -EINVAL;
+
 	mmap_assert_locked(mm);
 
 	do {
 		/* If range is no longer valid force retry. */
-		if (mmu_interval_check_retry(range->notifier,
-					     range->notifier_seq))
-			return -EBUSY;
+		if (range->notifier && mmu_interval_check_retry(range->notifier,
+								range->notifier_seq)) {
+			ret =  -EBUSY;
+			break;
+		}
 		ret = walk_page_range(mm, hmm_vma_walk.last, range->end,
 				      &hmm_walk_ops, &hmm_vma_walk);
 		/*
@@ -732,6 +810,8 @@ static int hmm_range_fault_locked(struct hmm_range *range, bool *locked)
 		 * output, and all >= are still at their input values.
 		 */
 	} while (ret == -EBUSY);
+
+	hmm_vma_post_range_fault(&hmm_vma_walk);
 	return ret;
 }
 
-- 
2.55.0

