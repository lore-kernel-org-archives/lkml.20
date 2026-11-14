Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794636058;
	b=QM6vN+crkY1hCIdxHxSgmZmbi+zYFeLtUNwhGSLrdQWneS8gvb7VntjBwtP7epyGBk0q
	 /3CgY8QYsdTymQA85lW20AmcPFvt+sF3gF+Ju0Yvw5MBb/qeYzKfvAUkTZY+1Dr4iQkmA
	 HXp1PRc4CRh27O6EOAlJ6/X6UoUferGjUjU5dQnEq0mqPBuA4QUUeQb9Pn7u6ctvTlbRb
	 HSivBUMrr8wZXtDCqWEPpXmG+Vx9G3bhTrcly73bLFt9vvH+EAaBc4qbfDFx9bQSjl8Hv
	 8T0mENueOUB5LHJiuDZZYxByzTsvKJMYbL7VreNGD5VZxybgCf5WrgIG2zqUMl9hLog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794636058;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tOgiYxvHHGy2WUkOBiMIGe1iHaojodZIFnGcSWrohCo=;
	b=mUfA9+gCxeA6OUK22AidkjPC5B4D05usJ1Slfqb3344iX/gpsRasy2eUPKoBTTREsGTY
	 4M7heFlsSQ1EnsRtQfgjkJS/u+Sgn4THSxVxDecYpz46Ub387B0aFS1e9DlR+o2egw4Rq
	 Yp83NuQYBEH8HHyeIggnAu0VETN2dOhhpCUY428PYH3/sQqVR6gz34A1BNX38CBmGTx1q
	 mhof9pA8osILvY04LfPt/137dtGNBscH91hPDiXQxrmJkWIVdMmh1cUixqWaDBuAQRt+R
	 b0nft+jxMLJveQW2u8I5c80XgjpSYIMGSNWm7+Leer67/Y113Zl0OU6iGiW897nBuUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=Ii+DvLGP;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F94606A8B2
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58F94606A8B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=Ii+DvLGP
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 19EF0402E4
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1794636056;
	bh=tOgiYxvHHGy2WUkOBiMIGe1iHaojodZIFnGcSWrohCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=Ii+DvLGPj8nYvIEAfonVWdkuYSQiMfjIK9tzmS2rMMJEZmd1lyfat5DLcW2k25XxN
	 xJlJIg91hNIYpzzM+upInByOjgOa8zPMqLnIQ0V3OKxbGJBqFWxXZeB362TYJSbdpe
	 zSLgceicrsw5IMhrPaEoKd7eynk4HDNX0430NgY8EbAIuxdqr/VM+pFz9V/LEXftgV
	 rG1bGjtFEHGdEsqivGu88SuhJpIXlpUcIpdbdmn2GeCgbChN/RUUGySHpqB4T4OQKT
	 hCqRcia9jpPn+fqTUaIyCpB0W0rXVFohbjZW+TYNjg0D1R0ecj+xXNySl0tqYeei0O
	 QHPkvHRSBKSmbi4WrtgekjiQb/B5rBEPfJ0UoJW2gSUK2T/GFKroQAW/nW0kWzgAlp
	 vbzsYmodh/sjzAJynEL0N7BRa7CUwhQZBa+VktG/RY3spSn/L+NB8TSAL9LHq4vwLR
	 QauSXW2P4QyW+jdUeh+x6mNp95qPbmNWCKKWNhtNchAiyFon94Rf1oJ7Mi44WckVgL
	 zLf9DWFfKMVCr+cywsYuhGRWMHKbx35s8L+O6qMRaceZqeJm4sr9apsFsvpBTjxEzo
	 9qx2vj84b+uxug9+cwXtEDc/MErXfzD07itQTfKpYO8SCQCdcnW4POZHFcbLzr96Dh
	 m2taY1FOVM+OJdyg0upsrfSg=
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b19aa066afso1562940a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:00:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794636054; x=1795240854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tOgiYxvHHGy2WUkOBiMIGe1iHaojodZIFnGcSWrohCo=;
        b=bqvISr83EEi83Unm5GcGEsg9cCq9+ApD7+V4G8v6hgCss53IOuOIIgDIMD+xcDW+Fz
         QUBImyOeVRksF1QWtdzUgkAqMM4199/T+fLbdggwysYxd5PnRPPtP28zexcaovpS3NlF
         t7eKvMM927vIOST5pzF4wZRglpnD987vjK2HMNqm88vAaATjGrrNSRucA1ETCG1WygPL
         AVZeNsy5bRaJcZfrvo39iTYtLYJqsxuMUNWkbdMiJVi+3hPu94pHV5RpjfHu7GzhRKb8
         L/ZsQwqsXIthuos/4HZ9sutTZcvC9KFSDyO7GuVGiY6ZNaWxiQxNEZMRuPSw7oJTeaxH
         JMWg==
