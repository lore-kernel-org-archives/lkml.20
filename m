Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690A84C10D1
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789722097; cv=none; b=djKFmCrH0cPdRGP4Db7eolOlQ3kd4dphNXo7P3MNxD6/hP5WpAbiY45q5sNQdo1LZ4ExbmE1ntUxK8vh3rC/JEZ63I6iiLX5EZCqUTQonYeIAbMDpJBlAgQ8vP8WGqmZvP/MtdqejCxyJi5zYBNxgxBlmylYl/DXMbHUUdV7X2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789722097; c=relaxed/simple;
	bh=pGHwGOEYsCw+OGodsstX6r4iAlcNRjIs2c1MMPMN/d0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=djI1qRzClLv5ul9bIiOc2mHLNHVeCg/b2x4Xl/654uvx8beEclVx+ocaN32wUPtBroVXVh3XsCdRER7Va9vx+7WGyP4EKDB0l85xT/Wry3UVf1oBBHpUzd/bVKaZYfP09rmdfuQx11n7QvSYTz67LmlHD8wO60CE41SlhR2fMwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nZBxBtSF; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nZBxBtSF"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc433d52421so234060a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789722086; x=1790326886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZFQT/IvY7xA2uKVNTdweNHiwRFsZK0kZIx7+X8cb4AY=;
        b=nZBxBtSFpPB19dUysdqiuKMxUMn3D2zM920478MMLJSvco4Znaqhh+zLWkLjZ+m/OE
         MY2Ro6Al35keiY3FWHxXgT08g3M3hZceCicpnVAC7/sx93XzvYeJYra7OMRLIZoHWCiZ
         FReH8oPakDiOGxPs7hfHFGDU3medWeAUA/UJI27S7qGH8CDR13vM9RJpnkO7ytDL5EYp
         d6HUDNNxMN1u8qvULdfZbENSS87JAZEl461V1GOVK4Sxehu21BrHc5yWxQSCAYuzoB9O
         a5aJYJXPiaPuktqSWzAoo3P2V1O990nSA43vQ8q86TGqWH1BbLThAmMo6yLEBds37WB6
         uJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789722086; x=1790326886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZFQT/IvY7xA2uKVNTdweNHiwRFsZK0kZIx7+X8cb4AY=;
        b=taKQHQloVirxLmBFpUA2xmIE4I3nbChAeE3RPtd5fchG7KXGFrVanYGSjHxK5ad1pJ
         ectrYlcsYtxAKdeTBWiPQxX3pN4bKSryjgK542CrmrdfQA/WP/uLD/e/4OpHPM3+mSko
         uiD7BtuFvygOE09v+6AwqFoFGbnZcajbaMdvWqSbUcWZagkZ+0+j+K6afSe79D3NcjA2
         tgWGn+HuSGNL60MILdMtFYraNFdeb7rvGaJ12MzvPBvQZKHXkUwSTcdYDHYnRWLeOssu
         jvClD9cPIEYnN4HM1q9alzskzXR5XlRQcxenxSiOQpA9wSHEsWgEhCFbyiwkeIK3IVvl
         YXGw==
X-Forwarded-Encrypted: i=1; AKwUvByxK6geeL3z6LK4Yk9YRVLnFHa9Fq76UZJHq9CeLAqVxigK5ux5ie3yoGWyB/fjaeS6czAfMmqbjF+Xczs=@vger.kernel.org
X-Gm-Message-State: AFuF++lEmntui+aL6Cj2nSyS1DSaqgd4IoWI35MW4/kBKxtZSMHXafi+
	ZcHdEEi8+k2GxuI0kDCLoXLyPy+01PHYKfCRjs/uRPnXEYzDQzGikN6b
X-Gm-Gg: AYBFou0RveHli2gGa4fm3KS7GUokoU3fM3dWf4P1XhZY3ITpfJfhqAgU/ZpKkHrtQuF
	Q4NEgUyTBIiHO89uzmyQ+qhwJ6om//n1910xq1x0BYwVTUWR3VyxfJARvuu/iji6KZpQjAR9hRS
	CYQNQls0Lzk3mJaJyNYR8wG97CcTS5TANR6/uTo7C4TpAgiwGwmv7d8wK8Itkb1sCNR1X2/1qYL
	5tYlaG2XjCuwb492NFZYANFiD7LwIIrdt5V7NTizQJfEpEeMgzqy6opNKkKipVwmLOTNIdj+7Ma
	SDFsu3ondHtMwRmKAi4Vs6WJQQok6BIPKwzTXj4l/tu13Cl/PNhZ+DLn3usr6u81DfdVuRbdd9a
	cPqVVyAKTqO1I9Xvsvj8nFGkoF/cBgXmJra/g/Pa2l3DGGTQBO0adYaexsWbUhXw0yKadczPYEh
	bFkFUmNdV4XMDc5R1SyOsN0LpXUb3oUvnt+dptS9OryTm+KCAVp4VI3ohjr3butcDcUNDBYFzmJ
	Y7iWQlfAmC4ufwkvugbxGznh1t6uBTErC3RF0E6bW2E3dchOcpuiGX0s3PVMVtdiIefKDruP2Jm
	4AKXzTFZgDjvJ+qUeM10sp6Bzsid/3byXCyvTiWReXZ4WMk4K9bQQ8wFocp1icx02EWolLNOpP/
	YfEPirQ==
