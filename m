Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08320C8D9
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791782175; cv=none; b=NgIcrHjtrqanHCCSXrx+uGYWuHmBeHAP0gkq2In3Z5rqGhrI0BEfjxpvKMxd/0/4GmXe85O9cbkcrz4rbCYfEdxWCm5PRDl4jgDuK+bWIvu1Mufulta5AATwHpWnDuG18vSIfcnKGq2JRTA9vJYT4EJiz4kyuO6XSSTJwBM1IX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791782175; c=relaxed/simple;
	bh=Djy/zzJfys8gByPl6c60AthKsfg7TL2htBD6/K2u8PY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KrLOK/ymNl7prPQKwn5Yk2nAyFVlGFz9zVih2nVlRuNMdc9LhKcS4jLHJAWih1DAMDcc3HdfQwB+F1CFnsIMCu/WP//tyzFS5ceVcpzd7dcL0lKOPhm/kTeJEVBAWYYWdHQudsOPRRsOsk40h1ui7iM4GBIXAgzGpEpHEaCpZnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E7E3V4/+; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7E3V4/+"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5338f65913dso18145461cf.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 22:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791782173; x=1792386973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DoIjC7EcejB2ioPzHuqTAbp7uokmahiy0Pm6Nq6N6q0=;
        b=E7E3V4/+ZdF2jg+OHsuNrj3aWgKqxj6EJDzzOzI9fucx1qGlpoKW2XDMq6HRz8Vs1o
         KEhbumRb106lOp6UcdqtVW9aOF4n8j9/2EfiYO0x87puXP7vIh+Uf2dMZSWxhvJDkTaC
         N5kEhk1oyuXt+O3oAM4qPW9ENWT8HREXs/yDmHsZ8Y57pUkpJhAwLGulN/rISPJe/bWY
         kvd1kjzzd1Og4bvmNau1hOd93LL1H25svoJJv1Aee0T72zga72VUeLUyZ0UQ8IO/BNsr
         a5ccARSDXGvektXVoDoA4RZriucky7lpHjakM4YUDZcsegyfLlUiXWWBABtzflOEAJki
         CwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791782173; x=1792386973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DoIjC7EcejB2ioPzHuqTAbp7uokmahiy0Pm6Nq6N6q0=;
        b=MkbkDf49yJ61RaPcJU9DRVSUdJAGExubqun4KzlF9AnvipwN8CCQbEth23i3bKwArk
         Ai6SM9ug4IwqC2rgR8n0YXTkYF7uee1l6CMbRokJzaA/aFrFVFvIQ6DoSS27YsDaLV7T
         n+rpYNi56rpCJz1ew0KDexmOhbvw4KOG38A6hj6MA7zvn+Rh/zyMeOLK9bGqL1YaIW2G
         7Gr19/2KhiMI0G8YeLLM/iqcbEHiPgnEY0Q1LWXNruk5p3z0JGSvIJysjTHyBQWm6Xz/
         BWc1yEMfYfWewxnOlgPFSpMMGpaQZGr9zNuzuo66jwp2okvB/kRrfJeFrCjESp97o1Ga
         yoVg==
X-Forwarded-Encrypted: i=1; AKwUvBz/K8TGIQ4pwho77uCqcW1bSeURNgRuU0flf6EaNDRNbNMBlO1IQNH6mvO4o7kYzNoNZJpJeO99nHHryKk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMLfdnN45EiHh5zrNzIr04Sp+KeBCjY4/K7rKPZkrTSe2RGBPA
	OyHpBQhs5sOtOZcbzq8HxQytr//++EdmgNo8TO2kbqQQJALpIxLzpMPM0qOOgXtjlg==
X-Gm-Gg: AYBFou069MeOa+oKTHxpJejuJSz1eeLZQReHhVSxhLAY7rSVU4ckb/6aJTirTeh5HdG
	y2L2n9FsIfEJjYq9mY94TsGJzk8eeQrqN6IybETClpe5Vf0atL7auIOvTTNwf+lRVFIcnyaRQQS
	g1jLWl7eKihi7keaC9iN8mK25tXHOwduiYfnSsOJKCVbu3Tds0aKGf66u4DGkrJuNCyiSucYE1L
	5x5oZupV6PvOlQGVX2KujDKMj9AbDejFw0AhBnJmBl6w6eov/14qHis4vpyrUM9ZPlMXvU+EIRK
	N9jkDilvkHvs1xZ4oDdE05jptShsvW/sXAAdNCf1uTBWgQUyzu7Nk57kDFTwIeSARYbovEqaojs
	4TvC9nyRdwUGidZgAzWvHsZC6MZQ7imA3E1/6OOFCxIJoUzVTy43ylXq7nLfK1fUv2epmz6Y18q
	8KfLI50hEnZ5xoepHEXU4bSdvpqtzKqmXLlCYPLHNJQhYMsUMBhO9prkfJLFWj9+Hic6SrJqdIP
	yssrLKvcYN5zGJvK0t2bYB3KZXLJhBV8qqeIY5yxZ5rqUVvB8+YYitHis1lC+zVu9tPqzKrJVLQ
	1xl7UqDlPANQkA5DJs6u7rxavYZt239C7P3D9bk=
