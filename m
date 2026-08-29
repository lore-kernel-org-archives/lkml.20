Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733703C1D7E
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 17:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788025774; cv=pass; b=QNs7VJhEVPlQVcQIbrqcnCC4dcebZlQ7hGO98Qf5psz5Dk1SuIjqDg86HJDAmfL24iSPdirGHCg2gtEjyal7txNmiccSEsorrArsRQqnbPcp+iVVPyVGaTCJSG5AOw8wa+kP1uWbUqAQn4zEYrlRpRV2Zy7rsTgSy/OUZUsZxjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788025774; c=relaxed/simple;
	bh=r0v2qLVA45ejU6Mcv+SBEG2gRp093CccgMQOsUqf41U=;
	h=From:MIME-Version:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hi5wR5Bca+A8jBtWY6E0zFaxIlS6yV0RyGjG3vOqT4SjCu+YWtVV6H+LzkjzbrXABiGdm0A4tZqKpD0lntnZxEG2jT4C556sp07NfKwrMlrw1DX5hkeJ4gEXsH3VlqcWjfhETEnRksTfjGV8m6nwRD0jf3CQwKwsOfGu4KFTl0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O6gky+ur; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O6gky+ur"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a5ebf75d62so3384613a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 10:49:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788025770; cv=none;
        d=google.com; s=arc-20260327;
        b=jNGOjEi3FhSfccJzM65MIXQ0izskDKecDNRU9VHSVtIdCHVe+/xzbgFRRgrA6TWZe8
         JXLxF8AgwcLGz+yHk8P4yKbs1ynWAehQbwZkeZmIiRl8xnP3I+apU/1ZQAS+tephOo+l
         6xME0WeADh5P0EHC9NC0HxLxsKp1/SfrB425hM7oZkO2VwaFlPRMxd0LI+6gt6u3JySg
         bONUuLPTkY7WGBtvwfAYWzKmfFA/QptxfnDb2B5CggXRfwmCX4/joXS3CBDudsgKFlyc
         t11hhe9PAOa3+owr2ejIILxm+It/3VOhRBJpGSoo3lYRyy13IFvZJs3d008+HlXJBZ11
         N5vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:mime-version
         :from:dkim-signature;
        bh=1PGNBERIFh7FINjz/8gxnQ2rKaXI0tkVBejh+rpGguo=;
        fh=4NDAyFzx7RgtW8d2uUfdmVEmorQ+Emgj1PjmE64LtO4=;
        b=h9Vg/lm6mrLynFEZxUxPFzurhVmf9k+WhTV+8FEPdR7lwiAWwvUipygTft/ypU0ulI
         ooZGxZOzq7rF9NXNtVM/gf77hR7G1EFEM+CWxc8MAStaEXxgW1x77xDxWXmkIvebxVP/
         MFxAY7fssooMyWDPrnoPy9t8CDPHLltRIJ8egXMoWV65MFLNynuiAy2bWrHLSOx0Mjbd
         vIMRQaQlvM9KgfSH4CDSepkBA+sE4HEVsUcSGqbuKK59C5eqwHEWWg32L3OI+yCtmu8g
         R9oyRb0YpZA+uO3LGokAN02eW5DDWwRjXu0wqCqhpnj87MHDA92s71mi4w+CHznbG45e
         +lsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788025770; x=1788630570; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1PGNBERIFh7FINjz/8gxnQ2rKaXI0tkVBejh+rpGguo=;
        b=O6gky+uruXELsE7c0BG39aalHn1lL4amTNhXJ3wGe7orQBVWe+iwPhQV4fU3E/q+Bw
         y/zsbsepsWU+F5yRGK1dZPvRBP4xpZ1BlFQlBMehuIHUwmWxWYMnWnNj6676i+KDsve+
         eqFuxgFKeCeWuASizCRmwGU4rpTliyNDBErr8IFwjLoyzb0FhMx0v00LDzpf2MP6lqa1
         Gm3M6OcJOAbmGtxE+4SFeqKTi+6uwjk/lFBxcoQQtlz0f+4UKPejHS4J8ByaFsShf2wG
         gEM9tVjoof7QDio5jxFDYM1zRQJ34ApHTx6suvpAVECD30hOBEbXtY8bEtEqPX7x1SWe
         jscQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788025770; x=1788630570;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1PGNBERIFh7FINjz/8gxnQ2rKaXI0tkVBejh+rpGguo=;
        b=hm7dIOTOMOh30dSyrlf9bR7Z/lhLs65FRU2UoTDPtulZKsX9/obAu/xYXu7Lo8YPyz
         pe0VImmU3X4yvw3nHarb65FR0Ii+0hXvH0E/KpLhfpPSIs2ecoHovY08RHDXnkHlNr2S
         objGrYNd7ZWLm+rK5l1ctHyJw080pLhlg4ZqnmMbVeLvQ9B/rqhV5FijHax6HGG7ZZpP
         1K6yfhbxZP5kld0GAqxe/vaSTgHCOgcLU5YvK/+Y/zS7xs7YLtXIgwh91YxBy4ZyyqE0
         puqMlFITEieU6Qfb+LLkGlKw6zIFgcaW2MDEkKF1tIwM85/9wfHQ0NVGM/gajis2TpYu
         Y9Tw==
