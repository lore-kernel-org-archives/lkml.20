Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE174F85C4
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892645; cv=none; b=qG6VjWau9rCMGInVvMv56GTi7npXl+gl0Jzc/4DecqqJ1RhKWRqMx854f48ePep+DdCerHx/dRHIkuefdGJWdTD53vwXeBOK46RZYh4LyEEwoOcDKcQq3tPt+dss5sg6psOtQvGKWjM+PsiXStJ6xtUfvf2UZLPN/T+Y6UCeJdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892645; c=relaxed/simple;
	bh=YqjgejYAOR8dNi0uDXbsJHuPqU9FULGhl6Ue/xnwlA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CaQDN3CPl5DcT1AN1fXS3oeHSI5Y2Luqtx1dtJvyqkC5fu3jWxYQ/r22nlIewalCy5nktj2mIU651FlsEIoxh5L+4koSullsO7udgZZe7IigwxA8GFxU3hCtcji4aa2LV9H96BX5urwJGca3EXMvJUVmRKtw1uB+81ANQma2uWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pZOQfber; arc=none smtp.client-ip=74.125.227.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pZOQfber"
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3964e7720afso1376504a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791892642; x=1792497442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=senjnjxqBDGx5hk2ld0D1T89Rh9/oU3kWKubbK2Ik0Y=;
        b=pZOQfberstKW/5bi7jS17JVnsTZvUqFjsjKPfG+p0Ytb3kNXGwEB8mFMMc9Vl/m4Gq
         llF3EA2c4Y0HEenqUflZzUN/A5+tdTGpw0so9+l04i8lTfFQ3GZleSTNSNRKKD1bURoD
         tVzcYENGwpv4vcGS5lzL5oDjABAfrIQkhbNrgXT1crD3W8wyYSg+eIrA0vbgJpKz8uYS
         6gQegD4N+9JPYiVQF+CFV0qr0quAlv5+WhVJHRl+fsL/JFfmJoqjyI7O0w8/Fwi2h4mI
         pEpC5rYsPloWeqKoATrccbbouou15H8DKgNuu0oWLh3Qk4wmQ/xR0XzjdJG4hA3U1nIA
         Lzgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791892642; x=1792497442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=senjnjxqBDGx5hk2ld0D1T89Rh9/oU3kWKubbK2Ik0Y=;
        b=K5LZjpgHNys+pLgKVWU0niwUlorY8qgTMN5uvvfgY7QAve/8QkCm5sYH+KxLIE/P3u
         2f5qVkOxLWKjjbqcrtZlPXeUAP2RGQC6/vvfkmmYqYJoQOpZSBQs+FqpyxlL1gH67SHI
         xB6H1Z24oDp9hcI2su/eiwV+AU4/kvWmnniarBDtx8F2Dt+6atp0zRb9TLpTbYr91qFk
         eqV3mDyDui4fa1GEFMY7FIAtZUMGEU7gWKDIUgclTRhLGgI/M6Gcovgi9gv1zFYzFBGN
         3ceLliUafUlj03NycU0G9gfo5tlYpX4Gq/sCTF3EO3iXqa9mH6YdLMkDJhAriM5RWcqB
         /WGA==
X-Forwarded-Encrypted: i=1; AKwUvByEokIlpTmhUDjchOxMMt7dHrT9wKFNwJqq/yyXKF6foBAgPcKBMFWh48LtRusqKpp5FaHdxT+9JvAhd24=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxhhvX+3TTckhPtlywVOkUHK3l02wjNVYCXGeOMBRDZfJddSck
	YtyHXwIdyBgfJARbb9H70sR3+79LITKLB6nG3IJe8pyH4++sTIZmnabi
X-Gm-Gg: AYBFou3Hp2HBYPdEuZx6a803ydZaBn9LsFKCr1+FWJK2l/YgJsBcADYg/X/HPvnpye4
	SVnq1Jkrt65Kyulz/2wOyt0TCrof60MlnCdxkKIbrkrtL/L/K75655X/a/bIsq0ooX4EUYLBl+7
	1ziH7erYLbH7nTb2eWsdfSlDZie888LNYjS3oqYtpHj/XZuRhj+YL0tm4FnTpCiYgShtt5AlGGS
	Jn8oGTNV1UtlQ1di4F4p7vwRpBSa7JIPiQFKcs3No8aJzQ+CbsoCUtHqaOsC5ryFBjfnq1bELyv
	178ovZ6Zi/Ltc09Q1D8t9/SGG8g95hJ3JvA1sOK2WVDke07RxIHGMSztoO94ZUYVZ/dGGRdCS41
	QxtC6Zx6wZodsXzIITgNYnSwA5pTRjsDaobIenpLfSv/Pe5fIXa6ptGpb4DD6i6+xMxfIFlnE3l
	QzDd+8GsBKYC+VPruNbLocwEDDFje8gL9qlhbm2qyXUpoLkSIWN1oAyWAud7z1b0ceKZHLEDze9
	+9b7rT/lTJel7gzlgQO8nw57j4vOuzcYiIZ
