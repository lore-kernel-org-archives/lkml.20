Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793156713;
	b=I7RULCWr95QSYSIGD10YLIGygyCPcUFuz8A3o4aOLEH8GxIqEu+7283+wKUL9GhCgnqa
	 M0wHN7xP3ugugrZyKdf2x3yTPgGEqk9w7JLwNAtUbeATu1Q89EMsPX2OVHUyZyJcsrhGZ
	 iozElGLglHHu6r+gq4mC8FzwigaYa4eclbxQTn9JX3EBVb7W2KPkAlDOJfLKbl2TkT3Rt
	 JEh68/FpMpeCel/UJvyvMmBzUuKXwZ4OaSYi5Zj/sufkQAgw97UvTUx3pUArQBP9xHdoW
	 QFD8E/zJ8a6UbptFxQ+McWy/Sj661i/Vq5YxEFgOHqyYOs10/CsXqJTg3ossGKfLJNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156713;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NH6LLO5d9K04QGTJQAsM95fgRxp71QEQs7Ta+RyYI+A=;
	b=vJzWIR4OvnejFoYdCm8if01azydnOno4X/0pPUPVWFgeblIEvExEvtvWjluf55wt3PQ6
	 3EwzGR6lEll0H66VltJM84uMIY7xOhcX5c8C3UT8cNn/kH6Sf+YTkplFxnz+f4dxj5oir
	 s8ma2hTcG6iERLqLgnNx7MY/xMzG/TNkrUIOm9391oZ8EFUyKxxclT19StHJ8PlzzykmC
	 Xpu14sNFMJRJNYLUhLzjFgY1cJqva64DuPAhLOzzUpuOMd3vjW6Irh7jV5EY7h+ws2fDw
	 FqV9kxT99b3AJqvej4u+Ox8Seq17Eh9+9WOYIG5WPuarhEM3mo5VhWP1i+R8BgSTn4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SKptKz+t;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAC3606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:05:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DAC3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SKptKz+t
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1507455eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793156712; x=1793761512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NH6LLO5d9K04QGTJQAsM95fgRxp71QEQs7Ta+RyYI+A=;
        b=SKptKz+thfwzeL5VgN+FrCyCuv5Bp3y4tMY7sQ05aaOvheU6PBvH4IrCVNjOH0qUsG
         2gu6Z1LAkHAAB1Y8SkAbPZfsUU4G2vUcLSi+N5MZrdp/q2PTywsbSWBiTmf8JyzBo915
         Bl6lXVEtjc3AlkswP+lT2rgAvnp2H8g8MUsziK20M+4sOTjZowM5DqBDUoma1bAWbSai
         80aY46Oeew4+sVNKsaNzkpw4sGTO8cS4l00LtHT7+ehTI3d3wsnAwdrX6dY1MsGRetPm
         x3RPjdCVwXhFz8wcGliz662+4QfSyZkLEEDeaKM0/NyNivTl87g3evHPTV7XBgpf5/5M
         rzfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793156712; x=1793761512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NH6LLO5d9K04QGTJQAsM95fgRxp71QEQs7Ta+RyYI+A=;
        b=C5DsXUCb3b3u3S1ZLZrcu3p5mYhDGmhWF8QU0PeGhhXvRrrvj0a2b7uX0fwD5mZDdv
         JzKRqU+yPSBbd9C0pXX02ogsGxi/YiWoysj9ONG9kpFr1qmKi9uiKxAoJgiNLRkZ0uha
         9YEUHKTj4sRPVHDADm1NZz1JATwjZRpx+MFys35wYk8Gb4opUES8fyiwUMv5Xngyp5Rb
         j+jkrRQ3wma5zqXISd0Qo5/13Uh0rI4aDqFUYlXzB8r3Fus9v5jYWjRaF+sA/nttTdFD
         dCxcX84LlbbZ0S+wCKsK0ZD6E8Ke2d46mO0da/7AEA9TBpxY64hYdbRA/w57HpFiAGTm
         p0aw==
X-Forwarded-Encrypted: i=1; AKwUvByXSLMOo2gMqjN5D02rQyhKkfJ50SSbu+cUlvmvpmmzBsXKLnHMEbnWwPGeseeK8tCyidWON4Jb2caG5lY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfs5iYD5f1NPjNr+/sfMsdDwQj24hQT5dSrPjCaLl5raZlMofh
	BbZIvNep0Y5CfO9Cs1p4ER193B0ios8ddkqXtJjddPK5mhZvEwmXD7LQ
X-Gm-Gg: AYBFou2VqhNdLDwmYqxYeKYEXtt+PkzR21kBkKMS22VpYgEN++j3S8HUzr5ILplU2Qm
	IJFz+7y8mDw96/K4IKdI5NjV2yymMkhMp89L7eUitwsLZCUzM1G5NOrYtiCPXT5UZhnWHwfVL3B
	5IcRyPCDc67hvMbMDuOBvLescK3WbYblmnzhS6xT0KK7pJuKT606m4upHXzLHCP5ES0jJNuhXgZ
	daUTNoODwAkoSjY81VnMyrkCu8X21F7H1/t2Z4YKrUNB/CBYHalq2v7nVy1BYevayk9nPybLl4C
	3Cv1sfeEz2nF4q/z5bic9r/9r8RhHxb0/ZwxLa/SxDpBKpynQPxpZ/dFHSAiwgUuqswHSHHBFW/
	cCCN9lFglJ0tOWo+A8NQgmVrEJG2tg/VvNlYYvuv1GWcOs//mKkJw0PeOfdGoH7+t95f/s78Pdp
	Q0X8RuUen8UStnOptuXpRRqIJiBfI+7MLCouZ1dBm2Gv5TEXcOlNgx2deVpEFNP11IozTlIGPeR
	RayITkGQBwwmjSMnA99Qzf99zwQuV0WpiKtdO3gYBcu2ILZ8jZMVuvHabrIq4QU0FDgQtb3cYdf
	uLAUgxESJkkyEGHEh2XG4zWPxQWf66CMT/D09neBgw==
X-Received: by 2002:a05:7022:286:10b0:143:868a:20c1 with SMTP id a92af1059eb24-1a6cfa0e858mr1429965c88.46.1793156712194;
        Tue, 27 Oct 2026 20:05:12 -0700 (PDT)
Received: from penguin.lxd ([12.187.136.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75a37093esm1150734c88.3.2026.10.27.20.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 20:05:11 -0700 (PDT)
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
Subject: [PATCH v2 1/8] crypto: acomp - Define a unit_size in struct acomp_req to enable batching. mm: zswap: Set the unit size for zswap to PAGE_SIZE.
Date: Tue, 27 Oct 2026 20:04:56 -0700
Message-Id: <20261028030503.17923-2-kanchanapsridhar2026@gmail.com>
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

