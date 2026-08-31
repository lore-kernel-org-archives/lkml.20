Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A4C3B6370
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 22:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788214098; cv=none; b=A7hyUaIEFtjyaxyLqzfcYwsZcKtyGL3rMf/+OoTCG6RT7SJYp0nPW9qq7rg25OwYHyqAnHbWleDyna7d8vRYeOEQ86F8Sb+yffSAQSs/3C5yTYnizcbOC/K7N+Q7lVrOvon3+O4iuVRn1ss7+S/fVGMKZKrUot7CrIYTT31Gt5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788214098; c=relaxed/simple;
	bh=hPN3nXcUHnWcSipjfnKgYJRavDMvUtuFljq2XKWqBt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JIij7Jdbcks1UJ1//QJEDEdBZx0HU417wukzfiF4gRgDnVzMR4QtuFK1Kg/Kaisi158rr8MyskHcjpUvky7MOc13mPtv15XljtW3MUDr3dGm2k9+Ux4bTT2uRWesBWBz0HHHXzE3tVQiumDgvBpyiN2Z37swgFkdgdeUO+Q+P7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bf5eM8v5; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bf5eM8v5"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso386094a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788214096; x=1788818896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dW4wycsn7ZP7cjkV107YVoHC6HCM3f5tAGyKmMmlafw=;
        b=bf5eM8v5ZUrKXOZ7dmo06pCdF6DBh663q/cCVbCK9viFK8+XJzPdIRk8c20VVQotGo
         okfOANSKAT425161bU6hMv4AyuunP+4/s+grh1AaVmFYR9JTAe2MfnGXUnRxB2jdTvr7
         4k0U/c3hDZYmmG4jM5Pcs5PzMeBO6byMHBLpAw8ULE52V/bXlM6uvK4SJTw59hj2Nl6p
         WI+1d/eNDf+ZBY9LbvtIqtBNAhzD+S3dELWvsugauGsPSZTyCLBe4efqTrhM8XNxR3jj
         o3em0GJvatn2sFMwddD4Qz2dCoHlITs+L+U1b+GhH/0FMpAT+iYEV/blZYBEpXA1bVv0
         VaWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788214096; x=1788818896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dW4wycsn7ZP7cjkV107YVoHC6HCM3f5tAGyKmMmlafw=;
        b=oiKQQKLHhi77sE4rPSk5SNP5RRMC3UvHQMlp3yTqlQ+ov6pX0iQAnXHVGGLnZwRSvd
         0bygMCpa6pfmzDJk31oDGzyUyL5m1cIub31edUYo6GZu9lsFRwSfuNdeQRNTn6LcqWvw
         c/w/tpY9iSyViuyDu3f+eyVveJhmmQubPyp1j+q73CP+qZmpKhZDb4066iTpjVnIr8YU
         4OXgY36JX+D3SPiQDiSnfK+Q2rUbc+tSNN328gYwYtPZ3vMuOaHjj3GTDDb8BD3aqcaC
         qsM36BSTCldgW75kmx7MoPf8pLZ/qDOlsOQFQq15kHkhpSAj8xq7G4I5oeuSwcD9WfJ4
         3gfw==
X-Forwarded-Encrypted: i=1; AKwUvBy+e9TZcft8YwSYFzdvf7z9w+VPHhJQNOT77GEHKsqYjjU3ynmeBYPxuJ+PNPYsOqgE6dfH8cQk1hdxqcA=@vger.kernel.org
X-Gm-Message-State: AFuF++kasXbbHJRwmqfaxwoehbjSv7XFX06CA0+nHyLLjPUuj63zyCgP
	1+WS8vZLu8gp/PD5sJ3D1otVE6XdCN4l6JOzr/fX3Rj7uxhAwDqpOUxkXpz7mfbv
X-Gm-Gg: AYBFou1e0Kvk+j8W06kzElwCcjP8Heds5nKZXVtbzm9fsbnn6LVRmr9gRBaPTWQA7dg
	JZiriDaTSME1lU28GpocaeGx4YoVVNrHCE29oaLKCLToV+rIRpHqrNk4Ou9FcwWFzynlSzH/51L
	Ibhwo4WtXTEe0xKqAh83Dn4hNx0EnzdiazfYrvO+Lm+C2P5PW936hh8QMO9659gOmEIdoAnwppF
	oWCO3Ipd78zzG+OB4TBai7xuAFt/kH/ygEHcncX/z8wj103nkIJit67AkcsUY0oCzu483nNyS6m
	WoKbR7+82zkW3p3vpn7jgte3XKQH/kSRsxdgBQbMUT6YVdi/UamIKPwwHSkv8ycBiYHijULBtKD
	nzXX/evUlsx7JTHTIIAhxuh3g08xKDjxpMqb5661h5GupPoIovpdDrtHqSRaoMMiPhC8JbCcJCk
	ldAhBqeRM3X+uRpWYjvBGwWC/Pl6So/ZLNGBvWedZINwoq7pQcpzajfuUBN3/RR+uQPQ==
