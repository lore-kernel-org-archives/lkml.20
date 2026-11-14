Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794667885;
	b=QikWTxIjGfLMNMdaGJjpWOnKSW6jV50Enbnhhz7VMuAVYV1ythP0i2zsNYqhX9Mrav3s
	 5Zd6O6seoyL4HHNnnAxSBKx1EGhN3Jcc2pa4Vo/iG1lETJcUI7IbeYKXWpbFlklJEJrpz
	 qfgIl+usAPpohJFzOR7i49+LJg0R/+Pp9n2zPlei2kV0iFi4Rf71OBkkHdksJpPXZhhTx
	 DE4p9FjR7YkJg/kWt/l2sOz354Ru8CBrR4GeUQMx0NwrW9CSfkh9GJ+FRFZTL6q2sAkQk
	 M734QlGURxirOpebTv2pDvXNn0VrA1GCwmv4oVT6v4tUxetVV/iKg+lu1lQeMzZHvRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794667885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UJ5F+HaNH4ZBPeQoxzjH5cK/wA3ysLS4ghrprv5+TaM=;
	b=CCArZ/SYRPJpahgVU4nxof5B6jd0n+juAQzSHU698EsJXMF9nOR5MBjgeznAGjrbmLrs
	 fRTqjpehavsybckEfBSCW872C8elT78PUqGaKC//hFyR7NjDLMxYnuDJ78ISGyLcE/8h/
	 uB9Or+OmUxdN4cxFOq58V59E9RdaniwcaQeAmlEr3Z+aI8pgvoVI0ihvoX7S2p7dwLNA6
	 pAfHKFoGFveGblOR0V6SZRBqVQvyUFE8NQoMf4+5boyEkdvDH2SiHxcACRDtTWUaf/Qur
	 aYvuMDsJbGYiLhO2JP1PiC758lFE96nmtQgDk13ml4nCpl/I0ba2tMTLaR84o+kqUSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dGkNxRVU;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF688606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:51:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF688606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dGkNxRVU
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ed06b725fdso20527665ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794667884; x=1795272684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UJ5F+HaNH4ZBPeQoxzjH5cK/wA3ysLS4ghrprv5+TaM=;
        b=dGkNxRVUdtRyIQOGoqyZzwhGBsDZ7WX7Dnw1i1Uvzwo7LnwDRSyMpgL9xuKQAq1d0c
         dqAAInek1wNFPbnEu7k9rev1XK7p5S7DrM8VARbyF76a1eCzClLeJlvzdyIwR1pdi+cc
         J1JWQS00R6Qkqk/49gdggpeg6dLyVGSF4XOs3D/EbkbARR6anJfntOSRSoimdit20gou
         i/L4BZYxawdEi7WhRGD/zbhBlTrGGslz28oOTPriRmv8NTG1ku99NyugpNbetHuKShX9
         BAdn+g3jTff1am/zzoqoXYaQdd+PuPBjDosMvzysFFXyWt4njCKVrGW57YTGbWz7O48B
         f/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794667884; x=1795272684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UJ5F+HaNH4ZBPeQoxzjH5cK/wA3ysLS4ghrprv5+TaM=;
        b=on4ibWFzq6w5QQvHWAUhVVOILDJBXo/u7LDZEjdBkpPgJJ6KBW5uHyTBe1zPRPHDYl
         pC4uLsNBU8DOdVXji3a36CjfGxx3gwBekPLsHRpRkTWNHx+I7jQ6Nq0wbVhjdhIx4kdi
         7ZeQZLJbxoVB7hqUZ+ValTdOSxXdJc6Z2T9D5gNYsBkB4cdYQgLK3aJg2jU2rhJWHtr9
         ADFxL1TSjUKelZf4PqO+ctBr6oHBZw/6gsM6+dbGoic+yhnV5tT+agKwTz33Z78/RD5h
         esgryh2C1VAsEuolnifu8Q4ZidQwmPaJrEKi1gK+zWRqGGrD1eMkAIGQDvNg9KerWXyy
         dH4Q==
X-Gm-Message-State: APuU4Z8bD+fkU21BSyn4Z7dU7vSgt/CppWWGeSADbarZbV9FBy7tYpz2
	BbK8LJYICykf2HEGrBmdcEZ4rSYfFP+h4cA9oHDyQ0mkufzS8+DJcBCv