X-Forwarded-Encrypted: i=1; AL+hErHGOzei37zWyLPp8WWX7yO4q3qxQ+LL2xwkiJcKzXmBIBex2pP3G5yc0wt2R5FfLFuLjYFXr/AXA8/A+vg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+W0BG9WUkoG4FXdlHxjspYUSa+lJfv44k//1uYtOdieka3KgkG
	IQXssTlfCkGiUthDepZ2H+cFsmqOSfpTG9pPpdk+ecnGD4AMuHuEIwFTxgv2abjdBAoZ6TFmzP9
	8T04FhaXwgQW4xr7pkCwsEgGpJ9GRdtuY3daL5U6zvQQZRi3tCjvicpyKmkXaf6Fn9hp/HKCDdk
	iJJOMhAQ==
X-Gm-Gg: AYBFou3g073mL97kU9j1E+aMJyYJ5shk0t6v5LSiQBfnkdBgk8IPIXL2IryrBfAubkY
	ULVifgkmX1Nwls4HmxXf9EOI1fe+pqNq5GJIkdevKXrImIknbeiTiLPiy6LWHqyMANTycxhPwds
	A4SwNcyOOj/QRRFoNKl9efFEt56haL7zlaDlsD8vpbsJz/5HSZeEvj/1k1PjoahYmkxC7OJLvqR
	ZvvJXzSPfC0YGQny2euu7bDDH5KBFdywHKWbm9o395Y9g4wTt4h2lE4MajrMxJkCXku9LZKCDos
	yc3V0iKrtGCl2MWNehrU9g1iNtuiETtUvL+sZzvdnVTJEbLUV7eyJ6PWZmkeQqsuSg+VCMvVhHs
	5Q22+Qjn1Rf6AMA4HjsZ4zRPSBr9IgG941OPM7wTSLiDFqu6dUBBeR/iD4qE=
X-Received: by 2002:a17:90b:4c8b:b0:3ac:9ed8:f30e with SMTP id 98e67ed59e1d1-3b1b0d07d05mr3100526a91.35.1794636054210;
        Fri, 13 Nov 2026 22:00:54 -0800 (PST)
X-Received: by 2002:a17:90b:4c8b:b0:3ac:9ed8:f30e with SMTP id 98e67ed59e1d1-3b1b0d07d05mr3100513a91.35.1794636053720;
        Fri, 13 Nov 2026 22:00:53 -0800 (PST)
