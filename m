Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181543A4F58
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788154386; cv=pass; b=WEXVANNor1JemdTrcyawN1dLRaRzYnhHJWiVFq/9UJnIS6t+l+QLrMAx7HqqtMMllxVSLV069ANWNZ4wM4tg09klSNaQdtJ1pw9h/x2P/1ITyK+kaMnoM43jwMrbvZNbi9oMgnvCCzbmk9HFrf7li0yHNSuWrMbjyytbDg/y7q8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788154386; c=relaxed/simple;
	bh=z+M7LrnY+HVkAAU9PoFTvmt0wxh6P3hPrurjqyUZQiQ=;
	h=From:MIME-Version:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jWnUcJOTDBe5MRtN5qwlgUF9wESOHIgRu5fYidaCHnBqp6zp+fV7CskeHsqekw1Jqt3B7nEDkgAbFOMmOqEOPpb9NsXC0u1CTozOsab2bQQT+K0RnXHwIIL1pRW838dy9X0dEjuyjWRa1NpCPVlCAJvybZA7tB8qiBxhH1znS2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fsVfaiYT; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fsVfaiYT"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a38098734bso5070659a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 22:33:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788154383; cv=none;
        d=google.com; s=arc-20260327;
        b=DFRpph06k9Pqu+LCJ60Uw5UwxK+PDtM9KJ7gSG/+/NK2wwZkHBXtDtqGMlurlwMtox
         ELoKJnimQX49ObXuwzTKlOfoLa7P5fuF1VEjwdnqJ8pP1s0KKf0OZVMODk3EeJ67i4h6
         tVpD4IURDNziFc53+Pv9G2Kq9KDiw8BAulyTsYrbD16jZsuPKAt+RrEqr5QumrzgpNOl
         5c1P+bRApkrqTITGmYYRNYXGz595ydH7XBYo2S9RHOgW3r8ukB5uf2YbbPMKr5DC07YL
         Z+9we4Axn6yMvx1EKtMlBF59Nnik1qKsKLFwIAeY6z9228G595q7byuMqK3XVyWHAF5Z
         LMqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:mime-version
         :from:dkim-signature;
        bh=al32+VJq1jKIId9SnUJ76zOfT5qUXNEzgzuggBSWSDk=;
        fh=rmHYSks1nOCtp3LWXCQsBO08KCxNS/LRbr6AgdVf5s0=;
        b=LBlzd5ArfQFG2DsEDCOGd+eMotQRp0z0Bdi+fy5dh6BAiPptKYP8DozcWyksIm87R/
         pG5SU1yBv9MmtdMQNIyo0sJY50RzTzAGvrbBYDN9YXOa9wkSmNOeu2FIoibPFKzVjzou
         aKfnWgyRyes00ijDv7XMcSl39dPUUim9anjpHUBJmQXy/Q8co/Uz+z3wVIUdJLuGa9Yj
         ubooF6ysDAqC7YX1M3EajiqG8/hB5SuXUTovx5b3WuNI6cWb904Sq41esm9yhH0LmXru
         eXlKwVF/hpSCnRYpzSQzTJZYQatZDcXrO0DI/F0PNK+0aZ0ZYug4D6K6STn0C2GFcy4d
         3CTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788154383; x=1788759183; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=al32+VJq1jKIId9SnUJ76zOfT5qUXNEzgzuggBSWSDk=;
        b=fsVfaiYTMirF9KwNKWuuQhoJELrHOd4IzO/bmgHWHYqyPsVBDDzeJGJtBuMYRJ+bxd
         xJ+EPrEALQWY2NxiNqTVJB3JIymzGJxiS+tq3APxuLc1l2PRk0DBglnvuE5Oa4Wam/3c
         YiX1WfK4eTeLHo/bDY+WmcUATs++59jhmTaZ67sDZKDLjaQlQSFJ4jRAJAG6HwBxw53t
         qotUhl6ITMUFTG0a5aZV8+EBJuMnd85ipeCOGII4i5ypq5Ssfe4SHofHOtaTB93GEUKG
         OltrLHNqzKmZdOhLtkQsXaVnq4VkXF9HRwCaJmBPjpv2v16yHMgqUqGBOUzg7A46ygqu
         uSRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788154383; x=1788759183;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=al32+VJq1jKIId9SnUJ76zOfT5qUXNEzgzuggBSWSDk=;
        b=oyGpDZ/j9YjbOWO046KExKtpWqn93WDbvxMT22yTsCbvXKkb6hDwQorPt9TFuk/lll
         s7F9u6f5XoUbUKu9tpxkAEE6ln/NZa5isp49tYE2mnKtS/PpNZkX/kYyvs6H+cnZYPCS
         g1QmUIr03qSPGkKBUXzWX66WNOK5ZMFrLUPDF8P+FwmH80IWW2kXQVZtTHFDHyDj4eiM
         O0TRcXT2KSbh0vTfuMKsksTf//XrXW/M8BmoyXGD6y/m4vxw5yAujsiDp757se+qAMG3
         3IKLY4rvgPDRATK7QBACOXMXsp+HYZ5FPxUvuG1i0tUADn4PPIQvXrDI8TWEmwJ2KGM1
         3LDA==
