Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6366C56C63E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 19:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788980784; cv=none; b=O3y5VpArKR1BljIpepNMtqle92pHtoHf2YRk6c/Sg0hTsINI3gYCzCsep9uKCn+PxXgA1YmRKN2I0pyd5ytEBm+FaANSfLstE+AiicUhdjbtn+cDnpTxjnpM571PaEnNpo7h6+HsL5SsXOwUTOiqIk7pLjmmUCys+mQhc7B8E4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788980784; c=relaxed/simple;
	bh=tpiyYUu4W3wSp1VrfwBQGrVTznu1OSah8soBeLKBCWA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c3gcC6nnTyUIuz/lgYGch5YW/tKz1YXbi8bh0CSZdH+8SXQS8ozGoVPlEJGJW848TnHCPdKrtUWA7WlJ/GziER+tjtDnQ2p1RLvLJS/eTP7ht23a0fJaRfYkxYR6XMVtsOpEkS3bhlqZntwfo/TMix0MGkb6soYzGhmWkw0g/Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SoQJDhB5; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SoQJDhB5"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d8f265cbe6so53426825ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788980781; x=1789585581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UE0l+d60HG/d/H4W8gUzVNuSI7TlYN9g71Pa18BLYTs=;
        b=SoQJDhB5O0+QAUqCNZF4qjJafgcHitd94obPGY+dAxGaZpDnShI8aXbdjoM2Oo7IWR
         gSWKZyrp/gTE9g+ShWQ+Yr/ND8okpOHKQ8izzDUW7Sds5g3JxyQZc0RfcFKbYZkFltqE
         2FxDtoTQ5DpWIqk8Kcfntzy1RTeMu8/6Cs8Vbf1nEOlh7/ClhxZ9zNxw3hHjFq0nOYPJ
         +y1hZwC5dq+2JJLapO0Hnvlhtmd3sKZSY1ftVl9tLRHWfwig9h1TDDaZ23fy3OkQ8ynr
         pSqvt3FE4+ah/bwCO5HyWsSXwoljT7+ITdKejB1JY6uc6+V8aoI8Tiyti3xe1Nq/JqoK
         4zvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788980781; x=1789585581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UE0l+d60HG/d/H4W8gUzVNuSI7TlYN9g71Pa18BLYTs=;
        b=nbqcCvEZfbG3g9UL9h2UsKOK/tA4nYbESSk26xAeyWX0k/KSCeDSU78vb79DBuF4xk
         DjqppbfI/vexm1VD9gA986g+v1UnO7HGiHIUu4t6tNibqyY9nLNe1+5MY3mYm0H8GQ1F
         VOTUKvgFw/AECL1jAEnxHLbpT3LOwjeLuL5whuf7GVaNq8PzeSMYT8PO7ceLFTpxG80S
         kF5erHLTCUnrm6TgQZGQBxecqn8P6eg/LRFPDRxYrEGz54hmdLKrxF3++gAcLTfn5iSa
         s2YY05K9swonlVf2/an8KtPV5h/XQ40eoL9ZCkHahk8P+oO66sNEydXITaFkXypaDRZT
         soAA==
X-Forwarded-Encrypted: i=1; AKwUvBzt086PldhXv+RADPgfgwmVBy/UnciyxwxE9xIXVmbGBgXB2Q5tJN7DmCtBpdVhIpIcz8jY1Xt6CJrKdts=@vger.kernel.org
X-Gm-Message-State: AFuF++nqavOujisLRWtvjVM0Y0q4VPcfd5Q8+ZCuetCXfn/es1c0zybY
	97Dhjza0X87vq+UlikhR+PNMMKvR5t8R4tSvZrQzZvyMOTM2aYaSpwNG
