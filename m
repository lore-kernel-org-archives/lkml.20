Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924D935CB81
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 07:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787989702; cv=none; b=uM+sbgsruOIJXbrsLKlzd4jOGAeOgUu2GjFE+nMu6bOX50NWyotV1k0abpcD/m0/vAwKOvQ9a3yQRQvUsS8pRXnXSXzq52BycrbfrhKoSsMWMteeLm8SVTEjoRb8U/kwOXoaTCQFZyXh3sNdyfHRzUjE8aQe2uieRGMk6BFsU0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787989702; c=relaxed/simple;
	bh=9bX8t1k0MccBKhH+qGjWHCG8x1C8CXkWD1zFec0CM5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gQtfQjQfQxnYOXv4OHDIlWwVMadBhMf14Zhuxqvp9RMOVaxxQREYkZ9jyx3pAv1eqIkJ+qZIlZoHWFoRBhNroktlVfkcn2F/esUwFSFm7zauUG72/v6yMvihSCKsINvNVL+HF179UKZpP2pZXs/4P2hkNX+f9IEBJIp6ZM+vkMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iL/YPfrd; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iL/YPfrd"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-382ef647e20so1761520a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 00:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787989700; x=1788594500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fQpy6R10A7XgwYtm9Mv+zsa+EQTNg+ZbkFt80LhBXZk=;
        b=iL/YPfrdq4nCZJThP/NWDNEheMAj3KwRASi847msh4gVj90vmPcbn+lxwWlz1e32bn
         f0kCZhaAW06/sVw8pmRKTjRYLAYUrP3hLLd09T4YNEIB3gRuXtC43sIWf59fmQoyERZY
         YwRfm72TposZgD5sHK7OZfYKmozu448R00AvnhtYwqRWI25PX++g7v7/Bpd6kHSvZoei
         S77a8RD7LGasRxiGuSEZ9T17eqght0GbtBoOVXrn0azBtTgve0YonlGy5pRB2d96wlEz
         osYNc/NNf+06PoN3QUezKSTwH8wnsbDJyThXQ59eRTozmjmZpEBMx1GERwGu9wFVt9MZ
         AZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787989700; x=1788594500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fQpy6R10A7XgwYtm9Mv+zsa+EQTNg+ZbkFt80LhBXZk=;
        b=OM9d4Yqq0YdO5MEr0wfZNzJKekRE5SmK1cMFHed8f0gzM0vElyR8jr+LmYKUCvTiFU
         faRenDfkS0JqZ0Ciigx2p5GAnvoB5zOsAtYzfbI3TGt83+SWFdatoZXmMYm5dXAHwLba
         LKeyIA3u13LRwGGCbmBZLgA22+kRV3IclhF61Z0UmmCA6hzmde98By1mNhQ7VuIzOMXf
         D0iNAx/ZXZ2KJe7FLNHodg6Iz1dzkss7l1agMqm8Xaq2V+XvAkJKEW38XLvzBUdkUS13
         HSjIXfYptDCWdsGf36b/gcp+YnErB0h3Khfn2rKgT2LpIng+BwA60P6hL0T6LHHWp5za
         1W2w==
X-Gm-Message-State: AFuF++lyJILHJrvuTyQK0lbEPTYtxOxUE6loWvQERsGqOgkF4PdW5sal
	bfeDE/lUQnsvEt3198mgHw3hlaaK0ZzctLYArUHGjljiACI63J13qHmr
X-Gm-Gg: AYBFou2qX8nxVxeMHvQQti1saUIjnnOSrv7lM9rhw0R8TOoFdKcvmT6Ro2nrKJ9BRh4
	JJ9VkLXoyXqAYIdVN5EEvnyYYsHGOMZMxG7W9tPqjLcQuNybVn3/YOTKB7HJ9/uqjXtSMZ+WpSD
	2gOEhja4bEnqGpX0geNmj7f+fyeT6HmWVs6r7odwR+CSje4itZaI2nmNWdagritDsmXBRImqjVx
	UNBmnG81Lh+zNx+Ntomnts/x2z778Gv/NQafMoHqvl7ziZmTXya2lmKc5MSWmlrJfI/S5EYxmpF
	gGBmquBTAJIDMUGiTc/prvveMAG0Fx5ngPncZiifqHqEvAJdBJYDG/QdegqjSe1a8fa1swLU5Cm
	VfRBfRJgzrmY/QPV/VFODugdKpqkCZ2Zpo2eBXemxM3K1qRnwAtBokMaV/Dfk+389HOO+TCkEN4
	ezl/S3/ZP+VlTBFtWUq+9FfOgK9C5/NjVQtNvIwZ8kYTTyulL178dfzML/EATB6t9fXiBTPCEtE
	/jXkfKk4tfoMNsqUHd+c1POHXfICA==
X-Received: by 2002:a17:90a:4ca6:b0:398:bd66:35f5 with SMTP id 98e67ed59e1d1-398bd66372fmr151113a91.25.1787989699843;
        Sat, 29 Aug 2026 00:48:19 -0700 (PDT)
Received: from localhost.localdomain (vmi2317720.contaboserver.net. [84.247.152.65])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda7c922sm6117862a91.7.2026.08.29.00.48.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 29 Aug 2026 00:48:19 -0700 (PDT)
From: "Lian Wang (ProcessMission)" <lianux.mm@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Kairui Song <kasong@tencent.com>,
	Jihan LIN <linjh22s@gmail.com>,
	Kunwu Chan <kunwu.chan@linux.dev>
