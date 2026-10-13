Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4677E4F4D0A
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892620; cv=none; b=mLZKONmWdySnoYxt0AHkL/pwGGy392O2NCQmRxh/X3jy52lCTpka24iEUs2pUAWnsV/BnBngTV5NAXGnHugS7VsQBlrc8AimFP01Z+kzjDEydBmyKHEeHl4bJrOmuy1INCOg93+Qvj1+v76o1Bt+cQ0kg9GZ69bKlhaTZByqKhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892620; c=relaxed/simple;
	bh=cZnmrXnfrB93SQ+VrQKOiWAtWkAE13YYsj5jG+YQKgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rpDXiU0KS0FlIMnTuDSkPqy56Qmc2e7VdlOIEpUGq/GTtxenuJTSI+0aVoNB4mn1ctevV126YxZAsYMc2N6dTLy9+pi0zfwJ/raE57vLc55oArYkODlweyEbT3Do00jwmZfcaxa/aUk8JHFpPZfeMN5bQ40SFdWJgEysJ5SZLSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HD0tGX1x; arc=none smtp.client-ip=74.125.227.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HD0tGX1x"
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3964e7720afso1376323a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791892618; x=1792497418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1JGn4fTJRmMMUCqNv1zrxHNWR67j4kFOuytFeUiq8dc=;
        b=HD0tGX1xbgWfIcHZ+X8vZFGhu8Zkp+AV9jjPinguylrkfIplEiUEbc1AVnm2QBuW6a
         cUSWHX2Nf0j8NBEB6fnQpmpd7jxMFb3xMwek4M3U7SVTCqZcaVgSdHcjB2S+zbRRKHHE
         VSlbyWa4KrSTPJ5TKbjSP+THipkjjBVkW2v4Eg5EN1I01Y+0P7/oeoyt2V6/6MKQJopL
         02vpbx8KLOSfNWxROKOrAYEi3ZFIVWjFdw+dCAqaYSv2WzKBkW6bwnkVo0Rzn8JNhT5i
         E39XwCn7SNMSba0D3Gl9QYRWYpwbe5N0EWZDfM5nQC2v8+Zqbu4lmEQ5lGCPobEzWrND
         P9RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791892619; x=1792497419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1JGn4fTJRmMMUCqNv1zrxHNWR67j4kFOuytFeUiq8dc=;
        b=Zff41dj9eip5gRVcR39kadnoCXRpgu5+ALWCBF+M4zSkr27Sa7EpvOGJ4qGoiJf8bG
         0rBfqTDCK0iQG7GeKW01ZbxC6vEThuQ14JgPMnZvz3kOCN8mHH6ILKXKl3WhDk5fYu5K
         u3q3g0xTLuIttwfk0rEjs15l7YOcF3jF5pRAKGHwJwxPk+7B6UnpNSaUlyxap6TO6AcL
         Rokba2c/J1Hh0GygeanK4dQtTtYScBvs/3SedJK0P8HHSc7LBQrBTPYczNbVirFbb4Uk
         dfj/eF+zWQ0S+mUUK3PMQV617Na2RI8JqSWjYz/HF1C9dLFDmHWWNlYdOBMKAknIIiRx
         0hRw==
X-Forwarded-Encrypted: i=1; AKwUvBz6D7L5fg2y7qU7Nn6FC1VIgQeGM7szlXz21ehcyLjE7HF67bsUejmtvwdSKCIHJacXrCleAx1McITYWJ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIEUEI0AmW+4IbUSr9ZfLMN+/gAcTNGAh/7r4fKpBX52KinF2Iv
	NnstohH6duSRLTQdNryJ5PxIopCH0JLqZr3E6U5hxofJRQk0Wtonj9N/
