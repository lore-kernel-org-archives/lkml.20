Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090751;
	b=UeUzQSwFUGRI7zoEXmi2UUar2cdEo/uAcZtrKFmlU5zyPdWwIv3Vke8XgkYArnzhxJdx
	 fiQAccs4pHt3rvBP6jg+h0MCXvaYUWtI0Fu8OSR05qBsIwhvG+qz4M6M/QXW2Byl9mjuL
	 yEoukHmuZLjxXmRNJqJTEcC+Jq6xiEA2+jbvJT/Denm7r0NorgG6pnsDCysqyOqOlzWI9
	 FAwLNo2v0mjYVgIIMYaltSTxls3x3iNOgcYXGgOy2paZkhYUoEtWZRb1q5wUN95ydnd7K
	 zklV51VHsgyr8lSgaPncDW1Q/5CVQDJj0itzt1EKSe0u3PWzsySPu1QAMqLg3/y4etA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OvmhxSjVHj+d9pk6ymL8DlmUjvcSTE0G8stIvyswo2I=;
	b=SFHXybe5zZc0Ha3C9lh/JnEVbyg69afRJiymZD6KEG+62MxWGnFA0O445OWz0LSRrW55
	 TIn5LfBQxL1s7Kj+tw4lbXCUD2FsXDXHSYIq7aDPquK6Z7+ykXMsvHr86C1yoYDgXkYAR
	 oPqRIFYpwtDXLB5NZLW2ukq7Ec1mLZvIr2XbYSSeuJVoPpy35EFlsHoct+5oqvtOWvDuJ
	 dF/SM7LcagcCX8PryeG6k7kR9w7X0LKt4IHpKqXHLZBXW/YYVoqfpeA59FKYXntvs7JGK
	 jAnJCTn3rMC9uPWjwp5KvNVkNO3N0ZEEN738rmYrAa9onG4ko/cH9Z46HycXZU03Seg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XvfKCyZK;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8FC606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:45:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A8FC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XvfKCyZK
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-886e61fa30fso1597551b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793090750; x=1793695550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OvmhxSjVHj+d9pk6ymL8DlmUjvcSTE0G8stIvyswo2I=;
        b=XvfKCyZKpjWg2HC5OOLO79kNYkA52szq7rFYWAT6nZOX45p/UJb2QdpxgASdqfa6nz
         rDYRbrioZQ36LIy2lLL3XAdHPkP/zfjk09NDPTsNQFMTmZjx6p1rNS8Sosy6Orl5RRp8
         sjcKlaagbPkfPGdk6OlJIbBZcajsDk1ovoGYNsRP1R+Z9sOQr0YSYYWZBENRGTSv7EUV
         1aGhmQKZDzsclqClRMQboHpo1ThDS8bCJhmxBr/Z7CBXu4CxyAQwcjhiIxd1pFFTt9/A
         Ks0kqFo1aSK/XZ4AhyEJpODF6kNOkv3+8A9Q0fHs/3SCpbGoW55PbR1wcoPqcD/RoliZ
         9KpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090750; x=1793695550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OvmhxSjVHj+d9pk6ymL8DlmUjvcSTE0G8stIvyswo2I=;
        b=WlIyAPMSHgqXx6PRMul/mI5MWH5YDi1JGm3Vj7EBSgXjUcwbiJBFwNlA44ERTS4ico
         BRojMZCPXNYZCqyY3nwHxbxovSG4zrGAfV1ZyWBoxk4LdQPerFW+odhzhZ+vtcMlKm/3
         fOo/Yi7T+QmCIFd35RBawBXoYiNObdzmTbR6bcr0TzCTOYght6kd5bg1ti8Xi6j7rdpD
         hhjTHvnhybe25/pg0sZuf9+/8BHKsUxx3vBlRfxc5YHhZ+Bf1T8E2MwsrjSRZ1p0tOXZ
         SwbwTgw06IDRUL4SIZtSrb3SQ3eeDUK85TdbZAlcUStP2aAeJbhwnNUACbUMAd7LayMD
         CybQ==
X-Forwarded-Encrypted: i=1; AKwUvBzG/N1ZFufy5czbDh/aTQnTe4K5c+Fm16Y+67WquWnSYa0gQm0EMUrMAXdsQprMQ0NTtD5yL500QRwSODc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKWZkr3wHVm+h+jkRWqcY/k+2Kby1GVuo9cvzDh0HETVDWjNMs
	1pCmP6HZkiUHgq/8zDKPlPPtVbCfxhdgilcb2rp9w1vJNajhUB7a11H3
X-Gm-Gg: AYBFou3qkg5iD0pgIkB+8nJIqELFyjL2HYlyyz9OvXNYUkFrIlRyxoAX1HRdplKyJBV
	rXjoDfoEv/j35/NlPkS3foKiokaStZmuduRqX4w2IWKeifXRnI4q6JxCA6PHrg+ixf9i5mVCXO9
	7reGaB0uVYRT3/JmUF7IFK41QMaBPXpKMEnU4m/6z7B8Ts1d1pt+6yrwAakZzzsdh4bGbPPYFnw
	q9yH8QzL8tMWXGALUJ+DQjQNQGmrKGN3NkU5B0xawtlVMo/+JS6cJ5ZIQ15USJoH4hmVWs6CvB5
	HCuc7sbVHsT2bYPNwCPEl7ysYM95Egovzpx4pghhbDVZb9MGtcXrglJrtbiHp6Ehn9EGacoehS6
	oEQhQ1m8iRL4YacQCy/Z1hjf9BU26q8oR2GTbMiyyjwcxFWPlSbRge9NFu5QFQvsgrap//atqEK
	XUkECqmat/B9LelnSX4NHE8LFE35sYaPCssnIZmas5c+s0R0pWWd3Vd0cRnRy/Ny97WqU3MMvmX
	lDfOhrotDNhlzEy2dglH3hzKH6EdptYMiMcu4NK7mCif523Ork07uxl+Y1t3brt+/eO
X-Received: by 2002:a05:6a20:ef03:b0:3e2:11bc:6abe with SMTP id adf61e73a8af0-3e7bfa20295mr5839714637.32.1793090750034;
        Tue, 27 Oct 2026 01:45:50 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdad8f2c611sm267581a12.10.2026.10.27.01.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:45:49 -0700 (PDT)
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
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [PATCH v5 2/3] mfd: rk8xx: Release the power hold GPIOs before powering off
Date: Tue, 27 Oct 2026 16:45:08 +0800
Message-ID: <20261027084511.1992-3-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261027084511.1992-1-yaozhonguwl@gmail.com>
References: <20261027084511.1992-1-yaozhonguwl@gmail.com>
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

