Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569835;
	b=tziWVvoDD4Zv43meqfmd0nkvIepwp/JQ3yR+Ebi4rHu64UifIJw19GlYopuyHAD6Mdqm
	 K0uGiDIAfh/M395wyORn26dur2QTS6eNuKOxzay0RAOQtUKyaYj0EdoM7sjVZ02MRycX9
	 nljYrPjT7PrKIWHN6yTaPpMaojZ20FwK/adLf+pI0+eMcay+6nIZDAE/CVbo4X5fmPthE
	 XvnyG7w2Kk7garIP9QqLVZ61Qc613GMCkY714f/7xwHhapxXUuxyXHQgU+KJNxo/NYye+
	 zt/pWF0WWtsmvoloj9WVtFfqYQzl4s0cWZe0Iju7SnNZ3Vzx8CgBeoKDRbG88yVm2eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569835;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t7+A5T78aP05M9WymGJ64NB1DGWzg3nhgE6fqQCCSok=;
	b=qsls1aGiX9SCsp7JKYtA7ETFWpK04JLheLzCIeULfHf6ZT2q/Ckt5BgCjKMPza/G0rDa
	 RO0rmyA2d7Pv0+pQ7FGqRTRr/sdEAI14qaXrakhw9bGPR1kKN6j3FLQurp+UYgrMDYwFw
	 jk6lsqmEIfxEScQZDqcgU1H1/83R+Yd84rHTnti1SEUQMtaI2T1Jtlp7tTFVie2cBRNXk
	 TPoKHwSMCkwZy7BCr9Y93z9gO9Csh1LNbvUVZOg99+s+UdU89zePPlI/Diekgna8lgerC
	 f8MCy/srTGbFkVZPC3ozjsKA8LdjWlS4/0CucNJ/3cE0kTW2FZJB02LYysD0zO4QKZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b="cCG/gSVq";
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D95606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:37:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3D95606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=cCG/gSVq
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5B36B42A16
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1794569832;
	bh=t7+A5T78aP05M9WymGJ64NB1DGWzg3nhgE6fqQCCSok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=cCG/gSVq2G76WBbrsXLBN0uJeinjNJ0s5Ok791FzR99gyV3dAZ0X6fIZjM/d3ODq+
	 /pYbMVuSrsVNe0pBPcf5l7lv6xKiqdxorAkFM+c8TP1jxX27wx1ywdi7R7RqYU0cjv
	 c2hsdXgKVR+qo7jBq682PwCd+pK4mWJgiGixX+2BSoJDXmiGwQyG/RFkdaKxXtK2+m
	 IKZ1N7wLFrAM1+4fn97y2dRyLvqzWFCglpDbv/o0Wn+lN5J3VJmJ4pshKhG4QUVIum
	 ilNZ+ftlyVcDHxCj5q1rvjfnE31sb4vYZpPnaN2MKqlqqh/HzNAGQ2pmhEKeyYlYKe
	 wLXMEi5Hxw4e49zeVKwIJ9YpH8vi4J28+8o3kpc3Mj64QN54zMmKedLlCtqq4OgzBQ
	 ZmCB1JL+COLOMAF8NkpaflUhGI+TWk7IpLG2zYPbr44kmqX4chMk1+wZJQJAIoAoI9
	 UbaVtGjspY74AtewLQHejnUswufIuedMKpwZ27Un+KZmwUxl4aZbQOc/jqU034f/lW
	 UQvcAFp/p5Wq5o6GJMM13sICIh+6HHLgCvb5QBqalkhiZ0qSvXnIJs/ogRRGra+G/T
	 QpKi7iIYOZvZ/jF7Lk1UK32IGJCZh5TP71ieuFwFfe3tuv5XTHRxHxSm4t1OAl35NA
	 8HcwN4R5Aci5XG8PAwfzEMIo=
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ee1ed68286so1837025ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:37:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794569831; x=1795174631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t7+A5T78aP05M9WymGJ64NB1DGWzg3nhgE6fqQCCSok=;
        b=gi4FO33SAchsZlxjjGDt5qSLst0Tq3A4EAlHS1BsR0dBz0+Cq5FJjJK5vRg3ZMqI9z
         oxbbksFctWHd9UT1CqZvOSEz5MfP8Q3FWDrUVeeQCeNq8QNLmbyWmWWMYGd29K7FIWgi
         uvlLEPpPaJ/IpGkP06DlrtoouS7ndFbAKdrThWNwQfUp7CfaOePDLMuFS9hLbdEdDvBR
         idrQX8ZDb/lkeCIodMdp24L119vLPvIJ2hL51MpyvwcEAbwniOf+Jb5pgO0RveRhUxD1
         t+wkW9dBVByRzMIP5Y19XukX4P71eWnZOUeXf06KsKuukp825+Lqbek7vq5FReSsLjwT
         ko7Q==
