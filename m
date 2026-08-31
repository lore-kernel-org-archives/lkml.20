Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581903C2786
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788195740; cv=pass; b=d+Su1Epjrhm0XDDAF6OP/kIH/86xPDV0k8KVpeIJRrnoDBmsU8dDwHNUuY3GQm57feZRMax67PS7MUUNgU3rwFxJHunXKEuSZZLtMFAuz9meG2Y6KcQIEx+rGeH74R2Ti2uW+ph/SlnVaaSe2YvqBcyCZQIJIvYpTzDy/xG41O0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788195740; c=relaxed/simple;
	bh=z+M7LrnY+HVkAAU9PoFTvmt0wxh6P3hPrurjqyUZQiQ=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TSXsrDqRfYI3ubOVHH6PLLq1TknNUwFhweP23a8g2ZpLqpUjM2xvGrDInon84HUqYRjf8EKLHaU0VLQh/YoH0W5PThx4mT4yXoEYCQRJkHNQhH5jmTVwIgEt/zIIeg+bG6m5XNu3t8rTO4Ik+fsBKmvjb4dlrQuerbdOQq0Zfhc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BFY1vQtV; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BFY1vQtV"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a623987d32so4035658a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:02:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788195736; cv=none;
        d=google.com; s=arc-20260327;
        b=DXgpyTsM+iHtTXnan/jAs0Ff/HAtFacJrDU+HxO2TQaGBDZ62qvFZK4kJ/xtwhJWWH
         WQ6Jk34fcfWdYaaFmqlsAKaeMuJ0DHJDjFByPgigK3etDhEt2NNZo9tq30ek/ONp401m
         ludKGigjymlo+sdCV7YGZLxz2jZy9M5yHaFS96fz+fkCp+okpoAY4iEJGJxllmmddW9c
         ZeWnxXAZ/MI6R1+vE8gY1XdGibjf41ACPCcnepsdLjRiuq4avn5MX2PxCXHdRNh/H7dS
         YCd+bcGrDe418g+b6l+C/gURWCTj4abcgLcTZWUWdf4ZGODSp6KweKpj8k3JnUgqBGA+
         HL+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=al32+VJq1jKIId9SnUJ76zOfT5qUXNEzgzuggBSWSDk=;
        fh=SKVk4uqvAIhJGqQjdleQ3NP5bN91BmRXICOrtmm0a3o=;
        b=ZmyEzGqrzMbZEVVIkmdSb8LZ6X+2DP3olX4qUXg0xtaPn7yOKpKSFicgv5G10rTZy/
         rIOkTKOMAvplR59eU9Yl64rv6Xh0Lj2desKqMiVTIumt8apjrdEe9n8TUzfmQeX2OaTa
         LVvwT6l738t9AiVYdqTSx3AuoJ2P1ou5n/nrK3s3rOtMktmivMfIZRMQpdRsazcGcqud
         ZTH3fyYPCp2OW5DgjVx1OQyWvg1Fuc9b2KX6KjzCxHKTDXRoBkYOLTqhnCE7Qnl/l1Op
         2tSA1BdqeEKEDVo5H7AZDxMX3NYkSZhb/jV1gMyfMh6mVInPAxpcBlWi7olB8e8QwkYi
         1dlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788195736; x=1788800536; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=al32+VJq1jKIId9SnUJ76zOfT5qUXNEzgzuggBSWSDk=;
        b=BFY1vQtVMgrofLD8oaYJH2Ayzx9wbFV9GRRqE9D3incSOyyVi+1668NE28rzo75QlA
         bEdo/3YqtUDtTriDRHVaOWbsynGEO8THKDsAy/k2x0MLlztb70iQu4XprANQoR93XtYm
         0TBt3stOJSimiKeDNURFubeUnIMwYkKw+xc6wK5qeOT1tE1em+w5BOvjHv0HMrVm8PXP
         NzI4CD2S+cEFWxQAx/ExvLSPUyu0HneO3Yk4ccNkqxKbxoKxPcQ6B7+yBvNzc6SUt7Op
         wJNGL9QcWOz+xEhdRCy9WqSoxoAQKy5oTyev1JmRep5y3nWiOEJmfTPuOyYLndqsy9eI
         syiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788195736; x=1788800536;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=al32+VJq1jKIId9SnUJ76zOfT5qUXNEzgzuggBSWSDk=;
        b=pV+hRUukml5vJCr4GUuAPvMprFSB/OdUKhWVLvEmG+IpL1eQ+mdKOBsrpUyKzwfpfu
         W9+XZCym+vOlsq8b2R93MDe4Tnv9BVLkIrwzwnRR3qkP6Eue3ygiNtdZok6l6ebfUWzG
         eXSonu0ck6w9SCvx0Hfb2ZXBCg/I7wiYRGJsHRNH5ud8T9lnBQ7el8ogBYOE+QzCCeKi
         aDqj1MXHddZOhhbvXYfNoVXrkal6pxE5hP9FGwua6DJ1YqqDwSeJgmvpaBGqHHHQeVuY
         zixntKZ1tHba7HILHWpKw5tuckKVlaHW6PSfwT7DjoKR9pbrf8SQVEU2d3gKYvvJvt1D
         ehhw==
