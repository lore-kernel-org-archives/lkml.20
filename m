Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794860944;
	b=KPNq3c6zLuA0r0ENU4RbDHqJLfej4tXymBeRFAkrwuHzdiI22Zgilg0TqbCCXi74GjHx
	 Mo6ygjOyM1snspRVlABo7VN5aHvhJm5NyHS58vQjDWhuHzOymPzYttYGMoQdVtsDZoTfg
	 nx1Tup7U/S2tDy5bfqmL+0s583C69j61IErZlWQHqDfsajoxkEnG+CxVnHalRJZ3wtksX
	 JbfFi5/Vt2Uc9CjqnNLLXw8HbNDCFf98rqjb1nKL3c2o8ZcmfQf47QcBOTDhCL6wfsAZH
	 EYmQhCHm68lF0HwlyZ/VP2tfShvFUSvRJP6ieFbOzHtBQatbiyXjOZuuAVGksgbqZQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794860944;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=XcwaGPU6POeIx4ezF0dcfaOLoYf1TK1CW4RqG8Klp5E=;
	b=ipAc0lIandYIF9Fos4VZuBMxSifvfdAYaacx+P0Rkc7ivEC9JbLMv/Sqqsa/n7eHeqSq
	 K0cRmp/FnYTy3PF5vfT6Cw0Qz5OWEkmWbdwHAN/AIyq+Yt94dAF+s8om9bNXvewKINBQ7
	 sfY8OsmJoRaioen/SrKk1yr3txWmmKDJbfGdq0+JGpybMuzMvrmsjpuqLwFGfBScVpvo+
	 t5IsI0TDLfheQ0+evcxj39mEGvj6sYoPh3A+4HSOvnr62Dm+l87DqYx+xj/hnfHWWT6AB
	 uCEbaLIC3zuNK34V6ucvVYtqqmmQ8rhrBruo9LjT0sAJefl4X4/iIb0rXk9tGjZ4fng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D84i6YIV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7199606A322;
	Mon, 16 Nov 2026 20:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D84i6YIV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BC291F000CF;
	Mon, 16 Nov 2026 20:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794860944;
	bh=XcwaGPU6POeIx4ezF0dcfaOLoYf1TK1CW4RqG8Klp5E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=D84i6YIVd1mMY2Y7nO8hRqB7ifnZH3CUUaDngDkZUuVABfdLcrPiYW7CadqNzDFGJ
	 cPd5k/aWxjMEXS8IdmPJl3HFcpEbkWQqWitD8P5Qren8RdGs3hV9eoZg4otu1joWMQ
	 g/jkdGsPbqq8NXVtma1uyXra1BkLXqgz8Seuw4bYwJDLui3r3ywhKu8354vXHwlUCX
	 XUxiO7Iw1XAupxSb0ZDylghNdzwih6vAK1NSf5RkRrruZ1gkCj09wzs5wPEHJqug/n
	 1+blJ2Ex9K9kgcRhAuK6Yn4N5R2cnZKJZ5yIiXrY2nYWJ3O4vkomW+jhhWnR7iGqs+
	 ErUFqWI1RwMVA==
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
Subject: [PATCHv4 3/4] EDAC/altera: Add support for Agilex5 ECC manager
Date: Mon, 16 Nov 2026 14:28:53 -0600
Message-ID: <20261116202854.3087673-3-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
In-Reply-To: <20261116202854.3087673-1-dinguyen@kernel.org>
References: <20261116202854.3087673-1-dinguyen@kernel.org>
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
Agilex5 exposes 7 named interrupts on its DT node:

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
SEU) can consume them without re-parsing the DT.

global_sbe is wired up as the chained SBE handler (replacing the legacy
index-0 lookup). global_dbe is hooked into the same
altr_edac_a10_irq_handler() so that the existing sb_irq/db_irq demux
routes DBE events through the manager's IRQ domain.

Legacy A10/S10 probe paths are unchanged.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
v4: The 7 named irqs for Agilex5 are all required properties
v3: Use irq_domain_remove() in error path of altr_edac_a10_probe() when
    irq names cannot be found.
    Return -EINVAL for when sbe irq is not found in
    altr_agilex5_get_named_irqs()
