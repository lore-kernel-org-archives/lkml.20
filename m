Received: from va-2-36.ptr.blmpb.com (va-2-36.ptr.blmpb.com [209.127.231.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB88C477E58
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254431; cv=none; b=G4wsViKCjPGWpmsgdobJM/DColS6zesY7L0WYgfkZKZVUJPSLS+QjgH/NfE0KVFO9Z4fyktmZh75j8euWvd0J1/f4PxtU4Z0WYoOVVZ2gEAuTQRxEUFmQmrJb+Snv3vI1tDQYvgUxdgSEYw6bsyGoFZIYfMuj4pBYBZXWonsxv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254431; c=relaxed/simple;
	bh=LLXr5FcNvDy/RdGzCJf5UhcVHvnVt4BkF3ZcqPJTojA=;
	h=Cc:Mime-Version:Content-Type:To:Subject:From:Message-Id:Date; b=mQwPbeay6AQEkfaythr61KSwzTI5F88K1hvYuVAV4o8L98RvKIBlwgINp/vLJ2Q8GyVfD2Q0oO7ww+xJamX8WwqYweXpWznN6kRSTEC4HVPO9WlXS8QzEq/AdcJ0iz7bQAY3ME7rHJ7QI/Ap6JY2h01jCqFEyXYbztHfrJGchUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=moonshot.ai; spf=pass smtp.mailfrom=moonshot.ai; dkim=pass (2048-bit key) header.d=moonshot.ai header.i=@moonshot.ai header.b=jpQFNJ9q; arc=none smtp.client-ip=209.127.231.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=moonshot.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moonshot.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=moonshot.ai header.i=@moonshot.ai header.b="jpQFNJ9q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2510091218; d=moonshot.ai; t=1788254422; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=+jnjpemoraglH/gEmaQQrk0zuAg+OHmzGE5T/oqUVpo=;
 b=jpQFNJ9qlHGMJvzJ9WO/DYZzcgecF5GZmuUWPJVn3drFLb0SvZ11eHUnKrHTqFBqXmLpOL
 YRYXG8vwDfftJPiwOpeASUwDzV1rCk3rzlPKShMvo+b08+uZidsWEZeNCk07isyzL6G2sV
 Owahs1sr1jg+w7slKtIADtF0xfDP9pwJJig18T2GdTNhMjtHNuEgp/uAvltzbK9t0Ki2rl
 YvWyMgjLGStIOEfl1omdAEvP2Ip3ZRW3jBB1Fh1lRoDytqYeGresq/zeQCL3f/WL0saGwj
 KoWKS9iu2QTO/D6o+RQVJ6Rpsd8pkGLGBv+zkWgLT2AddSZAzpP6LDC6UE/0FA==
Cc: "Yilin Zhang" <yilinzhang@moonshot.ai>, <linux-nfs@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"Kimi Security Team" <bug-report@moonshot.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Received: from dev.msh-dev.svc.cluster.local ([117.157.206.135]) by smtp.feishu.cn with ESMTPS; Tue, 01 Sep 2026 17:20:18 +0800
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
To: "Chuck Lever" <cel@kernel.org>, "Jeff Layton" <jlayton@kernel.org>
X-Lms-Return-Path: <lba+26a9698d4+e5e81d+vger.kernel.org+yilinzhang@moonshot.ai>
X-Original-From: Yilin Zhang <yilinzhang@moonshot.ai>
Subject: [PATCH] SUNRPC: reject deferral when rq_arg.len < head[0].iov_len
Content-Transfer-Encoding: 7bit
From: "Yilin Zhang" <yilinzhang@moonshot.ai>
Message-Id: <20260901092001.2026287-1-yilinzhang@moonshot.ai>
Date: Tue,  1 Sep 2026 17:20:01 +0800

svc_defer() misses the rq_arg.len vs head[0].iov_len check, so a
crafted RPCSEC_GSS packet can make the deferred snapshot no longer be
the original request.

Since deferred replays skip GSS verification, this may lead to an
authentication bypass.

Reported-by: Kimi Security Team <bug-report@moonshot.ai>
Signed-off-by: Yilin Zhang <yilinzhang@moonshot.ai>
---
 net/sunrpc/svc_xprt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/sunrpc/svc_xprt.c b/net/sunrpc/svc_xprt.c
--- a/net/sunrpc/svc_xprt.c
+++ b/net/sunrpc/svc_xprt.c
@@ -1282,5 +1282,7 @@ static struct cache_deferred_req *svc_defer(struct cache_req *req)
 	if (rqstp->rq_arg.page_len || !test_bit(RQ_USEDEFERRAL, &rqstp->rq_flags))
 		return NULL; /* if more than a page, give up FIXME */
+	if (rqstp->rq_arg.len < rqstp->rq_arg.head[0].iov_len)
+		return NULL; /* inconsistent lengths */
 	if (rqstp->rq_deferred) {
 		dr = rqstp->rq_deferred;
 		rqstp->rq_deferred = NULL;
