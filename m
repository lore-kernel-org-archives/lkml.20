Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A18348C4B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789355970; cv=none; b=ZdWLpPjhEjFWG3VwVxdEQnjO7xtOSQZ7nsGv1I9jFKbzjyeHgiI7LPvZZUayOoW7UfwCazWfU4yurKBjMaPhOpqYVcXeTT3BlMGCSgkegJ1lGlrR54EasfdYXtrEdXlKIpqEamWY+1n3a16h6RZPnihauN5M6YymwAodpgwRvB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789355970; c=relaxed/simple;
	bh=1BxE5gIGu1prh9otjFD2YEZ87CHMHskKJ5D9eLd1z1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ctlDzepzgkFOtjzk5HUqbd7z2+vHb8Wmq6UKaEg7CPuLLZbpFNwQmlmVNIm4oI37UAQtKFOg3DQT9Qc4+gGiSn7mR9UCeRg10tBxwaXGAK+0lX7THEddE/q1JsmgQjVEFDqKlt6lk/WIDW6Zjh97ZTzmHcSRQbQLlVTR1EOzr14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GAmi70Rr; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GAmi70Rr"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d8fb334ddcso16654735ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789355957; x=1789960757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OtN5FPSKCGNs5pMa1pYq9igP2vP81fNP/piE94f5ogU=;
        b=GAmi70RrKmsf6u+TjrqWwamH9NQMWYUHTGvyv5Nde0jUdyNZYkfd2hNGjueP8rWJ/f
         Lf7qfYu5mBT4GVQWwiDNoeo1gqYgdL2gL+vJhvoU9oToxsQhUDndB/0bYrIKV+lGTFY1
         l+E0gy6xg92NNnYl0r4QBff+8QUmz8PPTAGu6lnlFikqsfzP3Lz9oF0VvMroxplozSAj
         pQNxcqDzWZI5e9i4IfqjbCyNvAaXVedw3xyQB4zYh2eQ1GehS44vFRWQ5DY1NM+7iToG
         sFqMSphv7IYuzCLoqSIfqAED6AZu7AWX/JsAHhsUy8eGmxU7ppu30xWM7uEDZ293PoiN
         C5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789355957; x=1789960757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OtN5FPSKCGNs5pMa1pYq9igP2vP81fNP/piE94f5ogU=;
        b=QT2A/5CpdhUShELCAPSwt/WK/6/bGFPX1TK9JXSBTjPDg1W5n8FF8gMAg4dtdI2uMl
         PafHRMNzsn2pTWfyhZ7jGRO49M9CdjdbhbAIF00n142L4O3agAcRB8wIH4JJ6DhRpMaL
         YuBJfnodUMX9V8qp55wVTw/QJw7cDjs0t6tUMh+OUXZ8iV05KL3Iw6grLnqDhwtgj2Zz
         EgFzfdgCVSzuYXwWwo2QZkpo/8n/cmrJXpaeASGu6roaJqfOHcz2P8BmiBjGr67Zj+6Z
         ezBFq/cRUCh/tEPepUMg6QgaMoTOgpWxr2/4s00P6YDpy/stht6ct6tlkYsUrvbkF3Cc
         ayRQ==
X-Forwarded-Encrypted: i=1; AKwUvByiqPkpBTfZCRvLWRFktU6O6WXMmt+EqBpUYuHEUBIUjVLBcZ/pYN3UXcUlPw2OOH/5ST87lwxvjonZoqY=@vger.kernel.org
X-Gm-Message-State: AFuF++mxsE5Vl+UWgdCTvFxOLx/KiDxZs6mLF4AAhbOWrTlvG/SEXxI6
	dxBg6tMJ6fKwnARs0h+bhp6KB3frK9S+3ND91hcUZxxq8lN8mMrks+uqgR4YSg==
