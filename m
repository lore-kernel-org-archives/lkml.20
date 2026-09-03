Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66083501F5B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 20:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788466210; cv=none; b=F1L7bt7GMHOcr9F/QM7knoM2cRPFyMvmK3Iqc+G9t0v0ooKCa4QkWkoxATJVhxpAAJgaj9uvYiv6lZmyAebU2/CRE/3H0AQjdy3m39+95n052xGijR8ZE+za4UtntUrfcSa1jwJrwFYwArTHY95jJZ7/EUaU9wb09VuCBPXJTYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788466210; c=relaxed/simple;
	bh=EsDOJ0cNSYW7sXQZ77r0mY6GpFlyh6wTRO3okImB9VI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DUCrrpB2D30V6XbscBqMHyg/FpoS37z7GVzLZkL+TmItES3eLvQtc0OJ4h4xv1xoHorKL5Cux6WgCMOIELdPh2CzXy9KNWPO+yWoGmoqs0T1JXXpFC+hml+QWI1EG29k8i5saxQK6cH7P/OPFHDvGVopt1BI8gfuQHaejjXGNZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Llg930U2; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Llg930U2"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4b28df1f600so206163b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 13:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788466196; x=1789070996; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=amt0kuMl9qCLLKww37f3Z87aRc1WA5oYLF+FoLpW7xg=;
        b=Llg930U25Fn9PB1pLaypZSguelk3/0Su4V+BnIlJaAoOULGKjn68Hd3SBKUMjGAMKp
         lix/WXYlkuBkYFIkh7EeEnHK0x9RP6TIPXL4lWUiHLvmdNyYf1804WwlJVrX0Y53sH4e
         MP3JFFMXEt9sgYnc4xgvX7XcCPaBq0lGf/VIhjUZjlOuirbLtRP7pAVWEnqppCQD/+UC
         36KMsPN9WnZ7MkjnJE6pItee37PR3FQLjFugBx04c+c2Fp1zM3zNBkiRUB+IGGgOz71+
         dYhSVOgoTJJdWDYM0fC22tu6Qsr4JFzcbl8ssgXBvbwS9/ubAy0ciX25pBV/2RBO4MJ2
         tLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788466196; x=1789070996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=amt0kuMl9qCLLKww37f3Z87aRc1WA5oYLF+FoLpW7xg=;
        b=Yut9Eg1eFEFXhTwNyRRyR3xfSu27qRSjpIiZ5MbGVPzftpurtd7tTlXgMOXpAm3tx6
         HQ9rVSqh8zjSytLdlEOeBawTHS+TVUaMtrdQ+/GrEfR8VYmAFjJdkGFRrBLNkAHoMnSq
         Hwjsc4r9EZfdRTp7ISqEYTqiePT6FRqhSwE+TPBS2oIJLVEqJkxE25yDnUKZNnQpz3xj
         jp8DSn2O45nJ2E4c9f5UNCbsE4yzfloLgTtp6f3ZdJBY40Wy007i4g193m28CoVaWUAd
         MYbtiJDjC6TnPYTnVLvp2dDs45DEmBrVayRkqtzPWfMbj8HHShrVLh5N7NdmdOdXy3bw
         C86w==
X-Forwarded-Encrypted: i=1; AKwUvBzPlOlx+Qs8cGAz6YzlBSJ4BSC31mwAzLWEhfV7qIdnHA4qYQkQVqmMeMRfRoe5zFPOUaVemDemPAVQu6Q=@vger.kernel.org
X-Gm-Message-State: AFuF++kNzYm7PAFtXngE9VJpm4N60HUCraks/lwZX+revFxa8l+dQUno
	OJLRz5sZN1L8ZBCRPgOhzzTa/wf6UEvHbMbRWQBtf0iuoGWwfdYdEOV9
