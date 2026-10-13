Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D5255C309
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924942; cv=none; b=EH0/BU+n1CcPaQ3oTnVM68s5C75s9EYRWyUs83xbkBqp2U2w2J8uynFzWU9lzpmubh1NgEM9gaJ/XKtrFbg6jM8R1VNLUIEvmVtxAojEEPuFBEaEzxn3/dAMy7MLLYtsESyj9EJU042edeZ9zUuyA5wk2m4OFyI+r4vDJFh3BG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924942; c=relaxed/simple;
	bh=VfD6HJzx1Y38GpK6rDkYF3jfCC0ZHJ/tqnfgL8fmZrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G/8GoLYzek2IWxlns9E8hc7AqJawWH6TCB1JX3z3il2rCciL5fTYTb9JPzQusU8fbkM2TnzV84nQ9iCwl5J6yRehTP7y6NAPLrb4Ftp400YpAcnB5pNShqbKDs5iDEAHmRlLNWggfAbfu4G5wWYAWDoNT0WOscZWmFRSWPtq7BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NYF1X9dw; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NYF1X9dw"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso2442355f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791924937; x=1792529737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XniK4D9I5IxaguHxPaSeNTaZUyaBimf3PNveaq2tpgg=;
        b=NYF1X9dw5MEUnL0I/Vo35Pmqx1XgPO/cKl/aSaUBAn83JUwVJDIaq+bC6tXUWHHa9M
         6dGrcsLhtLzOCIGuV9VCMgSwoxPI/6H9BcPBmQ3vRn9uQ1YjtLsoamxCU7T5CCt9cZLd
         onxPh5HLJxv1zkxdYyw1cLVlcuHGNdfq7BZAvMj9GOHwdBYwfS85yBNtfG5tUID85xXb
         t0nhbaArq+S6CTkLUzi139X1cmKQulUWG+r0PZTXX6R195xjb52iHKHqQCqCSBApHcAH
         eEDVH82VhYSsBHuQGeas8JsPIl6OwtK2gAs27Z6elehdYeeayqnDxMQs7odCZ1kG3UJc
         M1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791924937; x=1792529737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XniK4D9I5IxaguHxPaSeNTaZUyaBimf3PNveaq2tpgg=;
        b=QTi4Yvz+46jVgAnfgS+6CRV53Y4luOs82WD6WwCU9WMeeocTKKZoLl0bDMAEP1sK8i
         XlQqVkxwKJAGVLqBmxKx9WOgfS6vFLCRKk8ry2ob5CiWlhXS82m7ZSy39b0X5kBkAdme
         dvWvU2LW2OautCpYfP2IT5azHGLhkp6jHbBTbgyMuRqyqeIt8WArS5SGngpL+CdSfx8I
         ulIUQpmgA9N9rP9L39GU+Z9CoD1j2NnygIkVswASWyX0g27G9qwde/nxLgjPDfYnA6pA
         cI+SZWfdo8xRMGZ8Xp4YTYzJGumkd50Zvpp8cK1AM7lyGx6d2csB26WGx0jvd/Sjfl6o
         vKww==
X-Forwarded-Encrypted: i=1; AKwUvBz+W4aPVMJbd7csttnljXiYrANwAjYI4e09ytl5Jb8L/7PvIdOpR3/QHj/mzdn1lUdTj+gy/nJ7Dnsvitg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMDz/YBsp4WSEnufrs8CQn2A8kBMZVYOjt2YwOwCcTjX9/n/ug
	kELjS8rO7kGcLg9NyiyMucDu5rCDgQG8TYgh6ZLEsbCjhA6z4bv7avCf
