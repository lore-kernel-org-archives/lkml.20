Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794770531;
	b=PoJuOOfGzJhk/K4idgr5uHCjVoQIt24cyPxz3UD1PX2CEpBQEexWHC/xklFLUPkC8gOF
	 AFKZYRfbDQQsoJ0JZp8z3yyDc13MSdkp2KjIvpJy7cQT3rRNAPyWITIyEVe1Y4mN7Qaca
	 /vG2rboufvpuJPrCCpheFWsT9e5+QkPdrjs9QuQK1MWeSwHmYBqK2Bi0TgKe34CPXqzPl
	 NleReQeveZ69JD1cEa7S/8Bv5NvtAzqolw2vsyB2sVlfGn4Lta4w71+o7MXB1Bgg3MtgP
	 cirw8mh7c/JXBCQSyLn/hK1D2/Y3tLYF8rF1DiwfygVevKNTNXfKno1lqZu8Z9K/dkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794770531;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=8N8NLCTo0g5vPdM1WgGpCKsKl3w4IZ0gBgY6CLXYvYg=;
	b=LD2BXH1J5rFJsf8ipBH4yU9z4LqIu+Lx+Y5Ga/JGruqdyV6C8yGmT3RMgD7EKu+VrAe1
	 SrT59WLq7RWnLMzDpWnETopXCoHVLkPHb1dusCBldu8KyWoDxOP/Qd8OidseJI/+ndSub
	 LXSBaHtPlSiV6KbUbUd1raQBm296p5FeG0bhMw8fmrMiz3NN7PiqFaYNohWEn8UluRd/0
	 bEkTRACNMKmYzp+kRhYLvFXn1NTmmSaexkUk/JzeadCwFQxb82gmOxCMe315NgO/UkozF
	 retziL9UHPpGkAvaNKD2/aNtBv1kzvJp60TtIh2s+A6jDSdAQUZpD3Aa3912EgbyRFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ISgGePwb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CFC606A323;
	Sun, 15 Nov 2026 19:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ISgGePwb
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794770531;
	b=xYRFjuWAVlDJt+GpEyku2jK05KjUb/MktKM1cjB0roVzaNOixjCzlFaV9trdNhihaq96
	 shyUJEdZuURKUzangJrHVUlVYvQ4SYJx4VjotmKb7xx4piUdhGHAjSN9PhXZzbKvTA+Oe
	 LYhHXkxaL5U7J2kcUpf3fGu1+MUQMJEPWhC0Z2yCa+5iyQsmp1zhb1LD1Vs8POJq3gUsv
	 kj+TJmVGr9EY9m2cudOWF3LFOcXnY0jG/CsehwHzv8C2w3rkRFPAD+yve4171/wq2JGyR
	 s/RoTG/1n+pJDuMblwfMs+CGONieCuk/gx71Pgr2wdpIWNSWTvfVwqHibp4NWjmIBgw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794770531;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=8N8NLCTo0g5vPdM1WgGpCKsKl3w4IZ0gBgY6CLXYvYg=;
	b=iVS2DNy0yeHNIv7YW+O993qEpCA8pBLdJ0+zmpdvrY2+amZs0xvCMsi5nFExuovsdCK6
	 p7f7Z82sStLYxSyp5PktXHP5YZ9PJz0rn1H6pZimQRJW/QBqFW07FRJpQkaZzdy3+yVmA
	 tOBc2cKaty9ZHvyfoyX4noqYeQCTncnjx/al7UeD40hybNABuclTeijlOXj+O7YhRRkFI
	 4D2/OCFH48DVpzE3AwpCeSj2djG0Ty0MgMX3Rrbjc6zDfhuRNqOvHS+nJX0hTqwDS6kMo
	 LymGJH4Y0h4gcE8vG7SAwmU5McXVtS6Es6desWbV9P7zbWazT2upo3TeKz8ZdVx39Qw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D7F071F000C4;
	Sun, 15 Nov 2026 19:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794770531;
	bh=8N8NLCTo0g5vPdM1WgGpCKsKl3w4IZ0gBgY6CLXYvYg=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=ISgGePwbIF3dMM4JEP7VqeQPjJWkzOcneRlS3voc4blfvKsF7B2OAnah9vp5EL5Ek
	 QL9fHfUAWtVIl2cM8xKdaW2jk1Jpqqx+lA23Hidgc1EP5s3TsbjDsJR+vQ20UbtK6P
	 faJFkVnKlDdv8oLDvoSO0csVikZ350Kdls1EM96Yfa3RnXs+ZXbcfL1GJ1wEZ68s+j
	 Zc01T/lafhvGuDuH9wiEjf3tubN06bq3EnDaXQZnjUdEw0cJ05sy6MDqFknoBMDg9n
	 avhFVVJE5lhEXY2jMl/QUcKnSw+FD5B/RWkG4GVWkergAYLR3QSQrlRXuNO7R4f7ZL
	 yTz4DcZ742NeQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6B7094A153;
	Sun, 15 Nov 2026 19:22:10 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Sun, 15 Nov 2026 19:22:08 +0000
