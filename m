Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794802164;
	b=mqkJQ6je8znNFs2qL/ZriqRJFzy1Dhb3HsmdSHoK3kkIKZlz54jg1qUrDNKjQAz41OE5
	 NmKwbMCg89wQPFsKdR2TIgJTgd2ij+GwNH+BN+KFIKyIKVjksKyMmuvmbIUYgybVkfdeQ
	 /HWveSopzOx3qZiAqQ0CJOXiB4VgDh5IucSgvE2Yw1nioJd39N1XybW/eVMqmcQYZzdqq
	 rTUcdYyT8mI797bOBm9osCak83jueHkXMU0P2cNgdN03AiQcon0vsOPe41vBYNxQZC983
	 F81PAbt+342Nh70o6lqhB6GiyIECtusu5ohsd4IPZEhu1mBbb1lLFUcuWfcjgqAI9hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794802164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=133HbCo60K4Fb2CifrvokXMCTgGuA8mmVi7WhyYrJ4M=;
	b=AwDJKYrejAykWaAIe2eWZYkQ8L5hpvLnrfMAT8SDD996K+8qqMF+9abQr5SrjVbYGDOK
	 lGMvPcAhTxQ829RsiWEVZyPBg7gPJhvaMAv8HWTDNJtugkIm+MzxPm9j9EHRmtKYi3C+Q
	 jTqJzJus9y00SsauubOX8BC9qILTkdm6jl+dBAcme8Zo25da1/0HdF8dqOiAiuS6qGqAf
	 nUDlQqo6P3xe8NCnhPUL8whSRUqzDr4fogoWmhJ6k/F54ifuOxrYNzFigAAMeXj6xSY69
	 l6doiuSrgUbsxQ13SBefHsVTprKXFuCTLamUKLPKWLdobrjyPbeJAy6ma4Bb3jT4EaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OP9VJUrt;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4BD606A89D
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:09:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F4BD606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OP9VJUrt
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so3131263a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794802164; x=1795406964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=133HbCo60K4Fb2CifrvokXMCTgGuA8mmVi7WhyYrJ4M=;
        b=OP9VJUrt09Gcf88OEdrJz51QouUavyQPY/o4b3fyy3JchsFYzqWQ4kGZ60pImO4f/L
         SIgtObskZ/004sCpjzISG0JK173c3TNblmTsntheOCi3vzzjBtstyXTNCX9vcTzjcnjW
         m33dJPSMchHbV2vJmnadMy5mmsRTgV7VkFblNAvG0m6CQWIYG14ZtMPW8LJmof7tvspF
         35Jq3sil0YY3JjJ8rUEZSV4MQyI6PKS00GH1KgrsFyChCcHj7VK4gzwg8blKCtuc9TqX
         dvBA9hzTmVbayiClGSqncNywJCrH6g0r3DvXp+4z5CeKnzeAEB4nZgiVLeGJmhW41+i7
         WwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794802164; x=1795406964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=133HbCo60K4Fb2CifrvokXMCTgGuA8mmVi7WhyYrJ4M=;
        b=pElP2hoevcVLTZdUM+Lf6mUjdPgVo/ZdH1SKYFIi2TwJDVje9GKmaSXtDvDpfLcMYW
         BR8sdWdFH8nnHaPWLVBt2p5MONOZAuwqyl1oskXmcEZriCuVoDaJFZcGp3/RPWId1nCp
         0dtAsCyXUrOgFm0RmcakpO6qG0XYaarGUeeuKJmSnijxqZLPnz1qFWJnLishKgY99GWu
         lobXv5Es7YIx8sDVLK1LmDw1Ot2VEaOLUaqKd0jBTVCd6B93mhcFnCsJsjYf8y85Eb3i
         KsJYr5vxZEftfoovyDCJp2Tr+N7UcmUsWdW5is+G9KGCZNNGVnqPctUwhIq1afteaRd2
         /F9g==
