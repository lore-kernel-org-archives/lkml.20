Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794802148;
	b=ozlk4zYKJApe5M11hdwJhymSHhSFR3vtW9Yb6b0ZhEXWSG0Yql4a/2An/HqhI3wwC1LR
	 7+rdkniz2ouMo/hS+Dg9RogfRHFZezFQfRVdyPGjororuz/DJKmYtUmSvE9b1znfURoNE
	 gzoO0UIxzKtaQnSO7C/fBDmVDDt70na/e2OAE3AbJHkh2N9ThzzJgP/dO7UX8HjDm4n2L
	 LfpMCMbXSEcKevPJrxEou2zQ0m1GJ/t8tHlZ34ce6b604u/PVeaKDRDOVp8UWPbnVrDlx
	 PjuEgrpIUz4wrghHn4a9vfE+rhvjzK4SzIVk1/H2SLsiyWLud5r4oQQmnb0C5R93y8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794802148;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jSfzEhwYtpo35rXzygaFWpN3gGzRX/jUUWEO+v3bhfI=;
	b=OvM1fmhh2YjHeV39wIKPdH3p6mGQE5da0As4se8Z6bX9Nn1OLagih5jx1tQHGIl76Zyz
	 TRW6JS3C3HUlmz7oNCyYfjRUnjztf1MPXbsdlS9LRmPXB/hn5al9kbggvt+kc8SzMzqDE
	 +ezSXvF17e4/CTDBz5Zet4fsuX1ty6hKsVHiRO0ECWTV7sWiRXSg0GsfWfAIW/DCpFnH8
	 3baJ60if+7udoQwPR4umf5KnBJjCNdaSW/a3+aQ8LGbx4UvyplUSO4VVsNy26wu1RZ+ZF
	 HtZYTt38DZkEip+Shx/eyL+dpxmxTfwRARUjeWeo5s07mzQnp5d9MSCCVU+MMD0yZLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B92IYyjz;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616E8606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:09:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 616E8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B92IYyjz
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b0bbdeae06so1971162a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794802148; x=1795406948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jSfzEhwYtpo35rXzygaFWpN3gGzRX/jUUWEO+v3bhfI=;
        b=B92IYyjzTB9aPYGPszw9cEbgFPt61HoA+dawLEi7bpOQ8LqyXmcc/6u4NSJfj8VEso
         STCmuDFhl2MSE1yj5PEIQ4wg6xXxRhEoqB68nvhUkBd//eC680T30B+rguplC+qaR6m2
         WO+A9c7kR5RC7UvVRz3uofr5AklJDaFKDSoBcYbXJvS+7z42ng5CQvfc4+7ASdNymSr9
         NkF0hMwOYjHZv3NCNIS6kCWVP09i6qP79eaTld99uHGnAc7sgGumzMLn6l9g39N2+Mjl
         cOhLe6p/am4qF50Afh2BFKW6pQeRW8aAZMXCadEPm/Oc1NIzPgUoObd+hKcS0Ru1+QRx
         pNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794802148; x=1795406948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jSfzEhwYtpo35rXzygaFWpN3gGzRX/jUUWEO+v3bhfI=;
        b=hFu3rP/WwG9h+5pGH739ahmlzFylvfhtwy7pGf4wDh/qWtt4zUPCvImXrmqFJo3h5Q
         A1APsce+CCSI5lJQ0z/0ime0VKawaV9cLZp0VDTutHwMRvpyVOqWLVpBEp1+42zL9ydI
         5zGKypd2/s/zk2JQc7TIWlpUQIoEyVJN3nnS4m29wzEglPYgtpTbeEOsgNECIzaFSmKn
         Lu/theq6hSHnMbMC1ckijzrtvQbFV9C0chcgsKrG2iSqvXPzzabaiSW582Hf8I1kNmYq
         rGuTQRiPP9DV3js0nNvvxgx9J7IUajWRoqg9HG0wU1mjLqmxchS3mvYMCyrFNLcOPhjm
         8Ffw==
