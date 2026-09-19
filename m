Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B476E37E30C
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 12:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789820998; cv=none; b=H1z8DzKi4NUOQqEPuJvQN/4b2ssUkCngHTo3KfPyNuQ0lP+w3lbDZeWHjLVyvEwgXu79VeKfiYRaRmUVplPCCIKVj1jTYs7eR2kYH0Li3RLIZGQipaX2C/i9QAtg4Q3bj0A7ekDpX6xMWQLKUpO4yjg1iCkJhRHvnh9mApfbyLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789820998; c=relaxed/simple;
	bh=A6YC8hwe0sxhvQOJTVbWS9EOH9//kG+V5D2wIqS3pGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FWqWiUuSWJgBhOMwDcLCPZntr9480FD/DR+vKxmHgPb1yu+qMePBiE2zB/Vg+1gv5av+PKa0apuEJo3iICa91N2dgU+G2ILR0srJ2a5hsfhnqQDoitLru0gITNhFPo73ss/zB3NhCEQTGJ0lViMxcgdiW1sgn2PzLXQQkggoVS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DRDAhpm0; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DRDAhpm0"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d747ed6d6eso16509835ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 05:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789820996; x=1790425796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JTGehQbUedEzKLkhhaH1lsUDkNzzFr5cL05MJAHVVcA=;
        b=DRDAhpm0oCgV7pcmAssfcDLexn7vUzP77r/fuPCoLdxERnEH4pKPG2vBpoxa6rzx6Q
         dqKwWHcU7JMShwGn9AdY3LM38Vd0JSYCP+T4Nq6Dg6CsU/g40rhLPfBrDIkI4K5nPUFT
         uItNWgF2TXkgzmZL8kZmXduqatzHayivYgBMhf5/ayFxiM3GyLTKYe61239aLXoTWXSJ
         7lIOox0/NWIcDVq+EenjBfXtkiHTRKBlq28h8dk1iOyOkIesqVMXXT/VZs1exqHfrqtH
         JZKJG1zEZVvYKMcivNkwD4K0ZE+j+bYwK5PYovk1VjauN8XXvKKgdese+15o/Wi8cwGP
         ZpgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789820996; x=1790425796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JTGehQbUedEzKLkhhaH1lsUDkNzzFr5cL05MJAHVVcA=;
        b=rKxPKEU3MuJktGljmeqBh0WNUSSwkYbqQu8aYHafDIO4cVQwlt9ws3nVo4Z6DC5sh6
         c8gLa0MopvBeHEZMZaM2NGm/NjBxoWQhQIPPEDfuR0kqCx3TpAAH8COhCQE8J9Aoh3gb
         IefxQwLKbrFWY3HU7Hr9ZmJeWaFKmGua7r48Oakf6827PW0RmXrOfqfG08hV9RliVYS+
         2v92y81IYqyDGLdbe/kq9DAkXCk4xus5aqWn70e8xGNJ5QyhQ0W0Qky5QgtVzdhCSsg8
         ccdo4+zhuts5uA50oHskaF+phXtB11BvcLvK40IH4iVbGNNb+QKY8g+mhjNaxLqhROk6
         7pnA==
X-Forwarded-Encrypted: i=1; AKwUvByjE9jOEKNaO7QiydnfXcNGdsuY6j8o18LCy2/igaZrqO0iqRvqyXepS8t4abvhyouX7HBpl7gKnpxoCok=@vger.kernel.org
X-Gm-Message-State: AFuF++nph8eycRpjVSAEfo9tz2lU1U2MjjDluBBmfMzeTPqwdViRB0yK
	T7Y5+4drDyf9mzjMj2XAHvdoLsbMGoOJEjGsfDta/+oY2fHqcLHLyieY
X-Gm-Gg: AYBFou3hSAwQ1qm7kh3M4JWnS93kGjqK3jSsvGKF2r5umNT/bmxJ8l+XuYk+JEgtTPB
	edj2NfXvmiz5NENSvjtlSdeCj3jhTTmLzDAYp0l74R5N4E82oDdH5wMFmIMuyqfOREmCgEL1oSS
	7zSMWYzVyM7mwpngpnkRnpwh5ydQw+2EMle03RUoA7y7YHNL4lB6jEImjoejILU4hm6fsJJwDRI
	oPE5J/xeQ22pR+YXDwwTOif+lkeyKgkk5OUGQzlzOnk99FXCsVO8KisYR32Lx0BpGxFxBKD1t4D
	7I1vlzVTQ/UGB7uLUwNxDh0bqtp0a/EWrXBVEAxDbuXIWi9UwqTSjnxQrQJx/VUpRvJHo/sDFis
	9rUYKcMQhLrLHvcjn2qtmbI3gubDtiXYEPWDgWc+Bbo3R2Cd2h4Q5+1OoMmdsb2QK1+zUz6rXIz
	sisORFgZuDXdV8i4QDRwZZgQ81M4ZT45hvv1wrCmEWKPFoAne5i7YnktmAUUPJ5AbP+yi9K7mfQ
	rYa297T8JE=
