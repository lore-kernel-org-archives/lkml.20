Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792464890;
	b=wwktjqFYFqVp+QIDmBiZJhmd6tr2J/kpU/VOscYmd096+F0qx5fyzIhYq2prWf+5aI/i
	 eyEkY+Ox3nCqpMpFU7+Wz5NOGuJ2NWQq9577KIwZUQgCei5RxRARX1+//uEbcbFmPMGHH
	 xpc5+CU5NnJ+rEDcGqj50TnUgu6oBK7UM7PhLe4QdsWCEsY4VtPcpmIR6hnBK8Vk69FwQ
	 0364Yfod9MbCxFmSucx6NudBVwGZqY5f1OsahnOMIVDoSZMl65DwUcIzwDNhrp76PjRv0
	 sdIWdB8x1k2RBvho5n3KF68jkGGQ1Xb/gaXhLeAOOtfQJ8OZq6nNgjRgxmOR15oe9YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792464890;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=37xB/YNDXqmc8yrI7VGEp2TohG1TORHxT4RwOLqZ3wg=;
	b=l3jwJlBYw7R+szOcBym65JxBOADsHRflhiK9sSMrI+tzhwcDFVVN+b31emhBrx1X+7gU
	 RWMAJBTd3QUYKqX3qcvpAMmCWMuc6a6i4pU9p3+Wcw96zZZq7ITdxccwYbm/reOsSAj4E
	 fPZRSeUx2xXnm3Ogj62qOL0hAa+BlYT0uskPgoNfMqv2u43NysNRhNI+BCRDEWsX7bfBK
	 2GNFtrNr5BG8fw7TIO4gw61AaUjv3sGdtiXjKmy0Mkd01DommZ7Lw5Fc4/XLV/U6NtrS0
	 F0Cm3HR8myev9ccWGNTwhSph2+nsoywX7fCS0I1qxTjY/i03PyixAqU6I4WiRiQPl6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=P72JMuUp;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914FF606A327
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 914FF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=P72JMuUp
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 658093F994
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792464882;
	bh=37xB/YNDXqmc8yrI7VGEp2TohG1TORHxT4RwOLqZ3wg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=P72JMuUpS/ztCkXdUArBYlAZeFleAt5MwNABhvLf5Swxs44yudr2JG7a7McqTD8jU
	 iOw/pIzIWnfF//vX0rD0HAa51mIM5EIQlpfLFJV7ekT0whJXqhleU7da9ttOl/RvxZ
	 9Mmaxb22mrVIXa/WHuouXpgvTCzFNavkIlwagPd8O3qb2BFzhBFVDIJWjr1lLwcpG8
	 Iw7Q5PvkE887GRdsTdf9IWLhMXiIVgqsg0HBtIecIRa6WJ0SIXbO/ncnSpMMkPdwwx
	 oRDTyo7LoZjRlVfgdya/HZZM8otRWZaOJ8xRh8IfTam3V0mLKKizu235FdRL9IC17Y
	 bTElAgl5iq4Nq9J5vD+frHIabJTb6B8+sdkGuiUxx+82nbfdpeNrUZVPHhhgI6dZ9G
	 Rd2IiMg/4JSp9RxFw7P85UxTnT1pzcKsKGsDdBkYOvKm4mEi8DGcUekFlKGeIMpI4N
	 +lZDKdQAZN+i7/MuarshLQFgxhSuIt1+f63HphjQ8ccO2+7zByP1AW9t62jJS4xM7p
	 80tBotHFBg+Kvg1kZJRptZksNzpcalQGfXZlTusuXhynbapXGyHQ5nD3GVfs6EAO+2
	 WFX2KrX2ss9kxkFPsy4p8LC8AVo+l68I/F2VRF6dMx8B90YAvjCF88u+2TasuoWusR
	 6AeeRTkgXmm157iy9RZOAnOI=
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a46f0f158dso441353a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:54:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792464881; x=1793069681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=37xB/YNDXqmc8yrI7VGEp2TohG1TORHxT4RwOLqZ3wg=;
        b=UKaDVAFvL+7Z14c8bV4FFcyFyKCh7GVKX2LOGuv5GR1PpnXmhn1RCvK0yRs90VxoHl
         kN+/80U/5Ci/75karfgKZYHV2ESDTuMS7FYX+HYzIqkf4lOnElBFIl9fvB1EHIcJ4+3P
         mvy4clOniLGt0xNHnVPlc3lfVfvTp7N0Ihb4eia9jhtPllml5W26vn6sYQlEtiiiXVxZ
         gEv4JBkr9OfDr/s0sflVyxMKIiaPIteVM52ej9flxjhAzxFrHBacA+YSNVJw/1HTPPSd
         AonPE6h2jSafzrbOmvtsNhmAzLY1zIqMrNSFuNLY14wbbp1jvcqDHfY96oWzHdQ1ngR3
         UQXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzA+KMKmmmvLZUlit/JiiFHWKnmAZRtzhwHpJI0ZS/3KFw4J3YtRBgd/U0o4f4TORaj/59p/vgnxUTQ5yU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlzIarnVdTaS1qt/RzP70oi0qwhpbgtKbcK5doMJOKfFyaFPyu
	ewYSAdQfbEyQBgkCI/fJGK2isn0LvNutm45dFFkINJEbzWdRnkymDXR9dR6WujyP9hy59oqRpTt
	rAvwXLy1G2KAFxol7jtHQ4Cke1x0KSof95gqLN0NC8yxuBar3nQFUC7e2eznkfoIrEIgDnoRqbR
	TgEO7TMQ==
