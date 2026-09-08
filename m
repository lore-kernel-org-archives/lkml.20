Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA15438493
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 21:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788901508; cv=none; b=VLaZQkTDor62fA8/3lwV7KPhir6Z8RGHlbwde2hXRpjvSNUVyVVmNb8IG5vViIrgvK6gHxG6sWzoX5SMDtUxu98VkAIA4FVJjazVLgWvWA8HNjpSvWwefc+sTOVBWFBM9slsmKL5HnEjRgXY7RJqTU7YzlKq6LMpEmeHEuMyo6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788901508; c=relaxed/simple;
	bh=jOzpIQqlYHA2pVFNKY7kzTiGuzamQCH3EM192/ZKawI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nyawL37ykCr8sCTxHcjQx16Js5miiXxWE70j2JkQuD5vi8RduR9gX6VcHkruDvc1Eu12082fnm5r9n9AAJQ8OxIyJJ7g/EnnQbsWba2ZHQBX9x2M0KoyNU0vKXRekG7p6c2FmEwzUoCRzUvshpQ4BNNS2ehIKDyR7jeP+HHtagk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com; spf=pass smtp.mailfrom=dubeyko.com; dkim=pass (2048-bit key) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.b=yQmbrVEc; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.b="yQmbrVEc"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-66c70f69d3fso4869815d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 14:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20251104.gappssmtp.com; s=20251104; t=1788901506; x=1789506306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p7fqt/xpLD4nMGxuw74g5K5kBibq9QTHLwKBrfOGNM4=;
        b=yQmbrVEcmdwP6SC5BtG1fnirqIrIjUDL1iXhJQmRv/9HZKyhYn/sBbbOUYuHRXhPDM
         AekN4DSvj0RyhDedUCVYyNrPZRmF01U7QNhZoaSf0Us18bnRb7IsZEqcGDH9LT7/3Okb
         pgRSCA+oRvcW9FXzRd1+NIWZINAFDiZpJsNrNIpi7wJvvVv2jLeafEACgNaDYwjNFgrY
         sFEMNjWyG5IpzKIxCELxnXrfCTMCqkfiA6ETk4su1y9spJiuFxqOqjLKLbzn9m8q668u
         DegQ7tnFN+fEXAKM0SeX0gJbLGc6Y44ZouKuCEvSuxV073GHkFINdmwIHZpIGOz6TCKi
         NHNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788901506; x=1789506306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p7fqt/xpLD4nMGxuw74g5K5kBibq9QTHLwKBrfOGNM4=;
        b=eJ+nkDvdPn69gpH4+giM9BXn5evdr+/VF5kapynpTD3YoB4S5eQeRsvqceeqC8wdDg
         zZZT0o02rpDN0ddanE1NgxyzfzVNB6G0MzEnbvBvdJIZOkgzDWkYLWSzJ3tCjTtDa5pR
         Vybe/Y7UyztC9ONduG/JPYj3IAhVdjhuYWZFBc90CvUAIopBW2EcJTmp16LYEvcjNpf0
         kqeWHw8BvEGgHwzZHx5mLd3I+xpKCwvDgxrQvKWlpavVU3Hw0i2cbeZWywKzfD5T7nZC
         54Ky3/2zDcABWm2AapjdPu+vZ/j2wF3DnvP1KrkJ5CJ0RDSb6CH9msHMcI6yW4WT3h17
         tW7Q==
X-Forwarded-Encrypted: i=1; AKwUvBwWhH1KYIjtzsQkJ1Fpa6oheY2dmpK5LEmDj3BEJvZeaN6GqOUnq5ej96avT3qDCb/Wsg9MK+JtuQwsJQ8=@vger.kernel.org
X-Gm-Message-State: AFuF++nh4zaCqgkdRg7NCOm0e1Gyau4CWctCnDb4JBocK7IBUFvAypJp
	XJ1rDbIa9FALndM81D3tkSd1WY4djNKZWVfnzCEXgVtJ+KeCo4EZzijMFbCTmXG4bFBQw23wsw+
	tkRndUBIqfg==
