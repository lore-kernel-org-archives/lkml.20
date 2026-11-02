Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648433;
	b=SPSJdaVJkWd9qZ8xW0o9stZYlI4z98ucmNTD+k5vJhV8lVqEV+67MJoeXQcyr/IAIThy
	 2FSWHNBCn71wFTkDEYEzbKpZlmsFhUxW5EpH0Gn4zlty1G3IvpRkHJSxBnlSVq5LM6iIZ
	 /l00/c4aG0cb+jDSejSu28KVqTfX1YpL8065nF6HFTS2x4RkNeNPZaehQ40Sq10jSluaC
	 r4gq5xDIi0pyZtbT5urTt8XO/c0FRaIK8PeoXbQkdHbRh2HE9TqAMFy4UGVjJIcjM33Un
	 TCUHZXLNmLxNywtQbxGmJaRUeRUJljYysdAaje+zdR5DD7A2l/mpf2lG3I9CMG64ctg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648433;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Uylky+Z6UrkBhMKIZnvpLNSYYgiE4zCBO5CqWl99wZ4=;
	b=0SCNLhgFxJu60toMsphmJUj4v6gcHZ7m5L8PlJ0LD+YJZXqtGrPPo7aQsgDjMnftea9g
	 6QDNyfWxAn2waaDd5FKUvI+fzTjkZc2J0qOIcN6tLYyBQsmAh6MOBnRxqjLWuihi8jGQe
	 QoVqvSB0jG9exv9q0411J9owMjdvFZeWh2IsUgiGx+BVgaLS/jyPzb3pu5i7YSvuvyFp5
	 6G/wN9CtHkT4d+8Xcs4MKZ9AEKMOgASBnENWJ3xjz5Vjw8iWFIFgiRCyjggqkGeHpNWvs
	 bKaMvGvP058doBMFfcjsdiFzXtAyRh5jVkXEaCak7O7zDx7PLjqBwgs+982DHTa4yMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=azhrfFLB;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BCC606EEBE
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6BCC606EEBE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=azhrfFLB
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a089dfee18so2191978b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793648432; x=1794253232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uylky+Z6UrkBhMKIZnvpLNSYYgiE4zCBO5CqWl99wZ4=;
        b=azhrfFLBaoU1PCTkWM+cl0W9KTw9pbojTRx1ajmJLV8vC1zYvyg+e4D+Ph39gUEBDy
         Wdp5TRj1ge7a4QuBZbD+kJILQ2OMIlUXrRg/Q0gh6g5dA80PBPF6bxLjuDLknGSb6j7N
         joveizq+K07xNF3OPg75wPkc0mglSJKG+sg1V90hMhdnO3pFx+vPqCzTkYGt4YaYHB09
         d6DHc7wcSn/JsD103WddgX95xief5yANWK2RrnaxxGrbmlqepF45H83+JbRprLmRvaSd
         Mwaao5tSdBsoceq8yWi5kCV15yNB7fdbgmGLaJV8El/9nxar2DSCVomqTjiGjwZYukAR
         3nmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648432; x=1794253232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uylky+Z6UrkBhMKIZnvpLNSYYgiE4zCBO5CqWl99wZ4=;
        b=DwU09Zy20tjLuuVKMYn+33c1busM4dB5VZaHxnzuEmrlqO91JdfSIwYZIG9OYjj4g3
         DkGmPDC6H49cnv8rVRLxH0cih/fURb6qQVYgrdQe0bEZ58vFsUgsJHdtPryl+WK8bNGR
         TtVphDDKwrJiimtyR7VuXGz+hPxY5ydt7VSquajz2ZSbwbxvIt6m1clxsHGPoPWBTWFW
         ixUsTt09t8g/SIT2GEXhwyQdI73SpwHUkxzWrlgLOuUwxxS7RFkQJpIXNxpX4Acyaf7H
         mnyxKAAwtRtJowk1asXDOYjmKVDKuloiPPpXMPOHXziGGv6okqhxXUsDpliT0Px2vRHb
         kN7Q==
