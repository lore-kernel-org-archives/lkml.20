Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648405;
	b=T2LBD4pRziv1wrUSM1LROHqQYTFyNu8/06WcI8OpqL/YM7Yov3/KDAZQKd7J+cVyBHgV
	 XzNZxJ9RP1VQJ1wN/gZ8bSstjfovqUMGVmbaGkKDlQlr+KL3p6KYNwTLyLbkBh0vFsbCJ
	 +BRE5RK0Hfvfo73rX3C1o5dPKegC6J3j8lgkdBtkVicOR2kFvy47EmQ/WTU3Br2FdYsAj
	 rykLj2tWsMziKAcK2wE0Iqlu0QAaZCYIX7kOx6gWRTH3mYBBu3q0+asWDlUK/pDj8vyVw
	 Ck7YJGohgTrACo2+SN+VIBwNvxu80evkndRKJXfVoKaj4pmpPxjx02iJB7kOP1lYJxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6N5uNP4gur0oD/TAybxvvmXj9LSwUE0mVrMCxvkY1h8=;
	b=Aiy9CEAzP4NVOqmA1Vv7cLMlEfcdBcBSqEQDCVRbxQ7JOqd+FpQ/EDNpXijp7Xf8OykG
	 MkiWS1eJDrDNaJhSJpfb2owbXaySH93pC9Z0k9RXuh6oAHjM2yIhf0PtgduFyc0ECOn1S
	 PqS38CdLb5YlhS+ti1DcduA4GFUJ2zNV+mPLEhPtV0+H9TeutZ22exNBT59ZFua3+lh3q
	 Q2UspJBzL+zyTzygLU0d24kW7dMiUmFru1dRCaM//6Yx5FGhXSTnGzy0nHAWmMq++2gsN
	 LOOAv+nptk6RDIUsQ2SnvdQLV2m+TEtzYFUU/Bcg0hBgVzBDTUd9LL6nTBtKwBJ+usA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="DtSe/apB";
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F18C606A339
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:40:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F18C606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DtSe/apB
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a06e79e152so1627531b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793648405; x=1794253205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6N5uNP4gur0oD/TAybxvvmXj9LSwUE0mVrMCxvkY1h8=;
        b=DtSe/apBz14+P3drg+XgOBsrQQgpP7fFO7+qmoOtOWOR8By9c8ezMBeolR7sh4L9sl
         99ZqEAT4c+VPO9ug2VOjtWeUuQSBonG1Ghb0eebslc5nBlKxpTXd7/2QTDl5NuCFJQH1
         55NfOWjI5mUuSqI+mX5rPUC3Kxy4s7wbTCgVeGGndHCkt9+Ih//h5twySngvcEiVFKvf
         xwlFzGw5pCmBeIn/elNHcxtPgX9sGfJnznto3I5UHhdUb+YuwxrkM+5msy90jB8Y7PoH
         RGgKYyArVEv3FulA8BnawNfR5jz9d0b8yyTX/W5h0azWlfeMrPBDQVSqSrmjchBcWAtG
         1cPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648405; x=1794253205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6N5uNP4gur0oD/TAybxvvmXj9LSwUE0mVrMCxvkY1h8=;
        b=eg7vyWTgr7RY5fiwt/RR6NVuet5e5gQL0JRf4zNZOLtUzvXxcMF/r8AEn0rzSiG2+p
         DMMw0brmWI4gScB8iG/xQJZYbKdq0TUgb3AMvLfvdJldqTAew7YR+m1o5MUvEAGPYfUM
         DYp3O1ZpmhnT1QQi+aY2BvkXKZU6aM4Y/uYYYCPVziSQVTggfQg7eKOmirhx2S8e4qN0
         zzgPvU6oZ4unO7OS1cnsGzZsKo5X9jF11XB2c9+P/b+HhOgtfwU/EGfsKWNi0s0Wi0Th
         UmtJ+BNjla6IG54Qd5byYImvsybIEMAl/4sdcd+VdaYGQZjRqzVlgEzP5V8OkL/Pbh0b
         Yhlw==
