Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0523C456F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788195741; cv=pass; b=IB6U0N3zxLLXiOgn38T0WqCttcbYJOIO7+TUCredWpHY1vvRVacua3KundhMy8s71H8Jdwkgmc56HK5tL56SA3fjyYHUibPabbxkQoIGG6uOKFIqShv7P3YhPtxSY6SFosWjELsjL+7C1FnPpembFSBiLFJH5LbmQ2uAnGTElXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788195741; c=relaxed/simple;
	bh=YteMzOk3eRKq81a8FPNyLBsheYGVOnxSAwPicka0cVc=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UagU4NGsLhlPrtIsMpeci2l/xUWM3jHwfnQXK53+DaX34jthCHb9wKT1G7CsRJRLecv9dK+5FXptSVft1Hi3RUFbHcCLcUkzhz5hc509QtzW+O0bVB6UOMpiJpea+4SNA+3p75qDadLkkgQir2wGA0WlVmg6D6HUmuDvcwKbXnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jFSCHjA8; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jFSCHjA8"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a0794669a6so6068741a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:02:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788195737; cv=none;
        d=google.com; s=arc-20260327;
        b=LOYs4y+6slPSmWE5wCmvnNLyisFPcd1yC+IOibUf2N2UAH6PbrgogkTYiyJ8piAv0O
         PnvhlP8i/OGcnHxwp3vZcLydtl3vKFayYc5AlzAc41TcI1Zmkd9ZYyIPHYXd6W7pqyfT
         FRbenfmKefaTekJAQ3qgGfgLJ6Bp0IO5rdAy+oJ/kdni4/enxrNez5tLwTR2XhuGlzVJ
         Rw+KJOVJAErSh16OtYN09ekK92+Zlivb/3l67yfwa4n5JXlwM6jmWpFvXDXn5497sW8E
         ZVFadAHPIhAavp2KpCJBeXJSARZ2BqV4yIPNJDv50qqWiSEmUfuqGUGtGSC8JaLPTpF7
         9AXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=RqZhl3KyjNT5gAP4GrsiR5RK9iHeIl9R7u9oOVd2Ssc=;
        fh=tX1MMhsH9j4lCcwpQUsp0FXBBRAqhzYSvo43MWRwIbg=;
        b=fam4h1DzqeS6090peb9Zi8skqWggPK+nfIbn7TAlCnI/tE4Av+4LOlWLXND8Th9QUG
         8WBA9/I6Z7wJZ/HezG9XuwYKX1h2NGL9fNyKG/z8X+b/QX7yZ7g5eXU59c2vFt3WlhU7
         OD+rziaEfQ9yEDLBs4/w9ZgktsCOizU5gOBbRF+oi//XhBjTxrLVmLpJeN9PQpl8zpvQ
         3W38kLZMGobexbafgBQViEb9CB5hhKhACDo9DNxsmnSB16y3dW+30KPuHaasKQflBUUK
         T3q1zaRknyK55/z7DO99HhjfFCgwqv2FTjdEUpykEb1Lq3C6YJG4Nk+aSY4iRDo1oaH6
         eeGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788195737; x=1788800537; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RqZhl3KyjNT5gAP4GrsiR5RK9iHeIl9R7u9oOVd2Ssc=;
        b=jFSCHjA8PNK5IuUDQUUYO6s9CafQ6d019GXNSpDkHGw/P8KLXRh3ocwlS1p4XDcFu3
         48LVL0dKbEXe+JSlZhWBqRUti1O4m6RnTH9JpGLw0/sGNXSDKCoFB9tX8htEmtSOgiW/
         LJ4YENX8I9cvJ82C7a8XrQS3eOIiM8Ql+qk1jWg308lm8jQmI+Xc1JqE1dFiNp5ZxaCl
         hX41fLMM1ZLUjJx1FAqgGmy/5kX68H6CvEaZ6qOUQWSp/zWEe8qT54k5mlUziEbk0cao
         IpZ70h3H85gVu9MjBChEwNtkMVHW4gm2oX6Pt9PXBEvIT1dhL7aLgmbt5laeQbMeVRZj
         eKbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788195737; x=1788800537;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RqZhl3KyjNT5gAP4GrsiR5RK9iHeIl9R7u9oOVd2Ssc=;
        b=i+1w0+WmU/l+BZqkJAwpzeePtadRtATrrZLcWA1YBBJf+xg9OJsv9Ow44KkkzRayYz
         eyalmomXq04PibkWgKc54JLGtajsiXNjkCXYC3H9hFwQOLb3u76TNJxq185+wAskQZX1
         O0su8h+9SZgMFXpaIUREdbvWswpxpfGL3rT3U84xiRn54wqW2LazldP4VGBxbUZugwUZ
         Rntkd5IwmAL4drqcdF/QqFxByskLOjyibmMfTVueBE3dJ0uhgZOmAia8ce3JCkshpGP8
         dN2zSluE63BjGPWrZMaJ3uJxrZPMTVLVm/jr3JyQ9uZv6TuyvNmuawFGkDOWOBxjCMPP
         v4Dg==
