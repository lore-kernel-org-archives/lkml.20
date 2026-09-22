Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0C619D8BC
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790047244; cv=none; b=n6FFvxPZYMQ6LTEubkeTxC45OYDxUzP9ogf1Dt95QtVxHj1+F6P7tvFKFt433zny3UpwpZlbJ5FHpdnbt/qd33MpOpCVnRXi1OWnpnx1z27uqtxjvmAPAe4jqTAhuOQA4HpdWkJvOzdVYbyy63045PL5BHPCLen4RGmDGIgarJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790047244; c=relaxed/simple;
	bh=NFYkVXj5Q4rmSY6sxTmyvaVX6rt1lQAF/FvmjxKOyxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TsFME9w9LwsqCeFFtmxGovtl1D+lKBAl/b110Db6x6nWuuTYCFLQq78GTrcMcW5Ebfp09ZnNyxCOlY73Dgqr/gp7rqWFr7ybN/knwiMd2KiDIfc9RujhlGLoektk7ssoiy5OSisIemQ6TP6plSM8YKIXgIFrWCjv9GOOrVAGKps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kk61+Rf6; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kk61+Rf6"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2dd68a16955so5913045ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790047243; x=1790652043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kzO8DkUvhWLKnOUfdtsb9HGsluFZoqS1EuEZMi0Rqzw=;
        b=Kk61+Rf6OPtlMfmSXr7HFo4NjU8ikQYU092iuvHwscZYdqtsiCpsF9FuEg7hhBHYyV
         9TYLLkYAj1F5cgpV8uaWAkAhF6GX5NINa+ZU8WiYp27wuxmnmdNM8M/+lrCqEwLAj3N9
         +HyW+6b2uQCvztnTgDWh7DXv1Bb0eUFr2XKH+hl6hFu3EthLaLPjDo0KCcS7NKDfQIOw
         Ds/fzRhK6yRLGmeY1svB3ikCZ7KDFXJRQX/SxcYDor3GNgA0wy+I+NfE3A1wMX0DiIJH
         EINcnb2eedK0veCiE+af8QxBw9ejcYQ/wT9yTL4MLPj+gDt8EreE1Qch4NfeNw8VWnGF
         yarA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790047243; x=1790652043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kzO8DkUvhWLKnOUfdtsb9HGsluFZoqS1EuEZMi0Rqzw=;
        b=WoHsbJ/nPUAoS+a5NTfxqO6vqPnJvw/TznriefeT6qZ0/09KfPlq3pyKTlQrBDTk1k
         4SBYcdwkwiTyP0epRYuYYVvzqBJAaOGt2PxokIK+fXV0pcV5XIgoM52+HfQPI26eFXhi
         94cvjdNB+vMHpvLoFV4I+cgSzK+A7CFfUAXuLPCM3jhsf9eP9MhjIbLg8+WmTbtGLg3G
         vKTIV9ghnWD94u/VCJByWgCnuQQC4J2ywAY0JgvOju7SzNpQLhuMIYlTfBNDu0jOFuD0
         1VdD6zCR02COP1w1jgr1Iw4prdh4jkwmdCkfCnJYvwLl4XJuDQ/h+wW0OyMpk1rFfdD3
         8OyQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLUUDFYPY6CiOOtPkyOo8YAx9PkhMylgXw4FBdBBJ/rS2sfv8eAfcMlgLKMuc6jbj8zMEdTtYTrwUlNXI=@vger.kernel.org
X-Gm-Message-State: AFuF++nKTffdJmIm/F1uIJaW+vgR1q9PpW8dAyQsgVpnlVF58JED2FRc
	2s6dm4Q8RGMFU5VgcJ34c+5oF8wCO/Q3+s/TtTPgp5ZErf2miOfX3gV0
X-Gm-Gg: AYBFou0ug0YiIY1rXP21r95X068dhCUv4qjTSp467bssn4l25gLobM5mYMvzwMKYig7
	UA4f3YKA34z6DzGt7Fwg8rttYG6+gKzLHTwmMgyTmuQK3UzaG4HtZ7D/841EV7HSC7/JQCF9xZr
	eA6+WSVpkuSEjkvQQ25jo9dkDH5i6O8bWOvnUPa0TZrbvVtEzginG26biXHI+0AQV2ieXn1YaCb
	IuvZ8mo5nBXNa8Nikx6ACHT+N+/PGARo6BdTW7CeIvDrlgDXnaFxU5X2YvDoMv7GOlUBSk/KNDL
	VS/VgdcUMeDL4tehrqS4P0fRpfJyqzJAZaIh2/nE2udnDMG9JsqhMtk1InUIPHhdp4WsEUi4PBU
	G9GFMIDUaZNJsz2c98KMJtlqtICUaBwDpMhUPt9Aj56eXHsPJhsFm+EqzyMZJLYvLKX4f82dStQ
	btkXqnUQEWNtYovX2tP43ImM8535Qa6M4q8yMtnJpuJmcWEaiknSlcyWUXgxahm47drSjHaQKf9
	c0m6wk6OXt2xlX9nSiCdkcMsO6YU/yvylf6pFAwmMsBCAeVEiAglF6xKa+1QXvhjKK8Z3N/XvKS
	KzhF1AScFYNmbfU=
X-Received: by 2002:a17:903:1983:b0:2dd:a937:9bfb with SMTP id d9443c01a7336-2df597ad4d4mr12177235ad.10.1790047242649;
        Mon, 21 Sep 2026 20:20:42 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5cf83512sm1940355ad.5.2026.09.21.20.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:20:42 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Corentin Labbe <clabbe.montjoie@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	davem@davemloft.net,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/3] crypto: sun8i-ss - Use pm_runtime_resume_and_get()
Date: Tue, 22 Sep 2026 10:19:52 +0700
Message-ID: <20260922031954.320895-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922031954.320895-1-phucduc.bui@gmail.com>
References: <20260922031954.320895-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Replace the open-coded pm_runtime_get_sync() + pm_runtime_put_noidle()
error handling pattern with pm_runtime_resume_and_get(), which already
does this internally.

No functional change.

Found by manual code inspection.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
index 36a1ebca2e70..56ba4ff6d5ff 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
@@ -120,12 +120,11 @@ int sun8i_ss_hash_init_tfm(struct crypto_ahash *tfm)
 	memcpy(algt->fbname, crypto_ahash_driver_name(op->fallback_tfm),
 	       CRYPTO_MAX_ALG_NAME);
 
-	err = pm_runtime_get_sync(op->ss->dev);
+	err = pm_runtime_resume_and_get(op->ss->dev);
 	if (err < 0)
 		goto error_pm;
 	return 0;
 error_pm:
-	pm_runtime_put_noidle(op->ss->dev);
 	crypto_free_ahash(op->fallback_tfm);
 	return err;
 }
-- 
2.43.0

