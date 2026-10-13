Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A4648095A
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791863547; cv=none; b=upU+ouRbgTKQ6906aClRkORDbLKzIo9F5hxfL1h/jn5uQj1mApbQkh2HfDoujctPHLKDjRNEjj3FKBMjSt08l22rvdPTUdtYrZ5z3HWCyzU3Kgo6bK8uqyE2L9LbAIaLvdq5/DQ+I7DveN/CpzsGcIq+47kjbMryx7PVZ1w98ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791863547; c=relaxed/simple;
	bh=TU+o1M2qUaATbEC3JOT57XdbKNrddPj6NB1S8xycGfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k/vleSKtk7768P7ArzeE7hloOxwpnDNuCmqQk/l2cF25mvildegz9yFSAYBBVLxfymNWIQGCvmUnaVY/cnzcQHrBoa1ybG6jxYD0MPJ0VnfMXnoM6CryPzZ+TCS2RxbWMUfhRXL/qiuSHAc0iuMU1SAmEB2+cAA+RHFwh7AXyTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jgdbxvVX; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jgdbxvVX"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-89a756e5d20so1779099b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791863545; x=1792468345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2vDwGnfli5YECfAaBIHPOmEI8frIPb+i30TwuUetq8U=;
        b=jgdbxvVXfLP7A5diXcx7XJkKcPps7Umw3b9hFkc+Z4ebiEeVmrLsNlHTjHpMPFJtzm
         jsSN+jfegGKw8Ea2gcIfJHIvYY3wlmBnfW0knzUDSC5sNVMEIV0MHD5mU8iLXOlM6zxr
         HIvxuqgziUDlO8JKJLrrecidS5mSYCwoOFBMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791863545; x=1792468345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2vDwGnfli5YECfAaBIHPOmEI8frIPb+i30TwuUetq8U=;
        b=Q2WQzmToRvGYq236jJBgCXVjpXwyEylnsFD/MhXJ5UNorDQXka6SHMCRZ2miOW7WWd
         +JRWkhxaCqrHo/wAmBNbpF3RYnTW2pX2/mg149ikOPaH6jqSIiLrRqR4b5GHQl0tMfiM
         uDfhlMoe93XJG/EHDSnxoIuKGruVT6Iwtdv0PfDhoB6uQA8D9kp5BJ8kNJV1KegOIwsr
         AKQDdlIPV2eiQJUKmuwdLt+zYkkm8b4TpM5mJuDAWW8zYQvKcWK8GeLWsMsYjiHttAin
         Uboebmw6JO9Dm3fMvg3L1iwK1H5aj28e/rpxFzxDqySAkZugTztrZE7QGpIT5elOgvpE
         T1CA==
X-Forwarded-Encrypted: i=1; AKwUvByawM828BjZ6zfBadRXF/Lauff3g1R5v8dFWCcktVgh9X6M3ZB4ypHS5cEiF9MY3bTvytPIvW1OLGri0xw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIq8gM2xmjUSp7Un0g9FzjNZvEdbwn+ip8o1UBVOEak5qz5ET1k
	KB+qohlx13o0S/ym2ApMtksKTdFCyozAyZ7fUDyspPWkr6NlD7OLuIatvWQJyR35EQ==
X-Gm-Gg: AYBFou1jWPZUFUoymQhu4grQSdYLe8G0HoWyLYmFEynDospgLSwoa4VedqbTPgkGZtO
	xJzqSL8SDU9jR0J1Wm8TQhj09n2xzxM5bUFU9JClGW/JzU7qhM1sbg19rGOfn1ItWf6r9vJiIMC
	jhCtKkONyqKioPHOVxn/I16lqjs44DSv/7RIhEJG1sZDvHka5bvwXWbeijZRaqemViMphfUdxdH
	48+wxGJIajXYzWNkDboCIEnlW58oDz/9COEbFjE23hz03oHTxOKATEYMblNT9qA3bxcC/se5xO9
	AoLirlxlL3Oa86DhxCoJax7teFPqbNtzurCDmybdm1sAo+RyQcjBjq75/zfCxr77d9iT4xncSfH
	QSkg4Jd0uhWgF7R39fzG+CFYUlkaxOeJcHQc1fp3b1XSSZjgmKyz88VL6YRNQyvi2AEL4GANlbe
	U0balMd1YFuH7v+nzEjyZh2IS5M76dfHMQHtz7LNtPgtJNDEQsvrDHyi8U58tjqYJBnT0kayPlB
	R2aXW7EuMUqpSLHrtOr2iED9OSV23OpRnHXe9ISwiAVSn7H6OO/f0Q1qsx3DJ71vaMPTRzV
X-Received: by 2002:a05:6a00:2181:b0:893:8a6:3801 with SMTP id d2e1a72fcca58-897c6c24863mr9821862b3a.24.1791863545329;
        Mon, 12 Oct 2026 20:52:25 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:476:d384:7c2e:1579])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c41bbb27sm4326818b3a.40.2026.10.12.20.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 20:52:24 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v3 06/11] zram: lz4hc: use LZ4_decompress_safe_usingDict()
Date: Tue, 13 Oct 2026 12:50:53 +0900
Message-ID: <20261013035201.2809924-7-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
In-Reply-To: <20261013035201.2809924-1-senozhatsky@chromium.org>
References: <20261013035201.2809924-1-senozhatsky@chromium.org>
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
2.56.0.385.gd3acb90ef8-goog

