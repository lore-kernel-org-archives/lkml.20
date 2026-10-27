Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793117498;
	b=D4BLz9d/v5bCuFKfFU+5yzUZ+HXzuIbf9xRV69IZdbSIsDpHjaSxtYhLNzBwVQHD0kmj
	 aTJulRyTGi+1oR8IhpBQnQXUfP7S65OoEy7VoPHQAS8HtIQDOOAMXV2cOM4iXLVpnxn76
	 BHFpoF3UDOOW7r5CBwf+/2A/4rcSFU9vZl3dZx651i+HyBdpS/oOKIGFlnKDwti8VL/2N
	 qyC2QTa8KS53GLk0mStHRooT1yMwGemTDQkdrWS4dkwRLBPlb+QNQes3hxfiVLHikI1z+
	 rD3/RD6wQ+AGRxfeTrOjy2T0acs7qTewWFzka1GsDqoO6Z+Dt2XiSbDKT7P+ahDVQBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117498;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IcQvxtAuURaL5AWAfjg2aSch6uIdfFR8kJ2WNXGe70s=;
	b=bey/2W3LE9rJlTSf6Ay7uwPHfI0Jx+k45qxL9RxqBJaHbZRBEIkZPm1zOhXg/RE70A7r
	 UHENNGN8kolqyuaPfOyVxZ/kU8VTqXZLN9qssH2GVr4F6HDRNNFz7jqFaXrMq+9Zcop66
	 U/WhJHf+45KCoUSHF018AjSrzQ23v+z1kewQgCE0C8JI4HWPYqWXw/0GMJet3Y3uQ3t2/
	 w6DFJO8l/3JiLEoU6CiNouXUX/vdNo86w3UBW5kvuaaO1w8o/EocVyYKkqr6JVU5YVOzX
	 WN0F+pYolfdmcPP4yJUn/7umiWT39YURggr4SkYedV2puam0jt2m8MPJ3rDebwlnAjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E21a02+i;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47669606A335
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:11:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47669606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E21a02+i
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd67cc518a6so78074a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793117498; x=1793722298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IcQvxtAuURaL5AWAfjg2aSch6uIdfFR8kJ2WNXGe70s=;
        b=E21a02+iyHFwuMr++dTs9Q3MU6HHXLiYWjEuWJ+O2RO+mmSLm4dfuJAxD5Pp7hIPMu
         U6TlJwzJJQ46FcbadpNA0gVXy6pHgJkSIRsg3Fd6wTg6L0bxvS6eprCUsp54WBfms/w3
         URUv3gNX756AYI19wf1Q5bWZ+C7xaHutSd55UFTcAUaktm6daGr/ThNYFx+Kj/FPlbOn
         gDV+eaoah2UcgyLWMGh9owvMfbYJoLk4YFFcIfeTZckB5wAgFeS25MRgnnB69+EW5Gk+
         q9r0jZUe0JCk4gHtfgW5iTv8kyDBeI64fWO3uWuhO1RGLboPl+HVhdRkTf5InkuuppZS
         wnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793117498; x=1793722298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IcQvxtAuURaL5AWAfjg2aSch6uIdfFR8kJ2WNXGe70s=;
        b=maRwKzh2nWo7ebbBhYsRzLm2R6dIcWDkC8GTsdwsnjuFR4VeG+ADLDmxLTdXU8ynC2
         E+Rn714ODwm96UBR4Baq6jYED7kJb/e9bN8MHjOpaQZqpl7DDgwB/rgCTJxZ6gdMXPG+
         09FGOUXa2jzRnet7VE09/j2OyjIM9P0+T4Toqqwait7P7FvXXGk7O7fqJyXwZLw8UDGj
         p+amjuUt/8zL+jHSBQJ64mMkHxAqfrL5JEBL1XQstNQyskaGhpCsBO+mqo8fkkbOTtjv
         dv/53A1EMszW7yFTqNQ8bCW8bcudI69hejnVgIoVTzfP9pLIOhtGAHHllp2pP23lz4Pr
         jgUw==
X-Gm-Message-State: AFq9FYJrbVRqMaRoyCq4wrkwgH1wq8BpwesJLAlav1ml0dV5bqvLaWgm
	+iPCTr7iQFn/cRc9jbJ2YeSCROx5W42fO8mxjewsZd/oiDbAEgCXJiFF
