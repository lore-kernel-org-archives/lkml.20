Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B7B336883
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789446340; cv=none; b=bjtaBwha0JyET3+yin6xnkBKO89TRWTyZcsCpkYihJ/ibaIjPhPHtV3gI177Tb8ieBLZ8izD/vE2ML3f96l9V6JZoAbknnRXzlmupn4BCa4Qvtpv/956A0hHX6zYSJbH+5fl6UuXAXD/qHeMVNrqWcJFCt92jg+bNV4J0L1CDIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789446340; c=relaxed/simple;
	bh=zu2r8fKg37WUcJm24sbqJsnSwlTxVzemQnIW9xyeMKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eKF6UoZIN/Z0UzflcI5J9S8OTfPCFLUz/SZ5stPRZIvzhdp0toiB5I+GtEQhlI32jAUlaq1KZZiveKVxlZD3clSVG+c6/HTb9kljAcCphGyxEbZHdLVN+XTYOAh7++P3A41OEKLBqGvN9vXBjzyqLfn27M6sAxX3WjcoOAWz4gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=fDc69c98; arc=none smtp.client-ip=117.135.210.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="fDc69c98"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Ll
	7cLNOzxNOjZdNKXLvuqbWxGXfC8y1PJVzt99BmzAw=; b=fDc69c98ey1yoFI5Jd
	hmFi+sStw1vUqj+sadIU0NywfwAx5Xts/Ab/6mUTJ2uTmxgNt2PMtX+BGjHOglhr
	cbmdFvVzaHB/hEaeXpfptLLJFdiXEdqpupCn+qSfhhYpdViVjV07N0VkBh6tndEK
	l4OU8F+ICRla9hczG5Ufvd0h8=
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDXG+KfyKhqTDskBQ--.23380S5;
	Tue, 15 Sep 2026 12:25:07 +0800 (CST)
From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Barry Song <baohua@kernel.org>,
	Juan Yescas <jyescas@google.com>,
	Dev Jain <Dev.Jain@arm.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Nanzhe Zhao <nzzhao@126.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>,
	Nanzhe Zhao <zhaonanzhe@xiaomi.com>
Subject: [PATCH v2 14/14] f2fs: make compressed files compatible with large folio
Date: Tue, 15 Sep 2026 12:25:03 +0800
Message-ID: <20260915042503.2912616-4-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915041909.2903887-1-zhaonanzhe@xiaomi.com>
References: <20260915041909.2903887-1-zhaonanzhe@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXG+KfyKhqTDskBQ--.23380S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxGw45XFWUJFyrJw1fGr48Zwb_yoWrJr4fpr
	W5GryrKrWvqryUuwn7Aa1Ygr1ftry8G3yUZFWxKw18AF15XrnY9FWxt3Z8WFWUJry5ZF4v
	va1jkryUX3W5taUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jOdbbUUUUU=
Sender: nzzhao@126.com
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBowMf7mqoyKN04wAA3v

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
index b130e43b4566..fa0f8449a12c 100644
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
index c9dba8d0ad3d..f5421334ecf3 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2941,12 +2941,6 @@ static int f2fs_read_data_large_folio(struct inode *inode,
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
@@ -4828,7 +4822,8 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	}
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
-	if (f2fs_compressed_file(inode)) {
+	if (f2fs_compressed_file(inode) &&
+	    !mapping_large_folio_support(inode->i_mapping)) {
 		int ret;
 		struct page *page;
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index db71cadefabd..c5cb0b0384b6 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -5002,6 +5002,13 @@ static int f2fs_ioc_compress_file(struct file *filp)
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

