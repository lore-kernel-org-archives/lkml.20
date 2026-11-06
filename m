Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793995475;
	b=nYpc+XgHxM0sbRUn9zTNd++VWxjHX4LMvUS9CBkc/wV2zRDMVhygdjNXhrsM2BnAtQ5F
	 wBWjAZPGlJhhTA0wEXkPf9+hqlBLiLNSelFQF55hKlxuP+pSgCIBj/7TaxzDUrqDf7x55
	 M23+QQuuy8N9adOntwqcoenHUgWdQdS+9+ROZP5J1+EgsmIVX9ZO9WUmNFcj1+mygH60x
	 OGCd/Sva7vFPv+IvKazKEqP8sclBr350eWESBqe3RYmTvlELDhSPif1lTpFvIA/Pmikow
	 lD/RgMuvw9J6CDc6Tw6VmLT6QPS3YIcpTBnpuvNmTTQb6mXW7dvpHvr6GcIZ0x0+XQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793995475;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qdzzuDHKyfn9MEDqIa+4Jje9jOJuwPCdKzFPnU5vUZU=;
	b=2RuYXdyKFjGRhWuzG7h4fTRjs2a+6rTLMcCGq2CJ9k+J4A+tmuEVhYLOEtA5ECQ5Cr52
	 8A/jntaCz4EwnGI/ALnJDNVDGNI13Cia2JnUl0AQGuPk7cJEvhg0VnBuG5p1HnSSpi2GM
	 wvP2zQPKYmxbFWGSM0ASrRA8w1Wd+QM758Iwc+lJurHX7TdePbScNP+HCgeDGwxB8Kxpp
	 lcsPrvOeH8EN4wYb7OtOVOAZtgp9VgKWztBZPPY0JwIlYQG8KYGoVfa/ugoyjQFdonVVe
	 kTBlBgcojySMebM7UcPUFGBXPQurl5C4XyFqUG+3Yw00lZPZ3l9P6/SGUiR83giCwCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0EaSKAHq;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984AC606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:04:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 984AC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0EaSKAHq
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so8487145e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793995473; x=1794600273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qdzzuDHKyfn9MEDqIa+4Jje9jOJuwPCdKzFPnU5vUZU=;
        b=0EaSKAHqfT6MH8ZkinKIWE9zvrSc79drozCAYUhfgwN1m4IXV5z8n7RslTiGPtjbks
         8vK9vNKjmpB2vCiu82GrSYnB7PriyUI9woE+kdH/u1SeQ6RDamBgmFLd3Q3y6RWgAYpL
         gmxNBdiPLUIC9Iq9auW8I24skXfVqMt1s8SVEl5yAEoY0A/eN2BAwW7kWLtmS4SMKYau
         6RTbon4zvOqZi9yMA+4XmSKUmzQReJL1OAEaiOteb/X1HYQoOIwIMqUPcm1S8w/mM2SU
         tMZhlgkHK0CHkJKjkLF+F+7KNVaEUCCaTOShURJCGPeygCU6Z11sKRGrVyg+Xz7e3+Ob
         yz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793995473; x=1794600273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qdzzuDHKyfn9MEDqIa+4Jje9jOJuwPCdKzFPnU5vUZU=;
        b=aiZe6KvSxpzfzIOJ2TvypHFaLvetth9CoZLbBwKLWeHND+yCbLZhTG2BT1IsMkMUBJ
         gjJXoTZOeKm5v2wkl7b6R2RCDIdmBoiMOqC01AGYalqzGHKVku0e5m9+6GZFzoz4iETU
         aoa3KkyrqTngaIgC+LSnQLVK6aTTriKaIHi8PMw9ykv0WPKZKSz7jgfB/PGMmXXNmrh6
         QH8nlQVab/H7leY1vunHSLGBK3hFwl8sXR9MSc4zQ7ko34I5YmpEDKN5tq5FRyUkpeI3
         WyV/CsjIAsDPSBbpMtdSQwJUPBXMcKqFxtdXcmWJi5mAdYTz49jApZ3351SrMnc1oDEk
         11GQ==
X-Forwarded-Encrypted: i=1; AKwUvBy441XxENkpxmFC4vjlUI7l51zQ0De1dWpkDb7QVXUMhPeL7nvzB6BRscDby0mgRkejYo0/OeRieA6zkWY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8chfrQxX/dUyUcKzgMvE46/QZI2Qcot6H1Mv6YNpFLThPS9w+f
	mzDH3OD6870nUi/jQA7g58AwhEBqaTzuv7Y0R9dCRDv5NAR2C/miTFsE
