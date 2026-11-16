Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.135.140.105
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854072;
	b=4PLDM/IBYfa44CKsQgTVU2hPWk5L7JOaxqQp42Tc58s+/41tBGe1KUc21WpuxaAGK1BU
	 q2BFxvZLRPaHHSHA7kHocVWORcbBTtd4wtXPAvJhHvwPhctnOqimfwrwxM/oWLZ6AY+ez
	 Zqr/iveRCXbNsoeNb4XdaFRW0gAVHhhaFfw8/ywzxXYk1u9DpT5KA35VyRxUQuvcBQbBi
	 fmuyOReL3KES03hVl0L8xVrCUk/GxLHP2ANHEru2I9oJEooaA8TqmswtYZIHDUfAuB7Fc
	 7M6AarO6+lOhzY6TAvaqC/shiM3uRNWKDHyZGfEI3CiYZGjKgyy8VzSrzFaJCnQCYYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854072;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-Id:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=yGB+4/WN/zPovzw7G2T/4u7idsdGWZ9CIakctQaFtFM=;
	b=0f7U/wQTXlVElbOcmp4z77MYjvBUo4Ka8xfZ1c90kdhD6BXMVhGJ3VKzOIcLwYL9uvMP
	 LeE3kC/kTIrFXBysaPkrhvO3tshDMC5zxrKk5gvJ6N/5JGSpa1ILl66xOI3UaOx2h1YJ1
	 d2aT3Rm2132inVle+rp+B6Th9c2ooEhEVuHgJgtPUgT7Z673kuiaZlP1IaggXxdg/t+mN
	 naalvnLYW+U79Zmu9ef+u20oaWhP2bsKO03XY8ola0kSD/Oc6N58vdiZNLzuGL+VS63Cy
	 YfxAntiBCTGPb9qyniTSVLW1VL5jRVW/SqpXMRthJsvB/7cCFybKL0IGwVDT59K0amA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cjdns.fr;
	spf=pass smtp.mailfrom=cjdns.fr;
	dkim=pass header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=iW0RPJwL;
	arc=none smtp.remote-ip=5.135.140.105
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1919606A880;
	Mon, 16 Nov 2026 18:34:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1919606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=iW0RPJwL
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C87654F8EE5;
	Mon, 16 Nov 2026 19:34:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1794854069; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=yGB+4/WN/zPovzw7G2T/4u7idsdGWZ9CIakctQaFtFM=;
	b=iW0RPJwLIjJ+XOoBtizwSR7NbwyMt8Z2MeLNjWvBR2MLAFf0GPGmJHvusxMMcIRBz77WCU
	0OY+6eNN1Xq+FrJ02Uju5sEZOJQEbrH2GXCNW3GkngXaawusZ6GJZla+5X/ct6LGDJxY68
	iNhFjpIrsLq7uQ20EVbAtfnajNId69YMSVOr4BWhmMTmH9YFbMEGV0EGmG6mQ9KQfHIZME
	+Kcruauc450I/OM7zwMeoR+Gcs7Y/MgfoWpkDAjl+EbE1YxfVD1LKWjwUlK6D+25HHERtG
	SiP2aWX3ZR11cCulCYgIcRz5seMT7vlSL4qwI0nPiN8lypmgwpGfC+yu/0k2kQ==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	linux@armlinux.org.uk,
	arinc.unal@arinc9.com,
	Landen.Chao@mediatek.com,
	dqfext@gmail.com,
	sean.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	naseefkm@gmail.com,
	b.larsson@gmx.com,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [net-next v5 4/7] net: dsa: mediatek: support PLL setup on MMIO MT7530
Date: Mon, 16 Nov 2026 18:33:29 +0000
Message-Id: <20261116183332.168858-5-cjd@cjdns.fr>
In-Reply-To: <20261116183332.168858-1-cjd@cjdns.fr>
References: <20261116183332.168858-1-cjd@cjdns.fr>
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
X-Last-TLS-Session-Version: TLSv1.3

On MT7530 and MT7531, PHYs are an integral part of the switch. However,
on MT7530, certain configuration such as PLL setup is done via special
registers on one of the PHYs.

In an MMIO implementation, the MDIO bus is part of the switch itself.
This bus is already setup for PHY calibration so begin using it for
core switch PLL setup.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 drivers/net/dsa/mt7530.c | 15 +++++++++++++++
 drivers/net/dsa/mt7530.h |  4 ++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 09b7e9d2d025..53ac692d5ba9 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -77,6 +77,12 @@ core_write(struct mt7530_priv *priv, u32 reg, u32 val)
 	struct mii_bus *bus = priv->bus;
 	int ret;
 
+	if (!bus)
+		bus = priv->child_bus;
+
+	if (WARN_ON_ONCE(!bus))
+		return;
+
 	mt7530_mutex_lock(priv);
 
 	/* Write the desired MMD Devad */
@@ -112,6 +118,12 @@ core_rmw(struct mt7530_priv *priv, u32 reg, u32 mask, u32 set)
 	u32 val;
 	int ret;
 
+	if (!bus)
+		bus = priv->child_bus;
+
+	if (WARN_ON_ONCE(!bus))
+		return;
+
 	mt7530_mutex_lock(priv);
 
 	/* Write the desired MMD Devad */
@@ -2555,8 +2567,11 @@ mt7530_setup_mdio(struct mt7530_priv *priv)
 	if (priv->irq_domain && !mnp)
 		mt7530_setup_mdio_irq(priv);
 
+	priv->child_bus = bus;
+
 	ret = devm_of_mdiobus_register(dev, bus, mnp);
 	if (ret) {
+		priv->child_bus = NULL;
 		dev_err(dev, "failed to register MDIO bus: %d\n", ret);
 		if (priv->irq_domain && !mnp)
 			mt7530_free_mdio_irq(priv);
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 108c831dd012..5b7394f6383c 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -886,6 +886,9 @@ struct mt753x_info {
  * @dev:		The device pointer
  * @ds:			The pointer to the dsa core structure
  * @bus:		The bus used for the device and built-in PHY
+ * @child_bus:		The bus created by the device, on MDIO implementations
+ *			this is bus indirectly accesses `bus`, on MMIO
+ *			implementations this bus is part of the switch.
  * @regmap:		The regmap instance representing all switch registers
  * @rstc:		The pointer to reset control used by MCM
  * @core_pwr:		The power supplied into the core
@@ -914,6 +917,7 @@ struct mt7530_priv {
 	struct device		*dev;
 	struct dsa_switch	*ds;
 	struct mii_bus		*bus;
+	struct mii_bus		*child_bus;
 	struct regmap		*regmap;
 	struct reset_control	*rstc;
 	struct regulator	*core_pwr;
-- 
2.39.5

