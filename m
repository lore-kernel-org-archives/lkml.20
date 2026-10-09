Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D133D47206A
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791529947; cv=none; b=SYAfLEQTQQn3Tlm0b06CG7UvvNTP9gYuVpkVVd/09sODknKe2HqmZXx6Vonr9/IupusoifUobb+3V58Db158c3v0hyjYG5zJFJ1ZQJCb8mxq6cwpMMZdg4tmSYNkE8hK/VQGgnUduw8KdE1FzZn56EQumhM+HzBLEbZnfJr/iIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791529947; c=relaxed/simple;
	bh=ht0tf3GrkoJb7bJOWHKnFQtgQ+++VueB10f0Y6JzUEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pYWAgfyHKRO2QuglrNd2V7XcmP6yZIrW9nFXFXiL9mx/mlnJxe41hYPtcZLbzkbBgHICGV/W+pC4tFsGvpVFjaYDbzfytEbaBopB9AE+TvvsAjQG+ep6acGErNKrWBaGC2O7EnstTkpSPR9kyV3Din99mgN0333Z7aGig4kcqAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Sm3dHyK0; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Sm3dHyK0"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e6038cebefso22980005ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791529945; x=1792134745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rYDIjpQnxgkFqNZQW2yn2pS6XpW/Xbtk8d0QrpCAmj8=;
        b=Sm3dHyK0rWFhUu4AYHxj1RHfd32vkEzq0ThkrXn7+BCgbe8YdrdwgvDnAv7Nhup5Si
         r6W9rnRUWE4gmRPM7clUlgREuhd9t/1z2gur7fBITKRn4rXAG6S2VCu714ralVxVpS72
         DKFXAmJE8uABYr/ZZWHNi9TzG9NeOEb9NmwaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791529945; x=1792134745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rYDIjpQnxgkFqNZQW2yn2pS6XpW/Xbtk8d0QrpCAmj8=;
        b=dC0YyDphCk4MGX1LXZrbwGSzIuxZ4iOn5NZ1SMuyPOOYz0w1igiZ+sB0zYPpMZRn+K
         WOZl8xZmrm7KZ2HJvoCJSln4PFXWKk1pF7RDSHajuostY9eK/OnxysQGJpNykHyFmeLe
         7VJW699xoE3WcVesyGVhNVBfByLg50MELqcQarzcga04t4z2MUjVrp9+suDSybh2HA3O
         h0iaWhOoqY469QI9kFLtteugmH1xKMrb2DjyX11WjqmLVJ+UPLU7dV2d+jVgFopWazx2
         KsFGB3BeGrxcQPjy2TAeYJhgq9UZ6fpxDVt/cvdxebucZU1sS5wjSd+bJhRj9NKEOycd
         tstA==
X-Forwarded-Encrypted: i=1; AKwUvBz9mfBacZoiUaVnJjo3olLndwOFTWQEHo6qrYFF/d6RMGDatgJr2A3bw+dkYMYIOYqPbmsD0JqrXS+3JSw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJO8OS2yMkS2j6VcUjFT++4ohBRjEb/wxPKaAvyjhefjNNrM9b3
	BSdLX0fFim8Si6K0H+CIObOoy6QlBkFyCs/yDJFf5ZlAB9WSt7QXpkabEvDf9wwMrw==
X-Gm-Gg: AYBFou0165zLA/Oz5BJYDqosF8cv1pSkTpZ856PYxFzz5MNIijZpFrcbvACxMkzIS7x
	Huv4wGaC0htQEIFhOG9D5XERjlngKLKzf3SFiEbl1txSJ7LME3n6iY2R4jy1yO0bh12xwgcl8XD
	D1ExtJ7ZIvpG1VN8AFrX7sMDBXqera72EsUZfE1koPQYqwPB1qRQ/DZICjTyuytOxpU2zkwsviE
	o0Bgq26y4WLTvafb1B36ogP6zvJ6doFGBrhRu4P+U3bm5eNpPbK6jtGBYQRpS9dEwLOmqFpSICw
	hxd6AM3Mly8xGsSfa77TlQFfOZ3fN6rjDmpLWAKsO6XfQmChk/GrMjtWMstgImeOMOuOsuf7E5M
	1/m0Cwgk9qrsKa8eRJcbZIXs89ye2mj0tPkMcv3uiNvQClq5T28A54Mz8BWKSzShJRHYR1uDltn
	Lo3S4xiezTgp+ZW7Ffeligx334CPR25oBuNYeBOamRfe8gQn5I16U5Q+KjKjmhK8XY00lhPghV7
	yQeTYjrUvkp2H7ZtwUWM9OvT1t8kMPj/fJXzspzHBtnK2xsFCeNIQ4ikaK3Rrsx
