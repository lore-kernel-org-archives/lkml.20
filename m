Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24C84349BC
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790603534; cv=none; b=Pxd10u2c3tU4aPoi/PQvUcZoXND1MdvHSwGlTPyhWiZ9OKABnJ+jog06B0pNMqbTZDZFR//UHtL8wDz9ophI+hzNG7yDIUs3efuKux/iUdY9pJxpoC4+aqGROaS9ItsTo7UBqFmhktIbUYyxO+2wJ0LxAxAm1A228zif+Ckjx+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790603534; c=relaxed/simple;
	bh=nsztS+SgTPSoQ/D1lsoAMNzlVg+6MEAWElX7J48YQgQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NgOF8l4oiGlxnz3gE4OEF5axMmTOGN/safmXSPVlE67UUdGM/uP0PbTwFpt5UrZecnqlO18ZhhvJTMO/t9SGzlMQRoO1lYduncALTWiNDVyANAf7T7aDDQ65+rrNZ5b5U5j2uTadcXNXUazXLQIXPoXCoIAQU88AZE/3j8vFGzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iqR41t8X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iqR41t8X"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58003C4AF0B;
	Mon, 28 Sep 2026 13:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790603533;
	bh=nsztS+SgTPSoQ/D1lsoAMNzlVg+6MEAWElX7J48YQgQ=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=iqR41t8X+UZJqymu3xI5mosI0EMV6OSpwz0emDBUfnGt6+FStmMAjSTd2JVWm6IkB
	 wYniSMWRRno+rNYRNyLgA10rOI3qZg5xm0/NBGURM7G8tGbO8s8sTW7Kj6l+giGybY
	 l4fCt4gLoqhoR26PCKK8oZljmIwmzRGwMI1XVZWs/6S7dfMkinDQ/EBg8n9riEJkHs
	 Uu2bKMVGGjHIcc8WhRqpKatXBGO6uk/eKuJZM8sy/zhaAeb7lklypDgj4ZlypDAni2
	 aX3frHq47AmWf6p6yQ71SQAHeoNmCbESKpg4nVkGeYSG7kmRAm1m/mtzz3PeBkbbf8
	 wErVA4o3EV0xQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34F64CA5FA5;
	Mon, 28 Sep 2026 13:52:13 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Mon, 28 Sep 2026 15:52:07 +0200
Subject: [PATCH] bus: fsl-mc: drop the fwnode links of the dpmacs nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-for-upstream-fsl-mc-dpmac-fwnode-links-v1-1-b8976244b38b@free.fr>
X-B4-Tracking: v=1; b=H4sIAAZxumoC/x3NPQ7CMAxA4atUnrFUPFQpV0EMaeKARfMjmwJS1
 bsTMX7LezsYq7DBZdhB+S0mtXScTwOEhy93RondQCNN40wOU1Xcmr2UfcZkK+aAsWUfMH1KjYy
 rlKfhRLQ49nGZnYcea8pJvv/R9XYcPyxG4uV4AAAA
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790603532; l=2306;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=1JT8cCZAXY4kQa0R2Q4UFo1Xst/5Or/QNRjHLJIMOVA=;
 b=6Hz8SIymAGcIVfMH4oZSYHZ103fey0tK7MYzBai9ppIO2uluoOJzO6yewQfRpQBAyxrygqkgz
 TDNOlCcKT5rBaW58LEjaXZdheScWhs3KHGR6mXq1OB7YR9lXMDcdhCt
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr

From: Vincent Jardin <vjardin@free.fr>

A DPMAC node under dpmacs/ is never the fwnode of any device:
  the fsl-mc bus creates dpmac.N objects without one,
  then dpaa2-mac finds its node in dpmacs/ at connect time.

fw_devlink therefore attaches the supplier links of those nodes (phys, ...)
to the nearest ancestor device, the fsl-mc bus, as SYNC_STATE_ONLY proxies.

device_link_add() refuses such a link once the consumer has probed, and
fw_devlink logs the refusal as an error.

On an LX2160A board with 4x25G DPMACs for which phys = <&serdes_1 N>,
the Serdes PHY binds after the bus and then at every boot it shows:

  fsl_mc_bus 80c000000.fsl-mc: Failed to create device link (0x180) with supplier 1ea0000.phy for /soc/fsl-mc@80c000000/dpmacs/ethernet@3

once per port!

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 drivers/bus/fsl-mc/fsl-mc-bus.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
index 5878eafd8d44..0c37b6780c84 100644
--- a/drivers/bus/fsl-mc/fsl-mc-bus.c
+++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
@@ -11,6 +11,7 @@
 #define pr_fmt(fmt) "fsl-mc: " fmt
 
 #include <linux/module.h>
+#include <linux/fwnode.h>
 #include <linux/of_device.h>
 #include <linux/of_address.h>
 #include <linux/ioport.h>
@@ -1033,6 +1034,20 @@ static int fsl_mc_firmware_check(struct platform_device *pdev)
 	return 0;
 }
 
+static void fsl_mc_purge_dpmac_fwnode_links(struct device *dev)
+{
+	struct device_node *dpmacs, *child;
+
+	dpmacs = of_get_child_by_name(dev->of_node, "dpmacs");
+	if (!dpmacs)
+		return;
+
+	for_each_child_of_node(dpmacs, child)
+		fwnode_links_purge(of_fwnode_handle(child));
+
+	of_node_put(dpmacs);
+}
+
 /*
  * fsl_mc_bus_probe - callback invoked when the root MC bus is being
  * added
@@ -1134,6 +1149,8 @@ static int fsl_mc_bus_probe(struct platform_device *pdev)
 						&mc->num_translation_ranges);
 		if (error < 0)
 			goto error_cleanup_mc_io;
+
+		fsl_mc_purge_dpmac_fwnode_links(&pdev->dev);
 	}
 
 	error = dprc_get_container_id(mc_io, 0, &container_id);

---
base-commit: 7b3b0598c00e67f2df85d0b4cd99eaa3be6c9bfd
change-id: 20260928-for-upstream-fsl-mc-dpmac-fwnode-links-622b8eadb98a

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>


