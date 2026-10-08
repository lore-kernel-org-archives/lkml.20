Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494794F55DD
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 18:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791484126; cv=none; b=CdrL1tx11EXba6XUjE8Dyoie7AM8lSWDz16v+acLhyPLA7R6xvRM2FFSIWMiUccLzxSvLjuy24Pl/sX5SejydVJRCzH29eoHKTFcouwEvdOno8xrKqsovDmdZmfqJUSPbTRKpHO5/fVl3Qc4oJWgBthbRUDEUwhg2hus7aTWPEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791484126; c=relaxed/simple;
	bh=rCtITXYowpLqhFRbUXPUKucGTlz+7E7YWeAElPfIAMs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hf97Wr4w6ek8FRTGk7Ga0JAiXINhGbU79glk91WUwD3ozk6fo0kn02XZG4EU3BXkmkwZ6LwFqiui8u5wEgdV5wSYcCmbkMrUtbQ/sbRhwWuElvvCip4gaA3mSlLNfCP9r+XEvhrvHGsyuBGgCSF672vnbx1HRt7/VoQheUX8q0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bjz3Meml; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bjz3Meml"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15dd124bbe7so4562433c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 11:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791484114; x=1792088914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4EAC3tfhBdLfYAd9CNDrPAiNc4+pBWw6wHTFnfZXC+o=;
        b=Bjz3Memlpozv+Qt8wTVrnoijMFq4mX9AAaAe45yeGNbcDOB5H8e7DeCI/TlT1+U/Kk
         ZVL05PrrQqPf9AVnjYuLqzAXUwVgfRBpaxskc3n5NJUebVBKKi59Yeqs2vzwrK9wSLva
         DhnUpRhQBa6K9oYWvHIEdwyts6TqtkzOUnkitwolujgJlglPUH9b3pOjHKeVa1W2vtVs
         Na3jfQ4gZklwiI0O2gpMH2FDMlU8awwMWrEt0+lHzDbFjj8ZVDMjHSUqrIIGEr5gsaVC
         4VkYi5v9gGl7iELeMDhuIZfbCduwWug/30qXxyxfK2452UfkJ9rvbvD06O88EJKRUhZ1
         iFCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791484114; x=1792088914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4EAC3tfhBdLfYAd9CNDrPAiNc4+pBWw6wHTFnfZXC+o=;
        b=w/yEuiAEPysDkaG98IBgFPMBxGKv/PRldxitKoOVcJ8XV91+8nQqYf5rA+Z0NQglg2
         Nd7MTTuS0JUGEuvVlDezI2b7sWM4UMT7eUb36H9Uiuzv5yVBL1cw1AzFGH42WlnANg9B
         3XceCxonlgD0rc9afKHWAlFTdq40dDKZpBj+ER4x95Li6xJ0bUnSXDJoE7idMbkr60OB
         nPIMuUwcGM19WwlOzTnW1i9l2RiaKHN47QG6kBoL8vbGQjb0XCdzXp+f4wdUj4LvW6Zc
         v8Kl6sPoyH9a+9cq/74ClZ5jyI0n4YJKRzjQ827j4nx13hyC84Udn9mISrZWgbvH9i1/
         axbg==
X-Forwarded-Encrypted: i=1; AKwUvByRa1I3eeJU5dPjhug4jcV5nBHa54y+ezM0x6UnFl6m7Pp27y2OA8bTBP4oBdBRKknZxC1WsZ8C2MBROyo=@vger.kernel.org
X-Gm-Message-State: AFuF++nQwz0RvrLsFtSaaSodE0EuzoHz0W+sB3GZ2SCNXLEAHhQpkPiD
	/28jY5HzU5zle3j5ytHlUjEdqmENTTnEk3ufLm9rEx1IzoS6wYNX2hO/
X-Gm-Gg: AYBFou0Q+u1drnuHL8GmTEITbWYMU3SWIOrEdEqoN1EI20Bzf4ml1mUdAib8zyo1JWF
	NojjKBa8JG7l+7DCqIdxtp4C0uMKcSwQIa4bDw+GJkMQSYc2dObt+5mPwamui5k248JOLIWLwkT
	vmy5/yqIwI+bJtrTgaFO4uoA/sTBmgKjxsmbfL/UyBuQ5iWOuDgOQheswhowTw5dMghvMpQMWqr
	+Bc70mibOP0wHQr59pDYIRHCjtT6RPYSHiv6+76MUjn+Ad+K9lmr/y6b1MBtMgoX9j+lMVuPFeO
	W9/tnR/pjAsyd2OI3R9NdLSQzzI7wWdZY+7z8RC9qA1FCG2wR4FpTq3zVuT+5kVz8Hwk5Kn817P
	+lKxwTC+HawD2ClMAQGNryePGB/hNe2m+r0Yn45F2s4wL9qAYsJfHA/ZExSA3dcHWAuX10qA/ED
	bC6ZGF+wrozwP31D1YBqIlxOuG7SXTijSVAVJnKSSi00aWhH6LqfBRlfxCIVdMyprlut9NTNd1O
	RRx+7n9h7g=
