Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794856227;
	b=i6ndm8yJyV/HajjYGZP4WLjQLoz3PR51F+wiZBZhBsvY170WvfloviMsnEUKRwvMlWzL
	 ObxPsVcnHolkue2GbLOuXvD/t6rQbtL4/UR2ERslaLMOfqc0JwgJuf7VusRFzXQsqPouV
	 A2Mxc75UcLwOcTUHVsMsFwM8OoHoH+4dMA4ar0z7VOxSS/doamdhfdFy9s2v0TXIhYbxi
	 AiSvgUg4jRPeSUGqllKD8Hjvy4NHm/yy8GgDhKwJ53rvkP+mgAyksL/nQlNnRU+lpBAUT
	 Wddfr7FRF/Ox40nHnQYYnc3SfgsbinITTdeGLoCRoQacXaLDqK7Y0tgwlWWc3CLd25A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794856227;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=KuBiRVlRlXWSrA/RjlqDfb/2z6FtGZHGlFyeeyvJbI4=;
	b=Prj+0yRcuIiCmHBHhqVll2o4HHrHDc1gML/b0wB1GAlRABliwM2A4kV36kDckZq5gBAZ
	 UQGaAkCqETSVXXREJh0aMB9W1K+upGTmmcjipwTEF3U1W3W0OA2nMurdR3dwhjBsNwJyW
	 kBdYS7T+wqVHdo6P+P0OiCLGqRUgAS0uSeeuXEIZ6b8hIMnOprFPoSCAPweJIyHN9zltQ
	 pXeaK8ptdwmp/55crgmhO050az9wfsVinQHlwKHOabWX7fOckJTnTKUj8rpfaHuhEit6n
	 CfANuYsFQd6wA+5uMo1OYR8uAA8hM+pLGO4NezYiEqfJp1tnU0eHuOBxo9jfKQPzu3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=aXhfKEnT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B3E60A3819;
	Mon, 16 Nov 2026 19:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3B3E60A3819
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=aXhfKEnT
Received: from dude04.red.stw.pengutronix.de (dude04.red.stw.4.pengutronix.de [10.17.1.12])
	(Authenticated sender: relay-from-dude04.red.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 0D528205A37;
	Mon, 16 Nov 2026 20:10:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794856220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KuBiRVlRlXWSrA/RjlqDfb/2z6FtGZHGlFyeeyvJbI4=;
	b=aXhfKEnTQBSv1py0AcmgPbgz9KjxiHzWjRBaqVn3ivP/RGqDFLX1aoJv1D9X6pHdTxFzW3
	kSjsOVNzdAVTEgBjjWXpUvlkkfi8D/vWmptMKRljAQ9077OhzxzZAwsQDiy/SnFz3kqf4t
	nxBXb0NQ6Rm95XQ44ETmr1CL10daGHyCTaUO/czYXjoyi2G8gOsodmm9DLv0kSni9wwis6
	KT0kO2pYrV+a/7XHHfJcAsVbHGRxpoz/FkvLkfmNIcVWPLOZ/99zxFACZLOfC5Nz9aikus
	zgkvmaQAFK4x2ELj/28GZ+lJl8ftEGtU/3dwko+ZPxTgpfy+gZEV0suGLYbs3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794856220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KuBiRVlRlXWSrA/RjlqDfb/2z6FtGZHGlFyeeyvJbI4=;
	b=B4ahFFtwCHc3yMG0l7AxgfefRkq47xvn0zZcyupUDTVUEKUz5BQLz2WCH+ZwtDnJa4Z+mI
	NjWNZmc3VrZSOtSKcjQUxgb1LNUup0y11mn7xn0gvG4cI11XvY0Jcv1gb2L378hSLcR8Mb
	dE8uzZiTPqQKicrvYD6TsZ+CqotuQBRgkHeMzSy30YFeCCfebmVa7LKOZaIKfVHWMzjLGA
	cJbiw46AapU81FZef1U9lGGygCnMM1QwEJgVSc94I5s96o5LXXl924rYg+FVuJsOLZRpOk
	qKdw1JGnd9kMKsRN7XEvuScDR8WBPfQoxZBjbeDX8u4DeQHUjzD3gJnpjLvK+Q==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794856220; a=rsa-sha256;
	cv=none;
	b=THXgfUoXst7VqI8Dw3WJXGCVrEi0G3Ks9uDB8Dt2OG8V/p0jv8IR8K6GPdRzqnj974Nm1r
	ZEBcktJ4hlpjGAVMr/wHi8t3aRC0zExGvMb41fhn+FCPtTqzDZ4F5qbKflxWD3sl91GPVz
	DqbqXz9hNxi8KDjB/yElFVsO0C6pUBJZ9craBAHWUTeL+WarUoXCdS8uDW6Z0xFdpFmw6+
	OlYAXkTXDJlRpDHTqUmkVlmNNTnzwCDM8T1mzVcS8VWTxaIwOJLHUo69z6L2eVbSYBpEuD
	Cs2aF55ttQJD0dnQmGVHg8WEtv3TYtB11FW4U22FQCmuTlp0zQBmkEWdoyss6Q==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-dude04.red.stw.pengutronix.de smtp.mailfrom=ore@pengutronix.de
Received: by dude04.red.stw.pengutronix.de (Postfix, from userid 1058)
	id B7E87381E92; Mon, 16 Nov 2026 20:10:15 +0100 (CET)
From: Oleksij Rempel <o.rempel@pengutronix.de>
Date: Mon, 16 Nov 2026 20:10:19 +0100
Subject: [PATCH net-next v3 08/10] net: dsa: realtek: rtl8365mb: program
 the PCP of untagged frames
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261116-rtl8365mb-dcb-ingress-v3-8-657f5fdb4db7@pengutronix.de>
References: <20261116-rtl8365mb-dcb-ingress-v3-0-657f5fdb4db7@pengutronix.de>
In-Reply-To: <20261116-rtl8365mb-dcb-ingress-v3-0-657f5fdb4db7@pengutronix.de>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, 
 Luiz Angelo Daros de Luca <luizluca@gmail.com>, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Oleksij Rempel <o.rempel@pengutronix.de>
X-Mailer: b4 0.14.2

Program the PCP that the switch gives to untagged frames whenever the
port default priority is set.

With PCP trust, the switch classifies an untagged frame by this value.
The value is 0 after reset, so untagged frames would be Best Effort
whatever the port default priority is. PCP trust is added by "net: dsa:
realtek: rtl8365mb: offload DCB apptrust".

The switch also puts this value into the tag it adds on egress. So far,
an untagged frame that left a VLAN-tagged port carried PCP 0. With a
default priority set, it now carries that priority as its PCP. The
standards require this:

IEEE 802.1AC-2016, 13.1: "The priority parameter of the
M_UNITDATA.indication shall take the value of the Default Priority
parameter for the SAP on which the MA_DATA.indication was received."

IEEE 802.1Q-2022, 6.9.4: "For untagged frames, the priority parameter
signaled in the corresponding M_UNITDATA.indication is taken to be the
received priority."

IEEE 802.1Q-2022, 6.9.3: "The priority and drop_eligible parameters
are encoded in the PCP field of the VLAN tag using the Priority Code
Point Encoding Table for the Port". With the default priority
regeneration (Table 6-4) and the 8P0D encoding (Table 6-2), the PCP
equals the Default Priority.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>
Reviewed-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
Q: Should the PCP of untagged frames be restored, or the writes
reordered, when the PORT_PRI write fails?
A: No. The two fields are in different registers and cannot be set
in one write. A write can fail for two reasons. The regmap
configuration can reject the access; that is a driver bug and shows
up on every call. Or the bus reports an error, such as an SMI ACK
timeout or an MDIO error. In that case a restore goes over the same
failing bus, and the switch state is unknown no matter what the
driver does. With either write order, a failure of the second write
leaves one field new and one old.

Changes in v3:
- wrap lines at 80 columns

Changes in v2:
- New in v2. PCP trust needs it, or untagged frames would be Best
  Effort.
---
 drivers/net/dsa/realtek/realtek.h       |  6 +++++-
 drivers/net/dsa/realtek/rtl8365mb_qos.c | 17 ++++++++++++++++-
 drivers/net/dsa/realtek/rtl8365mb_qos.h |  3 ++-
 drivers/net/dsa/realtek/rtl83xx-qos.c   | 14 ++++++++++----
 4 files changed, 33 insertions(+), 7 deletions(-)

diff --git a/drivers/net/dsa/realtek/realtek.h b/drivers/net/dsa/realtek/realtek.h
index d9ce2b43a81e7b06dcbedc577c78bcd06d915ca5..c79a026c7999b1d0055f336dedff64f80e1d30ec 100644
--- a/drivers/net/dsa/realtek/realtek.h
+++ b/drivers/net/dsa/realtek/realtek.h
@@ -165,8 +165,12 @@ struct realtek_ops {
 	 * priority. A *_prio getter returns an iprio or a negative errno.
 	 */
 	int	(*qos_get_port_prio)(struct realtek_priv *priv, int port);
+	/* Set the priority of @port to @iprio, and make @untag_pcp the PCP
+	 * given to untagged frames on @port. @untag_pcp is an 802.1p
+	 * priority, not an iprio.
+	 */
 	int	(*qos_set_port_prio)(struct realtek_priv *priv, int port,
-				     u8 iprio);
+				     u8 iprio, u8 untag_pcp);
 	int	(*qos_set_pcp_prio)(struct realtek_priv *priv, u8 pcp,
 				    u8 iprio);
 	int	(*qos_set_dscp_prio)(struct realtek_priv *priv, u8 dscp,
diff --git a/drivers/net/dsa/realtek/rtl8365mb_qos.c b/drivers/net/dsa/realtek/rtl8365mb_qos.c
index 9c649b5f1d728ebd025bf0fd863658df3adc7f81..bf11a5974d6c7cf56e2ccce47f364a7dee549304 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_qos.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_qos.c
@@ -64,6 +64,14 @@ static_assert(RTL8365MB_QOS_QMAP_DEFAULT < RTL8365MB_QOS_NUM_QMAPS);
 #define RTL8365MB_QOS_1Q_REMAP_REG(_pcp) \
 	(0x0865 + (_pcp) / RTL8365MB_QOS_SELS_PER_REG)
 
+/* PCP given to untagged frames, one 3-bit field per port */
+#define RTL8365MB_QOS_PORT_UNTAG_PCP_REG(_p) \
+	(0x0851 + (_p) / RTL8365MB_QOS_SELS_PER_REG)
+
+/* Ports 0..7 fit in 0x0851..0x0852 */
+static_assert(RTL8365MB_QOS_PORT_UNTAG_PCP_REG(RTL8365MB_QOS_MAX_PORTS - 1) <=
+	      0x0852);
+
 /* Port-based (default) priority, one select per port */
 #define RTL8365MB_QOS_PORT_PRI_REG(_p) \
 	(0x0877 + (_p) / RTL8365MB_QOS_SELS_PER_REG)
@@ -184,8 +192,10 @@ int rtl8365mb_qos_get_port_prio(struct realtek_priv *priv, int port)
 					       rtl8365mb_qos_sel_mask(port));
 }
 
