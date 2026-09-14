Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D90D37F30C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789411023; cv=none; b=ceiXhbfSCIMaIdiN7OswCEMtM2RkhgpgbuICtWrsLamLaqLNnwLVj1U74mDHMyvDoILYwEgTyHUp9I5tgDnEih0cym8oHq/I2XDU1TZCrsuOdBYmDwOrW86zznzmXmnHclvukVOlAE5uB2QNudZcxONBAJUSddJIxBvalt+Pn5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789411023; c=relaxed/simple;
	bh=jzmgons7ejK3RqIf9FhUwWMQh0wU6zB2YBwt78fShPA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pUPoEIqeElCoKxSldGfdw7pI0TUDu8GrVAXV+3dCspVhhQagBYO7JQXp5oBe86QKZHFjcq8HMCdoLOzQhAiaviq6DArefMfAnprv4G22pAJD2CB9nQ4VLvy08qwpTEi6LAj2t3YJCtbhYX+WVX1PQ9iRikaouqcehvnzqQ9Hl+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=awuAmPOV; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="awuAmPOV"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd53691be5so21144525ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789411021; x=1790015821; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tbp/X+AmysveQVQvFKs94vOjfQjVlMyD1nl7AhFF9vo=;
        b=awuAmPOVAqOObpNTkBZeRFF7R9oXrxq1Jx6PZf9+qr7UCm0zkWqonc7doXGCVn28z5
         O8ySSuCUyYBCLFZggxw3x1X2g3uEn2NAxXEuV0hy2JRXHdQHOLRKls+sTyt9RZRzOhO9
         PHHxrZAfwwwXK55dWKqUPhbzlfVNQ541eEagyA4J9AUm+8W+4ywi7X8+hyhg3uih/WJh
         ke5ExENeWcq6Fdh9dVFqjanp1AGxmBJFUvyKxSqJ4sW2mc0dM2qPNHIuwFkhcWAo+sBm
         HoXISOI+Hdri7eOtWcKo6mM3lIhn6zJ8up37j7JkCG0IaQRKOFQ0JrHC1yAp+76hYodK
         z1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789411021; x=1790015821;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tbp/X+AmysveQVQvFKs94vOjfQjVlMyD1nl7AhFF9vo=;
        b=WGCJB7MIt+9xCJx7HnYMSCDy55HhajhoBOQ62JwoQsLoiHGkWFxQpdGgxzIee0qUTM
         NCx9bIdADL50rHFMYVqiVWd9ORznFws3eIqpzgIwB+V3j8ZctGttoAEFH+bUlQyTYJaz
         PpcDehOXBO1Op5dRxrhYEM7hQPy+7rj9XGqnn5zWuDqu96nnj68sB4/8krRJhV4rSnzG
         cYhJryd9uzTUjAhyQ8k+jLe4p/nx4WbkP9t00A8TcSA3bL+TEXRAiAP3sNGXne6HV3eN
         LLwUXHTfMRIHqHTGOkMvhbiZ6wz1vGqAKjTvM51ctI4VMWSiHj3Eo2YTjKBy6Kj+4Pey
         QhDg==
X-Forwarded-Encrypted: i=1; AKwUvBwovuTVUP/4AySnjjtR32mc06bcEPLzJFXD5i/DF5zfAiQr2GXKkOyYpfHtKtcMQTU3FhZVe6ARuoWFe2Q=@vger.kernel.org
X-Gm-Message-State: AFuF++nYxGuFOWs6kW/TZDe3DpURYUCuoigH4Iw2ADhteDdR65wr7qyP
	fR3uSQKWowfUv3BPSYTlJ3wjv/gBkJlkQbsYBSuBZ91ffudecxSPLZlABwQOgQ==
X-Gm-Gg: AYBFou3BWI1Lsc6liPQBu4pBRo4DDXuyxYUvs+6COY3yPA+MquBl9eZuC9xuvtkKEXa
	Qj2n29OLr4Ja9/uMrEATjO2Nj52OXsTLH4YCirYGBoqSjNM5eeXfTiO1PlHzpuR1NldZ1HPXuIv
	RY8FvcbNBxAetZWZg7XGOINeNVqR3nxWpb9ajI65J8/+tArjhmhrTLWUTZSFJkbHsEp5klqrS1x
	/kCPVXCWkORU0QdchXwwakZBInjuSo3z0GhRKBjJryoAdmeAaoV/GR3FFtK2aM6d8Rc6OcP7SsN
	hW8Tg3W084XmKHi3VlHLMTzZsOKB59YWUDZ868s61MFC4XczNSI+NEsWqwBdOTAbr2MmOHB+8gv
	KmNeov6RGUty+UaktUGSBc0Eu8KvXP3v1cksK8VMRGh/J1eX7763Tm4F9XoEIAsSGv2hZlNPXpo
	A7mdK1h4I/MUmMEDxEmRp4uqjgv0PTM/ln8smddtCizXDkiFdwWn07n0VrSMfTB/6ptJJQfs5vV
	E/7mPhUEpVOO/jkzNPwDhIrIXJvMo3V/1qqkj7hYHqdT4U=
