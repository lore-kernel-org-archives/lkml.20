Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FE9377EA1
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790130028; cv=none; b=VpO8aE7Fye7fRW2iOoKB3XyEru41P8JM8BkGWmBxAQGz9vZCLtpWEKIjkhxiH5Kgf53LnjnS0Koo16o2RRn7Ot9lyzS3rKKq/JDpp5ocEhY9hKMZmxU1kJ4uh/psEAfNv6PXd3zYBNrA8fyS2zyP34CTaGPci66echPSlDLRxrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790130028; c=relaxed/simple;
	bh=xjUv0NwzYr0Oa3odjBrlzQpjLtYUWPN9ltEzFzeZgtU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HqsTcjQdtlyRSaNdKB7rBN42UY9r1qWEAITbHWEDxMoPjM/QnncuE6N1vi5n+p+NJtlkuc8wi9oq0mksbrcLvgbrbzK3vz94vfW0XFLuW76EgGZtOb2qXpGYf+7Ml1XnmscYFBH8GbkbrqGo5B58q/kJhaALx7r3ihNgJ5qVazY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e9ehQVyG; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e9ehQVyG"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85a4329731cso285043b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790130026; x=1790734826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w3yzwbr4GKjVvqORjzKamnj3DkZgDBWV6VbdLMWVI3w=;
        b=e9ehQVyGJwX0dYhou0kses8xqYsbH9w7eIt74eTLd0x8koejZ6S9cHx22MnmkhY35Q
         JcCzjig6mKfQpcXZbVURW8YYcHgSQMFdPFd0SLhEV+83XxzFRB3sfwOQrHgn7EEHavUT
         d6P+5fuPQP/QH0B5OjOn8AnuIDlt9fRZEl1uCAjePtg5A8t3W70x3dhaoL7It5yIhdZ1
         HXsK0qkHtzKPwaX+AEZJdM4YFX1F5LLe9pGU94BgQXHa5k0ki2tcowefQ8B6WdUoauWA
         N20z7mqcHehbaTaFCDruwSG1vkahejmYsyPg3ryLgRXrerqjTz9Rg9pdKYIv4NN3fucT
         3Kjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790130026; x=1790734826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w3yzwbr4GKjVvqORjzKamnj3DkZgDBWV6VbdLMWVI3w=;
        b=AkX7M+5UcO/2iaIh61n8v4QyUuMqn0QIh3lBeOLJotLt4Kq7Kl7B9Hbx2aUm3VvAK/
         FlaZXhZWIAdn1jkhJQhynsV5S+nOXaGlCjvB/f/EcG0e9c0KcZ+PnbHDBsdJhPpV9YnG
         7SC3yq7JWHJPZtpaQt4PwpTxQLn3Tdgb+v587Zdr6iZV55YbkZUw8bWJEUZHMyuDoAPO
         zUJzhcbLRhlUv13xXIVPPMq1ufPwQMzgNuaxKrL14yulyfuM7GrBTLJfhoXlIx5XNbGZ
         8AKrMaRGp8O9KNLw1PixiKEzlABLSk/o56rEGYa6ZzB+Gik7Xm2cVAk003i1k+q3ug/G
         +lBA==
X-Forwarded-Encrypted: i=1; AKwUvByIO8jP9PFgRLPN+OCK/sQNBY9NboYURKCMhUiMEo6CsXSzQ5sOwR5oqH8ERzk2JqYL++DLEe+xHX/3ndo=@vger.kernel.org
X-Gm-Message-State: AFuF++l1pG4Pl2fVtjd/W+UgWpIi8pO+Q5OFTnL50wyXVj8Qhl5feQWL
	R+lzPOAYU7MT7AOzxK1iWvydG4u5QTGWL0BsYulQWBvF1W3p4FwbBmze
