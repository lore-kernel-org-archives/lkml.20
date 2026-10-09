Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7C23BF679
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791529953; cv=none; b=JTMvoPFIqXwef+fN+/89Hq+lX/nD3iJ7lpmPgnBKnyp6nSR/YraziS14lejIOBgMARpPbHzFTNVvA0uvTdy3MOYw6EbCMofUH9BmGTvo1NBd8biUU1MqV9SQZ77mOmqU3Jo6A6vQuB8of8/HNwuVbM8RZDJ5xE2zkQ5wDvg+90k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791529953; c=relaxed/simple;
	bh=TU+o1M2qUaATbEC3JOT57XdbKNrddPj6NB1S8xycGfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mTHdk0uPP6bSpUQzPQqW+00584g/ExWp9dJs9YHMN52F2j5MZPq+T/NA6SJMe9kXv12oRG9HZMc/K/h++q24IwX9Qaxh/Yf1d/DyJ9fhS1aejCKUd3GEe09mPK+qAUuxV/MQ9d1empph8ozLUb2Mzg1aFBPdLj6PAptEqRsCfUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jopL+qDh; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jopL+qDh"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e49fbf92aaso24518485ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791529951; x=1792134751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2vDwGnfli5YECfAaBIHPOmEI8frIPb+i30TwuUetq8U=;
        b=jopL+qDhK9LBGhHtk8jiVMEfVF0BO6Ed2xYCXEsu46NJ9S9pRE14s/YEZ0j5C3HH+2
         AlgqaJBsHZWLsz1VAJvzcc5iyD5yPOPsgCF/zOwaL1iXkLqbf7dPtD/0I151ihtXI3iS
         CCI2wbtYGi/Iyq2xGuncnE5KLjPtd2GXagJAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791529951; x=1792134751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2vDwGnfli5YECfAaBIHPOmEI8frIPb+i30TwuUetq8U=;
        b=1kTmtZxGa9uKVe1oT+/CaLB0GKYKw65lYU+Ow/3JPP6KOwNXTwT5Q4i8FPlCEI4QOE
         RQ+4ofrgQ1AE0ckKUs15/y423RKU2QL1tkJq4gCLYFZ77+1SkHExB8vqQse3MS8fd4Wk
         NOCkReopEh8G02mWkOmhhigwI/VwwBHBF1w8DMDAF8382fCEpnr9ntjJTnwDViQgCmDR
         gsQGSOBfrr3gv52RKJKK09rxJ8AS0u8Vyuod4A2lBtUjKxZZIwq+htZsl8O51W69UeBx
         Om6EGZMuqolLE2I666VHZlALlGiAyd/34r2DxOH7KhkXfLskG2HQhFbvA2T6d7MfQgkz
         yCCQ==
X-Forwarded-Encrypted: i=1; AKwUvByKKMe4WRG3rNi3wyrkHz9kK4y8mBYcDB3r9gpTJTd43vhviNO8CxnAG+u71jbs4rNmxd7eR4rChG9WfXI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5pPl1j0Y2TBwP/WHuHzprC0Z1A7K500+NfoGrtKffEfHQ2EGB
	na0oErNs62Ur9edl5XEPWR1EZ+QcQmoj2As862vCTUkXNBRkBZCzKr6ONHqk1dBO/kix54hvGDN
	qKhM=
X-Gm-Gg: AYBFou0YD6Dc1RFe2n9MYMhO5Do7HU+jT4dZKLa/V4Yawt2w/rcJ8rrcjzainUHWpRr
	Kn41/YUsud4ffH5VScUaECAMOkbinLMvFX3P0YMy2sEFgkDofoIrwpxytihSSnwQPY+BbfbUu+u
	Xq5G+huv14mgcdX8duqvhjGNAQkNqBCBm+r6jdhmbKiBteYIJJNHar6i5xAFAdnpvbJBNKup5PE
	FDLjzyxqXRGVMWI9/S/iAndzRh1gYK0VsoHXsurHSx34KSuPF2ZVLR/ohkn/BCumF7csdh52XOh
	KsWz7xffDiBT+s/qvdsQbTojmZJZsZnRMOe+tDsnZLNskhWBucdy9WEm+XoqlsvhaCy+5WezGav
	2QF9Rt6mgWwPQAxAejCWMZT/jWLeagIKwMpbySLa3Bu3ogXMP/QiRAVBAuCh2+nlfN8A/tiayNc
	0EjHTvaCrDELIRFcb47T0evJeE/aAt11FXH1vUASY/cVDDE4ggQk4a+VV9QoFXF2X5qHw6xcmwo
	CbuFpWM5OrHuS6/InsJ40Pw4KbgOfCWSRJ9wNYZtySFB8EWMepipdFpDZDMc/4=
X-Received: by 2002:a17:903:320d:b0:2dd:c100:7cc8 with SMTP id d9443c01a7336-2e842cd7525mr8918245ad.68.1791529951295;
        Fri, 09 Oct 2026 00:12:31 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:383b:5817:8167:5051])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b19a2sm4483535ad.46.2026.10.09.00.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:12:30 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v2 06/11] zram: lz4hc: use LZ4_decompress_safe_usingDict()
Date: Fri,  9 Oct 2026 16:11:29 +0900
Message-ID: <20261009071157.3730698-7-senozhatsky@chromium.org>
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

