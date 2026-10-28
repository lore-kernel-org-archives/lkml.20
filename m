Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202334;
	b=YEOfKe/cwU2Z82xW2hK72sQwYhNDRVP1w6gH4Syv769sD/g26wzPKDO/O6fjLvOwmU3X
	 VNiO9s1KqIquyzbPmWaW4gg1wpXU1/ZqjGBxS1uCpY6HXlplZwkuHIk+zML0qkYGQMhIl
	 V3vp4K1/rs2NE+cx54HtnY9dJ3926SCorwM0eYAfLsP17PvyJlIjX3Y80Yv+I6+vpB6vh
	 VOJKbOatIjaz0uFfEv56bw5GlM0pNUDibdAQd1v/4XKE/wtxQq59Hrz4+tApbS8+/hFk2
	 50iIdXD9DHotydj0THXJP+rAMrdpl0IYrDD5lEBExToa4rKSa5NQivbwTOzWKkWm5Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ng3YrPEQ5YUZCvhHT4uyTZrIVJh9v7VyK/y80on7mmI=;
	b=hfkQxYnhc7GnFx3fW3789vhKwVWydS4SuDNwXGk9oTi00kwHqpGpNtqzGfj9dovQfpar
	 B0jT/cEisE3gBpWV+nSFBnqCcqBprHK2ofTnT/DAlpUyvKoRNIThDMjYwDaf/U1ISBd3K
	 cy6fWAKTcCn5/th7uj7oETRNrFUtJyKfVph/qMWBC6d69+bz+1N1ak06uYbySDHuoxQe7
	 +o6YhLD3B9ezLJ2xOzgMs/SO4feIlMsI3HJsUMYe6LPZPB+Q/oQgbkG/1zmdW41xktLU7
	 yj+/n5OKqmlDzS+fBho8BFyjU6PdheApP5GIeUKJwfQeOfiQVmrITtejYJ5rn53mehA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a+22kfTr;
	arc=none smtp.remote-ip=74.125.227.132
Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8BB606A337
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:45:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC8BB606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a+22kfTr
Received: by mail-pj2-f4.google.com with SMTP id d9443c01a7336-2e96b8bfb43so3797015ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793202333; x=1793807133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ng3YrPEQ5YUZCvhHT4uyTZrIVJh9v7VyK/y80on7mmI=;
        b=a+22kfTrb7+8ioqryRmXnq4SJ/K9YZpnE7YFV2EzqTrAyxqswRjgR/DNzU8/l1G+uJ
         m4NAM+hQv245p7vIBGEy0l12050F+qrSFAHjnvX6FOGUxyiNshIRvm7jfGP90cuLHH3k
         /IN4WyOh3TJ4fJx2N6nYXakOLE0iY+YeCF99KoI+azU3boZLRaDkAhEWhBQb3RnSutPw
         3ph0JZm29ikWIXLioY2dpmUfvje21lOKaPIHZGMuM92+Kdrdmlc7FIRJSTGrEGKwrpVw
         iuEB+nULwiUiSoXvPuPJ860SbjJZuK7V8fYJC3OMdlyS+YvvZXo7ANNafA3g1Rr70kfL
         lOGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202333; x=1793807133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ng3YrPEQ5YUZCvhHT4uyTZrIVJh9v7VyK/y80on7mmI=;
        b=w6KWlOAHxKDqMky6YL8dtiUgxs1A7yZkEu5PEVeVo/UecyVBvCtMbVbV3ofDpjUMQf
         J92eZ8wdIcO4tM3TFCnsNxOpbMaf8AzaNOp4FMvUjNKJ//E3q398RP3JohILmWQ5CLK8
         d+YVwo/ZKKl2Utc54tGNw6f63EMWLsz85QqAvFhFv2A1RH8Jie1VG0oig5PT5RY1KnTr
         o3wSu5n/HJlthQgRt+kvP+CcpWIdES2Qa/6X8sTInBRUSwSREcA3k+sP1RhLKMvsui6y
         hj4x9LlcqN9TIImtggD2mdjTdxvyRG8nD5BEcE/WSwrpgz2BCatgqKX+uufQxiU6W/87
         srhg==
