Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793547680;
	b=xy2YrGToPosXoLX3i2Dljm/4JoEjnZmhXRb2Sq+Cp37nRBdb6D699Ocv2zOMIVW+/3Po
	 gxH4ANSXqg07k7z/4vwMS6KsaZJv4qMPuh3EA4NfkuT86MtjV1YvlE5MRCDXt8mQLqHqA
	 MO/rWQkacWHas7kpKe+oNfcxcLWy8pa5dZ9Zs+UhOK78r6FI9+EXGxPlr7Unb1wHV04GR
	 1e70K/O0towErnNAG4gD9BrAPpjJlL2TVbVrBgveobAeIs2OF3C1zu5yEByPFrIaVw0UF
	 sdOW3xk7Puf7JvxsxWbmvqBeta8et6SvaTfOWgEryU2vJBBw2Y7G30mHjSr/oUXByug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793547680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OvmhxSjVHj+d9pk6ymL8DlmUjvcSTE0G8stIvyswo2I=;
	b=gNF5STPzFq4YyreoaK8nYNMY2oD8k3fgnasP+25I6lyVkAWt8ijxpBXiWHbjkv0/vwoP
	 Rw7nTwXKDa6qaa3eEf5okg18uupt2l0idXbdN268/Vbd25O4CUpgk2jOKsptW5fYVH/Z4
	 agfpnulpsjZzgltaa8oL09HLH+zPiuGkMq9Piv7WKZ/Qv5QdouVy2dZbQ6j8S8WkHpDon
	 jP4Ri/yeP3814VZYdHadX+TRitEkzmIr7SK7Gl6mBwlDIWdW6jyQvQWO/Yy8m3mMPogSl
	 AJE2S/61tq6DyGNCfZ2M2m5Ae1HQYaRuZQSFRwPpQC1OlPz4WMZqTmEpq4RM3AS4G1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="S/jLoln6";
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23F9606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 15:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D23F9606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S/jLoln6
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso1283369a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 07:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793547679; x=1794152479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OvmhxSjVHj+d9pk6ymL8DlmUjvcSTE0G8stIvyswo2I=;
        b=S/jLoln6RvWYTGIy1ApMtaHHXf0oJ9gLsgCzpLH7KldVOxjmoVxKbkB4GOiZtFhxqu
         jC9WNRz1ybmL6ddn5CyvCJ/vKVhXDCcdCWh1vRkBCVEpcGphA0hCmkuklnj8XKsPQcv9
         SJvHJzPNm7Hwmw8cPAM/htB53jLc+LgoNiGinxAe+BdIPHwux5Fs3RkAt3jPk924Ws8j
         FplY8l5r7o70mCVs49MfK3igC72hcwZa/KSpwVXSxsJ5jJXkETDP7WyKPhraQ2cASydG
         wOy7zNOoIFP7s+lC3B8chkFS9iNc6po6dhptrvt/W0dRk5NbteaO/iBpm4agT0FKm5ji
         V4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793547679; x=1794152479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OvmhxSjVHj+d9pk6ymL8DlmUjvcSTE0G8stIvyswo2I=;
        b=dZvZI4JwkVtuqluoeT4LVAWAZI1UE9/5YUmGRfeIbg2JjtMOLY/1eul85vo7KHheO3
         nz3hDd42TzaXzruDAUn7GQmVaJOSMIfMRKQf4PoMDoDXIg2/T6dnK6dbXDxNvGAN3Udb
         g57EiazTQYYKxIWhVWnb8EGmwZU5GnWxwH16JLe06gF+V/Upuz+O1vJHXVOtuhWFI5OX
         4y5Z+qfmvaHD+jJCADH3yTTwQ8Yg1yTyYT4pormiYwJYE/RyD/YapH2nqw91gQrslv8a
         bKmLsUo6xGl//0YvDTpvwa+xoZwR7vEMdSuraPSpMZrj+h1SXN1i+F1qWp6wiv5j4snX
         A+7g==
