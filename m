Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED1D397694
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 21:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788901513; cv=none; b=R4qsjeducI3rCHtX0dBYPZ8QBwnZPz03mhYLcxeyhIirs/aS3/X2Tq+R++lm6F5gv4WsQpu/Gztcv9npt4zUqiJqlUI/l7DQd5amU4rJLDSZvP1IxpGbJVoX6j5ZCdeJR5m+Lzd81QtpsI9lYp/hL2imhK92JIIpx3SC33cUJWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788901513; c=relaxed/simple;
	bh=42I35uP+T2RKk6zm3JgzNzDDhA62OAJCoQgZDD/A9vg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TflqAupMqm91abRYH7zXFBYmDE5XVSYIne9tNttS4HWP1AfNDIzJr5zGNXo7aFer5lO55eOMVRNsJps4eM2atZ8nEU5ymM0MFP1bcnZCkKapS2qwM3X6/6JcCsve2AVEy0N5fKYqy5DmQNnLBl/0Zm38iH0jGe8I7eti6qok9Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com; spf=pass smtp.mailfrom=dubeyko.com; dkim=pass (2048-bit key) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.b=GJMoyE9O; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.b="GJMoyE9O"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-66bd7857841so5336080d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 14:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20251104.gappssmtp.com; s=20251104; t=1788901511; x=1789506311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qge724P+XpXSfbtGHt9SyIYo0wf5keByX8rsQYDNqZk=;
        b=GJMoyE9O0H4qJQRaB1oHDK+Twtrzk4EYapBEAYjkZJbuG6Lx8rxZRx6KKot+kREs+s
         tyJPEaK/3+z+Yiq/bqb9tdzDhBVSOI/fBL87intr+4ZiExkSto/Z7AugEA9iYLjvRgxj
         TiokpjU60u8/KoGKEVNSXvkI02wru79bmK865Vtmayru0nE4gC0UXBBINmh6X/H6WbfH
         5zDKMsJZxQ1mFWA44+ciXO4hnEBJNEkrU0WzIeVa9cErYY8KoOdBsGFMX8LoQl863Lsx
         Fj4Klz8XpIb8K5+XVJc23XgNgAIftj8b+OOCITE5OCuh2/X1CL2QQ/AbE3PXFQNgC300
         n+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788901511; x=1789506311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qge724P+XpXSfbtGHt9SyIYo0wf5keByX8rsQYDNqZk=;
        b=Scc/r+On9L9TfQ856KyvFg0CG2N2nMvavIJuHMRseqjcObik6fSgbH81zFVn8ZHNwX
         9w1lp5lnbax5rmIEfrg2DN+/BZv70q/6nKTxXUFnWNN+EE42wXllzcen048ptBbnt5IS
         HF71hqLPVoWCFYUF7XJ8LLWElRPAM0MiXx3vFHIn8XqVp12Hu52GPym29X6PAKyjpElr
         68iVr+fOoOuUwAj3Afcsle8ZXbmrrWlpWcUmk/20/DooFDD3TufdNfY/N3OynZhg3Ytc
         hQQBs5nLJ58tAk8m4zABNgxX1Uvcfg2oo40nCD9FzMJOI176ueXbQRypAJ/z/Q4/54XB
         eDKg==
X-Forwarded-Encrypted: i=1; AKwUvBy6A8pzhmHde+8OLNs8nJbvgk/fAC38VkG3pdNw90keNaDalzM63R7hVXGfkFCDBzK5ewyxAjihzRSh59I=@vger.kernel.org
X-Gm-Message-State: AFuF++nkj/e7wdgNOCJpipAvKoVr56pe7cNXWosGZ4pJePexWIkEXW5d
	PdNVUuDheAYqoFQlnAbQj9u1LuH3HUc0BiUkdO7M5/C9t8o0k63sKB0OhgEqjv5yQf0=
X-Gm-Gg: AYBFou2x5FOgDtU6qKPBUNyPMb3LTKfkHxViMmY9F3Y2mXaGBtkCsvIopg0rzIkOM7t
	O79Al4y6PdfbejSNgCSw5NbExut7cvA8oTUfcLOLeO+nuyVIXxFGQhEcbinBslL+ugMwfHmON60
	BrnrhsiRlfbAh/afUYccAGuHSTbYcCjf4InDd14E8gmwlQKJVpjzutxSyDJq46XCRL9owfT6pdo
	jsSRcabcdmHQfNyB6OaJRNJhH8NyRY5ESK7Q0q+OcvIHlFCbCt/1tsvODyzB/pXXe0VTJLBW2ak
	RFGRlpGPMtWvpTxryaACd03hANqP0aFSp0Tx2lHp386vXd6iKEPy9JF2rcl0YY1ehzQfbI+h9up
	sZCdY0sINkqfpv00vZhVYRRKJU5OiLeDba6WCXzAkP84YR4gP0tSux5kd7Pcy/9HlkiIwixb/TC
	1bHX+IZbCz4k+li+hhDqcjvVLkxBJZRasAKXlEaT+v9RdWb59qL0nkT+p2GV854cyLubxpoJjBY
	X4+me0xQs8XpvQzaE1gaIqGYcWveoaDPI5yb69YwyFCOvopbcUJHmsacoVayl9J/VrMFfmqgkEF
	XddqF1uJ8UrucTxp
