Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206D148986C
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787780388; cv=pass; b=fp80H8/8IKDPSKu33UJUDqWBlOelm/gI0lQZZ21amw4ZSHqUY9CfeP1I6O0efsqIzhBmd1w96AD+QuJFAp0DJbXel3povilPSfVkGIdav35uZ7gSmL/U0lwqKlNlVBDRYV7t4xQk5I70WNirU0/ykj695bPoPXZPcLpr3gcbdX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787780388; c=relaxed/simple;
	bh=855eqWcH4YPivVcM+qG3Qw3zigZnec8Y2quliEWcEi8=;
	h=From:MIME-Version:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JmDYjn5NR6Dr0S5TSYqdR56V5E5Wkj+rjDrquXRykIDHa5LIjuirZ+E4zdVO6+dTuh4JS6HJiV/UYEM98/S2Y31+nuq4saiZBXclny3BPkquE/sxf7wavxm75WTFCh9F9rPwBe4HQeuaW/EiGFxFRbv+QwRpK0ij94RK1f0bdDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g2hDI0Me; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g2hDI0Me"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-69fab5a852cso2464744a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:39:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787780385; cv=none;
        d=google.com; s=arc-20260327;
        b=ptQMfpt9/DTx2DVmOGmtgoZdaFKf18HDGgMjuv9G1gaN4xUi9tPN60NHoA8CYi+YRK
         AT52ouBiYDT57fFqZwMM7YCIUKnd8nDhytmfW7hWuiE5gd+I/1p02fBUhiHZDwDm1FJp
         CLoIX+SRPSmfBPobahfKUhaWiTrMXOnBdROkSG5Z4xs7q7gIChRUdQLpeXyPNSkhh6/9
         E4kgRK+d1gFRR5rUWxgdL0EbmlpChIlslb+Hwj7VuOGH/7AibRm3xPTLeJp88mKFOBwn
         u1hguU97KeQBmqxoRmwITd9Dndjw2Q8xlv0uiktSPVwk7uluuDaNRAklQwSBV366KewZ
         iN9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:mime-version
         :from:dkim-signature;
        bh=hKvrCasOCKT/DyEhWxJp6Xu43dSEy3m9PcOA3nYVyys=;
        fh=ZsZvsxANxdIpyf4OX7aHPacuXS72z4ayyl1A1SduyLY=;
        b=Dj6zII6yMvI7nvSdNdEGwJnSpo/56cdZ9TdJ9ZkGL5dwNhg1GF/dBqdnkMwZbgOnJo
         JZNKXjqrM9edQFn2Iu9v2e1lJrXNDvZWQn6J/a2dcs1JMc6ShItbJplX8uQLgUmZiskT
         zBkWfWj+R3HLU7/yQCa/VFKKnzV2ChXxFmgdbUt/YBUPzdrm0rdQRR0Vw5ovqh8dbO65
         25uKnMeYHX+HJng93Zafosymw6Kkt9Rnmv6NXya9cteUAVir8NKIq2M5DCpt3P1JjGE/
         fA/NDtglzwORGXAmV+37BscbczwLTBv5pYwfIjg8TcEj4dDuWWtOHfnuON5xOC0D7Hjg
         TCww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787780385; x=1788385185; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hKvrCasOCKT/DyEhWxJp6Xu43dSEy3m9PcOA3nYVyys=;
        b=g2hDI0MewJ+Eo5ywn/Lx9pm+1kEyGoVK7akbBb6aknxZhEw8asIH4PmqG/xdpMKHPY
         4AQP2FjjikSEE91dyo9KYq2Vv8YQ+XWtoGaPbHXYM54FQxY/npQYIan08+CzEq6euWfP
         RZszuxcabQMNoZgMnK0gYRJukPi6HbiJs9AbLuI0WAscqndhGdyZc4ejcrJzrrhrEkHM
         /2plcZu0s+nsmVDvYcJQYM4JQJZVnTtGmcuh09HEY7pe1COe3dU3ZP8U568RJPmTzR0V
         RIpuvnfH61G7F9WZRjr1VnshoyBnnZuhdpJ+b9yoWyVJ0kVId7H9tqEsFdfIoBtShF+G
         Gh9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787780385; x=1788385185;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hKvrCasOCKT/DyEhWxJp6Xu43dSEy3m9PcOA3nYVyys=;
        b=jvn7LBlrXShfL7UlzjvFmI5utf/7TlTPMuQNIuDj0iiy/EE9jpSAsq7NMUMEAv/WA1
         x1+R3I5XJqFAuyFze5qo8zU0+wYW4BXs76nOoV6XssDwwwwrLaVMR3xm3nRQAFohyRBu
         KtGKk3E7h4eUyPU4E0HKK8AOdsGvuPDp1isyFHJ4VmpC5VFGat+lpzffpTYzGf6d42cv
         VIQUfamFyHIJ/nvFwabSd8tXDt3r5JRrA0JphPg2Werd+x36YrsiMcZld6nheHmGMa7E
         CE8EbKqhYLBwMHWHL/INDvQ79Ux2vUM3QRbbbhI+EYzXnynueaGaL4sTEnQFiiHzSCwi
         hmAg==
