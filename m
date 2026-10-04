Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681333C3BED
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 16:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791130008; cv=none; b=F59vj0x98dc9Dw7rPuSpC3hEctxvJjygGjA/tlcM/5AkIoU3OLFEM40S0+q0xxSUX69KOsbNV4MU+mBhNrSSFDS1Odeah1w+RvMo86sCt9szne41gtYFkXXP4gVtwQYl52HrYtqaUdGy0n4G2/dDPYXrlXFKSjsKoC7XMeqRLYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791130008; c=relaxed/simple;
	bh=VooV3JwsW9yXVHw6azs8gPGTYXD8vRYlcI8YH6GPU/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J+gxU291AdJZAqxwL3BJUSZLzhnKlQwVcp+9aD2kjblhR6lKJH1wOfov2GEf5N1/1/oqTMFtRlaNW1N2yd86RQ5bdBgLtM49pOgrYvCFWCYipr71LoKoy5L75JBnsiISNGgv2zURejTt2zROcUPhNi6Nhe/cNThfCNC9Bw1I8oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eRmFsXSe; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eRmFsXSe"
Received: by mail-pz2-f37.google.com with SMTP id d2e1a72fcca58-886ce63c1c5so188750b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 09:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791130005; x=1791734805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zmSanoQANogxt1xJb6FXY7g5PjS88j7pCYVrEOwfDRQ=;
        b=eRmFsXSeDNPfsKGiEAF9vJbjaXRVSpXOkEgslKh64oPN1051qj2FQ5+7PgdEoyXcGS
         dCkIFWleaMrbZAM62AhZMSnE2UleofWPlRyXghVZp+I0TXwcGyNantRXdcriXk0vlD5r
         u/yKN5OuwwuACGb37fUN+07HPgVAf6ZHzRUGOfD+UWv3vHiWh8U9Ahws5kRIAjyn28Qb
         bP6xFwPYLk1Yd/wSkrpeehKH8Kt1OnAKq8kfZvXEudU5ZOPFAEnmtt3g2i+yLE6tphdj
         hvHn/LJIPdmvxWxL/ceSGeNZO+Ay/2dBy37ny4vKH3l3ugLPeFQwNqOS7Q+556JWEHY6
         MmIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791130005; x=1791734805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zmSanoQANogxt1xJb6FXY7g5PjS88j7pCYVrEOwfDRQ=;
        b=OXPhz9LfAATiardnPLJyOVjgW/8RcPA0v7gXAZhT4d8Cd5O6a2s6cguXBw4ZSJOOSZ
         hQx4V1141WyeyksJaoU0eT9puD/gHonh0ExJGgUbjDMJ19BSYxrAkixOb8wmcY+XiYk7
         rWDD9Klib3xG1VgoleAfOjlsddlH51DFBKreh1BBbc9DkjFcu/+a13vfpGXTccVQtfMi
         wiJeKVneZWP7y9WUvvDgEyK3jNCX0V0nl/7vYDkW+SDST2tUQUbGPPWzzMSzNhy3H+ZJ
         GuJX30fQKgLljrG/wgnQjEOGdlmN/YX2ogoWGYK/V+eFc5PdsD/5BZGZRBMZ+765QqtV
         uDSA==
X-Forwarded-Encrypted: i=1; AKwUvBx8iZFFPYSS8+t0UYnN1JuILF/LihIrHXFcDh0q9qdPp4CcM3AoPwqlUlKMlaAJGEeVTVIvhkuY9wqgUUg=@vger.kernel.org
X-Gm-Message-State: AFuF++nwNzQ5CeRq+xPoJ4ZqIXP4NjnrYU0kv5HL2T5rRbX0FqFC145w
	eG0fXvLBAn7Kj10oOaoT/730tErshBK5aLtk7UbljmuLXGTzPtGSoWCXOfHG7RiBHwY=
