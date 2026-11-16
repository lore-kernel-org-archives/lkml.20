Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794802150;
	b=bbFyoY1X+lw9AMwE3LmXknS8BFW6lTlF0KCHAoOuQ41l+7QpoSstnmGbT4/jZ0H4pt/V
	 kOWDB5kuE2F7JuxOkLt+HNtKTTmOLOkORlaacbsP79byE5xgu6c0fbgPWHqm6bl9HvFwW
	 b5ydcNNAefQ+ovdCf9Fbt3+fC3G9nKc/kpTVsHesQz82r7ndd9itzDYnW8ypXlq2wQ0Wn
	 YJ0jGgMHlZR6z436lzcKqBACojSFD0xCMvqC1Ab2glGRqoGXQ2emo29xH7BWg4YxpxG9M
	 /qOKIIKgmV0qMNbwQl5KEdtRULWvkacnr6H4PRVbph03DQo33pyyvvD+jWWyU0U606A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794802150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TVesT5WTeyuZfbJVWZqEGh6jf17QAW5DDHWc+a+BLbM=;
	b=WiL9MDxrgCxlQ7kIsQ4VrGKZfIw0OG425jR/dnpMx+jPu4zZLYrsDX6pM8vjQ77CGsTS
	 0+zC/BfZVnJcAygApeJ+pCWatl2aRLhTGnALZS3/bdDUUwylyVLLcqGwUYGdvO/2SzA2w
	 XuivxZJcYMuPTAcRq0V9jbyz+wEN7gEAlJxCEPmOuWj1Dtj5V2cw69tkzym8I5n0bgo4s
	 17fvEWjMBTox9QY3Is40F/pEYCZJSJtmHbsxca8vbEXWTczfY33kH6nFwzznAfKxTPV19
	 2Tbm9KtAI7E9JxjjzJicZlR1CjHkOnPsvowfOD+65Mo5s45DjQbI2zXiGc7/Pl/5Nqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oaZiPl5g;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFBF606A336
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:09:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECFBF606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oaZiPl5g
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so1180755a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794802149; x=1795406949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TVesT5WTeyuZfbJVWZqEGh6jf17QAW5DDHWc+a+BLbM=;
        b=oaZiPl5gJ4kVQWIJ+cWCbmDC7bybCauxOqvK2d37TaelT/UlEoG8r0CtMZ3mpc8o9e
         9bVqewbMuLsw2BiFllAgrCTTuFtovuPg0uWMIcec0IZupIDSiSSKCWsfja2OHhL2ugI5
         4laQAfn4Gt82Wuw8gXEq2d7jl3vvqOSizXQMps42n1vJaCkKqNZ+x4bJsmJC0OAnzEa/
         ftH9dqZZJmafQRVc8q1lz8cEiMLX5LoTLwEhMOpIa4fIe56x22zMCDryxiycf4fr4I/P
         vxZUDjeIl8y1oKMZH6THszgYSCcELiUjJhswwzViOEmUfDkLsoEZRtdFvgoW4rlxGqvf
         j3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794802149; x=1795406949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TVesT5WTeyuZfbJVWZqEGh6jf17QAW5DDHWc+a+BLbM=;
        b=zHTJ/OopmkjxpREp5rhB7Mzqegi3ju5Xvx/cq91itxyWAe3JT/RYb/oN8VD6lP1qIF
         zQncuP+baW2Wtz9YPkjVpZzOFUUylwOjkkf2YAHzI/EeUlQyl/0GI8zEqgN+gDb+/vyX
         ADUTFhVbhsacldiBEP69Lh23ry5tBa4q++2C/yqyFVG6sDaBq1EBTND5uJsMM4SC1Ois
         uGyOQCC3OVypYH+2mI/FpPZw8WKHDDunNMZbKsWTSv8MfEWHulOB8YBXjus1gFny35yQ
         dfCA4TMjp4z67O2dP5/wClIGODMpEL6UWQxu1VeM3m4sgEAQcsVEURIXCa7IDPlHVhh/
         eTtA==
X-Gm-Message-State: APuU4Z+BWj+mx33pqhlsEE+EKdXhKIJZxsNgmtyZowCHs+6H9DN8QyzL
	+/Hih4iEh1wST3vH3EMRmOqjoLvBKlk5t8Kgmz66Cu3MKzBSD2DWkYNrfm28+Q==
