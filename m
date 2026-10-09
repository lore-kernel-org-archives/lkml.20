Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63814734EF
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791529950; cv=none; b=GhUV19uCEB1jHGazZ4WLF9Y2VZ8Z1c4pwQ9DIvlUF3RgEZQrV1k8Z2gTkPHk2ZePqX5iBJ3yvRDvB699MBU/ftxfjM+sldgouXQ7N67tVh9mERukpHPQjFLniK6YqpUCvyk6ORthm65dRZyMV6SL/fsuViBxaO0G2PjnjRyvnVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791529950; c=relaxed/simple;
	bh=DYuppku4rT7n6/3sKP9lI86/iAOWCanZGZfg+/o8eak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TAZNkpW09clwAaijyNvJNM9IVk01gcWDTmV28Nh45j+5+8Sx2IAR1NTWKVtdLiSFhTa2DuTtcWjzadWUiXdC4iTDYL7fXitQ9Rd/oirDaE6Rep9vXBREqQyBqWUZWXiaT3zoFDBtjzIn6l8hhLKki7NGVlrBk5Khe1002cTbu/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EVxKL+N+; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EVxKL+N+"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e812e2b31bso8988505ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791529948; x=1792134748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fG+ZRnn0wXsUMGdIWlrdX9yA9C4/sFFG7BBKDHx8FEs=;
        b=EVxKL+N+nm9f6oY1zUTzjc1IE91+pI7n4ZirpqcVRBmAkOFBQdU+naj0lzvu+Fe5zQ
         cwevkxCtSN49oSV4+HePeQdNcgA9xq9xoacmEqjbKpatMuCcbyQFaM3FbnitWylm48jD
         PUfxJL84Wn8/mkzTHmW+MHV2bx3RcU0JhW4hE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791529948; x=1792134748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fG+ZRnn0wXsUMGdIWlrdX9yA9C4/sFFG7BBKDHx8FEs=;
        b=aNdz5IdIF6ITtRffYon8x4/VxeDfVKBfI5HFTmLxN4X77d7WuEa98Aobgh4hY59dFF
         b+YXSA52z2CpOPju4Z0M0uwVl6S/oVxYCOfF4Jxqo8/VUR41A0rsdYLfLvSvrhafAjE3
         DMk+WZE5m5DL0pv/NL5A0Uct3fFl7K7J24QErVhHSuT5KVulF95wF8CAcPajzuWYRhRA
         Lz8kF9qKagUWz8s773T2Oep1/qW+nRYCLXlsnLF0zMRAiRDR7YVi5h2vM2Iv27SNKwBw
         siweLW84YQpDmr/JZF8JFHGp4boNdIgsriZtWieoKXPGEzhwsWYbNYYrDpUFdFOTDfZI
         ab2Q==
X-Forwarded-Encrypted: i=1; AKwUvBx1t/6HIHOfn3ez9kKwL2Y8ReQnqOwUrmjVWUE4/3fmeS92oJB4Jy0SWvGdDYdFXhnTznmoA1IzxVie3MM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKP6m7H+zTKgc9lD032s8hlvWPsWGj70lSFBP/aVZ4NWqoRL/EM
	OoNE2HX74hHxdIHB22j8RBKee9s9/oSc/wnlKBFIwg/ImJeooT8Jvo02gvG9QfX8Ng==
X-Gm-Gg: AYBFou1S5G9YFUEuesVFlqzmcxG6xlDYOKIA8kzWcq1luMJyBw3n7cao8lPUdqQVq/o
	VrMgNhIO7uH2OCZud2UnROjszfB35qLGA/sXwYMzPTDxTkpMO29u4eD7ubhK8wuWRCXCxRiXrMs
	qAXm5PsLOUSe1FqJDiW0dspug1Lv1sEvm/vNU0JZKNdX59k5J/feJaPoy23bnTYWfsM07OKMSN7
	PJ1V2rD2la3PUAXAF+UwWp7850B+4IWd0pKK+UEUJBryEl3MikACsfVVhSUgEolHUGK5Xdhxc3W
	TsQ6PRz4w6Nf0yNvthYAK39Ggn7ylvg1CRfxXylyktWg6YC7Q3FPRmdXmPEgYmXU6X88U+G72xs
	S1L+bJGqLGlmLMywPywSHST/j60Dt8sMxrPg+N5fDQOtoPRrJGcoamr1hpqq+QNHw3vALc58Dm4
	RS8ixIsS8+s+/VUyhBWru5W4vcZA21SzFxSodOcZhT1D3hYYpX139wAGLwIXygg3nZCIrQTSX8l
	kPQUjk/PSchXhgSGMZrDhszZyBEY+9+L27vb+D+9vd6RnfiQ/wKmEj9+n5Lpfg=
X-Received: by 2002:a17:903:1b68:b0:2dd:c100:4b77 with SMTP id d9443c01a7336-2e842ce7f76mr7930965ad.46.1791529948194;
        Fri, 09 Oct 2026 00:12:28 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:383b:5817:8167:5051])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b19a2sm4483535ad.46.2026.10.09.00.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:12:27 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v2 05/11] zram: lz4: use LZ4_decompress_safe_usingDict()
