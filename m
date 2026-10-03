Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A37456E18
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 21:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791062644; cv=none; b=nWNzpEs9ZT6r0qIM9H6Rtewc/crPM3YV5ZyuvD3iCBzaubB34W6dRJ3gmyv+49WUAJLO9MlCg1SbuBeiZKLyzOL7aQgzgMuGq6vIhQXOQK9uIDgrWvEgP+54rQXJiAQCV73Tyh3CCL4TVlko+osOx+aeH7rUTThzD7lhsUm2Vvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791062644; c=relaxed/simple;
	bh=CrLJ9dfj2c/eke013I/eMWWMagmxB1FlL5oP0Ukye+E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D1rIkhZ6Kt37wrI7jglj931k3AnR2d2Gb8yAbksKh9QCkIsAJ49SddUSJnsFOa0LbxpfNIwlHAjxDBaedoR1vRwfPug3O6UwbfqPACnR1WSVdO/OAWTdcExV8+03EWQFuUfi5/8Zq9Jj9qwoPx1jJ5+Kg34y+gt4LHRXB4CjaoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BYJzxRCV; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BYJzxRCV"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e2e0f3dd40so3843985ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 14:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791062642; x=1791667442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZhsjuLXqM5FY33Q4lIM5AbhdLxpQjvL/gIK2fygQkak=;
        b=BYJzxRCVBYOaJFFmS2NGBWTA0X9Qqxz827ganjWr9dPNgtMc6IJRZERAENKsbc8opl
         ZHgc0QdPbCGrwEPY6YgvuKREnaFiliMVw0ya4daxBZdBfpXPeV8xNKYGGW4Y18udiqfJ
         XeWxbSxFgNl7k9HFnkp3k8LygMm9hVkuqsl5vZI+Q04uFwWJlEizmzKnCPM9nakxmN5v
         EEklcmSbjSg4sZrWCCEeTZntjTYNEx1LJ6itZnu1gUlj71rqAZ3ST3vIw22JkA1/cGQy
         jh4j7DhbZ6fHgIOhRcpEChDyMCr04eZaDNdpSl3N28EChvjnmOAUG/nZj2vZJl7rtEe8
         y+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791062642; x=1791667442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZhsjuLXqM5FY33Q4lIM5AbhdLxpQjvL/gIK2fygQkak=;
        b=qYwPgjKX/Ll56SGWyrteEtYFCVdZDYJlI4mhkwmc5jJBsfBdNznYGWFpvyih361ju5
         yDtGJp3EB2CFsIKU5dCzulg7qK4VtWVw8M77e57/XkqYOnN63DZlTH0rELv+N/Xdu/CU
         q1Oo2xT+Cp4a/x2+Eqo0ejXDU1Mkjuf4HYkcReMSntNw7n3arNhWJNs6Mpq+XeT/EEWF
         xLnxbwjzi3K7rwwlTtcJj8TpFIeoGuw0wZpIHGpNyTVraSJqghwj35juItG5oHfoqz/x
         x7i0LTV/3IO7umUfyzQqQXTah43P5DUl7tuO/r4kOYXW+SRxEyAWZvZF+fsL4+N1CUVJ
         oSxg==
X-Forwarded-Encrypted: i=1; AKwUvByyJ7rG7vfS8Wvon5hS8/GMNlcHTVftraNzHcNh6KGsobCifwMeNpYzCk99vRTQy0Przy8FElY8F4R1+GU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLNSriVVmrs+gINht4Sp9xAIElSco/Va0LySkpRU7brtyGq/AC
	jaaxi76KX6H/7+x8RTwOqEvhgXaGq7XwPjOw36qKg3faPfFZPlmixHn3
X-Gm-Gg: AYBFou1hq0D0iYZ+c4UcqMSYCTk77lFsQqVQO/yyJzQMmF77mEcltU6u2jRC30sSLz8
	POjBYG2zMQp6TjvXBsMf4twTbtuGy2glYum/ZXaWqhfJ/C/izCyWByGPSESCJH4hAA11xDVtoW7
	yDh07/e0ZqmP8rb5RFlQXusJLH35rOyK8gu3Wuw1UQ+0ma7ywPdYioH6tZkzq/ch3KRz8Q59ydT
	Jwg/lkED5xtYa1kBlRpa/c3VrnPMgG9hExcoE2VPUYSEZcIL+kKjz0HXPNcjiPVb2wwbXMqgoKi
	ItizpN5VtiUTzbu031rrZ+KyY/40M2R9S+Deh8MSQYYtF3t9EfbHjY63IOElHCM7+GgWKPqjIqT
	7TIFmuCYqeJZzvpnFawQZ3Iwgx/DQ01Gbu+Qf1QKlsFhzCSJ0bhj9lGqroTlTkEfuYCv8VPWppv
	A44X6G6o8GfZpIbeNHgWoyvcVfrRfXz8flU5/PPQnNsKySSfrKpDYNfYrAVdQOxhVZbBeI5kAmH
	Vj3wjcGpHFSu/wymWCt0WuczbLVf/vq/i9NvMiOzUh+6WVPVCV6ckAt92E9WOgMeEM1Tsz9RGng
	sPFR+d3R82WTi4O03jMuFA7Bgr9qg3FgJqjXqoJYugOPlV1G