X-Gm-Gg: AYBFou3iu3a2/mjNL9R9/v0o8iadhLdYw8D4CAykpP8SFKrJcJU0MymmyJZqDIlHNiD
	5C0gg4ObtLqmjM3zRflLDlIrjxtAR20htxc761fx+LgjW0scMhrAoqEDr0YRGCwI6Qn75E+83RY
	4bQwt+QH3N3jLLRwR7wEtAVSGDv+xi/7nTmpB27ckjj1bAEqaLRC+DNyP0MxH8PCqABKA+qPEH8
	VqXoWbCFhlRuRRnVwNxhf5/p/h6Sc3PptAv5zCBoUwywL1i1PtqdvYK2D5nT92bmqRiD8of0V6r
	jLdk/MctmQLe2tvgLNvxgu/zYP1UF8dl2I5yyhBxewFLWrXdIgHosUHAy1qmkQu+PP+EPFGcrFX
	N7bcsunGlSWVdzsJlP1anWweyeIRl2fW4gYLTxCvnkQuhXH8HnatSJCBgicQvMQwhD9dMQDcuc2
	b1EVKWEoKQEX6AfLORlIa/C8fHO6YuZmHYxwq0LqJEal4utepp/d5uYOVU5hQdQ4TpEKyCZWMvV
	jSiOf3+wsEcv7ApJoXBxbpipLE5upPUP6zFt+wnIFlcuHnFGFE7erOCMoIP9e4=
X-Received: by 2002:a17:903:2cd:b0:2c9:bf82:dd11 with SMTP id d9443c01a7336-2dd6c5d60f0mr16116055ad.7.1789355957164;
        Sun, 13 Sep 2026 20:19:17 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfc2d3bsm41355145ad.48.2026.09.13.20.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:19:16 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	Joey Lu <yclu4@nuvoton.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v5 3/3] phy: nuvoton: phy-ma35d1-usb2: extend to dual-port with OTG support
Date: Mon, 14 Sep 2026 11:18:59 +0800
Message-ID: <20260914031859.385224-4-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914031859.385224-1-a0987203069@gmail.com>
References: <20260914031859.385224-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PHY0 and PHY1 use the same power-on/reset sequence in USBPMISCR, with
PHY1 control bits shifted 16 positions relative to PHY0.  A separate
driver for PHY1 would duplicate this logic, so the existing driver is
extended to manage both ports.

The original driver polled only DEVCKSTB after releasing PHY0 from
reset.  When USB0 operates in host mode (USB ID pin floating or tied
high) only HSTCKSTB and CK12MSTB assert; DEVCKSTB never sets.  Polling
exclusively for DEVCKSTB in host mode causes a 1 ms timeout on every
phy_init() call from the EHCI driver.  The init callback is changed to
accept either host-mode or device-mode clock stability, whichever
asserts first.

The power_on and power_off callbacks are replaced by a single init
callback that handles PHY reset and clock-stable polling, because
there is no PHY-specific clock gate on MA35D1; the PHY analog block
derives its reference from the HXT crystal.

A read-only USB role switch is registered for PHY0 to expose the USB0
role to userspace via the standard role-switch sysfs interface.  The
.set callback returns -EOPNOTSUPP because the hardware mux is fully
automatic with no software override path.  When CONFIG_USB_ROLE_SWITCH
is not enabled, the registration returns -ENODEV and the driver skips
the role switch gracefully without failing probe.

Two new optional device-tree properties are implemented:
  - nuvoton,rcalcode: writes per-port 4-bit resistor calibration trim
    codes to the RCALCODE field in USBPMISCR.
  - nuvoton,oc-active-high: sets the UHOVRCURH bit in MISCFCR0 to treat
    the over-current detect input as active-high.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/phy/nuvoton/phy-ma35d1-usb2.c | 284 +++++++++++++++++++-------
 1 file changed, 210 insertions(+), 74 deletions(-)

