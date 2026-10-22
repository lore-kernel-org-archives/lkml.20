Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655673;
	b=T5sQHq/dwOiHyNKCmM47pX+xoY8Zylqb1HA+WbB7+Tc+myvGukdEWzuKvrm2k3CQsJNv
	 zo2uGlpsMQht4ZXyIAbkAdkWKJDZTnxy2+bXYWa+b23V+NiOdMo5HY9yw5TmQJqclP4C7
	 0ILbrrD8FLPV0rXVkNVKKxwqHH/I5ImPj5QTA1Q4+hZUj2x/+m5AwBsooIOxnowuWiHv3
	 ala81UeeddXN6LfOKVhDMjbOVUTMNU+MuczPMAqEPBTncYh3NM4pybvEcjOWvFr/OU+Cu
	 kwVFDFpj+e/UTrmaBsxrXGSMEKbmNfLTuuNSbyPSS88vsAJaku7VTHielQxiTU3lH7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EAwiE2TbtfpvHJ17XLmEC1Ibh6fiFrr0dXc3eg/92Ts=;
	b=2i/4Fc2MqhJ2QnyCopTAClnhT+1I6KOxycIlY25OktsHhm0cBlySNfneUOYNKYpUauYi
	 kV0E8stO7mMEiykgRSc+X0xj5iddLJ8nNDY7l+SwFeZpitDEkDQCzFmoLxTFYfFQZ4bAv
	 NDStZRYFyomh3N653Cbwwvu10JgnRvLJwTeVOOz7CeOYrIu2BORhmpN17yOz6GJG9xJTj
	 iecUaK1Kd8duc2fPESsfhoRwajElHHjkQwMQpEwrQ2t4U5fRBdBehkyatSr/bUfUoDexA
	 SmWT0R5+hDR3ZQxmOlCpG+Z8bvg0xYoM+IW0LYeywtLmPI0XMi0kV3nhIiGURzPV4Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gB742brq;
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A5D606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:54:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09A5D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gB742brq
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-3ac803d3bafso197554a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792655672; x=1793260472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EAwiE2TbtfpvHJ17XLmEC1Ibh6fiFrr0dXc3eg/92Ts=;
        b=gB742brqh26Qfpa9l0V6Is1gxIRpbKBAxf5fcIJlBBeGQQzhW1+hzURN23nC8JQtwv
         uEPlqwGOnby9qnPwZkrRTjlTC5thJwG6746vwHdx9Q0MmLRdhGVKGL6q1mNDEOsIsjZn
         C6G3PvoEB5SITE7NDrsfaI2Bxszvxc6U1Wa79+ZNfnmCIjSQ6qt+B56UCmdCJemj7Rgy
         0inw+Bt6lImKL0rqIOXbagCYo+vF3I8xH7iUDc7BmTaBLS7uvs6HY45fGSC8kLRo1XGM
         7jEgNmqv6bXPG5I1mu6lNdmcvOXEWDzfGsEcCvVyYP+jAxxtCmyuhuSxrPmVHXdkQZLW
         8++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792655672; x=1793260472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EAwiE2TbtfpvHJ17XLmEC1Ibh6fiFrr0dXc3eg/92Ts=;
        b=qnMvTvzZ0kEhPlu4sJ6m1dmcSYn/fiqMtL2v2NJl9Jq6+RvE5UUvO0cs7j3a+Ir9tL
         1Igi0VVsAmCV6z1DcGGI9doNrgeGiE6b1cycL/Pt5UdzwNnCVLfSpYKj6KriTATNs3lN
         44qP0CWOQvJZtNkar2/ar1yafOXpB9anTRzLKVVZjWeT91uA+HD94G0dYdAWdtI6Dnq6
         JC6SZFSLDg/hJ4Rzdkt4KuhgSbpqHJktFtBO790eol6hureCqFD24OPXG1cPnbtHJEEe
         RYcyCFRzbSEaTVlykRQ/tXHFn5W/z9PctJ+m+my0c/RWNxGPBtdQgCWreTqrwuRvTMd9
         j7pQ==
X-Forwarded-Encrypted: i=1; AKwUvBwymoRV2I2JeHsxDOFlI3D8DoE7xaoCMIk8ulO1bcm76VQhc55GDdlggfbC3aNkzOPYklL+c5tG8ka/6I0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGHOMy+mTC05Sonx7pYfsKo9+tXehVri0bGONhZ+9+O3LLt0cz
	4GxmiaU5MWnGXafGPEOT2dGUYpBXucr0JvHw8s55TYLKZEF5jCtaa7eo
