Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EE64772BF
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960364; cv=none; b=Npq1IQSYZhjeUQcXSUVYcwVffHzwnhyWemtHyfsMWjp9nuIAq3ckMOPU35URgC+abf/eqZA498NclA9gGLwgyWXKKr/TzAyRcBJXmvCDSayvwUageKg6PP352R7YO3IwmFSyeoC4MRQMBGzcEWSBsyUqFAhJsAuY1PWaAssvu6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960364; c=relaxed/simple;
	bh=2bF14uGL6J6dsqGsCLrd3CB04bP7WJNkK+VjpG+Pp4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pHqpmmfevpgY0IERP4U5SxpBKONAdbhetAbqQg+N0Tt2Y5pp5p6HMaz5hBCN6LDPra1MFbKOLmATG4VaXi4zkJHudBAmmOb4M7zeewHOoRmaE8I1MlrQCGZHoTkcPI20uEOIGrkog+MF8SyxFaiYTrevPG42jkLQpH6/9pWxQb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dHBfqJG4; arc=none smtp.client-ip=74.125.227.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dHBfqJG4"
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3964e7720afso1847001a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791960359; x=1792565159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SHO71UYjeP5xAAFO6D76VUy+VSDBc+W35bKfH/3Qvbs=;
        b=dHBfqJG4K+MZaDsZ0tH6hbmiHK+GZb4+Uf7FHXNnZ0j8DXiUJf7MUxA7PZSkXtmFJt
         IgNnxikCqn4NOAJmYVdoWsyyZ3KBzUBSZdwalbh97v3NLEWilD1rrpN9HspzJe+RymZ2
         xjPxxbpN2wsaawiXvTDBvtPN2iHdSyJJ/yX4JedBDB7tezeeDcbIezcN4FRHrEUBBnw0
         W/GqiulvUZA4REm4qpMoiRbrPc917eq+ub2qXfp6+2hWm3aBMEW54TXR12Br/Hl2TUxz
         7Xz29zt0oSb+hpY24UmwRiRjUyCBCsYI/7TBin7x9er2xgHnqdRBs3Dp/La3a+J6M4LR
         aAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791960359; x=1792565159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SHO71UYjeP5xAAFO6D76VUy+VSDBc+W35bKfH/3Qvbs=;
        b=kRsfikF3qyNAg0NFU0vvFmSYN32mb7bPeECKDFpBWKbQkwGQyLBrq/T+e+LqhogZx8
         klDFMMskfyOf3Y3emzKIDTliz9Cf4NkI42AMUHsUSFkhznk0ExdGRBF6o1kYjxBR+MzY
         0Fhp5z0zbgB9gHjqTUuSPnzVCq9uDEAdm+Q3InWScfJJSnybBP/7sLAJwkyvN+m7q3D0
         C8Xu69wJclwLc8wdjelz8ZxuvL/9pKwdaXu2eeK/JR+GMXS9sRSq7pu87R/1RdX9eVPX
         kcIdmunlTTNMxFJrH4GCG2EjfWXA/jx1mNctmMWbA6+tdCZ7D9qM9uc8a2pk0sHYRrRH
         Vshg==
X-Forwarded-Encrypted: i=1; AKwUvBzRIHv9ZiVtflKqaTZ9Oo33gHSGVYUKTc5dZVwVRklcPSWuE/JMcmLowNV0DyWnE+juVrw8TTAaqTpPks0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVQCXgD9+xIKUk3Y/3U1j7/Q3AvZZFKB5lBiXUOWTFwNTFTlyy
	MOQsmNxJj+p80Uf4Y/re05W05QxHaYiUCpm2BeZFWDnJmuAPlN2NBC+3
X-Gm-Gg: AYBFou0TOPK6VvCCklM75939Trk7OSNYy5n4dcsySEDZnTlZl6MaJJO2LFPZ8Lz4bVV
	z3/xnXIxgdc+VxJUwn4V9pFM7v9nokPIdd6SErkLuOFA7Gt0tDTHNILC0bGlP/Am/0pOsPAwqBy
	kT7hmGLuaQyTKH/oPPAoRLrb4H8b2twhcxxoCVkXn6UbZ3x2hI3H7j9Vlsjc7KW0BG9MHO1W9sG
	ug85AjXieGLyO0HCF9tQuSDZjYH9U+oKBN8I9f26c/V5eYPdqsJMR4z/PeEVzetLcptaUdrZY2q
	J2i2RXLlkNRwGLt71P6+j5vwVWvD1JxbPt9NqvduJCAPgR93Rw7n2I3dH1pXQv1BhJ8akAT8p/O
	yn0mFESDpnzolB496ZL69VH7ixzJj+LFUhyFCYdMW/6XSqAJ9KZgZMk7t9iYWnfMUu6TVSG92To
	sCfkLhjQDEkarUyiV7/A+Y33LyUl5j01lJBVzyN3IvcEN1pBji8GuhMPI6/kgpYKBCir/vNPr9h
	Ri+REnjhCbMZ2FUv00rD0gMWRJw09nNJh5iLA==
X-Received: by 2002:a17:90a:d007:b0:3ac:3588:b548 with SMTP id 98e67ed59e1d1-3ac3588b5edmr4808888a91.13.1791960358294;
        Tue, 13 Oct 2026 23:45:58 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f04e324sm3236371a91.2.2026.10.13.23.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:45:57 -0700 (PDT)
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
Subject: [PATCH v5 10/16] f2fs: support partial uptodate large folio read
Date: Wed, 14 Oct 2026 14:44:39 +0800
Message-ID: <20261014064445.2835813-11-zhaonanzhe@xiaomi.com>
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

Buffered write can have write bytes smaller than folio
size for cases when folio minimum order is not zero.
This can left partially uptodate folio in page cache.
So we skip uptodate subpage read in read_data_large_folio.
Also mark hole subpage uptodate in uptodate bitmap.

Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c | 88 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 87 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 59346b61615b..b9f2054f514f 100644
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
+			if (bio->bi_status == BLK_STS_OK)
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
@@ -3095,6 +3099,70 @@ static bool find_next_valid_block(const struct folio *folio,
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
@@ -3139,6 +3207,11 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 
 		len_blks = 1;
 
+		f2fs_skip_fully_uptodate_front(folio, &index, &offset,
+					       &nrpages, &max_nr_pages);
+		if (!nrpages)
+			break;
+
 		/*
 		 * Map blocks using the previous result first.
 		 */
@@ -3171,6 +3244,8 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 			len_blks = min_t(unsigned int, nrpages, max_nr_pages);
 			len_blks = min_t(unsigned int, len_blks,
 					(unsigned int)(map.m_lblk + map.m_len - index));
+			f2fs_truncate_read_extent(inode, folio, offset,
+						  block_nr, &len_blks);
 
 			for (i = 0; i < len_blks; i++) {
 				if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode),
@@ -3189,6 +3264,17 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 				ret = -EIO;
 				goto err_out;
 			}
+			if (folio_test_large(folio)) {
+				ffs = f2fs_ffs_find_or_alloc(folio);
+				if (!ffs) {
+					ret = -ENOMEM;
+					goto err_out;
+				}
+				spin_lock_irq(&ffs->state_lock);
+				__ffs_mark_subrange_uptodate(folio, ffs,
+						page_offset, PAGE_SIZE);
+				spin_unlock_irq(&ffs->state_lock);
+			}
 			continue;
 		}
 
-- 
2.43.0