diff --git a/drivers/phy/nuvoton/phy-ma35d1-usb2.c b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
index 9a459b700ed4..2c60be0ee50f 100644
--- a/drivers/phy/nuvoton/phy-ma35d1-usb2.c
+++ b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
@@ -1,11 +1,16 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (C) 2024 Nuvoton Technology Corp.
+ * Nuvoton MA35D1 USB 2.0 PHY driver
+ *
+ * Supports PHY0 (USB0 OTG port, shared between DWC2 gadget and EHCI0/OHCI0)
+ * and PHY1 (USB1 host-only port, used by EHCI1/OHCI1). The hardware mux on
+ * PHY0 switches automatically via the USB ID pin.
+ *
+ * Copyright (C) 2026 Nuvoton Technology Corp.
  */
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
@@ -13,131 +18,262 @@
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/usb/role.h>
 
-/* USB PHY Miscellaneous Control Register */
-#define MA35_SYS_REG_USBPMISCR	0x60
-#define PHY0POR			BIT(0)  /* PHY Power-On Reset Control Bit */
-#define PHY0SUSPEND			BIT(1)  /* PHY Suspend; 0: suspend, 1: operaion */
-#define PHY0COMN			BIT(2)  /* PHY Common Block Power-Down Control */
-#define PHY0DEVCKSTB			BIT(10) /* PHY 60 MHz UTMI clock stable bit */
+#define MA35_SYS_PWRONOTP		0x04
+#define PWRONOTP_USBP0ID		BIT(16)
+
+#define MA35_SYS_USBPMISCR		0x60
+#define USBPMISCR_PHY_POR(n)		BIT(0  + (n) * 16)
+#define USBPMISCR_PHY_SUSPEND(n)	BIT(1  + (n) * 16)
+#define USBPMISCR_PHY_COMN(n)		BIT(2  + (n) * 16)
+#define USBPMISCR_PHY_HSTCKSTB(n)	BIT(8  + (n) * 16)
+#define USBPMISCR_PHY_CK12MSTB(n)	BIT(9  + (n) * 16)
+#define USBPMISCR_PHY_DEVCKSTB(n)	BIT(10 + (n) * 16)
+/* Mask for control bits (POR, SUSPEND, COMN) */
+#define USBPMISCR_PHY_CTL_MASK(n)	(0x7u << ((n) * 16))
+/* Host-mode ready */
+#define USBPMISCR_PHY_HOST_READY(n)	(USBPMISCR_PHY_SUSPEND(n)  | \
+					 USBPMISCR_PHY_HSTCKSTB(n) | \
+					 USBPMISCR_PHY_CK12MSTB(n))
+/* Device-mode ready */
+#define USBPMISCR_PHY_DEV_READY(n)	(USBPMISCR_PHY_SUSPEND(n)  | \
+					 USBPMISCR_PHY_DEVCKSTB(n))
+/* RCALCODE: 4-bit resistor trim */
+#define USBPMISCR_RCAL_SHIFT(n)		(12 + (n) * 16)
+#define USBPMISCR_RCAL_MASK(n)		GENMASK(USBPMISCR_RCAL_SHIFT(n) + 3, \
+						USBPMISCR_RCAL_SHIFT(n))
+
+#define MA35_SYS_MISCFCR0		0x70
+/* USB host over-current detect polarity (shared, both ports) */
+#define MISCFCR0_UHOVRCURH		BIT(12)
+
+#define MA35_PHY_NUM			2
+
+struct ma35_phy_port {
+	struct phy *phy;
+	unsigned int idx;
+};
 
 struct ma35_usb_phy {
-	struct clk *clk;
 	struct device *dev;
 	struct regmap *sysreg;
+	struct ma35_phy_port port[MA35_PHY_NUM];
+	struct usb_role_switch *role_sw;
 };
 
