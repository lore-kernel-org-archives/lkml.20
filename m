Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648414;
	b=xYw8OyNxLihSQoxdH5alTmjgXivHu6h22MThInT34gyrPff7krbuqqA1eiA1HK/2ykcY
	 ZnJAQV+UJ0vFkMkeRCKhJXcWQZ9fqsh7l6375/w0Rv3iIzzOk2VeukijT9ro9mKIZn1T7
	 523mfepmyL+rchdsrIgGYQtR0jXV9E7B+Vm2L9qqeVlnyDdp1d7NSxtjoJ93r8fHvf92O
	 /vFm983+tcwqkNibjuyUAGMDzy7zT6ebuvu3dYYq5kpd/wBw3ZrsEUJQ3Yxmn+gS48XZN
	 Cj3yUSeWIdYFad2dEYvBZlmBvIFxAiWL8VssyBZqKKXpIcIX71IZLudBjg3vDASz93w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648414;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1e18CHA7DvSP98VTkQevUsp2Qwf7NnCZWjjChqUuStM=;
	b=qcMNCqHk+g9YLtZ6bp5tSOEghddipEFVidXd9uvHp4cg495zS7PtSQXJMsl2n86z0HZF
	 M/s5y56wUTV3GcLuDd5TnLo/S+XMHxK6qkGo3JLJ8WB824m+n5CN6LlQrZdDgNNzLzGmk
	 Q7+xxDRlLpqyNXtHOhzQfXXgfhiXXL6UwDudAX7sWHrs/bKoBl0kzwari6YH1UQgfAAyn
	 TM3Qpe4wf8f3/ukKuoCJcJyBrGs3ptLt8GzPZYNtxDmR5T7cxnDAbNdgey9uVYRbE7ADH
	 rb7q5EbCMaNu8LJMvEL/WNq5DUNQFpRxC/EVlmDzW56ToyZrnHp33mFEWZeDSNzf6Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v6QRk2eS;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7A5606D80E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D7A5606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v6QRk2eS
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cd69954c755so2474938a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793648413; x=1794253213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1e18CHA7DvSP98VTkQevUsp2Qwf7NnCZWjjChqUuStM=;
        b=v6QRk2eSoB4h0P4u4BkxtQRB0aGsD3icOX+JQEZVC/LsrBQLglcz1P4kIV0CjFGcCU
         XqZKxK+wsOxYU11rvTbfmh+HVVf0H09aREHxLqgeGUJqBqiSX2BB72shaWLrwIPiLsV4
         k3dlFRmULsrriCn7CW4ufpFjsmYO6GTDPpniwvUgCZ4I19RZhUfyXplPhxNdoFQP3Hcc
         ivPu9oz/XfiJWtgL7p1cw0cKsDYkLrQMaa4qSZsoblWZSHyYZM0JQIA5ZXK3dKRoszZc
         N706pNhAb0tEsEmarKJH8EZmbJ1ohLCwvG7+m6Vze9LWVLDF3nfISpWMmVnqu5kv0fgd
         w2NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648413; x=1794253213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1e18CHA7DvSP98VTkQevUsp2Qwf7NnCZWjjChqUuStM=;
        b=zQDWSaYeUATCcuhfcOfKVTAB3DPFn9/rGgwyN5vmBjzCYD3EpZNkCUPPqwt0v63EUk
         RtdC72lt3O8WnHiakJlkkivk3EROzNszwu3WSWHRfEV3dFEiupK+KWZA8BoUJwsYUrAc
         +eYrfHpE6H8GY6GVSrGI+1dJz7VLFgxQddQ+9hwO1MGNVlWTbGWMmb2dWdzT21spbtcG
         ckZhB91iU/qihkvCGqmMnjX4VEqKS0CSspqzPICo9sR9VSWpYjzE8TyyYIlafxbENdpd
         7CPw4vKt2XJxzXuXJcGY/68dnuGvzqGsp8i3A2GkK8YFSVSRiDIKuEvUWEoX4M6d23ba
         I+mQ==
