Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648435;
	b=MPeAxTD8B9iewfKiVLTMiqDTGVrIxboj9yel/p919w/h1KezobN93ZEfC/pSq71KqPQn
	 PypH9y5yE/5eClTkpkfQBkWMHTat+4XZ00n3HZRuUvlNDcJL1M22ZoydqiM+ZWnrlHwmN
	 LCtDns1dwqMHK57WnSGaiuIL550V4i0yE52WUTgeyrUortZIaL11QOVnzqWx+smvIgH5A
	 LzcENz/F9Ls3M0uiSh9+05EsNTrZZl+yY2aC5/lPvGS2ozU/58f7E9Bvu3nSuDxBIR+sK
	 i7PkogEdnKzFtxpYsGhZ5ZpLKZHz5irg7t56RZxIbw39hs2WMTJH8b0zWaFcm9meBoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tLGRuSUuH80iDbi4ysKjfpv0HJCSkYOa62c0IAzagSw=;
	b=DrOKYdH6Vj6lY2EthOOIjenmMVHW8GgMQvVzBHcdbmQ2jeTtYb/130xwnhv3NcUivJgy
	 hDSvSRK/GXIm8RcKoekNQ87SYvSPqpQBKl5p4VavdG4tGsdAa+TTeorvrYsHLM0qbqrTx
	 evgEBHeuL36fdECT+z0BtT6Z1UW0c4bSgG8ehI5QhHhCXJaLG5VcG90u+kW7IaP92FEWW
	 JNxPTlD46hw4ntktkxUr9xDOYjBh1CGfguj3Qt8hp1e9zmPpr4Trsvw2xBAabZIeChyuV
	 lZZfXGM5EfEG0zY1P790DjHyj3cDNNVwrs2eu8LLLHAl5dfsJHgcAiN/sCOXJqxfjug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="agSldT2/";
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E446606D830
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:40:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E446606D830
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=agSldT2/
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc4dbda1e5dso1116781a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793648435; x=1794253235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tLGRuSUuH80iDbi4ysKjfpv0HJCSkYOa62c0IAzagSw=;
        b=agSldT2/o3YYjSPhD4DXdcqKYecm8bUKdQhn4tLxkpj6U8pSem2v6PNWPUMCFJMRWn
         g7nutP8ZvpJ6UwhjQxPX41+T9tbcDsg1dWjlN70yyZ+hmAxGmL/AWFL/z2+c1JHxm/0T
         C0a/5AD/dYEJUwCDb4EH3d6HoDB+wrfM1bWEaZJbwZdmDy4AnIT4nQkxdpN8s3QkZBT1
         UBU37A2ECaIvNNyhzkl0OtNepO8+jInViWHfkCKTnEE5DxYX56onRjCjT6cNnhhsvggy
         pdc6Z6k77Pm3iePVphz02mZjNxgiSTOz8wvt+OQ5nOTK2exQRv3DmraBoMGWP9Yrluht
         QWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648435; x=1794253235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tLGRuSUuH80iDbi4ysKjfpv0HJCSkYOa62c0IAzagSw=;
        b=1b6Oi5BLwi5Gfko+Ub51vKfXRvEaqylWeCZ4WDWhme999/B7bHrrThPrAuTmNZZDcg
         ZYeNYTpoKb5QStFAtA87O7U71FRmv2mDuiy6ETAjAYwkO2yUjJsFON5151IOKHEwFDXf
         r4pOsSNKTj3OnInkgspZDRZB8Fx/DvFeQh6TxlsfdHapRkHo/iXw7ib76kKUVoZtyGto
         51wDh5A4Fzd+saMtCeMD/T1mLp3As2lCBwkiw4IVy9PZA2GC+28OBF9v+XHoNy8Quojv
         jQhlwx6VfWl+tiE1fUgkJPbDxQYKINCfmRHRyxU9TsWhu71bkFZnRghwCw9GTQHJmEyV
         l+kg==
X-Gm-Message-State: AFq9FYL8JCJHrG1zESdoIJ77k7cGpO55cMbS2K4Vk3stpCTs8CPr1C3c
	ZvK7a8POU8Cz0TGoPXhBWt4ly06kddw5fkjeMfNJjEwBhHbZOS0gwplj9lXkjr1+
X-Gm-Gg: AYBFou3rxbG6UPcw+s3xh7TqM+3yiK/+sTbCM19phiCj93TIPF6VFzMMIaiumihTg5a
	39rNW6/H6CfsDUsRFVMSTkgAYRnYVlAVHyj2Ttq6eLVFkRsPAHtSL9i44X18OmEG4Tp2PYfQnMk
	1E/+BthrX9GFo0nJvibnv93bsbWOJgeCykBsfXqBmA9o2QaFl/sS/g4hngiOgiDaC7B4tG/8mfT
	xE1bMHcTg2O0eKLT0GWUdgmOzPX4bn5hZbERR4ImW3DjADlXHn+YpyDz/XikPbocWUEDJCHZzMT
	q+7WJo5xR6w4U8270MF/fwCNfIhsLGMbddPKa24cP5eSKP5X+xSCZYVFXM0UkFAxa0Qf7O/sLiD
	ivaOcwpAAZWDC6YQK22k5zpXLket2bROu3t3jQ+R1EW1dvQ4o2QL9RSSFzWnQRZFCReaUXP4tY/
	Ug8sGpZN9ViVg9aR6qJst4kupEJxq+5IQQiLU0hhRgct+TUwldsx6FoLfhVyjqIu1YizU9GIPLM
	3MynUpyCtpWZyj39iTrjubhUOvcHTsRDd6AS4rXVCkWyUPOHNiZ9ytVGAFYC0yZlj7pVLpdXn+N
	DDFlyuoFNCB3+oP9G39Uq4NEpQthddpkGNBoHCNzkRnfF1VY/gWp45rzfsnzMzsdIGuYru84HUn
	NvRTrxjh2/tD9Zr5UTVkr5LjvUcdkS/zLz4GLCBxRdHHO7g==
