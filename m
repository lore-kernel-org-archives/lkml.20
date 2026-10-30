Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364003;
	b=1l8pdrj7g2q29TLm/ZG/HUaf2w5Byb+Ydo1oFJRLmyU29QlFhwRj+8e7+U+5MRkFoips
	 FDg1QzzWp0vglxzVjn+pTou1TOAW65ivf847EYyd8kxg9M4UshO+hY2YDqzdieIByV8Id
	 X8Jpc0eBLu9PAO6Vlf9zA4hAHY6LReFsSm9I33eT5czaIgb5h6JZlsHZgdEQ0ok+HOEwk
	 43nxv0W9NFdlN1CvMKNkHyUrZxdn7DZnLAuq9GMGBF4C3GciEVpZuk8gTlM8TU+ZXPGh6
	 j4MsApjyreyEr+Jooav0dHwdC6VDPqK5u4wcSIGh0Ci/vc/eOgMnqET1dIYHtpZOaZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=idcCYTNO1871c547soSOMVzF2UdXrjdgIrvxw0MC2E8=;
	b=hJbWtW6RC6qxKJAJ3RSD8mz62qc2bUOGONdwR/RmWYisY8akwvdqG70DrIOfzRKo2Yxv
	 j98eE8hlz7xGC2CUVuXBBrl0LRkcSZkeiUr8OFSOxTvJ4B5/RSKB9kk1Bf1LkHmgSFqqi
	 /VE1J8g1mz6MUKt3soT5qfJwl1vOI+2dqvWXk8UuQjbFuQjLAKgVUUGLo3NzISDV3t9CX
	 qH114Ql+5HQh73DA9esOXiEc3ERLQA3Lb4MC1FQ0iVjkvLtA4dW9+eFYshdW/z6zTYBhC
	 Kzgbv5xORkrXH38O5PzKQhaeStgHFY4UbZpfXIhK7ZjlcHKb7pbZ7vsXhlRd6uqii9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="A6n/Si+O";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDD0606A325
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:39:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFDD0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A6n/Si+O
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso5686565e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793363996; x=1793968796; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=idcCYTNO1871c547soSOMVzF2UdXrjdgIrvxw0MC2E8=;
        b=A6n/Si+OuhFkNSCBQKiPePXd+dtdMhmwPAt5KTorOFEU8cHEW7ocRASiH++AcncQRy
         RMYp/kI8UY6qg7sb9qw4vz80BnfrpthtouWlcFNJUCRzDaga1p+yrgA0QbX/jKK/tt3D
         ECTGE3nw2Hm1Cpfx7wiNm9bV4ssLE2qxZAuqSQ+C44WZE53/8bspsZ0IcDZOxIh9RxPZ
         nKA0HSoAAdhJbn0vR21vbzzmCWrJ4Rye/fk2L+ZyrtLPyOWeJRbf6d9MzmZRBnSu1iFJ
         uw/1wDfs/W+8KYAIhsPDUkW7zg6LXf+FAklxZe18h54FJ1ayd6v8pWBiggDrgYjcJVXw
         qNVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793363996; x=1793968796;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=idcCYTNO1871c547soSOMVzF2UdXrjdgIrvxw0MC2E8=;
        b=2lNYc02VTSmPTbWC5auPtGwlNRRKtgLgbYOJOLHBjM3EFREsIuEbASAOYUKDiDP2v/
         r6TpYdWg25RFHtlF0ZL4e0eWvbfb7A2jnmGpVlnWoWeVvvNZDrpq/avx0By1sxnnFXqk
         xk0kqD70whZpPKh167uPWpcw6Uw4SaR+OUsoSmdOPz8xz7/bqNeFQ5PUL7sbUblwkMUT
         at5i9oc0t8posojPWTbLxdjYudEIVuLdB6vgaPZm8dPUTwDdZYK16/0wW4wd19VPi/za
         CpbyfYGIumPn/y0HGCPbqlug0Q381aCLUwrMtKUZwlKLIv/NLn1GH2+SNAwKueVkcpNY
         /a1A==
