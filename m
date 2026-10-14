Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6D147ECF0
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960392; cv=none; b=H2uk8dQ+HoIAjM2yWMCE+QZKa957AEJNkP2GHsy6qwUmdD/eBjrMXhmCtm6ezUVjff2mJlNzqNcTnwbP7iEa7m1Hu+DNunk/tLJ/ei7aeSGeKMimCjNfppB5/dA5s3hOGgCl1UQxPdrqNv8id5dbRP7woVXndh3MV8GCXxZ52CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960392; c=relaxed/simple;
	bh=23OwuS3rJs1PtyNlQ/SaXfKgIk5hueWnT41H/0cCH3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=juBnJp94e8QWI2dAp4uGe863MqFJAWzTEEPpvJsG9wOO6FdeLgJ9jnoT+cvwgoJeEnAiEEimuhn3FZ6ebLKvD4Xy3CBTHQKYi1lObwz9Ls1F2YmxNOaOcSzyK6cP89icDIEo+K6rVRassNtGfL8X6IPIg7hP8GN96jngyMtgd7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Njk4v99P; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Njk4v99P"
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3ac144119e4so1005769a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791960386; x=1792565186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ur+YE4EinDlUJK4OpPyj0bI4FZo3c/8XiooTF3N5tKM=;
        b=Njk4v99P2KAqclVsIvhCE9fThrDEdfWw1acX0tbEH0FWMFQ+pL8YZTW8WecKJpgX+k
         JQXLc8IzJsFzpY8RFl1KdqyZCECjZTAZiYLsRlB+9BtCoADcCJSZTFMVDTHHwVM9Tszs
         bF2UtIK6gKhUnUPG71jE4A+nKqJK1xMPQ/EW+tSlHj8C2TD43o2K4EPHnuz0rYQRmih9
         KM57odCwDtepbOiigfzk/jy7bJcsSS1oz18fF5Vvk662ZyFqDxCLNwjZtftm+Mg0OYPm
         OsFIlraFdRYoJZ56kF3yH9tjeFU1mKKYf6ZKZFqsmUpGWUDFycepnsJAoQyOcJHgGeze
         SMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791960386; x=1792565186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ur+YE4EinDlUJK4OpPyj0bI4FZo3c/8XiooTF3N5tKM=;
        b=DYZSSJDEtEqHNnK+Afuos7Z6P0vzWyYl/qnfxXZYxOJGk7wHIfT/D4vZ+zNLlesFRE
         s84NPnVeLes4l5al/Luym6m9mCvk5+9Mj/r4hrvmG4oNd4H1mrqHq2t1ltjOBe0PSSeE
         6ZALUWdFYdglUaBVhSadNF9krpefwgNsXU0kye8KadrnMwayOprmoUEP9XXZGnu2Fy3p
         Ud9vf+LbqEQvLtZ7BU9HKKSsik6FaG4IyX9RVPQcAc6+UaF2m1igTfFKnqSZ/0oYMRav
         zG26qiBKjVqbfTOh1OUU2LN1PUIQQFs4lk1FuNFg30igD1PG3ZYDcV2H9NJNMp6Nko1Z
         Vvng==
X-Forwarded-Encrypted: i=1; AKwUvBwO9voWmB5lzUIWyZpq+uKecjX00dKdB3qTy1pBl3H4RMgQ5oNU16qAMz9nBd7jzKVKfN8t70bse1YqiyA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK18HUkkI/ECod6YIUV6a8MyAkSQgLUu0r4x+3a7ptMwS+fSONT
	z8r+uRWexgwMks5amP9bnwDQ6wuYW1AUgGK23TNpHV23kyIoI/eI3OTu
X-Gm-Gg: AYBFou3MUSOa9RBg9H9JVj4m/00724/kFaKL177BCFZHZhiYqo+K0wZqEYw0lBI6CjS
	+uBHisotmyq3uE39ripEPulqIOgq1nlkNCiIKSLfMWYIZ1tH0zFZR9eWtfl2IoKNI1oIRaTr2sa
	HhPC0aBka6e2oKIzL9QMXQRiTUREJBr/XVWZe65DOyvcSVlmx2l5sE1sBVYzHj+fRtYjqtw7kp2
	4qWIe2tkAWQ40r+++5niduielXZWU1wtRddpgj/6KxxabjVy1nmPGq+MjaZ9AlHPqE0fdXY/VpW
	i+OWBLfpDLHZJAJ4j8+gTzW2gPlgCz8kL0hrZI6kZI/2uOEdidD3HLc4PNm6mxSb4wzq36rtbnv
	by/TamQ5nXUjmQOiMtrZlrPFs8FA+XAG2N1D+qTqsO+yu7fOn8XdjlO0VdOXUWQfUGf4bX1CsFb
	b0cUZ2MakIkhv80IR8AIuN/5+LkiEXNZcp6V1VXo5E1Zi5YliGysmxEOVzRtWQ46IJ0XMEumANF
	MqtL2ClLT+1kVSi/zQ0qnc6JnWg3xYqgaoz/f0Y/SzjQ38=
X-Received: by 2002:a17:90a:1582:b0:3ab:9c73:130 with SMTP id 98e67ed59e1d1-3ab9c730935mr5606186a91.33.1791960386450;
        Tue, 13 Oct 2026 23:46:26 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f04e324sm3236371a91.2.2026.10.13.23.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:46:25 -0700 (PDT)
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
Subject: [PATCH v5 16/16] f2fs: make compressed files compatible with large folio
Date: Wed, 14 Oct 2026 14:44:45 +0800
Message-ID: <20261014064445.2835813-17-zhaonanzhe@xiaomi.com>
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
index 771216f45207..b4f436ffd9ac 100644
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
index a476464b856c..f6be297f9f59 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3242,12 +3242,6 @@ static int f2fs_read_data_large_folio(struct inode *inode,
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
@@ -5245,7 +5239,8 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	}
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
-	if (f2fs_compressed_file(inode)) {
+	if (f2fs_compressed_file(inode) &&
+	    !mapping_large_folio_support(inode->i_mapping)) {
 		int ret;
 		struct page *page;
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 803e2b9900d1..9282b16fc222 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -5025,6 +5025,13 @@ static int f2fs_ioc_compress_file(struct file *filp)
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

