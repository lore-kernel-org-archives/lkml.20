Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794207392;
	b=jEYY+sFs8alK9WO5btTtjcAZsmO2rsAkwwyfk41YN3uS02ASApjwhndYCSQrlecb7ApH
	 8QQTy28ZOxMkV6YkGt+HQJVsoCB+Z57rz1NRDcUzpM9dTzcxi82wtewWxuS0/MQ2YTmm7
	 Gqi4ZScWPUV7zRBmkUVmWonmlnf7kYnw1AslU85YYbuKft4z/co0Rib0EO+Pk0ro9JC9M
	 VbCreHBqfTMLUML2xjQmqFUh6XFpd0D07QO4wLmDOJeaNYqbiIcg4pRuZMG/xWihXuheK
	 seaklZV0EFyH7Wow6YOrO/fZJiJXUikEdTjpINeJuxWS0f8jEA/GKot6PaTx1yexNMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794207392;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pHYAVxXuO5e9vCII0JaXIbET91xlBsNZUGiyKc29HGQ=;
	b=yx+BtgvTmELZJSZXuR+6T0cHXXROM/G/kxWll3GbUDBbdikPP8i+Rb1VtpMyUKvQuC76
	 pVQTokpXVVpoEB3HQ85bTtCbyi/22Ed7e2xQTZelzCuv1P1Bv+bepEq766jo7gzPntdM3
	 MOdikEQ5W0saCks1MbOhbss9s4+m1Lfy7c9UeO59Z9OraVvkLqV6Ehc7xHoKQwJmOA92J
	 QOqsO0TlbtxD9GWec+LNtuVQXRLF4C/5vi5AIGxLQ4ijPn4s2zc18RjhIZrYT3Y6v/kOP
	 OC7x41QxdfJsqfz9wRcx7kr+pXw8PrFvr2oMbHQnObPztA5EjkfEMknFds0iAScgXHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XzjKbAo1;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989C6606A323
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:56:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 989C6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XzjKbAo1
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15dd124bbe7so1047793c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 22:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794207391; x=1794812191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pHYAVxXuO5e9vCII0JaXIbET91xlBsNZUGiyKc29HGQ=;
        b=XzjKbAo1xr/fM2uN5aA5xzBTby7AY9m1W3hHStQb8znDQvQi4nyyK5QYMJgra7U3ih
         wNnIJhP2qJlEhrPw2YhAUtMfxvZel5atp9SIZI89m2kkhPheanKGSENMZrTgTPxe7gz1
         Aqc6YKDBXLZ88n73B0wddYOg60Sel2/LkeABedwzpimh6zCFs0pTf5ZGySFP9rIhPO4J
         rlBQDfWEUo+3pEtXgVVzJYcZh5Q+T2lPGU2WZXqKfsj+4WLompbZl0M/i5xOGWisQLaS
         9VNNGmNynla7UwBWZ7DQ1qvVNhLV3z0yDYKYzg7L1kGSNk8IjddOP+cjT/eMFziASZAs
         DoVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794207391; x=1794812191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pHYAVxXuO5e9vCII0JaXIbET91xlBsNZUGiyKc29HGQ=;
        b=uq3dKMsVmYPQ2+AtUT+RGgH+kfH8v+Br0FmQvXXa/zdcw7cd6Nst/tU46aar46f5NJ
         nrSkkqkBXl3li+NPhQ79ICqBlGHOjjjCYN5y/RpEhoVTathS0EHMLGyMthNm8zeNwGVN
         tJJPV9xU9IAwK1bTiZ4pQ8Xki27KRmxpz7YeYVvRtFiL1bHwcu1JQ6hGALQ7dSdOk6xF
         6+Sbw2rcHiXPWVS50VyfejWsIfasNQ/SEAs+wMOvzVndFUpB+AGUFRO3+BqXRG7DPMT1
         tZPx6Epz2h0j4VRd+GIjQ3QuHyiGbYzMjL3Fkrj+5egyUIdhTtmze4p+dfPia1vVr87D
         dMnQ==
X-Forwarded-Encrypted: i=1; AL+hErEmISou2JUGOG2roMhdE3FVKc7cbG19hCyIjTvCX/Bogf13tN/umkBMNrc14iODj/uXmXsH8sRtbltcT94=@vger.kernel.org
X-Gm-Message-State: APuU4Z8V+o6wqo5KB4PAmISkUdIklfY6rAUf2MS9I3YRrGuXObAidj4u
	cIf68RoLK8K4DdU5puMhqzITh5dV/BMemoTcl0b+d3ArvOFCUz1qqpWl