X-Received: by 2002:a05:622a:2486:b0:533:8f97:9362 with SMTP id d75a77b69052e-5359fdd0ba0mr136390851cf.49.1791782172836;
        Sun, 11 Oct 2026 22:16:12 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b550184adsm86514996d6.9.2026.10.11.22.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 22:16:10 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] i2c: stm32f7: close SMBus alert work before removing ARA
Date: Mon, 12 Oct 2026 01:16:08 -0400
Message-ID: <20261012051608.177145-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clearing ALERTEN does not join a handler that already observed ALERT.
It can enqueue work after the ARA client has cancelled work and freed
its backing state.

Exclude transfers and join both controller IRQs before detaching the
alert pointer. Check that pointer before queuing ARA work, and handle
single-line controllers without disabling the same IRQ twice.

Resume the controller before masking and clearing ALERT. On resume
failure, skip MMIO while pointer detachment still closes the producer.
Restore IRQs and release the bus lock before unregistering ARA so its
worker can finish an I2C transfer.

This issue was found by static analysis.

Fixes: c8062d11e20c ("i2c: stm32f7: add SMBus-Alert support")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 44 +++++++++++++++++++++++++++++---
 1 file changed, 40 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 6bd281a9ef72..9b8f378afe3b 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -331,6 +331,8 @@ struct stm32f7_i2c_alert {
  * @dnf_dt: value of digital filter requested via dt
  * @dnf: value of digital filter to apply
  * @alert: SMBus alert specific data
+ * @irq_event: interrupt for events
+ * @irq_error: interrupt for errors, or irq_event for single-line controllers
  * @atomic: boolean indicating that current transfer is atomic
  */
 struct stm32f7_i2c_dev {
@@ -364,6 +366,8 @@ struct stm32f7_i2c_dev {
 	u32 dnf_dt;
 	u32 dnf;
 	struct stm32f7_i2c_alert *alert;
+	int irq_event;
+	int irq_error;
 	bool atomic;
 };
 
@@ -1534,9 +1538,12 @@ static irqreturn_t stm32f7_i2c_handle_isr_errs(struct stm32f7_i2c_dev *i2c_dev,
 	}
 
 	if (status & STM32F7_I2C_ISR_ALERT) {
+		struct stm32f7_i2c_alert *alert = READ_ONCE(i2c_dev->alert);
+
 		dev_dbg(dev, "SMBus alert received\n");
 		writel_relaxed(STM32F7_I2C_ICR_ALERTCF, base + STM32F7_I2C_ICR);
-		i2c_handle_smbus_alert(i2c_dev->alert->ara);
+		if (alert)
+			i2c_handle_smbus_alert(alert->ara);
 		return IRQ_HANDLED;
 	}
 
@@ -2116,13 +2123,39 @@ static void stm32f7_i2c_disable_smbus_alert(struct stm32f7_i2c_dev *i2c_dev)
 {
 	struct stm32f7_i2c_alert *alert = i2c_dev->alert;
 	void __iomem *base = i2c_dev->base;
+	int ret;
+
+	if (!alert)
+		return;
+
+	ret = pm_runtime_resume_and_get(i2c_dev->dev);
+	if (ret < 0)
+		dev_warn(i2c_dev->dev, "Failed to resume for SMBus alert shutdown: %d\n", ret);
+
+	/* Exclude transfers and both interrupt handlers while detaching ARA. */
+	i2c_lock_bus(&i2c_dev->adap, I2C_LOCK_ROOT_ADAPTER);
+	disable_irq(i2c_dev->irq_event);
+	if (i2c_dev->irq_error != i2c_dev->irq_event)
+		disable_irq(i2c_dev->irq_error);
 
-	if (alert) {
-		/* Disable SMBus Alert */
+	/* Keep late or pending ALERT flags from queuing work on the old ARA. */
+	WRITE_ONCE(i2c_dev->alert, NULL);
+	if (ret >= 0) {
 		stm32f7_i2c_clr_bits(base + STM32F7_I2C_CR1,
 				     STM32F7_I2C_CR1_ALERTEN);
-		i2c_unregister_device(alert->ara);
+		writel_relaxed(STM32F7_I2C_ICR_ALERTCF, base + STM32F7_I2C_ICR);
+		readl(base + STM32F7_I2C_ISR);
 	}
+
+	if (i2c_dev->irq_error != i2c_dev->irq_event)
+		enable_irq(i2c_dev->irq_error);
+	enable_irq(i2c_dev->irq_event);
+	i2c_unlock_bus(&i2c_dev->adap, I2C_LOCK_ROOT_ADAPTER);
+
+	/* The alert worker may need a transfer before its removal completes. */
+	i2c_unregister_device(alert->ara);
+	if (ret >= 0)
+		pm_runtime_put_autosuspend(i2c_dev->dev);
 }
 
 static u32 stm32f7_i2c_func(struct i2c_adapter *adap)
@@ -2178,6 +2211,8 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 	irq_event = platform_get_irq(pdev, 0);
 	if (irq_event < 0)
 		return irq_event;
+	i2c_dev->irq_event = irq_event;
+	i2c_dev->irq_error = irq_event;
 
 	i2c_dev->wakeup_src = of_property_read_bool(pdev->dev.of_node,
 						    "wakeup-source");
@@ -2210,6 +2245,7 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 		irq_error = platform_get_irq(pdev, 1);
 		if (irq_error < 0)
 			return irq_error;
+		i2c_dev->irq_error = irq_error;
 
 		ret = devm_request_threaded_irq(&pdev->dev, irq_error,
 						NULL,