Received: from ZBook.gateway ([123.208.39.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d32ea0sm12364451a91.15.2026.11.13.22.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:00:52 -0800 (PST)
From: Changwei Zou <changwei.zou@canonical.com>
To: herbert@gondor.apana.org.au,
	sahil.malhotra@nxp.com
Cc: davem@davemloft.net,
	horia.geanta@nxp.com,
	pankaj.gupta@nxp.com,
	gaurav.jain@nxp.com,
	jeffbarnes@linux.microsoft.com,
	stephane.debusne@cynove.com,
	iuliana.prodan@nxp.com,
	martin.kepplinger-novakovic@ginzinger.com,
	lukas@wunner.de,
	sahil.malhotra@oss.nxp.com,
	changwei.zou@canonical.com,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kepplinger-Novakovic <Martin.Kepplinger-Novakovic@ginzinger.com>
Subject: [PATCH v6 2/2] crypto: caam - Use bounce buffer for unaligned RSA destination buffers
Date: Sat, 14 Nov 2026 17:00:32 +1100
Message-ID: <20261114060032.872141-3-changwei.zou@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114060032.872141-1-changwei.zou@canonical.com>
References: <20261114060032.872141-1-changwei.zou@canonical.com>
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

The rsa-caam driver directly DMA-maps the destination buffer supplied by
the caller via req->dst without checking whether it meets the cacheline
alignment requirements of DMA-incoherent hardware such as i.MX8.

On CPUs with non-coherent DMA caches, if the destination buffer shares a
cacheline with other data (i.e. it is not cacheline-aligned), cache
writeback/invalidation during DMA can corrupt adjacent memory or cause
stale data to be read back. This manifests as intermittent -EKEYREJECTED
errors when loading signed kernel modules.

Such a destination is produced in the module-signature verification path
by rsassa_pkcs1_verify() (and crypto_akcipher_sync_prep()), which place
the I/O buffer right after the request context in a single kmalloc()
allocation; the buffer therefore starts at an offset into a larger
allocation and shares a cacheline with that context. The DMA API does not
cover this: on CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC systems
dma_kmalloc_needs_bounce() only considers the buffer size, not its offset,
so a buffer that is size-wise DMA-safe but starts at a non-cacheline-
aligned offset is not bounced. The driver must detect and bounce it.

When any segment of req->dst is not cacheline-aligned in either its start
offset or length, allocate a single contiguous aligned bounce buffer
(dst_len rounded up to a cacheline multiple) and run the operation on it
via req_ctx->fixup_dst, leaving the caller's req->dst untouched. The RSA
output (key->n_sz bytes) is copied back to req->dst once the hardware has
completed successfully.

Introduce a helper sg_is_dma_aligned() that checks both sg->offset and
sg->length for cacheline alignment. Checking sg->offset suffices for
the start address since physical pages are always page-aligned and
PAGE_SIZE is a multiple of dma_get_cache_alignment(). sg->length is
also checked to ensure the buffer end does not share a cacheline with
adjacent memory.

The bounce scatterlist is described with the aligned allocation size, not
the possibly-unaligned dst_len, so that dma_map_sg() does not re-bounce or
reject it on CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC systems.

The intermittent error 'Key was rejected by service' on i.MX8 with CAAM
can be triggered when loading signed kernel modules:

    for i in $(seq 1 100); do
        sudo modprobe xfs 2>&1 && echo "SUCCESS on attempt $i" \
        && sudo rmmod xfs || echo "FAILED on attempt $i"
    done

Reported-by: Martin Kepplinger-Novakovic <Martin.Kepplinger-Novakovic@ginzinger.com>
Closes: https://lore.kernel.org/r/6029acc0f0ddfe25e2537c2866d54fd7f54bc182.camel@ginzinger.com
Signed-off-by: Changwei Zou <changwei.zou@canonical.com>
Assisted-by: OpenCode:claude-sonnet-4.6
Tested-by: Martin Kepplinger-Novakovic <martin.kepplinger-novakovic@ginzinger.com>
Tested-by: Stephane Debusne <stephane.debusne@cynove.com>
---
 drivers/crypto/caam/caampkc.c | 111 +++++++++++++++++++++++++++++-----
 drivers/crypto/caam/caampkc.h |   7 +++
 2 files changed, 103 insertions(+), 15 deletions(-)

diff --git a/drivers/crypto/caam/caampkc.c b/drivers/crypto/caam/caampkc.c
index 789a8d571486..b9aeefabcec4 100644
--- a/drivers/crypto/caam/caampkc.c
+++ b/drivers/crypto/caam/caampkc.c
@@ -51,7 +51,7 @@ static void rsa_io_unmap(struct device *dev, struct rsa_edesc *edesc,
 {
 	struct caam_rsa_req_ctx *req_ctx = akcipher_request_ctx(req);
 
-	dma_unmap_sg(dev, req->dst, edesc->dst_nents, DMA_FROM_DEVICE);
+	dma_unmap_sg(dev, req_ctx->fixup_dst, edesc->dst_nents, DMA_FROM_DEVICE);
 	dma_unmap_sg(dev, req_ctx->fixup_src, edesc->src_nents, DMA_TO_DEVICE);
 
 	if (edesc->sec4_sg_bytes)
@@ -59,6 +59,49 @@ static void rsa_io_unmap(struct device *dev, struct rsa_edesc *edesc,
 				 DMA_TO_DEVICE);
 }
 
+static int do_rsa_bounce_buf(struct akcipher_request *req,
+			     struct caam_rsa_req_ctx *req_ctx, int req_err)
+{
+	struct crypto_akcipher *tfm = crypto_akcipher_reqtfm(req);
+	struct caam_rsa_ctx *ctx = akcipher_tfm_ctx_dma(tfm);
+	struct caam_rsa_key *key = &ctx->key;
+	int nents, err = 0;
+
+	/*
+	 * Only copy back to the destination on success, and only the actual
+	 * RSA output (key->n_sz bytes) rather than the full dst_len, so the
+	 * trailing capacity of the caller's buffer is left untouched.
+	 */
+	if (!req_err) {
+		nents = sg_nents_for_len(req->dst, key->n_sz);
+		if (nents < 0)
+			err = nents;
+		else if (sg_copy_from_buffer(req->dst, nents,
+					     req_ctx->bounce_buf,
+					     key->n_sz) != key->n_sz)
+			err = -EFAULT;
+	}
+
+	kfree(req_ctx->bounce_buf);
+	req_ctx->bounce_buf = NULL;
+
+	return err;
+}
+
+static inline void rsa_bounce_buf_done(struct akcipher_request *req, int *err)
+{
+	struct caam_rsa_req_ctx *req_ctx = akcipher_request_ctx(req);
+	int cperr;
+
+	if (!req_ctx->bounce_buf)
+		return;
+
+	cperr = do_rsa_bounce_buf(req, req_ctx, *err);
+
+	if (!*err)
+		*err = cperr;
+}
+
 static void rsa_pub_unmap(struct device *dev, struct rsa_edesc *edesc,
 			  struct akcipher_request *req)
 {
@@ -155,6 +198,7 @@ static void rsa_pub_done(struct device *dev, u32 *desc, u32 err, void *context)
 	rsa_pub_unmap(dev, edesc, req);
 	rsa_io_unmap(dev, edesc, req);
 	kfree(edesc);
+	rsa_bounce_buf_done(req, &ecode);
 
 	/*
 	 * If no backlog flag, the completion of the request is done
@@ -189,6 +233,7 @@ static void rsa_priv_f_done(struct device *dev, u32 *desc, u32 err,
 
 	rsa_io_unmap(dev, edesc, req);
 	kfree(edesc);
+	rsa_bounce_buf_done(req, &ecode);
 
 	/*
 	 * If no backlog flag, the completion of the request is done
@@ -270,6 +315,12 @@ static int caam_rsa_count_leading_zeros(struct scatterlist *sgl,
 	return tbytes - nbytes;
 }
 
+static inline bool sg_is_dma_aligned(struct scatterlist *sg)
+{
+	return IS_ALIGNED(sg->offset, dma_get_cache_alignment()) &&
+	       IS_ALIGNED(sg->length, dma_get_cache_alignment());
+}
+
 static struct rsa_edesc *rsa_edesc_alloc(struct akcipher_request *req,
 					 size_t desclen)
 {
@@ -315,13 +366,37 @@ static struct rsa_edesc *rsa_edesc_alloc(struct akcipher_request *req,
 				     req_ctx->fixup_src_len);
 	dst_nents = sg_nents_for_len(req->dst, req->dst_len);
 
+	req_ctx->bounce_buf = NULL;
+	req_ctx->fixup_dst = req->dst;
+	if (req->dst_len > 0) {
+		struct scatterlist *sg;
+		int i;
+
+		for_each_sg(req->dst, sg, dst_nents, i) {
+			if (!sg_is_dma_aligned(sg)) {
+				unsigned int bounce_len =
+					ALIGN(req->dst_len,
+					      dma_get_cache_alignment());
+
+				req_ctx->bounce_buf = kzalloc(bounce_len, flags);
+				if (!req_ctx->bounce_buf)
+					return ERR_PTR(-ENOMEM);
+				sg_init_one(&req_ctx->dst, req_ctx->bounce_buf,
+					    bounce_len);
+				req_ctx->fixup_dst = &req_ctx->dst;
+				dst_nents = 1;
+				break;
+			}
+		}
+	}
+
 	mapped_src_nents = dma_map_sg(dev, req_ctx->fixup_src, src_nents,
 				      DMA_TO_DEVICE);
 	if (unlikely(!mapped_src_nents)) {
 		dev_err(dev, "unable to map source\n");
-		return ERR_PTR(-ENOMEM);
+		goto bounce_fail;
 	}
-	mapped_dst_nents = dma_map_sg(dev, req->dst, dst_nents,
+	mapped_dst_nents = dma_map_sg(dev, req_ctx->fixup_dst, dst_nents,
 				      DMA_FROM_DEVICE);
 	if (unlikely(!mapped_dst_nents)) {
 		dev_err(dev, "unable to map destination\n");
@@ -356,7 +431,7 @@ static struct rsa_edesc *rsa_edesc_alloc(struct akcipher_request *req,
 				   edesc->sec4_sg + !!diff_size, 0);
 
 	if (mapped_dst_nents > 1)
-		sg_to_sec4_sg_last(req->dst, req->dst_len,
+		sg_to_sec4_sg_last(req_ctx->fixup_dst, req->dst_len,
 				   edesc->sec4_sg + sec4_sg_index, 0);
 
 	/* Save nents for later use in Job Descriptor */
@@ -389,9 +464,12 @@ static struct rsa_edesc *rsa_edesc_alloc(struct akcipher_request *req,
 sec4_sg_fail:
 	kfree(edesc);
 dst_fail:
-	dma_unmap_sg(dev, req->dst, dst_nents, DMA_FROM_DEVICE);
+	dma_unmap_sg(dev, req_ctx->fixup_dst, dst_nents, DMA_FROM_DEVICE);
 src_fail:
 	dma_unmap_sg(dev, req_ctx->fixup_src, src_nents, DMA_TO_DEVICE);
+bounce_fail:
+	kfree(req_ctx->bounce_buf);
+	req_ctx->bounce_buf = NULL;
 	return ERR_PTR(-ENOMEM);
 }
 
@@ -419,6 +497,7 @@ static int akcipher_do_one_req(struct crypto_engine *engine, void *areq)
 			      req_ctx->akcipher_op_done);
 		rsa_io_unmap(jrdev, req_ctx->edesc, req);
 		kfree(req_ctx->edesc);
+		rsa_bounce_buf_done(req, &ret);
 	} else {
 		ret = 0;
 	}
@@ -463,7 +542,7 @@ static int set_rsa_pub_pdb(struct akcipher_request *req,
 		pdb->g_dma = edesc->sec4_sg_dma +
 			     sec4_sg_index * sizeof(struct sec4_sg_entry);
 	} else {
-		pdb->g_dma = sg_dma_address(req->dst);
+		pdb->g_dma = sg_dma_address(req_ctx->fixup_dst);
 	}
 
 	pdb->sgf |= (key->e_sz << RSA_PDB_E_SHIFT) | key->n_sz;
@@ -476,6 +555,7 @@ static int set_rsa_priv_f1_pdb(struct akcipher_request *req,
 			       struct rsa_edesc *edesc)
 {
 	struct crypto_akcipher *tfm = crypto_akcipher_reqtfm(req);
+	struct caam_rsa_req_ctx *req_ctx = akcipher_request_ctx(req);
 	struct caam_rsa_ctx *ctx = akcipher_tfm_ctx_dma(tfm);
 	struct caam_rsa_key *key = &ctx->key;
 	struct device *dev = ctx->dev;
@@ -501,8 +581,6 @@ static int set_rsa_priv_f1_pdb(struct akcipher_request *req,
 		sec4_sg_index += edesc->mapped_src_nents;
 
 	} else {
-		struct caam_rsa_req_ctx *req_ctx = akcipher_request_ctx(req);
-
 		pdb->g_dma = sg_dma_address(req_ctx->fixup_src);
 	}
 
@@ -511,7 +589,7 @@ static int set_rsa_priv_f1_pdb(struct akcipher_request *req,
 		pdb->f_dma = edesc->sec4_sg_dma +
 			     sec4_sg_index * sizeof(struct sec4_sg_entry);
 	} else {
-		pdb->f_dma = sg_dma_address(req->dst);
+		pdb->f_dma = sg_dma_address(req_ctx->fixup_dst);
 	}
 
 	pdb->sgf |= (key->d_sz << RSA_PDB_D_SHIFT) | key->n_sz;
@@ -523,6 +601,7 @@ static int set_rsa_priv_f2_pdb(struct akcipher_request *req,
 			       struct rsa_edesc *edesc)
 {
 	struct crypto_akcipher *tfm = crypto_akcipher_reqtfm(req);
+	struct caam_rsa_req_ctx *req_ctx = akcipher_request_ctx(req);
 	struct caam_rsa_ctx *ctx = akcipher_tfm_ctx_dma(tfm);
 	struct caam_rsa_key *key = &ctx->key;
 	struct device *dev = ctx->dev;
@@ -566,8 +645,6 @@ static int set_rsa_priv_f2_pdb(struct akcipher_request *req,
 		pdb->g_dma = edesc->sec4_sg_dma;
 		sec4_sg_index += edesc->mapped_src_nents;
 	} else {
-		struct caam_rsa_req_ctx *req_ctx = akcipher_request_ctx(req);
-
 		pdb->g_dma = sg_dma_address(req_ctx->fixup_src);
 	}
 
@@ -576,7 +653,7 @@ static int set_rsa_priv_f2_pdb(struct akcipher_request *req,
 		pdb->f_dma = edesc->sec4_sg_dma +
 			     sec4_sg_index * sizeof(struct sec4_sg_entry);
 	} else {
-		pdb->f_dma = sg_dma_address(req->dst);
+		pdb->f_dma = sg_dma_address(req_ctx->fixup_dst);
 	}
 
 	pdb->sgf |= (key->d_sz << RSA_PDB_D_SHIFT) | key->n_sz;
@@ -600,6 +677,7 @@ static int set_rsa_priv_f3_pdb(struct akcipher_request *req,
 			       struct rsa_edesc *edesc)
 {
 	struct crypto_akcipher *tfm = crypto_akcipher_reqtfm(req);
+	struct caam_rsa_req_ctx *req_ctx = akcipher_request_ctx(req);
 	struct caam_rsa_ctx *ctx = akcipher_tfm_ctx_dma(tfm);
 	struct caam_rsa_key *key = &ctx->key;
 	struct device *dev = ctx->dev;
@@ -655,8 +733,6 @@ static int set_rsa_priv_f3_pdb(struct akcipher_request *req,
 		pdb->g_dma = edesc->sec4_sg_dma;
 		sec4_sg_index += edesc->mapped_src_nents;
 	} else {
-		struct caam_rsa_req_ctx *req_ctx = akcipher_request_ctx(req);
-
 		pdb->g_dma = sg_dma_address(req_ctx->fixup_src);
 	}
 
@@ -665,7 +741,7 @@ static int set_rsa_priv_f3_pdb(struct akcipher_request *req,
 		pdb->f_dma = edesc->sec4_sg_dma +
 			     sec4_sg_index * sizeof(struct sec4_sg_entry);
 	} else {
-		pdb->f_dma = sg_dma_address(req->dst);
+		pdb->f_dma = sg_dma_address(req_ctx->fixup_dst);
 	}
 
 	pdb->sgf |= key->n_sz;
@@ -716,6 +792,7 @@ static int akcipher_enqueue_req(struct device *jrdev,
 		rsa_pdb_unmap(jrdev, edesc, req, cbk);
 		rsa_io_unmap(jrdev, edesc, req);
 		kfree(edesc);
+		rsa_bounce_buf_done(req, &ret);
 	}
 
 	return ret;
@@ -757,6 +834,7 @@ static int caam_rsa_enc(struct akcipher_request *req)
 init_fail:
 	rsa_io_unmap(jrdev, edesc, req);
 	kfree(edesc);
+	rsa_bounce_buf_done(req, &ret);
 	return ret;
 }
 
@@ -786,6 +864,7 @@ static int caam_rsa_dec_priv_f1(struct akcipher_request *req)
 init_fail:
 	rsa_io_unmap(jrdev, edesc, req);
 	kfree(edesc);
+	rsa_bounce_buf_done(req, &ret);
 	return ret;
 }
 
@@ -815,6 +894,7 @@ static int caam_rsa_dec_priv_f2(struct akcipher_request *req)
 init_fail:
 	rsa_io_unmap(jrdev, edesc, req);
 	kfree(edesc);
+	rsa_bounce_buf_done(req, &ret);
 	return ret;
 }
 
@@ -844,6 +924,7 @@ static int caam_rsa_dec_priv_f3(struct akcipher_request *req)
 init_fail:
 	rsa_io_unmap(jrdev, edesc, req);
 	kfree(edesc);
+	rsa_bounce_buf_done(req, &ret);
 	return ret;
 }
 
diff --git a/drivers/crypto/caam/caampkc.h b/drivers/crypto/caam/caampkc.h
index 96d03704c9be..8810bcc435cc 100644
--- a/drivers/crypto/caam/caampkc.h
+++ b/drivers/crypto/caam/caampkc.h
@@ -103,6 +103,10 @@ struct caam_rsa_ctx {
  * @src           : input scatterlist (stripped of leading zeros)
  * @fixup_src     : input scatterlist (that might be stripped of leading zeros)
  * @fixup_src_len : length of the fixup_src input scatterlist
+ * @dst           : bounce destination scatterlist (used when bouncing)
+ * @bounce_buf    : DMA-aligned bounce buffer for destination (or NULL)
+ * @fixup_dst     : destination scatterlist used for the hw operation
+ *                  (req->dst, or @dst when a bounce buffer is used)
  * @edesc         : s/w-extended rsa descriptor
  * @akcipher_op_done : callback used when operation is done
  */
@@ -110,6 +114,9 @@ struct caam_rsa_req_ctx {
 	struct scatterlist src[2];
 	struct scatterlist *fixup_src;
 	unsigned int fixup_src_len;
+	struct scatterlist dst;
+	u8 *bounce_buf;
+	struct scatterlist *fixup_dst;
 	struct rsa_edesc *edesc;
 	void (*akcipher_op_done)(struct device *jrdev, u32 *desc, u32 err,
 				 void *context);
-- 
2.43.0