X-Gm-Gg: AYBFou3OwvtlloKvQGk4KadYRkdI+UmHd1BV5IfToypyXutELoymTWAP3dY5ltjakGV
	6o0j7BkaKudeghKyM4gwKBML1xoYzdvEGd5uwXpcM3V1sfNgL3+Yt6ny2lQi8QCBUGpQDYukuLt
	4H42G/nblz3vF21MZWoxEOGkmvfuCzO/Oqse9ugxEg0KiquO+jPLfezSQASU0oLCcxMp4Zg/k3j
	iAqmjDLNO4hDfJnLPdXTD14bNCeMi2IbdO7Bx4QSlCIuWGOS65pNPMhZExV8/Iz5GJmwtjZmNlb
	xt0oUvpvfON7vTnWJkG2QTc87N3c+ki7vdjyJqsl5MRoxllLf+OV+YlNfvIcNPN/rHF4hOhXWyZ
	rGbkYeRPpntUFYF0NZ/ba1GYpZ3pUeyGskFlnsjcnzAQ+EIbmIi9XyBIgnN5WAH8DuceJS+9lHe
	Uc5ROPrs5o5006cGgMRhwAw1VyQd00IElLYUwA2uQZPO2xfWbBiilNOW7wChlmQhpDst7xk7Yi+
	mNkQVokVe/HDnA6nDMY2XScBsryqcR9szqe8PLwW4eIXKO+7mRhcnPYztEvU8V1T3WYln7Dkhem
X-Received: by 2002:a05:6000:43c5:20b0:487:27f6:a4df with SMTP id ffacd0b85a97d-48dbad3c1e2mr19287115f8f.47.1791924936713;
        Tue, 13 Oct 2026 13:55:36 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de7273a0esm2380730f8f.29.2026.10.13.13.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:55:35 -0700 (PDT)
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
Subject: [PATCH v10 09/13] io_uring/rsrc: introduce buf registration structure
Date: Tue, 13 Oct 2026 21:54:53 +0100
Message-ID: <52b9853215688e10e760ba4d6b4d9e91d56b6756.1791924581.git.asml.silence@gmail.com>
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

In preparation to following changes, instead of passing an iovec for
buffer registration introduce a new structure. It'll be moved to uapi
later, but for now it's initialised early from a user provided iovec.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/rsrc.c | 50 ++++++++++++++++++++++++++++++++++---------------
 1 file changed, 35 insertions(+), 15 deletions(-)

diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index 1efaf29514e8..7234dcdb8372 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -27,8 +27,13 @@ struct io_rsrc_update {
 	u32				offset;
 };
 
+struct io_uring_regbuf_desc {
+	__u64 uaddr;
+	__u64 size;
+};
+
 static struct io_rsrc_node *io_sqe_buffer_register(struct io_ring_ctx *ctx,
-						   struct iovec *iov);
+						   struct io_uring_regbuf_desc *desc);
 
 static int hpage_acct_ref(struct io_ring_ctx *ctx, struct page *hpage,
 			  bool *acct_new)
@@ -81,6 +86,15 @@ static bool hpage_acct_unref(struct io_ring_ctx *ctx, struct page *hpage)
 
 #define IO_CACHED_BVECS_SEGS	32
 