X-Gm-Gg: AYBFou1OiJbPRPCqC3T3Upfgup255sEDcGee1FT4sFmEHyuLV3goAq7Lte7uhEJ7Wl4
	o1kbcYXXPdstUFRl37X6ha8r9Th0HbwsniAYyuZygMs4DaDc8UMT1YI14Z0u62JqnAe6aGJ9V8X
	kThjfqFH8am4ueEBZAz2YxPcRx1ZAlBGCZauDr/7hCY0MygOT6foav5zis7hlYMJ5AIldIWr8uQ
	isRxc353KBdZHOF7S7FPCZrDWH810wYIUpFuEOozHj0f2UW6cEHy+oOAWf7jI+X1+P+td10naI5
	ihL3Zm03snvnHp8RfA00E0PBvPkWsFfawBmOPAmzMq6m5xLCFvJjp2xC4qGje4Gy6srBeSi1qMO
	5l9FPFLGU0Wia4XYxqQPhWgOx+PNRPIBmbUHr8ocxgaHGsU3vSNTzrW68wnTKm1V9qq+F9NZaew
	ZhDK4Gt/KXasWdCSYsjdTLVQO1gKC4ebMtEtIHgD7FqJh0krOSyGcKuvCkYEDg/kqKjSxQKyxMx
	wlcDHsm19CEy9SlI3sKl/9/SsRmxfF4fAEWzYDJzgoU6n/EMG6NssPNnRuxe0HkcpfNJU4GV0sC
	fQtkohDs2a7VP6wr1g==
X-Received: by 2002:a17:90b:2c85:b0:3a0:d82b:237b with SMTP id 98e67ed59e1d1-3ada6c8df7amr920112a91.25.1792655672357;
        Thu, 22 Oct 2026 00:54:32 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4896c71sm3202562a91.6.2026.10.22.00.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:54:31 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Barry Song <baohua@kernel.org>,
	Juan Yescas <jyescas@google.com>,
	Daeho Jeong <daehojeong@google.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Dev Jain <Dev.Jain@arm.com>,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	linux-kernel@vger.kernel.org,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Nanzhe Zhao <nzzhao@126.com>,
	Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: [PATCH v6 10/15] f2fs: support partial uptodate large folio read
Date: Thu, 22 Oct 2026 15:53:37 +0800
Message-ID: <20261022075343.3043003-11-nzzhao.sigma@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022075343.3043003-1-nzzhao.sigma@gmail.com>
References: <20261022075343.3043003-1-nzzhao.sigma@gmail.com>
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

From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>

Buffered write can have write bytes smaller than folio
size for cases when folio minimum order is not zero.
This can left partially uptodate folio in page cache.
So we skip uptodate subpage read in read_data_large_folio.
Also mark hole subpage uptodate in uptodate bitmap.

Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c | 102 +++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 95 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index bc1bffbb15ca..e718ed01fe7c 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -148,6 +148,7 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
 		struct folio *folio = fi.folio;
 		unsigned nr_pages = fi.length >> PAGE_SHIFT;
 		bool finished = true;
+		bool uptodate = bio->bi_status == BLK_STS_OK;
 
 		if (!folio_test_large(folio) &&
 		    f2fs_is_compressed_page(folio)) {
@@ -163,6 +164,9 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
 				(struct f2fs_folio_state *)folio->private;
 
 			spin_lock_irqsave(&ffs->state_lock, flags);
+			if (uptodate)
+				uptodate = __ffs_mark_subrange_uptodate(folio, ffs,
+						fi.offset, fi.length);
 			ffs->read_pages_pending -= nr_pages;
 			finished = !ffs->read_pages_pending;
 			spin_unlock_irqrestore(&ffs->state_lock, flags);
@@ -172,7 +176,7 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
 			dec_cache_count(F2FS_F_SB(folio), F2FS_RD_DATA);
 
 		if (finished)
-			folio_end_read(folio, bio->bi_status == BLK_STS_OK);
+			folio_end_read(folio, uptodate);
 	}
 
 	if (ctx)
@@ -3141,6 +3145,70 @@ static bool find_next_valid_block(const struct folio *folio,
 	return false;
 }
 