X-Gm-Message-State: AFq9FYKqhX1BJ9FJ+Y/dIuduRz1Yrpuq9Evi1V6ceUBDflV7IfTNhhis
	cAynfsqMoXXBXeT9AWI2Iq3wOaiLlOEvvqRMo2a7OSn6STVxk2Ew4i7a5qPACDLu
X-Gm-Gg: AYBFou2z0v2/2ZohLlc9TVDrh1Px6lUtuQEhT4PWKJgBWUC1cvxt73xtwRQjlROHgip
	KAOz3Zv4+qdpivR21SVre5wQMWDbtWyz0EjKuDCxYPakp+Rrp7a/z2C4aKbaxz1cMWxDqoMVkH6
	IymaRRAgKuaD+T45MbJfzL9+DU+mLpbxgIc2TLMlNXytAI1HYLnpizcxXQpNgMyV8u9LgMhAD+L
	cwWSOzhYd5Ls1ttn5XxSo8ZLCvN4fWUaMs24LLcLuulRhBlWke+2Xx73f8B1kqcBFmDoled+dmL
	lKcoZwLSEV6vSXPZcurpBAgHzqZZGWn/LzVSdnPMrOIHAv3RTiL+HonHiWtvRqOuo0DnqjE6lrg
	dRxnD4wrov3OVSzraJloXU64eG/L19lsNwnQFQLQzbKluO884NiNs1++L6FetJ5Mm379IyQqdaD
	/HTSWoMJW01f1p7nGLp3fyRZKjFKnPnL/QR8JHgWi7ybZLcx4aiSrl54jXZLmRCtOhxWAWvqRBv
	68LN7Aik+GHuYvV/kwG1gfcEZMtmY+mvnpj7BKBRQVkGoMjNCKzY//COezqttgVgEsxyuY79lQm
	AYInGaiy4F4wBYwJSpV4koaJWyh51rS5SHX8gQnrQiN5ad0sA3mtlCFBfCnAZrhuRTM4wHi7Dd8
	8uBOUijPrkuiY3cdsBFZ15ClvfAbwF8Lg695dbQ/745UxKg==
X-Received: by 2002:a05:6a21:7741:b0:3de:48e4:c37d with SMTP id adf61e73a8af0-3e9289765e2mr8422649637.26.1793648413428;
        Mon, 02 Nov 2026 11:40:13 -0800 (PST)
Received: from f2fs-test.c.googlers.com.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb364c48d4sm241826a12.27.2026.11.02.11.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:40:12 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH 04/20] f2fs: support subpage blocks in directory operations
Date: Mon,  2 Nov 2026 11:39:36 -0800
Message-ID: <20261102193952.3002018-5-daeho43@gmail.com>
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

With subpage blocks, a directory folio holds several dentry blocks.
Address a dentry block within its folio by its block index, and mark
only the modified dentry block dirty. When an empty dentry block is
freed, clear only the state of that block and keep the folio dirty if
other blocks in it are still dirty.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/dir.c    | 120 +++++++++++++++++++++++++++++++++--------------
 fs/f2fs/f2fs.h   |   2 +
 fs/f2fs/inline.c |   6 +--
 3 files changed, 89 insertions(+), 39 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 3eb0b7255951..aa3511c6f8fe 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -37,6 +37,31 @@ static inline bool f2fs_should_fallback_to_linear(struct inode *dir)
 extern struct kmem_cache *f2fs_cf_name_slab;
 #endif
 
