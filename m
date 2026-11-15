Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794782035;
	b=HMpYin4Szpr3/mmgduj/Z/fT7Eh8clYy9+bfvOZOf1GN0j/cMl4Dzt66ubYWrNRvruvg
	 KRobRZuG3sdrHwgopH5BsH2BSYj2iHx1hMePs62WxdUfmZ/GPHRjT220PtD/ehGDx7Nm2
	 GDwoxYp0nHjvybQT4cl1RwTPbW7VxcrVqnPhX3fw40TZm3sJU6DABYNozAQp08kcxf4Fv
	 dkOMjUYLoMc9Kc1B3uQ+B7Yqs1RFhfltZMvFdUuhjH6A4Uqt3i4CjSj/oOLfvnYc/P+Il
	 c573n4p+5LiRRMG1T9rdd4CRZhXYwFnk7DKUBC4VF0dKIrM/kmov0zniSNdDhcVjwlw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794782035;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=OlmTdVK+M7BYmHULcKkFaIjQ2DHpGhoOY+iNuiJwHtM=;
	b=DNZBuuDnRim12jz6SclXA2DZbZ7fSLJckFbXq6JadAfCfMTbbBw4XUzML3X8VyRcX02Q
	 9wj5SQVJsDU/oxVe9qobctTWYB2h69aCQ9svS/PKlN85I6DQuJD+Tj8VSb4zV+aQHU7js
	 KlJaLt6a1yikvaAhaI05P2L/FSPaTzC07YYM5S/aJ1NAKXNqKNyOnmlDstI1pnkSyDfwW
	 UhEi6fEgyCwFh/818sBOJKPG2ezLs2ocKQZB9iD2y1HqO/76G/xiaSBfrzK6xoLG74pYW
	 cgFLyG4uG5UFdh0P55oKX9/dXcMV5MFxvsnIspjfOEA4x36vGGiXqVPAaLHXCAZa85w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oYA9XZK+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60880606A334;
	Sun, 15 Nov 2026 22:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oYA9XZK+
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794782035;
	b=Vp/6YSt+tGnkHT1EA1dIflKLXpbpvk9ba+t0jPeHiltqHoQc8PwPmDWI7qZrxQeEuOkn
	 3r6cJHJ5+QYrDd8msZNV3AiuPTCH3RmX2/Dk4E1ma/wuWwoFNZEedNuBG5yRTc2ICyPE7
	 AuURT+CyiBO4DCZm8mFEAuILbI50cKy96s7vio4owrqf6T45DDI9B//XLqBEye4oVaxZa
	 nwSmheSMuUP1YlzzzQaevvRH0DEIGJoIxytU8tt6dCPDvBzd4Ey6wYEeiUITen+C+v4bA
	 CDbPR4un8yF5vSwUNg/UgtvXuPQk4rGHyZfv+Mrq79+sAZ0mwLv78b/UcNOPUXqId4w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794782035;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=OlmTdVK+M7BYmHULcKkFaIjQ2DHpGhoOY+iNuiJwHtM=;
	b=gNa1kIKLEX+lH44jSqXiPF0GY+xvhyNuhLS8SLYU6IHFaSpxxUpipsyHckK15v+jJqsg
	 eSbpN1qsvbFLY8ERcEJx/cveat14mYot4PGrdSKYTd8274vSkdI8EGNaz2z4yAt+t+aqQ
	 wc5RffM0LO3KgMirdJoK+vjPAOlGp+NuEwR8aG9HbAlVp5iewByclMIGwjDXTYDU40wo4
	 QBHp0JrPW1yooIWU4oVp/MfLK0fjsluanHirdSI0OmLJ3/UDgbYPFxssHvMMVq/iNxyh0
	 oC1op/FAybKhomfdH3gy/Btm9OcMv+2t7mIp/hSUs9+gZ/iDS8k9cwwa2VnmWlrQYYA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 490C11F000C6;
	Sun, 15 Nov 2026 22:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794782035;
	bh=OlmTdVK+M7BYmHULcKkFaIjQ2DHpGhoOY+iNuiJwHtM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=oYA9XZK+5k+GmRMu4LzH2EEplafus3JVdeGFhFZW6LZ3YhDLOHQ2Y0/T8VGEqIjCl
	 P0zBbtJugOD+fRfCfR0cqYwsLFhw/2QSUzcLwC3x0pLPSiEMQjluNJ9SRFkS9aML3o
	 BkUyRD1glZCYRMp/bt2GQdVdo2eXMpKc7pAyEJ8BmWSc0nGGG9zAJ+JRgHp29To6Re
	 lB7KTNF0e4wpd3e8hYBd4f60GClHaC6c1/8krXdBujnGDOj0Spj5CuTWfUq9jhBoEw
	 8qlag+jZOp3SE0Sl5bJLEINr+kkSzoS7ix2fNFaUVqJQGwoskPwRAxZtbt8UhYljpn
	 IZJriTsMJCWlw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C8CFA4A22C;
	Sun, 15 Nov 2026 22:33:53 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Sun, 15 Nov 2026 17:33:46 -0500