X-Gm-Gg: AYBFou0ppKZVQDvhpZD21vb2Zg9+tO6iND3567NZfOdNj841lswJOA53BvvbZ+gJe+L
	IeLUtBrqW6MSVZ0/kKZavNAXtqE+gFJidVDRaN4fa/pkl3NTU7pQ1tjgtmlMGrel8K+sGDSn+up
	pnBWabQuPApVUhRdiZeEeNAAjslkNeFItLrdPtLyGR/S12AcWGzDaNEL5aiHPnSOGDT5ogGohWX
	9RgkIekokaplIOUKRkHAdQPdFiuVn3qjMlrkjG0i3EcsPoaMMmWT+2I+3jr1NOtEiFdm2KOXIgk
	vsRg8RaiNm0VHIMm7qgJvysa3uob6LYhJiG01bt9pXMoQ/YHjLiOUNd3x4avV4TOIhSTXwZ6tVf
	2Mt7bncrac7rKYfHpa6tx97hAAJVUR+ZMkz6ZoA/5VeHiJsYSpXlSgbXeQA2NaIAowVmyDTM5vC
	jRGkjLj0nkG1GvUl1cjzfHLzh4YHgCjlXDSI0fhHE1VYiSZ8nKYhf/s+GZaAh6QTdKuoFz1FXkT
	dYZ7ZkbYrLnUif+O0lIG57rjk88SIZ8wJBjFEWhwSdU4ubzYdPyy4xKSMcIKf27vmcDraXVSwFV
	b1cLV3u+a9KaAX46WKq3u4965X3dvgJbXJFZ2s+2Ze1+MbdcY/FSD3IqdlPn0WkNxIIp
X-Received: by 2002:a17:903:15c8:b0:2e2:d3ef:125 with SMTP id d9443c01a7336-2ee0d9fcecbmr38203785ad.5.1794667884113;
        Sat, 14 Nov 2026 06:51:24 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f874871sm21105465ad.54.2026.11.14.06.51.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 06:51:23 -0800 (PST)
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
Subject: [RFC PATCH v4 11/18] mm/swap: remove available list
Date: Sat, 14 Nov 2026 22:51:14 +0800
Message-ID: <3bb9571ebf783db7a86a0ee2e7b00883c1de850b.1794666741.git.lianux.mm@gmail.com>
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

The allocator now selects devices from the priority queue. Move the
remaining block-cgroup throttle traversal from swap_avail_head to
swap_active_head under swapon_rwsem. Check SWP_WRITEOK, the off-list
state and the backing block device to retain priority-ordered target
selection.

Remove swap_avail_head, swap_avail_lock, the per-device avail_list field
and their maintenance now that no consumer needs the available plist.
Queue masking and the embedded availability state remain serialized by
swap_queue_update_lock.

Signed-off-by: Kairui Song <kasong@tencent.com>
Signed-off-by: Lian Wang <lianux.mm@gmail.com>
---
 include/linux/swap.h |  1 -
 mm/swapfile.c        | 33 ++++++---------------------------
 2 files changed, 6 insertions(+), 28 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 6f32de173fb9..d31f3f023d36 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -289,7 +289,6 @@ struct swap_info_struct {
 	struct work_struct discard_work; /* discard worker */
 	struct work_struct reclaim_work; /* reclaim worker */
 	struct list_head discard_clusters; /* discard clusters list */
-	struct plist_node avail_list;   /* entry in swap_avail_head */
 	const struct swap_ops *ops;
 };
 
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 21d27da95898..5c5e449e9da3 100644
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
@@ -1713,7 +1698,6 @@ static void del_from_avail_list(struct swap_info_struct *si, bool swapoff)
 {
 	unsigned long pages;
 
-	spin_lock(&swap_avail_lock);
 	spin_lock(&swap_queue_update_lock);
 
 	/*
@@ -1736,10 +1720,8 @@ static void del_from_avail_list(struct swap_info_struct *si, bool swapoff)
 	}
 
 	swap_queue_mask(si);
-	plist_del(&si->avail_list, &swap_avail_head);
 skip:
 	spin_unlock(&swap_queue_update_lock);
-	spin_unlock(&swap_avail_lock);
 }
 
 /* SWAP_USAGE_OFFLIST_BIT can only be cleared by this helper. */
@@ -1748,7 +1730,6 @@ static void add_to_avail_list(struct swap_info_struct *si)
 	long val;
 	unsigned long pages;
 
-	spin_lock(&swap_avail_lock);
 	spin_lock(&swap_queue_update_lock);
 
 	/*
@@ -1779,10 +1760,8 @@ static void add_to_avail_list(struct swap_info_struct *si)
 	}
 
 	swap_queue_unmask(si);
-	plist_add(&si->avail_list, &swap_avail_head);
 skip:
 	spin_unlock(&swap_queue_update_lock);
-	spin_unlock(&swap_avail_lock);
 }
 
 /*
@@ -3910,7 +3889,6 @@ static struct swap_info_struct *alloc_swap_info(void)
 	}
 	p->swap_extent_root = RB_ROOT;
 	plist_node_init(&p->list, 0);
-	plist_node_init(&p->avail_list, 0);
 	p->flags = SWP_USED;
 	percpu_up_write(&swapon_rwsem);
 	if (defer) {
@@ -4326,7 +4304,6 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 	 */
 	si->prio = prio;
 	si->list.prio = -si->prio;
-	si->avail_list.prio = -si->prio;
 
 	/*
 	 * Publish swap_file before making the percpu ref live, then add the device
@@ -4475,14 +4452,16 @@ void __folio_throttle_swaprate(struct folio *folio, gfp_t gfp)
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
 
