Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794667919;
	b=5SL9G8ds0w516/bV+XdWv5lPuT9SlqNE3XKzCIVvboYZi7J/F3mrqBYDtn0GwK+V3s3I
	 vKvolCdMAT4TrkKCf2EdSd0orGcaDVeduNyOcKnSJ/YujRXzhuioOjLfefgG0xkfpSh4C
	 4Ss1Q8MFobUVCF3/qNllGwMrCzWIJX7xhIuAxA93/CPH3KaIuKxu93ZdXoFy/cHDUTJMc
	 s3tNTnXBYZSnuUSr2CzIypC/9d763nOE9E2MLBxCoPlbZ12tqJmpvTW0CdRsGhKNxjqDm
	 8f7maTuURXuJwnn0eUgjONAhSk9ah0+3/9//2fcaV6YpYl5sp7tB8wCesl4rY6vlVcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794667919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0GioUseZHzqH/AOOE2IX8pcEfvZptyLPBBSCPC7A9cg=;
	b=isXT80iAF7mj2mSmQpCxQOavq3CQyvmq51A/8tX32H/JrD64D4XdqbE5g6AzJ5pOZoCX
	 RTv6IKtyKd0CPAC+zy9Uwk2Q8bwCvS83glx5+Ror189fYe8jjoso4FifKg4s8rvm35SQJ
	 QVH70XRZ8wgaWD5bc6VsQ+/y1kfdDPI6fUBlDWaKUO6e3KSx9Ivh/3SOc6BQyUoBcQz44
	 FXw8BTfnjlja/HgKeZ4kpS+GhMmx24zOdSAvaVwssz2skSaEBJI84OhjxFt1KvUshhHWm
	 5kn4DyacEtP34iGgS4lwVIr8/ChHYOVdztk9TDFbE+Ce+zT7bIKi/QJgS5OQN0zY0Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AaCEu8VE;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED735606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:51:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED735606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AaCEu8VE
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso897637a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794667918; x=1795272718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0GioUseZHzqH/AOOE2IX8pcEfvZptyLPBBSCPC7A9cg=;
        b=AaCEu8VEMfEOx3SPih63jEN7DMRHjwekjEXMO18ozLhlnv1o201jAlY5YgPYvVI+M0
         e5l83Vm/ApD9pdmvSBDvjrmlmeESol9fVa6q9yarSI0ytDD++GXSXiFhD5zc9JVB8B79
         x7RMDqMqlB8y9ZcG3QRVEe/wT/U9hnnJJWBZjBKRWNIbc8thmYYP2IWco8AHJm5rASii
         0+TX4evOytekI5hG2+VGRWE2PV6GRN10hjrWFC0FbPsLMMEfb1JYjZ7Hlw4OPhXTjFXq
         aOIX9cI1yHO2nvSDmkCiqp3fMXaQZce3jQarjM+nDgRswUUyZhl1jRdHIHNsYPOmjXZs
         D/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794667918; x=1795272718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0GioUseZHzqH/AOOE2IX8pcEfvZptyLPBBSCPC7A9cg=;
        b=RyZ9jsjCixqRDzyE0JphZbr+pMTY9w58DqF1EiGL2eFjTMUwKI3nGNzUIZctz/xAz5
         Fhi8fK6ccdGrYkvht7LomZn4/FdMSSzogeE65Hgk/6sBNmTZ25iWQl0esaw7WQ+Yjq7i
         isvoNGpGXtJ0ZRMYEQZIPJeLq3I/vt8kUNPTtgF+9ZlONTDrQuKCMmlf8wW6KO76wXFi
         ep5HRPhKKjq56CueA3qM1QTteFJs9ocbA5aX22Cg+9bXTYbhN56d3fUTP9ETnH6dMdom
         t/ijMDbOIV4HfWN6ApVdHRq7oRLYZ2jiyTn4OO+Q4+zMqSiuaN/FhPoXmoJsKlxDdPf1
         AAfw==
