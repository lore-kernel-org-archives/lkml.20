Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F63C3F65F6
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 17:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788025773; cv=pass; b=FL5FsdqgC7x/Ewaol7yJjLvh8PuKyF+O2blu/Qt+qgsTXlxBgj748vGkXxR4LFQ7DemwcO0vLVG9tI9dXl8IA/+ZaKYPUkPObU/nMXtF9mzg9a51LP7FY8zBW1/9x8h4w9/JlMHzUkU2sL5eNLyFEO/ECIsA16LOzlveeWOXldc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788025773; c=relaxed/simple;
	bh=W+u8cbJhhlKw/VhK0FHq0iqIKcKksjB8EvmRwnn8bqs=;
	h=From:MIME-Version:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dq1fS+oCD+heVBd02CYwLe1PBhB6cFAFCKHC/S96FtY6AtjAoHWZmAw1vUkfv37fwY7wONXpCFsVGcH5njNnZmtVDDJHtgLh2Aq2/PkX+fMm9Py1Zxgfdw37mxDyl3EiXC13xiSm7H56HYoKjtKStkaqVS+phuDcfg+rnVdm73U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bquTWgHB; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bquTWgHB"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-69c600f76ccso2692703a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 10:49:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788025769; cv=none;
        d=google.com; s=arc-20260327;
        b=FlXbpHYAwVRPtxj8c1B6BIDgUFllZJcA2Cr+jTe41mnKUttxHzjy8qOlZwksohWzq3
         p//61Zg3rAxADflDsB6MuaTvcwKByw25i1NRrGCpI8RM7N/T2TKGDeaXf2kAXqmEVTN7
         qefPa/7s2YF9FRLvMBXOrVYMwyScfGuH+ApJqZRLaYBdqh1KJhdm+coavg3X+QrBpC+l
         4nzavlywWAZSMIabz7ovOSDTbZVbJt2XO5wL9JQkb29gtCBN+Bwl2v9UhPtu5SGXY8/x
         mUXRGdpjCI12Mv5Tn4mnwHN4d/M09VcgtGThXKduvr8HlbY4V1M33ZtBtOeDb/IEPQ/z
         eTfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:mime-version
         :from:dkim-signature;
        bh=CDNAuQ1kvARivt3maJXFM2kukD8tD7kPodxQeS73Ko0=;
        fh=9KGoHil4Fhv9cNRJMswwayh4gL6HSaO2Xf+88Gn88UU=;
        b=WHp0nWR3fXhPa2u+1brm51atha/RKXwFtqLFdxLly7yZVGgueTLRiGLlsm6XwcltGS
         gVDROqR9ofIXxjvt6vAJdNh/QRkp0DcEvh+EU0w4JkKYozCO3cGxRSuQ0RE6AoLdrdeC
         cLWSyl/dWJwmgs7UBz4LJEJtr0TBesNJAscVxVzG4m3ezfL9enkNCUKlzy9nIw2ctxxI
         YXeUdo74eFyJZAy8jlgfqiJgBN0vmgreAxC6bIUtdzPSnFj/vsQmm50grLONyRBOKoe7
         g2lhn7seNvPngPHjYTAhx9KrGIrx1Oe9dzWpe+BMm4Ts4Sc3PGAOd4sNu2BKjfDohYjp
         xD7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788025769; x=1788630569; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CDNAuQ1kvARivt3maJXFM2kukD8tD7kPodxQeS73Ko0=;
        b=bquTWgHB+y3ygusL/ni0GmyZy2k7fbyYpvE3n5Ilh6EIRG3e08+X8JcluX8PG0lN7f
         0LMKn3+RVuOdEeSumEKzhcpDbgOcfdwRPHg6ki5n1r1vGgHKaTxqwVKEv4U2cgPCsB5g
         DKSYvL+73mUZ41XxLXOP+oCIqtiJMpDN7sQe9m5bSXW3Kmb6Bo/q96+OBa58pLOAP+o6
         b+9443n9dwtSLEZl+c1X0hWNfj1vglRdcWokdA/LRerib1K3PWNZ5/Jveo5LR0DzO9Mt
         zcVFWLdAy9GYeRDO3gZaAsux/TCSydNYEZPyUvzpccP0/HGZDn28vReKb0jYT/Wl/1XD
         251g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788025769; x=1788630569;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CDNAuQ1kvARivt3maJXFM2kukD8tD7kPodxQeS73Ko0=;
        b=TjOIHcyGv1HdZeSsytDds1Pg/NP9NJmWwSmzlsmxJAZYPYsabJQsE19r0OEMwiHwMv
         s8DFaUdL60ek8O7JUf4qwEvrToItJVzeUa56IlJaJVBA/jjBPTJfTeD6Usu5lePT4bML
         Q/peZdsK98Le4COeuyX9m8RMbHvvjDXiIz9clDzlGUsq9/0M0ioDbjL0qGPMUIur6tS+
         F/bE71KrWLLXeLSyARkoC0GzNK8Y9Jk7nUjOybBDH/YuwVZ9OZAhfbKeO5kbLAilUG7I
         dcVNjbl8uKLpSG7ltAId0d/+oh18YgWP2CHoATZOZWIg7LBR7Z63GPvgbZlWM1FdJWxd
         WrxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEzV7X95bBR1y9OS53b0VobFN1sQsF5rhGMZyPci6Ayw2+n/WtJtMfzrERkON0oyzFzEFflFX0pwrOSCs=@vger.kernel.org