-int rtl8365mb_qos_set_port_prio(struct realtek_priv *priv, int port, u8 iprio)
+int rtl8365mb_qos_set_port_prio(struct realtek_priv *priv, int port, u8 iprio,
+				u8 untag_pcp)
 {
+	u32 untag_reg = RTL8365MB_QOS_PORT_UNTAG_PCP_REG(port);
 	u32 reg = RTL8365MB_QOS_PORT_PRI_REG(port);
 	u32 mask = rtl8365mb_qos_sel_mask(port);
 	int ret;
@@ -194,6 +204,11 @@ int rtl8365mb_qos_set_port_prio(struct realtek_priv *priv, int port, u8 iprio)
 	if (ret)
 		return ret;
 
+	ret = rtl8365mb_qos_regmap_update_field(priv, untag_reg, mask,
+						untag_pcp);
+	if (ret)
+		return ret;
+
 	return rtl8365mb_qos_regmap_update_field(priv, reg, mask, iprio);
 }
 
diff --git a/drivers/net/dsa/realtek/rtl8365mb_qos.h b/drivers/net/dsa/realtek/rtl8365mb_qos.h
index a3568d47f6c6ee9566074af0ec493ff4bbdbf44b..71949ece4af8fae5c49cf105ddaa3db9bc622cf2 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_qos.h
+++ b/drivers/net/dsa/realtek/rtl8365mb_qos.h
@@ -20,7 +20,8 @@ struct realtek_priv;
 int rtl8365mb_qos_pridec_init(struct realtek_priv *priv);
 int rtl8365mb_qos_qmap_init(struct realtek_priv *priv);
 int rtl8365mb_qos_get_port_prio(struct realtek_priv *priv, int port);