X-Gm-Message-State: APuU4Z+0WHWTzc4nxtJFS7JcXMCbvVEkTKyBPGO69ehWDzLpDXSbM020
	DQ8meLGG3AFF+0BeBbgXL/y6RFZlA+BJoeUC0c+e5VyeAO64zuMDBHCYO6VkLg==
X-Gm-Gg: AYBFou1sYzFIK7knzeZ8R3j0aapVr8HWTDjLeWt4A5/yRSUxiIARFljHmg1vcwydL1S
	SZKN1rpdRVqOsw2NBZXBGFEEEhFiSjLiaNaqma5rwsQyniq0hIuLdsqyt1JiZ11HhAZGkbNSA00
	c+xQ+XDS8kv2p5CkKsoayr0LheKiAZlpMCIcUxqWET/o8i9032Nf8l6984c5Sr8+RrFj63kIokT
	t6ySEDNfoOn4RkMFE0bAJfxjQKk41QceReo+7q2VXxAWA0L3QQAsYhq710TXCOs6eRDTA6lQdx5
	sHSQ+ExXlNlPl4XCBjRc6ZwI+0SJYhDMYzRK8KzgqpiROhqA4veGYNkL3HVmyD4qSvNZiBsw9i+
	M0Q89Z9PJdjG10YPaApr/Hk6OfUGQbqC8SEsttlmD7+kTlP97sofcDI8nPzdILXtRHNcuW9shGb
	eqg+xSqB/l/jVd2OjLHFt8aLH/K/pje7gMnPFaYnKjtofnzMUCKcrE0ZI99ra5G1VSsdcbUvJnJ
	qAlBm6ijiglEUl/1HGG+3t2Vkv8FQkvWnv707XfH+xAA3wMoqRE1f0+w+NT5OFuYKQ2vIW2FN3r
	H1fATzdPlt1JgCqZ33g9MbSZcXQ+8eplXMOtg02T/asqpekJ3Ie8p7UlSlBgwdnuEDCIvOyoVWw
	OGqJCRuZ38uFGJjJ8AYB3jLp95sXWQz7ZdUNxYJVWVLoVJBo=
X-Received: by 2002:a17:90b:1cce:b0:3ad:13fe:41ba with SMTP id 98e67ed59e1d1-3b1b0a4a16amr9226007a91.52.1794802164013;
        Sun, 15 Nov 2026 20:09:24 -0800 (PST)
Received: from f2fs-test.c.googlers.com.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3f09b92sm7191989a91.4.2026.11.15.20.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:09:22 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH v2 13/20] f2fs: support subpage blocks in swapfile activation
Date: Sun, 15 Nov 2026 20:08:44 -0800
Message-ID: <20261116040851.2849696-14-daeho43@gmail.com>
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

The swap subsystem works in PAGE_SIZE units. Ignore a partial tail
page, require PAGE_SIZE aligned extents, and convert block counts and
addresses to pages for swap. When migrating blocks, mark only the
migrated block, not its whole page, dirty in the folio state.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/data.c | 43 ++++++++++++++++++++++++++++---------------
 1 file changed, 28 insertions(+), 15 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 98ceea49e426..f23f29d45763 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -6007,8 +6007,8 @@ static int f2fs_migrate_blocks(struct inode *inode, block_t start_blk,
 			}
 
 			f2fs_ffs_mark_subrange_dirty(folio,
-				offset_in_folio(folio, (loff_t)blkidx << PAGE_SHIFT),
-				PAGE_SIZE);
+				f2fs_folio_byte_offset(sbi, folio, blkidx),
+				F2FS_BLKSIZE(sbi));
 			f2fs_folio_mark_dirty(folio);
 			f2fs_folio_put(folio, true);
 		}