X-Forwarded-Encrypted: i=1; AKwUvBwwj1ch+oAsiIHgGrYO4Ibohd1fNuXqTvxR6pMfA+zYk1GpLbbEKGUtwYHdVSD918IFziW4OIAKjVNWfpg=@vger.kernel.org
X-Gm-Message-State: AFuF++lwRKQOmPg+11cqrbHwYmthk4LOxQ3cWWSYTJbGjg4rdc/fZTGb
	tIvtVwBJ4dnwrX3PPbApsLpY9w5bLtT2b75Ac2MhX1BQf66f/BtCZ7iocXve2gC62OEVgCd6yLn
	8iacheetRc87wJJFqo7rgo9pr+Obc05U=
X-Gm-Gg: AYBFou3tK8ec+ydKo/crXTOFz6r8s5aJYo5LwFl9+h2q1EPXgOdigeQRpNKEEmqq035
	RbyLtEimYlMK7DRMCTQoUBldgXPh3vqyvRPaKfB+iMz8OP0vkCALIYXtUTqV6w4AHWJ3dh2eFQw
	JGnZhDJCKmoi6NsUME2Ik7GOaC2DgScbObQMw2i0Hv1K7PUtIxKM6NXyK2iZ7HwqscQRgRPFSNa
	Ssi+15BIdF5KwHi8qxMKhPsKCf/Dx4XAXY01+MtSz+yImU1DpuYKqIgvn/2GAu7iRvJEV7IPoID
	TB7L1/ED3t2Ja9K+xnsElTCvpVExtTex2750j5LqLsgf6V5GOZ0Q41/pwewPioTIRzLDZ626/Od
	0VA==
X-Received: by 2002:a05:6402:5415:b0:6a6:32f5:5571 with SMTP id
 4fb4d7f45d1cf-6a632f55688mr9706494a12.19.1788195736433; Mon, 31 Aug 2026
 10:02:16 -0700 (PDT)
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Aug 2026 17:02:15 +0000
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Aug 2026 17:02:15 +0000
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
Date: Mon, 31 Aug 2026 17:02:15 +0000
X-Gm-Features: AcwNN1Xo6H-uO2HrQRheoq_LVY4bt4BD3XjEvBUhRbGRQxZl2EM3It9QmOP4MUU
Message-ID: <CAH=xXfFDryNFDYiCXuMcgoCUnDfK7XQmKLC9MOLPp0hdh=7XYA@mail.gmail.com>
Subject: [PATCH v4 04/11] f2fs: describe orphan block layout dynamically
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
