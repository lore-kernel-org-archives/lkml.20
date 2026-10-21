Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602180;
	b=DQ85YjwB9wlC8sxZzzHaFnRDkTfMUYQwfz20hN44n5g9EiY0KM/uJ9UNMEas+FCFPgDG
	 2TL3nOCWiXzZydLFX+IyxwlHNGPpYViYzGRlHwc0gchTWHCDUKVZ7yPk0h61jGMSgyKkI
	 wsMp/5KUzHcoDGDDUjBD1NmGYY0ZpXBPcAYs6LzE5JB9hQzgjJ2XV9guiUSQEds7IF501
	 Cv3Nvid/hogWfxSaZpAK7KJHcoS6WFCn4rGXi12ExMm627Ka/SNWHNXLdYSc+y50xxLRY
	 n6YtRtMH5QvymVKlW/ZXCLzQdkeJk6QlLC1EX6Oqq/ivDwLJL0jRbf1A7C1wau2Xd1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2jSm9zb8eTcGFKhjyNMrS+8X+DXl1nyYa3sW6PQX9iw=;
	b=geW2mRZGeLP9vzoC2Y5mE1+IKqxbMHjnTZyU+pzcJUPNjAU47MQ9EmL4uxtc4IKm6YeG
	 NoEjk1oTv52Z1Jm4Fn4q95jiWLlGMVlcbJudSt32BqFx1SM4uRXItmrDrkp6MJhgVfhww
	 Ha+cgX8wI05jbulG4H4swmVm2LpXCHtpiVo+VrhfvSiCJnTGQXUlhkXkc0u1k3swIPjFi
	 QvqcJQCEYqmmdl4Vgczm6YLjnthhwOuris/vcptA0Xq0qmc+FKMISHWhW6G2Omdsn4Lt/
	 OSWR58052XHQmoX3xDEe3EkAlq8udxTik3cbjxgCsxrsIulg4zcnuVfr/phb1RY4ZEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PEsKqQbO;
	arc=none smtp.remote-ip=74.125.228.8
Received: from mail-pz2-f8.google.com (mail-pz2-f8.google.com [74.125.228.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB29606A322
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABB29606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PEsKqQbO
Received: by mail-pz2-f8.google.com with SMTP id 41be03b00d2f7-cd3da0e82daso182966a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792602179; x=1793206979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2jSm9zb8eTcGFKhjyNMrS+8X+DXl1nyYa3sW6PQX9iw=;
        b=PEsKqQbOXvfJFz2c2I7r+EqbYJiJf6mmHhyOTmtewxrRVXE+OjAMOttlPk92p6otPn
         piF9WW3JL+bZ0FK2Y/wtdlnHvL5obI04iJq21D97f4xhZWsEx3FFpJEWmDDy9//ZUcXc
         6yYiQDkr6x7LCKpzgE++Fdi41SN5SNQUPpLLBtKqc4340VetJ3i9ouHXb9P/EUkg8VZm
         jCaPMWaQgMMq2cGo184rdTgODArJbAAHXZ4bCVf3f2higlYQR6Q9X5xjCSDZ99M61TOM
         4ZLDJFSnNf/sSOWq89VigFClms1egL9v2rHHIerhJnxTlq8vwHJ7RluHBRofxkjt13dt
         h6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792602179; x=1793206979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2jSm9zb8eTcGFKhjyNMrS+8X+DXl1nyYa3sW6PQX9iw=;
        b=X7s2wV9X4/CDdWYB5FcmoEoH4IfCnM9/i3bZuZlxflDAwDYYGyZjxad9yULZW7q3cq
         /tAf0hfUET2W1R/+BReA+pnxymWdVxaMUkmmC2Tkn9QzBe1SSup+VBMurFphw8w+uS9q
         IEXm9Ihtnk1ItcQjuk7a/kQ4wY5b6pyE3n1nOGb85YF52QLlThJDBIMoPWbeXFPjYCoy
         C2mh53BnjYmG11ofAGdbrP02vAay6HfVaG3yHM7BvEctEqayFzfGtzYV2FhwfuSvaRHX
         /ilNrG5N8zOVWzYSNv+mwQxc2qTpdBGz7FbF77EIpLCbOmSlJD/x59+z/buUg7aR/cP+
         N2kQ==
X-Forwarded-Encrypted: i=1; AKwUvBwo/J8cCezumm6snYOOkggrqgxfW8S60R1BoeVVyGuq0ktOsmGRPMVKJYTRscxGm4HhDwPEUfeoOSmHzwQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYILFd129mvyh79f176MeDBM3Lw8bLOC6RPgGPSL45AxCdv+o530
	Edct7LRC9CuibdRRl8fjobbvUeoK954xJkEN925DyYxMKvhZaHwA4anP
X-Gm-Gg: AYBFou3aX1nJh7y8Bd4/ccreMH9sCaJeA52xcC1F+DPKwtH4LbDbSSXUxED6E1FWUz3
	xeXkXa7onCl9vSdklFXOpjapLdxtsfnvvDIh+bxt9Y9scCrfsfC1bv6vI59xqteUcM8/YbvrhwP
	jpn1UPoIOg+lUn332O9FZoc9Dy/6ikMbppl5CVrXHQLq5JJXab0OVEUhKXTaPHWEE+Vs2DSNzud
	V/WKrBDJD3EekjAWUS2sAU3ykhEfcxLgLAnx5W/jK/JnPYq4eM/8kFmN5ETVoGDgs41LSsu/F62
	AZU66bcrHK8txTNfYcVCDk19XAE0YKxhAgd0Dx1/4Fs4t41KqKGnALrGEhV7iE8P0S2XmG2uZpp
	n1T8R6p2gUTzvVW3ztp7Jj3qPT/R8b+pz3DIMQLzuB/YZGkCyiDuRq65/NLqurQyYlOF4vRbh6X
	+fsggA/MUTvZnVeJ4uUmHIimbH42JBmmelgFy3ewRnMnRwdXtMX1ITCck+ii/aIHveKqqv76B0A
	AXQP7iJUcus9dh2qEsXY7xgAQ+I/S/a6xw4lB5Qt8Lx4hOVL33CIBJTRuhYrka6AehNtyOHWL+7
	Bg==
X-Received: by 2002:a05:6a00:950b:b0:878:3538:8f7a with SMTP id d2e1a72fcca58-8a089e946bdmr2149384b3a.40.1792602178944;
        Wed, 21 Oct 2026 10:02:58 -0700 (PDT)
Received: from AERO17.taila7786d.ts.net ([152.175.65.31])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0894b3749sm1195785b3a.15.2026.10.21.10.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:02:58 -0700 (PDT)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4] net: phy: realtek: Add support for JLSemi JL2101 and JL2121 PHYs
Date: Thu, 22 Oct 2026 01:02:48 +0800
Message-ID: <20261021170248.49264-1-cyan2254650260@gmail.com>
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
regs 11/15), and specific status register (0x1a). Wake-on-LAN (WoL)
events (page 0xd8a regs 16/17 and page 0xd8c reg 16) and LED control
registers (page 0xd04 reg 0x10) match RTL8211F.

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
the RTL8211F-compatible driver operations, and add the ID to the MDIO
module device table.

Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
---
Changes in v4:
- Consolidate JL2101 (0x937c4032) and JL2121 (0x937c4030) into a single
  PHY_ID_MATCH_MODEL(0x937c4030) entry as both share Model number 0x03
  and differ only in revision number (Andrew Lunn).

