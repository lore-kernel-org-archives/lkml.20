Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.135.140.105
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854067;
	b=TedWg9SvBk+0UM/kOe48saaZt9A0fk6liNAWaVOqrCcTA7POaUOsnai37XohMvXvA1KZ
	 RyFzhCUkkbSzqZTkaJLukmvtD1/aOL3dtcxZMbNe3Qpj9t5FVCIQZsFAexB5/2pMG/7hg
	 Y/GAEtTRmtdo6xt0VBRKwjl+o8vn9j0yM94h3a2dX+9lfQlYw9pmQ2r2Huc/ryDbTevrl
	 QK7NnFPmclXaR/GVrFSWGQxcK17XSk75RTx4OeGSw17toi45RYcGHGX5+pQZcpyagCDnz
	 lq93XPXGlZWBJx2IMyoV5njZlXhxHJv/Vgop6fV8EbsouOo3rPT/HrzhVOKIMILhkkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854067;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-Id:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=cGB0N9JUfpVKYG0PCbCvpOZc+jv9UKfw0iHSu2YscaQ=;
	b=LBhN/ovFdFW+ajpDnIbqz9D8+EEOelhqkem/etCqEDuNzTvJ/c1btHO8+ETznRmMkgu6
	 4NCU8eZ6k9k0o2IkGFiR04HwfomIepgfVZq6QYViegk+b11K3wUBxA9TrSBBLQU/PF/jl
	 kC6n7Ghc8IIO7yrIetbfYhAyvQPvkjQJUIIDmFmsxwK5Fk+eJv+Ejq1/M+fZY9fDKT+Bi
	 UH22GBq9z42tZmm65grPCQGgMvRXDtPbqVQZE7UgKxOjbD55sF5viOSQipt/ml/h7T6h9
	 j6g057EarohmvoTxBQgh81Z3FNmpuPHuMIdBSirvcl7uvi+uWJw1Z21f9MQhqb4DEuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cjdns.fr;
	spf=pass smtp.mailfrom=cjdns.fr;
	dkim=pass header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=r72X35Dx;
	arc=none smtp.remote-ip=5.135.140.105
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FDD606A339;
	Mon, 16 Nov 2026 18:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1FDD606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=r72X35Dx
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B9B0D4FB00A;
	Mon, 16 Nov 2026 19:34:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1794854063; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=cGB0N9JUfpVKYG0PCbCvpOZc+jv9UKfw0iHSu2YscaQ=;
	b=r72X35DxZd/WFCXHTeaLLLFd/xdTfrjQFN2Iocsf8Qc0krKOq5Fz17VWMDELf54zOF8B8o
	B6GMZu8972eCB/pfRkK2RpoLF03iRX0VV/y/Ftpb310BHgJdM34HnCExKyoKxD2O2rsPzm
	h1iAtcORAs8W65Sv00LhH+o9oy5B7Iz9Smw6+mTNJScMFSekq9qL9WFVOydI4NV7MAPtL6
	oFEfMMxk9otFKprTbInxAyUqmToOuSVkTcNLj1xTTJnm6I8xVfPEZifZD2sKId1aC8fJYm
	NPjPKQv79IV4dNcvkzNVWMaQlbzegJ7rvcY7hn0upQ6LPXhw2IDWw1Kq6yoKSw==
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
Subject: [net-next v5 3/7] net: dsa: mediatek: add support for passthrough mode
Date: Mon, 16 Nov 2026 18:33:28 +0000
Message-Id: <20261116183332.168858-4-cjd@cjdns.fr>
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

In some cases, hardware integrators add a second MT7530 switch to a
port of the CPU-connected MT7530 and configure the upstream switch to
pass all traffic to and from the downstream switch. Particularly,
without altering the MediaTek DSA tag. The typical reason for this is
because the downstream switch is more capable, but the upstream switch
is an irremovable part of the SoC.

To enable passthrough, the main switch has its CPU port, and the port
to the second switch, both configured as MT7530_VLAN_EG_DISABLED and
MT7530_VLAN_TRANSPARENT and it uses the port matrix to control
forwarding.

Support passing through to a downstream switch, and also support being
the downstream switch - meaning the upstream link is not a CPU port but
rather a DSA port.

As a point of information:

There exist features in the hardware which appear to enable full
two-switch hierarchies (i.e. ports on the upstream switch are also
available for use). The way that this is supposed to work is though a
PASSTHROUGH flag in the DSA tag on BIT(7). The downstream switch sets
a flag called "PT_OPTION" on the PVC register of its "CPU" port (the
port linking to the upstream switch). This causes the downstream switch
to set the PASSTHROUGH flag on all ingress traffic. The CPU then sets
the PASSTHROUGH flag on egress traffic meant for the downstream switch.

