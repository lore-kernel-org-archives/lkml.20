Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569828;
	b=Kok9eZn+qZn5wYvxE5Vt56cOC2C9wohpAz2bUev08X6CKwDvvjIBC6Kzlw8P+Bg6QeRy
	 R9DY71sovr63hGH4dzznSacWmKEQ+f2tflDlTndgt9NsZiGUfAUBlEGZ8VWFzkyBENwWd
	 lladPA55bfT45gj8JiuEcOmCY4paITuGOlH8Q13mR4oNBmZpF2rEbLSJSoTBJEU9muUue
	 xfxosF9JC0TldfkcRR+/h2hx2AM3mEWh5ei1XfOuUjD82qP17YhpHZubBxJ1SYFobfXAo
	 0VoaBigDJ8P9iZsSNR1FLFJiJc4vzVmnc3lD0onyacUjUGxBcR+LaKBwuM10pA8Q3lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569828;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8rzGcqO6FOauElNVIzlvQ2HVSNmWKT8BFtuZe8FFl4U=;
	b=X7QThxt3jUJFvZW3DF3D4pmaf14z6qyWYzMwZK1jDUDonu4FofxTdfgHlmVR6r4IGLsU
	 qO67iWZvNelNxgs+5ZW9EmlbltID0CH+9RLM0BChCnd1P3nzpf2rt39areXDY/qPmeILv
	 4jPbMGNuo8GSOAgq6poni0Y8qLD29e0BFBLWVAff2U/EVnyNFtc5y4hPjt3vDfZQw20bv
	 bBz/HeuNWrFexqMLO6MnySNJjrEya96NbiEqoVDZT7hQO8/n9SUsTvKEEF+Z6uo4Xyl9D
	 vMwoHgsslvdsn4i36rmJ67yhD9k/kQyWgdlQwK15kkTf7zZ4PVfdL8TF905d/YgWUzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=fn8mvbsw;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A2D606A880
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2A2D606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=fn8mvbsw
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6F24842A1E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1794569826;
	bh=8rzGcqO6FOauElNVIzlvQ2HVSNmWKT8BFtuZe8FFl4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=fn8mvbsw5DxdWmPB3g8G4LL7IOv+9iKraEtdua5plpN12G3qgXJN+Kw1Cft64nTtN
	 yf/UBS3oUbcl4QcIKTgCkKYD1BsFzFgqZDYBGnjRn3Tl04Zy2lAiCBbJdMwjBRZSEc
	 yQAx62Duc4hT0ZPu52qDJ42FM15baqNheT0qEq4R7aZ46KUTMXHtgq8CIlkhAC+Y4H
	 0Kf6b8otz8LP4B1Bfp7oa2ksSuZDzZo+7YBhsnslgzkW+yDNZ+nZwUUix0DuLom1dI
	 h4Sg1hzIq1dKek62vNDHV0e21cQm2vAaLCY4j05fMdHK0b9QTbKZSNE0jQNqlsZ2rI
	 7mZnD8wNeIvMTVCLbjunkwnwsLk/ikENqK5BV2AIbdRIZgyEjYJ+gbWUgMebhTZggu
	 kvmgiM5n5/Yh/iYPUGJTAySGKLNgbOepktXGRrVw46BO6EuooAFrFXXxCxbXmDM/WT
	 Z7rglSktL4sf7U4q0yHIrGBEeOSiz7TJKwAqwKb8YzKZ21OZlTfNrTOuNqD1uDQ/O3
	 PP+1jrAZCHlRbpNNGBbPmHEUctu1BB9BWrAed/T0Oeblm5DAF4HFWoWoKQ7b++g/g+
	 NVfibTGk7WQNzxd7SZGkwDNsW7cxubBZojyy4Ube9/q621RMtb8Oijj2qRCxGMc2kB
	 71RnQL8/n++JBQVKiVlNdaMs=
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-89fb6a45c48so1044236b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:37:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794569825; x=1795174625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8rzGcqO6FOauElNVIzlvQ2HVSNmWKT8BFtuZe8FFl4U=;
        b=jbf0D9G23yjAVKocjp4CjMhcZmo6yykeMAnRlhKQSY4XXezO/2qItGHlogQRchgCLW
         1Ctk84PFPe+TwWtXVAqgi4G8UWuoDzpkBFKoV87etiIy/YbcZ7ZU1yCzuhsi4mu8MzSC
         sCzb+uJlBWAjn4yb8DfyX2eCireE8orkmmvYSR8pj1rsHxZPvR/WHCzlgRZfpqccaWWI
         LnpjWqh/WQTN8ZSgJ4gvkIP0Nu2NvyC9JyYIePDh1ek/xjkBoOZM/AtYcGS7Et0yJJ6Y
         zCbthtTfRlJIBx7KHBzuvp5+Sn+PmQ5h9S6tHhdfRJAzxo6A0o9XHmJV/3VtRBZoOwgu
         8aTA==