X-Gm-Gg: AYBFou1EOg460Q8mIooarP14nA3yKKHEUdz3NLCCVIc7yKD94fXb987QGRJ762UBGY7
	qmBHIkDBpuqGgope2oiFQ+wScRKB3lxhsvzcnn5b/ByEvpx4FPwy0Vw6PDM6Lt8EjUyV+SoCxu/
	jydRlTuLEXp2MToznHM26q/3887QvVpthd90QBZv4GYx7cFUh9Da878pR6/VpdFsMwcRczKc5je
	bHhwMycqKoUVZkom88pzl1EPRDrnnDxDDPI2GS1bolr02WdgCPRp/AnIZFTBBw1B6++G4Ga8hja
	PZ2BD9NCS1cvvK8axDdnh1ySfodLR9rj8HkudnZu74Jqo89BBLpnfErt5vld9gmC8iYDlq1NNBA
	98gDNzAntQycJt+/niKFqSoB1tDJ1Qy3DHIbLmPKg6RH6fVNoEqU9YDwGL50t4vThsHMjd4xwcs
	OqQ31ObFsM/7Oe3A+zyOplqqrMpgFknqlNHAORktu7Yus3wTi0Xbc8yaUYPz3XIvlo8ErALU4iJ
	ZgwHlWe+xA4x+L+VRxSORNe
X-Received: by 2002:a05:6300:2788:20b0:3dd:fb34:7662 with SMTP id adf61e73a8af0-3ddfb34c3f8mr440526637.47.1790130025518;
        Tue, 22 Sep 2026 19:20:25 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76c0:d30::4d0:61])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1e0f4fe8sm502924b3a.51.2026.09.22.19.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 19:20:24 -0700 (PDT)
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
Subject: [PATCH net-next v4 7/8] net: dsa: motorcomm: Split MDIO bus module
Date: Wed, 23 Sep 2026 10:19:39 +0800
Message-ID: <20260923021945.2203368-8-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923021945.2203368-1-mmyangfl@gmail.com>
References: <20260923021945.2203368-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split it in order to be used in other modules.

Signed-off-by: David Yang <mmyangfl@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/dsa/motorcomm/Makefile   |   1 +
 drivers/net/dsa/motorcomm/chip.c     | 269 +-------------------------
 drivers/net/dsa/motorcomm/chip.h     |  21 --
 drivers/net/dsa/motorcomm/mdio_bus.c | 278 +++++++++++++++++++++++++++
 drivers/net/dsa/motorcomm/mdio_bus.h |  39 ++++
 5 files changed, 319 insertions(+), 289 deletions(-)
 create mode 100644 drivers/net/dsa/motorcomm/mdio_bus.c
 create mode 100644 drivers/net/dsa/motorcomm/mdio_bus.h

diff --git a/drivers/net/dsa/motorcomm/Makefile b/drivers/net/dsa/motorcomm/Makefile
index aeb12cb91f93..f7cce7eabbb8 100644
--- a/drivers/net/dsa/motorcomm/Makefile
+++ b/drivers/net/dsa/motorcomm/Makefile
@@ -2,4 +2,5 @@
 obj-$(CONFIG_NET_DSA_YT921X) += yt921x.o
 yt921x-objs := chip.o
 yt921x-$(CONFIG_NET_DSA_YT921X_LEDS) += leds.o
+yt921x-objs += mdio_bus.o
 yt921x-objs += smi.o
diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index ee433f1e1b58..6e1219ef05d7 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -27,6 +27,7 @@
 
 #include "chip.h"
 #include "leds.h"
