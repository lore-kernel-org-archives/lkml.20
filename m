Received: from mail-qk1-f228.google.com (mail-qk1-f228.google.com [209.85.222.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034BF48EC7E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 22:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788992968; cv=none; b=dBrLft2B3a4SNcEuZ0qxmdKq9VLUkL0JZto+QamcTtXKn0tly/KAwgDekjwL7XkVi2I75WRh0+r5raSim+6j0S1CBcdveldiyWFALaV51RNNlAeE2UxKA0TdkZWiMuqNO/CxlkM8VNFkxJSgjFEyCWyY4MB0Ytamt2tchL/WGlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788992968; c=relaxed/simple;
	bh=B911PpGVigFDT/lyg40PRj0j9/EeMB1ax4L+zlh+iVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nYz0aFSDDsHnRVBWgK4XT3kMLIwJacsaF0JwL7VMqjzp3LCcZ1tlqQ45fVE6XRbPOedFCWCmmBKR9BnvrgwJ+jJyKsTDWc222ZpZ8/EadFFzAG8vrrth39f8qwhqeaVrEF0dl6Ws64ncT5GajeY7e0tbz0XUJKUuaH5AazPXBcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=apqMWr8y; arc=none smtp.client-ip=209.85.222.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="apqMWr8y"
Received: by mail-qk1-f228.google.com with SMTP id af79cd13be357-937690ef0c4so8063385a.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 15:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1788992944; x=1789597744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SaILBiW8UVywRg2XqjSRQl5ll5pe+zqen2OGZ/aVaeY=;
        b=apqMWr8y1QBmToJJeRZK+n/Q15/jkVnTxyLCjlN3RF4ozMIBzobUxoXqUrnjYF7CDK
         dSp/1OJc+tPjgV9r5TDfEG8A02MQh3xkbsEDBfA3YUJH/QOkkH9lgXUaVqD3X+uRvfbY
         JX8DxUvPk4OrX5aMOA2pOV9RYnXIlc2/j9euHcDsfkFDAfAUUEYkDBZRn9A9y09g7YK+
         Ca+bna2H7ALrQNLLLU/q9GKtY28TImhEHRDqe+sPQhlAapFIBymueDBcFQ8t5I6FcYuT
         dFTiU9W6LyGSTyM2aSGOR5wBfjul9sAZeQ0N7+9UZ2iBxnnSgb2q0ReE9Bp7ckqMUWcK
         U6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788992944; x=1789597744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SaILBiW8UVywRg2XqjSRQl5ll5pe+zqen2OGZ/aVaeY=;
        b=OQsY8FAGwmE8n6SfUX0yghYClT+K074yRQB4zsc3TmJrM3ZaUJFGAwyQ30ST4XcF6p
         Nsn/XdgVSKgTfP3jisuezq5yC7PPj2UbD5DeL4iLyT+iZEObvFkbidloNmKQmFtFsHBL
         8nsl3qvCW8/4zZXIYo/qwmk3lXhxIs8o9+9ss+UmhUfLFqGvb9i0ED6mSLo+PnZiAwfv
         7Qaq/0l4lJTGBLEGHbVko6CziO3zG+F1Ll09Ez2kXxNuStkCWJ27rrk/v+++7aimzqLU
         rmSB87kdBpFPlMOjizEeAf2sqjuwPiT6BIaP88gZJ9kLRsZAlp1kwuBJu25LCoLiYbND
         zieA==
X-Forwarded-Encrypted: i=1; AKwUvBz/X7IHhBG1F/L6JDC76rJWq9+rhgKapwNRGqASuwR7wGuPUAqgVgff/8Ebw8Y9WTUQ/1zGxUgjNLMlXdU=@vger.kernel.org
X-Gm-Message-State: AFuF++kYk2UqoX5RDhvTpIFlwjU4rtfGGZ3VnO4Q2W/Eu3HhxBkXFqKT
	nrSvDk5H1xOUwj+LnfIzwiJphlwJbjTiY6A1a9J65db93C4CUUDfiiAfF/gnPcKusCDk3lMJgwx
	6pj7ceC3YKcL28b7uKWIljMibuCa0aueXhXoCMlTUajdKJ0zqxl2s
X-Gm-Gg: AYBFou3+NtGxjqCVKhDUPzk2FUdisMAKUh2+vUzZCQGS45H6i5RkNw7PjTlxr9uSoHg
	mxCbm9YZBA5FdYBTbB7509GMalrqrOu08eEOKYXapt/Qxo6ZtDqcV6JLVJB1Bwb9b1lX/v5Qmz8
	XjDBwVGgwNK6fN9fYiRBgT14j3XPhO3p6JfYsrnnTKLugMoks13gUiSY4vohTAAzXceIOPe3Cj/
	NWA01YLutnJSnrNL3lV3SR4Ke/7WmbmhOn7r/bLOligNwhhkrNno4FXbqG8iwMtyQPTttwUf6L4
	+k/XmKGBu4KRgs8qr0WaV5ruCs9ZVY1YVivtNeEMw1p1+r7ZNI2aCP+IP69ieNkuiw04jWoFrBz
	79keYIjhbaXnrWZC7nw==
X-Received: by 2002:a05:620a:e85:b0:939:94c4:b799 with SMTP id af79cd13be357-93994c4b856mr1986140585a.5.1788992944190;
        Wed, 09 Sep 2026 15:29:04 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-939981ed680sm140542785a.3.2026.09.09.15.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 15:29:04 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.112.12.104])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 8F14E402A4;
	Wed,  9 Sep 2026 16:29:03 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 8CB61E40322; Wed,  9 Sep 2026 16:29:03 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Jens Axboe <axboe@kernel.dk>,
	Keith Busch <kbusch@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: io-uring@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 5/6] io_uring/cmd: support fixed buffer for metadata
