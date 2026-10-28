Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793156721;
	b=ioVQTewy4d1+46tx4mF84LLmV5USZq3ZlTpJXVlO7uzdt7hiSC2Sct/KGyY/YuYXRNWX
	 yy10iZYhNJiOewZGb3Iej0VfSnMu0/QlCkNZHburEX/QtaNEGidYfDPRnUMY19XuQ477h
	 zYALSpCjhf0mxjYBx5JUe/QlSwU4Dx46h7klCU0aBY0xwytyd+P7oZDoJ4+izqyi8NfMT
	 +Zd0GsJit36vvjq8UGH0O957/nKQcA4fi1Wkhl89Yg1AJS036Scwp1QCyREMYLj4euqkO
	 2PEd5cBY0GSyRl2Py8Us/gkKGypenxzwefTXnA3/MeNe4cE0nzfPzIUp1w9eiGVPFcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TjMo/sG1MEyEvRFVXuJWldDILdZ/eJ05L/MDldKgA8Y=;
	b=Uem4qXL2pJMrjD8sfqBUacJyRUlNGx49r4UwkL8IhNSyyJ9v0b/1IR78O9jOaTr1m1ig
	 7a9Elq6dA8KBxCb4MBiex1KnFlkcTF6W6DVBzGrudXWCfzFR4l8HUOPdRPY3klwzo2Xt0
	 rnZ5kdnTxyUzxqwVkU8jTgXPsZ+gi9Cq3XQfdqVaCUGiesr6LmuPROXOJ/8tWn44E65/R
	 6gz87Rvy/jtyEYP5bJ3Go07DizX9Xz73ZGNPTjGCPjSurduEEX7l+77q3OIVPbQVjgd86
	 9RUwlh8ey0urvPcFQj6hqb55vtRhD0k0cpMdjrIXpfaof6cXnXVyN/FOnuAaCz9LpRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rUrxl0Dk;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A0F606A327
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:05:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17A0F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rUrxl0Dk
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1a2761c69fbso1104572c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793156715; x=1793761515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TjMo/sG1MEyEvRFVXuJWldDILdZ/eJ05L/MDldKgA8Y=;
        b=rUrxl0Dk4eusbDVF8aq/D2qDbXzdZ74fbDBix92MOhPOkr2IWZgLAqUFRaPjVVH1DR
         p1naleAIOU/pgGRdlbgvAjDFQlggAdZRa4n/oR91ZL/MnUkApDd7swSFWEusNp2TE2bh
         UUpgC5fcs6ki6H6zTGUb0MjNsw+g6GHOEZzHILXu4lF4mYUgXe/a1DP7/v8a8CHiQY+r
         ttpBoUelc9uDFSLTMwuOgY9lbR5rGyGBibMZKkvxEMtHopM0CQiPOlpgqOgcK7JFEnq4
         SjCOPsnI8aFIlvL5kdpccw3lD0evKicS1aBYqO6lcZTlSAZcIJ8Q4L9+iO5brHgZk3DR
         yduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793156715; x=1793761515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TjMo/sG1MEyEvRFVXuJWldDILdZ/eJ05L/MDldKgA8Y=;
        b=ie8Uq06AToDQxfIDFgbBNQF6EZK6CkE51rtKCwgpMarnIU7JQHb+mlIEmvp4MiaUby
         4gPhQMRgDEPAwMVOJ+PThIcgETtjJpq9WINI+rokNYp1b2495EGV/UrDFhVZ6eRDUWV7
         dLOrRXhti1ktfS4Jm6PYF/rKecjO1h6Jf1y0WzFbz8iyPayfd/QqAtEKKSMuztD1XFcv
         b1y1v61YVVHYS8Lsi84pmFdhHFj+bz9Q5fNYWLKvfk0200D2jNjiZ4oGc/eexhDnSxtS
         fjUwjrEWAwSyop5EB00yQwnrJtKjltM2/PNw6hZ2G5DHIUP2BgjTgUTEWhhFZ28Jx1Q4
         vLag==
X-Forwarded-Encrypted: i=1; AKwUvBy3LJmNyTdDNYnHYEVD8Uw/YJBaOIVexbbUDsdj7fcuh4KfQx0cVL4GajQMEDxeZ+1OYFkMsVIkzDlK3Uw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRVNi+f9nyyYakCTZ2AtmjlHn/kcNCtSTfvB2x5hCm3afFK9Ak
	dugCTx59F3r8R3mEtTuvcJZafEhL+/fcows8I4VTzk0QVOfrRJjS9wZh
