Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792894742;
	b=MNiBzKZDDaW76VdzaoGcZOAvSRhE4gTF8W215oTf+hbyrY55ooxHFNnUFzuk+RjMRZQb
	 cm+RdhTUg+XirEIX45hA1xV6nEUT47qA4VeJYimmMiKHkiQ39NRqXqzk0fNm/0hdpJuQt
	 b31eFzykrVQLvJPqo6W3Mx36wX9sGphCo7auTaynlVOJGcecfl1rAFCCwRpE4cdAGS4ij
	 bUnv1eD/jKSxZZE6C0sMA/zWfH0P9jNiQgXADMecIFruS5aT3uhZPZ/14EBZwtgWi9cSk
	 Szb2Ggb8/FVnQka4yNwaifMtqi8Ca8dPsya08tyL0/eSkcjsQf+Y1iQfDwHoJ0Tqtbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792894742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KEgwNj0hBr33FG112cIbL9zPffMBohhrmKqGY1PHao8=;
	b=tBQ18jQlP+bGIEsV/oFoG81kGgEElF5l9NlUZB4BTEMpMW2CxSPH8U9OSU2fVRehWc2G
	 1UeX1MQzeLdRVNycJhjhHx4XMlkGYz4OU9IZE77C5AaWBLhRmH80MIlHqbIWnhRX4t6oY
	 aPbGchXJCFHJskRCGBB1bjrNRfSsIV+4pVIaiSQLSQse3GGlgK51ei6jNVZ8lgvwPj0lW
	 l3o4xRUmUXnyRXyEBeqF/e2DIm5pD7yl33AZ4Fu4db2qCYtkIsUXyF2K5slnqVQqQCau+
	 OaPbCNl/ZjZdsSGFBjvqAmCbKc9H+UPo+3UQ5C9QY3K86HO03hVLRZ3ZMGk302/FDpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RER3u3GX;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F199606A327
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 02:19:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F199606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RER3u3GX
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1931ff67a29so4064009c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792894741; x=1793499541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KEgwNj0hBr33FG112cIbL9zPffMBohhrmKqGY1PHao8=;
        b=RER3u3GXQWClMrGYyDbxqrV5BW1u1GC9lYWD26e3W8DlbaI6wBNL6hIVzpUj5WviXR
         C4kHoGhIl4ux4PwKSWjBO98Q7DBgQR3gIXg5Q4VAfrO/Vs+sM3jfvXQA1XJ95ZxUScR7
         nuw+2HhfyTQIVSwhuUpkzcGMuT8Jq+NFOoutk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792894741; x=1793499541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KEgwNj0hBr33FG112cIbL9zPffMBohhrmKqGY1PHao8=;
        b=1tqYlScf36+O5cOfqM4uynsjO7dyvcuceydN6b6k/B+O0lQYXUOc0rGZFixrhE7POb
         jb6X6DhBa0lDy7K6g/UYT+C43F7W4nx/FPuqZ6FEMyD4ceF6BXW9gSkVWS2aNe7rOvu5
         14HofItGWMESUQiixM03SsjLulistsJ7d+MOHJENy5c08F8/autp/o9UrhnZxJtcw+x7
         HYzSa4QJbrMjzvWpbDNDy5E+KyhdUvnasGo6dYMf82XmYGZ6QS1hczbw9Aoxj84nlx0w
         dwHaBsilqlPV6zxpDfgQTY3XTNV67T6r0H7aYuexHke3vBY+GvDN7IKzWaToPRUZcC+O
         ugSw==
X-Forwarded-Encrypted: i=1; AKwUvByG16+VP3dCSdZtZb7XvTfL2Qz4VJSYqsQIuxDU+t2+ioFBZFSxGri6+9WXoZtsurBy7pXdJqSpcgmgDa4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYTgFaAWktAX4MlIXIkav1uSa9ILNR56GYNNxVxK4hcyjVD8aq
	MdpWk2EC16CP6AcbZOIdPDNvhG9M/5PB2zQMZhdEd/LHbf0FatUq19XVuWnjMSNLOw==
X-Gm-Gg: AYBFou2PCp64jG6b6S448V9rZXFv4AsnDhLYAbAnUOsNIzzViPFhZcmGmNdfeKrkZwG
	7ZRhQEYsaQ5xCvrYKGv10j1cQ4QUibCdmpdEUyIpbctwhwe2wd0ifGXa9fyFeAQwkugBMNB8K5h
	YTIAyoqUEPU9cr5NnVPkOmMc4OubGNvIgbgxoCU9np4WOuSVazQYmzy0O8O+IqW/UCYeShG/7K4
	cGbJFLrio10XPl9KKyQYCsOhnrVerxgLHQzTvD50yXt7ZYOk8mzZwO16iU15w78onuNkX3mloBR
	3Jm3BGTMH67jC/YSUBmvPQQXpBsgxgNoHau0PpRDKXclz5Ujp015X5FP90CLmnJeini+sOafu21
	2REwSXSAN9+DYDT07bXwzgM0o6L4K53NYhToPJNJzIkIfXZH3KMHlhfMixY48pTrFzxaDTtlIkc
	dDFa1PYphEfpHCTy+CYktzf36NvS4Gw2ANSp094sY9dPOAlp7v/DIC25MQ9wlSI/cEYODkYPohf
	zN6Ui49SWJZduYn9QHHey7mONeDeRdEF73V5iDXpYPQI9zvdr5X7MBmoXKlmFcd/qg+Jv34Pi85
	zuAczr4YzuotXFxTXFRmMH2eV14QZpnARn6L2UyY1aMI4DdosThNZIui97moa2fwB5UwTThx8zV
	CelS46F5iq0uPVPjrNJnXWXnFBKlGUS12bIi3I7Y=
X-Received: by 2002:a05:701b:458c:b0:192:3b7e:ddb9 with SMTP id a92af1059eb24-1993499dc7fmr4508047c88.13.1792894741245;
        Sat, 24 Oct 2026 19:19:01 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:9f87:66fc:8c85:11bb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee5asm10387242c88.8.2026.10.24.19.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 19:19:00 -0700 (PDT)
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
Subject: [PATCH v7 07/15] zram: lz4hc: pre-initialize dictionary stream in setup_params
Date: Sun, 25 Oct 2026 11:18:23 +0900
Message-ID: <20261025021839.1542805-8-senozhatsky@chromium.org>
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
2.56.0.257.gf7497c7d27-goog

