Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794802167;
	b=MKwEN/1nctoJfjMgWd5qC4ZIt5+JImhETMzFVX6uo7zRBWaDls26CAU4sYqPwNqhGg4w
	 cCxpSQBwbQIRIWJFPBM0pGi1Iot8liS1Vku4JNVqbFheaQAM+waMD+dPXxKLQmTbw5TJe
	 Zxpxv4I4MWkdbNUmcxC2daSmZQnQRxG48OMXz3PZ3fIHT8ICa3xrZdUCysM6x+XfjMA/d
	 VtNijoy9F0tkurQFcA2muh4vU1DeKiXYdCA5tdcU5552X8sE8nfD4OPg6/X27JhF3Ga+b
	 q7w54oZi0ZwAy8H7joj8vBj0lioR25BKzgnraGBIhBhkhTmA7YEE1MeR51WsJ5I6Adg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794802167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zFy7dE+9TYlqdjzVOGIle0ydaLPC/hfnQSo/dWdrLPs=;
	b=kGPBSqg/FMYx9ymKa9RNgwCgPI/snn4tEVvYzNsHMa9+Jl7DYFTEPCDBXFTMcwl0o9sH
	 e71ui5UQ1HwrNKLmNKSejvZg2zX7/3pXW2ETUCl7bJi0FMG0FWPRffN3/KWS5jH/uf89n
	 tR12yAYDwywh7v1ND4xRo1QBurlhTs6fTD589Uc3G5ATh0nGr3M2IVi1Y5W38SLJpgrV/
	 eMFvsSCD/KTjCWn7b2v1KYkd/8FRroiI08wdG33UT2GVWxsaz6x8JoCdJRmzt3ViAI1i9
	 bxsa9M5Q7/kgNb8GmQSbjyGJcYl3BuGAUuk133ach5UVlBrnBAwmZ8GuK/VIB8QAvXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wBfdoFyS;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCC1606A321
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:09:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BCC1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wBfdoFyS
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so1180805a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794802166; x=1795406966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zFy7dE+9TYlqdjzVOGIle0ydaLPC/hfnQSo/dWdrLPs=;
        b=wBfdoFySS6sOc10rPoW6y1+auVcPyYxIK+65dWMoV+AmFerBbNCvKLoYUYEgGwgHgt
         gOGTug/Mc2c3zIINiejFIgHKKiVIc6rj8kfUXTz/S2iCxwjULk7+gn3PTZ00QskbY0yg
         XNGcnrjQno8lBPEY6/r/PShfLxmM3mTPXMK2IQCwNjD8ji0kkNZ1GxiQtsenzvsE+mfl
         pOH/Y0MDjYFqVRlY/C6EqSw0Bi6h3vBTWWNp72da+RF0QUtGP2tRwG/B9uG4OlFwOrdV
         H1x5OmzA79Kp1t9xpNmnNY4tH5wnjKYJdPhTZbMTHv/HgTueXyEtkPdo0wX80/RfxY14
         lLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794802166; x=1795406966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zFy7dE+9TYlqdjzVOGIle0ydaLPC/hfnQSo/dWdrLPs=;
        b=1TKHcy2wAIMFkfP0tibVxQf2oj4e30vW6uI5x9/WHH701WZGnucHvevas2C10kgpGU
         tU1+eFogNKGGCF+cxEXHPHm1xeIL7Duj/YZ8B8+6v6+2u740ax0YtwBpOeD7BneE+o4x
         dblYT92GEQkE4QATg/eOkTdTx0MMSv2ojf6uxrdhVqRYUktZp7Mz/ZP2GMDeRFb3lCoB
         M5Uv9IjTbtMflV4/Jem6f/f3PGfdchDM1yjitHekMYY71+ua4XG2Wl0b3tIIjChmYeG0
         9Ni/MV97QZz+6CaD3lpV7RhziDj8uWgDPQ7c2ygta6nPtWgD3/RGxybGa3MdDvVQrIF7
         P5pw==
X-Gm-Message-State: APuU4Z/1koJELq/SKLAvfS7QC2DRCgptN4lfCLSQCg6eNORYexgFIF6z
	r9xT4JuexBZIPE5s8DRMfmirhzHBG5KLmOzjABuGqabYRRvtmGHG5CEioKD5qg==