X-Forwarded-Encrypted: i=1; AL+hErH5Y/14tDu0/AAmcr6VFgBvXVfMIUk/M37SqYs9w3IPGTF8uQo9XCYngQUjiE+jWjswF4mBJ6Jhnogje08=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sm0g3P6Y4nQFXpdmopbPmtItEBOfMTJOYk0ezVyGL2yMizslb
	U6Ge1CiBq6S32cKwniVnGaO/iJsu9agTmsQnUhcWCfjYx4Nw1ZksDSpvPBbN7RgkbZMwCBKb1Fl
	CPC4QnPOxj45b0WZuWMDPlr1XgyxApwvo2OOR6jbpRyxnaMVFcEFgSX6nBmziZAFnEVDHomVqqZ
	Jdy0Jlcw==
X-Gm-Gg: AYBFou3jInZhNHqTKV11zZ8eLhaezwl4Qjx7z/YBPqKltCTmDsdjeKq5yz9fzlCywuU
	EE82yR1z1gdEwrzySv8/+mik4TAKC29FJDlfV2AZ3o4tsFU7SkssiqNTzBK6hQiIAuZ716APq71
	8Mw9BsyFBGNL2Ms9Ut3Cpal0Q/SQm/ZZ67304JICQ42ZUw2QF5upfT9AA6pqrMMcC/yfOn4W6hu
	TSajyZkW8LBtZ1crx5PvSTTwHn3EwDhazZ+WI8aUx15Z6RT2/3Hcws47wUfQ6jIRVicZ/++qzZU
	xMjTFHGnt90Kpx/Rc1TYnutrbqAo3mrFL7VPwTK8qbDua/RcNHsYmo05CaZrZIs3n1IBbrIwN36
	MQZ46qhL/ukUDae0ID+OC0qaeW2SAjMhz+IXjhf/9wLxZh+aUEIp37TwOvlA=
X-Received: by 2002:a17:903:2301:b0:2ed:2d5b:d42 with SMTP id d9443c01a7336-2ee0dc93f9fmr22057185ad.52.1794569824803;
        Fri, 13 Nov 2026 03:37:04 -0800 (PST)
X-Received: by 2002:a17:903:2301:b0:2ed:2d5b:d42 with SMTP id d9443c01a7336-2ee0dc93f9fmr22057135ad.52.1794569824452;
        Fri, 13 Nov 2026 03:37:04 -0800 (PST)
