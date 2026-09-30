Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4B2446823
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790799353; cv=none; b=pFR6nSoov7y93S9j2tZrIIHj+N0TG8ZRFHSvXQl3BsQyjfWeKMbWjhwezrg3HKB/euAKj3k6mvBydQ+RIzfocPfWbeGqljKHXDlJNdgICDvR+D/uqZZl/lamozAhK4x1LYTq3M9dMM5NXZwVVrBettq4HX0AikeoCg4XTYErQGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790799353; c=relaxed/simple;
	bh=4kcMV2ayuSWtjNTLFAWlAtj1LSmyR3M6MFYIU6IRV+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MlxKaeROQPLQGmhg+ZK7ixpzp7RDNmHfUsu5TMWciaSe014lBXOw7+UJEOgGEqoi/mK5FEfblmAo6xewBYE72xOr18YTVuY4Yx+t+Pul75X9wW+D1uXH8T6QzEsE0Tryd5d4cdhaP65d/VZk7YqHLeg5GPzz1eL1ur+yFeEYm1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eXEtoFW6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eXEtoFW6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED6FFC2BCB9;
	Wed, 30 Sep 2026 20:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790799353;
	bh=4kcMV2ayuSWtjNTLFAWlAtj1LSmyR3M6MFYIU6IRV+8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=eXEtoFW6DqypfdVBNXJ4+UdQRIV05YFPtHjiXZkaoGl+yCNWhKUomUxDCRIc+aTyK
	 xPHyGWkpeniX01ECLtevqWVYch+6RBS8l2FmhyVXKclxdVVJ/8HYYPrxoo6r0DxUoA
	 q/Mx4ds6wmFyZIplNhyjh42ZkokwRpcOnC0UvItTpSXJt1XyTdEuBQOw8eEyyos4qF
	 FTbY7tvHXjVvdsx1aX5yEW1+Z34khfI0eMfxc1XrvoZ8aSbpFvjzHvrZH36uUywB0B
	 K1IWwPjbzzA0kvIbro6Wdwp53Vy4SRG2mG6IH7baiXRpiNx/I6Bfm2r08fkR1MVPQj
	 bGPfHcvlH/vPw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3CC2CA5FC5;
	Wed, 30 Sep 2026 20:15:52 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Wed, 30 Sep 2026 22:15:48 +0200
Subject: [PATCH v2] bus: fsl-mc: drop the fwnode links of the dpmacs nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-for-upstream-fsl-mc-dpmac-fwnode-links-v2-1-13f7b6ef000f@free.fr>
X-B4-Tracking: v=1; b=H4sIAPNtvWoC/5XNQQ6CMBCF4auQrh0DI8HiynsYFi2dSiO0zRRRQ
 7i7lRu4/N/ifatIxI6SuBSrYFpccsHnwEMh+kH5O4EzuQWW2JQtSrCB4RnTzKQmsGmEqQcTJ9W
 DfflgCEbnHwkaRC1JGd1KJfJZZLLuvUO3Lvfg0hz4s7tL9Vv/JpYKKtCyPTdY1/ok9dUy0dGy6
 LZt+wJ+p8jc2gAAAA==
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790799351; l=3039;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=MLGDYZOw45UD6Di3KCAHNR0GWLFDDhooxe3jcyGjVtM=;
 b=MM/lP60BsIy9mdVuQDHAoaw5n5UB2wX0fYSiZT9X2/SO1doHHOsw8KBr4mk0W0WxUN/RwWgnt
 XPjF0wbsqdrCNK2c8DdY1ToyPJSotDqmJmdS1dxPNgjVIqJetBVrmD6
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

To fix it, when the root MC bus probes, purge the fwnode links of every
child of its dpmacs node, so fw_devlink has no supplier link left to
proxy to the bus and no longer tries to create those device links.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Tested-by: Ioana Ciornei <ioana.ciornei@nxp.com> # LX2160ARDB
---
The dpmacs node is the documented child of the
fsl-mc node: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.yaml
(and bindings/net/fsl,qoriq-mc-dpmac.yaml for its DPMAC subnodes).

Changes in v2:
- Improve commit log (Christophe)
- Collect Ioana's Reviewed-by and Tested-by
- Link to v1: https://lore.kernel.org/r/20260928-for-upstream-fsl-mc-dpmac-fwnode-links-v1-1-b8976244b38b@free.fr
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


