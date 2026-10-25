Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792894747;
	b=UbY1amswRBFi4M2mBHbcq6S3MRfPKNGJaAB35JMXY8Bc3ppwAAcbCk7puj50Pdb0fhBj
	 GbRCJ7R7rX4nm+uObNUNItdxh3FhWuvGQQ/F8bLV1nAy66Ds2Mq+GthWkirOYMWTScwuv
	 fh7yAEPMebnyh5X4HBMFcmUXfUYzOd+k/OZCj8fa20bHc8Cuw7rAi1F5FlTa0HTHrIN6T
	 XmqLulB82NKdA9w5DjsoL1VhrEe8THf7c83DfGA0MqELt3UqugErekQHvu5GvvmlLS4jz
	 YOR1UKOZKK1Eg2Lx+/aKYvzQZ901PheXW20bAFBevihXYUSig2puaz8LJ5s2F7r0FhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792894747;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RXHOVm+rIyaOTo+cKj9ItrXebJiPbXZO152D86F4tDg=;
	b=afLqsiNDoHdr4JWGi+2BY39F07iS5gTirKpJ9L0PYjRWaM4/4BxzWrATsI0t0KBTfSKb
	 qE7hjOVEQxRZ3GKFb0E7FLEv7kxeT/a1Ik3HbjsUfFJr5UezZUeTSFYQQaMic55iXvYDg
	 Aqs9IqXGBcqEYQGERtDGeZ6kquCVbg9otfLOufVRoFGACu5YVGRrYYXN4kVK/6hmDr0nZ
	 v2K5fNBlPVKKIiJ+kEPDR6xnvsEPic3oxBVMY9x+Dn1+cCx+L5985DxWvnOyroYxcNYYA
	 vzZSUEglxxuCuPSj43FhpwuctF5z+6JTdqgbRoX0PIybnUo+iu9cfTIXn35dkJwdGZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DQGBVhMh;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB190606A334
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 02:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB190606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DQGBVhMh
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso3500686eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792894746; x=1793499546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RXHOVm+rIyaOTo+cKj9ItrXebJiPbXZO152D86F4tDg=;
        b=DQGBVhMhTzt8Ap5XQC2lsAh1r1AGAKm8M9N5xB0Vm/ti7r/dm1Gd8whg9Gmew3uZ6n
         7o2/LzMyaS9nZD6vIR7pNIV+sXQkc/6PsfP/LyGo0jGf6Wt5846U1/XA8C/nL81So933
         ZKMroBFLFAmY3ivlExVmLg2ha1I8qeZnkiBOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792894746; x=1793499546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RXHOVm+rIyaOTo+cKj9ItrXebJiPbXZO152D86F4tDg=;
        b=teyAnOqBur/GXZ/BgW3zoJ5O/l9jc4dkjeEzmk2dCJwyRDG1Lya9PK3IOJ/BUFQp5Q
         hesjxHkNVIpZB1gd0hf1KBiPe5pZgYEFy8cOFD/xqWw70l+JjCbrBo6eBUe6Nr7MIUTK
         LxYb6SyAyBgDmMYu+Xa+kdTLDMzj+p/X08d9MJq+i4QUth+U30M7dtM4ZuSzd1uR7I9R
         Gx9rin1X5D1Xqa9x96yGyiNSkbJGGkYcbm1XGGZHzy9BHbptn/ZICBNbUWRwc1OYsAWg
         Q6TnfkbVaqnThYLFtJcOtQWfQN+aDjcAqznDGv/3Pk6eRG9+1tpourESbF0824xMgTic
         LOuA==
X-Forwarded-Encrypted: i=1; AKwUvBxVvkSGiEMlG1typQx9QShde3r2yMMhG83V8ij1HAmtY2Q2Xccy2PsS8OgBlqnINaq9rhYvOJCFeAB/ABQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLY3uiiYhlsZxYzx+HRtb64QmFnWkb94oZg8j2QBH+diZl8RcpM
	dD4dkRlRVA4Px6FG05k750cI8p/iVW388AZDmLyVEWBMvL73E/Yy1p+hQLppj92jvDg6RbNAWuI
	JyS8=
X-Gm-Gg: AYBFou0bC9m3aOgVp3VaNGfmBgHBXyF3Yfpzbt4ARJktf0SLr2vcUBlHba4xgiYo5Ac
	SoSK3sk7JGuSJYuYVTENX8pYGvkvRFkU9akBGJENFzcK7NPF5ZT9m9Qp6yLnlWLXHbq01f6ISfa
	KQQgMSWCgBhltgdbqtPcVAHiCPGMeWvJJkcqLi994T/oTzZrf5XEvlq7J1wveKPQ12FsoFcAA1F
	fSVcKvPU10F5qLNBcdxsyGAvaXpgPCkFuYZYYLcfeWO8tSMYpWzAWLAZ+BXxhXy4tmeiSJGOXRh
	7fLxslZNiRiNNcDoMN7E+mk0S1JniVEx3bcjXDle0EknVM1zO98gHS+wu/RJZzIwiBXIdNGnfA/
	BFnQh0SqwXmciQyS4nACA9DDfKXWqIDU40Jp96vbtI7k2rdamkBgbjgHHOmBrbdNJluv5ZwSJYa
	s/83FKSnNxp1vi8LcXUw2dn1wnnX3j7DKw91FLXfOrUInZfoT3AWyK1KkFCBqH97AngVOjmFebf
	NSNU1f3MBX2SanGzM6dKxIhaFL7lWMWZtz58NlQts5cl0UhjI+UB/Kf+zGoTUb41FnTcE2r2X4p
	41ppHc/zft1KGR+gbERJqnpnFnJtVrk1OvMv+Dn6PLWL
X-Received: by 2002:a05:701b:205c:10b0:155:7721:3a4c with SMTP id a92af1059eb24-19936d400e6mr4672343c88.35.1792894745835;
        Sat, 24 Oct 2026 19:19:05 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:9f87:66fc:8c85:11bb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee5asm10387242c88.8.2026.10.24.19.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 19:19:05 -0700 (PDT)
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
Subject: [PATCH v7 09/15] zram: lz4hc: use LZ4_decompress_safe_usingDict()
Date: Sun, 25 Oct 2026 11:18:25 +0900
Message-ID: <20261025021839.1542805-10-senozhatsky@chromium.org>
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
2.56.0.257.gf7497c7d27-goog