X-Gm-Gg: AYBFou2qeCEOlboSF3dk8/a7kvyVAoUw1+9OHRU7Za3v8greSger5vd+u/PM9GF4Pfp
	jPrVi0oI00vRcOAUgWKNvRcoug9/6XziD2xJAD/NhqYboJ1ch2FhHnw08WMOHUYTxlflTDCDwiC
	qJgd309pcZ8lwPO3nNT9D7aQ5heXEv3PQDlkBCAZ3QMiIt/SE04Gp7negejSbqPILnvZqk3XRtu
	hFcuoXk18YiymMSthzNIWZXIeNT4z9BjncYwsjhGNkxa5dgeN63tzJ9WofCGGdWD+i9NO9+IgHr
	hbtZvz5lf4jfmAYBSB0VkPpg78L/8XVz4+YDNz3mC1DRcke1rtB3bC1qXvr2eL1sJDXs4NZlBiO
	5bNVvPTPsZQyXB8tTZamCI6BHVhtDbnb0q2P3g5jRU0LAPq/VSr/ditFWslneksG9n5puP6Dw3S
	cBIZkZBDmPy+cV+q8hEIlkTIBK77jG6AMx8thIY7YdVrIR2nIrrfrxAMp1KPxFSxAa7eflHdcJ9
	WnIKid76F2409S/3Atz09OmVIaHjh7Mkb/brQq3PM7JrzJeC6Vg7MuPoloTSXwMnSPtIJ/KcZcD
	iNMWqIyLUPIWQztqC1fZJz60+6Y6kkaa8pMvZ6h3SJj5IKNxsG2HpTxuY/N8YXQ=
X-Received: by 2002:a05:7022:5f0d:b0:195:c6c2:c6b with SMTP id a92af1059eb24-1a6ce9bad49mr1386027c88.35.1793156714994;
        Tue, 27 Oct 2026 20:05:14 -0700 (PDT)
Received: from penguin.lxd ([12.187.136.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75a37093esm1150734c88.3.2026.10.27.20.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 20:05:14 -0700 (PDT)
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
Subject: [PATCH v2 3/8] crypto: acomp - Add trivial segmentation wrapper.
Date: Tue, 27 Oct 2026 20:04:58 -0700
Message-Id: <20261028030503.17923-4-kanchanapsridhar2026@gmail.com>
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

This patch provides a wrapper for existing algorithms so that they can
accept a single segment while returning the compressed length or error
through the dst SG list length.

This trivial segmentation wrapper only supports compression with a
segment count of exactly one.

The reason is that the first user zswap will only allocate the
extra memory if the underlying algorithm supports segmentation,
and otherwise only one segment will be given at a time.

Having this wrapper means that the same calling convention can
be used for all algorithms, regardless of segmentation support.

To gain latency in the zswap_store() hot path impacted by this patch:

1) The most common code path is invoked first in
   crypto_acomp_compress().

2) The helper functions used in (1) are made __always_inline.

Co-developed-by: Herbert Xu <herbert@gondor.apana.org.au>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
Signed-off-by: Kanchana P Sridhar <kanchana.p.sridhar@intel.com>
Signed-off-by: Kanchana P. Sridhar <kanchanapsridhar2026@gmail.com>
---
 crypto/acompress.c                  | 39 ++++++++++++++++++++++++-----
 include/crypto/acompress.h          |  3 ++-
 include/crypto/internal/acompress.h |  4 +--
 include/linux/crypto.h              |  2 +-
 4 files changed, 38 insertions(+), 10 deletions(-)

diff --git a/crypto/acompress.c b/crypto/acompress.c
index c8b4b8589769..c55b0e8eff3d 100644
--- a/crypto/acompress.c
+++ b/crypto/acompress.c
@@ -166,14 +166,20 @@ static void acomp_save_req(struct acomp_req *req, crypto_completion_t cplt)
 
 	state->compl = req->base.complete;
 	state->data = req->base.data;
+	state->unit_size = req->unit_size;
+	state->flags = req->base.flags & (CRYPTO_ACOMP_REQ_SRC_VIRT |
+					  CRYPTO_ACOMP_REQ_DST_VIRT);
+
 	req->base.complete = cplt;
 	req->base.data = req;
+	req->unit_size = 0;
 }
 
 static void acomp_restore_req(struct acomp_req *req)
 {
 	req->base.complete = req->chain.compl;
 	req->base.data = req->chain.data;
+	req->unit_size = req->chain.unit_size;
 }
 
 static void acomp_reqchain_virt(struct acomp_req *req)
