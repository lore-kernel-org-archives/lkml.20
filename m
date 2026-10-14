Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050934FDE60
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791975766; cv=none; b=OGNiF7b+16/eUZBO+FctRNaspa/zEcxfUDq9AoNQAp5QMWaxb0TPyZJmMKU7g6eBnV0bjy19xJErtrOoo+fxeDbqzUClXudQRMVkXl4YDYtP99WB0xhG4CMkfoPbicKOpvHOXwi9wKzCQxHGYkSn/KEoLDBkvN1uSp4BxjMOVpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791975766; c=relaxed/simple;
	bh=VfD6HJzx1Y38GpK6rDkYF3jfCC0ZHJ/tqnfgL8fmZrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KQ/Otk8g8BduYm9SkWhaVIEXpGXGGonTyvxDyr+sa/qgaNPYkTe0LOb1mXSHg6DrNYMkhK2bWCAX8SB/3/VXSFrGBNfS1ZdEPbtx0J7HKzSzNHPIEf9Pw5/hoqe6jrePfj2oER+ujHSQ0yinI6hasWYcVG5dvYmoF/q9D/XFwDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E3TXbZ0F; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E3TXbZ0F"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a17baef589so7409935e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791975756; x=1792580556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XniK4D9I5IxaguHxPaSeNTaZUyaBimf3PNveaq2tpgg=;
        b=E3TXbZ0FCh/WllUwLQrvmEis4IBA34kDY1oulmfCb5z5QhMLc6rbgbAXbTYOl6o6Am
         xMiFRrCvYbQe8r/txbAws1RhwPEULtHySTadC7kW54UTrdC08T55wA+Wx1CMS3yXinEZ
         RmVhIjK4TzvPHRG13lMTkHIuv8y5rDuujvjHeE0yceRaIqJ+Cg7vuDcv7KyVi2OzR06Y
         pjsmdppc7XLFSUXuJtpo8epflMfy/QFxiFjgtfOAc+yrvbhk376kqbgFY0pesePWlKeK
         WKJRYBTl/8c4tsSAQarZt25zgS7k7EnERHCq5JQO86bA4oZ6GXNtMOjkzrQ5Gxx8bZlO
         FVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791975756; x=1792580556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XniK4D9I5IxaguHxPaSeNTaZUyaBimf3PNveaq2tpgg=;
        b=VzbIViQ3m0rrrkcQ1YOvYpVxVsMtNa1h2QLmNnxkKdswVz++SHMYJPer/PaqzoxPQF
         q/z7yEK3sKbS6pExGqTh5mgKgmFuMVypHRnvhRIz7L6LUG3pRZfL7qyv6M5D9znUkI8k
         CscrPlFPck7GfyzFtU0OYQORqSRZpCshVQ2/97fGP5Qi6RETQAJa9YUnG61/2CLOtNDn
         3EP7zijp/Ls0VUyto8o5y7ky6Tj43Ou/cGFyN4xnhhlHhhfokIX2dT0c8CGzLOA5z6QU
         2xMuReqzVy/sEzC+lujOIKqwmueaYvtx5yFxKy12wj6nCFnDqJCd4xvPZGElF4nVw676
         21TA==
X-Forwarded-Encrypted: i=1; AKwUvBy6rZs7GnVILDU4n51pf9z8yrigCDMEa+UZX4O0ASiLuHGYfok6R8WhnaRbOYeKvS6PoAGd8Ki5OyzSDwI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwO6mCzenu2Q2PyJM027GzMJzi3VJkebmSSEknyQh+1kOuu0GA
	39heQX29EF3vDNG/QON/1EJLzqVO2GKjTS41gOJ0b9cv8+L34k+Vufso
X-Gm-Gg: AYBFou2lN9BHWgdtsHYZkzWwbqKXDEwl3lvRoHxL33rJAx2oKPa0FM3GddmazyL4LHV
	2qwGYSScDf1UBShFPwtb55hNM0yLSODZCzOdeeIYHdv/0noznfazgpmfD7th/5F3+ZCyt+7wsgd
	bkvrS6Ja6SRBauf1UnIFH4xTWglxDrbKWv5zjSBqHeBYr+gGc2Nfct2Lbl2lZJct2629XxORsIO
	LI/8Y3XMcMsRkSapm3+7ujdXjGoJrTa9vO44B4CKI9VIUihxtFcvJTQaC+iEUD7E7LwH/H6o5Pb
	6lpKdCoXtOff8C8T5SDNXFjtLCQlnZo7lF9i4tpzwSf6oOW/kMsBLaApX8uCR2eZqeohK7q+ce7
	sRkzUMzDSipkhXfT0CKK2j3BG9AgMICt269xRxWb4yGPzx8TYiQcdfe0HyPqAwMMZNmDyHBU+XG
	7j9TWTJ1f/bjLoBXSG3dlCCb0xQKuBNtbTiHUINnP2U66Ci5gzye69HpqgsoEVOBtRSqC+fITLb
	Ae8uEkmgGRMaupyeEmuy6CL2F2VRd8WCjvpYNjEcHnqRuQwXM3LCkwW4ySMuH2YVraoqUDFyCHl
X-Received: by 2002:a05:600c:1549:b0:4a0:25c:8af2 with SMTP id 5b1f17b1804b1-4a18e491051mr343632765e9.17.1791975755701;
        Wed, 14 Oct 2026 04:02:35 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b45eb78csm38078845e9.2.2026.10.14.04.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:02:35 -0700 (PDT)
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
Subject: [PATCH v11 09/13] io_uring/rsrc: introduce buf registration structure
Date: Wed, 14 Oct 2026 12:02:07 +0100
Message-ID: <178bbcbc7a0a9cf017284e8b15d5434fb546fcaf.1791975048.git.asml.silence@gmail.com>
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

