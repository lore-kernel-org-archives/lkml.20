Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792985943;
	b=R06dlDn195x+QoYA1rAIeIRmp7bMlVSv1vobK7V2XJMK5cSmAPQhZ4CccIObVeFSJkNm
	 mIAbIdz53WIjw7OHDE7WLOR9btOKFrgKBtd9ZG2+yysYoUCXMnOGBYv1OcyQwV+BeALho
	 G4R8cTO39NbXQVWyTMi3n8nkRBcEidjOcuPIUefLipCFSkNMOfb9iVIBPfD4pjwJZdVG+
	 TlXxdBogoEFVh6KMInS9kTMGxlZdeM/Z+0k/MbObaXDNmR/8VLJTPE49IiKadlwPVLuyV
	 dtHXjIVACVYKw2cDVUJGJaDeOlIU9YNJOB8J9wDSD4tcgSnm9wnx6iCrSg5+jXrLYKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792985943;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jpgh9dYKrbdOId0WvbDJGaczFPlU/X/b0Ot3e0dT6O4=;
	b=VVlU/OyPuVrmTCkXNR4GGgHvdMZvZQzuF5sJikxMtCCNZRjfie9gR094llI5F+fI+Jxu
	 r8Kag8woZFnbVVAyCea6kBG4mn/SlM981xmPbRLtE2QQCrCn0Sn+nt5VQI9gdcuK/X1X6
	 Wc//8A1ccW+6PCPYJprIngmOXOxN9XSAEJW/UkLK/5UHG1vJnDq8XZbwI8ukjm+dfoDhy
	 wPBxoroP6Celm+YBmDBIdHbBFlJhAcEolWMmT24zG9DO8Bqmq96mLOFIewzxUF6wMNGWE
	 r9ZcksxBrLDbl5z5KZicpMwWXb7UMfy2lykMrQadrsjtLo3SpEzb6Dy+wYqf1n+CYxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=geHWvKJe;
	arc=none smtp.remote-ip=74.125.227.139
Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2094F606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:39:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2094F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=geHWvKJe
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-3ae1dca6bc0so358306a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792985942; x=1793590742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jpgh9dYKrbdOId0WvbDJGaczFPlU/X/b0Ot3e0dT6O4=;
        b=geHWvKJeAwXDfr0ltxkalvcCrBGRbFsVZ1t1Rx4cpIyDTkMBcq2R3RF1eV3SWxr+1J
         Od4aXwqqhEK1jd4iyjbvTPWm9sM0cu0zMwY18xaJanhtEKMaxPTRsqqwSrHPACb470+j
         VkhPxzv5skE+VAPiJWcMy3oH1VkXIeR8MywcpUDligv64YHEoQAC9tu0iWSjXMx17Av2
         a/c3oXZlM951FYd7fRXpOFSxgehoS8IkD3smsJYjFShIWtJO8fmFRZPKxvKoTU0Azl+J
         hJQpdncmkefXtF3/lSxk+/3PssDVmHB6RkD2GYC1LW7g0cskdNHbTKzrD7W90JAfmBx3
         gEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792985942; x=1793590742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jpgh9dYKrbdOId0WvbDJGaczFPlU/X/b0Ot3e0dT6O4=;
        b=ymZEfSwDp/tj18oWxf+S3rWTfnC8QN+KKAhI63kfff9g7HUphmOx+c0R9ycVi/QQqf
         aEkpG+Up4Zx13a2mhes/mCH3066WzMPHHVpS25bOGuaQ9aaJD4ETT1H5mUr48YFA8yZE
         RSaAZOE5tgF7fIXT9HnJveY71oFrSIS+876TJl/RE6obbKt6pL7RHFdAfys+sI7L/iDy
         64ZLJeLM1R/o7qYhFiscc9xHsMayD2hoO1t2JNdRcBNlxWUR/F+1H+hOzjHYaTITTfZk
         jP9wJpD/HhrHJTW2XaGn2rMfvPyyDpkzMz1W7imd1K23uPWjT+CacsAmB1Bz12MRZIbN
         qCFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxoKxIKFZfp0X8u79clbBFzCvhd+IjzlQiWCD3EWisbAHdSULVoRWDZGO6/DSZyoxeT0FfV0fDLLla1qFI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUQC70gNz3nTyhM663JaTcDBKlGg8KtC1NZNj8PQ60jDIW5j0k
	aGqeMRmHqVa+o8AUQnjRZEgDoCRVeveySS92WlLhlKMygkP6BXi+5dDs
X-Gm-Gg: AYBFou1UnCUIDA+dPg0myfLcZkZ+iWd8NnCB78qhIt+T4F1Pibb3E8pEK5MVgd8yUJa
	vXCdDCw5zkA+uZHx3vGx7jeg7/FpXj7tLc8qG6XFfbnwIVRBtCgSJvVnvgL07ZJcdPplzngu0oN
	g5fmA4CskWpxkU3KQQl8i88S2MJcDj2XyJbZrDM54KDhByaT2SYSuRXCS1gDMHTJe8GrgbtS15Q
	D97FaXTbadGgPP9Mng4nXQBf2P3g36gjkPdKVT9OXyRvNdo1pUjTboDiFj8CbTVT8OEKXVv6Bdw
	x5cEHkf98BzoZpnio8zsE8nzLCWWQFpRgyzgKrqrqdJ7iOXQN26nbDs24iNaeimOSeeNE3t9MS2
	3wbl+5anjMogqcVJjRWKOTdLoEFhHbjssEkmxZ/Wqwq+sKyeY+lpkIX1OS1X4B2FeuGV8F8TaEI
	VHSMsVqXiaA/lvL9MR+E/3RXJ+W9yruvFT1wymOvLVug1eVxLvuw3LgOv/VHVY1jZB6fR0VoVDD
	mcYezSHnDdueirkMdBm/FHARJ+rGQ98xMqLLsGGg6jvCpWcDErfoD3ooWJILm1xVIgrOO3hx1rw
	EjrROFlgAQMZDOD1nQ==
X-Received: by 2002:a17:90b:1c8e:b0:3a8:9b79:e6ea with SMTP id 98e67ed59e1d1-3adeb122e89mr4984006a91.59.1792985942393;
        Sun, 25 Oct 2026 20:39:02 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe8f0b2sm6409823a91.8.2026.10.25.20.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:39:02 -0700 (PDT)
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
Subject: [PATCH v7 15/15] f2fs: make compressed files compatible with large folio
Date: Mon, 26 Oct 2026 11:37:45 +0800
Message-ID: <20261026033745.784107-16-nzzhao.sigma@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026033745.784107-1-nzzhao.sigma@gmail.com>
References: <20261026033745.784107-1-nzzhao.sigma@gmail.com>
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
 Documentation/filesystems/f2fs.rst | 10 ++++++++++
 fs/f2fs/compress.c                 |  2 ++
 fs/f2fs/data.c                     |  9 ++-------
 fs/f2fs/file.c                     |  7 +++++++
 4 files changed, 21 insertions(+), 7 deletions(-)

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
index 4db92c85ea99..f0d2fcf10062 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3282,12 +3282,6 @@ static int f2fs_read_data_large_folio(struct inode *inode,
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
@@ -5313,7 +5307,8 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	}
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
-	if (f2fs_compressed_file(inode)) {
+	if (f2fs_compressed_file(inode) &&
+	    !mapping_large_folio_support(inode->i_mapping)) {
 		int ret;
 		struct page *page;
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 3d621a20766d..e61c80ae7537 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -5021,6 +5021,13 @@ static int f2fs_ioc_compress_file(struct file *filp)
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