X-Forwarded-Encrypted: i=1; AL+hErGFTtHQZo1u8NBnWLZIjWaW8n6JuzmJRwXxaT+e92ExjIWygO35yaSDfGENoiF2nWozNSpn6+6rx9p+I0c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9izTwZ2EdfptS48h2L/OrwoCDvdN9Heeiswa1k5Uk0V0XNQ37J
	n4bEwmhZoWIeP7aopnQFjPGOLTi/gyciBnPH4fD9rWMQ7H2Bmi4kpL61KZdHt+BCUwhMZ65qD+9
	2CjfoF72sk7wlzDEI1cJ1JuQPmjtgE8POwpj3vPSSRhVYMycnw2B+f36Ax05Jksdy8J7G+LNKoD
	fixwnmlg==
X-Gm-Gg: AYBFou1U8bVw0xWb8Eqp3F9oampyLsLh6ndrGGw5kV6ie/iS4m215vRgqwWe7rtQr9/
	wwfqzf1Z7Jg3cZLgVFfW1nVAZB8ReOO4eu+HvB24DYr9vS/8h0BnoKPX9uE6iircCDgctBk4CYH
	8zG6tsuG5K5nBYXwVVMUCqseVEnW0ez9A8ZSmTLtfBP/6N8+aU4Fw2kLTea9xCqWpIdd1gxlyD6
	MoCFDqsIynt2VxCz0R/vS5F5e0mftfPNpw+GP4gMZmKWxew85BOaqr01w2YQS/3jlf/cp9pwfTq
	XjQPQd/q9PiA8LzA0a+tUv5XCSinAilo/mXGbzMlur9nSRwarWgp03VgpZMSu/d+sUpkU84njFr
	Bq6KatQYJi/Ym33n0sY94vKndDrdwlsqlZkaXM6deVeOTGrd6cbI5M/qFvGo=
X-Received: by 2002:a17:903:1a4e:b0:2ea:de20:51cd with SMTP id d9443c01a7336-2ee0dd2a2b8mr24298475ad.9.1794569830694;
        Fri, 13 Nov 2026 03:37:10 -0800 (PST)
X-Received: by 2002:a17:903:1a4e:b0:2ea:de20:51cd with SMTP id d9443c01a7336-2ee0dd2a2b8mr24298175ad.9.1794569830310;
        Fri, 13 Nov 2026 03:37:10 -0800 (PST)