X-Received: by 2002:a05:7022:296:10b0:168:3243:c90c with SMTP id a92af1059eb24-1683243cd45mr1540837c88.15.1791484113969;
        Thu, 08 Oct 2026 11:28:33 -0700 (PDT)
Received: from penguin.lxd ([12.187.136.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a2d2db98sm57236c88.10.2026.10.08.11.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 11:28:33 -0700 (PDT)
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
Subject: [PATCH v1 4/8] crypto: acomp - Add API to get a compression algorithm's batch-size.
Date: Thu,  8 Oct 2026 11:28:10 -0700
Message-Id: <20261008182814.27450-5-kanchanapsridhar2026@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261008182814.27450-1-kanchanapsridhar2026@gmail.com>
References: <20261008182814.27450-1-kanchanapsridhar2026@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit adds a @batch_size data member to struct acomp_alg.

An acomp_alg compression algorithm that supports batching of
compressions and decompressions must provide a @batch_size greater
than 1, representing the maximum batch-size that the compressor
supports, so that kernel users of crypto_acomp, such as zswap, can
allocate resources for submitting multiple compress/decompress jobs that
can be batched, and invoke batching of [de]compressions.

The new crypto_acomp_batch_size() API queries the crypto_acomp's
acomp_alg for the batch-size. If the acomp_alg has registered a
@batch_size greater than 1, this is returned. If not, a default of "1"
is returned.

zswap can invoke crypto_acomp_batch_size() to query the maximum number
of requests that can be batch [de]compressed. Based on this, zswap
can use the minimum of any zswap-specific upper limits for batch-size
and the compressor's max @batch_size, to allocate batching resources.

This enables zswap to compress/decompress multiple pages as a batch
to improve swapout/swapin performance and memory savings.

Signed-off-by: Kanchana P Sridhar <kanchana.p.sridhar@intel.com>
Signed-off-by: Kanchana P. Sridhar <kanchanapsridhar2026@gmail.com>
---
 crypto/acompress.c                  | 14 ++++++++++++++
 include/crypto/acompress.h          | 12 ++++++++++++
 include/crypto/internal/acompress.h |  3 +++
 3 files changed, 29 insertions(+)

diff --git a/crypto/acompress.c b/crypto/acompress.c
index 8c9a76073159..192ea996e779 100644
--- a/crypto/acompress.c
+++ b/crypto/acompress.c
@@ -318,6 +318,20 @@ int crypto_acomp_decompress(struct acomp_req *req)
 }
 EXPORT_SYMBOL_GPL(crypto_acomp_decompress);
 
+unsigned int crypto_acomp_batch_size(struct crypto_acomp *tfm)
+{
+	if (acomp_is_async(tfm) &&
+		(crypto_comp_alg_common(tfm)->base.cra_flags & CRYPTO_ALG_TYPE_ACOMPRESS)) {
+		struct acomp_alg *alg = crypto_acomp_alg(tfm);
+
+		if (alg && alg->batch_size > 1)
+			return alg->batch_size;
+	}
+
+	return 1;
+}
+EXPORT_SYMBOL_GPL(crypto_acomp_batch_size);
+
 void comp_prepare_alg(struct comp_alg_common *alg)
 {
 	struct crypto_alg *base = &alg->base;
diff --git a/include/crypto/acompress.h b/include/crypto/acompress.h
index fc0665b77a8f..06578c4367f6 100644
--- a/include/crypto/acompress.h
+++ b/include/crypto/acompress.h
@@ -593,6 +593,18 @@ int crypto_acomp_compress(struct acomp_req *req);
  */
 int crypto_acomp_decompress(struct acomp_req *req);
 
+/**
+ * crypto_acomp_batch_size() -- Get the algorithm's batch size
+ *
+ * Function returns the algorithm's batch size for batching operations
+ *
+ * @tfm:	ACOMPRESS tfm handle allocated with crypto_alloc_acomp()
+ *
+ * Return:	@tfm's acomp_alg's @batch_size, if it has defined a
+ *		@batch_size greater than 1; else return 1.
+ */
+unsigned int crypto_acomp_batch_size(struct crypto_acomp *tfm);
+
 static inline struct acomp_req *acomp_request_on_stack_init(
 	char *buf, struct crypto_acomp *tfm)
 {
diff --git a/include/crypto/internal/acompress.h b/include/crypto/internal/acompress.h
index 93ae59623f13..b790722c263a 100644
--- a/include/crypto/internal/acompress.h
+++ b/include/crypto/internal/acompress.h
@@ -28,6 +28,8 @@
  *
  * @compress:	Function performs a compress operation
  * @decompress:	Function performs a de-compress operation
+ * @batch_size:	Maximum batch-size for batching compress/decompress
+ *		operations.
  * @init:	Initialize the cryptographic transformation object.
  *		This function is used to initialize the cryptographic
  *		transformation object. This function is called only once at
@@ -47,6 +49,7 @@
 struct acomp_alg {
 	int (*compress)(struct acomp_req *req);
 	int (*decompress)(struct acomp_req *req);
+	unsigned int batch_size;
 	int (*init)(struct crypto_acomp *tfm);
 	void (*exit)(struct crypto_acomp *tfm);
 
-- 
2.39.5

