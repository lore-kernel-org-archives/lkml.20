Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794802141;
	b=iuETsdS3NvZCRgkSi97zY1eSL+pctYzt4BIQ8S75b/25pXd3pXK7V/mBSAPlbMRJQZJP
	 OpfNdwdsfmNmZm1LnX1xCl2MGt6Tzk47edUktbV7pf2ipdDbJdTIubPTx/5W6USMvVZ8Y
	 hP3vkRiFeRa1KyE3H4afEZh5w6SKZ9Sck57rV5vTffJ1OLl4NN3oX99mmqy8fknNK8j6V
	 SYqXZXkk98FfdPPrNC+tHVEERyUxi/lQGEMjVqEI4/M5GuSRLO3lkrbQX5Q6zta+7YhHK
	 NYgoZ/RhQq3lp/LoeDGFswcNxaUx6IAmkP2WMhznQjiv92n+enl1d234uQJK42xL2kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794802141;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HHGzdMvP7cENbSof2g/6E89KuzOsStt6jRYxwHA+WjE=;
	b=IzqtDCh9KS/wLxPKs6I21/pJz1QGtnBD3fdQDVJJfxsR7k+Ji6xndLQDTvGeQLBdJyut
	 a4mknOC0Rb8udcET/A6KaTFZGYdUfDBLbQICXG7+OPijdBPTO4l2Xip1FdAUbx/gcS0Zl
	 SH7Luu+owBnxc512QR8dcsOY/kYrqemVjQFolaXl7TlKpVHa9EnlsvMajYmaxAVWvHU1N
	 mwIJBJVjMgj/Y/k3rspOsQRZs9ZKIdzh7UbFBEE2QCa7x4BVWouMuU4AAQMDTInI32hmu
	 fJVp+VDenXlPYQrFYBAQbi8vShm0MxRl9GWS3iz7pBT/Wyv7nGP5vMpAeT1n0sJQWcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VVZMT+U0;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136A5606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 136A5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VVZMT+U0
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ed0e2015aaso12750535ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794802140; x=1795406940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HHGzdMvP7cENbSof2g/6E89KuzOsStt6jRYxwHA+WjE=;
        b=VVZMT+U0dFg7sZQBsY1Mb2SAJsYecUiYVqWLJPqwwNizmq7+XQWwjx9DxS2fbVtGiU
         mlriOkxHwc3SR3L6kyM3BvABYvSMOH4rD6F6PlR9zUCk25ubs4vAebBQpxn1PSbEg+am
         Yt9Y9ofkdfW+xQAyPn+laIhjLtJm44wTHCEjOZbD+mqEM0zN5HlnPVx+1qnIAAZNTfZN
         tshfZhj4DnMc1NKfErpNUniypLEsDCBut4XizhTE2waJyPQEHggFzxC99DTy7jDajOYN
         p13LPfwakmKXs37jx05B9UcJz3HCNaCCHa2wq7szhPCqFrul0dnnewnIh8KFDA8Ax+8k
         Lr3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794802140; x=1795406940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HHGzdMvP7cENbSof2g/6E89KuzOsStt6jRYxwHA+WjE=;
        b=fJY9/MBhfcSwZAYucixi0NQSSCjHNDg2/YWFg7QivAVrGnLDp75Cu8Ihp7iig5wiaF
         U8Pn/OaO8FHAU/3aA+tH+T7bhtam7k+XmTU8h6bC7kRU1C13IIl0r+lA4pZKiuo2FyiM
         Z0P7csEDyKeqFsVpHqVGAbfhroC3gtW/gxKx2N3guHbvLCMbXc6BiZ6QY0lNMRhzyHWI
         wnAVXyQw1ZjxKlFqZOxzfK7eVhZvOVXhldm24hK53Z511KLOu7/KaePGkUtkxj3HX/zh
         7UQ7ngd6ppvMxCQly6MXuR74yq9WKg7KV70QxrqFz8nAzb8R/3vgekciuwnVhtLgOt87
         j9Iw==
X-Gm-Message-State: APuU4Z+dC3jd6UytQtfJWzUVoFSX5nMX1RlnMdu9cIvBPU6qHdSBs90p
	RTTXpqoa0YvZBaO/Kn9q+lYcl40+mEUfwpVxAWgITB+nwkzNT3+tnSximyklIQ==