X-Gm-Gg: AYBFou2MpDUAxqa89sLykygD9lLokAPTbyFmzpdEyXnGJ+ThBXqiuCWFYrAYoVk5yDv
	suPlJmnlc3p39aYRSOUWG9Xr/8j3yXQOoM1QKqJgyhYzAksaMta2mbzlVmJR0hHKJu4wQIJ0k6o
	FrBXd1ouLnQWtFLg0maqrQcB2wxgUb1qUM0PwyeHPmxy52Y0aDUOEq1GCg8kcOirmlEIywOKGhf
	UyJNJWzJo3nCa17TaydCQPqMn/wc1A9yuBuhoDRDmTHBnssElEJlZwu2K9kdL63blxKE1/G4G7/
	oFpNRwOvUKKJkyidxPhT++V+b7mjWfp0l5jSSAe4Kzbr+EkgTTLcnYBtDOG+P2wOuCOlpIMv732
	nxtIYXuEWTME377ztqoEdmENHMbzhA3em7dnDOskFi/8SsYeSTSqVx9NXZN+w5lWdtEY3Z+2abf
	eZAQj7oAuAR8Cz7pcdwr+WDG9yEXwhNimf0tvcsjGnMx3XIYue7xXm8tUP+glkXlxUK+D/LGd+2
	Z9+WpJkfGgG/yubfHp1vvjPN4MM3kfPdIbDJfnhjb7BXjvzzbXvU9yPscYddBivwTMAxsmlWtrz
	GdAoBBEyF4pW//bB
X-Received: by 2002:a53:b712:0:b0:66f:9d85:8d6f with SMTP id 956f58d0204a3-66fb59a684cmr7470949d50.19.1788901505438;
        Tue, 08 Sep 2026 14:05:05 -0700 (PDT)
Received: from pop-os.attlocal.net ([2600:1700:6476:1430:1eca:212:86d0:4e87])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb495eccesm11078129d50.18.2026.09.08.14.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 14:05:04 -0700 (PDT)
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
Subject: [PATCH v3 4/7] hfsplus: add iomap operations for regular file data
Date: Tue,  8 Sep 2026 14:04:45 -0700
Message-ID: <20260908210448.296772-5-slava@dubeyko.com>
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

This patch adds iomap.h and iomap.c files. The iomap.h contains
declarations of hfsplus_iomap_ops, hfsplus_write_iomap_ops,
hfsplus_writeback_ops, and hfsplus_write_dio_ops operations.
The iomap.c implements __hfsplus_iomap_begin(),
hfsplus_write_iomap_end(), hfsplus_iomap_cont_expand(),
hfsplus_writeback_range() methods that become the basis of
HFS+ iomap operations.

Signed-off-by: Viacheslav Dubeyko <slava@dubeyko.com>
cc: Christoph Hellwig <hch@lst.de>
cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Yangtao Li <frank.li@vivo.com>
cc: linux-fsdevel@vger.kernel.org
---
v2
Christoph Hellwig suggested to introduce a generalized version
of iomap_dio_end_io() that was placed into include/linux/iomap.h.
---
 fs/hfsplus/Kconfig      |   1 +
 fs/hfsplus/Makefile     |   5 +-
 fs/hfsplus/hfsplus_fs.h |  16 ++++
 fs/hfsplus/iomap.c      | 192 ++++++++++++++++++++++++++++++++++++++++
 fs/hfsplus/iomap.h      |  18 ++++
 include/linux/iomap.h   |  20 +++++
 6 files changed, 250 insertions(+), 2 deletions(-)
 create mode 100644 fs/hfsplus/iomap.c
 create mode 100644 fs/hfsplus/iomap.h

