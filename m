Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138073D88E3
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792295511; cv=none; b=MjVIjicwATpK3EnRT5vpNNpY5+wfzrpFynY9EJ9NeiUe8wW9Vm+UYGmaemdBg0x2w8vRDBXHtaU538t7I3Ptu3HUTj1ii3b/bisfqgB49pdE601+vXHOASStrP1oncNpBPfJHNy9slifyJRsedtgtTC1MroRuiojpQ8FcG8IV68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792295511; c=relaxed/simple;
	bh=PUxxPD1wuEBxM5xa6ka6AAqGMT/BH6aQ0O/i7rf9wr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iyH/P1/SqET7Nl8Vd3exHSdxGCXgKdU/frStFu3eUSMia8EvtYwNgTpmwYdDChnxO2x9plHejh0zCaVtqVO/1tLPDrU0YMPQKwaYaiINEOQVL0Hz/XwU/V+dQ171yVMJjmZO7MmO4uaD3yfJUuBdDpI5PvoQeX7Br11kGnxDNUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=P3QkOk2N; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="P3QkOk2N"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3a7cfe8f761so1430777a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 20:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792295509; x=1792900309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XtS1/0M01UFrLXwpgPFi8UFASC0cpcznpCMgk29ij1I=;
        b=P3QkOk2N1lD63bxT2xSk4iO1hPIRIf779xXh1NC644KCYj7ZBgXZ0TqlkpLEtgC0QC
         nXUcEFJl6/PaHUERs4hLncLui0bw0KchYO71T4kXygt14/kEKtd+fJ+3qW/C2szupDXJ
         eT/QL8zKUzfoTl3SJ6YFDDSWNU9n0RPOT5gIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792295509; x=1792900309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XtS1/0M01UFrLXwpgPFi8UFASC0cpcznpCMgk29ij1I=;
        b=hglptIL3lAyK+wrEAzozx4VzfmvgieIWC3Yc/TSyxKBreMdxsgS+14LcUdfdl7vIM7
         0dNL8CSEzfnG60h9SikxrCo57bjGD+V10f0WXnxNs/tHx/BlUnxZlTVdMSF3HI+oowlo
         x4sapMweplMLpOiZ/IPZRw8VipfwYb/O0/rylTIcbITZjZkm7aEx/Ur7SOvJu9Xli3wx
         nogLLPufO8KW+pLmLrsiI7d3siiwBShzMQ4yzu7/kO3JYCzEztWvnQ77FbkgGxElMd0k
         wy7qlImjJUzexPQFngE3ktYyYTB+PT0X69wInWBOmFB1RK9Cf8W4Nymdxg8K0nClavHd
         s00Q==
X-Forwarded-Encrypted: i=1; AKwUvBwEVXrDLga6L5t9t+n4IADlcHtDQAR5yKWqxwHyUoMdpdoQBhnI8TPVa24cRzogfAfw+SQfLPjh5gXmXTM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKt0B5yrHeJULrzdxRnNSMDwoulcJIwZR7HNtmi9E/QV3CYp1s3
	aIGBl306nOd6XKlXJUjpj2x0ipsROqbtkHxJrBrjMMauOA7PFZX6FnsSO/RPssAaxw==
X-Gm-Gg: AYBFou0tLTv3BKTtyPrXEp0zmirNTjmgBm/pk5J91psbLH67Z/HqkSfKJ54LqXjw++H
	ihwSgtdcmrVwbw9MrPzcczxg6/QlytuhxFmRsv+Kt8iQ4yc7AB4YzbE47T+mz4k7A1FkS/JI7nH
	u3LdtHg9Uyp2jmhYAa83d3ZdMC1/PbUkyUHatYz09Sv6DNOhOdGJ3znZXlzCSBJeewq/juGVhJc
	jPaoQ7J63pTyHR/cVtI3UX6AN1ZaA5AqITdSGsBwpB6jXC5EdS6WZ154zrossG9dJpfzl2Q0M9G
	7XEHtjEPgTVZPLy3Em15ig2SvWfMzwJ8gMQaACSS20xKGDivWib0B9aXXCCCvITvrd+0CfmntGq
	mArdwGHi7IDmxtFCAWuriP5uf+CsqzVouAcz2+e6LXGlQ3yO5noU8v5Vo5+CiTZ3JKN1y98Qex7
	cphGxYnT+l9uicXj6LRoH/8ccrcUEFRC2fA0WBo5Svf4npYBzRtN0rfDPrTxSghFOiJg9StPZxU
	nVBUVJ+CimE/hswUJlKCvnKHI0QlUfm3GeHnc3UaJkiPrjORMtW3yBirrMAgG0=
X-Received: by 2002:a17:90b:4406:b0:3a0:295e:6e61 with SMTP id 98e67ed59e1d1-3aceefbf3c8mr2482928a91.12.1792295509334;
        Sat, 17 Oct 2026 20:51:49 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:4569:b311:f3ea:5f8d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad25d5d1b4sm253024a91.16.2026.10.17.20.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 20:51:47 -0700 (PDT)
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
Subject: [PATCH v5 04/13] zram: lz4hc: pre-initialize dictionary stream in setup_params
Date: Sun, 18 Oct 2026 12:51:06 +0900
Message-ID: <20261018035125.3120704-5-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
In-Reply-To: <20261018035125.3120704-1-senozhatsky@chromium.org>
References: <20261018035125.3120704-1-senozhatsky@chromium.org>
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
2.56.0.176.g3575e65682-goog

