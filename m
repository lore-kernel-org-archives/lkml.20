Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792550579;
	b=pmi35OXzwlo4gvIdKvpkUVMGMo/4sewqon2JEkFbiYRcHmiuZcoszSt7xAQExe9zgqsT
	 A4ZfVuDoik2TGoYSpiFrbpjEjzYKmtFW/LEj8zXo4kx5DxbUa68nnCm5VTBLV4MJNvyBR
	 MHrHqhu6lPQYjGpdfW935bgkjGbfXiGWHIBFaQvqzS+A/hAX80jTX44ocBsicmrYy9CvH
	 NSGVNRvnk563ZXR2DfxDlXP3p8uu8nI2rZqNJyI06pgOsppcc3duM8TOxB48mV58xVlNS
	 6t/K4xXlmxZQ/jfSuuUCKTqMVi6hDEueetwPhL+Ud8m8xFNyFXlvizbEik/ui9LBMBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792550579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LxFkZ6agSclWnjnr9VyHt4JNsSVqy4IW9aFQvxEPoY4=;
	b=e0fMDlS5R6m8/ZSKpBPH7Ojo3dbYgRU4x5LTQobcNIuLtqpg1l4eqS+/nEWnLVvCrnXx
	 vGLgxULXAIViVmw7sbR5DOQPKSjAtYb17kr+0fBg7h5kROiYqRO0TpTqeNfQYJky5II1h
	 JelFDL3kcxNDF72LpZ5zV3Hpqo0l15BlufpRxUqWHez4/IZUJleXYtpsnyIXfjIEgqZ7C
	 9Bso2Lf6x8svD/WYZbrwJly8u2tvrW6yCPx/lHYyq6+mYXw5NVaYDzDA0OmHcO+PNjLaw
	 aWFnU/e5iQQfE9wYDoR6/IDlTmGxq6O7h4olZ7Mw2LLjMQ21YOaUNiFdIeqRFRAJpbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=B3AgGT6v;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D1C60A261A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8D1C60A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=B3AgGT6v
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15354aa70e8so778260c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792550578; x=1793155378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LxFkZ6agSclWnjnr9VyHt4JNsSVqy4IW9aFQvxEPoY4=;
        b=B3AgGT6vZdILr9bLrdJbPjTOrKTQo6knmhTdjFlZu+t2ZH3s1vpXbenoljOtqo8RXa
         2qHt+maSWau0NEKY1YjXpVygjqi3moqO5SITnartUvX1pbBLfIJ1NiEFvNiJv1smDRX/
         oCeAJdMm0QHfznEnKWTxDYH0n8b8ljSLEhQlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792550578; x=1793155378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LxFkZ6agSclWnjnr9VyHt4JNsSVqy4IW9aFQvxEPoY4=;
        b=2C5JrMTTNKFlabKdWCqMAxCWCnG9Un6wgGJZblOz9KxExTQ0kx5o2G9zTROSukCABw
         xJ1/IisvQnAuUcVsGZDrEZOsl2k4FylM+1qjkvopKecwpciDcc5RQSzCxZb2efDqwTxT
         7zcubH8pKbC+w3MUf1oVIKvNc70QMY1VbXozxGv8EHBlCg+SOrZG1GGFpGsihTweACsf
         SvIk5r7zacqaiEdpudRLYk+UE541W+mHV+soqZF2X25hGsPWmLSqx35H4ihjqm0YF2Vd
         GW28ljqcvcs+M3HJohGDwYEsAKcQfNrgmroK0RHyNZMN5j3BZKiJB2cG4BrQ0/Qm9uUO
         TeYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOvFk9awD83EcULxoZbJABoNyAtUd33MynJZcmAzysWbFi4ZnhjcLUdyEJT/DusazQzLLwMfcZ9psFkTo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhxudeGTfK+tAmxoY86a6LYxPp7gFUpXXinhTq2y3DvBJMDK2K
	+hTrYy9lFKNJRvTQS9/7FVFVj6X/DBf9QS2zyoMhXZXO50oyrECkNb2uPVvYvux77A==
X-Gm-Gg: AYBFou3RRH4pv2bD1s11cZBxVzKanH4ZgKM4eNubojGNQ+0mouvBKzbmIk4SMfzPRrv
	iLE2vmTsN+g3NJd/IOSnDwF4TMCf4/kmPbLW6inWQpQYfx5L4KjJjJMPb1tMUCrLAt3ctRXIKGX
	vh8+MsSuOJ3cKGefW6s3Cbq+by4EGKCA8EyVxjK/dsfeopHfTPHbGAeVejMbkkXutxN+l+WhhjW
	gHePIPSG/CKWL17vEnGFvOOjbCMbTcvY39kGfH1rFV+vUZKBXE3+UID3Ex4+wslkUQ6OAT7Ct0F
	w4GBmi/Ul3Ni43dan9ZtTHfL8q0Pzion2AR+SW0+w7dtgeE6KYwsBV/ZnxRSKpqAo1wBDHiZLZs
	YWDLpXooEC41w+2gAjkAD6s2bMxJypMESaFz62EE7vqpY8KvS6NgYiy9PSQspLo6l3qnxB9CWnm
	ybBhM5uOJl6K3TZkY+O7N1qrDCDJHsKzYCGZuzZqXGQQNo2NVnQv10P7aR6yn42W5Fmjck3YeBx
	XGs3l30jdIFuIjKbBYvGUB9RktEqgdRtJCfKwqcsV5/qQaDLHBUdj5Rly3BMwpwH+YiSd9Bw+LR
	igT5LC/nGqErJ0faI3xABoSxeIxlkIiyPvoyn/15LEm+
X-Received: by 2002:a05:701b:2810:b0:166:b307:5855 with SMTP id a92af1059eb24-1909aaddf34mr925658c88.0.1792550578027;
        Tue, 20 Oct 2026 19:42:58 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:97d1:a8be:236d:bf79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm2392047c88.3.2026.10.20.19.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:42:57 -0700 (PDT)
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
Subject: [PATCH v6 05/13] zram: lz4hc: pre-initialize dictionary stream in setup_params
Date: Wed, 21 Oct 2026 11:42:15 +0900
Message-ID: <20261021024236.1787884-6-senozhatsky@chromium.org>
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
2.56.0.212.g129ede20d9-goog