X-Received: by 2002:a53:a9d2:0:b0:66f:c1bc:c094 with SMTP id 956f58d0204a3-66fc1bcc696mr5739900d50.92.1788901510601;
        Tue, 08 Sep 2026 14:05:10 -0700 (PDT)
Received: from pop-os.attlocal.net ([2600:1700:6476:1430:1eca:212:86d0:4e87])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb495eccesm11078129d50.18.2026.09.08.14.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 14:05:09 -0700 (PDT)
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com,
	hch@lst.de
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vdubeyko@coreweave.com,
	willy@infradead.org,
	brauner@kernel.org,
	djwong@kernel.org,
	Viacheslav Dubeyko <slava@dubeyko.com>
Subject: [PATCH v3 6/7] hfsplus: introduce iomap-based file_operations
Date: Tue,  8 Sep 2026 14:04:47 -0700
Message-ID: <20260908210448.296772-7-slava@dubeyko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908210448.296772-1-slava@dubeyko.com>
References: <20260908210448.296772-1-slava@dubeyko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch implements specialized iomap-based
hfsplus_file_llseek(), hfsplus_file_read_iter(),
and hfsplus_file_write_iter() methods.

Signed-off-by: Viacheslav Dubeyko <slava@dubeyko.com>
cc: Christoph Hellwig <hch@lst.de>
cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Yangtao Li <frank.li@vivo.com>
cc: linux-fsdevel@vger.kernel.org
---
 fs/hfsplus/file.c | 181 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 176 insertions(+), 5 deletions(-)

diff --git a/fs/hfsplus/file.c b/fs/hfsplus/file.c
index 509046aad0c6..5a5776881c3e 100644
--- a/fs/hfsplus/file.c
+++ b/fs/hfsplus/file.c
@@ -6,9 +6,11 @@
 #include <linux/fs.h>
 #include <linux/uio.h>
 #include <linux/mount.h>
+#include <linux/iomap.h>
 
 #include "hfsplus_fs.h"
 #include "hfsplus_raw.h"
+#include "iomap.h"
 
 static int hfsplus_file_open(struct inode *inode, struct file *file)
 {
@@ -17,6 +19,7 @@ static int hfsplus_file_open(struct inode *inode, struct file *file)
 	if (!(file->f_flags & O_LARGEFILE) && i_size_read(inode) > MAX_NON_LFS)
 		return -EOVERFLOW;
 	atomic_inc(&HFSPLUS_I(inode)->opencnt);
+	file->f_mode |= FMODE_CAN_ODIRECT;
 	return 0;
 }
 