Date: Wed,  9 Sep 2026 16:28:35 -0600
Message-ID: <20260909222836.2475352-6-csander@purestorage.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909222836.2475352-1-csander@purestorage.com>
References: <20260909222836.2475352-1-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow a "metadata" io_uring fixed buffer to be imported by uring_cmds in
addition to the existing data buffer node. NVMe passthrough requests
will use the new buffer node for their metadata buffers if requested.

Provide a function io_uring_cmd_import_fixed_metadata() analogous to
io_uring_cmd_import_fixed() that initializes an iov_iter for a user
address range contained within a fixed buffer. The buffer node is stored
in previously unused space in struct io_uring_cmd so it can be reused if
imported multiple times and released once the uring_cmd completes.

Whereas a fixed data buffer is indicated by io_uring_sqe's
uring_cmd_flags bit IORING_URING_CMD_FIXED and buf_index, how the fixed
metadata buffer is specified is left up to the uring_cmd implementation.

io_get_buf_node() is split out of io_find_buf_node() and moved to rsrc.h
so it can be reused for the metadata buffer. io_import_fixed() is made
extern so it can be called from uring_cmd.c, and io_rsrc_node is passed
instead of io_mapped_ubuf so uring_cmd.c doesn't have to reach into
io_rsrc_node.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 include/linux/io_uring/cmd.h | 12 +++++++++++-
 io_uring/rsrc.c              | 28 +++++++++++-----------------
 io_uring/rsrc.h              | 17 +++++++++++++++++
 io_uring/uring_cmd.c         | 30 +++++++++++++++++++++++++++++-
 4 files changed, 68 insertions(+), 19 deletions(-)

diff --git a/include/linux/io_uring/cmd.h b/include/linux/io_uring/cmd.h
index 2e4368d611ee..6df5f3bf5628 100644
--- a/include/linux/io_uring/cmd.h
+++ b/include/linux/io_uring/cmd.h
@@ -16,11 +16,11 @@ struct io_uring_cmd {
 	struct file	*file;
 	const struct io_uring_sqe *sqe;
 	u32		cmd_op;
 	u32		flags;
 	u8		pdu[32]; /* available inline for free use */
-	u8		unused[8];
+	struct io_rsrc_node *metadata_node;
 };
 
 #define io_uring_sqe128_cmd(sqe, type)	({					\
 	BUILD_BUG_ON(sizeof(type) > ((2 * sizeof(struct io_uring_sqe)) -	\
 				     offsetof(struct io_uring_sqe, cmd)));	\
