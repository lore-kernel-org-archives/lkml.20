Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3169A3B3C18
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 23:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789429222; cv=none; b=sX/z5e5uAcqod437pO+vKiKxKqT8Ep1G3WH/VNrf4mWxw52bIhR8Jt9ecy/pnqPbJWPvcrLiGu8oBYm2hIdX1k5I06fC0/iESfmRjKcPUb2PQwPMSYyaXTvg29oIY00c3VQ5elbKi8DJmcnIGHZDw17/ts2yVtd7VvVOiDSnpCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789429222; c=relaxed/simple;
	bh=/nb6mXNGTQy4ag5i/bNzjOw/1+Npj4A3qICnO0mTcVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NkNsxr9O+f4JyZtHerfebXC6LFfLt5PuoQI2FITyoFBgGvtr9zqi5NhZEP1WsoZ7FjZIusWkGCzu5JXn7iWO/KgWAH5Y7wPjXaWWpji81R3eP0g6dfx4EN+9RTW/emMQMv1j0zEJp1kFsTZZ/ig3M9k1hmqjzvxr/PjHqKkOjes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com; spf=pass smtp.mailfrom=dubeyko.com; dkim=pass (2048-bit key) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.b=HUjdMD+U; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.b="HUjdMD+U"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4ab201ebso2269997d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20251104.gappssmtp.com; s=20251104; t=1789429215; x=1790034015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GdNpd4ugMDrEQYDnfCzJIGQa0zG8noxMRn5Zjsu3iSw=;
        b=HUjdMD+UtaSfmiAIc/Ks7uDhRJreg6WxAxkK9eX0fC8iYHTiJgcixTOTweoEiq00ox
         Pdw0KNOLd7Z/BVdS+yVKJr0iSPuA0fPNaw9YmeWaiiOESGrFvK1AbpBTqVakeFhn6zKi
         FP8Pyt0PWzE92EknzoL037Czvc6ui2O7LgyEGgK3V/uVE7Yz6Bze0n4V8eQOs2LaRz2G
         Qoy88A41+/9usJHuaETtqQywqw0N2lVhI5D4DwqL5M9/5dC3gRVGGSV2kgXElUq4gmDG
         IBxl3b3qQmJNQvfqftITd15NOiiQ2FgTROO9CZ0SHdTgg05EGvJmNVo03fK5P8birebq
         ck5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789429215; x=1790034015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GdNpd4ugMDrEQYDnfCzJIGQa0zG8noxMRn5Zjsu3iSw=;
        b=w7h4D5ytSO5oxgGDRdOXAj9g9DSJYpbzRFjPKNFA48yJqLI6ZI1sydnJmxmepy3rmK
         OOMwQxpoIzA/4XGn3bLCnutPLrkugXuzpb0btQNP11uFSTgd/O4Ff/l+PXttbJdAvKQB
         tiakUNGMuykOtEmsOhTg3XBd2mbs7EuBnpogCjYD21K7v+syqg0D0idwZ8Bp6VFUMeag
         nJMccmG/zn+ygHV97q15kpWgxp0qRR+YPDWU41twyLMk3Jc40ZFRwiUe29HDEe0vMJkp
         +8hGcqlRqzsDSoq0b4h/rqADmLi9PmFID/EuhlurDanbeZ/K0/TDYH+bCnWXKZZnKJQu
         4v/w==
X-Forwarded-Encrypted: i=1; AKwUvBwc9XTqm2DvBJoQFY+NRPKB+qfz2y6Av9gHG5v/LSnStnKWRYlYbiJnaeuggYvzUISy0Fq3v7q7HG+zDJ0=@vger.kernel.org
X-Gm-Message-State: AFuF++lySoVoROY89z+Q0rLTOm2lT5QJRfvV8hwtLkgaYI12Ko1GB4Ab
	qYH2d+u3ylwuNBojqXw23PmGL/7oC2z8C/lOINnwqy16yigjGY787a4jtWVTM+T+724=
X-Gm-Gg: AYBFou0kZhKfea+0PrXRZ0Zjit3cg15Utj6IyzdJvjKw5J+HLK/U/Q+sB64M9wQy04P
	2Mmtikew9ya/qT/0QJ8yceVMYjZgmQaPoZuU9FvVaOQYLQrmXQTFvWqvFDFaykYt3mCBNMC+uu1
	lNx/5SgsGv0IKYeqCtcwkhnhbYHXom+4l3qwOzn/PDJRH0/xpxdBm3xVKrmPkUIevqw2u16AWRF
	sNRoyzJAWNwJSAiV+V4wioVcbZwPQsZDtC9RTK5s9rOItGQA6U9ejdea2mbQwfYTIKe0OTkr/5P
	bmcXv6OPYBDE2V7LR+MZR+MK0JYDq0bPRKEMr9pauBNWtUHBRFewIrrmlycWGdY3va/kUdgoGIK
	SxFIsBStDJTpYiFqJVhGAf8rsri65G/vXCdz22HotGLINbzqwvCMWJCQAtV9yexBRkgGAfxPBPX
	7gb2F5pryl61vM7Xv7LDWa7vJmQxgP3vm56Pg2O5pTd4qxMZS7tCG5oJg8ZwUpD7w9Bh8KJ9AHF
	05WeE8PZP5jg5eSFhbL2pWp0DyUEphWhYAELjxCvAPLjzAQ2F20sppyrJHrJrWd1i2FZouVfNki
	ufjmLvw1c78+ZvfS2VmC9dvGUpkB
X-Received: by 2002:a05:690e:12c8:b0:66e:45c8:fc92 with SMTP id 956f58d0204a3-6714dfe90a5mr1488611d50.23.1789429215177;
        Mon, 14 Sep 2026 16:40:15 -0700 (PDT)
Received: from pop-os.attlocal.net ([2600:1700:6476:1430:df87:8743:655b:3824])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67125e3fa87sm5207804d50.14.2026.09.14.16.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 16:40:14 -0700 (PDT)
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
Subject: [PATCH v4 6/7] hfsplus: introduce iomap-based file_operations
Date: Mon, 14 Sep 2026 16:39:40 -0700
Message-ID: <20260914233941.2966421-7-slava@dubeyko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914233941.2966421-1-slava@dubeyko.com>
References: <20260914233941.2966421-1-slava@dubeyko.com>
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
Acked-by: "Darrick J. Wong" <djwong@kernel.org>
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