X-Forwarded-Encrypted: i=1; AKwUvByrUci9Ph8er3cmrorYThKOKcXwcoeXKU2E7wAxDL74mI4+WqHLcvzkjmdbRxesgz33YtXKkFPaKYqIC0Q=@vger.kernel.org
X-Gm-Message-State: AFuF++nzKgkS434ueG7Oxu2ipAGYPu7puu3FrHrM1B8aOcMgrW4zqhyD
	/1JqdMdTs502BAX2CHyJeU8WMMg4PYX53fyor1D7KDLbWVahVyksbL7unkqD216XjR0ZJ1jbwUH
	uWaFgpLG2aS06DY69zkrx67y85T8KxMA=
X-Gm-Gg: AYBFou2N6SzG/g4LPZD+SGEy8m7bNiiX1uIya8CX8lykmoS1Xa1WMGczB26v1s+dLwp
	y0FbGfAFiDrc1WsX7d9eu4foZPMnPvUv+wBDDK2LfVaUslNMZK37kt1ZarE0TSaGp6yZtvjNoK0
	ut7078/0ySfqjlDcizZ8KKJrN7ouYi1ZrhWUFAS1E6MbIkbJPdQZ2RLNs7TohzoSPxjTde1ia6v
	eAA2TACE9/Rgc20C1+wcKRNIatN96umlyorSDHQsKxPAffJFMM6/UoKDe6YGJK15Kgh2ZaGCCc4
	OT/dVygUYMIBrPGGGYVpd98GwRym9Y0/LxeWREKQgoCrlGaQUCwzZENgTTMcjNYOIMkTfzZ5p0m
	3dg==
X-Received: by 2002:a05:6402:2088:b0:6a5:fbc6:cad1 with SMTP id
 4fb4d7f45d1cf-6a60d334d1cmr12440801a12.7.1788154383070; Sun, 30 Aug 2026
 22:33:03 -0700 (PDT)
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Aug 2026 00:33:02 -0500
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Aug 2026 00:33:02 -0500
From: Xinping Zhang <zhangxp1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAH=xXfEFL7w7nsU3xjNubKJ1soYMqT-DbJBuyzfEX4Rv3rdFEA@mail.gmail.com>
References: <CAH=xXfEFL7w7nsU3xjNubKJ1soYMqT-DbJBuyzfEX4Rv3rdFEA@mail.gmail.com>
Date: Mon, 31 Aug 2026 00:33:02 -0500
X-Gm-Features: AcwNN1WXdLhwaTvKo5Ws--zHjKmKCbHB-j7jN9AheKAa8cz7hqKNhAN9Lr7tL8A
Message-ID: <CAH=xXfFd7YskcSBXauAYKLVuC0HP4dej4w5Rtf7HCfdFDCSRGQ@mail.gmail.com>
Subject: [PATCH v3 04/11] f2fs: describe orphan block layout dynamically
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
