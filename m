Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793960412;
	b=C8tPA8qLJky+uCg0kaF7AnLGF50VQC+if71AU8MsyWo8XXuRSQu8ThZn9rK6lpu9p1+E
	 2Wz2d48ebh+B9P7ErqHNk+rWer7MdaOK2OdEjghaBvX/N7nrA4GHQEpM4BLuXYaXUlCfR
	 2oCXjYIFA7l6mAnoLw3vRFnKtrZOoHJxw+blDY+uZnYtIS8oV3Av2/SK2HUpII2krFWug
	 HpJUIALyh65P6UIP25NXr2cB3mIRp5Z2JxAMLR9dVmyMOz1tRgfyU0ACG4mC68Rrac0cv
	 vVOHuEtJ09Vh7RneTPiFH7ck4BoTRY7YK0noIk+33cQKuQC+xP0vIAEK2mKQy/P+kiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960412;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=3pN3R/UpUV10JfpQwTbJj5KhF2jJkL0dKbpgZQeGgeg=;
	b=XYyu6qJwHpNszxbbUtK0uUmnt4WYv5BQWmXJtdXZr7OvP8XynC58XRL8+bRkqaYQgpaf
	 qZElg89jr7tHW6XYmAfIenxL10qjjgEEzEdUYMQuWNpk7eYhWmm2WqsjR47/BcLmoHsgp
	 tdeKRMauAVV77nfno7PW3TAN76tAYrOBwhWO/jXWRujf9SfehTZTzdVqHPQ9eGCn2pOW6
	 dxWDHDN8Qa8y8kB+b5jH/+dSHaTNxrMDNBPBIscvNn6hmm719qzkS651wWYdy9iIPqKcy
	 aFVhuGdWS9uYUxO2xHUlAXSstYGqmzdZRdr+jg+17SMs9Qjx4edgaofw7kKte2yQMPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=rIrFWJIp;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25574606D80A;
	Fri,  6 Nov 2026 10:20:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25574606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=rIrFWJIp
Received: from surface-pro-5 (ydWLT-U1-95-184.uibk.ac.at [172.25.95.184])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6AJteX1864372
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 6 Nov 2026 11:20:00 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6AJteX1864372
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793960400;
	bh=3pN3R/UpUV10JfpQwTbJj5KhF2jJkL0dKbpgZQeGgeg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=rIrFWJIpUTZFKBF0D9Tv/kPHjQ4EgcwkRZHzoFXAyR/lLd43zhGdJo035EZP69irg
	 q/OHAlyf6d6595RAizJaYiuydSkhg3R6CW7cgK2YsTQ1vLcwybx+LZEcW0cFyhVBZe
	 8Cu3YNPDZEDxyxITCPh+V9MEc1lu6a34LwASfkZY=
From: christian.koever-draxl@student.uibk.ac.at
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com,
        jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        sean@mess.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH v2 2/2] media: rc: meson-ir: allow the receiver to wake the system
Date: Fri,  6 Nov 2026 11:19:54 +0100
Message-ID: <20261106101954.46907-3-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106101954.46907-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261106101954.46907-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

The suspend callback switches the decoder off, so nothing is left to
notice the remote and the receiver can never wake the system from
s2idle, where only Linux interrupts can wake the CPUs.

When the device is a wakeup source, keep the decoder running and arm
its interrupt as a wake interrupt instead. Boards without the
wakeup-source property keep the existing behaviour.

This does not affect suspend to RAM on boards whose firmware watches
the IR receiver itself while the SoC is down, as on S4 where BL31 wakes
the board on the remote's power key.

Tested on an S905W2 board in s2idle: the power key on the remote wakes
it; with wakeup disabled for the receiver it does not.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 drivers/media/rc/meson-ir.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/media/rc/meson-ir.c b/drivers/media/rc/meson-ir.c
index 272ebb0d97c8..6b5b5f71a1b4 100644
--- a/drivers/media/rc/meson-ir.c
+++ b/drivers/media/rc/meson-ir.c
@@ -165,6 +165,7 @@ struct meson_ir {
 	const struct meson_ir_param *param;
 	struct regmap	*reg;
 	struct rc_dev	*rc;
+	int		irq;
 	spinlock_t	lock;
 };
 
@@ -475,6 +476,8 @@ static int meson_ir_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
+	ir->irq = irq;
+
 	if (ir->param->support_hw_decoder)
 		ir->rc = devm_rc_allocate_device(&pdev->dev,
 						 RC_DRIVER_SCANCODE);
@@ -523,6 +526,8 @@ static int meson_ir_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	device_init_wakeup(dev, of_property_read_bool(node, "wakeup-source"));
+
 	dev_info(dev, "receiver initialized\n");
 
 	return 0;
@@ -571,6 +576,9 @@ static __maybe_unused int meson_ir_resume(struct device *dev)
 {
 	struct meson_ir *ir = dev_get_drvdata(dev);
 
+	if (device_may_wakeup(dev))
+		disable_irq_wake(ir->irq);
+
 	if (ir->param->support_hw_decoder)
 		meson_ir_hw_decoder_init(ir->rc, &ir->rc->enabled_protocols);
 	else
@@ -584,6 +592,15 @@ static __maybe_unused int meson_ir_suspend(struct device *dev)
 	struct meson_ir *ir = dev_get_drvdata(dev);
 	unsigned long flags;
 
+	/*
+	 * Leave the receiver running when it is meant to wake the system up,
+	 * otherwise there is nothing left to notice the remote.
+	 */
+	if (device_may_wakeup(dev)) {
+		enable_irq_wake(ir->irq);
+		return 0;
+	}
+
 	spin_lock_irqsave(&ir->lock, flags);
 	regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_ENABLE, 0);
 	spin_unlock_irqrestore(&ir->lock, flags);
-- 
2.56.0