X-Forwarded-Encrypted: i=1; AKwUvByyu3wUM317NMRavc8AyZplY+m6mZEc8kQAtzPNgZYVOTLXQD/4N8VlSZ2XN27LOhkvr8Bs+UmeMFdbZuE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RHEjUo3Pa22b+y7/k3g5MF2UPrcR5zC600PenYRYzecKxdiV4
	E6/v+WsIal+VoLyT6vXGYez8bEWdel6LAbSslAx6+EEu8kIRbMwWIE1w
X-Gm-Gg: AYBFou1ZfYvrCOFnyBaKF/E4Qy37tiEGuVHRRj7/5jGSNkguMZOMrLr8lCM11wohce7
	nU9vixAjHsza+FR3WZd0mgNh6oc7Fk41p/D9zUuXRRIydk5/I4HpPRNk6QgFLVORfSGQuR5QywY
	DPLhnLCUnO1wdg/nL9ml6IjspkAR27oyK12UAoaA3AvrHFacyRyBepv6my/t44wigh/XNRQrIq2
	JRka+l5NcvDySv47oG5xwAK65jPbhuGsHY9HxVIxt4eTJX3NblgCcBglafe9j7g6O578oeYNcd4
	7BRIIOku7H8EHxr6qVnS464Q/blW6oI6b8TyHyFZxHSDfocYqhWhxV9X6lsSmg7tH+ZD4eRtWng
	iDfzRCgGI+SJ2QqD44knt7zLCtDNuTlLN45J8Xm1HbITcrlgkSDAxyR6yuvpqj+tkavcuWCYZyx
	y7CinE20L3r/Bw2hsHuEyG3Q2KHzBOFpBq9Ldb8dgl2k1PTfu1ED8w2xgcp02to/X4sSUB1Vzfs
	y6w956Z6kJdxN1PIw2C6ZBNLlErJrs6I5aC2+bWJoWmhUbYTn29lqdwdZKnyzSL9/RcuwOX0BXP
	oEw77v5Nt8AkdXb3Wf5pL4Q4tAGQEyOTShlkafoi/w==
X-Received: by 2002:a17:90b:4c08:b0:3a8:de1:db07 with SMTP id 98e67ed59e1d1-3ae8957d253mr6930512a91.5.1793547679213;
        Sun, 01 Nov 2026 07:41:19 -0800 (PST)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845984absm10776958a91.10.2026.11.01.07.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 07:41:18 -0800 (PST)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	Joseph Chen <chenjh@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Yaozhong Li <yaozhonguwl@gmail.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/3] mfd: rk8xx: Release the power hold GPIOs before powering off
Date: Sun,  1 Nov 2026 23:40:51 +0800
Message-ID: <20261101154053.3874-3-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261101154053.3874-1-yaozhonguwl@gmail.com>
References: <20261101154053.3874-1-yaozhonguwl@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rk808_power_off() writes the PMIC's shutdown bit directly. On boards where
lines driven by the SoC gate the PMIC's power-off path, a shutdown
performed this way does not stick: the rails drop and immediately come
back up, so the board restarts instead of staying off. U-Boot reports the
result as a power-on reset.

Take those lines as an optional GPIO array, hold them asserted while the
system runs and release them - waiting power-hold-delay-ms - before
writing the shutdown bit. Device trees without the property retain the
existing behaviour.

The array is claimed before any child device is registered, so that a
-EPROBE_DEFER from the GPIO provider does not tear down the regulators,
RTC and clocks that devm_mfd_add_devices() has already registered.

On a Firefly-RK3399 the shutdown stuck when such a line went from high to
low before the shutdown bit was written, and did not when the line was
never driven.

Assisted-by: LLM
Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
 drivers/mfd/rk8xx-core.c  | 49 +++++++++++++++++++++++++++++++++++++--
 include/linux/mfd/rk808.h |  3 +++
 2 files changed, 50 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/rk8xx-core.c b/drivers/mfd/rk8xx-core.c
index 3dcf6ab..137ab20 100644
--- a/drivers/mfd/rk8xx-core.c
+++ b/drivers/mfd/rk8xx-core.c
@@ -11,6 +11,8 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/rk808.h>
 #include <linux/mfd/core.h>
@@ -703,6 +705,22 @@ static int rk808_power_off(struct sys_off_data *data)
 	default:
 		return NOTIFY_DONE;
 	}