X-Gm-Gg: AYBFou2HmQ0Itf8W/erf8O4WQApYK6aQOGBcreDdrR7vEstFMqz7u9rIvWRu2y4USDQ
	A0+pZtj7rTwQyUufC9kcYGsgPdOOevqAHywfa1LvL0+gpCmsdztxtsLKZPXfemlqKNad2o08c52
	V+ZxScP08sWGEos+MoiWCUaEBk4en4iStJr8Pk6KeXIhArR0Aq8szIcQA+hwdcheqCoYWvi14R0
	uw0u13pd76KL5rghcB+/oZ2s+7RWPPf8bgq1Z9mQ/fFogwqT0p908zmf3jdwN7jG3qABs/aOnz6
	a6CXHKaNr3dNlMQYEmy6XQPupAMw6C7sDsueBYxn4L1czDx5lEN3POfuUNcuGObv1tRQnsCewfN
	qiomGfWffH9qaKKhB3R16w2IYUBlvLfnQbuZyE58n1xqr8sbQ18l4yz+elV9n0GxouZEQ294TbW
	cZvTz0o+Pvr5RPT1t+kZ6fhv5AI8cG4/DXjsF+AURNMIx5co+1SjjjMrXFfJ0Qjm3Db3z03IwDa
	iR6suDBQIDGaF2IxbQQjJbIwxIpv5V7sKN5YarvjrqQN89BEbENUW9YGNmDDCQ4+7t6thOHFg6m
	t0O2BTasZQD80jhHJtqLdFlnyYsKyQ9Cj3kbOaPc8TpM+MR4+8yRRkPjjkLE8OY7unbfpJc37IZ
	Jg8I12p6jnpZ4LTJ/LbGoGr7PnJC7X0i3n/WP2qk15MNdbxs=
X-Received: by 2002:a17:90b:2d88:b0:3b0:9e2c:9b60 with SMTP id 98e67ed59e1d1-3b1b09facb7mr8472507a91.21.1794802166505;
        Sun, 15 Nov 2026 20:09:26 -0800 (PST)
Received: from f2fs-test.c.googlers.com.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3f09b92sm7191989a91.4.2026.11.15.20.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:09:24 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH v2 14/20] f2fs: support subpage blocks in fs-verity enablement
Date: Sun, 15 Nov 2026 20:08:45 -0800
Message-ID: <20261116040851.2849696-15-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
In-Reply-To: <20261116040851.2849696-1-daeho43@gmail.com>
References: <20261116040851.2849696-1-daeho43@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daeho Jeong <daehojeong@google.com>

Check verity per block. While enabling verity, dirty and write back
only the data blocks below i_size in the folios before the verity
metadata. Do not zero the blocks past i_size on read while enabling
verity, since GC can read a folio of the verity metadata that is already
written. Remove the -EOPNOTSUPP checks. The changes for enabling
verity also apply to large folios when the block size equals PAGE_SIZE.

Stop the data reads of a verity file at i_size in
f2fs_read_data_large_folio(), so that the blocks past EOF in the folio
that spans EOF are zeroed instead of read. A pinned file can have such
blocks allocated without being zeroed, and fs-verity rejects non-zero
data past EOF. The reads of the verity metadata still go past i_size.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/data.c   | 29 +++++++++++++++++++++--------
 fs/f2fs/f2fs.h   |  5 +++++
 fs/f2fs/file.c   |  3 ---
 fs/f2fs/verity.c |  8 --------
 4 files changed, 26 insertions(+), 19 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index f23f29d45763..9f7f8214d10e 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1671,7 +1671,7 @@ int f2fs_reserve_block(struct dnode_of_data *dn, pgoff_t index)
 static inline struct fsverity_info *f2fs_need_verity(const struct inode *inode,
 						     pgoff_t idx)
 {
-	if (idx < DIV_ROUND_UP(inode->i_size, PAGE_SIZE))
+	if (idx < F2FS_BLK_ALIGN(F2FS_SB(inode->i_sb), inode->i_size))
 		return fsverity_get_info(inode);
 	return NULL;
 }
