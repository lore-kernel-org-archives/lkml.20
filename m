Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA2F2C11E6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 23:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788479787; cv=none; b=S58nCmQorwdWAjZTkD1SSI/5Li763SpjwX9OM/n6lcpOjExGT3Yvf0oQnYE17VeHwAnIjUgjtl+GI1i0qRNhEQYSdWu33qyl6YUDVh5dYIZ9BV/IK4Zhqb+cPoIB0tXKiVYSAaSlmeRQwLp2BfN9YJ2S2gR9LAZ8XI5QITA2IBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788479787; c=relaxed/simple;
	bh=6TpaOv8NZYz3qN+vhzp+Pln0coZildUhq0C4eCSoU1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R+ugNL0zTcflKFbY8JGmKGu6w0u4fPS+U4nzp1TfamDFuFmxS2ueoeIcmIzfnqUJ2h9dvR7Cm1Qda+aUIga5yV84yovNV8pNK+slb/VUiQxvUn34e/aKVxZAqrjvfDX8JRA4ySd490rhtTyQ/u/SU4BBG74MRMPxiMpz1pnTuJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YlrUfqb2; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YlrUfqb2"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso447924a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 16:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788479785; x=1789084585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QzZggu0453tGRKVkTcHNa67VAVh0WqG17qQs+4BQESY=;
        b=YlrUfqb2iK0CGKMcJ9BCPg4Jk7RGe0Q1dzpzDI0POlb//1eJfkH9tUSlzK2l/f+Hub
         gl30QuZN9s+3kNnuD/8FZkMkoCgyyuHgiprUaau6C3gQhJp6IkQyHwLqzKoM//Xouevt
         ts8Zb7vT/16hWccR0E4QPvSvC18O77CslF7T/97nTiF/qgRLHm7KhuD3VANnRr2LfT2o
         l192PmtP/61R6RYTEX5ZIydM2f+p157olBWZy6PlWQjXFP6xOb3ewtQ4UWI10+uPWwv5
         p+2ANVRIHQQyW27CT4KztFvywIeJn18G0nuNLApsIqxgGUMAJs0glfvd5MovmXRbpypQ
         5nzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788479785; x=1789084585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QzZggu0453tGRKVkTcHNa67VAVh0WqG17qQs+4BQESY=;
        b=GyJrwYkMSOJBmuZgeSTS+uVp8IKTZ1KCihizQFZYJwIf/27xOfhCz6WqVW2hAFulFv
         y6xYp0jZ80two4JEd0XwIprUSmO/1NhvtUnZ4LCzQsfUEf/huAPIGM8Vkzj67676fXKz
         7PP4afMLPhthkQTIFUF5gtiTZ1so2/tkMj31VdW5S8xFI+oLthsalHoft6wUYHBPoLM9
         gkHAxgkoDzpCsKOWkFoJoyW2gzv8sDYqlOeiVKvl+RibkWMwpOSwJiO5oUm0EnNl7PZr
         h/CQzTIapL9XwKCYdx0tv22uHpDHFZoMyXYZ7ejDIOv+OjYDFqYKUMrqdnW7FrpV/SBn
         MLsw==
X-Forwarded-Encrypted: i=1; AKwUvBymsR4N/sEFrTL4Y3gfhlxEN7mWpwMFDMDVDQvQG8+Tw7GdPK3VAmumXFwzi//ia0F1lTsW721/j/Wcm1w=@vger.kernel.org
X-Gm-Message-State: AFuF++msIju7ssXmsMMfFOcFZd3Rz0zq3vWTiEMwMHqmGzzPfJ1GmpTh
	45wUmtoTA2PH4G+fpk3zwu+rgaHeV/LkyWsncJTnj7Ue07qZY5eUZvHw
X-Gm-Gg: AYBFou2Lx4D4dqnc+CFIr8Y35bQAsjK8B4Vl1lZicM65WQbaDKnUJV3+sffeXSDeu/m
	hd8jI+K2qslAOwIZVWbC5yUhWY0urjtj5SHka/9ykoaXLZo3CXb+T2iIDQS9IJizo4bG7yrxapo
	M6NnbDtCCArWIQxkfX709Q5kAm9wCM/k5+tbig6FaluoQg8XLZ3uDJzkcZVF12Fi0cEXfT2w8Ph
	Ac+IJKbFbc+mJQcYsiYC1nHj2kuAeiEupP0nVs1UDNWm4s6YJXizr0VIjNI7KWn7VAjtxSuiio3
	Lfjc81W+HwajVRp6NhsQG0cwWG6u54p71F+ZTvpD2+AkuxrdZqAt1er4/VkHANpyQ3a7M0DA16E
	QLL6roC7XHW+IuK2HmiVKqjKZu1l0LXwDSXszfCahw61C2nK5YFSwFDWzksCPgyrIAKukc6eeLX
	pabTVN85ABjEeXMf30O53K7gSLhTgj7L3ffV8BDB4kwBEpQ2Gqv4PsEB1HImX4bSZA4foX+XDIo
	q8TBQ==
