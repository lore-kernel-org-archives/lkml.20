Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971AB4C6525
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790602387; cv=none; b=APx9vgHKBF6WQ5+TzhcyKIl9RTCwx5sGrbNmLh94Ty6l+VxxyXyypio4q2ZiW6fpvciQcdP6Q8MxVKgd77wdUhBu0XzHQdQ1IdL7cmWcWR+I2966WKjBco0kEkHMP4mbpdfpyD/xtTXO/dkgX5lVp9FPy0FPcNc7T9dUjoj/JM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790602387; c=relaxed/simple;
	bh=Z4vOxks9qTIFK+TCf+DcsECaWrDahRJWHvnK/Oy0YsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UtEGoNndgjQ30LIWXl2rh0WZHC+DY1UYkPYh1LWlkVFno9LuALSi5jPOIc6mUFiQqno0iExZIkxUJjMCiPIpcl7yCa+8gkT+r2W9TTHydFQfjYygdBDUqA0ba2O3LttLATCIVevUX5WvTQF3s2bLQrf35lWZku887OCP/dGh+d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UY3RrCwh; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UY3RrCwh"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-482f6351831so1773696f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790602379; x=1791207179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/RT09IM6iAPFk2VI7P8d4NpW1v04uxG67FoGdSGxGhI=;
        b=UY3RrCwhYnPhXr8AkzcnPeNEkbrBMyA04UBKWmnTDBNGELNHpkWH7w5fS5Txp1Huc8
         hC1amO1hXCloFTtcV/9kThFy3Bah+Qxa+4sLYJxvNT912FKfzrPTDu2CsboIvPFtheT6
         XTMjl+eaf1MgkmjSuG01yKrsGrVGSpCEQvbjClfptMxRdTrYa+me8F24MROwh0iMp8QJ
         cbBfbnKppGaxfMKLM67XEjEjnwUjshA35fxgjnfoDMIzSi+OejtxQ1xTgEOL42yMhm6G
         z37g0kLzqiJ59alYwznS+6643oEu1CyPgllnqMcNN5uzzh30t3+1QVR4upyxq6tlX/3J
         d5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790602379; x=1791207179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/RT09IM6iAPFk2VI7P8d4NpW1v04uxG67FoGdSGxGhI=;
        b=eJxsgJM80a6QkkgzhHHnnAfqq3NNL8I/szMQJGoQ8AYrE9SNoFn0eP+E3gR3uWAD3/
         8Z706CBDSEkdPBsPTAyyoVugMwP883AFQMcV5+dQIQxRsebgpR3RZZnZasgDxsc/D4Dg
         QRiYhiGg1iypMh+EivSKDGGcpC8SeXU35wAYvT4hrf4HYzkhOPXlQUJ9MkeEoKgapA4w
         KP420CYq84RchSYUw7UW2neEUelikeJExqlGimguYhCKofFukvOym6W1f8FGo13YdICz
         dcCsKkyMyOvxuQQEt+bZs6oqDde5ql6q5SSk6FelnlChGYLBVF+Yxri7a4AlFhD+g+kE
         QKRg==
X-Forwarded-Encrypted: i=1; AKwUvBwzKQzCY1wOKXXO+LrIeMJpY1ODkiueqRRjWMmdPzHrFqfRNf8CIvJN6DkAjAFUAD9kr3gxhNLKgAKrTxo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVL2831zxeLi6Emms/JV0dNCtMowy1sxdK2ZIcYHjxGxp8wAly
	YusbRxARy78WG0gAm7v18SsvnO9/lRPimtjOOrS4MR0w7jCysBH1muPe