Subject: [PATCH net-next v4 2/2] net: dsa: mxl-gsw1xx: reset the switch
 through reset-gpios
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261115-mxl-gsw1xx-reset-v4-2-4ecd18c922e2@telaak.dev>
References: <20261115-mxl-gsw1xx-reset-v4-0-4ecd18c922e2@telaak.dev>
In-Reply-To: <20261115-mxl-gsw1xx-reset-v4-0-4ecd18c922e2@telaak.dev>
To: Hauke Mehrtens <hauke@hauke-m.de>, Andrew Lunn <andrew@lunn.ch>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Daniel Golle <daniel@makrotopia.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794782033; l=4818;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=jzE3NdtGecIBfM0MIH7ayHOEQuOCa6XfYrtVnBv8rNo=;
 b=SJWWGSWOFRmlK8iZxWpT7is11Sp41JrDpVNP51Yz/CHYPmYgRSrvf5vkxtOzmFUeFEfBkg4QR
 q0dmpT98sbOCkf0rHX96plTpmULo0dYSiacDliVFMrA5e0AZTg24QVn
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev
Content-Transfer-Encoding: 7bit

From: Joseph Telaak <joseph@telaak.dev>

The switch keeps the configuration the bootloader left in it, and the
driver never resets it. The MDIO core asserts and releases reset-gpios
only for PHY devices, so a reset line described on the switch node has
no effect either.

On the GL.iNet GL-SFT1200, nothing answers at internal MDIO address 0
after the bootloader, and the PHY that answers at each port's address
belongs to the neighboring port, so port 0 fails with "failed to
connect to PHY: -ENODEV". Describing the PHYs at the addresses they
answer at is not enough: with them at 1 to 3 and no reset, neither LAN
port passes traffic. After a hardware reset every PHY is back at its
port's address and all ports work. GL.iNet's own firmware resets the
switch from Linux too.

Get the reset through the reset controller API and pulse it before the
first register access. The reset core hands a reset-gpios property to
the reset-gpio driver, so a board that wires the reset this way needs
CONFIG_RESET_GPIO; without it the reset is skipped. Imply it, so it is
enabled by default, and say so in the help text. The timing follows the
vendor's driver for the GSW150: asserted for 250 ms, then 1 s before the
switch is accessed. No timing is known for the other GSW1xx parts, so
they get the same.

The reset also returns the RGMII slew rates to their power-on defaults,
so a board that uses reset-gpios sets the ones it needs in its device
tree.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 drivers/net/dsa/lantiq/Kconfig      |  5 +++++
 drivers/net/dsa/lantiq/mxl-gsw1xx.c | 26 ++++++++++++++++++++++++++
 drivers/net/dsa/lantiq/mxl-gsw1xx.h |  6 ++++++
 3 files changed, 37 insertions(+)

