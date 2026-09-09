Received: from mail-ot1-f98.google.com (mail-ot1-f98.google.com [209.85.210.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82F356E053
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788969570; cv=none; b=uLbMujvpabDruxw3vRNf6ByKenax1zHw3ChxmIHIG2sWlMIMww8HTZLTykX6PtGS6IEDr8Oog4yUns2Lg+1ckVwMfraFqIRDmDUzW8Leq8IfRizSR2aAE443Yj8+Xh+VK4XTq0+yTAJgqRYqeLK6aGG1CzNOhHZBgPxsFQXqO3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788969570; c=relaxed/simple;
	bh=x4R/agt9BWJVrIxWFEFa9NxgnNC2q3t9C5fIuG37CcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NyZ05JjQLr4yw0/3WJ9WSgyqmebOQycpYJP8vZ6XvXrSnz0dcN4zruM0hytA6Wl/siaW/2Sc/fRDUfABUe3hafM2Uu1ArIGlSf3s19wY3ZVbqMXsoJL+7uMU84Gqh8rpVTedoezoDcp3IkcD8cA08cTZdNQHfxTLSuyzTyjbgWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=KKaeVf5j; arc=none smtp.client-ip=209.85.210.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="KKaeVf5j"
Received: by mail-ot1-f98.google.com with SMTP id 46e09a7af769-7eb62dbe747so76429a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1788969567; x=1789574367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BpyMKG/NmuIVEN51AvPLm78UGTP27UIsJPJty8qt2D8=;
        b=KKaeVf5jAHHwDNiB+FHt2LMGQQ2fJqnq9dZe+hayEybKu8rjKHFiIDPycz6iS3tQbv
         cfq7QcCJWi/ybltr+3Z2U4BlD6r5aqmeYQfWVgj6flqgwrWH48n6tN2fE7rdmsHvgtrd
         Togkw7j0CJ5ZxRBVLPNPw7yhSlWjGVg9JoeJ1IiVnkeHJMXg+pht7PrLtbSNLASZyCVb
         zdhQ+nLFJ+KQDgUF51io+RildPYl99BIN32QWnY7PpcO8P2j31vTyuk1J77vuw0Y2NUY
         P/2KQoKE2Kwzs8eSgihu+1k830PcJMYLH7bl5GzU2YXKb0lqmzTi0toHvJt5JKQpfHTq
         WPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788969567; x=1789574367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BpyMKG/NmuIVEN51AvPLm78UGTP27UIsJPJty8qt2D8=;
        b=E8TcpNxvPOrv98t9+3GYItWth3ELQ+TmuD+3mtr6iRYrrV31uEd//QmpuHUbVIga/Q
         eEw2r2VsCNXfcqVXCyc3Ad8FG4609f3RO8jhOJmk2GHyTd7oLf1gbUxNVMwa/7+NPOZY
         tDOSBZ3uulZ/xNbcBQsRy3GyA1YKyGQiSOPdd64vQLsLRkPWwsmOFRad2sgyCE70wqd1
         gwuvGWyJNmdg8JhG4jGKPk+FiwHo7EEQso+M/1Dn/RsZnRTul9Wt+kaTgvteKq4ZpjPY
         SaEmrIgAmM3a1N9PKNlxaId55wfCOpNIAXrdFGEHbX610JKUF703cHPeFsVZAQyEzsHw
         yRzA==
X-Forwarded-Encrypted: i=1; AKwUvBwYJaTc09kKbDZe07HnStlsTEEmfEhrMXtp2qkrOArzQZneWAqAjRZTgA92vwDuDhTvPfbfbe5bTZkdK/o=@vger.kernel.org
X-Gm-Message-State: AFuF++lNDWyEn6nVK4/T3mxivLL0Rd8xPosLxiU82GquLMFer8xtp3FO
	d+DoXTtffnmoGHV7WhBzhOqU50YSFXfkQi302PApExW3vCNtHm6jpqPAdDzuEfyIX3pFGY4q4qx
	L6ODkLAaHSDG6/cUEYQweTBZBSd9H7LFJAAOW
X-Gm-Gg: AYBFou1zhLRqSclg+gm2Ixz1lzilxuLXA4xKBJ+6br7cfhyw1obZF9Tsy3pNAHhNblR
	aVLIGnY0eQ0zoTkFJupRiVnOUBfi6gOmJ/z1fu5W+n0TMtzee8C+FVQFkkiGWuChDE0Vd3ZnYSl
	yWVB09IbjZ36wskPOgw8CF4k43wfcs6WeCpt7R/Zir6yfvxEHDYzZ9mHsm+oVMpMBkox6fEFdDo
	JZ+R4mv9pj2Xm05+ff42mryadZVRLO4L1pixDe9JJRoYEBxSoKfWp7SmK4bvhZf3B9O55K5hdaC
	q3G9w4v9ep7Q3KxMtyFOMlyC5l0l5rQ26AKwedmio9ztWksky4C+vycWZCHV1KRxsmvinCud5SH
	XUwzDjrKmLu067zHdySFiHzg3Ap5/d6w8
X-Received: by 2002:a05:6830:3495:b0:801:b3e8:25ab with SMTP id 46e09a7af769-801b3e8a6c8mr1961931a34.2.1788969567461;
        Wed, 09 Sep 2026 08:59:27 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([208.88.159.129])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-7f9f1b0f661sm2564948a34.0.2026.09.09.08.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 08:59:27 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (bond0.slc5-n17m28-k8s.dev.purestorage.com [IPv6:2620:125:9025:20::a31:41f])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 0CDF7402A9;
	Wed,  9 Sep 2026 09:59:27 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 09997E4026F; Wed,  9 Sep 2026 09:59:27 -0600 (MDT)
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
Subject: [PATCH v3 1/3] io_uring: move req_set_*() to public header
Date: Wed,  9 Sep 2026 09:58:46 -0600
Message-ID: <20260909155848.2069290-2-csander@purestorage.com>
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

In preparation for using req_set_fail(), req_set_res(), and
req_set_res32() in include/linux/io_uring/cmd.h, move them from the
private header io_uring/io_uring.h to include/linux/io_uring.h.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 include/linux/io_uring.h | 32 ++++++++++++++++++++++++++++++++
 io_uring/io_uring.h      | 31 -------------------------------
 2 files changed, 32 insertions(+), 31 deletions(-)

diff --git a/include/linux/io_uring.h b/include/linux/io_uring.h
index d1aa4edfc2a5..505caa99c621 100644
--- a/include/linux/io_uring.h
+++ b/include/linux/io_uring.h
@@ -1,13 +1,45 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 #ifndef _LINUX_IO_URING_H
 #define _LINUX_IO_URING_H
 
+#include <linux/io_uring_types.h>
 #include <linux/sched.h>
 #include <linux/xarray.h>
 #include <uapi/linux/io_uring.h>
 
+static inline void req_set_fail(struct io_kiocb *req)
+{
+	req->flags |= REQ_F_FAIL;
+	if (req->flags & REQ_F_CQE_SKIP) {
+		req->flags &= ~REQ_F_CQE_SKIP;
+		req->flags |= REQ_F_SKIP_LINK_CQES;
+	}
+}
+
+static inline void io_req_set_res(struct io_kiocb *req, s32 res, u32 cflags)
+{
+	req->cqe.res = res;
+	req->cqe.flags = cflags;
+}
+
+static inline u32 ctx_cqe32_flags(struct io_ring_ctx *ctx)
+{
+	if (ctx->flags & IORING_SETUP_CQE_MIXED)
+		return IORING_CQE_F_32;
+	return 0;
+}
+
+static inline void io_req_set_res32(struct io_kiocb *req, s32 res, u32 cflags,
+				    __u64 extra1, __u64 extra2)
+{
+	req->cqe.res = res;
+	req->cqe.flags = cflags | ctx_cqe32_flags(req->ctx);
+	req->big_cqe.extra1 = extra1;
+	req->big_cqe.extra2 = extra2;
+}
+
 #if defined(CONFIG_IO_URING)
 void __io_uring_cancel(bool cancel_all);
 void __io_uring_free(struct task_struct *tsk);
 void io_uring_unreg_ringfd(void);
 const char *io_uring_get_opcode(u8 opcode);
diff --git a/io_uring/io_uring.h b/io_uring/io_uring.h
index 896aab1ed026..109261722ca7 100644
--- a/io_uring/io_uring.h
+++ b/io_uring/io_uring.h
@@ -316,41 +316,10 @@ static __always_inline bool io_fill_cqe_req(struct io_ring_ctx *ctx,
 	if (trace_io_uring_complete_enabled())
 		trace_call__io_uring_complete(req->ctx, req, cqe);
 	return true;
 }
 
-static inline void req_set_fail(struct io_kiocb *req)
-{
-	req->flags |= REQ_F_FAIL;
-	if (req->flags & REQ_F_CQE_SKIP) {
-		req->flags &= ~REQ_F_CQE_SKIP;
-		req->flags |= REQ_F_SKIP_LINK_CQES;
-	}
-}
-
-static inline void io_req_set_res(struct io_kiocb *req, s32 res, u32 cflags)
-{
-	req->cqe.res = res;
-	req->cqe.flags = cflags;
-}
-
-static inline u32 ctx_cqe32_flags(struct io_ring_ctx *ctx)
-{
-	if (ctx->flags & IORING_SETUP_CQE_MIXED)
-		return IORING_CQE_F_32;
-	return 0;
-}
-
-static inline void io_req_set_res32(struct io_kiocb *req, s32 res, u32 cflags,
-				    __u64 extra1, __u64 extra2)
-{
-	req->cqe.res = res;
-	req->cqe.flags = cflags | ctx_cqe32_flags(req->ctx);
-	req->big_cqe.extra1 = extra1;
-	req->big_cqe.extra2 = extra2;
-}
-
 static inline void *io_uring_alloc_async_data(struct io_alloc_cache *cache,
 					      struct io_kiocb *req)
 {
 	if (cache) {
 		req->async_data = io_cache_alloc(cache, GFP_KERNEL);
-- 
2.55.0