X-Forwarded-Encrypted: i=1; AKwUvBwEZT2fP1fqLD8SPMmyr0bgnYyvsMkZ3DNCcSFCDZZuz8X1FWkUTBNTaWT3lr0hdiL6azI8yEZoe0dYr+s=@vger.kernel.org
X-Gm-Message-State: AFuF++nEXGxeZVGFkYPwp/7BncAgsj28iReX5Ld0PS2DriFRT3UbcALW
	iRVk/A2spJb+b+dsrLdLc7adi8093Y6GVZAbZ78CG2/SJQPAVFfqEeFlEwJkqE6psifwOw151cV
	4tEQUOd+zdGmwjEefPN7LXpSQt0Lwa3at87NkAYg=
X-Gm-Gg: AYBFou36jIli6PlxUMo2yB4Ow9Y8VSFSW/yT5PXhkEn67wTCzVjrjqSwCUgih/SGxes
	6D5eRpRNrmrhkbFS8OKQn+OUuI3FKGVdvijO87yjk0QuUzAQac8siByT1nAJbfwyYACExlqs1Td
	WulKYvOZqwUVTnMfmLprmHZ6FxBj7E231IiBYL/KRRDdv7tfQQxChRd0KcSHDzqMKzWjDb9uE1C
	AfaqhYIRXSt4/69ud36iZXrqnm9PGdJyecBMm2O8CN+eQ8b5MgTAptL8FxasK7dcVYqzUsVZ+ji
	VZU3u8mZdlsTna+KQJ3AZTs+HoamEJwgy1K/S0j8pt1fou/FAAF0pOmAKZv2gg6kBfSvMacA1Jq
	HUw==
X-Received: by 2002:a05:6402:a542:10b0:6a6:3cd3:5b3e with SMTP id
 4fb4d7f45d1cf-6a63cd35d52mr467998a12.9.1788025770210; Sat, 29 Aug 2026
 10:49:30 -0700 (PDT)
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 29 Aug 2026 10:49:29 -0700
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 29 Aug 2026 10:49:29 -0700
From: Xinping Zhang <zhangxp1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAH=xXfHWW_J92z3YgvoLSx8+z6rekq=p2kiP15KE9=2+Ju2RjQ@mail.gmail.com>
References: <CAH=xXfHWW_J92z3YgvoLSx8+z6rekq=p2kiP15KE9=2+Ju2RjQ@mail.gmail.com>
Date: Sat, 29 Aug 2026 10:49:29 -0700
X-Gm-Features: AcwNN1VEyXRdbHI7VVDIkffdg0D0dN22iMO3iab382RITqHnb-dE4tungRPHqi0
Message-ID: <CAH=xXfEi4fwuFCKpECi=x9rpxTdFjkCmD4gYqvLd7R7U2qmMpw@mail.gmail.com>
Subject: [PATCH v2 04/11] f2fs: describe orphan block layout dynamically
To: linux-f2fs-devel@lists.sourceforge.net
Cc: jaegeuk@kernel.org, chao@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

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
@@ -2255,6 +2256,17 @@ static inline struct f2fs_sb_info
*F2FS_F_SB(const struct folio *folio)

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
index 4a6161c8a9a5..d4b4d6b7ad42 100644
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