+#include "mdio_bus.h"
 #include "smi.h"
 
 struct yt921x_mib_desc {
@@ -266,274 +267,6 @@ static const struct yt921x_reg_ops yt921x_reg_ops_mdio = {
 
 /* TODO: SPI/I2C */
 
-static int yt921x_intif_wait(struct yt921x_priv *priv)
-{
-	u32 val = 0;
-
-	return yt921x_reg_wait(priv, YT921X_INT_MBUS_OP, YT921X_MBUS_OP_START,
-			       &val);
-}
-
-static int
-yt921x_intif_read(struct yt921x_priv *priv, int port, int reg, u16 *valp)
-{
-	struct device *dev = to_device(priv);
-	u32 mask;
-	u32 ctrl;
-	u32 val;
-	int res;
-
-	res = yt921x_intif_wait(priv);
-	if (res)
-		return res;
-
-	mask = YT921X_MBUS_CTRL_PORT_M | YT921X_MBUS_CTRL_REG_M |
-	       YT921X_MBUS_CTRL_OP_M;
-	ctrl = YT921X_MBUS_CTRL_PORT(port) | YT921X_MBUS_CTRL_REG(reg) |
-	       YT921X_MBUS_CTRL_READ;
-	res = yt921x_reg_update_bits(priv, YT921X_INT_MBUS_CTRL, mask, ctrl);
-	if (res)
-		return res;
-	res = yt921x_reg_write(priv, YT921X_INT_MBUS_OP, YT921X_MBUS_OP_START);
-	if (res)
-		return res;
-
-	res = yt921x_intif_wait(priv);
-	if (res)
-		return res;
-	res = yt921x_reg_read(priv, YT921X_INT_MBUS_DIN, &val);
-	if (res)
-		return res;
-
-	if ((u16)val != val)
-		dev_info(dev,
-			 "%s: port %d, reg 0x%x: Expected u16, got 0x%08x\n",
-			 __func__, port, reg, val);
-	*valp = (u16)val;
-	return 0;
-}
-
-static int
-yt921x_intif_write(struct yt921x_priv *priv, int port, int reg, u16 val)
-{
-	u32 mask;
-	u32 ctrl;
-	int res;
-
-	res = yt921x_intif_wait(priv);
-	if (res)
-		return res;
-
-	mask = YT921X_MBUS_CTRL_PORT_M | YT921X_MBUS_CTRL_REG_M |
-	       YT921X_MBUS_CTRL_OP_M;
-	ctrl = YT921X_MBUS_CTRL_PORT(port) | YT921X_MBUS_CTRL_REG(reg) |
-	       YT921X_MBUS_CTRL_WRITE;
-	res = yt921x_reg_update_bits(priv, YT921X_INT_MBUS_CTRL, mask, ctrl);
-	if (res)
-		return res;
-	res = yt921x_reg_write(priv, YT921X_INT_MBUS_DOUT, val);
-	if (res)
-		return res;
-	res = yt921x_reg_write(priv, YT921X_INT_MBUS_OP, YT921X_MBUS_OP_START);
-	if (res)
-		return res;
-
-	return yt921x_intif_wait(priv);
-}
-
-static int yt921x_mbus_int_read(struct mii_bus *mbus, int port, int reg)
-{
-	struct yt921x_priv *priv = mbus->priv;
-	u16 val;
-	int res;
-
-	if (port >= YT921X_PORT_NUM)
-		return U16_MAX;
-
-	mutex_lock(&priv->reg_lock);
-	res = yt921x_intif_read(priv, port, reg, &val);
-	mutex_unlock(&priv->reg_lock);
-
-	if (res)
-		return res;
-	return val;
-}
-
-static int
-yt921x_mbus_int_write(struct mii_bus *mbus, int port, int reg, u16 data)
-{
-	struct yt921x_priv *priv = mbus->priv;
-	int res;
-
-	if (port >= YT921X_PORT_NUM)
-		return -ENODEV;
-
-	mutex_lock(&priv->reg_lock);
-	res = yt921x_intif_write(priv, port, reg, data);
-	mutex_unlock(&priv->reg_lock);
-
-	return res;
-}
-
-static int
-yt921x_mbus_int_init(struct yt921x_priv *priv, struct device_node *mnp)
-{
-	struct device *dev = to_device(priv);
-	struct mii_bus *mbus;
-	int res;
-
-	mbus = devm_mdiobus_alloc(dev);
-	if (!mbus)
-		return -ENOMEM;
-
-	mbus->name = "YT921x internal MDIO bus";
-	snprintf(mbus->id, MII_BUS_ID_SIZE, "%s", dev_name(dev));
-	mbus->priv = priv;
-	mbus->read = yt921x_mbus_int_read;
-	mbus->write = yt921x_mbus_int_write;
-	mbus->parent = dev;
-	mbus->phy_mask = (u32)~GENMASK(YT921X_PORT_NUM - 1, 0);
-
-	res = devm_of_mdiobus_register(dev, mbus, mnp);
-	if (res)
-		return res;
-
-	priv->mbus_int = mbus;
-
-	return 0;
-}
-
-static int yt921x_extif_wait(struct yt921x_priv *priv)
-{
-	u32 val = 0;
-
-	return yt921x_reg_wait(priv, YT921X_EXT_MBUS_OP, YT921X_MBUS_OP_START,
-			       &val);
-}
-
-static int
-yt921x_extif_read(struct yt921x_priv *priv, int port, int reg, u16 *valp)
-{
-	struct device *dev = to_device(priv);
-	u32 mask;
-	u32 ctrl;
-	u32 val;
-	int res;
-
-	res = yt921x_extif_wait(priv);
-	if (res)
-		return res;
-
-	mask = YT921X_MBUS_CTRL_PORT_M | YT921X_MBUS_CTRL_REG_M |
-	       YT921X_MBUS_CTRL_TYPE_M | YT921X_MBUS_CTRL_OP_M;
-	ctrl = YT921X_MBUS_CTRL_PORT(port) | YT921X_MBUS_CTRL_REG(reg) |
-	       YT921X_MBUS_CTRL_TYPE_C22 | YT921X_MBUS_CTRL_READ;
-	res = yt921x_reg_update_bits(priv, YT921X_EXT_MBUS_CTRL, mask, ctrl);
-	if (res)
-		return res;
-	res = yt921x_reg_write(priv, YT921X_EXT_MBUS_OP, YT921X_MBUS_OP_START);
-	if (res)
-		return res;
-
-	res = yt921x_extif_wait(priv);
-	if (res)
-		return res;
-	res = yt921x_reg_read(priv, YT921X_EXT_MBUS_DIN, &val);
-	if (res)
-		return res;
-
-	if ((u16)val != val)
-		dev_info(dev,
-			 "%s: port %d, reg 0x%x: Expected u16, got 0x%08x\n",
-			 __func__, port, reg, val);
-	*valp = (u16)val;
-	return 0;
-}
-
-static int
-yt921x_extif_write(struct yt921x_priv *priv, int port, int reg, u16 val)
-{
-	u32 mask;
-	u32 ctrl;
-	int res;
-
-	res = yt921x_extif_wait(priv);
-	if (res)
-		return res;
-
-	mask = YT921X_MBUS_CTRL_PORT_M | YT921X_MBUS_CTRL_REG_M |
-	       YT921X_MBUS_CTRL_TYPE_M | YT921X_MBUS_CTRL_OP_M;
-	ctrl = YT921X_MBUS_CTRL_PORT(port) | YT921X_MBUS_CTRL_REG(reg) |
-	       YT921X_MBUS_CTRL_TYPE_C22 | YT921X_MBUS_CTRL_WRITE;
-	res = yt921x_reg_update_bits(priv, YT921X_EXT_MBUS_CTRL, mask, ctrl);
-	if (res)
-		return res;
-	res = yt921x_reg_write(priv, YT921X_EXT_MBUS_DOUT, val);
-	if (res)
-		return res;
-	res = yt921x_reg_write(priv, YT921X_EXT_MBUS_OP, YT921X_MBUS_OP_START);
-	if (res)
-		return res;
-
-	return yt921x_extif_wait(priv);
-}
-
-static int yt921x_mbus_ext_read(struct mii_bus *mbus, int port, int reg)
-{
-	struct yt921x_priv *priv = mbus->priv;
-	u16 val;
-	int res;
-
-	mutex_lock(&priv->reg_lock);
-	res = yt921x_extif_read(priv, port, reg, &val);
-	mutex_unlock(&priv->reg_lock);
-
-	if (res)
-		return res;
-	return val;
-}
-
-static int
-yt921x_mbus_ext_write(struct mii_bus *mbus, int port, int reg, u16 data)
-{
-	struct yt921x_priv *priv = mbus->priv;
-	int res;
-
-	mutex_lock(&priv->reg_lock);
-	res = yt921x_extif_write(priv, port, reg, data);
-	mutex_unlock(&priv->reg_lock);
-
-	return res;
-}
-
-static int
-yt921x_mbus_ext_init(struct yt921x_priv *priv, struct device_node *mnp)
-{
-	struct device *dev = to_device(priv);
-	struct mii_bus *mbus;
-	int res;
-
-	mbus = devm_mdiobus_alloc(dev);
-	if (!mbus)
-		return -ENOMEM;
-
-	mbus->name = "YT921x external MDIO bus";
-	snprintf(mbus->id, MII_BUS_ID_SIZE, "%s@ext", dev_name(dev));
-	mbus->priv = priv;
-	/* TODO: c45? */
-	mbus->read = yt921x_mbus_ext_read;
-	mbus->write = yt921x_mbus_ext_write;
-	mbus->parent = dev;
-
-	res = devm_of_mdiobus_register(dev, mbus, mnp);
-	if (res)
-		return res;
-
-	priv->mbus_ext = mbus;
-
-	return 0;
-}
-
 /* Read and handle overflow of 32bit MIBs. MIB buffer must be zeroed before. */
 static int yt921x_read_mib(struct yt921x_priv *priv, int port)
 {
diff --git a/drivers/net/dsa/motorcomm/chip.h b/drivers/net/dsa/motorcomm/chip.h
index 6a9fb27ddfb7..f68b77f815b1 100644
--- a/drivers/net/dsa/motorcomm/chip.h
+++ b/drivers/net/dsa/motorcomm/chip.h
@@ -243,27 +243,6 @@ enum yt921x_speed {
 #define   YT9218_SYS_CLK_167M				0
 #define   YT921X_SYS_CLK_143M				1
 
-#define YT921X_EXT_MBUS_OP		0x6a000
-#define YT921X_INT_MBUS_OP		0xf0000
-#define  YT921X_MBUS_OP_START			BIT(0)
-#define YT921X_EXT_MBUS_CTRL		0x6a004
-#define YT921X_INT_MBUS_CTRL		0xf0004
-#define  YT921X_MBUS_CTRL_PORT_M		GENMASK(25, 21)
-#define   YT921X_MBUS_CTRL_PORT(x)			FIELD_PREP(YT921X_MBUS_CTRL_PORT_M, (x))
-#define  YT921X_MBUS_CTRL_REG_M			GENMASK(20, 16)
-#define   YT921X_MBUS_CTRL_REG(x)			FIELD_PREP(YT921X_MBUS_CTRL_REG_M, (x))
-#define  YT921X_MBUS_CTRL_TYPE_M		GENMASK(11, 8)  /* wild guess */
-#define   YT921X_MBUS_CTRL_TYPE(x)			FIELD_PREP(YT921X_MBUS_CTRL_TYPE_M, (x))
-#define   YT921X_MBUS_CTRL_TYPE_C22			YT921X_MBUS_CTRL_TYPE(4)
-#define  YT921X_MBUS_CTRL_OP_M			GENMASK(3, 2)  /* wild guess */
-#define   YT921X_MBUS_CTRL_OP(x)			FIELD_PREP(YT921X_MBUS_CTRL_OP_M, (x))
-#define   YT921X_MBUS_CTRL_WRITE			YT921X_MBUS_CTRL_OP(1)
-#define   YT921X_MBUS_CTRL_READ				YT921X_MBUS_CTRL_OP(2)
-#define YT921X_EXT_MBUS_DOUT		0x6a008
-#define YT921X_INT_MBUS_DOUT		0xf0008
-#define YT921X_EXT_MBUS_DIN		0x6a00c
-#define YT921X_INT_MBUS_DIN		0xf000c
-
 #define YT921X_PORTn_EGR(port)		(0x100000 + 4 * (port))
 #define  YT921X_PORT_EGR_TPID_CTAG_M		GENMASK(5, 4)
 #define   YT921X_PORT_EGR_TPID_CTAG(x)			FIELD_PREP(YT921X_PORT_EGR_TPID_CTAG_M, (x))
diff --git a/drivers/net/dsa/motorcomm/mdio_bus.c b/drivers/net/dsa/motorcomm/mdio_bus.c
new file mode 100644
index 000000000000..ba70343f3f33
--- /dev/null
+++ b/drivers/net/dsa/motorcomm/mdio_bus.c
@@ -0,0 +1,278 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2026 David Yang
+ */
+
+#include <linux/of_mdio.h>
+
+#include "chip.h"
+#include "mdio_bus.h"
+#include "smi.h"
+
+#define to_device(priv) ((priv)->ds.dev)
+
+static int yt921x_intif_wait(struct yt921x_priv *priv)
+{
+	u32 val = 0;
+
+	return yt921x_reg_wait(priv, YT921X_INT_MBUS_OP, YT921X_MBUS_OP_START,
+			       &val);
+}
+
+static int
+yt921x_intif_read(struct yt921x_priv *priv, int port, int reg, u16 *valp)
+{
+	struct device *dev = to_device(priv);
+	u32 mask;
+	u32 ctrl;
+	u32 val;
+	int res;
+
+	res = yt921x_intif_wait(priv);
+	if (res)
+		return res;
+
+	mask = YT921X_MBUS_CTRL_PORT_M | YT921X_MBUS_CTRL_REG_M |
+	       YT921X_MBUS_CTRL_OP_M;
+	ctrl = YT921X_MBUS_CTRL_PORT(port) | YT921X_MBUS_CTRL_REG(reg) |
+	       YT921X_MBUS_CTRL_READ;
+	res = yt921x_reg_update_bits(priv, YT921X_INT_MBUS_CTRL, mask, ctrl);
+	if (res)
+		return res;
+	res = yt921x_reg_write(priv, YT921X_INT_MBUS_OP, YT921X_MBUS_OP_START);
+	if (res)
+		return res;
+
+	res = yt921x_intif_wait(priv);
+	if (res)
+		return res;
+	res = yt921x_reg_read(priv, YT921X_INT_MBUS_DIN, &val);
+	if (res)
+		return res;
+
+	if ((u16)val != val)
+		dev_info(dev,
+			 "%s: port %d, reg 0x%x: Expected u16, got 0x%08x\n",
+			 __func__, port, reg, val);
+	*valp = (u16)val;
+	return 0;
+}
+
+static int
+yt921x_intif_write(struct yt921x_priv *priv, int port, int reg, u16 val)
+{
+	u32 mask;
+	u32 ctrl;
+	int res;
+
+	res = yt921x_intif_wait(priv);
+	if (res)
+		return res;
+
+	mask = YT921X_MBUS_CTRL_PORT_M | YT921X_MBUS_CTRL_REG_M |
+	       YT921X_MBUS_CTRL_OP_M;
+	ctrl = YT921X_MBUS_CTRL_PORT(port) | YT921X_MBUS_CTRL_REG(reg) |
+	       YT921X_MBUS_CTRL_WRITE;
+	res = yt921x_reg_update_bits(priv, YT921X_INT_MBUS_CTRL, mask, ctrl);
+	if (res)
+		return res;
+	res = yt921x_reg_write(priv, YT921X_INT_MBUS_DOUT, val);
+	if (res)
+		return res;
+	res = yt921x_reg_write(priv, YT921X_INT_MBUS_OP, YT921X_MBUS_OP_START);
+	if (res)
+		return res;
+
+	return yt921x_intif_wait(priv);
+}
+
+static int yt921x_mbus_int_read(struct mii_bus *mbus, int port, int reg)
+{
+	struct yt921x_priv *priv = mbus->priv;
+	u16 val;
+	int res;
+
+	if (port >= YT921X_PORT_NUM)
+		return U16_MAX;
+
+	mutex_lock(&priv->reg_lock);
+	res = yt921x_intif_read(priv, port, reg, &val);
+	mutex_unlock(&priv->reg_lock);
+
+	if (res)
+		return res;
+	return val;
+}
+
+static int
+yt921x_mbus_int_write(struct mii_bus *mbus, int port, int reg, u16 data)
+{
+	struct yt921x_priv *priv = mbus->priv;
+	int res;
+
+	if (port >= YT921X_PORT_NUM)
+		return -ENODEV;
+
+	mutex_lock(&priv->reg_lock);
+	res = yt921x_intif_write(priv, port, reg, data);
+	mutex_unlock(&priv->reg_lock);
+
+	return res;
+}
+
+int yt921x_mbus_int_init(struct yt921x_priv *priv, struct device_node *mnp)
+{
+	struct device *dev = to_device(priv);
+	struct mii_bus *mbus;
+	int res;
+
+	mbus = devm_mdiobus_alloc(dev);
+	if (!mbus)
+		return -ENOMEM;
+
+	mbus->name = "YT921x internal MDIO bus";
+	snprintf(mbus->id, MII_BUS_ID_SIZE, "%s", dev_name(dev));
+	mbus->priv = priv;
+	mbus->read = yt921x_mbus_int_read;
+	mbus->write = yt921x_mbus_int_write;
+	mbus->parent = dev;
+	mbus->phy_mask = (u32)~GENMASK(YT921X_PORT_NUM - 1, 0);
+
+	res = devm_of_mdiobus_register(dev, mbus, mnp);
+	if (res)
+		return res;
+
+	priv->mbus_int = mbus;
+
+	return 0;
+}
+
+static int yt921x_extif_wait(struct yt921x_priv *priv)
+{
+	u32 val = 0;
+
+	return yt921x_reg_wait(priv, YT921X_EXT_MBUS_OP, YT921X_MBUS_OP_START,
+			       &val);
+}
+
+static int
+yt921x_extif_read(struct yt921x_priv *priv, int port, int reg, u16 *valp)
+{
+	struct device *dev = to_device(priv);
+	u32 mask;
+	u32 ctrl;
+	u32 val;
+	int res;
+
+	res = yt921x_extif_wait(priv);
+	if (res)
+		return res;
+
+	mask = YT921X_MBUS_CTRL_PORT_M | YT921X_MBUS_CTRL_REG_M |
+	       YT921X_MBUS_CTRL_TYPE_M | YT921X_MBUS_CTRL_OP_M;
+	ctrl = YT921X_MBUS_CTRL_PORT(port) | YT921X_MBUS_CTRL_REG(reg) |
+	       YT921X_MBUS_CTRL_TYPE_C22 | YT921X_MBUS_CTRL_READ;
+	res = yt921x_reg_update_bits(priv, YT921X_EXT_MBUS_CTRL, mask, ctrl);
+	if (res)
+		return res;
+	res = yt921x_reg_write(priv, YT921X_EXT_MBUS_OP, YT921X_MBUS_OP_START);
+	if (res)
+		return res;
+
+	res = yt921x_extif_wait(priv);
+	if (res)
+		return res;
+	res = yt921x_reg_read(priv, YT921X_EXT_MBUS_DIN, &val);
+	if (res)
+		return res;
+
+	if ((u16)val != val)
+		dev_info(dev,
+			 "%s: port %d, reg 0x%x: Expected u16, got 0x%08x\n",
+			 __func__, port, reg, val);
+	*valp = (u16)val;
+	return 0;
+}
+
+static int
+yt921x_extif_write(struct yt921x_priv *priv, int port, int reg, u16 val)
+{
+	u32 mask;
+	u32 ctrl;
+	int res;
+
+	res = yt921x_extif_wait(priv);
+	if (res)
+		return res;
+
+	mask = YT921X_MBUS_CTRL_PORT_M | YT921X_MBUS_CTRL_REG_M |
+	       YT921X_MBUS_CTRL_TYPE_M | YT921X_MBUS_CTRL_OP_M;
+	ctrl = YT921X_MBUS_CTRL_PORT(port) | YT921X_MBUS_CTRL_REG(reg) |
+	       YT921X_MBUS_CTRL_TYPE_C22 | YT921X_MBUS_CTRL_WRITE;
+	res = yt921x_reg_update_bits(priv, YT921X_EXT_MBUS_CTRL, mask, ctrl);
+	if (res)
+		return res;
+	res = yt921x_reg_write(priv, YT921X_EXT_MBUS_DOUT, val);
+	if (res)
+		return res;
+	res = yt921x_reg_write(priv, YT921X_EXT_MBUS_OP, YT921X_MBUS_OP_START);
+	if (res)
+		return res;
+
+	return yt921x_extif_wait(priv);
+}
+
+static int yt921x_mbus_ext_read(struct mii_bus *mbus, int port, int reg)
+{
+	struct yt921x_priv *priv = mbus->priv;
+	u16 val;
+	int res;
+
+	mutex_lock(&priv->reg_lock);
+	res = yt921x_extif_read(priv, port, reg, &val);
+	mutex_unlock(&priv->reg_lock);
+
+	if (res)
+		return res;
+	return val;
+}
+
+static int
+yt921x_mbus_ext_write(struct mii_bus *mbus, int port, int reg, u16 data)
+{
+	struct yt921x_priv *priv = mbus->priv;
+	int res;
+
+	mutex_lock(&priv->reg_lock);
+	res = yt921x_extif_write(priv, port, reg, data);
+	mutex_unlock(&priv->reg_lock);
+
+	return res;
+}
+
+int yt921x_mbus_ext_init(struct yt921x_priv *priv, struct device_node *mnp)
+{
+	struct device *dev = to_device(priv);
+	struct mii_bus *mbus;
+	int res;
+
+	mbus = devm_mdiobus_alloc(dev);
+	if (!mbus)
+		return -ENOMEM;
+
+	mbus->name = "YT921x external MDIO bus";
+	snprintf(mbus->id, MII_BUS_ID_SIZE, "%s@ext", dev_name(dev));
+	mbus->priv = priv;
+	/* TODO: c45? */
+	mbus->read = yt921x_mbus_ext_read;
+	mbus->write = yt921x_mbus_ext_write;
+	mbus->parent = dev;
+
+	res = devm_of_mdiobus_register(dev, mbus, mnp);
+	if (res)
+		return res;
+
+	priv->mbus_ext = mbus;
+
+	return 0;
+}
diff --git a/drivers/net/dsa/motorcomm/mdio_bus.h b/drivers/net/dsa/motorcomm/mdio_bus.h
new file mode 100644
index 000000000000..ae5792b8da24
--- /dev/null
+++ b/drivers/net/dsa/motorcomm/mdio_bus.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2026 David Yang
+ */
+
+#ifndef _YT_MDIO_BUS_H
+#define _YT_MDIO_BUS_H
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/of.h>
+
+#define YT921X_EXT_MBUS_OP		0x6a000
+#define YT921X_INT_MBUS_OP		0xf0000
+#define  YT921X_MBUS_OP_START			BIT(0)
+#define YT921X_EXT_MBUS_CTRL		0x6a004
+#define YT921X_INT_MBUS_CTRL		0xf0004
+#define  YT921X_MBUS_CTRL_PORT_M		GENMASK(25, 21)
+#define   YT921X_MBUS_CTRL_PORT(x)			FIELD_PREP(YT921X_MBUS_CTRL_PORT_M, (x))
+#define  YT921X_MBUS_CTRL_REG_M			GENMASK(20, 16)
+#define   YT921X_MBUS_CTRL_REG(x)			FIELD_PREP(YT921X_MBUS_CTRL_REG_M, (x))
+#define  YT921X_MBUS_CTRL_TYPE_M		GENMASK(11, 8)  /* wild guess */
+#define   YT921X_MBUS_CTRL_TYPE(x)			FIELD_PREP(YT921X_MBUS_CTRL_TYPE_M, (x))
+#define   YT921X_MBUS_CTRL_TYPE_C22			YT921X_MBUS_CTRL_TYPE(4)
+#define  YT921X_MBUS_CTRL_OP_M			GENMASK(3, 2)  /* wild guess */
+#define   YT921X_MBUS_CTRL_OP(x)			FIELD_PREP(YT921X_MBUS_CTRL_OP_M, (x))
+#define   YT921X_MBUS_CTRL_WRITE			YT921X_MBUS_CTRL_OP(1)
+#define   YT921X_MBUS_CTRL_READ				YT921X_MBUS_CTRL_OP(2)
+#define YT921X_EXT_MBUS_DOUT		0x6a008
+#define YT921X_INT_MBUS_DOUT		0xf0008
+#define YT921X_EXT_MBUS_DIN		0x6a00c
+#define YT921X_INT_MBUS_DIN		0xf000c
+
+struct yt921x_priv;
+
+int yt921x_mbus_int_init(struct yt921x_priv *priv, struct device_node *mnp);
+int yt921x_mbus_ext_init(struct yt921x_priv *priv, struct device_node *mnp);
+
+#endif
-- 
2.53.0

