Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793686629;
	b=cOOA/Xue0LfnN3McWMJtwO4v9QNnJzfulyqV8vEAgZXu8qMQxdXXU+IFfMMdme90N9p+
	 DEzLZo8qhoshLgYwoLUnXuofqEVcTzP0/r1iYrNHFhUkzvuDtZHVOBLDOwX/Sne91BUc2
	 1RB3GJMpINe7M25QwHfaiyYHxIK0jg6J6K9LpuvaZjED0DhR0JxsZ3vlHnA0lg4XPVmps
	 hwMiVDk4fk6MwKJJQNflfVjKLyxitsMZjG5JeBVe+uULyNueLxbysQdgS2yWEBF+TwXv+
	 26uq6xYPzvTaY316pQ6gl5k4ONnnjeueXLddW5TDq4k95dNs69TnGING2LcZW6pTW3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793686629;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=PwFMpGSCFzeJYoNRme4QfWvYKFPbM3x9TfOQ7Wl4QBs=;
	b=31BiTvYUTO0XyOiHMdONWk4UYo5A5zkqKshGIyQHY2LB5+RdpvEwpFDkGbztfQt+3wEc
	 4EPVMOccmmZLQTN0jHWNzNZWl85+qPbWz1qU+no1q3T1mi84ofVZM597rBm5JllNAEJrz
	 crTUw0K2/iGJ4y/xnnN5/d2PDHmWWFAx/fJzA+PTCu+HW4ZrCwtQNml4NuFs98c1fd+aS
	 bhWjzDDtO0dH2De2wLZseQkCSoC7Ei0G5WUk1/OkZMIBOgGLzYCbCvyF8E549KlyIDyir
	 ImraVvu38FOf78BA6Oqzl1zJYEJsx4R4t3rfkG68ADQgaTzYftMAtE+R4MdXIz3qClg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RJ8J2FCU;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="VpQ/zmit";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A224606D801
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:17:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A224606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RJ8J2FCU;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=VpQ/zmit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793686628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PwFMpGSCFzeJYoNRme4QfWvYKFPbM3x9TfOQ7Wl4QBs=;
	b=RJ8J2FCUgY5WkBRdskjXOeozjEcT8rP3ujf8jW2iXhJaEyDSIjAJLhTIu9DhwdJIaRa+aS
	vczPBtqK8ImQXU5aHOMySLmT2G+L9giWK7hWMnnEdC2PtWT/NNFTjm4JYxhix0tCVs8KbT
	Mga7plfh935cYpI+rgV2YR/ILcg0NP4=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-fc3qceovP-K0joDIdoqiiA-1; Tue, 03 Nov 2026 01:17:06 -0500
X-MC-Unique: fc3qceovP-K0joDIdoqiiA-1
X-Mimecast-MFC-AGG-ID: fc3qceovP-K0joDIdoqiiA_1793686625
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-3ab357a21adso17909061fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793686625; x=1794291425; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PwFMpGSCFzeJYoNRme4QfWvYKFPbM3x9TfOQ7Wl4QBs=;
        b=VpQ/zmit0s3LKTUB9gmV/1XemdtsT/LqwSAekmQEPP9THDLskC12/Ivv1KY6Egqz+e
         1QnWMpqQk+kYDrMi7MGS7wP7dzVEuSEAvaHaixBTwCI7ocw6UrQTFLWASj8S7PM4rQKz
         KtjHuuV6zNKayhidwy4zlcZq7cvGguUKyc1JpfUjVZfksmgdIbC8l4FiRqPePNybJXBj
         n2w5/qOjsMeiJeAR2+uMcg33GNMGDytPHhg5kWKUbSESQoNVa9+Q116SAdt8RzKTk8K0
         fXgCf+KAHN1ZmVUsXLJSMolY7fHZV8rp7MRac03GKYrMMkzSIaUiJ8pvvNObPwEcQFR+
         9SdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793686625; x=1794291425;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PwFMpGSCFzeJYoNRme4QfWvYKFPbM3x9TfOQ7Wl4QBs=;
        b=1uzPpmeCY7c9nHaVgAWvl+M0WRZ3z5T4FKd0xkradVfxu2RevYn1iT+GHX6TGrPxgP
         6iuwTt0tw/ouHCMUfTe04YrXTt4SZawhY8hag6VI33sMVozkgJEZN3SgQqaNtE/wQMHK
         YBdzfDtHCKtANG0jMPOxrpPlS0l/Bc5h+WkdVHYju1cqWO72doygkpccsxOykfgNTWYi
         C5NOrIdvkgbeOqtd1WoTjYoqQPW39MWcRRVIXeRfMaw5C2JMKEaaN0r33gYFhMAtI/57
         Ny15uSFhWAkGXHrzPXpy/g1rTct5cLaP69tCsFwCPa1c7i4F1Rq/IP9zq2DBesDfX6Nb
         MFtQ==