In this configuration, the upstream switch sets MT7530_VLAN_USER, and
PORT_SPEC_TAG on the (real) CPU port (as usual), but also sets it on
the port leading to the downstream switch. The PORT_SPEC_TAG flag on
the downstream link port causes incoming DSA tags to be copied over
rather than being replaced by tags identifying the traffic as having
come from the link port. Finally, an ACL is installed which causes the
upstream switch to forward all egress traffic with the PASSTHROUGH bit
to the link port.

However for reasons unknown, the PASSTHROUGH bit is cleared by the
upstream switch as it receives ingress traffic from the downstream
switch. So by the time the traffic reaches the CPU, it no longer bears
the PASSTHROUGH bit and its origin cannot be known.

Reference code defaults to passthrough mode as is implemented here, but
supports a limited hierarchical implementation for hardware that needs
it. In this mode it is not permitted to use the same port number on
both switches. This implementation does not implement that mode because
there is no known hardware using ports on both switches.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 drivers/net/dsa/mt7530.c | 413 +++++++++++++++++++++++++++++++++------
 drivers/net/dsa/mt7530.h |   6 +
 2 files changed, 362 insertions(+), 57 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 3bfe29b3b93e..09b7e9d2d025 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -193,6 +193,11 @@ mt7530_fdb_cmd(struct mt7530_priv *priv, enum mt7530_fdb_cmd cmd, u32 *rsp)
 	return 0;
 }
 
+static void mt7530_passthrough_port_fast_age(struct dsa_switch *ds,
+					     int port)
+{
+}
+
 static void mt7530_port_fast_age(struct dsa_switch *ds, int port)
 {
 	struct mt7530_priv *priv = ds->priv;
@@ -960,6 +965,12 @@ static void mt7530_get_eth_ctrl_stats(struct dsa_switch *ds, int port,
 			       &ctrl_stats->MACControlFramesReceived);
 }
 
+static int
+mt7530_passthrough_set_ageing_time(struct dsa_switch *ds, unsigned int msecs)
+{
+	return 0;
+}
+
 static int
 mt7530_set_ageing_time(struct dsa_switch *ds, unsigned int msecs)
 {
@@ -1286,13 +1297,81 @@ mt753x_trap_frames(struct mt7530_priv *priv)
 				   TO_CPU_FW_CPU_ONLY);
 }
 
+static int
+mt7530_passthrough_port_change_mtu(struct dsa_switch *ds, int port,
+				   int new_mtu)
+{
+	return 0;
+}
+
+static int
+mt7530_port_change_mtu(struct dsa_switch *ds, int port, int new_mtu)
+{
+	struct mt7530_priv *priv = ds->priv;
+	int length;
+	u32 val;
+
+	/* When a new MTU is set, DSA always set the CPU port's MTU to the
+	 * largest MTU of the user ports. Because the switch only has a global
+	 * RX length register, only allowing CPU port here is enough.
+	 */
+	if (!dsa_is_upstream_port(ds, port))
+		return 0;
+
+	regmap_read(priv->regmap, MT7530_GMACCR, &val);
+	val &= ~MAX_RX_PKT_LEN_MASK;
+
+	/* RX length also includes Ethernet header, MTK tag, and FCS length */
+	length = new_mtu + ETH_HLEN + MTK_HDR_LEN + ETH_FCS_LEN;
+	if (length <= 1522) {
+		val |= MAX_RX_PKT_LEN_1522;
+	} else if (length <= 1536) {
+		val |= MAX_RX_PKT_LEN_1536;
+	} else if (length <= 1552) {
+		val |= MAX_RX_PKT_LEN_1552;
+	} else {
+		val &= ~MAX_RX_JUMBO_MASK;
+		val |= MAX_RX_JUMBO(DIV_ROUND_UP(length, 1024));
+		val |= MAX_RX_PKT_LEN_JUMBO;
+	}
+
+	regmap_write(priv->regmap, MT7530_GMACCR, val);
+
+	return 0;
+}
+
+/* If this switch is downstream of another switch that is in passthrough mode,
+ * the "CPU" port is actually a DSA port.
+ */
 static void
 mt753x_cpu_port_enable(struct dsa_switch *ds, int port)
 {
 	struct mt7530_priv *priv = ds->priv;
 
-	/* Enable Mediatek header mode on the cpu port */
-	regmap_write(priv->regmap, MT7530_PVC_P(port), PORT_SPEC_TAG);
+	if (priv->is_passthrough) {
+		/* Disable parsing of the DSA tag, it will be forwarded blindly
+		 * to the downstream switch.
+		 */
+		regmap_write(priv->regmap, MT7530_PVC_P(port),
+			     VLAN_ATTR(MT7530_VLAN_TRANSPARENT) |
+			     PVC_EG_TAG(MT7530_VLAN_EG_DISABLED));
+
+		/* The port is not configured to parse DSA tags, so they are
+		 * liable to be confused for length fields, so length check is
+		 * disabled.
+		 */
+		regmap_clear_bits(priv->regmap, MT753X_AGC, AGC_L2LEN_CHK);
+
+		/* In passthrough mode, MTU is only enforced downstream */
+		mt7530_port_change_mtu(ds, port, MT7530_MAX_MTU);
+
+		/* Loop detection has no value in passthrough mode */
+		regmap_set_bits(priv->regmap, MT753X_MTRAP,
+				MT7530_LOOP_DET_DISABLE);
+	} else {
+		/* Not passthrough, enable DSA tag handling on CPU port. */
+		regmap_write(priv->regmap, MT7530_PVC_P(port), PORT_SPEC_TAG);
+	}
 
 	/* Enable flooding on the CPU port */
 	regmap_set_bits(priv->regmap, MT753X_MFC,
@@ -1318,12 +1397,36 @@ mt753x_cpu_port_enable(struct dsa_switch *ds, int port)
 			   PCR_PORT_VLAN_MASK, MT7530_PORT_FALLBACK_MODE);
 }
 
