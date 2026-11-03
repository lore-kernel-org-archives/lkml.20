Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793679269;
	b=K/us3R3jHnV9zdKqhnrk21H2C/jSPe+FjKRoHulF/+ND9hZUgv9Ka0306vKFI4I+I5rc
	 FjMQRcl9vPziremSoG4Am1CFezoy1r8I+3XeyUUhAut1v6+iKVG3ix4yxbJ5ghJNN6ubb
	 hL0zh2AeE4q3Gil/v0oEjkhv8fgz3KRF6c64dXxvsBEazJZtjZVz5Z7sPP8v5sEf/vQ66
	 X9CZpy0Rz4aInJKE5wbdJrUb2P5wV0yffdXOZH47+o7CzLoFYag1RitKEKfiSkYNg9jcM
	 0d5KVtqgzzk7fNz5885xMIifIoDBTZ8uWWc1LxwTssJtn1vr3Hubjh+shJeqlkg7RBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793679269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8kizTq969MMG4ZmGsWzf/eUqjfpKRrKiIja6oeumpC0=;
	b=vY7LItdJb/xATE8ehFsExO3JnJ/s6Z9TXOerVUpqqtJC/oOuxIaZXUqhUmozyHgDixHp
	 vWTCXB+HoV3DWjx9Kv4dMB0YCmD8iap1MltpQCW9EZ8Z+ERp0ifEkgE+tS5QjqzlCDy+4
	 dfl8x38rs6Ic8jxQh/OxAGFzkzsrA8v7hkMA1ZxxBCt+rpyjgA6oA6o2tzY9u3+O6RxoR
	 YuE6yNbsuxq5JBr9hMu1QvxhndDPa1xpuS+7VLxJBQI7msPrQbllp5Gc0Pq5WcE8VTNfl
	 bJ4FYf1N0D4qS/p4Aha8j/D5VOqpO+x+S+Togxv7xqwpgcm/Jfthya2VJPb9z/2IMVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zi6uix4u;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB050606D803
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:14:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB050606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zi6uix4u
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso1558933a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 20:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793679268; x=1794284068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8kizTq969MMG4ZmGsWzf/eUqjfpKRrKiIja6oeumpC0=;
        b=Zi6uix4u7aXuz6apso6LznxjPJQg9eYwZVSuJ80M4bymN8qnbfdlpmsTag/HfyE2BA
         AI4E2GNOzCn4+zzpbRpjPV7rTAzZN7/HmvlYHbY5l+6I1pO8Cjxg+dzu+CUWAQZls8q+
         CJAPhOduNod28zGMYl87MbpZ3WFBurCGBM91AUm2GZAXCqa9n78u0m0Kp2SIxcoeNnAI
         CJHAqkiPR0fU7ZH0uGgi/uTk1AU2N8tUEbfNsXS2ihyhLYKXsN/Jv/Vl27swLjD507ez
         ptKsDHf7F6/4s/P2X2cOqxbvOgj0N1C4W+8nADWPSFK3wlW83dGaROwNae4jBzA6+Yji
         EdXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793679268; x=1794284068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8kizTq969MMG4ZmGsWzf/eUqjfpKRrKiIja6oeumpC0=;
        b=oMfIO7XjjLj8oRwG4oxBa3R3WZ9DqR2Cgx9nLFJYdXxoDPZaGwhOpRVDzdBAEYvoE8
         vwWT8HX9Xz1F//SaKm8eHmBaBDnN8f43wxYtnuZZtbAa/+1NuE0BP9r3bBaBCJeSGPy/
         0sWSYzcCiDuFysQzerA5mG89GDE4P0Gx9uq5gj+uGEUpzwwDu8Xngq461BbbpcuOOs0z
         LGWqPq1EOG1vIBUQ6W9mYsz5Db/CrB7d9JL50HOuZ7T1/aRbIGbABDlwy467J7khLDTW
         0JW7fJPZbFcuT/3F3XUqCPGQPN6odf3oZUg0YI0f0zPVl1buHJT7bSecEUrbj3nLSaLR
         9fjA==
