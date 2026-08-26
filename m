Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D141948986D
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787780396; cv=pass; b=PRMVsD7RX0dKZnpr+H6dGNk+wQvgoAC4Fvvdtu+lMM75Wxnj2c/hkU8IVhUgv8eQt21d6Dvao8hggQQFOWqdKbnQkuSP/9EGJXxNhP/XAxsFMkBWA8NwawUGSXr3n8pFua+b14W6hKTLdhNXyDc75jmGpv9EkWUiNuDExhApEaY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787780396; c=relaxed/simple;
	bh=CbpoPeQNsfLN3YdS4+fhyIWaGBfo5ktqkdsxM1heW8A=;
	h=From:MIME-Version:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ivkpp+3tRu+wCtYZDyzkuj6DmjaaGKawCZnCoXsLAdEd/8K4GPi51VYroI3ZcDijcbynlCmEgtV6090Z3sCsMCIYpfKiYmH76f3+TYOcIV15mlH+LJcMnEnXrG22nSYcWy1Z/dJt6dDJGmGvGcHG9ZMeYwZu1NJzUbg8yD6lQkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s4gscYPf; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s4gscYPf"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a28cbdso2680630a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:39:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787780390; cv=none;
        d=google.com; s=arc-20260327;
        b=Edxuq8b0Ujy/6GmxkUzzqT+AmlNELnt1W7dFab0t5BxcxvukuE0BzzXQ0EQhbUDE9W
         I6ze6HxBMzF8qlF3jDEzvVBTsfeL10cnx8Pu9DO6wr+XBXVZuTcCneTmbXATSkOyhEm5
         1AyfxIXO7JbW2XjOqOvHOwOnu3+PY3WccbDhA4yt4lKzIYa2FH/2Pvren7UBlBAkT0aH
         BMm3SQkDn0oZnCDt2rNL3docKXowahplHqPd8XIo/64SFsEwFFpgz0Sxtl/0br8/sKLt
         uNSAKx7R/xg3a9eL5Tx37nBB7HpHNYb026tR+X9dlAp5XpqgLjusVXFJ8W7yS+77LC4r
         W2WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:mime-version
         :from:dkim-signature;
        bh=LlsNfxWemhMviWnYnZ0KStlrqTocK5pZLQjuVsmOIfA=;
        fh=f4Wq6DAD03B3AikZBQ0yjR1w/9eImPHj5D49DMdvBq8=;
        b=sSZlasEM/sqkJG+PIJgLcnGabg3ffwSY+CTjAksh0DI5N8uoM+KveqCBGYPFgt6S1q
         sMEYg9xwtvh+TVvo9xT3roPXL/5ho9Oj60/rKAXY/3qRos9S/CBrRYcHK52qBR86Ed+t
         CnqzJjsejBQOYOCaxsCiPwogXgPY78gUdqj7TUGjBBpPj4IL/QQusQE95DaI6Feov8o1
         zawAUqQJBoEAaukrLQ7qfwqLhF6JNTepZe4J+wkXDlAQnv8jfjCGbs6M1lhtyaIzVtFz
         kvTySrawkY9gn7+3oGOCisYVaipJHzRkgmxWuFyqCN+qFYnAr1NAapORevjK5J105KL6
         KX3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787780390; x=1788385190; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LlsNfxWemhMviWnYnZ0KStlrqTocK5pZLQjuVsmOIfA=;
        b=s4gscYPfIm8SFr88dDGOsnCQgXp8HbtkywjZIcux2VPG1ePmEmakMis4gC93n9gyYM
         YRrZR0xioOaWnriOk7o+ocEViDLuZelIoMwMrjYsZrfS2n7zeOi+b4CyOg/2fnuTSJcp
         gWcfmAcvfAlIISNUZGOLvgsqwm/xT4ZYz3EIXA62MYSA2VVglM6yhgr8e8xOcqFoupQf
         aKBETU2omaAhck2Rr4ychnuEAZcE0sbH8Z2TtS3d/rxuHxFqGxIJ6MCMO29osmIFuJU7
         ERIYrxJax4blvNSfSOk5IbrTd3uv6OquKgkEWeSG+VR+dn495Qd3OeUdQ0JMvK9buKbI
         5Tqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787780390; x=1788385190;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LlsNfxWemhMviWnYnZ0KStlrqTocK5pZLQjuVsmOIfA=;
        b=c6VJvFvjdJjh3rmtLiWlFo3b+xzIC6xYEjQgc17RBzkujETcQHWyxvH1Xp2WEVXeYM
         lfWoFBZmqBfspv8DCkvpR+sQiOBMLCcuY9d3hTEL2Fux9kmsLN62YzTVZpKmeBxkpjkN
         atobJCfC4lERN9+ptgNQJ3a6gIYEkmwti0xcODUwY84unWE3jMhs1KjuunizXD1PjK35
         8VJq+9Hptn7nijudCHZK9IXOP79eP4PtnSOw1EnjhS4iUjLSRoBQ6kqwhZiKOHOD2g02
         Z012vRDihdyBGm/D0HuBiNoLy8qS3UfRE0Qo/ZG0cug1ObrkXAlN1eM24mtyGzpkqN5h
         6RAg==