diff --git a/fs/hfsplus/Kconfig b/fs/hfsplus/Kconfig
index ca8401cb6954..865a1966f395 100644
--- a/fs/hfsplus/Kconfig
+++ b/fs/hfsplus/Kconfig
@@ -6,6 +6,7 @@ config HFSPLUS_FS
 	select NLS
 	select NLS_UTF8
 	select LEGACY_DIRECT_IO
+	select FS_IOMAP
 	help
 	  If you say Y here, you will be able to mount extended format
 	  Macintosh-formatted hard drive partitions with full read-write access.
diff --git a/fs/hfsplus/Makefile b/fs/hfsplus/Makefile
index f2a9ae697e81..2416dfdc3190 100644
--- a/fs/hfsplus/Makefile
+++ b/fs/hfsplus/Makefile
@@ -5,8 +5,9 @@
 
 obj-$(CONFIG_HFSPLUS_FS) += hfsplus.o
 
-hfsplus-objs := super.o options.o inode.o ioctl.o extents.o catalog.o dir.o btree.o \
-		bnode.o brec.o bfind.o tables.o unicode.o wrapper.o bitmap.o part_tbl.o \
+hfsplus-objs := super.o options.o inode.o iomap.o ioctl.o extents.o catalog.o \
+		dir.o btree.o bnode.o brec.o bfind.o tables.o unicode.o \
+		wrapper.o bitmap.o part_tbl.o \
 		attributes.o xattr.o xattr_user.o xattr_security.o xattr_trusted.o
 
 # KUnit tests
diff --git a/fs/hfsplus/hfsplus_fs.h b/fs/hfsplus/hfsplus_fs.h
index 67586382269b..0a0df0388e7b 100644
--- a/fs/hfsplus/hfsplus_fs.h
+++ b/fs/hfsplus/hfsplus_fs.h
@@ -175,6 +175,22 @@ static inline struct hfsplus_sb_info *HFSPLUS_SB(struct super_block *sb)
 	return sb->s_fs_info;
 }
 
