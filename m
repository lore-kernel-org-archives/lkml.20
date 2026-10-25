Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792956220;
	b=vqPstYw9GH+rpgEKS4fmnqzIQOWZBz2JrlZW548bq35JZot/3qUqaw9dfpve9twZfAyb
	 O9FdAf6tPVezJyaeaadgxjoqlg6PvTkwrdIPk8miIIHjZX8VxM5UCw/Oi95lCUvPZFr46
	 OMsRqENLo+jZ29MhGBI8wPbuUxf3NY63IwyFlgsiLtKeAP+EVGjbIiJBSLH99dYrSrSmE
	 0XVenH1IuvQ5xC71f3PyaChXdIam7u8oTUSMVzcyInBVQPuf6BE2Yyuy54uDiLlLAE1Ju
	 1m1hlqgiSVL9zOcRSIuCRrTb9zYmTJepRpIEgw8vLMw9GcFTB+knwT14CgwKqVFBF/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956220;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=3QOSvIP5kH3TW/P9LSpPXkVX5tKHksdBlAOsewQ+L/U=;
	b=Mf4FxTll5yy/Eg2LyvSlmu/lmMt+L++z1Ag7V+1H1y/pIHL8YE4c+z7sH7b0w+WWI0A2
	 OlidG0vNPd8a4HgEhzXm0fVmhKIOwDu6DxAbTcST4l3k00r5Kr7AQAF3k4xM5khSTtctA
	 +2fDdW9KKOprXEIOlsT7M7qXHlrr1O6Vr+ABBt7Lh6qk6nDzZ24MzzEI/adpkgMIeRCVZ
	 mAU7MgV6j0J8v646iBFs5T5Tr21KnTLml7NMGAcvqTFD6mWG+aq28CZliaMLlNSqn0kkH
	 Hm0xYh2+2GTRM3+EsdMk1hzVuHlPV19GXMUWHS+WhtSteUVZ9yJtJXc4wly4d0zLEcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=AYYgThW8;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F4A606A322;
	Sun, 25 Oct 2026 19:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69F4A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=AYYgThW8
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJNLM4517824
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:23:26 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJNLM4517824
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956207;
	bh=3QOSvIP5kH3TW/P9LSpPXkVX5tKHksdBlAOsewQ+L/U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AYYgThW88D9XesaIb7XJlWRn+xspAo5OxjyYlUtH+L1FDuOzji8Y6zPN7354uMBB7
	 Mb2FpQmAIyD/DrcnVgY40xuMYAj7KXCD+uCvVhDYNkZjsIxqKghxLt+gOx3GFI2aqe
	 SInv28GCZLLj8FAGluS6KU4mowbviekjapbWsB/E=
From: christian.koever-draxl@student.uibk.ac.at
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com,
        jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        sean@mess.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 2/2] media: rc: meson-ir: allow the receiver to wake the system
Date: Sun, 25 Oct 2026 20:23:19 +0100
Message-ID: <20261025192320.209446-3-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192320.209446-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192320.209446-1-christian.koever-draxl@student.uibk.ac.at>
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
notice the remote and the receiver can never wake the system.

When the device is a wakeup source, keep the decoder running and arm
its interrupt as a wake interrupt instead. Boards without the
wakeup-source property keep the existing behaviour.

Tested on an S905W2 board: suspend to RAM, the power key on the remote
resumes it.

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

