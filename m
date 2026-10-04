Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C64E18B0A
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 02:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791082791; cv=none; b=WbGT5ezESKUzQ3F4DXUbdJI9R8aqCE9PiBEOa6wDRF2jxyHrfbBxFLwh8R4N9A6gPwhgqV+YU+OZsMWnk7XjfQwhUrGEvSZDxpfxD5OJG4Uw/jSXvNcdaVhENYhxByLZx3CJkC1lx7IDVKSm4HA3VNm2qK+WCe6DcQFp1dcdG6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791082791; c=relaxed/simple;
	bh=kqaL7ihrMOLXwMT1cXEKvNMh4tLq+4kGfbCXFE0tXLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=icbGdSV2Lu7RXCQLrZVmYsP9hThm5YZSyQPvy5uyDv+oKW5SCH+naYg/Z5my6ki/HXXx1HqZp4S80mIkoBjyPJ4QxkgUdfkmXW0gwKZYivdrMGrPbcrQZnE87JSQ3BCeRPNVW6f4fh2JjuU2roIv+tFp0WWDw5uwGVNL+FW35/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=HFvsi1Fi; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="HFvsi1Fi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=8D
	A33G3PMGkkRtLvHlImnqeYVoOOTU+86ytzFekoRVY=; b=HFvsi1FimOjcIZ/9Hd
	sbkHP1uXodJVQHhKAO6Mcr3Ih0v51RIImbSqWbBLO4hj1IF/WmC2vByG8evAQ+rl
	Ua4pqjAvyryiLVko3NMLxJHJomDGl0oZo/EjXET9yzIPkXcUqyvG5wM/i2pWccwL
	zYTzaohjomCyjUqwUVP7wkOSM=
Received: from czl-pc (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgB3HLn9wMFqhREUCg--.6715S3;
	Sun, 04 Oct 2026 10:59:11 +0800 (CST)
From: Chi Zhiling <chizhiling@163.com>
To: exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Yuezhang.Mo@sony.com,
	dxdt@dev.snart.me,
	linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	Chi Zhiling <chizhiling@kylinos.cn>
Subject: [PATCH 1/4] exfat: advance valid_size to EOF for append writes
Date: Sun,  4 Oct 2026 10:59:04 +0800
Message-ID: <20261004025907.1899933-2-chizhiling@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004025907.1899933-1-chizhiling@163.com>
References: <20261004025907.1899933-1-chizhiling@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgB3HLn9wMFqhREUCg--.6715S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF47Gr1rtF4rGr4kJw4Dtwb_yoW8Kr4fpF
	Wak3W5ArWIq3y3Gr1xGFs8Z3WrK3Z3trWxX3sYkan8ZrnFyw1fKF1UtFyUKay5t3ykJw4a
	qa1vyrWDJr17Cw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UMSoAUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC3B96GGrBwP-wmAAA3d

From: Chi Zhiling <chizhiling@kylinos.cn>

For an append write, the write position is recalculated by
generic_write_checks(). Therefore, the write position must be obtained
after generic_write_checks() returns.

Using the original write position to advance valid_size may cause the
valid_size update to be skipped, potentially exposing stale data.

Also move the truncate_pagecache() check below the recalculated
position, so that pos is never read before it is assigned.

Signed-off-by: Chi Zhiling <chizhiling@kylinos.cn>
---
 fs/exfat/file.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index a2a9ee1a2004..b30aec858da6 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -854,8 +854,7 @@ static ssize_t exfat_file_write_iter(struct kiocb *iocb, struct iov_iter *iter)
 	struct file *file = iocb->ki_filp;
 	struct inode *inode = file_inode(file);
 	struct exfat_inode_info *ei = EXFAT_I(inode);
-	loff_t pos = iocb->ki_pos;
-	loff_t valid_size;
+	loff_t pos, valid_size;
 	int err;
 
 	if (unlikely(exfat_forced_shutdown(inode->i_sb)))
@@ -863,11 +862,6 @@ static ssize_t exfat_file_write_iter(struct kiocb *iocb, struct iov_iter *iter)
 
 	inode_lock(inode);
 
-	if (pos > i_size_read(inode))
-		truncate_pagecache(inode, i_size_read(inode));
-
-	valid_size = ei->valid_size;
-
 	ret = generic_write_checks(iocb, iter);
 	if (ret <= 0)
 		goto unlock;
@@ -878,6 +872,11 @@ static ssize_t exfat_file_write_iter(struct kiocb *iocb, struct iov_iter *iter)
 		goto unlock;
 	}
 
+	pos = iocb->ki_pos;
+	if (pos > i_size_read(inode))
+		truncate_pagecache(inode, i_size_read(inode));
+
+	valid_size = ei->valid_size;
 	if (pos > valid_size) {
 		ret = exfat_extend_valid_size(inode, pos);
 		if (ret < 0 && ret != -ENOSPC) {
@@ -887,6 +886,8 @@ static ssize_t exfat_file_write_iter(struct kiocb *iocb, struct iov_iter *iter)
 		}
 		if (ret < 0)
 			goto unlock;
+
+		pos = valid_size;
 	}
 
 	if (iocb->ki_flags & IOCB_DIRECT)
@@ -899,9 +900,6 @@ static ssize_t exfat_file_write_iter(struct kiocb *iocb, struct iov_iter *iter)
 
 	inode_unlock(inode);
 
-	if (pos > valid_size)
-		pos = valid_size;
-
 	if (iocb->ki_pos > pos) {
 		ssize_t err = generic_write_sync(iocb, iocb->ki_pos - pos);
 
-- 
2.53.0