-static int ma35_usb_phy_power_on(struct phy *phy)
+static int ma35_usb_phy_init(struct phy *phy)
 {
-	struct ma35_usb_phy *p_phy = phy_get_drvdata(phy);
+	struct ma35_phy_port *port = phy_get_drvdata(phy);
+	struct ma35_usb_phy *p = container_of(port - port->idx,
+					      struct ma35_usb_phy, port[0]);
+	unsigned int n = port->idx;
 	unsigned int val;
 	int ret;
 
-	ret = clk_prepare_enable(p_phy->clk);
-	if (ret < 0) {
-		dev_err(p_phy->dev, "Failed to enable PHY clock: %d\n", ret);
-		return ret;
-	}
+	regmap_read(p->sysreg, MA35_SYS_USBPMISCR, &val);
 
-	regmap_read(p_phy->sysreg, MA35_SYS_REG_USBPMISCR, &val);
-	if (val & PHY0SUSPEND) {
-		/*
-		 * USB PHY0 is in operation mode already
-		 * make sure USB PHY 60 MHz UTMI Interface Clock ready
-		 */
-		ret = regmap_read_poll_timeout(p_phy->sysreg, MA35_SYS_REG_USBPMISCR, val,
-						val & PHY0DEVCKSTB, 10, 1000);
-		if (ret == 0)
-			return 0;
-	}
+	if (val & USBPMISCR_PHY_SUSPEND(n))
+		return 0;
 
-	/*
-	 * reset USB PHY0.
-	 * wait until USB PHY0 60 MHz UTMI Interface Clock ready
-	 */
-	regmap_update_bits(p_phy->sysreg, MA35_SYS_REG_USBPMISCR, 0x7, (PHY0POR | PHY0SUSPEND));
+	regmap_update_bits(p->sysreg, MA35_SYS_USBPMISCR,
+			   USBPMISCR_PHY_CTL_MASK(n),
+			   USBPMISCR_PHY_POR(n) | USBPMISCR_PHY_SUSPEND(n));
 	udelay(20);
 
-	/* make USB PHY0 enter operation mode */
-	regmap_update_bits(p_phy->sysreg, MA35_SYS_REG_USBPMISCR, 0x7, PHY0SUSPEND);
+	regmap_update_bits(p->sysreg, MA35_SYS_USBPMISCR,
+			   USBPMISCR_PHY_CTL_MASK(n),
+			   USBPMISCR_PHY_SUSPEND(n));
 
-	/* make sure USB PHY 60 MHz UTMI Interface Clock ready */
-	ret = regmap_read_poll_timeout(p_phy->sysreg, MA35_SYS_REG_USBPMISCR, val,
-					val & PHY0DEVCKSTB, 10, 1000);
-	if (ret == -ETIMEDOUT) {
-		dev_err(p_phy->dev, "Check PHY clock, Timeout: %d\n", ret);
-		clk_disable_unprepare(p_phy->clk);
+	if (n == 0) {
+		ret = regmap_read_poll_timeout(p->sysreg, MA35_SYS_USBPMISCR,
+					       val,
+					       ((val & USBPMISCR_PHY_HOST_READY(0)) ==
+						USBPMISCR_PHY_HOST_READY(0)) ||
+					       ((val & USBPMISCR_PHY_DEV_READY(0)) ==
+						USBPMISCR_PHY_DEV_READY(0)),
+					       10, 1000);
+	} else {
+		ret = regmap_read_poll_timeout(p->sysreg, MA35_SYS_USBPMISCR,
+					       val,
+					       (val & USBPMISCR_PHY_HOST_READY(n)) ==
+					       USBPMISCR_PHY_HOST_READY(n),
+					       10, 1000);
+	}
+
+	if (ret) {
+		dev_err(p->dev, "USB PHY%u clock not stable (USBPMISCR=0x%08x)\n",
+			n, val);
 		return ret;
 	}
 
 	return 0;
 }
 
-static int ma35_usb_phy_power_off(struct phy *phy)
+static const struct phy_ops ma35_usb_phy_ops = {
+	.init		= ma35_usb_phy_init,
+	.owner		= THIS_MODULE,
+};
+
+static int ma35_role_sw_set(struct usb_role_switch *sw, enum usb_role role)
+{
+	return -EOPNOTSUPP;
+}
+
+static enum usb_role ma35_role_sw_get(struct usb_role_switch *sw)
+{
+	struct ma35_usb_phy *p = usb_role_switch_get_drvdata(sw);
+	u32 val;
+
+	regmap_read(p->sysreg, MA35_SYS_PWRONOTP, &val);
+
+	return (val & PWRONOTP_USBP0ID) ? USB_ROLE_HOST : USB_ROLE_DEVICE;
+}
+
+static int ma35_role_switch_init(struct platform_device *pdev,
+				 struct ma35_usb_phy *p)
 {
-	struct ma35_usb_phy *p_phy = phy_get_drvdata(phy);
+	struct usb_role_switch_desc sw_desc = {0};
+
+	sw_desc.set = ma35_role_sw_set;
+	sw_desc.get = ma35_role_sw_get;
+	sw_desc.allow_userspace_control = true;
+	sw_desc.driver_data = p;
+	sw_desc.fwnode = dev_fwnode(&pdev->dev);
+
+	p->role_sw = usb_role_switch_register(&pdev->dev, &sw_desc);
+	if (IS_ERR(p->role_sw)) {
+		if (PTR_ERR(p->role_sw) == -ENODEV) {
+			p->role_sw = NULL;
+			return 0;
+		}
+		return dev_err_probe(&pdev->dev, PTR_ERR(p->role_sw),
+				     "failed to register role switch\n");
+	}
 
-	clk_disable_unprepare(p_phy->clk);
 	return 0;
 }
 
-static const struct phy_ops ma35_usb_phy_ops = {
-	.power_on = ma35_usb_phy_power_on,
-	.power_off = ma35_usb_phy_power_off,
-	.owner = THIS_MODULE,
-};
+static void ma35_role_switch_exit(struct ma35_usb_phy *p)
+{
+	if (p->role_sw) {
+		usb_role_switch_unregister(p->role_sw);
+		p->role_sw = NULL;
+	}
+}
+
+static struct phy *ma35_usb_phy_xlate(struct device *dev,
+				      const struct of_phandle_args *args)
+{
+	struct ma35_usb_phy *p = dev_get_drvdata(dev);
+	unsigned int idx;
+
+	if (args->args_count == 0)
+		idx = 0;
+	else
+		idx = args->args[0];
+
+	if (idx >= MA35_PHY_NUM)
+		return ERR_PTR(-EINVAL);
+
+	return p->port[idx].phy;
+}
 
 static int ma35_usb_phy_probe(struct platform_device *pdev)
 {
 	struct phy_provider *provider;
-	struct ma35_usb_phy *p_phy;
-	struct phy *phy;
+	struct ma35_usb_phy *p;
+	struct clk *clk;
+	int n, ret;
+	u32 code;
 
-	p_phy = devm_kzalloc(&pdev->dev, sizeof(*p_phy), GFP_KERNEL);
-	if (!p_phy)
+	p = devm_kzalloc(&pdev->dev, sizeof(*p), GFP_KERNEL);
+	if (!p)
 		return -ENOMEM;
 
-	p_phy->dev = &pdev->dev;
-	platform_set_drvdata(pdev, p_phy);
+	p->dev = &pdev->dev;
+	platform_set_drvdata(pdev, p);
+
+	p->sysreg = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
+						     "nuvoton,sys");
+	if (IS_ERR(p->sysreg))
+		return dev_err_probe(&pdev->dev, PTR_ERR(p->sysreg),
+				     "failed to get SYS regmap\n");
 
-	p_phy->sysreg = syscon_regmap_lookup_by_phandle(pdev->dev.of_node, "nuvoton,sys");
-	if (IS_ERR(p_phy->sysreg))
-		return dev_err_probe(&pdev->dev, PTR_ERR(p_phy->sysreg),
-				     "Failed to get SYS registers\n");
+	clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(clk),
+				     "failed to get clock\n");
 