@@ -55,7 +58,6 @@ int hfsplus_file_fsync(struct file *file, loff_t start, loff_t end,
 	error = file_write_and_wait_range(file, start, end);
 	if (error)
 		return error;
-	inode_lock(inode);
 
 	/*
 	 * Sync inode metadata into the catalog and extent trees.
@@ -114,15 +116,184 @@ int hfsplus_file_fsync(struct file *file, loff_t start, loff_t end,
 	if (!test_bit(HFSPLUS_SB_NOBARRIER, &sbi->flags))
 		blkdev_issue_flush(inode->i_sb->s_bdev);
 
+	return error;
+}
+
+/*
+ * hfsplus_fallback_buffered_write() - fall back to buffered I/O for the
+ * tail of a write that iomap_dio_rw() could not perform directly
+ * (unaligned tail, or no blocks could be mapped without allocation
+ * outside the direct path).
+ */
+static ssize_t hfsplus_fallback_buffered_write(struct kiocb *iocb,
+						struct iov_iter *from)
+{
+	loff_t offset = iocb->ki_pos, end;
+	ssize_t written;
+	int ret;
+
+	iocb->ki_flags &= ~IOCB_DIRECT;
+
+	written = iomap_file_buffered_write(iocb, from,
+					    &hfsplus_write_iomap_ops,
+					    NULL, NULL);
+	if (written < 0)
+		return written;
+
+	end = iocb->ki_pos + written - 1;
+	ret = filemap_write_and_wait_range(iocb->ki_filp->f_mapping,
+					   offset, end);
+	if (ret)
+		return -EIO;
+
+	invalidate_mapping_pages(iocb->ki_filp->f_mapping,
+				 offset >> PAGE_SHIFT,
+				 end >> PAGE_SHIFT);
+
+	return written;
+}
+
+static ssize_t hfsplus_dio_write_iter(struct kiocb *iocb,
+					struct iov_iter *from,
+					unsigned int dio_flags)
+{
+	ssize_t ret;
+
+	ret = iomap_dio_rw(iocb, from,
+			   &hfsplus_write_iomap_ops,
+			   &hfsplus_write_dio_ops,
+			   dio_flags, NULL, 0);
+	if (ret == -ENOTBLK)
+		ret = 0;
+	else if (ret < 0)
+		return ret;
+
+	if (iov_iter_count(from)) {
+		ssize_t written;
+
+		written = hfsplus_fallback_buffered_write(iocb, from);
+		if (written < 0)
+			return written;
+		ret += written;
+	}
+
+	return ret;
+}
+
+static ssize_t hfsplus_file_write_iter(struct kiocb *iocb,
+					struct iov_iter *iter)
+{
+	struct file *file = iocb->ki_filp;
+	struct inode *inode = file_inode(file);
+	struct hfsplus_sb_info *sbi = HFSPLUS_SB(inode->i_sb);
+	loff_t total_capacity;
+	ssize_t ret;
+	int err;
+
+	inode_lock(inode);
+
+	ret = generic_write_checks(iocb, iter);
+	if (ret <= 0)
+		goto unlock;
+
+	total_capacity = (loff_t)sbi->total_blocks << sbi->alloc_blksz_shift;
+	if (iocb->ki_pos >= total_capacity) {
+		ret = -EFBIG;
+		goto unlock;
+	}
+
+	err = file_modified(file);
+	if (err) {
+		ret = err;
+		goto unlock;
+	}
+
+	if (iocb->ki_pos > i_size_read(inode)) {
+		loff_t old_size = i_size_read(inode);
+
+		i_size_write(inode, iocb->ki_pos);
+		err = hfsplus_iomap_cont_expand(inode, iocb->ki_pos);
+		if (err) {
+			i_size_write(inode, old_size);
+			ret = err;
+			goto unlock;
+		}
+		mark_inode_dirty(inode);
+	}
+
+	if (iocb->ki_flags & IOCB_DIRECT) {
+		unsigned int dio_flags = 0;
+
+		if (iocb->ki_pos + iov_iter_count(iter) >
+		    HFSPLUS_I(inode)->phys_size)
+			dio_flags |= IOMAP_DIO_FORCE_WAIT;
+
+		ret = hfsplus_dio_write_iter(iocb, iter, dio_flags);
+	} else {
+		ret = iomap_file_buffered_write(iocb, iter,
+						&hfsplus_write_iomap_ops,
+						NULL, NULL);
+	}
+
+unlock:
 	inode_unlock(inode);
 
-	return error;
+	if (ret > 0)
+		ret = generic_write_sync(iocb, ret);
+
+	return ret;
+}
+
+static ssize_t hfsplus_file_read_iter(struct kiocb *iocb,
+					struct iov_iter *iter)
+{
+	struct inode *inode = file_inode(iocb->ki_filp);
+	ssize_t ret;
+
+	inode_lock_shared(inode);
+
+	if (iocb->ki_flags & IOCB_DIRECT) {
+		file_accessed(iocb->ki_filp);
+		ret = iomap_dio_rw(iocb, iter,
+				   &hfsplus_iomap_ops,
+				   NULL, 0, NULL, 0);
+	} else
+		ret = generic_file_read_iter(iocb, iter);
+
+	inode_unlock_shared(inode);
+
+	return ret;
+}
+
+static loff_t hfsplus_file_llseek(struct file *file, loff_t offset, int whence)
+{
+	struct inode *inode = file->f_mapping->host;
+
+	switch (whence) {
+	case SEEK_HOLE:
+		inode_lock_shared(inode);
+		offset = iomap_seek_hole(inode, offset, &hfsplus_iomap_ops);
+		inode_unlock_shared(inode);
+		break;
+	case SEEK_DATA:
+		inode_lock_shared(inode);
+		offset = iomap_seek_data(inode, offset, &hfsplus_iomap_ops);
+		inode_unlock_shared(inode);
+		break;
+	default:
+		return generic_file_llseek(file, offset, whence);
+	}
+
+	if (offset < 0)
+		return offset;
+
+	return vfs_setpos(file, offset, inode->i_sb->s_maxbytes);
 }
 
 const struct file_operations hfsplus_file_operations = {
-	.llseek		= generic_file_llseek,
-	.read_iter	= generic_file_read_iter,
-	.write_iter	= generic_file_write_iter,
+	.llseek		= hfsplus_file_llseek,
+	.read_iter	= hfsplus_file_read_iter,
+	.write_iter	= hfsplus_file_write_iter,
 	.mmap_prepare	= generic_file_mmap_prepare,
 	.splice_read	= filemap_splice_read,
 	.splice_write	= iter_file_splice_write,
-- 
2.43.0