X-Received: by 2002:a17:903:98f:b0:2d8:d4ce:7e40 with SMTP id d9443c01a7336-2dd6c7622e4mr78861825ad.21.1789411020855;
        Mon, 14 Sep 2026 11:37:00 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd46670194sm41297975ad.68.2026.09.14.11.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 11:37:00 -0700 (PDT)
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
Date: Mon, 14 Sep 2026 11:36:48 -0700
Subject: [PATCH] fuse: Cache unsupported ioctl requests
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-fuse-cache-no-ioctl-v1-1-70a05053ef0f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAL8+qGoC/x3MQQqAIBBA0avErBtIo6SuEi3UxhwIDa0IorsnL
 d/i/wcyJaYMY/VAooszx1Ag6gqs12El5KUYZCP7ZhAC3ZkJrbaeMETkaI8NhTGdarVU3aCglHs
 ix/d/neb3/QBdJnKsZQAAAA==
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Robet Byrnes <byrnes@wildpumpkin.net>, 
 Stanislav Kinsburskii <skinsburskii@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789411020; l=2578;
 i=skinsburskii@gmail.com; s=20260722; h=from:subject:message-id;
 bh=jzmgons7ejK3RqIf9FhUwWMQh0wU6zB2YBwt78fShPA=;
 b=fZcg7MJ0BGyyXplRSHhYQzsaoJ1SQW3/6NfqoliVBmJfruNzKoyQEzb9GRIHSzZnyxllMkpoJ
 Yho+76oIKAnCKGevYFfAPUBDiUKRewz1nnKfgQwvsJGowfdnIQdIXiE
X-Developer-Key: i=skinsburskii@gmail.com; a=ed25519;
 pk=bDpriHBYgeTdkIDweZDCemxsU93neJBOCn3YLIuJpnE=

A server that does not implement FUSE_IOCTL returns -ENOSYS for each
request. Cache this response on the connection and return -ENOTTY for
subsequent ioctl requests without contacting the server.

Only cache request-level -ENOSYS. Errors in fuse_ioctl_out.result apply
to individual commands and must not disable ioctl support for the
connection.

Check the cached flag before preparing regular ioctl requests and before
opening a file for file-attribute ioctls, avoiding unnecessary allocations
and open/release requests.

Signed-off-by: Robet Byrnes <byrnes@wildpumpkin.net>
Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 fs/fuse/fuse_i.h |  3 +++
 fs/fuse/ioctl.c  | 12 ++++++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 97d356588d00..e9d8b48069dd 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -720,6 +720,9 @@ struct fuse_conn {
 	/** @sync_init: Is synchronous FUSE_INIT allowed? */
 	unsigned int sync_init:1;
 
+	/** @no_ioctl: Is ioctl not implemented by fs? */
+	unsigned no_ioctl:1;
+
 	/** @max_stack_depth: Maximum stack depth for passthrough backing files */
 	int max_stack_depth;
 
diff --git a/fs/fuse/ioctl.c b/fs/fuse/ioctl.c
index dc3a188f5d72..3ae50a25064b 100644
--- a/fs/fuse/ioctl.c
+++ b/fs/fuse/ioctl.c
@@ -23,9 +23,11 @@ static ssize_t fuse_send_ioctl(struct fuse_mount *fm, struct fuse_args *args,
 
 	ret = fuse_simple_request(fm, args);
 
-	/* Translate ENOSYS, which shouldn't be returned from fs */
-	if (ret == -ENOSYS)
+	/* Cache request-level ENOSYS only; outarg->result is per-command. */
+	if (ret == -ENOSYS) {
+		fm->fc->no_ioctl = 1;
 		ret = -ENOTTY;
+	}
 
 	if (ret >= 0 && outarg->result == -ENOSYS)
 		outarg->result = -ENOTTY;
@@ -233,6 +235,9 @@ long fuse_do_ioctl(struct file *file, unsigned int cmd, unsigned long arg,
 	struct iov_iter ii;
 	struct fuse_args_pages ap = {};
 
+	if (fm->fc->no_ioctl)
+		return -ENOTTY;
+
 #if BITS_PER_LONG == 32
 	inarg.flags |= FUSE_IOCTL_32BIT;
 #else
@@ -492,6 +497,9 @@ static struct fuse_file *fuse_priv_ioctl_prepare(struct inode *inode)
 	if (!S_ISREG(inode->i_mode) && !isdir)
 		return ERR_PTR(-ENOTTY);
 
+	if (fm->fc->no_ioctl)
+		return ERR_PTR(-ENOTTY);
+
 	return fuse_file_open(fm, get_node_id(inode), O_RDONLY, isdir);
 }
 

---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260911-fuse-cache-no-ioctl-1bb573a27597

Best regards,
-- 
Stanislav Kinsburskii <skinsburskii@gmail.com>