X-Forwarded-Encrypted: i=1; AHgh+Rq4RkH4r4469OYoSoK6Uy1EEw3qQZ2+NB28fZdOFxU+PkXbtVfpRq+YwUrDlgFcqX940GnXDCAA6BjqKz8=@vger.kernel.org
X-Gm-Message-State: AFuF++mOhRNNbLV45t3+bDqEYEyrD10rxUVMm80H7QiwB9YgNJx8ViAC
	mA7bGAyjxTsdobqWcMGyG5hqLXGAseNV85j1UmvGLkw7OQGGK9Qwjg4gMap8fu13h6rJ9HLfLHG
	z7JuGAEfKRhp4kHVYzgzc5usaBZOpESo=
X-Gm-Gg: AR+sD13acjSbDfE6ujUGZuK/jUok0qWv9aXcrv1OjqNbW2uQ/12k86kLETEVVO6MHfl
	rn2LF7306eiJhyhFyaQS566PrH+5qXgzvHM5RbNknUL5eW/a7Iitklr519TUMmwqKA7ooKDHi9j
	6ApPELNAAGT6pX4N5h6Rx8HfJKCwCYcV4ltFKU3BoKLC7O9FdPy8eIJ9OAv1kzO7edeeWzcEwpo
	HfrARwrXFGCH/o1PVaLEIfs22mpiuCp5iQsCve+BinXft8Q6ZcS3Yzs5/8OJZQDzebu/CZK4jo4
	tmDVh2Eim1UcnKQ+ws36U+Y8qaC5Li7TLApjik69yelyNB6yn7u2VMiNI0jl+n7NaHTtUavbl3W
	R
X-Received: by 2002:a05:6402:24d2:b0:6a5:f4e6:ec14 with SMTP id
 4fb4d7f45d1cf-6a5f4e6edf0mr2052653a12.4.1787780388907; Wed, 26 Aug 2026
 14:39:48 -0700 (PDT)
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Aug 2026 16:39:47 -0500
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Aug 2026 16:39:47 -0500
From: Xinping Zhang <zhangxp1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAH=xXfFVAwQ3r_NdUDtmXhtg6Lw8kDWoNTzGL5oy4mwHMsJLJw@mail.gmail.com>
References: <CAH=xXfFVAwQ3r_NdUDtmXhtg6Lw8kDWoNTzGL5oy4mwHMsJLJw@mail.gmail.com>
Date: Wed, 26 Aug 2026 16:39:47 -0500
X-Gm-Features: AcwNN1XBh0dMCwkSFjy6ji5U2z__GZwMCCh_YD8MPyP62QjLX52Ik_B5vqVb1AU
Message-ID: <CAH=xXfEUmup0TNrZPG9HdhjvOCXcV1EX5sJ3CpooaFsBxh7gMA@mail.gmail.com>
Subject: [PATCH 3/5] f2fs: describe orphan block layout dynamically
To: linux-f2fs-devel@lists.sourceforge.net
Cc: jaegeuk@kernel.org, chao@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

An on-disk orphan block consists of a variable-length array of inode
numbers followed by a fixed footer. The compile time definition of
orphan block struct cannot describe a runtime block length layout.

Remove the whole-block structure, document the exact layout, and add
helpers that derive the inode capacity and footer address from a supplied
block size. Access the inode array and footer separately.

The caller still supplies the existing fixed F2FS block size, so valid
filesystems retain the same on-disk format and behavior. This is a
layout-only refactoring to accommodate a runtime block length.

Signed-off-by: Kelvin Zhang <zhangxp1998@gmail.com>
---
 fs/f2fs/checkpoint.c    | 44 ++++++++++++++++++++++-------------------
 fs/f2fs/f2fs.h          | 12 +++++++++++
 fs/f2fs/super.c         |  2 ++
 include/linux/f2fs_fs.h | 18 ++++++++++-------
 4 files changed, 49 insertions(+), 27 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 47c4a5c83a70..51ef4f421937 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1041,7 +1041,8 @@ int f2fs_recover_orphan_inodes(struct f2fs_sb_info *sbi)

 	for (i = 0; i < orphan_blocks; i++) {
 		struct folio *folio;
-		struct f2fs_orphan_block *orphan_blk;
+		__le32 *orphan_inos;
+		struct f2fs_orphan_footer *footer;
 		unsigned int entry_count;

 		folio = f2fs_get_meta_folio(sbi, start_blk + i);
@@ -1050,9 +1051,10 @@ int f2fs_recover_orphan_inodes(struct f2fs_sb_info *sbi)
 			goto out;
 		}