Subject: [PATCH net] net: mdio: mux-meson-g12a: keep the MAC data path when
 switching MDIO
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
Message-Id: <20261115-g12a-mux-data-path-v1-1-011dad738698@iav.lv>
X-B4-Tracking: v=1; b=H4sIAF8G+moC/x3MQQqEMAxA0atI1gZMcBTnKoOL1EbNwiptZxDEu
 1tm+Rb/X5A0miZ4VxdE/VmyPRRQXcG0SlgUzRcDN9wR0QsXYsHte6KXLHhIXrFrWZx3U+94gBI
 eUWc7/9MPBM0w3vcDR/PlzWkAAAA=
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4492; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=rixsLn/9QY2RgeRhk+RdadQVMXkG8S6mNv5cUWus1nk=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFm/2BK38l3+vnLXneB3c4Um/vN+9ndKXUs372TV2JmGP
 g/ehh+70FHKwiDGxSArpsgy4ZDGrYwlV//6e5g/gJnDygQyhIGLUwAmcmonw//q4PWZTL6G15tS
 ArUFlx2RiTr89XnppPMWR8ybJ/lerlrCyHDh/pOaGTX+SqGnXeY0aiQ3L36XLxrxqp1Zvtw+leX
 3Sg4A
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv
Content-Transfer-Encoding: 7bit

From: Igor Velkov <iav@iav.lv>

Switching the mux to the internal MDIO bus writes SMI_SRC_MAC together
with USE_INTERNAL and RX_CLK_EPHY to ETH_PHY_CNTL2. The last two move the
MAC data path and RX clock to the internal PHY. On boards whose MAC uses
an external PHY, any access to the internal PHY stops reception until an
access to the external bus switches the mux back.

phylib suspends and resumes the unattached internal PHY across system
sleep. stmmac sets mac_managed_pm, and with Wake-on-LAN in the MAC
phylink_resume() does not start the external PHY, so nothing switches
the mux back. On ODROID-HC4 (RTL8211F), after suspend-to-RAM with WoL in
the MAC and an RTC wakeup, ETH_PHY_CNTL2 stays at 0x260 and the MAC
receives nothing while TX works.

With the MAC on the external PHY, SMI_SRC_MAC alone is enough to read
the internal PHY ID (0x0180/0x3301) while RX keeps running; adding
USE_INTERNAL or RX_CLK_EPHY stops RX.

Set the data path bits only when the MAC's phy-handle names a PHY on
the internal bus. As in dwmac-rk, which reads phy-is-integrated from
that node, the node phy-handle names decides; here it is the mux bus
the PHY sits on.

Fixes: 7090425104db ("net: phy: add amlogic g12a mdio mux support")
Signed-off-by: Igor Velkov <iav@iav.lv>
---
Tested on ODROID-HC4: three RTC wakeups from suspend-to-RAM with WoL in
the MAC (ETH_PHY_CNTL2 0x40, RX working), one without WoL.
---
 drivers/net/mdio/mdio-mux-meson-g12a.c | 49 ++++++++++++++++++++++++++++++----
 1 file changed, 44 insertions(+), 5 deletions(-)

