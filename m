Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5C54AE8A3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788384312; cv=none; b=f0yu9nkE8nGjgef48q73Nmo1qju2MIxYsc17Khd7TqQ4q4Xvx59+7W9fdfD733D4OXEQ5qdyJkIehvHF24xSnGTdrLQhGxksOxFMr4LUj+zdOfCT1PSdjPGl0iLsroim5PaKnxcIFOblSaaXg3rOryJ5PzjGu4TDb+JLImpNvVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788384312; c=relaxed/simple;
	bh=LHhpRWV64svn2PO2cWWQEY87EXmjPNDpiKNVs+iud0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bIL5IFoefAtmScfHuUzfhnyE5j64V5DGYHHX2HV93O0/9uxiVMS8oqQurPlyBdrCmRvNF/UYAUJ/KXcjRwPUNyEiMoLTB464ek6OhjVeiVTUC+ZuNhzb7NhlNFORz6no/uUN+ZY/Qo2Q45Dh2BSBXZq0Vag8uBpXsxOFu4KK5pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l+sA/duF; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+sA/duF"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84f38f3b36eso1364670b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 14:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788384303; x=1788989103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+/0STUVLZsyjAhQiRBiOnwe+jugMD4ztFWpPC89Ywfo=;
        b=l+sA/duF0T2zjwzPyElfx3MCquLfsCm0EzAlixgBgUDMzim60RT+4LCxp1Rfcjih2l
         A99b6dwyDMljOctKwGv9mZVApFXD6E1IxHMvALyFnbUU9NGJEx9cJ1ZkREkL04htSFxM
         9yvL8enAD7uKi2zvGKE0Psvd7LcgIxcA3KWNkcRwkQkDzuIzi1mJNNFR0yGui/DMVvuL
         tDznS40ksF41Q6/9mdlJ7jZzCCWNC+MZIFCY2TV/FtCSxfhYx6bh396YbdEB4YVhpo1D
         1oAJq90YUsfE99AhQX2IjGkl62sl4fH6zlLIQNOJIklHf3zNuTN4rlx5wzxuy+9scqrI
         5Rqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788384303; x=1788989103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+/0STUVLZsyjAhQiRBiOnwe+jugMD4ztFWpPC89Ywfo=;
        b=qtCngnh7pmNntnuINMLoALyeytF0Psb8d1B4GK++huaoxDdvduV0LSqiPeguQrKHmU
         YxAej+UA6tfPCmkcib+avLvtwUFzqY0X8a1zQHzwYO7/8BjaBRpRdiUOPRJFjvUfLUDK
         csw3CDDuO1ZsxdBwCUNqrOuxoCfQENfBMbLIC5GWZ9eeiu7lw92gY6RJYP+SQ2QTuCW7
         wZfSCtTWeqpqpI+yHfYnjik8/mq2SCuDOgExD/AnIxr8tzJuH+YtlTPTFSula9h3Kr9z
         0nIlRdk1V0fRQecoTMBa6MqniQ8YPVMObVX+HDaiOCSkNVqX06Fqx2ML/iKjSp6JPYh2
         UhWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzGKV5ZqIZkjm3FmDD+iJjCvnBNWBMOOEkqe53+ZyTerlYmX0hMtsQ3c67xYzKaUuy10ucyLiJkQqgtfw8=@vger.kernel.org
X-Gm-Message-State: AFuF++nHsU7uJLvIicMzs+Q4pl1C6gCcHHJNAB0C1IhsuOGvU+BWUzhZ
	hGwreRg9er91BlQBQTpZF9MOHsAPSUn+aVk97zNEYc6vhFXZZUb62D97
X-Gm-Gg: AYBFou3gfElO7BfukKQ+LhPH4yXNAGG51efGygydXnS4tuUEOPYw5H88G/qeIXBee+0
	AyByPgka7ba3sIR4Pe5kp5LQpS27AhirKn1SgsFD/lKNB8A8zTeKZjDWEyBSoQM0+dRyhCbY+s2
	5p+BBrQLUYCQ5eOJIkxI7mMgFyAX7Hoci+XKi1rDt+2ae1K7dnH2yKzTYoKH4tt1FgHkdyZur+v
	nb6YnKsO+0oqQBzGFl+IzmpyMPLGpi5hMQKviTrrFFSw9s/8kh8bWxOKSYqo6L15ErzU3NEcrf8
	+0BgcYZl7XiAxWy2KJ22FxUR7otGg0P2LSM15zbAUbmm7S3GgfOxAMfoaobm87VIwPX3PgmrN8j
	c5BBu1Hz4l+PGWMMUzcFJNLLRnwvoEXeHktsTJIGlxkyLLDZfF19Q07bse2fMDCb0rxDpoWDhKn
	lrRiq3Cd5/WX41I1GZ+4v+icS4kNlS169FYJqQfmkIWVxZJDJW3JeJVM9IQdz1O2RteEvquOJhG
	2UULEiiI8b04+7WaqDs9xlsyoW7qIZy4xUwWjjg0mBLUkrE3JmCF9jEzo8H84bsMkg81mmRXfNh
	dAGZGDvSxAw/xOFcDXMXqzJCksSboTIEwOUZpw==