X-Forwarded-Encrypted: i=1; AKwUvBw/uSd488/JyHrlY3odRM6I68yCILyW17XkX0ZnLjXZKNjHzxIIIyQpoh9FZyRgTYu8bTrWcQDSv0WLkt4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSvtM4ViVo02Vat0M9bh0X+1Ek4XJOLZxEVbDiVjoxlZMBVXqE
	tHrFOPNTDwTTvh5OnlMIlmn9TWdOoH5QYlt9a1HTfLJf+VVpBvIfj01V
X-Gm-Gg: AYBFou3VmsldAM8EOsF9wyIeDCvdFoDf6N4AFDm0dWVe8ynLWeCan4w7Ov4WY4NMPBV
	PutKtZIFqafA0dWk54HTQ7BHzoRk6MbwR3JqgwuyDNI/43WqZJol/4ACk6dXjlEhkS8U0DCTZDD
	tnpypMbVcoRy+WvOxW0YUL7/MdeVtg9L0R/bn7c4Ad42NKa6TkHWtQNHNNqhageZHIzqoKd2rDa
	AXP5kObIs+mSqfxCkw09vLCtunDdEETrc7zSFbK8eCxj+lVN/5eZOpY4CCyyGyyo/TPRa0baEnH
	Mcfawf171atUncgaNCnEw23nbVlRHOpIE9MuBS7SmBimdnr5wJkyXMmQJ5o68vUIHgQRH2OKjYE
	GbfcNfvn3MLETDnD3g/SdcJ2eiZtPQV+bGSo9jgK3xocOxSlMnM+uk1dmklz/7ZAykQJ/1eYV9S
	Eab+hEcKGSdydDbpXKGvaXwIRmBZi5CgczlzJ6jqxtpuz5L+W2zUHsIox9N+sahfyZhjK6OdECA
	OzPC4rY7bX953wwfI4wIPhRu1CuYTrVBJFLVaYxgZO+KGZ1yIqoyz+Mg1n1KOILL5OP6ctDkviM
	rF3qtuMYENsbmlTS8PhP1Je7LnC5pLzcepx/d0ZAARmw4vinMd7aki53BCdsDab9+MbgXudjMlr
	2afKdXPdeWSY/OMcJ2PWAOWeTuWngehCDAeBp4B+l
X-Received: by 2002:a05:600c:4e11:b0:4a0:eae0:769a with SMTP id 5b1f17b1804b1-4ac185bc7d0mr48089815e9.28.1793363995962;
        Fri, 30 Oct 2026 05:39:55 -0700 (PDT)
Received: from meven-thinkpad.home (2a01cb088745e00090de407b41070a01.ipv6.abo.wanadoo.fr. [2a01:cb08:8745:e000:90de:407b:4107:a01])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm3088971f8f.23.2026.10.30.05.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:39:54 -0700 (PDT)
From: "=?UTF-8?q?M=C3=A9ven=20Car?=" <meven29@gmail.com>
X-Google-Original-From: =?UTF-8?q?M=C3=A9ven=20Car?= <meven@kde.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	io-uring@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/3] io_uring: add support for utimensat
Date: Fri, 30 Oct 2026 13:39:44 +0100
Message-ID: <20261030123945.1704118-3-meven@kde.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030123945.1704118-1-meven@kde.org>
References: <20261030123945.1704118-1-meven@kde.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A program that copies many files sets the times of every copy after
its last write. On NFS and SMB each of those calls is a round trip to
the server, and with io_uring it is one of the steps of the copy that
still have to leave the ring and run one file at a time.

IORING_OP_UTIMENSAT behaves like utimensat(2). sqe->fd is the directory
fd, sqe->addr the path, sqe->addr2 a pointer to two struct
__kernel_timespec, and sqe->utimes_flags takes AT_SYMLINK_NOFOLLOW and
AT_EMPTY_PATH. An addr2 of zero sets both times to the current time, as
a NULL times argument does. The times and the path are copied at
submission.

