Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793949861;
	b=NktLLB/J/0nY0UnAz8x14OOi7yXz5Bs4d2wUTXlyJTqwJiATY5zb0sOWE4QBH2kNeNKr
	 E+agQyOhSU9Ngx+eQNXw8KhRvPKgNlettBGGLiRPV1klRfSSUwqhifTkSEVOdhiMbaiTQ
	 ohjYkERYMFLFcLvrgqOHOpoJLwR4gHj9DRndUwsVAcNmDtIwr4sYQAboItV5fB3hPx/AD
	 Xj/F/GlJk7d5TfLwufb/wC8xp7t6evKrCsL9L0lZzsn8V7kqPUPi+tCirnmXd+qixN+WL
	 w06OkRUCLP0M+5GAvPmj/2Pl8ECozmYT//2p1CTphXERguC4ZrF+Wado4UCRpmqQs4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793949861;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=utdVWrZ7wDvsHiY5NKnbSY5PtnmQf+otNqNinuRgHkM=;
	b=SAGeIanT7c9gvEQxaVzv6kmIPeYZSfQH4yGg9pYkPbEi012exn/APTgA8orlyJDkdGoF
	 OLejMApEm8w6KLT8fL0HoK823Y7XilyMWN8pS+Ak8uCGxjb0LN/BfCqCv6twlIAyflxyF
	 Qq6Rf7sJ31pCTLRsl+A7hsHDl1BOApO3thSMf+NO4Su5g2dyBSkdk4eSOzWGTVDTC+d8y
	 aDHt1V4I9V71JSFlGmqkxyr8BS4ABMMVOgm7nbYJfwALfkZnZnAvQxE5sLQEntH+yAtXh
	 8H4CS8tDyyy6CreHGslKn8PzOlWbCzxATwePfZ/XMBhZLUkTG2FLA8hSoOqRQhH0rXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cNJ1ebuo;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94719606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94719606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cNJ1ebuo
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1a2761c69fbso902153c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 23:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793949861; x=1794554661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=utdVWrZ7wDvsHiY5NKnbSY5PtnmQf+otNqNinuRgHkM=;
        b=cNJ1ebuohMEZg1mB2uHM2RP7mOVAcfGmGJe2jbMcDpp0e4ZkN7p36+9BogpS9wEEPH
         qA8c4Gw+DVk9X84mQutFDAtJAET0KZ7L5zhllzDec82OiNyudxhgoo2eWwf3Nmpq6uP5
         Q09nMoxHABH8Yc3hpDQn9jfVAv3/lRF5nBH6bS2/ROpgFANvAvvu+Btf+UWPOvzF0vIF
         G1D0YhtSHpbkHrQLJ3Sz3ozTFk1RAbVOaoVZFgebCW/mWb5/2gganGsbp/5R9Ambkxx8
         0BhL7QS5Vds2zxXi+Civ1nRtekCxmPHdFwVYwEJBurklg+jFw2QnVh+WKc1oZRvcB1Rv
         V6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793949861; x=1794554661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=utdVWrZ7wDvsHiY5NKnbSY5PtnmQf+otNqNinuRgHkM=;
        b=Naa2ozZrUGna3IliyYU9yKheBsB+z9xdtmmNCv8EJGMaaW7lmeRYhbufFKfEdJv34C
         sgBhmiLHVN3ulIRalw1LgdG4PTJP3ecVHZlwBpFAj9sft82DXNBHwm0iDctnl7fY4RXq
         htW6VwYGrHk4yvN5CvCVHgyg6foP1oJBvKvBQGSq8hRw7WD1spkf1UJIJygijOwRP7GC
         bxCqJKGl9cCaipykC0n60lrcoK9XKqUEB1lCJeNKYWWcS1D7QQgOxb/+nBlCgKdSDsjq
         60iK1Oonqr4prTqtzDhK91w5AvRebSaYlbl7pu8e+pY7Qx6v+paOMttw7K/pRjzpjRu2
         gUJg==
X-Forwarded-Encrypted: i=1; AKwUvBwa8MZOeq5LVFDq7JJchOHNqJyU9Z9HBBriNO0MB/nfoTVZH6rHyEnkH+Hi+ktm7tPzAR4KEWs73N/rskI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QWv8Dy7aIjBZbdBUwZM8fuEIMkqlWo80Dxh1vml+2eOA4eGsk
	C++OZKkxkll4D4rSyhVALZuinKfQ3JFDzoK8kdFtOM3q145MPGKpB/JE