X-Forwarded-Encrypted: i=1; AKwUvBwhielpmPVf/ydzrkpQHt7klPZ8Ni9Ee26g+mQoDE3v1R6VXcMl1Mk7G6OiKfV7wnCAXSMjq5FJ9juiq18=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FMGmBT2I4BZlF+wQIHVh5YE886mYFROIlNrqdrkqNY68lDIHN
	6YvuEpYU3NKb0L+jKSJl6qYdr+JckoIpL4D7+4wxvsd8M0uAzdjn7IL/BMynXJx+80ej6/VJWv7
	yQQgfkp8b8/NANcoYEj6nYtJALzgbYldR1eXZqBNeKq2zY3om+he6hLu2vA65jbj1
X-Gm-Gg: AYBFou2VpoKENFxM8IQ7KWbWeIcwK/dcTGQDa/aooT98QtoughPdBfVmf/QFyDG8c4b
	L5RgJ1He/xA1GZI74KLrBUeZXNcG83VgFEvmj/E23YJo43HirciWZNdoZJHQSKBALE7ciD6KHfM
	0nAWrtRU1TFZUiOwDq7oYJysfTqfHKhzzgp7P2V84gUIhiYggiccRksvn+xcbRCafgVw7UtzcwP
	0JAxV2Qvet28WK6xrVJDkBlEp0zNA+/QnhUFBxn8bh2rWVMxRj44fcJw2QQKZM+0bYe/WhvvpjQ
	/ifyziZ2pfFn5wV0wF6KX4qwSqS+Cf4QVWiLdoNMcP3MrwHuwAaUCkrGTREjVYM/oFpUgWqyWk4
	qQzi1VDLreWjU6uC4mTheH9kIy+nf1sYLUegBBkveQDbz3L0tQjLwUrXi37IXntnDMQObtA==
X-Received: by 2002:a05:6512:158d:b0:5bf:e799:c7f3 with SMTP id 2adb3069b0e04-5bfe799c920mr2368524e87.61.1793686625210;
        Mon, 02 Nov 2026 22:17:05 -0800 (PST)
X-Received: by 2002:a05:6512:158d:b0:5bf:e799:c7f3 with SMTP id 2adb3069b0e04-5bfe799c920mr2368381e87.61.1793686612466;
        Mon, 02 Nov 2026 22:16:52 -0800 (PST)
Received: from fedora (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe073e0f9sm1964634e87.54.2026.11.02.22.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 22:16:51 -0800 (PST)
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
Subject: [PATCH v17 03/12] mm/hmm: preparations for HMM to participate in migration
Date: Tue,  3 Nov 2026 08:16:20 +0200
Message-ID: <20261103061629.972669-4-mpenttil@redhat.com>
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

For migration to happen after hmm_range_fault(), the vma has to be
retrieved. Luckily, pagewalk already resolves that for us, so
just have to save it for further use. For migration, mmap_lock
has to be held for the whole operation, so vma stays stable.
In case lock-drop behavior is requested, return an error while
migrating. Also, rename some struct hmm_vma_walk fields to solve
namespace collisions, and we are later introducing more
xxlocked fields so be unambiguous.

Take care also of firing the mmu_notifier when migrating.

When migrating, requests come only from range->default_flags
(pfn_flags_mask must be 0), so the input range->hmm_pfns carry
nothing and are cleared at the start of hmm_range_fault(). Collected
entries (HMM_PFN_VALID | HMM_PFN_MIGRATE) can then be told apart
reliably during the walk and on rollback. This also means that
HMM_PFN_INOUT_FLAGS such as HMM_PFN_DMA_MAPPED are not preserved
across a migrating call, which is intended since the pages are being
replaced.

Also, prepare for differences of how mm_struct * is retrieved
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
 include/linux/migrate.h |  50 ++++++++++++-
 lib/test_hmm.c          |   2 +-
 mm/hmm.c                | 157 ++++++++++++++++++++++++++++++++++------
 3 files changed, 186 insertions(+), 23 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 280ec9a866c7..dd7dd7ec6995 100644
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
@@ -151,7 +175,8 @@ static inline unsigned long migrate_pfn(unsigned long pfn)
 	return (pfn << MIGRATE_PFN_SHIFT) | MIGRATE_PFN_VALID;
 }
 
