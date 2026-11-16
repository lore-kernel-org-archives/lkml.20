Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.135.140.105
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854054;
	b=sZb9bpDo5jfi9IJyjYo18MBQiOBwQKRVhBdy1rQFku4/WOi5/0o7whZMqZCJoxRf3eb3
	 kZFgP13/+cYmGt5P7E8sNuMAGSnFob6hP9LxTQOxUkuupKPHvCumTsA1B28Gi64TEx0U0
	 qFw0qpW5sjkQYDq73Fue0FNK2I3Jmfb+KAc0z0zCJ1qLnsMVW1FaX81mFdZJPgd9/Z8Z4
	 W2pJqsJlvXd9unxE2TZrY0r3qdadHgq6hgdubIerg46aCrKUDLMP7/d+Q8ozLU3g1xb5D
	 sNx16PxLjt6V/N/efaykA8QnhX+liQ7r5EQfnPafKurQmiea9cDJphmzeSV7QxGe6RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854054;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-Id:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=5dFXIsn66BgpcaL02+D6hymno/ysNYMGfyTni/ZfKzE=;
	b=J02GylLhxY6E74k6bpAikw6dWX+raj9xBZkpEo47DMhKnbbmcIsY8xNprfKpUlLQVjNy
	 HLh7sAssZMe4OIF8Z/CQ2pSFqhzwJk91LH+7mmCkg/T7jRMAVY6HzzG135IoLo2uBPqKp
	 AsWVaI8cz1rRByoXkOlQOJBZCWG2b8kNqVE+xc6JrMfrzbR+1zuIXTdGgFvygXqFuzz40
	 PxLey8WBeL2UhPTXsK+1Z3PTZbBFO6/O2XXPO0sMqzbHmT7ZDk/TZqJUSJOHS51RDByiL
	 o36leePEsa+/XUOA4q5h7JmR5tQSZ+XQR0Qh4JoEXrAvjWX2XEwpKK0LelCZLb+eUMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cjdns.fr;
	spf=pass smtp.mailfrom=cjdns.fr;
	dkim=pass header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=XnIurmEQ;
	arc=none smtp.remote-ip=5.135.140.105
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C684E606A329;
	Mon, 16 Nov 2026 18:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C684E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=XnIurmEQ
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 34DDC4FAEA4;
	Mon, 16 Nov 2026 19:33:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1794854050; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=5dFXIsn66BgpcaL02+D6hymno/ysNYMGfyTni/ZfKzE=;
	b=XnIurmEQ2/c/p0ClFBPW/mfWqDnzAafKy+X8gcsvq+RVJhkqb/M/9MReLgRn0pHWgC28eg
	k/fYj7LlKsbkJDUaaJqFoyQw3gUuqRXTiagUSteEtOUvW/dWDs9wn215WGHSodHpDeL2KR
	0ON9OqYQDCqQfsLlz74PPRUzsuKSAW1qEXOH67qhEWK4QsaKtc66Su96bUTalUkSiq/ONL
	+X+vkNZhueEEoRelefUgYpyCMJscK18D/Mlcu9k9m8i4HYt4rFoCgYkMsDdGzdySs5SRk9
	KADSQ9v4WuhO6/dUF6+5y3W19oUJVM/3e/lCnlsR6k+gwCnICfsAhh5vH9FVQw==
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
Subject: [net-next v5 1/7] net: dsa: mt7530: get ctrl phy addr using a function
Date: Mon, 16 Nov 2026 18:33:26 +0000
Message-Id: <20261116183332.168858-2-cjd@cjdns.fr>
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

The MDIO MT7530 has 5 integrated PHYs, of these, the first PHY has
the additional registers that are used for such things as configuring
the clock configuration for the switch. The switch is typically on
MDIO address 31 and the PHYs are 0, 1, 2, 3, and 4 with 0 being the
special one. So taking the address of mdiodev (the switch) add 1 and
modulo 31 finds the first PHY.