X-Gm-Message-State: APuU4Z9aIL/qISu56ifVsfPRyPPFuLexrz5kAkIH+WKL4DcP9bQpNHib
	qKzczTJlgyddIVDU7X81k92iFuPpnwYyDJrVf1+3SPc2MJhG4m09PChZnSj/Nw==
X-Gm-Gg: AYBFou0OqrQcpvzDnHFpYgdeqM/JC5MCr5rd4DIlm8/9MQ2wlk7FGH1BXEvioDUcFnO
	0jyVL+ujgqhT7JwBNXUK6gQwmHzmz3kpkhjqBWoj6NfqelvBTZLlMHnOqjEgIbx5KvDAdyyRdUB
	fP/zk7XO5y/P8jEDAu7t1ye/uhVKTeHXOmdrqvfu4E6kHKlVUAYmLIQJD2GuvB3EjDrPSAQJC5t
	Xsf0nth+ufPYVfhcBDEQWGPDmdt3sBbDX4JqK7Iq3WYGOmUHKshqltfz9VjPkVFR8sdZkGie0/w
	VznzllQF5PlIQxxf8KeVmAxitH5Kk4ljjxImNtA8s8cm4fISsEVW2hnLxfNPLwZ+Y63ww24BApW
	NcYIPKMKq5Jdt+98a14N4LJctGfFbY0TUdOgv5RcoEFyP6iaxPDnZB4uQ078FzgfQwjNFr1V+Wc
	FjR0zay70UI1laCHKYPLsIxpgL+vVBlIksjFFN4bjiV1B6LnyZlBnhmzuymwFZXBKsJ9rnYUuCG
	jwyrJzuroMWPA+uk4b+Ku0I7Gj7DCIvqxoOyefaKI1G2tr7rVnpMfm5Sm8TouvrBPZJ5MEwQ7nO
	syQtqN27Bv2YcbnvInxYoWAXKeOH26UttFE/VqBc+6Q9iHEa71+40LtNpOwB2z3PAvxcdHVnyY2
	Na+X1DR9TAtuLKCI9CwQxd7+ACbCz86KZvXA0C8YX/UfE3C2NNWhw9JC96JPozg8rLFU5
X-Received: by 2002:a17:90b:1d45:b0:3a8:a98c:ea07 with SMTP id 98e67ed59e1d1-3b1b09f3a60mr8656857a91.13.1794802147517;
        Sun, 15 Nov 2026 20:09:07 -0800 (PST)
Received: from f2fs-test.c.googlers.com.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3f09b92sm7191989a91.4.2026.11.15.20.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:09:06 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH v2 04/20] f2fs: support subpage blocks in directory operations
Date: Sun, 15 Nov 2026 20:08:35 -0800
Message-ID: <20261116040851.2849696-5-daeho43@gmail.com>
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

With subpage blocks, a directory folio holds several dentry blocks.
Address a dentry block within its folio by its block index, and mark
only the modified dentry block dirty. When an empty dentry block is
freed, clear only the state of that block and keep the folio dirty if
other blocks in it are still dirty. If no dirty block is left, clear the
gcing flag of the folio too.

Also read the name length in f2fs_delete_entry() under the folio lock,
so that the dentry bitmap is not updated with a value read without it.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/dir.c    | 123 +++++++++++++++++++++++++++++++++--------------
 fs/f2fs/f2fs.h   |   2 +
 fs/f2fs/inline.c |   6 +--
 3 files changed, 91 insertions(+), 40 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index a3cc3be88738..91929c250085 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -37,6 +37,29 @@ static inline bool f2fs_should_fallback_to_linear(struct inode *dir)
 extern struct kmem_cache *f2fs_cf_name_slab;
 #endif
 