X-Received: by 2002:a17:90b:5102:b0:38e:70d5:b12d with SMTP id 98e67ed59e1d1-396d0ea862fmr47687127a91.6.1788214096149;
        Mon, 31 Aug 2026 15:08:16 -0700 (PDT)
Received: from [127.0.1.1] ([2601:647:4184:b3f0:91a4:c2d8:1d54:21ad])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bcf7ca7sm1906193a91.4.2026.08.31.15.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 15:08:15 -0700 (PDT)
From: Kelvin Zhang <zhangxp1998@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Cc: jaegeuk@kernel.org,
	chao@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 04/11] f2fs: describe orphan block layout dynamically
Date: Mon, 31 Aug 2026 15:08:05 -0700
Message-ID: <f05b57691fdc4c186b08010314f8085aeb868e04.1788213716.git.zhangxp1998@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788213716.git.zhangxp1998@gmail.com>
References: <cover.1788213716.git.zhangxp1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An on-disk orphan block contains a variable-length array of 32-bit
inode numbers followed by a fixed footer at the end of the block. A
compile-time whole-block structure cannot represent the footer position
when the block size varies at runtime.

Remove struct f2fs_orphan_block, introduce
struct f2fs_orphan_block_footer, and compute sbi->orphans_per_block
dynamically in init_sb_info(). Add helpers to access the inode entry array
and footer from a block buffer.

Update orphan inode recovery, checkpointing, and mount paths to use the
parameterized helpers. This preserves the on-disk format while decoupling
orphan handling from compile-time constants.

Signed-off-by: Kelvin Zhang <zhangxp1998@gmail.com>
---
 fs/f2fs/checkpoint.c    | 44 ++++++++++++++++++++++-------------------
 fs/f2fs/f2fs.h          | 12 +++++++++++
 fs/f2fs/super.c         |  2 ++
 include/linux/f2fs_fs.h | 18 ++++++++++-------
 4 files changed, 49 insertions(+), 27 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 3ecced9b4d57..37a72b693545 100644
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
@@ -1092,7 +1095,7 @@ static void write_orphan_inodes(struct f2fs_sb_info *sbi, block_t start_blk)
 	struct ino_entry *orphan = NULL;
 	struct inode_management *im = &sbi->im[ORPHAN_INO];
 
-	orphan_blocks = GET_ORPHAN_BLOCKS(im->ino_num);
+	orphan_blocks = GET_ORPHAN_BLOCKS(sbi, im->ino_num);
 
 	/*
 	 * we don't need to do spin_lock(&im->ino_lock) here, since all the
@@ -1105,21 +1108,22 @@ static void write_orphan_inodes(struct f2fs_sb_info *sbi, block_t start_blk)
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
@@ -1129,9 +1133,9 @@ static void write_orphan_inodes(struct f2fs_sb_info *sbi, block_t start_blk)
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
@@ -1824,7 +1828,7 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
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
index 8e6000e7d766..2a4ba7d4ec0e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1865,6 +1865,7 @@ struct f2fs_sb_info {
 	unsigned int blocksize;			/* block size */
 	unsigned int nat_entries_per_block;	/* NAT entries in a block */
 	unsigned int sit_entries_per_block;	/* SIT entries in a block */
+	unsigned int orphans_per_block;	/* orphan inodes in a block */
 	unsigned int root_ino_num;		/* root inode number*/
 	unsigned int node_ino_num;		/* node inode number*/
 	unsigned int meta_ino_num;		/* meta inode number*/
@@ -2255,6 +2256,17 @@ static inline struct f2fs_sb_info *F2FS_F_SB(const struct folio *folio)
 
 #define SIT_ENTRY_PER_BLOCK(sbi)	((sbi)->sit_entries_per_block)
 #define NAT_ENTRY_PER_BLOCK(sbi)	((sbi)->nat_entries_per_block)
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
index fdc2b0c51c06..f9811d571ae5 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4386,6 +4386,8 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 		sizeof(struct f2fs_nat_entry);
 	sbi->sit_entries_per_block = sbi->blocksize /
 		sizeof(struct f2fs_sit_entry);
+	sbi->orphans_per_block = (sbi->blocksize -
+		sizeof(struct f2fs_orphan_footer)) / sizeof(__le32);
 	sbi->log_blocks_per_seg = le32_to_cpu(raw_super->log_blocks_per_seg);
 	sbi->blocks_per_seg = BIT(sbi->log_blocks_per_seg);
 	sbi->segs_per_sec = le32_to_cpu(raw_super->segs_per_sec);
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index 061f906a7b94..7d2cbceb42d5 100644
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
-#define F2FS_ORPHANS_PER_BLOCK	((F2FS_BLKSIZE - 4 * sizeof(__le32)) / sizeof(__le32))
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

