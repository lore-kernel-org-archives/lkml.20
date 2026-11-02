Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648416;
	b=lXMLFkcXQxAlmYMAoPAwT8qXsl54akSpZH/jF/Wts7ysxQTxjK3dlaBcijjsVBDui+qx
	 VXL3C3B8BZ9K53BoU3btuQoHGrSQpTO5zl0RM2IpbALcxp2cwdb1LPbmMFxl6yUxjMyjz
	 pemPd1Klav4MEGGTCH9vNmMu7osFJ2jUozqSy0uxPaP+AL6zswgWjGk5H+CICsBsvrNic
	 dG9WmSfIglS5cgd7GZUUiJr0ycJfBPyV5GOqx+CKTAERjLjuS0d5kMdYeedhpjC5uhh1U
	 I4ASxQe7L9w7Ba3x3IHwL5Q0H6HgPdpU3ResgFO7XhjLLBV/rdLELbhKszBw7+d80lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648416;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0XbwM6n4G7SFInciq6ftEETns/YHQn9RRgHO0vqHZU0=;
	b=rVvOq+FR+SyI3hNIn3NyAecY/wiBwwWTdATyt/4E0dCLo3LoQpbBaUttncHqdQUx2CoM
	 +4BXx+lICXVWxt4di13uPuG50Mw4m4CRt1xjk4SsLLp+sFfcrpXsy3Vyo+M31T9G6j9gW
	 UtsRP2bvZA5RsjBCccdGIkWlB8FMbzuHhxPT9RztjaZn44I0MbPaIQP1QRrjTMrda9AV2
	 ZKiGFvheQGRA987eCqvXcpfJH4XVyE1pdf9nLCUAde/Ya7B/V7Xu781u+6kaO9DlJkAHd
	 oh+bFno7C6s537Hc4ewurm1WLEwRmlW5hHyE+CTCnbPV8KsG86Dbgnpv08fYK5OeGcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="S9A/6yJa";
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3723606D81D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3723606D81D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S9A/6yJa
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a06b27bf9bso1154464b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793648415; x=1794253215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0XbwM6n4G7SFInciq6ftEETns/YHQn9RRgHO0vqHZU0=;
        b=S9A/6yJa3Jx3/ftMRCuIpv4VJbvsCuly/fgJxcvp92g5WVRSmN+QRq3VNnZmJrL/Tj
         lah7H+EcamBSdaPvlehTEedHz3O47/28jsXgc8HgDm5t1wDOKYDppBJFG7s03s2iHQ4F
         yI+6osfwqyONE+E87isePiL/CNABWHGLBBNo0/4yrGiHkSaoGYBT3EQJMyKU91WUUHiR
         l+a6fOT8Pf51Qh28dnqwM7WZOpv/TEQPKpBGXgp27kCPW0+KnkuYyZpv/jrbkNfLyu+9
         9ww+teDqDbvc82Se2wNd2WRXjjwm6FifJOWLLA9fr9gy2d01rzXR2A6P2EGPb9OJv9jy
         BByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648415; x=1794253215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0XbwM6n4G7SFInciq6ftEETns/YHQn9RRgHO0vqHZU0=;
        b=15JBDyQqI3vVV7tt46omjedTWKPZ0bZ1dlbApqCupWITeEjEzGkMYvoe3XoyjFCpK/
         gYPwmhWjzfFnxJyeTZW5BzBfMeSgra+pku8TNGcSS0IanlwKV6mtt7uMF7Nr52NV6Tgi
         lU46j3mkvCS1zkOghFYHVIWdq1zXTV0vmnv2cWW3OsEgtRHeRbyEBn7uML1lFBBxR1P0
         /ItnHrrKL6bo/40QKuM4U92kOLH1xLheol3FbDv+9Ck8csYkKXJNMN4EOBxQM2xWwEFA
         LScSe2CAOzCxYocnDUY+g619AMHJ2ybZH/BPARl4khNNgSqxAbMDdmcdPjoxyiNu/IOh
         vkzw==
X-Gm-Message-State: AFq9FYLeJYNaA+5PTR/XTtCcDq1cAgIFZCq5iKUJf4IS+CAIF7/HGIr6
	1po63ttijnap2t1GT3q/6Z4s0Op3oUc0tQJVYF2Hjzug067dPI+shNsnqzRL3jBV
