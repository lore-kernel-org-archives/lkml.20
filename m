Received: from mta1.migadu.com (out-99.mta1.migadu.com [95.215.58.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F9A43B4B3
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787823935; cv=none; b=fSvWYw8cACLajrniRPXINweYGmhAqs14Gf91k+nYeQVakbmQR3OExhRZAvggSEbVmZuPsIhVjkarHmIYXaZM/0Ng5cM6kGIaHJNY3M9UmeNvjKEVaqtm7Hf4VmNT/1Acq6YM7g951XhRBAL1pGKIi4d/fHT3TqVcMoPxdFGOAeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787823935; c=relaxed/simple;
	bh=qN5qfHFLCaqgsQFJR8v0X6cE0BDwJ/bV4rM+l9CRTwo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-type; b=Bj2Ff/j3v2r2669LCA7+Na3Qk5b7tMWNqFnqNYudScrdpb/F7ciaY7Jva5rKaEXZ+nH+/g7yV45uJk0gPk08b5jwWLWKLNss7D2eUB7R/aX8694j/iiH0KQ41e2XwlcutFirqd1kkB5Vk3b2msJlQHQKuwBLBxDcWrTe2DSHUhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=95.215.58.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 9b7578548605922a;
	Thu, 27 Aug 2026 09:45:26 +0000
X-Mizu-Trace-ID: 9b7578548605922a
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <hebaoquan@kylinos.cn>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	nphamcs@gmail.com,
	baohua@kernel.org,
	youngjun.park@lge.com,
	hannes@cmpxchg.org,
	yosry@kernel.org,
	shikemeng@huaweicloud.com,
	chengming.zhou@linux.dev,
	baoquan.he@linux.dev,
	david@kernel.org,
	linux-kernel@vger.kernel.org,
	Baoquan He <hebaoquan@kylinos.cn>
Subject: [PATCH 02/16] mm: xswap support for zswap
Date: Thu, 27 Aug 2026 17:44:52 +0800
Message-ID: <20260827094509.1016740-3-hebaoquan@kylinos.cn>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260827094509.1016740-1-hebaoquan@kylinos.cn>
References: <20260827094509.1016740-1-hebaoquan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit

From: Chris Li <chrisl@kernel.org>

Introduce extendable swap device support — xswap.

An xswap device is a swap device with no backing storage and
no swap data section, so it wastes no disk space. Any write to an
xswap device will fail; to prevent accidental read or write, bdev of
swap_info_struct is set to NULL. Xswap devices set the SSD flag
because there is no rotational disk access when using zswap. Creation
is via a sysfs interface added in a later patch.

Zswap writeback is disabled if all swapfiles in the system are
xswap devices (tracked via nr_real_swapfiles).

Co-developed-by: Baoquan He <hebaoquan@kylinos.cn>
Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
Signed-off-by: Chris Li <chrisl@kernel.org>
---
 include/linux/swap.h |  2 ++
 mm/page_io.c         | 16 ++++++++++++++++
 mm/swap_state.c      |  7 +++++++
 mm/swapfile.c        | 37 ++++++++++++++++++++++++++++++++++---
 mm/zswap.c           |  7 ++++++-
 5 files changed, 65 insertions(+), 4 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 5658a1634b85..787fe463dcbb 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -207,6 +207,7 @@ enum {
 	SWP_STABLE_WRITES = (1 << 11),	/* no overwrite PG_writeback pages */
 	SWP_SYNCHRONOUS_IO = (1 << 12),	/* synchronous IO is efficient */
 	SWP_HIBERNATION = (1 << 13),	/* pinned for hibernation */
+	SWP_XSWAP	= (1 << 14),	/* extendable swap device */
 					/* add others here before... */
 };
 
@@ -356,6 +357,7 @@ void free_folio_and_swap_cache(struct folio *folio);
 void free_pages_and_swap_cache(struct encoded_page **, int);
 /* linux/mm/swapfile.c */
 extern atomic_long_t nr_swap_pages;
+extern atomic_t nr_real_swapfiles;
 extern long total_swap_pages;
 extern atomic_t nr_rotate_swap;
 
diff --git a/mm/page_io.c b/mm/page_io.c
index 88962571cb93..5483c943e3e3 100644
--- a/mm/page_io.c
+++ b/mm/page_io.c
@@ -248,6 +248,17 @@ int swap_writeout(struct swap_io_ctx *ctx, struct folio *folio)
 	}
 	rcu_read_unlock();
 
+	/*
+	 * ctx->sis is set by swap_add_folio() which is called from
+	 * __swap_writepage() below.  Since we must avoid the writepage
+	 * path for xswap devices, use the swap_info from the folio's
+	 * swap entry directly instead of going through ctx.
+	 */
+	if (unlikely(__swap_entry_to_info(folio->swap)->flags & SWP_XSWAP)) {
+		folio_mark_dirty(folio);
+		return AOP_WRITEPAGE_ACTIVATE;
+	}
+
 	__swap_writepage(ctx, folio);
 	return 0;
 out_unlock:
@@ -480,6 +491,11 @@ void swap_read_folio(struct swap_io_ctx *ctx, struct folio *folio)
 	if (zswap_load(folio) != -ENOENT)
 		goto finish;
 
+	if (unlikely(sis->flags & SWP_XSWAP)) {
+		folio_unlock(folio);
+		goto finish;
+	}
+
 	/* We have to read from slower devices. Increase zswap protection. */
 	zswap_folio_swapin(folio);
 	swap_add_folio(ctx, folio, READ);
diff --git a/mm/swap_state.c b/mm/swap_state.c
index b76eb3d876fd..2eedb7a3d7bb 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -830,6 +830,13 @@ struct folio *swap_cluster_readahead(swp_entry_t entry, gfp_t gfp_mask,
 	struct blk_plug plug;
 	swp_entry_t ra_entry;
 
+	/*
+	 * The entry may have been freed by another task. Avoid swap_info_get()
+	 * which will print error message if the race happens.
+	 */
+	if (si->flags & SWP_XSWAP)
+		goto skip;
+
 	mask = swapin_nr_pages(offset) - 1;
 	if (!mask)
 		goto skip;
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 53bf01d5f7f1..5aa1ffb97df8 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -66,6 +66,7 @@ static void move_cluster(struct swap_info_struct *si,
 static DEFINE_SPINLOCK(swap_lock);
 static unsigned int nr_swapfiles;
 atomic_long_t nr_swap_pages;
+atomic_t nr_real_swapfiles;
 /*
  * Some modules use swappable objects and may try to swap them out under
  * memory pressure (via the shrinker). Before doing so, they may wish to
@@ -1223,6 +1224,8 @@ static void del_from_avail_list(struct swap_info_struct *si, bool swapoff)
 			goto skip;
 	}
 
+	if (!(si->flags & SWP_XSWAP))
+		atomic_sub(1, &nr_real_swapfiles);
 	plist_del(&si->avail_list, &swap_avail_head);
 
 skip:
@@ -1265,6 +1268,8 @@ static void add_to_avail_list(struct swap_info_struct *si, bool swapon)
 	}
 
 	plist_add(&si->avail_list, &swap_avail_head);
+	if (!(si->flags & SWP_XSWAP))
+		atomic_add(1, &nr_real_swapfiles);
 
 skip:
 	spin_unlock(&swap_avail_lock);
@@ -2959,6 +2964,19 @@ static int setup_swap_extents(struct swap_info_struct *sis,
 	struct inode *inode = mapping->host;
 	int ret;
 
+	if (sis->flags & SWP_XSWAP) {
+		*span = 0;
+		/*
+		 * xswap devices have no backing block device and
+		 * physical writeout is skipped in swap_writeout(),
+		 * but sis->ops must still be set so that callers
+		 * like shrink_folio_list() can safely dereference
+		 * ops->flags.
+		 */
+		sis->ops = &swap_bdev_ops;
+		return 0;
+	}
+
 	ret = sio_pool_init();
 	if (ret)
 		return ret;
@@ -3167,7 +3185,8 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 
 	destroy_swap_extents(p, p->swap_file);
 
-	if (!(p->flags & SWP_SOLIDSTATE))
+	if (!(p->flags & SWP_XSWAP) &&
+	    !(p->flags & SWP_SOLIDSTATE))
 		atomic_dec(&nr_rotate_swap);
 
 	mutex_lock(&swapon_mutex);
@@ -3277,6 +3296,19 @@ static void swap_stop(struct seq_file *swap, void *v)
 	mutex_unlock(&swapon_mutex);
 }
 
+static const char *swap_type_str(struct swap_info_struct *si)
+{
+	struct file *file = si->swap_file;
+
+	if (si->flags & SWP_XSWAP)
+		return "xswap\t";
+
+	if (S_ISBLK(file_inode(file)->i_mode))
+		return "partition";
+
+	return "file\t";
+}
+
 static int swap_show(struct seq_file *swap, void *v)
 {
 	struct swap_info_struct *si = v;
@@ -3296,8 +3328,7 @@ static int swap_show(struct seq_file *swap, void *v)
 	len = seq_file_path(swap, file, " \t\n\\");
 	seq_printf(swap, "%*s%s\t%lu\t%s%lu\t%s%d\n",
 			len < 40 ? 40 - len : 1, " ",
-			S_ISBLK(file_inode(file)->i_mode) ?
-				"partition" : "file\t",
+			swap_type_str(si),
 			bytes, bytes < 10000000 ? "\t" : "",
 			inuse, inuse < 10000000 ? "\t" : "",
 			si->prio);
diff --git a/mm/zswap.c b/mm/zswap.c
index b9948d4657d2..064970a4393f 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -1000,6 +1000,11 @@ static int zswap_writeback_entry(struct zswap_entry *entry,
 	if (!si)
 		return -ENOENT;
 
+	if (si->flags & SWP_XSWAP) {
+		put_swap_device(si);
+		return -EINVAL;
+	}
+
 	mpol = get_task_policy(current);
 	folio = swap_cache_alloc_folio(swpentry, GFP_KERNEL, BIT(0), NULL, mpol,
 				       NO_INTERLEAVE_INDEX);
@@ -1545,7 +1550,7 @@ bool zswap_store(struct folio *folio)
 	zswap_pool_put(pool);
 put_objcg:
 	obj_cgroup_put(objcg);
-	if (!ret && zswap_pool_reached_full)
+	if (!ret && zswap_pool_reached_full && atomic_read(&nr_real_swapfiles))
 		queue_work(shrink_wq, &zswap_shrink_work);
 check_old:
 	/*
-- 
2.54.0