X-Received: by 2002:a17:903:384c:b0:2dd:ad74:ac2a with SMTP id d9443c01a7336-2e5105a57c4mr30118925ad.28.1791062642500;
        Sat, 03 Oct 2026 14:24:02 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6d9a88sm18913265ad.53.2026.10.03.14.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 14:24:00 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-crypto@vger.kernel.org
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3] crypto: talitos: fix probe IRQ ordering
Date: Sat,  3 Oct 2026 14:23:59 -0700
Message-ID: <20261003212359.126745-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The talitos interrupt handlers schedule priv->done_task[] via
tasklet_schedule().  In probe(), talitos_probe_irq() ran before
tasklet_init(), so an interrupt arriving during that window (a shared
IRQ, or a completion pending from an earlier transmission) would
schedule an uninitialized tasklet.

Resolve the IRQ numbers before the tasklet_init() calls so the
done_task[] selection can see the secondary IRQ, and only request the
IRQs after the channel fifos are allocated and the device is
initialized.  Every structure the handlers touch is then fully set up
before interrupts are enabled.  This matches remove(), which frees the
IRQs before killing the tasklets.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: reshuffle again to fix IRQs.
 v2: reshuffle code to avoid NULL derefs
 drivers/crypto/talitos.c | 48 ++++++++++++++++++++++------------------
 1 file changed, 26 insertions(+), 22 deletions(-)

diff --git a/drivers/crypto/talitos.c b/drivers/crypto/talitos.c
index 41a87d7c30a0..70f7ad9e09f9 100644
--- a/drivers/crypto/talitos.c
+++ b/drivers/crypto/talitos.c
@@ -3353,21 +3353,13 @@ static int talitos_probe_irq(struct platform_device *ofdev)
 	int err;
 	bool is_sec1 = has_ftr_sec1(priv);
 
-	priv->irq[0] = platform_get_irq(ofdev, 0);
-	if (priv->irq[0] < 0)
-		return priv->irq[0];
-
 	if (is_sec1) {
 		err = request_irq(priv->irq[0], talitos1_interrupt_4ch, 0,
 				  dev_driver_string(dev), priv);
 		goto primary_out;
 	}
 
-	priv->irq[1] = platform_get_irq_optional(ofdev, 1);
-	if (priv->irq[1] == -EPROBE_DEFER)
-		return priv->irq[1];
-
-	/* get the primary irq line */
+	/* single (or primary) irq line */
 	if (priv->irq[1] < 0) {
 		err = request_irq(priv->irq[0], talitos2_interrupt_4ch, 0,
 				  dev_driver_string(dev), priv);
@@ -3379,13 +3371,11 @@ static int talitos_probe_irq(struct platform_device *ofdev)
 	if (err)
 		goto primary_out;
 
-	/* get the secondary irq line */
+	/* secondary irq line */
 	err = request_irq(priv->irq[1], talitos2_interrupt_ch1_3, 0,
 			  dev_driver_string(dev), priv);
-	if (err) {
+	if (err)
 		dev_err(dev, "failed to request secondary irq\n");
-		priv->irq[1] = 0;
-	}
 
 	return err;
 
@@ -3404,12 +3394,27 @@ static int talitos_probe(struct platform_device *ofdev)
 	struct device_node *np = ofdev->dev.of_node;
 	struct talitos_private *priv;
 	unsigned int num_channels;
+	void __iomem *reg;
 	int i, err;
 	int stride;
+	int irq0;
+	int irq1;
 
 	if (of_property_read_u32(np, "fsl,num-channels", &num_channels))
 		return -EINVAL;
 
+	irq0 = platform_get_irq(ofdev, 0);
+	if (irq0 < 0)
+		return irq0;
+
+	irq1 = platform_get_irq_optional(ofdev, 1);
+	if (irq1 == -EPROBE_DEFER)
+		return irq1;
+
+	reg = devm_platform_ioremap_resource(ofdev, 0);
+	if (IS_ERR(reg))
+		return PTR_ERR(reg);
+
 	priv = devm_kzalloc(dev, struct_size(priv, chan, num_channels), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
@@ -3425,12 +3430,7 @@ static int talitos_probe(struct platform_device *ofdev)
 
 	spin_lock_init(&priv->reg_lock);
 
-	priv->reg = devm_platform_ioremap_resource(ofdev, 0);
-	if (IS_ERR(priv->reg)) {
-		dev_err(dev, "failed to of_iomap\n");
-		err = PTR_ERR(priv->reg);
-		goto err_out;
-	}
+	priv->reg = reg;
 
 	/* get SEC version capabilities from device tree */
 	of_property_read_u32(np, "fsl,channel-fifo-len", &priv->chfifo_len);
@@ -3481,9 +3481,8 @@ static int talitos_probe(struct platform_device *ofdev)
 		stride = TALITOS2_CH_STRIDE;
 	}
 
-	err = talitos_probe_irq(ofdev);
-	if (err)
-		goto err_out;
+	priv->irq[0] = irq0;
+	priv->irq[1] = irq1;
 
 	if (has_ftr_sec1(priv)) {
 		if (priv->num_channels == 1)
@@ -3540,6 +3539,11 @@ static int talitos_probe(struct platform_device *ofdev)
 		goto err_out;
 	}
 
+	/* enable interrupts once the channel fifos and tasklets are set up */
+	err = talitos_probe_irq(ofdev);
+	if (err)
+		goto err_out;
+
 	/* register the RNG, if available */
 	if (hw_supports(dev, DESC_HDR_SEL0_RNG)) {
 		err = talitos_register_rng(dev);
-- 
2.56.0

