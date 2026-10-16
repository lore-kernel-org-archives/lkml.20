Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1987B3AC0C3
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792125888; cv=none; b=LTGNqtxmXH3cjaMuFEMwQ2x+p3dDEiol15JVEv4Kap7NWkOwQlkmHwCppM1IU37hQSiH48ZbCT98gWt46uwJyyvBx0t0mtx1NCsXs7VKOrP5PZUdRerVc7BE+yvzmtJKoSsbcaFbMcITsjI6xCuSIMku5OFKxfll7oI1y/9Dffo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792125888; c=relaxed/simple;
	bh=PUxxPD1wuEBxM5xa6ka6AAqGMT/BH6aQ0O/i7rf9wr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fsrWdMPIxKIJtYOSoOSS0i8u0EGY1DKzMZanTPrqW1btuQT2juFnLtP8+sbld/7r/rKoVSmbLdBwqeiErOX8ZAS28rcKzn9kinyslFDcJoFK21nkvPKPze3+9kMS30ROF6uDUt3KRsvrDB9jkt8FsRKhxrcpxIP/ubzUAgTnRPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=F/ZJecb9; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="F/ZJecb9"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso18690845ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792125886; x=1792730686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XtS1/0M01UFrLXwpgPFi8UFASC0cpcznpCMgk29ij1I=;
        b=F/ZJecb9lV5d4H+mnDB4+H20LYQKUM76PSP+f/Db2gocSSbVkn/tTOFPBVYYTF161O
         8pBQXGr0+K+1J9/Iz9n4w7eDGfEtkSIFtMpoNWBUd5qNUs1bAz7YdL6g4ToUGaHAyt9z
         BupoqCTqryCZfJu/dc3kbg6MhnUy3STMA64hI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792125886; x=1792730686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XtS1/0M01UFrLXwpgPFi8UFASC0cpcznpCMgk29ij1I=;
        b=asvp7YR5wWJL3Y2qAZYeSt7eBjPHB+AvgRHWI9rw45RrNjjEOzXGQZbnzRtLR69yg7
         2zXkM0e8cFrZQJ11WIYo+MsxIzRhQyVqils48DUXt9HatbOVjNjhOuxEjosUDE44Qv6D
         GQQTDt/OYP2Zg/iQDAA2VEJXDSPNYIuGP2C3e2XmcJf99UnTvQo6v6He304I2f35+vLi
         vWeakCpjDPQExnZ1j0nBw9f/VEpl1ejFXsDNIxRrwpG5tog6c4AtHq5J4XMIRMcQEmGX
         /zSPu8yfvaxlKHbCpnYLTtQe9fmNEaVVWzvSFEHvwQlD09ZFzGcWyJ/Do9CYqvehU0CR
         SiMg==
X-Forwarded-Encrypted: i=1; AKwUvBytctxqbCb7yrN4MpoNonBLLEhxDsRNpCF1ZhN9q5iIGBg4Z+rBWRNCYwSYyqcITMUNMjt9q35vpYpaM4w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXevhYU2c8fC5k8CEQiG5PkrO4RIo+1V78LQ1teYpiOEpFrA+J
	qxUglOxHAVj8QQEGPv5HfgAI8llGnjFwfS8JdLBqyUfSUmJor7JctdWSMCORX1wxaA==
X-Gm-Gg: AYBFou2Ojz38Ocm+a7+Ai53W54WHbRo/dhFNZhoi3FOpydLMaxDL+s+MblisWD+X2nP
	qicnihq/nb3/PEZmM+iURwp9ppKTN2K7nrNV2iMTk2vNUPZM/ZCqwWQGFQuVnNBgsR43HWBiMxI
	9in/rGyUlC8p4RTJgrBlIvWXzL/Q72OtVJE3LcoxZUcYlE7EME4897FTNCMK3cxQAQXsrNWqxSh
	SBzrtiYKNANA/B7/gmKHvk6e8JDgXpTHoXnx9Cz7iYicH/NStof9S3zLYafiPbByeJNApd7XNE3
	kepEgn2gaIu9VhMsOLdcwpUk5S454bhxvl29QEBRNssSEO9zo25L2XTjLYpezZrZvPNYWeLeE6w
	Gtyf6WbRvN/KdD3Km1Dj9t2xzSc/uZBH/rXtrMt7qUWZQU5lrqhgV6nseRyFvZOWbQDXCuHMcI+
	qMvoAMx0313H4K95iOv3DdFHMILRcooAg6UrLxF1y6sBjK1OkWGXi3HAH2lUcS69Nn4OSPxj7hE
	cTOBh6dyYN+pHH08Nbb0bA4yWofWaqYf0MdnZ5gIO5Ci8LtgkmUhFdCK6XFHss=
X-Received: by 2002:a17:902:e74f:b0:2e4:b37a:d577 with SMTP id d9443c01a7336-2e842ce7f01mr191500845ad.43.1792125886411;
        Thu, 15 Oct 2026 21:44:46 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:a579:8b87:8304:7ac2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8b1b5esm4137235ad.67.2026.10.15.21.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:44:45 -0700 (PDT)
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
Subject: [PATCH v4 04/12] zram: lz4hc: pre-initialize dictionary stream in setup_params
Date: Fri, 16 Oct 2026 13:44:09 +0900
Message-ID: <20261016044429.1304561-5-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
In-Reply-To: <20261016044429.1304561-1-senozhatsky@chromium.org>
References: <20261016044429.1304561-1-senozhatsky@chromium.org>
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