+/**
+ * mt753x_upstream_port_index - get the index of the upstream port.
+ *
+ * If the CPU port is local then this is the upstream port, but in the case of
+ * hierarchy the CPU port may be on another switch and the upstream port is
+ * then the DSA port pointing toward that CPU port. Note that
+ * dsa_switch_upstream_port() is not reliable because the conduit for a given
+ * port can be customized.
+ */
+static int
+mt753x_upstream_port_index(struct dsa_port *dp)
+{
+	struct dsa_port *cpu_dp = dp->cpu_dp;
+
+	/* Early port_enable on CPU port happens before cpu_dp is set. */
+	if (!cpu_dp)
+		return dsa_switch_upstream_port(dp->ds);
+
+	return dsa_towards_port(dp->ds, cpu_dp->ds->index, cpu_dp->index);
+}
+
 static int
 mt7530_port_enable(struct dsa_switch *ds, int port,
 		   struct phy_device *phy)
 {
 	struct dsa_port *dp = dsa_to_port(ds, port);
 	struct mt7530_priv *priv = ds->priv;
+	int upstream_pt;
+
+	upstream_pt = mt753x_upstream_port_index(dp);
 
 	mutex_lock(&priv->reg_mutex);
 
@@ -1332,13 +1435,38 @@ mt7530_port_enable(struct dsa_switch *ds, int port,
 	 * bridge.
 	 */
 	if (dsa_port_is_user(dp)) {
-		struct dsa_port *cpu_dp = dp->cpu_dp;
+		priv->ports[port].pm |= PCR_MATRIX(BIT(upstream_pt));
+
+	} else if (dsa_port_is_dsa(dp) && dp->index != upstream_pt) {
+		priv->ports[port].pm |= PCR_MATRIX(BIT(upstream_pt));
+
+		/* Should not happen */
+		WARN_ON_ONCE(!priv->is_passthrough);
 
-		priv->ports[port].pm |= PCR_MATRIX(BIT(cpu_dp->index));
+		/* We are passing through to a downstream switch so we set both
+		 * CPU and downstream link to pass traffic untouched so that
+		 * the STAG from the downstream switch will pass to the upstream.
+		 */
+		regmap_write(priv->regmap, MT7530_PVC_P(port),
+			     VLAN_ATTR(MT7530_VLAN_TRANSPARENT) |
+			     PVC_EG_TAG(MT7530_VLAN_EG_DISABLED));
+
+		/* We let the downstream switch flood */
+		regmap_set_bits(priv->regmap, MT753X_MFC, BC_FFP(BIT(port)) |
+				UNM_FFP(BIT(port)) | UNU_FFP(BIT(port)));
+
+		/* Make the upstream port able to connect to the DSA port.
+		 * This must be explicit because PORT_SPEC_TAG is unset.
+		 */
+		regmap_write(priv->regmap, MT7530_PCR_P(upstream_pt),
+			     PCR_MATRIX(BIT(port)));
 	}
 	priv->ports[port].enable = true;
-	regmap_update_bits(priv->regmap, MT7530_PCR_P(port), PCR_MATRIX_MASK,
-			   priv->ports[port].pm);
+
+	/* In passthrough mode, CPU port mask is set above. */
+	if (!(priv->is_passthrough && dp->index == upstream_pt))
+		regmap_update_bits(priv->regmap, MT7530_PCR_P(port),
+				   PCR_MATRIX_MASK, priv->ports[port].pm);
 
 	mutex_unlock(&priv->reg_mutex);
 
@@ -1380,45 +1508,14 @@ mt7530_port_disable(struct dsa_switch *ds, int port)
 }
 
 static int
-mt7530_port_change_mtu(struct dsa_switch *ds, int port, int new_mtu)
+mt7530_port_max_mtu(struct dsa_switch *ds, int port)
 {
-	struct mt7530_priv *priv = ds->priv;
-	int length;
-	u32 val;
-
-	/* When a new MTU is set, DSA always set the CPU port's MTU to the
-	 * largest MTU of the user ports. Because the switch only has a global
-	 * RX length register, only allowing CPU port here is enough.
-	 */
-	if (!dsa_is_cpu_port(ds, port))
-		return 0;
-
-	regmap_read(priv->regmap, MT7530_GMACCR, &val);
-	val &= ~MAX_RX_PKT_LEN_MASK;
-
-	/* RX length also includes Ethernet header, MTK tag, and FCS length */
-	length = new_mtu + ETH_HLEN + MTK_HDR_LEN + ETH_FCS_LEN;
-	if (length <= 1522) {
-		val |= MAX_RX_PKT_LEN_1522;
-	} else if (length <= 1536) {
-		val |= MAX_RX_PKT_LEN_1536;
-	} else if (length <= 1552) {
-		val |= MAX_RX_PKT_LEN_1552;
-	} else {
-		val &= ~MAX_RX_JUMBO_MASK;
-		val |= MAX_RX_JUMBO(DIV_ROUND_UP(length, 1024));
-		val |= MAX_RX_PKT_LEN_JUMBO;
-	}
-
-	regmap_write(priv->regmap, MT7530_GMACCR, val);
-
-	return 0;
+	return MT7530_MAX_MTU;
 }
 
-static int
-mt7530_port_max_mtu(struct dsa_switch *ds, int port)
+static void
+mt7530_passthrough_stp_state_set(struct dsa_switch *ds, int port, u8 state)
 {
-	return MT7530_MAX_MTU;
 }
 
 static void
@@ -1456,9 +1553,8 @@ static void mt7530_update_port_member(struct mt7530_priv *priv, int port,
 				      bool join) __must_hold(&priv->reg_mutex)
 {
 	struct dsa_port *dp = dsa_to_port(priv->ds, port), *other_dp;
+	u32 port_bitmap = BIT(mt753x_upstream_port_index(dp));
 	struct mt7530_port *p = &priv->ports[port], *other_p;
-	struct dsa_port *cpu_dp = dp->cpu_dp;
-	u32 port_bitmap = BIT(cpu_dp->index);
 	int other_port;
 	bool isolated;
 
@@ -1514,6 +1610,14 @@ mt7530_port_pre_bridge_flags(struct dsa_switch *ds, int port,
 	return 0;
 }
 
+static int
+mt7530_passthrough_port_bridge_flags(struct dsa_switch *ds, int port,
+				     struct switchdev_brport_flags flags,
+				     struct netlink_ext_ack *extack)
+{
+	return 0;
+}
+
 static int
 mt7530_port_bridge_flags(struct dsa_switch *ds, int port,
 			 struct switchdev_brport_flags flags,
@@ -1554,6 +1658,15 @@ mt7530_port_bridge_flags(struct dsa_switch *ds, int port,
 	return 0;
 }
 
+static int
+mt7530_passthrough_port_bridge_join(struct dsa_switch *ds, int port,
+				    struct dsa_bridge bridge,
+				    bool *tx_fwd_offload,
+				    struct netlink_ext_ack *extack)
+{
+	return 0;
+}
+
 static int
 mt7530_port_bridge_join(struct dsa_switch *ds, int port,
 			struct dsa_bridge bridge, bool *tx_fwd_offload,
@@ -1708,6 +1821,12 @@ mt7530_port_set_vlan_aware(struct dsa_switch *ds, int port)
 	}
 }
 
+static void
+mt7530_passthrough_port_bridge_leave(struct dsa_switch *ds, int port,
+				     struct dsa_bridge bridge)
+{
+}
+
 static void
 mt7530_port_bridge_leave(struct dsa_switch *ds, int port,
 			 struct dsa_bridge bridge)
@@ -1728,6 +1847,14 @@ mt7530_port_bridge_leave(struct dsa_switch *ds, int port,
 	mutex_unlock(&priv->reg_mutex);
 }
 
+static int
+mt7530_passthrough_port_fdb_add(struct dsa_switch *ds, int port,
+				const unsigned char *addr, u16 vid,
+				struct dsa_db db)
+{
+	return 0;
+}
+
 static int
 mt7530_port_fdb_add(struct dsa_switch *ds, int port,
 		    const unsigned char *addr, u16 vid,
@@ -1745,6 +1872,14 @@ mt7530_port_fdb_add(struct dsa_switch *ds, int port,
 	return ret;
 }
 
+static int
+mt7530_passthrough_port_fdb_del(struct dsa_switch *ds, int port,
+				const unsigned char *addr, u16 vid,
+				struct dsa_db db)
+{
+	return 0;
+}
+
 static int
 mt7530_port_fdb_del(struct dsa_switch *ds, int port,
 		    const unsigned char *addr, u16 vid,
@@ -1797,6 +1932,14 @@ mt7530_port_fdb_dump(struct dsa_switch *ds, int port,
 	return 0;
 }
 
+static int
+mt7530_passthrough_port_mdb_add(struct dsa_switch *ds, int port,
+				const struct switchdev_obj_port_mdb *mdb,
+				struct dsa_db db)
+{
+	return 0;
+}
+
 static int
 mt7530_port_mdb_add(struct dsa_switch *ds, int port,
 		    const struct switchdev_obj_port_mdb *mdb,
@@ -1826,6 +1969,14 @@ mt7530_port_mdb_add(struct dsa_switch *ds, int port,
 	return ret;
 }
 
+static int
+mt7530_passthrough_port_mdb_del(struct dsa_switch *ds, int port,
+				const struct switchdev_obj_port_mdb *mdb,
+				struct dsa_db db)
+{
+	return 0;
+}
+
 static int
 mt7530_port_mdb_del(struct dsa_switch *ds, int port,
 		    const struct switchdev_obj_port_mdb *mdb,
@@ -1856,12 +2007,19 @@ mt7530_port_mdb_del(struct dsa_switch *ds, int port,
 	return ret;
 }
 
+static int
+mt7530_passthrough_port_vlan_filtering(struct dsa_switch *ds, int port,
+				       bool vlan_filtering,
+				       struct netlink_ext_ack *extack)
+{
+	return 0;
+}
+
 static int
 mt7530_port_vlan_filtering(struct dsa_switch *ds, int port, bool vlan_filtering,
 			   struct netlink_ext_ack *extack)
 {
 	struct dsa_port *dp = dsa_to_port(ds, port);
-	struct dsa_port *cpu_dp = dp->cpu_dp;
 
 	if (vlan_filtering) {
 		/* The port is being kept as VLAN-unaware port when bridge is
@@ -1870,7 +2028,7 @@ mt7530_port_vlan_filtering(struct dsa_switch *ds, int port, bool vlan_filtering,
 		 * for becoming a VLAN-aware port.
 		 */
 		mt7530_port_set_vlan_aware(ds, port);
-		mt7530_port_set_vlan_aware(ds, cpu_dp->index);
+		mt7530_port_set_vlan_aware(ds, mt753x_upstream_port_index(dp));
 	} else {
 		mt7530_port_set_vlan_unaware(ds, port);
 	}
@@ -1902,7 +2060,7 @@ mt7530_hw_vlan_add(struct mt7530_priv *priv,
 	 * that VLAN tags would be appended after hardware special tag used as
 	 * DSA tag.
 	 */
-	if (dsa_port_is_cpu(dp))
+	if (dp->index == mt753x_upstream_port_index(dp))
 		val = MT7530_VLAN_EGRESS_STACK;
 	else if (entry->untagged)
 		val = MT7530_VLAN_EGRESS_UNTAG;
@@ -1960,6 +2118,14 @@ mt7530_hw_vlan_update(struct mt7530_priv *priv, u16 vid,
 	mt7530_vlan_cmd(priv, MT7530_VTCR_WR_VID, vid);
 }
 
+static int
+mt7530_passthrough_port_vlan_add(struct dsa_switch *ds, int port,
+				 const struct switchdev_obj_port_vlan *vlan,
+				 struct netlink_ext_ack *extack)
+{
+	return 0;
+}
+
 static int
 mt7530_port_vlan_add(struct dsa_switch *ds, int port,
 		     const struct switchdev_obj_port_vlan *vlan,
@@ -2015,6 +2181,13 @@ mt7530_port_vlan_add(struct dsa_switch *ds, int port,
 	return 0;
 }
 
+static int
+mt7530_passthrough_port_vlan_del(struct dsa_switch *ds, int port,
+				 const struct switchdev_obj_port_vlan *vlan)
+{
+	return 0;
+}
+
 static int
 mt7530_port_vlan_del(struct dsa_switch *ds, int port,
 		     const struct switchdev_obj_port_vlan *vlan)
@@ -2055,6 +2228,14 @@ mt7530_port_vlan_del(struct dsa_switch *ds, int port,
 	return 0;
 }
 
+static int
+mt753x_passthrough_port_mirror_add(struct dsa_switch *ds, int port,
+				   struct dsa_mall_mirror_tc_entry *mirror,
+				   bool ingress, struct netlink_ext_ack *extack)
+{
+	return 0;
+}
+
 static int mt753x_port_mirror_add(struct dsa_switch *ds, int port,
 				  struct dsa_mall_mirror_tc_entry *mirror,
 				  bool ingress, struct netlink_ext_ack *extack)
@@ -2093,6 +2274,11 @@ static int mt753x_port_mirror_add(struct dsa_switch *ds, int port,
 	return 0;
 }
 
+static void mt753x_passthrough_port_mirror_del(struct dsa_switch *ds, int port,
+					       struct dsa_mall_mirror_tc_entry *mirror)
+{
+}
+
 static void mt753x_port_mirror_del(struct dsa_switch *ds, int port,
 				   struct dsa_mall_mirror_tc_entry *mirror)
 {
@@ -2405,11 +2591,6 @@ mt7530_setup(struct dsa_switch *ds)
 		break;
 	}
 
-	if (!dn) {
-		dev_err(ds->dev, "parent OF node of DSA conduit not found");
-		return -EINVAL;
-	}
-
 	ds->assisted_learning_on_cpu_port = true;
 	ds->untag_vlan_aware_bridge_pvid = true;
 	ds->mtu_enforcement_ingress = true;
@@ -2491,7 +2672,8 @@ mt7530_setup(struct dsa_switch *ds)
 	if ((val & MT7530_XTAL_MASK) == MT7530_XTAL_40MHZ)
 		mt7530_pll_setup(priv);
 
-	mt753x_trap_frames(priv);
+	if (!priv->is_passthrough)
+		mt753x_trap_frames(priv);
 
 	/* Enable and reset MIB counters */
 	mt7530_mib_reset(ds);
@@ -2511,7 +2693,7 @@ mt7530_setup(struct dsa_switch *ds)
 		/* Disable learning by default on all ports */
 		regmap_set_bits(priv->regmap, MT7530_PSC_P(i), SA_DIS);
 
-		if (dsa_is_cpu_port(ds, i)) {
+		if (dsa_is_upstream_port(ds, i)) {
 			mt753x_cpu_port_enable(ds, i);
 		} else {
 			mt7530_port_disable(ds, i);
@@ -2535,7 +2717,7 @@ mt7530_setup(struct dsa_switch *ds)
 		return ret;
 
 	/* Check for PHY muxing on port 5 */
-	if (dsa_is_unused_port(ds, 5)) {
+	if (dn && dsa_is_unused_port(ds, 5)) {
 		/* Scan the ethernet nodes. Look for GMAC1, lookup the used PHY.
 		 * Set priv->p5_mode to the appropriate value if PHY muxing is
 		 * detected.
@@ -2608,7 +2790,8 @@ mt7531_setup_common(struct dsa_switch *ds)
 	ds->ageing_time_min = 2 * 1000;
 	ds->ageing_time_max = (AGE_CNT_MAX + 1) * (AGE_UNIT_MAX + 1) * 1000;
 
-	mt753x_trap_frames(priv);
+	if (!priv->is_passthrough)
+		mt753x_trap_frames(priv);
 
 	/* Enable and reset MIB counters */
 	mt7530_mib_reset(ds);
@@ -2635,7 +2818,7 @@ mt7531_setup_common(struct dsa_switch *ds)
 		regmap_set_bits(priv->regmap, MT7531_DBG_CNT(i),
 				MT7531_DIS_CLR);
 
-		if (dsa_is_cpu_port(ds, i)) {
+		if (dsa_is_upstream_port(ds, i)) {
 			mt753x_cpu_port_enable(ds, i);
 		} else {
 			mt7530_port_disable(ds, i);
@@ -3255,6 +3438,14 @@ static int mt753x_set_mac_eee(struct dsa_switch *ds, int port,
 	return 0;
 }
 
+static int
+mt753x_passthrough_port_change_conduit(struct dsa_switch *ds, int port,
+				       struct net_device *conduit,
+				       struct netlink_ext_ack *extack)
+{
+	return 0;
+}
+
 static int
 mt753x_port_change_conduit(struct dsa_switch *ds, int port,
 			   struct net_device *conduit,
@@ -3365,6 +3556,13 @@ static int mt753x_tc_setup_qdisc_tbf(struct dsa_switch *ds, int port,
 	return 0;
 }
 
+static int mt753x_passthrough_setup_tc(struct dsa_switch *ds, int port,
+				       enum tc_setup_type type,
+				       void *type_data)
+{
+	return 0;
+}
+
 static int mt753x_setup_tc(struct dsa_switch *ds, int port,
 			   enum tc_setup_type type, void *type_data)
 {
@@ -3402,6 +3600,96 @@ static int mt7988_setup(struct dsa_switch *ds)
 	return mt7531_setup_common(ds);
 }
 
+/* 1 if passthrough, negative if error. */
+static int mt753x_check_passthrough(struct device *dev)
+{
+	struct device_node *ports, *port;
+	int ethernet_ports = 0;
+	int enabled_ports = 0;
+	int link_ports = 0;
+
+	ports = of_get_child_by_name(dev->of_node, "ports");
+	if (!ports)
+		ports = of_get_child_by_name(dev->of_node, "ethernet-ports");
+
+	if (!ports) {
+		dev_err(dev, "no ports child node found\n");
+		return -EINVAL;
+	}
+
+	for_each_available_child_of_node(ports, port) {
+		struct device_node *pt_node;
+
+		enabled_ports++;
+
+		pt_node = of_parse_phandle(port, "ethernet", 0);
+
+		if (pt_node) {
+			ethernet_ports++;
+			of_node_put(pt_node);
+			continue;
+		}
+
+		pt_node = of_parse_phandle(port, "link", 0);
+		if (pt_node) {
+			link_ports++;
+			of_node_put(pt_node);
+		}
+	}
+
+	of_node_put(ports);
+
+	/*
+	 * A switch is considered passthrough if exactly two available
+	 * ports have an "ethernet" or "link" phandle.
+	 */
+	return link_ports == 1 && ethernet_ports == 1 && enabled_ports == 2;
+}
+
+/* No manipulation of forwarding rules allowed in passthrough mode */
+static const struct dsa_switch_ops mt7530_passthrough_switch_ops = {
+	.get_tag_protocol       = mtk_get_tag_protocol,
+	.setup                  = mt753x_setup,
+	.teardown               = mt753x_teardown,
+	.preferred_default_local_cpu_port = mt753x_preferred_default_local_cpu_port,
+	.port_change_conduit	= mt753x_passthrough_port_change_conduit,
+	.get_strings            = mt7530_get_strings,
+	.get_ethtool_stats      = mt7530_get_ethtool_stats,
+	.get_sset_count         = mt7530_get_sset_count,
+	.get_eth_mac_stats      = mt7530_get_eth_mac_stats,
+	.get_rmon_stats         = mt7530_get_rmon_stats,
+	.get_eth_ctrl_stats     = mt7530_get_eth_ctrl_stats,
+	.get_stats64            = mt7530_get_stats64,
+	.set_ageing_time	= mt7530_passthrough_set_ageing_time,
+	.port_enable            = mt7530_port_enable,
+	.port_disable           = mt7530_port_disable,
+	.port_change_mtu	= mt7530_passthrough_port_change_mtu,
+	.port_max_mtu		= mt7530_port_max_mtu,
+	.port_stp_state_set	= mt7530_passthrough_stp_state_set,
+	.port_pre_bridge_flags	= mt7530_port_pre_bridge_flags,
+	.port_bridge_flags	= mt7530_passthrough_port_bridge_flags,
+	.port_bridge_join	= mt7530_passthrough_port_bridge_join,
+	.port_bridge_leave	= mt7530_passthrough_port_bridge_leave,
+	.port_fast_age		= mt7530_passthrough_port_fast_age,
+	.port_fdb_add		= mt7530_passthrough_port_fdb_add,
+	.port_fdb_del		= mt7530_passthrough_port_fdb_del,
+	.port_fdb_dump		= mt7530_port_fdb_dump,
+	.port_mdb_add		= mt7530_passthrough_port_mdb_add,
+	.port_mdb_del		= mt7530_passthrough_port_mdb_del,
+	.port_vlan_filtering	= mt7530_passthrough_port_vlan_filtering,
+	.port_vlan_add		= mt7530_passthrough_port_vlan_add,
+	.port_vlan_del		= mt7530_passthrough_port_vlan_del,
+	.port_mirror_add	= mt753x_passthrough_port_mirror_add,
+	.port_mirror_del	= mt753x_passthrough_port_mirror_del,
+	.phylink_get_caps       = mt753x_phylink_get_caps,
+	.support_eee            = dsa_supports_eee,
+	.set_mac_eee            = mt753x_set_mac_eee,
+	.conduit_state_change   = mt753x_conduit_state_change,
+	.port_setup_tc		= mt753x_passthrough_setup_tc,
+	.port_hsr_join		= dsa_port_simple_hsr_join,
+	.port_hsr_leave		= dsa_port_simple_hsr_leave,
+};
+
 static const struct dsa_switch_ops mt7530_switch_ops = {
 	.get_tag_protocol	= mtk_get_tag_protocol,
 	.setup			= mt753x_setup,
@@ -3534,8 +3822,12 @@ EXPORT_SYMBOL_GPL(mt753x_table);
 int
 mt7530_probe_common(struct mt7530_priv *priv)
 {
+	int passthrough = mt753x_check_passthrough(priv->dev);
 	struct device *dev = priv->dev;
 
+	if (passthrough < 0)
+		return passthrough;
+
 	priv->ds = devm_kzalloc_obj(dev, *priv->ds);
 	if (!priv->ds)
 		return -ENOMEM;
@@ -3553,7 +3845,14 @@ mt7530_probe_common(struct mt7530_priv *priv)
 	priv->id = priv->info->id;
 	priv->dev = dev;
 	priv->ds->priv = priv;
-	priv->ds->ops = &mt7530_switch_ops;
+
+	priv->is_passthrough = passthrough;
+
+	if (passthrough)
+		priv->ds->ops = &mt7530_passthrough_switch_ops;
+	else
+		priv->ds->ops = &mt7530_switch_ops;
+
 	priv->ds->phylink_mac_ops = &mt753x_phylink_mac_ops;
 	mutex_init(&priv->reg_mutex);
 	spin_lock_init(&priv->stats_lock);
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 3dabbc99fbbc..108c831dd012 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -40,6 +40,7 @@ enum mt753x_id {
 /* Register for ARL global control */
 #define MT753X_AGC			0xc
 #define  LOCAL_EN			BIT(7)
+#define  AGC_L2LEN_CHK			BIT(4)
 
 /* Register for MAC forward control */
 #define MT753X_MFC			0x10
@@ -583,6 +584,7 @@ enum mt7531_clk_skew {
 #define MT753X_MTRAP			0x7804
 #define  MT7530_P5_PHY0_SEL		BIT(20)
 #define  MT7530_CHG_TRAP		BIT(16)
+#define  MT7530_LOOP_DET_DISABLE	BIT(14)
 #define  MT7530_P5_MAC_SEL		BIT(13)
 #define  MT7530_P6_DIS			BIT(8)
 #define  MT7530_P5_RGMII_MODE		BIT(7)
@@ -897,6 +899,9 @@ struct mt753x_info {
  * @p5_mode:		Holding the current mode of port 5 of the MT7530 switch
  * @p5_sgmii:		Flag for distinguishing if port 5 of the MT7531 switch
  *			has got SGMII
+ * @is_passthrough:	If this switch is to pass traffic between the upstream
+ *			(CPU) port and a second downstream switch, without
+ *			altering the DSA tag.
  * @irq_domain:		IRQ domain of the switch irq_chip
  * @create_sgmii:	Pointer to function creating SGMII PCS instance(s)
  * @active_cpu_ports:	Holding the active CPU ports
@@ -921,6 +926,7 @@ struct mt7530_priv {
 	bool			p5_sgmii;
 	u8			mirror_rx;
 	u8			mirror_tx;
+	bool			is_passthrough;
 	struct mt7530_port	ports[MT7530_NUM_PORTS];
 	struct mt753x_pcs	pcs[MT7530_NUM_PORTS];
 	/* protect among processes for registers access*/
-- 
2.39.5