-		orphan_blk = folio_address(folio);
-		entry_count = le32_to_cpu(orphan_blk->entry_count);
-		if (entry_count > F2FS_ORPHANS_PER_BLOCK) {
+		orphan_inos = folio_address(folio);
+		footer = f2fs_orphan_footer(orphan_inos, sbi);
+		entry_count = le32_to_cpu(footer->entry_count);
+		if (entry_count > F2FS_ORPHANS_PER_BLOCK(sbi)) {
 			f2fs_err(sbi, "invalid orphan inode entry count %u",
 				 entry_count);
 			set_sbi_flag(sbi, SBI_NEED_FSCK);
@@ -1063,7 +1065,7 @@ int f2fs_recover_orphan_inodes(struct f2fs_sb_info *sbi)
 		}

 		for (j = 0; j < entry_count; j++) {
-			nid_t ino = le32_to_cpu(orphan_blk->ino[j]);
+			nid_t ino = le32_to_cpu(orphan_inos[j]);

 			err = recover_orphan_inode(sbi, ino);
 			if (err) {
@@ -1084,7 +1086,8 @@ int f2fs_recover_orphan_inodes(struct f2fs_sb_info *sbi)
 static void write_orphan_inodes(struct f2fs_sb_info *sbi, block_t start_blk)
 {
 	struct list_head *head;
-	struct f2fs_orphan_block *orphan_blk = NULL;
+	__le32 *orphan_inos = NULL;
+	struct f2fs_orphan_footer *footer = NULL;
 	unsigned int nentries = 0;
 	unsigned short index = 1;
 	unsigned short orphan_blocks;
@@ -1092,7 +1095,7 @@ static void write_orphan_inodes(struct
f2fs_sb_info *sbi, block_t start_blk)
 	struct ino_entry *orphan = NULL;
 	struct inode_management *im = &sbi->im[ORPHAN_INO];

-	orphan_blocks = GET_ORPHAN_BLOCKS(im->ino_num);
+	orphan_blocks = GET_ORPHAN_BLOCKS(sbi, im->ino_num);

 	/*
 	 * we don't need to do spin_lock(&im->ino_lock) here, since all the
@@ -1105,21 +1108,22 @@ static void write_orphan_inodes(struct
f2fs_sb_info *sbi, block_t start_blk)
 	list_for_each_entry(orphan, head, list) {
 		if (!folio) {
 			folio = f2fs_grab_meta_folio(sbi, start_blk++);
-			orphan_blk = folio_address(folio);
-			memset(orphan_blk, 0, sizeof(*orphan_blk));
+			orphan_inos = folio_address(folio);
+			footer = f2fs_orphan_footer(orphan_inos, sbi);
+			memset(orphan_inos, 0, sbi->blocksize);
 		}

-		orphan_blk->ino[nentries++] = cpu_to_le32(orphan->ino);
+		orphan_inos[nentries++] = cpu_to_le32(orphan->ino);

-		if (nentries == F2FS_ORPHANS_PER_BLOCK) {
+		if (nentries == F2FS_ORPHANS_PER_BLOCK(sbi)) {
 			/*
-			 * an orphan block is full of 1020 entries,
+			 * an orphan block is full,
 			 * then we need to flush current orphan blocks
 			 * and bring another one in memory
 			 */
-			orphan_blk->blk_addr = cpu_to_le16(index);
-			orphan_blk->blk_count = cpu_to_le16(orphan_blocks);
-			orphan_blk->entry_count = cpu_to_le32(nentries);
+			footer->blk_addr = cpu_to_le16(index);
+			footer->blk_count = cpu_to_le16(orphan_blocks);
+			footer->entry_count = cpu_to_le32(nentries);
 			folio_mark_dirty(folio);
 			f2fs_folio_put(folio, true);
 			index++;
@@ -1129,9 +1133,9 @@ static void write_orphan_inodes(struct
f2fs_sb_info *sbi, block_t start_blk)
 	}

 	if (folio) {
-		orphan_blk->blk_addr = cpu_to_le16(index);
-		orphan_blk->blk_count = cpu_to_le16(orphan_blocks);
-		orphan_blk->entry_count = cpu_to_le32(nentries);
+		footer->blk_addr = cpu_to_le16(index);
+		footer->blk_count = cpu_to_le16(orphan_blocks);
+		footer->entry_count = cpu_to_le32(nentries);
 		folio_mark_dirty(folio);
 		f2fs_folio_put(folio, true);
 	}
@@ -1824,7 +1828,7 @@ static int do_checkpoint(struct f2fs_sb_info
*sbi, struct cp_control *cpc)
 		__clear_ckpt_flags(ckpt, CP_COMPACT_SUM_FLAG);
 	spin_unlock_irqrestore(&sbi->cp_lock, flags);

-	orphan_blocks = GET_ORPHAN_BLOCKS(orphan_num);
+	orphan_blocks = GET_ORPHAN_BLOCKS(sbi, orphan_num);
 	ckpt->cp_pack_start_sum = cpu_to_le32(1 + cp_payload_blks +
 			orphan_blocks);

@@ -2080,7 +2084,7 @@ void f2fs_init_ino_entry_info(struct f2fs_sb_info *sbi)

 	sbi->max_orphans = (BLKS_PER_SEG(sbi) - F2FS_CP_PACKS -
 			NR_CURSEG_PERSIST_TYPE - __cp_payload(sbi)) *
-			F2FS_ORPHANS_PER_BLOCK;
+			F2FS_ORPHANS_PER_BLOCK(sbi);
 }

 int __init f2fs_create_checkpoint_caches(void)
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 4423f899b2b5..d1235ba80331 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1863,6 +1863,7 @@ struct f2fs_sb_info {
 	unsigned int log_blocksize;		/* log2 block size */
 	unsigned int blocksize;			/* block size */
 	unsigned int sit_entries_per_block;	/* SIT entries in a block */
+	unsigned int orphans_per_block;	/* orphan inodes in a block */
 	unsigned int root_ino_num;		/* root inode number*/
 	unsigned int node_ino_num;		/* node inode number*/
 	unsigned int meta_ino_num;		/* meta inode number*/
@@ -2251,6 +2252,17 @@ static inline struct f2fs_sb_info
*F2FS_F_SB(const struct folio *folio)
 }

 #define SIT_ENTRY_PER_BLOCK(sbi)	((sbi)->sit_entries_per_block)
+#define F2FS_ORPHANS_PER_BLOCK(sbi)	((sbi)->orphans_per_block)
+#define GET_ORPHAN_BLOCKS(sbi, n)	DIV_ROUND_UP((n), \
+					F2FS_ORPHANS_PER_BLOCK(sbi))
+
+static inline struct f2fs_orphan_footer *
+f2fs_orphan_footer(void *orphan_block, struct f2fs_sb_info *sbi)
+{
+	return (struct f2fs_orphan_footer *)
+		((char *)orphan_block + sbi->blocksize -
+		 sizeof(struct f2fs_orphan_footer));
+}

 static inline struct f2fs_super_block *F2FS_RAW_SUPER(struct f2fs_sb_info *sbi)
 {
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index f71a2b63f8ab..f324e9cf4264 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4350,6 +4350,8 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 	sbi->blocksize = BIT(sbi->log_blocksize);
 	sbi->sit_entries_per_block = sbi->blocksize /
 		sizeof(struct f2fs_sit_entry);
+	sbi->orphans_per_block = (sbi->blocksize -
+		sizeof(struct f2fs_orphan_footer)) / sizeof(__le32);
 	sbi->log_blocks_per_seg = le32_to_cpu(raw_super->log_blocks_per_seg);
 	sbi->blocks_per_seg = BIT(sbi->log_blocks_per_seg);
 	sbi->segs_per_sec = le32_to_cpu(raw_super->segs_per_sec);
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index 324427cc29dc..a5111556d923 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -220,14 +220,18 @@ struct f2fs_checkpoint {

 /*
  * For orphan inode management
+ *
+ * An orphan block has no fixed-size C structure because the number of inode
+ * entries depends on the filesystem block size.  Its exact on-disk layout is:
+ *
+ * 0                           blocksize - 16             blocksize
+ * +--------------------------+--------------------------+
+ * | ino[0] ... ino[n - 1]    | struct f2fs_orphan_footer |
+ * +--------------------------+--------------------------+
+ *
+ * n = (blocksize - sizeof(struct f2fs_orphan_footer)) / sizeof(__le32)
  */
-#define F2FS_ORPHANS_PER_BLOCK	((F2FS_BLKSIZE - 4 * sizeof(__le32)) /
sizeof(__le32))
-
-#define GET_ORPHAN_BLOCKS(n)	(((n) + F2FS_ORPHANS_PER_BLOCK - 1) / \
-					F2FS_ORPHANS_PER_BLOCK)
-
-struct f2fs_orphan_block {
-	__le32 ino[F2FS_ORPHANS_PER_BLOCK];	/* inode numbers */
+struct f2fs_orphan_footer {
 	__le32 reserved;	/* reserved */
 	__le16 blk_addr;	/* block index in current CP */
 	__le16 blk_count;	/* Number of orphan inode blocks in CP */
-- 
2.53.0
