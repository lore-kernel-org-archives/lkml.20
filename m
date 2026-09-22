Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CAE488DB6
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790055294; cv=none; b=hCQoLc4R+8zykdh7u3YX091wQj1DfHtHFSgSzSnhjjOhytM3fogOz8J5Tjfc/kfWUFM3cojBL8ueMmlKAdN6ycFvcOug1xF6LqSc2bUjXUoEYvI/Ir3oWXNPPw5fRLJrCBV4iqDfExUROQKDXUJQDctzpMHnJ3CpmmGlvlrEDc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790055294; c=relaxed/simple;
	bh=+YqWnUjPR4QlAzmXvCT0RkKU/SuOrgunbWSL3HKniBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kv9ZWNA/8xXMfgSbO7II+Tr2H0htst1r8dfu8UqHvCijvKs1h9kcqDx99oqiNx7aDjJ1sqWsqY8afoRa+YnAzIhvxVqE6b3C3/Axt7UN1XkksRZ+Ep4V/RdshWLG8VpLfYhG2e3Ml65Ba+gjm65JOvYu0rwcfAAvdXU5psmlgGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bU0Si8+q; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=JSLUxzxi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bU0Si8+q";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="JSLUxzxi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790055291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ggFf9vsm/p6yby6h1KHVQFgSLVs+0wCPIsczXGIceWQ=;
	b=bU0Si8+qdlCmbYYjsaz5hxhfgyeyQ6nH8goihzL7cvjPsa2mTy5QLbRTuE1iBNz6PWgx5l
	5jEyv5DvdeZytfLfIOMod1jkX8varMMF8q1qyS6YfzsCuY1Gank0rNEc4f5TUgSb2X6dvP
	0VjmgNgK448Gmhn1IHXywEkZQ1WjovQ=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-567-hh0UDpvUPdGenAr7uzWyMQ-1; Tue, 22 Sep 2026 01:34:50 -0400
X-MC-Unique: hh0UDpvUPdGenAr7uzWyMQ-1
X-Mimecast-MFC-AGG-ID: hh0UDpvUPdGenAr7uzWyMQ_1790055289
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-5b609be5e96so2237383e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790055289; x=1790660089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ggFf9vsm/p6yby6h1KHVQFgSLVs+0wCPIsczXGIceWQ=;
        b=JSLUxzxi2o1CZ/efEKO3iLkwRbLpJD76XEWzEpNIT6+ukMg4hAwd1lB9pi1+tdNEov
         bBpwO8qGdYU8EE/4s0ihG/Ji8HU0B52lx3xuf6UsxB3P/maIcQDbH8Dy/12VFY/vR5kp
         mgTzvDDpV0Px6AXHBf0/RYGoJ4lQYb/3auj5r9mB/aIEfIMyPfS38ESznTfMa0WB5rHV
         eoLNKRgNyZjCvaJ4LIX+uCnnkVjAxwXfB1JMSODZkzpbNiGIshPDXgBBs/TMxenkPmPv
         bVb7A9XVAF7DAQmYt7h1OaC/QdUfu78jqXSmXs5FJw6eB5veO67QuNPzPuvwmlwDFmuY
         7Sdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790055289; x=1790660089;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ggFf9vsm/p6yby6h1KHVQFgSLVs+0wCPIsczXGIceWQ=;
        b=oq5pPWjbmVsNS6v8MXIUNX2rE+SWV+kPaWjClb7TIBxSG7CX7LFenOKuhV68hMnBGh
         8TFxpoyuHHeKXYzQgS7V39vfW9U4ALxz8/WZM8GeSM2kapFfWKdbnKuXVrdwxSHGvBOu
         L/oca94J+Xd9NthmVrLofrBG3PYRW+Gi3gy+7efLw7pAbE7SvqKIV7ZgZ+DVGb4aCD5j
         yv04dSqD0RNqZbF8/1Vyv0Z2oRMVM9bX9eBNNcGM7/OqkSQOeZLiTqJx5w0alxYoT5ty
         J7MYhxIBCwncOGsYDkM09WNij9eo+Qi84wClO3/2JmtkqEUkRXGpUJwuJ2jM/nQ4icqz
         vGiQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/xHg/dCqv6aSjGc5178+xcZowOuZS2m0/cSl1BLA3TGyWEbrckIZuPa4EcQ6G23TAVoGRfGiWvwSe0T4=@vger.kernel.org
X-Gm-Message-State: AFuF++lVmaJmaPnGECHfHF2fiK/tGR+r92+XhND6RHCq/MNEg7v+QuMe
	WmQZYfAJmQsdjx6VmEvm8NNHvC9WVVEMkxckpFW66Qd6DiRb50JpzHy00wQfUfLa/JvFuhiTUT4
	FZJPi4di+84aajQRLx5cPTmSPDHIMlO2mPl36YgQLFzY9ZmLfUMHjt6V/JvGT4xa7
