Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BC83C09F9
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788195739; cv=pass; b=JIbq7a+9CiK+ps7aQCiB0X8rzJmcFG5Po3GKl9nxKfO1CX5U8qKjiLPcjI/CeA86FzLHHI9T0vHzVjv7kDrf9V54L4g16h+xTYYC7KOimPVc49sTbaU7ciDExFLuhtfB5zm8r3BRd21kiAJPt/Uhqh+aFbdKs9NGCKvWgWu9hTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788195739; c=relaxed/simple;
	bh=pvom9wpZ3/z2OhDUW+XEe4+6ntpBvNublIR31n2nVPI=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qe0bsjcU/OJFSPfzCge/SbRgs6FXoy4gfuB8bND0leGB/0ocpEGZQ1XOMjvE9qi70SZefm/vw2Gy7gBgNVJn7Dbbeltvh2jvCFaQDSlStXCZ05RkAV4ZQpW0s0+i9eJWIDxS2GTwun0L7sZ2z4/EFfGHjPj5n4JsZ10gXAp4CKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IY641BZS; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IY641BZS"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a374bea882so5942860a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:02:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788195736; cv=none;
        d=google.com; s=arc-20260327;
        b=i3GizmHeKBn1WbmSe3on5blP24kIXD6+qyaGRmlrr2PKW2cf0GqVo9QxMgKOMPX/Bu
         scdOg0RUKse1VRDJpfYuZzoyi8OrK2dgkt4dJeKWQHsl4N8M2207IhkQCdIvgAatq5jB
         zhIoWdbas6UEMlphaauiKUA6hbCVL/jlEYS30DIgQZ0AGrLoxhHB9OZPq8ynZ+wigZyB
         8fyjncrHsmoyKXdEaPHNV/AfTkY7yg3fTEsg1sB6So6qKzrcqpDlCk7QwVV/LjizMS/N
         U1OAsjV1y6IjKzv0VFLgFzGH8J2x4UaWx3/YEy419DKUXCyEXcz/54kcKZ6JJPJvM9fD
         zskA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=J/1FY9WSB5RX6nf65O/jeitFs0+eIMznWlZ+J5l85Tg=;
        fh=v4bZG1to42TeieoGEcOcQTPMMyBhFxDIgnVI0mJ5Mqk=;
        b=RpaD4sH8YXUBUbY8C6koNPidbUqcS1JjQKUXq1XuKGOORTicDvrWsfggGpLmA3MRI/
         QTtmZcQMYtzY4WSE1wIMnkn1tuCukaSBCXJxTEwo6qu3aFZZNA1xVN2BYEda7c8Wv+il
         f3KUL1XtR5A1iItDN+nuz0sha52AiJta1SK3xpy8ocwOV3mWoquzvFHadJxncQebwfDW
         CUdfBtGkIcoHH9RtkM6DJBxW0x/dY5DCE+MFJi8GRk+PR8HaXAsgVznjb8QLFiR1gIuN
         RccVkcc5bCgmieBPPR8jctFpZYBJuXFWzniC6Sj1M3tf6n5fTGzSqLqW7gQeUErTCDwn
         qcAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788195736; x=1788800536; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J/1FY9WSB5RX6nf65O/jeitFs0+eIMznWlZ+J5l85Tg=;
        b=IY641BZS/pAifeyt/sGyL02OvOAJL3RHRsCLrdroIIxst4TWlsR2z8QCm6dYZVUzgp
         yHBa9Fs99ITZVjUtyHrpcFGhnaiEtyLyH7lHz1ueMAzgPjSVUfMq/tADJd6O2xhBAID8
         Oo6Pog1tk39wIhqNCUzu2gsQycpgqoS/DpW4XFDNfgufxQl4zWnRfekjpsu6jf/2+OsX
         exbdOmLtkW5ZARJPZyOGGbSo+Mk3yaMCTzgYGAKpcECm/N/i4NhkcUOvWGVflVW0XTlJ
         C31wknB1Rtr0MbdZsxHE7eM6S7YZhvkTZ2HgDKl++jdqgzLqlmwjXWw4sH3HI909gJUB
         B9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788195736; x=1788800536;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J/1FY9WSB5RX6nf65O/jeitFs0+eIMznWlZ+J5l85Tg=;
        b=RE5T16lJ0Tk847Q4HWZfR+cgyAPFZQ1qOjk8njg0ttO/alw2O7+13x+HjMTZO0U/Kx
         x3JpWkqO6scCJob00Oh+QoVWMvRbM07duHOCw6n2x9TCvCkzK0lKbHN5iiJ/7LpqkiiF
         aM1KPcC5SGbcYoY8j9rwqBGCJ75Fgt38haJtzPEUiHnNwltcH9DyGfuZmp9xA7J1/l+u
         xoEPh/FDw5bXaUQdRx4XjdyALOhb4Uyn9wKIzzysU0KHvwL5sbLzf8dH5zg/YguZeYM9
         SeXUZK3XWRG8sxWqHqBXMG54pP3g2OHeITAtgj/DWIIAx5yfk3ZuJXx16Cmgk2oFT00f
         gmoA==