X-Gm-Gg: AYBFou1tWIuOrifwfrqU2/QVdRSEzTKIRoUPXK5LGdMQzX0pcPx2v6C37b6r+moQAqB
	gg9BqE2ENRAoMCGoGecIYVLYiXtyqNmBLftkvf2e4Mg2RydXGOsofADdY8ShNJDP3kjzYJ+vkZk
	fQ7fg7NGB7bMKgut/ygy7w0pWlt5cvtyo09fVAp3YttIcZo/60OY0j17OfKQ9SnQ50STSA3Fwje
	i7GNiLCxxCU1+IAIl0TBTeV2iRtDXeCMDXMbjcACrn+0kE5JqDCiDc3t/WTeeTF3QuIEJBollNO
	boTf4Trn7u//5zv0af9MVrpP+Msg16hi1+KL0fbqhufVHn6th9mIZ00G3V2TW2T3z8DxiQyGhSj
	E8mkHvdsQ+sdkxTw3MahrD1FKEQgDjMH5jQNsy4qS4Y3G3tpjKeEFJwvVHc+kujrmpSqbd0B0WJ
	qaY9tvvr9g75Fxg6EPS2+cYLDcY1sAzQDkk8JJ8hqqnJYtWnVQyVgEgM6DGkp8VrkRZYVJqGJ96
	oBBSwsIHGANzFiITAyLLM/4
X-Received: by 2002:a17:903:40c6:b0:2ca:f21a:a6c5 with SMTP id d9443c01a7336-2db12508a53mr504355095ad.1.1788980781374;
        Wed, 09 Sep 2026 12:06:21 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:d30::4d0:7b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dcffa9827dsm13988515ad.66.2026.09.09.12.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:06:21 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 7/7] net: dsa: motorcomm: Add SerDes PCS
Date: Thu, 10 Sep 2026 03:05:35 +0800
Message-ID: <20260909190541.466476-8-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909190541.466476-1-mmyangfl@gmail.com>
References: <20260909190541.466476-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support in-band negotiation of the SerDes ports.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/Makefile   |   1 +
 drivers/net/dsa/motorcomm/chip.c     |  78 ++++++----
 drivers/net/dsa/motorcomm/chip.h     |   8 +-
 drivers/net/dsa/motorcomm/mdio_bus.c |  28 +++-
 drivers/net/dsa/motorcomm/mdio_bus.h |  14 ++
 drivers/net/dsa/motorcomm/pcs-921x.c | 209 +++++++++++++++++++++++++++
 drivers/net/dsa/motorcomm/pcs.h      |  13 ++
 7 files changed, 323 insertions(+), 28 deletions(-)
 create mode 100644 drivers/net/dsa/motorcomm/pcs-921x.c
 create mode 100644 drivers/net/dsa/motorcomm/pcs.h

diff --git a/drivers/net/dsa/motorcomm/Makefile b/drivers/net/dsa/motorcomm/Makefile
index f7cce7eabbb8..1d2c1b3064c4 100644
--- a/drivers/net/dsa/motorcomm/Makefile
+++ b/drivers/net/dsa/motorcomm/Makefile
@@ -3,4 +3,5 @@ obj-$(CONFIG_NET_DSA_YT921X) += yt921x.o
 yt921x-objs := chip.o
 yt921x-$(CONFIG_NET_DSA_YT921X_LEDS) += leds.o
 yt921x-objs += mdio_bus.o
+yt921x-objs += pcs-921x.o
 yt921x-objs += smi.o
diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 85a31389050b..4780bb190ede 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -28,6 +28,7 @@
 #include "chip.h"
 #include "leds.h"
 #include "mdio_bus.h"
