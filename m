Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793900040;
	b=R01x59gDcaJkl3VGV9Mtz7bNoEy7nPzMrN6VKU6nmsM9VkIx9kwHUHdLVpz64pQCMuld
	 BmmuWlHeXdLjMKOrSn/fKzoqvlSKITw9hrbcV8IMX6wwy/npogz8/yCKVxVY/LUN4Ingn
	 5SuSSoChTygA9EUjhnmuPhmRO5n+L5sLZq9HGzSlobKnIiEyw01patLqd3QHsQe/Pe/Uj
	 v8Ckms+cjcWLXA6WUkpx3GyfUBlF+8bbyQ5VLT/cNxNuJ4kT+T0WqJuHaZUZdBC9I87CX
	 at6ecs6dQQWNbcN6xqN2f1Bv38CnjQdtNe9Q+C6Sc3HmnZISfN4rdQ4/aLQ6cmxFJgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793900040;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fHbz90ILaaCOBKWqIHRp1aZbsJQSwVFsjChRBvgZnSQ=;
	b=KVA2hiAaft7/OYKjtW0w9sGwDX3dsavw1YuDayxIQiur3/zAc2FEWGCGiEhl3jOTAFBf
	 KU2a7WCYAhiqD8hqgaHoADCfVI279ekNNZCqqbyIVEChKECeKpfRNTkZw2jdTbqLF2CIb
	 pxDoWDnm8VLRE8WVmvxU6oIWkvh9MAaIOyRKXVe+lHiH21gaBehwbIGyCb7czfFt7MIDc
	 8YufpxTny9Z3QeFj/+EbvZMHHO+3Ik9TxUjzhKuNG/veue9KEvlBMz+b43hr7xGk+uJMV
	 fqaAYlaEKK0z0Pcwa3eGZhRkmnl+XnidLs2eR47jSX2DXqPiNMqhGgttkrHDvWaypag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NawCArld;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38AF606A332
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E38AF606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NawCArld
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36d73027aedso956468eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793900039; x=1794504839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fHbz90ILaaCOBKWqIHRp1aZbsJQSwVFsjChRBvgZnSQ=;
        b=NawCArld5mDlRaHTnohEFmR3qAMd9eBT/BbnogqCVMr5UMLgEENuWsKJhoTahYsyub
         VU2C1J3DG553LT420QqDfFVza6EhS6gxAnF++LztO5WOM1cOiWoLKUMTHHX3GMKeK+wC
         d6VGOQd1Oq3stKTsbpyjO/lwmlpcAWydLMWoNFbKvykZYfVGGUPw1aBY94V5nGhunoFc
         ST1llR8uhamQQc5v0FKxSWvPVI/GGdUokITzEU9WQxBNiXclOX0vDmphAB7y1AEpfm2d
         jsHA8KJ742Nzm+THKcpaGu5/8aY7+BB/xG/q3d9f1GSaylz8gynyEQR5gltBXDNE6jmG
         ERNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793900039; x=1794504839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fHbz90ILaaCOBKWqIHRp1aZbsJQSwVFsjChRBvgZnSQ=;
        b=SGD4wz3uHVDxw3kxYMp7QnWjwYPbhNhtFvqCEYjSxqnHsqqHeN4whXVdzUWkwzS8x7
         ymAMMgaW7NZvoDlsRvkQ2DkcZv6dMQv/6BnJiFhHCCiCjfcfBfoM9CvQFHmPyX3a4A5B
         PUlsD+lydBX73SOMDPPO+w15itrow4bihzkNkSnc/Uxz590bdQvDxbHqzUV1TDpVJtK0
         WzC7S5hhWhY9GgaCkPUwIufd/ZqXEds0610pTGUZ96BTgSqSKuo0CiJN0Sb3h/sWMhM2
         2Yr8Q+TIUe09Rh7FMvIkWrVn3KVxKWOdUfGzYC4M5iQ4Yan9lIHJkFw9/IbaiOjIKsjD
         5iOA==
X-Forwarded-Encrypted: i=1; AKwUvByn7EqLE4OYlZr9NxMBIfomqdGDUQTbtq7+mh8/S/rDKIitALkSFxC5zCCmDct4pi3A+8Q41MykSy7UrjA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/K+vdBBn8l+yWSPKC/WYsyiGXGds9vawDIv86GbIGqkJSIWdQN
	ZWz42BpiOeYpH4bziOOUdoWyij7M9kSYzNpnMTDxLb1UFJGmBWCTnnzy
