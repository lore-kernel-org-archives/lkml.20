Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793333835;
	b=4mdAzvPDUvdNO5XpXo4ITlzmeQuVE76bNAtCjkv7kOUGLFCErIGNOHbRY8XuHp4sZWlC
	 o7LhVa++FAjtR+PiRo4LdKOaJYYBn/o7Hc8tpSDh8gEpndGmS2xdQFTDJJZEyU8E5iZ5r
	 ZGFtsok9Pyf0Hcwpp37Yb0u0tfX8E91J7eufecsmZLbAGUJL7G9or/H0SC8e1KEzVxQLi
	 WTl0spqYiYRx9no2qM++Qax7P1kwrDxzwcXlF4V1ZDWSTSDrX6Ektkxy129OvJ98Ek0S6
	 +THJffLoWMNGZF9kcWIOu1M9sfdCYtohhfVb6aZXp0Yb6rAYMY2sAYQnW+nyhHZ5qAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793333835;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=34dnmmkWDdF/oQw4NU5mpC/U4TyeuwFcAYBy77dBteo=;
	b=nBGrdfkl4kwYIIWsMamQqcX+uFgvBIAvX70YSjW2y144PXeCdD2YjIdpNuQan5ZScN93
	 JUA6r16QOup5S4H2YXalR9DkT04l9wySVb791gL50SsKgqjJhTsxXp6FLLRGyuns+TFp8
	 lpeZ8y+zVaCHG3xmtl3CVMU7fBkjLUu5tMjlf1m1YCJMcL+25vLJD8aRQabiQzciThv6q
	 p4elXYN/O1cTIf6W9Bck4YWkUegrOAnT6KwEZ8pTNSehyAg6VeuQwL3fScD4jZJPXtnJI
	 Vk6MDNB4FZu33V6pmWXYyRelAaVc3A6/n15zWc4UbDSES8iEG2KWqWwgo8/ACbSj5jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OZmzPUqV;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F3D606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:17:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06F3D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OZmzPUqV
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso716697eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793333834; x=1793938634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=34dnmmkWDdF/oQw4NU5mpC/U4TyeuwFcAYBy77dBteo=;
        b=OZmzPUqV8JacF/fKoK38M0oLokxwF5OISQGwSkwiQvrytldIvdy2QHxVS3F16S/saO
         SFUxGH6Z0JPnX0MO+nTvOV7z46S63NNZKX3H44VmnyzB1LG6ekYM7Lbl7fieZoI16kbS
         7G2LyJrbNyj6RSYk2oV63mP3EBM2RnQeVhMI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793333834; x=1793938634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=34dnmmkWDdF/oQw4NU5mpC/U4TyeuwFcAYBy77dBteo=;
        b=FML9Ct4PRFIBU7jpM9PrCeqei5vyCzVL1XXRXVVaGRxDCDp04OcdTYd4L6wYBCv8ym
         x0zNr4FCioKhBGvxtLI95ISqrYQb8jRtLi4CYuNVujE0jxmMokOf1vEB40oKBT6pIvg3
         0mxSEmZRmomZDKVP3unPPZ4R/JNsMj6xdQ93HmOA0hGxwBLR2ZKN5ETrKqEJsjyxk+EG
         9DIx3Y8ud7GitLCzHS7O5uHgm05u+uC/1NA7zADvuNZeF9+LYW7f/qAO5sjHjLdO8xin
         JqWERlFXwWBVr2waERz+cQ+cu7gSLiDnObX9ORHvCWmDzpK7SgQod/4R95wtuxlGnHdi
         /fPw==
X-Forwarded-Encrypted: i=1; AKwUvBzORtZCF/VcHFTU5q8KVzV/6NHlRAQ8FekexIm7VDdTyGzHXvzSR1Se+zW70w/WyEDHrkJa6Um5OrWKKSU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWe6KnTIHfRT1p+SA0uVzMtA5RZlR83QEyfH083sNkB07mJh0A
	cd779AxcF2qwctqnj3F3saVUzQY1DmVi1aa6w5KzebSRuJU8EEM1JqC9PWd+1ik7WA==