However there are a number of MMIO based implementations of MT7530
and on these, mdiodev is NULL though they often still have a control
PHY for the purpose. Move MT753X_CTRL_PHY_ADDR to a function which
handles the NULL condition somewhat more gracefully and allows a
place for MMIO implementations to add special case handling to
provide their control PHY address.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 drivers/net/dsa/mt7530.c | 54 +++++++++++++++++++++-------------------
 drivers/net/dsa/mt7530.h |  2 --
 2 files changed, 29 insertions(+), 27 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index d5a199293f78..3bfe29b3b93e 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -46,6 +46,16 @@ static const struct mt7530_mib_desc mt7530_mib[] = {
 	MIB_DESC(1, MT7530_PORT_MIB_RX_ARL_DROP, "RxArlDrop"),
 };
 
+static int
+mt753x_ctrl_phy_addr(struct mt7530_priv *priv)
+{
+	if (WARN_ON_ONCE(!priv->mdiodev))
+		return 0;
+
+	/* Default is 1st PHY */
+	return (priv->mdiodev->addr + 1) & (PHY_MAX_ADDR - 1);
+}
+
 static void
 mt7530_mutex_lock(struct mt7530_priv *priv)
 {
@@ -63,32 +73,30 @@ mt7530_mutex_unlock(struct mt7530_priv *priv)
 static void
 core_write(struct mt7530_priv *priv, u32 reg, u32 val)
 {
+	int ctl_phy = mt753x_ctrl_phy_addr(priv);
 	struct mii_bus *bus = priv->bus;
 	int ret;
 
 	mt7530_mutex_lock(priv);
 
 	/* Write the desired MMD Devad */
-	ret = bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr),
-			 MII_MMD_CTRL, MDIO_MMD_VEND2);
+	ret = bus->write(bus, ctl_phy, MII_MMD_CTRL, MDIO_MMD_VEND2);
 	if (ret < 0)
 		goto err;
 
 	/* Write the desired MMD register address */
-	ret = bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr),
-			 MII_MMD_DATA, reg);
+	ret = bus->write(bus, ctl_phy, MII_MMD_DATA, reg);
 	if (ret < 0)
 		goto err;
 
 	/* Select the Function : DATA with no post increment */
-	ret = bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr),
+	ret = bus->write(bus, ctl_phy,
 			 MII_MMD_CTRL, MDIO_MMD_VEND2 | MII_MMD_CTRL_NOINCR);
 	if (ret < 0)
 		goto err;
 
 	/* Write the data into MMD's selected register */
-	ret = bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr),
-			 MII_MMD_DATA, val);
+	ret = bus->write(bus, ctl_phy, MII_MMD_DATA, val);
 err:
 	if (ret < 0)
 		dev_err(&bus->dev, "failed to write mmd register\n");
@@ -99,6 +107,7 @@ core_write(struct mt7530_priv *priv, u32 reg, u32 val)
 static void
 core_rmw(struct mt7530_priv *priv, u32 reg, u32 mask, u32 set)
 {
+	int ctl_phy = mt753x_ctrl_phy_addr(priv);
 	struct mii_bus *bus = priv->bus;
 	u32 val;
 	int ret;
@@ -106,26 +115,23 @@ core_rmw(struct mt7530_priv *priv, u32 reg, u32 mask, u32 set)
 	mt7530_mutex_lock(priv);
 
 	/* Write the desired MMD Devad */
-	ret = bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr),
-			 MII_MMD_CTRL, MDIO_MMD_VEND2);
+	ret = bus->write(bus, ctl_phy, MII_MMD_CTRL, MDIO_MMD_VEND2);
 	if (ret < 0)
 		goto err;
 
 	/* Write the desired MMD register address */
-	ret = bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr),
-			 MII_MMD_DATA, reg);
+	ret = bus->write(bus, ctl_phy, MII_MMD_DATA, reg);
 	if (ret < 0)
 		goto err;
 
 	/* Select the Function : DATA with no post increment */
