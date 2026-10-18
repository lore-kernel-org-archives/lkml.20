Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54233D811C
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792295519; cv=none; b=ML1GdIqn15Xx4/4PiR+2niXYLJ8/2r0KYFuXVV0O6Fga+nSA3cMkCNniOm21ZBfiZ/J6ddpa3AtwSVoNll/rwTCbw4KwvutHgR7/1NS6eX//3O2dnkxUw0AqH5VSXaiPqRu8t1TCkcZTi/57Pkluyp7N9MAOL6pgQniOnO2ASM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792295519; c=relaxed/simple;
	bh=Vi/sR9UBL3IE405tG8zRS6aqkD7d5j5shZvamUz/8as=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uJWorunXJN220WTYp/xIewN42wUnFTWzdtoJ7BTj5ddajD3K6VUo82fC3H8w98IEDyNEKBNrKR0sV2cuV8c6WKt31l8iBj7B4uEjFZ5/VV66qGCTkckda7Ce23YphQZ94TKJmmOhdNKlqibp4wxFKshPZ2Irb1JQ9kFMlmJN0Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=K3LalsLr; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="K3LalsLr"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so594431a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 20:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792295517; x=1792900317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tXRdAMjjFZfXtnEnr4dqDWWhcOJ/4Lnn/GYCEcpDeYg=;
        b=K3LalsLrL9aef8hMlLZH2rkfzwQxX39ZUCQV51+kTuDuphFUil+wVSf63j7pd8vbTa
         Oyn2rj+zmM9j9MGa4Ej4sXFXNICXTALNnCiAaUa9QEVx6LpyCczNptdbcaMGW9z7/m/g
         h3lb9lZ41t+s/Tg/CjPLV6ppRsFPr6CrQ6UNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792295517; x=1792900317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tXRdAMjjFZfXtnEnr4dqDWWhcOJ/4Lnn/GYCEcpDeYg=;
        b=2w4VMCwx+0EyPbU+fW/mw09LKGUUxNRO5TllPKI85cOYCa5dyxKSaFf3UQMBp2Jb9Q
         C7JlWlvPaeGaJCmyUiwyt6A13/zr4WEFU+C5kDlJ5nc2PJ+9N5n6MpefIrqFeQ0Tznuu
         L1YxTtKjLjBCom6HyndBWTUX7GUL9nUIDKZXMTpmoo3Ix7hFl4cFUJqn6nTZO6TPAa0D
         hcRMz5ZCAOgP/luoTL0lgMTLyrmi0760R9RifP+rPDmUZeIBaqvVLZKVRjcuhGHtZ9cP
         m50WU0M98eVleVgLLcdAuJZ+/haWTyM4j8HIGGpl/IS6TY+pxm1QZjyr8m5B28CZzDhZ
         /Rzw==
X-Forwarded-Encrypted: i=1; AKwUvBwIHpAkyJVeOy0dN/enJbqZ4OA5sL6lhnHA20UMLobQk8Z8JbTEzz+LA7fWxl0wGnje2qL4gaAzEKmnUxw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIRNTi+lWEmvQfi1JhZcspORvA7E1WJ33/NWYGxVcwfxRKvN+J
	X0GO7d5mVmlpEm6VVCGRlsFh86TZzcqrNJoWhbneVQ3Q5xHnUbkgdMR8CNg2z/eDF0XzuzI1qHT
	7UWg=
X-Gm-Gg: AYBFou1aVXpdXl4rIBesMy5F6+V+9pX5QfymQUQVLjnKZONAIIW4zsvZLyD4DB4pw1V
	SlrYzKOd5OhaST4Dy3txwmaUe0B8EpvhY8/rzWID9+g6xgSLbn+OFio63cO4hP6mpwockf/QSZ+
	50tKX6T2i4Mffteik/dRxli2pCGIqMZgoy1WUgT2Pxigm/Z+Xyj0IaVlkysUHggQoo8XBnqqeel
	MUoGPPmnwFYpbSMO+jF0iMID+V0BJ37WhndVSw5pd3MCzZnpYKzk0yGxEIHJjdfkhDfZsUd8qAg
	STmXP1naodD/fHeWLx5hDTpT2rPix5hb51oSzsWR5j5yIOAEaJT6UlPq+df2tUimuiBEoOgVmLh
	du51vpbaxD+oh/juGn3sQKsQAZm4lqEU0RcgGGpT9eg7qAyPFLxazb2QeFr3VmY3lrYhbtCPvCt
	H2FIGCSDwvaa1aeqUhfmIrDZdp9e24aE/3TjBUJ2mSeOpJ2A1nJKxnrF9+iJvuReBCAXgpr/W5C
	EDblGfNA17Y149IBpDhi+qTmvTPxd60pf/B01U7DPlIvhiIBu1erWusUeMEqRM=
X-Received: by 2002:a17:90b:4f8e:b0:3ab:d26b:c2e9 with SMTP id 98e67ed59e1d1-3acef1451d2mr3420740a91.33.1792295517163;
        Sat, 17 Oct 2026 20:51:57 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:4569:b311:f3ea:5f8d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad25d5d1b4sm253024a91.16.2026.10.17.20.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 20:51:56 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Barry Song <baohua@kernel.org>,
	Bo Zhang <zhangbo0325@gmail.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v5 06/13] zram: lz4hc: use LZ4_decompress_safe_usingDict()