X-Received: by 2002:a17:902:d4c4:b0:2d8:d4dd:24c0 with SMTP id d9443c01a7336-2ddb1b97ee1mr97401945ad.21.1789820995660;
        Sat, 19 Sep 2026 05:29:55 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d7115sm9552155ad.66.2026.09.19.05.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 05:29:55 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>
Cc: mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [RFC PATCH v2 2/3] mfd: rk8xx: Release the power hold GPIOs before powering off
Date: Sat, 19 Sep 2026 20:29:29 +0800
Message-ID: <20260919122930.1418-3-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260909092728.1859-1-yaozhonguwl@gmail.com>
References: <20260909092728.1859-1-yaozhonguwl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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

Releasing every described line matters: on a Firefly-RK3399 the board
stays off when both lines described for it are released, whereas releasing
GPIO1_D0 while GPIO1_B5 is left asserted makes it come back up.

Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
 drivers/mfd/rk8xx-core.c  | 47 +++++++++++++++++++++++++++++++++++++--
 include/linux/mfd/rk808.h |  4 ++++
 2 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/rk8xx-core.c b/drivers/mfd/rk8xx-core.c
index 3dcf6ab..0898db0 100644
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
@@ -703,6 +705,24 @@ static int rk808_power_off(struct sys_off_data *data)
 	default:
 		return NOTIFY_DONE;
 	}
+
+	/*
+	 * Some boards route "power hold" lines from the SoC into the board's
+	 * power circuitry. They have to be held asserted while the system is
+	 * running and released before the PMIC shutdown request is written:
+	 * with any of them left asserted, the rails drop and then come back
+	 * up. Releasing them here rather than from a separate handler keeps
+	 * the ordering against the I2C write explicit.
+	 */
+	if (rk808->power_hold_gpios) {
+		unsigned int i;
+
+		for (i = 0; i < rk808->power_hold_gpios->ndescs; i++)
+			gpiod_set_value_cansleep(rk808->power_hold_gpios->desc[i], 0);
+
+		msleep(rk808->power_hold_delay_ms);
+	}
+
 	ret = regmap_update_bits(rk808->regmap, reg, bit, bit);
 	if (ret)
 		dev_err(rk808->dev, "Failed to shutdown device!\n");
@@ -766,6 +786,7 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
 	struct rk808 *rk808;
 	const struct rk808_reg_data *pre_init_reg;
 	const struct mfd_cell *cells;
+	bool system_power_controller;
 	int dual_support = 0;
 	int nr_pre_init_regs;
 	u32 rst_fun = 0;
@@ -851,6 +872,29 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
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
+		rk808->power_hold_gpios =
+			devm_gpiod_get_array_optional(dev, "power-hold",
+						      GPIOD_OUT_HIGH);
+		if (IS_ERR(rk808->power_hold_gpios))
+			return dev_err_probe(dev, PTR_ERR(rk808->power_hold_gpios),
+					     "Failed to get power hold GPIOs\n");
+
+		device_property_read_u32(dev, "power-hold-delay-ms",
+					 &rk808->power_hold_delay_ms);
+	}
+
 	ret = devm_regmap_add_irq_chip(dev, rk808->regmap, irq,
 				       IRQF_ONESHOT | dual_support, -1,
 				       rk808->regmap_irq_chip, &rk808->irq_data);
@@ -872,8 +916,7 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to add MFD devices\n");
 
-	if (device_property_read_bool(dev, "system-power-controller") ||
-	    device_property_read_bool(dev, "rockchip,system-power-controller")) {
+	if (system_power_controller) {
 		ret = devm_register_sys_off_handler(dev,
 				    SYS_OFF_MODE_POWER_OFF_PREPARE, SYS_OFF_PRIO_HIGH,
 				    &rk808_power_off, rk808);
diff --git a/include/linux/mfd/rk808.h b/include/linux/mfd/rk808.h
index 7ffc904..eda111e 100644
--- a/include/linux/mfd/rk808.h
+++ b/include/linux/mfd/rk808.h
@@ -1459,6 +1459,8 @@ enum {
 	RK818_ID = 0x8180,
 };
 
+struct gpio_descs;
+
 struct rk808 {
 	struct device			*dev;
 	struct regmap_irq_chip_data	*irq_data;
@@ -1466,6 +1468,8 @@ struct rk808 {
 	long				variant;
 	const struct regmap_config	*regmap_cfg;
 	const struct regmap_irq_chip	*regmap_irq_chip;
+	struct gpio_descs		*power_hold_gpios;
+	u32				power_hold_delay_ms;
 };
 
 void rk8xx_shutdown(struct device *dev);
-- 
2.55.0.windows.3

