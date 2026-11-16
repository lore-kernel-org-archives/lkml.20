Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.135.140.105
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854077;
	b=OLrgBgdOlX8hfdCKzY2G9RVWP4f2PTJyy2WtDQVJY1nc4UsY/+tv2nT+NkgFggXz0ufK
	 TQbxp7NILEHBeddxtvGredR+mduNRuYibgGNIUs2ksl16N4ii4TaLHNUU16pZ/nCemLmS
	 IjccM0OqnmQZLDBcwt6AWzncfxjkENbSPMdXf8ysfLFLFkG1l/F3ljTOJLSfv3i8c5JQo
	 g7gP+T+PGnXEHNRJ6eAiWmXP6+ezoojoMDDhNSbsBzQtpHU2pfJ0R6m1OWGo5BWbeue0J
	 3UN5pFGHrfUyi5pv61OE5phDfKWWQ+4ciWNt+NTvSSgoGYTX95101tdT8ZsDTYF1Hfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854077;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-Id:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=NGNYmZje2CE0FpJt6uEIx3mHKeCXpC60tRduZzXRfhw=;
	b=oQkoNYI8U6nL4nAyjKrc1Qb9j0UN0UUwD4u1D6kZl1FOyAB2f5S6R5FNHRvBkfqNsLii
	 PR3+9qfaYLL3HoMrqT1r5C+e02kcuJe5zgluAKEFdXFUUJhN2y+ALCZfKBFnV9S08u7fh
	 FcdhemJ/I+WEA2J70kYKY7pS5GqG1UkbaXp3H0JWxX3O5TQoroD6UbIG6iG4HgEXO9d6l
	 aQ7CJphnGbSUBVcioT0qgh/oSek9alF3WCGKbOsgaMk4TssxwDet6rKHXIXwh8C1UNWxk
	 HXaRp9cXdJZ8602Mo4Ze6brfodEcBzFDVTrWGzVVkS42MBnRriD1Pra+EOfCx9wtA7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cjdns.fr;
	spf=pass smtp.mailfrom=cjdns.fr;
	dkim=pass header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=AhGGywSH;
	arc=none smtp.remote-ip=5.135.140.105
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9B6606A31C;
	Mon, 16 Nov 2026 18:34:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA9B6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=AhGGywSH
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EA3234FAC5B;
	Mon, 16 Nov 2026 19:34:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1794854073; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=NGNYmZje2CE0FpJt6uEIx3mHKeCXpC60tRduZzXRfhw=;
	b=AhGGywSHaZZerzf8U+XqaFSgvVFt/LST/2h0jT9qXh0x9nCs+D1x2TQqvWIHE73AZnr9dz
	2vnuijzf+oFHbLM4RloNkDmJ2M+y0JH+lG1ig2Z9SdhmP++t6iRuoHFhH6G0U2q+jfUkgb
	tARku9ZRa9KsMGtK7CuSHL6EqJ7xeH/sKWV2ZxwwqQHA/xoeJOVJAMrie8Cbcozx8/3Fj7
	dV+xqEetbBQeCcxIxThQkAFgAtfbzxGFDNvWmgDmaHCwYAVp9iZnFZpRll0QXuYtkgo/VH
	v6VUM0y/undIu1QZv1eT/t6gEbooNWCCWi02hpBPcoBhrjkjdXYClUoaUqN9Wg==
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
Subject: [net-next v5 5/7] net: dsa: mediatek: support MDIO switch downstream of MMIO switch
Date: Mon, 16 Nov 2026 18:33:30 +0000
Message-Id: <20261116183332.168858-6-cjd@cjdns.fr>
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

The MT7530 / MT7531 can connect via either MDIO or MMIO. In MMIO mode
the switch provides its own MDIO bus which connects to its integrated
PHYs, but also can be connected to other things, such as another
switch.

