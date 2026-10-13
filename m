Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F81155C323
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924952; cv=none; b=FlTNzu4jDsCE/4W/0MJjRyxImwcdUsHr2W9NCfUjEMylWjBqtpqJMcwWMA6vxHnzHvs8hrtgbpKQ8PU0KjsJW0nupghqVrnSTPs7Tu9+5jq21p42Hcm5q7VVmdohiuP8PFipxLUtWRrIDtkuw5KR6yBLJiQqGQ2rhDNbAgK3jOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924952; c=relaxed/simple;
	bh=bXbAIgu8XiflD4WoySdMtpdgz0ClWZkdJULVv1/YSpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aA3eweTo6W4MUQS56giPYDgXV32QWwV1guonmPK9JqhrahxbFBi2aLkBjuVWtXlBeAOMD6f9+d3jQ1+XSDSF/QOnS/hCww4FbdIrWQZE/Q/zwkHINL0EFthEqYoKqMCjVRQkiWux2SZWcvvtWm4YRDdC3b7HKVuQQRcguRzZhBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JiOW3K4P; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JiOW3K4P"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48afbd2c386so1987077f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791924938; x=1792529738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jun/zHGshv7Ie+bKLV3PJNKMmcdIRnJjgz+qOkaWbDg=;
        b=JiOW3K4PVd9zrWU8Dl5RMZulza4Vg+3mJVGB9XRUAbB3Wllf6TmrFiy9+VFu2TeEDT
         ZLh3ZsTQL5UL7hbKKo2gzQz5yMhxUOxzHs3UoNMr7Ekp2Hw8dcwSQkwj2bMgnwlDHT5m
         sc8DvxmgZgF9bNv9j9NmfaCVS1ETdUFr9/nsHwOs5dA+pkYWouVmRWVDEh+yAxzIQsYF
         /Fq/Cw0RrsisFzOPYuAO2A2jkDYfeSXkxWX9DD4mnv+dJgHVqblVvEwI2jPOldn8ZF68
         EesEl0rqhwis+Qh7Y6DkXdfk0fww8tjonRYe0pXDstjlXLyfiJuuo2kXmXvGA/ek49C7
         OGzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791924938; x=1792529738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jun/zHGshv7Ie+bKLV3PJNKMmcdIRnJjgz+qOkaWbDg=;
        b=KKxe5BVia6/Z7TzzeIlCrX9FD9roQjSDTZwOI1OnjK9ogwxB11/t5wRmvLvp//MwNS
         YfWnjgGSbdeXNSjfVRA0a6glaEf2SyDNHo8cFVV86ZwS4zi/GdV/oxbvTJJYiDLDmIIh
         NYkbE+JC6KWc4ncZhexyxi3O6zvbo8nF7XjoK8bwxudUbzk44lvFRIS2SaYtvZ620U+6
         rE9VxaOuQI9F0PeOQE+zelaSN40BvfrJPsRN4C2L+jc0rQLeIuRHtO3kmS/5fuyFJJvJ
         8Z7dBa8n7fOev9O0kPxEcOxAi5LDy2jWHGfI3djR1KGDKaNbRY/kL/tXNLMLP88SAzXK
         jL+w==
X-Forwarded-Encrypted: i=1; AKwUvBwn7LZRuPsDecsOkkmdBzgIGyeUZQnWYq0ZqV90q6cjWL5yCvVrLNFkzD5Gp5vgE1yMio/EyrWnxYFo2oo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeM9H3Oz8Yt3ONQkJce0Zk/tgZo1FqXHY0vjJ8OoOSjpPNByHU
	U7Vl6RolfSZb7mrw1fmw/ER5PgA2Jc7Nn5SNXsxTfUzkbYIRuiP2T0h0
X-Gm-Gg: AYBFou3Rz32UmdbXcUPgG2EY1J3WijtUF9an0VQeZa5gxW0uVBh58IkzKO7+SfIbq/K
	duY5nXOrpqDoE5sfza7LnTljaBgQ6X3FyGDbUJ2GB8+k6H4vgMoG7Bps6D3N8D3QBH5pJFJz1DQ
	ruvXepdTva6WB8phZavnWJyC/zJIaBGT82kS0PHAeHCO7kDZLwNAfZcSHGuSwcxEwA+EkOTW7Um
	/eg6saqUR86rBfWI3P7NadErxhMEpw29qGks/PHVKBSa7ZhVlkf+cgOnvR8X+SLzlrzwy6x20Ee
	4dCxJTAaqh5sYPsTkHNTZ06hmd+39Zc5NG5wyagyGRbbThVyaCAQToMxjVok0WIyfKoO3lg3xm6
	RRmKmncU5GNM77dZjqM5hQjlPrqJrAij9yJ1irjiFfPh67/cBxoWY4jVfsGTegrzL+h31rkCWtO
	JtE1dfDMUse1KGubilRGonhlg0Ir1AMq1fA+Q2/KmfrJb4g5SQNis/ROAiSeEr6IpmEzgKzDsTg
	/kc/OWsDufgTXymhpxrt//tF1EpBKZVkJkoMOn8gExZVNUAO2lybZVL/b+It93uv2RbUgOD8q9Z
