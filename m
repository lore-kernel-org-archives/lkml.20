Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351D83B42C6
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 22:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788214095; cv=none; b=aua9s1Zeo94PrJinQrA1MV73ihKh+lkayv/Ec9XW/P4nNs87JGwSPkS5Rzze6soy5q37m2GhiLL4I1v+Z33DporqgmzfGbGzXL5/ywQKUmYUGPBfPnPGlBh7oItrdpoMLoCWvTp4KbpaCXmRzZxm6dHYVuCtRWDsoCE7qmLUlis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788214095; c=relaxed/simple;
	bh=eBC2eBPumwJIDm4WhwpcjIg7HmgeIFouYQQQ9D6zISc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YTqthsk4ghDrESL3/6tIiVLKt1kW2PuYwWryrs4zCVo16U5JoZN/DsG/z6RbDTSdtLosWbuEB6AoNWZiPvmSwpqztoXQznkK1kq84ZOexJbDSBwgo4QcBjZVROBfp2FkesJ3eLbwJjLJJOIr9M5q9AgWbWTuyFj4uxbYVOPFA6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R8qbCm96; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R8qbCm96"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d71a50caa9so2173805ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788214093; x=1788818893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=73Dvng3mI/lVEk+nvH7YpbUeDY808BAoyKaozDCNYWI=;
        b=R8qbCm96soGdMhVJ6cPDfw2IKrrm+dtUh+C0H1WobqwmVT7T6zi3ViWFuIiM/4yz5y
         2TjKtSCTEtw8b8pfBWw533iB7y7ENfkSFVZ2O7EmIz6UCuFhCXjVEeZHuiqMrelr2ZlQ
         czW4YBtoSl076LYhAtXsI9/gexNWf3zk/8dAI6V4MpY6UiuyP/zsspRbnbWIKSoog4v5
         AkYsCR6WYac0TaqQuXwKTmOnHPrcpJVeD4mYU1+SML3b4oOuhvewlKKo6O9NI/M5yXbW
         /FJ0d+OeRF2ZrZ2zRxpZa6OpSTEBv0wu0qrYHtysDatsYUH1aDIjueoGArzksdqtsQlF
         DdLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788214093; x=1788818893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=73Dvng3mI/lVEk+nvH7YpbUeDY808BAoyKaozDCNYWI=;
        b=HC2ax+FaZy1Pk1LKzbusuWlpRa5NMDvTy5DV8LtACTofN6wHZuLVLFmtDoEQjCqP1S
         E80gTaAx+BKvVr/CsOTst8SGkHpPlZX6wt5NCq/KVVv1C8flgMPstp08usT8LdTMZfzz
         hXpZe32lf0+vy8a0eATX6OWSFLlbbqwUt/NAeoAehr9TP/xsgu0tbdzUhzpLnNd0NIMU
         t/97UPfSujoCTiF9H1+UN5X3o/hrJiiBHJHhcZkD0iGbiKLjHZBBpaUadIUbntDP+5m3
         WZwj8txRv1DUnmZ4UqDIs/+DOOOsp4cVDq5o/rdVElOL7TEZYxa/t7d5Jys2828M0UPT
         do6w==
X-Forwarded-Encrypted: i=1; AKwUvBysh7/RsjJ4oLoqaWuh9Waz8XCrshwUMseysq6D0HmxQ2/vQkIwPOdkJnG+TRbmx32OLrmn5qraE3/ftFg=@vger.kernel.org
X-Gm-Message-State: AFuF++mUCxL3Pv6rVwFM4TpmjJLVxLNkabQ2TDW8GOCYC2+Hh5PAtrCn
	kSUfdE+bboYyBcOmE0LZGFbqDXVkzU90WSVd/g3PNEzkfSaxtabF75op
