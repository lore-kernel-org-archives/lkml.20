Received: from mail-oo1-f97.google.com (mail-oo1-f97.google.com [209.85.161.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2353D577E26
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788969572; cv=none; b=c18BL3NkIbV5dzt/JJCVQIK3xVPcYw+fCBi6PnjVPUk/Knm33jNwHS8AOvckfBQEyV0beao/29SJ/kcZsvY+uhlO5/G4MtjD8cF5wg8XYijwnp48NGjNaLVSIkLE1qcT2n7QJ3d6oniLKReQJxsHe7/5gQu9JPH5QHnatq0pie4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788969572; c=relaxed/simple;
	bh=m8PHHIvMElAA04zgDUMJs6ZPuE/FVKypUdqvJz4oiy8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fnXHvwaDZNofgMlPItiQXsN4k8gO+9Cly5sINncb1quLfWmSJrdd1ZVjn2BxUu9NCvsn5s6cH21yltpIvxB6TGmhFMWoSuFT4GRnfv0FayHlVaiYh+M621P2UVQzB1xM7dGIwT3temI0htSReNn0dlm2H0ugiognIs3IdWIulb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=dvqarzwV; arc=none smtp.client-ip=209.85.161.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="dvqarzwV"
Received: by mail-oo1-f97.google.com with SMTP id 006d021491bc7-6b6811e8940so32234eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1788969568; x=1789574368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X+pMe6zV5KmHjmCdDkn3PgSMEGRc3mfq+qsXjrF4xPM=;
        b=dvqarzwVym6eOHVDNEKY9ewNfgqudh9asCrWKbQCJBbHMfULjrOc+MQDlQWzCudV/W
         /XloHEJgEDujVoyUn2gfEtNIXLxtYc05O1B3DhqQTarSPCsuLUy1D1bTMEykfvDOnv8q
         oLOZCHGbnHIxwPdVyyB3y5TQBWWPrCNPg2FdMXEtYBEZrSrIrdsLllGkBhoTWtaztuAH
         GIuiwN/Ua0rsfC350TtZ2wYrHosrL03UaxM/l3MvSj+Tu+cu2lnI+Jbcl8kR6h+wKc8/
         dbUAACBugQmKghPROvnh+3DTHqiItItYWEQUGz4UQx6TEcedrREA50S1S/NAs3cLI/Er
         j6vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788969568; x=1789574368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X+pMe6zV5KmHjmCdDkn3PgSMEGRc3mfq+qsXjrF4xPM=;
        b=Fn1KHuvsYuVycMJm8Kuwlj9RGFwaBzxF3WZagPktIQkQvMT0q08fxLqNFdgbC+VfJ4
         aTglNf8iSr7LgOV3eFUvzHRbNlKw/3XBAXG3NQ56hWzUIroqPF9IkSrnXcLWvFNh+pfW
         LiKUWSbf3Gg81EhAd2buUmVmaAHUmZbJ2290HkOcMHSju0gdLwGJNfyU/yzQOYxPpEgf
         l7Kfq3VvfxfYTR0fNXGXqy6sm1eO7M8aymB3h7ZT0hPgtCYSZAV047owh2oRU8lfWZVf
         i6ikq+yX0esKGgcpRsvzBc49zdAmzi+dFdglUERmv0/wQnesPNTqbDFxLyXf9pYN8exj
         DXrw==
X-Forwarded-Encrypted: i=1; AKwUvBxmZKhEkPQaTeew9MEwzhEfEyVLBKcwWFmZRGo9tHZHMw/ldQxMwq0wdN9oO1hIl5yT1hKrvpLJ5T58xjk=@vger.kernel.org
X-Gm-Message-State: AFuF++kGYtwqsG5x376BPlzS/hiVreiuq/jBTShdNg5rehJOg+A9csvh
	xOXHuBdf31XQCw2fiYfSy8d363O0J676dL7t6ZO6c0q/cacBAfEq0XEMDGVjccdFUE4bVC6JLl+
	9dRT+ouTM+099idHU8os2VQUHNQz6/ZXmjIzST4QPqhRBAXfTWbk0
X-Gm-Gg: AYBFou0VlcURG6AByUPiMl9paOYOhf7nQNnrP9gvs8qLjP8DnlNu57WL0tePzTNHC0o
	lsCNdxlJ9J0VoVALMo83kp3C3VD+Ips5s2E9DEgVsoL8LhneCdoGetgk2PA08Jd77s8EHy6F0NV
	md9WgnPsL+pbswVmbJJ2j0oYAQCVfRs9FF1jXuM3lEMha+90spidIDh+AdUdlCNH4Quv6YrLCvL
	TnejDcSNepZHzTCScaYpMtdkf9u9dQu77EgYq8oS2mY1arEUqsAC3IYWwWVwCSJ2a6Mdcg6QhAs
	ssDNQbvdXNIOOQyEM9K5bihX0VmJB93HDqL9pFEsoXEVXOtLNvp0fBQOKdeFFvM2SkOu+bRPa21
	1hIiodANN4vlHbb14iw==
X-Received: by 2002:a05:6830:3c8e:b0:7f4:37a9:6df9 with SMTP id 46e09a7af769-7fb77233fb0mr18560557a34.0.1788969567677;
        Wed, 09 Sep 2026 08:59:27 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-7f9f668f694sm2368876a34.4.2026.09.09.08.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 08:59:27 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (bond0.slc5-n17m28-k8s.dev.purestorage.com [IPv6:2620:125:9025:20::a31:41f])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 3435E402AE;
	Wed,  9 Sep 2026 09:59:27 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 310C2E4026F; Wed,  9 Sep 2026 09:59:27 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Jens Axboe <axboe@kernel.dk>,
	Keith Busch <kbusch@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Joanne Koong <joannelkoong@gmail.com>,
	Ming Lei <tom.leiming@gmail.com>,
	io-uring@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH v3 2/3] io_uring/cmd: split io_uring_cmd_set_res() from io_uring_cmd_done()
Date: Wed,  9 Sep 2026 09:58:47 -0600
Message-ID: <20260909155848.2069290-3-csander@purestorage.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909155848.2069290-1-csander@purestorage.com>
References: <20260909155848.2069290-1-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for setting the io_uring NVMe passthru CQE results from
the blk-mq request completion rather than the task work callback, split
out functions io_uring_cmd_set_res{,32}() from __io_uring_cmd_done().
io_uring_cmd_done{,32}() now call io_uring_cmd_set_res{,32}() and then
__io_uring_cmd_done(). This allows __io_uring_cmd_done() to be made
CQE-size-agnostic, with 3 fewer arguments.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
---
 include/linux/io_uring/cmd.h | 34 ++++++++++++++++++++++++++++------
 io_uring/uring_cmd.c         | 19 +------------------
 2 files changed, 29 insertions(+), 24 deletions(-)

diff --git a/include/linux/io_uring/cmd.h b/include/linux/io_uring/cmd.h
index 331dcbefe72f..2e4368d611ee 100644
--- a/include/linux/io_uring/cmd.h
+++ b/include/linux/io_uring/cmd.h
@@ -1,10 +1,11 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 #ifndef _LINUX_IO_URING_CMD_H
 #define _LINUX_IO_URING_CMD_H
 
 #include <uapi/linux/io_uring.h>
+#include <linux/io_uring.h>
 #include <linux/io_uring_types.h>
 #include <linux/blk-mq.h>
 
 /* only top 8 bits of sqe->uring_cmd_flags for kernel internal use */
 #define IORING_URING_CMD_CANCELABLE	(1U << 30)
@@ -39,10 +40,28 @@ static inline void io_uring_cmd_private_sz_check(size_t cmd_sz)
 #define io_uring_cmd_to_pdu(cmd, pdu_type) ( \
 	io_uring_cmd_private_sz_check(sizeof(pdu_type)), \
 	((pdu_type *)&(cmd)->pdu) \
 )
 