X-Gm-Gg: AYBFou3hKSxocKhZR0u51H4htKrHxjh0cuerQw/FHqsj4Vjw4J2DS+fHSKCMGAZakrr
	4CjjtOWJdPbHdejSWcsyvxeUm4ZvrXiMilECXStI0KEwd5NtbwUVmLD+0LweLaurJvf2QSAa4+o
	WmY5JmUY2APHtlVSNYpIqKwcSyufEL+SoMrjgW0lmjYWedwbAmwPZzRmqN6Zi6JzdhhXIPdbdDY
	ao3xHgHwlcm9hLcG/cjj3QqSruyNnArh/67YJi+qiFakp5zfxnrGE5Co4MlfrEr0dhEffXS3h4r
	Z3YRRzLRqEU5k+lAGlpo6er5m+O7l/jISYh2slcrvJ99NekoTt1lIYCmiT29usXUhm+jc1FWGKA
	GP/gBJmbbxDA2h+gOwCvSj63E70XQlGoTWWoic9Wv2HeXUl+yG5OVKYfqNzoD88FLVfOeFDuIim
	hiD41PArHDF5THq9MFSpOtFEZczJNKayiTL2UJyfWAfKAuvKArwZXgYfoHgk37R8VsSwtQIs2jc
	J1J+l8rzsoteSjzMF3Hlvxg5QB3CifeXk2F8SlwjJwd+dxKsq4U8P+yfg5SUKrA6/czmYMzEke+
	MIwmYHY4XVi8PKS1jofhi8KJE/8TnhfBVlFV91X7zl8X2ucrrg==
X-Received: by 2002:a05:7022:1104:b0:19d:6484:869f with SMTP id a92af1059eb24-1ac5c369c59mr25098320c88.7.1793900038915;
        Thu, 05 Nov 2026 09:33:58 -0800 (PST)
Received: from AERO17.taila7786d.ts.net ([152.175.97.38])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm17925023c88.8.2026.11.05.09.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:33:58 -0800 (PST)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4] net: phy: realtek: Add support for JLSemi JL2101 and JL2121 PHYs
Date: Fri,  6 Nov 2026 01:33:50 +0800
Message-ID: <20261105173350.159060-1-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
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

JLSemi (JingLue Semiconductor) JL2101 and JL2121 Gigabit Ethernet PHYs
are register-compatible second-source alternatives to the Realtek
RTL8211F. They share the same paged register layout (page select at
register 0x1f), RGMII TX/RX internal delay registers (page 0xd08
regs 11/15), specific status register (0x1a), and LED control registers
(page 0xd04 reg 0x10).

In the IEEE 802.3 PHY ID allocation, JL2101 (0x937c4032) and JL2121
(0x937c4030) share the same Model number 0x03 (bits [9:4] of register 3),
differing only in revision number bits [3:0] (0x2 vs 0x0). Both chips
share identical operational characteristics. Consolidate them under a
single PHY_ID_MATCH_MODEL(0x937c4030) entry covering all revisions of
this model.

Unlike RTL8211F where PHYSR (0x1a) can be read directly on page 0,
JL21xx requires reading PHYSR from page 0xa43 via phy_read_paged().
Reading 0x1a on page 0 yields 0x0000, which causes rtlgen_decode_physr()
to erroneously downshift to 10Mbps half duplex. Introduce
jlsemi_read_status() to read PHYSR from page 0xa43.

Extend the Realtek PHY driver to bind JLSemi JL21xx by its Model ID to
the RTL8211F-compatible driver operations, using the generic rtl821x
probe and suspend/resume routines to avoid touching unverified WoL
registers. Add the ID to the MDIO module device table.

Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
---
Changes in v4:
- Consolidate JL2101 and JL2121 into a single PHY_ID_MATCH_MODEL entry
  since both share Model 0x03 in IEEE 802.3 PHY ID allocation. (Andrew Lunn)
- Drop unverified WoL callbacks (.set_wol, .get_wol) and switch .probe to
  rtl821x_probe and .suspend/.resume to rtl821x_* to avoid touching unverified
  WoL registers (page 0xd8a). Tested on hardware: page 0xd8a/0xd8c read back
  as 0x0000 on JL2121. (Andrew Lunn)
- Retain hardware LED callbacks (.led_hw_*) after thorough validation on
  hardware (ALINX AX7Z020B): Mode B page 0xd04 reg 0x10 bitfields verified
  via single/dual LED blinking tests and netdev trigger hardware offload.