X-Received: by 2002:adf:f704:0:b0:488:894d:20b0 with SMTP id ffacd0b85a97d-48dbad336a7mr19927039f8f.44.1791924938291;
        Tue, 13 Oct 2026 13:55:38 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de7273a0esm2380730f8f.29.2026.10.13.13.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:55:37 -0700 (PDT)
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
Subject: [PATCH v10 10/13] io_uring/rsrc: extend buffer update
Date: Tue, 13 Oct 2026 21:54:54 +0100
Message-ID: <0ebd979544306d60e98e9e1afb1c7147fa5da6c1.1791924581.git.asml.silence@gmail.com>
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

We need to pass more information to buffer registration than we can fit
into a single struct iovec. This patch allows users to optionally pass
struct io_uring_regbuf_desc. Apart from having more space for future use
cases, it also introduces registration types.

Currently, the type can be either of IO_REGBUF_TYPE_UADDR, which mirrors
the iovec path, or IO_REGBUF_TYPE_EMPTY for leaving a buffer table slot
empty. The next patch introduces a dmabuf backed type, and can be useful
for other extensions like splicing a list of user addresses (i.e.
iovec[]), interoperability with zcrx, kernel allocated memory like was
brough up by Cristoph. Note, the type only represents a registration
option, which is distinct from how io_uring internally stores it.

The flags field is not used yet but always useful to have, e.g. we can
encode read-only / write-only restrictions using it.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 include/uapi/linux/io_uring.h | 27 +++++++++++++-
 io_uring/rsrc.c               | 68 +++++++++++++++++++++--------------
 2 files changed, 68 insertions(+), 27 deletions(-)