X-Gm-Gg: AYBFou2yLX7hAx5YiptcLqTsRTEDMhk3Ll/1gLnpw69nf+ueGGKMTvAt+mNWsoD2wZx
	0YNfRD8x/lbDM1sMhih2SOoxxFNdGR+7vUwZxvHXTxMXfk8APrCP26Pn+N/FHrD3Nir5uvGn9KH
	xZK3rtZjLy5mqlJ7FXWaPy2mjMY8Dn2xjRcn+AOsLVEoBKNeBd4jtXrxJKOX2VKZK48o6kk2nl1
	l8ku3QJIy8Qfb1fW7xfV32KZcAprbOKXOVwWxyQGqyRtMo8G/KLs5++SL41zEgVQ4eGaiFmt4d5
	mR18i1oHlv1t1Bvf/LWP5YW0DxtknPVDaIExZzyXkOdEr7xNUKg4ywkwk6gtRxL10zWK5Jc3h7J
	slVJjYJbNcM5w2pQi8ZkswiqpIBfuwnanar2YeNAk6RF1s8VJCaZgBHBfl1UN8T2tQvVQRMm3/0
	kK7YiEchcnSYg7Ifa/qZZWnrhuaj7ZREZOOP9AqALqruG+bLhEaIuDRsEaeB4cvY8IQqTpe6ZNx
	Ta1UnaeHx41b8UW+rJvQ6IGcQ==
X-Received: by 2002:a05:6a00:138f:b0:883:96f0:da3b with SMTP id d2e1a72fcca58-88af6658e79mr6949737b3a.22.1791130005403;
        Sun, 04 Oct 2026 09:06:45 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661c:1246::1d2:d1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0d247930sm2637789b3a.54.2026.10.04.09.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:06:45 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v5 3/6] net: dsa: motorcomm: Split MIB buffers
Date: Mon,  5 Oct 2026 00:06:17 +0800
Message-ID: <20261004160622.948037-4-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004160622.948037-1-mmyangfl@gmail.com>
References: <20261004160622.948037-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With MIB improvement introduced later, struct yt921x_priv will be over
20 KiB which is not very good for a single kmalloc(). Dynamically
allocate the MIB structures to reduce the size of struct yt921x_priv
(and adjust polling work lifecycle), and do not waste memory on dummy
ports.

