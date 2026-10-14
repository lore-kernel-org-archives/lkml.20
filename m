Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98AC4F68CD
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791975757; cv=none; b=q1ibI0uO/rD/nlAdsMAKQHR7iqq59N7hUOdbJ4n8DH+aTUjBiCHY16O2Z6xnU6aAuGuJcvMLouulo3eshT9G6EZJflhCfFOeGZOlMyO50vVa4O3xyqnbtfctg7lJ0zPhGm2Dv4HEBICjw8QvqOtF0udJsFC2c60Ym5ndOupSvD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791975757; c=relaxed/simple;
	bh=poMU3IMk+s1i+OL6PspfjWv+5wjZjdnLVtCEDY3Hn+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BAfFQ3xdf7nNfHYQGzjby2783a9Fb/Hx9m+szgIPQjRJHHAu2njlItyXi7TvFKaveXWDau/WvGGp9zVYT7G39UsizxJw584AqLcl6zC94GZxOapyBVjf8JGQPzlXvt0ZVuKoeDCyC7Jzxl6HF0B9nLu76ODSs7vao7O4nZIjQMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lgNO+bZQ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lgNO+bZQ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so10596135e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791975748; x=1792580548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sjQY12JZJkEEoHUMGZ5pLsy3Pmh4yJs101KM8nm2S/U=;
        b=lgNO+bZQ/hnx2yCAL1IbW7Iij3HMfcE7QFPPFXXIrHszCMDgkl/yukvU2NsT0LuA8k
         XTYrAF3J7+KZ0mLr0dyTtvudv3W8K26zyQSPyCr+Gl0xk+zlTDr5MBDbiaFF48RmlAZz
         G6liAnDuYEL/AowlsBFYqbYiVjwVhPygUXqs/cVM22qW03HxCWxgizK6LJsvuuhl6iAh
         wfuzAaoNxC1STbH744wcuWm88gHQl91TjBIK3JCJQipocLiR/mh+CuAg8aw3+QxLDujS
         3Pkne/qKlxAPAsIfCOlBTxlVI9+VKvE9PhcJ4PziH9BhgLsbVjblTnzNLLkEySovYlse
         KAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791975748; x=1792580548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sjQY12JZJkEEoHUMGZ5pLsy3Pmh4yJs101KM8nm2S/U=;
        b=CDSgY6PWzYG5Tpca32EWFLR2kOdZI64zQigdM2n5wJG70wtLP3N8vvZmk006HMU8K7
         9hX7v8x743DevSmT2lXFic0IZCrAzypygp2eJecWjJNsPTMhiKKUgBo0adLo8XT0fzUd
         Cm+bFcc8bJPHnf2Dcj4xOR41hwj+0a4OcUvOTEnsDJGrTekO06djHgA62M80yYCvgzFP
         dxi5OQCmxKL4zlIw1Sm6u+tAHYpdCQmvxRk9d91cQBMqoieo9ooZ+pOuFtUd0Wp9CPKy
         Mmou2G9VT1OW4gYYK5+4Egyc9/oWbiu/v/kt4iRoVqIVtDOvz4b2p2MVpXYjrNJMAtdO
         kCFQ==
X-Forwarded-Encrypted: i=1; AKwUvBx88VwZq4B6MC6EMMJEvNuBvr8gjVBky8VTm/0Dd7XnEk0qwENeE0rve+s4I18or6AYPVrtkXPFAGcnDjA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjuyn+ZgPSClUFlWRAfgjpH2bASzCYifeW3VtwJ10IiH1tZCfg
	5XZEJB94WGGK1TWPJT7sHGnloK7/ExO9s8MvTTbj7MyIXT8GwNQLsdUC
X-Gm-Gg: AYBFou3Q42zgrlMrBlAUDG/Pzb+0sTLt3at3KvWRXWtg29HZ314PHcAOLdPUIwNBmNu
	crVsLw0yI/G2ibLhj+0t7XF/3c5x6DViLOqelk/i6VpI/SJyOIRdMvB2sB8nwRVy4dTmmy15ezJ
	jFTu1fGx2X5fMBrOGq5Lh+mQo4L8HQthhQ4UxFaJQHCCLTyRvz8u4cRL2jqwKKcY7hFwwpIJNtB
	Jjr/yQm3OuEEuo5bP5IoP/S6cCPJUOpfmqeJ1GCdDdj0mVWcBjZfQeFvpyM72oX6RCpP3clM5jp
	34PXnQd6PqOxcI+c1/kkhBMza3RBPUm9Htj5/cZn6UPYJJ3PRb8OMMwVmnF9p7ktLSh3W2ugduS
	7Afe8l8/ckyxbXU+TPtX/5+XaVjiWQzrn7eUhgWd2R2+y1P8L2tl5Z3vqvtRUW9Mw8n7le4mesO
	n9ted1F0cBj0EyXzrD+ibcZwjmrcaalifgB1VWtkHqdIXN7DmvmRAXJaiZCNzUpAEC0aQSnhPXL
	Y9SC8+k8H0k8oGGbW70JSdM432NjxGGU/fqSPo5QhbYYlXVe0QWAZn9Y3e5VjVB4Zh0hcRa09Er
X-Received: by 2002:a05:600c:8716:b0:4a1:62b8:9aa1 with SMTP id 5b1f17b1804b1-4a18e44885dmr316691205e9.2.1791975747413;
        Wed, 14 Oct 2026 04:02:27 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b45eb78csm38078845e9.2.2026.10.14.04.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:02:26 -0700 (PDT)
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
Subject: [PATCH v11 05/13] block: add dma-buf support for raw bdev
Date: Wed, 14 Oct 2026 12:02:03 +0100
Message-ID: <c01c4709dc55a12fb0f2fe1ec847b5f1f0c92789.1791975048.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1791975048.git.asml.silence@gmail.com>
References: <cover.1791975048.git.asml.silence@gmail.com>
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

