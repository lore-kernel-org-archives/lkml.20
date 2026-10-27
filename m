Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793117419;
	b=sqFO5+rMIl4fpmprOn/GfyXrGYvrqXRh9TtKtKs1hA8a7rzkqQgurv7mipPPP/7nJi70
	 dBPGcE/xZQgV1NtO1+V1omhhc0KcfDCFBFG/9qwtFXhqUZC8YDfqFu9KRqQy5ZVrejPz+
	 Jjy12y9QnhvQtjiEzO6X0ALVxtJeuIbKmiguXxGe387YB+P6kElBIevJvVUiWfEyWG5UN
	 9i9LcNJE9a7EoOzr5Boqt03AtSRn1IDqscNjZiLO4aZ6tQIjum4AEPJnTGIvqInkgApjp
	 pAJ7h3VY22aqlvO4W1n0RScSd8ZMIh8XXhgj2sq/2mbqrumEKrjXB8rwfUjPkxi5dZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117419;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=K3Fc6Qd16BKiEoRWwD8fs3AmZLAKUuVGN6JC9AyRnB4=;
	b=VmTHsE+O337K64m1CnekWNNuHnMsf+T86F+KjUBxwhwnTzUB5DPAfNYcWOi0YRFZW5JR
	 vncSXeMaeuMizmrmm6HGYjJkc8mutA70DEGORtOjcTSgI4I+TUFNv6q8xfqOScYdNbQLC
	 HJ+4tvIZt/QZelqlHtDHs4bJyUjgSoUAwmjBWSyB2dh5zqSKSjqDrokwCCvuTeFCPFpeY
	 xzctxASYX2ljdd56qbMn7Yyhhc0uYU+IVkDPx1tgSC1eKl7Vykl1kT83Hov6bXDkTO8du
	 RgGJw+OLqgcgssEnKNpZZhOf5VCPsQYaBZ+8z9cG3Eyl4mYr12wjXjD84XmfwBeFJMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HXKeQK1v;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2977606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:10:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2977606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HXKeQK1v
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cd5d2dafeccso64574a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793117418; x=1793722218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K3Fc6Qd16BKiEoRWwD8fs3AmZLAKUuVGN6JC9AyRnB4=;
        b=HXKeQK1vBvPm91HtcYhla53wjgB1hXvht20hvn4vwueglOYy4nGWmBZ4XP0JhRa8No
         3R0oYvJpd465TZETfmWBIjSMRkmOzHq0VSz27eAfTcuTL2FGeZqms/NNR/cM46hJdkKf
         ZV6UYPvSFt3vV7kD8Cbue3iS2HJbKHm61ykKwcTAm0V2qRjKQPu6EGRFvvHo4BFI5zSs
         nndhw2VMCVCahs6tkSJtXhfj9N0Y8wV3yaaQiA/TU4FLUw+2Cf+U6MTPihJas+5DYcul
         DIuGgNtSqY2+0LVUhty8JbO90pvcMoIVJIS6eHWF1aCSTG2yTSwy1KYPWtmwNIJHUQZG
         R2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793117418; x=1793722218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K3Fc6Qd16BKiEoRWwD8fs3AmZLAKUuVGN6JC9AyRnB4=;
        b=MxrvytN8awmP2g1iCTZo1e/zyzt5zzfxw8SsIowEwd1lyW9fkp0BzMBx9nbJp30LEt
         xZ6HavyL1/xmPhqbCFX0XOK16pcDBbajNn1Shc6Qz0+1Wl09/4eSMPgnWBkE8M/4ueSA
         JtY5ae2Ye5+dw80HJ8qlSxtUlWkeroT6CluRFvNrzbUgI6hnTi3xLcjVIZHxj6lgLXUI
         GFQ9zBrrvmW3wlPVoDGEcdfuRazhS7viKfwNqpL/LvT5ClUuoF8TdEWocO4ZTZkSh6rq
         +noX2r5bFQt8cxcEMbuIECMXZHd+MDBoaGqvjJ9VIpDG/98J6KVMo/eiTDpntuTvlDMl
         oE+A==
X-Gm-Message-State: AFq9FYLNjKxodW5yNxXJ5AIkWiALjU2ZWfAOiZVYm2R2bMDa1qfcFGT0
	qQYW0Q3M/ds5EbW9HqUe2qaHjKyL5k0ZjrV4W3rgz/HCsgskUoMLRaxtE24E6g==