X-Gm-Gg: AYBFou1F+TGDvBTIhdkXNudWBJJxHr6OeVVGlQzdzqHZxZWgHXUVN6P4A9IRiwLNA7l
	VxUFEm4YF7aLHik0m0q1sLA7mXGZ4iA7KYIB0WFWxKUqLWjFhrQ94fcEEob197CmGfHkOkMWJ3s
	rgdSyK6ywCBa+fHlCYRmY0lfFyOhQdRqxbAgN4lw/plDobd/ysSSN/69zd4XfNYO5ciPuhT6CJM
	WCb3le4WdAy7XeaI4gLKbhE7zfTfBROqmtt4Kabj5G39W/3IjBEV4mKkVpqVyvIZQjkqXZNLunw
	0tTCV8YcZRP+zBtXcTnIdr8P510JyzoC35/FXHLZPuzL1M6guWtjkvwZNgSwtK4zf7gzpK1fNGQ
	gS/hA5twmI1e5PuKRpY7J2hDXTxrYNZJiZDJVeYWkz7a8Lcfj9RhIo39GIe4YM8G15lz6YcveZR
	c7jJfgCJRl7X6Vp9ha1WHMT3MwSjWFcQQQGK9GVmYNopVb7ZHmBojQStTcGQtUt1uEiCZiZyHM7
	qOnbUjfwTw41ubhOfenvP1o4NIVg26M11eG6MlDE/sCIRB0jYQkC2yJo2gJfTafxa1pMZuT/VFM
	cL6G2Ezcrx/ZdmPPdyi7epSn8urJJMwDHm1x7pSwjA4It76CK4OENVNzPNQVz2D7jNnT7Spon8T
	tOu3w4TFlM/389AWP064/jZ+pPPJxeQ==
X-Received: by 2002:a05:6808:1445:b0:4b3:880a:f07f with SMTP id 5614622812f47-4b95fb4ebcamr1040808b6e.1.1788466196555;
        Thu, 03 Sep 2026 13:09:56 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b971246d9csm252885b6e.7.2026.09.03.13.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 13:09:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 03 Sep 2026 14:09:43 -0600
Subject: [PATCH v9 4/4] mfd: ac200: Add codec and TV encoder cells
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-submit-ac200-mfd-v9-4-6b7ed278989c@gmail.com>
References: <20260903-submit-ac200-mfd-v9-0-6b7ed278989c@gmail.com>
In-Reply-To: <20260903-submit-ac200-mfd-v9-0-6b7ed278989c@gmail.com>
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, 
 "Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, 
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, 
 mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

From: Jernej Skrabec <jernej.skrabec@gmail.com>

Register the AC200 audio codec and TV encoder as MFD cells when their
enabled child nodes are present. Filtering the cell list avoids creating
unused platform devices, or warnings about missing firmware nodes, on
boards which use only the separately enumerated MDIO PHY.

Add a regmap IRQ controller for the shared level-triggered INTB output so
the TV encoder can consume its cable-detection interrupt. The source
function remains responsible for clearing its interrupt condition.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mfd/Kconfig |   5 ++-
 drivers/mfd/ac200.c | 119 +++++++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 122 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 6dea35c8c18e..5193c6f71bd8 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -210,12 +210,15 @@ config MFD_AC200
 	depends on COMMON_CLK
 	depends on I2C
 	depends on OF
+	select MFD_CORE
 	select REGMAP_I2C
+	select REGMAP_IRQ
 	help
 	  Support for the X-Powers AC200 mixed-signal companion IC. The AC200
 	  contains audio, video, RTC and Fast Ethernet PHY functions and is
 	  co-packaged with some Allwinner H6 and H616 SoCs. This driver provides
-	  the shared register access used by the individual function drivers.
+	  the shared register access and instantiates the individual function
+	  devices.
 
 config MFD_AXP20X
 	tristate
diff --git a/drivers/mfd/ac200.c b/drivers/mfd/ac200.c
index 94aa13deb0f8..f7d818141d9c 100644
--- a/drivers/mfd/ac200.c
+++ b/drivers/mfd/ac200.c
@@ -9,11 +9,24 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/mfd/core.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/regmap.h>
 
+#include <dt-bindings/mfd/x-powers,ac200.h>
+
 #define AC200_SYS_CONTROL_REG			0x0002
 #define AC200_SYS_CONTROL_CHIP_RESET_DEASSERT	BIT(0)
+#define AC200_SYS_IRQ_ENABLE_REG		0x0004
+#define AC200_SYS_IRQ_INTB_ENABLE		BIT(15)
+#define AC200_SYS_IRQ_INTB_ACTIVE_HIGH		BIT(14)
+#define AC200_SYS_IRQ_RTC			BIT(12)
+#define AC200_SYS_IRQ_EPHY			BIT(8)
+#define AC200_SYS_IRQ_TVE			BIT(4)
+#define AC200_SYS_IRQ_STATUS_REG		0x0006
 
 /* Interface register accessible from every register page. */
 #define AC200_TWI_REG_ADDR_H	0x00fe