X-Gm-Gg: AYBFou3Vu/RhkM2OADNZrDMv1n8fj1DFCJjRzNpYbiU6VvoDSX2V05ecWq1n5VJ88YV
	/kJt5+Rb3/2qDkIoLlxhsN4YrLst9tbMYmA/og3uE8QceoCJfERnoTpUeoAnJqCUaK7Mn8QpCVb
	B33wAT9R+u7DDTgpNao75D7lh2SOjhJohUY7g+fmzQ2/QLcBjMjWg7ybHfJixv6nWnQiLX7BSYy
	8UH1lSKc5HFRFXqq5qt/pZKVShHbbaDLOQBXRA1GYVGzhSU9tzZzERdp0gQodA+VIW2soWG3RXL
	8M9M2KDVTu23hOMj1h3LHT/wxHslgpXWi2nUaKhjr0SLrbkD4f7RU+dFPXws1S4KYKLGE8j2CNy
	X42Gf83eDfuAhfV2+ezTSB622ZFWSA0I917OzVTp1dLvn7dsRvd7kPRwd6jC7bN3cya6ake28bL
	cEUqiKCFI7htNqQ3vDR22OlwMuIefw66eRwbA+sfsJ+8qBBWTFTdigYOJeLwOUQfhlgDzQdtpeg
	1RKMrm5+MBxvuuzrcfk0cAPENmEtY8Gc+fCTmrga5uK2VaTKysaHkvDgX2irOuF/A37ndUIYy4R
	mC/RylVZj2pq0ZJryxCIy043pQYUwObg+5jWZssCPOhrVPM/6W343H+zcdBZGg8kCbkNu8qtQEJ
	MHh846Q5IeGDrJjXlO7//d8dQzRPv9cFHVJC4UiR4T5c53w4=
X-Received: by 2002:a17:90b:54cb:b0:3b0:ac2c:1619 with SMTP id 98e67ed59e1d1-3b1b0a5064cmr8588325a91.39.1794802140306;
        Sun, 15 Nov 2026 20:09:00 -0800 (PST)
Received: from f2fs-test.c.googlers.com.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3f09b92sm7191989a91.4.2026.11.15.20.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:08:59 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH v2 01/20] f2fs: use block-based index and size calculations in more paths
Date: Sun, 15 Nov 2026 20:08:32 -0800
Message-ID: <20261116040851.2849696-2-daeho43@gmail.com>
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

Several paths still convert between file offsets and block indices with
PAGE_SHIFT or PAGE_SIZE, assuming that a page holds exactly one
filesystem block. Use the F2FS_BLK_* helpers there so that they stay
correct when the block size is smaller than PAGE_SIZE.

No functional change when the block size equals PAGE_SIZE, except on
32-bit architectures: __complete_revoke_list() now computes the
truncation offset and __clone_blkaddrs() the new i_size in 64 bits, so
that they no longer overflow beyond 4GB.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/data.c    |  5 +++--
 fs/f2fs/dir.c     |  3 +--
 fs/f2fs/file.c    | 50 +++++++++++++++++++++++------------------------
 fs/f2fs/segment.c |  5 +++--
 4 files changed, 32 insertions(+), 31 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 4ae61138a003..aacc92839f61 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1897,8 +1897,9 @@ struct folio *f2fs_get_new_data_folio(struct inode *inode,
 	}
 got_it:
 	if (new_i_size && i_size_read(inode) <
-				((loff_t)(index + 1) << PAGE_SHIFT))
-		f2fs_i_size_write(inode, ((loff_t)(index + 1) << PAGE_SHIFT));
+				F2FS_BLK_TO_BYTES(F2FS_I_SB(inode), index + 1))
+		f2fs_i_size_write(inode,
+				F2FS_BLK_TO_BYTES(F2FS_I_SB(inode), index + 1));
 	return folio;
 }
 
diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 70847313ca6a..a3cc3be88738 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -39,8 +39,7 @@ extern struct kmem_cache *f2fs_cf_name_slab;
 
 static unsigned long dir_blocks(struct inode *inode)
 {
-	return ((unsigned long long) (i_size_read(inode) + PAGE_SIZE - 1))
-							>> PAGE_SHIFT;
+	return F2FS_BLK_ALIGN(F2FS_I_SB(inode), i_size_read(inode));
 }
 
 static unsigned int dir_buckets(unsigned int level, int dir_level)
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 05061254c3b2..f8a444064ec8 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1543,7 +1543,7 @@ static int __clone_blkaddrs(struct inode *src_inode, struct inode *dst_inode,
 		if (do_replace[i] || blkaddr[i] == NULL_ADDR) {
 			struct dnode_of_data dn;
 			struct node_info ni;
-			size_t new_size;
+			loff_t new_size;
 			pgoff_t ilen;
 
 			set_new_dnode(&dn, dst_inode, NULL, NULL, 0);
@@ -1576,7 +1576,7 @@ static int __clone_blkaddrs(struct inode *src_inode, struct inode *dst_inode,
 				}
 				dn.ofs_in_node++;
 				i++;
-				new_size = (loff_t)(dst + i) << PAGE_SHIFT;
+				new_size = F2FS_BLK_TO_BYTES(sbi, dst + i);
 				if (dst_inode->i_size < new_size)
 					f2fs_i_size_write(dst_inode, new_size);
 			} while (--ilen && (do_replace[i] || blkaddr[i] == NULL_ADDR));
@@ -1593,7 +1593,7 @@ static int __clone_blkaddrs(struct inode *src_inode, struct inode *dst_inode,
 				return PTR_ERR(fsrc);
 
 			src_off = offset_in_folio(fsrc,
-						(loff_t)(src + i) << PAGE_SHIFT);
+						F2FS_BLK_TO_BYTES(sbi, src + i));
 
 			/*
 			 * For same-inode operations (collapse/insert), src and
@@ -1623,10 +1623,10 @@ static int __clone_blkaddrs(struct inode *src_inode, struct inode *dst_inode,
 			}
 
 			dst_off = offset_in_folio(fdst,
-					(loff_t)(dst + i) << PAGE_SHIFT);
+					F2FS_BLK_TO_BYTES(sbi, dst + i));
 			f2fs_folio_wait_writeback(fdst, true, true);
 			memcpy_folio(fdst, dst_off, fsrc, src_off,
-				    PAGE_SIZE);
+				    F2FS_BLKSIZE(sbi));
 			if (folio_test_large(fdst)) {
 				if (!f2fs_ffs_find_or_alloc(fdst)) {
 					f2fs_folio_put(fdst, true);
@@ -1635,15 +1635,15 @@ static int __clone_blkaddrs(struct inode *src_inode, struct inode *dst_inode,
 					return -ENOMEM;
 				}
 				f2fs_ffs_mark_subrange_uptodate(fdst,
-							dst_off, PAGE_SIZE);
+						dst_off, F2FS_BLKSIZE(sbi));
 				f2fs_ffs_mark_subrange_dirty(fdst, dst_off,
-							    PAGE_SIZE);
+						F2FS_BLKSIZE(sbi));
 			}
 			folio_mark_dirty(fdst);
 			if (same_folio && i_size_read(dst_inode) <
-			    ((loff_t)(dst + i + 1) << PAGE_SHIFT))
+			    F2FS_BLK_TO_BYTES(sbi, dst + i + 1))
 				f2fs_i_size_write(dst_inode,
-					((loff_t)(dst + i + 1) << PAGE_SHIFT));
+					F2FS_BLK_TO_BYTES(sbi, dst + i + 1));
 			folio_set_f2fs_gcing(fdst);
 			f2fs_folio_put(fdst, true);
 			if (!same_folio)
@@ -1715,9 +1715,9 @@ static int f2fs_do_collapse(struct inode *inode, loff_t offset, loff_t len)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct f2fs_lock_context lc;
-	pgoff_t nrpages = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
-	pgoff_t start = offset >> PAGE_SHIFT;
-	pgoff_t end = (offset + len) >> PAGE_SHIFT;
+	pgoff_t nrpages = F2FS_BLK_ALIGN(sbi, i_size_read(inode));
+	pgoff_t start = F2FS_BYTES_TO_BLK(sbi, offset);
+	pgoff_t end = F2FS_BYTES_TO_BLK(sbi, offset + len);
 	int ret;
 
 	f2fs_balance_fs(sbi, true);
@@ -1988,10 +1988,10 @@ static int f2fs_insert_range(struct inode *inode, loff_t offset, loff_t len)
 	if (ret)
 		return ret;
 
-	pg_start = offset >> PAGE_SHIFT;
-	pg_end = (offset + len) >> PAGE_SHIFT;
+	pg_start = F2FS_BYTES_TO_BLK(sbi, offset);
+	pg_end = F2FS_BYTES_TO_BLK(sbi, offset + len);
 	delta = pg_end - pg_start;
-	idx = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
+	idx = F2FS_BLK_ALIGN(sbi, i_size_read(inode));
 
 	/* avoid gc operation during block exchange */
 	f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
@@ -3104,10 +3104,10 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 	f2fs_balance_fs(sbi, true);
 
 	inode_lock(inode);
-	pg_start = range->start >> PAGE_SHIFT;
+	pg_start = F2FS_BYTES_TO_BLK(sbi, range->start);
 	pg_end = min_t(pgoff_t,
-				(range->start + range->len) >> PAGE_SHIFT,
-				DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE));
+				F2FS_BYTES_TO_BLK(sbi, range->start + range->len),
+				F2FS_BLK_ALIGN(sbi, i_size_read(inode)));
 
 	if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED) ||
 		f2fs_is_atomic_file(inode)) {
@@ -3124,8 +3124,8 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 
 	/* writeback all dirty pages in the range */
 	err = filemap_write_and_wait_range(inode->i_mapping,
-						(loff_t)pg_start << PAGE_SHIFT,
-						((loff_t)pg_end << PAGE_SHIFT) - 1);
+						F2FS_BLK_TO_BYTES(sbi, pg_start),
+						F2FS_BLK_TO_BYTES(sbi, pg_end) - 1);
 	if (err)
 		goto out;
 