X-Received: by 2002:a17:90b:2ccd:b0:398:b88c:2b7b with SMTP id 98e67ed59e1d1-39b260d7297mr3541846a91.8.1788479785112;
        Thu, 03 Sep 2026 16:56:25 -0700 (PDT)
Received: from [127.0.1.1] ([2601:647:4184:b3f0:29c4:4984:db20:3bb4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243a9388sm2373680c88.10.2026.09.03.16.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 16:56:24 -0700 (PDT)
From: Kelvin Zhang <zhangxp1998@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Cc: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>,
	Daeho Jeong <daeho43@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 02/11] f2fs: describe SIT block layout dynamically
Date: Thu,  3 Sep 2026 16:56:14 -0700
Message-ID: <10843e36038ce78374ef20fe8c19f6ec392bc078.1788479509.git.zhangxp1998@gmail.com>
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
index cf88b463fde5..7fcda18e9cda 100644
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
index 2f7ab5888b07..cd49b03befa3 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1862,6 +1862,7 @@ struct f2fs_sb_info {
 	unsigned int log_sectors_per_block;	/* log2 sectors per block */
 	unsigned int log_blocksize;		/* log2 block size */
 	unsigned int blocksize;			/* block size */
+	unsigned int sit_entries_per_block;	/* SIT entries in a block */
 	unsigned int root_ino_num;		/* root inode number*/
 	unsigned int node_ino_num;		/* node inode number*/
 	unsigned int meta_ino_num;		/* meta inode number*/
@@ -2250,6 +2251,8 @@ static inline struct f2fs_sb_info *F2FS_F_SB(const struct folio *folio)
 	return F2FS_M_SB(folio->mapping);
 }
 
+#define SIT_ENTRY_PER_BLOCK(sbi)	((sbi)->sit_entries_per_block)
+
 static inline struct f2fs_super_block *F2FS_RAW_SUPER(struct f2fs_sb_info *sbi)
 {
 	return (struct f2fs_super_block *)(sbi->raw_super);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 63b712d3d599..2427649402f6 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4706,7 +4706,7 @@ static struct folio *get_next_sit_folio(struct f2fs_sb_info *sbi,
 	seg_info_to_sit_folio(sbi, folio, start);
 
 	folio_mark_dirty(folio);
-	set_to_next_sit(sit_i, start);
+	set_to_next_sit(sbi, sit_i, start);
 
 	return folio;
 }
@@ -4745,10 +4745,11 @@ static void adjust_sit_entry_set(struct sit_entry_set *ses,
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
@@ -4773,7 +4774,7 @@ static void add_sits_in_set(struct f2fs_sb_info *sbi)
 	unsigned int segno;
 
 	for_each_set_bit(segno, bitmap, MAIN_SEGS(sbi))
-		add_sit_entry(segno, set_list);
+		add_sit_entry(sbi, segno, set_list);
 }
 
 static void remove_sits_in_journal(struct f2fs_sb_info *sbi)
@@ -4791,7 +4792,7 @@ static void remove_sits_in_journal(struct f2fs_sb_info *sbi)
 		dirtied = __mark_sit_entry_dirty(sbi, segno);
 
 		if (!dirtied)
-			add_sit_entry(segno, &SM_I(sbi)->sit_entry_set);
+			add_sit_entry(sbi, segno, &SM_I(sbi)->sit_entry_set);
 	}
 	update_sits_in_cursum(journal, -i);
 	up_write(&curseg->journal_rwsem);
@@ -4841,7 +4842,7 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 		struct folio *folio = NULL;
 		struct f2fs_sit_block *raw_sit = NULL;
 		unsigned int start_segno = ses->start_segno;
-		unsigned int end = min(start_segno + SIT_ENTRY_PER_BLOCK,
+		unsigned int end = min(start_segno + SIT_ENTRY_PER_BLOCK(sbi),
 						(unsigned long)MAIN_SEGS(sbi));
 		unsigned int segno = start_segno;
 
@@ -5006,7 +5007,7 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
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
index eda8dd8f4eb0..4e10a84b4142 100644
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

