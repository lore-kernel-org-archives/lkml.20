Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.71.155.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794321155;
	b=0+O6RssiRUtEPUWKbmKGet8CIxKyeYngvLLvQBN+sLMK2Bn9LMebi00/TkViYf5cCSAV
	 0I5xXTiR5a/RTG8TprwUW5B+GfX4ScGazZMC7N2Jtw2sswz5pjDSaB7AhaXZlQS7X7Ti3
	 7LoSyZu9398v8x9wxoULHOK3KY9CpjZ/FgK0im/k8dCcA1em+XBokIEtSTFi4oi1LZt/h
	 hi0nd1SAi8V74KjE1MbILCOb+MAIV3kkNH2EpH8UkF6eIJ67Fbbz6EsJjwo0yEkXBCe8e
	 bZdA/bWicR+DEQmFhGQo+ajEK2dfSYq/DCIib+nb44CxK996VbrbPnGWoNmWpYgMoVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321155;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-HM-Tid:
	 X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=5WJo43basd2Nuy7XNUK8J6/4Xh64CirRclBNsFrvwDQ=;
	b=UY3jrI2M0v88OG4jWgGsItyvb6X1O0Y28wHQVRJYjgj68EioCgjfNtQqj367GsyS4u0X
	 W+OZ63J+g20wbLnUJKhzYXAyG4sxQE/IVyyOK+UO1/iFPOct1/EpRxfS0BLrID0AyzcWT
	 +uaj1tt7cYuApstPrx/FijZ9Hh3tT5eawpp8op3EOdIXT3X9DIw4hwIT2MUYcjso+lx3a
	 JNJorgDkAQR4JGlOuYn1I6oCi5O+HHjv60P7P5VVGuhDE0bGqYTLLIE597x1La/Wpvxil
	 tg3k4G/I5G7XDY8muSsKzvDbpmV0t6lx4XmVZD/XI3uhordsfJGiTzDEFUP4JDttw8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b="BJmL/Wx0";
	arc=none smtp.remote-ip=101.71.155.101
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694A9606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 694A9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=BJmL/Wx0
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 542cd9c43;
	Tue, 10 Nov 2026 22:32:22 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: gfs2@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gfs2: Fix potential recovery bitmap leak on mount failure
Date: Tue, 10 Nov 2026 22:32:21 +0800
Message-ID: <20261110-9f141e6bc8-gfs2@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
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
X-HM-Tid: 0aa1c5dfd44c03a1kunmfc3dce5c16cdc4
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTUsdVhgZSkNDQktOHklJT1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=BJmL/Wx0yG3dhqDQqjWZ6g1o1h7UqH5uLZmoyBna/5Rm73RjtU0WCWRQRsdKhb0ikHvDMZpp3TyqSz0NLXWaDYfAfGEXrQb+x/klpdXf7hEN9iF6FtZWnFwh6SbqIv64+7dqhYww8uui6Adg+ispDSif3R3HD4dz/mlvuhHw7wk=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=5WJo43basd2Nuy7XNUK8J6/4Xh64CirRclBNsFrvwDQ=;
	h=date:mime-version:subject:message-id:from;

set_recover_size() can allocate the LVB bitmap before failing to allocate
the recovery arrays. Use the recovery cleanup path on this failure so
the bitmap is released before the superblock is freed.

This issue was found by our static analysis tool under development.

Fixes: 57c7310b8eb9 ("GFS2: use kmalloc for lvb bitmap")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 fs/gfs2/lock_dlm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/gfs2/lock_dlm.c b/fs/gfs2/lock_dlm.c
index 47eec0c13025..f3d2c6ad614f 100644
--- a/fs/gfs2/lock_dlm.c
+++ b/fs/gfs2/lock_dlm.c
@@ -1315,7 +1315,7 @@ static int gdlm_mount(struct gfs2_sbd *sdp, const char *table)
 
 	error = set_recover_size(sdp, NULL, 0);
 	if (error)
-		goto fail;
+		goto fail_free;
 
 	/*
 	 * prepare dlm_new_lockspace args
@@ -1384,7 +1384,6 @@ static int gdlm_mount(struct gfs2_sbd *sdp, const char *table)
 	dlm_release_lockspace(ls->ls_dlm, DLM_RELEASE_NORMAL);
 fail_free:
 	free_recover_size(ls);
-fail:
 	return error;
 }
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
