Received: from mail-ed1-f98.google.com (mail-ed1-f98.google.com [209.85.208.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523A74C6EF7
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789601382; cv=none; b=ezH7t0m751dP+XTiq6rvewvGg2hO6H1NU1S/Rw/TAyrXysP88R71Bg38P6aoBVqVgR9Ue+Cj5v8X19DOHwA45hDQHVWalZcgeLb+kwp9b9zcRz4se8g3YvWsb/MY3iMg3m5WiBO/XQ3mz0fzVBuGbWAL/52rXcC4vv8iYKetpC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789601382; c=relaxed/simple;
	bh=M7/r9z11044BEXueI0sXKlvgGUnc/ShaXxu2aIwy058=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hF+ljcK05SKfpm+0783Jekf44fzhYDT35P8PrGdnJZOUaXsZUrZln7YjVnNHbnVaKPSN+1qxh8EDdo1ToSl9uLys20KyLWFvd2Q7bKCuMIrH8iDEIX5SyFERArAFw2SPDalN4GknVK9aTXA2WqehBOOKm44QFFDggxal8TPjhok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com; spf=pass smtp.mailfrom=everpuredata.com; dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.b=NJCGka8t; arc=none smtp.client-ip=209.85.208.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.b="NJCGka8t"
Received: by mail-ed1-f98.google.com with SMTP id 4fb4d7f45d1cf-6a99776ff70so104030a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1789601378; x=1790206178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u2Y1/E+KkWUlA4bQH0tTik8e0gsQX6ODEq/ubCUUF7Y=;
        b=NJCGka8tqxMvZ98Y/+cA9PMV02z1Lnl7/aLM9VTpbvGj/nun+Ixtw/28Pa7pYyb5iZ
         2Kkko5ohIqKHoFVMxiqnqLk4NQuXbiw6rbzeimtC3kVm+0a5mU/ok55To/qV36uM2/mH
         cywYcNJjaPcAQivgohpl+wwH/cKnGzKqFMqrEe8C2wZlpmjNyexUOUC2wdkwA2+mszID
         wnUYBXhJhNchlcwmhBBA3UNhQPE3JAaGaDAnN0oC74eJqIrPkIkwG9ABSNKg4D//lEkm
         Zsc6L2ejy85DHeP+aYCDxiWhA6eu45kVEu3oGe4wU+Sp1r3tAGVb6FnT26HAsBXZpEaf
         ZIbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789601378; x=1790206178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u2Y1/E+KkWUlA4bQH0tTik8e0gsQX6ODEq/ubCUUF7Y=;
        b=Y+t3MwZvRARFMy5/U4szROQ3G1hgRp5vxpd+KhHq+kIUVckQkpLddinVytErjAqqS9
         AISlvG/j5Jtdvm3xkDmfTFBEI3EqKzDZip2gefEeLTPIm2WG66QlQkF0SCfGBm+iUYkc
         PlxZnRUi2qnfXptFiAQzhVOoyVxdSWqZEBcFXUJAQzxlqbe5OZOx40PW9WhrrDjWpfef
         VYT9jFjWlCK8l8tJbx5FnpdywPHs3TopOWdv38m8gZ41XQa8Wkj8FzpnE3ww1ikCIp4Q
         XAHLBdLs6q4SFKsxHY3x4lokMbe86rT6zC+r3eW7ZNferGl9wslgt1OpvRTHa6V7f/l1
         T/+Q==
X-Forwarded-Encrypted: i=1; AKwUvBypxaRQahEQ+p9LSz6iAo0sB3WkGciiFK37z7gT0LmOmnJbUMdj/SlDrmRImz3XI8cDJikCV4B4DYkateY=@vger.kernel.org
X-Gm-Message-State: AFuF++leZAb/+JmC5ouaXzdXiBg890tR9nU//LwI1A7DFhzmhRKMMFzF
	D4AJ/0wc3LAJJrEw+BU8nzg+IlvBI1jCNaHF2VlrKmUnVnia03uVRxuzGNGhHCyVRy+qa4IW4gb
	OgpA1NXKnaiMi+Jz2+zdvRW9x6JxVNyhTjkxw
X-Gm-Gg: AYBFou1lHov5YhQxhQcahCFq2jl6Ezh4IY6GUNegfJuIIOetiYhZHExK6L+KOtcOkwo
	5jNc9MFbGlUVGbcwgQ3nBc4R/NSHw77ffjvIN7M0o95FZKVDh7wpm7lNHL+B3DvHTnzBLW4b2fj
	ia4EeA01bST31gfOcIHwxDfCJx8dQ0hoQh64gvT9zatRqEh2QtgGDvepr9jC/VESXhnqWDbBZnr
	TR5R3iZAbmewRb8hU0ZMgIYWEyw1lSDtePIEzVsE6aC1e54fSpVxVH3St75bRp20UVr7pz1WvO7
	6u+sanUoKQfjDnl2+H/Svn2xRQUrKzqUbmyVwE0NfArxYmTRUYbGeAbOK8UFv1BHBhiig8HND2c
	Xr/J5fS3bj+HXQakiMykRzitbbObbp4Y+8hpnLik=
X-Received: by 2002:a05:6402:321b:b0:6a9:9ac6:c3dd with SMTP id 4fb4d7f45d1cf-6aa22369d7fmr3504276a12.14.1789601378380;
        Wed, 16 Sep 2026 16:29:38 -0700 (PDT)
Received: from c14-smtp-2023.dev.purestorage.com ([208.88.158.128])
        by smtp-relay.gmail.com with ESMTPS id 4fb4d7f45d1cf-6aa1d2440cesm1487105a12.5.2026.09.16.16.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 16:29:38 -0700 (PDT)
X-Relaying-Domain: everpuredata.com
Received: from irdv-tmenninger.dev.purestorage.com (irdv-tmenninger.dev.purestorage.com [10.32.149.15])
	by c14-smtp-2023.dev.purestorage.com (Postfix) with ESMTPS id DB0333404F8;
	Wed, 16 Sep 2026 16:29:06 -0700 (PDT)
From: Tim Menninger <tmenninger@everpuredata.com>
To: Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>
Cc: linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jon Curley <jcurley@everpuredata.com>,
	Eric Badger <ebadger@everpuredata.com>,
	stable@vger.kernel.org
Subject: [PATCH] pNFS: avoid repeatedly cancelling I/O for the same lseg
Date: Wed, 16 Sep 2026 23:29:06 +0000
Message-Id: <20260916232906.4101987-1-tmenninger@everpuredata.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit b739a5bd9d9f ("NFSv4/flexfiles: Cancel I/O if the layout is
recalled or revoked") added I/O cancellation when an lseg is
invalidated but still has outstanding references.

If references remain after mark_lseg_invalid() clears NFS_LSEG_VALID,
the lseg stays on the layout's segment list until they drain. A later
scan can therefore find the same invalid lseg and call
pnfs_lseg_cancel_io() again, even though no new invalidation occurred.

For flexfiles, cancel_io() cancels matching RPC tasks and disconnects
the associated data server RPC clients. With RPC/RDMA, repeatedly
cancelling an invalid lseg during data server recovery can drive the
client into a reconnect loop that consumes effectively all CPU and
prevents forward progress.

Once an lseg is invalid it cannot be selected for new I/O, so the
cancel_io() callback only needs to be invoked once for that lseg.

Record whether cancellation has already been requested in the lseg
flags, and suppress subsequent calls to the layout driver's cancel_io()
callback.

This does not eliminate the RPC/RDMA reconnect activity during data
server recovery, but prevents repeated cancellation from amplifying it
into a client livelock.

Fixes: b739a5bd9d9f ("NFSv4/flexfiles: Cancel I/O if the layout is recalled or revoked")
Cc: stable@vger.kernel.org
Signed-off-by: Tim Menninger <tmenninger@everpuredata.com>
---
 fs/nfs/pnfs.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/nfs/pnfs.h b/fs/nfs/pnfs.h
index 70d20f779678..1266420bf491 100644
--- a/fs/nfs/pnfs.h
+++ b/fs/nfs/pnfs.h
@@ -44,6 +44,7 @@ enum {
 	NFS_LSEG_LAYOUTCOMMIT,	/* layoutcommit bit set for layoutcommit */
 	NFS_LSEG_LAYOUTRETURN,	/* layoutreturn bit set for layoutreturn */
 	NFS_LSEG_UNAVAILABLE,	/* unavailable bit set for temporary problem */
+	NFS_LSEG_IO_CANCELLED,	/* IO cancelled on behalf of this lseg */
 };
 
 /* Individual ip address */
@@ -692,7 +693,8 @@ pnfs_lseg_request_intersecting(struct pnfs_layout_segment *lseg, struct nfs_page
 static inline void pnfs_lseg_cancel_io(struct nfs_server *server,
 				       struct pnfs_layout_segment *lseg)
 {
-	if (server->pnfs_curr_ld->cancel_io)
+	if (server->pnfs_curr_ld->cancel_io &&
+	    !test_and_set_bit(NFS_LSEG_IO_CANCELLED, &lseg->pls_flags))
 		server->pnfs_curr_ld->cancel_io(lseg);
 }
 
-- 
2.34.1