X-Gm-Message-State: AFuF++ljrFrG8rigr4Qvvqm6FbszpC9Kmcx89hyWjaXajB5od4erEoO2
	II424sLlNP1PT8SMt+G06/abj+J9QJFNgQkYJx4Ina4Vzct/y53uSlnhIxJpgVZCO2hI6x/p0k3
	Cm2fbmXDDQk0SvkgqPGv9FMGKlzO8qyM=
X-Gm-Gg: AYBFou30uEzuyV/W4X5HJ8vdjL53KLnfl49ZGHD1VX07FoJsJLlSo0RoY6O/VnXrz8h
	KesgzWQS7ma4XaX8Bz1HgFDryAnl+ue05JVtsoS8bDRfv+6hQ7wmiUWDmssWTbHWIqde2lOnKYs
	9EB6YPVNVE2w55VGIuvV3Oqa3XlfBku1mFvyQINicmPJVzgePL+iJiTXLuf0rCBlYUHy3u/lNkZ
	0Udtk6Bi0WlWeddweL1HqfwruG1npDpjv3zoZ+BIw7GeC12yjd6MseSiV4rVUMbc/d+TU648VlI
	bhxOUMm4arkB0UERvHAfQA67Re4OgTVXufr2uCtuXB6lKj0WV44SzBc3bbuGFhZOmaHAyGgtdeY
	8ulJGLwgq6Sa+
X-Received: by 2002:a05:6402:510f:b0:6a0:9c84:ce0e with SMTP id
 4fb4d7f45d1cf-6a60d3c6ff5mr9739115a12.14.1788025768872; Sat, 29 Aug 2026
 10:49:28 -0700 (PDT)
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 29 Aug 2026 10:49:27 -0700
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 29 Aug 2026 10:49:27 -0700
From: Xinping Zhang <zhangxp1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAH=xXfHWW_J92z3YgvoLSx8+z6rekq=p2kiP15KE9=2+Ju2RjQ@mail.gmail.com>
References: <CAH=xXfHWW_J92z3YgvoLSx8+z6rekq=p2kiP15KE9=2+Ju2RjQ@mail.gmail.com>
Date: Sat, 29 Aug 2026 10:49:27 -0700
X-Gm-Features: AcwNN1UtaWo5RFBz8_YUtnUMZmiqc4PMrU4bd1rdJLB76IQD6dqlVnRejvHYQMg
Message-ID: <CAH=xXfFgcYQOegSYqeov+0zPXh=nKw3Uts+5b5eQM6ns1saSeA@mail.gmail.com>
Subject: [PATCH v2 02/11] f2fs: describe SIT block layout dynamically
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
