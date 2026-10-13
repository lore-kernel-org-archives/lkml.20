Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DFE559C8E
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924932; cv=none; b=gPn2LotCguCTp5Z2c47prWoNEKPgrDlmijN2pCq2LVndkC80cV1DR7MEKwgMu7j6N1rnHHuF/80Nc8evhGMlpcdvNPmtxwihboOsLas62I3QmMz/AWuzV218FAEdKInp8J19TV8S4zxHlqdIm5cCM7zClUaMXnXmz3+dG1FyVNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924932; c=relaxed/simple;
	bh=poMU3IMk+s1i+OL6PspfjWv+5wjZjdnLVtCEDY3Hn+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r6q7leFzfOHXieMS1xFSNYWrK7w85p+HpHPt4U+NWC6s2to11hKUHG4x03RYNkvt2D6k4MEHuD8jltijHbjOfRkq66XKTiNfJziiNLNtUcycqe6xxT54f0jEF37hk312fHwpXTbRpXdWZHoayPQeWOhS6BHI9AKJ118wc6cZVYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cpx1yTle; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cpx1yTle"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48b0946c2c2so2151032f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791924927; x=1792529727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sjQY12JZJkEEoHUMGZ5pLsy3Pmh4yJs101KM8nm2S/U=;
        b=cpx1yTleLYGeSHlX9yy3Sxz8IdjAPl+6Qo8dMsIM1xUdhWk9hVBqChb2Ft2PMIToUM
         l5f431zB4lkLv5sd9yrqxMwO9wQDdAcXTc5j9ewInPWInwqbQyd6O+dzYoK2/DJiDpN3
         p3I9xKC8xUbr6TC1/KeoicEAuiHUJPo2lSpPcs6c1ACIZnD1UngpaWeyvA5LNWbJYwCz
         upwd2Waem9goDNXoRXMXGSDrhZo/viSvfHebc9upJlNQRScoPHsQJ1/g4iOLceA0jdSj
         J6PIQXejwkh1IPolJDgKBakNFh8OvtzJjBr2X+rAQ8AASpc+hg4JPYb50tlQrydlREa1
         5TCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791924927; x=1792529727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sjQY12JZJkEEoHUMGZ5pLsy3Pmh4yJs101KM8nm2S/U=;
        b=KxFpjsESOrdS+5f9v9/kdicM10zTqxEHbmpBw/+YLPpnGhaehstdwLASw+sLvDdZGU
         LW2nOKws+/uRZCSrwCxD6dZO1gdjreM+IfXFwPUlnDDwtdcgvJpSGooCHkDoR0EJAO4j
         usiJaUeARoD82dnCnik/+MXeaPuOlY+Z6K+KEM4+0wKxTZwbj6jvMQ+E6MWZH4Ce353H
         R5NFsZDnuKdjF0HfA86TO8NkjOLJPb/EgK8gVdIVaaNCBEMVF+7/Q0CqICImKnyvgGc3
         nUU+reSyr2FK1bpqXU851r5xOPCKlCcLHNUbIzDuU5vY6+q3pcHHau5VKrJBl8eBVQnc
         n70Q==
X-Forwarded-Encrypted: i=1; AKwUvBxZ5Xnr+Dtr9KSOYNKI1Q/VBIp0tAN2KDn4UbBe1Po+lQNPC1VOr/kOiDhHsU6EdgBb3PL73/FMNlFq3r0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9ekBMpBPH8hoHwG/EZQlIz2rEHcfLGBuFgvnBvNmAiWZ7SlqJ
	5p2QsyAXkfsegxCQ1JRqpNsi9TWfdjh9U8QTiddZ6YBnnCQu88zwwW4t
X-Gm-Gg: AYBFou19EOl2m4lYW5DEtEG1BS3nWzRZq9rNx3OqD623/i7T0R4Z+hMhHGnooFF6P8M
	ISWxtknPqbEgfE7hXGOvbciOliL7G3/QltppGzU++y16fZt86SSS6MwNrCQo/1Ia2GfJWmOqbgj
	9JwqY54j0JLHz7w2rhu6mv0T+xJ32ySB0wioI+VKTGrhXCzEYNj8wXSh9jzlDOQ3wBJBl7Kx/Sd
	3qdzYqdxtyCBEHyBwsJaNVLYch+Ipwz15tgO8zuKTWZIJ17xI/c1+qocQ2N97ix9IrVYvt0bD03
	LEpLGpRZii0cMNIA8HNVDkIGuBTsUVmeFkPWx9oafv+D+QwHwWbc182BvWwD/tBoEuSADt0GJFw
	PrkrUkVNbkoyfWoAhDMEGq19zRiMXR7AwtfZzE3NtzU6uOSEfuPlP1bJ1ebMzMK/3eQxC7ODnJN
	iSc7Xc+rdx99Ezi1/zD7CahSlOs46yDbIEwAxl18ppmV88kjGT903v98fy8DYs8DSXkKX5l7k/a
	wGkthbhYzSl+AtgxVVV5gxeB/RETjntmzwJlmDgTL9SdRVIq5TnBhXn3+owgiMACVg6gm0v+OkQ
