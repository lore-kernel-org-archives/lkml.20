Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D403D4126
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 17:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788025776; cv=pass; b=iGC9CjfemhF7pNF7nPaPVXRko6zzEzN3hQ63F3IGQVz1Q2Nh/XVHYySlTcy5FpXlQmEEqZCrCFtKuIHQnmoc245dqqVw4MTcPLvbFFg0UdzvLbrdDeThbpd37x5arVQBqY20OPtb7rASVIxSvq8ejVq/UMPCmteNwJkAHyU60/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788025776; c=relaxed/simple;
	bh=0Q4wVWoo7EhIYdl8SEQLFsc8DKih+Hi31+/V6pXQZ8k=;
	h=From:MIME-Version:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ER/Sr6PVLwp/7HEpRcQbSo4IsUoNBovKOU5kpxwddsXt/q9cTQo+QcWJjhmhQ+zn796isSJ8C2h1h+MRn8HmJbiUC3G9Jj24arW8Ddw1uAjYV6S/iZys0MwVieUt2uzl5ItkM0bK/qfRsHoJVd45OUM6EyZcsR26kz0OdHZ1E5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RF+ZSB6q; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RF+ZSB6q"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-69f7fa1c548so3166187a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 10:49:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788025772; cv=none;
        d=google.com; s=arc-20260327;
        b=BVDrE16ztGgxjp2gPNRHqPO1/yxsjiumNMERewt1O1XuhLwY/eSJhbcqoRCOVD7Uk8
         41OeVdvAOQFDr2BZZivq2HcvIX5CN7SkfqtLCR5lNOmbva/NT/2qQSi9aOzcgGOK7U8i
         8iE1CMotiVJxjq8qrWoRcIxuWdLkpBB1yo/0nJn1r7WvZkiiD7fSbmeUQV0X3mAW/W59
         qalIun6JpFL1gSqPGIehVoLuGtnrt5IptTgP5GA7cehlsMBReupeWBHuoKc7AyNb4MwR
         gsG8tHnyqO07CyGQ1PnWul1YT4ZaZcTph+Q+mwWOfagwF+W+S/KJD5ujewlYUtGFE62b
         1Dkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:mime-version
         :from:dkim-signature;
        bh=6qh137sc6MODJbe94/9wgwmLzddV43Q13bq9gTfmVqQ=;
        fh=S4czn4XuMANLKraRLMZX0rEHTLw9Huvi2AdurRRVPuw=;
        b=ASp8G4alxG3wzX+VjQb+g+6SUVirhSgg1O/3z65QzRMFsgG5BjrBHJvu1cGds+rl43
         SrvKlskh1Xbv7UoP7NmpFo0JZsivzSTjOeTH+Sq7bDFl2UaArVNb+QBARfrRvHHMRvCA
         TwbYck+00D6dN2JcazhgOIgw8ck7xF8hhAtMrjng/Yo17KzCn6BLhoG8vJ3s8uH2fXsY
         uzNl4HsGNW2qyLY0QoIKuYr3iQp8S1wapd2iT98Boz3TGmszXBFs1fLu37v2q7gH1qaY
         PEDG7vDNGX1NhsSPP9mBw7tspzPVVS2jisyiC9roaZzvZBpgSjVMZzOuWX1yQuhwakJa
         FcCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788025772; x=1788630572; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6qh137sc6MODJbe94/9wgwmLzddV43Q13bq9gTfmVqQ=;
        b=RF+ZSB6qU0XNFighxFGlHhRjQsbx5X3UokL/UAN5NyV24XL77sURADJv4Pl/xmrx1g
         L+79ZhcBYG8/G9lRHwTr+9Q3pvTPZ83ugrPUTRUzKtbKu2qJqjKwXd82zLvc0ZnKFS6c
         aCgiZrv9anfE7wa3ZtRyRXY/hnS+P0V5y7wBWIDU/886Nw/6nhjCRykVftzqw+t6hwau
         XVb5EM8uql5all8HVhVxvVWkvKtjvPLA2VAB4EU+BBpUqfGMpexKADI1cMrcUflI4nUB
         CVwbookgflm+7+VNDlK1bVQ0P9M+2o2anOZbuBRJCQKVvqsrVqlW4bkye3q5zfJIknOX
         yOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788025772; x=1788630572;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6qh137sc6MODJbe94/9wgwmLzddV43Q13bq9gTfmVqQ=;
        b=F4CtWVuZgdWS57yHlxF7sS1/395jUNuQ0LlNs8vkFfNkI5qYGXz2ib6RCr6Yc1Tr9V
         VY0CU/ts8KHswj+E7cZ9vQTsZ9QvrhhiYdr9KaiMJJtPTK9/797nhTcDfMIRkuyJa4Zc
         7xdK5NCdbAEqYcanqqmXepSuaHgeu/INZ23GSpbHJSHIGjGZ3gMcqqOSegzwhT9s76/m
         GIDCdMKa+0J6T5Z6NtBjtJN6i5XwKoiXIIpN3pwRkQDhDYI/w6+Cf7kLXrQLyhuCBO8N
         kePHPgX0DPTXdGi9JI2siT0shwZwNhHHhYIrc43MdnEBAC7S+4vhy0KWaAMdetVnnWIY
         D2fw==