X-Gm-Gg: AYBFou1hlXNb7joxKQJGJM9gtIPqKlLbQMzoPPwk7WaoNfwfS/eiwW4qstsxI8uTKlE
	lVX9R2XdvxVW5NaeeZfodB9x7HHwZvdAbhvUkop1Uzdc/5r6WKv2qXPaOmcrJgLVs1gtBYBmovz
	XYOAz8W05uMIacH47jUB9JGzJ0mxYRMvzsSYy96ZwE5dvD7eQxviDRjiR0PzqoZXX2wAm8c772s
	6hDFN4+ztYPeH4v2GKgMUnEUi/6w0i/smDfh6SBZ32ZNkRpWx6togbPIcPPX/nRf0ZAo/RXEF3L
	aUPk3vlr/PNX6Zb/xbsRQKbl7wmOA7KihTOPWISRJngHOC5mcsafxH8CBd1KfbQxF91xkN1TfGv
	wxKiuLojOvNsu8kSlcRv7NbLW5EUgIyCOx5OJ0cZ68O53WekE6I95ozHXw4CUfH1h1gd+x+23Gq
	TPea9T/eWVoznLbdFihCL3Zbt/xHkpwB1KmqQVAL3stPL+a55YK+ixFbcMZdatkP3CiggrEC7Ao
	6DG
X-Received: by 2002:a17:902:ef52:b0:2d9:383a:30f1 with SMTP id d9443c01a7336-2d9383a326bmr96736725ad.4.1788214093376;
        Mon, 31 Aug 2026 15:08:13 -0700 (PDT)
Received: from [127.0.1.1] ([2601:647:4184:b3f0:91a4:c2d8:1d54:21ad])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d759869afasm41626105ad.42.2026.08.31.15.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 15:08:12 -0700 (PDT)
From: Kelvin Zhang <zhangxp1998@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Cc: jaegeuk@kernel.org,
	chao@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 02/11] f2fs: describe SIT block layout dynamically
Date: Mon, 31 Aug 2026 15:08:03 -0700
Message-ID: <bd3e5620b926291fe4baf1d45f950d7d1730893c.1788213716.git.zhangxp1998@gmail.com>
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

An SIT block consists of an on-disk array of struct f2fs_sit_entry elements
whose total capacity depends on the filesystem block size. The existing
fixed SIT_ENTRY_PER_BLOCK macro hardcodes a 4KB block size.

Convert the entries array in struct f2fs_sit_block into a C flexible array
member, and calculate sbi->sit_entries_per_block dynamically in
init_sb_info().

Parameterize SIT indexing helpers (SIT_ENTRY_PER_BLOCK, SIT_BLOCK_OFFSET,
SIT_BLK_CNT, and f2fs_start_segno) to take struct f2fs_sb_info *sbi, and
update all call sites across segment management, checkpointing, and mount.

This is a layout-only change; valid 4KB filesystems retain identical
runtime geometry and behavior.

Signed-off-by: Kelvin Zhang <zhangxp1998@gmail.com>
---
 fs/f2fs/checkpoint.c    |  2 +-
 fs/f2fs/f2fs.h          |  3 +++
 fs/f2fs/segment.c       | 15 ++++++++-------
 fs/f2fs/segment.h       | 22 +++++++++++++---------
 fs/f2fs/super.c         |  4 +++-
 include/linux/f2fs_fs.h |  9 ++++++---
 6 files changed, 34 insertions(+), 21 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 4b59f30ef45d..47c4a5c83a70 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -487,7 +487,7 @@ int f2fs_ra_meta_pages(struct f2fs_sb_info *sbi, block_t start, int nrpages,
 				goto out;
 			/* get sit block addr */
 			fio.new_blkaddr = current_sit_addr(sbi,
-					blkno * SIT_ENTRY_PER_BLOCK);
+					blkno * SIT_ENTRY_PER_BLOCK(sbi));
 			break;
 		case META_SSA:
 		case META_CP:
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 16720f1f0a9c..035863d513ab 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1863,6 +1863,7 @@ struct f2fs_sb_info {
 	unsigned int log_sectors_per_block;	/* log2 sectors per block */
 	unsigned int log_blocksize;		/* log2 block size */
 	unsigned int blocksize;			/* block size */
+	unsigned int sit_entries_per_block;	/* SIT entries in a block */
 	unsigned int root_ino_num;		/* root inode number*/
 	unsigned int node_ino_num;		/* node inode number*/
 	unsigned int meta_ino_num;		/* meta inode number*/
@@ -2251,6 +2252,8 @@ static inline struct f2fs_sb_info *F2FS_F_SB(const struct folio *folio)
 	return F2FS_M_SB(folio->mapping);
 }
 