-int rtl8365mb_qos_set_port_prio(struct realtek_priv *priv, int port, u8 iprio);
+int rtl8365mb_qos_set_port_prio(struct realtek_priv *priv, int port, u8 iprio,
+				u8 untag_pcp);
 int rtl8365mb_qos_set_pcp_prio(struct realtek_priv *priv, u8 pcp, u8 iprio);
 int rtl8365mb_qos_set_dscp_prio(struct realtek_priv *priv, u8 dscp, u8 iprio);
 
diff --git a/drivers/net/dsa/realtek/rtl83xx-qos.c b/drivers/net/dsa/realtek/rtl83xx-qos.c
index 0a02e6c4538a919e30e3c35594c7e7e7cdc3cf81..08091586901291e45ad1a2c64730cdcc30298b7a 100644
--- a/drivers/net/dsa/realtek/rtl83xx-qos.c
+++ b/drivers/net/dsa/realtek/rtl83xx-qos.c
@@ -5,7 +5,7 @@
  * is an 802.1Q traffic type. dcbnl uses 802.1p priorities. An 802.1p priority
  * equals the PCP value in the default PCP decoding (IEEE 802.1Q-2022 6.9.3).
  * This layer converts at its edges: every priority it hands a backend is an
- * internal priority.
+ * internal priority, except the 802.1p PCP given to untagged frames.
  *
  * The backend maps internal priorities to its egress queues itself.
  */
