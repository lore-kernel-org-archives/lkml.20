Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857FF48987C
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787780397; cv=pass; b=bUQWwxTlLTjIRS2SPd3uJVCZhX2URyhpdgu6JzMI706gq6r38S54ywtwa7Dh0pSTilTNZ7WiSvsSPzYENhHw10uEQ3Iq4A1/6vU5uRiO0KzlSjy5EZHbkWFHcCwYQZzjuQjX+br6Y2uyRPMSfJSNP+GPLJCxEehjL7CiHUObsSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787780397; c=relaxed/simple;
	bh=VUo3QPoi2BGr4DMDng71zn2kUh4mhgbxnFqsGb8ly6k=;
	h=From:MIME-Version:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UKTnKTZ3uhVUcxw7ZH1tEIQIZa2wFu7PmYVGO/Pa3KTi8obqhqKs+SHsNxVex+5LwxkTGj54TTr1BDg1KUfSnNbwR9nFHfnhy+9XsM9MWWLkFMUjWUQUG0xq7Qr34tb0Cs+xbkFIuqTGaBoF1p/MaXGgUKYX0MMx9A5/52AOzIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NIVjQvc8; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NIVjQvc8"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a17211b9ecso3485122a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:39:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787780390; cv=none;
        d=google.com; s=arc-20260327;
        b=bQRtgl1tomcE4kuxVeCJlZxHplA6/GVxBpZWief1HBvgTZqAPK9bNxvxGPf9Tk+NEH
         wdoCo8dEbbeBlf5v4kT9/hLxZWihBisy/J85Eo3MYWwwUD767d4pTcgNR5qfTooHrRHi
         y8DGlcc7CCFXyNIpVTYZti2JP6yuybiMQxnftrJf5XOnvtuBAdSEVuTgnCX626yGPhT4
         aW05nuO7s5HHGBXCP7YeS+bCwUX+Adz/W9azZbzNDFCvwtWMqQi/ZB4Ni1/TktG9dLMY
         iRNmnDhVmFrhVumLMLgrsy/L0fMQ+KnW/vViPnbYmQHPfWPv1/ZauuYcT8qLtNnxutkD
         y/hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:mime-version
         :from:dkim-signature;
        bh=N0Ysmq4yr2zIiKUTJ1RbVuURkuCynPkrReTeG+GnH4Q=;
        fh=eica1wZFXwHjih8iCsaSnPUqt9JUeFaNNsic00JExF8=;
        b=VYjz9rDSYngtjtQQMkNF/E3365O3fw5HDs5EODJA2GPA0uiPws9Kp3zjFPX0s9F1P6
         TOmEvGBURTC0m3sNJHTJDFFbY1VYPfCGINFaZpqlnfFDE6s7hHXSDe+fl6CsRfNc+3XB
         AOgqgJ2oTS+Amnsa4BbZ0p2KtZlSFTPWmquiKLayc8iWDy59fFb0zXZZdHdC5Q42oC/w
         R0HHOvzsHhXUd4FskEVSOIwgYudUBzFUli6e4aa7P/vZdwKfELLQ9ECh7E+GZYyScojO
         KcE1DSRhKrqG784J5yOiI5RpkC6gCkWHBPVQgQNSSWQiXl+3G2c9+B0U0IJXAptaKZre
         OKIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787780390; x=1788385190; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N0Ysmq4yr2zIiKUTJ1RbVuURkuCynPkrReTeG+GnH4Q=;
        b=NIVjQvc8mWUiXPRPxwDcgg612GVOsSsz8pcKRaJuX/He/KpVWIkRZKVJbdqvKnriQ5
         HU7M0wxRqlKYp3hbFM/TzqODHmxHQyQOoa7MwnzBUgr9MgvFj+jmvk9XVrqiuADSz1jV
         T8L3veOFS0d86hXuEuVIW7PoFVpwvAmt08CIbf9YVhyCT0YSoSdivPIe2Ptc8KNNSs8g
         g1hGzMXeAmDcEh0x2qRk1XduyB7PFTUwEA0U2+ZukcKJ5ft/pwqSkWRsyLvf8bqzhnaZ
         4CZ/fcl4BdmHWEuMy+va7aTA90QP5W9IHyohqN4/dkvxIv44wyMpYOOrXY5x7rCm5qtj
         xVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787780390; x=1788385190;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N0Ysmq4yr2zIiKUTJ1RbVuURkuCynPkrReTeG+GnH4Q=;
        b=qqrlh15eZXwvtuT07ZumcKpkskMgoIOmHMTycAblL85yZEoCC1yt0N1YOV8bzUeaDu
         SL7msnfJj0IzADUU0fuiiEu98JD3yoBVMghAXFrbma51PsIJ9tmIvu/UMJjd4iS/fA/4
         M4r2CS8jHg8UfUqN6aoWphXijg7EsLAPTCi+emml/lCA0G1uhac56B6O+K3VhYwbjrhb
         EMeTLbjGJr1Rvqiq5PyszRxEKNOx98+nutqWkZw8qWPXIw+40oZy3Lpm/EAG2iA+gLr8
         QBG9MrR3XlwqYsBIR6rBwm2uoW8p4CA8LTid/7T9d2ybE3D47UU29p9lDoEPq0UCI4v/
         FoDA==