X-Gm-Message-State: APuU4Z/qoWuEzCeS6ejh3eC4zJk6rhpqvFsHeateiOU3F5SlzZBS3w0W
	VDVHlvZEM6XBSn9aiV2HJo0W+CQaU/TPSfHXT3Cj5tUt5dXY9H+5rrfE
X-Gm-Gg: AYBFou2gzc7iQfMgoVBuucpua4GhvN7krOBaZp+7lDlE/sr4xx7SIps1SByuPk4hT+p
	pey3/FX/LWuvO/dfks5HNT6uh/FIMmVeEhLcwDMvq1VDUTmz7zN9q0ELSPXEU1CLeWvU6tffKSI
	JrOKezb8hJxLHyYOinfuxVQC3ICRG78kZLuPQnk4fH9/YDdea8wPex7/w6wDO4aStjJiJQYBuMr
	R8XqHZIyTq4Fh/6HKt6IaFB3D1kvTVgObwXw9O1WOmgTrFuz2o/0ixSdWgfUs/xcmShaUIJAvvW
	nP80xGbVIIlSzUd3nHsC95hD1+KvnjltJCBNqBea9/aRzv2NBZtYeSc0zW0sLEu8qzb3sdn7FA7
	I8a18p4Y2vC56czDNWbYg63PlrBa2NXA640yO9pe3pZ3Geb+Xuardr2iu5ru75C2KfY9M/1IqXI
	6b8eNjd45FitWL6A8KznCbBJ8nhx4vUGFUvxB9C1t6fckeJ8N26XzXlripONvcvumBd7QHfW6Fp
	GQT6fMr6wUa/dtUMCU3H8iwFB+L5JQ6FT845B4p/LFwfaLodV9BiZgQFxLlCmOwTop1aN9TOGoW
	Wh6rrx7zfO9I/BO4CDynToPYsDl6pu4cd034V0mYm+8px0218IiZdobqdiJboyaq1N62
X-Received: by 2002:a05:6300:6cc1:10b0:3f9:797f:3869 with SMTP id adf61e73a8af0-3f9797f51e7mr916044637.47.1794667918330;
        Sat, 14 Nov 2026 06:51:58 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc160bfabsm2392057a12.4.2026.11.14.06.51.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 06:51:58 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
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
	Kunwu Chan <kunwu.chan@linux.dev>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [RFC PATCH v4 13/18] mm/swap: drop swap active plist
Date: Sat, 14 Nov 2026 22:51:44 +0800
Message-ID: <9ccd81f6f036eb1c3e50d396b44b5e43cff77d2a.1794666741.git.lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794666741.git.lianux.mm@gmail.com>
References: <cover.1794666741.git.lianux.mm@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kairui Song <kasong@tencent.com>

Remove swap_active_head and the associated plist_node. Device identity
lookups can use the writable swap_info iterator without ordering.

Keep priority ordering for the block-cgroup swap throttle target by
walking the priority queue under the topology reader. Choose the first
unmasked, writable, non-offlist device with a backing block device.
Check OFFLIST as well as the pointer tag because full transitions can
temporarily leave an unmasked entry, and keep the explicit WRITEOK
check. The disable transition already publishes its mask before
releasing the topology writer.

This read-only lookup does not consume per-CPU allocation quotas or
change retry cursors. It avoids making the throttle disk depend on
swapon's swap-type assignment order when devices have different
priorities.