@@ -68,10 +68,14 @@ int io_uring_cmd_import_fixed(u64 ubuf, unsigned long len, int rw,
 int io_uring_cmd_import_fixed_vec(struct io_uring_cmd *ioucmd,
 				  const struct iovec __user *uvec,
 				  size_t uvec_segs,
 				  int ddir, struct iov_iter *iter,
 				  unsigned issue_flags);
+int io_uring_cmd_import_fixed_metadata(struct io_uring_cmd *ioucmd,
+				       u16 buf_index, u64 ubuf, size_t len,
+				       int ddir, struct iov_iter *iter,
+				       unsigned int issue_flags);
 
 /*
  * Completes the request, i.e. posts an io_uring CQE and deallocates @ioucmd
  * and the corresponding io_uring request.
  *
@@ -125,10 +129,16 @@ static inline int io_uring_cmd_import_fixed_vec(struct io_uring_cmd *ioucmd,
 						int ddir, struct iov_iter *iter,
 						unsigned issue_flags)
 {
 	return -EOPNOTSUPP;
 }
+static inline int io_uring_cmd_import_fixed_metadata(
+	struct io_uring_cmd *ioucmd, u16 buf_index, u64 ubuf, size_t len,
+	int ddir, struct iov_iter *iter, unsigned int issue_flags)
+{
+	return -EOPNOTSUPP;
+}
 static inline void __io_uring_cmd_done(struct io_uring_cmd *cmd,
 				       unsigned issue_flags)
 {
 }
 static inline void __io_uring_cmd_do_in_task(struct io_uring_cmd *ioucmd,
diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index 174f74cbbf60..4bd69803c470 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -1134,14 +1134,14 @@ static int io_import_kbuf(int ddir, struct iov_iter *iter,
 	iov_iter_bvec(iter, ddir, imu->bvec, imu->nr_bvecs, count);
 	iov_iter_advance(iter, offset);
 	return 0;
 }
 
-static int io_import_fixed(int ddir, struct iov_iter *iter,
-			   struct io_mapped_ubuf *imu,
-			   u64 buf_addr, size_t len)
+int io_import_fixed(int ddir, struct iov_iter *iter, struct io_rsrc_node *node,
+		    u64 buf_addr, size_t len)
 {
+	struct io_mapped_ubuf *imu = node->buf;
 	const struct bio_vec *bvec;
 	size_t folio_mask;
 	unsigned nr_segs;
 	size_t offset;
 	int ret;
@@ -1189,28 +1189,22 @@ static int io_import_fixed(int ddir, struct iov_iter *iter,
 }
 
 inline struct io_rsrc_node *io_find_buf_node(struct io_kiocb *req,
 					     unsigned issue_flags)
 {
-	struct io_ring_ctx *ctx = req->ctx;
 	struct io_rsrc_node *node;
 
 	if (req->flags & REQ_F_BUF_NODE)
 		return req->buf_node;
-	req->flags |= REQ_F_BUF_NODE;
 
-	io_ring_submit_lock(ctx, issue_flags);
-	node = io_rsrc_node_lookup(&ctx->buf_table, req->buf_index);
-	if (node) {
-		node->refs++;
-		req->buf_node = node;
-		io_ring_submit_unlock(ctx, issue_flags);
-		return node;
-	}
-	req->flags &= ~REQ_F_BUF_NODE;
-	io_ring_submit_unlock(ctx, issue_flags);
-	return NULL;
+	node = io_get_buf_node(req, req->buf_index, issue_flags);
+	if (!node)
+		return NULL;
+
+	req->flags |= REQ_F_BUF_NODE;
+	req->buf_node = node;
+	return node;
 }
 
 int io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
 			u64 buf_addr, size_t len, int ddir,
 			unsigned issue_flags)
@@ -1218,11 +1212,11 @@ int io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
 	struct io_rsrc_node *node;
 
 	node = io_find_buf_node(req, issue_flags);
 	if (!node)
 		return -EFAULT;
-	return io_import_fixed(ddir, iter, node->buf, buf_addr, len);
+	return io_import_fixed(ddir, iter, node, buf_addr, len);
 }
 
 static int io_buffer_acct_cloned_hpages(struct io_ring_ctx *ctx,
 					struct io_mapped_ubuf *imu)
 {
diff --git a/io_uring/rsrc.h b/io_uring/rsrc.h
index eacfdb70f203..277e2007803d 100644
--- a/io_uring/rsrc.h
+++ b/io_uring/rsrc.h
@@ -4,10 +4,11 @@
 
 #include <linux/bvec.h>
 #include <linux/io_uring_types.h>
 #include <linux/lockdep.h>
 #include <linux/uio.h>
+#include "io_uring.h"
 
 #define IO_VEC_CACHE_SOFT_CAP		256
 
 enum {
 	IORING_RSRC_FILE		= 0,
@@ -64,10 +65,12 @@ void io_free_rsrc_node(struct io_ring_ctx *ctx, struct io_rsrc_node *node);
 void io_rsrc_data_free(struct io_ring_ctx *ctx, struct io_rsrc_data *data);
 int io_rsrc_data_alloc(struct io_rsrc_data *data, unsigned nr);
 
 struct io_rsrc_node *io_find_buf_node(struct io_kiocb *req,
 				      unsigned issue_flags);
+int io_import_fixed(int ddir, struct iov_iter *iter, struct io_rsrc_node *node,
+		    u64 buf_addr, size_t len);
 int io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
 			u64 buf_addr, size_t len, int ddir,
 			unsigned issue_flags);
 int io_import_reg_vec(int ddir, struct iov_iter *iter,
 			struct io_kiocb *req, struct iou_vec *vec,
@@ -100,10 +103,24 @@ static inline struct io_rsrc_node *io_rsrc_node_lookup(struct io_rsrc_data *data
 	if (index < data->nr)
 		return data->nodes[array_index_nospec(index, data->nr)];
 	return NULL;
 }
 
+static inline struct io_rsrc_node *
+io_get_buf_node(const struct io_kiocb *req, u16 buf_index, unsigned issue_flags)
+{
+	struct io_ring_ctx *ctx = req->ctx;
+	struct io_rsrc_node *node;
+
+	io_ring_submit_lock(ctx, issue_flags);
+	node = io_rsrc_node_lookup(&ctx->buf_table, buf_index);
+	if (node)
+		node->refs++;
+	io_ring_submit_unlock(ctx, issue_flags);
+	return node;
+}
+
 static inline void io_put_rsrc_node(struct io_ring_ctx *ctx, struct io_rsrc_node *node)
 {
 	lockdep_assert_held(&ctx->uring_lock);
 	if (!--node->refs)
 		io_free_rsrc_node(ctx, node);
diff --git a/io_uring/uring_cmd.c b/io_uring/uring_cmd.c
index 3d5d8b5f4ebb..e4b384094392 100644
--- a/io_uring/uring_cmd.c
+++ b/io_uring/uring_cmd.c
@@ -25,19 +25,25 @@ void io_cmd_cache_free(const void *entry)
 
 static void io_req_uring_cleanup(struct io_kiocb *req, unsigned int issue_flags)
 {
 	struct io_uring_cmd *ioucmd = io_kiocb_to_cmd(req, struct io_uring_cmd);
 	struct io_async_cmd *ac = req->async_data;
+	struct io_ring_ctx *ctx = req->ctx;
 
 	if (issue_flags & IO_URING_F_UNLOCKED)
 		return;
 
+	if (ioucmd->metadata_node) {
+		io_put_rsrc_node(ctx, ioucmd->metadata_node);
+		ioucmd->metadata_node = NULL;
+	}
+
 	io_alloc_cache_vec_kasan(&ac->vec);
 	if (ac->vec.nr > IO_VEC_CACHE_SOFT_CAP)
 		io_vec_free(&ac->vec);
 
-	if (io_alloc_cache_put(&req->ctx->cmd_cache, ac)) {
+	if (io_alloc_cache_put(&ctx->cmd_cache, ac)) {
 		ioucmd->sqe = NULL;
 		io_req_async_data_clear(req, REQ_F_NEED_CLEANUP);
 	} else {
 		io_vec_free(&ac->vec);
 	}
@@ -194,10 +200,11 @@ int io_uring_cmd_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 	if (!ac)
 		return -ENOMEM;
 	if (ac->vec.iovec)
 		req->flags |= REQ_F_NEED_CLEANUP;
 	ioucmd->sqe = sqe;
+	ioucmd->metadata_node = NULL;
 	return 0;
 }
 
 /*
  * IORING_SETUP_SQE128 contexts allocate twice the normal SQE size for each
@@ -303,10 +310,31 @@ int io_uring_cmd_import_fixed_vec(struct io_uring_cmd *ioucmd,
 	return io_import_reg_vec(ddir, iter, req, &ac->vec, uvec_segs,
 				 issue_flags);
 }
 EXPORT_SYMBOL_GPL(io_uring_cmd_import_fixed_vec);
 
+int io_uring_cmd_import_fixed_metadata(struct io_uring_cmd *ioucmd,
+				       u16 buf_index, u64 ubuf, size_t len,
+				       int ddir, struct iov_iter *iter,
+				       unsigned int issue_flags)
+{
+	struct io_rsrc_node *buf_node = ioucmd->metadata_node;
+
+	if (!buf_node) {
+		struct io_kiocb *req = cmd_to_io_kiocb(ioucmd);
+
+		buf_node = io_get_buf_node(req, buf_index, issue_flags);
+		if (!buf_node)
+			return -EFAULT;
+
+		req->flags |= REQ_F_NEED_CLEANUP;
+		ioucmd->metadata_node = buf_node;
+	}
+	return io_import_fixed(ddir, iter, buf_node, ubuf, len);
+}
+EXPORT_SYMBOL_GPL(io_uring_cmd_import_fixed_metadata);
+
 void io_uring_cmd_issue_blocking(struct io_uring_cmd *ioucmd)
 {
 	struct io_kiocb *req = cmd_to_io_kiocb(ioucmd);
 
 	io_queue_iowq(req);
-- 
2.55.0