Subject: [RESEND RFC PATCH v2 10/13] mm/swap: remove available list
Date: Sat, 29 Aug 2026 15:48:12 +0800
Message-ID: <20260829-swap-pcp-priq-v2-resend-10-68d3d925578c@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829-swap-pcp-priq-v2-resend-0-68d3d925578c@gmail.com>
References: <20260829-swap-pcp-priq-v2-resend-0-68d3d925578c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kairui Song <kasong@tencent.com>

Pure cleanup, no functional change.

After the priority queue replaced the allocator's device selection,
swap_avail_head and swap_avail_lock are no longer used. Remove them.

The throttle path now walks swap_active_head under swapon_rwsem.
Check SWP_WRITEOK and the existing off-list state. This preserves the old
priority ordering and does not select a full swap device.

Signed-off-by: Kairui Song <kasong@tencent.com>
Signed-off-by: Lian Wang (ProcessMission) <lianux.mm@gmail.com>
Tested-by: Kunwu Chan <kunwu.chan@linux.dev>
---
 include/linux/swap.h |  1 -
 mm/swapfile.c        | 33 ++++++---------------------------
 2 files changed, 6 insertions(+), 28 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 37fe2e4d2774..0c8c1ebcab9c 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -293,7 +293,6 @@ struct swap_info_struct {
 	struct work_struct discard_work; /* discard worker */
 	struct work_struct reclaim_work; /* reclaim worker */
 	struct list_head discard_clusters; /* discard clusters list */
-	struct plist_node avail_list;   /* entry in swap_avail_head */
 	const struct swap_ops *ops;
 };
 
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 1b7bc968b5f7..e183dfad264e 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -96,21 +96,6 @@ static const char Bad_offset[] = "Bad swap offset entry ";
  */
 static PLIST_HEAD(swap_active_head);
 
-/*
- * all available (active, not full) swap_info_structs
- * protected with swap_avail_lock, ordered by priority.
- * This is used by folio_alloc_swap() instead of swap_active_head
- * because swap_active_head includes all swap_info_structs,
- * but folio_alloc_swap() doesn't need to look at full ones.
- * This uses its own lock instead of swapon_rwsem because when a
- * swap_info_struct changes between not-full/full, it needs to
- * add/remove itself to/from this list, but the swap_info_struct->lock
- * is held and the locking order requires swapon_rwsem to be taken
- * before any swap_info_struct->lock.
- */
-static PLIST_HEAD(swap_avail_head);
-static DEFINE_SPINLOCK(swap_avail_lock);
-
 static inline struct swap_info_struct *__swap_iter(int *i, unsigned long flag)
 {
 	lockdep_assert_held(&swapon_rwsem);
@@ -1583,7 +1568,6 @@ static void del_from_avail_list(struct swap_info_struct *si, bool swapoff)
 {
 	unsigned long pages;
 
-	spin_lock(&swap_avail_lock);
 	spin_lock(&swap_queue_update_lock);
 
 	/*
@@ -1603,10 +1587,8 @@ static void del_from_avail_list(struct swap_info_struct *si, bool swapoff)
 	}
 
 	swap_queue_mask(si);
-	plist_del(&si->avail_list, &swap_avail_head);
 skip:
 	spin_unlock(&swap_queue_update_lock);
-	spin_unlock(&swap_avail_lock);
 }
 
 /* SWAP_USAGE_OFFLIST_BIT can only be cleared by this helper. */
@@ -1615,7 +1597,6 @@ static void add_to_avail_list(struct swap_info_struct *si)
 	long val;
 	unsigned long pages;
 
-	spin_lock(&swap_avail_lock);
 	spin_lock(&swap_queue_update_lock);
 
 	/*
@@ -1646,10 +1627,8 @@ static void add_to_avail_list(struct swap_info_struct *si)
 	}
 
 	swap_queue_unmask(si);
-	plist_add(&si->avail_list, &swap_avail_head);
 skip:
 	spin_unlock(&swap_queue_update_lock);
-	spin_unlock(&swap_avail_lock);
 }
 
 /*
@@ -3684,7 +3663,6 @@ static struct swap_info_struct *alloc_swap_info(void)
 	}
 	p->swap_extent_root = RB_ROOT;
 	plist_node_init(&p->list, 0);
-	plist_node_init(&p->avail_list, 0);
 	p->flags = SWP_USED;
 	percpu_up_write(&swapon_rwsem);
 	if (defer) {
@@ -4099,7 +4077,6 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 	 */
 	si->prio = prio;
 	si->list.prio = -si->prio;
-	si->avail_list.prio = -si->prio;
 
 	/*
 	 * Publish swap_file before making the percpu ref live, then add the device
@@ -4243,14 +4220,16 @@ void __folio_throttle_swaprate(struct folio *folio, gfp_t gfp)
 	if (current->throttle_disk)
 		return;
 
-	spin_lock(&swap_avail_lock);
-	plist_for_each_entry(si, &swap_avail_head, avail_list) {
-		if (si->bdev) {
+	percpu_down_read(&swapon_rwsem);
+	plist_for_each_entry(si, &swap_active_head, list) {
+		if ((si->flags & SWP_WRITEOK) &&
+		    !(atomic_long_read(&si->inuse_pages) &
+		      SWAP_USAGE_OFFLIST_BIT) && si->bdev) {
 			blkcg_schedule_throttle(si->bdev->bd_disk, true);
 			break;
 		}
 	}
-	spin_unlock(&swap_avail_lock);
+	percpu_up_read(&swapon_rwsem);
 }
 #endif
 
-- 
2.55.0