X-Gm-Gg: AYBFou12wc/YnWJRxwRv+hWori5eQTYxJi5MvotY4mw5+jPenb2zR8KdE1qiBjrEc10
	+MBFnpTuvtTT8R/PgKebcLBj8mj+afq9P0yUpqnFaL5UOR+BrYnolNUxYHh2AyG/RhsGpZxm0uY
	+5J1eC+fCwVQ3pyaBAjRKCv6zs+/i4fesDCXKAgk5ZnPueHyHhsNR9Mnc25KwpBBGxj36/qzWTS
	hdOit5WzneXyf3lpzSaH56+cFdv8tid0aVcZTY4grD6rbOP/XOvubp7cApvDd8Kahy9qHnvhkf2
	zUhLUfxd+JLY1zWr7dnfhrRfURtkcsO2cTdM5gKyjtcoWfxNUY+z7U0uPYtUHk2ZGe0A7DlrStV
	WaONlnJEnOgQFVJ/elfoT/Sm52iWyE+MIXg2QQGiMqiNWZkjZ0YixkKi5aUrk2sZ6E65zExMXLd
	k/BcANPQMDyDfbqTIxxZFR22YTuyHXYnW3j1XnyeW4NIXyidhNcc9eqBPZjfalzMmgqHzlxVhed
	VohRmxARnHcZcf6ly8hn6z9pSNruQacaaka6enz/pLx6ld1eMSIUKFvUHWy7iDnlRN06tHux04E
	dGiigZaaRjQLeOz2L6PJoC9cSZsIxannTYksyX+S6YXCTyfcKQ1pkPK8/lZ/+haCHnjRUrYZs9E
	O3EWhXWfevK9cs2IBXdHvMsM4i40SPSlD0JD6NzTWwZHiCw==
X-Received: by 2002:a05:6a20:e290:b0:3e1:558d:e37a with SMTP id adf61e73a8af0-3e928956ad8mr10008697637.26.1793648415096;
        Mon, 02 Nov 2026 11:40:15 -0800 (PST)
Received: from f2fs-test.c.googlers.com.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb364c48d4sm241826a12.27.2026.11.02.11.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:40:13 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH 05/20] f2fs: convert inode dirty page counters to dirty block counters
Date: Mon,  2 Nov 2026 11:39:37 -0800
Message-ID: <20261102193952.3002018-6-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261102193952.3002018-1-daeho43@gmail.com>
References: <20261102193952.3002018-1-daeho43@gmail.com>
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

From: Daeho Jeong <daehojeong@google.com>

