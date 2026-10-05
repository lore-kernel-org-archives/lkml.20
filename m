Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBCB47FAFF
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 12:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791202883; cv=none; b=AAsYpGA3F0SYpIFPAYghC7KluqGuQKIXZfXpZnMOOEOZOr1YoqvEL40rRPjNQ8ehLISti63OdPC5sx1gKif06mPHMxBR1OgWhvEXSNK8KCz60WuK4117d58iTzKyx4sobsEGpfbzWTxaNWSqEqi46EaN503gnbrNKa5zjrO27BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791202883; c=relaxed/simple;
	bh=lBml+U1eFhDx0wepMPRnl38IF8v/v+UY2aHg/ppLZyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iYNJGE2oNT4Q61qp38SgYxg0XfLwTebb+gwVbn6s2oD3haPHPa/8nFPu/Jb9YNOhDSxHPpg2VT5ZnuKorEjm4BueYFpQ3Emr9Wkp7ftf3bzl3h0XWbdMPsQs6J9zNA7e5xwpRs33WxXt6DwCDIIHeeoRkeWUVQyloQrUrnUrLf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Y8TTX5ze; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y8TTX5ze"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc797656e36so362651a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 05:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791202877; x=1791807677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0qz2g+oCCXDG8XSKh0DkoVq9FZFfH7mkIafQRkfkoYY=;
        b=Y8TTX5zeTxNdlryzp64ax8noFeATPcBh+9yZGDXtCgTSZg4aaF9pL8V//yHPOlTl6C
         u1nA7DxWvImVUbbPLtAiaeLxGw3WueC6mgNhmJQY/iY48tO5Fo/85a4WUIYQNtXHFOL7
         2cOfVzvkzlkjZyP68/1UgowJqP6/QQ3L3prqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791202877; x=1791807677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0qz2g+oCCXDG8XSKh0DkoVq9FZFfH7mkIafQRkfkoYY=;
        b=jQoCbk5Pl4oPyO3hfrxAIB4JYCDD8IIUTTi1qpkGDtOC7YOHQe7ZrlU3Mh4GcH3dY7
         6H2/qp0DFOVkcICsjSFzU7MIzuYhsYKBzHG+CmNqNDM2OQ6tPG35Ud96fg3vgnTGkaSD
         E9b3YrrrFeyViUWjsfttIDDV51PaUagx1ottikKVAM5gde6fYt9tKta1bQqcaVmCcuiP
         MvQ8IomyPlN8w7AN0c2Gnk3aHFXPwwZuU1rpPDiAVPPMRdgyUNknDhOigKOW1uHpxOB5
         WgzolUoyWqAUwIKhiG5bV6hNA0jm8ZajhprY1ZbGwmjxJbkBpUXj5oe9LzLlDgQ4DCVt
         qlNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcai8t8uRKyS3aNPJnz1C1LdFTTTiNfycSN/50ef5/Yd8WiIoWeGmtvCxBdmudtA7yHKLRPz7qiTyVtWY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcBonCjXz4mWiNSIHJG7aCVZIYes9KK+LmEcUbnMIp0KeNGTu7
	V9lJwl/l4seaisZ8BteZSYBsTo2FajuE+M7C+VN8J0glVyxJjbngZz/zvSgzbnBdoQ==
X-Gm-Gg: AYBFou0B89yycCTLVLGB3GsIYtOmi9mBd8GTGEFGaLUzFlJJkX3dt0aC3RGCYosvygL
	GZ+V/m0IgmJ/LfPJXPXsNiORyiuz2xxf6B07cGaw1ieHwwzA0Xzhhq1vetPR/9PsnWN1KPo3Qkb
	sU3od6YSl0XxY1lxU1TLZzUzddXUwtVG2ApXgSUTVjHkCetOxypzKhYlrG1paTBxFv7s8hKRrW2
	ht76smQBO+18q27Bwpng3bbV+8pRgLOjkSPoi4ZgQdCAs0S0RWrwruzs5dLSEg6GyirqBDRhmxV
	OYNEqw18EAxXP929DONV+pDlonbmW/Aznc4EA2/Q75ExaGTvjDV0ofa72vtbpchbEf0hyFKSWS7
	InZWDxjwhBcCU6VbRY8ohLld1LjjPIi0L8YoaPJ0qI+81xplEOjgUY2VfzDEyj5vJAJv8QDDuV9
	fEUU67raJZIKBGSP0mbgWVGa2yeLGSp9TSSuHDvXCShtgeXrPBpZGUHY/RxD6Cbd+FcmMOGQcyV
	eO/+8rSpChCf2AXZa3guKZYvEq1i/7d0A8g3pCy9qgShXqf5UUG363ooxQKc4C/5+IzIDKzpQ==
X-Received: by 2002:a17:90b:1a90:b0:3a0:aa50:48bb with SMTP id 98e67ed59e1d1-3a6ce79881bmr4533629a91.29.1791202876826;
        Mon, 05 Oct 2026 05:21:16 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:9211:ddf0:3c6a:bf9e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7e4b00de6sm3342997a91.1.2026.10.05.05.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:21:13 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH 06/10] zram: lz4hc: use LZ4_decompress_safe_usingDict()
Date: Mon,  5 Oct 2026 21:20:21 +0900
Message-ID: <20261005122036.718976-7-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20261005122036.718976-1-senozhatsky@chromium.org>
References: <20261005122036.718976-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use LZ4_decompress_safe_usingDict() in lz4hc_decompress() to avoid
needing a per-CPU LZ4_streamDecode_t structure.  Drop struct lz4hc_ctx
as well and store the compression workspace directly in ctx->context,
matching backend_lz4.

Using vmalloc(LZ4HC_MEM_COMPRESS) instead of kzalloc() for cstrm when a
dictionary is configured also avoids power-of-2 page rounding (~256 KB
rounded up to 512 KB), saving ~252 KB per CPU.

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
2.56.0.rc1.315.gc6ed9934b7-goog

