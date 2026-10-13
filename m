Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8329447F772
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791863544; cv=none; b=nAfhQQfU2cRSejNrqJmkXvYxe4vr8KNdgGrCCqyWJjdjFDmdtyC4qhzsX3fwoiGd4YWSXiOpfKfEjv8iaapejKaY2j40uNfB43jw3SeVpRWxRa3QO7NOzQAHMsbdDXIZ07+1Ujmf7R5Dp+KbOdY+E9QNpQcWINqIEYMoVDZzBzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791863544; c=relaxed/simple;
	bh=DYuppku4rT7n6/3sKP9lI86/iAOWCanZGZfg+/o8eak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S5BugOB4PFPFRUT5BlO57AqhcuXy9335+qC5DJYWAepgBMXjazInjwIvtLW8t7XMPS3JfZoRhVmBOwlsqsTnScN2jf9i8mdiMcveiAiYwBiTGe6RoZNWgdFpHz5e3SZ7GcZwdPeDsSnUSNCGJn6rBXA9jlIUaf2afM8pfLOnrGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=j2/3uGa1; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="j2/3uGa1"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-887a58523e6so586835b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791863543; x=1792468343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fG+ZRnn0wXsUMGdIWlrdX9yA9C4/sFFG7BBKDHx8FEs=;
        b=j2/3uGa1P9VTxkH7xXKQrGC29E7hS0v5f1VxQmt3aLjHz88KVGigPwlGfL+bHypWtO
         8nYsPhBM4pQhKXnSOHu6vYHTpBTjf3iJK+mgQYjXbkpgC139eGV5PgK1Ys/ZZ2yY8NeE
         UIAfEYR7zpIbHS8m3sNMuOkQXX3t2O4G4Jy3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791863543; x=1792468343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fG+ZRnn0wXsUMGdIWlrdX9yA9C4/sFFG7BBKDHx8FEs=;
        b=vVecfaJ2w64fr44rrJT053WCrUdM5g4t84nTys+BevBatTjQLlFv6DAsGol/o6dAc6
         2+328vXEig9IpqJnntZFbpbiqN7f5jFAL9TPxa7CdadcYc4RHPcAizG2yZqcPFXFBme2
         yc7uBdGmNUxJ1jpo8CBHkB4FYiGw538g1ZAmZ3soc3RaMgXLAepgsdWz1/3hKoSahxT5
         IHI659TAdmh1Q9CPUZcBWu+9vU4Le6GCjEZK/ZCGIC3DVFKoOzDPcargUmljeVvCyJdh
         jRpZZAFBtG67agwrilauLL7QxuhW4A7hEWIDJSIE3w1OF1AcgtQ/BCwnie7skhwvFSM6
         VTpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFvzaSSiWIkhC5v7GsHEuh8YK7up0BAuMKf6XDHuhR7fOUs+wK8/21i5mE3K7jG67iYxmkp5VLEifHOGs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhSHTtU1WuvKbQYxfln3fgERNBVxrQMG18E05EegNfIPTyDEvt
	vpk8u9+sY0C45066QXtZsu/2SZeJMGh+1xqHH9ZTsCa4mLGfhK8K2kQQKH2r6H4Gfw==
X-Gm-Gg: AYBFou342JcS62NFDrQ4cN82v5R63WdVYL1etG3M1YNAX8pctO5aOXiLLogRDBGrMB5
	ALPh96F+hCKh9aqXijBL+MqaKWwfNMAF6MX1zbnfB3DJrZUdIGqnB5Q/+VrrINyw1C0F9tWzKcI
	p5fRcjBjrWKXgyUqIWM5NC8YNy9OgMIY67oByrXjFqXdnyNmqBmM/KGMpzAsaikY6qgnwst8g3O
	f3aN4ukbGVXO2wIK5Avgxrog7HE7SOqJ5gsFNQ2K31ZMY8q4BKZHIbBdx70tkYhUetRHuFNreI0
	ory4dQef4dovnphsveIBwkB+c6yTS810vQmVGYkIMEhIeUlc/6L7SAuLW8CwwMQisc2pdCF/IAv
	aNSLZ2yhrCsHJCNZ2HE5p9vaEkPhKcnYR3UvLuyyG0VxPetST6LaQSfW7yvsL9PDvY4QHim/6DM
	yyV0VvYsPWhcuBzcNQnBP40V0Stv3Ferhbm5v2XSSrel095UC3l0RktJKkrewlfy97okEKl/qVn
	55NHb1/6/jSJsovO6jTpdvbvX84y1CqkmK6ncPRvkmAKuLkqtcEP0UWh/bkeA==
X-Received: by 2002:a05:6a00:1591:b0:898:e7e7:c0df with SMTP id d2e1a72fcca58-898e7e7c34fmr5110419b3a.45.1791863542893;
        Mon, 12 Oct 2026 20:52:22 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:476:d384:7c2e:1579])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c41bbb27sm4326818b3a.40.2026.10.12.20.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 20:52:22 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v3 05/11] zram: lz4: use LZ4_decompress_safe_usingDict()
Date: Tue, 13 Oct 2026 12:50:52 +0900
Message-ID: <20261013035201.2809924-6-senozhatsky@chromium.org>
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