@@ -51,6 +64,103 @@ static const struct regmap_config ac200_regmap_config = {
 	.cache_type = REGCACHE_MAPLE,
 };
 
+static const struct regmap_irq ac200_irqs[] = {
+	REGMAP_IRQ_REG(AC200_IRQ_TVE, 0, AC200_SYS_IRQ_TVE),
+	REGMAP_IRQ_REG(AC200_IRQ_EPHY, 0, AC200_SYS_IRQ_EPHY),
+	REGMAP_IRQ_REG(AC200_IRQ_RTC, 0, AC200_SYS_IRQ_RTC),
+};
+
+/*
+ * SYS_IRQ_ENABLE is an enable register rather than a mask register, hence
+ * unmask_base. SYS_IRQ_STATUS reflects the source levels, so the function
+ * which raised an interrupt is responsible for clearing it.
+ */
+static const struct regmap_irq_chip ac200_irq_chip = {
+	.name = "ac200",
+	.status_base = AC200_SYS_IRQ_STATUS_REG,
+	.unmask_base = AC200_SYS_IRQ_ENABLE_REG,
+	.num_regs = 1,
+	.irqs = ac200_irqs,
+	.num_irqs = ARRAY_SIZE(ac200_irqs),
+};
+
+static const struct mfd_cell ac200_cells[] = {
+	{
+		.name = "ac200-codec",
+		.of_compatible = "x-powers,ac200-codec",
+	}, {
+		.name = "ac200-tve",
+		.of_compatible = "x-powers,ac200-tve",
+	},
+};
+
+static int ac200_init_irq(struct device *dev, struct regmap *regmap, int irq)
+{
+	struct regmap_irq_chip_data *irq_data;
+	unsigned int trigger;
+	u16 value = AC200_SYS_IRQ_INTB_ENABLE;
+	int ret;
+
+	trigger = irq_get_trigger_type(irq);
+	switch (trigger) {
+	case IRQ_TYPE_LEVEL_HIGH:
+		value |= AC200_SYS_IRQ_INTB_ACTIVE_HIGH;
+		break;
+	case IRQ_TYPE_NONE:
+	case IRQ_TYPE_LEVEL_LOW:
+		break;
+	default:
+		return dev_err_probe(dev, -EINVAL,
+				     "INTB is level triggered, not type %u\n",
+				     trigger);
+	}
+
+	ret = regmap_update_bits(regmap, AC200_SYS_IRQ_ENABLE_REG,
+				 AC200_SYS_IRQ_INTB_ENABLE |
+				 AC200_SYS_IRQ_INTB_ACTIVE_HIGH, value);
+	if (ret)
+		return ret;
+
+	ret = devm_regmap_add_irq_chip(dev, regmap, irq, IRQF_ONESHOT, 0,
+				       &ac200_irq_chip, &irq_data);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add IRQ chip\n");
+
+	return 0;
+}
+
+static int ac200_add_devices(struct device *dev)
+{
+	struct mfd_cell cells[ARRAY_SIZE(ac200_cells)];
+	unsigned int num_cells = 0;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < ARRAY_SIZE(ac200_cells); i++) {
+		const struct mfd_cell *cell = &ac200_cells[i];
+		struct device_node *child;
+
+		child = of_get_compatible_child(dev->of_node,
+						cell->of_compatible);
+		if (!child)
+			continue;
+		if (of_device_is_available(child))
+			cells[num_cells++] = *cell;
+		of_node_put(child);
+	}
+
+	if (!num_cells)
+		return 0;
+
+	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE, cells, num_cells,
+				   NULL, 0, NULL);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to add function devices\n");
+
+	return 0;
+}
+
 static int ac200_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -83,7 +193,13 @@ static int ac200_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	return 0;
+	if (client->irq > 0) {
+		ret = ac200_init_irq(dev, regmap, client->irq);
+		if (ret)
+			return ret;
+	}
+
+	return ac200_add_devices(dev);
 }
 
 static const struct of_device_id ac200_of_match[] = {
@@ -108,6 +224,7 @@ static struct i2c_driver ac200_driver = {
 };
 module_i2c_driver(ac200_driver);
 
+MODULE_AUTHOR("Jernej Skrabec <jernej.skrabec@gmail.com>");
 MODULE_AUTHOR("James Hilliard <james.hilliard1@gmail.com>");
 MODULE_DESCRIPTION("X-Powers AC200 MFD core driver");
 MODULE_LICENSE("GPL");

-- 
2.53.0