+static inline pgoff_t f2fs_dentry_to_lblk(struct f2fs_sb_info *sbi,
+					  struct folio *folio, void *de)
+{
+	size_t off = round_down((size_t)(de - folio_address(folio)),
+				(size_t)F2FS_BLKSIZE(sbi));
+
+	return f2fs_folio_lblk(sbi, folio) + (off >> sbi->log_blocksize);
+}
+
+void f2fs_mark_dentry_folio_dirty(struct inode *dir, struct folio *folio,
+				  pgoff_t bidx)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
+
+	if (f2fs_has_subpage_blocks(sbi)) {
+		size_t off = f2fs_folio_byte_offset(sbi, folio, bidx);
+
+		f2fs_ffs_mark_subrange_uptodate(folio, off, F2FS_BLKSIZE(sbi));
+		f2fs_ffs_mark_subrange_dirty(folio, off, F2FS_BLKSIZE(sbi));
+	} else if (!folio_test_uptodate(folio)) {
+		folio_mark_uptodate(folio);
+	}
+	folio_mark_dirty(folio);
+}
+
 static unsigned long dir_blocks(struct inode *inode)
 {
 	return F2FS_BYTES_TO_BLK(F2FS_I_SB(inode),
@@ -190,15 +215,16 @@ static unsigned long dir_block_index(unsigned int level,
 }
 
 static struct f2fs_dir_entry *find_in_block(struct inode *dir,
-				struct folio *dentry_folio,
+				struct folio *dentry_folio, pgoff_t bidx,
 				const struct f2fs_filename *fname,
 				int *max_slots,
 				bool use_hash)
 {
+	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
 	void *dentry_blk;
 	struct f2fs_dentry_ptr d;
 
-	dentry_blk = folio_address(dentry_folio);
+	dentry_blk = f2fs_folio_lblk_address(sbi, dentry_folio, bidx);
 
 	make_dentry_ptr_block(dir, &d, dentry_blk);
 	return f2fs_find_target_dentry(&d, fname, max_slots, use_hash);
@@ -289,7 +315,7 @@ static struct f2fs_dir_entry *find_in_level(struct inode *dir,
 	unsigned int nbucket, nblock;
 	unsigned int bidx, end_block, bucket_no;
 	struct f2fs_dir_entry *de = NULL;
-	pgoff_t next_pgofs;
+	pgoff_t next_blkofs;
 	bool room = false;
 	int max_slots;
 
@@ -306,11 +332,11 @@ static struct f2fs_dir_entry *find_in_level(struct inode *dir,
 	while (bidx < end_block) {
 		/* no need to allocate new dentry pages to all the indices */
 		struct folio *dentry_folio;
-		dentry_folio = f2fs_find_data_folio(dir, bidx, &next_pgofs);
+		dentry_folio = f2fs_find_data_folio(dir, bidx, &next_blkofs);
 		if (IS_ERR(dentry_folio)) {
 			if (PTR_ERR(dentry_folio) == -ENOENT) {
 				room = true;
-				bidx = next_pgofs;
+				bidx = next_blkofs;
 				continue;
 			} else {
 				*dentry_block = dentry_folio;
@@ -318,7 +344,8 @@ static struct f2fs_dir_entry *find_in_level(struct inode *dir,
 			}
 		}
 
-		de = find_in_block(dir, dentry_folio, fname, &max_slots, use_hash);
+		de = find_in_block(dir, dentry_folio, bidx, fname, &max_slots,
+				   use_hash);
 		if (IS_ERR(de)) {
 			f2fs_folio_put(dentry_folio, false);
 			*dentry_block = ERR_CAST(de);
@@ -354,7 +381,7 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
 					 const struct f2fs_filename *fname,
 					 void **dentry_block)
 {
-	unsigned long npages = dir_blocks(dir);
+	unsigned long nblocks = dir_blocks(dir);
 	struct f2fs_dir_entry *de = NULL;
 	unsigned int max_depth;
 	unsigned int level;
@@ -370,7 +397,7 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
 		goto out;
 	}
 
-	if (npages == 0)
+	if (nblocks == 0)
 		goto out;
 
 	max_depth = F2FS_I(dir)->i_current_depth;
@@ -468,7 +495,8 @@ void f2fs_set_link(struct inode *dir, struct f2fs_dir_entry *de,
 		f2fs_folio_wait_writeback(folio, true, true);
 		de->ino = cpu_to_le32(inode->i_ino);
 		de->file_type = fs_umode_to_ftype(inode->i_mode);
-		folio_mark_dirty(folio);
+		f2fs_mark_dentry_folio_dirty(dir, folio,
+				f2fs_dentry_to_lblk(F2FS_I_SB(dir), folio, de));
 	}
 
 	inode_set_mtime_to_ts(dir, inode_set_ctime_current(dir));
@@ -539,12 +567,12 @@ static int make_empty_dir(struct inode *inode,
 	if (IS_ERR(dentry_folio))
 		return PTR_ERR(dentry_folio);
 
-	dentry_blk = folio_address(dentry_folio);
+	dentry_blk = f2fs_folio_lblk_address(F2FS_I_SB(inode), dentry_folio, 0);
 
 	make_dentry_ptr_block(inode, &d, dentry_blk);
 	f2fs_do_make_empty_dir(inode, parent, &d);
 
-	folio_mark_dirty(dentry_folio);
+	f2fs_mark_dentry_folio_dirty(inode, dentry_folio, 0);
 	f2fs_folio_put(dentry_folio, true);
 	return 0;
 }
@@ -737,7 +765,8 @@ int f2fs_add_regular_entry(struct inode *dir, const struct f2fs_filename *fname,
 		if (IS_ERR(dentry_folio))
 			return PTR_ERR(dentry_folio);
 
-		dentry_blk = folio_address(dentry_folio);
+		dentry_blk = f2fs_folio_lblk_address(F2FS_I_SB(dir),
+						     dentry_folio, block);
 		make_dentry_ptr_block(dir, &d, dentry_blk);
 		bit_pos = f2fs_room_for_filename(d.bitmap, slots, d.max);
 		if (bit_pos < d.max)
@@ -764,7 +793,7 @@ int f2fs_add_regular_entry(struct inode *dir, const struct f2fs_filename *fname,
 	f2fs_update_dentry(ino, mode, &d, &fname->disk_name, fname->hash,
 			   bit_pos);
 
-	folio_mark_dirty(dentry_folio);
+	f2fs_mark_dentry_folio_dirty(dir, dentry_folio, block);
 
 	if (inode) {
 		f2fs_i_pino_write(inode, dir->i_ino);
@@ -902,25 +931,28 @@ void f2fs_delete_entry(struct f2fs_dir_entry *dentry, void *dentry_block,
 	struct folio *folio;
 	unsigned int bit_pos;
 	int slots = GET_DENTRY_SLOTS(le16_to_cpu(dentry->name_len));
+	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
+	size_t block_offset;
 	pgoff_t index;
 	int i;
 
-	f2fs_update_time(F2FS_I_SB(dir), REQ_TIME);
+	f2fs_update_time(sbi, REQ_TIME);
 
-	if (F2FS_OPTION(F2FS_I_SB(dir)).fsync_mode == FSYNC_MODE_STRICT)
-		f2fs_add_ino_entry(F2FS_I_SB(dir), dir->i_ino, TRANS_DIR_INO);
+	if (F2FS_OPTION(sbi).fsync_mode == FSYNC_MODE_STRICT)
+		f2fs_add_ino_entry(sbi, dir->i_ino, TRANS_DIR_INO);
 
 	if (f2fs_has_inline_dentry(dir))
 		return f2fs_delete_inline_entry(dentry,
 				f2fs_dentry_cache(dentry_block), dir, inode);
 
 	folio = f2fs_dentry_folio(dentry_block);
-	index = folio->index;
 
 	folio_lock(folio);
 	f2fs_folio_wait_writeback(folio, true, true);
 
-	dentry_blk = folio_address(folio);
+	index = f2fs_dentry_to_lblk(sbi, folio, dentry);
+	block_offset = f2fs_folio_byte_offset(sbi, folio, index);
+	dentry_blk = folio_address(folio) + block_offset;
 	make_dentry_ptr_block(dir, &d, dentry_blk);
 	bit_pos = dentry - d.dentry;
 	for (i = 0; i < slots; i++)
@@ -928,18 +960,31 @@ void f2fs_delete_entry(struct f2fs_dir_entry *dentry, void *dentry_block,
 
 	/* Let's check and deallocate this dentry page */
 	bit_pos = find_next_bit_le(d.bitmap, d.max, 0);
-	folio_mark_dirty(folio);
+	f2fs_mark_dentry_folio_dirty(dir, folio, index);
 
 	if (bit_pos == d.max &&
 	    !f2fs_truncate_hole(dir, index, index + 1)) {
+		if (f2fs_has_subpage_blocks(sbi)) {
+			bool dirty;
+
+			dirty = f2fs_ffs_clear_subrange_dirty_and_test(folio,
+					block_offset, F2FS_BLKSIZE(sbi));
+			f2fs_ffs_clear_subrange_uptodate(folio, block_offset,
+							 F2FS_BLKSIZE(sbi));
+			if (dirty)
+				goto keep_dirty;
+		}
 		f2fs_clear_page_cache_dirty_tag(folio);
 		folio_clear_dirty_for_io(folio);
-		folio_clear_uptodate(folio);
-		folio_detach_private(folio);
+		if (!f2fs_has_subpage_blocks(sbi)) {
+			folio_clear_uptodate(folio);
+			folio_detach_private(folio);
+			inode_dec_dirty_block(dir);
+		}
 
-		inode_dec_dirty_block(dir);
 		f2fs_remove_dirty_inode(dir);
 	}
+keep_dirty:
 	f2fs_folio_put(folio, true);
 
 	inode_set_mtime_to_ts(dir, inode_set_ctime_current(dir));
@@ -961,20 +1006,21 @@ bool f2fs_empty_dir(struct inode *dir)
 		return f2fs_empty_inline_dir(dir);
 
 	while (bidx < nblock) {
-		pgoff_t next_pgofs;
+		pgoff_t next_blkofs;
 		struct folio *dentry_folio;
 
-		dentry_folio = f2fs_find_data_folio(dir, bidx, &next_pgofs);
+		dentry_folio = f2fs_find_data_folio(dir, bidx, &next_blkofs);
 		if (IS_ERR(dentry_folio)) {
 			if (PTR_ERR(dentry_folio) == -ENOENT) {
-				bidx = next_pgofs;
+				bidx = next_blkofs;
 				continue;
 			} else {
 				return false;
 			}
 		}
 
-		dentry_blk = folio_address(dentry_folio);
+		dentry_blk = f2fs_folio_lblk_address(F2FS_I_SB(dir),
+						     dentry_folio, bidx);
 		make_dentry_ptr_block(dir, &d, dentry_blk);
 		if (bidx == 0)
 			bit_pos = 2;
@@ -1080,7 +1126,7 @@ int f2fs_fill_dentries(struct dir_context *ctx, struct f2fs_dentry_ptr *d,
 static int f2fs_readdir(struct file *file, struct dir_context *ctx)
 {
 	struct inode *inode = file_inode(file);
-	unsigned long npages = dir_blocks(inode);
+	unsigned long nblocks = dir_blocks(inode);
 	void *dentry_blk = NULL;
 	struct file_ra_state *ra = &file->f_ra;
 	loff_t start_pos = ctx->pos;
@@ -1089,6 +1135,8 @@ static int f2fs_readdir(struct file *file, struct dir_context *ctx)
 	unsigned int n = (unsigned long)ctx->pos / entries;
 	struct f2fs_dentry_ptr d;
 	struct fscrypt_str fstr = FSTR_INIT(NULL, 0);
+	pgoff_t f_last = nblocks ? f2fs_lblk_to_folio_index(sbi, nblocks - 1) : 0;
+	pgoff_t f_index, ra_pages;
 	int err = 0;
 
 	if (IS_ENCRYPTED(inode)) {
@@ -1106,9 +1154,9 @@ static int f2fs_readdir(struct file *file, struct dir_context *ctx)
 		goto out_free;
 	}
 
-	for (; n < npages; ctx->pos = n * entries) {
+	for (; n < nblocks; ctx->pos = n * entries) {
 		struct folio *dentry_folio;
-		pgoff_t next_pgofs;
+		pgoff_t next_blkofs;
 
 		/* allow readdir() to be interrupted */
 		if (fatal_signal_pending(current)) {
@@ -1118,23 +1166,25 @@ static int f2fs_readdir(struct file *file, struct dir_context *ctx)
 		cond_resched();
 
 		/* readahead for multi pages of dir */
-		if (npages - n > 1 && !ra_has_index(ra, n))
-			page_cache_sync_readahead(inode->i_mapping, ra, file, n,
-				min(npages - n, (pgoff_t)MAX_DIR_RA_PAGES));
+		f_index = f2fs_lblk_to_folio_index(sbi, n);
+		ra_pages = f_last - f_index + 1;
+		if (nblocks - n > 1 && !ra_has_index(ra, f_index))
+			page_cache_sync_readahead(inode->i_mapping, ra, file, f_index,
+				min(ra_pages, (pgoff_t)MAX_DIR_RA_PAGES));
 
-		dentry_folio = f2fs_find_data_folio(inode, n, &next_pgofs);
+		dentry_folio = f2fs_find_data_folio(inode, n, &next_blkofs);
 		if (IS_ERR(dentry_folio)) {
 			err = PTR_ERR(dentry_folio);
 			if (err == -ENOENT) {
 				err = 0;
-				n = next_pgofs;
+				n = next_blkofs;
 				continue;
 			} else {
 				goto out_free;
 			}
 		}
 
-		dentry_blk = folio_address(dentry_folio);
+		dentry_blk = f2fs_folio_lblk_address(sbi, dentry_folio, n);
 
 		make_dentry_ptr_block(inode, &d, dentry_blk);
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 114d3d7bcd3e..3822824326d7 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4193,6 +4193,8 @@ void f2fs_delete_entry(struct f2fs_dir_entry *dentry, void *dentry_blk,
 int f2fs_do_tmpfile(struct inode *inode, struct inode *dir,
 					struct f2fs_filename *fname);
 bool f2fs_empty_dir(struct inode *dir);
+void f2fs_mark_dentry_folio_dirty(struct inode *dir, struct folio *folio,
+				  pgoff_t bidx);
 
 static inline int f2fs_add_link(struct dentry *dentry, struct inode *inode)
 {
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 49905aa08418..ba0aff8e5643 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -463,10 +463,6 @@ static int f2fs_move_inline_dirents(struct inode *dir,
 	memcpy(dst.dentry, src.dentry, SIZE_OF_DIR_ENTRY * src.max);
 	memcpy(dst.filename, src.filename, src.max * F2FS_SLOT_LEN);
 
-	if (!folio_test_uptodate(folio))
-		folio_mark_uptodate(folio);
-	folio_mark_dirty(folio);
-
 	/* clear inline dir and flag after data writeback */
 	f2fs_truncate_inline_inode(dir, ientry, 0);
 
@@ -484,6 +480,8 @@ static int f2fs_move_inline_dirents(struct inode *dir,
 	f2fs_i_depth_write(dir, 1);
 	if (i_size_read(dir) < F2FS_BLKSIZE(F2FS_I_SB(dir)))
 		f2fs_i_size_write(dir, F2FS_BLKSIZE(F2FS_I_SB(dir)));
+
+	f2fs_mark_dentry_folio_dirty(dir, folio, 0);
 out:
 	f2fs_folio_put(folio, true);
 	return err;
-- 
2.56.0.317.g454f8302e1-goog

