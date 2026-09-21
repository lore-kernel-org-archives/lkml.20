Received: from mail-pz2-f36.google.com (mail-pz2-f36.google.com [74.125.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E643769E9
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790032285; cv=none; b=coyyf0gzB49PXV36ZmoWEBwRuYWB2NrlI71yHGbbnnOW0PcgwI8msiaSK+LreKF/3TuT9MmKzjYG+dctp7yZybN0atSZ3ZAM1X4EEQ5GALcD+N1BRLNyYjzx98xuvo8RzAfWHSc5veeA6t/aEYXD7f4MDcqBCS5kHmgSu5e/3Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790032285; c=relaxed/simple;
	bh=6NP/wTedvUKno+6UvFa0hyzd8LxjMbCVzqb8GNwpXiI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mDSSyYSI7kOhWX62AYXZU8ikbhUwHXIZYty6FY25LSSWSXt4d1t20YysyWb08o6mcvkqLgwgtTIaQcYNF/k76KwhV0tBhBCdj0mf0/aEjV5tM8WI7zQuaryMLAv4dRmqk4w797qpaJLUazuk8ERWUyFWXuG9RNhyGbZmoNLfQhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h9EOFdXN; arc=none smtp.client-ip=74.125.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h9EOFdXN"
Received: by mail-pz2-f36.google.com with SMTP id 41be03b00d2f7-cc1cea34f01so3088271a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790032283; x=1790637083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TV5O2OyI6mATpQhVZegfkIlJOsJB/H0eSLCm/N9OKew=;
        b=h9EOFdXNBMSXgJlhEA1LGzKuGvw4MBcD7yzb6z/m459DbIn/RpX6kSTsmwCxBrKYiJ
         IigMFZKqsAgmj4obwZRulWtoNCOSsOVKvojRLQ7duHNGHXw+IJU/clPRFMqzG40BUdwU
         nsjB0QRVUfDLhKyaZCE8FptCxzLayILmoZEUhKBnB+tKCrF1V0k/L9FDkaFZ9xidTnCW
         GNeic50+TwazGsmZNT34JcR5G4C06uXchoNjnLmnfWwZ7i92UIQyD3vMSx2z0sHo+Wv7
         JPO90xfYI1ou79cnoZ+2QLNMgxG5my7uUTMaeMyGKoE2Dcy/+dRh3f4kfVY3+jDTjVYP
         ZEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790032283; x=1790637083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TV5O2OyI6mATpQhVZegfkIlJOsJB/H0eSLCm/N9OKew=;
        b=fYmvc7yV/pw4CVNwMYdFcCJ1e0U7wWY/cP01K+6xATk8nfSOhBKcT2b6Spr5CNfxHC
         UAwSFAV5syZRBW11F09KnNvjWcLc33nwq8p3g3StvVih8pUXIjrM7GBFSz1Ok6+WBEiA
         MEYfLj+a0o1qHX/rUD0XZWSTLJ5ic4fVKCzrhzzlD1adb2HctUfcwjLSWp3l08kG0gsa
         w0ULI8v8DZUfQZoEmNj0vkgnzEjlf9fQOg9LYIxCcCMmN5WBBXFRe9+6LtR1JIX0iIqZ
         liQOuXgz6vpyvLpPDE09G5y43tepqVs64VDx3rUJD2DmfFhPDJrt/gMEc/SUQoZ8JeOa
         /EUg==
X-Forwarded-Encrypted: i=1; AKwUvBzwztRokc9tKrmdUR9/LIrucvAPHn/t8xBaMIrBk4idy65wjKTngmbSyw/iide3sheDw4+FY31jvemlAtU=@vger.kernel.org
X-Gm-Message-State: AFuF++mgKpWD5YfsUqDvtXvzudrWtSCrv0UHdJj1UjCldOQQe4/6+w9f
	PEKpvkZ/85AB2K3dDTjWSOL+4L7CJbhNLtV1SLw+m9b/5nGvCNK9Q0S8
X-Gm-Gg: AYBFou0m8WV9NnWOZQFhfm7DxFzyXJy8zcILQIyqajEmCPAy71r0bWOq3kQLjiSg4/m
	oq82OKYW5hoMNzHBjnTo4/Z3o1KBl1xBgjBvr7D7ALh1XbC4wV+C+Puxy57qOK3OOaChfgXHFJx
	E4EOXhysVl/zbXbB5D6uTeS0wpbVul/NKO1P/Qg4gASPppOcrbWtb2HyHCm4IKZr05nUxErVcpU
	GlzBH5D7pZYYqxOmKC74Y+KQ+TVm7gJVCPdKPn69sYrY5YoWJYDTil+Zbx5DIBP+WzmXmvLNxYL
	8jK8b9iwPpDqaKtFoWV3MZAicC5d+tHMrGELXU/aM7px7gou4QgjcbZRnXoA+3hTpkfA25hh3bT
	jSaT/AvzSEQp6Tk/WZH00ZuCcXrzhdyDCPQvCWZ6GRycrLTUu97bO6H1evDgvQdLwcYUMaYVxhv
	RjQ+V1SBLnPDtIJcbin+VGNbP4keDRoBuURbkSptQ5SyEINiO5nYUfu88Zi5i9Q6m0KnW57w5dl
	Sw/TQIeZ6BseyvTSpG8mZ1H+EmFiT4LmsbqooX/hFQhpAB82ZLAWbBBeXQUgpf/JUilqaB5XVYE
	4erKpvfNfCZ6dN7i/q2HD9znhy664u+VxGbajqV1HZZpILQd
X-Received: by 2002:a17:90b:2d10:b0:39e:24ab:9fb0 with SMTP id 98e67ed59e1d1-39e54cc6fe0mr18328991a91.6.1790032283084;
        Mon, 21 Sep 2026 16:11:23 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a069a0de1asm832670a91.17.2026.09.21.16.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 16:11:22 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-crypto@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Antoine Tenart <atenart@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Richard van Schagen <vschagen@icloud.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] crypto: eip93 - fix IRQ teardown ordering in remove path
Date: Mon, 21 Sep 2026 16:11:21 -0700
Message-ID: <20260921231121.63342-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the devm-managed threaded IRQ with request_irq() so free_irq()
can run in eip93_cleanup() instead of after the remove callback has
returned. Register the IRQ only after tasklet_init() and the ring
locks are set up, so the handler can never schedule an uninitialized
tasklet.

The original probe requested the IRQ before eip93_desc_init() and
tasklet_init(), and eip93_cleanup() killed the tasklet before masking
the device interrupts. An IRQ arriving in either window could schedule
a tasklet that was not yet initialized or had already been killed.

Reorder eip93_cleanup() to:
  1. mask and clear the device interrupts
  2. free_irq(), which synchronizes and removes the handler
  3. tasklet_kill(), which drains anything scheduled before the mask

The tasklet re-enables the EIP93_INT_RDR_THRESH interrupt as its last
action once the result ring is drained, so mask the device interrupts a
second time after tasklet_kill() to keep the hardware quiet while it is
powered off.

The driver implements ONESHOT semantics itself: the hardirq handler
masks the interrupt source before scheduling the tasklet. Use
request_irq() so the line is unmasked for the tasklet and the
IRQF_ONESHOT WARN_ON_ONCE is avoided.

Add an err_free_tasklet path in probe so a request_irq() failure
releases the tasklet and descriptor resources instead of leaking them.

Fixes: 9739f5f93b78 ("crypto: eip93 - Add Inside Secure SafeXcel EIP-93 crypto engine support")
Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: extra clear/disable in _remove.
 .../crypto/inside-secure/eip93/eip93-main.c   | 31 ++++++++++++++-----
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/crypto/inside-secure/eip93/eip93-main.c b/drivers/crypto/inside-secure/eip93/eip93-main.c
index e62785952b0d..cc504590fd0f 100644
--- a/drivers/crypto/inside-secure/eip93/eip93-main.c
+++ b/drivers/crypto/inside-secure/eip93/eip93-main.c
@@ -395,9 +395,21 @@ static int eip93_desc_init(struct eip93_device *eip93)
 
 static void eip93_cleanup(struct eip93_device *eip93)
 {
+	/* Stop HW from asserting IRQ first */
+	eip93_irq_clear(eip93, EIP93_INT_ALL);
+	eip93_irq_disable(eip93, EIP93_INT_ALL);
+
+	/* Synchronize and unregister the IRQ handler */
+	free_irq(eip93->irq, eip93);
+
+	/* Drain any tasklet scheduled before the IRQ was disabled */
 	tasklet_kill(&eip93->ring->done_task);
 
-	/* Clear/ack all interrupts before disable all */
+	/*
+	 * The tasklet re-enables the RDR interrupt when it drains the
+	 * result ring, so mask the device interrupts again before the
+	 * hardware is switched off.
+	 */
 	eip93_irq_clear(eip93, EIP93_INT_ALL);
 	eip93_irq_disable(eip93, EIP93_INT_ALL);
 
@@ -430,12 +442,6 @@ static int eip93_crypto_probe(struct platform_device *pdev)
 	if (eip93->irq < 0)
 		return eip93->irq;
 
-	ret = devm_request_threaded_irq(eip93->dev, eip93->irq, eip93_irq_handler,
-					NULL, IRQF_ONESHOT,
-					dev_name(eip93->dev), eip93);
-	if (ret)
-		return ret;
-
 	ret = eip93_desc_init(eip93);
 	if (ret)
 		return ret;
@@ -448,6 +454,11 @@ static int eip93_crypto_probe(struct platform_device *pdev)
 	spin_lock_init(&eip93->ring->idr_lock);
 	idr_init(&eip93->ring->crypto_async_idr);
 
+	ret = request_irq(eip93->irq, eip93_irq_handler, 0,
+			  dev_name(eip93->dev), eip93);
+	if (ret)
+		goto err_free_tasklet;
+
 	algo_flags = readl(eip93->base + EIP93_REG_PE_OPTION_1);
 
 	eip93_initialize(eip93, algo_flags);
@@ -472,6 +483,12 @@ static int eip93_crypto_probe(struct platform_device *pdev)
 		 readl(eip93->base + EIP93_REG_PE_OPTION_0));
 
 	return 0;
+
+err_free_tasklet:
+	idr_destroy(&eip93->ring->crypto_async_idr);
+	tasklet_kill(&eip93->ring->done_task);
+	eip93_desc_free(eip93);
+	return ret;
 }
 
 static void eip93_crypto_remove(struct platform_device *pdev)
-- 
2.55.0