X-Gm-Gg: AYBFou2oIdwRussAsA9l9BVEeytW+3hUooD+wl4BjtcC6syX6uZwtjTUgCqZggKIdTh
	xLj/8Njc9sJ5bwwVS7mJNQ6N5y92DjzT9ECnWwu5Ia88Sj9rdWWlYm8fRyD6BSrp6PUHA1Rg7Q/
	QNmJeZuknhNoQBLxV2iJr8JbRjrl9b8sSTspkOaRhI/MnBkHaCHyjfSyundPMWuTOkRPWlaoEF3
	zRBDiTCprDaU0cR8Z6xOgE9w18vCTWvY+fjj53sdiINRwNuiD2F9Nzlxq361vFlNZ60Muvj4Wmi
	ZT1X3mvYcELrO6F3HnQw0Ikwo658JmV7rkhTAbRgacKbz4vPV4yKwbStiX2ry6TJsHfP7i9BPZi
	qMy3y53ohMeYWl/0JDRDt/LOFOcb/fD5lAVFbKOVaBdohvieUt4p+IH5hrrmMZWQyT/36Pt7MTh
	CvTc7JlvRZV/WWmTYlZFF0I08qpnlC9GBxjanhAr6lTwGkNiUsRWO+hXelyOyo/lp12th4hKZtT
	lOP0UgBQDcEiMsqQJgwIFxfbA7OBwWWmrLG
X-Received: by 2002:a17:90b:5870:b0:3ac:403d:6232 with SMTP id 98e67ed59e1d1-3ac403d6b24mr1509265a91.55.1791892618559;
        Tue, 13 Oct 2026 04:56:58 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37139b59sm21248516a91.13.2026.10.13.04.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:56:58 -0700 (PDT)
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
Subject: [PATCH v4 06/18] f2fs: support atomic file large folios buffered write
Date: Tue, 13 Oct 2026 19:56:09 +0800
Message-ID: <20261013115621.968742-7-nzzhao.sigma@gmail.com>
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

ioctl can convert an inode with large folio support into an atomic
file. Support large folio buffered writes for atomic files as well.

