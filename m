Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792550582;
	b=EcdvxJqEYcoDp2dqpyRx0om1XjXFFLTZLiQDBXv6EpHouZCwn5RSnmerkQnOH961Ur/5
	 HgG3OSeW7Y5Pk7+/j0HGEguKABhpy2EWO/060jRVF+GW8Y6I2PVo8dfN5B4MprzAH6ijo
	 URquM7lurlW3bJ4pZWEWgt9X7yj9Vu+zcPzeu6nV6k+ccEMjcQBX2EFw2EVKNsnHSOg26
	 YSNeg4U5Kp6I182vAs/KvJCJN+Nc8l2ZZUlpKVY48/Q7l5khs7YEXQ2X6paKi0wxqV+j4
	 Sk1bNV61tIG0vB+AW/3hW1cmyHhhYJkc9w2lKuQV6fk9mH3YK85XPtQNHfb3lukBxKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792550582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iK8xJeVT2HjyR4JlAaVJiBB2ezLNdeGOL3THtl93coY=;
	b=rIe/dhlc0JRh0iIcTg044x5qvVXFgqG+P8Ver+oEgPyBJ08KDT85NhRQi8BKWjyoedYm
	 vbK0i3Vmu2pMeq7moDrjoxMelQkRKl13taJzwhevvJCc11zA/2n//L7XVquIcZC4I7H57
	 qvIePSCLyQt5c0fnv3HqyyGLSKB3kixZ0AazID+xIk952UXwftrdsJTE6p+PGysVxIj0E
	 jY/UKDbRFDpNDp5KLPVdyhThEtGh8ou1dt16s7K0SopKFAedRGHVoGyw3zgDzy68cFSA5
	 G/a7a+QigeTwMVJqr6EOXKtbxO+u17C+PJja4QhBtEhW5bl7s+VQSEeD/gUMhdxXOUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=TrQYpZtA;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B2C60A2627
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6B2C60A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=TrQYpZtA
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-15ea896ddc8so346952c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792550581; x=1793155381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iK8xJeVT2HjyR4JlAaVJiBB2ezLNdeGOL3THtl93coY=;
        b=TrQYpZtAdhdUAHxLtUOlXS/NNMuGm56WCkDzVmerEs+RbcNCzVdvaMYSjbS8XruX0I
         +xvo7u8prZh5yauRQgkNgcIxxjD1NQl2mrADpwU3HcYt+pUlyMHa48CjfzUL73vo00a8
         ERM5RU0lqUktr1GowYh7nro3taLA9mXtpj2uw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792550581; x=1793155381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iK8xJeVT2HjyR4JlAaVJiBB2ezLNdeGOL3THtl93coY=;
        b=ouc/w3HEkTgm3wUK2uwgLegl1dZKYWcET+VZyvAMg462X6LWsOtwOFHlI7KGZRiEKu
         XYBSkz6t8Rl9nHjkuqiElK9oflhLBH/nUCVUYjAHMvy/1X+bkn6MegtFY0XfpqwdGOiQ
         0BrZEs9/3ej0YQZTlBEE9x/CbWySaV99LQulbYVV55ZOWs4S0A+kHrh2rZ7ic2hNSsNY
         kodn8/mE3jQZnBGuAKEYOX/eoOeBzJ4qUFBjLyaSKWXYBOgOXKdxoGLfKN1r0q1VQP5f
         bqZdiZWgpgGj9UU4RSbUEq0PEYRKoYIwkCXZu7XSac1rcYNUdjsPzEwAPRsaNVnW26wj
         yy3A==
X-Forwarded-Encrypted: i=1; AKwUvBxAor5CGjxAARBlvQwswosHtspD4MzNv1i1CnMUibJegEXDB6ARo/3qA30YZDxxlHujSe3u8Pwmn0zDS7s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/4rCF6XMAK9vIEbpZrcxPd+ZbRV1AO86oo8d5ltHoBI8DFtb3
	d/VTP1D2+U8JQGkXtfo1XZRslCus81ZSfqtU6H1EnqeH7M5P+4YfFyjyTRaYatOJZA==
X-Gm-Gg: AYBFou19kJ1o2rReUwYe+u6iBown6BFkARttxxqLPHzUSdZRG5TBj2sADL7ryMDzMOZ
	Y/SY8o4AQ/Ib+LOGIACQIO6hupwzVdsnb1xorkf7auIyJGsn4U3VZ6xCAJBDmY/Vlrj9Kqok7o4
	iJd1M8ZRk7sKwQ4rGCk8k11erUfc1GI0SQjW2OIq2fm0afiSNEAXcYOJECOOYErkEhJHNI6t/1w
	l1m750RC8lRerbpV9YliNv/5+8KNTYUWxooHZfntJ5ETu2bBX8oIr9MCIfxEvhImZH8heizIdEU
	KqL0xbe67q8YOaIQKIdi2Awz0Be8NLEtRy9FQtdIkaXmVDKuZ8rjX1NBxCGBewUQHsLp5wyQygo
	Bmr6PDDH/Hr9hle8IbiWfM9+L59FxSWTQ3jvqWZfG19KBI3OvZTnA/D2EBRbtyfBxICAipUPKrY
	TJefdChtQE+PaEBUOxB1Rg5tZOjySBROL6wHGkma4TDoysUm2FnW2p+QTROQ3A9y01OJ76brP8F
	INCsMNES05dQ3gYrn8rwdpriaon3rd5qIRzaj95qD2MC8lg5EFkJbdYrB8xo7N0+d3++tylCcDg
	g52xiRX0Bbc/HnZoEGLzKvBpARj744fbV771Ao7vY7sB
X-Received: by 2002:a05:7022:b905:b0:143:2968:564c with SMTP id a92af1059eb24-190a67fa14bmr804644c88.26.1792550580717;
        Tue, 20 Oct 2026 19:43:00 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:97d1:a8be:236d:bf79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm2392047c88.3.2026.10.20.19.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:43:00 -0700 (PDT)
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
Subject: [PATCH v6 06/13] zram: lz4: use LZ4_decompress_safe_usingDict()
Date: Wed, 21 Oct 2026 11:42:16 +0900
Message-ID: <20261021024236.1787884-7-senozhatsky@chromium.org>
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
2.56.0.212.g129ede20d9-goog