+#include "pcs.h"
 #include "smi.h"
 
 struct yt921x_mib_desc {
@@ -3516,6 +3517,10 @@ yt921x_port_up(struct yt921x_priv *priv, int port, unsigned int mode,
 	if (ps == YT921X_SPEED_NUM)
 		return -EINVAL;
 
+	mask = YT921X_PORT_SPEED_M | YT921X_PORT_TX_MAC_EN |
+	       YT921X_PORT_RX_MAC_EN | YT921X_PORT_TX_PAUSE |
+	       YT921X_PORT_RX_PAUSE | YT921X_PORT_DUPLEX_FULL |
+	       YT921X_PORT_CTRL_LINK_AN;
 	ctrl = YT921X_PORT_SPEED(ps);
 	if (duplex == DUPLEX_FULL)
 		ctrl |= YT921X_PORT_DUPLEX_FULL;
@@ -3524,7 +3529,9 @@ yt921x_port_up(struct yt921x_priv *priv, int port, unsigned int mode,
 	if (rx_pause)
 		ctrl |= YT921X_PORT_RX_PAUSE;
 	ctrl |= YT921X_PORT_RX_MAC_EN | YT921X_PORT_TX_MAC_EN;
-	res = yt921x_reg_write(priv, YT921X_PORTn_CTRL(port), ctrl);
+	if (pp->serdes && pp->inband)
+		ctrl |= YT921X_PORT_CTRL_LINK_AN;
+	res = yt921x_reg_update_bits(priv, YT921X_PORTn_CTRL(port), mask, ctrl);
 	if (res)
 		return res;
 
@@ -3544,7 +3551,8 @@ yt921x_port_up(struct yt921x_priv *priv, int port, unsigned int mode,
 		if (rx_pause)
 			ctrl |= YT921X_SERDES_RX_PAUSE;
 		mask |= YT921X_SERDES_LINK;
-		ctrl |= YT921X_SERDES_LINK;
+		if (!pp->inband)
+			ctrl |= YT921X_SERDES_LINK;
 		res = yt921x_reg_update_bits(priv, YT921X_SERDESn(port),
 					     mask, ctrl);
 		if (res)
@@ -3575,7 +3583,6 @@ yt921x_port_config(struct yt921x_priv *priv, int port, unsigned int mode,
 	struct yt921x_port *pp = &priv->ports[port];
 	struct device *dev = to_device(priv);
 	u32 mask;
-	u32 ctrl;
 	int res;
 
 	if (BIT(port) & info->internal_mask) {
@@ -3603,28 +3610,6 @@ yt921x_port_config(struct yt921x_priv *priv, int port, unsigned int mode,
 		if (res)
 			return res;
 
-		mask = YT921X_SERDES_MODE_M;
-		switch (interface) {
-		case PHY_INTERFACE_MODE_SGMII:
-			ctrl = YT921X_SERDES_MODE_SGMII;
-			break;
-		case PHY_INTERFACE_MODE_100BASEX:
-			ctrl = YT921X_SERDES_MODE_100BASEX;
-			break;
-		case PHY_INTERFACE_MODE_1000BASEX:
-			ctrl = YT921X_SERDES_MODE_1000BASEX;
-			break;
-		case PHY_INTERFACE_MODE_2500BASEX:
-			ctrl = YT921X_SERDES_MODE_2500BASEX;
-			break;
-		default:
-			return -EINVAL;
-		}
-		res = yt921x_reg_update_bits(priv, YT921X_SERDESn(port),
-					     mask, ctrl);
-		if (res)
-			return res;
-
 		pp->serdes = true;
 		break;
 	/* add XMII support here */
@@ -3639,6 +3624,24 @@ yt921x_port_config(struct yt921x_priv *priv, int port, unsigned int mode,
 	return -EINVAL;
 }
 
+static struct phylink_pcs *
+yt921x_phylink_mac_select_pcs(struct phylink_config *config,
+			      phy_interface_t interface)
+{
+	struct dsa_port *dp = dsa_phylink_to_port(config);
+	struct yt921x_priv *priv = to_yt921x_priv(dp->ds);
+
+	switch (interface) {
+	case PHY_INTERFACE_MODE_SGMII:
+	case PHY_INTERFACE_MODE_100BASEX:
+	case PHY_INTERFACE_MODE_1000BASEX:
+	case PHY_INTERFACE_MODE_2500BASEX:
+		return &priv->ports[dp->index].pcs;
+	default:
+		return NULL;
+	}
+}
+
 static void
 yt921x_phylink_mac_link_down(struct phylink_config *config, unsigned int mode,
 			     phy_interface_t interface)
@@ -4226,6 +4229,11 @@ static int yt921x_chip_setup(struct yt921x_priv *priv)
 	if (res)
 		return res;
 
+	res = yt921x_reg_clear_bits(priv, YT921X_SERDES_CTRL,
+				    YT921X_SERDES_CTRL_TEST);
+	if (res)
+		return res;
+
 	return 0;
 }
 
@@ -4235,6 +4243,8 @@ static int yt921x_dsa_setup(struct dsa_switch *ds)
 	struct device *dev = to_device(priv);
 	struct device_node *np = dev->of_node;
 	struct device_node *child;
+	unsigned long mask;
+	int port;
 	int res;
 
 	mutex_lock(&priv->reg_lock);
@@ -4268,6 +4278,23 @@ static int yt921x_dsa_setup(struct dsa_switch *ds)
 		return -ENODEV;
 	}
 
+	mask = priv->info->serdes_mask;
+	for_each_set_bit(port, &mask, YT921X_PORT_NUM) {
+		struct yt921x_port *pp = &priv->ports[port];
+
+		pp->pcs.ops = &yt921x_phylink_pcs_ops;
+		pp->pcs.poll = true;
+
+		__set_bit(PHY_INTERFACE_MODE_SGMII,
+			  pp->pcs.supported_interfaces);
+		__set_bit(PHY_INTERFACE_MODE_100BASEX,
+			  pp->pcs.supported_interfaces);
+		__set_bit(PHY_INTERFACE_MODE_1000BASEX,
+			  pp->pcs.supported_interfaces);
+		__set_bit(PHY_INTERFACE_MODE_2500BASEX,
+			  pp->pcs.supported_interfaces);
+	}
+
 	mutex_lock(&priv->reg_lock);
 	res = yt921x_chip_setup(priv);
 	mutex_unlock(&priv->reg_lock);
@@ -4285,6 +4312,7 @@ static int yt921x_dsa_setup(struct dsa_switch *ds)
 }
 
 static const struct phylink_mac_ops yt921x_phylink_mac_ops = {
+	.mac_select_pcs	= yt921x_phylink_mac_select_pcs,
 	.mac_link_down	= yt921x_phylink_mac_link_down,
 	.mac_link_up	= yt921x_phylink_mac_link_up,
 	.mac_config	= yt921x_phylink_mac_config,
diff --git a/drivers/net/dsa/motorcomm/chip.h b/drivers/net/dsa/motorcomm/chip.h
index 21132a147d6b..42905e35928b 100644
--- a/drivers/net/dsa/motorcomm/chip.h
+++ b/drivers/net/dsa/motorcomm/chip.h
@@ -42,7 +42,7 @@
 #define YT921X_PVID_SEL			0x80014
 #define  YT921X_PVID_SEL_SVID_PORTn(port)	BIT(port)
 #define YT921X_SERDES_CTRL		0x80028
-#define  YT921X_SERDES_CTRL_PORTn_TEST(port)	BIT((port) - 3)
+#define  YT921X_SERDES_CTRL_TEST		BIT(6)
 #define  YT921X_SERDES_CTRL_PORTn(port)		BIT((port) - 8)
 #define YT921X_IO_LEVEL			0x80030
 #define  YT9215_IO_LEVEL_NORMAL_M		GENMASK(5, 4)
@@ -910,6 +910,8 @@ struct yt921x_port {
 
 	/* SerDes in use */
 	bool serdes:1;
+	/* Link from in-band status (PHYLINK_PCS_NEG_INBAND) */
+	bool inband:1;
 	/* BR_HAIRPIN_MODE */
 	bool hairpin:1;
 	/* BR_ISOLATED */
@@ -929,8 +931,12 @@ struct yt921x_port {
 
 	struct yt921x_led *leds[YT921X_LED_GROUP_NUM];
 #endif
+
+	struct phylink_pcs pcs;
 };
 
+#define pcs_to_yt921x_port(_pcs) container_of((_pcs), struct yt921x_port, pcs)
+
 struct yt921x_reg_ops {
 	int (*read)(void *context, u32 reg, u32 *valp);
 	int (*write)(void *context, u32 reg, u32 val);
diff --git a/drivers/net/dsa/motorcomm/mdio_bus.c b/drivers/net/dsa/motorcomm/mdio_bus.c
index ba70343f3f33..5a47ed7bff99 100644
--- a/drivers/net/dsa/motorcomm/mdio_bus.c
+++ b/drivers/net/dsa/motorcomm/mdio_bus.c
@@ -19,8 +19,7 @@ static int yt921x_intif_wait(struct yt921x_priv *priv)
 			       &val);
 }
 
-static int
-yt921x_intif_read(struct yt921x_priv *priv, int port, int reg, u16 *valp)
+int yt921x_intif_read(struct yt921x_priv *priv, int port, int reg, u16 *valp)
 {
 	struct device *dev = to_device(priv);
 	u32 mask;
@@ -86,6 +85,31 @@ yt921x_intif_write(struct yt921x_priv *priv, int port, int reg, u16 val)
 	return yt921x_intif_wait(priv);
 }
 
+int
+yt921x_intif_modify_changed(struct yt921x_priv *priv, int port, int reg,
+			    u16 mask, u16 val)
+{
+	int res;
+	u16 v;
+	u16 u;
+
+	res = yt921x_intif_read(priv, port, reg, &v);
+	if (res)
+		return res;
+
+	u = v;
+	u &= ~mask;
+	u |= val;
+	if (u == v)
+		return 0;
+
+	res = yt921x_intif_write(priv, port, reg, u);
+	if (res)
+		return res;
+
+	return 1;
+}
+
 static int yt921x_mbus_int_read(struct mii_bus *mbus, int port, int reg)
 {
 	struct yt921x_priv *priv = mbus->priv;
diff --git a/drivers/net/dsa/motorcomm/mdio_bus.h b/drivers/net/dsa/motorcomm/mdio_bus.h
index 261a71c637f5..d859226fede8 100644
--- a/drivers/net/dsa/motorcomm/mdio_bus.h
+++ b/drivers/net/dsa/motorcomm/mdio_bus.h
@@ -31,6 +31,20 @@
 
 struct yt921x_priv;
 
+int yt921x_intif_read(struct yt921x_priv *priv, int port, int reg, u16 *valp);
+int yt921x_intif_modify_changed(struct yt921x_priv *priv, int port, int reg,
+				u16 mask, u16 val);
+
+static inline int
+yt921x_intif_modify(struct yt921x_priv *priv, int port, int reg, u16 mask,
+		    u16 val)
+{
+	int res;
+
+	res = yt921x_intif_modify_changed(priv, port, reg, mask, val);
+	return res >= 0 ? 0 : res;
+}
+
 int yt921x_mbus_int_init(struct yt921x_priv *priv, struct device_node *mnp);
 int yt921x_mbus_ext_init(struct yt921x_priv *priv, struct device_node *mnp);
 
diff --git a/drivers/net/dsa/motorcomm/pcs-921x.c b/drivers/net/dsa/motorcomm/pcs-921x.c
new file mode 100644
index 000000000000..eef6e79c099b
--- /dev/null
+++ b/drivers/net/dsa/motorcomm/pcs-921x.c
@@ -0,0 +1,209 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2026 David Yang
+ */
+
+#include "chip.h"
+#include "mdio_bus.h"
+#include "pcs.h"
+#include "smi.h"
+
+#define to_device(priv) ((priv)->ds.dev)
+
+static int
+yt921x_serdes_config(struct yt921x_priv *priv, int port, unsigned int neg_mode,
+		     phy_interface_t interface,
+		     const unsigned long *advertising)
+{
+	bool inband = neg_mode & PHYLINK_PCS_NEG_INBAND;
+	struct yt921x_port *pp = &priv->ports[port];
+	bool changed = false;
+	u16 bmcr;
+	u32 mask;
+	u32 ctrl;
+	int adv;
+	int res;
+
+	switch (interface) {
+	case PHY_INTERFACE_MODE_SGMII:
+		ctrl = YT921X_SERDES_MODE_SGMII;
+		break;
+	case PHY_INTERFACE_MODE_100BASEX:
+		ctrl = YT921X_SERDES_MODE_100BASEX;
+		break;
+	case PHY_INTERFACE_MODE_1000BASEX:
+		ctrl = YT921X_SERDES_MODE_1000BASEX;
+		break;
+	case PHY_INTERFACE_MODE_2500BASEX:
+		ctrl = YT921X_SERDES_MODE_2500BASEX;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	res = yt921x_reg_update_bits(priv, YT921X_SERDESn(port),
+				     YT921X_SERDES_MODE_M, ctrl);
+	if (res)
+		return res;
+
+	mask = YT921X_PORT_CTRL_LINK_AN | YT921X_PORT_CTRL_PAUSE_AN;
+	ctrl = 0;
+	if (inband)
+		ctrl |= YT921X_PORT_CTRL_LINK_AN;
+	if (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED)
+		ctrl |= YT921X_PORT_CTRL_PAUSE_AN;
+	res = yt921x_reg_update_bits(priv, YT921X_PORTn_CTRL(port), mask, ctrl);
+	if (res)
+		return res;
+
+	if (inband) {
+		res = yt921x_reg_clear_bits(priv, YT921X_SERDESn(port),
+					    YT921X_SERDES_LINK);
+		if (res)
+			return res;
+	}
+
+	adv = phylink_mii_c22_pcs_encode_advertisement(interface, advertising);
+	if (adv >= 0) {
+		res = yt921x_intif_modify_changed(priv, port, MII_ADVERTISE,
+						  U16_MAX, adv);
+		if (res < 0)
+			return res;
+
+		changed = !!res;
+	}
+
+	bmcr = neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED ? BMCR_ANENABLE : 0;
+	res = yt921x_intif_modify_changed(priv, port, MII_BMCR,
+					  BMCR_ANENABLE | BMCR_ISOLATE, bmcr);
+	if (res < 0)
+		return res;
+
+	/* If the ANENABLE bit was changed, the PHY will restart negotiation,
+	 * so we don't need to flag a change to trigger its own restart.
+	 */
+	if (res)
+		changed = false;
+
+	pp->inband = inband;
+	return changed;
+}
+
+static unsigned int
+yt921x_phylink_pcs_inband_caps(struct phylink_pcs *pcs,
+			       phy_interface_t interface)
+{
+	return LINK_INBAND_DISABLE | LINK_INBAND_ENABLE;
+}
+
+static void
+yt921x_phylink_pcs_get_state(struct phylink_pcs *pcs, unsigned int neg_mode,
+			     struct phylink_link_state *state)
+{
+	struct yt921x_port *pp = pcs_to_yt921x_port(pcs);
+	struct yt921x_priv *priv = yt921x_port_to_priv(pp);
+	struct device *dev = to_device(priv);
+	int port = pp->index;
+	u16 bmsr;
+	u16 lpa;
+	int res;
+
+	mutex_lock(&priv->reg_lock);
+
+	res = yt921x_intif_read(priv, port, MII_BMSR, &bmsr);
+	if (res)
+		goto out;
+
+	res = yt921x_intif_read(priv, port, MII_LPA, &lpa);
+
+out:
+	mutex_unlock(&priv->reg_lock);
+
+	if (res) {
+		dev_err(dev, "Failed to %s PCS port %d: %i\n", "get state of",
+			port, res);
+		state->link = false;
+		return;
+	}
+
+	phylink_mii_c22_pcs_decode_state(state, neg_mode, bmsr, lpa);
+}
+
+static void yt921x_phylink_pcs_an_restart(struct phylink_pcs *pcs)
+{
+	struct yt921x_port *pp = pcs_to_yt921x_port(pcs);
+	struct yt921x_priv *priv = yt921x_port_to_priv(pp);
+	struct device *dev = to_device(priv);
+	int port = pp->index;
+	int res;
+
+	mutex_lock(&priv->reg_lock);
+	res = yt921x_intif_modify(priv, port, MII_BMCR, BMCR_ANRESTART,
+				  BMCR_ANRESTART);
+	mutex_unlock(&priv->reg_lock);
+
+	if (res)
+		dev_err(dev, "Failed to %s PCS port %d: %i\n", "restart",
+			port, res);
+}
+
+static void yt921x_phylink_pcs_disable(struct phylink_pcs *pcs)
+{
+	struct yt921x_port *pp = pcs_to_yt921x_port(pcs);
+	struct yt921x_priv *priv = yt921x_port_to_priv(pp);
+	struct device *dev = to_device(priv);
+	int port = pp->index;
+	int res;
+
+	mutex_lock(&priv->reg_lock);
+	res = yt921x_intif_modify(priv, port, MII_BMCR, BMCR_PDOWN,
+				  BMCR_PDOWN);
+	mutex_unlock(&priv->reg_lock);
+
+	if (res)
+		dev_err(dev, "Failed to %s PCS port %d: %i\n", "power down",
+			port, res);
+}
+
+static int yt921x_phylink_pcs_enable(struct phylink_pcs *pcs)
+{
+	struct yt921x_port *pp = pcs_to_yt921x_port(pcs);
+	struct yt921x_priv *priv = yt921x_port_to_priv(pp);
+	int port = pp->index;
+	int res;
+
+	mutex_lock(&priv->reg_lock);
+	res = yt921x_intif_modify(priv, port, MII_BMCR,
+				  BMCR_PDOWN | BMCR_ANRESTART, BMCR_ANRESTART);
+	mutex_unlock(&priv->reg_lock);
+
+	return res;
+}
+
+static int
+yt921x_phylink_pcs_config(struct phylink_pcs *pcs, unsigned int neg_mode,
+			  phy_interface_t interface,
+			  const unsigned long *advertising,
+			  bool permit_pause_to_mac)
+{
+	struct yt921x_port *pp = pcs_to_yt921x_port(pcs);
+	struct yt921x_priv *priv = yt921x_port_to_priv(pp);
+	int port = pp->index;
+	int res;
+
+	mutex_lock(&priv->reg_lock);
+	res = yt921x_serdes_config(priv, port, neg_mode, interface,
+				   advertising);
+	mutex_unlock(&priv->reg_lock);
+
+	return res;
+}
+
+const struct phylink_pcs_ops yt921x_phylink_pcs_ops = {
+	.pcs_inband_caps	= yt921x_phylink_pcs_inband_caps,
+	.pcs_get_state		= yt921x_phylink_pcs_get_state,
+	.pcs_an_restart		= yt921x_phylink_pcs_an_restart,
+	.pcs_disable		= yt921x_phylink_pcs_disable,
+	.pcs_enable		= yt921x_phylink_pcs_enable,
+	.pcs_config		= yt921x_phylink_pcs_config,
+};
diff --git a/drivers/net/dsa/motorcomm/pcs.h b/drivers/net/dsa/motorcomm/pcs.h
new file mode 100644
index 000000000000..42426558086a
--- /dev/null
+++ b/drivers/net/dsa/motorcomm/pcs.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2026 David Yang
+ */
+
+#ifndef _YT_PCS_H
+#define _YT_PCS_H
+
+#include <linux/phylink.h>
+
+extern const struct phylink_pcs_ops yt921x_phylink_pcs_ops;
+
+#endif
-- 
2.53.0

