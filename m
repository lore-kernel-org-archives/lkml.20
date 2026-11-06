Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793949860;
	b=Fjg9e3WwZ3jyyz14LT36BfROSvJU/FwcdIXMVPJNntrTT77pkE+VlRI9J5axOgMUE2K6
	 cgzauOZ2MBZzLfgekO/AhbK+FipB0WEjtmb7Ja4tsRYpxxGShDz5YZt9hqFpwg8Q9GXvG
	 QmB7gUqwQUHi10c6XnRtaXg0Pn0+3bGo+g0QIUQEE+myvf5peH830zk3Ruriq2mTK3GE3
	 fkjZDon0ChJ+9+AJKDcTEefXieI9k2GEH0a5E6RswLkdR0FuYqh0aZ7SHfxG3vbY3h3XB
	 OFVbDe5wnFEiYinzxsUjflXHN8anaFZmbOsKoD7b/kFwkrTt1Et0yhnZamdKe8EpgRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793949860;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NH6LLO5d9K04QGTJQAsM95fgRxp71QEQs7Ta+RyYI+A=;
	b=Vv+hhHa/GgHXDB7phQ9zoW7pV06XwbksFMPBfxraFsQsdmKKsHUr7Oa4WFg3KKRRFKGP
	 U4fREEs3m6lT8gkHVzf3QsdmZAwnsv87IxgDuCU9HESB7DnKqO5gscqmBu3EZ24D62Dv6
	 ZvFmHMy4yUroX8D/rSNNpexNhN6hrtrbhAbpyTYCRwY01c6itBqwtSi6BsC0Q48ODefGu
	 rrye3tcYOUL9wD8manBoiyEf64kQLt+14KvVE73q3+klJlalAoYMxD2ACi922ak3U8GYw
	 aBD92X7/mzk1GVTyyNpnP0LMeawdAIrDXeqLCI1utgDMXQffXJp5uWtNyKKyh/gbeow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FZ0FPByG;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F62C606A32F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F62C606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FZ0FPByG
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15dd124bbe7so814068c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 23:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793949859; x=1794554659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NH6LLO5d9K04QGTJQAsM95fgRxp71QEQs7Ta+RyYI+A=;
        b=FZ0FPByGmDXRI8FmoXBff7bpj+H16OjqZ3ME8Cu1cKb86VVDIuvSq/1mBRd+n9vTWX
         ASIfbpnQt7mBbiDyUChz710f8XK9tClWAYL7nTRyr4I05Ft9fq1ImPB/kWlcbvKDGvy5
         2dzgp6cABNQOuABB1ZTE6CZX+7wlJJhQu9G1FIIiWMAVEAkmX0Waqy6sEQIjk0Lj8m5r
         mWZSfQF704JypuLg2aa0wP1MmSlFV1NEupYVV3l54eeshuaVMwIsZrFD7qAY3sNxkqEw
         rq9sldcSjbL0yuYzeftBpyXHZk4KEI31twdXD02HwU1Oxn7aGGMXjiXOx21IC1LWK7qh
         wT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793949859; x=1794554659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NH6LLO5d9K04QGTJQAsM95fgRxp71QEQs7Ta+RyYI+A=;
        b=PSLMEOAP3K5YK5rv4+PrqYZfxRx5AVSZCI4uf/c32jFNezpyW/p/JLJmxckdGQVvDU
         nHuV8k/sdPNvzHCnWOnktdz8WrgVTV2ynX8TBKiPNvhpUxA+7zpQ4ANhe2ws5/3hHAyH
         2FhBch6iFvzwA/nGkHgR50Ya8uZb5rqvWY0P+SBVbkPP3u3BVTQ8Flqs+HlTj7LxXiSH
         9cFwC5C8ANiZt2+3TZOSSN7OUtBvARvL+pT/6nncrtihlfn/kZHFpQC9s3JK5HuU2zBo
         uaci0klVKFjPaY2Fd2ALDQ/8xI5Ze3j8NU/sN/ogpzSdfevopHxZwEF/K+01CS48YAKt
         r2AA==