X-Received: by 2002:a05:6300:6d8a:10b0:3eb:4b16:1afb with SMTP id adf61e73a8af0-3eb4b161f51mr2904282637.56.1793648434687;
        Mon, 02 Nov 2026 11:40:34 -0800 (PST)
Received: from f2fs-test.c.googlers.com.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb364c48d4sm241826a12.27.2026.11.02.11.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:40:33 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH 15/20] f2fs: support subpage blocks in atomic writes
Date: Mon,  2 Nov 2026 11:39:47 -0800
Message-ID: <20261102193952.3002018-16-daeho43@gmail.com>
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

Writeback already writes dirty blocks to the COW inode per block. Make
write_begin of atomic files reserve and read COW blocks per block as
well, and remove the -EOPNOTSUPP checks. Skipping the read of the
blocks that a write fully covers also applies to large folios when the
block size equals PAGE_SIZE.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/data.c | 24 ++++++++++++++++--------
 fs/f2fs/file.c |  5 +----
 2 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index a23fd4b01a4c..4e4d1b0d6004 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -4624,7 +4624,7 @@ static int f2fs_write_cache_folios(struct address_space *mapping,
 		}
 
 		if (f2fs_has_subpage_blocks(sbi) &&
-		    (f2fs_compressed_file(inode) || f2fs_is_atomic_file(inode))) {
+		    f2fs_compressed_file(inode)) {
 			WARN_ON_ONCE(1);
 			mapping_set_error(mapping, -EOPNOTSUPP);
 			folio_clear_dirty_for_io(folio);
@@ -5247,7 +5247,7 @@ static int prepare_large_folio_write_begin(struct inode *inode,
 	int err = 0;
 
 	if (f2fs_has_subpage_blocks(sbi) &&
-	    (f2fs_compressed_file(inode) || f2fs_is_atomic_file(inode)))
+	    f2fs_compressed_file(inode))
 		return -EOPNOTSUPP;
 
 	/*
@@ -5359,13 +5359,16 @@ static int prepare_large_folio_atomic_write_begin(struct inode *inode,
 	/* Inline data must have been converted before reaching here. */
 	f2fs_bug_on(sbi, f2fs_has_inline_data(inode));
 
-	start = folio->index + (ori_off >> PAGE_SHIFT);
-	end = folio->index + ((ori_off + len - 1) >> PAGE_SHIFT);
+	start = f2fs_folio_lblk(sbi, folio) + (ori_off >> sbi->log_blocksize);
+	end = f2fs_folio_lblk(sbi, folio) +
+		((ori_off + len - 1) >> sbi->log_blocksize);
 
 	for (index = start; index <= end; index++) {
+		loff_t block_start = F2FS_BLK_TO_BYTES(sbi, index);
+		loff_t block_end = block_start + F2FS_BLKSIZE(sbi);
 		block_t blkaddr = NULL_ADDR;
 		bool node_changed = false;
-		size_t off = (index - folio->index) << PAGE_SHIFT;
+		size_t off = f2fs_folio_byte_offset(sbi, folio, index);
 
 		err = prepare_atomic_write_begin(sbi, inode, index,
 						&blkaddr, &node_changed,
@@ -5373,12 +5376,17 @@ static int prepare_large_folio_atomic_write_begin(struct inode *inode,
 		if (err)
 			return err;
 
+		/* Skip read if the write covers the entire block. */
+		if (pos <= block_start && pos + len >= block_end)
+			goto balance;
+
 		if (f2fs_ffs_test_blk_uptodate(folio, index))
 			goto balance;
 
 		if (blkaddr == NEW_ADDR) {
-			folio_zero_segment(folio, off, off + PAGE_SIZE);
-			f2fs_ffs_mark_subrange_uptodate(folio, off, PAGE_SIZE);
+			folio_zero_segment(folio, off, off + F2FS_BLKSIZE(sbi));
+			f2fs_ffs_mark_subrange_uptodate(folio, off,
+							F2FS_BLKSIZE(sbi));
 			goto balance;
 		}
 
@@ -5436,7 +5444,7 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	}
 
 	if (f2fs_has_subpage_blocks(sbi) &&
-	    (f2fs_compressed_file(inode) || f2fs_is_atomic_file(inode))) {
+	    f2fs_compressed_file(inode)) {
 		err = -EOPNOTSUPP;
 		goto fail;
 	}
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 1c440b5fa9bd..91f792cf879f 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2299,7 +2299,7 @@ static long f2fs_fallocate(struct file *file, int mode,
 	}
 
 	if (f2fs_has_subpage_blocks(F2FS_I_SB(inode))) {
-		if (f2fs_is_atomic_file(inode) || f2fs_compressed_file(inode)) {
+		if (f2fs_compressed_file(inode)) {
 			ret = -EOPNOTSUPP;
 			goto out;
 		}
@@ -2553,9 +2553,6 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 	loff_t isize;
 	int ret;
 
-	if (f2fs_has_subpage_blocks(sbi))
-		return -EOPNOTSUPP;
-
 	if (!(filp->f_mode & FMODE_WRITE))
 		return -EBADF;
 
-- 
2.56.0.317.g454f8302e1-goog

