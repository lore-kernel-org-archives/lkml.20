Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E68739AD5E
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 07:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787989720; cv=none; b=DZIUwocXY9lgWrcC6ISib89psxndOFlHR7R73OPNZQid5FrKwblfvA45wsH5TJOg+8LTOCBtsKu4tnBIFPDxqOdpan9ijqsMiSpC5riTwSPrhybjF3H4mxWUaTyTi7Q2VlohVXDQkUu31JSs1K6n+YBTpn1G/uCZrxRIIHIU8Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787989720; c=relaxed/simple;
	bh=DsLEHOj7RofQYi0x3G+lLhCzYH//rcaCKr1DD+f77zg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hHCMR0MCCZA2nEGiLFYCPrUhdR3Yi079kJXnQo+PcbW3s64nIdbPzXXm2HQXiWxtz0cBuvmE+jGzY2Oe9jJFQajp2ml3k7I1SPjYVAesryEK+mGle7nM+IipoHijIkjRflBnIV/TZwa+67LNLLVvwc6PND0eDl0KaAkcnW0MpmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UlYu00tP; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UlYu00tP"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc149372c14so1316652a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 00:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787989717; x=1788594517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K0brm21TE9GssWqZ74Js94Ds6AVGqAHayV0XzsofN18=;
        b=UlYu00tPe9UvVsWNdEJfqqczLPaU+mucEghuvhzi6jigtAJS0at2Lww3C6rDgIy0QE
         +xtbCJ1x5tQ7vIs9VX13e7eb7w/gXkJdioY0a0qWtCiROs5rqHL2ALhCbpvRunkCHDpp
         DtHAj2SeuePOjyRoth2PCF2AsT0jQlnbV/QpMMuwsj6dlymsEpoDJgInTkPP5p36wDbn
         7Z7jyqvAb3/5bNDJQLaBNq1sbgGYLvfpNQJFOauXUrpgscaINmjvpdB0qsXn5V0kOE25
         Y9xtGT8bei8z8Py83pfeYapgMzPT1/J348/bf5S/VFGcNIlliebsbk8AViEAxnPvC+Un
         wZ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787989717; x=1788594517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K0brm21TE9GssWqZ74Js94Ds6AVGqAHayV0XzsofN18=;
        b=QNUmUIh0pQvTm9aifpxQWRVTjB6EiF8rfeKYxd6459CnFf/T14TBWLwB96dWug3RLX
         U+dVvEvC1C8Y9IcIKcB5+NuNBWcJ3Lk9w7fe3rvwYzTicxVpwICIssZD+9X70HWrG+wH
         J6UJSQ4k2bA5YsiOQ2ywrHiZIzOwdCrv/SbrydOVwdEyvHo6I9OPJ5IWp4ilR2b261c1
         91LexGVp4+rb9OudTLLbvb/wD13dIEwU8yGydWDkccpPmh/KBuELFjZSp1vPr4sG8puD
         nZec/BIZmmqa8Z69rDQjQHkYkyKgR8psV9S4IJQDruyKm4YVROmnkhdOAabvhERbOFOv
         fPig==
X-Gm-Message-State: AFuF++nxZVNh5SEreND9wwhk/JJTGpk81kDxPcOojtrq7YAAQP6mUaHs
	50eb+eogBCsTgF5a/LVgh28LLFaAs8wa6WqRV4v5sUkjXhu9yan0DeTD
X-Gm-Gg: AYBFou3Y0I3tnZXa9luJ1X7CEKFqe1RirBO+J8HwanU18TGUiBLB2ZeIjnXpGPkZnvC
	YxigTW29C7H0uO9rg6nEdZpZjfkhPthK3XUm8ff6IfrT+1ZZKXctc0uH1ewdfliFmQe4QBMwdeC
	sRwHQ/vv3MdyV8lv6KMVFkPffzPUtEQ8wJ3xiwuC5ed5HU+b93bLY+LK+FNFO9pkeN/8694UIf2
	RwTVysk0LnZ4KqoSTnxcqAba34JCE5rWYW5DJSalxRbrb2gGnXH/dAM/z2/DOhXRkf19Bvkmnwd
	mG1sNuo/rgHVlJZXQLIT0xnsVlojeKV3kesJV2gy1aRGv9y57Tf4aDW9dT/jaOclEpACDy6LV5s
	AkaIzyCm4YyoY/6Wmt/2rjRUjK5pb0/Y6P6LkXOI9zIRwhfHe/vyNwV//UAwXYxQEk2CQEgbFLr
	WorabrlIMZptikMYqXV1WRmR126v+LopAIdKprC8GBxrGclszVzEUKSkU5d/pyx9zsVtSpMrC1c
	N3RgOOig1MwJKPVHTn0JvAhnJR2
X-Received: by 2002:a17:90b:37cc:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-396d0d92d0amr23218510a91.1.1787989716688;
        Sat, 29 Aug 2026 00:48:36 -0700 (PDT)
Received: from localhost.localdomain (vmi2317720.contaboserver.net. [84.247.152.65])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396ddca5bfbsm6256974a91.17.2026.08.29.00.48.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 29 Aug 2026 00:48:36 -0700 (PDT)
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
Subject: [RESEND RFC PATCH v2 12/13] mm/swap: drop swap active plist
Date: Sat, 29 Aug 2026 15:48:28 +0800
Message-ID: <20260829-swap-pcp-priq-v2-resend-12-68d3d925578c@gmail.com>
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

