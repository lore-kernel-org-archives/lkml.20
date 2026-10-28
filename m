Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793156714;
	b=OIsqPHUkV8s0b053l1X6barlDZUmLAyS9HF09aszR1eyw7s0bqge4PuSpYcxd5qwHZSX
	 nLdnXpJBS93dqlTH9I+Hbh3VsgSYPqxOr//3TJ30CmyMMHFTU/UVtZ8qf//YTx6bYmGa2
	 yKTiVClZ6iwl2mz0xfkddlJbX/u8ioc3I5XjBpPj56jbvJIPgbm7PZYcfX1yJlBow67j3
	 QwA+oF0/29zlXqm2ZWltqcL2urL91eQ29Cl+eh6s+EXS583vxSUFiOWMk3Zps1P8o4gyY
	 IuQY3eySctXRqvkQ0Ex+tiPpcgxRcp9IvTE/O9+xVt/npxVtXNd6bbvMe+4m7WRr90Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=utdVWrZ7wDvsHiY5NKnbSY5PtnmQf+otNqNinuRgHkM=;
	b=LjM/ruwFZZ9MEkIj2RSMsHBI5CodqZhJRSxNsHLF2j4mtisRdAjTyYddzyCjzo0o7iMl
	 xrRDMF9VFrNrPUEB+J0GGykPF2bJh5HmXEi+uppHtw6iEjYbkKXzCjBg1i1qzT2fDRu6f
	 oIYvLFjTcaeQG8m5Ic7XzI38g3B7O3A/nulNEBFYuwBXwbV0W7HCENy07UbLuODaVKz8E
	 P5soC/zFeo1/FnPYaROwGaC1e3kS4HDu/tG9V+36AcF0Ti1YXBbHLwTVxqEg8RoyMjpcX
	 /tg68R06W55LEWC+DeU3A1tH4a0cO3BjLOkeoxMFpH2y5h0MVFUY6v5gIZWh2w9+Vaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xURDjvvS;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F11606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:05:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84F11606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xURDjvvS
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1846bc43c28so606672c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793156714; x=1793761514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=utdVWrZ7wDvsHiY5NKnbSY5PtnmQf+otNqNinuRgHkM=;
        b=xURDjvvS5CeRpLr54S4UykhVVOvAKez0oUIJwugpJbvq/ogwZkRBpToytSyCSXXTl+
         eCsS+bRakCxscDujSK2i2DLCMQ3uGHTXoqTXZCHixawjWfpfek/Nvotc8if974EffshR
         mD9eMMv7GhBIzbSHhZ3nu5laoXR66/toRAf80rNIXI0rOqiWi2iP5QQNgAjBXl+qEMCw
         nG8RJAhyMD4Cf364zFYIMkIyG6Utpta32ZhRWRHBLPR+YBDbN1JisKOS++tjJ0BhEU0b
         wAonOm6t2wRDNxiLBEIXEZnTp0aubcoiNUi1E1q7Ix6Wz8pZbagWuUVil//E+rZoszmb
         I7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793156714; x=1793761514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=utdVWrZ7wDvsHiY5NKnbSY5PtnmQf+otNqNinuRgHkM=;
        b=dV5+0x9ad+3Fu/CIC3St6DyBJktkyu2nNs9Ej+V/W0jZOVb8IeVBkuRPBXXJBv57xT
         W+luewuhHvPwurnu5FQxWN/ZcmL6d9B9MDeHONTsnlE4z4rZ3XbBUFc7JpHL0kDbX552
         SFq6iqvDIh7jsMFXeGq17pxq2axmGaiYg5/RY1T9kQ6fwxB2HflFiYepvrFIFcSRpwJ1
         ddhe7xl6/aI6vM4hViO7MsGqp9R2msO0Hr3jeamfq45QptnYsY/bWzdFLR9JNBEjUdyU
         0de5xkEn1c7cuwT/XGnMdCySQmh/FezPDP28Sp0lKX/S39GCqRAmtwQZ0MZj7R/8TPjS
         uaHA==
X-Forwarded-Encrypted: i=1; AKwUvBzJZiuwfISPRrHZworJeS/7woC7AYHMgzxt51xTiWupKxM/ufZQTP6z4sV7CcteMoXb6bzPy3H4bjz2PIM=@vger.kernel.org
X-Gm-Message-State: AFq9FYItGbKictpk4EXFjnPwBD2e80AI7eFqQIA4YIcJMIZzssLrK3yY
	Vd5z5bFPc144NZsWODaEMUSE45UoDORMzsDI1iLq8YmDeIqzGWIuH7Nn
X-Gm-Gg: AYBFou0e9gUFD8r1JfqV526oib5GSYM58za6Wg2Y3AXCcN1DdhootVrNnLEoReDRgFn
	ucFZiE0qkWDF9DlPGdkmCldyeX/tROOMO47VT9402aPQspedpNmLUhY8oH3TNZFKPfulkTazaas
	Lghct9GZO8GRiwLvue6026723fceCLwMHNKflM0AHoKh8FD/VPGS/3f4GaGgz5wL7PSk4LtkZ9X
	iIFz1jf2HR69hcMn/INDkcX3dq5Vhs5pHBEvKeSfEUW8oB/b7zNwwARrsJxlCu3tqzYTBQzJsJS
	uV5yNTvJyTHk0Ci/1zzxS8pmAh0nR3VJpXOMM9tov+YIhtqjpqfoTPZu1ZCQQxFJjnIWau5DF+3
	Zm56eGfVoe26JwZWbFfjN9Y2Kb/Brnoj9jnsOMG0RnJIoKSYzcc9gE77XXvflxDruOAuE4oVG+8
	eNGouGPnPej5cgofCJwJX9RpIKo21PXc1PjynXLcwMoVGz7AsGPWHIH+gjKqNaKj64ERo14qVRl
	oKCrwWAs753GkkwsOjihGwQ3bmwRjV5GEB6iopdpiODd0Fzkk5ywMiRZtmUJIUk/1LbrwGTtYZZ
	L77ScfXI4fMHBT06ow7lGuvLu7eIhb/XiWI3qiIT3A==
X-Received: by 2002:a05:7022:404:b0:14f:b5ac:ace4 with SMTP id a92af1059eb24-1a6d00d22femr1741148c88.44.1793156713549;
        Tue, 27 Oct 2026 20:05:13 -0700 (PDT)
Received: from penguin.lxd ([12.187.136.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75a37093esm1150734c88.3.2026.10.27.20.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 20:05:12 -0700 (PDT)
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
Subject: [PATCH v2 2/8] crypto: acomp - Add bit to indicate segmentation support.
Date: Tue, 27 Oct 2026 20:04:57 -0700
Message-Id: <20261028030503.17923-3-kanchanapsridhar2026@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261028030503.17923-1-kanchanapsridhar2026@gmail.com>
References: <20261028030503.17923-1-kanchanapsridhar2026@gmail.com>
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