X-Gm-Gg: AYBFou25HqOQDGhTNWhJCd6ghiVIdI0wEZ8DgdOx+5BbIPL+ZtQima7vk/vEHaAlLIC
	1RDv/MGKqCSk7I+6jczyYW3U2znrpyN17A54v25+iyQE2TZlmUG0+lyEOXEFQOlRvZ7RgEPx5BM
	wIDYWTM1JGHwR2sdNw6RbaGQnulrn67GnsZ7ETknXj5QzOLn8sv0954vZXI89Fh/n4zl1As6eaM
	74MxaBX6X2C1TOlt79ZltejOLbupV/v7xFrQ1a6AqQOBsjIE+ruqjXlVyDirdIQQD9/xifnU3Xc
	MxYiS0YLpnVbZVjUsN4kVheMrWZtuqNTzVuZZD4zsZmq/v67CB7f8gWODM2Ze58yFMStjkB7Ad/
	gHjJtMNZPXVhPkTBHF9NaJjd9odWyIN7cjvvEMnZo0skzpyUoIoVKAcpsiEXTVJHQisozVhwt1s
	Lt6MTvizk4KnkfGSGU88oq7P8lB7dXvlYxT/G1AYSMLNC9j2Wre9HD+TXHRHLqOzBhCnqeHmxcm
	9wI/+9tgBiEYgYuVyu6AhZzdGe7tQme5n7RwPZ0oGIOLbSNuFgszBhKascDEzLVcaRstIbFgjtH
	1rnmcx37B0DqQA2utTWSjP1ll2sXXOa8BxW5tlM7XziFDyvEQupw//q4LYbmuh/rWU6yVqgUt9b
	ah2/W8jPh1RrEGYH3CWPyuqd9w6D4Vkbze9nBP5ikAJ3Nukjg6QlFrQdpT2SoYOCOMcFirA==
X-Received: by 2002:a17:90b:4f85:b0:3b0:91ce:6720 with SMTP id 98e67ed59e1d1-3b1b0a1ef3emr8572099a91.30.1794802149076;
        Sun, 15 Nov 2026 20:09:09 -0800 (PST)
Received: from f2fs-test.c.googlers.com.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3f09b92sm7191989a91.4.2026.11.15.20.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:09:08 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH v2 05/20] f2fs: convert inode dirty page counters to dirty block counters
Date: Sun, 15 Nov 2026 20:08:36 -0800
Message-ID: <20261116040851.2849696-6-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
In-Reply-To: <20261116040851.2849696-1-daeho43@gmail.com>
References: <20261116040851.2849696-1-daeho43@gmail.com>
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
such as min_fsync_blocks and BLKS_PER_SEG, and it already holds blocks:
its helpers take page counts and convert them. Rename it to
dirty_blocks and make the helpers take block counts, and convert to
pages where a counter is compared with page based values. The
conversions are no-ops when the block size equals PAGE_SIZE.

The callers that account one block for a folio are left as they are,
which is still correct when the block size equals PAGE_SIZE. Later
patches convert them.

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
index b913d53e96e7..ffa2233d66f2 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -4279,7 +4279,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 
 	folio_batch_init(&fbatch);
 
-	if (get_dirty_pages(mapping->host) <=
+	if (get_dirty_blocks(mapping->host) <=
 				SM_I(F2FS_M_SB(mapping))->min_hot_blocks)
 		set_inode_flag(mapping->host, FI_HOT_DATA);
 	else
@@ -4524,7 +4524,7 @@ static int f2fs_write_cache_folios(struct address_space *mapping,
 	bool op_locked = false;
 	bool retry = false;
 
-	if (get_dirty_pages(inode) <= SM_I(sbi)->min_hot_blocks)
+	if (get_dirty_blocks(inode) <= SM_I(sbi)->min_hot_blocks)
 		set_inode_flag(inode, FI_HOT_DATA);
 	else
 		clear_inode_flag(inode, FI_HOT_DATA);
@@ -4788,7 +4788,7 @@ static inline bool __should_serialize_io(struct inode *inode,
 		return true;
 	if (wbc->sync_mode != WB_SYNC_ALL)
 		return true;
-	if (get_dirty_pages(inode) >= SM_I(F2FS_I_SB(inode))->min_seq_blocks)
+	if (get_dirty_blocks(inode) >= SM_I(F2FS_I_SB(inode))->min_seq_blocks)
 		return true;
 	return false;
 }
@@ -4827,7 +4827,7 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
 	bool locked = false;
 
 	/* skip writing if there is no dirty page in this inode */
-	if (!get_dirty_pages(inode) && wbc->sync_mode == WB_SYNC_NONE)
+	if (!get_dirty_blocks(inode) && wbc->sync_mode == WB_SYNC_NONE)
 		return 0;
 
 	/* during POR, we don't need to trigger writepage at all. */
@@ -4836,7 +4836,7 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
 
 	if ((S_ISDIR(inode->i_mode) || IS_NOQUOTA(inode)) &&
 			wbc->sync_mode == WB_SYNC_NONE &&
-			get_dirty_pages(inode) < nr_caches_to_skip(sbi, DATA) &&
+			get_dirty_blocks(inode) < nr_caches_to_skip(sbi, DATA) &&
 			f2fs_available_free_memory(sbi, DIRTY_DENTS))
 		goto skip_write;
 
@@ -4895,7 +4895,8 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
 	return ret;
 
 skip_write:
-	wbc->pages_skipped += get_dirty_pages(inode);
+	wbc->pages_skipped += get_dirty_blocks(inode) >>
+					F2FS_LOG_BLKS_PER_PAGE(sbi);
 	update_skipped_write(sbi, wbc);
 	trace_f2fs_writepages(mapping->host, wbc, DATA);
 	return 0;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 876407cbdbb5..9cf9583a4428 100644
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
 	return F2FS_BYTES_TO_BLK(sbi, folio_size(folio));
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
index 28fccc735a39..e0d246397ad0 100644
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
index f17bae198fe5..9b01ead00edc 100644
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
2.56.0.611.g1030f0b940-goog