diff --git a/include/uapi/linux/io_uring.h b/include/uapi/linux/io_uring.h
index b42b66b424a7..abb590833a0f 100644
--- a/include/uapi/linux/io_uring.h
+++ b/include/uapi/linux/io_uring.h
@@ -791,13 +791,38 @@ struct io_uring_rsrc_update {
 
 struct io_uring_rsrc_update2 {
 	__u32 offset;
-	__u32 resv;
+	__u32 flags;
 	__aligned_u64 data;
 	__aligned_u64 tags;
 	__u32 nr;
 	__u32 resv2;
 };
 
+/* struct io_uring_rsrc_update2::flags */
+enum io_uring_rsrc_reg_flags {
+	/*
+	 * Use the extended descriptor format for buffer updates,
+	 * see struct io_uring_regbuf_desc
+	 */
+	IORING_RSRC_UPDATE_EXTENDED		= 1U << 1,
+};
+
+/* Buffer registration type, passed in struct io_uring_regbuf_desc::type */
+enum io_uring_regbuf_type {
+	IO_REGBUF_TYPE_EMPTY,
+	IO_REGBUF_TYPE_UADDR,
+
+	__IO_REGBUF_TYPE_MAX,
+};
+
+struct io_uring_regbuf_desc {
+	__u32 type; /* enum io_uring_regbuf_type */
+	__u32 flags;
+	__u64 size;
+	__u64 uaddr;
+	__u64 __resv[7];
+};
+
 /* Skip updating fd indexes set to this value in the fd table */
 #define IORING_REGISTER_FILES_SKIP	(-2)
 
diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index 7234dcdb8372..54774729ee67 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -27,11 +27,6 @@ struct io_rsrc_update {
 	u32				offset;
 };
 
-struct io_uring_regbuf_desc {
-	__u64 uaddr;
-	__u64 size;
-};
-
 static struct io_rsrc_node *io_sqe_buffer_register(struct io_ring_ctx *ctx,
 						   struct io_uring_regbuf_desc *desc);
 
@@ -90,9 +85,12 @@ static void io_iov_to_regbuf_desc(const struct iovec *iov,
 				  struct io_uring_regbuf_desc *desc)
 {
 	*desc = (struct io_uring_regbuf_desc) {
+		.type = IO_REGBUF_TYPE_UADDR,
 		.uaddr = (u64)(uintptr_t)iov->iov_base,
 		.size = iov->iov_len,
 	};
+	if (!desc->uaddr)
+		desc->type = IO_REGBUF_TYPE_EMPTY;
 }
 
 int __io_account_mem(struct user_struct *user, unsigned long nr_pages)
@@ -340,6 +338,8 @@ static int __io_sqe_files_update(struct io_ring_ctx *ctx,
 		return -ENXIO;
 	if (up->offset + nr_args > ctx->file_table.data.nr)
 		return -EINVAL;
+	if (up->flags)
+		return -EINVAL;
 
 	for (done = 0; done < nr_args; done++) {
 		u64 tag = 0;
@@ -399,9 +399,8 @@ static int __io_sqe_buffers_update(struct io_ring_ctx *ctx,
 				   struct io_uring_rsrc_update2 *up,
 				   unsigned int nr_args)
 {
+	bool extended = up->flags & IORING_RSRC_UPDATE_EXTENDED;
 	u64 __user *tags = u64_to_user_ptr(up->tags);
-	struct iovec fast_iov, *iov;
-	struct iovec __user *uvec;
 	u64 user_data = up->data;
 	__u32 done;
 	int i, err;
@@ -410,29 +409,49 @@ static int __io_sqe_buffers_update(struct io_ring_ctx *ctx,
 		return -ENXIO;
 	if (up->offset + nr_args > ctx->buf_table.nr)
 		return -EINVAL;
+	if (up->flags & ~IORING_RSRC_UPDATE_EXTENDED)
+		return -EINVAL;
 
 	for (done = 0; done < nr_args; done++) {
 		struct io_uring_regbuf_desc desc;
 		struct io_rsrc_node *node;
 		u64 tag = 0;
 
-		uvec = u64_to_user_ptr(user_data);
-		iov = iovec_from_user(uvec, 1, 1, &fast_iov, io_is_compat(ctx));
-		if (IS_ERR(iov)) {
-			err = PTR_ERR(iov);
-			break;
-		}
 		if (tags && copy_from_user(&tag, &tags[done], sizeof(tag))) {
 			err = -EFAULT;
 			break;
 		}
 
-		io_iov_to_regbuf_desc(iov, &desc);
+		if (extended) {
+			if (copy_from_user(&desc, u64_to_user_ptr(user_data),
+					   sizeof(desc))) {
+				err = -EFAULT;
+				break;
+			}
+			user_data += sizeof(desc);
+		} else {
+			struct iovec __user *uvec = u64_to_user_ptr(user_data);
+			struct iovec fast_iov, *iov;
+
+			if (io_is_compat(ctx))
+				user_data += sizeof(struct compat_iovec);
+			else
+				user_data += sizeof(struct iovec);
+
+			iov = iovec_from_user(uvec, 1, 1, &fast_iov, io_is_compat(ctx));
+			if (IS_ERR(iov)) {
+				err = PTR_ERR(iov);
+				break;
+			}
+			io_iov_to_regbuf_desc(iov, &desc);
+		}
+
 		node = io_sqe_buffer_register(ctx, &desc);
 		if (IS_ERR(node)) {
 			err = PTR_ERR(node);
 			break;
 		}
+
 		if (tag) {
 			if (!node) {
 				err = -EINVAL;
@@ -443,10 +462,6 @@ static int __io_sqe_buffers_update(struct io_ring_ctx *ctx,
 		i = array_index_nospec(up->offset + done, ctx->buf_table.nr);
 		io_reset_rsrc_node(ctx, &ctx->buf_table, i);
 		ctx->buf_table.nodes[i] = node;
-		if (io_is_compat(ctx))
-			user_data += sizeof(struct compat_iovec);
-		else
-			user_data += sizeof(struct iovec);
 	}
 	return done ? done : err;
 }
@@ -481,7 +496,7 @@ int io_register_files_update(struct io_ring_ctx *ctx, void __user *arg,
 	memset(&up, 0, sizeof(up));
 	if (copy_from_user(&up, arg, sizeof(struct io_uring_rsrc_update)))
 		return -EFAULT;
-	if (up.resv || up.resv2)
+	if (up.resv2)
 		return -EINVAL;
 	return __io_register_rsrc_update(ctx, IORING_RSRC_FILE, &up, nr_args);
 }
@@ -495,7 +510,7 @@ int io_register_rsrc_update(struct io_ring_ctx *ctx, void __user *arg,
 		return -EINVAL;
 	if (copy_from_user(&up, arg, sizeof(up)))
 		return -EFAULT;
-	if (!up.nr || up.resv || up.resv2)
+	if (!up.nr || up.resv2)
 		return -EINVAL;
 	return __io_register_rsrc_update(ctx, type, &up, up.nr);
 }
@@ -595,12 +610,9 @@ int io_files_update(struct io_kiocb *req, unsigned int issue_flags)
 	struct io_uring_rsrc_update2 up2;
 	int ret;
 
+	memset(&up2, 0, sizeof(up2));
 	up2.offset = up->offset;
 	up2.data = up->arg;
-	up2.nr = 0;
-	up2.tags = 0;
-	up2.resv = 0;
-	up2.resv2 = 0;
 
 	if (up->offset == IORING_FILE_INDEX_ALLOC) {
 		ret = io_files_update_with_index_alloc(req, issue_flags);
@@ -901,9 +913,13 @@ static struct io_rsrc_node *io_sqe_buffer_register(struct io_ring_ctx *ctx,
 
 	if (uaddr != desc->uaddr || size != desc->size)
 		return ERR_PTR(-EOVERFLOW);
+	if (desc->type >= __IO_REGBUF_TYPE_MAX)
+		return ERR_PTR(-EINVAL);
+	if (!mem_is_zero(&desc->__resv, sizeof(desc->__resv)) || desc->flags)
+		return ERR_PTR(-EINVAL);
 
-	if (!uaddr) {
-		if (size)
+	if (desc->type == IO_REGBUF_TYPE_EMPTY) {
+		if (uaddr || size)
 			return ERR_PTR(-EFAULT);
 		/* remove the buffer without installing a new one */
 		return NULL;
-- 
2.54.0

