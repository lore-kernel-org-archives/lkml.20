Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794838511;
	b=h+T2aV1I9oTfeeQO1Nn2N4m71igy3jV64Mq2QfL5eJ0BBUAeBLLlVPNO+U9YNEKsv0eo
	 6dID6Js2UV26bgg3dhcVg4/y5SGlCdKnjp7oXZzyWGtbtv4XxWhNB95lF3N02Of197yZq
	 vIi2JsabjAxyR49Eqr+HCVdPSB6eJ9U2dNgqaUFzFsDxJIFxnD9bPoo7rUNuV0dSX/Qc3
	 eSIg98uAye/DUkjj9jjV0y15725M1CYwPGCz73+TOHVS1n6urKqXHN2Qzd07Ch+Ca5NCH
	 BrdTpPaIiRo37KTG2hi2kxhHf2s3spuTzVLlO3BPOG0j7r8WIbjzlDI0nnISrCoxc+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838511;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=zrNMcwKWc2ghyWtCVArBKi7uk7SjPzETXM2uwDrQ724=;
	b=d1Eww3LMrM0IqKDq7BxiTfvMhyjHGLiS42GSAU87JIGedO8Is3yzmjfctMfIS45tzWZa
	 KwMgE6vht165UMn3PrxIFq0vDpJ8cwjKaSupvsk5q7STaUmYLcagwe9mdOAjWIBGh8jXe
	 Vfnux3+7TztNsFyRzG46tw8gnd/9flHnOgI/Z5WIUb6sq74q1IvKmN5CD/lbzlKKwLmTq
	 g5SWzLwwJ82lwwuYja5AeZK4wgAYD++1VmAEKZBqKeoi4bFBfy2v7/gBVpnqElSHXKnKK
	 RY1PL5M6wLXEv13dmD9/In02iLxXT6MWSSCqG53DYaxrbt0B71Kjz9brzollo2MN3tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FHhyWqPo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA69C606A33E;
	Mon, 16 Nov 2026 14:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FHhyWqPo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 738371F000CD;
	Mon, 16 Nov 2026 14:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794838511;
	bh=zrNMcwKWc2ghyWtCVArBKi7uk7SjPzETXM2uwDrQ724=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FHhyWqPoyoVyfN4+TR1sGcXzFwDSfEd/eV4fH9vj8nCXp+1PzK9pU4TZjW3OVbXVH
	 zGZqmZQbjXadv0tdl7C5VOuz+mEz/P1C6ms7csArSURCkUnUZOe4F8x6bb4BrI4mra
	 qNTbpwdU9IWyKTeTWlJBFhhH6YOlwpHQs6gmm49WjGu104XBzoLJ15OgM3Coyd2Flr
	 zVrVhPN5mLMtE70SCUu5Gx+J9y0629qr3kBOegVFY9dAjMKo0kB2W0r5qZe/CUPICr
	 jJvD/01/5drfbJgQjwGmIolUUfsbipuXEknBasBKFBGfj1a/xzddtJmkfoHBNhb1Lx
	 HYSE6dliQDViA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/8] net: mdio: Add MDIO demultiplexer driver
Date: Mon, 16 Nov 2026 21:54:36 +0800
Message-ID: <20261116135442.4827-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116135442.4827-1-jszhang@kernel.org>
References: <20261116135442.4827-1-jszhang@kernel.org>
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

Assume we have the following implementation:
          ----------
          |mmio reg|
	  ----------
             |
 --------    |      -------
 | MAC0 |--MDIO-----| PHY |
 -------- |     |   -------
          |     |
 -------- |     |   -------
 | MAC1 |--     ----| PHY |
 --------           -------

Both MAC0 and MAC1 have MDIO bus masters, and tie together to
a single set of clock and data lines, which go to some PHYs. While
there's a mmio reg to control which MAC mdio master can operate
the single mdio clock and data lines, so only one MAC can operate
the mdio clock and data lines.

We also need to fully support three use cases: only MAC0 + PHY is used
on board; only MAC1 + PHY is used on board; MAC0 + MAC1 + PHYs are
all used.