X-Gm-Gg: AYBFou3IheM6vK8GRv5+oY0AxgTJX0l8qNW/iISz02QW6TCNKBlSRFPjIxcJUi9zYBx
	KF0S8hbYWM6NAEV6ISVeyDe2CujcwEtudwlq+nRZ1sauZNCimypDqNO5CQwZOEXiObrTAm8mdT1
	wkvo5PKcuga3n/+tKhoMosmlhXUZj56tuMWyzWlsoEA773tvfeer8HL45n5BJpQ5XJUsINoqaBr
	6Q44oiSgIHHf8dF7HzwqFDQt0hpTeMXDGFsJotY2esy9nWbHMFYZA57FJ8vqxMSrjuVU15wh4es
	EBHeIUUyW5kjpjnzv8sWBWU7bK1VRWkmmzio5IBpVbeTdawfa7htmj2UbvLYEwMcrTBu3bBbm2Y
	iMA9LMzv4vRQJ/PQZ0Hjc43YnSrUpw8BShxUEQl5T0DP2FzmeWlW5FDjokCPzu7l1iT2mzcwnkb
	nVkAuaxflTF8ureTFLb0aKQR8RKuW5j3LdyDO4qmThu/uuYWmUaagskiFY44pecLL5J4ezYSito
	QxfTf2dCJ3PNjDQx6q4vC1KJqPEB9+wEFPZrMdD1AvVUYsOscUTwjGZUqpF5f3wDohRbI1Wb8sA
X-Received: by 2002:a05:6000:1887:b0:486:f4ae:72a2 with SMTP id ffacd0b85a97d-4887170dd0dmr23900440f8f.1.1790602378210;
        Mon, 28 Sep 2026 06:32:58 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a349731sm28090164f8f.12.2026.09.28.06.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 06:32:57 -0700 (PDT)
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
	Phil Cayton <phil.cayton@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	dm-devel@lists.linux.dev
Subject: [PATCH v7 09/13] io_uring/rsrc: introduce buf registration structure
Date: Mon, 28 Sep 2026 14:32:25 +0100
Message-ID: <f0305198380997a88a3ed020fd6e69246992220d.1790602223.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1790602223.git.asml.silence@gmail.com>
References: <cover.1790602223.git.asml.silence@gmail.com>
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
 io_uring/rsrc.c | 47 ++++++++++++++++++++++++++++++++---------------
 1 file changed, 32 insertions(+), 15 deletions(-)

diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index 51b46e624ddd..da767b34eb55 100644
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
@@ -381,6 +395,7 @@ static int __io_sqe_buffers_update(struct io_ring_ctx *ctx,
 		return -EINVAL;
 
 	for (done = 0; done < nr_args; done++) {
+		struct io_uring_regbuf_desc desc;
 		struct io_rsrc_node *node;
 		u64 tag = 0;
 
@@ -394,7 +409,9 @@ static int __io_sqe_buffers_update(struct io_ring_ctx *ctx,
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
@@ -853,26 +870,26 @@ bool io_check_coalesce_buffer(struct page **page_array, int nr_pages,
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
 
@@ -881,8 +898,7 @@ static struct io_rsrc_node *io_sqe_buffer_register(struct io_ring_ctx *ctx,
 		return ERR_PTR(-ENOMEM);
 
 	ret = -ENOMEM;
-	pages = io_pin_pages((unsigned long) iov->iov_base, iov->iov_len,
-				&nr_pages);
+	pages = io_pin_pages(uaddr, size, &nr_pages);
 	if (IS_ERR(pages)) {
 		ret = PTR_ERR(pages);
 		pages = NULL;
@@ -904,10 +920,9 @@ static struct io_rsrc_node *io_sqe_buffer_register(struct io_ring_ctx *ctx,
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
@@ -917,7 +932,7 @@ static struct io_rsrc_node *io_sqe_buffer_register(struct io_ring_ctx *ctx,
 		imu->folio_shift = data.folio_shift;
 	refcount_set(&imu->refs, 1);
 
-	off = (unsigned long)iov->iov_base & ~PAGE_MASK;
+	off = uaddr & ~PAGE_MASK;
 	if (coalesced)
 		off += data.first_folio_page_idx << PAGE_SHIFT;
 
@@ -969,6 +984,7 @@ int io_sqe_buffers_register(struct io_ring_ctx *ctx, void __user *arg,
 		memset(iov, 0, sizeof(*iov));
 
 	for (i = 0; i < nr_args; i++) {
+		struct io_uring_regbuf_desc desc;
 		struct io_rsrc_node *node;
 		u64 tag = 0;
 
@@ -992,7 +1008,8 @@ int io_sqe_buffers_register(struct io_ring_ctx *ctx, void __user *arg,
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