X-Received: by 2002:a17:90b:1c08:b0:3a7:ab31:2f4f with SMTP id 98e67ed59e1d1-3ab3a778481mr10559692a91.28.1791892641866;
        Tue, 13 Oct 2026 04:57:21 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37139b59sm21248516a91.13.2026.10.13.04.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:57:21 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Barry Song <baohua@kernel.org>,
	Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
	Juan Yescas <jyescas@google.com>,
	Daeho Jeong <daehojeong@google.com>,
	Dev Jain <Dev.Jain@arm.com>,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	linux-kernel@vger.kernel.org,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Nanzhe Zhao <nzzhao@126.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: [PATCH v4 11/18] f2fs: optimize small block size large folio read
Date: Tue, 13 Oct 2026 19:56:14 +0800
Message-ID: <20261013115621.968742-12-nzzhao.sigma@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013115621.968742-1-nzzhao.sigma@gmail.com>
References: <20261013115621.968742-1-nzzhao.sigma@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>

The original f2fs_read_data_large_folio() implementation has limited
benefit with a 4KB block size, mainly because updating
read_pages_pending greatly increases the number of spinlock
operations.

Use len_blks to batch read_pages_pending and iostat updates for
contiguous mapped blocks.

Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c | 45 ++++++++++++++++++++++++++++++---------------
 1 file changed, 30 insertions(+), 15 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 4484f65fd..8b9a4788c 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -158,7 +158,7 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
 			continue;
 		}
 
-		if (folio_test_large(folio)) {
+		if (f2fs_folio_has_ffs(folio)) {
 			struct f2fs_folio_state *ffs =
 				(struct f2fs_folio_state *)folio->private;
 
@@ -3119,7 +3119,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 	pgoff_t index, offset, next_pgofs = 0;
 	unsigned max_nr_pages = rac ? readahead_count(rac) :
 				folio_nr_pages(folio);
-	unsigned nrpages;
+	unsigned nrpages, len_blks;
 	struct f2fs_folio_state *ffs;
 	int ret = 0;
 	bool folio_in_bio = false;
@@ -3143,11 +3143,16 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 	folio_in_bio = false;
 	index = folio->index;
 	offset = 0;
-	ffs = NULL;
 	nrpages = folio_nr_pages(folio);
 
-	for (; nrpages; nrpages--, max_nr_pages--, index++, offset++) {
+	for (; nrpages;
+	     nrpages -= len_blks, max_nr_pages -= len_blks,
+	     index += len_blks, offset += len_blks) {
 		sector_t block_nr;
+		unsigned int i;
+
+		len_blks = 1;
+
 		/*
 		 * Map blocks using the previous result first.
 		 */
@@ -3176,13 +3181,23 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 got_it:
 		if ((map.m_flags & F2FS_MAP_MAPPED)) {
 			block_nr = map.m_pblk + index - map.m_lblk;
-			if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode), block_nr,
+
+			len_blks = min_t(unsigned int, nrpages, max_nr_pages);
+			len_blks = min_t(unsigned int, len_blks,
+					(unsigned int)(map.m_lblk + map.m_len - index));
+
+			for (i = 0; i < len_blks; i++) {
+				if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode),
+						block_nr + i,
 						DATA_GENERIC_ENHANCE_READ)) {
-				ret = -EFSCORRUPTED;
-				goto err_out;
+					ret = -EFSCORRUPTED;
+					goto err_out;
+				}
 			}
+
 		} else {
 			size_t page_offset = offset << PAGE_SHIFT;
+
 			folio_zero_range(folio, page_offset, PAGE_SIZE);
 			if (vi && !fsverity_verify_blocks(vi, folio, PAGE_SIZE, page_offset)) {
 				ret = -EIO;
@@ -3202,9 +3217,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 			}
 
 			/* set the bitmap to wait */
-			spin_lock_irq(&ffs->state_lock);
-			ffs->read_pages_pending++;
-			spin_unlock_irq(&ffs->state_lock);
+			f2fs_update_read_folio_pending(folio, len_blks);
 		}
 
 		/*
@@ -3228,17 +3241,19 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 		 * If the page is under writeback, we need to wait for
 		 * its completion to see the correct decrypted data.
 		 */
-		f2fs_wait_on_block_writeback(inode, block_nr);
+		f2fs_wait_on_block_writeback_range(inode, block_nr, len_blks);
 
-		if (!bio_add_folio(bio, folio, F2FS_BLKSIZE(F2FS_I_SB(inode)),
+		if (!bio_add_folio(bio, folio,
+				len_blks * F2FS_BLKSIZE(F2FS_I_SB(inode)),
 				offset << PAGE_SHIFT))
 			goto submit_and_realloc;
 
 		folio_in_bio = true;
-		inc_cache_count(F2FS_I_SB(inode), F2FS_RD_DATA);
+		for (i = 0; i < len_blks; i++)
+			inc_cache_count(F2FS_I_SB(inode), F2FS_RD_DATA);
 		f2fs_update_iostat(F2FS_I_SB(inode), NULL, FS_DATA_READ_IO,
-				F2FS_BLKSIZE(F2FS_I_SB(inode)));
-		last_block_in_bio = block_nr;
+				len_blks * F2FS_BLKSIZE(F2FS_I_SB(inode)));
+		last_block_in_bio = block_nr + len_blks - 1;
 	}
 	trace_f2fs_read_folio(folio, DATA);
 err_out:
-- 
2.43.0