@@ -6040,8 +6040,10 @@ static int check_swap_activate(struct swap_info_struct *sis,
 	struct address_space *mapping = swap_file->f_mapping;
 	struct inode *inode = mapping->host;
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	unsigned int blks_per_page = F2FS_BLKS_PER_PAGE(sbi);
 	block_t cur_lblock;
 	block_t last_lblock;
+	block_t max_lblock;
 	block_t pblock;
 	block_t lowest_pblock = -1;
 	block_t highest_pblock = 0;
@@ -6056,9 +6058,12 @@ static int check_swap_activate(struct swap_info_struct *sis,
 	 * to be very smart.
 	 */
 	cur_lblock = 0;
-	last_lblock = F2FS_BYTES_TO_BLK(sbi, i_size_read(inode));
+	/* swap uses whole pages only; ignore a partial tail page */
+	last_lblock = round_down(F2FS_BYTES_TO_BLK(sbi, i_size_read(inode)),
+				 blks_per_page);
+	max_lblock = min_t(u64, last_lblock, (u64)sis->max * blks_per_page);
 
-	while (cur_lblock < last_lblock && cur_lblock < sis->max) {
+	while (cur_lblock < max_lblock) {
 		struct f2fs_map_blocks map;
 		bool last_extent = false;
 retry:
@@ -6093,7 +6098,7 @@ static int check_swap_activate(struct swap_info_struct *sis,
 			not_aligned++;
 
 			nr_pblocks = roundup(nr_pblocks, blks_per_sec);
-			if (cur_lblock + nr_pblocks > sis->max)
+			if (cur_lblock + nr_pblocks > max_lblock)
 				nr_pblocks -= blks_per_sec;
 
 			/* this extent is last one */
@@ -6114,20 +6119,28 @@ static int check_swap_activate(struct swap_info_struct *sis,
 			goto retry;
 		}
 
-		if (cur_lblock + nr_pblocks >= sis->max)
-			nr_pblocks = sis->max - cur_lblock;
+		if (cur_lblock + nr_pblocks >= max_lblock)
+			nr_pblocks = max_lblock - cur_lblock;
+
+		if (pblock % blks_per_page || nr_pblocks % blks_per_page) {
+			f2fs_err(sbi, "Swapfile extent is not aligned to PAGE_SIZE");
+			ret = -EINVAL;
+			goto out;
+		}
 
 		if (cur_lblock) {	/* exclude the header page */
-			if (pblock < lowest_pblock)
-				lowest_pblock = pblock;
-			if (pblock + nr_pblocks - 1 > highest_pblock)
-				highest_pblock = pblock + nr_pblocks - 1;
+			if (pblock / blks_per_page < lowest_pblock)
+				lowest_pblock = pblock / blks_per_page;
+			if ((pblock + nr_pblocks) / blks_per_page - 1 > highest_pblock)
+				highest_pblock = (pblock + nr_pblocks) / blks_per_page - 1;
 		}
 
 		/*
 		 * We found a PAGE_SIZE-length, PAGE_SIZE-aligned run of blocks
 		 */
-		ret = add_swap_extent(sis, cur_lblock, nr_pblocks, pblock);
+		ret = add_swap_extent(sis, cur_lblock / blks_per_page,
+				      nr_pblocks / blks_per_page,
+				      pblock / blks_per_page);
 		if (ret < 0)
 			goto out;
 		nr_extents += ret;
@@ -6136,9 +6149,9 @@ static int check_swap_activate(struct swap_info_struct *sis,
 	ret = nr_extents;
 	*span = 1 + highest_pblock - lowest_pblock;
 	if (cur_lblock == 0)
-		cur_lblock = 1;	/* force Empty message */
-	sis->max = cur_lblock;
-	sis->pages = cur_lblock - 1;
+		cur_lblock = blks_per_page;	/* force Empty message */
+	sis->max = cur_lblock / blks_per_page;
+	sis->pages = sis->max - 1;
 out:
 	if (not_aligned)
 		f2fs_warn(sbi, "Swapfile (%u) is not align to section: 1) creat(), 2) ioctl(F2FS_IOC_SET_PIN_FILE), 3) fallocate(%lu * N)",
-- 
2.56.0.611.g1030f0b940-goog

