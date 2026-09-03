Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F9A378813
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 23:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788479790; cv=none; b=Z9yaSyGTqTCNP+iI8INco59o8jk4WDqu8bute62fVRDNZKgZokeLct4wb66D22LYuwIpQTmSzXm1UyuQnYYgvEZDKxYx6kx6xqcwfyNEDd10nQJfT+uMtTWAdQoV5DxaKfMQc4LiFGUuVCccVHSc4PO/YAdOHOZtyPVnEgfetS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788479790; c=relaxed/simple;
	bh=rj7PE6AhaGCK4c3T/hHLrWRCngTeg8BZgdR+llra94g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qweLl3smhvq1bL70rBsx3mDX4XGwg0nh2t46B/PC+lhGuD40XPp9IA7/rJadBL1ePi4HVGp4S0DE65lIMc9N6lJztV8t5J6A0CZQKBWpod085HxlDZRV9IpZrltOsEr+frVL+36UudT0rWxROIgWBbsFMrCaVY+uNh1QggPhwac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=imVAN5qb; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="imVAN5qb"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc1c7364550so633189a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 16:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788479788; x=1789084588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m9wKI0Z0DpMpYM/1mHsDF/pZnszi7sqs9bFOkpAyOMY=;
        b=imVAN5qb3TTIZk9EZyssPnOTxwNrvUsjSINzMlYI06ncvOjfVJjhpVnEqb8wFKuhyq
         3DGj7zXwSrHINDGQH5UawfSwpnatMs9r6mwB7uDcJE1a6sFW7cOEx0fI+lphvty/oa0z
         vG3ScaxuwW6fnzUFo7+KFE0GPTBmxSwqgUpo+eTTi4J9/axyHK+YmcKt1Vi36RX2w+nF
         69DSOHx/LiNjKAyqLv/4LUdi/f/J4A21wZKjHagRFyVDhczruXkzSrOxuc3WTyAYzhXD
         7iSdGsZhXFXOnNx4Xnccm6HZalbSuoxfNdPbJbcudSM5GlAc+eDrx8gOuIO5YOEFR9fU
         Yi6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788479788; x=1789084588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m9wKI0Z0DpMpYM/1mHsDF/pZnszi7sqs9bFOkpAyOMY=;
        b=a4nakN84ebs4tM3ovNL2fqI1x1tf6oNS+uNxw0Pj1HSKM40Brrc59hXXhzWqJbqk/S
         C+macftns6K3Ujyj7ffZIkhIJtaYJM3s8aWgXZkcMLrmaZIVKPZ4IQKnbX7bcn0bUJ8I
         JS1hHzDKE6gcKShkWfmtIp4ptxDy5e2KJwHsvKRMOPANBwTfEyzm8ji/0RYMpi8frcBN
         d0CG1hF6GdfLNiRILxN0QD/egeiwh6iek7dfG/frXPQQzHhU8ly6cOALbkQimlQtzZhW
         uIUzn7IuzyLkXFt04XYwAOe2iRhOTGei/fA8xvDIclymr7bDhh/unaaTl4kp79MIPU2K
         SqLg==
X-Forwarded-Encrypted: i=1; AKwUvBxWlH29LW+vXlKkW25rOxd2AZcAHQG6a3NwTLX77BUH+M/s82FoFhQ5wHFuohznAfdf/+e2xQ2WJVPubMM=@vger.kernel.org
X-Gm-Message-State: AFuF++lnX5CBkeA2/nQslnHbOeHJItoJf9gPRcfaC2pYbjWGVNKinsny
	tHiqp54DTdj0Iq9sGxKXrDZA+Qy7/vL2ZKP3qba0IDoz83A5wYU7KYvI
