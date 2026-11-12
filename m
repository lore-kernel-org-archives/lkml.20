Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794520432;
	b=j90s2NVaHIwEmJNS/ULrm+G0DR3uUHjL5yQxCvcg1udrPwFcOMu3BE8VmwPI3mMpERpy
	 MObZj50oASnOeQ5I4jjUDBNTC+bkbWWvNaCrIqS+MmHSGch930HwNnPq+sh4ijZQpp6py
	 3drxqqbO79TGctpP8wiGlvFFxvWKPttqCHtcw2254hLa4Aq1h411OGTHSoVgRqR3Y56lS
	 gKsAEL0sBb79x13jAQ/lQFH/7Ae8kUZN4kGrsSM2Sbv3x2tsU23eInXTLAWDw7v9vIaGn
	 nuVsRdw7dFJWz+escd29MuBd3atzo8UZY9+hCbKmZ5Y1i8/zqitfNha6BLfkmPQfXBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794520432;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KIbzg7d2+UtRUYNVIhRwn0m7ejVizCAxgM+sH7uQvyY=;
	b=l0A//a5wufXtwYj13iquRzw+/Xis0j7cxcI8aPY1CpTnBVIYUH8EJq2fDZLrbBK79Iu9
	 z6IUqzCVz9cbTyKo2lJGqOrFdVUQl7JeyYm2qpLjo9VH6b2Fs4EKgc/hcBnjrLg9msYq3
	 8HvVoWH0dbeW+5KGj1sUBvfoY8B2fslVakR8R1J/EiSb7FAjhQBRQIYnSNsRZLWGm1JC/
	 lwoW4HKH6ZKimYDax2Dz8GtinYcTZySAAeD5HwbuqWSLt1AD37uDDkYN8G8iAgofr3BAU
	 ws6x4TykTb5S2SYciG+THzDih3ORF0gxrT3T8qPqrMGKjgkpb3K2mL6ctbUF0U+eKEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TftBanSZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F26F606A31C;
	Thu, 12 Nov 2026 21:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TftBanSZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05FB91F000C4;
	Thu, 12 Nov 2026 21:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794520431;
	bh=KIbzg7d2+UtRUYNVIhRwn0m7ejVizCAxgM+sH7uQvyY=;
	h=From:To:Cc:Subject:Date;
	b=TftBanSZdsrTHdKddcn0V0DWOqqKBqE+4jWC5w+dKJWGlwFM5JARZmNjWDvpdi1PR
	 WCr9mLh7D0ub90439VaLJIJD33sebpvVWYfREhKYldNAgDPqAeryVw72R+BLWpL/O3
	 m1CfPiAaaXH3QMQEnRWVA6JZVr4S9jcTkP9d4oXRRgERD8RDd5raCOVWrOMRucyXw5
	 /By/X8b9Am/4de5gvyekCqqkBShBz59hVTvktf+HwjetO1ilrGvs5ctBSOrtzhCieT
	 a8HrOTJWew4sf6UWvjB64y2im26WFK1wr154/0oUcQT9vnguC5eDFr8gxsOhCR9V2L
	 VvGERFqk01W+Q==
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
Subject: [PATCHv3 1/4] EDAC/altera: use flag to differentiate 64-bit platforms
Date: Thu, 12 Nov 2026 15:53:39 -0600
Message-ID: <20261112215342.2476801-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
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