-	p_phy->clk = of_clk_get(pdev->dev.of_node, 0);
-	if (IS_ERR(p_phy->clk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(p_phy->clk),
-				     "failed to find usb_phy clock\n");
+	for (n = 0; n < MA35_PHY_NUM; n++) {
+		if (of_property_read_u32_index(pdev->dev.of_node,
+					       "nuvoton,rcalcode", n, &code))
+			continue;
 
-	phy = devm_phy_create(&pdev->dev, NULL, &ma35_usb_phy_ops);
-	if (IS_ERR(phy))
-		return dev_err_probe(&pdev->dev, PTR_ERR(phy), "Failed to create PHY\n");
+		if (code > 15)
+			return dev_err_probe(&pdev->dev, -EINVAL,
+					     "rcalcode[%d] %u out of range (0-15)\n",
+					     n, code);
 
-	phy_set_drvdata(phy, p_phy);
+		regmap_update_bits(p->sysreg, MA35_SYS_USBPMISCR,
+				   USBPMISCR_RCAL_MASK(n),
+				   code << USBPMISCR_RCAL_SHIFT(n));
+	}
+
+	if (of_property_read_bool(pdev->dev.of_node, "nuvoton,oc-active-high"))
+		regmap_update_bits(p->sysreg, MA35_SYS_MISCFCR0,
+				   MISCFCR0_UHOVRCURH, MISCFCR0_UHOVRCURH);
+
+	for (n = 0; n < MA35_PHY_NUM; n++) {
+		p->port[n].idx = n;
+
+		p->port[n].phy = devm_phy_create(&pdev->dev, pdev->dev.of_node,
+						 &ma35_usb_phy_ops);
+		if (IS_ERR(p->port[n].phy))
+			return dev_err_probe(&pdev->dev, PTR_ERR(p->port[n].phy),
+					     "failed to create PHY%d\n", n);
+
+		phy_set_drvdata(p->port[n].phy, &p->port[n]);
+	}
+
+	ret = ma35_role_switch_init(pdev, p);
+	if (ret)
+		return ret;
 
-	provider = devm_of_phy_provider_register(&pdev->dev, of_phy_simple_xlate);
-	if (IS_ERR(provider))
+	provider = devm_of_phy_provider_register(&pdev->dev, ma35_usb_phy_xlate);
+	if (IS_ERR(provider)) {
+		ma35_role_switch_exit(p);
 		return dev_err_probe(&pdev->dev, PTR_ERR(provider),
-				     "Failed to register PHY provider\n");
+				     "failed to register PHY provider\n");
+	}
+
 	return 0;
 }
 