X-Gm-Message-State: AFq9FYIDRDEtqsVblbxQRN+isBWIJTaHaXeUbeeAv7dgMZMDLvyQvR1J
	Y5hTtoArtYsZzPZ52wIsEJ5iRzOxXYMdQ1F4eI+i7QTqI280nUuiFuTM8EqrhryX
X-Gm-Gg: AYBFou2HX7aFFsgoFEmi2Nnl4RMFPXB8DilBibCq8bQTcXYVFl/c+pqwk+UINgcEh5s
	Q+Qruf0xxI7DPLMFW0PeDu9EuybP8CnNjE5OGgmhrePlw62a76vr7UAZDXVs3kMQmOgElCF16oa
	UFALBsO4X3CekaIpOffeC1RXgv6GXSZ3xxXtiKi1N8xtLi9og9uM+LhUOxFq8rDyDjm4QVq+vho
	+Lk5HJrp9RKJbw7rhePF2oo2IbgXgSXPiZf00grnx2S8aKSGzr9186dl+bbYTbwv+1mELcz/ku5
	Bv/WgvdB03nGbGalnl2GJe2gftfij+RV2zLSz6IJxZRk6nTJ7wLUdoSaila1A1u6pmV0lh5L44P
	wjU49KYBR8zCTYlUiZETNoUjdQHiQVc6iPtIrZBwvdioZ2kDVjH6m+LlWx02EFPC5QA9DhtrrsX
	QYtNRZzIRSH3bWBomNQRcT/cJCtGQ7yuUIYgHJ3hIG3XR1B7EK/fS2+APr8dJ4vDOsYO5mhhUJM
	evP58t+JTQkjJCy25OYrVlkzK4Pm4IHIyL8XqKtVKArbgT54XoejMNn4lF71j17rOFirp6MYpO9
	uJYnundfkhyl2DYE4Ct0Cn+RcYDhkDBw6+gWIol24PJOUu5pZcbbGdN5+RdobMjc1bKttPPKjJ2
	f2FZ8JK8drDCxrhAd6OVGUFSIQNPDpV6iRp4yK+n+hdemGA==
X-Received: by 2002:a05:6a20:b603:b0:3e2:7030:9080 with SMTP id adf61e73a8af0-3e9289d8cbemr8684267637.47.1793648404515;
        Mon, 02 Nov 2026 11:40:04 -0800 (PST)
Received: from f2fs-test.c.googlers.com.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb364c48d4sm241826a12.27.2026.11.02.11.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:40:03 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH 01/20] f2fs: use block-based index and size calculations in remaining paths
Date: Mon,  2 Nov 2026 11:39:33 -0800
Message-ID: <20261102193952.3002018-2-daeho43@gmail.com>
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

Several paths still convert between file offsets and block indices with
PAGE_SHIFT or PAGE_SIZE, assuming that a page holds exactly one
filesystem block. Use the F2FS_BLK_* helpers there so that they stay
correct when the block size is smaller than PAGE_SIZE.

No functional change when the block size equals PAGE_SIZE, except that
__complete_revoke_list() now computes the truncation offset in 64 bits
and no longer overflows beyond 4GB on 32-bit architectures.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/data.c    |  5 +++--
 fs/f2fs/dir.c     |  4 ++--
 fs/f2fs/file.c    | 48 +++++++++++++++++++++++------------------------
 fs/f2fs/segment.c |  5 +++--
 4 files changed, 32 insertions(+), 30 deletions(-)

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
index 70847313ca6a..3eb0b7255951 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -39,8 +39,8 @@ extern struct kmem_cache *f2fs_cf_name_slab;
 
 static unsigned long dir_blocks(struct inode *inode)
 {
-	return ((unsigned long long) (i_size_read(inode) + PAGE_SIZE - 1))
-							>> PAGE_SHIFT;
+	return F2FS_BYTES_TO_BLK(F2FS_I_SB(inode),
+			i_size_read(inode) + F2FS_BLKSIZE_MASK(F2FS_I_SB(inode)));
 }
 
 static unsigned int dir_buckets(unsigned int level, int dir_level)
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 05061254c3b2..93d3088c96f0 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
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
2.56.0.317.g454f8302e1-goog

