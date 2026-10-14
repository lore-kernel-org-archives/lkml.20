Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0621E47884B
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960361; cv=none; b=NpuEqHPCvAZh/cVJ7oosqciHOmX7ow2pn5ufcT9bhl7v2SLOUvXmtaCL1ksqUzUE4UfMtkPGCQ5xQQ/R7m/VyfBVNNOpOOJPv6Zo35WxTkDN5WA6QeG3njQvXRlLo9VeacdMHFybnySijdHRYAAMK7KTcpwxAvfcBd3fa7c2B9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960361; c=relaxed/simple;
	bh=bllid9MROFa8+TOVktJ/H/WyEqr14FF1jCT3V95uHeI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KiZTkMY1HZQHHR7PTC7lEKhXT0MKNcLvryR82t/PPT2/hA1qFvR3vxYDQ5cV6QscLlj3PUuGKBqZwvsIY0iRFgItf1E2f+zhIYuMXY7qggGqKs6dy8j86z+k1RBidKko4dH8Yl6oorPZRRE0auvD5K2KrKLKLJRG3u1ow/3j+NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SJ7aBgbN; arc=none smtp.client-ip=74.125.227.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SJ7aBgbN"
Received: by mail-pj2-f7.google.com with SMTP id 98e67ed59e1d1-3ac5f801d7cso148025a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791960354; x=1792565154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w4CSXXM+8AC2FdQHssbklEdRtPR/7CbkAxHC+roAb84=;
        b=SJ7aBgbN3hgOp6KQcUX4oF2TBkTYlko9TLl6i6UhIH2F333XHeRJB3qdd3aZqIpFCQ
         AqVBTSAT/tK3JRNcYFodnvwR0U4yUPCr0pSDJc3kVu5Rrxae+wNxoujww0pHLwytpo3Y
         fe0SsHQ4myvreZdu2LNEUNGP/cHGKr4Ic/WStpDotqtKkRnMY3nBHkG0mrN9lysT4TRM
         qe4dTARXgXCy2Pbl5LS9t24sp1Ng1v4+gg2TIzm8YSxQz/xlwC26JjCr/d+jZ5Zoq7gJ
         MP7GU4iC9AbmMkW3kahsB0vAEmEX8t+0LWNr+cLq/HKNKqpMPp4TWISJbLellohGwuI9
         uBgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791960354; x=1792565154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w4CSXXM+8AC2FdQHssbklEdRtPR/7CbkAxHC+roAb84=;
        b=KCV+OQ9lARx0/NFsqQeONXlDRgpKi6VTxfu/1c6E6mjV2r+YHSU01ZZHySf3tFh8SX
         oySUEHT6bB5FbLHhhmUhwb6TMD6hpT+31ZrqqQ102kZjVY1RQFnqpZ2k5UqIcAqyLqcm
         k9N9LWzhOrunGtDQmkOVgpe5mvW9sNt0+m7A1FqVb5XkJPqYi7LEyKWRwQHwEKXBzPP7
         D9WNZPvO1dUKQyDNNvYtSigm/BV+tpIj+qoR66xJ5MPMC4dCYmoAmrQN24HQW6eRai8a
         zs05tTYKMjlwFjJ1kl1jqKmxgOi6bMTeV1yVVOj/4NY7/IT6Q9XZ8yRT61OOcohtSvCm
         pvoQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2Evc1LAxsunLdliso+jUUO91PRBUYLqfO6atspNw7sS4g8biAEIXzCRwTTWVmh58ZT3t5lhPBsTNhx50=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwCo5U/52MeZ6NEmJUFEB1PBRFsH2HkiCFFxhgz+HNquBhvJG8
	sveF5Se8nc7OO9IM6/HsT54B8QGRnrZe3fIF/8itt5nOBts1HKbyuZ0g
X-Gm-Gg: AYBFou3CdFpoNWm1qXx2UgQ7sSyMDlphMwq7FHf/xHwoUnI6aGx8uyi/uN4nja9qzwN
	tag9RArwzPdT2tFdSGGR+/9bjBh/X7Ak6mMXRIMHx7Odoqg3dpLeouX78d+g4ziXEq8uy6Z08RF
	QfSCeTq/bWLU6yjVniVAEkt1XqhG8qGhGfp6wIRQL3w5PjgGdsIFxnnp7JsEhcSLX5c2CEfX+xG
	nv95RBBrdcYQKmllOeNvpAVB3acA/SzIxucPir81Z1RIwDVflxmgov9MdSHZxTUZ94V1Icpus3C
	L/Kh95FnJ9bhVhCnKk1ZSxa2FbzVcf+3fT1fGxTv90HOMOOeR1nn0l1crq0xIcYyErSnRPpyg4z
	LXYzAyh3N2fJBe001XvSTdwbHMWhKupL7ZKebbThIQkFlA2RdHiAt88KlOJVSyBGAUBNbaPYxFs
	sY9cBYhp9hHiBuoOeLJrWjDJqN9D2qT00OGRj7agt56jubxyjnZP6glAg1sh3pOEo02C7kYDpRv
	+9smVFsOtZXpe0h0rLc24cFs01f0UQv7gnH
X-Received: by 2002:a17:90b:224e:b0:3a8:9db2:a4f with SMTP id 98e67ed59e1d1-3ab3af75ac1mr11361841a91.51.1791960353869;
        Tue, 13 Oct 2026 23:45:53 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f04e324sm3236371a91.2.2026.10.13.23.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:45:53 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
X-Google-Original-From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
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
Subject: [PATCH v5 09/16] f2fs: optimize small block size large folio read
Date: Wed, 14 Oct 2026 14:44:38 +0800
Message-ID: <20261014064445.2835813-10-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014064445.2835813-1-zhaonanzhe@xiaomi.com>
References: <20261014064445.2835813-1-zhaonanzhe@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
index 710213fea7a6..59346b61615b 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -158,7 +158,7 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
 			continue;
 		}
 
-		if (folio_test_large(folio)) {
+		if (f2fs_folio_has_ffs(folio)) {
 			struct f2fs_folio_state *ffs =
 				(struct f2fs_folio_state *)folio->private;
 
@@ -3105,7 +3105,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 	pgoff_t index, offset, next_pgofs = 0;
 	unsigned max_nr_pages = rac ? readahead_count(rac) :
 				folio_nr_pages(folio);
-	unsigned nrpages;
+	unsigned nrpages, len_blks;
 	struct f2fs_folio_state *ffs;
 	int ret = 0;
 	bool folio_in_bio = false;
@@ -3129,11 +3129,16 @@ static int f2fs_read_data_large_folio(struct inode *inode,
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
@@ -3162,13 +3167,23 @@ static int f2fs_read_data_large_folio(struct inode *inode,
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
@@ -3188,9 +3203,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 			}
 
 			/* set the bitmap to wait */
-			spin_lock_irq(&ffs->state_lock);
-			ffs->read_pages_pending++;
-			spin_unlock_irq(&ffs->state_lock);
+			f2fs_update_read_folio_pending(folio, len_blks);
 		}
 
 		/*
@@ -3214,17 +3227,19 @@ static int f2fs_read_data_large_folio(struct inode *inode,
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