Date: Fri,  9 Oct 2026 16:11:28 +0900
Message-ID: <20261009071157.3730698-6-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
In-Reply-To: <20261009071157.3730698-1-senozhatsky@chromium.org>
References: <20261009071157.3730698-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use LZ4_decompress_safe_usingDict() in lz4_decompress() and drop the
per-CPU dstrm allocation.  Store the compression workspace directly
in ctx->context.

Using vmalloc(LZ4_MEM_COMPRESS) instead of kzalloc() for cstrm and
dict_stream when a dictionary is configured also avoids power-of-2
page rounding (~16 KB rounded up to 32 KB), saving ~12 KB per stream.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/backend_lz4.c | 76 ++++++--------------------------
 1 file changed, 14 insertions(+), 62 deletions(-)

diff --git a/drivers/block/zram/backend_lz4.c b/drivers/block/zram/backend_lz4.c
index 158fd8b5e8a9..5f2e27805d75 100644
--- a/drivers/block/zram/backend_lz4.c
+++ b/drivers/block/zram/backend_lz4.c
@@ -4,18 +4,10 @@
 
 #include <linux/kernel.h>
 #include <linux/lz4.h>
-#include <linux/slab.h>
 #include <linux/vmalloc.h>
 
 #include "backend_lz4.h"
 
-struct lz4_ctx {
-	void *mem;
-
-	LZ4_streamDecode_t *dstrm;
-	LZ4_stream_t *cstrm;
-};
-
 static void lz4_release_params(struct zcomp_params *params)
 {
 	LZ4_stream_t *dict_stream = params->drv_data;
@@ -24,7 +16,7 @@ static void lz4_release_params(struct zcomp_params *params)
 	if (!dict_stream)
 		return;
 
-	kfree(dict_stream);
+	vfree(dict_stream);
 }
 
 static int lz4_setup_params(struct zcomp_params *params)
@@ -42,14 +34,14 @@ static int lz4_setup_params(struct zcomp_params *params)
 	if (!params->dict || !params->dict_sz)
 		return 0;
 
-	dict_stream = kzalloc_obj(*dict_stream);
+	dict_stream = vzalloc(sizeof(*dict_stream));
 	if (!dict_stream)
 		return -ENOMEM;
 
 	ret = LZ4_loadDict(dict_stream,
 			   params->dict, params->dict_sz);
 	if (ret != params->dict_sz) {
-		kfree(dict_stream);
+		vfree(dict_stream);
 		return -EINVAL;
 	}
 	params->drv_data = dict_stream;
@@ -59,61 +51,32 @@ static int lz4_setup_params(struct zcomp_params *params)
 
 static void lz4_destroy(struct zcomp_ctx *ctx)
 {
-	struct lz4_ctx *zctx = ctx->context;
-
-	if (!zctx)
-		return;
-
-	vfree(zctx->mem);
-	kfree(zctx->dstrm);
-	kfree(zctx->cstrm);
-	kfree(zctx);
+	vfree(ctx->context);
 }
 
 static int lz4_create(struct zcomp_params *params, struct zcomp_ctx *ctx)
 {
-	struct lz4_ctx *zctx;
+	BUILD_BUG_ON(sizeof(LZ4_stream_t) != LZ4_MEM_COMPRESS);
 
-	zctx = kzalloc_obj(*zctx);
-	if (!zctx)
+	ctx->context = vmalloc(LZ4_MEM_COMPRESS);
+	if (!ctx->context)
 		return -ENOMEM;
-
-	ctx->context = zctx;
-	if (params->dict_sz == 0) {
-		zctx->mem = vmalloc(LZ4_MEM_COMPRESS);
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
-	lz4_destroy(ctx);
-	return -ENOMEM;
 }
 
 static int lz4_compress(struct zcomp_params *params, struct zcomp_ctx *ctx,
 			struct zcomp_req *req)
 {
-	struct lz4_ctx *zctx = ctx->context;
 	int ret;
 
-	if (!zctx->cstrm) {
+	if (!params->drv_data) {
 		ret = LZ4_compress_fast(req->src, req->dst, req->src_len,
 					req->dst_len, params->level,
-					zctx->mem);
+					ctx->context);
 	} else {
 		/* Cstrm needs to be reset */
-		memcpy(zctx->cstrm, params->drv_data, sizeof(*zctx->cstrm));
-		ret = LZ4_compress_fast_continue(zctx->cstrm, req->src,
+		memcpy(ctx->context, params->drv_data, sizeof(LZ4_stream_t));
+		ret = LZ4_compress_fast_continue(ctx->context, req->src,
 						 req->dst, req->src_len,
 						 req->dst_len, params->level);
 	}
@@ -126,22 +89,11 @@ static int lz4_compress(struct zcomp_params *params, struct zcomp_ctx *ctx,
 static int lz4_decompress(struct zcomp_params *params, struct zcomp_ctx *ctx,
 			  struct zcomp_req *req)
 {
-	struct lz4_ctx *zctx = ctx->context;
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
2.56.0.385.gd3acb90ef8-goog

