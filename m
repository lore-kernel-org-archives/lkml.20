Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892C840F75B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404717; cv=none; b=TaimlkBvncPeygJvKZQyUSf1INjxk7LMQrNF3ygfEi9WPQQ1HTigLbaFCpxGx16GHEh4t0dF9IPmDBLnyBpDYF82+kgPGmN07wnb//YQ0R86mQYCH9v4YPt8YeGrB82f4hQjcxwnTQCL77I4eqX1+SswoTD1BRDlGhgj4B4w2MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404717; c=relaxed/simple;
	bh=jWTEok0paj4wYBxHWebM3QwVcjvEzsCSuh7Dk8XhRis=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BIaW5M4hMLnp7Xjn2dl0VZ46TYODu+XMRW5pk/R297NEYzpIYwtLboNxr4iuqBn/r6C3BtwW4tqK2cOndlbMMSfKgqWjzDaZl++4eJsOkofMdaFQ9dq8sHnZmp1OA9mOeS+e5sDMIxwf+Iddc66t7aReB6i9G99ZS6sjrinYWgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FCnwo4Sk; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FCnwo4Sk"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1ddc7c9beso7994285e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792404715; x=1793009515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2ESX8jvKxc64R1yrNwWQ44kHJ1omr9swT5HG7pWrcCo=;
        b=FCnwo4SknpJWfUngU67M6TinoO07SpBLut5Nfsp197//k1VkRYGwQX5uS2WNojfkCr
         AlRr2b72x2DYaMhAKTPTe3fqZoXbmQXsCzpoLpxTD7pVCqzX2u8mTx5EcOn9RsNuLnUH
         /DppWyE3ttNw0WdSd/mmGr+MCdPvB+uKHP4Pn6lxexWanuoSrDXFy9xg8M7VOAdjBzxz
         0nqku8On10QNhNot9K/Ts3XRXceVhn5d1bIJzSXsyPUGMJSoIKF2nzxwkd9Mu6rH9gah
         71oDamEbL2GQ+Jv5hzUcoppiBYd5DhaxtfYrqXHtRh+ezfsg+HmttXnh9XumOU4hRvM9
         KK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792404715; x=1793009515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ESX8jvKxc64R1yrNwWQ44kHJ1omr9swT5HG7pWrcCo=;
        b=0SGCI8f7WEL0CL7hpDZZQ+j3tez4FaTWYroSCg/UzrbJKnS7oOSIsD0u0gqlO6chzy
         CPdkG2A3Cv3x6lvu2I9gjsFAvw6cmLEmDEtkKLhfAkZ5n9CTpzBzisyX60rCTeyxajjv
         qvNl/KxGfP2zVSlxlfDFdJH4ik+YDBZr3z2faf/BX9Gr08XH8JeruKSDgnPi9qO5BgGL
         SZ32RQcEMkElFaXxpFulyKabx3mjgC78Q33MWHi4k7MYxi69KYzB5n/tUG0ZtXwHoFo0
         LRj5dQr9bqYwnEHQQ+9LYgMcQJ//3hOdV8C9H6URNeu3sgkCCM9Il37UaX7XT9YZ4X4i
         oMyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPOJGtFEXMsqDa0Aol55tfuc55NhSUAxiLin7UAOsFou77C24LysBPh3lQjI8nCHY5bSiG/29vAlDuMfI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKmp1hiE+7SGImPhPNnAEQEy+WQjTPZuPErUdis6/H/zFoDWar
	fAt37NGXksAyoTNicYt98nPpeABgv83HcPdDK6qL0iHKtN3b+YNuBvfY2V7j9zMSS7k=
X-Gm-Gg: AYBFou1VeJlH9jXLVDzSuybZHq/I/4tRu3AkYBTI9vWGZlhhWZPihbE4D0EwtaWUlL+
	B96/KR1QpjmceIkvWvXHNig86hMjQHhxsLjnMQqvLx2JQU+kpUqBisrY+zTYo1ZVFx3WAtsY2Pw
	hFQg5Rz7R18whnCYqwjZytkIUootrBtFm7Dp3Cp40MoMW67/cEzmDLMGLmywl8/vzUYLgVb0twH
	4ooM1DvYC93CedEG80Iwz2u2NLt7te44aDAfzVi7yZfT5fxaVbSzkmJf9K0TVZ8pZjPL2JP91vk
	v0miHZ7GW9S06ikLbDsmjCiXlManiG6Oz+S8KCABVJm5u5CA2HIWmL8fIx0w8bz2j8jMEcN6l/h
	2uD3wPILPVLNdA5nKuVIUK/Y2kvljA6QCtgCAD2Ts4r1EvPnyDYxMZ2ZOG+Q3sj/lv95BUuI3vO
	VQJCwbmaBSCAVRFrKiYphCTkC1WKreQrL8/8IAl8+eFIGJWYahPNNvKh3SggYq3qepkiKnhNGfw
	OIdN7TGchBNKUos201I80E=
X-Received: by 2002:a05:600c:3ba7:b0:4a1:e6cb:25bb with SMTP id 5b1f17b1804b1-4a1e6cb2ad6mr65909455e9.2.1792404714420;
        Mon, 19 Oct 2026 03:11:54 -0700 (PDT)
Received: from LAPTOP-AVI.taile24b5.ts.net ([2a06:c701:4778:c500:b2d3:8bcc:9626:2887])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1dea678cdsm182559845e9.1.2026.10.19.03.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:11:54 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>,
	Chuck Lever <cel@kernel.org>,
	Jeff Layton <jlayton@kernel.org>
Cc: NeilBrown <neil@brown.name>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] sunrpc: instantiate rpc_pipefs dentry before publishing it
Date: Mon, 19 Oct 2026 13:11:17 +0300
Message-ID: <20261019101117.54038-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rpc_mkpipe_dentry() publishes pipe->dentry before
d_make_persistent() attaches its inode. A concurrent
rpc_queue_upcall() or rpc_timeout_upcall_queue() can
conceivably dereference the dentry while d_inode() is NULL.

Attach the inode before publishing the dentry, restoring the
ordering used before the rpc_pipefs conversion refactor.

Fixes: 946e2256775e ("convert rpc_pipefs")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---

Build-tested with x86 defconfig, CONFIG_SUNRPC=y, and W=1
using the net/sunrpc/rpc_pipe.o target.
Runtime concurrency reproducer: not run.

 net/sunrpc/rpc_pipe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/sunrpc/rpc_pipe.c b/net/sunrpc/rpc_pipe.c
index 9d349cfbc4831..6d005231bc334 100644
--- a/net/sunrpc/rpc_pipe.c
+++ b/net/sunrpc/rpc_pipe.c
@@ -665,8 +665,8 @@ int rpc_mkpipe_dentry(struct dentry *parent, const char *name,
 	rpci->private = private;
 	rpci->pipe = pipe;
 	rpc_inode_setowner(inode, private);
-	pipe->dentry = dentry; // borrowed
 	d_make_persistent(dentry, inode);
+	pipe->dentry = dentry; // borrowed
 	fsnotify_create(dir, dentry);
 	simple_done_creating(dentry);
 	return 0;

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.43.0