X-Forwarded-Encrypted: i=1; AHgh+RrNnF+u7K4/aRoUNlTwq5Qi3JHKYu5BQCSY0k8WR+OhDw6fEvrFDBLtN/q3hfFTOSDTn2tcTvrtMm0Yrjs=@vger.kernel.org
X-Gm-Message-State: AFuF++m+MRG6zudoT6FfcEy9fZS6oDM9EdG47lQsBf6bp1iKqrr2QOku
	+zEfBXKZBncvHiLWj9pbjHUAlkDe818qsI2fLat6MipWjZfrxP0KNz/enqbtr8OZKfl9v8ONLhC
	6ykMsd7qn2tc+s6uGWUFZxOw2AApTPlg=
X-Gm-Gg: AR+sD11i/liB7FOxcTI4JHdXjF5yHu7lctcCJGE9g4S4FpCRF2/2YNXNBudD88zKRK8
	vJF7zZWNOZjSzNbBkXUkiLlDwIXJHk4ErlYTtJ8kQ0PVkkDmdxraY8D6AKoz35qjWEVMGvWVw25
	MCnzsCKbtN9tf6lZffCVd14A2+0eBpL/SEbuBZ95g9Tvzv9HrHJ6uvdmLeR7Jl+89VVpARe8CY4
	6ynQ0vzi9gMVUmNuF9p24FaSDc0gJ7YQvw9hPRHq8PE5UhbAjHpXzB8q3836Drq1l+9OAmtJP+9
	++kRwesm8YjfRsCmSMxXyXZxakdlZyHClJHVehrDa3c431pQ+VDaF1AKq9DE9OZ8i0SlGiv2gOi
	W
X-Received: by 2002:a05:6402:50c9:b0:6a1:28d8:2306 with SMTP id
 4fb4d7f45d1cf-6a5df5c688emr10352413a12.1.1787780385063; Wed, 26 Aug 2026
 14:39:45 -0700 (PDT)
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Aug 2026 16:39:44 -0500
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Aug 2026 16:39:44 -0500
From: Xinping Zhang <zhangxp1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAH=xXfFVAwQ3r_NdUDtmXhtg6Lw8kDWoNTzGL5oy4mwHMsJLJw@mail.gmail.com>
References: <CAH=xXfFVAwQ3r_NdUDtmXhtg6Lw8kDWoNTzGL5oy4mwHMsJLJw@mail.gmail.com>
Date: Wed, 26 Aug 2026 16:39:44 -0500
X-Gm-Features: AcwNN1WOHCzWgi6oQVYrqIg5x5GznlecK5ewJ3ew4weWTdxYqZzK2fCfuj1zNVg
Message-ID: <CAH=xXfE94eYwRAF=X16fuyV=bXm=MFvOf0bTpLDOT-5rZTDWCQ@mail.gmail.com>
Subject: [PATCH 2/5] f2fs: describe SIT block layout dynamically
To: linux-f2fs-devel@lists.sourceforge.net
Cc: jaegeuk@kernel.org, chao@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

An SIT block is a filesystem-block-sized array of SIT entries. A
fixed-length array makes the C structure describe a particular block size
rather than the on-disk layout.

Use a C flexible array member to model that dynamic layout, retaining the
entry count as an explicit filesystem geometry calculation. Unlike a
zero-length GNU array, this lets bounds sanitizers retain the runtime
extent. This is a layout-only change.