X-Forwarded-Encrypted: i=1; AHgh+RoDYZZUrd1SDQ4RmHdnbrPoMavjvMu3q5xsKQU2fGIRRVNytQ6mJ2SHKw66YCMv1CUdOYzcKfz0qmPUbH8=@vger.kernel.org
X-Gm-Message-State: AFuF++nF0ghTh5O+rRaqzpuBEe8YdB/CRVBYB+DSznFVpLjdK/O+9bqP
	umYF8iWfO05Z/Cs4jsW+ywWNpFGzzvPx84A2qEkCYKRJdMbrbQCADznEGeCMhkGEWSAnDQPYxKq
	Ppn1ca/7dmsOxitV0ev7Pi0p+w02o4h4=
X-Gm-Gg: AR+sD12Sho/xaNcudtImV3IW7zuKU/jfHm7UdU5wA0ghWBk6+kDzRBVN5KQf9P3ScD/
	/V94uhZLzsd/vll6c27f0VJX8Jr9F9x94nnh64tVeZlJJQOk47EQJEuEjMPW0S8c2gik2crev56
	mYQX1yOcT3aXF7MFOK3US+xcdcXuuwwV+oJZ/LhEyZMvdg037E12jLyZaBKTc9vO3uhd3/5sH5s
	3r6J8HftplEOMx1boyZ2cgT3HMqzHwyni2yXjBSMVnN8Ib+7JEZ47SuOJSAIxxkOMWIGQ+Mww6f
	ZfD9aa3iqWSziFjW1NBFTLgF+A+nc1tVG6F7cV/fEn4vbzVLcTfqZ6we32m7788dGJkzn2JN4cV
	P
X-Received: by 2002:a05:6402:3548:b0:6a0:927e:39e2 with SMTP id
 4fb4d7f45d1cf-6a5df5ce41cmr11749992a12.5.1787780390417; Wed, 26 Aug 2026
 14:39:50 -0700 (PDT)
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Aug 2026 16:39:50 -0500
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Aug 2026 16:39:50 -0500
From: Xinping Zhang <zhangxp1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAH=xXfFVAwQ3r_NdUDtmXhtg6Lw8kDWoNTzGL5oy4mwHMsJLJw@mail.gmail.com>
References: <CAH=xXfFVAwQ3r_NdUDtmXhtg6Lw8kDWoNTzGL5oy4mwHMsJLJw@mail.gmail.com>
Date: Wed, 26 Aug 2026 16:39:50 -0500
X-Gm-Features: AcwNN1W4yUHj4WUCahU17IRauz1lZ0unZYR40qWPD2vMGb0Yk7WErJxZG95yvYY
Message-ID: <CAH=xXfFphNHjE_xCezs+fSkFa+nK_5BXXVQ2kZAiGJGM43342A@mail.gmail.com>
Subject: [PATCH 4/5] f2fs: describe dentry block layout dynamically
To: linux-f2fs-devel@lists.sourceforge.net
Cc: jaegeuk@kernel.org, chao@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

An on-disk dentry block contains a bitmap, reserved padding, a
variable-length dir-entry array, and matching filename slots. A fixed C
structure ties their offsets to the compile-time block size and requires
error-prone reserved-size definitions.

Remove the whole-block structure and its compile-time layout macros.
Compute the offsets from the block size and expose the regions through the
existing zero-copy dentry pointer. Pass the owning directory inode at every
block-view initialization to keep the helper contract consistent.

No functional change is intended; this commit continues to use the fixed
F2FS block size.

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
index d1235ba80331..026419aed2e9 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -668,17 +668,6 @@ struct f2fs_dentry_ptr {
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
@@ -1864,6 +1853,9 @@ struct f2fs_sb_info {
 	unsigned int blocksize;			/* block size */
 	unsigned int sit_entries_per_block;	/* SIT entries in a block */
 	unsigned int orphans_per_block;	/* orphan inodes in a block */
+	unsigned int dentries_per_block;	/* dentries in a block */
+	unsigned int dentry_bitmap_size;	/* dentry bitmap size in bytes */
+	unsigned int dentry_reserved_size;	/* dentry reserved bytes */
 	unsigned int root_ino_num;		/* root inode number*/
 	unsigned int node_ino_num;		/* node inode number*/
 	unsigned int meta_ino_num;		/* meta inode number*/
@@ -2264,6 +2256,23 @@ f2fs_orphan_footer(void *orphan_block, struct
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
index f324e9cf4264..133c279b9931 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4352,6 +4352,12 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
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
index a5111556d923..b4bb4e2f99b3 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -602,15 +602,7 @@ typedef __le32	f2fs_hash_t;
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
@@ -621,14 +613,21 @@ struct f2fs_dir_entry {
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