The per-inode dirty counter is compared against block based thresholds
such as min_fsync_blocks and BLKS_PER_SEG, so with subpage blocks it
has to count blocks instead of pages. Rename it to dirty_blocks, make
its helpers take block counts, and convert to pages where it is
compared with page based values. The conversions are no-ops when the
block size equals PAGE_SIZE.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/checkpoint.c |  4 ++--
 fs/f2fs/data.c       | 13 +++++++------
 fs/f2fs/f2fs.h       | 36 +++++++++++++++++-------------------
 fs/f2fs/file.c       | 16 ++++++++--------
 fs/f2fs/inode.c      |  2 +-
 fs/f2fs/node.c       |  3 ++-
 fs/f2fs/super.c      |  2 +-
 7 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 158d97fc349a..1060ee651756 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1316,7 +1316,7 @@ static void __remove_dirty_inode(struct inode *inode, enum inode_type type)
 {
 	int flag = (type == DIR_INODE) ? FI_DIRTY_DIR : FI_DIRTY_FILE;
 
-	if (get_dirty_pages(inode) || !is_inode_flag_set(inode, flag))
+	if (get_dirty_blocks(inode) || !is_inode_flag_set(inode, flag))
 		return;
 
 	list_del_init(&F2FS_I(inode)->dirty_list);
@@ -1325,7 +1325,7 @@ static void __remove_dirty_inode(struct inode *inode, enum inode_type type)
 }
 
 /*
- * Account @nr dirty pages (negative when dirtiness is cleared) for @inode.
+ * Account @nr dirty blocks (negative when dirtiness is cleared) for @inode.
  */
 void f2fs_account_dirty_blocks(struct inode *inode, int nr)
 {
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index e983b59e4a65..f2254e872a3d 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -4282,7 +4282,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 
 	folio_batch_init(&fbatch);
 
-	if (get_dirty_pages(mapping->host) <=
+	if (get_dirty_blocks(mapping->host) <=
 				SM_I(F2FS_M_SB(mapping))->min_hot_blocks)
 		set_inode_flag(mapping->host, FI_HOT_DATA);
 	else
@@ -4527,7 +4527,7 @@ static int f2fs_write_cache_folios(struct address_space *mapping,
 	bool op_locked = false;
 	bool retry = false;
 
-	if (get_dirty_pages(inode) <= SM_I(sbi)->min_hot_blocks)
+	if (get_dirty_blocks(inode) <= SM_I(sbi)->min_hot_blocks)
 		set_inode_flag(inode, FI_HOT_DATA);
 	else
 		clear_inode_flag(inode, FI_HOT_DATA);
@@ -4791,7 +4791,7 @@ static inline bool __should_serialize_io(struct inode *inode,
 		return true;
 	if (wbc->sync_mode != WB_SYNC_ALL)
 		return true;
-	if (get_dirty_pages(inode) >= SM_I(F2FS_I_SB(inode))->min_seq_blocks)
+	if (get_dirty_blocks(inode) >= SM_I(F2FS_I_SB(inode))->min_seq_blocks)
 		return true;
 	return false;
 }
@@ -4830,7 +4830,7 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
 	bool locked = false;
 
 	/* skip writing if there is no dirty page in this inode */
-	if (!get_dirty_pages(inode) && wbc->sync_mode == WB_SYNC_NONE)
+	if (!get_dirty_blocks(inode) && wbc->sync_mode == WB_SYNC_NONE)
 		return 0;
 
 	/* during POR, we don't need to trigger writepage at all. */
@@ -4839,7 +4839,7 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
 
 	if ((S_ISDIR(inode->i_mode) || IS_NOQUOTA(inode)) &&
 			wbc->sync_mode == WB_SYNC_NONE &&
-			get_dirty_pages(inode) < nr_caches_to_skip(sbi, DATA) &&
+			get_dirty_blocks(inode) < nr_caches_to_skip(sbi, DATA) &&
 			f2fs_available_free_memory(sbi, DIRTY_DENTS))
 		goto skip_write;
 
@@ -4898,7 +4898,8 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
 	return ret;
 
 skip_write:
-	wbc->pages_skipped += get_dirty_pages(inode);
+	wbc->pages_skipped += get_dirty_blocks(inode) >>
+					F2FS_LOG_BLKS_PER_PAGE(sbi);
 	update_skipped_write(sbi, wbc);
 	trace_f2fs_writepages(mapping->host, wbc, DATA);
 	return 0;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 3822824326d7..bc67416a6663 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -957,7 +957,7 @@ struct f2fs_inode_info {
 	unsigned long flags[BITS_TO_LONGS(FI_MAX)];	/* use to pass per-file flags */
 	unsigned int ioprio_hint;	/* hint for IO priority */
 	struct f2fs_rwsem i_sem;	/* protect fi info */
-	atomic_t dirty_pages;		/* # of dirty pages */
+	atomic_t dirty_blocks;		/* # of dirty blocks */
 	f2fs_hash_t chash;		/* hash value of given file name */
 	unsigned int clevel;		/* maximum level of given file name */
 	struct task_struct *task;	/* lookup and create consistency */
@@ -2336,6 +2336,8 @@ static inline unsigned int f2fs_blocks_per_folio(struct f2fs_sb_info *sbi,
 	return folio_size(folio) >> sbi->log_blocksize;
 }
 
+#define F2FS_LOG_BLKS_PER_PAGE(sbi)	(PAGE_SHIFT - (sbi)->log_blocksize)
+
 static inline bool f2fs_has_subpage_blocks(struct f2fs_sb_info *sbi)
 {
 	return F2FS_BLKSIZE(sbi) < PAGE_SIZE;
@@ -2979,40 +2981,36 @@ static inline void dec_cache_count(struct f2fs_sb_info *sbi, int count_type)
 	sub_cache_counts(sbi, count_type, 1);
 }
 
-/*
- * Account @nr dirty pages for @inode; one page is
- * (PAGE_SIZE >> log_blocksize) filesystem blocks.
- */
-static inline void inode_add_dirty_blocks(struct inode *inode, int nr)
+static inline void inode_add_dirty_blocks(struct inode *inode,
+					  unsigned int nr_blocks)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	int blocks = nr * (PAGE_SIZE >> sbi->log_blocksize);
 
-	atomic_add(blocks, &F2FS_I(inode)->dirty_pages);
+	atomic_add(nr_blocks, &F2FS_I(inode)->dirty_blocks);
 	if (S_ISDIR(inode->i_mode))
-		add_cache_counts(sbi, F2FS_DIRTY_DENTS, blocks);
+		add_cache_counts(sbi, F2FS_DIRTY_DENTS, nr_blocks);
 	else
-		add_cache_counts(sbi, F2FS_DIRTY_DATA, blocks);
+		add_cache_counts(sbi, F2FS_DIRTY_DATA, nr_blocks);
 	if (IS_NOQUOTA(inode))
-		add_cache_counts(sbi, F2FS_DIRTY_QDATA, blocks);
+		add_cache_counts(sbi, F2FS_DIRTY_QDATA, nr_blocks);
 }
 
-static inline void inode_sub_dirty_blocks(struct inode *inode, int nr)
+static inline void inode_sub_dirty_blocks(struct inode *inode,
+					  unsigned int nr_blocks)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	int blocks = nr * (PAGE_SIZE >> sbi->log_blocksize);
 
 	if (!S_ISDIR(inode->i_mode) && !S_ISREG(inode->i_mode) &&
 			!S_ISLNK(inode->i_mode))
 		return;
 
-	atomic_sub(blocks, &F2FS_I(inode)->dirty_pages);
+	atomic_sub(nr_blocks, &F2FS_I(inode)->dirty_blocks);
 	if (S_ISDIR(inode->i_mode))
-		sub_cache_counts(sbi, F2FS_DIRTY_DENTS, blocks);
+		sub_cache_counts(sbi, F2FS_DIRTY_DENTS, nr_blocks);
 	else
-		sub_cache_counts(sbi, F2FS_DIRTY_DATA, blocks);
+		sub_cache_counts(sbi, F2FS_DIRTY_DATA, nr_blocks);
 	if (IS_NOQUOTA(inode))
-		sub_cache_counts(sbi, F2FS_DIRTY_QDATA, blocks);
+		sub_cache_counts(sbi, F2FS_DIRTY_QDATA, nr_blocks);
 }
 
 static inline void inode_inc_dirty_block(struct inode *inode)
@@ -3052,9 +3050,9 @@ static inline s64 get_nr_caches(struct f2fs_sb_info *sbi, int count_type)
 	return atomic_read(&sbi->nr_caches[count_type]);
 }
 
-static inline int get_dirty_pages(struct inode *inode)
+static inline int get_dirty_blocks(struct inode *inode)
 {
-	return atomic_read(&F2FS_I(inode)->dirty_pages);
+	return atomic_read(&F2FS_I(inode)->dirty_blocks);
 }
 
 static inline int get_blocktype_secs(struct f2fs_sb_info *sbi, int block_type)
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index e339cfd84b27..97c052b98559 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -376,7 +376,7 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
 		goto go_write;
 
 	/* if fdatasync is triggered, let's do in-place-update */
-	if (datasync || get_dirty_pages(inode) <= SM_I(sbi)->min_fsync_blocks)
+	if (datasync || get_dirty_blocks(inode) <= SM_I(sbi)->min_fsync_blocks)
 		set_inode_flag(inode, FI_NEED_IPU);
 	ret = file_write_and_wait_range(file, start, end);
 	clear_inode_flag(inode, FI_NEED_IPU);
@@ -2495,9 +2495,9 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 	 * Should wait end_io to count F2FS_WB_CP_DATA correctly by
 	 * f2fs_is_atomic_file.
 	 */
-	if (get_dirty_pages(inode))
-		f2fs_warn(sbi, "Unexpected flush for atomic writes: ino=%llu, npages=%u",
-			  inode->i_ino, get_dirty_pages(inode));
+	if (get_dirty_blocks(inode))
+		f2fs_warn(sbi, "Unexpected flush for atomic writes: ino=%llu, nblocks=%u",
+			  inode->i_ino, get_dirty_blocks(inode));
 	ret = filemap_write_and_wait_range(inode->i_mapping, 0, LLONG_MAX);
 	if (ret)
 		goto out_unlock;
@@ -2519,7 +2519,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 		F2FS_I(fi->cow_inode)->atomic_inode = inode;
 	} else {
 		/* Reuse the already created COW inode */
-		f2fs_bug_on(sbi, get_dirty_pages(fi->cow_inode));
+		f2fs_bug_on(sbi, get_dirty_blocks(fi->cow_inode));
 
 		invalidate_mapping_pages(fi->cow_inode->i_mapping, 0, -1);
 
@@ -4877,7 +4877,7 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
 		goto out;
 	}
 