As with utimensat(2), a NULL path sets the times of sqe->fd itself, and
two UTIME_OMIT times complete with 0 without a lookup. Unlike the
syscall, a NULL path or AT_EMPTY_PATH also works on an O_PATH
descriptor.

Like the other path ops, the request is issued from io-wq, apart from
the no-op, because the lookup and notify_change() can sleep. A fixed
file is not accepted as the directory fd. A failed request fails the
rest of its link.

Signed-off-by: Méven Car <meven@kde.org>
---
 include/uapi/linux/io_uring.h |  2 +
 io_uring/fs.c                 | 99 +++++++++++++++++++++++++++++++++++
 io_uring/fs.h                 |  4 ++
 io_uring/opdef.c              |  8 +++
 4 files changed, 113 insertions(+)

diff --git a/include/uapi/linux/io_uring.h b/include/uapi/linux/io_uring.h
index b42b66b424a7..6a98c9282e0b 100644
--- a/include/uapi/linux/io_uring.h
+++ b/include/uapi/linux/io_uring.h
@@ -76,6 +76,7 @@ struct io_uring_sqe {
 		__u32		install_fd_flags;
 		__u32		nop_flags;
 		__u32		pipe_flags;
+		__u32		utimes_flags;
 	};
 	__u64	user_data;	/* data to be passed back at completion time */
 	/* pack this to avoid bogus arm OABI complaints */
@@ -319,6 +320,7 @@ enum io_uring_op {
 	IORING_OP_PIPE,
 	IORING_OP_NOP128,
 	IORING_OP_URING_CMD128,
+	IORING_OP_UTIMENSAT,
 
 	/* this goes last, obviously */
 	IORING_OP_LAST,
diff --git a/io_uring/fs.c b/io_uring/fs.c
index 26ea841a22e7..85e0a1cb6b47 100644
--- a/io_uring/fs.c
+++ b/io_uring/fs.c
@@ -304,3 +304,102 @@ void io_link_cleanup(struct io_kiocb *req)
 	dismiss_delayed_filename(&sl->oldpath);
 	dismiss_delayed_filename(&sl->newpath);
 }