X-Gm-Gg: AYBFou29pJqUmRECijgMNh2VEoKwUpCic3Sq8k6ImplYgJM0+WCFBDIGzSoVGGYg+ct
	2ghOZ/WX9Pq3LJTpydnX7tUFA+9SfDMhUKc0wl4+wq4jpjiPFBbr1rXCryFnE6DvNztAw7g3Z4k
	9aKIxYhEQUYJcR/fEGMpWIO7r7SGSQi/UVEqLFVzbz3O76tKrrGsk4caErWmpgvxiWeIbL6cZLJ
	xbt1VC0DJ23m536HyBD4w6XfRO+BByHowi/uJpx2cGsgDGQec6VZL4rTg9l8DHxVAMaDxCTXg0K
	PqKMzmm/NrrG++7nRA668eepKDuu/r2EZr+6NZgXr0Rqaa8t9Ev+76flYmE+3Ml1MlSgnt7PEL7
	+J/KcDbsMfolVPrNbZUl9Gst336ESEfqbaCK1t5kij+QnGe5h73uoB1w84aMp7JpLppL+v9k+kw
	Aa91FfhpPBPvFzpz8hBEkKoVUpKpBNJTdQ4G3RDy0C0K5AEyd0fGCEFCnqhBK+JzQ7yXX+5QUWs
	2uP5rsfpAnz+Rzo56xKDf4rU5wNiOC1L7Pede+k35OKMklh3TiRI0xrXHuj9hYPc8ADNmts8gsc
	Y6bhSHqs/XGSMc5XbNptwJbUaR62jxYIouY8C6Fd
X-Received: by 2002:a17:903:3c63:b0:2e9:87a1:98b8 with SMTP id d9443c01a7336-2ea9c95ba29mr81806135ad.73.1793117418072;
        Tue, 27 Oct 2026 09:10:18 -0700 (PDT)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm12213585ad.65.2026.10.27.09.10.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 09:10:17 -0700 (PDT)
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
Subject: [RFC PATCH v3 11/18] mm/swap: remove available list
Date: Wed, 28 Oct 2026 00:09:49 +0800
Message-ID: <485a50f467e22ab0801b0ff16f2465fc4ed8c429.1793106426.git.lianux.mm@gmail.com>
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

Pure cleanup, no functional change.

After the priority queue replaced the allocator's device selection,
swap_avail_head and swap_avail_lock are no longer used. Remove them.

The throttle path now walks swap_active_head under swapon_rwsem.
Check SWP_WRITEOK and the existing off-list state. This preserves the old
priority ordering and does not select a full swap device.

Signed-off-by: Kairui Song <kasong@tencent.com>
Signed-off-by: Lian Wang <lianux.mm@gmail.com>
---
 include/linux/swap.h |  1 -
 mm/swapfile.c        | 33 ++++++---------------------------
 2 files changed, 6 insertions(+), 28 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 9357a9065f37..17b8ec654ee2 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -287,7 +287,6 @@ struct swap_info_struct {
 	struct work_struct discard_work; /* discard worker */
 	struct work_struct reclaim_work; /* reclaim worker */
 	struct list_head discard_clusters; /* discard clusters list */
-	struct plist_node avail_list;   /* entry in swap_avail_head */
 	const struct swap_ops *ops;
 };
 
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 2065e566b7a3..0a16343a5b03 100644
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
@@ -1652,7 +1637,6 @@ static void del_from_avail_list(struct swap_info_struct *si, bool swapoff)
 {
 	unsigned long pages;
 
-	spin_lock(&swap_avail_lock);
 	spin_lock(&swap_queue_update_lock);
 
 	/*
@@ -1672,10 +1656,8 @@ static void del_from_avail_list(struct swap_info_struct *si, bool swapoff)
 	}
 
 	swap_queue_mask(si);
-	plist_del(&si->avail_list, &swap_avail_head);
 skip:
 	spin_unlock(&swap_queue_update_lock);
-	spin_unlock(&swap_avail_lock);
 }
 
 /* SWAP_USAGE_OFFLIST_BIT can only be cleared by this helper. */
@@ -1684,7 +1666,6 @@ static void add_to_avail_list(struct swap_info_struct *si)
 	long val;
 	unsigned long pages;
 
-	spin_lock(&swap_avail_lock);
 	spin_lock(&swap_queue_update_lock);
 
 	/*
@@ -1715,10 +1696,8 @@ static void add_to_avail_list(struct swap_info_struct *si)
 	}
 
 	swap_queue_unmask(si);
-	plist_add(&si->avail_list, &swap_avail_head);
 skip:
 	spin_unlock(&swap_queue_update_lock);
-	spin_unlock(&swap_avail_lock);
 }
 
 /*
@@ -3844,7 +3823,6 @@ static struct swap_info_struct *alloc_swap_info(void)
 	}
 	p->swap_extent_root = RB_ROOT;
 	plist_node_init(&p->list, 0);
-	plist_node_init(&p->avail_list, 0);
 	p->flags = SWP_USED;
 	percpu_up_write(&swapon_rwsem);
 	if (defer) {
@@ -4260,7 +4238,6 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 	 */
 	si->prio = prio;
 	si->list.prio = -si->prio;
-	si->avail_list.prio = -si->prio;
 
 	/*
 	 * Publish swap_file before making the percpu ref live, then add the device
@@ -4409,14 +4386,16 @@ void __folio_throttle_swaprate(struct folio *folio, gfp_t gfp)
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
 