@@ -2619,7 +2619,12 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 
 static inline loff_t f2fs_readpage_limit(struct inode *inode)
 {
-	if (IS_ENABLED(CONFIG_FS_VERITY) && IS_VERITY(inode))
+	/*
+	 * The verity metadata is past i_size. GC can read it while verity is
+	 * being enabled, so do not zero it.
+	 */
+	if (IS_ENABLED(CONFIG_FS_VERITY) &&
+	    (IS_VERITY(inode) || f2fs_verity_in_progress(inode)))
 		return F2FS_BLK_TO_BYTES(F2FS_I_SB(inode),
 				max_file_blocks(F2FS_I_SB(inode), inode));
 
@@ -2913,10 +2918,10 @@ static unsigned int f2fs_folio_valid_blocks(struct inode *inode,
 	pgoff_t last_lblk = F2FS_BLK_ALIGN(sbi, i_size_read(inode));
 	pgoff_t first_lblk = f2fs_folio_lblk(sbi, folio);
 
-	if (f2fs_verity_in_progress(inode))
-		return nr_blocks;
 	if (first_lblk < last_lblk)
 		return min_t(pgoff_t, nr_blocks, last_lblk - first_lblk);
+	if (f2fs_verity_in_progress(inode))
+		return nr_blocks;
 	return 0;
 }
 
@@ -3409,7 +3414,14 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 	index = f2fs_folio_lblk(sbi, folio);
 	offset = 0;
 	nr_blocks = f2fs_blocks_per_folio(sbi, folio);
-	last_block_in_file = F2FS_BLK_ALIGN(sbi, f2fs_readpage_limit(inode));
+	/*
+	 * A data read of a verity file, which has vi, stops at i_size. A
+	 * pinned file can have blocks past EOF that were allocated without
+	 * being zeroed, and fs-verity rejects non-zero data past EOF. Only
+	 * the reads of the verity metadata, which have no vi, go past i_size.
+	 */
+	last_block_in_file = F2FS_BLK_ALIGN(sbi, vi ? i_size_read(inode) :
+					    f2fs_readpage_limit(inode));
 
 	for (; nr_blocks;
 	     nr_blocks -= len_blks, max_nr_blocks -= len_blks,
@@ -3719,7 +3731,7 @@ static int f2fs_read_data_folio(struct file *file, struct folio *folio)
 			return ret;
 	}
 
-	vi = f2fs_need_verity(inode, folio->index);
+	vi = f2fs_need_verity(inode, f2fs_folio_lblk(F2FS_I_SB(inode), folio));
 	if (vi)
 		fsverity_readahead(vi, folio->index, folio_nr_pages(folio));
 	return f2fs_mpage_readpages(inode, vi, NULL, folio);
@@ -3739,7 +3751,8 @@ static void f2fs_readahead(struct readahead_control *rac)
 	if (f2fs_has_inline_data(inode))
 		return;
 
-	vi = f2fs_need_verity(inode, readahead_index(rac));
+	vi = f2fs_need_verity(inode, F2FS_BYTES_TO_BLK(F2FS_I_SB(inode),
+						      readahead_pos(rac)));
 	if (vi)
 		fsverity_readahead(vi, readahead_index(rac),
 				   readahead_count(rac));
@@ -4777,7 +4790,7 @@ static int f2fs_write_cache_folios(struct address_space *mapping,
 			op_locked = true;
 		}
 
-		if (!verity_in_progress) {
+		if (!verity_in_progress || end_pos <= f2fs_verity_metadata_pos(inode)) {
 			poff = offset_in_folio(folio, isize);
 			end_index = isize >> PAGE_SHIFT;
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index f588603dd1d0..f84d6f4cd1eb 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -5349,6 +5349,11 @@ static inline bool f2fs_allow_multi_device_dio(struct f2fs_sb_info *sbi,
 	return sbi->aligned_blksize;
 }
 
+static inline loff_t f2fs_verity_metadata_pos(const struct inode *inode)
+{
+	return round_up(i_size_read(inode), 65536);
+}
+
 #ifdef CONFIG_F2FS_FAULT_INJECTION
 extern int f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned long rate,
 					unsigned long type, enum fault_option fo);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 26dd06961389..8540613e3b22 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4331,9 +4331,6 @@ static int f2fs_ioc_enable_verity(struct file *filp, unsigned long arg)
 {
 	struct inode *inode = file_inode(filp);
 
-	if (f2fs_has_subpage_blocks(F2FS_I_SB(inode)))
-		return -EOPNOTSUPP;
-
 	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
 
 	if (!f2fs_sb_has_verity(F2FS_I_SB(inode))) {
diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index af1b7f21c1d8..5f579d0b917b 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -32,11 +32,6 @@
 
 #define F2FS_VERIFY_VER	(1)
 
-static inline loff_t f2fs_verity_metadata_pos(const struct inode *inode)
-{
-	return round_up(inode->i_size, 65536);
-}
-
 /*
  * Write some verity metadata to the inode for FS_IOC_ENABLE_VERITY.
  * kernel_write() can't be used because the file descriptor is readonly.
@@ -94,9 +89,6 @@ static int f2fs_begin_enable_verity(struct file *filp)
 	struct inode *inode = file_inode(filp);
 	int err;
 
-	if (f2fs_has_subpage_blocks(F2FS_I_SB(inode)))
-		return -EOPNOTSUPP;
-
 	if (f2fs_verity_in_progress(inode))
 		return -EBUSY;
 
-- 
2.56.0.611.g1030f0b940-goog

