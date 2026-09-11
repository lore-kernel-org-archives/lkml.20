Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EFC48C3EF
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141329; cv=none; b=PSG2hPOBkvg8i6P4kWM/T9wWkGMAdh8A2JegQTbVv+pxEAaBgv4j67FXUaTYM1G5YuwAv4nDBIPuy37D+L4yU7gfbVI7PX5jl4ennrvkCUBBY6pQ6Wxd+yYtMTw2gxe46+5mRFnDLRYLiyy2f0UlxxI/jwuIBsELuKw57zNFDog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141329; c=relaxed/simple;
	bh=rrWhPwLXUMHPMn9y2nXl5b0RAfyzWV0Gp95H7S6fUlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OTWUMsobaTX+GsfbDUR2jQjGCwadmuP3W2GNE2Ix3MqEwYQD0JQ23gDVDc86PEpsfmaZ0SASrvK2ChOj8d1MmdYZo0c6YriMd4BEI897xUwNZdKf0c6wXjKUET9TPU09PGqLSm9+eQz1wcNX4UHnXUoiN8aOEWrVWZpTnimra4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=AUg+VxdR; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="AUg+VxdR"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466cc9b4b63so120344fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141325; x=1789746125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rIQRpDFpvkA6v5lh/5UPtLNtecnKXIQ2k9kxGqhZIEM=;
        b=AUg+VxdRZ5Hk5lqCCpEItfNbMJEzk2c033f4UtKsH0LxJoQgZ3drmpiKGBYTuIDvUY
         y+HI+lhlKRqjF63pFHC4xbD10fUb2JmsGC36TYjCy25eQuF8i5UFM4S1FzB7ARR9wVKf
         bgqoU/bF6ouoEX9gNCoc7rrMxHGCdRmnQJAnFtpZwq5wqx7Z7B7xnyn977q3rPLWl9cM
         70QDGB0M4AK9RXaDTT7AY4lmc0kN3r0Nj7JACMitn7ZkJE53RGbmme6e5wISoBBxIxLx
         o+fu/VoOzdcQG+aFbyW1dZ3AHWwu+OsfF7dRkQICCLvCSD2guOwSyq5hf20Dr1G/twk1
         zptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141325; x=1789746125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rIQRpDFpvkA6v5lh/5UPtLNtecnKXIQ2k9kxGqhZIEM=;
        b=kB+soIzo+mgFl7J7wm6OHxe3tHfcB83CXlTtNKAsAhA4xRRxUQAreBn2Op2zEj5GYR
         /QTxL1hIJj70FEUuJvWg9pHFhmx/sAcBQDy21IsUikhVba1UPu7T4IiAFa2aJrtxZVr4
         aOc3mZashEia/FVC1HVcnv0doFbxjptbKO5WUe+6x23BAcu+xY6TWXR/5DKtK8fKiHN5
         Zdf/gWv0ljwDiR8SUv+rMLhLKEMbY8QCL56Nr4iS5yJQ/raXeGZSdyVWafYhNMJa8kOf
         X8mo6RlDlXBUvrvnb0ERHkMtXyT6c8uGOteBIrDj2Lwqm5LfkkVaGiJrreLa4gmTiS81
         br/A==
X-Forwarded-Encrypted: i=1; AKwUvBxJ8X4qb7hUa0VSzVELMSaIYKExU9e2AW7KN/wTQitOkMt8pnLShXgbkCqIWtCR48CLphdOnSNh1Hv3KhY=@vger.kernel.org
X-Gm-Message-State: AFuF++nwUeQNz1y7diX3Olhf/W7pfHttnZpPuPpSQaiioev4ZnvTCwz4
	B1IIIWamw6CgSvuObU7BM22I+pQN42+TL+3soIRW3ov9K4VLDJUS2EfOx0E17tZjvcM=