+
+/* Internal flags, above the AT_ flags of the SQE */
+#define IO_UTIMENSAT_NOOP	BIT(30)	/* both times UTIME_OMIT */
+#define IO_UTIMENSAT_NO_PATH	BIT(31)	/* NULL path: the dfd itself */
+
+struct io_utimensat {
+	struct file			*file;
+	int				dfd;
+	unsigned int			flags;
+	struct delayed_filename		filename;
+	/* NULL sets both times to the current time */
+	struct timespec64		*times;
+	struct timespec64		ts[2];
+};
+
+int io_utimensat_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
+{
+	struct io_utimensat *ut = io_kiocb_to_cmd(req, struct io_utimensat);
+	struct __kernel_timespec __user *uts;
+	const char __user *fname;
+	int err;
+
+	if (sqe->len || sqe->buf_index || sqe->splice_fd_in || sqe->addr3 ||
+	    sqe->__pad2[0])
+		return -EINVAL;
+	if (unlikely(req->flags & REQ_F_FIXED_FILE))
+		return -EBADF;
+
+	ut->dfd = READ_ONCE(sqe->fd);
+	ut->flags = READ_ONCE(sqe->utimes_flags);
+	if (ut->flags & ~(AT_SYMLINK_NOFOLLOW | AT_EMPTY_PATH))
+		return -EINVAL;
+
+	uts = u64_to_user_ptr(READ_ONCE(sqe->addr2));
+	ut->times = NULL;
+	if (uts) {
+		if (get_timespec64(&ut->ts[0], &uts[0]) ||
+		    get_timespec64(&ut->ts[1], &uts[1]))
+			return -EFAULT;
+		ut->times = ut->ts;
+		if (ut->ts[0].tv_nsec == UTIME_OMIT &&
+		    ut->ts[1].tv_nsec == UTIME_OMIT) {
+			ut->flags |= IO_UTIMENSAT_NOOP;
+			return 0;
+		}
+	}
+
+	fname = u64_to_user_ptr(READ_ONCE(sqe->addr));
+	if (!fname) {
+		if (ut->dfd == AT_FDCWD)
+			return -EFAULT;
+		ut->flags |= IO_UTIMENSAT_NO_PATH;
+		goto out;
+	}
+	err = delayed_getname_uflags(&ut->filename, fname, ut->flags);
+	if (unlikely(err))
+		return err;
+	req->flags |= REQ_F_NEED_CLEANUP;
+out:
+	req->flags |= REQ_F_FORCE_ASYNC;
+	return 0;
+}
+
+static int __io_utimensat(struct io_utimensat *ut, struct filename *name)
+{
+	int flags = ut->flags & (AT_SYMLINK_NOFOLLOW | AT_EMPTY_PATH);
+
+	return filename_utimensat(ut->dfd, name, ut->times, flags);
+}
+
+int io_utimensat(struct io_kiocb *req, unsigned int issue_flags)
+{
+	struct io_utimensat *ut = io_kiocb_to_cmd(req, struct io_utimensat);
+	int ret = 0;
+
+	WARN_ON_ONCE((issue_flags & IO_URING_F_NONBLOCK) &&
+		     !(ut->flags & IO_UTIMENSAT_NOOP));
+
+	if (ut->flags & IO_UTIMENSAT_NO_PATH) {
+		CLASS(filename_kernel, name)("");
+		ret = __io_utimensat(ut, name);
+	} else if (!(ut->flags & IO_UTIMENSAT_NOOP)) {
+		CLASS(filename_complete_delayed, name)(&ut->filename);
+		ret = __io_utimensat(ut, name);
+	}
+
+	req->flags &= ~REQ_F_NEED_CLEANUP;
+	if (ret < 0)
+		req_set_fail(req);
+	io_req_set_res(req, ret, 0);
+	return IOU_COMPLETE;
+}
+
+void io_utimensat_cleanup(struct io_kiocb *req)
+{
+	struct io_utimensat *ut = io_kiocb_to_cmd(req, struct io_utimensat);
+
+	dismiss_delayed_filename(&ut->filename);
+}
diff --git a/io_uring/fs.h b/io_uring/fs.h
index 0bb5efe3d6bb..2812dc3b4b2f 100644
--- a/io_uring/fs.h
+++ b/io_uring/fs.h
@@ -18,3 +18,7 @@ int io_symlinkat(struct io_kiocb *req, unsigned int issue_flags);
 int io_linkat_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe);
 int io_linkat(struct io_kiocb *req, unsigned int issue_flags);
 void io_link_cleanup(struct io_kiocb *req);
+
+int io_utimensat_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe);
+int io_utimensat(struct io_kiocb *req, unsigned int issue_flags);
+void io_utimensat_cleanup(struct io_kiocb *req);
diff --git a/io_uring/opdef.c b/io_uring/opdef.c
index cf3aa2242cd7..383a9b9d1df4 100644
--- a/io_uring/opdef.c
+++ b/io_uring/opdef.c
@@ -591,6 +591,10 @@ const struct io_issue_def io_issue_defs[] = {
 		.prep			= io_uring_cmd_prep,
 		.issue			= io_uring_cmd,
 	},
+	[IORING_OP_UTIMENSAT] = {
+		.prep			= io_utimensat_prep,
+		.issue			= io_utimensat,
+	},
 };
 
 const struct io_cold_def io_cold_defs[] = {
@@ -849,6 +853,10 @@ const struct io_cold_def io_cold_defs[] = {
 		.sqe_copy		= io_uring_cmd_sqe_copy,
 		.cleanup		= io_uring_cmd_cleanup,
 	},
+	[IORING_OP_UTIMENSAT] = {
+		.name			= "UTIMENSAT",
+		.cleanup		= io_utimensat_cleanup,
+	},
 };
 
 const char *io_uring_get_opcode(u8 opcode)
-- 
2.56.0

