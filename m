Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A384318EC7
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789729523; cv=none; b=isQONC5z/T/vXp1KOJnvxtl7twhGKTihMZAjhstKmGaNJJjGihfkrScUDbL1Ew99wWg/QoRSfKTe3R7u8sjBCTAZTo8taj1EK9jMkodIDjmY/gggDZiLlyi9chFlieYP5JIJSwBDod+/yOdNicX6hb6GbgjeNBcDJiDYA1u1vk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789729523; c=relaxed/simple;
	bh=hUcoqwH/HxxZ783HKyQpgJVCFgXZ5I76kDE2zpLnBQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DqcgzVluYR0a6+Z/KXdMdaXOR5KpbOZbGP6EZYtpAXix+gxpavlzh1k+b6qOVtnDU2aZ6q81fQ7JwmBgt47SpjH/jSKSWwdgoG+0jCrU9esSgjD72zxfXkGODXCB6yZUwhYB4A1oxF4/QTWBSglizhkf3AfSWHraPAq51CW9280=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QLi67qLz; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QLi67qLz"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2ddaa08c890so5162775ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789729517; x=1790334317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Df5rt+V5n08gio2qwrmwg+kssDbj2qjq7f0a+gBkW+g=;
        b=QLi67qLzXQ85mrbI2AI/wwldKikbDnMDDPtKdofJ77bEJvOxOyQPrdy7YfXX6+RQfl
         nIPEHws/7O9CHcvAeEgTHyA0OFeZHLKtITCQfdWxc5oQwRggl/sK5sNjv5d18pc3+CzA
         V9PMqlqvPmbCGzn9VySQJRjD3tK3d4qs40tBkbNWePhML8IQsOyOJf/ijHwT+/n0ESkM
         AxBE9uw3EBGiOVkPgbLwP41PqHNhz8KbJ0iMhMPu1HnNk5DxlHNKlQNJte8BFPoOmoCM
         IK2eYCRoqDUCBI4C5g0MF1v7fDWNZGLiy+OwJZU2/SO54VRPi8AmsdOAQhHK4YwuMM3i
         LkxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789729517; x=1790334317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Df5rt+V5n08gio2qwrmwg+kssDbj2qjq7f0a+gBkW+g=;
        b=vAzj2P6qqOZVHwWQpS2YKsDyGrOfu4ZZRupViS0Gg2OAgJPu8h8geqUSQaTrgwOs0u
         QrfQTASSOSBOa+NI9tCxh/KQn8xAHNKROw2E6hbe0i3q8B1fJvtw/9rXxD9tgub8Eji+
         amJ2LEyvn+S/sfFxc/EM31Jt4COtd1Uym/pbJ75f4wnak9lPrXTU4dhlFwVwLvq36dhg
         5CsHUiG/xRCa68gNjs96JGfwWBpFFt0dI4KRKWLaIRis5phBGpqg/0uHyXTWL78Pk3vq
         H7x4jtsTNj6HsZ2HjxgmqXPMoehzKQ+1pZUYZOyVelpeg5tqPEHWRZwnBwcGsLnEw1l7
         Tc5g==
X-Forwarded-Encrypted: i=1; AKwUvBx/Zhn4/qVQW9uLBuysKs3ijwj7Cg13KxUBA5mjmP1qAOZAlKWZ3i1Y/YFPKmbQkIWkwWcswH6t5enRDdI=@vger.kernel.org
X-Gm-Message-State: AFuF++njMu26UgzU/25vT1W18shKpug33QfSsSqw3V4zLxkRHiMqhTta
	Mxl5tiVmTHwi8vU7hTGq1MkP5GQh2MROTHw/hnUZ0ryliERxfTDgd+40
X-Gm-Gg: AYBFou2lTHM32rTSlvT1Z01hKgCoq0W031FHgjR5BmKhEs1YNjKFDk6emdrar33iEZ4
	jVA+MJo8cOEcnYAFL1ONTFGwRfZ/lnGTZXwkWDbg7Oc9uc+luXPJjxbp6if7T/PwFJ6cIwp8QTc
	De7QewlrGj2ZIJ4R8zLYC1XIhO1FtFD7UzYO5jLlke/k93BWKmmGCHJpZU3f2UUmkO+NbMrJygy
	xV3osK0jDoNOCdWwhVRHnhi7IJk30Jtl4WdZ7K70EPAUTa659zk95bP/LtX6CAQkoQOhOgi+ziT
	z6mC/kwte6j7hvt8qkYX5U8lDJvBXJK2nc+wphHEG39D1PQX2zVUZnKaDGWFxZ7kWxd0sNiLpdd
	32LE/FOXepg+uI8/X458sFdAVFB6sUUUjceAS8L4GSvUXSqZdJsbazil8Vmlzn81WWHOT0MJfa8
	NI+kYBEMZdEvaUqxTphZWkddMU6nudSFNsmMmAMXboMI3PZRVRNKqmkhA5tgQC6CTl0IPAyvTJA
	EXhY2ed6za/lu4r68M=
X-Received: by 2002:a17:903:3d06:b0:2dd:ad73:5b73 with SMTP id d9443c01a7336-2ddb1d5bd18mr43767255ad.35.1789729516398;
        Fri, 18 Sep 2026 04:05:16 -0700 (PDT)