X-Forwarded-Encrypted: i=1; AKwUvBxM+eIkpuxALDOPoBhJpHq1736IP6qedvepiOirg2vxBP9hqxSwlb+i5fSHeJelx0puQr0fZN/KhOGjDi0=@vger.kernel.org
X-Gm-Message-State: AFuF++nNOldjJtIQu5tAi6IHAcQFHtsL73cv/nFHjoOcIMo2Aoi8LMjy
	ZX2bpZ2h1m2RbKGPUAF8XAHNJtQiZ5bUjPh2oeP7B42OVpNwQAYV2xr/ANbofgtwLz76cTMluBn
	CdBVvSKxcW4StU1WMhY2jGvWlhQYRbA8=
X-Gm-Gg: AYBFou349I+lLq0WjHAmTeWXCtIIka8LpB81wkKt3j1blaKKZ05F/16tO05FAXapCFZ
	d5ysRCC1RcC1/zrIq6bfdWySZ6gJ2IYJ/NB1i3CS2HqNYij0RtTkBgxMjj3LBtQm8zQC28lcQ82
	KpIdxAHSh6HJ4dLpTcx01V23vWTqoOW9ECPvi1D2Su3P85+Y3MGPRC7qFnl0/oWLmRMic66ujzU
	Q+QkPikBHMVZu8/6wqn+dsdChEeron+f5ID4xllR4hdEkg8RAHjXdvXlms2/EcA3Vp6JAdG1a1/
	Yaj2S7UD+mkwff05QCkP1xjMf2SAviy62XK68engPr/J70g1ft2zArkWGBM54XW/ZsOAU5GXJwT
	BDg==
X-Received: by 2002:a05:6402:2554:b0:6a6:32fa:54f4 with SMTP id
 4fb4d7f45d1cf-6a632fa554cmr2028392a12.19.1788025772086; Sat, 29 Aug 2026
 10:49:32 -0700 (PDT)
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 29 Aug 2026 10:49:30 -0700
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 29 Aug 2026 10:49:30 -0700
From: Xinping Zhang <zhangxp1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAH=xXfHWW_J92z3YgvoLSx8+z6rekq=p2kiP15KE9=2+Ju2RjQ@mail.gmail.com>
References: <CAH=xXfHWW_J92z3YgvoLSx8+z6rekq=p2kiP15KE9=2+Ju2RjQ@mail.gmail.com>
Date: Sat, 29 Aug 2026 10:49:30 -0700
X-Gm-Features: AcwNN1VW_MetAHACsZfV-8rCKbv8ZescbRcnF6K0q7hSzg4ovlsBmGXOfUkwGHk
Message-ID: <CAH=xXfFbZY9CjbEqeszrvuhFh06gZ5ev5RZEvrYprRM6iopfzg@mail.gmail.com>
Subject: [PATCH v2 05/11] f2fs: describe dentry block layout dynamically
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
index d4b4d6b7ad42..23ca80fc4997 100644
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