X-Received: by 2002:a5d:5d09:0:b0:482:fd9c:3740 with SMTP id ffacd0b85a97d-48dbaae8af0mr23656771f8f.22.1791924926558;
        Tue, 13 Oct 2026 13:55:26 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de7273a0esm2380730f8f.29.2026.10.13.13.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:55:24 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: linux-block@vger.kernel.org
Cc: asml.silence@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-nvme@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	io-uring@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Keith Busch <kbusch@kernel.org>,
	Sagi Grimberg <sagi@grimberg.me>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jens Axboe <axboe@kernel.dk>,
	Nitesh Shetty <nj.shetty@samsung.com>,
	Kanchan Joshi <joshi.k@samsung.com>,
	Anuj Gupta <anuj20.g@samsung.com>,
	Tushar Gohad <tushar.gohad@intel.com>,
	William Power <william.power@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	dm-devel@lists.linux.dev
Subject: [PATCH v10 05/13] block: add dma-buf support for raw bdev
Date: Tue, 13 Oct 2026 21:54:49 +0100
Message-ID: <78b3f2bb6e3ce576ee99252b88f0af8602b436d1.1791924581.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1791924581.git.asml.silence@gmail.com>
References: <cover.1791924581.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a simple proxy implementation of init_dma_buf_io_ctx() forwarding
the call to a new struct block_device_operations operation. Also reject
dma-buf backed iterators for buffered IO.

Reviewed-by: Christoph Hellwig <hch@lst.de>
[pavel: reject dma-buf without O_DIRECT]
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 block/fops.c           | 24 ++++++++++++++++++++++++
 include/linux/blkdev.h |  2 ++
 2 files changed, 26 insertions(+)

diff --git a/block/fops.c b/block/fops.c
index 827dc9eecba7..6c6700df943c 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -730,6 +730,9 @@ blkdev_direct_write(struct kiocb *iocb, struct iov_iter *from)
 
 static ssize_t blkdev_buffered_write(struct kiocb *iocb, struct iov_iter *from)
 {
+	if (unlikely(iov_iter_is_dmabuf_map(from)))
+		return -EOPNOTSUPP;
+
 	return iomap_file_buffered_write(iocb, from, &blkdev_iomap_ops, NULL,
 			NULL);
 }
@@ -855,6 +858,11 @@ static ssize_t blkdev_read_iter(struct kiocb *iocb, struct iov_iter *to)
 		if (ret < 0 || !count)
 			goto reexpand;
 	}
+	if (unlikely(iov_iter_is_dmabuf_map(to))) {
+		if (!ret)
+			ret = -EOPNOTSUPP;
+		goto reexpand;
+	}
 
 	/*
 	 * Take i_rwsem and invalidate_lock to avoid racing with set_blocksize
@@ -958,6 +966,21 @@ static int blkdev_mmap_prepare(struct vm_area_desc *desc)
 	return generic_file_mmap_prepare(desc);
 }
 
+static int blkdev_init_dma_buf_io_ctx(struct file *file,
+				      struct dma_buf_io_ctx *ctx)
+{
+	struct block_device *bdev = file_bdev(file);
+	struct gendisk *disk = bdev->bd_disk;
+
+	if (!(file->f_flags & O_DIRECT))
+		return -EINVAL;
+	if (!disk->fops->init_dma_buf_io_ctx)
+		return -EOPNOTSUPP;
+	if (bdev_has_integrity_csum(bdev))
+		return -EOPNOTSUPP;
+	return disk->fops->init_dma_buf_io_ctx(bdev, ctx);
+}
+
 const struct file_operations def_blk_fops = {
 	.open		= blkdev_open,
 	.release	= blkdev_release,
@@ -976,6 +999,7 @@ const struct file_operations def_blk_fops = {
 	.fallocate	= blkdev_fallocate,
 	.uring_cmd	= blkdev_uring_cmd,
 	.fop_flags	= FOP_BUFFER_RASYNC | FOP_DONTCACHE,
+	.init_dma_buf_io_ctx = blkdev_init_dma_buf_io_ctx,
 };
 
 static __init int blkdev_init(void)
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index d003a9d2d1f6..2d5c30823aab 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1599,6 +1599,8 @@ struct block_device_operations {
 	/* returns the length of the identifier or a negative errno: */
 	int (*get_unique_id)(struct gendisk *disk, u8 id[16],
 			enum blk_unique_id id_type);
+	int (*init_dma_buf_io_ctx)(struct block_device *,
+				   struct dma_buf_io_ctx *);
 	struct module *owner;
 	const struct pr_ops *pr_ops;
 
-- 
2.54.0