+static inline void io_uring_cmd_set_res(struct io_uring_cmd *cmd, s32 ret)
+{
+	struct io_kiocb *req = cmd_to_io_kiocb(cmd);
+
+	if (ret < 0)
+		req_set_fail(req);
+	io_req_set_res(req, ret, 0);
+}
+
+static inline void io_uring_cmd_set_res32(struct io_uring_cmd *cmd, s32 ret, u64 res2)
+{
+	struct io_kiocb *req = cmd_to_io_kiocb(cmd);
+
+	if (ret < 0)
+		req_set_fail(req);
+	io_req_set_res32(req, ret, 0, res2, 0);
+}
+
 #if defined(CONFIG_IO_URING)
 int io_uring_cmd_import_fixed(u64 ubuf, unsigned long len, int rw,
 			      struct iov_iter *iter,
 			      struct io_uring_cmd *ioucmd,
 			      unsigned int issue_flags);
@@ -54,15 +73,16 @@ int io_uring_cmd_import_fixed_vec(struct io_uring_cmd *ioucmd,
 
 /*
  * Completes the request, i.e. posts an io_uring CQE and deallocates @ioucmd
  * and the corresponding io_uring request.
  *
+ * io_uring_cmd_set_res()/io_uring_cmd_set_res32() must be called first.
+ *
  * Note: the caller should never hard code @issue_flags and is only allowed
  * to pass the mask provided by the core io_uring code.
  */
-void __io_uring_cmd_done(struct io_uring_cmd *cmd, s32 ret, u64 res2,
-			 unsigned issue_flags, bool is_cqe32);
+void __io_uring_cmd_done(struct io_uring_cmd *, unsigned issue_flags);
 
 void __io_uring_cmd_do_in_task(struct io_uring_cmd *ioucmd,
 			    io_req_tw_func_t task_work_cb,
 			    unsigned flags);
 
@@ -105,12 +125,12 @@ static inline int io_uring_cmd_import_fixed_vec(struct io_uring_cmd *ioucmd,
 						int ddir, struct iov_iter *iter,
 						unsigned issue_flags)
 {
 	return -EOPNOTSUPP;
 }
-static inline void __io_uring_cmd_done(struct io_uring_cmd *cmd, s32 ret,
-		u64 ret2, unsigned issue_flags, bool is_cqe32)
+static inline void __io_uring_cmd_done(struct io_uring_cmd *cmd,
+				       unsigned issue_flags)
 {
 }
 static inline void __io_uring_cmd_do_in_task(struct io_uring_cmd *ioucmd,
 			    io_req_tw_func_t task_work_cb, unsigned flags)
 {
@@ -171,17 +191,19 @@ static inline void *io_uring_cmd_ctx_handle(struct io_uring_cmd *cmd)
 }
 
 static inline void io_uring_cmd_done(struct io_uring_cmd *ioucmd, s32 ret,
 				     unsigned issue_flags)
 {
-	return __io_uring_cmd_done(ioucmd, ret, 0, issue_flags, false);
+	io_uring_cmd_set_res(ioucmd, ret);
+	__io_uring_cmd_done(ioucmd, issue_flags);
 }
 
 static inline void io_uring_cmd_done32(struct io_uring_cmd *ioucmd, s32 ret,
 				       u64 res2, unsigned issue_flags)
 {
-	return __io_uring_cmd_done(ioucmd, ret, res2, issue_flags, true);
+	io_uring_cmd_set_res32(ioucmd, ret, res2);
+	__io_uring_cmd_done(ioucmd, issue_flags);
 }
 
 int io_buffer_register_bvec(struct io_uring_cmd *cmd, struct request *rq,
 			    void (*release)(void *), unsigned int index,
 			    unsigned int issue_flags);
diff --git a/io_uring/uring_cmd.c b/io_uring/uring_cmd.c
index 726a659f38c3..3d5d8b5f4ebb 100644
--- a/io_uring/uring_cmd.c
+++ b/io_uring/uring_cmd.c
@@ -136,40 +136,23 @@ void __io_uring_cmd_do_in_task(struct io_uring_cmd *ioucmd,
 	req->io_task_work.func = task_work_cb;
 	__io_req_task_work_add(req, flags);
 }
 EXPORT_SYMBOL_GPL(__io_uring_cmd_do_in_task);
 
-static inline void io_req_set_cqe32_extra(struct io_kiocb *req,
-					  u64 extra1, u64 extra2)
-{
-	req->big_cqe.extra1 = extra1;
-	req->big_cqe.extra2 = extra2;
-}
-
 /*
  * Called by consumers of io_uring_cmd, if they originally returned
  * -EIOCBQUEUED upon receiving the command.
  */
-void __io_uring_cmd_done(struct io_uring_cmd *ioucmd, s32 ret, u64 res2,
-		       unsigned issue_flags, bool is_cqe32)
+void __io_uring_cmd_done(struct io_uring_cmd *ioucmd, unsigned issue_flags)
 {
 	struct io_kiocb *req = cmd_to_io_kiocb(ioucmd);
 
 	if (WARN_ON_ONCE(req->flags & REQ_F_APOLL_MULTISHOT))
 		return;
 
 	io_uring_cmd_del_cancelable(ioucmd, issue_flags);
 
-	if (ret < 0)
-		req_set_fail(req);
-
-	io_req_set_res(req, ret, 0);
-	if (is_cqe32) {
-		if (req->ctx->flags & IORING_SETUP_CQE_MIXED)
-			req->cqe.flags |= IORING_CQE_F_32;
-		io_req_set_cqe32_extra(req, res2, 0);
-	}
 	io_req_uring_cleanup(req, issue_flags);
 	if (req->flags & REQ_F_IOPOLL) {
 		/* order with io_do_iopoll() checking ->iopoll_completed */
 		smp_store_release(&req->iopoll_completed, 1);
 	} else if (issue_flags & IO_URING_F_COMPLETE_DEFER) {
-- 
2.55.0

