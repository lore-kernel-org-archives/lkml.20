Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEB95908C9
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788988343; cv=none; b=WAPQrJVOGdb6yEdFVTgSfOlEwzPLmyj+Jv5yGkWoPZvTULamW9/rHWaOsVGW//BSEJrxtgZeW/CC2yzVdBM5CxsTWIAoPMnYTPXdTqmCRcRpv6KiIchpLQXvlGLRGKh/l8j5SPN8PpBGIgPvRbkfXsKrNqQDlmisrc14O0AGni4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788988343; c=relaxed/simple;
	bh=lsJH/m1wwMGY3Tdn1zmWxqy3WlMlbk6ChjZYpxUGVoY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XjcY988UksNjvhcwJvzNraGYRRlbYdUJDe1HV8ufZ6mYKLl3w4H0n6QEDYEQmednVhpNE4fTmGw4g6Ba/Jr+wZHrAVUE3xPPkGmY+RXZGG+2CXqxScKilRV4bxGYoMgrrEIDw/noXdKc4DKIiEuz5uD/BqyjcEF4MbU0ve5CV6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s5Trg4VS; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s5Trg4VS"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc4902427c1so253149a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788988341; x=1789593141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u495ibL0ejeSjktkIJ/W4ElwT//FuX3YHoHh4p8PAXg=;
        b=s5Trg4VSzO5/hVmDqRO/N5qJpuYhhB7yql21kib/w71oEqY8cHVZ0s3rqgW1MmoSoI
         q5OqM9mc8vS9xA2r26zrp0+l/FBTvi86xw7L0OFV1JFR2dn71vXVmSUXJedyvOI3pGXk
         CX/PgLPu+/J+CAjqhc9DCzPiVoB6oD4QRrg9zKIAScgfwHsznUxxhmLG4PFkELkYm5Az
         xQcEQJ/qb/oQK5u4AcmWTjoZzRl5Z3oNCewBz0cMFRE/gDgVxzvO/ETq8tyNGhMp/7R+
         bsKoL/ALutNci89O5QzyoTKOavAuzYvehlps0metk8CqVfKoGS/f2WYrlRovt58AP0J8
         fxkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788988341; x=1789593141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u495ibL0ejeSjktkIJ/W4ElwT//FuX3YHoHh4p8PAXg=;
        b=aw8DKaAsGI/0zlYHbXfXh8TeNhNjYdV/cbHMYTS31Ij4JYlE9+UDMbB86kvTwOZNZY
         zBfX8eKjijoL/FK+nSfSOIcmTt9nmXe39W41LqRw958J5RGVuxqJPkR5WOKNkRw/RFOj
         ytnErBLzdfWEtp15vhQKMDnkr4ax6ni3rCxyi0p2SEPBDcZ4qL0WGe+TBuJUaWeH2aLo
         CX8pWaGX4rl/3cvsKeyz5/jfptUmZmqCkHvafp8hR5SvtmBp/stTAhzesSMycz2T44OK
         oqu+aGcUVnKeuwXCD7Br5WkiyNJXQQwezEPRFQEodRSVfweqPLzWqt+A6ViN/K23wpG1
         D6WQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAwT9nkT90lBgAxPk4dZgHE4L+jtsoMqnYvpIuvCS2AKW/ziaUu36EYYblJxuC4fpFDpu7LkcB5QMmU08=@vger.kernel.org
X-Gm-Message-State: AFuF++kaJIpqJou1vY43fdAeMXbDqR/efDVpnFW2XVU/ZDmK5p61Ep7s
	43/cEku6r0xgNLLjdocxUl0gPAoKXdej+5aqEhIcYsH0vzSj9thsFSJLnoBU9w==