+/*
+ * Physical byte offset of allocation block 'dblock' on the volume.
+ */
+static inline loff_t hfsplus_ablock_to_phys_bytes(struct super_block *sb,
+						  u32 dblock)
+{
+	struct hfsplus_sb_info *sbi = HFSPLUS_SB(sb);
+	loff_t phys_bytes;
+
+	phys_bytes = dblock;
+	phys_bytes <<= sbi->fs_shift;
+	phys_bytes += sbi->blockoffset;
+	phys_bytes <<= sb->s_blocksize_bits;
+
+	return phys_bytes;
+}
 
 struct hfsplus_inode_info {
 	atomic_t opencnt;
diff --git a/fs/hfsplus/iomap.c b/fs/hfsplus/iomap.c
new file mode 100644
index 000000000000..5723e854e58e
--- /dev/null
+++ b/fs/hfsplus/iomap.c
@@ -0,0 +1,192 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * iomap callback functions for the hfsplus filesystem
+ */
+
+#include <linux/iomap.h>
+#include <linux/pagemap.h>
+
+#include "hfsplus_fs.h"
+#include "hfsplus_raw.h"
+#include "iomap.h"
+
+static int __hfsplus_iomap_begin(struct inode *inode, loff_t offset,
+				 loff_t length, unsigned int flags,
+				 struct iomap *iomap, bool may_alloc)
+{
+	struct super_block *sb = inode->i_sb;
+	struct hfsplus_sb_info *sbi = HFSPLUS_SB(sb);
+	struct hfsplus_inode_info *hip = HFSPLUS_I(inode);
+	u32 ablock, dblock, max_blocks;
+	loff_t ablock_offset, ablock_bytes;
+	loff_t block_start;
+	bool is_new;
+	int err;
+
+	if (!may_alloc) {
+		/* Completely beyond EOF. Treat as hole */
+		if (i_size_read(inode) <= offset) {
+			iomap->type = IOMAP_HOLE;
+			iomap->addr = IOMAP_NULL_ADDR;
+			iomap->offset = offset;
+			iomap->length = length;
+			return 0;
+		}
+
+		/* Clamp length if the requested range goes beyond i_size */
+		if (offset + length > i_size_read(inode)) {
+			loff_t i_size = i_size_read(inode);
+			unsigned int blocksize = i_blocksize(inode);
+
+			length = round_up(i_size, blocksize) - offset;
+		}
+	}
+
+	ablock = offset >> sbi->alloc_blksz_shift;
+
+	err = hfsplus_map_extent(inode, ablock, may_alloc, &dblock,
+				 &max_blocks, NULL);
+	if (err)
+		return err;
+
+	ablock_offset = offset & (sbi->alloc_blksz - 1);
+	ablock_bytes = (loff_t)max_blocks << sbi->alloc_blksz_shift;
+
+	length = min_t(loff_t, length, ablock_bytes - ablock_offset);
+	block_start = round_down(offset, i_blocksize(inode));
+	is_new = may_alloc && block_start >= hip->phys_size;
+	if (may_alloc && !is_new && offset < hip->phys_size)
+		length = min_t(loff_t, length, hip->phys_size - offset);
+
+	iomap->bdev = sb->s_bdev;
+	iomap->offset = offset;
+	iomap->length = length;
+	iomap->addr = hfsplus_ablock_to_phys_bytes(sb, dblock) + ablock_offset;
+	iomap->type = IOMAP_MAPPED;
+	iomap->flags = IOMAP_F_MERGED;
+
+	if (is_new)
+		iomap->flags |= IOMAP_F_NEW;
+
+	return 0;
+}
+
+static int hfsplus_iomap_begin(struct inode *inode, loff_t offset,
+				loff_t length, unsigned int flags,
+				struct iomap *iomap, struct iomap *srcmap)
+{
+	return __hfsplus_iomap_begin(inode,
+				     offset, length, flags,
+				     iomap, false);
+}
+
+static int hfsplus_write_iomap_begin(struct inode *inode, loff_t offset,
+				     loff_t length, unsigned int flags,
+				     struct iomap *iomap, struct iomap *srcmap)
+{
+	return __hfsplus_iomap_begin(inode,
+				     offset, length, flags,
+				     iomap, true);
+}
+
+const struct iomap_ops hfsplus_iomap_ops = {
+	.iomap_begin = hfsplus_iomap_begin,
+};
+
+/*
+ * hfsplus_write_iomap_end()
+ *
+ * Advance the allocated-and-zeroed high-water mark
+ * (hip->phys_size / hip->fs_blocks) to cover the newly written range.
+ */
+static int hfsplus_write_iomap_end(struct inode *inode, loff_t pos,
+				   loff_t length, ssize_t written,
+				   unsigned int flags, struct iomap *iomap)
+{
+	struct hfsplus_inode_info *hip = HFSPLUS_I(inode);
+	struct super_block *sb = inode->i_sb;
+	loff_t end;
+	bool dirtied = false;
+
+	if (!written)
+		return 0;
+
+	end = pos + written;
+
+	if (iomap->flags & IOMAP_F_NEW)
+		end = round_up(end, sb->s_blocksize);
+
+	if (hip->phys_size < end) {
+		inode_add_bytes(inode, end - hip->phys_size);
+		hip->phys_size = end;
+		hip->fs_blocks = end >> sb->s_blocksize_bits;
+		dirtied = true;
+	}
+
+	if (dirtied)
+		mark_inode_dirty(inode);
+
+	return written;
+}
+
+const struct iomap_ops hfsplus_write_iomap_ops = {
+	.iomap_begin	= hfsplus_write_iomap_begin,
+	.iomap_end	= hfsplus_write_iomap_end,
+};
+
+/*
+ * hfsplus_iomap_cont_expand()
+ *
+ * Zero-extend the backing store from the current phys_size up to 'size'.
+ * Used both by hfsplus_setattr() and by hfsplus_file_truncate().
+ */
+int hfsplus_iomap_cont_expand(struct inode *inode, loff_t size)
+{
+	struct hfsplus_inode_info *hip = HFSPLUS_I(inode);
+	loff_t start = hip->phys_size;
+
+	if (size <= start)
+		return 0;
+
+	return iomap_zero_range(inode, start, size - start, NULL,
+				&hfsplus_write_iomap_ops, NULL, NULL);
+}
+
+/*
+ * hfsplus_writeback_range() - map folio during writeback
+ *
+ * Called for each folio during writeback. If the folio falls outside
+ * the current iomap, remaps by calling __hfsplus_iomap_begin() again.
+ */
+static ssize_t hfsplus_writeback_range(struct iomap_writepage_ctx *wpc,
+					struct folio *folio, u64 offset,
+					unsigned int len, u64 end_pos)
+{
+	int err;
+
+	if (offset < wpc->iomap.offset ||
+	    offset >= wpc->iomap.offset + wpc->iomap.length) {
+		err = __hfsplus_iomap_begin(wpc->inode,
+					    offset, len, 0,
+					    &wpc->iomap, false);
+		if (err)
+			return err;
+	}
+
+	return iomap_add_to_ioend(wpc, folio, offset, end_pos, len);
+}
+
+const struct iomap_writeback_ops hfsplus_writeback_ops = {
+	.writeback_range	= hfsplus_writeback_range,
+	.writeback_submit	= iomap_ioend_writeback_submit,
+};
+
+const struct iomap_dio_ops hfsplus_write_dio_ops = {
+	.end_io		= iomap_dio_end_io,
+};
+
+int hfsplus_iomap_swap_activate(struct swap_info_struct *sis,
+				 struct file *file, sector_t *span)
+{
+	return iomap_swapfile_activate(sis, file, span, &hfsplus_iomap_ops);
+}
diff --git a/fs/hfsplus/iomap.h b/fs/hfsplus/iomap.h
new file mode 100644
index 000000000000..dac07a9d25f8
--- /dev/null
+++ b/fs/hfsplus/iomap.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * iomap callback declarations for the hfsplus filesystem
+ */
+
+#ifndef _LINUX_HFSPLUS_IOMAP_H
+#define _LINUX_HFSPLUS_IOMAP_H
+
+extern const struct iomap_ops hfsplus_iomap_ops;
+extern const struct iomap_ops hfsplus_write_iomap_ops;
+extern const struct iomap_writeback_ops hfsplus_writeback_ops;
+extern const struct iomap_dio_ops hfsplus_write_dio_ops;
+
+int hfsplus_iomap_cont_expand(struct inode *inode, loff_t size);
+int hfsplus_iomap_swap_activate(struct swap_info_struct *sis,
+				struct file *file, sector_t *span);
+
+#endif /* _LINUX_HFSPLUS_IOMAP_H */
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index bc7ae6327dbf..66a6389c9c74 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -636,6 +636,26 @@ struct iomap_dio_ops {
 	struct bio_set *bio_set;
 };
 
+/*
+ * Direct I/O completion handler
+ */
+static inline
+int iomap_dio_end_io(struct kiocb *iocb, ssize_t size,
+		     int error, unsigned int flags)
+{
+	struct inode *inode = file_inode(iocb->ki_filp);
+
+	if (error)
+		return error;
+
+	if (size && i_size_read(inode) < iocb->ki_pos + size) {
+		i_size_write(inode, iocb->ki_pos + size);
+		mark_inode_dirty(inode);
+	}
+
+	return 0;
+}
+
 /*
  * Wait for the I/O to complete in iomap_dio_rw even if the kiocb is not
  * synchronous.
-- 
2.43.0