X-Gm-Gg: AYBFou1/S/PlnJbWQgUvB/Lv0pMb77fJ64lhiVAhEJKLv11YL7YNdYNePL34K9dNds1
	OcHR4yRnrFN0Ggk7RWHP2g7QIJSF5kPOY+MH4vSQQb912AmGwbeHyVVQxvi7yC7XiCYtpY9fBNf
	syEPXH3mY/lM+ETNVL+Ix/wDZVG0g1UaaZ7XYv6X1SBWUHoPb80fjqKeaF17IqxYTAfhuBdJEAD
	287r+IvoLn4G+N4zuNG7lUL6eCi/nPFs3pISH8byfXmHS+sqDMb5p5cx19aJgiHJvCt2Zh1S+Yu
	h84xQw/CR/S6qbZXCCvM/F+tDSem2fPFg4hqjkPkdlqSF+oqwhj7JHdWAdvP/f2FkZfEWyxtJMq
	5lQjsh0lbOYYgrH70/Ev11uE0FUg9GrSGVg4vsk1FZ+JIp4DgxhhcYxsN+WwLD8GGVVfpvkE87d
	Dl+c4ch9HR/xxbI4/xJEx21+/uI1NfPbll4bXHfz6Z0iTD1uuqWHaBZu4xSoalCk/UA6wsun9JB
	tanQ0HyOYqQpRYg3omR4jcacFe9lxzu2gH/Trz60MIqWqlE95QBakzzWShFDNHUnbkg5MgFRrwZ
	zG+Ne0HCyvpofau8SxexFvEtwRluXsdwqZzEmfXf2g==
X-Received: by 2002:a05:7022:ea8c:b0:19b:98bc:326f with SMTP id a92af1059eb24-1b25d31f475mr2175998c88.18.1793949860685;
        Thu, 05 Nov 2026 23:24:20 -0800 (PST)
Received: from penguin.lxd ([12.187.136.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4840f3sm6262220c88.5.2026.11.05.23.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 23:24:20 -0800 (PST)
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
To: hannes@cmpxchg.org,
	yosry@kernel.org,
	nphamcs@gmail.com,
	chengming.zhou@linux.dev,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	linux-crypto@vger.kernel.org,
	kanchanapsridhar2026@gmail.com,
	linux-kernel@vger.kernel.org
Cc: rientjes@google.com,
	willy@infradead.org,
	senozhatsky@chromium.org
Subject: [PATCH v3 2/8] crypto: acomp - Add bit to indicate segmentation support.
Date: Thu,  5 Nov 2026 23:24:06 -0800
Message-Id: <20261106072412.7909-3-kanchanapsridhar2026@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261106072412.7909-1-kanchanapsridhar2026@gmail.com>
References: <20261106072412.7909-1-kanchanapsridhar2026@gmail.com>
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

This patch adds segmentation support for compression.

Add a bit to the crypto_alg flags to indicate support for segmentation.
Also add a helper for acomp to test whether a given tfm supports
segmentation.

Co-developed-by: Herbert Xu <herbert@gondor.apana.org.au>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
Signed-off-by: Kanchana P Sridhar <kanchana.p.sridhar@intel.com>
Signed-off-by: Kanchana P. Sridhar <kanchanapsridhar2026@gmail.com>
---
 include/crypto/algapi.h             | 5 +++++
 include/crypto/internal/acompress.h | 5 +++++
 include/linux/crypto.h              | 3 +++
 3 files changed, 13 insertions(+)

diff --git a/include/crypto/algapi.h b/include/crypto/algapi.h
index 05deea9dac5e..7d406cfe5751 100644
--- a/include/crypto/algapi.h
+++ b/include/crypto/algapi.h
@@ -280,6 +280,11 @@ static inline bool crypto_tfm_req_virt(struct crypto_tfm *tfm)
 	return tfm->__crt_alg->cra_flags & CRYPTO_ALG_REQ_VIRT;
 }
 
+static inline bool crypto_tfm_req_seg(struct crypto_tfm *tfm)
+{
+	return tfm->__crt_alg->cra_flags & CRYPTO_ALG_REQ_SEG;
+}
+
 static inline u32 crypto_request_flags(struct crypto_async_request *req)
 {
 	return req->flags & ~CRYPTO_TFM_REQ_ON_STACK;
diff --git a/include/crypto/internal/acompress.h b/include/crypto/internal/acompress.h
index 9cd37df32dc4..93ae59623f13 100644
--- a/include/crypto/internal/acompress.h
+++ b/include/crypto/internal/acompress.h
@@ -189,6 +189,11 @@ static inline bool crypto_acomp_req_virt(struct crypto_acomp *tfm)
 	return crypto_tfm_req_virt(&tfm->base);
 }
 
+static inline bool crypto_acomp_req_seg(struct crypto_acomp *tfm)
+{
+	return crypto_tfm_req_seg(&tfm->base);
+}
+
 void crypto_acomp_free_streams(struct crypto_acomp_streams *s);
 int crypto_acomp_alloc_streams(struct crypto_acomp_streams *s);
 
diff --git a/include/linux/crypto.h b/include/linux/crypto.h
index b7c97f1c47c9..78c699ac3f82 100644
--- a/include/linux/crypto.h
+++ b/include/linux/crypto.h
@@ -139,6 +139,9 @@
 /* Set if the algorithm cannot have a fallback (e.g., phmac). */
 #define CRYPTO_ALG_NO_FALLBACK		0x00080000
 
+/* Set if the algorithm supports segmentation. */
+#define CRYPTO_ALG_REQ_SEG		0x00100000
+
 /* The high bits 0xff000000 are reserved for type-specific flags. */
 
 /*
-- 
2.39.5