X-Forwarded-Encrypted: i=1; AKwUvBwAUitdAlopa1sE1QFrq5NFs7NqQdZ0mEVdueNp5HisTN+IN74/sZyn7laX/RyRvmIXkLWVVcDEUdjI1+Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lsve3PatNNCaXJR00iyypJVAdSMinHTkSceyifeP3aMf7oAglF
	9g/NkZ/WzPHUBNX7F4l+mTozcsubiDloxXyUgYeUYO89fTM+nasHA7rtWEwjD6YToLus0h9QlmP
	ciNDo/MFwLkI7dj8/64RX0SrGpJDjfyNpndFqmDA=
X-Gm-Gg: AYBFou1ZLwuQ0nH/tgcsddgBBhtvyAWOQmovnqc+J9Et3Ep6xku8sI6+dl4vd0MO2+7
	eidNLw0fYjvmxeIyHkf26nP5FgwGLOeiKAjXz49z0Juwn7n9Qhd7hPwx7KCwwZ/NWa6ulsnt269
	BMUYpcadqQ53oCxRK9R25juv3v5Bsa7hWGUHLDL41z7YeKyz/aanGUQzfwn3zH862aqAZh9At8s
	AaIY+BQjaPgfYBhBgU4758US2pJq9K1ZOM0anAYFSnAsq6USS0TCrpGOPKZY28rT88G53PJQ6Kd
	Jr2Q9Tcld782LGbz57cfURdeIwoWF2RPw3Kon3lkzC4++AqyU6SyXtQqzGMFtqY9VB327QyyXR4
	RtA==
X-Received: by 2002:a05:6402:5414:b0:6a6:32f5:ff3d with SMTP id
 4fb4d7f45d1cf-6a632f60114mr8666042a12.17.1788195737187; Mon, 31 Aug 2026
 10:02:17 -0700 (PDT)
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Aug 2026 19:02:16 +0200
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Aug 2026 19:02:16 +0200
From: Kelvin Zhang <zhangxp1998@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAH=xXfHWPg6qRwW+N2ziH1cvG3OD3wJc1z_Tm04MtFCpqYmQFg@mail.gmail.com>
References: <CAH=xXfHWPg6qRwW+N2ziH1cvG3OD3wJc1z_Tm04MtFCpqYmQFg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 31 Aug 2026 19:02:16 +0200
X-Gm-Features: AcwNN1WwLC2gMpSVYDVTHUZGEjuuZ7s8LcWu1aQjVNxQPwvamV8E1SfIjcRxvxY
Message-ID: <CAH=xXfFsmucd5DpYvXVmQQbE3618+TpzNYYX-0v3x7pLYKQRkw@mail.gmail.com>
Subject: [PATCH v4 05/11] f2fs: describe dentry block layout dynamically
To: linux-f2fs-devel@lists.sourceforge.net
Cc: jaegeuk@kernel.org, chao@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