Date: Sun, 18 Oct 2026 12:51:08 +0900
Message-ID: <20261018035125.3120704-7-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
In-Reply-To: <20261018035125.3120704-1-senozhatsky@chromium.org>
References: <20261018035125.3120704-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use LZ4_decompress_safe_usingDict() in lz4hc_decompress() so we don't
need per-CPU LZ4_streamDecode_t anymore.  This also lets us drop
struct lz4hc_ctx and keep compression workspace in ctx->context, just
like backend_lz4 does.

Using vmalloc(LZ4HC_MEM_COMPRESS) instead of kzalloc() for cstrm when a
dictionary is configured also avoids power-of-2 page rounding (~256 KB
rounded up to 512 KB), saving ~252 KB per CPU.

Acked-by: Brian Geffon <bgeffon@google.com>
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/backend_lz4hc.c | 70 +++++-------------------------
 1 file changed, 11 insertions(+), 59 deletions(-)

diff --git a/drivers/block/zram/backend_lz4hc.c b/drivers/block/zram/backend_lz4hc.c
index f3656c27af21..b62736b26622 100644
--- a/drivers/block/zram/backend_lz4hc.c
+++ b/drivers/block/zram/backend_lz4hc.c
@@ -4,18 +4,10 @@
 
 #include <linux/kernel.h>
 #include <linux/lz4.h>
-#include <linux/slab.h>
 #include <linux/vmalloc.h>
 
 #include "backend_lz4hc.h"
 
-struct lz4hc_ctx {
-	void *mem;
-
-	LZ4_streamDecode_t *dstrm;
-	LZ4_streamHC_t *cstrm;
-};
-
 static void lz4hc_release_params(struct zcomp_params *params)
 {
 	LZ4_streamHC_t *dict_stream = params->drv_data;
@@ -65,61 +57,32 @@ static int lz4hc_setup_params(struct zcomp_params *params)
 
 static void lz4hc_destroy(struct zcomp_ctx *ctx)
 {
-	struct lz4hc_ctx *zctx = ctx->context;
-
-	if (!zctx)
-		return;
-
-	kfree(zctx->dstrm);
-	kfree(zctx->cstrm);
-	vfree(zctx->mem);
-	kfree(zctx);
+	vfree(ctx->context);
 }
 
 static int lz4hc_create(struct zcomp_params *params, struct zcomp_ctx *ctx)
 {
-	struct lz4hc_ctx *zctx;
+	BUILD_BUG_ON(sizeof(LZ4_streamHC_t) != LZ4HC_MEM_COMPRESS);
 
-	zctx = kzalloc_obj(*zctx);
-	if (!zctx)
+	ctx->context = vmalloc(LZ4HC_MEM_COMPRESS);
+	if (!ctx->context)
 		return -ENOMEM;
-
-	ctx->context = zctx;
-	if (params->dict_sz == 0) {
-		zctx->mem = vmalloc(LZ4HC_MEM_COMPRESS);
-		if (!zctx->mem)
-			goto error;
-	} else {
-		zctx->dstrm = kzalloc_obj(*zctx->dstrm);
-		if (!zctx->dstrm)
-			goto error;
-
-		zctx->cstrm = kzalloc_obj(*zctx->cstrm);
-		if (!zctx->cstrm)
-			goto error;
-	}
-
 	return 0;
-
-error:
-	lz4hc_destroy(ctx);
-	return -EINVAL;
 }
 
 static int lz4hc_compress(struct zcomp_params *params, struct zcomp_ctx *ctx,
 			  struct zcomp_req *req)
 {
-	struct lz4hc_ctx *zctx = ctx->context;
 	int ret;
 
-	if (!zctx->cstrm) {
+	if (!params->drv_data) {
 		ret = LZ4_compress_HC(req->src, req->dst, req->src_len,
 				      req->dst_len, params->level,
-				      zctx->mem);
+				      ctx->context);
 	} else {
 		/* Cstrm needs to be reset */
-		memcpy(zctx->cstrm, params->drv_data, sizeof(*zctx->cstrm));
-		ret = LZ4_compress_HC_continue(zctx->cstrm, req->src, req->dst,
+		memcpy(ctx->context, params->drv_data, sizeof(LZ4_streamHC_t));
+		ret = LZ4_compress_HC_continue(ctx->context, req->src, req->dst,
 					       req->src_len, req->dst_len);
 	}
 	if (!ret)
@@ -131,22 +94,11 @@ static int lz4hc_compress(struct zcomp_params *params, struct zcomp_ctx *ctx,
 static int lz4hc_decompress(struct zcomp_params *params, struct zcomp_ctx *ctx,
 			    struct zcomp_req *req)
 {
-	struct lz4hc_ctx *zctx = ctx->context;
 	int ret;
 
-	if (!zctx->dstrm) {
-		ret = LZ4_decompress_safe(req->src, req->dst, req->src_len,
-					  req->dst_len);
-	} else {
-		/* Dstrm needs to be reset */
-		ret = LZ4_setStreamDecode(zctx->dstrm, params->dict,
-					  params->dict_sz);
-		if (!ret)
-			return -EINVAL;
-		ret = LZ4_decompress_safe_continue(zctx->dstrm, req->src,
-						   req->dst, req->src_len,
-						   req->dst_len);
-	}
+	ret = LZ4_decompress_safe_usingDict(req->src, req->dst, req->src_len,
+					    req->dst_len, params->dict,
+					    params->dict_sz);
 	if (ret < 0)
 		return -EINVAL;
 	return 0;
-- 
2.56.0.176.g3575e65682-goog