X-Gm-Gg: AYBFou3kW+x3rGDmRS5BXa1e5zPQZeekeK1QJCJaRY25n6EGgSQ61ZdXX6WRzJhEN2B
	hZz8HmipMuD6OHNJIRkwU2wVtBq6x0scYt//f1k2Xh/JLGDWVwlRux6Lw02uqaryam7brSEZtwf
	QfdUg669OANrxs26BkT9/6Zhsetm1r/mhuQGHRgvAO+ClTEqWJpCdXYzHeYbvwp/DpVxuuAoYqg
	uQsA/OEnHyVGG11BiXyQ45zXBBsaXUnmKbnWPyA9J9Fn10bQXoSOa5RCudfQX41Jm1ucW1ka+gM
	M0UeJAwLThaTTjR7t4xmoZl2FedQqtPKp2KMT+wiUV9AsgbA/7gZq/DRp7c24qljqShBC0Yt0fL
	U8tnsdDUHPA==
X-Received: by 2002:a17:90b:448e:b0:3a8:337d:228a with SMTP id 98e67ed59e1d1-3ad64b90a7fmr509202a91.6.1792464880619;
        Mon, 19 Oct 2026 19:54:40 -0700 (PDT)
X-Received: by 2002:a17:90b:448e:b0:3a8:337d:228a with SMTP id 98e67ed59e1d1-3ad64b90a7fmr509197a91.6.1792464880205;
        Mon, 19 Oct 2026 19:54:40 -0700 (PDT)
Received: from ZBook.gateway ([123.208.39.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad5d5679d5sm1962994a91.7.2026.10.19.19.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 19:54:39 -0700 (PDT)
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
Subject: [PATCH v3 1/2] crypto: caam - Fix wrong unmap operations
Date: Tue, 20 Oct 2026 13:54:25 +1100
Message-ID: <20261020025426.955531-2-changwei.zou@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020025426.955531-1-changwei.zou@canonical.com>
References: <20261020025426.955531-1-changwei.zou@canonical.com>
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
correct unmap function based on key->priv_form.

caam_rsa_set_priv_key_form() implicitly relies on zero-initialization
for priv_form. Set priv_form = FORM1 explicitly at the head of the function
for clarity and robustness.

Fixes: bf53795025a2 ("crypto: caam - add crypto_engine support for RSA algorithms")
Signed-off-by: Changwei Zou <changwei.zou@canonical.com>
Assisted-by: OpenCode:claude-sonnet-4.6
Reviewed-by: Sahil Malhotra <sahil.malhotra@nxp.com>
---
 drivers/crypto/caam/caampkc.c | 43 +++++++++++++++++++++++++----------
 1 file changed, 31 insertions(+), 12 deletions(-)

diff --git a/drivers/crypto/caam/caampkc.c b/drivers/crypto/caam/caampkc.c
index cb001aa1de66..18a728849147 100644
--- a/drivers/crypto/caam/caampkc.c
+++ b/drivers/crypto/caam/caampkc.c
@@ -379,6 +379,7 @@ static int akcipher_do_one_req(struct crypto_engine *engine, void *areq)
 	struct crypto_akcipher *tfm = crypto_akcipher_reqtfm(req);
 	struct caam_rsa_req_ctx *req_ctx = akcipher_request_ctx(req);
 	struct caam_rsa_ctx *ctx = akcipher_tfm_ctx_dma(tfm);
+	struct caam_rsa_key *key = &ctx->key;
 	struct device *jrdev = ctx->dev;
 	u32 *desc = req_ctx->edesc->hw_desc;
 	int ret;
@@ -391,7 +392,21 @@ static int akcipher_do_one_req(struct crypto_engine *engine, void *areq)
 		return ret;
 
 	if (ret != -EINPROGRESS) {
-		rsa_pub_unmap(jrdev, req_ctx->edesc, req);
+		if (req_ctx->akcipher_op_done == rsa_pub_done) {
+			rsa_pub_unmap(jrdev, req_ctx->edesc, req);
+		} else {
+			switch (key->priv_form) {
+			case FORM1:
+				rsa_priv_f1_unmap(jrdev, req_ctx->edesc, req);
+				break;
+			case FORM2:
+				rsa_priv_f2_unmap(jrdev, req_ctx->edesc, req);
+				break;
+			case FORM3:
+				rsa_priv_f3_unmap(jrdev, req_ctx->edesc, req);
+				break;
+			}
+		}
 		rsa_io_unmap(jrdev, req_ctx->edesc, req);
 		kfree(req_ctx->edesc);
 	} else {
@@ -691,18 +706,20 @@ static int akcipher_enqueue_req(struct device *jrdev,
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
+		if (cbk == rsa_pub_done) {
 			rsa_pub_unmap(jrdev, edesc, req);
+		} else {
+			switch (key->priv_form) {
+			case FORM1:
+				rsa_priv_f1_unmap(jrdev, edesc, req);
+				break;
+			case FORM2:
+				rsa_priv_f2_unmap(jrdev, edesc, req);
+				break;
+			case FORM3:
+				rsa_priv_f3_unmap(jrdev, edesc, req);
+				break;
+			}
 		}
 		rsa_io_unmap(jrdev, edesc, req);
 		kfree(edesc);
@@ -992,6 +1009,8 @@ static int caam_rsa_set_priv_key_form(struct caam_rsa_ctx *ctx,
 	size_t q_sz = raw_key->q_sz;
 	unsigned aligned_size;
 
+	rsa_key->priv_form = FORM1;
+
 	rsa_key->p = caam_read_raw_data(raw_key->p, &p_sz);
 	if (!rsa_key->p)
 		return -ENOMEM;
-- 
2.43.0