In commit (d4486fc3098e "EDAC/altera: Use ECC manager compatible to select
A10/S10 IRQ layout"), it added a way to only differentiate Stratix10 from
a 32-bit platform. In preparation to add support for Agilex5, it needs a
way to make a further differentiation.

Make use of the driver match data to hold a flag for different platforms,
specifically Stratix10 and Agilex5.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
v3: no changes
v2: use enum for altr_platform_idx
    use SOCFPGA_A10 for A10 platforms
---
 drivers/edac/altera_edac.c | 20 +++++++++++---------
 drivers/edac/altera_edac.h |  8 +++++++-
 2 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index bb95dab847b3c..78f4a1b0fc64a 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -1489,7 +1489,7 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
 	int edac_idx, rc;
 	struct device_node *np;
 	const struct edac_device_prv_data *prv = &a10_sdmmceccb_data;
-	bool is_s10 = device->edac->is_s10;
+	unsigned long flag = (unsigned long)device->edac->flag;
 
 	rc = altr_check_ecc_deps(device);
 	if (rc)
@@ -1538,7 +1538,7 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
 	 */
 
 	/* Using compatibles to determine the IRQ Index */
-	if (is_s10)
+	if (flag == SOCFPGA_S10)
 		altdev->sb_irq = irq_of_parse_and_map(np, 1);
 	else
 		altdev->sb_irq = irq_of_parse_and_map(np, 2);
@@ -1556,7 +1556,7 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
 		goto err_release_group_1;
 	}
 
-	if (is_s10) {
+	if (flag == SOCFPGA_S10) {
 		/* Use IRQ to determine SError origin instead of assigning IRQ */
 		rc = of_property_read_u32_index(np, "interrupts", 1, &altdev->db_irq);
 		if (rc) {
@@ -1967,7 +1967,7 @@ static int altr_edac_a10_device_add(struct altr_arria10_edac *edac,
 		goto err_release_group1;
 	}
 
-	if (edac->is_s10) {
+	if (edac->flag == SOCFPGA_S10) {
 		/* Use IRQ to determine SError origin instead of assigning IRQ */
 		rc = of_property_read_u32_index(np, "interrupts", 0, &altdev->db_irq);
 		if (rc) {
@@ -2121,7 +2121,7 @@ static int altr_edac_a10_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, edac);
 	INIT_LIST_HEAD(&edac->a10_ecc_devices);
 
-	edac->is_s10 = !!device_get_match_data(&pdev->dev);
+	edac->flag = (unsigned long)device_get_match_data(&pdev->dev);
 
 	edac->ecc_mgr_map =
 		altr_sysmgr_regmap_lookup_by_phandle(pdev->dev.of_node,
@@ -2154,8 +2154,8 @@ static int altr_edac_a10_probe(struct platform_device *pdev)
 	irq_set_chained_handler_and_data(edac->sb_irq,
 					 altr_edac_a10_irq_handler,
 					 edac);
-	if (edac->is_s10)
-	{
+
+	if (edac->flag == SOCFPGA_S10) {
 		int dberror, err_addr;
 
 		edac->panic_notifier.notifier_call = s10_edac_dberr_handler;
@@ -2205,8 +2205,10 @@ static int altr_edac_a10_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id altr_edac_a10_of_match[] = {
-	{ .compatible = "altr,socfpga-a10-ecc-manager" },
-	{ .compatible = "altr,socfpga-s10-ecc-manager", .data = (void *)1 },
+	{ .compatible = "altr,socfpga-a10-ecc-manager",
+	  .data = (void *)SOCFPGA_A10 },
+	{ .compatible = "altr,socfpga-s10-ecc-manager",
+	  .data = (void *)SOCFPGA_S10 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, altr_edac_a10_of_match);
diff --git a/drivers/edac/altera_edac.h b/drivers/edac/altera_edac.h
index 9387056fd65e3..4a9da28fa96ba 100644
--- a/drivers/edac/altera_edac.h
+++ b/drivers/edac/altera_edac.h
@@ -351,6 +351,12 @@ struct altr_sdram_mc_data {
 #define ECC_READ_EOVR                     0x2
 #define ECC_READ_EDOVR                    0x3
 
+enum altr_platform_idx {
+	SOCFPGA_A10,
+	SOCFPGA_S10,
+	SOCFPGA_AGILEX5
+};
+
 struct altr_edac_device_dev;
 
 struct edac_device_prv_data {
@@ -394,7 +400,7 @@ struct altr_arria10_edac {
 	struct irq_chip		irq_chip;
 	struct list_head	a10_ecc_devices;
 	struct notifier_block	panic_notifier;
-	bool is_s10;
+	unsigned long		flag;
 };
 
 #endif	/* #ifndef _ALTERA_EDAC_H */
-- 
2.42.0.411.g813d9a9188