diff --git a/drivers/net/dsa/lantiq/Kconfig b/drivers/net/dsa/lantiq/Kconfig
index 98efeef266..c0f2e36bf6 100644
--- a/drivers/net/dsa/lantiq/Kconfig
+++ b/drivers/net/dsa/lantiq/Kconfig
@@ -16,6 +16,7 @@ config NET_DSA_MXL_GSW1XX
 	select NET_DSA_TAG_MXL_GSW1XX
 	select NET_DSA_LANTIQ_COMMON
 	select PHY_COMMON_PROPS
+	imply RESET_GPIO
 	help
 	  This enables support for the Intel/MaxLinear GSW1xx family of 1GE
 	  switches.
@@ -25,3 +26,7 @@ config NET_DSA_MXL_GSW1XX
 	    GSW141 6 port, 4 PHYs, RGMII & SGMII
 	    GSW145 6 port, 4 PHYs, RGMII & SGMII/2500Base-X, industrial temperature
 	    GSW150 7 port, 5 PHYs, 1x GMII/RGMII, 1x RGMII
+
+	  A switch whose hardware reset is described with reset-gpios is
+	  only reset when RESET_GPIO is enabled as well, which this option
+	  does by default.
diff --git a/drivers/net/dsa/lantiq/mxl-gsw1xx.c b/drivers/net/dsa/lantiq/mxl-gsw1xx.c
index 0c7ea242a6..33b73b2ed5 100644
--- a/drivers/net/dsa/lantiq/mxl-gsw1xx.c
+++ b/drivers/net/dsa/lantiq/mxl-gsw1xx.c
@@ -18,6 +18,7 @@
 #include <linux/phy/phy-common-props.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
+#include <linux/reset.h>
 #include <linux/workqueue.h>
 #include <net/dsa.h>
 
@@ -719,6 +720,7 @@ static int gsw1xx_serdes_pcs_init(struct gsw1xx_priv *priv)
 static int gsw1xx_probe(struct mdio_device *mdiodev)
 {
 	struct device *dev = &mdiodev->dev;
+	struct reset_control *reset;
 	struct gsw1xx_priv *priv;
 	u32 version, val;
 	u8 shellver;
@@ -737,6 +739,30 @@ static int gsw1xx_probe(struct mdio_device *mdiodev)
 	if (!priv->gswip.hw_info)
 		return -EINVAL;
 
+	/* The MDIO core handles reset-gpios only for PHYs. Reset the switch
+	 * here, so it does not run with whatever the bootloader configured.
+	 */
+	reset = devm_reset_control_get_optional_exclusive(dev, NULL);
+	if (IS_ERR(reset))
+		return dev_err_probe(dev, PTR_ERR(reset),
+				     "failed to get reset control\n");
+
+	if (reset) {
+		ret = reset_control_assert(reset);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to assert reset\n");
+
+		fsleep(GSW1XX_RESET_ASSERT_US);
+
+		ret = reset_control_deassert(reset);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to deassert reset\n");
+
+		fsleep(GSW1XX_RESET_DEASSERT_US);
+	}
+
 	priv->gswip.gswip = gsw1xx_regmap_init(priv, "switch",
 					       GSW1XX_SWITCH_BASE, 0xfff);
 	if (IS_ERR(priv->gswip.gswip))
diff --git a/drivers/net/dsa/lantiq/mxl-gsw1xx.h b/drivers/net/dsa/lantiq/mxl-gsw1xx.h
index 81bc00eabb..7d91a7b7e2 100644
--- a/drivers/net/dsa/lantiq/mxl-gsw1xx.h
+++ b/drivers/net/dsa/lantiq/mxl-gsw1xx.h
@@ -19,6 +19,12 @@
 
 #define GSW1XX_SYS_CLK_FREQ			340000000
 
+/* Hardware reset timing of the vendor's driver for the GSW150, which is the
+ * only one known and is used for all the GSW1xx parts
+ */
+#define GSW1XX_RESET_ASSERT_US			250000
+#define GSW1XX_RESET_DEASSERT_US		1000000
+
 /* SMDIO switch register base address */
 #define GSW1XX_SMDIO_BADR			0x1f
 #define  GSW1XX_SMDIO_BADR_UNKNOWN		-1

-- 
Git-155)