Signed-off-by: Kelvin Zhang <zhangxp1998@gmail.com>
---
 fs/f2fs/checkpoint.c    |  2 +-
 fs/f2fs/f2fs.h          |  3 +++
 fs/f2fs/segment.c       | 15 ++++++++-------
 fs/f2fs/segment.h       | 19 ++++++++++---------
 fs/f2fs/super.c         |  4 +++-
 include/linux/f2fs_fs.h |  9 ++++++---
 6 files changed, 31 insertions(+), 21 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 4b59f30ef45d..47c4a5c83a70 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -487,7 +487,7 @@ int f2fs_ra_meta_pages(struct f2fs_sb_info *sbi,
block_t start, int nrpages,
 				goto out;
 			/* get sit block addr */
 			fio.new_blkaddr = current_sit_addr(sbi,
-					blkno * SIT_ENTRY_PER_BLOCK);
+					blkno * SIT_ENTRY_PER_BLOCK(sbi));
 			break;
 		case META_SSA:
 		case META_CP:
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index a1f5f375045a..4423f899b2b5 100644
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
@@ -2249,6 +2250,8 @@ static inline struct f2fs_sb_info
*F2FS_F_SB(const struct folio *folio)
 	return F2FS_M_SB(folio->mapping);
 }

+#define SIT_ENTRY_PER_BLOCK(sbi)	((sbi)->sit_entries_per_block)
+
 static inline struct f2fs_super_block *F2FS_RAW_SUPER(struct f2fs_sb_info *sbi)
 {
 	return (struct f2fs_super_block *)(sbi->raw_super);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 56decf9c691c..8b8fbd5072b6 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4707,7 +4707,7 @@ static struct folio *get_next_sit_folio(struct
f2fs_sb_info *sbi,
 	seg_info_to_sit_folio(sbi, folio, start);

 	folio_mark_dirty(folio);
-	set_to_next_sit(sit_i, start);
+	set_to_next_sit(sbi, sit_i, start);

 	return folio;
 }
@@ -4746,10 +4746,11 @@ static void adjust_sit_entry_set(struct
sit_entry_set *ses,
 	list_move_tail(&ses->set_list, head);
 }

-static void add_sit_entry(unsigned int segno, struct list_head *head)
+static void add_sit_entry(struct f2fs_sb_info *sbi, unsigned int segno,
+		struct list_head *head)
 {
 	struct sit_entry_set *ses;
-	unsigned int start_segno = START_SEGNO(segno);
+	unsigned int start_segno = START_SEGNO(sbi, segno);

 	list_for_each_entry(ses, head, set_list) {
 		if (ses->start_segno == start_segno) {
@@ -4774,7 +4775,7 @@ static void add_sits_in_set(struct f2fs_sb_info *sbi)
 	unsigned int segno;

 	for_each_set_bit(segno, bitmap, MAIN_SEGS(sbi))
-		add_sit_entry(segno, set_list);
+		add_sit_entry(sbi, segno, set_list);
 }

 static void remove_sits_in_journal(struct f2fs_sb_info *sbi)
@@ -4792,7 +4793,7 @@ static void remove_sits_in_journal(struct
f2fs_sb_info *sbi)
 		dirtied = __mark_sit_entry_dirty(sbi, segno);

 		if (!dirtied)
-			add_sit_entry(segno, &SM_I(sbi)->sit_entry_set);
+			add_sit_entry(sbi, segno, &SM_I(sbi)->sit_entry_set);
 	}
 	update_sits_in_cursum(journal, -i);
 	up_write(&curseg->journal_rwsem);
@@ -4842,7 +4843,7 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info
*sbi, struct cp_control *cpc)
 		struct folio *folio = NULL;
 		struct f2fs_sit_block *raw_sit = NULL;
 		unsigned int start_segno = ses->start_segno;
-		unsigned int end = min(start_segno + SIT_ENTRY_PER_BLOCK,
+		unsigned int end = min(start_segno + SIT_ENTRY_PER_BLOCK(sbi),
 						(unsigned long)MAIN_SEGS(sbi));
 		unsigned int segno = start_segno;

@@ -5007,7 +5008,7 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
 	sit_i->written_valid_blocks = 0;
 	sit_i->bitmap_size = sit_bitmap_size;
 	sit_i->dirty_sentries = 0;
-	sit_i->sents_per_block = SIT_ENTRY_PER_BLOCK;
+	sit_i->sents_per_block = SIT_ENTRY_PER_BLOCK(sbi);
 	sit_i->elapsed_time = le64_to_cpu(sbi->ckpt->elapsed_time);
 	sit_i->mounted_time = ktime_get_boottime_seconds();
 	init_rwsem(&sit_i->sentry_lock);
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index db1079169a23..4f90f3bc2a7f 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -101,12 +101,12 @@ static inline void sanity_check_seg_type(struct
f2fs_sb_info *sbi,

 #define SIT_ENTRY_OFFSET(sit_i, segno)					\
 	((segno) % (sit_i)->sents_per_block)
-#define SIT_BLOCK_OFFSET(segno)					\
-	((segno) / SIT_ENTRY_PER_BLOCK)
-#define	START_SEGNO(segno)		\
-	(SIT_BLOCK_OFFSET(segno) * SIT_ENTRY_PER_BLOCK)
+#define SIT_BLOCK_OFFSET(sbi, segno)				\
+	((segno) / SIT_ENTRY_PER_BLOCK(sbi))
+#define	START_SEGNO(sbi, segno)		\
+	(SIT_BLOCK_OFFSET(sbi, segno) * SIT_ENTRY_PER_BLOCK(sbi))
 #define SIT_BLK_CNT(sbi)			\
-	DIV_ROUND_UP(MAIN_SEGS(sbi), SIT_ENTRY_PER_BLOCK)
+	DIV_ROUND_UP(MAIN_SEGS(sbi), SIT_ENTRY_PER_BLOCK(sbi))
 #define f2fs_bitmap_size(nr)			\
 	(BITS_TO_LONGS(nr) * sizeof(unsigned long))

@@ -423,7 +423,7 @@ static inline void seg_info_to_sit_folio(struct
f2fs_sb_info *sbi,
 	struct f2fs_sit_block *raw_sit;
 	struct seg_entry *se;
 	struct f2fs_sit_entry *rs;
-	unsigned int end = min(start + SIT_ENTRY_PER_BLOCK,
+	unsigned int end = min(start + SIT_ENTRY_PER_BLOCK(sbi),
 					(unsigned long)MAIN_SEGS(sbi));
 	int i;

@@ -868,7 +868,7 @@ static inline pgoff_t current_sit_addr(struct
f2fs_sb_info *sbi,
 						unsigned int start)
 {
 	struct sit_info *sit_i = SIT_I(sbi);
-	unsigned int offset = SIT_BLOCK_OFFSET(start);
+	unsigned int offset = SIT_BLOCK_OFFSET(sbi, start);
 	block_t blk_addr = sit_i->sit_base_addr + offset;

 	f2fs_bug_on(sbi, !valid_main_segno(sbi, start));
@@ -893,9 +893,10 @@ static inline pgoff_t next_sit_addr(struct
f2fs_sb_info *sbi,
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
index 3bdb0f891c35..f71a2b63f8ab 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4295,7 +4295,7 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
 		return 1;
 	}

-	sit_blk_cnt = DIV_ROUND_UP(main_segs, SIT_ENTRY_PER_BLOCK);
+	sit_blk_cnt = DIV_ROUND_UP(main_segs, SIT_ENTRY_PER_BLOCK(sbi));
 	if (sit_bitmap_size * 8 < sit_blk_cnt) {
 		f2fs_err(sbi, "Wrong bitmap size: sit: %u, sit_blk_cnt:%u",
 			 sit_bitmap_size, sit_blk_cnt);
@@ -4348,6 +4348,8 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 		le32_to_cpu(raw_super->log_sectors_per_block);
 	sbi->log_blocksize = le32_to_cpu(raw_super->log_blocksize);
 	sbi->blocksize = BIT(sbi->log_blocksize);
+	sbi->sit_entries_per_block = sbi->blocksize /
+		sizeof(struct f2fs_sit_entry);
 	sbi->log_blocks_per_seg = le32_to_cpu(raw_super->log_blocks_per_seg);
 	sbi->blocks_per_seg = BIT(sbi->log_blocks_per_seg);
 	sbi->segs_per_sec = le32_to_cpu(raw_super->segs_per_sec);
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index bb2b6cd5d507..324427cc29dc 100644
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
+	struct f2fs_sit_entry entries[];
 } __packed;

 /*
-- 
2.53.0