-	if (f2fs_is_mmap_file(inode) || get_dirty_pages(inode)) {
+	if (f2fs_is_mmap_file(inode) || get_dirty_blocks(inode)) {
 		ret = -EBUSY;
 		goto out;
 	}
@@ -5033,7 +5033,7 @@ static int f2fs_ioc_decompress_file(struct file *filp)
 		if (ret < 0)
 			break;
 
-		if (get_dirty_pages(inode) >= BLKS_PER_SEG(sbi)) {
+		if (get_dirty_blocks(inode) >= BLKS_PER_SEG(sbi)) {
 			ret = filemap_fdatawrite(inode->i_mapping);
 			if (ret < 0)
 				break;
@@ -5123,7 +5123,7 @@ static int f2fs_ioc_compress_file(struct file *filp)
 		if (ret < 0)
 			break;
 
-		if (get_dirty_pages(inode) >= BLKS_PER_SEG(sbi)) {
+		if (get_dirty_blocks(inode) >= BLKS_PER_SEG(sbi)) {
 			ret = filemap_fdatawrite(inode->i_mapping);
 			if (ret < 0)
 				break;
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index f5a4dac98ef2..5c6a64b31b05 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -872,7 +872,7 @@ static void f2fs_pre_evict_inode(struct inode *inode)
 	    test_opt(sbi, COMPRESS_CACHE) && f2fs_compressed_file(inode))
 		f2fs_invalidate_compress_pages(sbi, inode->i_ino);
 
-	f2fs_bug_on(sbi, get_dirty_pages(inode));
+	f2fs_bug_on(sbi, get_dirty_blocks(inode));
 	f2fs_remove_dirty_inode(inode);
 	f2fs_remove_donate_inode(inode);
 
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index e53871f32c35..cb8affb2c1e0 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -85,7 +85,8 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type)
 	} else if (type == DIRTY_DENTS) {
 		if (bdi_wb_dirty_exceeded(sbi->sb->s_bdi))
 			return false;
-		mem_size = get_nr_caches(sbi, F2FS_DIRTY_DENTS);
+		mem_size = get_nr_caches(sbi, F2FS_DIRTY_DENTS) >>
+					F2FS_LOG_BLKS_PER_PAGE(sbi);
 		res = mem_size < ((avail_ram * nm_i->ram_thresh / 100) >> 1);
 	} else if (type == INO_ENTRIES) {
 		int i;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index f34558b661eb..fa74564adcfb 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1855,7 +1855,7 @@ static struct inode *f2fs_alloc_inode(struct super_block *sb)
 	init_once((void *) fi);
 
 	/* Initialize f2fs-specific inode info */
-	atomic_set(&fi->dirty_pages, 0);
+	atomic_set(&fi->dirty_blocks, 0);
 	atomic_set(&fi->i_compr_blocks, 0);
 	atomic_set(&fi->open_count, 0);
 	atomic_set(&fi->writeback, 0);
-- 
2.56.0.317.g454f8302e1-goog