If the MDIO bus contains another switch, then the upstream switch
will register but it will not setup the DSA tree because the
downstream switch is missing. Without the complete DSA tree,
mt753x_setup() will not be called on the switch and therefore
mt7530_setup_mdio() is never called so the downstream switch never
registers.

However, the call to mt7530_setup_mdio() from mt753x_setup() must
also be kept because all PHYs are expected to be operational after
mt753x_setup() returns.

1. Move TOP_SIG_CTRL_NORMAL bit set to mt7530_setup() so it will only
be called after switch reset, make it unconditional since mt7530_setup
is MT7530 only.
2. Move mt7530_setup_irq() to mt7530_setup_mdio() so it can be called
early.
3. Make mt7530_setup_mdio() able to be called a second time without
side-effects.
4. Call mt7530_setup_mdio() early from mt7988_probe() if "mdio" child
DT node is present and dsa_register_switch() returns 0 (not all
switches probed yet)
5. Add lockdep classes to mutex because MDIO switch under MMIO switch
will cause one lock to be taken after the other.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 drivers/net/dsa/mt7530-mmio.c | 23 ++++++++++++++++++-
 drivers/net/dsa/mt7530.c      | 42 ++++++++++++++++++++++++++---------
 drivers/net/dsa/mt7530.h      | 10 +++++++++
 3 files changed, 64 insertions(+), 11 deletions(-)

diff --git a/drivers/net/dsa/mt7530-mmio.c b/drivers/net/dsa/mt7530-mmio.c
index 5d467be2a32c..ab6d92ab3ec0 100644
--- a/drivers/net/dsa/mt7530-mmio.c
+++ b/drivers/net/dsa/mt7530-mmio.c
@@ -30,6 +30,7 @@ static int
 mt7988_probe(struct platform_device *pdev)
 {
 	struct mt7530_priv *priv;
+	struct device_node *mnp;
 	void __iomem *base_addr;
 	int ret;
 
@@ -61,7 +62,27 @@ mt7988_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->regmap))
 		return PTR_ERR(priv->regmap);
 
-	return dsa_register_switch(priv->ds);
+	ret = dsa_register_switch(priv->ds);
+
+	if (ret)
+		return ret;
+
+	/*
+	 * If not all switches in the hierarchy have been probed,
+	 * dsa_register_switch() returns 0 without calling mt753x_setup().
+	 * Call mt7530_setup_mdio() because there's a chance that the missing
+	 * switch is on the MDIO bus. If "mdio" node is not present then there
+	 * is definitely no MDIO switch in the DT, and also if "mdio" is not
+	 * present then phys_mii_mask is relevant and that is not set until
+	 * dsa_switch_setup.
+	 */
+	mnp = of_get_child_by_name(pdev->dev.of_node, "mdio");
+	if (mnp) {
+		of_node_put(mnp);
+		ret = mt7530_setup_mdio(priv);
+	}
+
+	return ret;
 }
 
 static void mt7988_remove(struct platform_device *pdev)
diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 53ac692d5ba9..4390982a5e22 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2497,11 +2497,6 @@ mt7530_setup_irq(struct mt7530_priv *priv)
 		return irq ? : -EINVAL;
 	}
 
-	/* This register must be set for MT7530 to properly fire interrupts */
-	if (priv->id == ID_MT7530 || priv->id == ID_MT7621)
-		regmap_set_bits(priv->regmap, MT7530_TOP_SIG_CTRL,
-				TOP_SIG_CTRL_NORMAL);
-
 	ret = devm_regmap_add_irq_chip_fwnode(dev, dev_fwnode(dev),
 					      priv->regmap, irq,
 					      IRQF_ONESHOT,
@@ -2530,7 +2525,7 @@ mt7530_free_mdio_irq(struct mt7530_priv *priv)
 	}
 }
 