-	ret = bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr),
+	ret = bus->write(bus, ctl_phy,
 			 MII_MMD_CTRL, MDIO_MMD_VEND2 | MII_MMD_CTRL_NOINCR);
 	if (ret < 0)
 		goto err;
 
 	/* Read the content of the MMD's selected register */
-	ret = bus->read(bus, MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr),
-			MII_MMD_DATA);
+	ret = bus->read(bus, ctl_phy, MII_MMD_DATA);
 	if (ret < 0)
 		goto err;
 	val = ret;
@@ -133,8 +139,7 @@ core_rmw(struct mt7530_priv *priv, u32 reg, u32 mask, u32 set)
 	val &= ~mask;
 	val |= set;
 	/* Write the data into MMD's selected register */
-	ret = bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr),
-			 MII_MMD_DATA, val);
+	ret = bus->write(bus, ctl_phy, MII_MMD_DATA, val);
 err:
 	if (ret < 0)
 		dev_err(&bus->dev, "failed to write mmd register\n");
@@ -2668,8 +2673,11 @@ mt7531_setup(struct dsa_switch *ds)
 {
 	struct mt7530_priv *priv = ds->priv;
 	u32 val, id;
+	int ctl_phy;
 	int ret, i;
 
+	ctl_phy = mt753x_ctrl_phy_addr(priv);
+
 	/* Reset whole chip through gpio pin or memory-mapped registers for
 	 * different type of hardware
 	 */
@@ -2737,25 +2745,21 @@ mt7531_setup(struct dsa_switch *ds)
 	 * phy_[read,write]_mmd_indirect is called, we provide our own
 	 * mt7531_ind_mmd_phy_[read,write] to complete this function.
 	 */
-	ret = mt7531_ind_c45_phy_read(priv,
-				      MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr),
-				      MDIO_MMD_VEND2, CORE_PLL_GROUP4);
+	ret = mt7531_ind_c45_phy_read(priv, ctl_phy, MDIO_MMD_VEND2,
+				      CORE_PLL_GROUP4);
 	if (ret < 0)
 		return ret;
 
 	val = ret;
 	val |= MT7531_RG_SYSPLL_DMY2 | MT7531_PHY_PLL_BYPASS_MODE;
 	val &= ~MT7531_PHY_PLL_OFF;
-	ret = mt7531_ind_c45_phy_write(priv,
-				       MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr),
-				       MDIO_MMD_VEND2, CORE_PLL_GROUP4, val);
+	ret = mt7531_ind_c45_phy_write(priv, ctl_phy, MDIO_MMD_VEND2,
+				       CORE_PLL_GROUP4, val);
 	if (ret < 0)
 		return ret;
 
 	/* Disable EEE advertisement on the switch PHYs. */
-	for (i = MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr);
-	     i < MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr) + MT7530_NUM_PHYS;
-	     i++) {
+	for (i = ctl_phy; i < ctl_phy + MT7530_NUM_PHYS; i++) {
 		mt7531_ind_c45_phy_write(priv, i, MDIO_MMD_AN, MDIO_AN_EEE_ADV,
 					 0);
 	}
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 2bbbe617b52e..3dabbc99fbbc 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -747,8 +747,6 @@ enum mt7531_xtal_fsel {
 #define  MT7531_PHY_PLL_OFF		BIT(5)
 #define  MT7531_PHY_PLL_BYPASS_MODE	BIT(4)
 
-#define MT753X_CTRL_PHY_ADDR(addr)	(((addr) + 1) & (PHY_MAX_ADDR - 1))
-
 #define CORE_PLL_GROUP5			0x404
 #define  RG_LCDDS_PCW_NCPO1_MASK	GENMASK(15, 0)
 #define  RG_LCDDS_PCW_NCPO1(x)		FIELD_PREP(RG_LCDDS_PCW_NCPO1_MASK, x)
-- 
2.39.5