To support this kind of usage, we need a kind of mdio demuxer. This
patch add the driver code.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/net/mdio/Kconfig      |  12 ++
 drivers/net/mdio/Makefile     |   1 +
 drivers/net/mdio/mdio-demux.c | 298 ++++++++++++++++++++++++++++++++++
 3 files changed, 311 insertions(+)
 create mode 100644 drivers/net/mdio/mdio-demux.c

diff --git a/drivers/net/mdio/Kconfig b/drivers/net/mdio/Kconfig
index d44278f26fab..e4a3ff594881 100644
--- a/drivers/net/mdio/Kconfig
+++ b/drivers/net/mdio/Kconfig
@@ -289,5 +289,17 @@ config MDIO_BUS_MUX_MMIOREG
 
 	  Currently, only 8/16/32 bits registers are supported.
 
+config MDIO_BUS_DEMUX
+	tristate "MDIO bus demultiplexer"
+	depends on OF_MDIO
+	select MULTIPLEXER
+	help
+	  This driver provides child MDIO buses backed by separate parent
+	  MDIO buses. A shared mux control selects which parent bus is
+	  connected to the physical MDIO lines for each transaction.
+
+	  To compile this driver as a module, choose M here. The module
+	  will be called mdio-demux.
+
 endmenu
 endmenu
diff --git a/drivers/net/mdio/Makefile b/drivers/net/mdio/Makefile
index 048586746026..1f9bb8672fc8 100644
--- a/drivers/net/mdio/Makefile
+++ b/drivers/net/mdio/Makefile
@@ -35,3 +35,4 @@ obj-$(CONFIG_MDIO_BUS_MUX_MESON_G12A)	+= mdio-mux-meson-g12a.o
 obj-$(CONFIG_MDIO_BUS_MUX_MESON_GXL)	+= mdio-mux-meson-gxl.o
 obj-$(CONFIG_MDIO_BUS_MUX_MMIOREG) 	+= mdio-mux-mmioreg.o
 obj-$(CONFIG_MDIO_BUS_MUX_MULTIPLEXER) 	+= mdio-mux-multiplexer.o