+static void io_iov_to_regbuf_desc(const struct iovec *iov,
+				  struct io_uring_regbuf_desc *desc)
+{
+	*desc = (struct io_uring_regbuf_desc) {
+		.uaddr = (u64)(uintptr_t)iov->iov_base,
+		.size = iov->iov_len,
+	};
+}
+
 int __io_account_mem(struct user_struct *user, unsigned long nr_pages)
 {
 	unsigned long page_limit, cur_pages, new_pages;
@@ -398,6 +412,7 @@ static int __io_sqe_buffers_update(struct io_ring_ctx *ctx,
 		return -EINVAL;
 
 	for (done = 0; done < nr_args; done++) {
+		struct io_uring_regbuf_desc desc;
 		struct io_rsrc_node *node;
 		u64 tag = 0;
 
@@ -411,7 +426,9 @@ static int __io_sqe_buffers_update(struct io_ring_ctx *ctx,
 			err = -EFAULT;
 			break;
 		}
-		node = io_sqe_buffer_register(ctx, iov);
+
+		io_iov_to_regbuf_desc(iov, &desc);
+		node = io_sqe_buffer_register(ctx, &desc);
 		if (IS_ERR(node)) {
 			err = PTR_ERR(node);
 			break;
@@ -870,26 +887,29 @@ bool io_check_coalesce_buffer(struct page **page_array, int nr_pages,
 }
 
 static struct io_rsrc_node *io_sqe_buffer_register(struct io_ring_ctx *ctx,
-						   struct iovec *iov)
+						   struct io_uring_regbuf_desc *desc)
 {
+	unsigned long uaddr = (unsigned long)desc->uaddr;
+	size_t size = desc->size;
 	struct io_mapped_ubuf *imu = NULL;
 	struct page **pages = NULL;
 	struct io_rsrc_node *node;
 	unsigned long off;
-	size_t size;
 	int ret, nr_pages, i;
 	struct io_imu_folio_data data;
 	bool coalesced = false;
 
-	if (!iov->iov_base) {
-		if (iov->iov_len)
+	if (uaddr != desc->uaddr || size != desc->size)
+		return ERR_PTR(-EOVERFLOW);
+
+	if (!uaddr) {
+		if (size)
 			return ERR_PTR(-EFAULT);
 		/* remove the buffer without installing a new one */
 		return NULL;
 	}
 
-	ret = io_validate_user_buf_range((unsigned long)iov->iov_base,
-					 iov->iov_len);
+	ret = io_validate_user_buf_range(uaddr, size);
 	if (ret)
 		return ERR_PTR(ret);
 
@@ -898,8 +918,7 @@ static struct io_rsrc_node *io_sqe_buffer_register(struct io_ring_ctx *ctx,
 		return ERR_PTR(-ENOMEM);
 
 	ret = -ENOMEM;
-	pages = io_pin_pages((unsigned long) iov->iov_base, iov->iov_len,
-				&nr_pages);
+	pages = io_pin_pages(uaddr, size, &nr_pages);
 	if (IS_ERR(pages)) {
 		ret = PTR_ERR(pages);
 		pages = NULL;
@@ -921,10 +940,9 @@ static struct io_rsrc_node *io_sqe_buffer_register(struct io_ring_ctx *ctx,
 	if (ret)
 		goto done;
 
-	size = iov->iov_len;
 	/* store original address for later verification */
-	imu->ubuf = (unsigned long) iov->iov_base;
-	imu->len = iov->iov_len;
+	imu->ubuf = uaddr;
+	imu->len = size;
 	imu->folio_shift = PAGE_SHIFT;
 	imu->release = io_release_ubuf;
 	imu->priv = imu;
@@ -934,7 +952,7 @@ static struct io_rsrc_node *io_sqe_buffer_register(struct io_ring_ctx *ctx,
 		imu->folio_shift = data.folio_shift;
 	refcount_set(&imu->refs, 1);
 
-	off = (unsigned long)iov->iov_base & ~PAGE_MASK;
+	off = uaddr & ~PAGE_MASK;
 	if (coalesced)
 		off += data.first_folio_page_idx << PAGE_SHIFT;
 
@@ -986,6 +1004,7 @@ int io_sqe_buffers_register(struct io_ring_ctx *ctx, void __user *arg,
 		memset(iov, 0, sizeof(*iov));
 
 	for (i = 0; i < nr_args; i++) {
+		struct io_uring_regbuf_desc desc;
 		struct io_rsrc_node *node;
 		u64 tag = 0;
 
@@ -1009,7 +1028,8 @@ int io_sqe_buffers_register(struct io_ring_ctx *ctx, void __user *arg,
 			}
 		}
 
-		node = io_sqe_buffer_register(ctx, iov);
+		io_iov_to_regbuf_desc(iov, &desc);
+		node = io_sqe_buffer_register(ctx, &desc);
 		if (IS_ERR(node)) {
 			ret = PTR_ERR(node);
 			break;
-- 
2.54.0

