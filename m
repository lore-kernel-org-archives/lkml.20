Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CAD2EEE75
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 03:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790998306; cv=none; b=DdAyjTIiviUBXfXc75+Yxj6LqTljmF4rBPdxvVC8ebICBq9IDCUGzqttuKOY2JnZCAJ++ddDeQaKo2lWRahlAL93z/GP2CwxitsqTnA3NJLIzbtdK0/Z2pR5oJQsMuUhTNBQl0bjaNjU0HE4BqFDzD/hG0g5vxOyWNrp0VNMyaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790998306; c=relaxed/simple;
	bh=S8AgFNcOTLW+Dii3hhD17gvKMfTVRi/yZaeU6/7j4cU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qxN+IZg0cIfY5+3bXZyb6fOACx7c6g4SMhA9jz7huyqVg+d/4vXiC3cD1Ai3ZFlwr8FmD74Zem66kJtFI2SR070rf/SV1VkkrcpD+Q6DCZg/C/ILn886a3jpKeoUFk834gfPErKelR89E6s5uLtIl/wZQa6kogsL1AfIpzEvSAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=E7CWlYcd; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="E7CWlYcd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=u4
	wK6MshoSq/0+3s58E/KgrdBd7t/AGyPrD9gpFTByQ=; b=E7CWlYcd2Q50UuYsYv
	dmGg2pxKfP8iyPb1/NmxFcAnsOPlIfNgsSPx+18wN1AClnpSjy0tq4xb2/dIEf9Y
	AUNQtia6xHxxMUd5inilartLmvEfQkrC4zhlTrXUGKJkjxK+6oLwDu186VqD/Vtj
	YyXdAA9GDE6HwqgBBN/7gdLc4=
Received: from czl-pc (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wCXTnLfdsBqOdNwCA--.32914S7;
	Sat, 03 Oct 2026 11:30:44 +0800 (CST)
From: Chi Zhiling <chizhiling@163.com>
To: exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Yuezhang.Mo@sony.com,
	chenxiaosong@chenxiaosong.com,
	dxdt@dev.snart.me,
	hyc.lee@gmail.com,
	linkinjeon@kernel.org,
	liubaolin12138@163.com,
	sj1557.seo@samsung.com,
	Chi Zhiling <chizhiling@kylinos.cn>
Subject: [PATCH v2 5/7] exfat: publish valid_size under the folio lock for buffered writes
Date: Sat,  3 Oct 2026 11:30:30 +0800
Message-ID: <20261003033032.1775311-6-chizhiling@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261003033032.1775311-1-chizhiling@163.com>
References: <20261003033032.1775311-1-chizhiling@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCXTnLfdsBqOdNwCA--.32914S7
X-Coremail-Antispam: 1Uf129KBjvJXoWxGw18Wr18ur1fKr1ftr4kCrg_yoW5uw4kp3
	98K3W3GrWkXay3Wr1DCFy7Xa4Yk34fKFW3Cry8G3ZxZr90vrWIkFyjgFyjkF15J3s7Ar4Y
	qFsY9ry8JrnrCw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jeE_NUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC2wShP2rAduQ2rQAA3i

From: Chi Zhiling <chizhiling@kylinos.cn>

Buffered writes currently advance valid_size from
exfat_write_iomap_end(), which runs after the folio has been unlocked.
A folio that is beyond valid_size can therefore become uptodate and
dirty, and be observed by writeback or reclaim, while valid_size still
points below it.

If reclaim picks such a folio, the page can be dropped while the range is
still marked as a hole.  A later read of that range is then treated as a
hole as well and is zero-filled without touching the disk.  Once that
zero-filled page is written back, the zeros overwrite the data that was
just written, even though valid_size is advanced afterwards, so the write
is silently lost on disk.

Publish valid_size from the buffered write path while the folio is still
locked, via an iomap put_folio callback, so it is never smaller than any
folio writeback can see.  Mark the inode dirty once the write advances
valid_size; the direct I/O path continues to advance it from ->iomap_end.

Signed-off-by: Chi Zhiling <chizhiling@kylinos.cn>
---
 fs/exfat/file.c  |  8 ++++++--
 fs/exfat/iomap.c | 16 ++++++++++++++++
 fs/exfat/iomap.h |  1 +
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index b2940732812a..6bd2b6d28a82 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -751,7 +751,7 @@ static ssize_t exfat_fallback_buffered_write(struct kiocb *iocb,
 	iocb->ki_flags &= ~IOCB_DIRECT;
 
 	written = iomap_file_buffered_write(iocb, from, &exfat_write_iomap_ops,
-			NULL, NULL);
+			&exfat_iomap_write_ops, NULL);
 	if (written < 0)
 		return written;
 
@@ -837,10 +837,14 @@ static ssize_t exfat_file_write_iter(struct kiocb *iocb, struct iov_iter *iter)
 		ret = exfat_dio_write_iter(iocb, iter);
 	else
 		ret = iomap_file_buffered_write(iocb, iter,
-				&exfat_write_iomap_ops, NULL, NULL);
+				&exfat_write_iomap_ops, &exfat_iomap_write_ops,
+				NULL);
 	if (ret < 0)
 		goto unlock;
 
+	if (exfat_get_valid_size(ei) > valid_size)
+		mark_inode_dirty(inode);
+
 	inode_unlock(inode);
 
 	if (iocb->ki_pos > pos) {
diff --git a/fs/exfat/iomap.c b/fs/exfat/iomap.c
index 291367e10c1e..4ed64c67070e 100644
--- a/fs/exfat/iomap.c
+++ b/fs/exfat/iomap.c
@@ -221,6 +221,22 @@ const struct iomap_ops exfat_write_iomap_ops = {
 	.iomap_next	= exfat_write_iomap_next,
 };
 
+static void exfat_iomap_put_folio(struct inode *inode, loff_t pos,
+		unsigned int copied, struct folio *folio)
+{
+	struct exfat_inode_info *ei = EXFAT_I(inode);
+
+	if (copied)
+		exfat_advance_valid_size(ei, pos + copied);
+
+	folio_unlock(folio);
+	folio_put(folio);
+}
+
+const struct iomap_write_ops exfat_iomap_write_ops = {
+	.put_folio	= exfat_iomap_put_folio,
+};
+
 /*
  * exfat_writeback_range - Map folio during writeback
  *
diff --git a/fs/exfat/iomap.h b/fs/exfat/iomap.h
index fd8a913f7794..39c93f8cd790 100644
--- a/fs/exfat/iomap.h
+++ b/fs/exfat/iomap.h
@@ -9,6 +9,7 @@
 extern const struct iomap_dio_ops exfat_write_dio_ops;
 extern const struct iomap_ops exfat_iomap_ops;
 extern const struct iomap_ops exfat_write_iomap_ops;
+extern const struct iomap_write_ops exfat_iomap_write_ops;
 extern const struct iomap_writeback_ops exfat_writeback_ops;
 extern const struct iomap_read_ops exfat_iomap_bio_read_ops;
 
-- 
2.53.0

