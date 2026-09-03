Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EBE390226
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 23:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788477105; cv=none; b=U53QfISqsF5594ct/UJH9DFU2g4DwPwgamqcg2FZKCtqB7FP5lpR+wAGCeNtdYsEtAFe8GEne6biLhkERoQL0pPjoIJBoZDnApvs6WSy0ORmzophoCiA04PZJRdnbvpQd4o46Bjqx1LiJtL71YVdeSHayUy3cd5tLHSL3XRREFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788477105; c=relaxed/simple;
	bh=dT2LBKaYrCihF2oYM87tvdo7Z90lV23ofefFX/ejS6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DRuby6vq3xPjhyK5yn+a1fEcCWWp9/8RaVhYGJOXSJcXvbv7tElVW8KeMAlJ8fl2tkDoJgNWaE9kHU+N/G+JmZhfzOaiTyd89RxOUsYQE/rETdqumDh34fAkW8irX3CfmfWyak8FvvX8xxbdvUVFlvrAojgQlVkf7dupjDXIuAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+xYukHs; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+xYukHs"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso319230a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 16:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788477103; x=1789081903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LiO/HZyQ66ZVLjgkl46SE6ZbrPgYtx0eLhZ31mShgv0=;
        b=L+xYukHsY4Qa3Q9tW3ZV3VvJuW+sBXWwPrtdviOsLpF3CTFcoFhpNTW64qU4URakiP
         HaakscfHA+00ySp5CZUarzVivbFoAT7RcMLI2OW2+T/SnVsEKywYRH6mscqR6WbkKvT7
         ij/TAbQWJsTGcASVoAksgsFdWSUcQ47yXJmgmUA1uqCzj8fQoHzRjBxV7XlW1PO++8BC
         bVfBmGgZKH0PYk+N0tRPT58M3NTxJO/1qlh4KU0qmWJBqywFfw9K/kHqse6Z1KqEpFMw
         mX9PgoXCHEZgujo9GZ5sJgI6hkLyOmpYUV1oKqNrIRVFxiLFdvokoPAs4o9zwNI0EBEB
         zyfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788477103; x=1789081903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LiO/HZyQ66ZVLjgkl46SE6ZbrPgYtx0eLhZ31mShgv0=;
        b=NaEh4r1d18Ww+/DDyeCIxHR32txTWMsRgGTHHxW5OcJIx7zNV1HC965rU6bo2uAjMn
         HylZCYi7YxTCCx77rsvV8oRixSPyt6O8NmkxkIuMoazlb4i3G+ti5YfKG8IWLjBJDMuQ
         ue6fAyl8+cjAdJKkVFIdjIX3UGmDkdeWweUHJTVs+G7HZ1BJNlmAWx7mTjbEJQChEWUG
         PVLcF2mAlgRWJGlnr0M3Tj8T8dJ39O4yXpuvTTQQIE2oR2ZWjTLvzVpYLvgpJAfiZ1FW
         NUhx0/TJE2KYKvdRjfbqvxuUTG1ltgyutkwAnItmbTwHOUtTeVwCM6Txhv4K/KkpS2qn
         tg8g==
X-Forwarded-Encrypted: i=1; AKwUvBxvaeR6+6n6yLWe5lLKUorcFe+hJzofhYGbCyx1uGmEK0g+xgC4diW8fye82rSZM7f+EwSq0c5t99bWCmE=@vger.kernel.org
X-Gm-Message-State: AFuF++kMB8jAN9zG0xo5YjFTzH3U1PNyGJd8D8EFhSEDjM0hbZ3YI5U+
	emWXGheS4uWM/n9oKfdb8xlW78Ee46p/Tkchk5Hwx7UoCLjqtUg7wbWo
X-Gm-Gg: AYBFou1ZG70Ump55KGo/ZlA9jLUGUAfsn15B9wIfa2yzZ7JSlD1UF9f5VQZqMf6NKWE
	f08qjeBsfF3bfHpVmdpieKyEzd1avSKSoDw/n/trZK2V+jilxJds3BBqy9gC1wwQJPg8MUljnd7
	1fp5A3eQMap3G1M+q+fhIg0VLC9gnw979zxlOFvqATLqspJtzewbSANZRMzBXYl0QMCUvFaRnnK
	BgWO5jdNGs9ljI013BD2jWtHZpNYvNI/RWY2WVKdNNQiayXgYIiTxVRP2ogNJLzfbRMQcqHGh03
	RYzPbP09HoJKdJpzSZSNnBmXAbE7B1uS9zd2jBAu2kRQJ6moUYwlVbbpMx7OKXUoK+GbGO+D9si
	ZyaBGbFYBxmwYynmx00ofbcMiavLvu9FSnJdPIBpLqi3kot+ZMRKVG4tPPbJxoEki0YI7zt3DcA
	d3CaN9i2W5mX7m/PjKEsL4bAu1iSgG20cbVXdB4C1WwNsMKbkexZCPQl7eNWOCnJxL/A==
X-Received: by 2002:a17:90b:2884:b0:398:e86b:ce14 with SMTP id 98e67ed59e1d1-39b262ab44emr2824941a91.20.1788477103244;
        Thu, 03 Sep 2026 16:11:43 -0700 (PDT)
Received: from [127.0.1.1] ([2601:647:4184:b3f0:29c4:4984:db20:3bb4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdc1dsm1095550a91.7.2026.09.03.16.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 16:11:42 -0700 (PDT)
From: Kelvin Zhang <zhangxp1998@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Cc: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>,
	Daeho Jeong <daeho43@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 04/11] f2fs: describe orphan block layout dynamically
Date: Thu,  3 Sep 2026 16:11:31 -0700
Message-ID: <14ec93f97f034507d19317f793c4bb4c1dc0f9ba.1788476500.git.zhangxp1998@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788476500.git.zhangxp1998@gmail.com>
References: <cover.1788476500.git.zhangxp1998@gmail.com>
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
index 3ecced9b4d57..e615477307f9 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1042,6 +1042,7 @@ int f2fs_recover_orphan_inodes(struct f2fs_sb_info *sbi)
 	for (i = 0; i < orphan_blocks; i++) {
 		struct folio *folio;
 		struct f2fs_orphan_block *orphan_blk;
+		struct f2fs_orphan_footer *footer;
 		unsigned int entry_count;
 
 		folio = f2fs_get_meta_folio(sbi, start_blk + i);
@@ -1051,8 +1052,9 @@ int f2fs_recover_orphan_inodes(struct f2fs_sb_info *sbi)
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
@@ -1085,6 +1087,7 @@ static void write_orphan_inodes(struct f2fs_sb_info *sbi, block_t start_blk)
 {
 	struct list_head *head;
 	struct f2fs_orphan_block *orphan_blk = NULL;
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
@@ -1106,20 +1109,21 @@ static void write_orphan_inodes(struct f2fs_sb_info *sbi, block_t start_blk)
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
index 32c050257d7d..5891dba76bce 100644
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