X-Received: by 2002:a05:6a20:6f03:b0:3d1:c0e2:936b with SMTP id adf61e73a8af0-3dd8c33618fmr4197125637.7.1789722085968;
        Fri, 18 Sep 2026 02:01:25 -0700 (PDT)
Received: from cs-1047136853211-default.asia-southeast1-a.c.t54fbfa9bf0658dcb-tp.internal (96.177.21.34.bc.googleusercontent.com. [34.21.177.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-875dc8fa40fsm504491b3a.15.2026.09.18.02.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:01:25 -0700 (PDT)
From: Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	Christian Brauner <brauner@kernel.org>,
	Gabriel Krisman Bertazi <krisman@suse.de>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	io-uring@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
Subject: [PATCH v4 3/3] io_uring: add fremovexattr and flistxattr support
Date: Fri, 18 Sep 2026 09:00:10 +0000
Message-ID: <20260918090010.1688-4-aditya.ansh182@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918090010.1688-1-aditya.ansh182@gmail.com>
References: <20260918090010.1688-1-aditya.ansh182@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for IORING_OP_FREMOVEXATTR and IORING_OP_FLISTXATTR. This
enables xattr listing and removal operations to be executed in an
asynchronous fashion.

Signed-off-by: Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
---
 include/uapi/linux/io_uring.h       |  2 +
 io_uring/opdef.c                    | 18 +++++++
 io_uring/xattr.c                    | 83 +++++++++++++++++++++++++++++
 io_uring/xattr.h                    |  6 +++
 tools/include/uapi/linux/io_uring.h |  2 +
 5 files changed, 111 insertions(+)

diff --git a/include/uapi/linux/io_uring.h b/include/uapi/linux/io_uring.h
index 1f300f6b85d7..45de6dd6e3c4 100644
--- a/include/uapi/linux/io_uring.h
+++ b/include/uapi/linux/io_uring.h
@@ -318,6 +318,8 @@ enum io_uring_op {
 	IORING_OP_PIPE,
 	IORING_OP_NOP128,
 	IORING_OP_URING_CMD128,
+	IORING_OP_FREMOVEXATTR,
+	IORING_OP_FLISTXATTR,
 
 	/* this goes last, obviously */
 	IORING_OP_LAST,
diff --git a/io_uring/opdef.c b/io_uring/opdef.c
index cf3aa2242cd7..14a511f7a9df 100644
--- a/io_uring/opdef.c
+++ b/io_uring/opdef.c
@@ -591,6 +591,16 @@ const struct io_issue_def io_issue_defs[] = {
 		.prep			= io_uring_cmd_prep,
 		.issue			= io_uring_cmd,
 	},
+	[IORING_OP_FREMOVEXATTR] = {
+		.needs_file		= 1,
+		.prep			= io_fremovexattr_prep,
+		.issue			= io_fremovexattr,
+	},
+	[IORING_OP_FLISTXATTR] = {
+		.needs_file		= 1,
+		.prep			= io_flistxattr_prep,
+		.issue			= io_flistxattr,
+	},
 };
 
 const struct io_cold_def io_cold_defs[] = {
@@ -849,6 +859,14 @@ const struct io_cold_def io_cold_defs[] = {
 		.sqe_copy		= io_uring_cmd_sqe_copy,
 		.cleanup		= io_uring_cmd_cleanup,
 	},
+	[IORING_OP_FREMOVEXATTR] = {
+		.name			= "FREMOVEXATTR",
+		.cleanup		= io_xattr_cleanup,
+	},
+	[IORING_OP_FLISTXATTR] = {
+		.name			= "FLISTXATTR",
+		.cleanup		= io_xattr_cleanup,
+	},
 };
 
 const char *io_uring_get_opcode(u8 opcode)
diff --git a/io_uring/xattr.c b/io_uring/xattr.c
index 5303df3f247f..f2d6b1904058 100644
--- a/io_uring/xattr.c
+++ b/io_uring/xattr.c
@@ -195,3 +195,86 @@ int io_setxattr(struct io_kiocb *req, unsigned int issue_flags)
 	io_xattr_finish(req, ret);
 	return IOU_COMPLETE;
 }
+
+int io_fremovexattr_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
+{
+	struct io_xattr *ix = io_kiocb_to_cmd(req, struct io_xattr);
+	const char __user *name;
+	int ret;
+
+	INIT_DELAYED_FILENAME(&ix->filename);
+	ix->ctx.kname = NULL;
+	ix->ctx.kvalue = NULL;
+
+	if (READ_ONCE(sqe->off) || READ_ONCE(sqe->addr2) || READ_ONCE(sqe->len) ||
+	    READ_ONCE(sqe->xattr_flags) || READ_ONCE(sqe->buf_index) ||
+	    READ_ONCE(sqe->splice_fd_in) || READ_ONCE(sqe->addr3) ||
+	    READ_ONCE(sqe->__pad2[0]))
+		return -EINVAL;
+
+	name = u64_to_user_ptr(READ_ONCE(sqe->addr));
+
+	ix->ctx.kname = kmalloc_obj(*ix->ctx.kname);
+	if (!ix->ctx.kname)
+		return -ENOMEM;
+
+	ret = import_xattr_name(ix->ctx.kname, name);
+	if (ret) {
+		kfree(ix->ctx.kname);
+		ix->ctx.kname = NULL;
+		return ret;
+	}
+
+	req->flags |= REQ_F_NEED_CLEANUP;
+	req->flags |= REQ_F_FORCE_ASYNC;
+	return 0;
+}
+
+int io_fremovexattr(struct io_kiocb *req, unsigned int issue_flags)
+{
+	struct io_xattr *ix = io_kiocb_to_cmd(req, struct io_xattr);
+	int ret;
+
+	WARN_ON_ONCE(issue_flags & IO_URING_F_NONBLOCK);
+
+	ret = file_removexattr(req->file, ix->ctx.kname);
+	io_xattr_finish(req, ret);
+	return IOU_COMPLETE;
+}
+
+int io_flistxattr_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
+{
+	struct io_xattr *ix = io_kiocb_to_cmd(req, struct io_xattr);
+
+	INIT_DELAYED_FILENAME(&ix->filename);
+	ix->ctx.kname = NULL;
+	ix->ctx.kvalue = NULL;
+
+	if (READ_ONCE(sqe->addr) || READ_ONCE(sqe->off) ||
+	    READ_ONCE(sqe->buf_index) || READ_ONCE(sqe->splice_fd_in) ||
+	    READ_ONCE(sqe->addr3) || READ_ONCE(sqe->__pad2[0]))
+		return -EINVAL;
+
+	ix->ctx.value = u64_to_user_ptr(READ_ONCE(sqe->addr2));
+	ix->ctx.size = READ_ONCE(sqe->len);
+	ix->ctx.flags = READ_ONCE(sqe->xattr_flags);
+
+	if (ix->ctx.flags)
+		return -EINVAL;
+
+	req->flags |= REQ_F_NEED_CLEANUP;
+	req->flags |= REQ_F_FORCE_ASYNC;
+	return 0;
+}
+
+int io_flistxattr(struct io_kiocb *req, unsigned int issue_flags)
+{
+	struct io_xattr *ix = io_kiocb_to_cmd(req, struct io_xattr);
+	int ret;
+
+	WARN_ON_ONCE(issue_flags & IO_URING_F_NONBLOCK);
+
+	ret = file_listxattr(req->file, ix->ctx.value, ix->ctx.size);
+	io_xattr_finish(req, ret);
+	return IOU_COMPLETE;
+}
diff --git a/io_uring/xattr.h b/io_uring/xattr.h
index 9b459d2ae90c..d2487b49a5d2 100644
--- a/io_uring/xattr.h
+++ b/io_uring/xattr.h
@@ -13,3 +13,9 @@ int io_fgetxattr(struct io_kiocb *req, unsigned int issue_flags);
 
 int io_getxattr_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe);
 int io_getxattr(struct io_kiocb *req, unsigned int issue_flags);
+
+int io_fremovexattr_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe);
+int io_fremovexattr(struct io_kiocb *req, unsigned int issue_flags);
+
+int io_flistxattr_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe);
+int io_flistxattr(struct io_kiocb *req, unsigned int issue_flags);
diff --git a/tools/include/uapi/linux/io_uring.h b/tools/include/uapi/linux/io_uring.h
index 1f300f6b85d7..45de6dd6e3c4 100644
--- a/tools/include/uapi/linux/io_uring.h
+++ b/tools/include/uapi/linux/io_uring.h
@@ -318,6 +318,8 @@ enum io_uring_op {
 	IORING_OP_PIPE,
 	IORING_OP_NOP128,
 	IORING_OP_URING_CMD128,
+	IORING_OP_FREMOVEXATTR,
+	IORING_OP_FLISTXATTR,
 
 	/* this goes last, obviously */
 	IORING_OP_LAST,
-- 
2.47.3