X-Gm-Message-State: AFq9FYLFezCKOAqM3amaE/VdAy4qfOy96kK+hnIVUwavEbKE5RMdYQjU
	GyfKzPgcBnkRtOhg+pzvMr9UVEBmo0Gr3G+Vi/m50ziEEpgFj+W9pWjEuYYJ8G1k
X-Gm-Gg: AYBFou24yuPBAOKx4BVkLmD2aiqhsIo2mCNnI2YoWbF9mLcP/KOVXq7kf0iuivq1Wtw
	ci+6z7m/bT/XSlOcTaP3EaQVOjEq+3PXmXKbzidRZsdxsNhztSFWKCc3sKiwZ6X5Vs+ayUwGlax
	6BgaAgf5qG1dnPCdohOP1ODsq3qyAok9egCVswkNh7SsEJHsVWhrPPJRURYp5oWdnX+kNW5dc9I
	1/41PLLNL6OtQm0Wbv0pEF1iP+dqVzw5Te8t0MH2Lg9EN5UbhrQ4ZcMNeSVqLhCuyHgyxR9jr+a
	XhlJOnmzNyXGffVDaip36eNKsEPU35P5Fj6+T1VdVVQiwwvp0Isfnts+DKw1vDPqfOsUao7+cqk
	CoJTk8DpE3mZwzVoebs7tTKaYOXk5HJVB1dP5Gq2IMyXkXyT35kcafbT8buonwTm0tUNhKV09/x
	x+Dlyh3yzNAWMzcXjbSgp3tTb/WblNSccBvimTHupuzdb+nFRi21bhXmqdrsflFHo+2ffpBUOkg
	vxlNaa5bDovrWW5aTSDFrQttNV7klSyPncmUKOuHzFjMjUizUt2R3vyWLsW8L0LR+UAedYUQ98Z
	cF3AEiQ6OPwM6oz+5TCgNpptn1JTDKk8G5T23wtPv8i16zv6FR4XMnLsGXUmyJP/a4sVkzS7Nf+
	80++G7vrwI72pv/cIHPbarE5ZMjj5aZVBNgOrtuXRrH/2BQ==
X-Received: by 2002:a05:6a20:be87:b0:3eb:50c9:b3c6 with SMTP id adf61e73a8af0-3eb50c9b862mr1792549637.22.1793648432182;
        Mon, 02 Nov 2026 11:40:32 -0800 (PST)
Received: from f2fs-test.c.googlers.com.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb364c48d4sm241826a12.27.2026.11.02.11.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:40:31 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH 13/20] f2fs: support subpage blocks in swapfile activation
Date: Mon,  2 Nov 2026 11:39:45 -0800
Message-ID: <20261102193952.3002018-14-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261102193952.3002018-1-daeho43@gmail.com>
References: <20261102193952.3002018-1-daeho43@gmail.com>
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
index 77915a2eb190..929a2beef379 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -5876,8 +5876,8 @@ static int f2fs_migrate_blocks(struct inode *inode, block_t start_blk,
 			}
 
 			f2fs_ffs_mark_subrange_dirty(folio,
-				offset_in_folio(folio, (loff_t)blkidx << PAGE_SHIFT),
-				PAGE_SIZE);
+				f2fs_folio_byte_offset(sbi, folio, blkidx),
+				F2FS_BLKSIZE(sbi));
 			folio_mark_dirty(folio);
 			f2fs_folio_put(folio, true);
 		}
@@ -5909,8 +5909,10 @@ static int check_swap_activate(struct swap_info_struct *sis,
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
@@ -5925,9 +5927,12 @@ static int check_swap_activate(struct swap_info_struct *sis,
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
@@ -5962,7 +5967,7 @@ static int check_swap_activate(struct swap_info_struct *sis,
 			not_aligned++;
 
 			nr_pblocks = roundup(nr_pblocks, blks_per_sec);
-			if (cur_lblock + nr_pblocks > sis->max)
+			if (cur_lblock + nr_pblocks > max_lblock)
 				nr_pblocks -= blks_per_sec;
 
 			/* this extent is last one */
@@ -5983,20 +5988,28 @@ static int check_swap_activate(struct swap_info_struct *sis,
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
@@ -6005,9 +6018,9 @@ static int check_swap_activate(struct swap_info_struct *sis,
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
2.56.0.317.g454f8302e1-goog