X-Forwarded-Encrypted: i=1; AKwUvByFix5zZOdq1UGRUklnR+YDNz5AEefSRucra+lLOViuoCPlWfdhJjIcYALQ6/hjYFoO8Tmi9UInzdZg0HA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cn9VzT7p7RMfGTnsUdbivLPMBdz7rE78hnGl/HmYVshQx6Eq+
	1Opc5nKb86nS4nodzpj6AVcJiVb0vfVKU2cARcM2oD+cy2j5X3NyAmJD
X-Gm-Gg: AYBFou1IlI3d/5u3IIfM8pYg95r5XELCACfFyM5am6cp43sCpIcQvkVu3dJq8Gf4fVG
	Y3SbnwxXwlh01SkptzzYqIFuHJwQsITjmY9/Wpa/YIcIfKn93abedM1Od4Qc3f/nRAenjKNYRA1
	bOhUgakpZZw33L1TAS3vlsZI1BN07HKyXWZwgzJcf/fwts2HzxWdGIAim0xOD2YJKwn8CS8UIqu
	nCBGwfvThKpqVoC0lMjwmY6Btzc8qyVCsWbTygg4+Jz0u/+eMkwQzEcKxKuUT+nceb5CZ+ShTy4
	XDtazJ0UvCVbgxuFmuO4s7mRTQg33tSosBwFi9R1ZOwP3tDY1vwa55Qb1zMG/xvb1xUzlcEaJ7C
	AejPyY25/vRWeg/Den+h0msywzhsfCTMJFedZLEAPxxqryzTDQ+mVSEBESCc/IxvwR0dcYqzgrb
	bIDdRdLi3GIMSIjo8GfT4zvKavlCPGLt0EvA98rGMg9k7uM2DAs9h5OBIa3Ibuxa3W5U76+qbCg
	r4aI8GvHyIPgbpjyn7Jm0hN6sXl2N1v0pFWYh5fwB9W+cypC00TlRprQLFBCOLTzQHuyrdYYsn3
	1xYHn3GhLAkvghwIaTZA5f1KdPE33ScZXQym/b7BOg==
X-Received: by 2002:a05:701b:4301:b0:16b:fdbf:4a9c with SMTP id a92af1059eb24-1b25d32cfb3mr1771497c88.23.1793949859398;
        Thu, 05 Nov 2026 23:24:19 -0800 (PST)