+static void ma35_usb_phy_remove(struct platform_device *pdev)
+{
+	struct ma35_usb_phy *p = platform_get_drvdata(pdev);
+
+	ma35_role_switch_exit(p);
+}
+
 static const struct of_device_id ma35_usb_phy_of_match[] = {
-	{ .compatible = "nuvoton,ma35d1-usb2-phy", },
-	{ },
+	{ .compatible = "nuvoton,ma35d1-usb2-phy" },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ma35_usb_phy_of_match);
 
 static struct platform_driver ma35_usb_phy_driver = {
 	.probe		= ma35_usb_phy_probe,
-	.driver	= {
-		.name	= "ma35d1-usb2-phy",
-		.of_match_table = ma35_usb_phy_of_match,
+	.remove		= ma35_usb_phy_remove,
+	.driver		= {
+		.name		= "ma35d1-usb2-phy",
+		.of_match_table	= ma35_usb_phy_of_match,
 	},
 };
 module_platform_driver(ma35_usb_phy_driver);
 
 MODULE_DESCRIPTION("Nuvoton ma35d1 USB2.0 PHY driver");
 MODULE_AUTHOR("Hui-Ping Chen <hpchen0nvt@gmail.com>");
+MODULE_AUTHOR("Joey Lu <a0987203069@gmail.com>");
 MODULE_LICENSE("GPL");
-- 
2.43.0