X-Gm-Gg: AYBFou0TaDSe5y+/RmVx/d/ntgU30jZKLYLI33n+5/MB7Iz3P9kc9cszaEYKNdS+I2C
	nNc1qnso++A2vt1Fry/F7AhlWY7Ta29VT9erqj5rq4dVNz4eCjFUuwDbJJ96Zlxx24UTPRm5Izw
	lh4g/7Cf8ECsyk/qvZCKGtvn785h0HOvKZuFdzbJ79jt3dFeZ2g7RzYEdiH3gan1kIKbo/93QrW
	ux6lp/XuLcRi9he+p1ZDxKEr7J23A3ffR7KgvrR0Wu8fgCl45UvtUAPIIDD2dE28dxL0X35kCnX
	8amTH2jgoBCmc1kWVGQ2Q2irxaQErCfkHSvSaY4zzQk23Mr/Q/kDdExLz37xqErx7D8vreD+9Tx
	1uIQi2ww8ZGHeDGJ2uDSI9Gr8pgOA8uyAwwRJZZYVNXrLqnxxPxJ8BIYVAvSBv8Kbfw/gfsrz3O
	PM0dIfHUwRDzJaBTA5tH7jvplVVP1b1hzY2HCNemo4LcZQL22Cr/lOwBNKzJmIttQ0LTOhgXuul
	990DA3EbUx8LiShXXG9LUHx5jfMTc+UoL4aIc/WaB8=
X-Received: by 2002:a05:6820:190a:b0:6b5:ec3f:4985 with SMTP id 006d021491bc7-6c0a99f860cmr2369093eaf.32.1789141324900;
        Fri, 11 Sep 2026 08:42:04 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c09690af1dsm2802199eaf.1.2026.09.11.08.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:42:04 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 07/15] io_uring: add uring_lock section depth tracking and blockable opdef flag
Date: Fri, 11 Sep 2026 09:40:57 -0600
Message-ID: <20260911154148.644489-8-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911154148.644489-1-axboe@kernel.dk>
References: <20260911154148.644489-1-axboe@kernel.dk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prep patch for issuing requests inline in blocking mode and catching the
sleep when it happens, rather than punting to io-wq upfront because an
operation may block.

If a request blocks inline, uring_lock must be dropped on behalf of the
sleeping task, which is only safe outside the sections that rely on the
lock being held. Track those with a depth counter in
io_ring_submit_lock() and io_ring_submit_unlock().

Add a "blockable" flag to io_issue_def for opcodes whose issue path can
cope with blocking inline: read/write, the forced async fs ops, open,
close and splice/tee. uring_cmd is excluded for now, drivers may bind
state to the submitting task.

No functional changes in this patch.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 include/linux/io_uring_types.h |  5 +++++
 io_uring/io_uring.h            |  3 +++
 io_uring/opdef.c               | 29 +++++++++++++++++++++++++++++
 io_uring/opdef.h               |  2 ++
 4 files changed, 39 insertions(+)

