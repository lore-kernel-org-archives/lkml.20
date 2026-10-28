Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793156717;
	b=Rv9bLjBl91es9CtUsDqakrh2ubb6dH3BdQOKP+ErMJIioJpV4Jttdbeu0WCpCQ0kl15C
	 bD5gqcMWkbGYH0QQ261IXogxiNF0nwES0VMEzVmTMz13v7DtdX/8y9EMRt7M25LTXwW/g
	 4SnoLmapdQGNIwYDeIOBEEdfKFS4pNLfGCfu7o5gJHP/2RVxlOB6RRJO7utclD0WsVQim
	 ydlVhkvwhx4pDnNwWhETKsVSENvlHwj0933WWd6E/lIsX43oyGa+Z0St2l2VWB0aby7KS
	 WbT8wVpmnS+lrJ555zqa4KvysQO6i86v14OGLJCvq8ZJI0keVJkEVZjT3/qfjI2yvVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6azg2ZIUW0JXRWtBfLZZ7HNRUXzOL/ZgPLL5NXPpASo=;
	b=YkrRQLd3xQEEFivofwem7R3/EPeB6ydNGqrEnCdw6sknDpqESUIUlHZwqPd049VoQ6/D
	 AY3+2feBSDAkgS0prIPdply8A4CtHS/lqFYYvoFpxzoD4mkjHIIcbYFigBzKVsQVyLcko
	 uvSMNBaTNSCS9fuGG6TfZ5pPPthkz44Q9fQ/6+/CAdLLGm2m44hQsNz+o72AtS57DW7ib
	 la+mw7CQnW/6aafA9u5FX+NySEZmKriSGxuXmEUqzSX0+SZOiR4owIHYDR64lmvU84jww
	 ZI1/FUhTqk2oXHFUSRUszVK2bp4DMcThqmlr1LpFTvdZF+6oEi/LIcETnJfmEJF2QIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sefrKQ8s;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6510B606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:05:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6510B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sefrKQ8s
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-14394530ec6so584477c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793156717; x=1793761517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6azg2ZIUW0JXRWtBfLZZ7HNRUXzOL/ZgPLL5NXPpASo=;
        b=sefrKQ8sKRzJ/P6M/DreAi6oi0wGbc223zvIhQtUpr13/ouBnT8elIwsDFNTTjYu3X
         ew5pi34nH+MGVXQsjqz7SXJ9lQgmerNc2gKTWtzw9RGPDpfq+RnIkrjF6spLSd0yqj+g
         ypThZ9C4xO4Zso8y4Sm7+b0Bq+uoFNOrngFmF/WTCd0Yup83Dk9jFvHUMzIQJcd6EtZs
         669P4jMHOoE6WvXUSpYeFC9nLnVsAElfepx9C2iM6+p6QF8qbWkAVHno1/jD5Zg8P3Vf
         WDRe/ugbgvIPuKr6edaUW6Tng7zBGEGWnMALyDzP2tolkv2ESJyl2UygRTUaI4MKCpAX
         Ni8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793156717; x=1793761517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6azg2ZIUW0JXRWtBfLZZ7HNRUXzOL/ZgPLL5NXPpASo=;
        b=0pvWAqOontNZLcyUAiL/q44QyODbv1x0Q3mEklN28H07QePsjoJeuxj2X8cqK9F8F5
         3eLZg7U5JAdt3wQVb5b3XmPnQxExJz0yfoe2XUMNmvYK6dATDfsiC6vZtHFz9hT6pa8l
         1E8xyqPws1bsd8mZA15y/wQgOq7Jo+8uJMimc4G+UadKIr8l+fQbjxryWrZiTGuWaXmG
         EbF5bJ+VrDLUZ8Wak0tr+DlNda7OFC4pAmZrv3V7pTr2TprIIjT3JkaON7XsHZkxNwt7
         9sPM4kF/HB8prSVI6ne6+FZkmcYEAX/AjWUCe6CnSn4CF7KEPlyUhX54ZpFTdL3o3e86
         1sGw==
X-Forwarded-Encrypted: i=1; AKwUvBysXQFhIoB85aDDe11u0GfUmqJmTOFART9oZdn1CQWuvhxmcZFiVHZYjf1yxq2xqosAkqb8sUV65r23qAQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0ilhPu0BK+jlMHsHTT87LrQnENAhh/hqpAbRnDegU2kDqECKm
	p1E4OpXgU0xlyDb5K/8OM/FL6AEgR9++QGyngcIIhlY7WAzzVvKsFKDY
X-Gm-Gg: AYBFou0FKBHVUlBfghY1nLDIVPKG/yQeG1fA1HINDwTrOlMmrBu6mIiXvbrJS+IiXgw
	Gnq8++PC5CKMtgUfOA60gbe/X0GeEMyIhOOHahiLWrMrWUvGJg4C8smKIsM1mxac9QMaIYg6M2U
	QToiJNkFrTSpNFAFDSKNFrZGNBzJ8X9Xsu9kX5ZiUBPBbk+XBAgup293ldVsDZRJtxQHJ368sxu
	5QSqjV8OWqCg3A/71vKG5phh6+SFAY6Ri7tNySWyEx06gztcNqZoOL7LOb1dwcI3Uigig5rY1CX
	CvA1ctXA9urP6in9uraclb/lcbBqNG30tzNI0lHQCD7BTzp9sojtspDADsAEjBGSCSihTYycv6r
	0sH86YIlY9hqhk8dISlZb72KKhX77cbozjqOcRy6xohs7U63vJmMIEwSsWDYeSiNY13dYl1RiQh
	yNbXFEBpxReIgD/A7bOS1mHV+rijfHgmJeolTNctB/1efVhR82F280Et28BODqvXxPHXGv6Hqsq
	lU3v0reTfT+VFATZbQwSSnNc0dXB94Uo/uSa/jeJCtKUjAsQmAa9qeagzkT9/d3zmMWR0qC5E7V
	AVdlJcDHnpmttgkdyTnk8bWfSq+s3JbAZvPohvoBkQ==
X-Received: by 2002:a05:7022:6989:b0:183:7d42:cfb5 with SMTP id a92af1059eb24-1a6cfa0c476mr1988744c88.19.1793156716397;
        Tue, 27 Oct 2026 20:05:16 -0700 (PDT)
Received: from penguin.lxd ([12.187.136.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75a37093esm1150734c88.3.2026.10.27.20.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 20:05:15 -0700 (PDT)
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
Subject: [PATCH v2 4/8] crypto: acomp - Add API to get a compression algorithm's batch-size.
Date: Tue, 27 Oct 2026 20:04:59 -0700
Message-Id: <20261028030503.17923-5-kanchanapsridhar2026@gmail.com>
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
index c55b0e8eff3d..8e285cb7477e 100644
--- a/crypto/acompress.c
+++ b/crypto/acompress.c
@@ -326,6 +326,20 @@ int crypto_acomp_decompress(struct acomp_req *req)
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
index e64cf422510b..a71532ccb8dc 100644
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
index 0c0d3fc8a9fc..2d4d302d1b3f 100644
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