Changes in v3:
- Drop standalone driver drivers/net/phy/jlsemi.c and extend the Realtek
  PHY driver directly as suggested by Andrew Lunn.
- Add jlsemi_read_status() to read PHYSR (0x1a) via phy_read_paged()
  from page 0xa43, avoiding false downshift to 10Mbps half duplex (verified
  on physical ALINX AX7Z020B board).

Changes in v2:
- Drop redundant phy_interface_is_rgmii() check in jlsemi_config_init()
  (Andrew Lunn)
- Change speed check in jlsemi_read_status() to '>= SPEED_1000' since
  JL21xx only supports up to 1000M and 100BASE-TX does not use Master/Slave
  clock resolution (Andrew Lunn)
- Check device_can_wakeup() and configure wakeup capability and wake IRQ
  in probe() when 'wakeup-source' is present (Andrew Lunn)
- Drop redundant .features = PHY_GBIT_FEATURES (Andrew Lunn)
- Use PHY_ID_MATCH_VENDOR() for generic driver and mdio table (Andrew Lunn)
 drivers/net/phy/realtek/realtek_main.c | 40 ++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/net/phy/realtek/realtek_main.c b/drivers/net/phy/realtek/realtek_main.c
index 177b62a7b..13039d9f8 100644
--- a/drivers/net/phy/realtek/realtek_main.c
+++ b/drivers/net/phy/realtek/realtek_main.c
@@ -259,6 +259,9 @@
 #define RTL_8261C				0x001cc890
 #define RTL_8261C_CG				0x001cc898
 
+#define JLSEMI_JL21XX_PHYID			0x937c4030
+#define JLSEMI_STATUS_PAGE			0xa43
+
 #define RTL8261C_CE_MODEL		0x00
 #define RTL8261D_MODEL			0x81
 #define RTL8261X_INT_AUTONEG_ERROR	BIT(0)
@@ -1731,6 +1734,23 @@ static int rtlgen_read_status(struct phy_device *phydev)
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
@@ -3192,6 +3212,25 @@ static struct phy_driver realtek_drvs[] = {
 		.led_hw_control_get = rtl8211f_led_hw_control_get,
 		.led_hw_control_set = rtl8211f_led_hw_control_set,
 		.disable_autonomous_eee = rtl8211f_disable_autonomous_eee,
+	}, {
+		PHY_ID_MATCH_MODEL(JLSEMI_JL21XX_PHYID),
+		.name		= "JLSemi JL2101/JL2121 Gigabit Ethernet",
+		.probe		= rtl8211f_probe,
+		.config_init	= &rtl8211f_config_init,
+		.read_status	= jlsemi_read_status,
+		.config_intr	= &rtl8211f_config_intr,
+		.handle_interrupt = rtl8211f_handle_interrupt,
+		.set_wol	= rtl8211f_set_wol,
+		.get_wol	= rtl8211f_get_wol,
+		.suspend	= rtl8211f_suspend,
+		.resume		= rtl8211f_resume,
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
@@ -3420,6 +3459,7 @@ module_phy_driver(realtek_drvs);
 
 static const struct mdio_device_id __maybe_unused realtek_tbl[] = {
 	{ PHY_ID_MATCH_VENDOR(0x001cc800) },
+	{ PHY_ID_MATCH_MODEL(JLSEMI_JL21XX_PHYID) },
 	{ }
 };
 
-- 
2.56.0
