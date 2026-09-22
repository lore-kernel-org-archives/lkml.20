Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA933B7B7A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790047276; cv=none; b=HEdxe1mRpJM0xIzd8V/9s7Fmu6vJMDejAIfp77YZv4ji4pwHHkGbosMxcQoOwTkR1TDygDlhMrJ1L7qmZytuKgzwM++BTIpyo4HXWG9Sl9zJG54Fxfq08fnoY57XnPVe3swVhVcwExP4DT8N/mriNqs4quZaUNYNTlRpLBHuQs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790047276; c=relaxed/simple;
	bh=t9aDlwefuZ2axwxKwmDy5Z1snX8zjB3z3fzSzyXpl74=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h4EObKyGrNFtFGdVk5lv2gEDv+0rTiPHNhLUkJV8RGw4JaDczd9frby1xzOuvU5YZFvbAa5WkO/VQghFObz4uHfmEHryjxMOIkF8tMgLxflj371UPo4ZSK41y7R7tm48y2m/mjcCFTjl/oi6bzuydm2Teln6Y8sHX7omz11cyF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bud63su1; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bud63su1"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-398cb5615deso4281860a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790047274; x=1790652074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AqBh/1GklFhxRrcNP7InBsf+Iuoq5ht51oOU88FidFg=;
        b=Bud63su1hd+cQ9CNjJ0O+9MW2g38mx+B42J/0zCzB67JXyyjtXa7vhoMRxRleQZSBW
         TBKMeTFm9d1IzmYxia8VOAe4ZPtU8nA8XIO3VjxwFUtKMJfRR3z3cntUssSIGvF0OEl7
         5hGifEdsSAplJd3dj64rX7/WZDmfZUAdd/kgiVbz/6Xz049Ws4SdNqsLwXZ/yDQ77GDO
         iT0aCWw8u+s0sbbRxYnyTwtNl4idti4YQ7JQqo7syJySvrQTmMG2hRkn6DgpTIxmu8je
         t+qCDRmmVUcVczL7KUlvY5CZb2T5QjxCody60lSHe4D6HvN77O35PPwteAAAGVdWTauU
         TURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790047274; x=1790652074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AqBh/1GklFhxRrcNP7InBsf+Iuoq5ht51oOU88FidFg=;
        b=D8BcUF98Nna0cxg4hFL14XW0qLiM/nFO2grOLpJgXKGEpxGNg1D5GwtXRDNJgJcrFC
         7GoS7jJupwXQDXH3FbSO8l9CZHGGDu8MdR8feDBSbKv47dUuN1y2XXc06lFQ3qwt8Oqq
         eZiyB8e83qBcRarQUwTZlkBDBR1I1STZ7GGS/ueYMmObC+DMslbE5o4sfONn95V/eZiT
         nfEKvWfDbzWrZ7Peb2gkvjGQ3lOXSAL8vCg0ApYdRWmW4Qtw5O8SMh6m/7Iyr9ED0Hl9
         QV6uSHev/GK4CjzMITWZ8PDvhgRFmDIJFcHMqpmzrkPbbj7ZXbs9Wfwv90TE2guQ3+OZ
         mq5g==
X-Forwarded-Encrypted: i=1; AKwUvByGsveYgmS5EB4WB5NoCtZviTuyX0dlfGvyDb2TO0NoelRi9VIRRwn1FvuMahA9PUN1Z55tjPZqbXsdLS0=@vger.kernel.org
X-Gm-Message-State: AFuF++kKvwx0jgGxhSPtnwtaHZzxFASrhKz/ab9Owmjv+aDdhGK9f2xO
	wCMed0jq4LYlxD+DGkUrCbnCu9o5PuKNupJqMfkqaa2WRvx/7neu3vfU
X-Gm-Gg: AYBFou2i/WvBzSvnczPiRoMhhVtULrx0+qWJwz6QTj4D1zl3RNsAs1aSY4qebYShKRr
	0HFjMyPXFofX4e7Ij8v4sRDRWBBMhvMwmnKq0+UNyhUuuCs/linRY7NCTYZLNXCB+DKMmpMUdRZ
	T+ioPpovL25wlaa09xnGlCVDXsXbcaiSaMExGX1mIGyJV6ksH8FLOhm1brTJW3BoZyk8s3aUTGS
	irp0h2cVci8Qjpn3ZuBEA2H9Q+Xp7Zmm2UH6rtnPihTo3wyDiJ9qzYbPwOEtVVG0Lve7/SKiC0R
	UQYBxq7QQh6DFULwo/iWMt7dW+pyxVaaA7Gd90U9KPEGDCdFjlxPZDpn6MzpRlpBDOP7xyruhGJ
	GlGuAJDeM1AtYHNMgLLE7K9dQSlggLEuNfMB39h9+bZwcmt2E0mgqfdIaROHBGRpBrBauWzKOp3
	8zCF21PkEt0WjGVuWXbpYHI1/8iRApSbcNqh7OivEwlPQ+g0mDiIHJ8MwCNjvO2pZisSH+sWzN7
	YWMA9gLRx/geBDWesE8HRN/CR9TnFa+TO2TqLDUWIq6gZgLHj0NKEiMk7rnXf+43CwxQR3hiFJu
	0wsSYf+ihZPF7Q==
X-Received: by 2002:a17:90b:2752:b0:39e:6a82:afd8 with SMTP id 98e67ed59e1d1-39e6a82bbd7mr13355745a91.42.1790047274271;
        Mon, 21 Sep 2026 20:21:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06dfd6705sm704365a91.0.2026.09.21.20.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:21:13 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] hwrng: omap3-rom: Use pm_runtime_resume_and_get()
Date: Tue, 22 Sep 2026 10:20:54 +0700
Message-ID: <20260922032054.320969-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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
 drivers/char/hw_random/omap3-rom-rng.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/char/hw_random/omap3-rom-rng.c b/drivers/char/hw_random/omap3-rom-rng.c
index aa71f61c3dc9..0797add0d782 100644
--- a/drivers/char/hw_random/omap3-rom-rng.c
+++ b/drivers/char/hw_random/omap3-rom-rng.c
@@ -42,12 +42,9 @@ static int omap3_rom_rng_read(struct hwrng *rng, void *data, size_t max, bool w)
 
 	ddata = (struct omap_rom_rng *)rng->priv;
 
-	r = pm_runtime_get_sync(ddata->dev);
-	if (r < 0) {
-		pm_runtime_put_noidle(ddata->dev);
-
+	r = pm_runtime_resume_and_get(ddata->dev);
+	if (r < 0)
 		return r;
-	}
 
 	ptr = virt_to_phys(data);
 	r = ddata->rom_rng_call(ptr, 4, RNG_GEN_HW);
-- 
2.43.0