X-Received: by 2002:a05:6a00:ad0b:b0:857:4dea:e1dd with SMTP id d2e1a72fcca58-85ed3c7d7b6mr11974426b3a.14.1788384302556;
        Wed, 02 Sep 2026 14:25:02 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc43d40c55fsm90890a12.19.2026.09.02.14.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 14:25:01 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 2/3] i2c: ibm_iic: get the irq early in probe
Date: Wed,  2 Sep 2026 14:24:55 -0700
Message-ID: <20260902212456.289608-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902212456.289608-1-rosenp@gmail.com>
References: <20260902212456.289608-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use platform_get_irq() which can return -EPROBE_DEFER, unlike
irq_of_map_and_parse().

Check for iic_force_poll before doing so to avoid pointless work.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/i2c/busses/i2c-ibm_iic.c | 43 ++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ibm_iic.c b/drivers/i2c/busses/i2c-ibm_iic.c
index 20421ebe73ab..8af666442952 100644
--- a/drivers/i2c/busses/i2c-ibm_iic.c
+++ b/drivers/i2c/busses/i2c-ibm_iic.c
@@ -648,31 +648,22 @@ static inline u8 iic_clckdiv(unsigned int opb)
 }
 
 static int iic_request_irq(struct platform_device *ofdev,
-				     struct ibm_iic_private *dev)
+			   struct ibm_iic_private *dev)
 {
-	struct device_node *np = ofdev->dev.of_node;
-	int irq;
-
-	if (iic_force_poll)
-		return 0;
-
-	irq = irq_of_parse_and_map(np, 0);
-	if (!irq) {
-		dev_err(&ofdev->dev, "irq_of_parse_and_map failed\n");
-		return 0;
-	}
+	int ret;
 
 	/* Disable interrupts until we finish initialization, assumes
 	 *  level-sensitive IRQ setup...
 	 */
 	iic_interrupt_mode(dev, 0);
-	if (request_irq(irq, iic_handler, 0, "IBM IIC", dev)) {
-		dev_err(&ofdev->dev, "request_irq %d failed\n", irq);
+	ret = request_irq(dev->irq, iic_handler, 0, "IBM IIC", dev)
+	if (ret) {
+		dev_err(&ofdev->dev, "request_irq %d failed\n", dev->irq);
 		/* Fallback to the polling mode */
-		return 0;
+		return ret;
 	}
 
-	return irq;
+	return ret;
 }
 
 /*
@@ -685,12 +676,23 @@ static int iic_probe(struct platform_device *ofdev)
 	struct i2c_adapter *adap;
 	void __iomem *vaddr;
 	const u32 *freq;
+	int irq;
 	int ret;
 
 	vaddr = devm_platform_ioremap_resource(ofdev, 0);
 	if (IS_ERR(vaddr))
 		return PTR_ERR(vaddr);
 
+	if (iic_force_poll) {
+		irq = 0;
+	} else {
+		irq = platform_get_irq(ofdev, 0);
+		if (irq == -EPROBE_DEFER)
+			return irq;
+		if (irq < 0)
+			dev_warn(&ofdev->dev, "using polling mode\n");
+	}
+
 	dev = kzalloc_obj(*dev);
 	if (!dev)
 		return -ENOMEM;
@@ -701,9 +703,12 @@ static int iic_probe(struct platform_device *ofdev)
 
 	init_waitqueue_head(&dev->wq);
 
-	dev->irq = iic_request_irq(ofdev, dev);
-	if (!dev->irq)
-		dev_warn(&ofdev->dev, "using polling mode\n");
+	dev->irq = irq;
+	if (dev->irq > 0) {
+		ret = iic_request_irq(ofdev, dev, irq);
+		if (ret)
+			dev->irq = 0;
+	}
 
 	/* Board specific settings */
 	if (iic_force_fast || of_get_property(np, "fast-mode", NULL))
-- 
2.55.0