X-Gm-Gg: AYBFou1YyHSJ10vzqpMYI7m3Fr8coTXKHS/aLW1ykG36l+oz88h8MBxh0YaO7uw0G8y
	I+M2r0AXuYt5kfkH2Ca+af/QZ/LQpSVuNBeBSxoAv9qkNYUmxgIJvHAjMmWwIbyquYhzoqDnHvI
	tZFGvAVqgPiU1gmMr7qGhe8ZOZ+Q0ywvs80X8qnLE96WfXG6DbN0VwrDxt+1oxAwKlhhAHC9AhX
	pfg7g6jvcVGy9aWGD7xX70ynX1HAsK3e/K97d7QIyjXMD0Q3oAIj0/6G6atCr2m+9gCsRpWKz0+
	DNrOUT1RwWmet3P/5d791yOP0/JoybnnIboooW4tWaHkuyV+g3ouzsn6Q+wrbp8o5AbGzt6ObRQ
	aIJap3if0dLrfrGE5FLU8vG5AvteOpUnmGQ3IaAMpq2FYe5MmiEzRXgvYl+Tm0NtzHMw6B21pvs
	TsLckb2sEJXhlzaEOZQ3Wz5IkuM9QdmswlHIRVEf2MnbU6tiHOtTvyQz7BFHJSscS2eAViiuWSr
	fesEwDRatlcNkS5vvk9w+8RmGIRCkR21mY8C5Ln877xLn8I13kfU6I2pDhX8RYuJozfIKs/P2SA
	3bNUuxEu0fAr8myxq05M5wAZa3Mv0PW+xpI8Ow==
X-Received: by 2002:a05:600c:3ba0:b0:4a7:a5db:a93e with SMTP id 5b1f17b1804b1-4b6db1c5f48mr71249715e9.4.1793995472786;
        Fri, 06 Nov 2026 12:04:32 -0800 (PST)
Received: from fedora.domain.name ([217.218.152.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cbdb9cdsm16959195e9.1.2026.11.06.12.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:04:32 -0800 (PST)
From: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
To: ampr.mhd@gmail.com
Cc: dhowells@redhat.com,
	lukas@wunner.de,
	ignat@cloudflare.com,
	herbert@gondor.apana.org.au,
	keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] pkcs7: Return -EOPNOTSUPP for data-taking algorithms in pkcs7_get_digest()
Date: Fri,  6 Nov 2026 23:33:56 +0330
Message-ID: <20261106200423.37769-1-ampr.mhd@gmail.com>
X-Mailer: git-send-email 2.55.0
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

pkcs7_get_digest() is documented to return a digest for IMA to use
when verifying a modsig.  For signature algorithms where the public
key algorithm consumes the raw data rather than a precomputed hash
(algo_takes_data, currently ML-DSA), pkcs7_digest() does not produce
an intermediate digest.

When such a signature has no authenticated attributes, sig->m points
at the raw data and m_free is false, so the existing check rejects it.
But when the signature does have authenticated attributes, sig->m is
an allocated buffer containing a modified copy of the AuthAttrs and
m_free is true.  The existing check therefore returns that buffer to
the caller as if it were a digest.

Test for algo_takes_data directly and report that no digest is
available, before attempting to call pkcs7_digest().  This covers
both ML-DSA cases consistently and removes the now-dead m_free check.

The only in-tree caller, ima_collect_modsig(), does not check the
return value of pkcs7_get_digest(); for a data-taking algorithm it
will now leave the digest fields unset and fall through with no
digest, which is the correct outcome for an algorithm that does not
produce an intermediate digest.  Callers that do care can detect the
new -EOPNOTSUPP return.

Fixes: f3eccecd782d ("pkcs7: Allow the signing algo to do whatever digestion it wants itself")
Cc: stable@vger.kernel.org # v7.0+
Signed-off-by: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
---
v2:
 - Add algorithm name to the pr_notice_once() message (Ignat)
 - Add Fixes: and Cc: stable tags (Ignat)

 crypto/asymmetric_keys/pkcs7_verify.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/crypto/asymmetric_keys/pkcs7_verify.c b/crypto/asymmetric_keys/pkcs7_verify.c
index 474e2c1ae21b..c2e0eda502e2 100644
--- a/crypto/asymmetric_keys/pkcs7_verify.c
+++ b/crypto/asymmetric_keys/pkcs7_verify.c
@@ -147,14 +147,15 @@ int pkcs7_get_digest(struct pkcs7_message *pkcs7, const u8 **buf, u32 *len,
 	if (sinfo == NULL || sinfo->next != NULL)
 		return -EBADMSG;
 
+	if (sinfo->sig->algo_takes_data) {
+		pr_notice_once("%s: No digest for data-taking algorithm (%s)\n",
+			       __func__, sinfo->sig->pkey_algo);
+		return -EOPNOTSUPP;
+	}
+
 	ret = pkcs7_digest(pkcs7, sinfo);
 	if (ret)
 		return ret;
-	if (!sinfo->sig->m_free) {
-		pr_notice_once("%s: No digest available\n", __func__);
-		return -EINVAL; /* TODO: MLDSA doesn't necessarily calculate an
-				 * intermediate digest. */
-	}
 
 	*buf = sinfo->sig->m;
 	*len = sinfo->sig->m_size;
-- 
2.55.0