Signed-off-by: David Yang <mmyangfl@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/dsa/motorcomm/chip.c | 124 ++++++++++++++++++++++++-------
 drivers/net/dsa/motorcomm/chip.h |  20 +++--
 2 files changed, 112 insertions(+), 32 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 690ee0eb5192..8341d4d1c784 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -270,10 +270,13 @@ static int yt921x_mib_read(struct yt921x_priv *priv, int port)
 {
 	struct device *dev = yt921x_priv_to_device(priv);
 	struct yt921x_port *pp = &priv->ports[port];
-	struct yt921x_mib_stats *mib = &pp->mib;
+	struct yt921x_mib *pm = pp->mib;
+	struct yt921x_mib_stats *mib;
 	int res = 0;
 
-	/* Reading of yt921x_port::mib is not protected by a lock and it's vain
+	mib = &pm->stats;
+
+	/* Reading of yt921x_mib_stats is not protected by a lock and it's vain
 	 * to keep its consistency, since we have to read registers one by one
 	 * and there is no way to make a snapshot of MIB stats.
 	 *
@@ -310,11 +313,11 @@ static int yt921x_mib_read(struct yt921x_priv *priv, int port)
 		WRITE_ONCE(*valp, val);
 	}
 
-	pp->rx_frames = mib->rx_64byte + mib->rx_65_127byte +
+	pm->rx_frames = mib->rx_64byte + mib->rx_65_127byte +
 			mib->rx_128_255byte + mib->rx_256_511byte +
 			mib->rx_512_1023byte + mib->rx_1024_1518byte +
 			mib->rx_jumbo;
-	pp->tx_frames = mib->tx_64byte + mib->tx_65_127byte +
+	pm->tx_frames = mib->tx_64byte + mib->tx_65_127byte +
 			mib->tx_128_255byte + mib->tx_256_511byte +
 			mib->tx_512_1023byte + mib->tx_1024_1518byte +
 			mib->tx_jumbo;
@@ -327,8 +330,9 @@ static int yt921x_mib_read(struct yt921x_priv *priv, int port)
 
 static void yt921x_mib_poll(struct work_struct *work)
 {
-	struct yt921x_port *pp = container_of_const(work, struct yt921x_port,
-						    mib_read.work);
+	struct yt921x_mib *pm = container_of_const(work, struct yt921x_mib,
+						   work.work);
+	struct yt921x_port *pp = pm->port;
 	unsigned long delay = YT921X_STATS_INTERVAL_JIFFIES;
 	struct yt921x_priv *priv = yt921x_port_to_priv(pp);
 	int port = pp->index;
@@ -340,7 +344,7 @@ static void yt921x_mib_poll(struct work_struct *work)
 	if (res)
 		delay *= 4;
 
-	schedule_delayed_work(&pp->mib_read, delay);
+	schedule_delayed_work(&pm->work, delay);
 }
 
 static void
@@ -363,9 +367,14 @@ yt921x_dsa_get_ethtool_stats(struct dsa_switch *ds, int port, uint64_t *data)
 {
 	struct yt921x_priv *priv = dsa_to_yt921x_priv(ds);
 	struct yt921x_port *pp = &priv->ports[port];
-	struct yt921x_mib_stats *mib = &pp->mib;
+	struct yt921x_mib *pm = pp->mib;
+	struct yt921x_mib_stats *mib;
 	size_t j;
 
+	if (!pm)
+		return;
+	mib = &pm->stats;
+
 	mutex_lock(&priv->reg_lock);
 	yt921x_mib_read(priv, port);
 	mutex_unlock(&priv->reg_lock);
@@ -405,16 +414,21 @@ yt921x_dsa_get_eth_mac_stats(struct dsa_switch *ds, int port,
 {
 	struct yt921x_priv *priv = dsa_to_yt921x_priv(ds);
 	struct yt921x_port *pp = &priv->ports[port];
-	struct yt921x_mib_stats *mib = &pp->mib;
+	struct yt921x_mib *pm = pp->mib;
+	struct yt921x_mib_stats *mib;
+
+	if (!pm)
+		return;
+	mib = &pm->stats;
 
 	mutex_lock(&priv->reg_lock);
 	yt921x_mib_read(priv, port);
 	mutex_unlock(&priv->reg_lock);
 
-	mac_stats->FramesTransmittedOK = pp->tx_frames;
+	mac_stats->FramesTransmittedOK = pm->tx_frames;
 	mac_stats->SingleCollisionFrames = mib->tx_single_collisions;
 	mac_stats->MultipleCollisionFrames = mib->tx_multiple_collisions;
-	mac_stats->FramesReceivedOK = pp->rx_frames;
+	mac_stats->FramesReceivedOK = pm->rx_frames;
 	mac_stats->FrameCheckSequenceErrors = mib->rx_crc_errors;
 	mac_stats->AlignmentErrors = mib->rx_alignment_errors;
 	mac_stats->OctetsTransmittedOK = mib->tx_good_bytes;
@@ -441,7 +455,12 @@ yt921x_dsa_get_eth_ctrl_stats(struct dsa_switch *ds, int port,
 {
 	struct yt921x_priv *priv = dsa_to_yt921x_priv(ds);
 	struct yt921x_port *pp = &priv->ports[port];
-	struct yt921x_mib_stats *mib = &pp->mib;
+	struct yt921x_mib *pm = pp->mib;
+	struct yt921x_mib_stats *mib;
+
+	if (!pm)
+		return;
+	mib = &pm->stats;
 
 	mutex_lock(&priv->reg_lock);
 	yt921x_mib_read(priv, port);
@@ -470,7 +489,12 @@ yt921x_dsa_get_rmon_stats(struct dsa_switch *ds, int port,
 {
 	struct yt921x_priv *priv = dsa_to_yt921x_priv(ds);
 	struct yt921x_port *pp = &priv->ports[port];
-	struct yt921x_mib_stats *mib = &pp->mib;
+	struct yt921x_mib *pm = pp->mib;
+	struct yt921x_mib_stats *mib;
+
+	if (!pm)
+		return;
+	mib = &pm->stats;
 
 	mutex_lock(&priv->reg_lock);
 	yt921x_mib_read(priv, port);
@@ -506,7 +530,12 @@ yt921x_dsa_get_stats64(struct dsa_switch *ds, int port,
 {
 	struct yt921x_priv *priv = dsa_to_yt921x_priv(ds);
 	struct yt921x_port *pp = &priv->ports[port];
-	struct yt921x_mib_stats *mib = &pp->mib;
+	struct yt921x_mib *pm = pp->mib;
+	struct yt921x_mib_stats *mib;
+
+	if (!pm)
+		return;
+	mib = &pm->stats;
 
 	stats->rx_length_errors = mib->rx_undersize_errors +
 				  mib->rx_fragment_errors;
@@ -522,8 +551,8 @@ yt921x_dsa_get_stats64(struct dsa_switch *ds, int port,
 	/* stats->tx_heartbeat_errors */
 	stats->tx_window_errors = mib->tx_late_collisions;
 
-	stats->rx_packets = pp->rx_frames;
-	stats->tx_packets = pp->tx_frames;
+	stats->rx_packets = pm->rx_frames;
+	stats->tx_packets = pm->tx_frames;
 	stats->rx_bytes = mib->rx_good_bytes - ETH_FCS_LEN * stats->rx_packets;
 	stats->tx_bytes = mib->tx_good_bytes - ETH_FCS_LEN * stats->tx_packets;
 	stats->rx_errors = stats->rx_length_errors + stats->rx_over_errors +
@@ -542,7 +571,12 @@ yt921x_dsa_get_pause_stats(struct dsa_switch *ds, int port,
 {
 	struct yt921x_priv *priv = dsa_to_yt921x_priv(ds);
 	struct yt921x_port *pp = &priv->ports[port];
-	struct yt921x_mib_stats *mib = &pp->mib;
+	struct yt921x_mib *pm = pp->mib;
+	struct yt921x_mib_stats *mib;
+
+	if (!pm)
+		return;
+	mib = &pm->stats;
 
 	mutex_lock(&priv->reg_lock);
 	yt921x_mib_read(priv, port);
@@ -3649,11 +3683,14 @@ yt921x_phylink_mac_link_down(struct phylink_config *config, unsigned int mode,
 {
 	struct dsa_port *dp = dsa_phylink_to_port(config);
 	struct yt921x_priv *priv = dsa_to_yt921x_priv(dp->ds);
+	struct yt921x_mib *pm;
 	int port = dp->index;
 	int res;
 
 	/* No need to sync; port control block is hold until device remove */
-	cancel_delayed_work(&priv->ports[port].mib_read);
+	pm = priv->ports[port].mib;
+	if (pm)
+		cancel_delayed_work(&pm->work);
 
 	mutex_lock(&priv->reg_lock);
 	res = yt921x_port_down(priv, port);
@@ -3672,6 +3709,7 @@ yt921x_phylink_mac_link_up(struct phylink_config *config,
 {
 	struct dsa_port *dp = dsa_phylink_to_port(config);
 	struct yt921x_priv *priv = dsa_to_yt921x_priv(dp->ds);
+	struct yt921x_mib *pm;
 	int port = dp->index;
 	int res;
 
@@ -3684,7 +3722,9 @@ yt921x_phylink_mac_link_up(struct phylink_config *config,
 		dev_err(dp->ds->dev, "Failed to %s port %d: %i\n", "bring up",
 			port, res);
 
-	schedule_delayed_work(&priv->ports[port].mib_read, 0);
+	pm = priv->ports[port].mib;
+	if (pm)
+		schedule_delayed_work(&pm->work, 0);
 }
 
 static void
@@ -3798,16 +3838,52 @@ yt921x_dsa_get_tag_protocol(struct dsa_switch *ds, int port,
 	return DSA_TAG_PROTO_YT921X;
 }
 
+static void yt921x_dsa_port_teardown(struct dsa_switch *ds, int port)
+{
+	struct yt921x_priv *priv = dsa_to_yt921x_priv(ds);
+	struct yt921x_port *pp = &priv->ports[port];
+	struct yt921x_mib *pm = pp->mib;
+
+	/* get_stats64() might not be synchronized with port_teardown(), hold
+	 * the MIB block till the device teardown
+	 */
+	if (pm)
+		disable_delayed_work_sync(&pm->work);
+}
+
 static int yt921x_dsa_port_setup(struct dsa_switch *ds, int port)
 {
 	struct yt921x_priv *priv = dsa_to_yt921x_priv(ds);
+	struct yt921x_port *pp = &priv->ports[port];
+	const struct yt921x_info *info = priv->info;
+	struct device *dev = yt921x_priv_to_device(priv);
+	struct yt921x_mib *pm = pp->mib;
 	int res;
 
+	if (!pm && (BIT(port) & yt921x_info_ports_mask(info))) {
+		pm = devm_kzalloc(dev, sizeof(*pm), GFP_KERNEL);
+		if (!pm)
+			return -ENOMEM;
+		pp->mib = pm;
+
+		pm->port = pp;
+		INIT_DELAYED_WORK(&pm->work, yt921x_mib_poll);
+		/* Start disabled, so that the enable below always pairs with
+		 * either this disable or the one from a previous teardown
+		 */
+		disable_delayed_work_sync(&pm->work);
+	}
+
 	mutex_lock(&priv->reg_lock);
 	res = yt921x_port_setup(priv, port);
 	mutex_unlock(&priv->reg_lock);
+	if (res)
+		return res;
 
-	return res;
+	if (pm)
+		enable_delayed_work(&pm->work);
+
+	return 0;
 }
 
 /* Not "port" - DSCP mapping is global */
@@ -4382,6 +4458,7 @@ static const struct dsa_switch_ops yt921x_dsa_switch_ops = {
 	/* port */
 	.get_tag_protocol	= yt921x_dsa_get_tag_protocol,
 	.phylink_get_caps	= yt921x_dsa_phylink_get_caps,
+	.port_teardown		= yt921x_dsa_port_teardown,
 	.port_setup		= yt921x_dsa_port_setup,
 #if IS_ENABLED(CONFIG_DCB)
 	/* dscp */
@@ -4411,12 +4488,6 @@ static void yt921x_mdio_remove(struct mdio_device *mdiodev)
 	if (!priv)
 		return;
 
-	for (size_t i = ARRAY_SIZE(priv->ports); i-- > 0; ) {
-		struct yt921x_port *pp = &priv->ports[i];
-
-		disable_delayed_work_sync(&pp->mib_read);
-	}
-
 	dsa_unregister_switch(&priv->ds);
 
 	for (unsigned int i = 0; i < ARRAY_SIZE(priv->acl_blks); i++) {
@@ -4464,7 +4535,6 @@ static int yt921x_mdio_probe(struct mdio_device *mdiodev)
 		struct yt921x_port *pp = &priv->ports[i];
 
 		pp->index = i;
-		INIT_DELAYED_WORK(&pp->mib_read, yt921x_mib_poll);
 	}
 
 	ds = &priv->ds;
diff --git a/drivers/net/dsa/motorcomm/chip.h b/drivers/net/dsa/motorcomm/chip.h
index c1b24b6d1d97..d1764b635630 100644
--- a/drivers/net/dsa/motorcomm/chip.h
+++ b/drivers/net/dsa/motorcomm/chip.h
@@ -885,6 +885,15 @@ struct yt921x_mib_stats {
 	u64 tx_oam;
 };
 
+struct yt921x_mib {
+	struct yt921x_port *port;
+
+	struct delayed_work work;
+	struct yt921x_mib_stats stats;
+	u64 rx_frames;
+	u64 tx_frames;
+};
+
 struct yt921x_acl_entry {
 	u32 key[2];
 	u32 mask[2];
@@ -917,11 +926,6 @@ struct yt921x_port {
 	/* BR_ISOLATED */
 	bool isolated:1;
 
-	struct delayed_work mib_read;
-	struct yt921x_mib_stats mib;
-	u64 rx_frames;
-	u64 tx_frames;
-
 #if IS_ENABLED(CONFIG_NET_DSA_YT921X_LEDS)
 	unsigned char led_duty;
 	unsigned short led_cycle;
@@ -932,6 +936,7 @@ struct yt921x_port {
 	struct yt921x_led *leds[YT921X_LED_GROUP_NUM];
 #endif
 
+	struct yt921x_mib *mib;
 	struct phylink_pcs pcs;
 };
 
@@ -955,6 +960,11 @@ struct yt921x_info {
 	u16 serdes_mask;
 };
 
+static inline u16 yt921x_info_ports_mask(const struct yt921x_info *info)
+{
+	return info->internal_mask | info->xmii_mask | info->serdes_mask;
+}
+
 struct yt921x_priv {
 	struct dsa_switch ds;
 
-- 
2.53.0