X-Gm-Gg: AYBFou3hgKwUeZ/spNrcelWfK6apV4xLtL8vmD89kADfsgmfhEnCpbKnv0SkXop1a2T
	KEbOut6s+ONkkHR1Y6zNUkVfgK7jukkEi/Xu1r5uZxgM6SXNCKPnNSvEYgiVCpJ9+VbN0LsXq4I
	2Q6ZsoQcC12XPuPnG23yAqIvgnqzTBs4Jnp9Ruv6mbMf0IveIhoRw2Bh+NjqbovZ3vv97yqT25C
	jmGdxGvplxv+T4cEKW/S1Z0/GT8fCwkP+TvoYa1bAZgLAwFTlO0a5TLwD5w3ShQrBjBdv4bSRRT
	EBZ8P4NebqEZc1scwZIePcDTuEMhlWBvu9Ap4MN9jQFR62zw6eStJOD0HOs/IQLXho6t9dSw9jQ
	fVBBm+iz7V3m6GBEJ2XeIK0Yz87eC+CtPiOk/Cme0AjezuqINCvpVPd8XTE/uRZ1TRE2pmDzQIo
	JfncK8xoz1yxFxuJZxxwwv1or5S1Sb9M/1pkKEOAiaWKODy6mCflHyeWgBUpchMT2cwDzSEefFZ
	Kq4Jdh6MnNS4K6prVHqCOOIC7X2DtbRa2WgeZLC3aq65PxDiqTW7jcosyum2Baut3xYm6nfhqGg
	7a1CotpxhDS/p5hg7IDaxVHkpfKdzDAXjZTLEf/UYxwiYltX
X-Received: by 2002:a05:6a20:258b:b0:3bf:b7e8:68ab with SMTP id adf61e73a8af0-3dad26bda32mr1323463637.2.1788988341177;
        Wed, 09 Sep 2026 14:12:21 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc46b4cd51esm6000615a12.2.2026.09.09.14.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 14:12:20 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-crypto@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Antoine Tenart <atenart@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] crypto: eip93: fix IRQ teardown ordering in remove path
Date: Wed,  9 Sep 2026 14:12:18 -0700
Message-ID: <20260909211218.15388-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch from devm_request_threaded_irq() to request_threaded_irq() so
that free_irq() can be called at the correct position in the remove
path.  Move the IRQ registration after tasklet_init() in probe to
ensure the tasklet is ready before the handler can fire.

Reorder eip93_cleanup() to:
  1. disable device interrupts (HW)
  2. free_irq() - synchronizes and removes the handler
  3. tasklet_kill() - safe, no new IRQs can arrive

The previous order (tasklet_kill before interrupt disable) could race:
an IRQ arriving after tasklet_kill() would schedule the already-killed
tasklet.  With devm_request_threaded_irq(), free_irq() ran after the
remove callback returned, leaving the handler registered while device
state was being torn down.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../crypto/inside-secure/eip93/eip93-main.c   | 27 ++++++++++++-------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/crypto/inside-secure/eip93/eip93-main.c b/drivers/crypto/inside-secure/eip93/eip93-main.c
index e62785952b0d..4cfddfd1935b 100644
--- a/drivers/crypto/inside-secure/eip93/eip93-main.c
+++ b/drivers/crypto/inside-secure/eip93/eip93-main.c
@@ -395,12 +395,16 @@ static int eip93_desc_init(struct eip93_device *eip93)
 
 static void eip93_cleanup(struct eip93_device *eip93)
 {
-	tasklet_kill(&eip93->ring->done_task);
-
-	/* Clear/ack all interrupts before disable all */
+	/* Stop HW from asserting IRQ first */
 	eip93_irq_clear(eip93, EIP93_INT_ALL);
 	eip93_irq_disable(eip93, EIP93_INT_ALL);
 
+	/* Synchronize and unregister the IRQ handler */
+	free_irq(eip93->irq, eip93);
+
+	/* No new IRQs can arrive - safe to kill the tasklet */
+	tasklet_kill(&eip93->ring->done_task);
+
 	writel(0, eip93->base + EIP93_REG_PE_CLOCK_CTRL);
 
 	eip93_desc_free(eip93);
@@ -430,12 +434,6 @@ static int eip93_crypto_probe(struct platform_device *pdev)
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
@@ -448,6 +446,11 @@ static int eip93_crypto_probe(struct platform_device *pdev)
 	spin_lock_init(&eip93->ring->idr_lock);
 	idr_init(&eip93->ring->crypto_async_idr);
 
+	ret = request_threaded_irq(eip93->irq, eip93_irq_handler, NULL,
+				   IRQF_ONESHOT, dev_name(eip93->dev), eip93);
+	if (ret)
+		goto err_free_tasklet;
+
 	algo_flags = readl(eip93->base + EIP93_REG_PE_OPTION_1);
 
 	eip93_initialize(eip93, algo_flags);
@@ -472,6 +475,12 @@ static int eip93_crypto_probe(struct platform_device *pdev)
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