X-Gm-Gg: AYBFou0hqo+KYhVRpV4QRWvjiHS9dgDRRAH3JcElNYV16y6xCfsH7UHZLlV4EmdyNQV
	Ooi9BFMv6EyU5X1a45M0kbEpeDovxvMzow9KfW3GyBX+YSZZXK4xg2zLeP/FpOmRj0LUrIVDYNr
	EXvLxFSSqqWMfWUmhRe2siP7Q1wGJIi68++u/dddci/OvJ56gxonoRWjH6WTZj21GxwyDGgESlB
	fvden/v1iERMn9V5DAG1nehNbgS6CpgC71oVITgO6//DYlw0A+RE9Vh5TdNmceitH1+92pLLlmJ
	xoa6F1K+Wthmu92nV8OottmzkCRj81/kUqB8IyvAZPPx6WVIAne0uSFQD+X/0rD1A7HCierMNmm
	uDJgB2QOax0cgy3RpTS4WD63K5vmPXCcr0KAykkZDNNHZr5rg+CqFHRKVKapsFux0FCxJzHK8ju
	RHwkps2ZkzKCAJOLhqq3gzLyRJ9Ws1W7wrRdI9seqZ1gyPz44CDx+6H6CTpePr0vlstwp7uSSLr
	eiWrKUBX3o1iouv5cADVHnuF8m1QlfMb/3bq7TNGcHAVMrTDtiidyo5cTHKHSRJDm7NH9hOufq+
	5K4nd07nk4noplAtdsmJcm4rAjRv45hYN2QBGRQ5Iymvhh845vHC4eMwEmLRcu3IliKRUyRpzN0
	FDO/9O/h+tuVE8Xk4EQ==
X-Received: by 2002:a05:7301:2511:b0:36a:1872:4b35 with SMTP id 5a478bee46e88-36a42203e6fmr1814009eec.2.1793333833628;
        Thu, 29 Oct 2026 21:17:13 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:7476:5b7a:d979:2d91])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm3329154eec.19.2026.10.29.21.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:17:13 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Josef Bacik <josef@toxicpanda.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 2/2] zram: lz4/lz4hc: accept dictionaries of more than 64 KiB
Date: Fri, 30 Oct 2026 13:16:50 +0900
Message-ID: <f2ac22a731e507e90217a5e9cf29c987ec24e2b0.1793333729.git.senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
In-Reply-To: <20da9e9a5ffefd1e6875e311d3740b9f3c1061f3.1793333729.git.senozhatsky@chromium.org>
References: <20da9e9a5ffefd1e6875e311d3740b9f3c1061f3.1793333729.git.senozhatsky@chromium.org>
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

From: Josef Bacik <josef@toxicpanda.com>

From: Josef Bacik <josef@toxicpanda.com>

LZ4_loadDict() and LZ4_loadDictHC() only use the last 64KiB of a
dictionary and return how much they used, which the zram backends
take for an error.  Expect that instead.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Jens Axboe <axboe@kernel.dk>
---
 drivers/block/zram/backend_lz4.c   | 4 +++-
 drivers/block/zram/backend_lz4hc.c | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/block/zram/backend_lz4.c b/drivers/block/zram/backend_lz4.c
index 9767482a2fea..bad648c158da 100644
--- a/drivers/block/zram/backend_lz4.c
+++ b/drivers/block/zram/backend_lz4.c
@@ -4,6 +4,7 @@
 
 #include <linux/kernel.h>
 #include <linux/lz4.h>
+#include <linux/sizes.h>
 #include <linux/vmalloc.h>
 
 #include "backend_lz4.h"
@@ -39,7 +40,8 @@ static int lz4_setup_params(struct zcomp_params *params)
 		return -ENOMEM;
 
 	ret = LZ4_loadDict(dict_stream, params->dict, params->dict_sz);
-	if (ret != params->dict_sz) {
+	/* Only the last 64 KiB of a dictionary are of use */
+	if (ret != min_t(size_t, params->dict_sz, SZ_64K)) {
 		vfree(dict_stream);
 		return -EINVAL;
 	}
diff --git a/drivers/block/zram/backend_lz4hc.c b/drivers/block/zram/backend_lz4hc.c
index 2d1364a29b27..5825c8ba78da 100644
--- a/drivers/block/zram/backend_lz4hc.c
+++ b/drivers/block/zram/backend_lz4hc.c
@@ -4,6 +4,7 @@
 
 #include <linux/kernel.h>
 #include <linux/lz4.h>
+#include <linux/sizes.h>
 #include <linux/vmalloc.h>
 
 #include "backend_lz4hc.h"
@@ -46,7 +47,8 @@ static int lz4hc_setup_params(struct zcomp_params *params)
 
 	LZ4_resetStreamHC(dict_stream, params->level);
 	ret = LZ4_loadDictHC(dict_stream, params->dict, params->dict_sz);
-	if (ret != params->dict_sz) {
+	/* Only the last 64 KiB of a dictionary are of use */
+	if (ret != min_t(size_t, params->dict_sz, SZ_64K)) {
 		vfree(dict_stream);
 		return -EINVAL;
 	}
-- 
2.56.0.317.g454f8302e1-goog

