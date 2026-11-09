Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794241541;
	b=mkauuDJfy0PFsKavVsBJg2Gg19HFXQdXBoCb25XgKGA0zZl3oQUEo4zVugl540Q7N7c8
	 VyvhsSidCR7WnPIOEFaXSImJyTmAtAFSTn3ZnvjUncXxgPIXKqX229iOoXrr6z/Sym4b2
	 i9+l6Wyljyv4ZEPEM/sTueEt1R0JwCyENdOqs0WV+90c6Dwf+C1ZJSfxPuuwTlwD/8XuR
	 hLfBlRQiN1xCyRykzjxh6vl0Gj/tWVxjZqsVwoH/OvLRb4UrGJKSDqTEXsoLpBC0P1hKB
	 eKTn7p2vJqRrUpd/FckpOeQe/c9xQPLk/j741FqO9NGV0JgqqIioBlX4brBisxhHgQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794241541;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=+2yzY15GUtkNex5GlwHwiRyhMAZ3d2v8D43aFEO4ap4=;
	b=mGNGxI5w+qXR63UUjKEf5cak7o70IEvwx7S2urkeZFyLU95pQtXZ4rXciX85Ob8zSvq+
	 Esm8/kZNMyGewiBJ/9PA3AZ1ZM/FUP2OoZ3vbpOeFDqDAusScHKCluV+F3YA+YOurT8AK
	 ax9W69q/BORGYnYRagtZob82DXHfd5dPBBKiqWBydJq2GQZMGTbTn+ZNMZ2fbogyifLAg
	 iwdDl24mAh69Ahr231n4y8ozE9/fvE4g8NMWy4wN7CcSy9/UPpHUbt2nCi/HifXg9nj2U
	 q9Bvf3ldVrVGQzYBZC2QWXgUdX9EIn2d2gadWRcc6pE+w1VL9zW0g31t11XSF9N6oqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lp3oGfCj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598CE606EE89;
	Mon,  9 Nov 2026 16:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lp3oGfCj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06E751F008A4;
	Mon,  9 Nov 2026 16:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794241541;
	bh=+2yzY15GUtkNex5GlwHwiRyhMAZ3d2v8D43aFEO4ap4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Lp3oGfCju90ycKneBW5yFqKGh606p8+EV3v82qEiiMlEdwB79ZD7XaYNqAJ8chE/h
	 a6OFg0Cfr+IvcLSFYipzvY4DVydE9SnAV/zaQDPiNaH1LEN0vbRK1Du0Brw00TzkdY
	 XcvYkBdbp5CryMbs6bm5lgR3M8mEAJlN39SOp5JsYaahHjxf/mQzQYICpwqVZMA3zo
	 jLNHLSA/qfkhORKqzNf+j9l/Tqqt9UpnVToFW7eUW805lkn89wI+m7pn2GzxI3bEGj
	 TGNO78btnp17IQgyAgOJE5NbVwj/oN0Gc/R4wwdsHjzLm4j+djd2n7x59Koz/8woxL
	 /cuQF+/aORXYQ==
From: Dinh Nguyen <dinguyen@kernel.org>
To: bp@alien8.de,
	tony.luck@intel.com
Cc: dinguyen@kernel.org,
	rounakdas2025@gmail.com,
	niravkumar.l.rabara@altera.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCHv2 3/4] EDAC/altera: Add support for Agilex5 ECC manager
Date: Mon,  9 Nov 2026 10:25:22 -0600
Message-ID: <20261109162523.1698129-3-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
In-Reply-To: <20261109162523.1698129-1-dinguyen@kernel.org>
References: <20261109162523.1698129-1-dinguyen@kernel.org>
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

Add support for the Agilex5 ECC manager, unlike Stratix10/Agilex7,
Agilex5 exposes up to 7 named interrupts on its DT node:

  global_sbe    - aggregate single-bit error (chained, drives IRQ domain)
  global_dbe    - aggregate double-bit error (chained; DBE is no longer
                  delivered exclusively through Asynchronous SError)
  io96b0        - IO96B0 DRAM controller ECC
  io96b1        - IO96B1 DRAM controller ECC
  sdm_qspi_sbe  - SDM QSPI single-bit error
  sdm_qspi_dbe  - SDM QSPI double-bit error
  sdm_seu       - SDM single-event-upset

Place all seven interrupt's name in a new agilex5_irqs[] array on struct
altr_arria10_edac so subsequent peripheral support (IO96B, SDM QSPI, CRAM
SEU) can consume them without re-parsing the DT. Only the global_sbe is
mandatory, the rest are optional.

