Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD324F68A2
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892679; cv=none; b=blE3oaxi+hFPEjmXwlCiwm6P7XE1Eayf3ACj5x6/UKgWoQCO/ScKbl7jKYTbBc1dlQ7DkUY0G//aFEYro6sprUiqsUc4rCT5Zgrk0+rqqABC4o4pWnAzDMtug3RcbOpsobVpzidYt/P+hoe6UcBGGmwENi1VEaz66XRwQo/Q4WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892679; c=relaxed/simple;
	bh=KKmwFe5PkWAx9GgCZXmK26s3NjYAiBdL3nsUkmCoLvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pthV3T61H+EjirLBfNJ/3PDgSjl4R2GMoP9tLGYIXZDDHd4YjbYH+XcLpfZ0MQV0AI5gHRgpIJUsNixLTIXU6KMSE0j3VqdRvkJwGfShgNNEdy6vtUr8f60clKHJCu0XEr52aOP2IgFq1d7Wq0ASMwcmuKH3B3bRtVtq8O+zl/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EX8byVtV; arc=none smtp.client-ip=74.125.227.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EX8byVtV"
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-3a7026b3123so362332a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791892677; x=1792497477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rEuvSE9QQ+v1bO5qTe3vxnOsinVCD9JZyeyKZPpujCg=;
        b=EX8byVtVY/WQWufogD+NflC+p4lSfI5dexk2OM00HAqYiKAJW/lalU/7Ik2QIwukMA
         f2+FFMG2Pa0CZrNsTpDIYVlulXD9Vx8MyJqm3nB3kndM12koLN8rVxiVImu4grCyllnd
         izm6Evuk0YP2/9TQNuu2MFPIlGBAxeSHANW6iL3hu0URAlItJX0GS14AEXYIBD3iLfUx
         gFJTiv1pJ2Z3B4+P7ykvoeQLx3dv2UzF2FGt4x5dhlx6VaZY53RD8ZN70BHKjty5QrfO
         hP/NxOCBV0ZHgRJQpIWZjC9pTzYZz6ZJInhwQynO5NkIyBckvcJla8f55jWU4jcssD4a
         25kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791892677; x=1792497477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rEuvSE9QQ+v1bO5qTe3vxnOsinVCD9JZyeyKZPpujCg=;
        b=DuHBV1g5sPBf8+uer/kfCbx0i7oNVUBJncdd/dtZx8tUXZJPOeJiCh7QEKfnFBMCQ0
         AhQH1vBuUHtmSV45BabaK7NaOuR+MfrSL0n4Hpn33VAIp16ashc7tEXQIRX/jKkPZBOX
         TzPUYp72NcatJ7b/Ou1a6+wBZE0MPVvaFHHTKGqXIAaWhWkAbCzGDXs3UQDhVPbbirT9
         vdHoKFOqehOEWZKYXgoekNxHXNttBHUwDCIxzvehAey18Aod90A7WtCUUwc0HcVpa/xX
         8gENLg9/saa+zuq6u95raE8byUlAS6kYjHf2sdp6pHqh7Q/SJ+TAEXIvyOVa1bPNFSlS
         Fxqw==
X-Forwarded-Encrypted: i=1; AKwUvBy/TioUPVSusIX3r657F5BSCYWST0BgpWovZTswStXh0ucwWt71S/NrSQJH9WKKtFTk/C1ghy/PyJWcixs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVv5BKMDaLNw/Py07rkhEziDFhSSoP4LnRCcDbMIn6113K8K2x
	1UMuPMXCN9rDrlflTxTBS/DzqNdotFsChablrouA63V3KKY8svRtcQdN
X-Gm-Gg: AYBFou0OBwcfc35T4PFUGwO/KqWzMM1DBHyLe/FbO41793VtGZOD67hMIfcfZu09bG6
	UUQM2rsB9MrTSS1OLIRXXu1WaYF0l7FNNiWqEBeHKLCNZMIJx/J0VTshKDyAzTYNvTa35562AFD
	7Pp4knV28juCWBfhBg/h5NPjfXw1f4QSDvEuh1xpbIx3BRXs7zIt0be3b6x1x3mXnZO8Bok6eMu
	ALvwIjzCjQxZOkpDvUSB6ZMqrYoTbCCjvLYTE7lPQspf4lyfQHqKIaH4Es/0yazxD5kj1I2zYck
	J+D86g2EuRcgumzXxfcIcXb/0hQl4/FuwlguLwAWzNrFYE9q87Bls1wSwAe2H5U3x0WSkjBybU6
	SRRvj+m6MRE04wpVzvoN1TB479+zZMBNYYX43+qcyMCkL7Yk1U0ZKMp7LC6l7TZeEIaCeOiwvrA
	F3zVuxu2E0UCb9FxwSbMZL8NuD2zpsjOf8o0zuBaSlE/ZKYhOfd7TwSYA/jZSs8pJNQwH3v9HYs
	Iuf2wTjlleyOW5HszSdYNIFB963ncnQW7b4
X-Received: by 2002:a17:90b:2886:b0:3a6:fec5:c186 with SMTP id 98e67ed59e1d1-3ab3acf7535mr9649908a91.46.1791892677450;
        Tue, 13 Oct 2026 04:57:57 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37139b59sm21248516a91.13.2026.10.13.04.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:57:56 -0700 (PDT)
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
Subject: [PATCH v4 18/18] f2fs: make compressed files compatible with large folio
Date: Tue, 13 Oct 2026 19:56:21 +0800
Message-ID: <20261013115621.968742-19-nzzhao.sigma@gmail.com>
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
 Documentation/filesystems/f2fs.rst | 10 ++++++++++
 fs/f2fs/compress.c                 |  2 ++
 fs/f2fs/data.c                     |  9 ++-------
 fs/f2fs/file.c                     |  7 +++++++
 4 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 771216f45..b4f436ffd 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -941,6 +941,16 @@ Compression implementation
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
index 3d26bdd4d..f9839e2e0 100644
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
index 0e139b4ca..3647d5e97 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3243,12 +3243,6 @@ static int f2fs_read_data_large_folio(struct inode *inode,
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
@@ -5202,7 +5196,8 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	}
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
-	if (f2fs_compressed_file(inode)) {
+	if (f2fs_compressed_file(inode) &&
+	    !mapping_large_folio_support(inode->i_mapping)) {
 		int ret;
 		struct page *page;
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 9cee36258..6cd8df7a4 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -5024,6 +5024,13 @@ static int f2fs_ioc_compress_file(struct file *filp)
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