v2: Reorganize db_error so Agilex5 goes last to prevent going into
    default condition for A10
    Clean up the commit message to be less wordy
---
 drivers/edac/altera_edac.c | 71 +++++++++++++++++++++++++++++++++++---
 drivers/edac/altera_edac.h | 28 +++++++++++++++
 2 files changed, 95 insertions(+), 4 deletions(-)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index 78f4a1b0fc64a..c56413cb5c95c 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -2107,11 +2107,49 @@ static int s10_edac_dberr_handler(struct notifier_block *this,
 	return NOTIFY_DONE;
 }
 
+/*
+ * Ordered table of named interrupts published by an
+ * "altr,socfpga-agilex5-ecc-manager" device tree node. Indices match
+ * enum altr_agilex5_irq_idx. Every name is required.
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
+ * platform device. Every name is required. platform_get_irq_byname()
+ * reports a missing interrupt and returns -EPROBE_DEFER when the parent
+ * irqchip is not yet probed so probe can be retried.
+ */
+static int altr_agilex5_get_named_irqs(struct platform_device *pdev,
+				       struct altr_arria10_edac *edac)
+{
+	int i, irq;
+
+	for (i = 0; i < ALTR_AGILEX5_NUM_IRQS; i++) {
+		irq = platform_get_irq_byname(pdev, altr_agilex5_irq_names[i]);
+		if (irq < 0)
+			return irq;
+
+		edac->agilex5_irqs[i] = irq;
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
@@ -2147,14 +2185,32 @@ static int altr_edac_a10_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
-	edac->sb_irq = platform_get_irq(pdev, 0);
-	if (edac->sb_irq < 0)
-		return edac->sb_irq;
+	if (edac->flag == SOCFPGA_AGILEX5) {
+		rc = altr_agilex5_get_named_irqs(pdev, edac);
+		if (rc) {
+			irq_domain_remove(edac->domain);
+			return rc;
+		}
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
 
@@ -2177,13 +2233,18 @@ static int altr_edac_a10_probe(struct platform_device *pdev)
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
+	} else if (edac->flag == SOCFPGA_AGILEX5) {
+		edac->db_irq = edac->agilex5_irqs[ALTR_AGILEX5_IRQ_GLOBAL_DBE];
+		irq_set_chained_handler_and_data(edac->db_irq,
+						 altr_edac_a10_irq_handler,
+						 edac);
 	}
 
 	for_each_child_of_node(pdev->dev.of_node, child) {
@@ -2209,6 +2270,8 @@ static const struct of_device_id altr_edac_a10_of_match[] = {
 	  .data = (void *)SOCFPGA_A10 },
 	{ .compatible = "altr,socfpga-s10-ecc-manager",
 	  .data = (void *)SOCFPGA_S10 },
+	{ .compatible = "altr,socfpga-agilex5-ecc-manager",
+	  .data = (void *)SOCFPGA_AGILEX5 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, altr_edac_a10_of_match);
diff --git a/drivers/edac/altera_edac.h b/drivers/edac/altera_edac.h
index 4a9da28fa96ba..b769cce6063cd 100644
--- a/drivers/edac/altera_edac.h
+++ b/drivers/edac/altera_edac.h
@@ -326,6 +326,27 @@ struct altr_sdram_mc_data {
 #define S10_DDR0_IRQ_MASK                 BIT(16)
 #define S10_DBE_IRQ_MASK                  0x3FFFE
 
+/************* Agilex5 Defines **************/
+/*
+ * The Agilex5 ECC manager exposes 7 named interrupts on the manager
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
@@ -401,6 +422,13 @@ struct altr_arria10_edac {
 	struct list_head	a10_ecc_devices;
 	struct notifier_block	panic_notifier;
 	unsigned long		flag;
+
+	/*
+	 * Agilex5 ECC manager supports up to 7 named interrupts. Entries
+	 * are indexed by the altr_agilex5_irq_idx enum and hold the virtual
+	 * IRQ number.
+	 */
+	u32			agilex5_irqs[ALTR_AGILEX5_NUM_IRQS];
 };
 
 #endif	/* #ifndef _ALTERA_EDAC_H */
-- 
2.42.0.411.g813d9a9188