X-Forwarded-Encrypted: i=1; AKwUvBwtGA2JCYLtdqpCN9W/IKYgW9P/r1UPNNHqyzC14mbeFra4kPEje+twb04gAv1p1Zig19qnflozDEst42g=@vger.kernel.org
X-Gm-Message-State: AFuF++k9RCyjjDMB4PUn1C+Rq662VFpq8WHIe8Z1CQxjX8kpOyWj20ye
	PLFOxqvQtKxAKK0x1F0aMsActcqDzucjZlio843R92qQuWyzk7A2CCqHkOqfcj2wnQ2xLQXmhNP
	4e2awkqrbXJ9nPgcsc5/p3tZxis96Zik=
X-Gm-Gg: AYBFou2B7JkS41SgufnrHYaSU0LOuRQZCkRUorqsfh116P0WNTImxQ8cXtCmeZVD8P8
	YcU7MuIrZasVZXiCsZSvhQwuQUR90oA1sCelMTP0+zx1/bxaLl7m3A5iZVZP1Ao5vFbFNcfKFBh
	P5LQqZlIEcmmBHLfm3hYpnxQw8wEpnaoa+9t2YaXNad81zGbf59+RQFnmhKNtAbElegCfDr1/S8
	6VG1Gnh3Zxy/hOrvAExvc41kSsujGrFnn8h/xqNkMQzRuW6Vow4VDpkmdj6Ol7tLdfamSCXy9x9
	+N59Zmgdo5g9ZEVpdtdFRpx8CakT9TuVuvgm6d0hfckWzFWkxkZl9U1IAB4pOSzX+0rV8KHv97M
	gIwcuJbD/FXeo
X-Received: by 2002:a05:6402:278d:b0:6a6:8dd:c76b with SMTP id
 4fb4d7f45d1cf-6a663a269d3mr1670537a12.1.1788195735434; Mon, 31 Aug 2026
 10:02:15 -0700 (PDT)
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Aug 2026 12:02:14 -0500
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Aug 2026 12:02:14 -0500
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
Date: Mon, 31 Aug 2026 12:02:14 -0500
X-Gm-Features: AcwNN1WSECiwVY763Ga0thxv79wadvKdrrnS0Ts8sE7WMy-ldPUACmEBL-gUqzU
Message-ID: <CAH=xXfGSVMXtisf7MEi_nepOvC2rJQZcjsv-FxWEGOeLQuhWUA@mail.gmail.com>
Subject: [PATCH v4 02/11] f2fs: describe SIT block layout dynamically
To: linux-f2fs-devel@lists.sourceforge.net
Cc: jaegeuk@kernel.org, chao@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

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
@@ -2251,6 +2252,8 @@ static inline struct f2fs_sb_info
*F2FS_F_SB(const struct folio *folio)
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
@@ -4708,7 +4708,7 @@ static struct folio *get_next_sit_folio(struct
f2fs_sb_info *sbi,
 	seg_info_to_sit_folio(sbi, folio, start);

 	folio_mark_dirty(folio);
-	set_to_next_sit(sit_i, start);
+	set_to_next_sit(sbi, sit_i, start);

 	return folio;
 }
@@ -4747,10 +4747,11 @@ static void adjust_sit_entry_set(struct
sit_entry_set *ses,
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
@@ -4793,7 +4794,7 @@ static void remove_sits_in_journal(struct
f2fs_sb_info *sbi)
 		dirtied = __mark_sit_entry_dirty(sbi, segno);

 		if (!dirtied)
-			add_sit_entry(segno, &SM_I(sbi)->sit_entry_set);
+			add_sit_entry(sbi, segno, &SM_I(sbi)->sit_entry_set);
 	}
 	update_sits_in_cursum(journal, -i);
 	up_write(&curseg->journal_rwsem);
@@ -4843,7 +4844,7 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info
*sbi, struct cp_control *cpc)
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
@@ -102,12 +102,15 @@ static inline void sanity_check_seg_type(struct
f2fs_sb_info *sbi,

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

@@ -424,7 +427,7 @@ static inline void seg_info_to_sit_folio(struct
f2fs_sb_info *sbi,
 	struct f2fs_sit_block *raw_sit;
 	struct seg_entry *se;
 	struct f2fs_sit_entry *rs;
-	unsigned int end = min(start + SIT_ENTRY_PER_BLOCK,
+	unsigned int end = min(start + SIT_ENTRY_PER_BLOCK(sbi),
 					(unsigned long)MAIN_SEGS(sbi));
 	int i;

@@ -869,7 +872,7 @@ static inline pgoff_t current_sit_addr(struct
f2fs_sb_info *sbi,
 						unsigned int start)
 {
 	struct sit_info *sit_i = SIT_I(sbi);
-	unsigned int offset = SIT_BLOCK_OFFSET(start);
+	unsigned int offset = SIT_BLOCK_OFFSET(sbi, start);
 	block_t blk_addr = sit_i->sit_base_addr + offset;

 	f2fs_bug_on(sbi, !valid_main_segno(sbi, start));
@@ -894,9 +897,10 @@ static inline pgoff_t next_sit_addr(struct
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