X-Gm-Gg: AYBFou1VBB0QX+Hbn0h/EwSY0Yn7ziTMp3gtf71TmHRrdGd9GSBBaoXqD9BZnIbiVLo
	CEw5qUskBXAaS2pCcksnJuMZO4iPy77jJhrA5TrMLbD83+wLbI7hELCZDETreuyGCqm7YFpaZFp
	/4lzTqwUsnJSSVrF8/Yez9BD7xmmNFTJrV4qJ2y/jSUIvHYFkCtSjY4SoEXrd9Mr817hIO3Vzoi
	FiOav9C+dMfeosIFBJEqTuFT46nCOFd0DMelabszJfor5ZujnaGNyyXpQvOZiVj9GcXq/xMAkpo
	DDDcclb2XIpbc67o/nfdYTNtr6mTTuJAzzbtPw99uUXU8aL2QvqOSQ08YLrLgTeaq7WgZe01qYa
	pY45eaMEE1RmNST6DzZ/EnHM0bGBLNVJj6Dvxzl/rSw62if788s4SCVj7ZUHS88F5bjcKLIgqw3
	CRUXXY+ETRX3CnEwVHze/6ABqH26ja6vW4Z+bXSdGP4wIXQKcOdcCaeucmgmE69M58ed9cFaRRg
	tk51AyUPmxtmxDIslmePnd52RHyn6NyNcrbgylQq7CWB7RwS9otZo4bni0gbRcdgB1E28rzK51n
	Z7RlFJNQNmOEPyGCTI4VJp4PzUhFRmfMwYmLmvkePml9xtX/i0n7RFTWTcvzlf2KMZTmOsEvqwp
	e907djL9UVa3DkfPLAA==
X-Received: by 2002:a05:7022:f507:b0:144:f089:b189 with SMTP id a92af1059eb24-1b39fec440bmr4758116c88.36.1794207390517;
        Sun, 08 Nov 2026 22:56:30 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm10120176c88.13.2026.11.08.22.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:56:30 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>
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
Subject: [PATCH v8 4/4] phy: nuvoton: phy-ma35d1-usb2: extend to dual-port with OTG support
Date: Mon,  9 Nov 2026 14:56:06 +0800
Message-ID: <20261109065606.62641-5-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109065606.62641-1-a0987203069@gmail.com>
References: <20261109065606.62641-1-a0987203069@gmail.com>
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

The init callback handles PHY reset and clock-stable polling.  The
power_on and power_off callbacks only gate the HUSBH0_GATE clock shared
by both ports, so it stays off when neither port is in use.  If a PHY
already in operation mode does not report stable clocks, it is reset
before failing.

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
    the over-current detect input as active-high.  When absent, the bit
    is cleared (active-low) regardless of the bootloader setting.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/phy/nuvoton/Kconfig           |   1 +
 drivers/phy/nuvoton/phy-ma35d1-usb2.c | 312 ++++++++++++++++++++------
 2 files changed, 240 insertions(+), 73 deletions(-)

diff --git a/drivers/phy/nuvoton/Kconfig b/drivers/phy/nuvoton/Kconfig
index d02cae2db315..1f37e860de50 100644
--- a/drivers/phy/nuvoton/Kconfig
+++ b/drivers/phy/nuvoton/Kconfig
@@ -6,6 +6,7 @@ config PHY_MA35_USB
 	tristate "Nuvoton MA35 USB2.0 PHY driver"
 	depends on ARCH_MA35 || COMPILE_TEST
 	depends on OF
+	depends on USB_ROLE_SWITCH || !USB_ROLE_SWITCH
 	select GENERIC_PHY
 	help
 	  Enable this to support the USB2.0 PHY on the Nuvoton MA35
diff --git a/drivers/phy/nuvoton/phy-ma35d1-usb2.c b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
index 0b9976fb15c1..bc706356c434 100644
--- a/drivers/phy/nuvoton/phy-ma35d1-usb2.c
+++ b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
@@ -1,6 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (C) 2024 Nuvoton Technology Corp.
+ * Nuvoton MA35D1 USB 2.0 PHY driver
+ *
+ * Supports PHY0 (USB0 OTG port, shared between DWC2 gadget and EHCI0/OHCI0)
+ * and PHY1 (USB1 host-only port, used by EHCI1/OHCI1). The hardware mux on
+ * PHY0 switches automatically via the USB ID pin.
+ *
+ * Copyright (C) 2024-2026 Nuvoton Technology Corp.
  */
 #include <linux/bitfield.h>
 #include <linux/clk.h>
@@ -12,131 +18,291 @@
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
+	struct clk *clk;
+	struct ma35_phy_port port[MA35_PHY_NUM];
+	struct usb_role_switch *role_sw;
 };
 
