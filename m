Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1DB3806B0
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 09:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946096; cv=none; b=dcoOivmnsGYGA76wNR4Hj6o9gJ5Yp8MmGNvxHjXdx1sLlKBCdewBx5i1CEycpd9+X+XPx3qayVE2gwTitEe8lNmIvXtLGoO1dJXrEJLiKq78HGYz4TEl5g8RrX1pzIH3OCPQ7vE+o+y7wBKSlFpskD8TaS38+IMFTIDbCyqFj0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946096; c=relaxed/simple;
	bh=UUhxKqZWnSTmT/Un2Yj1DpmBpGKjhHwwgtjv+edXRAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X3/IJzgpvmurN56aAJK32ziHls+6NRM+bnSX0rfs9dvCe4FL8NZHQYIWi5am10MbCwtq8dDnRXi5+VN8rr1+ZW6RQ+dXbXbomHPAQVn6Hc7uDD9Jbhsq2r4z6LX+hnvFWvzENPA0vNIJ1kpnhwlQl9+ZsBr4OYCxzgidA85z+bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lGkavwCf; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lGkavwCf"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8692be1cda4so115024b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 02:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788946086; x=1789550886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LDCh3/bMgci4uGVV65c5lJe37gL3Ra631LoM+SOniZI=;
        b=lGkavwCfIDU3Gs7voSpZVCEsX7oPWp8dFUjnAbeHekeC23tK8lJhxq7RkhgPXhk4Dw
         QmdUz94JPu+NPyg4lVGEWVCaYp52jkxDSw239IG8Qu1mhDSKaSHLLgP1cwkiZ4ulZuMs
         /pYpVx6PHmdZsqYEYwIfcvSLjs4Cgagx5NwUfQrIMOMhob/YPhAed76hLj+RHMeXOmuR
         GXTRaaMuCl5A8zLOGa9OGjIGO4PCZRG3za5oEBMuPceDU4ZX5U6k/uSccvc4jInpelA7
         Cl7UhTIvLcidiamfi46N2n0zWeqXcyqEyb3OTtHBKbmxE+1GYidkBEA/8C0WoBl90HXt
         kExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788946086; x=1789550886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LDCh3/bMgci4uGVV65c5lJe37gL3Ra631LoM+SOniZI=;
        b=HOHtUSXET6crqMw8WZE8AyY5GZIJ/yCJ76L88ic+YnMScIjOiTG229QYY79vf4bK3I
         q7uf8UJtIyhD3SK6ESUMt6x1TtPn/CA3QUWJlevGX/hu3a3m7VKVxZCkcbZaCiNgN2nU
         1sqblZuR6Gj/0T6Ivx3Z0NljPogd8G8JCkqcRzDkXHHm2vetiSZgzZ2PZkdcd0UX5XwF
         6NihEw4BrVtNt+sGr+9Z0DEwrPov5rJ4Y1mNyTn5SV3muQ48g2cry9Un5oc5k1/L/Tfd
         a0yxOevgu81Qmjh8F8NbY8/pSh2enFoWii5JraRob0vURF6cKpxR/2Vn81MrKW0UtvGd
         UpQA==
X-Forwarded-Encrypted: i=1; AKwUvBxd0DRUmJWlyuMJAv7JsONp83s+yotgl6lWY8xA5/TB/fhvdvqh2Agu75phjM4WVIW99lA5UV67fZZOOMk=@vger.kernel.org
X-Gm-Message-State: AFuF++nirp/sSL58ObWxo0YARkb2H/G1mj8kE/1eqKW+33MNjMizzzJm
	tT8x4nWPa8B5Q51gKH8Gvbm64CGd9xj83bOvonexdgezXuq2WDIvG1daxNTEgPsPMCqIrg==
X-Gm-Gg: AYBFou0AufLd0iYgtfId9IyrQurj6zZDImk+ll8ykmrDHBZIwzkn0w3+J4HqoHRMSSp
	6pOrFUigzmTQ9pFzlrwo0caKScPKv4lyZjUpmQpcocTeKYUZZu4YrIOqdQfGXiuZTj3kNXl6QUQ
	CvOJwBDMzzY491CLK1a/3ptc0UckwEhcrLyRdKo+VnCo2S57RjFKSeqp4u7ANqf6bLtlARpKhXz
	rcQdgAj61ZAdYnX63UXn6dn4HNHquXDF/8A7D3MiU8/mOTxLW7AiNx52tyOytrw4o35Yh/Qz74e
	Odeftsm4AMOjjdsXbmNQISNTNwK5VnuzA6OZWmg7O21sgTM2nEfKu/2Efst8Xs1giKAAQD7g7yK
	TgsCQrNoEvz4uYMSIysOSmf79SQzxxHszEoAdC2uy1uxV5L0Fq3NGNs/RgHqIbKrWVFxUaQib30
	61cWuDFTi3pUEpfCExxbyY/hLfGOvYU7pN/CzDxg+Hu135oeGB2f105FU7Gsp35KcvetLoWEwjF
	9da/7I4ez6u
X-Received: by 2002:a05:6a00:4388:b0:857:7317:cff2 with SMTP id d2e1a72fcca58-8616a266f1bmr50402873b3a.19.1788946086204;
        Wed, 09 Sep 2026 02:28:06 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-868e3aaab85sm484904b3a.22.2026.09.09.02.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 02:28:05 -0700 (PDT)
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
Subject: [RFC PATCH 2/3] mfd: rk8xx: release the power hold GPIOs before powering off
Date: Wed,  9 Sep 2026 17:27:27 +0800
Message-ID: <20260909092728.1859-3-yaozhonguwl@gmail.com>
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

rk808_power_off() writes the PMIC's shutdown bit directly. On boards with
"power hold" lines driven by the SoC, a shutdown performed this way does
not stick: the rails drop and immediately come back up, so the board
restarts instead of staying off. U-Boot reports the result as a power-on
reset.

Take those lines as an optional GPIO array, hold them asserted while the
system runs and release them - waiting power-hold-delay-ms - before
writing the shutdown bit. Device trees without the property retain the
existing behaviour.

Releasing every described line matters: on a Firefly-RK3399 the board
stays off when both lines described for it are released, whereas releasing
GPIO1_D0 while GPIO1_B5 is left asserted makes it come back up.

Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
 drivers/mfd/rk8xx-core.c  | 29 +++++++++++++++++++++++++++++
 include/linux/mfd/rk808.h |  4 ++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/mfd/rk8xx-core.c b/drivers/mfd/rk8xx-core.c
index 3dcf6ab..fd1efbb 100644
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
@@ -874,6 +894,15 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
 
 	if (device_property_read_bool(dev, "system-power-controller") ||
 	    device_property_read_bool(dev, "rockchip,system-power-controller")) {
+		rk808->power_hold_gpios = devm_gpiod_get_array_optional(dev,
+							"power-hold", GPIOD_OUT_HIGH);
+		if (IS_ERR(rk808->power_hold_gpios))
+			return dev_err_probe(dev, PTR_ERR(rk808->power_hold_gpios),
+					     "failed to get power hold GPIOs\n");
+
+		device_property_read_u32(dev, "power-hold-delay-ms",
+					 &rk808->power_hold_delay_ms);
+
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