Signed-off-by: Kairui Song <kasong@tencent.com>
Signed-off-by: Lian Wang <lianux.mm@gmail.com>
---
 include/linux/swap.h |  1 -
 mm/swapfile.c        | 60 +++++++++++++++++++++++---------------------
 2 files changed, 32 insertions(+), 29 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index d31f3f023d36..ce8a800751ca 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -263,7 +263,6 @@ struct swap_info_struct {
 	struct percpu_ref users;	/* indicate and keep swap device valid. */
 	unsigned long	flags;		/* SWP_USED etc: see above */
 	signed short	prio;		/* swap priority of this type */
-	struct plist_node list;		/* entry in swap_active_head */
 	signed char	type;		/* strange name for an index */
 	unsigned int	max;		/* size of this swap device */
 	struct swap_cluster_info *cluster_info; /* array, one entry per cluster */
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 6b2dbaf33cb6..bd098114ee4b 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -42,7 +42,6 @@
 #include <linux/completion.h>
 #include <linux/suspend.h>
 #include <linux/zswap.h>
-#include <linux/plist.h>
 
 #include <asm/tlbflush.h>
 #include <linux/leafops.h>
@@ -91,12 +90,6 @@ bool swap_migration_ad_supported;
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
@@ -3535,7 +3528,6 @@ static void __swap_device_enable(struct swap_info_struct *si)
 	spin_unlock(&si->lock);
 	atomic_long_add(si->pages, &nr_swap_pages);
 	total_swap_pages += si->pages;
-	plist_add(&si->list, &swap_active_head);
 	add_to_avail_list(si);
 }
 
@@ -3555,9 +3547,8 @@ static int swap_device_disable(struct address_space *mapping,
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
@@ -3583,8 +3574,6 @@ static int swap_device_disable(struct address_space *mapping,
 	spin_lock(&si->lock);
 	del_from_avail_list(si, true);
 	spin_unlock(&si->lock);
-
-	plist_del(&si->list, &swap_active_head);
 	total_swap_pages -= si->pages;
 	atomic_long_sub(si->pages, &nr_swap_pages);
 
@@ -3913,7 +3902,6 @@ static struct swap_info_struct *alloc_swap_info(void)
 		 */
 	}
 	p->swap_extent_root = RB_ROOT;
-	plist_node_init(&p->list, 0);
 	p->flags = SWP_USED;
 	percpu_up_write(&swapon_rwsem);
 	if (defer) {
@@ -4323,12 +4311,7 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
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
@@ -4454,7 +4437,33 @@ int swap_dup_entry_direct(swp_entry_t entry)
 #if defined(CONFIG_MEMCG) && defined(CONFIG_BLK_CGROUP)
 static bool __has_usable_swap(void)
 {
-	return !plist_head_empty(&swap_active_head);
+	return READ_ONCE(total_swap_pages) > 0;
+}
+
+static struct swap_info_struct *swap_queue_first_usable_bdev(void)
+{
+	struct swap_prio_ring *ring;
+	struct swap_info_struct *si;
+	unsigned int ring_idx, dev_idx;
+
+	lockdep_assert_held(&swapon_rwsem);
+	for (ring_idx = 0; ring_idx < swap_queue_len; ring_idx++) {
+		ring = swap_queue[ring_idx];
+		for (dev_idx = 0; dev_idx < ring->size; dev_idx++) {
+			si = READ_ONCE(ring->dev[dev_idx]);
+			if (swap_device_masked(si))
+				continue;
+			si = swap_device_unmask_ptr(si);
+			if (!(READ_ONCE(si->flags) & SWP_WRITEOK))
+				continue;
+			if (atomic_long_read(&si->inuse_pages) &
+			    SWAP_USAGE_OFFLIST_BIT)
+				continue;
+			if (si->bdev)
+				return si;
+		}
+	}
+	return NULL;
 }
 
 void __folio_throttle_swaprate(struct folio *folio, gfp_t gfp)
@@ -4478,14 +4487,9 @@ void __folio_throttle_swaprate(struct folio *folio, gfp_t gfp)
 		return;
 
 	percpu_down_read(&swapon_rwsem);
-	plist_for_each_entry(si, &swap_active_head, list) {
-		if ((si->flags & SWP_WRITEOK) &&
-		    !(atomic_long_read(&si->inuse_pages) &
-		      SWAP_USAGE_OFFLIST_BIT) && si->bdev) {
-			blkcg_schedule_throttle(si->bdev->bd_disk, true);
-			break;
-		}
-	}
+	si = swap_queue_first_usable_bdev();
+	if (si)
+		blkcg_schedule_throttle(si->bdev->bd_disk, true);
 	percpu_up_read(&swapon_rwsem);
 }
 #endif