Add a large folio atomic write_begin helper that reserves COW mappings
for the write range. For partial head and tail subpages, read the
existing data from either the COW inode or the original inode before
marking the subpage uptodate.

Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c | 111 ++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 81 insertions(+), 30 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index f2b89181f..2ae3013b6 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -4245,18 +4245,16 @@ static int __reserve_data_block(struct inode *inode, pgoff_t index,
 }
 
 static int prepare_atomic_write_begin(struct f2fs_sb_info *sbi,
-			struct folio *folio, loff_t pos, unsigned int len,
+			struct inode *inode, pgoff_t index,
 			block_t *blk_addr, bool *node_changed)
 {
-	struct inode *inode = folio->mapping->host;
 	struct inode *cow_inode = F2FS_I(inode)->cow_inode;
-	pgoff_t index = folio->index;
 	int err = 0;
 	block_t ori_blk_addr = NULL_ADDR;
 	bool cow_has_reserved_block = false;
 
-	/* If pos is beyond the end of file, reserve a new block in COW inode */
-	if ((pos & PAGE_MASK) >= i_size_read(inode))
+	/* If index is beyond the end of file, reserve a new block in COW inode */
+	if (((loff_t)index << PAGE_SHIFT) >= i_size_read(inode))
 		goto reserve_block;
 
 	/* Look for the block in COW inode first */
@@ -4428,6 +4426,61 @@ static int prepare_large_folio_write_begin(struct inode *inode,
 	return 0;
 }
 
+static int prepare_large_folio_atomic_write_begin(struct inode *inode,
+		struct address_space *mapping, struct folio *folio, loff_t pos,
+		unsigned int len)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	size_t ori_off = offset_in_folio(folio, pos);
+	pgoff_t start, end, index;
+	int err = 0;
+
+	len = min_t(unsigned int, len, folio_size(folio) - ori_off);
+
+	if (!f2fs_ffs_find_or_alloc(folio))
+		return -ENOMEM;
+
+	/* Inline data must have been converted before reaching here. */
+	f2fs_bug_on(sbi, f2fs_has_inline_data(inode));
+
+	start = folio->index + (ori_off >> PAGE_SHIFT);
+	end = folio->index + ((ori_off + len - 1) >> PAGE_SHIFT);
+
+	for (index = start; index <= end; index++) {
+		block_t blkaddr = NULL_ADDR;
+		bool node_changed = false;
+		size_t off = (index - folio->index) << PAGE_SHIFT;
+
+		err = prepare_atomic_write_begin(sbi, inode, index,
+						&blkaddr, &node_changed);
+		if (err)
+			return err;
+
+		if (f2fs_ffs_test_blk_uptodate(folio, index))
+			goto balance;
+
+		if (blkaddr == NEW_ADDR) {
+			folio_zero_segment(folio, off, off + PAGE_SIZE);
+			f2fs_ffs_mark_subrange_uptodate(folio, off, PAGE_SIZE);
+			goto balance;
+		}
+
+		if (!f2fs_is_valid_blkaddr(sbi, blkaddr,
+					   DATA_GENERIC_ENHANCE_READ))
+			return -EFSCORRUPTED;
+
+		err = f2fs_submit_page_read_sync(inode, folio, index,
+						blkaddr);
+		if (err)
+			return err;
+balance:
+		if (f2fs_balance_fs_folio_locked(folio, mapping, node_changed))
+			return -EAGAIN;
+	}
+
+	return 0;
+}
+
 static int f2fs_write_begin(const struct kiocb *iocb,
 			    struct address_space *mapping,
 			    loff_t pos, unsigned len, struct folio **foliop,
@@ -4510,35 +4563,25 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	blen = min_t(unsigned int, len,
 		     folio_size(folio) - offset_in_folio(folio, pos));
 
-	if (f2fs_is_atomic_file(inode))
-		err = prepare_atomic_write_begin(sbi, folio, pos, len,
+	/*
+	 * Flush the cached IO of this folio and make sure it is stable
+	 * before touching it, especially for the large folio prepare
+	 * below which reads and updates subpage states.
+	 */
+	f2fs_folio_wait_writeback(folio, false, true);
+
+	if (f2fs_is_atomic_file(inode) && !folio_test_large(folio))
+		err = prepare_atomic_write_begin(sbi, inode, folio->index,
 					&blkaddr, &need_balance);
 	else if (!folio_test_large(folio))
 		err = prepare_write_begin(sbi, folio, pos, blen,
 					&blkaddr, &need_balance);
-	if (err)
-		goto put_folio;
-
-	if (need_balance && !IS_NOQUOTA(inode) &&
-			has_not_enough_free_secs(sbi, 0, 0)) {
-		folio_unlock(folio);
-		f2fs_balance_fs(sbi, true);
-		folio_lock(folio);
-		if (folio->mapping != mapping) {
-			/* The folio got truncated from under us */
-			folio_unlock(folio);
-			folio_put(folio);
-			goto repeat;
-		}
-	}
-
-	f2fs_folio_wait_writeback(folio, false, true);
-
-	if (folio_test_large(folio)) {
-		err = prepare_large_folio_write_begin(inode,
-					folio, pos, blen);
-		if (!err)
-			return 0;
+	else if (f2fs_is_atomic_file(inode))
+		err = prepare_large_folio_atomic_write_begin(inode,
+					mapping, folio, pos, len);
+	else
+		err = prepare_large_folio_write_begin(inode, folio, pos, blen);
+	if (err) {
 		if (err == -EAGAIN) {
 			f2fs_folio_put(folio, true);
 			goto repeat;
@@ -4546,6 +4589,14 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 		goto put_folio;
 	}
 
+	if (f2fs_balance_fs_folio_locked(folio, mapping, need_balance)) {
+		f2fs_folio_put(folio, true);
+		goto repeat;
+	}
+
+	if (folio_test_large(folio))
+		return 0;
+
 	if (blen == folio_size(folio) || folio_test_uptodate(folio))
 		return 0;
 
-- 
2.43.0