Received: from kernel ([103.219.206.97])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c28180a4dsm4721501eec.0.2026.09.18.04.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 04:05:15 -0700 (PDT)
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: herbert@gondor.apana.org.au,
	davem@davemloft.net
Cc: clabbe@baylibre.com,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] crypto: amlogic: Fix IRQ handler return value and fallthrough logic
Date: Fri, 18 Sep 2026 16:35:04 +0530
Message-ID: <20260918110504.7207-1-raizudeen.kerneldev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In meson_irq_handler(), when an interrupt matches a flow but the status
register is empty, the driver prints an error but doesn't return. It
falls through the loop and incorrectly prints an `unknown irq` message.

Fix this by returning immediately. For empty status registers, return
IRQ_NONE instead of IRQ_HANDLED to avoid masking spurious interrupts and
allow the kernel to detect interrupt storms. Also use
dev_err_ratelimited() to prevent console lockups during an interrupt
storm.

Additionally, the handler return IRQ_HANDLED for genuinely unknown
interrupts. Return IRQ_NONE instead for unhandled interrupts.

Cc: stable@vger.kernel.org
Fixes: 48fe583fe5417 ("crypto: amlogic - Add crypto accelerator for amlogic GXL")
Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
---
I have addressed the IRQ specific issues in this v2. The other
pre-existing issues mentioned by Sashiko are already addressed in my
separate patch.

Changes in v2:
- Return IRQ_NONE instead of IRQ_HANDLED when status register is empty
  to avoid masking spurious interrupts.
- Use dev_err_ratelimited() to prevent console lockups.

 drivers/crypto/amlogic/amlogic-gxl-core.c | 38 ++++++++++-------------
 1 file changed, 16 insertions(+), 22 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 169c6eeb51e5..d5d84524c110 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -37,12 +37,13 @@ static irqreturn_t meson_irq_handler(int irq, void *data)
 				complete(&mc->chanlist[flow].complete);
 				return IRQ_HANDLED;
 			}
-			dev_err(mc->dev, "%s %d Got irq for flow %d but ctrl is empty\n", __func__, irq, flow);
+			dev_err_ratelimited(mc->dev, "%s %d Got irq for flow %d but ctrl is empty\n", __func__, irq, flow);
+			return IRQ_NONE;
 		}
 	}
 
-	dev_err(mc->dev, "%s %d from unknown irq\n", __func__, irq);
-	return IRQ_HANDLED;
+	dev_err_ratelimited(mc->dev, "%s %d from unknown irq\n", __func__, irq);
+	return IRQ_NONE;
 }
 
 static struct meson_alg_template mc_algs[] = {
@@ -243,34 +244,30 @@ static int meson_crypto_probe(struct platform_device *pdev)
 	if (IS_ERR(mc->base))
 		return PTR_ERR(mc->base);
 
-	mc->busclk = devm_clk_get(&pdev->dev, "blkmv");
+	mc->busclk = devm_clk_get_enabled(&pdev->dev, "blkmv");
 	if (IS_ERR(mc->busclk)) {
 		err = PTR_ERR(mc->busclk);
-		dev_err(&pdev->dev, "Cannot get core clock err=%d\n", err);
+		dev_err(&pdev->dev, "Cannot get/enable core clock err=%d\n", err);
 		return err;
 	}
 
+	err = meson_allocate_chanlist(mc);
+	if (err)
+		return err;
+
 	for (i = 0; i < MAXFLOW; i++) {
 		mc->irqs[i] = platform_get_irq(pdev, i);
-		if (mc->irqs[i] < 0)
-			return mc->irqs[i];
+		if (mc->irqs[i] < 0) {
+			err = mc->irqs[i];
+			goto error_chanlist;
+		}
 
 		err = devm_request_irq(&pdev->dev, mc->irqs[i], meson_irq_handler, 0,
 				       "gxl-crypto", mc);
 		if (err < 0)
-			return err;
-	}
-
-	err = clk_prepare_enable(mc->busclk);
-	if (err != 0) {
-		dev_err(&pdev->dev, "Cannot prepare_enable busclk\n");
-		return err;
+			goto error_chanlist;
 	}
 
-	err = meson_allocate_chanlist(mc);
-	if (err)
-		goto error_flow;
-
 	err = meson_register_algs(mc);
 	if (err)
 		goto error_alg;
@@ -289,9 +286,8 @@ static int meson_crypto_probe(struct platform_device *pdev)
 	return 0;
 error_alg:
 	meson_unregister_algs(mc);
+error_chanlist:
 	meson_free_chanlist(mc, MAXFLOW - 1);
-error_flow:
-	clk_disable_unprepare(mc->busclk);
 	return err;
 }
 
@@ -306,8 +302,6 @@ static void meson_crypto_remove(struct platform_device *pdev)
 	meson_unregister_algs(mc);
 
 	meson_free_chanlist(mc, MAXFLOW - 1);
-
-	clk_disable_unprepare(mc->busclk);
 }
 
 static const struct of_device_id meson_crypto_of_match_table[] = {
-- 
2.53.0