X-Forwarded-Encrypted: i=1; AKwUvBwmxRGSu1UuC2yBwJT66bzLb8HBY2PQdLjm/ZJwAIsiGeZjraTmcSprgF+9/7TDIi3I1ejcnOSgoYdBokI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0usF6pRQmEOvdaHoTOOQ7WNClEyIj8GzAmfXsP7cnaIn1pX+I
	cTtqofltnwwg/MJbvuEVNpruoU+rIVzbznwoDMWQXwm4Km2Tc1ygcQKa
X-Gm-Gg: AYBFou3nDjmzUCE0lXgkBl7IwZpVIcpNpP/G2I0SunzcdPVM73I+QVr45uqe7mkkisy
	Wfc/OuDsd7gFHy6TEGfsQxWbo8m4J/A2wAdHDaOJ5vpZ9ZDq6XMlkL9bhkjZYci7h7fEWN6VEDP
	sOZnQ0LFBpCMN7qlh5ylODUA/59xiO6IjveN9FToGf/xPhA2tTbcnBRmboN7t00XfUnoRhLJhZZ
	2t9zRabD/D0g4JZoA5XQwYg1jcS7vZ7/dloIdm/5R6eIHpv5OhTjfQLf2KTphhN7cyT2/idH8Zh
	gOujoW6tLwOWGBKxVGWEOAlgNO6uSIvHZOTDq5p1iT1zGY5fSZ25jHxd6UAA1An/ixxTNhi2bM8
	xJAFAcSvCXHMRN6RS6BiTPwl+DVO63u8uKe0ZL5zLooCCjpaMWZtOnoyVUphyKr+HtcjHpnBKdG
	GUm+zv1F8rL3ULfOm1jUT4C9Jo/2DSEEkS83NmK2e9hi1ly0hRzRB7S0bUecyE9p196pSdjDqib
	PGtktIXPHwImQgivcYWbTQ+xh2Tgc4Wpfhtd20daY3DWlpJyzlK+M73vMBuW+Io5ZVj9rOA7tOo
	0nad047XDn0O/FKBKqk5Gq1Fd+qdfE/Boj6YumOpNVZm7uO4Kfm7Fy6EHiXtIDAyCVc=
X-Received: by 2002:a17:903:41d1:b0:2e9:3dd2:a8fe with SMTP id d9443c01a7336-2eb00338c6cmr25488805ad.21.1793202333166;
        Wed, 28 Oct 2026 08:45:33 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6be5105sm24111655ad.37.2026.10.28.08.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:45:32 -0700 (PDT)
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
Subject: [PATCH v8 15/15] f2fs: make compressed files compatible with large folio
Date: Wed, 28 Oct 2026 23:44:06 +0800
Message-ID: <20261028154407.1601430-16-nzzhao.sigma@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028154407.1601430-1-nzzhao.sigma@gmail.com>
References: <20261028154407.1601430-1-nzzhao.sigma@gmail.com>
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

The compression flag is the hint indicates that the inode can be
compressed, when the inode is using large folio, we expected it keeps
using the large folio read/write paths and its data stays uncompressed
on disk until the inode is evicted and re-read

Let f2fs_write_begin() skip the compression overwrite preparation for
such inodes and remove the compressed-file gate in
f2fs_read_data_large_folio() so the data is simply read/written as
regular blocks.

For the same reason, reject F2FS_IOC_COMPRESS_FILE with -EOPNOTSUPP
once the inode mapping is switched to large folios.

Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 Documentation/filesystems/f2fs.rst | 10 ++++++++
 fs/f2fs/compress.c                 |  2 ++
 fs/f2fs/data.c                     |  9 ++-----
 fs/f2fs/file.c                     | 38 ++++++++++++++++++++++++++++++
 4 files changed, 52 insertions(+), 7 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 55798421f2c4..b79bb67ee78e 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -942,6 +942,16 @@ Compression implementation
   reserved via ioctl(F2FS_IOC_RESERVE_COMPRESS_BLOCKS) or the file size is
   truncated to zero.
 
+- Compression and large folios are not effective at the same time on a file:
+  a compressed inode does not use large folios, while an inode which is
+  using large folios keeps its data uncompressed on disk.  If the compression
+  flag is set on an inode that is already using large folios, the flag works
+  as a hint until the inode is evicted: the inode keeps using the large folio
+  read/write paths, f2fs_write_begin() skips the compression overwrite
+  preparation, and ioctl(F2FS_IOC_COMPRESS_FILE) fails with -EOPNOTSUPP.
+  Once the inode is evicted and read back, it uses order-0 folios again and
+  compression is applied as usual.
+
 Compress metadata layout::
 
 				[Dnode Structure]
diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 162bd8ef822a..721b01dd0d24 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -78,6 +78,8 @@ bool f2fs_is_compressed_page(struct folio *folio)
 		return false;
 	if (folio_test_f2fs_nonpointer(folio))
 		return false;
+	if (f2fs_folio_has_ffs(folio))
+		return false;
 
 	f2fs_bug_on(F2FS_F_SB(folio),
 		*((u32 *)folio->private) != F2FS_COMPRESSED_PAGE_MAGIC);
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index cc3c9e51db9c..ab8f5b44d63a 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3288,12 +3288,6 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 	int ret = 0;
 	bool folio_in_bio = false;
 
-	if (f2fs_compressed_file(inode)) {
-		if (folio)
-			folio_unlock(folio);
-		return -EOPNOTSUPP;
-	}
-
 	map.m_seg_type = NO_CHECK_TYPE;
 
 	if (rac)
@@ -5331,7 +5325,8 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	}
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
-	if (f2fs_compressed_file(inode)) {
+	if (f2fs_compressed_file(inode) &&
+	    !mapping_large_folio_support(inode->i_mapping)) {
 		int ret;
 		struct page *page;
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 15bea642e986..cb7a9d4227f4 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4907,6 +4907,7 @@ static int redirty_blocks(struct inode *inode, pgoff_t page_idx, int len)
 	struct address_space *mapping = inode->i_mapping;
 	struct folio *folio;
 	pgoff_t redirty_idx = page_idx;
+	pgoff_t end_idx = page_idx + len;
 	int page_len = 0, ret = 0;
 
 	filemap_invalidate_lock_shared(mapping);
@@ -4924,6 +4925,9 @@ static int redirty_blocks(struct inode *inode, pgoff_t page_idx, int len)
 	} while (page_len < len);
 
 	while (redirty_idx < page_idx) {
+		pgoff_t next_idx;
+		size_t off, dlen;
+
 		folio = filemap_lock_folio(mapping, redirty_idx);
 
 		/* It will never fail, when folio has pinned above */
@@ -4931,6 +4935,33 @@ static int redirty_blocks(struct inode *inode, pgoff_t page_idx, int len)
 
 		f2fs_folio_wait_writeback(folio, true, true);
 
+		/*
+		 * Only this cluster is rewritten, while a large folio can
+		 * cover more than one cluster, so mark the intersection of
+		 * the folio and [redirty_idx, end_idx).
+		 */
+		next_idx = min_t(pgoff_t, folio_next_index(folio), end_idx);
+		off = offset_in_folio(folio, (loff_t)redirty_idx << PAGE_SHIFT);
+		dlen = (size_t)(next_idx - redirty_idx) << PAGE_SHIFT;
+
+		if (folio_test_large(folio)) {
+			/*
+			 * A compressed inode can keep using large folios, in
+			 * which case the compression flag only works as a hint
+			 * until the inode is evicted.  Update the subpage dirty
+			 * bitmap as well, otherwise f2fs_write_cache_folios()
+			 * finds no dirty range and skips the whole folio.
+			 */
+			if (!f2fs_ffs_find_or_alloc(folio)) {
+				ret = -ENOMEM;
+				folio_unlock(folio);
+				folio_put_refs(folio, 2);
+				redirty_idx = folio_next_index(folio);
+				continue;
+			}
+			f2fs_ffs_mark_subrange_dirty(folio, off, dlen);
+		}
+
 		folio_mark_dirty(folio);
 		folio_set_f2fs_gcing(folio);
 		redirty_idx = folio_next_index(folio);
@@ -5037,6 +5068,13 @@ static int f2fs_ioc_compress_file(struct file *filp)
 	if (!(filp->f_mode & FMODE_WRITE))
 		return -EBADF;
 
+	/*
+	 * The mapping is already using large folios, where the data is kept
+	 * uncompressed, so refuse to start compressing the file.
+	 */
+	if (mapping_large_folio_support(inode->i_mapping))
+		return -EOPNOTSUPP;
+
 	f2fs_balance_fs(sbi, true);
 
 	ret = mnt_want_write_file(filp);
-- 
2.43.0

