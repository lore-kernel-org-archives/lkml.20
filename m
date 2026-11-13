Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794553624;
	b=wzDagMx2ISaDhNlKD5MIFh5cdEHH8NKnlOHd7jKMetx8AnOKh5PlrWXeKbkarOL5Tv2H
	 xFuwRKk7cp2njGT7/U6pExyGGLNFlb0lv/ZLxRBjLITExQvpPgw/ZZ7zdT4ms3kATV+ZB
	 x2/S3m5Pt+lN6NSNQxvusigKuHFS5Kr+Be/FNzYSdDG0Ez4JWWxpIpA0l190ZMMDWuxdu
	 QYIWt1jkJKa7yZp2bJFs/rV1e82OQlxnqYIrDypfisj6TlgLcRZ3NsvOB1yBz3QklHQ2a
	 9cgrdY+re2uUwtMq5Vbd06LBhP6vwRaMOI+fHIEylvJzWfjZlh2e+7DpJuSMIUwZhog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794553624;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ov6PsgY3xDvctn8CEb8PaC1/EQ2eM7GolUa4HZ+7g3w=;
	b=c7xZ0ziENSthq4R88cLznFyJC48zNx+5ezDt8xIr2Uf3d5CAFSsEHraMqrmIgh1aYppV
	 Wpis/cwTjteBRnZeGO1tI9hUVzeLnTB81Kok8CRTjuM+fiQTV8wkYXgyk0dVBARgK10HN
	 gpXSOv6cP5l6zY0maCJfmZrme63Eskq1x6zl0rF779hMDWgZGO9Dd7zcyThuLhNfR8j5N
	 0M12o+9J0qB3YkGjaWMuluOaft4wN0/QK3ZZErGOvt+L3hcxQACEH44DGPjk/9tUpd8Fh
	 5wkxOI6JNv3TmuNq999xGVuQLfgeQSkg7+yJXSrNRcRKzU2BQADmnipBD41ZNfw1Hrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WoiL4nFY;
	arc=none smtp.remote-ip=91.218.175.178
Received: from mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FC9606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:07:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77FC9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WoiL4nFY
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=NPYqP2bSnfKk3JDua2A5vqNZ+eJUoj9E6cqywCvpDEg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794553621; v=1; x=1795158421;
 b=WoiL4nFYqSHsvmE4p1QJ083qrAUpGTvH/S1yv4RwG/z4XX8GpSyhztH3Wr3BglFxdkbUQZw/
 rOS1vbyXeE4ZIDj52UY96CUo/0a4F/AQIJ72/pPDwqsaW7Bn3Ookak8wMAS7ZTNjpjUwebmlpdJ
 TwP59BLkYUFCSwsQh19BHC+0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id da2ed9eb902ef4ec;
	Fri, 13 Nov 2026 07:07:01 +0000
X-Mizu-Trace-ID: da2ed9eb902ef4ec
X-Migadu-Flow: FLOW_OUT
From: Mengmeng Zhao <mengmeng.zhao@linux.dev>
To: Christoph Hellwig <hch@lst.de>,
	Anuj Gupta <anuj1072538@gmail.com>,
	Nitesh Shetty <nj.shetty@samsung.com>,
	Jens Axboe <axboe@kernel.dk>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	christian.koenig@amd.com,
	Philipp Stanner <phasta@kernel.org>,
	Dan Williams <djbw@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Jan Kara <jack@suse.cz>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	tytso@mit.edu,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Baokun Li <libaokun@linux.alibaba.com>,
	Ojaswin Mujoo <ojaswin@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Zhang Yi <yi.zhang@huawei.com>,
	asml.silence@gmail.com,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	nvdimm@lists.linux.dev,
	linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Li Wang <liwang@kylinos.cn>,
	Mengmeng Zhao <zhaomengmeng@kylinos.cn>
Subject: [RFC PATCH v2 1/8] block: factor out bdev_init_dma_buf_io_ctx()
Date: Fri, 13 Nov 2026 15:06:14 +0800
Message-ID: <20261113070621.273953-2-mengmeng.zhao@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113070621.273953-1-mengmeng.zhao@linux.dev>
References: <20261113070621.273953-1-mengmeng.zhao@linux.dev>
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