+
+	/*
+	 * Some boards route "power hold" lines from the SoC into the board's
+	 * power circuitry. They have to be held asserted while the system is
+	 * running and released before the PMIC shutdown request is written,
+	 * otherwise the rails can drop and come back up instead of staying
+	 * off. Releasing them here rather than from a separate handler keeps
+	 * the ordering against the I2C write explicit.
+	 */
+	if (rk808->power_hold_gpios) {
+		for (unsigned int line = 0; line < rk808->power_hold_gpios->ndescs; line++)
+			gpiod_set_value_cansleep(rk808->power_hold_gpios->desc[line], 0);
+
+		msleep(rk808->power_hold_delay_ms);
+	}
+
 	ret = regmap_update_bits(rk808->regmap, reg, bit, bit);
 	if (ret)
 		dev_err(rk808->dev, "Failed to shutdown device!\n");
@@ -766,6 +784,7 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
 	struct rk808 *rk808;
 	const struct rk808_reg_data *pre_init_reg;
 	const struct mfd_cell *cells;
+	bool system_power_controller;
 	int dual_support = 0;
 	int nr_pre_init_regs;
 	u32 rst_fun = 0;
@@ -851,6 +870,33 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
 	if (!irq)
 		return dev_err_probe(dev, -EINVAL, "No interrupt support, no core IRQ\n");
 
+	system_power_controller =
+		device_property_read_bool(dev, "system-power-controller") ||
+		device_property_read_bool(dev, "rockchip,system-power-controller");
+
+	/*
+	 * Claim the optional power hold GPIOs before any child device is
+	 * registered. A -EPROBE_DEFER from the GPIO provider at this point
+	 * costs nothing, whereas deferring after devm_mfd_add_devices()
+	 * would tear the freshly registered children down again on every
+	 * retry.
+	 */
+	if (system_power_controller) {
+		rk808->power_hold_gpios = devm_gpiod_get_array_optional(dev, "power-hold",
+									GPIOD_OUT_HIGH);
+		if (IS_ERR(rk808->power_hold_gpios))
+			return dev_err_probe(dev, PTR_ERR(rk808->power_hold_gpios),
+					     "Failed to get power hold GPIOs\n");
+
+		/*
+		 * The settle time is optional. rk808 is zero initialised and
+		 * the binding documents 0 as the default, so an absent property
+		 * means the shutdown request follows the release with no wait.
+		 */
+		device_property_read_u32(dev, "power-hold-delay-ms",
+					 &rk808->power_hold_delay_ms);
+	}
+
 	ret = devm_regmap_add_irq_chip(dev, rk808->regmap, irq,
 				       IRQF_ONESHOT | dual_support, -1,
 				       rk808->regmap_irq_chip, &rk808->irq_data);
@@ -872,8 +918,7 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to add MFD devices\n");
 
-	if (device_property_read_bool(dev, "system-power-controller") ||
-	    device_property_read_bool(dev, "rockchip,system-power-controller")) {
+	if (system_power_controller) {
 		ret = devm_register_sys_off_handler(dev,
 				    SYS_OFF_MODE_POWER_OFF_PREPARE, SYS_OFF_PRIO_HIGH,
 				    &rk808_power_off, rk808);
diff --git a/include/linux/mfd/rk808.h b/include/linux/mfd/rk808.h
index 7ffc904..e56d595 100644
--- a/include/linux/mfd/rk808.h
+++ b/include/linux/mfd/rk808.h
@@ -15,6 +15,7 @@
 #ifndef __LINUX_REGULATOR_RK808_H
 #define __LINUX_REGULATOR_RK808_H
 
+#include <linux/gpio/consumer.h>
 #include <linux/regulator/machine.h>
 #include <linux/regmap.h>
 
@@ -1466,6 +1467,8 @@ struct rk808 {
 	long				variant;
 	const struct regmap_config	*regmap_cfg;
 	const struct regmap_irq_chip	*regmap_irq_chip;
+	struct gpio_descs		*power_hold_gpios;
+	u32				power_hold_delay_ms;
 };
 
 void rk8xx_shutdown(struct device *dev);
-- 
2.55.0.windows.3