Changes in v3:
- Drop standalone driver drivers/net/phy/jlsemi.c and extend the Realtek
  PHY driver directly as suggested by Andrew Lunn.
- Add jlsemi_read_status() to read PHYSR (0x1a) from page 0xa43, avoiding
  erroneous downshift to 10Mbps half duplex (verified on physical ALINX AX7Z020B).

Changes in v2:
- Drop redundant phy_interface_is_rgmii() check in jlsemi_config_init() (Andrew Lunn)
- Check device_can_wakeup() and configure wakeup capability and wake IRQ in probe()
  when 'wakeup-source' is present (Andrew Lunn)
- Drop redundant .features = PHY_GBIT_FEATURES (Andrew Lunn)
- Use PHY_ID_MATCH_VENDOR() for generic driver and mdio table (Andrew Lunn)
 drivers/net/phy/realtek/realtek_main.c | 38 ++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/net/phy/realtek/realtek_main.c b/drivers/net/phy/realtek/realtek_main.c
index 4927ee838..355135143 100644
--- a/drivers/net/phy/realtek/realtek_main.c
+++ b/drivers/net/phy/realtek/realtek_main.c
@@ -270,6 +270,9 @@
 #define RTL_8261CE_CG				0x001cc899
 #define RTL_8261D_VM				0x001cc89a
 
+#define JLSEMI_JL21XX_PHYID			0x937c4030
+#define JLSEMI_STATUS_PAGE			0xa43
+
 #define RTL8261C_CE_MODEL		0x00
 #define RTL8261D_MODEL			0x81
 #define RTL8261X_INT_AUTONEG_ERROR	BIT(0)
@@ -1755,6 +1758,23 @@ static int rtlgen_read_status(struct phy_device *phydev)
 	return 0;
 }
 
+static int jlsemi_read_status(struct phy_device *phydev)
+{
+	int ret, val;
+
+	ret = genphy_read_status(phydev);
+	if (ret < 0 || !phydev->link)
+		return ret;
+
+	val = phy_read_paged(phydev, JLSEMI_STATUS_PAGE, RTL_PHYSR);
+	if (val < 0)
+		return val;
+
+	rtlgen_decode_physr(phydev, val);
+
+	return 0;
+}
+
 static int rtlgen_read_vend2(struct phy_device *phydev, int regnum)
 {
 	return __mdiobus_c45_read(phydev->mdio.bus, 0, MDIO_MMD_VEND2, regnum);
@@ -3283,6 +3303,23 @@ static struct phy_driver realtek_drvs[] = {
 		.led_hw_control_get = rtl8211f_led_hw_control_get,
 		.led_hw_control_set = rtl8211f_led_hw_control_set,
 		.disable_autonomous_eee = rtl8211f_disable_autonomous_eee,
+	}, {
+		PHY_ID_MATCH_MODEL(JLSEMI_JL21XX_PHYID),
+		.name		= "JLSemi JL2101/JL2121 Gigabit Ethernet",
+		.probe		= rtl821x_probe,
+		.config_init	= &rtl8211f_config_init,
+		.read_status	= jlsemi_read_status,
+		.config_intr	= &rtl8211f_config_intr,
+		.handle_interrupt = rtl8211f_handle_interrupt,
+		.suspend	= rtl821x_suspend,
+		.resume		= rtl821x_resume,
+		.read_page	= rtl821x_read_page,
+		.write_page	= rtl821x_write_page,
+		.flags		= PHY_ALWAYS_CALL_SUSPEND,
+		.led_hw_is_supported = rtl8211x_led_hw_is_supported,
+		.led_hw_control_get = rtl8211f_led_hw_control_get,
+		.led_hw_control_set = rtl8211f_led_hw_control_set,
+		.disable_autonomous_eee = rtl8211f_disable_autonomous_eee,
 	}, {
 		.name		= "Generic FE-GE Realtek PHY",
 		.match_phy_device = rtlgen_match_phy_device,
@@ -3527,6 +3564,7 @@ module_phy_driver(realtek_drvs);
 
 static const struct mdio_device_id __maybe_unused realtek_tbl[] = {
 	{ PHY_ID_MATCH_VENDOR(0x001cc800) },
+	{ PHY_ID_MATCH_MODEL(JLSEMI_JL21XX_PHYID) },
 	{ }
 };
 
-- 
2.56.0