An on-disk directory block contains a bitmap, reserved padding, an
array of directory entries (struct f2fs_dir_entry), and matching filename
slots. A fixed compile-time structure couples their offsets to 4KB blocks
and relies on static reserved-space definitions.

Remove struct f2fs_dentry_block and compute region offsets (bitmap
bytes, directory-entry count, and filename slots) dynamically from the
filesystem block size. Access directory blocks through
struct f2fs_dentry_ptr views initialized with the runtime geometry.

Update directory operations, inline dentry handling, and recovery paths
to use the dynamic block layout. No functional change is introduced for
4KB blocks.

Signed-off-by: Kelvin Zhang <zhangxp1998@gmail.com>
---
 fs/f2fs/dir.c           | 51 +++++++++++++++++++++--------------------
 fs/f2fs/f2fs.h          | 31 ++++++++++++++++---------
 fs/f2fs/inline.c        |  2 +-
 fs/f2fs/super.c         |  6 +++++
 include/linux/f2fs_fs.h | 31 ++++++++++++-------------
 5 files changed, 68 insertions(+), 53 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index fd0e2cd31a81..75ff36a13f60 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -195,7 +195,7 @@ static struct f2fs_dir_entry *find_in_block(struct
inode *dir,
 				int *max_slots,
 				bool use_hash)
 {
-	struct f2fs_dentry_block *dentry_blk;
+	void *dentry_blk;
 	struct f2fs_dentry_ptr d;

 	dentry_blk = folio_address(dentry_folio);
@@ -518,7 +518,7 @@ static int make_empty_dir(struct inode *inode,
 		struct inode *parent, struct folio *folio)
 {
 	struct folio *dentry_folio;
-	struct f2fs_dentry_block *dentry_blk;
+	void *dentry_blk;
 	struct f2fs_dentry_ptr d;

 	if (f2fs_has_inline_dentry(inode))
@@ -530,7 +530,7 @@ static int make_empty_dir(struct inode *inode,

 	dentry_blk = folio_address(dentry_folio);

-	make_dentry_ptr_block(NULL, &d, dentry_blk);
+	make_dentry_ptr_block(inode, &d, dentry_blk);
 	f2fs_do_make_empty_dir(inode, parent, &d);

 	folio_mark_dirty(dentry_folio);
@@ -690,7 +690,7 @@ int f2fs_add_regular_entry(struct inode *dir,
const struct f2fs_filename *fname,
 	unsigned long bidx, block;
 	unsigned int nbucket, nblock;
 	struct folio *dentry_folio = NULL;
-	struct f2fs_dentry_block *dentry_blk = NULL;
+	void *dentry_blk = NULL;
 	struct f2fs_dentry_ptr d;
 	struct folio *folio = NULL;
 	int slots, err = 0;
@@ -727,9 +727,9 @@ int f2fs_add_regular_entry(struct inode *dir,
const struct f2fs_filename *fname,
 			return PTR_ERR(dentry_folio);

 		dentry_blk = folio_address(dentry_folio);
-		bit_pos = f2fs_room_for_filename(&dentry_blk->dentry_bitmap,
-						slots, NR_DENTRY_IN_BLOCK);
-		if (bit_pos < NR_DENTRY_IN_BLOCK)
+		make_dentry_ptr_block(dir, &d, dentry_blk);
+		bit_pos = f2fs_room_for_filename(d.bitmap, slots, d.max);
+		if (bit_pos < d.max)
 			goto add_dentry;

 		f2fs_folio_put(dentry_folio, true);
@@ -750,7 +750,6 @@ int f2fs_add_regular_entry(struct inode *dir,
const struct f2fs_filename *fname,
 		}
 	}

-	make_dentry_ptr_block(NULL, &d, dentry_blk);
 	f2fs_update_dentry(ino, mode, &d, &fname->disk_name, fname->hash,
 			   bit_pos);

@@ -887,7 +886,8 @@ void f2fs_drop_nlink(struct inode *dir, struct inode *inode)
 void f2fs_delete_entry(struct f2fs_dir_entry *dentry, struct folio *folio,
 					struct inode *dir, struct inode *inode)
 {
-	struct f2fs_dentry_block *dentry_blk;
+	void *dentry_blk;
+	struct f2fs_dentry_ptr d;
 	unsigned int bit_pos;
 	int slots = GET_DENTRY_SLOTS(le16_to_cpu(dentry->name_len));
 	pgoff_t index = folio->index;
@@ -905,18 +905,17 @@ void f2fs_delete_entry(struct f2fs_dir_entry
*dentry, struct folio *folio,
 	f2fs_folio_wait_writeback(folio, DATA, true, true);

 	dentry_blk = folio_address(folio);
-	bit_pos = dentry - dentry_blk->dentry;
+	make_dentry_ptr_block(dir, &d, dentry_blk);
+	bit_pos = dentry - d.dentry;
 	for (i = 0; i < slots; i++)
-		__clear_bit_le(bit_pos + i, &dentry_blk->dentry_bitmap);
+		__clear_bit_le(bit_pos + i, d.bitmap);

 	/* Let's check and deallocate this dentry page */
-	bit_pos = find_next_bit_le(&dentry_blk->dentry_bitmap,
-			NR_DENTRY_IN_BLOCK,
-			0);
+	bit_pos = find_next_bit_le(d.bitmap, d.max, 0);
 	folio_mark_dirty(folio);

-	if (bit_pos == NR_DENTRY_IN_BLOCK &&
-		!f2fs_truncate_hole(dir, index, index + 1)) {
+	if (bit_pos == d.max &&
+	    !f2fs_truncate_hole(dir, index, index + 1)) {
 		f2fs_clear_page_cache_dirty_tag(folio);
 		folio_clear_dirty_for_io(folio);
 		folio_clear_uptodate(folio);
@@ -938,7 +937,8 @@ bool f2fs_empty_dir(struct inode *dir)
 {
 	unsigned long bidx = 0;
 	unsigned int bit_pos;
-	struct f2fs_dentry_block *dentry_blk;
+	void *dentry_blk;
+	struct f2fs_dentry_ptr d;
 	unsigned long nblock = dir_blocks(dir);

 	if (f2fs_has_inline_dentry(dir))
@@ -959,17 +959,16 @@ bool f2fs_empty_dir(struct inode *dir)
 		}

 		dentry_blk = folio_address(dentry_folio);
+		make_dentry_ptr_block(dir, &d, dentry_blk);
 		if (bidx == 0)
 			bit_pos = 2;
 		else
 			bit_pos = 0;
-		bit_pos = find_next_bit_le(&dentry_blk->dentry_bitmap,
-						NR_DENTRY_IN_BLOCK,
-						bit_pos);
+		bit_pos = find_next_bit_le(d.bitmap, d.max, bit_pos);

 		f2fs_folio_put(dentry_folio, false);

-		if (bit_pos < NR_DENTRY_IN_BLOCK)
+		if (bit_pos < d.max)
 			return false;

 		bidx++;
@@ -1066,10 +1065,12 @@ static int f2fs_readdir(struct file *file,
struct dir_context *ctx)
 {
 	struct inode *inode = file_inode(file);
 	unsigned long npages = dir_blocks(inode);
-	struct f2fs_dentry_block *dentry_blk = NULL;
+	void *dentry_blk = NULL;
 	struct file_ra_state *ra = &file->f_ra;
 	loff_t start_pos = ctx->pos;
-	unsigned int n = ((unsigned long)ctx->pos / NR_DENTRY_IN_BLOCK);
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	unsigned int entries = sbi->dentries_per_block;
+	unsigned int n = (unsigned long)ctx->pos / entries;
 	struct f2fs_dentry_ptr d;
 	struct fscrypt_str fstr = FSTR_INIT(NULL, 0);
 	int err = 0;
@@ -1089,7 +1090,7 @@ static int f2fs_readdir(struct file *file,
struct dir_context *ctx)
 		goto out_free;
 	}

-	for (; n < npages; ctx->pos = n * NR_DENTRY_IN_BLOCK) {
+	for (; n < npages; ctx->pos = n * entries) {
 		struct folio *dentry_folio;
 		pgoff_t next_pgofs;

@@ -1122,7 +1123,7 @@ static int f2fs_readdir(struct file *file,
struct dir_context *ctx)
 		make_dentry_ptr_block(inode, &d, dentry_blk);

 		err = f2fs_fill_dentries(ctx, &d,
-				n * NR_DENTRY_IN_BLOCK, &fstr);
+				n * entries, &fstr);
 		f2fs_folio_put(dentry_folio, false);
 		if (err)
 			break;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 2a4ba7d4ec0e..d2e54573ed34 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -669,17 +669,6 @@ struct f2fs_dentry_ptr {
 	int nr_bitmap;
 };

-static inline void make_dentry_ptr_block(struct inode *inode,
-		struct f2fs_dentry_ptr *d, struct f2fs_dentry_block *t)
-{
-	d->inode = inode;
-	d->max = NR_DENTRY_IN_BLOCK;
-	d->nr_bitmap = SIZE_OF_DENTRY_BITMAP;
-	d->bitmap = t->dentry_bitmap;
-	d->dentry = t->dentry;
-	d->filename = t->filename;
-}
-
 static inline void make_dentry_ptr_inline(struct inode *inode,
 					struct f2fs_dentry_ptr *d, void *t)
 {
@@ -1866,6 +1855,9 @@ struct f2fs_sb_info {
 	unsigned int nat_entries_per_block;	/* NAT entries in a block */
 	unsigned int sit_entries_per_block;	/* SIT entries in a block */
 	unsigned int orphans_per_block;	/* orphan inodes in a block */
+	unsigned int dentries_per_block;	/* dentries in a block */
+	unsigned int dentry_bitmap_size;	/* dentry bitmap size in bytes */
+	unsigned int dentry_reserved_size;	/* dentry reserved bytes */
 	unsigned int root_ino_num;		/* root inode number*/
 	unsigned int node_ino_num;		/* node inode number*/
 	unsigned int meta_ino_num;		/* meta inode number*/
@@ -2268,6 +2260,23 @@ f2fs_orphan_footer(void *orphan_block, struct
f2fs_sb_info *sbi)
 		 sizeof(struct f2fs_orphan_footer));
 }

+static inline void make_dentry_ptr_block(struct inode *inode,
+				struct f2fs_dentry_ptr *d, void *t)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	unsigned int entries = sbi->dentries_per_block;
+	unsigned int bitmap_size = sbi->dentry_bitmap_size;
+	unsigned int reserved_size = sbi->dentry_reserved_size;
+
+	d->inode = inode;
+	d->max = entries;
+	d->nr_bitmap = bitmap_size;
+	d->bitmap = t;
+	d->dentry = t + bitmap_size + reserved_size;
+	d->filename = t + bitmap_size + reserved_size +
+					SIZE_OF_DIR_ENTRY * entries;
+}
+
 static inline struct f2fs_super_block *F2FS_RAW_SUPER(struct f2fs_sb_info *sbi)
 {
 	return (struct f2fs_super_block *)(sbi->raw_super);
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index aec06fb4fd76..718dd785865a 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -415,7 +415,7 @@ static int f2fs_move_inline_dirents(struct inode
*dir, struct folio *ifolio,
 {
 	struct folio *folio;
 	struct dnode_of_data dn;
-	struct f2fs_dentry_block *dentry_blk;
+	void *dentry_blk;
 	struct f2fs_dentry_ptr src, dst;
 	int err;

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index f9811d571ae5..8d2224e585d3 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4388,6 +4388,12 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 		sizeof(struct f2fs_sit_entry);
 	sbi->orphans_per_block = (sbi->blocksize -
 		sizeof(struct f2fs_orphan_footer)) / sizeof(__le32);
+	sbi->dentries_per_block = (BITS_PER_BYTE * sbi->blocksize) /
+		((SIZE_OF_DIR_ENTRY + F2FS_SLOT_LEN) * BITS_PER_BYTE + 1);
+	sbi->dentry_bitmap_size = DIV_ROUND_UP(sbi->dentries_per_block,
+		BITS_PER_BYTE);
+	sbi->dentry_reserved_size = sbi->blocksize - sbi->dentry_bitmap_size -
+		(SIZE_OF_DIR_ENTRY + F2FS_SLOT_LEN) * sbi->dentries_per_block;
 	sbi->log_blocks_per_seg = le32_to_cpu(raw_super->log_blocks_per_seg);
 	sbi->blocks_per_seg = BIT(sbi->log_blocks_per_seg);
 	sbi->segs_per_sec = le32_to_cpu(raw_super->segs_per_sec);
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index 7d2cbceb42d5..d1059a27e1b9 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -601,15 +601,7 @@ typedef __le32	f2fs_hash_t;
  * dentry, when converting inline dentry we should handle this carefully.
  */

-/* the number of dentry in a block */
-#define NR_DENTRY_IN_BLOCK	((BITS_PER_BYTE * F2FS_BLKSIZE) / \
-					((SIZE_OF_DIR_ENTRY + F2FS_SLOT_LEN) * BITS_PER_BYTE + 1))
 #define SIZE_OF_DIR_ENTRY	11	/* by byte */
-#define SIZE_OF_DENTRY_BITMAP	((NR_DENTRY_IN_BLOCK + BITS_PER_BYTE - 1) / \
-					BITS_PER_BYTE)
-#define SIZE_OF_RESERVED	(F2FS_BLKSIZE - ((SIZE_OF_DIR_ENTRY + \
-				F2FS_SLOT_LEN) * \
-				NR_DENTRY_IN_BLOCK + SIZE_OF_DENTRY_BITMAP))
 #define MIN_INLINE_DENTRY_SIZE		40	/* just include '.' and '..' entries */

 /* One directory entry slot representing F2FS_SLOT_LEN-sized file name */
@@ -620,14 +612,21 @@ struct f2fs_dir_entry {
 	__u8 file_type;		/* file type */
 } __packed;

-/* Block-sized directory entry block */
-struct f2fs_dentry_block {
-	/* validity bitmap for directory entries in each block */
-	__u8 dentry_bitmap[SIZE_OF_DENTRY_BITMAP];
-	__u8 reserved[SIZE_OF_RESERVED];
-	struct f2fs_dir_entry dentry[NR_DENTRY_IN_BLOCK];
-	__u8 filename[NR_DENTRY_IN_BLOCK][F2FS_SLOT_LEN];
-} __packed;
+/*
+ * A dentry block is laid out as follows, where the number of entries and all
+ * offsets are determined by the filesystem block size at runtime:
+ *
+ * 0                                                         blocksize
+ * +--------+----------+-------------------+-----------------------+
+ * | bitmap | reserved | dir_entry[entries]| filename[entries][8] |
+ * +--------+----------+-------------------+-----------------------+
+ *
+ * entries = (BITS_PER_BYTE * blocksize) /
+ *           ((SIZE_OF_DIR_ENTRY + F2FS_SLOT_LEN) * BITS_PER_BYTE + 1)
+ * bitmap_size = DIV_ROUND_UP(entries, BITS_PER_BYTE)
+ * reserved_size = blocksize - bitmap_size -
+ *                 (SIZE_OF_DIR_ENTRY + F2FS_SLOT_LEN) * entries
+ */

 #define	F2FS_DEF_PROJID		0	/* default project ID */

-- 
2.53.0