X-Gm-Gg: AYBFou2r9qHMSHhcR89QdsqrJmajAdVqz4i8aBj+kAiJwX7gSpRFcJb0k+nyqPOYG78
	r2H7GhN8Qw64c6tTeQijU8tY+p26zH4ICM4WAy42Q4D745ip1CcwTqDKOV3kXkpnie0kv1Jpl7R
	a5FvBFT16RFWIQcbLlnX4uNhJ2rRFP8AnYhfh0bUdKEL7ogM4U4/DK3bsjynFwpgxLa5bRfYLm3
	XRy1bcoOkzwLKGcEjUaxeKu44OyCknzJANNaJb+OSAXFD+jJH9ESj0HVwxGaKWWdw7joUvkdy9O
	PT4Rl2ZkO9Mn9sciS5axhhaNn6dG667NsJSQp2xPCxC+3a+tgn2IQBDX2aT/7ieestaiREgCh6V
	YWcnLY+HagMMay/MaVjUC
X-Received: by 2002:ac2:51c3:0:b0:5b4:b03e:b17 with SMTP id 2adb3069b0e04-5b8c17f19eemr4703898e87.4.1790055288826;
        Mon, 21 Sep 2026 22:34:48 -0700 (PDT)
X-Received: by 2002:ac2:51c3:0:b0:5b4:b03e:b17 with SMTP id 2adb3069b0e04-5b8c17f19eemr4703877e87.4.1790055288311;
        Mon, 21 Sep 2026 22:34:48 -0700 (PDT)
Received: from fedora (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d46e0966sm191742e87.55.2026.09.21.22.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 22:34:47 -0700 (PDT)
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
Subject: [PATCH v14 03/12] mm/hmm: preparations for HMM to participate in migration
Date: Tue, 22 Sep 2026 08:34:12 +0300
Message-ID: <20260922053421.4092027-4-mpenttil@redhat.com>
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
 mm/hmm.c                | 107 ++++++++++++++++++++++++++++++++++------
 3 files changed, 141 insertions(+), 17 deletions(-)

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
index 2f1e98c6b644..be39d2e5403a 100644
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
@@ -28,15 +29,21 @@
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
@@ -95,7 +102,7 @@ static int hmm_record_fault(unsigned long addr, unsigned long end,
 
 	WARN_ON_ONCE(!required_fault);
 	hmm_vma_walk->last = addr;
-	hmm_vma_walk->end = end;
+	hmm_vma_walk->fault_end = end;
 	hmm_vma_walk->required_fault = required_fault;
 	return HMM_FAULT_PENDING;
 }
@@ -400,6 +407,57 @@ static int hmm_vma_handle_absent_pmd(struct mm_walk *walk, unsigned long start,
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
+	hmm_vma_walk->start = start;
+	hmm_vma_walk->end = end;
+
+	if (end - start > range->end - range->start)
+		return -ERANGE;
+
+	if (!hmm_vma_walk->mmu_range.owner) {
+		mmu_notifier_range_init_owner(&hmm_vma_walk->mmu_range, MMU_NOTIFY_MIGRATE, 0,
+					      walk->vma->vm_mm, start, end,
+					      range->dev_private_owner);
+		mmu_notifier_invalidate_range_start(&hmm_vma_walk->mmu_range);
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
+	    hmm_vma_walk->mmu_range.owner) {
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
@@ -594,6 +652,11 @@ static int hmm_vma_walk_test(unsigned long start, unsigned long end,
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
@@ -646,12 +709,12 @@ static int hmm_do_fault(struct mm_struct *mm,
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
@@ -670,8 +733,8 @@ static int hmm_do_fault(struct mm_struct *mm,
 		ret = handle_mm_fault(vma, addr, fault_flags, NULL);
 
 		if (ret & (VM_FAULT_COMPLETED | VM_FAULT_RETRY)) {
-			if (hmm_vma_walk->locked)    /* needed by sparse */
-				*hmm_vma_walk->locked = false;
+			if (hmm_vma_walk->mmlocked)    /* needed by sparse */
+				*hmm_vma_walk->mmlocked = false;
 			else
 				WARN_ON_ONCE(1);    /* broken fault handler */
 			return HMM_FAULT_UNLOCKED;
@@ -694,19 +757,31 @@ static int hmm_range_fault_locked(struct hmm_range *range, bool *locked)
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
@@ -732,6 +807,8 @@ static int hmm_range_fault_locked(struct hmm_range *range, bool *locked)
 		 * output, and all >= are still at their input values.
 		 */
 	} while (ret == -EBUSY);
+
+	hmm_vma_post_range_fault(&hmm_vma_walk);
 	return ret;
 }
 
-- 
2.55.0