+static unsigned int ffs_next_uptodate_subpage(struct f2fs_folio_state *ffs,
+			unsigned int start, unsigned int end)
+{
+	return find_next_bit(ffs->state, end + 1, start);
+}
+
+static unsigned int ffs_next_nonuptodate_subpage(struct f2fs_folio_state *ffs,
+			unsigned int start, unsigned int end)
+{
+	return find_next_zero_bit(ffs->state, end + 1, start);
+}
+
+static void f2fs_skip_fully_uptodate_front(struct folio *folio,
+			pgoff_t *index, pgoff_t *offset, unsigned int *nrpages,
+			unsigned int *max_nr_pages)
+{
+	struct f2fs_folio_state *ffs;
+	unsigned int next, skipped;
+
+	if (!f2fs_folio_has_ffs(folio) || !*nrpages)
+		return;
+
+	ffs = (struct f2fs_folio_state *)folio->private;
+	next = ffs_next_nonuptodate_subpage(ffs, *offset,
+					    *offset + *nrpages - 1);
+	skipped = next - *offset;
+	if (!skipped)
+		return;
+
+	*index += skipped;
+	*offset += skipped;
+	*nrpages -= skipped;
+	*max_nr_pages -= skipped;
+}
+
+static void f2fs_truncate_read_extent(struct inode *inode, struct folio *folio,
+				      pgoff_t offset, block_t block_nr,
+				      unsigned int *len_blks)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct f2fs_folio_state *ffs;
+	unsigned int next, end;
+
+	if (!f2fs_folio_has_ffs(folio) || *len_blks <= 1)
+		return;
+
+	if (f2fs_is_multi_device(sbi)) {
+		int bidx = f2fs_target_device_index(sbi, block_nr);
+
+		*len_blks = min_t(unsigned int, *len_blks,
+				  FDEV(bidx).end_blk + 1 - block_nr);
+	}
+	*len_blks = min_t(unsigned int, *len_blks,
+			  (unsigned int)fscrypt_limit_io_blocks(inode,
+							folio->index + offset,
+							*len_blks));
+
+	ffs = (struct f2fs_folio_state *)folio->private;
+	end = offset + *len_blks - 1;
+	next = ffs_next_uptodate_subpage(ffs, offset + 1, end);
+	if (next <= end)
+		*len_blks = next - offset;
+}
+
 static int f2fs_read_data_large_folio(struct inode *inode,
 		struct fsverity_info *vi,
 		struct readahead_control *rac, struct folio *folio)
@@ -3173,6 +3241,19 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 	f2fs_update_read_folio_count(F2FS_I_SB(inode), folio);
 
 	folio_in_bio = false;
+	ffs = NULL;
+	if (folio_test_large(folio)) {
+		/*
+		 * Allocate the folio state before doing anything with the
+		 * folio, so that the block mapping helpers below can rely on
+		 * it, and fail early if memory is not available.
+		 */
+		ffs = f2fs_ffs_find_or_alloc(folio);
+		if (!ffs) {
+			ret = -ENOMEM;
+			goto err_out;
+		}
+	}
 	index = folio->index;
 	offset = 0;
 	nrpages = folio_nr_pages(folio);
@@ -3185,6 +3266,11 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 
 		len_blks = 1;
 
+		f2fs_skip_fully_uptodate_front(folio, &index, &offset,
+					       &nrpages, &max_nr_pages);
+		if (!nrpages)
+			break;
+
 		/*
 		 * Map blocks using the previous result first.
 		 */
@@ -3217,6 +3303,8 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 			len_blks = min_t(unsigned int, nrpages, max_nr_pages);
 			len_blks = min_t(unsigned int, len_blks,
 					(unsigned int)(map.m_lblk + map.m_len - index));
+			f2fs_truncate_read_extent(inode, folio, offset,
+						  block_nr, &len_blks);
 
 			for (i = 0; i < len_blks; i++) {
 				if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode),
@@ -3235,6 +3323,12 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 				ret = -EIO;
 				goto err_out;
 			}
+			if (folio_test_large(folio)) {
+				spin_lock_irq(&ffs->state_lock);
+				__ffs_mark_subrange_uptodate(folio, ffs,
+						page_offset, PAGE_SIZE);
+				spin_unlock_irq(&ffs->state_lock);
+			}
 			continue;
 		}
 
@@ -3242,12 +3336,6 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 		 * to prevent from premature folio_end_read() call on folio
 		 */
 		if (folio_test_large(folio)) {
-			ffs = f2fs_ffs_find_or_alloc(folio);
-			if (!ffs) {
-				ret = -ENOMEM;
-				goto err_out;
-			}
-
 			/* set the bitmap to wait */
 			f2fs_update_read_folio_pending(folio, len_blks);
 		}
-- 
2.43.0

