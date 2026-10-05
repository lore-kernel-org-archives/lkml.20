Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B62A47F799
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 12:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791202872; cv=none; b=pbHpKQbfHPXPFSf24DFqZCoGaHBl4DxMVXhk6QGNOfzHeSW37WDLNANR01/ZyfnZkB+7LZgmild99NFGUVKwnhUYAALfGZc4dfE3/6AYdtQHTETlKtI1Lww2OkPxz7XD9bCjtpULS3nlQUgFxcDshNueKkBWEvZdgwALGWu2ij4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791202872; c=relaxed/simple;
	bh=j+GetKyvqaojfVZCxHujBKinfZ33ypde/wKCIfws7i4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sWIx1x1LUwDImQO2OmySMGYeHWN+cVGc1DxSvzHXLoei96j2/2Eg+7aCjoE38UNds7OmQC8f7DnHVpLQOYwGUskB3IOMiZ9E94AqIjkaChiTE32jHvK5+WuAzGro1hsup6/g4/tbTZX2qI+AFE+xCKd3q/596J46B86ykDTdFDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KRA7KmH5; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KRA7KmH5"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3a7d283e017so715831a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 05:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791202869; x=1791807669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=15xwwAv4xGpeW4W5SjxpQZpMyGQBTQag36PfgzzT6ks=;
        b=KRA7KmH5IkkdpcALZYVl5H7oClSqgodMF7w/yGLBwMG/Z+tZnJ9JbLyb5j6WAPfS2v
         j1MqUqzMs18bcBgZrGx59ikp6rrl/lBXxy1jK8PYpHze1KF2rt4Yf48XZ6lmkVx5ajxm
         Q5ijzw7Ryf3nxbftQ2MaBuWyv9VJ3ZlMJ3hDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791202869; x=1791807669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=15xwwAv4xGpeW4W5SjxpQZpMyGQBTQag36PfgzzT6ks=;
        b=l6mL4rNCtUHwsO7NmhQNE6F6zArSXvljFBaVjME6SeBojpTxvYTf1zTO0nlMBjum/m
         Y5NOqC9UL+X4KsQKOD9J74z+dLzDqHlV7Frhy8ro9mBst3hsKSXfcVBIExFrjzhbgn03
         EZrH0CWDnUjUEQt14PFiYq6ZAT6yDvkJ83DmnSaA2XFNhgtrlaBim1N1WSltHJln6NUe
         K+yG6Y413Nw3UlpmNdValsd3iJqV8+7M019CdEbjcKXzxq++AJ4Rf4h37QPxj1CWbP+/
         YzJ9agB+LqK9HTDsPNa+XYplLbBgRWyK6IDChTuFEal3MRBBO014DpQbK2TDOYEH/V+A
         d6IQ==
X-Forwarded-Encrypted: i=1; AKwUvByoVpjQAHmqz+o2wA6vwV4X6zLoDpBNKO5Cp3SveHJYIDlk5hYexUgiGwAZNdsLuFFPQdxhUfF7nZhzU/E=@vger.kernel.org
X-Gm-Message-State: AFq9FYLie24GXc2Qom/S8QZhhRv4GyxF0zyF+o/WEfNvIGoBdd16ity7
	TedR1deYv7zu8sj2WmJEE+jbRSyoWenHeyJsy33EkGsC22tK6OrI6xCSf8rhkAYqTg==
X-Gm-Gg: AYBFou3Z4ToYfnIsg4bqI5nb8rSImfaUXlumrCkQqLqwgkoSjq+dz57Fhj0PE9e+6H3
	1Bze0qbT/wiv6L+3B+avWnxUyVP0Vl7NbVGwoKgNJaOBrnwzG210sUJGji4PRwxjnBmZddXLld1
	xianDMOYXBIwKYYC2We5lbQr4kLFQh05N1Kt6CqMM2EzOEJf2MVeK9LwAjb4fim1zSosVQ9gCOv
	v3/TXSq8A/3XulBp7RXvr6knaYfdy7+Mo2jP2A4+QVGhrbUuIln3kGTgvbIrebFHMU+AyhZkuig
	J/xnlJRPe6nr1QrED9XDTCWq3KCYhMs+h2ihitfch+8q2mvtOxRht4MbqP3QCdE94UjcoK4V53n
	DZU4WCnJBjwhcA/FN1qnJBqPvP0p2eGLEAdIrMTOD/zBMRNvsQXVNihO/WsmSSFbpE8PmuON7j8
	bBdswoDTGZlqCLiu1iRpdwNM6agIPWnThaMKWI7y7exllhLfDbCtR0aiSX1AGyAavAljkcICHFS
	AF+0B1cOUtEeOSrffT3luFQW+uVdMi/InlsitJR6Dm+MJH4+8JPpgrZydxk4mw=
X-Received: by 2002:a17:90b:1806:b0:3a4:8c41:fab6 with SMTP id 98e67ed59e1d1-3a78750a564mr6101771a91.46.1791202869374;
        Mon, 05 Oct 2026 05:21:09 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:9211:ddf0:3c6a:bf9e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7e4b00de6sm3342997a91.1.2026.10.05.05.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:21:08 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH 04/10] zram: lz4hc: pre-initialize dictionary stream in setup_params
Date: Mon,  5 Oct 2026 21:20:19 +0900
Message-ID: <20261005122036.718976-5-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20261005122036.718976-1-senozhatsky@chromium.org>
References: <20261005122036.718976-1-senozhatsky@chromium.org>
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
2.56.0.rc1.315.gc6ed9934b7-goog