The swap_active_head plist tracked all writable swap devices, ordered
by priority.  Now that every consumer that needed priority ordering
has moved to the priority queue, the remaining users only need to
find any writable device.

Remove swap_active_head, the associated plist_node from
swap_info_struct, and migrate the remaining plist operations.

Signed-off-by: Kairui Song <kasong@tencent.com>
Signed-off-by: Lian Wang (ProcessMission) <lianux.mm@gmail.com>
Tested-by: Kunwu Chan <kunwu.chan@linux.dev>
---
 include/linux/swap.h |  1 -
 mm/swapfile.c        | 27 +++++----------------------
 2 files changed, 5 insertions(+), 23 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 0c8c1ebcab9c..9d86db144b94 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -267,7 +267,6 @@ struct swap_info_struct {
 	struct percpu_ref users;	/* indicate and keep swap device valid. */
 	unsigned long	flags;		/* SWP_USED etc: see above */
 	signed short	prio;		/* swap priority of this type */
-	struct plist_node list;		/* entry in swap_active_head */
 	signed char	type;		/* strange name for an index */
 	unsigned int	max;		/* size of this swap device */
 	struct swap_cluster_info *cluster_info; /* cluster info. Only for SSD */
diff --git a/mm/swapfile.c b/mm/swapfile.c
index cb27f2e246f0..0acb1f31df8c 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -41,7 +41,6 @@
 #include <linux/completion.h>
 #include <linux/suspend.h>
 #include <linux/zswap.h>
-#include <linux/plist.h>
 
 #include <asm/tlbflush.h>
 #include <linux/leafops.h>
@@ -90,12 +89,6 @@ bool swap_migration_ad_supported;
 static const char Bad_file[] = "Bad swap file entry ";
 static const char Bad_offset[] = "Bad swap offset entry ";
 
-/*
- * all active swap_info_structs
- * protected with swapon_rwsem, and ordered by priority.
- */
-static PLIST_HEAD(swap_active_head);
-
 static inline struct swap_info_struct *__swap_iter(int *i, unsigned long flag)
 {
 	lockdep_assert_held(&swapon_rwsem);
@@ -3262,7 +3255,6 @@ static void __swap_device_enable(struct swap_info_struct *si)
 	spin_unlock(&swap_queue_update_lock);
 	atomic_long_add(si->pages, &nr_swap_pages);
 	total_swap_pages += si->pages;
-	plist_add(&si->list, &swap_active_head);
 	add_to_avail_list(si);
 }
 
@@ -3282,9 +3274,8 @@ static int swap_device_disable(struct address_space *mapping,
 	int err = -EINVAL;
 
 	percpu_down_write(&swapon_rwsem);
-	plist_for_each_entry(si, &swap_active_head, list) {
-		if ((si->flags & SWP_WRITEOK) &&
-		    si->swap_file->f_mapping == mapping) {
+	for_each_avail_swap(si) {
+		if (si->swap_file->f_mapping == mapping) {
 			err = 0;
 			break;
 		}
@@ -3309,7 +3300,6 @@ static int swap_device_disable(struct address_space *mapping,
 	spin_lock(&swap_queue_update_lock);
 	si->flags &= ~SWP_WRITEOK;
 	spin_unlock(&swap_queue_update_lock);
-	plist_del(&si->list, &swap_active_head);
 	total_swap_pages -= si->pages;
 	atomic_long_sub(si->pages, &nr_swap_pages);
 
@@ -3641,7 +3631,6 @@ static struct swap_info_struct *alloc_swap_info(void)
 		 */
 	}
 	p->swap_extent_root = RB_ROOT;
-	plist_node_init(&p->list, 0);
 	p->flags = SWP_USED;
 	percpu_up_write(&swapon_rwsem);
 	if (defer) {
@@ -4050,12 +4039,7 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 	if (swap_flags & SWAP_FLAG_PREFER)
 		prio = swap_flags & SWAP_FLAG_PRIO_MASK;
 
-	/*
-	 * The plist prio is negated because plist ordering is
-	 * low-to-high, while swap ordering is high-to-low
-	 */
 	si->prio = prio;
-	si->list.prio = -si->prio;
 
 	/*
 	 * Publish swap_file before making the percpu ref live, then add the device
@@ -4176,7 +4160,7 @@ int swap_dup_entry_direct(swp_entry_t entry)
 #if defined(CONFIG_MEMCG) && defined(CONFIG_BLK_CGROUP)
 static bool __has_usable_swap(void)
 {
-	return !plist_head_empty(&swap_active_head);
+	return READ_ONCE(total_swap_pages) > 0;
 }
 
 void __folio_throttle_swaprate(struct folio *folio, gfp_t gfp)
@@ -4200,9 +4184,8 @@ void __folio_throttle_swaprate(struct folio *folio, gfp_t gfp)
 		return;
 
 	percpu_down_read(&swapon_rwsem);
-	plist_for_each_entry(si, &swap_active_head, list) {
-		if ((si->flags & SWP_WRITEOK) &&
-		    !(atomic_long_read(&si->inuse_pages) &
+	for_each_avail_swap(si) {
+		if (!(atomic_long_read(&si->inuse_pages) &
 		      SWAP_USAGE_OFFLIST_BIT) && si->bdev) {
 			blkcg_schedule_throttle(si->bdev->bd_disk, true);
 			break;
-- 
2.55.0