@@ -3249,7 +3249,7 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 unlock_out:
 	inode_unlock(inode);
 	if (!err) {
-		range->len = (u64)total << PAGE_SHIFT;
+		range->len = F2FS_BLK_TO_BYTES(sbi, total);
 		stat_inc_defrag_blk_count(sbi, total);
 	}
 	return err;
@@ -4354,7 +4354,7 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 	f2fs_down_write(&fi->i_gc_rwsem[WRITE]);
 	filemap_invalidate_lock(inode->i_mapping);
 
-	last_idx = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
+	last_idx = F2FS_BLK_ALIGN(sbi, i_size_read(inode));
 
 	while (page_idx < last_idx) {
 		struct dnode_of_data dn;
@@ -4532,7 +4532,7 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 	f2fs_down_write(&fi->i_gc_rwsem[WRITE]);
 	filemap_invalidate_lock(inode->i_mapping);
 
-	last_idx = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
+	last_idx = F2FS_BLK_ALIGN(sbi, i_size_read(inode));
 
 	while (page_idx < last_idx) {
 		struct dnode_of_data dn;
@@ -4997,7 +4997,7 @@ static int f2fs_ioc_decompress_file(struct file *filp)
 	if (!atomic_read(&fi->i_compr_blocks))
 		goto out;
 
-	last_idx = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
+	last_idx = F2FS_BLK_ALIGN(sbi, i_size_read(inode));
 	last_idx >>= fi->i_log_cluster_size;
 
 	for (cluster_idx = 0; cluster_idx < last_idx; cluster_idx++) {
@@ -5084,7 +5084,7 @@ static int f2fs_ioc_compress_file(struct file *filp)
 
 	set_inode_flag(inode, FI_ENABLE_COMPRESS);
 
-	last_idx = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
+	last_idx = F2FS_BLK_ALIGN(sbi, i_size_read(inode));
 	last_idx >>= fi->i_log_cluster_size;
 
 	for (cluster_idx = 0; cluster_idx < last_idx; cluster_idx++) {
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 31ac93a93021..2b0821c2c18b 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -285,6 +285,7 @@ static int __replace_atomic_write_block(struct inode *inode, pgoff_t index,
 static void __complete_revoke_list(struct inode *inode, struct list_head *head,
 					bool revoke)
 {
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct revoke_entry *cur, *tmp;
 	pgoff_t start_index = 0;
 	bool truncate = is_inode_flag_set(inode, FI_ATOMIC_REPLACE);
@@ -303,7 +304,7 @@ static void __complete_revoke_list(struct inode *inode, struct list_head *head,
 	}
 
 	if (!revoke && truncate)
-		f2fs_do_truncate_blocks(inode, start_index * PAGE_SIZE, false);
+		f2fs_do_truncate_blocks(inode, F2FS_BLK_TO_BYTES(sbi, start_index), false);
 }
 
 static int __f2fs_commit_atomic_write(struct inode *inode)
@@ -315,7 +316,7 @@ static int __f2fs_commit_atomic_write(struct inode *inode)
 	struct list_head revoke_list;
 	block_t blkaddr;
 	struct dnode_of_data dn;
-	pgoff_t len = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
+	pgoff_t len = F2FS_BLK_ALIGN(sbi, i_size_read(inode));
 	pgoff_t off = 0, blen, index;
 	int ret = 0, i;
 
-- 
2.56.0.611.g1030f0b940-goog

