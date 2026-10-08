Received: from mail-oo2-f6.google.com (mail-oo2-f6.google.com [74.125.231.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76F13A83AC
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 17:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791479152; cv=none; b=Pxko3sytonfjz0VoGP+rr49kOKKAusxdj5HDXO0nS6Xzzc1MKTbLTxsFErwnKBp7gM6/HWKlGUs66mBcFVinzsCY5G0v9umKSQ6MdVLxTG1gMJcwMkbJgG8JIfv2Kb+7p+nopVDAhoLMObT/hc91DvjvKF6l/Dy0LcYSo+fSTH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791479152; c=relaxed/simple;
	bh=SXbUN2sTxUryiOzRpiJL6R9ofWBCAXsss9KIoIP3yOo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=inLI19THFvVpDs0kVNPrjo1/6O9VfOgl4eGjiUAs2ns0VOKtl79Nn8gSlVTJxmv0KKmvdgr5KJd5iC0aQ6syMIHmfOhVA7RDObUVGdItJD8oR9xMWHNA38VHnm3mZ6y7+xiRd8kesCzQX7DV6M1YmGRTyP7tFSGZP5wraP7OaSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XlaFaf/y; arc=none smtp.client-ip=74.125.231.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XlaFaf/y"
Received: by mail-oo2-f6.google.com with SMTP id 46e09a7af769-8216bf5eb5eso2520095a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 10:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791479150; x=1792083950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mDzT7rRLBlLl1SvCaZ6GZFdRqjVzzQ2BxwbcnMx0rc0=;
        b=XlaFaf/y9LEMd0+vtpF54qmy7VJUD5MA5Zb6bYkJkX+E2QKQbWQEgZDYhmcgOjz9Vp
         lL1p5iOt3lZ7vxHqUjAyZEKC7+/184Emb9HkYZ1sO9xqRdcYSb/1a3c2QW6OrrtR8WmH
         N3g8YfLIvtJwG7WYZrCUZ4uZ1IRwLxyYgHxF2nL88Fk6DCHPZZj+Ljrv+XvhliQF06Lh
         ofGNyUW1R1jBMW7AVa3SFjNYCGIXNeA5x3liE6PVDvSY2S3kA9caw3KcMLZPr+TXIt8e
         ItnYc21e8/WOOe6ZG4mXuvtHU93bG5dvTmhBFDcvGCWSmglMXaU4gl4CCETthwb6Lq4Q
         l4Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791479150; x=1792083950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mDzT7rRLBlLl1SvCaZ6GZFdRqjVzzQ2BxwbcnMx0rc0=;
        b=AdClCIN9Sc9vmqPDBq4B44oK9vcxeqq60izMZpNmFor0ChsSOL0FPWseByK18gifI6
         psiAY4INgyqnLjND6LXrhtC+GMXHMJGdJBV7w8uiHkgM3pSxewXqYokv1Lxks6VQHEIC
         RMou59ErTDjrS7mdHv76TxnLFHXDYSI09Tq82YT3zj/ZSLNAutlaMmnFYqZw5GW4Qg77
         e62nXFJy5WOGko63dJ4rJ7AYW/bWEGr51fUNiIfTDnZ4VDP6PTT/zKjoxNFfq5Sbc/yy
         m82VQSraljolDzI47bH0F2gsvtDscKjW2BKFWHumJf1EjrUmUpbuhEOAff0hsEpGDlIN
         NzLg==
X-Forwarded-Encrypted: i=1; AKwUvBw/XQN7TA0WCB8qWpDp4hlcOYvdU+thSjRMCjlR7Aw2bi9DzCcYAO1d2ccTak2Z32SrOsFYdtxazuRtB+s=@vger.kernel.org
X-Gm-Message-State: AFuF++kYmo8ox/Nx1099MXu4Rej/E1o9CHzXUZYd2BpsUt7j0XTEtnQY
	63c2YUKgnDlTweyDOr/gf7nawhYk86bf0BlV759YJGuMHo+qsU928Fny
X-Gm-Gg: AYBFou0/t1yFsiqLP9aJrOId5gZ0S3H6xEvz9CzDmmP+Dg1l7zXKrCG3dl8Ggx5l5Ho
	y02QZJyuLyKedp/UEUM9CgqBZwNOfUj9YZho96NGPtQlRR+AOW1K4bKxs8s2DwK3DzkHJiZzoMV
	d1lVNsaPb1RviRWa5nKEtW5VZmcHQSXxMFnz8a1ztqTIDmGe/wIPUB7oxj8P1QELOCC+Nk1bDsE
	PJ2NwLgcZaLmuXKdLAZNbcN+Zi6z6al2uvbyj/LnmFYFfLDKwgCxT24+Wa/PljKOswWcStdesy6
	uTcstWDH79IBWP+N8UaTMcYm7dleqCrUmY6OE5bpwfUAtG3CiFgKCZDGjODNv99ItXdOVifKgP2
	44GJjostdepysxGQi15vAxFFKQhkBSh6nLpBT61Vqjd27E89o2Zpl8X0rXdXS6Oxgzt3jZ05W4v
	r+1vtIk5i16OBKCV5LhM88CVgXFuQFAJCjBREtQZBqv2j7Quq869ZC06Mzvj/DfFusGmkprbKqH
	IJloCbGwRZrDhg6ZO0O+yf11PzqfMZwSS/0/jzSr/J4qxLG
X-Received: by 2002:a05:6830:81e7:b0:822:e9bf:6445 with SMTP id 46e09a7af769-82acfeb2c60mr6938276a34.9.1791479149825;
        Thu, 08 Oct 2026 10:05:49 -0700 (PDT)
Received: from localhost.localdomain ([117.88.121.66])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82fc8873349sm131411a34.13.2026.10.08.10.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 10:05:49 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tom Talpey <tom@talpey.com>,
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	Gael Blivet <gael.blivet@gmail.com>
Cc: linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH] ksmbd: fix heap out-of-bounds write in SMB2_CREATE context stacking
Date: Fri,  9 Oct 2026 01:05:42 +0800
Message-ID: <20261008170542.1034301-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

smb2_open() appends up to six create contexts (lease, mxac, disk_id,
durable, posix, aapl) back-to-back without checking the total length
against work->response_sz.  A non-compound SMB2_CREATE only gets the
448-byte small response buffer, which also carries the 4-byte rfc1002
length word, leaving 292 bytes for contexts.  The AAPL response alone
occupies 128 fixed bytes, so a client stacking contexts (up to 416)
overruns the kmalloc-512 object into the adjacent allocation with a
deterministic zero-fill.

Compute the worst-case context total from the per-dialect
conn->vals->create_*_size table and grow the response buffer to fit
before writing any context, so legitimate requests keep working
unchanged.

This vulnerability was discovered by Tencent CodeBuddy Security.

Fixes: 8f1b796ff1135 ("ksmbd: add AAPL kAAPL_SERVER_QUERY create context support")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 fs/smb/server/smb2pdu.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/fs/smb/server/smb2pdu.c b/fs/smb/server/smb2pdu.c
index 6b8809f67b926..e18e6b630f757 100644
--- a/fs/smb/server/smb2pdu.c
+++ b/fs/smb/server/smb2pdu.c
@@ -5162,6 +5162,52 @@ int smb2_open(struct ksmbd_work *work)
 	rsp->CreateContextsLength = 0;
 	iov_len = offsetof(struct smb2_create_rsp, Buffer);

+	/*
+	 * The create contexts below are appended back-to-back with no
+	 * length check, while a non-compound CREATE only gets the 448-byte
+	 * small response buffer; a client stacking lease+mxac+disk_id+
+	 * durable+posix+AAPL contexts overruns it (the AAPL response alone
+	 * memsets 128 fixed bytes).  Compute the worst-case total and grow
+	 * the buffer before writing any context.  Note that response_buf
+	 * also carries the 4-byte rfc1002 length word before the SMB2
+	 * header.
+	 */
+	{
+		size_t ctx_max = 0;
+		size_t need;
+		void *nbuf;
+
+		if (opinfo && opinfo->is_lease)
+			ctx_max += conn->vals->create_lease_size;
+		if (maximal_access_ctxt)
+			ctx_max += conn->vals->create_mxac_size;
+		if (query_disk_id)
+			ctx_max += conn->vals->create_disk_id_size;
+		if (durable_rsp && dh_info.type == DURABLE_REQ_V2)
+			ctx_max += conn->vals->create_durable_v2_size;
+		else if (durable_rsp && dh_info.type == DURABLE_REQ)
+			ctx_max += conn->vals->create_durable_size;
+		if (posix_ctxt)
+			ctx_max += conn->vals->create_posix_size;
+		if (aapl_ctxt)
+			ctx_max += conn->vals->create_aapl_size;
+
+		need = 4 + offsetof(struct smb2_create_rsp, Buffer) + ctx_max;
+		if (need > work->response_sz) {
+			nbuf = kvzalloc(need, KSMBD_DEFAULT_GFP);
+			if (!nbuf) {
+				rc = -ENOMEM;
+				goto err_out;
+			}
+			memcpy(nbuf, work->response_buf,
+			       4 + offsetof(struct smb2_create_rsp, Buffer));
+			kvfree(work->response_buf);
+			work->response_buf = nbuf;
+			work->response_sz = need;
+			rsp = smb_get_msg(work->response_buf);
+		}
+	}
+
 	/* If lease is request send lease context response */
 	if (opinfo && opinfo->is_lease) {
 		struct create_context *lease_ccontext;
--
2.43.7