+static inline pgoff_t f2fs_dentry_to_lblk(struct f2fs_sb_info *sbi,
+					  struct folio *folio, void *de)
+{
+	return f2fs_folio_lblk(sbi, folio) +
+		F2FS_BYTES_TO_BLK(sbi, de - folio_address(folio));
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
 	return F2FS_BLK_ALIGN(F2FS_I_SB(inode), i_size_read(inode));
@@ -189,15 +212,16 @@ static unsigned long dir_block_index(unsigned int level,
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
@@ -288,7 +312,7 @@ static struct f2fs_dir_entry *find_in_level(struct inode *dir,
 	unsigned int nbucket, nblock;
 	unsigned int bidx, end_block, bucket_no;
 	struct f2fs_dir_entry *de = NULL;
-	pgoff_t next_pgofs;
+	pgoff_t next_blkofs;
 	bool room = false;
 	int max_slots;
 
@@ -305,11 +329,11 @@ static struct f2fs_dir_entry *find_in_level(struct inode *dir,
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
@@ -317,7 +341,8 @@ static struct f2fs_dir_entry *find_in_level(struct inode *dir,
 			}
 		}
 
-		de = find_in_block(dir, dentry_folio, fname, &max_slots, use_hash);
+		de = find_in_block(dir, dentry_folio, bidx, fname, &max_slots,
+				   use_hash);
 		if (IS_ERR(de)) {
 			f2fs_folio_put(dentry_folio, false);
 			*dentry_block = ERR_CAST(de);
@@ -353,7 +378,7 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
 					 const struct f2fs_filename *fname,
 					 void **dentry_block)
 {
-	unsigned long npages = dir_blocks(dir);
+	unsigned long nblocks = dir_blocks(dir);
 	struct f2fs_dir_entry *de = NULL;
 	unsigned int max_depth;
 	unsigned int level;
@@ -369,7 +394,7 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
 		goto out;
 	}
 
-	if (npages == 0)
+	if (nblocks == 0)
 		goto out;
 
 	max_depth = F2FS_I(dir)->i_current_depth;
@@ -467,7 +492,8 @@ void f2fs_set_link(struct inode *dir, struct f2fs_dir_entry *de,
 		f2fs_folio_wait_writeback(folio, true, true);
 		de->ino = cpu_to_le32(inode->i_ino);
 		de->file_type = fs_umode_to_ftype(inode->i_mode);
-		folio_mark_dirty(folio);
+		f2fs_mark_dentry_folio_dirty(dir, folio,
+				f2fs_dentry_to_lblk(F2FS_I_SB(dir), folio, de));
 	}
 
 	inode_set_mtime_to_ts(dir, inode_set_ctime_current(dir));
@@ -538,12 +564,12 @@ static int make_empty_dir(struct inode *inode,
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
@@ -736,7 +762,8 @@ int f2fs_add_regular_entry(struct inode *dir, const struct f2fs_filename *fname,
 		if (IS_ERR(dentry_folio))
 			return PTR_ERR(dentry_folio);
 
-		dentry_blk = folio_address(dentry_folio);
+		dentry_blk = f2fs_folio_lblk_address(F2FS_I_SB(dir),
+						     dentry_folio, block);
 		make_dentry_ptr_block(dir, &d, dentry_blk);
 		bit_pos = f2fs_room_for_filename(d.bitmap, slots, d.max);
 		if (bit_pos < d.max)
@@ -763,7 +790,7 @@ int f2fs_add_regular_entry(struct inode *dir, const struct f2fs_filename *fname,
 	f2fs_update_dentry(ino, mode, &d, &fname->disk_name, fname->hash,
 			   bit_pos);
 
-	folio_mark_dirty(dentry_folio);
+	f2fs_mark_dentry_folio_dirty(dir, dentry_folio, block);
 
 	if (inode) {
 		f2fs_i_pino_write(inode, dir->i_ino);
@@ -900,26 +927,29 @@ void f2fs_delete_entry(struct f2fs_dir_entry *dentry, void *dentry_block,
 	struct f2fs_dentry_ptr d;
 	struct folio *folio;
 	unsigned int bit_pos;
-	int slots = GET_DENTRY_SLOTS(le16_to_cpu(dentry->name_len));
+	int slots;
+	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
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
+	/* Read the dentry under the folio lock. */
+	slots = GET_DENTRY_SLOTS(le16_to_cpu(dentry->name_len));
+	index = f2fs_dentry_to_lblk(sbi, folio, dentry);
+	dentry_blk = f2fs_folio_lblk_address(sbi, folio, index);
 	make_dentry_ptr_block(dir, &d, dentry_blk);
 	bit_pos = dentry - d.dentry;
 	for (i = 0; i < slots; i++)
@@ -927,18 +957,34 @@ void f2fs_delete_entry(struct f2fs_dir_entry *dentry, void *dentry_block,
 
 	/* Let's check and deallocate this dentry page */
 	bit_pos = find_next_bit_le(d.bitmap, d.max, 0);
-	folio_mark_dirty(folio);
+	f2fs_mark_dentry_folio_dirty(dir, folio, index);
 
 	if (bit_pos == d.max &&
 	    !f2fs_truncate_hole(dir, index, index + 1)) {
+		if (f2fs_has_subpage_blocks(sbi)) {
+			size_t off = f2fs_folio_byte_offset(sbi, folio, index);
+			bool dirty;
+
+			dirty = f2fs_ffs_clear_subrange_dirty_and_test(folio,
+					off, F2FS_BLKSIZE(sbi));
+			f2fs_ffs_clear_subrange_uptodate(folio, off,
+							 F2FS_BLKSIZE(sbi));
+			if (dirty)
+				goto keep_dirty;
+			/* No dirty block is left to be written for GC. */
+			folio_clear_f2fs_gcing(folio);
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
@@ -960,20 +1006,21 @@ bool f2fs_empty_dir(struct inode *dir)
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
@@ -1079,7 +1126,7 @@ int f2fs_fill_dentries(struct dir_context *ctx, struct f2fs_dentry_ptr *d,
 static int f2fs_readdir(struct file *file, struct dir_context *ctx)
 {
 	struct inode *inode = file_inode(file);
-	unsigned long npages = dir_blocks(inode);
+	unsigned long nblocks = dir_blocks(inode);
 	void *dentry_blk = NULL;
 	struct file_ra_state *ra = &file->f_ra;
 	loff_t start_pos = ctx->pos;
@@ -1088,6 +1135,8 @@ static int f2fs_readdir(struct file *file, struct dir_context *ctx)
 	unsigned int n = (unsigned long)ctx->pos / entries;
 	struct f2fs_dentry_ptr d;
 	struct fscrypt_str fstr = FSTR_INIT(NULL, 0);
+	pgoff_t f_last = nblocks ? f2fs_lblk_to_folio_index(sbi, nblocks - 1) : 0;
+	pgoff_t f_index, ra_pages;
 	int err = 0;
 
 	if (IS_ENCRYPTED(inode)) {
@@ -1105,9 +1154,9 @@ static int f2fs_readdir(struct file *file, struct dir_context *ctx)
 		goto out_free;
 	}
 
-	for (; n < npages; ctx->pos = n * entries) {
+	for (; n < nblocks; ctx->pos = n * entries) {
 		struct folio *dentry_folio;
-		pgoff_t next_pgofs;
+		pgoff_t next_blkofs;
 
 		/* allow readdir() to be interrupted */
 		if (fatal_signal_pending(current)) {
@@ -1117,23 +1166,25 @@ static int f2fs_readdir(struct file *file, struct dir_context *ctx)
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
index 249c962434b5..876407cbdbb5 100644
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
2.56.0.611.g1030f0b940-goog