diff --git a/drivers/net/mdio/mdio-mux-meson-g12a.c b/drivers/net/mdio/mdio-mux-meson-g12a.c
index 71c44385489d..ed688d48eaf0 100644
--- a/drivers/net/mdio/mdio-mux-meson-g12a.c
+++ b/drivers/net/mdio/mdio-mux-meson-g12a.c
@@ -12,6 +12,7 @@
 #include <linux/iopoll.h>
 #include <linux/mdio-mux.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/phy.h>
 #include <linux/platform_device.h>
 
@@ -56,6 +57,7 @@ struct g12a_mdio_mux {
 	void __iomem *regs;
 	void *mux_handle;
 	struct clk *pll;
+	bool mac_uses_internal_phy;
 };
 
 struct g12a_ephy_pll {
@@ -149,7 +151,7 @@ static const struct clk_ops g12a_ephy_pll_ops = {
 
 static int g12a_enable_internal_mdio(struct g12a_mdio_mux *priv)
 {
-	u32 value;
+	u32 value, cntl2;
 	int ret;
 
 	/* Enable the phy clock */
@@ -169,10 +171,11 @@ static int g12a_enable_internal_mdio(struct g12a_mdio_mux *priv)
 		PHY_CNTL1_CLK_EN |
 		PHY_CNTL1_CLKFREQ;
 	writel(value, priv->regs + ETH_PHY_CNTL1);
-	writel(PHY_CNTL2_USE_INTERNAL |
-	       PHY_CNTL2_SMI_SRC_MAC |
-	       PHY_CNTL2_RX_CLK_EPHY,
-	       priv->regs + ETH_PHY_CNTL2);
+
+	cntl2 = PHY_CNTL2_SMI_SRC_MAC;
+	if (priv->mac_uses_internal_phy)
+		cntl2 |= PHY_CNTL2_USE_INTERNAL | PHY_CNTL2_RX_CLK_EPHY;
+	writel(cntl2, priv->regs + ETH_PHY_CNTL2);
 
 	value |= PHY_CNTL1_PHY_ENB;
 	writel(value, priv->regs + ETH_PHY_CNTL1);
@@ -301,6 +304,41 @@ static int g12a_ephy_glue_clk_register(struct device *dev)
 	return 0;
 }
 
+/* Like dwmac-rk: the PHY named by the MAC's phy-handle decides the data path */
+static bool g12a_mac_uses_internal_phy(struct device_node *mux_np)
+{
+	struct device_node *parent_bus, *mac, *phy, *phy_bus, *mux;
+	bool internal = false;
+	u32 reg;
+
+	parent_bus = of_parse_phandle(mux_np, "mdio-parent-bus", 0);
+	if (!parent_bus)
+		return false;
+
+	mac = of_get_parent(parent_bus);
+	of_node_put(parent_bus);
+	if (!mac)
+		return false;
+
+	phy = of_parse_phandle(mac, "phy-handle", 0);
+	of_node_put(mac);
+	if (!phy)
+		return false;
+
+	phy_bus = of_get_parent(phy);
+	of_node_put(phy);
+	if (!phy_bus)
+		return false;
+
+	mux = of_get_parent(phy_bus);
+	if (mux == mux_np && !of_property_read_u32(phy_bus, "reg", &reg))
+		internal = (reg == MESON_G12A_MDIO_INTERNAL_ID);
+	of_node_put(mux);
+	of_node_put(phy_bus);
+
+	return internal;
+}
+
 static int g12a_mdio_mux_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -313,6 +351,7 @@ static int g12a_mdio_mux_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	platform_set_drvdata(pdev, priv);
+	priv->mac_uses_internal_phy = g12a_mac_uses_internal_phy(dev->of_node);
 
 	priv->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->regs))

---
base-commit: aa40afa831ebfe45e40a23721711059f2ac584d4
change-id: 20261115-g12a-mux-data-path-642abdbc7b29

Best regards,
-- 
Igor Velkov <iav@iav.lv>