global_sbe is wired up as the chained SBE handler (replacing the legacy
index-0 lookup). global_dbe is hooked into the same
altr_edac_a10_irq_handler() so that the existing sb_irq/db_irq demux
routes DBE events through the manager's IRQ domain.

Legacy A10/S10 probe paths are unchanged.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
v2: Reorganize db_error so Agilex5 goes last to prevent going into
    default condition for A10
    Clean up the commit message to be less wordy
---
 drivers/edac/altera_edac.c | 84 ++++++++++++++++++++++++++++++++++++--
 drivers/edac/altera_edac.h | 29 +++++++++++++
 2 files changed, 109 insertions(+), 4 deletions(-)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index 78f4a1b0fc64a..7d9dd66170c9a 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -2107,11 +2107,63 @@ static int s10_edac_dberr_handler(struct notifier_block *this,
 	return NOTIFY_DONE;
 }
 
+/*
+ * Ordered table of named interrupts published by an
+ * "altr,socfpga-agilex5-ecc-manager" device tree node. Indices match
+ * enum altr_agilex5_irq_idx. Only "global_sbe" is mandatory; the rest are
+ * optional so platforms can omit interrupts for unused subsystems.
+ */
+static const char * const altr_agilex5_irq_names[ALTR_AGILEX5_NUM_IRQS] = {
+	[ALTR_AGILEX5_IRQ_GLOBAL_SBE]   = "global_sbe",
+	[ALTR_AGILEX5_IRQ_GLOBAL_DBE]   = "global_dbe",
+	[ALTR_AGILEX5_IRQ_IO96B0]       = "io96b0",
+	[ALTR_AGILEX5_IRQ_IO96B1]       = "io96b1",
+	[ALTR_AGILEX5_IRQ_SDM_QSPI_SBE] = "sdm_qspi_sbe",
+	[ALTR_AGILEX5_IRQ_SDM_QSPI_DBE] = "sdm_qspi_dbe",
+	[ALTR_AGILEX5_IRQ_SDM_SEU]      = "sdm_seu",
+};
+
+/*
+ * Populate edac->agilex5_irqs[] from the named interrupts on the manager
+ * platform device. Missing optional interrupts are stored as a negative
+ * errno (-ENXIO) so that subsequent feature code can probe whether the
+ * resource exists. global_sbe is required because it drives the manager's
+ * IRQ domain dispatch path.
+ *
+ * platform_get_irq_byname_optional() can return -EPROBE_DEFER when the
+ * parent irqchip (e.g. the GIC) is not yet probed. Propagate that error
+ * up so the kernel re-tries the probe later instead of permanently
+ * disabling the named interrupt.
+ */
+static int altr_agilex5_get_named_irqs(struct platform_device *pdev,
+				       struct altr_arria10_edac *edac)
+{
+	int i, irq;
+
+	for (i = 0; i < ALTR_AGILEX5_NUM_IRQS; i++) {
+		irq = platform_get_irq_byname_optional(pdev,
+						       altr_agilex5_irq_names[i]);
+		if (irq == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+
+		edac->agilex5_irqs[i] = irq > 0 ? irq : -ENXIO;
+	}
+
+	if (edac->agilex5_irqs[ALTR_AGILEX5_IRQ_GLOBAL_SBE] < 0) {
+		dev_err(&pdev->dev,
+			"Agilex5 ECC manager missing required 'global_sbe' interrupt\n");
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
 /****************** Arria 10 EDAC Probe Function *********************/
 static int altr_edac_a10_probe(struct platform_device *pdev)
 {
 	struct altr_arria10_edac *edac;
 	struct device_node *child;
+	int rc;
 
 	edac = devm_kzalloc(&pdev->dev, sizeof(*edac), GFP_KERNEL);
 	if (!edac)
@@ -2147,14 +2199,30 @@ static int altr_edac_a10_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
-	edac->sb_irq = platform_get_irq(pdev, 0);
-	if (edac->sb_irq < 0)
-		return edac->sb_irq;
+	if (edac->flag == SOCFPGA_AGILEX5) {
+		rc = altr_agilex5_get_named_irqs(pdev, edac);
+		if (rc)
+			return rc;
+
+		edac->sb_irq = edac->agilex5_irqs[ALTR_AGILEX5_IRQ_GLOBAL_SBE];
+	} else {
+		edac->sb_irq = platform_get_irq(pdev, 0);
+		if (edac->sb_irq < 0)
+			return edac->sb_irq;
+	}
 
 	irq_set_chained_handler_and_data(edac->sb_irq,
 					 altr_edac_a10_irq_handler,
 					 edac);
 
+	/*
+	 * Unlike Stratix10/Agilex7 (which deliver uncorrectable errors as
+	 * Asynchronous SError), Agilex5 routes the global double-bit error
+	 * through a dedicated SPI ("global_dbe"). Hook it into the same
+	 * chained handler so the existing sb_irq/db_irq demux in
+	 * altr_edac_a10_irq_handler() routes DBE events through the manager's
+	 * IRQ domain.
+	 */
 	if (edac->flag == SOCFPGA_S10) {
 		int dberror, err_addr;
 
@@ -2177,13 +2245,19 @@ static int altr_edac_a10_probe(struct platform_device *pdev)
 			regmap_write(edac->ecc_mgr_map,
 				     S10_SYSMGR_UE_ADDR_OFST, 0);
 		}
-	} else {
+	} else if (edac->flag == SOCFPGA_A10) {
 		edac->db_irq = platform_get_irq(pdev, 1);
 		if (edac->db_irq < 0)
 			return edac->db_irq;
 
 		irq_set_chained_handler_and_data(edac->db_irq,
 						 altr_edac_a10_irq_handler, edac);
+	} else if (edac->flag == SOCFPGA_AGILEX5 &&
+		   edac->agilex5_irqs[ALTR_AGILEX5_IRQ_GLOBAL_DBE] >= 0) {
+		edac->db_irq = edac->agilex5_irqs[ALTR_AGILEX5_IRQ_GLOBAL_DBE];
+		irq_set_chained_handler_and_data(edac->db_irq,
+						 altr_edac_a10_irq_handler,
+						 edac);
 	}
 
 	for_each_child_of_node(pdev->dev.of_node, child) {
@@ -2209,6 +2283,8 @@ static const struct of_device_id altr_edac_a10_of_match[] = {
 	  .data = (void *)SOCFPGA_A10 },
 	{ .compatible = "altr,socfpga-s10-ecc-manager",
 	  .data = (void *)SOCFPGA_S10 },
+	{ .compatible = "altr,socfpga-agilex5-ecc-manager",
+	  .data = (void *)SOCFPGA_AGILEX5 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, altr_edac_a10_of_match);
diff --git a/drivers/edac/altera_edac.h b/drivers/edac/altera_edac.h
index 4a9da28fa96ba..03b50079b657a 100644
--- a/drivers/edac/altera_edac.h
+++ b/drivers/edac/altera_edac.h
@@ -326,6 +326,27 @@ struct altr_sdram_mc_data {
 #define S10_DDR0_IRQ_MASK                 BIT(16)
 #define S10_DBE_IRQ_MASK                  0x3FFFE
 
+/************* Agilex5 Defines **************/
+/*
+ * The Agilex5 ECC manager exposes up to 7 named interrupts on the manager
+ * node. global_sbe and global_dbe are aggregate single/double-bit error
+ * interrupts that fan-out through the manager's IRQ domain to the child
+ * peripheral ECCs. The remaining named interrupts are routed directly from
+ * dedicated controllers (IO96B memory controllers and Secure Device Manager)
+ * to the GIC.
+ */
+#define ALTR_AGILEX5_NUM_IRQS             7
+
+enum altr_agilex5_irq_idx {
+	ALTR_AGILEX5_IRQ_GLOBAL_SBE,
+	ALTR_AGILEX5_IRQ_GLOBAL_DBE,
+	ALTR_AGILEX5_IRQ_IO96B0,
+	ALTR_AGILEX5_IRQ_IO96B1,
+	ALTR_AGILEX5_IRQ_SDM_QSPI_SBE,
+	ALTR_AGILEX5_IRQ_SDM_QSPI_DBE,
+	ALTR_AGILEX5_IRQ_SDM_SEU,
+};
+
 /* Define ECC Block Offsets for peripherals */
 #define ECC_BLK_ADDRESS_OFST              0x40
 #define ECC_BLK_RDATA0_OFST               0x44
@@ -401,6 +422,14 @@ struct altr_arria10_edac {
 	struct list_head	a10_ecc_devices;
 	struct notifier_block	panic_notifier;
 	unsigned long		flag;
+
+	/*
+	 * Agilex5 ECC manager supports up to 7 named interrupts. Entries
+	 * are indexed by the altr_agilex5_irq_idx enum and hold the virtual
+	 * IRQ number, or a negative errno when the corresponding interrupt
+	 * was not provided in the device tree.
+	 */
+	int			agilex5_irqs[ALTR_AGILEX5_NUM_IRQS];
 };
 
 #endif	/* #ifndef _ALTERA_EDAC_H */
-- 
2.42.0.411.g813d9a9188