@@ -60,6 +60,7 @@ EXPORT_SYMBOL_NS_GPL(rtl83xx_qos_init, "REALTEK_DSA");
 int rtl83xx_qos_init_port(struct dsa_switch *ds, int port)
 {
 	struct realtek_priv *priv = ds->priv;
+	int untag_pcp;
 
 	if (!priv->ops->qos_set_port_prio)
 		return -EOPNOTSUPP;
@@ -68,8 +69,13 @@ int rtl83xx_qos_init_port(struct dsa_switch *ds, int port)
 	if (dsa_is_unused_port(ds, port))
 		return 0;
 
-	/* Best Effort, not internal priority 0, which is Background */
-	return priv->ops->qos_set_port_prio(priv, port, IEEE8021Q_TT_BE);
+	untag_pcp = ieee8021q_tt_to_pcp(IEEE8021Q_TT_BE);
+	if (untag_pcp < 0)
+		return untag_pcp;
+
+	/* iprio is Best Effort, not 0, which is Background */
+	return priv->ops->qos_set_port_prio(priv, port, IEEE8021Q_TT_BE,
+					    untag_pcp);
 }
 EXPORT_SYMBOL_NS_GPL(rtl83xx_qos_init_port, "REALTEK_DSA");
 
@@ -104,6 +110,6 @@ int rtl83xx_port_set_default_prio(struct dsa_switch *ds, int port, u8 prio)
 	if (tt < 0)
 		return tt;
 
-	return priv->ops->qos_set_port_prio(priv, port, tt);
+	return priv->ops->qos_set_port_prio(priv, port, tt, prio);
 }
 EXPORT_SYMBOL_NS_GPL(rtl83xx_port_set_default_prio, "REALTEK_DSA");

-- 
2.47.3

