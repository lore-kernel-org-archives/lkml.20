Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE8C480359
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791863542; cv=none; b=mglHP4FP34J/hvywHFcTvew8F8PbmckFXBokIwSf64AZuJSVvI9/hup9b9efIVdArLQowiBqC91rgspk4cGSKZN8TzLPyo1FfDXoQF9M+4xaP/LdhcT2eGwfRNVDr1BogzPS3yBIjXfExA3Vw3R4aJnK00810gQ2Lo2EbQdMBNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791863542; c=relaxed/simple;
	bh=ht0tf3GrkoJb7bJOWHKnFQtgQ+++VueB10f0Y6JzUEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lPE+9t2XC1PZT+BqrG96gZ6cMhsQ+8qZSb2LMdnVV1EH15XGZcy8bOYhmLi34QclNBflCeG4wz9yeaDAByAV4TDP6TetNIWFGpXzJXMtruD2AqIWEL2u2FsEN8K9SR1KTrnJ62s8w6rjedg+OwBVQkjwnp/0XxOHo3uC7yxRHGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cYl1Z/bl; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cYl1Z/bl"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-85377c8bc96so926933b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791863540; x=1792468340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rYDIjpQnxgkFqNZQW2yn2pS6XpW/Xbtk8d0QrpCAmj8=;
        b=cYl1Z/bl5gOolk/YY4PBoKzyk/QzkS+MsQsvWMhq1OohvhwtbpP6fUSZfBYga5+3V6
         p7TloqgikOQqOtMzby+TKs/i0R6vkKoTdNOWUDWR2ecXuDa+tIUGN0/yWzQpCp3vjdu9
         3GiCrLSHRM8XCp/0OC+7tQkpZCrii2ydp7mCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791863540; x=1792468340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rYDIjpQnxgkFqNZQW2yn2pS6XpW/Xbtk8d0QrpCAmj8=;
        b=iID9dWihhaTOgfl9TmeMkpiFa38+GAmD2E9BSqVzU4p9/N9D2KJTtl17njflFfJ9hr
         0DzB7gkqXveyWY4UBh9h7Nm2X5kXomV12JIuNp+K08Qso+Kb6WRv3PqcuPjg1+JT/mcT
         nC6DOJms3Ojkn0U4IQ8tODhb19qEmFPDZuB4SjhyjHXe9ZGvDWEFVtP20EChKIm+BmOI
         oBPPYjuxqeiAHWm9tio8+ipgXtudF903fs9PoO3DzF7YU7rBoHEHKCGhQsK8ioLpxQa5
         TD1ygjhSjlPGvt+GBFGLqxsIIVfMQ3KqolOQWv8/RDu2ehLE1KtUsxF4x/RoEOW4BzRR
         RdkA==
X-Forwarded-Encrypted: i=1; AKwUvBzhAXMJiMy+MROiSsEHLWg0V/XY7eO8/CBGTMmcetIdqQcr/UVcVldMFA7EYEzoxcsFawUSZiiztUkHOaM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQTGj8FCjOi2DFUbtpSEvSUv/XNRuzNKAa0+ssrnK/tw7Kb3F5
	ZFhPZOhKBpBhhnDk01qJskt1BzBbSJkMRv5fClArPOVil5lSD0N2NJin8I4SsV981A==
X-Gm-Gg: AYBFou2E4SJe2EXwKpO1OtzVh+afS5+iiO1xlbQBPKErvZckTQAW0AHEN/lgjzYJ5TW
	7N0Iopilpb1RgriBb7/LF9h/V7nSOUzAZyMuTa1wuzW0aNPN8qSGErPnY8lJnh8rwJV0izsRaGC
	m7k+NNJCljOOgjYzGc6KLnxOKztjcsFz1/VK/VAx5ePGei0JSTX8srrIiTv2x4f5Drm+UKm9m2L
	M+57SiUMFS9TLLKbYqkQwnRCDIAykHzz95a6jNEiw4yfB9a0/HsG8kzgoAbE9ZFlvvrV8Wx+IJL
	6NvnP8LaECskoj4H9ooDBdXgOOXJCV8FnWgBtYVon3vX8Zspfi1W4UgCcbtrAuwyPPFjndyz78P
	hIQA139XhEpvzJF5Qs+0SFWxO4uzisZjhlx+IV5XIWp6jbnk0Pe2A00w62QjuzHz6RY00NL/tqh
	WDNgMNlvI62cJEa4RfJmcvPSHkqkl1GFD55R+WG4UYza2qeikDZAootXN9t1Ztu+W5D9GtDlvux
	Z5sGDEhpCm5CU+0nwlhOYl8pzsPI4A4WxNVj7K9theP5J3JrDAaIWOwyCnhqA==
X-Received: by 2002:a05:6a00:1803:b0:881:ac65:715c with SMTP id d2e1a72fcca58-897c653b391mr9755218b3a.10.1791863540508;
        Mon, 12 Oct 2026 20:52:20 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:476:d384:7c2e:1579])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c41bbb27sm4326818b3a.40.2026.10.12.20.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 20:52:20 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v3 04/11] zram: lz4hc: pre-initialize dictionary stream in setup_params
Date: Tue, 13 Oct 2026 12:50:51 +0900
Message-ID: <20261013035201.2809924-5-senozhatsky@chromium.org>
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