X-Gm-Gg: AYBFou3WlliTJmzonebH7r8FkzPYb3RNYZQ+DkuVBsTwn/d3NBuL1UFvCEIUYsYYFJd
	Eym59hkSDGdyDd/enycXKk7VyzwMqo9vRH+fCuoWFOtWp3xPpIH1YKSusafrm3fnZYpn4KgY6+p
	uSfQl7Euo7yR1+uwPNWOjaRUnySB7mlGvgUQy/vGhf1jhlGU4X0N+N+ts6KpR1U9qK+k0ePaxMu
	wQbFftkyGQcQuBqfRrzAxP5bEJZ+49oDA55Vc7z1o7Ik6+GRALi2tHoODygZP60UKACvEHsmnqU
	m7cH2Mnc6g8AmxD8HQQ7Gql2NbQ5huMR5s6+vSeF2U8srZ+IJ8hdMT8tAoX3hWyUfUdxKPKWtoK
	8skrCy8nY6hbPzsrN7R7uUBqgR/om9bbV15b18/e2SggDc0W+LDWlYissy/vthNxNBo7pZWRJYZ
	uVIBLd8m4+cMIQJCJG1GcO7Zg6rkVFNVhsgk8fsYWv7JturDezFliFJ/hNIcQnux3IXw==
X-Received: by 2002:a17:90b:5845:b0:383:5a16:bd70 with SMTP id 98e67ed59e1d1-39b2620547amr3221584a91.16.1788479788557;
        Thu, 03 Sep 2026 16:56:28 -0700 (PDT)