Received: from ZBook.gateway ([123.208.39.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f80b7f6sm8757445ad.40.2026.11.13.03.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:37:04 -0800 (PST)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] crypto: caam - Fix wrong unmap operations
Date: Fri, 13 Nov 2026 22:36:49 +1100
Message-ID: <20261113113650.63038-2-changwei.zou@canonical.com>
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

Since priv_form only takes values FORM1/FORM2/FORM3 with no distinct
public key enumerator, rsa_pub_unmap() was not called correctly in
akcipher_do_one_req() and akcipher_enqueue_req().

Use the completion callback (rsa_pub_done vs rsa_priv_f_done) to
distinguish public from private key operations, then dispatch to the
correct unmap function based on key->priv_form. Factor this dispatch into
a shared rsa_pdb_unmap() helper so both error paths stay in sync.

caam_rsa_set_priv_key_form() implicitly relies on zero-initialization
for priv_form. Set priv_form = FORM1 explicitly at the head of the function
for clarity and robustness.

Fixes: bf53795025a2 ("crypto: caam - add crypto_engine support for RSA algorithms")
Signed-off-by: Changwei Zou <changwei.zou@canonical.com>
Assisted-by: OpenCode:claude-sonnet-4.6
Reviewed-by: Sahil Malhotra <sahil.malhotra@nxp.com>
---
 drivers/crypto/caam/caampkc.c | 48 ++++++++++++++++++++++-------------
 1 file changed, 31 insertions(+), 17 deletions(-)

diff --git a/drivers/crypto/caam/caampkc.c b/drivers/crypto/caam/caampkc.c
index cb001aa1de66..24c740cc4a8c 100644
--- a/drivers/crypto/caam/caampkc.c
+++ b/drivers/crypto/caam/caampkc.c
@@ -192,6 +192,32 @@ static void rsa_priv_f_done(struct device *dev, u32 *desc, u32 err,
 		crypto_finalize_akcipher_request(jrp->engine, req, ecode);
 }
 
+static void rsa_pdb_unmap(struct device *jrdev, struct rsa_edesc *edesc,
+			  struct akcipher_request *req,
+			  void (*cbk)(struct device *jrdev, u32 *desc,
+				      u32 err, void *context))
+{
+	if (cbk == rsa_pub_done) {
+		rsa_pub_unmap(jrdev, edesc, req);
+	} else {
+		struct crypto_akcipher *tfm = crypto_akcipher_reqtfm(req);
+		struct caam_rsa_ctx *ctx = akcipher_tfm_ctx_dma(tfm);
+		struct caam_rsa_key *key = &ctx->key;
+
+		switch (key->priv_form) {
+		case FORM1:
+			rsa_priv_f1_unmap(jrdev, edesc, req);
+			break;
+		case FORM2:
+			rsa_priv_f2_unmap(jrdev, edesc, req);
+			break;
+		case FORM3:
+			rsa_priv_f3_unmap(jrdev, edesc, req);
+			break;
+		}
+	}
+}
+
 /**
  * caam_rsa_count_leading_zeros - Count leading zeros, need it to strip,
  *                                from a given scatterlist
@@ -391,7 +417,8 @@ static int akcipher_do_one_req(struct crypto_engine *engine, void *areq)
 		return ret;
 
 	if (ret != -EINPROGRESS) {
-		rsa_pub_unmap(jrdev, req_ctx->edesc, req);
+		rsa_pdb_unmap(jrdev, req_ctx->edesc, req,
+			      req_ctx->akcipher_op_done);
 		rsa_io_unmap(jrdev, req_ctx->edesc, req);
 		kfree(req_ctx->edesc);
 	} else {
@@ -670,9 +697,6 @@ static int akcipher_enqueue_req(struct device *jrdev,
 				struct akcipher_request *req)
 {
 	struct caam_drv_private_jr *jrpriv = dev_get_drvdata(jrdev);
-	struct crypto_akcipher *tfm = crypto_akcipher_reqtfm(req);
-	struct caam_rsa_ctx *ctx = akcipher_tfm_ctx_dma(tfm);
-	struct caam_rsa_key *key = &ctx->key;
 	struct caam_rsa_req_ctx *req_ctx = akcipher_request_ctx(req);
 	struct rsa_edesc *edesc = req_ctx->edesc;
 	u32 *desc = edesc->hw_desc;
@@ -691,19 +715,7 @@ static int akcipher_enqueue_req(struct device *jrdev,
 		ret = caam_jr_enqueue(jrdev, desc, cbk, req);
 
 	if ((ret != -EINPROGRESS) && (ret != -EBUSY)) {
-		switch (key->priv_form) {
-		case FORM1:
-			rsa_priv_f1_unmap(jrdev, edesc, req);
-			break;
-		case FORM2:
-			rsa_priv_f2_unmap(jrdev, edesc, req);
-			break;
-		case FORM3:
-			rsa_priv_f3_unmap(jrdev, edesc, req);
-			break;
-		default:
-			rsa_pub_unmap(jrdev, edesc, req);
-		}
+		rsa_pdb_unmap(jrdev, edesc, req, cbk);
 		rsa_io_unmap(jrdev, edesc, req);
 		kfree(edesc);
 	}
@@ -992,6 +1004,8 @@ static int caam_rsa_set_priv_key_form(struct caam_rsa_ctx *ctx,
 	size_t q_sz = raw_key->q_sz;
 	unsigned aligned_size;
 
+	rsa_key->priv_form = FORM1;
+
 	rsa_key->p = caam_read_raw_data(raw_key->p, &p_sz);
 	if (!rsa_key->p)
 		return -ENOMEM;
-- 
2.43.0