X-Received: by 2002:a17:902:e5d1:b0:2dd:b3e0:850 with SMTP id d9443c01a7336-2e8429a7446mr9570285ad.17.1791529945275;
        Fri, 09 Oct 2026 00:12:25 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:383b:5817:8167:5051])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b19a2sm4483535ad.46.2026.10.09.00.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:12:23 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v2 04/11] zram: lz4hc: pre-initialize dictionary stream in setup_params
Date: Fri,  9 Oct 2026 16:11:27 +0900
Message-ID: <20261009071157.3730698-5-senozhatsky@chromium.org>
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

Pre-initialize the dictionary stream once in lz4hc_setup_params(), store
it in params->drv_data, and memcpy() it into the per-CPU stream before
LZ4_compress_HC_continue(), matching backend_lz4.  This avoids resetting
and hashing the dictionary on every page compression.

This also rejects dictionaries larger than 64 KB at device init time
(matching backend_lz4), instead of failing every page compression with
-EINVAL.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/backend_lz4hc.c | 31 +++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/block/zram/backend_lz4hc.c b/drivers/block/zram/backend_lz4hc.c
index 5c009835a684..f3656c27af21 100644
--- a/drivers/block/zram/backend_lz4hc.c
+++ b/drivers/block/zram/backend_lz4hc.c
@@ -18,10 +18,20 @@ struct lz4hc_ctx {
 
 static void lz4hc_release_params(struct zcomp_params *params)
 {
+	LZ4_streamHC_t *dict_stream = params->drv_data;
+
+	params->drv_data = NULL;
+	if (!dict_stream)
+		return;
+
+	vfree(dict_stream);
 }
 
 static int lz4hc_setup_params(struct zcomp_params *params)
 {
+	LZ4_streamHC_t *dict_stream;
+	int ret;
+
 	if (params->level == ZCOMP_PARAM_NOT_SET) {
 		params->level = LZ4HC_DEFAULT_CLEVEL;
 	} else if (params->level < 1 || params->level > LZ4HC_MAX_CLEVEL) {
@@ -35,6 +45,21 @@ static int lz4hc_setup_params(struct zcomp_params *params)
 		return -EINVAL;
 	}
 
+	if (!params->dict || !params->dict_sz)
+		return 0;
+
+	dict_stream = vzalloc(sizeof(*dict_stream));
+	if (!dict_stream)
+		return -ENOMEM;
+
+	LZ4_resetStreamHC(dict_stream, params->level);
+	ret = LZ4_loadDictHC(dict_stream, params->dict, params->dict_sz);
+	if (ret != params->dict_sz) {
+		vfree(dict_stream);
+		return -EINVAL;
+	}
+	params->drv_data = dict_stream;
+
 	return 0;
 }
 
@@ -93,11 +118,7 @@ static int lz4hc_compress(struct zcomp_params *params, struct zcomp_ctx *ctx,
 				      zctx->mem);
 	} else {
 		/* Cstrm needs to be reset */
-		LZ4_resetStreamHC(zctx->cstrm, params->level);
-		ret = LZ4_loadDictHC(zctx->cstrm, params->dict,
-				     params->dict_sz);
-		if (ret != params->dict_sz)
-			return -EINVAL;
+		memcpy(zctx->cstrm, params->drv_data, sizeof(*zctx->cstrm));
 		ret = LZ4_compress_HC_continue(zctx->cstrm, req->src, req->dst,
 					       req->src_len, req->dst_len);
 	}
-- 
2.56.0.385.gd3acb90ef8-goog