Received: from [127.0.1.1] ([2601:647:4184:b3f0:29c4:4984:db20:3bb4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b6036fcsm2268682eec.20.2026.09.03.16.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 16:56:28 -0700 (PDT)
From: Kelvin Zhang <zhangxp1998@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Cc: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>,
	Daeho Jeong <daeho43@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 04/11] f2fs: describe orphan block layout dynamically
Date: Thu,  3 Sep 2026 16:56:16 -0700
Message-ID: <99c37e861d74328fa6203c58284dc33505d326ad.1788479509.git.zhangxp1998@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788479509.git.zhangxp1998@gmail.com>
References: <cover.1788479509.git.zhangxp1998@gmail.com>
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
 fs/f2fs/checkpoint.c    | 32 ++++++++++++++++++--------------
 fs/f2fs/f2fs.h          | 12 ++++++++++++
 fs/f2fs/super.c         |  2 ++
 include/linux/f2fs_fs.h | 20 ++++++++++++++------
 4 files changed, 46 insertions(+), 20 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 05366ba2675d..c7183d4b6765 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1034,6 +1034,7 @@ int f2fs_recover_orphan_inodes(struct f2fs_sb_info *sbi)
 	for (i = 0; i < orphan_blocks; i++) {
 		struct folio *folio;
 		struct f2fs_orphan_block *orphan_blk;
+		struct f2fs_orphan_footer *footer;
 		unsigned int entry_count;
 
 		folio = f2fs_get_meta_folio(sbi, start_blk + i);
@@ -1043,8 +1044,9 @@ int f2fs_recover_orphan_inodes(struct f2fs_sb_info *sbi)
 		}
 
 		orphan_blk = folio_address(folio);
-		entry_count = le32_to_cpu(orphan_blk->entry_count);
-		if (entry_count > F2FS_ORPHANS_PER_BLOCK) {
+		footer = f2fs_orphan_footer(orphan_blk, sbi);
+		entry_count = le32_to_cpu(footer->entry_count);
+		if (entry_count > F2FS_ORPHANS_PER_BLOCK(sbi)) {
 			f2fs_err(sbi, "invalid orphan inode entry count %u",
 				 entry_count);
 			set_sbi_flag(sbi, SBI_NEED_FSCK);
@@ -1077,6 +1079,7 @@ static void write_orphan_inodes(struct f2fs_sb_info *sbi, block_t start_blk)
 {
 	struct list_head *head;
 	struct f2fs_orphan_block *orphan_blk = NULL;
+	struct f2fs_orphan_footer *footer = NULL;
 	unsigned int nentries = 0;
 	unsigned short index = 1;
 	unsigned short orphan_blocks;
@@ -1084,7 +1087,7 @@ static void write_orphan_inodes(struct f2fs_sb_info *sbi, block_t start_blk)
 	struct ino_entry *orphan = NULL;
 	struct inode_management *im = &sbi->im[ORPHAN_INO];
 
-	orphan_blocks = GET_ORPHAN_BLOCKS(im->ino_num);
+	orphan_blocks = GET_ORPHAN_BLOCKS(sbi, im->ino_num);
 
 	/*
 	 * we don't need to do spin_lock(&im->ino_lock) here, since all the
@@ -1098,20 +1101,21 @@ static void write_orphan_inodes(struct f2fs_sb_info *sbi, block_t start_blk)
 		if (!folio) {
 			folio = f2fs_grab_meta_folio(sbi, start_blk++);
 			orphan_blk = folio_address(folio);
-			memset(orphan_blk, 0, sizeof(*orphan_blk));
+			footer = f2fs_orphan_footer(orphan_blk, sbi);
+			memset(orphan_blk, 0, sbi->blocksize);
 		}
 
 		orphan_blk->ino[nentries++] = cpu_to_le32(orphan->ino);
 
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
@@ -1121,9 +1125,9 @@ static void write_orphan_inodes(struct f2fs_sb_info *sbi, block_t start_blk)
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
@@ -1816,7 +1820,7 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 		__clear_ckpt_flags(ckpt, CP_COMPACT_SUM_FLAG);
 	spin_unlock_irqrestore(&sbi->cp_lock, flags);
 
-	orphan_blocks = GET_ORPHAN_BLOCKS(orphan_num);
+	orphan_blocks = GET_ORPHAN_BLOCKS(sbi, orphan_num);
 	ckpt->cp_pack_start_sum = cpu_to_le32(1 + cp_payload_blks +
 			orphan_blocks);
 
@@ -2072,7 +2076,7 @@ void f2fs_init_ino_entry_info(struct f2fs_sb_info *sbi)
 
 	sbi->max_orphans = (BLKS_PER_SEG(sbi) - F2FS_CP_PACKS -
 			NR_CURSEG_PERSIST_TYPE - __cp_payload(sbi)) *
-			F2FS_ORPHANS_PER_BLOCK;
+			F2FS_ORPHANS_PER_BLOCK(sbi);
 }
 
 int __init f2fs_create_checkpoint_caches(void)
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 6d3ca0bc2a76..69a558fe46c7 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1864,6 +1864,7 @@ struct f2fs_sb_info {
 	unsigned int blocksize;			/* block size */
 	unsigned int nat_entries_per_block;	/* NAT entries in a block */
 	unsigned int sit_entries_per_block;	/* SIT entries in a block */
+	unsigned int orphans_per_block;	/* orphan inodes in a block */
 	unsigned int root_ino_num;		/* root inode number*/
 	unsigned int node_ino_num;		/* node inode number*/
 	unsigned int meta_ino_num;		/* meta inode number*/
@@ -2254,6 +2255,17 @@ static inline struct f2fs_sb_info *F2FS_F_SB(const struct folio *folio)
 
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
index 534f6678e4ae..5f630ee748d0 100644
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
index 061f906a7b94..bdb8c63ac0c6 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -220,14 +220,22 @@ struct f2fs_checkpoint {
 
 /*
  * For orphan inode management
+ *
+ * The number of inode entries in an orphan block depends on the filesystem
+ * block size. Its exact on-disk layout is:
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
 struct f2fs_orphan_block {
-	__le32 ino[F2FS_ORPHANS_PER_BLOCK];	/* inode numbers */
+	DECLARE_FLEX_ARRAY(__le32, ino);
+} __packed;
+
+struct f2fs_orphan_footer {
 	__le32 reserved;	/* reserved */
 	__le16 blk_addr;	/* block index in current CP */
 	__le16 blk_count;	/* Number of orphan inode blocks in CP */
-- 
2.53.0