Received: from ZBook.gateway ([123.208.39.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f80b7f6sm8757445ad.40.2026.11.13.03.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:37:10 -0800 (PST)
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
Subject: [PATCH v5 2/2] crypto: caam - Use bounce buffer for unaligned RSA destination buffers
Date: Fri, 13 Nov 2026 22:36:50 +1100
Message-ID: <20261113113650.63038-3-changwei.zou@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113113650.63038-1-changwei.zou@canonical.com>
References: <20261113113650.63038-1-changwei.zou@canonical.com>
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
 drivers/crypto/caam/caampkc.c | 108 +++++++++++++++++++++++++++++++---
 drivers/crypto/caam/caampkc.h |   7 +++
 2 files changed, 106 insertions(+), 9 deletions(-)

diff --git a/drivers/crypto/caam/caampkc.c b/drivers/crypto/caam/caampkc.c
index 24c740cc4a8c..83252701dfd5 100644
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
@@ -138,6 +181,7 @@ static void rsa_pub_done(struct device *dev, u32 *desc, u32 err, void *context)
 	rsa_pub_unmap(dev, edesc, req);
 	rsa_io_unmap(dev, edesc, req);
 	kfree(edesc);
+	rsa_bounce_buf_done(req, &ecode);
 
 	/*
 	 * If no backlog flag, the completion of the request is done
@@ -181,6 +225,7 @@ static void rsa_priv_f_done(struct device *dev, u32 *desc, u32 err,
 
 	rsa_io_unmap(dev, edesc, req);
 	kfree(edesc);
+	rsa_bounce_buf_done(req, &ecode);
 
 	/*
 	 * If no backlog flag, the completion of the request is done
@@ -272,6 +317,12 @@ static int caam_rsa_count_leading_zeros(struct scatterlist *sgl,
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
@@ -317,13 +368,37 @@ static struct rsa_edesc *rsa_edesc_alloc(struct akcipher_request *req,
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
@@ -358,7 +433,7 @@ static struct rsa_edesc *rsa_edesc_alloc(struct akcipher_request *req,
 				   edesc->sec4_sg + !!diff_size, 0);
 
 	if (mapped_dst_nents > 1)
-		sg_to_sec4_sg_last(req->dst, req->dst_len,
+		sg_to_sec4_sg_last(req_ctx->fixup_dst, req->dst_len,
 				   edesc->sec4_sg + sec4_sg_index, 0);
 
 	/* Save nents for later use in Job Descriptor */
@@ -391,9 +466,12 @@ static struct rsa_edesc *rsa_edesc_alloc(struct akcipher_request *req,
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
 
@@ -421,6 +499,7 @@ static int akcipher_do_one_req(struct crypto_engine *engine, void *areq)
 			      req_ctx->akcipher_op_done);
 		rsa_io_unmap(jrdev, req_ctx->edesc, req);
 		kfree(req_ctx->edesc);
+		rsa_bounce_buf_done(req, &ret);
 	} else {
 		ret = 0;
 	}
@@ -465,7 +544,7 @@ static int set_rsa_pub_pdb(struct akcipher_request *req,
 		pdb->g_dma = edesc->sec4_sg_dma +
 			     sec4_sg_index * sizeof(struct sec4_sg_entry);
 	} else {
-		pdb->g_dma = sg_dma_address(req->dst);
+		pdb->g_dma = sg_dma_address(req_ctx->fixup_dst);
 	}
 
 	pdb->sgf |= (key->e_sz << RSA_PDB_E_SHIFT) | key->n_sz;
@@ -513,7 +592,9 @@ static int set_rsa_priv_f1_pdb(struct akcipher_request *req,
 		pdb->f_dma = edesc->sec4_sg_dma +
 			     sec4_sg_index * sizeof(struct sec4_sg_entry);
 	} else {
-		pdb->f_dma = sg_dma_address(req->dst);
+		struct caam_rsa_req_ctx *req_ctx = akcipher_request_ctx(req);
+
+		pdb->f_dma = sg_dma_address(req_ctx->fixup_dst);
 	}
 
 	pdb->sgf |= (key->d_sz << RSA_PDB_D_SHIFT) | key->n_sz;
@@ -578,7 +659,9 @@ static int set_rsa_priv_f2_pdb(struct akcipher_request *req,
 		pdb->f_dma = edesc->sec4_sg_dma +
 			     sec4_sg_index * sizeof(struct sec4_sg_entry);
 	} else {
-		pdb->f_dma = sg_dma_address(req->dst);
+		struct caam_rsa_req_ctx *req_ctx = akcipher_request_ctx(req);
+
+		pdb->f_dma = sg_dma_address(req_ctx->fixup_dst);
 	}
 
 	pdb->sgf |= (key->d_sz << RSA_PDB_D_SHIFT) | key->n_sz;
@@ -667,7 +750,9 @@ static int set_rsa_priv_f3_pdb(struct akcipher_request *req,
 		pdb->f_dma = edesc->sec4_sg_dma +
 			     sec4_sg_index * sizeof(struct sec4_sg_entry);
 	} else {
-		pdb->f_dma = sg_dma_address(req->dst);
+		struct caam_rsa_req_ctx *req_ctx = akcipher_request_ctx(req);
+
+		pdb->f_dma = sg_dma_address(req_ctx->fixup_dst);
 	}
 
 	pdb->sgf |= key->n_sz;
@@ -718,6 +803,7 @@ static int akcipher_enqueue_req(struct device *jrdev,
 		rsa_pdb_unmap(jrdev, edesc, req, cbk);
 		rsa_io_unmap(jrdev, edesc, req);
 		kfree(edesc);
+		rsa_bounce_buf_done(req, &ret);
 	}
 
 	return ret;
@@ -759,6 +845,7 @@ static int caam_rsa_enc(struct akcipher_request *req)
 init_fail:
 	rsa_io_unmap(jrdev, edesc, req);
 	kfree(edesc);
+	rsa_bounce_buf_done(req, &ret);
 	return ret;
 }
 
@@ -788,6 +875,7 @@ static int caam_rsa_dec_priv_f1(struct akcipher_request *req)
 init_fail:
 	rsa_io_unmap(jrdev, edesc, req);
 	kfree(edesc);
+	rsa_bounce_buf_done(req, &ret);
 	return ret;
 }
 
@@ -817,6 +905,7 @@ static int caam_rsa_dec_priv_f2(struct akcipher_request *req)
 init_fail:
 	rsa_io_unmap(jrdev, edesc, req);
 	kfree(edesc);
+	rsa_bounce_buf_done(req, &ret);
 	return ret;
 }
 
@@ -846,6 +935,7 @@ static int caam_rsa_dec_priv_f3(struct akcipher_request *req)
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