From: Nitesh Shetty <nj.shetty@samsung.com>

Factor the checks and the driver setup out of
blkdev_init_dma_buf_io_ctx() into an exported helper that takes the
block device as an argument, so callers can set up a dma-buf I/O
context for any block device.  The block device file operation becomes
a thin wrapper using file_bdev(), so its behavior is unchanged.

Signed-off-by: Nitesh Shetty <nj.shetty@samsung.com>
Signed-off-by: Mengmeng Zhao <zhaomengmeng@kylinos.cn>
Signed-off-by: Li Wang <liwang@kylinos.cn>
---
 block/bdev.c           | 14 ++++++++++++++
 block/fops.c           | 12 +-----------
 include/linux/blkdev.h |  3 +++
 3 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/block/bdev.c b/block/bdev.c
index f20f91b3176e..88e3f552f5d4 100644
--- a/block/bdev.c
+++ b/block/bdev.c
@@ -17,6 +17,7 @@
 #include <linux/blkpg.h>
 #include <linux/magic.h>
 #include <linux/buffer_head.h>
+#include <linux/dma-buf-io.h>
 #include <linux/swap.h>
 #include <linux/writeback.h>
 #include <linux/mount.h>
@@ -60,6 +61,19 @@ struct block_device *file_bdev(struct file *bdev_file)
 }
 EXPORT_SYMBOL(file_bdev);
 
+int bdev_init_dma_buf_io_ctx(struct file *file, struct block_device *bdev,
+			     struct dma_buf_io_ctx *ctx)
+{
+	if (!(file->f_flags & O_DIRECT))
+		return -EINVAL;
+	if (ctx->dmabuf->size > UINT_MAX)
+		return -EINVAL;
+	if (!bdev->bd_disk->fops->init_dma_buf_io_ctx)
+		return -EOPNOTSUPP;
+	return bdev->bd_disk->fops->init_dma_buf_io_ctx(bdev, ctx);
+}
+EXPORT_SYMBOL_GPL(bdev_init_dma_buf_io_ctx);
+
 static void bdev_write_inode(struct block_device *bdev)
 {
 	struct inode *inode = BD_INODE(bdev);
diff --git a/block/fops.c b/block/fops.c
index a0ccadaa9c79..86bf1f298b79 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -19,7 +19,6 @@
 #include <linux/iomap.h>
 #include <linux/module.h>
 #include <linux/io_uring/cmd.h>
-#include <linux/dma-buf-io.h>
 #include "blk.h"
 
 static inline struct inode *bdev_file_inode(struct file *file)
@@ -1009,16 +1008,7 @@ static int blkdev_mmap_prepare(struct vm_area_desc *desc)
 static int blkdev_init_dma_buf_io_ctx(struct file *file,
 				      struct dma_buf_io_ctx *ctx)
 {
-	struct block_device *bdev = file_bdev(file);
-	struct gendisk *disk = bdev->bd_disk;
-
-	if (!(file->f_flags & O_DIRECT))
-		return -EINVAL;
-	if (ctx->dmabuf->size > UINT_MAX)
-		return -EINVAL;
-	if (!disk->fops->init_dma_buf_io_ctx)
-		return -EOPNOTSUPP;
-	return disk->fops->init_dma_buf_io_ctx(bdev, ctx);
+	return bdev_init_dma_buf_io_ctx(file, file_bdev(file), ctx);
 }
 
 const struct file_operations def_blk_fops = {
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 215753171cef..b98f43478cc0 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1610,6 +1610,9 @@ struct block_device_operations {
 	int (*alternative_gpt_sector)(struct gendisk *disk, sector_t *sector);
 };
 
+int bdev_init_dma_buf_io_ctx(struct file *file, struct block_device *bdev,
+			     struct dma_buf_io_ctx *ctx);
+
 #ifdef CONFIG_COMPAT
 extern int blkdev_compat_ptr_ioctl(struct block_device *, blk_mode_t,
 				      unsigned int, unsigned long);
-- 
2.43.0