Received: from penguin.lxd ([12.187.136.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4840f3sm6262220c88.5.2026.11.05.23.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 23:24:18 -0800 (PST)
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
Subject: [PATCH v3 1/8] crypto: acomp - Define a unit_size in struct acomp_req to enable batching. mm: zswap: Set the unit size for zswap to PAGE_SIZE.
Date: Thu,  5 Nov 2026 23:24:05 -0800
Message-Id: <20261106072412.7909-2-kanchanapsridhar2026@gmail.com>
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

We add a new @unit_size data member to struct acomp_req along with a
helper function acomp_request_set_unit_size() for kernel modules to set
the unit size to use while breaking down the request's src/dst
scatterlists.

An acomp_alg can implement batching by using the @req->unit_size to
break down the SG lists passed in via @req->dst and/or @req->src, to
submit individual @req->slen/@req->unit_size compress jobs or
@req->dlen/@req->unit_size decompress jobs, for batch compression and
batch decompression respectively.

In case of batch compression, the folio's pages for the batch can be
retrieved from the @req->src scatterlist by using a struct sg_page_iter
after determining the number of pages as @req->slen/@req->unit_size.

Please note that acomp_request_set_callback() sets the @req->unit_size
to 0.

In zswap_acomp_req_init(), after the call to
zswap_set_acomp_req_callback(), we set the unit size for zswap to
PAGE_SIZE.

      acomp_request_set_unit_size(areq->req, PAGE_SIZE);

Suggested-by: Herbert Xu <herbert@gondor.apana.org.au>
Co-developed-by: Herbert Xu <herbert@gondor.apana.org.au>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
Signed-off-by: Kanchana P Sridhar <kanchana.p.sridhar@intel.com>
Signed-off-by: Kanchana P. Sridhar <kanchanapsridhar2026@gmail.com>
---
 include/crypto/acompress.h | 49 ++++++++++++++++++++++++++++++++++++++
 mm/zswap.c                 |  6 +++++
 2 files changed, 55 insertions(+)

diff --git a/include/crypto/acompress.h b/include/crypto/acompress.h
index 5d5358dfab73..6462fc46f4ec 100644
--- a/include/crypto/acompress.h
+++ b/include/crypto/acompress.h
@@ -79,6 +79,7 @@ struct acomp_req_chain {
  * @dvirt:	Destination virtual address
  * @slen:	Size of the input buffer
  * @dlen:	Size of the output buffer and number of bytes produced
+ * @unit_size:	Unit size for the request for use in batching
  * @chain:	Private API code data, do not use
  * @__ctx:	Start of private context data
  */
@@ -94,6 +95,7 @@ struct acomp_req {
 	};
 	unsigned int slen;
 	unsigned int dlen;
+	unsigned int unit_size;
 
 	struct acomp_req_chain chain;
 
@@ -329,9 +331,56 @@ static inline void acomp_request_set_callback(struct acomp_req *req,
 {
 	flgs &= ~CRYPTO_ACOMP_REQ_PRIVATE;
 	flgs |= req->base.flags & CRYPTO_ACOMP_REQ_PRIVATE;
+	req->unit_size = 0;
 	crypto_request_set_callback(&req->base, flgs, cmpl, data);
 }
 
+/**
+ * acomp_request_set_unit_size() -- Sets the unit size for the request.
+ *
+ * This is a helper function that enables batching for zswap, IPComp, etc.
+ * It allows multiple independent compression (or decompression) operations to
+ * be submitted in a single request's SG lists, where each SG list ("segment")
+ * is processed independently. The unit size helps derive segments from a
+ * single request. crypto_acomp does not expect the segments to be related in
+ * any way.
+ *
+ * Example usage model:
+ *
+ * A module such as zswap that's configured to use a batching compressor, can
+ * accomplish batch compression of "nr_pages" with crypto_acomp by creating an
+ * output SG table for the batch, initialized to contain "nr_pages" SG
+ * lists. Each scatterlist is mapped to the nth destination buffer for the
+ * batch. Depending on whether the @req is used for batch compress/decompress,
+ * zswap must set the @req's source/destination length to be
+ * "nr_pages * @req->unit_size" respectively.
+ *
+ * An acomp_alg can implement batch compression by using the @req->unit_size
+ * to break down the SG lists passed in via @req->dst to submit individual
+ * "@req->slen/@req->unit_size" compress jobs to be processed as a batch.
+ *
+ * Similarly, zswap can implement batch decompression by passing an
+ * SG table with "nr_pages" SG lists via @req->src to process
+ * "@req->dlen/@req->unit_size" decompress jobs as a batch.
+ *
+ * This API must be called after acomp_request_set_callback(),
+ * which sets @req->unit_size to 0. This makes it easy for users of
+ * crypto_acomp to rely on a default of not opting in to batching.
+ * Users such as zswap opt in to batching by defining @req->unit_size
+ * to a non-zero value for use by acomp_algs supporting batching.
+ *
+ * @du would be PAGE_SIZE for zswap, it could be the MTU for IPsec.
+ *
+ * @req:	asynchronous compress/decompress request
+ * @du:		data unit size of the input/output buffer scatterlist.
+ */
+static inline void acomp_request_set_unit_size(struct acomp_req *req,
+					       unsigned int du)
+{
+	req->unit_size = du;
+}
+
+
 /**
  * acomp_request_set_params() -- Sets request parameters
  *
diff --git a/mm/zswap.c b/mm/zswap.c
index ad01c691a263..e1d57a7d9595 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -826,6 +826,12 @@ static int zswap_acomp_req_init(struct zswap_acomp_req *areq,
 	crypto_init_wait(&areq->wait);
 	zswap_set_acomp_req_callback(areq->req, &areq->wait);
 
+	/*
+	 * This should be called after acomp_request_set_callback(),
+	 * which initializes req->unit_size to 0.
+	 */
+	acomp_request_set_unit_size(areq->req, PAGE_SIZE);
+
 	mutex_init(&areq->mutex);
 	return 0;
 }
-- 
2.39.5