diff --git a/include/linux/io_uring_types.h b/include/linux/io_uring_types.h
index 4af3d579ead6..50a4a0ad222f 100644
--- a/include/linux/io_uring_types.h
+++ b/include/linux/io_uring_types.h
@@ -352,6 +352,11 @@ struct io_ring_ctx {
 	/* submission data */
 	struct {
 		struct mutex		uring_lock;
+		/*
+		 * io_ring_submit_lock() nesting depth, non-zero means the
+		 * issue path relies on the lock being held.
+		 */
+		unsigned int		submit_lock_depth;
 
 		/*
 		 * Ring buffer of indices into array of io_uring_sqe, which is
diff --git a/io_uring/io_uring.h b/io_uring/io_uring.h
index 896aab1ed026..870bb4dcc415 100644
--- a/io_uring/io_uring.h
+++ b/io_uring/io_uring.h
@@ -393,6 +393,8 @@ static inline void io_ring_submit_unlock(struct io_ring_ctx *ctx,
 					 unsigned issue_flags)
 {
 	lockdep_assert_held(&ctx->uring_lock);
+	lockdep_assert(ctx->submit_lock_depth > 0);
+	ctx->submit_lock_depth--;
 	if (unlikely(issue_flags & IO_URING_F_UNLOCKED))
 		mutex_unlock(&ctx->uring_lock);
 }
@@ -409,6 +411,7 @@ static inline void io_ring_submit_lock(struct io_ring_ctx *ctx,
 	if (unlikely(issue_flags & IO_URING_F_UNLOCKED))
 		mutex_lock(&ctx->uring_lock);
 	lockdep_assert_held(&ctx->uring_lock);
+	ctx->submit_lock_depth++;
 }
 
 static inline void io_commit_cqring(struct io_ring_ctx *ctx)
diff --git a/io_uring/opdef.c b/io_uring/opdef.c
index cf3aa2242cd7..fa07a2b94536 100644
--- a/io_uring/opdef.c
+++ b/io_uring/opdef.c
@@ -69,6 +69,7 @@ const struct io_issue_def io_issue_defs[] = {
 		.iopoll			= 1,
 		.vectored		= 1,
 		.async_size		= sizeof(struct io_async_rw),
+		.blockable		= 1,
 		.prep			= io_prep_readv,
 		.issue			= io_read,
 	},
@@ -83,12 +84,14 @@ const struct io_issue_def io_issue_defs[] = {
 		.iopoll			= 1,
 		.vectored		= 1,
 		.async_size		= sizeof(struct io_async_rw),
+		.blockable		= 1,
 		.prep			= io_prep_writev,
 		.issue			= io_write,
 	},
 	[IORING_OP_FSYNC] = {
 		.needs_file		= 1,
 		.audit_skip		= 1,
+		.blockable		= 1,
 		.prep			= io_fsync_prep,
 		.issue			= io_fsync,
 	},
@@ -101,6 +104,7 @@ const struct io_issue_def io_issue_defs[] = {
 		.ioprio			= 1,
 		.iopoll			= 1,
 		.async_size		= sizeof(struct io_async_rw),
+		.blockable		= 1,
 		.prep			= io_prep_read_fixed,
 		.issue			= io_read_fixed,
 	},
@@ -114,6 +118,7 @@ const struct io_issue_def io_issue_defs[] = {
 		.ioprio			= 1,
 		.iopoll			= 1,
 		.async_size		= sizeof(struct io_async_rw),
+		.blockable		= 1,
 		.prep			= io_prep_write_fixed,
 		.issue			= io_write_fixed,
 	},
@@ -132,6 +137,7 @@ const struct io_issue_def io_issue_defs[] = {
 	[IORING_OP_SYNC_FILE_RANGE] = {
 		.needs_file		= 1,
 		.audit_skip		= 1,
+		.blockable		= 1,
 		.prep			= io_sfr_prep,
 		.issue			= io_sync_file_range,
 	},
@@ -215,16 +221,19 @@ const struct io_issue_def io_issue_defs[] = {
 	[IORING_OP_FALLOCATE] = {
 		.needs_file		= 1,
 		.hash_reg_file          = 1,
+		.blockable		= 1,
 		.prep			= io_fallocate_prep,
 		.issue			= io_fallocate,
 	},
 	[IORING_OP_OPENAT] = {
 		.filter_pdu_size	= sizeof_field(struct io_uring_bpf_ctx, open),
+		.blockable		= 1,
 		.prep			= io_openat_prep,
 		.issue			= io_openat,
 		.filter_populate	= io_openat_bpf_populate,
 	},
 	[IORING_OP_CLOSE] = {
+		.blockable		= 1,
 		.prep			= io_close_prep,
 		.issue			= io_close,
 	},
@@ -236,6 +245,7 @@ const struct io_issue_def io_issue_defs[] = {
 	},
 	[IORING_OP_STATX] = {
 		.audit_skip		= 1,
+		.blockable		= 1,
 		.prep			= io_statx_prep,
 		.issue			= io_statx,
 	},
@@ -249,6 +259,7 @@ const struct io_issue_def io_issue_defs[] = {
 		.ioprio			= 1,
 		.iopoll			= 1,
 		.async_size		= sizeof(struct io_async_rw),
+		.blockable		= 1,
 		.prep			= io_prep_read,
 		.issue			= io_read,
 	},
@@ -262,17 +273,20 @@ const struct io_issue_def io_issue_defs[] = {
 		.ioprio			= 1,
 		.iopoll			= 1,
 		.async_size		= sizeof(struct io_async_rw),
+		.blockable		= 1,
 		.prep			= io_prep_write,
 		.issue			= io_write,
 	},
 	[IORING_OP_FADVISE] = {
 		.needs_file		= 1,
 		.audit_skip		= 1,
+		.blockable		= 1,
 		.prep			= io_fadvise_prep,
 		.issue			= io_fadvise,
 	},
 	[IORING_OP_MADVISE] = {
 		.audit_skip		= 1,
+		.blockable		= 1,
 		.prep			= io_madvise_prep,
 		.issue			= io_madvise,
 	},
@@ -308,6 +322,7 @@ const struct io_issue_def io_issue_defs[] = {
 	},
 	[IORING_OP_OPENAT2] = {
 		.filter_pdu_size	= sizeof_field(struct io_uring_bpf_ctx, open),
+		.blockable		= 1,
 		.prep			= io_openat2_prep,
 		.issue			= io_openat2,
 		.filter_populate	= io_openat_bpf_populate,
@@ -327,6 +342,7 @@ const struct io_issue_def io_issue_defs[] = {
 		.hash_reg_file		= 1,
 		.unbound_nonreg_file	= 1,
 		.audit_skip		= 1,
+		.blockable		= 1,
 		.prep			= io_splice_prep,
 		.issue			= io_splice,
 	},
@@ -347,6 +363,7 @@ const struct io_issue_def io_issue_defs[] = {
 		.hash_reg_file		= 1,
 		.unbound_nonreg_file	= 1,
 		.audit_skip		= 1,
+		.blockable		= 1,
 		.prep			= io_tee_prep,
 		.issue			= io_tee,
 	},
@@ -360,22 +377,27 @@ const struct io_issue_def io_issue_defs[] = {
 #endif
 	},
 	[IORING_OP_RENAMEAT] = {
+		.blockable		= 1,
 		.prep			= io_renameat_prep,
 		.issue			= io_renameat,
 	},
 	[IORING_OP_UNLINKAT] = {
+		.blockable		= 1,
 		.prep			= io_unlinkat_prep,
 		.issue			= io_unlinkat,
 	},
 	[IORING_OP_MKDIRAT] = {
+		.blockable		= 1,
 		.prep			= io_mkdirat_prep,
 		.issue			= io_mkdirat,
 	},
 	[IORING_OP_SYMLINKAT] = {
+		.blockable		= 1,
 		.prep			= io_symlinkat_prep,
 		.issue			= io_symlinkat,
 	},
 	[IORING_OP_LINKAT] = {
+		.blockable		= 1,
 		.prep			= io_linkat_prep,
 		.issue			= io_linkat,
 	},
@@ -387,19 +409,23 @@ const struct io_issue_def io_issue_defs[] = {
 	},
 	[IORING_OP_FSETXATTR] = {
 		.needs_file = 1,
+		.blockable		= 1,
 		.prep			= io_fsetxattr_prep,
 		.issue			= io_fsetxattr,
 	},
 	[IORING_OP_SETXATTR] = {
+		.blockable		= 1,
 		.prep			= io_setxattr_prep,
 		.issue			= io_setxattr,
 	},
 	[IORING_OP_FGETXATTR] = {
 		.needs_file = 1,
+		.blockable		= 1,
 		.prep			= io_fgetxattr_prep,
 		.issue			= io_fgetxattr,
 	},
 	[IORING_OP_GETXATTR] = {
+		.blockable		= 1,
 		.prep			= io_getxattr_prep,
 		.issue			= io_getxattr,
 	},
@@ -497,6 +523,7 @@ const struct io_issue_def io_issue_defs[] = {
 	[IORING_OP_FTRUNCATE] = {
 		.needs_file		= 1,
 		.hash_reg_file		= 1,
+		.blockable		= 1,
 		.prep			= io_ftruncate_prep,
 		.issue			= io_ftruncate,
 	},
@@ -553,6 +580,7 @@ const struct io_issue_def io_issue_defs[] = {
 		.iopoll			= 1,
 		.vectored		= 1,
 		.async_size		= sizeof(struct io_async_rw),
+		.blockable		= 1,
 		.prep			= io_prep_readv_fixed,
 		.issue			= io_read,
 	},
@@ -567,6 +595,7 @@ const struct io_issue_def io_issue_defs[] = {
 		.iopoll			= 1,
 		.vectored		= 1,
 		.async_size		= sizeof(struct io_async_rw),
+		.blockable		= 1,
 		.prep			= io_prep_writev_fixed,
 		.issue			= io_write,
 	},
diff --git a/io_uring/opdef.h b/io_uring/opdef.h
index 667f981e63b0..45c2f77cf782 100644
--- a/io_uring/opdef.h
+++ b/io_uring/opdef.h
@@ -29,6 +29,8 @@ struct io_issue_def {
 	unsigned		vectored : 1;
 	/* set to 1 if this opcode uses 128b sqes in a mixed sq */
 	unsigned		is_128 : 1;
+	/* issue path is safe to run inline in blocking mode */
+	unsigned		blockable : 1;
 
 	/* size of async data needed, if any */
 	unsigned short		async_size;
-- 
2.55.0

