Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A9242BC23
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960335; cv=none; b=Ut5NFzswsg/iR34eUVniLDyTMyUGW8OKND8yyzRHXFJjUSbEmdJq41/TsC3n/DdPenIXeVQLAenvAtJboqJmhUWfUp0TJCSapO0LV/9sM0BteMc5KpGPAwQu9N45UPO9lIkLqzpTHFW1apKBAb+GeF2YfAHp/Ee3OdtJNvrlTes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960335; c=relaxed/simple;
	bh=IGQnKI/4teyJehOyKWV69Yjxz+vYTQ+xF2+GhtQlmSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aD/E6tiNtD+Aflxejrc+tpQxssK0CayHCnjc/kpAzdq4ybtw6qgrC2r/OJaxD+7FArOXXk38mcM9ulLsJCwCr/CvGMSO2FBSxCN8+fzxG8jByDuzTNEH5goVIUI/XC/yphMfaco/+VtUAolV/4nO4KGUz46TmucFpSRsmCrG3A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YqQleUaV; arc=none smtp.client-ip=74.125.227.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YqQleUaV"
Received: by mail-pj2-f0.google.com with SMTP id 98e67ed59e1d1-3a476ee8669so12426a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791960332; x=1792565132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+1JKUVEv+OR98/CM1h1gzna07C5BqVxZPLGeBP62juI=;
        b=YqQleUaVi8937rhmzKejleYouSRa9Pt9qepIsKn0PWI+TVl7s2vqLSEm7EJClkQLdR
         rPHheVeQwLNb8GUh6Lc4/GyQgt3Syk7uBSH5FtHsk8Ct7zVmav92huqhvJs2AveTFEoq
         UjZOpvN2KX3FskXVcaRIHIZMDSHTc9KNTVn0xg9fE6uK6hdkT7MLFBIDX8CS/TKZD3pp
         PmNVz3yZYkWq5exoC1GiYiR8Q1RXa2Tsq3a69l4zQk1Zf0PfnKx2LeDq35kp38HK10y4
         n7PiEIWNsT9nZZOZYs4VZ3U06BN01DU5xM+Xjv2vO4QnA2icQZNWVp8jdEQxsIvL1bue
         BJGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791960332; x=1792565132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+1JKUVEv+OR98/CM1h1gzna07C5BqVxZPLGeBP62juI=;
        b=R2/TR5PbJ2HmL6E/seF+kZJPcZDFJ+i6Mt2RCiwOCYfxo4X5cqu91e2TSzxwLxs5cY
         FT30s5Lh7QG4RcXBbFku6cRRiV0aHhY7gOBbFiSS0rnsWbjFOkyJhc8My9y+XYOQm8Bg
         X0t4Hp44l+czZ8Fryf4G2J/KOnBJDCBomMjUR1XhrmO+7yMjWfiN2VQGYDOE7s91btjQ
         jt1gqhnmn8+RdLQykk4ULjIPzmoU2c6OrDOOWLPx4kgnBmUKvIfjhq6QoH66qyhoo75w
         fkTlaCJDZ263YxfhBAUYT5cTa1FHcz3/ElVOpuNCoesVOQZS5r7WCKCfVK/07H+vty5A
         42ag==
X-Forwarded-Encrypted: i=1; AKwUvBzLgUMFY0bvtxLTGLi/HlHVUA+0/gwe2NdYHVMB80cHkhCvKi+Twv/yngYSWBo1NgJ8IacTCAhWCD3JdXo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWKSmgZDL8N4cAJDKtzZrBLPggjWbX/ImbFuMiA8+Ap3CXBE3W
	Nx1cCFL9bPCgmQ5o8igGiIm4/pW29+jxis8LcE/gRlkq32i0GE/SDdrB
X-Gm-Gg: AYBFou0mNQ5XrCTp5fiMzKKJO+bqKoFxgPBGr7gYL4ldM2SRbqWCxRN+US7QZz5/9Sp
	Q8bp6U8qatqfRI5qpgWw3rFqYrjqX7INp1xj8d0Hd5jASEoKYGAGGFR8CabvbmiZPPRmw3Na9Hk
	oDGOtFLkISWOIpkJWGDZ9rOKx1OakGtSdigAAwzD3l944SIgJfLApt2cvFAqZiXSLWi0D2+JRYi
	UbbpQ81EzE8PGtCB1tzU44DHMa6e/foNYd1bGfZjssjjkvzLAt+Ac26EeXgFjBh3snpN7fUG9GK
	fn11gIZlsomY50aVYVQHgmaEEIImMu/SN/tkYP3ZfguS5P4zJrWJOi9X59WPt4ovcWe0xqENkKJ
	Bh8KfSnTs6y5d4Hk0fAWyYADOEP16AGE6B3wX8XTWqzrV+lPQzP9HfWUirEv9QKRihHqKh4cev4
	foCyUEG7pbmYheDfc5OXjTDxDh3jid6t7OdLxWRBiEGiiThFHW54t4SWkNmRhhRS5hlpoSiPhV5
	CWVEDVLQUeR9tpETjUgNaU8bti+TDUOWhShHA==
X-Received: by 2002:a17:90a:d2c7:b0:3ab:2d17:51c5 with SMTP id 98e67ed59e1d1-3ab3a32d9b3mr12080371a91.6.1791960331656;
        Tue, 13 Oct 2026 23:45:31 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f04e324sm3236371a91.2.2026.10.13.23.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:45:31 -0700 (PDT)
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
Subject: [PATCH v5 04/16] f2fs: support atomic file large folios buffered write
Date: Wed, 14 Oct 2026 14:44:33 +0800
Message-ID: <20261014064445.2835813-5-zhaonanzhe@xiaomi.com>
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
index a1d2f3b7d9df..c9a213a5e6a2 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -4273,18 +4273,16 @@ static int __reserve_data_block(struct inode *inode, pgoff_t index,
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
@@ -4462,6 +4460,61 @@ static int prepare_large_folio_write_begin(struct inode *inode,
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
@@ -4544,35 +4597,25 @@ static int f2fs_write_begin(const struct kiocb *iocb,
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
@@ -4580,6 +4623,14 @@ static int f2fs_write_begin(const struct kiocb *iocb,
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

