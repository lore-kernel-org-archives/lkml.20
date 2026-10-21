Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792550585;
	b=dhHHjSSp2GDtMhmk7q0l/blkq6xxwua/1Mw8XP3Q0W7NHia8t843E1oPOWXwu06tk+zs
	 9Fizuu/7E2QE05QarNDq3Gr7hd5/ix3ZMJQz416kuxx0EbKjC+PyQLHHKYW6nRL+4NrqI
	 gPFydEAhWuE6DE/dw9clnxoyj3uPiyhQgv1UGH+uAgrpZK8LHNxbRlyG5dCg3hbLQ/C1M
	 8krI7WVPipSzKzmLx5AZF3PJaQtHd00JByflw5hs6SR69KeYdRtZPSIiSNXwtQP2zOTjK
	 2VDRik6jzhNBETmaTBavB2kof2/Xem6YFVl9qcgiFTYca0M4+tAVOReAnD1fAy4+x/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792550585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yzRBudk57Qqbwf1gK+hPpqIGBBSPqnwfDQYwkBHugqY=;
	b=x3xNgtpQiIbe67EHAVhv7M08wCSS1pv8CwjhXYTZt4A+UbCfOOGBB3bue6fo6jVPUpts
	 XL0FWnHyzOm8O8zhaUh0OuQtZhzZsB6ZEWDHlFUTQAp1dqZlw3sdpa+im/faQSLtKTEfz
	 06sBLTrLA8mxvk1a8m6WJh5jGMj6vIW5I6y9hWHKJI7HaOzCXl/sb3Q3xPiob7/oU6DV6
	 ILQl9/9u0/QpQo+2bVpJjlP2m+zZ5vwgu1k41hwqifXK0oKaBCTOtfrw+AQOyMJlYJjwF
	 87cLaW2f1txIXT6yqfTXhY3y8R7P4PNQtGlyiu7lkNbdljFzRIkiK6a4KNDY6C+06Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HJ3Lw7Yf;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7773B60A2603
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:43:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7773B60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HJ3Lw7Yf
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15354aa70e8so778475c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792550583; x=1793155383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yzRBudk57Qqbwf1gK+hPpqIGBBSPqnwfDQYwkBHugqY=;
        b=HJ3Lw7YfwGBoTvGBNw8t0sKdOHgcxhoWn17MW+rRnlh6TCkYg1s7GwD+aFp+VUqdct
         rZtZz3KL76MnGz9K+VPfX3ciZX+9WDxel4m5iZrFcn7G4rC1NEPBN7Q/NGweaeSP5JP8
         9/Q24LojPDD40DqWiCL2vIBKwsbKdKBsaRbu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792550583; x=1793155383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yzRBudk57Qqbwf1gK+hPpqIGBBSPqnwfDQYwkBHugqY=;
        b=zCIcvW2gJCGuZl2RTsv3KaWSzvL/pASgdOv4wQ9YCJl70CCXUVhTKDdzEnBHIoIwXP
         uZauznmZhwt2RczWH2+isjYV/jGzWPWfZ4lDX9ZWlYOqOlsorw283ZPwG00vjg+LYToE
         XyXxUY8qvxAGXZVT0uzGVugZcXraXItLbFXF+u/868DDNKom4c3BktnfiQrE3NCkQ/b3
         DOJYXCKnnuK5/XP2328MON6mBlDTSe1GmU/7ZSfizknet3+fLWKGpb7rtNsiDRbvTNK/
         PeU9GXE+GbSNxEX0+E0OwXSc/wcVr8G22soUbimaw8LDDiLRsUnYMEVBeV9A0rgDRk2y
         ubZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXUztEQajfNDGAFj0ftmBCqii/n/XhUTBFpL9n0nRWz+fOLyyzJy+ns0dzogdAvNnNy2/SbXgh1SXC17w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKi6LpfS5Vy3UM3unsz83DpQtC7RKL2R7ThI+gldNlZgeklk6Zf
	CrP7ylTwg2pf8fOqyxLWQueQePqrtZGNt/8Ju4NzS2KbVJbcYQ4SenqVaEpqyV59Qg==
X-Gm-Gg: AYBFou39uyAid6culsLWyrdn4xHpC61k4/IlVs3/cqgdnHLCCJC5qHLjUN5E+y2cmqm
	0gRvrTqlw2q36t3SrSsmHGwLoJbhHdTNjwQBPpctFhPuA3eYBCDnmsCSqt+Vmio1b9CoFpokx0b
	G2Gzz2OgivmzRzce5Co3USkt3wCKsRuYDYbZ+ojBjv2oAhU31E4oN8mfjEpNq6lkOzgxNNAX+FO
	dT3jErSFALgMcE7bxLlH7IA6DAYRQi0DBoApjtuiSKDZThKWKNpIqfjDimOjuVgiFFRH/I8ICeZ
	BO8T2Y3e42/4LMc5TkiNiEIageVlZ/UuXDDVJ8vRuCbAGFF/RN+1x4MMA1eQnnzgnyi6K7qVtjH
	4jEXqLTSFwPaMciY4XbVns8Lh6F3KspbGJrO/WEbkROMd52i2VGpB1rMSKENLyETpYDl6qpY8ov
	iGYlztuL/ekW26ljksQp9iQDBqI1CbrfmJdwdwe20L4WUvLx+KRQJibRi4UxMvpLOpGuxH51XBH
	Zd46Rt0dMA9i0lHX9TW9+eOl53hA64noY9Dr7uCMqIpIRnkLX9visSZ9jWhUyWg5rif62UHHcvI
	kOAfEi8rizbK7Y/k8uNW2rsP+sKeL+tSdTaVYMyuCrsJPxmXFVfh4FH8JqlXNfJe4w==
X-Received: by 2002:a05:701b:2402:b0:187:eb7f:bb4 with SMTP id a92af1059eb24-190a794290fmr879686c88.46.1792550583525;
        Tue, 20 Oct 2026 19:43:03 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:97d1:a8be:236d:bf79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm2392047c88.3.2026.10.20.19.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:43:03 -0700 (PDT)
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
Subject: [PATCH v6 07/13] zram: lz4hc: use LZ4_decompress_safe_usingDict()
Date: Wed, 21 Oct 2026 11:42:17 +0900
Message-ID: <20261021024236.1787884-8-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261021024236.1787884-1-senozhatsky@chromium.org>
References: <20261021024236.1787884-1-senozhatsky@chromium.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
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
2.56.0.212.g129ede20d9-goog