-enum migrate_vma_direction {
+enum migrate_vma_info {
+	MIGRATE_VMA_SELECT_NONE = 0,
 	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
 	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
 	MIGRATE_VMA_SELECT_DEVICE_COHERENT = 1 << 2,
@@ -193,6 +218,29 @@ struct migrate_vma {
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
index b409c42bfe6f..f05f801b8404 100644
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
index 2f1e98c6b644..9220e6648636 100644
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
@@ -176,7 +185,7 @@ static int hmm_vma_walk_hole(unsigned long addr, unsigned long end,
 	required_fault =
 		hmm_range_need_fault(hmm_vma_walk, hmm_pfns, npages, 0);
 	if (!walk->vma) {
-		if (required_fault)
+		if (required_fault || hmm_select_migrate(range))
 			return -EFAULT;
 		return hmm_pfns_fill(addr, end, range, HMM_PFN_ERROR);
 	}
@@ -400,6 +409,73 @@ static int hmm_vma_handle_absent_pmd(struct mm_walk *walk, unsigned long start,
 }
 #endif  /* CONFIG_ARCH_HAS_PMD_SOFTLEAVES */
 
+static int hmm_vma_capture_migrate_range(unsigned long start,
+					 unsigned long end,
+					 struct mm_walk *walk)
+{
+	struct hmm_vma_walk *hmm_vma_walk = walk->private;
+	struct hmm_range *range = hmm_vma_walk->range;
+	struct vm_area_struct *vma = walk->vma;
+
+	if (!hmm_select_migrate(range))
+		return 0;
+
+	if (!hmm_vma_walk->vma) {
+		/* Same vma restrictions as migrate_vma_setup() */
+		if (!vma_is_mm_backed(vma) || vma_is_hugetlb(vma) ||
+		    vma_is_dax(vma))
+			return -EINVAL;
+		/*
+		 * migrate_vma covers the whole range and indexes src[] from
+		 * range->start, so a single vma must cover the whole range.
+		 */
+		if (vma->vm_start > range->start ||
+		    vma->vm_end < range->end)
+			return -ERANGE;
+		hmm_vma_walk->vma = vma;
+		hmm_vma_walk->start = start;
+		hmm_vma_walk->end = end;
+	}
+
+	/*
+	 * The invalidation is closed before faulting, see
+	 * hmm_range_fault_locked(), so (re)open it for each walk.
+	 */
+	if (!hmm_vma_walk->mmu_armed) {
+		mmu_notifier_range_init_owner(&hmm_vma_walk->mmu_range, MMU_NOTIFY_MIGRATE, 0,
+					      walk->vma->vm_mm, hmm_vma_walk->start,
+					      hmm_vma_walk->end, range->dev_private_owner);
+		mmu_notifier_invalidate_range_start(&hmm_vma_walk->mmu_range);
+		hmm_vma_walk->mmu_armed = true;
+	}
+
+	return 0;
+}
+
+static void hmm_vma_migrate_disarm(struct hmm_vma_walk *hmm_vma_walk)
+{
+	if (hmm_vma_walk->mmu_armed) {
+		mmu_notifier_invalidate_range_end(&hmm_vma_walk->mmu_range);
+		hmm_vma_walk->mmu_armed = false;
+	}
+}
+
+static void hmm_vma_post_range_fault(struct hmm_vma_walk *hmm_vma_walk)
+{
+	struct hmm_range *range = hmm_vma_walk->range;
+
+	/*
+	 * The migrate_vma path has the following initialized. For the fault
+	 * path fill them in, also when the walk failed before capturing the
+	 * vma, so migrate_hmm_range_setup() always sees the range.
+	 */
+	if (hmm_select_migrate(range) && range->notifier)
+		hmm_fill_migrate_vma(range,
+				     hmm_vma_walk->vma,
+				     range->start, range->end);
+	hmm_vma_migrate_disarm(hmm_vma_walk);
+}
+
 static int hmm_vma_walk_pmd(pmd_t *pmdp,
 			    unsigned long start,
 			    unsigned long end,
@@ -594,10 +670,13 @@ static int hmm_vma_walk_test(unsigned long start, unsigned long end,
 	struct hmm_vma_walk *hmm_vma_walk = walk->private;
 	struct hmm_range *range = hmm_vma_walk->range;
 	struct vm_area_struct *vma = walk->vma;
+	/* Migration without faulting moves pages regardless of VM_READ */
+	bool migrate_only = hmm_select_migrate(range) &&
+			    !(range->default_flags & HMM_PFN_REQ_FAULT);
 
 	if (!(vma->vm_flags & (VM_IO | VM_PFNMAP)) &&
-	    vma->vm_flags & VM_READ)
-		return 0;
+	    (vma->vm_flags & VM_READ || migrate_only))
+		return hmm_vma_capture_migrate_range(start, end, walk);
 
 	/*
 	 * vma ranges that don't have struct page backing them or map I/O
@@ -607,10 +686,11 @@ static int hmm_vma_walk_test(unsigned long start, unsigned long end,
 	 * allow write access either. HMM does not support architectures that
 	 * allow write without read.
 	 *
-	 * If a fault is requested for an unsupported range then it is a hard
-	 * failure.
+	 * If a fault or migration is requested for an unsupported range then
+	 * it is a hard failure.
 	 */
-	if (hmm_range_need_fault(hmm_vma_walk,
+	if (hmm_select_migrate(range) ||
+	    hmm_range_need_fault(hmm_vma_walk,
 				 range->hmm_pfns +
 					 ((start - range->start) >> PAGE_SHIFT),
 				 (end - start) >> PAGE_SHIFT, 0))
@@ -646,12 +726,12 @@ static int hmm_do_fault(struct mm_struct *mm,
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
@@ -670,8 +750,8 @@ static int hmm_do_fault(struct mm_struct *mm,
 		ret = handle_mm_fault(vma, addr, fault_flags, NULL);
 
 		if (ret & (VM_FAULT_COMPLETED | VM_FAULT_RETRY)) {
-			if (hmm_vma_walk->locked)    /* needed by sparse */
-				*hmm_vma_walk->locked = false;
+			if (hmm_vma_walk->mmlocked)    /* needed by sparse */
+				*hmm_vma_walk->mmlocked = false;
 			else
 				WARN_ON_ONCE(1);    /* broken fault handler */
 			return HMM_FAULT_UNLOCKED;
@@ -694,19 +774,45 @@ static int hmm_range_fault_locked(struct hmm_range *range, bool *locked)
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
+	/*
+	 * Migration takes its requests only from default_flags, so the input
+	 * pfns carry nothing. Clear them so that collected entries can be
+	 * told apart reliably during the walk and on rollback.
+	 */
+	if (hmm_select_migrate(range)) {
+		WARN_ON_ONCE(range->pfn_flags_mask);
+		WARN_ON_ONCE(range->dev_private_owner !=
+			     range->migrate->pgmap_owner);
+		memset(range->hmm_pfns, 0,
+		       ((range->end - range->start) >> PAGE_SHIFT) *
+		       sizeof(*range->hmm_pfns));
+	}
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
@@ -718,6 +824,13 @@ static int hmm_range_fault_locked(struct hmm_range *range, bool *locked)
 		 * now-present entries.
 		 */
 		if (ret == HMM_FAULT_PENDING) {
+			/*
+			 * Don't hold the migrate invalidation across a
+			 * possibly sleeping fault. Already collected entries
+			 * stay locked and referenced, and the next walk
+			 * reopens the invalidation.
+			 */
+			hmm_vma_migrate_disarm(&hmm_vma_walk);
 			ret = hmm_do_fault(mm, &hmm_vma_walk);
 			if (ret == HMM_FAULT_UNLOCKED) {
 				if (fatal_signal_pending(current))
@@ -732,6 +845,8 @@ static int hmm_range_fault_locked(struct hmm_range *range, bool *locked)
 		 * output, and all >= are still at their input values.
 		 */
 	} while (ret == -EBUSY);
+
+	hmm_vma_post_range_fault(&hmm_vma_walk);
 	return ret;
 }
 
-- 
2.55.0