X-Forwarded-Encrypted: i=1; AKwUvByd3lKQohb/HBa9GG26IsTso7TON3+3yMUxojIoZyI2GRhheEOVUWM+Izzm8+jqoCFROI/N4Qq+r4PpUnk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3iwBd1Zyv39322d3Aq26+hc1feCp75dAVAHx4dp98QoRAoD3d
	+9P4pNUvneKA9UudyTHGOR08IgzGeaGm6CUhcMYjtPLaRFeofG3bxaeD
X-Gm-Gg: AYBFou3jhXgCoOw2NRcaYMAzm9PMc56OLPmV3jfetWjZmTR8houxJSldL/jsblL9T+N
	+zL3uQHjZeikFyLhjj9I0PPUAY70GUGdOjlBs+cVLOoXUsnS9XIHy25RQHQlBhMJZQ5VGIxJCSc
	c1Q+XN5AwuiMOH8fY0NeQoBxmqvgkXFnUhpccvfwkezhvU9IbAsiFwF0CqED0OD75grkgT04TTh
	6UtC3TPt6fM/sl2hAihKQ5hhhW/Y4EAH5wc4qSsJZ3ZGkC+sJwUCxYlGNVph94cbONHikW5cxGi
	MwUlxrw3te7rzSP4Mm6iAaPWqpe5aivu559qPvI3PSSOpaDX2zBdqneQQ/Evx7ph85n4FXQ+F3Q
	l8io4AZ6PzgmVCVxjXV88aBeMmTOUnubzxWt7y2VQm4yofUBCviFbYIuMn2/8V11CUI8n5jt2ug
	FJwCdzMpl0oYfRFmUu5ADfYaP8kCXWS95KTPTmU3rrtMNyoDM3bZTp41YQQbZ89Ydj+J6uqfzC9
	fcuqAKMcuMINFJ7q9vM9e8SlfLYnRrw3FyHY43ocd2B4DU4O4BdCcDoIxgV94l5fZwMRonwESk+
	cdSjdrXrMqzNexhfQRljr+0OR6L/u5gKtCxTMTJbmQXwPDHjI1MD
X-Received: by 2002:a17:90b:4e83:b0:3aa:f4af:1e0f with SMTP id 98e67ed59e1d1-3ae89536c2emr9621091a91.8.1793679268202;
        Mon, 02 Nov 2026 20:14:28 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6740a1sm1989659a91.10.2026.11.02.20.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:14:27 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: linux-crypto@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] hwrng: histb: use device messages
Date: Tue,  3 Nov 2026 12:14:00 +0800
Message-ID: <20261103041403.4071708-3-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103041403.4071708-1-mmyangfl@gmail.com>
References: <20261103041403.4071708-1-mmyangfl@gmail.com>
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

pr_*() prints without saying which device the message came from. Print
with dev_*() instead and adjust error messages.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/char/hw_random/histb-rng.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/char/hw_random/histb-rng.c b/drivers/char/hw_random/histb-rng.c
index d435d4ab9aa7..d28cc84e8367 100644
--- a/drivers/char/hw_random/histb-rng.c
+++ b/drivers/char/hw_random/histb-rng.c
@@ -22,6 +22,7 @@
 
 struct histb_rng_priv {
 	struct hwrng rng;
+	struct device *dev;
 	void __iomem *base;
 };
 
@@ -71,8 +72,9 @@ static int histb_rng_read(struct hwrng *rng, void *data, size_t max, bool wait)
 			if (!wait)
 				return i;
 			if (histb_rng_wait(base)) {
-				pr_err("failed to generate random number, generated %d\n",
-				       i);
+				dev_err(priv->dev,
+					"RNG timeout, generated %d of %zu bytes\n",
+					i, max);
 				return i ? i : -ETIMEDOUT;
 			}
 		}
@@ -142,6 +144,7 @@ static int histb_rng_probe(struct platform_device *pdev)
 	}
 
 	priv->base = base;
+	priv->dev = dev;
 	priv->rng.name = pdev->name;
 	priv->rng.read = histb_rng_read;
 	ret = devm_hwrng_register(dev, &priv->rng);
-- 
2.53.0

