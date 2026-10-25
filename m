Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792894744;
	b=Q5UarXUBetW/5HjHow3YMNshBMlhmLh9XwWm7IOdn/OIxXMZGyitX7Ay1aBFGckVQ0ZM
	 PHJbTzRaxoThqtau6PP8+Mfcw4c8fUH+PqxyfDZUmRWyV8f0Mykihm2eplFfLUgCN3ZVH
	 1kZHnA/26vZDEI4SGnLzx31j4qzotjLbEQ2AApAq3ZrvhXZ5c0k5gHRGrDYoBbRG1ZOhZ
	 /fYHWGxNfc4EIVR5miTYNU9Uu8khiLdVL8obLMRdIdQ6oD6CvyK+/0Xq7pCjEYNe2gRVV
	 /X6Boy3gbL/+FJ+J8n51Jzij+UZr6SeairmC0wfmlHKMO213FOgkKkqn3nfkA48Ap1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792894744;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yahG/YSHuokfDvQP5Q0/5Kaan38JHbmMn0blE+0uhe4=;
	b=oQ/gM33GSr3YvgbUgqkHy12ABfgMumx9u0obzcveH0aBCtIea/m9tznpS7wA5OzXHV+N
	 PwoOwE1GcI4H5ZpZUyuWj28Ahjc0Z3nbU3XsQnR83koUTfP78GQAKTN4+CNEEh9kGprF0
	 5fUl6OG4hHxPbRUm7LAUL33AT5foJeCyuHNvs3t3NU1O0vx+uwYUWOHWbUCzKabgd1pEq
	 vQ6EtrqxzkR3SAEheFtBkdSFtC7SHQithPEnyvr5tM18s9ay8HKRVsvAVQRrMWJuBehNX
	 eH0/1IM2+BrgIJHYhMUUrFqRueMpqBr4Mjd8coM8P3/vssgt4/TQgOo9fXhbFUZL8CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HiGGWeS7;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3FF606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 02:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F3FF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HiGGWeS7
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso3500676eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792894744; x=1793499544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yahG/YSHuokfDvQP5Q0/5Kaan38JHbmMn0blE+0uhe4=;
        b=HiGGWeS78QYAc+DNdeSzY0kB6hvLlMQvTcV4oHSMxnELLri799amJIfujt2V+vsIF0
         Sb0z2AD44qrd+3oUA9GfuuTe7dLwFY60hAG3MJxzVCoP6wNcCXrjuuA4UTZtPoUQQmu5
         TRYR//QvaGebAVT0vXEPT77VzYjtfrhy2Rh7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792894744; x=1793499544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yahG/YSHuokfDvQP5Q0/5Kaan38JHbmMn0blE+0uhe4=;
        b=CjJFrmoFFxZcubDo3DncCaeDVl4k+/8vDlX+WhUQ1EkXuUb1gR5C/ln3gRyY5mkeFq
         wvnoSiBRCE8HcpkIOdBvALKm4z2K+zGt1WeWWQ1XviUGctwyVizBLBvnPLoRiuOSRs2p
         zIoo7T/UcKkQaxbQ+GIs8Tc0j72Dkx6EpBpdz00PohpaK0z8cv6GjqOdEah/lUnAEm5X
         vJqE2XjThBARhyYJ9+j7+cvBdM/7nPQ5erfw/60HgOH5xVF25KqThtKB50nGw+UrZnjX
         AzcY8UbsUOPmuK8E5CByMvSORCDk58IK4QX2CEUHQyBdWeJBdYCqlIsMQj/ksVq6AUxZ
         yqvg==
X-Forwarded-Encrypted: i=1; AKwUvByuALpwt76QPDMdmIJvGxjTcGUhlWPhSgLZ2gP5V0Cpfelq23TXlANC47KYd0wDXGxg5qubG20cecR1i08=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRPx6YnXcwsQkovJN/B8NcbzHMy9QOPlECZola51FbCKdwZq3h
	/Vc3JoK//1nFggRLZSUhfTwrPha3JYyY/q2oVT2W0V5s6+rYVkhQqeYQGAVuz6ZGkA==
X-Gm-Gg: AYBFou1wOuHGjgfJoQ0baIi62KR0P6CKYUb7wLzw+CyyHAjQHSJu9NVNbzveq99rtvC
	p7VoJKyL96KQu0mtGQjfhJMQaRCAOizCgtXgZNBOQRwwLFsENG/4Wll3uJNjaVntvyJCdbN3+Ty
	vaKMTWgVxwmTTmZWCtAvYsdS++n1x073NwaIsyFdfZhrCNO4eJLlZspgpDDrzqyDM17YTgypJAl
	IKGI7CNguF7qMXqM7JnbVXjf6Hb2N+NsdrMtnCqxMfvqyxdZYTTd9J7JprE1Ji+tcY+oOHLunGs
	Qg3yJ1HgAesmH4Z3LRF0TnOtWDnMsYq46jJm0gRhWGT8oa6HJequdwafQlfD7NzxlK9sfQ+YKeg
	60L73m6GzpFf4X5HSqRc8okNGXrK7HZ1ofLPubBO7Iikmoxu10/zRdMg6WWjqBfUfoYBI/IwuJ0
	+2lN09OyM6wj3G6rtAYBCbhQVgtBMXO5RJA+PL7JQRynlMbVYHHXFrsmLp12VwPslDxVHA8sfOm
	T3grickP/v4PdFhC7Q7kcFE5fN4DOnc3DRdWu8C+mqrm0QlbyLw3kedWQh5Fbg5dCveS7Bknmdf
	kIVf3qZSBIz41IWv14tX3QhUdZg3DI693eSRWfbxIjB/
X-Received: by 2002:a05:7022:b057:20b0:19a:ace1:793b with SMTP id a92af1059eb24-19aace17b02mr3889477c88.18.1792894743508;
        Sat, 24 Oct 2026 19:19:03 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:9f87:66fc:8c85:11bb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee5asm10387242c88.8.2026.10.24.19.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 19:19:03 -0700 (PDT)
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
Subject: [PATCH v7 08/15] zram: lz4: use LZ4_decompress_safe_usingDict()
Date: Sun, 25 Oct 2026 11:18:24 +0900
Message-ID: <20261025021839.1542805-9-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
In-Reply-To: <20261025021839.1542805-1-senozhatsky@chromium.org>
References: <20261025021839.1542805-1-senozhatsky@chromium.org>
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
2.56.0.257.gf7497c7d27-goog