X-Gm-Gg: AYBFou3cdXyvEqxbhjldz3kOEr9HpsidgDyBw7g3o3hXAVPusEOjmUy2fkWQGcreaSk
	14osIXyht2ZkudnjUxVQaUYcfO3CS2FqJogFBkeh2mC5YdUityK5Df/fl/lv1aJahHE7Q9NIA+r
	eu2i6ljCWVjUsDT0RnZh/yEnFEZ6wO/MzWRTwh0f6q5pu6FRKGNKJ37MRl+AEdplUJEGaeqR0Mf
	gPwm3tGK0fSDt8OzAacv2J1Xtig00nrhC5YaYd91tWcqfSHjKcSRCbjenNLS8M7fqRTIJuSIPMa
	SaQ5Ee/IksI9vwr8DMBa4AKn4MRlgkuVrhIH9ExRGenuK7hJ9eJGIjV2DDFqnPrcHq0TuDMocUJ
	ing47X8v97Jd/sj20QWM6CG5JbNNwVgOG9zDpe9KiwoJXUK751znCGgUqxoce7+wJGvVFf1sUVQ
	ST+z74nxMJ2JbzHA/YmhvLYDrNguRwmDKq+adaQfMStBnSfLbeJCcKBsVWlkrUQCZFYzzhlt1xj
	jBa+erUpCHwHztgCJXtsP18YGvlhnfa9yS6UNPjH7eiYqh0OAbr2cUWfNXS2tWno6yib5MK3OEl
	Vnq53IaArexP2u0Wfmg=
X-Received: by 2002:a17:90b:3bc7:b0:3a4:ca46:8d44 with SMTP id 98e67ed59e1d1-3adead5841amr8687511a91.18.1793117497589;
        Tue, 27 Oct 2026 09:11:37 -0700 (PDT)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeb83b408sm8706780a91.0.2026.10.27.09.11.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 09:11:37 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	chrisl@kernel.org,
	nphamcs@gmail.com,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	youngjun.park@lge.com,
	shikemeng@huaweicloud.com,
	kasong@tencent.com,
	linjh22s@gmail.com,
	kunwu.chan@linux.dev,
	kees@kernel.org,
	gustavoars@kernel.org,
	tglx@kernel.org,
	linux-hardening@vger.kernel.org
Subject: [RFC PATCH v3 13/18] mm/swap: drop swap active plist
Date: Wed, 28 Oct 2026 00:11:14 +0800
Message-ID: <2ef61349ebae2f178e5dafff2ac31d80ade23ac3.1793106426.git.lianux.mm@gmail.com>
In-Reply-To: <cover.1793106426.git.lianux.mm@gmail.com>
References: <cover.1793106426.git.lianux.mm@gmail.com>
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
Check WRITEOK and OFFLIST as well as the pointer tag because disable
and full transitions can temporarily leave an unmasked entry.

This read-only lookup does not consume per-CPU allocation quotas or
change retry cursors. It avoids making the throttle disk depend on
swapon's swap-type assignment order when devices have different
priorities.

Signed-off-by: Kairui Song <kasong@tencent.com>
Signed-off-by: Lian Wang <lianux.mm@gmail.com>
---
 include/linux/swap.h |  1 -
 mm/swapfile.c        | 59 ++++++++++++++++++++++++--------------------
 2 files changed, 32 insertions(+), 28 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 17b8ec654ee2..bfca46e1fbc6 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -261,7 +261,6 @@ struct swap_info_struct {
 	struct percpu_ref users;	/* indicate and keep swap device valid. */
 	unsigned long	flags;		/* SWP_USED etc: see above */
 	signed short	prio;		/* swap priority of this type */
-	struct plist_node list;		/* entry in swap_active_head */
 	signed char	type;		/* strange name for an index */
 	unsigned int	max;		/* size of this swap device */
 	struct swap_cluster_info *cluster_info; /* array, one entry per cluster */
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 5c26682c0bab..7b3520ce1e41 100644
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
@@ -3423,7 +3416,6 @@ static void __swap_device_enable(struct swap_info_struct *si)
 	spin_unlock(&swap_queue_update_lock);
 	atomic_long_add(si->pages, &nr_swap_pages);
 	total_swap_pages += si->pages;
-	plist_add(&si->list, &swap_active_head);
 	add_to_avail_list(si);
 }
 
@@ -3443,9 +3435,8 @@ static int swap_device_disable(struct address_space *mapping,
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
@@ -3470,7 +3461,6 @@ static int swap_device_disable(struct address_space *mapping,
 	spin_lock(&swap_queue_update_lock);
 	si->flags &= ~SWP_WRITEOK;
 	spin_unlock(&swap_queue_update_lock);
-	plist_del(&si->list, &swap_active_head);
 	total_swap_pages -= si->pages;
 	atomic_long_sub(si->pages, &nr_swap_pages);
 
@@ -3801,7 +3791,6 @@ static struct swap_info_struct *alloc_swap_info(void)
 		 */
 	}
 	p->swap_extent_root = RB_ROOT;
-	plist_node_init(&p->list, 0);
 	p->flags = SWP_USED;
 	percpu_up_write(&swapon_rwsem);
 	if (defer) {
@@ -4211,12 +4200,7 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
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
@@ -4342,7 +4326,33 @@ int swap_dup_entry_direct(swp_entry_t entry)
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
@@ -4366,14 +4376,9 @@ void __folio_throttle_swaprate(struct folio *folio, gfp_t gfp)
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