-static int ma35_usb_phy_power_on(struct phy *phy)
+static int ma35_usb_phy_wait_ready(struct ma35_usb_phy *p, unsigned int n,
+				   unsigned int *val)
 {
-	struct ma35_usb_phy *p_phy = phy_get_drvdata(phy);
+	if (n == 0)
+		return regmap_read_poll_timeout(p->sysreg, MA35_SYS_USBPMISCR,
+						*val,
+						((*val & USBPMISCR_PHY_HOST_READY(0)) ==
+						 USBPMISCR_PHY_HOST_READY(0)) ||
+						((*val & USBPMISCR_PHY_DEV_READY(0)) ==
+						 USBPMISCR_PHY_DEV_READY(0)),
+						10, 1000);
+
+	return regmap_read_poll_timeout(p->sysreg, MA35_SYS_USBPMISCR, *val,
+					(*val & USBPMISCR_PHY_HOST_READY(n)) ==
+					USBPMISCR_PHY_HOST_READY(n),
+					10, 1000);
+}
+
+static int ma35_usb_phy_init(struct phy *phy)
+{
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
+	ret = clk_prepare_enable(p->clk);
+	if (ret)
+		return dev_err_probe(p->dev, ret, "failed to enable clock\n");
 
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
+	regmap_read(p->sysreg, MA35_SYS_USBPMISCR, &val);
 
-	/*
-	 * reset USB PHY0.
-	 * wait until USB PHY0 60 MHz UTMI Interface Clock ready
-	 */
-	regmap_update_bits(p_phy->sysreg, MA35_SYS_REG_USBPMISCR, 0x7, (PHY0POR | PHY0SUSPEND));
+	if ((val & USBPMISCR_PHY_SUSPEND(n)) &&
+	    !ma35_usb_phy_wait_ready(p, n, &val))
+		goto out;
+
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
-		return ret;
-	}
+	ret = ma35_usb_phy_wait_ready(p, n, &val);
+	if (ret)
+		dev_err(p->dev, "USB PHY%u clock not stable (USBPMISCR=0x%08x)\n",
+			n, val);
+out:
+	clk_disable_unprepare(p->clk);
+	return ret;
+}
 
-	return 0;
+static int ma35_usb_phy_power_on(struct phy *phy)
+{
+	struct ma35_phy_port *port = phy_get_drvdata(phy);
+	struct ma35_usb_phy *p = container_of(port - port->idx,
+					      struct ma35_usb_phy, port[0]);
+
+	return clk_prepare_enable(p->clk);
 }
 
 static int ma35_usb_phy_power_off(struct phy *phy)
 {
-	struct ma35_usb_phy *p_phy = phy_get_drvdata(phy);
+	struct ma35_phy_port *port = phy_get_drvdata(phy);
+	struct ma35_usb_phy *p = container_of(port - port->idx,
+					      struct ma35_usb_phy, port[0]);
 
-	clk_disable_unprepare(p_phy->clk);
+	clk_disable_unprepare(p->clk);
 	return 0;
 }
 
 static const struct phy_ops ma35_usb_phy_ops = {
-	.power_on = ma35_usb_phy_power_on,
-	.power_off = ma35_usb_phy_power_off,
-	.owner = THIS_MODULE,
+	.init		= ma35_usb_phy_init,
+	.power_on	= ma35_usb_phy_power_on,
+	.power_off	= ma35_usb_phy_power_off,
+	.owner		= THIS_MODULE,
 };
 
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
+{
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
+
+	return 0;
+}
+
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
+
 static int ma35_usb_phy_probe(struct platform_device *pdev)
 {
 	struct phy_provider *provider;
-	struct ma35_usb_phy *p_phy;
-	struct phy *phy;
+	struct ma35_usb_phy *p;
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
+	p->clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(p->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(p->clk),
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
+
+		regmap_update_bits(p->sysreg, MA35_SYS_USBPMISCR,
+				   USBPMISCR_RCAL_MASK(n),
+				   code << USBPMISCR_RCAL_SHIFT(n));
+	}
 
-	phy_set_drvdata(phy, p_phy);
+	regmap_update_bits(p->sysreg, MA35_SYS_MISCFCR0, MISCFCR0_UHOVRCURH,
+			   of_property_read_bool(pdev->dev.of_node,
+						 "nuvoton,oc-active-high") ?
+			   MISCFCR0_UHOVRCURH : 0);
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
 
-	provider = devm_of_phy_provider_register(&pdev->dev, of_phy_simple_xlate);
-	if (IS_ERR(provider))
+	ret = ma35_role_switch_init(pdev, p);
+	if (ret)
+		return ret;
+
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