+#define SIT_ENTRY_PER_BLOCK(sbi)	((sbi)->sit_entries_per_block)
+
 static inline struct f2fs_super_block *F2FS_RAW_SUPER(struct f2fs_sb_info *sbi)
 {
 	return (struct f2fs_super_block *)(sbi->raw_super);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 1e7e745be71d..b3bf1b62cdad 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4708,7 +4708,7 @@ static struct folio *get_next_sit_folio(struct f2fs_sb_info *sbi,
 	seg_info_to_sit_folio(sbi, folio, start);
 
 	folio_mark_dirty(folio);
-	set_to_next_sit(sit_i, start);
+	set_to_next_sit(sbi, sit_i, start);
 
 	return folio;
 }
@@ -4747,10 +4747,11 @@ static void adjust_sit_entry_set(struct sit_entry_set *ses,
 	list_move_tail(&ses->set_list, head);
 }
 
-static void add_sit_entry(unsigned int segno, struct list_head *head)
+static void add_sit_entry(struct f2fs_sb_info *sbi, unsigned int segno,
+		struct list_head *head)
 {
 	struct sit_entry_set *ses;
-	unsigned int start_segno = START_SEGNO(segno);
+	unsigned int start_segno = f2fs_start_segno(sbi, segno);
 
 	list_for_each_entry(ses, head, set_list) {
 		if (ses->start_segno == start_segno) {
@@ -4775,7 +4776,7 @@ static void add_sits_in_set(struct f2fs_sb_info *sbi)
 	unsigned int segno;
 
 	for_each_set_bit(segno, bitmap, MAIN_SEGS(sbi))
-		add_sit_entry(segno, set_list);
+		add_sit_entry(sbi, segno, set_list);
 }
 
 static void remove_sits_in_journal(struct f2fs_sb_info *sbi)
@@ -4793,7 +4794,7 @@ static void remove_sits_in_journal(struct f2fs_sb_info *sbi)
 		dirtied = __mark_sit_entry_dirty(sbi, segno);
 
 		if (!dirtied)
-			add_sit_entry(segno, &SM_I(sbi)->sit_entry_set);
+			add_sit_entry(sbi, segno, &SM_I(sbi)->sit_entry_set);
 	}
 	update_sits_in_cursum(journal, -i);
 	up_write(&curseg->journal_rwsem);
@@ -4843,7 +4844,7 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 		struct folio *folio = NULL;
 		struct f2fs_sit_block *raw_sit = NULL;
 		unsigned int start_segno = ses->start_segno;
-		unsigned int end = min(start_segno + SIT_ENTRY_PER_BLOCK,
+		unsigned int end = min(start_segno + SIT_ENTRY_PER_BLOCK(sbi),
 						(unsigned long)MAIN_SEGS(sbi));
 		unsigned int segno = start_segno;
 
@@ -5008,7 +5009,7 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
 	sit_i->written_valid_blocks = 0;
 	sit_i->bitmap_size = sit_bitmap_size;
 	sit_i->dirty_sentries = 0;
-	sit_i->sents_per_block = SIT_ENTRY_PER_BLOCK;
+	sit_i->sents_per_block = SIT_ENTRY_PER_BLOCK(sbi);
 	sit_i->elapsed_time = le64_to_cpu(sbi->ckpt->elapsed_time);
 	sit_i->mounted_time = ktime_get_boottime_seconds();
 	init_rwsem(&sit_i->sentry_lock);
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 5949aa5200ac..534e376cbc92 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -102,12 +102,15 @@ static inline void sanity_check_seg_type(struct f2fs_sb_info *sbi,
 
 #define SIT_ENTRY_OFFSET(sit_i, segno)					\
 	((segno) % (sit_i)->sents_per_block)
-#define SIT_BLOCK_OFFSET(segno)					\
-	((segno) / SIT_ENTRY_PER_BLOCK)
-#define	START_SEGNO(segno)		\
-	(SIT_BLOCK_OFFSET(segno) * SIT_ENTRY_PER_BLOCK)
+#define SIT_BLOCK_OFFSET(sbi, segno)				\
+	((segno) / SIT_ENTRY_PER_BLOCK(sbi))
+static inline unsigned int
+f2fs_start_segno(struct f2fs_sb_info *sbi, unsigned int segno)
+{
+	return SIT_BLOCK_OFFSET(sbi, segno) * SIT_ENTRY_PER_BLOCK(sbi);
+}
 #define SIT_BLK_CNT(sbi)			\
-	DIV_ROUND_UP(MAIN_SEGS(sbi), SIT_ENTRY_PER_BLOCK)
+	DIV_ROUND_UP(MAIN_SEGS(sbi), SIT_ENTRY_PER_BLOCK(sbi))
 #define f2fs_bitmap_size(nr)			\
 	(BITS_TO_LONGS(nr) * sizeof(unsigned long))
 
@@ -424,7 +427,7 @@ static inline void seg_info_to_sit_folio(struct f2fs_sb_info *sbi,
 	struct f2fs_sit_block *raw_sit;
 	struct seg_entry *se;
 	struct f2fs_sit_entry *rs;
-	unsigned int end = min(start + SIT_ENTRY_PER_BLOCK,
+	unsigned int end = min(start + SIT_ENTRY_PER_BLOCK(sbi),
 					(unsigned long)MAIN_SEGS(sbi));
 	int i;
 
@@ -869,7 +872,7 @@ static inline pgoff_t current_sit_addr(struct f2fs_sb_info *sbi,
 						unsigned int start)
 {
 	struct sit_info *sit_i = SIT_I(sbi);
-	unsigned int offset = SIT_BLOCK_OFFSET(start);
+	unsigned int offset = SIT_BLOCK_OFFSET(sbi, start);
 	block_t blk_addr = sit_i->sit_base_addr + offset;
 
 	f2fs_bug_on(sbi, !valid_main_segno(sbi, start));
@@ -894,9 +897,10 @@ static inline pgoff_t next_sit_addr(struct f2fs_sb_info *sbi,
 	return block_addr + sit_i->sit_base_addr;
 }
 
-static inline void set_to_next_sit(struct sit_info *sit_i, unsigned int start)
+static inline void set_to_next_sit(struct f2fs_sb_info *sbi,
+				   struct sit_info *sit_i, unsigned int start)
 {
-	unsigned int block_off = SIT_BLOCK_OFFSET(start);
+	unsigned int block_off = SIT_BLOCK_OFFSET(sbi, start);
 
 	f2fs_change_bit(block_off, sit_i->sit_bitmap);
 }
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 2d9f5b77f815..4bd1c9fb1f7f 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4329,7 +4329,7 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
 		return 1;
 	}
 
-	sit_blk_cnt = DIV_ROUND_UP(main_segs, SIT_ENTRY_PER_BLOCK);
+	sit_blk_cnt = DIV_ROUND_UP(main_segs, SIT_ENTRY_PER_BLOCK(sbi));
 	if (sit_bitmap_size * 8 < sit_blk_cnt) {
 		f2fs_err(sbi, "Wrong bitmap size: sit: %u, sit_blk_cnt:%u",
 			 sit_bitmap_size, sit_blk_cnt);
@@ -4382,6 +4382,8 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 		le32_to_cpu(raw_super->log_sectors_per_block);
 	sbi->log_blocksize = le32_to_cpu(raw_super->log_blocksize);
 	sbi->blocksize = BIT(sbi->log_blocksize);
+	sbi->sit_entries_per_block = sbi->blocksize /
+		sizeof(struct f2fs_sit_entry);
 	sbi->log_blocks_per_seg = le32_to_cpu(raw_super->log_blocks_per_seg);
 	sbi->blocks_per_seg = BIT(sbi->log_blocks_per_seg);
 	sbi->segs_per_sec = le32_to_cpu(raw_super->segs_per_sec);
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index bb2b6cd5d507..ecd6694af572 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -396,8 +396,6 @@ struct f2fs_nat_block {
  * Not allow to change this.
  */
 #define SIT_VBLOCK_MAP_SIZE 64
-#define SIT_ENTRY_PER_BLOCK (F2FS_BLKSIZE / sizeof(struct f2fs_sit_entry))
-
 /*
  * F2FS uses 4 bytes to represent block address. As a result, supported size of
  * disk is 16 TB for a 4K page size and 64 TB for a 16K page size and it equals
@@ -424,8 +422,13 @@ struct f2fs_sit_entry {
 	__le64 mtime;				/* segment age for cleaning */
 } __packed;
 
+/*
+ * The on-disk SIT block is a filesystem-block-sized array of SIT entries.
+ * Its entry count depends on the filesystem block size, so it must be
+ * calculated by the caller rather than implied by this C structure.
+ */
 struct f2fs_sit_block {
-	struct f2fs_sit_entry entries[SIT_ENTRY_PER_BLOCK];
+	DECLARE_FLEX_ARRAY(struct f2fs_sit_entry, entries);
 } __packed;
 
 /*
-- 
2.53.0