+obj-$(CONFIG_MDIO_BUS_DEMUX)		+= mdio-demux.o
diff --git a/drivers/net/mdio/mdio-demux.c b/drivers/net/mdio/mdio-demux.c
new file mode 100644
index 000000000000..a64c1e1bf4ff
--- /dev/null
+++ b/drivers/net/mdio/mdio-demux.c
@@ -0,0 +1,298 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Synaptics Incorporated
+ *
+ * Author: Jisheng Zhang <jszhang@kernel.org>
+ */
+
+#include <linux/atomic.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/mux/consumer.h>
+#include <linux/of_mdio.h>
+#include <linux/phy.h>
+#include <linux/platform_device.h>
+
+#define MAX_MDIO_PORT	2
+
+struct mdio_demux_port {
+	struct mii_bus *pb;
+	struct mii_bus *bus;
+	struct mdio_demux_priv *priv;
+	int port;
+};
+
+struct mdio_demux_priv {
+	/* Serialize selector changes and transfers across all parent buses. */
+	struct mutex mdio_demux_lock;
+	int current_port;
+	bool do_deselect;
+	struct mux_control *muxc;
+	struct mdio_demux_port dmxport[MAX_MDIO_PORT];
+	int id;
+};
+
+static atomic_t mdio_demux_id = ATOMIC_INIT(0);
+
+static int mdio_demux_switch(struct mdio_demux_port *dmxport)
+{
+	struct mdio_demux_priv *priv = dmxport->priv;
+	int r;
+
+	if (priv->current_port == dmxport->port)
+		return 0;
+
+	if (priv->do_deselect) {
+		r = mux_control_deselect(priv->muxc);
+		priv->do_deselect = false;
+		priv->current_port = -1;
+		if (r)
+			return r;
+	}
+
+	r = mux_control_select(priv->muxc, dmxport->port);
+	if (r) {
+		priv->current_port = -1;
+		priv->do_deselect = false;
+		return r;
+	}
+	priv->do_deselect = true;
+
+	priv->current_port = dmxport->port;
+
+	return 0;
+}
+
+static int mdio_demux_read(struct mii_bus *bus, int phy_id, int regnum)
+{
+	struct mdio_demux_port *dmxport = bus->priv;
+	struct mdio_demux_priv *priv = dmxport->priv;
+	int r;
+
+	guard(mutex)(&priv->mdio_demux_lock);
+
+	r = mdio_demux_switch(dmxport);
+	if (r)
+		return r;
+
+	return dmxport->pb->read(dmxport->pb, phy_id, regnum);
+}
+
+static int mdio_demux_read_c45(struct mii_bus *bus, int phy_id, int dev_addr,
+			       int regnum)
+{
+	struct mdio_demux_port *dmxport = bus->priv;
+	struct mdio_demux_priv *priv = dmxport->priv;
+	int r;
+
+	guard(mutex)(&priv->mdio_demux_lock);
+
+	r = mdio_demux_switch(dmxport);
+	if (r)
+		return r;
+
+	return dmxport->pb->read_c45(dmxport->pb, phy_id, dev_addr, regnum);
+}
+
+static int mdio_demux_write(struct mii_bus *bus, int phy_id,
+			    int regnum, u16 val)
+{
+	struct mdio_demux_port *dmxport = bus->priv;
+	struct mdio_demux_priv *priv = dmxport->priv;
+	int r;
+
+	guard(mutex)(&priv->mdio_demux_lock);
+
+	r = mdio_demux_switch(dmxport);
+	if (r)
+		return r;
+
+	return dmxport->pb->write(dmxport->pb, phy_id, regnum, val);
+}
+
+static int mdio_demux_write_c45(struct mii_bus *bus, int phy_id, int dev_addr,
+				int regnum, u16 val)
+{
+	struct mdio_demux_port *dmxport = bus->priv;
+	struct mdio_demux_priv *priv = dmxport->priv;
+	int r;
+
+	guard(mutex)(&priv->mdio_demux_lock);
+
+	r = mdio_demux_switch(dmxport);
+	if (r)
+		return r;
+
+	return dmxport->pb->write_c45(dmxport->pb, phy_id, dev_addr, regnum, val);
+}
+
+static int mdio_demux_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct device_node *child_bus_node, *parent_bus_node;
+	struct mii_bus *parent_bus;
+	struct mii_bus *bus;
+	struct mdio_demux_priv *priv;
+	int r, v, i = 0;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->current_port = -1;
+	priv->id = atomic_inc_return(&mdio_demux_id);
+	mutex_init(&priv->mdio_demux_lock);
+
+	priv->muxc = devm_mux_control_get(&pdev->dev, NULL);
+	if (IS_ERR(priv->muxc))
+		return dev_err_probe(&pdev->dev, PTR_ERR(priv->muxc), "Failed to get mux\n");
+
+	for_each_available_child_of_node(np, child_bus_node) {
+		if (i >= MAX_MDIO_PORT) {
+			r = -EINVAL;
+			goto err_child;
+		}
+
+		parent_bus_node = of_parse_phandle(np, "mdio-parent-bus", i);
+		if (!parent_bus_node) {
+			r = -ENODEV;
+			goto err_child;
+		}
+
+		r = of_property_read_u32(child_bus_node, "reg", &v);
+		if (r) {
+			dev_err(&pdev->dev,
+				"Failed to find reg for child %pOF: %pe\n",
+				child_bus_node, ERR_PTR(r));
+			goto err_parent_node;
+		}
+
+		parent_bus = of_mdio_find_bus(parent_bus_node);
+		if (!parent_bus) {
+			r = -EPROBE_DEFER;
+			goto err_parent_node;
+		}
+		if (!device_link_add(&pdev->dev, parent_bus->parent,
+				     DL_FLAG_AUTOREMOVE_CONSUMER)) {
+			r = -ENOMEM;
+			put_device(&parent_bus->dev);
+			goto err_parent_node;
+		}
+		of_node_put(parent_bus_node);
+		parent_bus_node = NULL;
+		priv->dmxport[i].pb = parent_bus;
+		priv->dmxport[i].port = v;
+		priv->dmxport[i].priv = priv;
+
+		bus = devm_mdiobus_alloc(&pdev->dev);
+		if (!bus) {
+			r = -ENOMEM;
+			goto err_parent_bus;
+		}
+
+		bus->priv = &priv->dmxport[i];
+		bus->name = "mdio_demux";
+		snprintf(bus->id, MII_BUS_ID_SIZE, "%s-%x.%x", bus->name,
+			 priv->id, v);
+		bus->parent = &pdev->dev;
+		if (parent_bus->read)
+			bus->read = mdio_demux_read;
+		if (parent_bus->write)
+			bus->write = mdio_demux_write;
+		if (parent_bus->read_c45)
+			bus->read_c45 = mdio_demux_read_c45;
+		if (parent_bus->write_c45)
+			bus->write_c45 = mdio_demux_write_c45;
+		r = of_mdiobus_register(bus, child_bus_node);
+		if (r)
+			goto err_parent_bus;
+		priv->dmxport[i].bus = bus;
+		++i;
+	}
+
+	if (!i)
+		goto err_no_children;
+
+	platform_set_drvdata(pdev, priv);
+
+	return 0;
+
+err_parent_bus:
+	put_device(&parent_bus->dev);
+	of_node_put(child_bus_node);
+	goto err_registered_bus;
+
+err_no_children:
+	return -ENODEV;
+
+err_parent_node:
+	of_node_put(parent_bus_node);
+err_child:
+	of_node_put(child_bus_node);
+err_registered_bus:
+	while (i > 0) {
+		i--;
+		mdiobus_unregister(priv->dmxport[i].bus);
+		put_device(&priv->dmxport[i].pb->dev);
+	}
+	if (priv->do_deselect)
+		mux_control_deselect(priv->muxc);
+	return r;
+}
+
+static void mdio_demux_remove(struct platform_device *pdev)
+{
+	struct mdio_demux_priv *priv = platform_get_drvdata(pdev);
+	int i;
+
+	for (i = MAX_MDIO_PORT - 1; i >= 0; i--)
+		if (priv->dmxport[i].bus) {
+			mdiobus_unregister(priv->dmxport[i].bus);
+			put_device(&priv->dmxport[i].pb->dev);
+		}
+
+	guard(mutex)(&priv->mdio_demux_lock);
+	if (priv->do_deselect) {
+		mux_control_deselect(priv->muxc);
+		priv->do_deselect = false;
+	}
+}
+
+static int mdio_demux_suspend(struct device *dev)
+{
+	struct mdio_demux_priv *priv = dev_get_drvdata(dev);
+	int ret = 0;
+
+	guard(mutex)(&priv->mdio_demux_lock);
+
+	priv->current_port = -1;
+	if (priv->do_deselect) {
+		ret = mux_control_deselect(priv->muxc);
+		priv->do_deselect = false;
+	}
+
+	return ret;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(mdio_demux_pm_ops, mdio_demux_suspend, NULL);
+
+static const struct of_device_id mdio_demux_dt_ids[] = {
+	{ .compatible = "mdio-demux" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, mdio_demux_dt_ids);
+
+static struct platform_driver mdio_demux_driver = {
+	.probe = mdio_demux_probe,
+	.remove = mdio_demux_remove,
+	.driver = {
+		.name = "mdio-demux",
+		.of_match_table = mdio_demux_dt_ids,
+		.pm = pm_sleep_ptr(&mdio_demux_pm_ops),
+	},
+};
+module_platform_driver(mdio_demux_driver);
+
+MODULE_DESCRIPTION("MDIO bus demux driver");
+MODULE_AUTHOR("Jisheng Zhang <jszhang@kernel.org>");
+MODULE_LICENSE("GPL");
-- 
2.55.0