@@ -192,9 +198,6 @@ static void acomp_virt_to_sg(struct acomp_req *req)
 {
 	struct acomp_req_chain *state = &req->chain;
 
-	state->flags = req->base.flags & (CRYPTO_ACOMP_REQ_SRC_VIRT |
-					  CRYPTO_ACOMP_REQ_DST_VIRT);
-
 	if (acomp_request_src_isvirt(req)) {
 		unsigned int slen = req->slen;
 		const u8 *svirt = req->svirt;
@@ -242,6 +245,10 @@ static int acomp_reqchain_finish(struct acomp_req *req, int err)
 {
 	acomp_reqchain_virt(req);
 	acomp_restore_req(req);
+
+	if (req->unit_size)
+		req->dst->length = unlikely(err) ? err : req->dlen;
+
 	return err;
 }
 
@@ -266,10 +273,13 @@ static int acomp_do_req_chain(struct acomp_req *req, bool comp)
 {
 	int err;
 
+	if (unlikely(req->unit_size && req->slen > req->unit_size))
+		return -ENOSYS;
+
 	acomp_save_req(req, acomp_reqchain_done);
 
 	err = acomp_do_one_req(req, comp);
-	if (err == -EBUSY || err == -EINPROGRESS)
+	if (unlikely(err == -EBUSY || err == -EINPROGRESS))
 		return err;
 
 	return acomp_reqchain_finish(req, err);
@@ -279,10 +289,27 @@ int crypto_acomp_compress(struct acomp_req *req)
 {
 	struct crypto_acomp *tfm = crypto_acomp_reqtfm(req);
 
+	if (likely((req->unit_size == req->slen) && acomp_request_issg(req) &&
+		    !crypto_acomp_req_seg(tfm) && !acomp_req_on_stack(req))) {
+		int err = tfm->compress(req);
+
+		req->dst->length = unlikely(err) ? err : req->dlen;
+		return err;
+	}
+
 	if (acomp_req_on_stack(req) && acomp_is_async(tfm))
 		return -EAGAIN;
+
+	if (req->unit_size && acomp_request_issg(req)) {
+		if (!crypto_acomp_req_seg(tfm))
+			return acomp_do_req_chain(req, true);
+
+		return tfm->compress(req);
+	}
+
 	if (crypto_acomp_req_virt(tfm) || acomp_request_issg(req))
-		return crypto_acomp_reqtfm(req)->compress(req);
+		return tfm->compress(req);
+
 	return acomp_do_req_chain(req, true);
 }
 EXPORT_SYMBOL_GPL(crypto_acomp_compress);
@@ -294,7 +321,7 @@ int crypto_acomp_decompress(struct acomp_req *req)
 	if (acomp_req_on_stack(req) && acomp_is_async(tfm))
 		return -EAGAIN;
 	if (crypto_acomp_req_virt(tfm) || acomp_request_issg(req))
-		return crypto_acomp_reqtfm(req)->decompress(req);
+		return tfm->decompress(req);
 	return acomp_do_req_chain(req, false);
 }
 EXPORT_SYMBOL_GPL(crypto_acomp_decompress);
diff --git a/include/crypto/acompress.h b/include/crypto/acompress.h
index 6462fc46f4ec..e64cf422510b 100644
--- a/include/crypto/acompress.h
+++ b/include/crypto/acompress.h
@@ -67,6 +67,7 @@ struct acomp_req_chain {
 		struct folio *dfolio;
 	};
 	u32 flags;
+	u32 unit_size;
 };
 
 /**
@@ -294,7 +295,7 @@ static inline void *acomp_request_extra(struct acomp_req *req)
 	return (void *)((char *)req + len);
 }
 
-static inline bool acomp_req_on_stack(struct acomp_req *req)
+static __always_inline bool acomp_req_on_stack(struct acomp_req *req)
 {
 	return crypto_req_on_stack(&req->base);
 }
diff --git a/include/crypto/internal/acompress.h b/include/crypto/internal/acompress.h
index 93ae59623f13..0c0d3fc8a9fc 100644
--- a/include/crypto/internal/acompress.h
+++ b/include/crypto/internal/acompress.h
@@ -146,7 +146,7 @@ void crypto_unregister_acomp(struct acomp_alg *alg);
 int crypto_register_acomps(struct acomp_alg *algs, int count);
 void crypto_unregister_acomps(struct acomp_alg *algs, int count);
 
-static inline bool acomp_request_issg(struct acomp_req *req)
+static __always_inline bool acomp_request_issg(struct acomp_req *req)
 {
 	return !(req->base.flags & (CRYPTO_ACOMP_REQ_SRC_VIRT |
 				    CRYPTO_ACOMP_REQ_DST_VIRT));
@@ -189,7 +189,7 @@ static inline bool crypto_acomp_req_virt(struct crypto_acomp *tfm)
 	return crypto_tfm_req_virt(&tfm->base);
 }
 
-static inline bool crypto_acomp_req_seg(struct crypto_acomp *tfm)
+static __always_inline bool crypto_acomp_req_seg(struct crypto_acomp *tfm)
 {
 	return crypto_tfm_req_seg(&tfm->base);
 }
diff --git a/include/linux/crypto.h b/include/linux/crypto.h
index 78c699ac3f82..0628b62e4946 100644
--- a/include/linux/crypto.h
+++ b/include/linux/crypto.h
@@ -492,7 +492,7 @@ static inline bool crypto_tfm_is_async(struct crypto_tfm *tfm)
 	return tfm->__crt_alg->cra_flags & CRYPTO_ALG_ASYNC;
 }
 
-static inline bool crypto_req_on_stack(struct crypto_async_request *req)
+static __always_inline bool crypto_req_on_stack(struct crypto_async_request *req)
 {
 	return req->flags & CRYPTO_TFM_REQ_ON_STACK;
 }
-- 
2.39.5