-static int
+int
 mt7530_setup_mdio(struct mt7530_priv *priv)
 {
 	struct device_node *mnp, *np = priv->dev->of_node;
@@ -2540,6 +2535,14 @@ mt7530_setup_mdio(struct mt7530_priv *priv)
 	static int idx;
 	int ret = 0;
 
+	/* Already done */
+	if (priv->child_bus)
+		return 0;
+
+	ret = mt7530_setup_irq(priv);
+	if (ret)
+		return ret;
+
 	mnp = of_get_child_by_name(np, "mdio");
 
 	if (mnp && !of_device_is_available(mnp))
@@ -2581,6 +2584,7 @@ mt7530_setup_mdio(struct mt7530_priv *priv)
 	of_node_put(mnp);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(mt7530_setup_mdio);
 
 static int
 mt7530_setup(struct dsa_switch *ds)
@@ -2684,6 +2688,10 @@ mt7530_setup(struct dsa_switch *ds)
 			   MT7530_CHG_TRAP | MT7530_PHY_INDIRECT_ACCESS,
 			   MT7530_CHG_TRAP);
 
+	/* This register must be set for MT7530 to properly fire interrupts */
+	regmap_set_bits(priv->regmap, MT7530_TOP_SIG_CTRL,
+			TOP_SIG_CTRL_NORMAL);
+
 	if ((val & MT7530_XTAL_MASK) == MT7530_XTAL_40MHZ)
 		mt7530_pll_setup(priv);
 
@@ -3405,10 +3413,10 @@ mt753x_setup(struct dsa_switch *ds)
 	if (ret)
 		return ret;
 
-	ret = mt7530_setup_irq(priv);
-	if (ret)
-		return ret;
-
+	/*
+	 * This must be called before mt753x_setup() returns because the DSA
+	 * core synchronously sets up ports and expects PHYs to be operational.
+	 */
 	ret = mt7530_setup_mdio(priv);
 	if (ret)
 		return ret;
@@ -3834,6 +3842,15 @@ const struct mt753x_info mt753x_table[] = {
 };
 EXPORT_SYMBOL_GPL(mt753x_table);
 
+/*
+ * An MMIO switch can have another MDIO switch connected to its
+ * MDIO interface and in that case, actions on the MDIO switch will call
+ * through to mt7531_ind_c(22|45)_phy_(read|write) making a lock
+ * dependency.
+ */
+static struct lock_class_key mt7530_mmio_mutex_key;
+static struct lock_class_key mt7530_mdio_mutex_key;
+
 int
 mt7530_probe_common(struct mt7530_priv *priv)
 {
@@ -3873,6 +3890,11 @@ mt7530_probe_common(struct mt7530_priv *priv)
 	spin_lock_init(&priv->stats_lock);
 	INIT_DELAYED_WORK(&priv->stats_work, mt7530_stats_poll);
 
+	if (priv->bus)
+		lockdep_set_class(&priv->reg_mutex, &mt7530_mdio_mutex_key);
+	else
+		lockdep_set_class(&priv->reg_mutex, &mt7530_mmio_mutex_key);
+
 	dev_set_drvdata(dev, priv);
 
 	return 0;
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 5b7394f6383c..c86bc4bca29b 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -969,6 +969,16 @@ struct mt7530_hw_stats {
 int mt7530_probe_common(struct mt7530_priv *priv);
 void mt7530_remove_common(struct mt7530_priv *priv);
 
+/*
+ * When an MMIO based switch has an MDIO bus which contains a downstream MDIO
+ * switch, the MDIO bus is not normally setup until mt753x_setup() has been
+ * called. But mt753x_setup() is not called until DSA sees that every switch in
+ * the tree has been probed. Calling mt7530_setup_mdio() after at the end of
+ * the MMIO probe function allows the downstream switch to register, completing
+ * the tree.
+ */
+int mt7530_setup_mdio(struct mt7530_priv *priv);
+
 extern const struct mt753x_info mt753x_table[];
 
 #endif /* __MT7530_H */
-- 
2.39.5

