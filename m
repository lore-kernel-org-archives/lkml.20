Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794241539;
	b=WxHoWVT5mz0IClC/tKEEnRwirjO8RHUar0/gCiYGquKcWKMQzJIS0/bQSJ5iUTunlKHa
	 y+f0f6IspszCpkHZ7wTxHMcGyEGoOveHtideLbOgOUQA7zPm/l37B4cFR9kQ/qZnidt4x
	 R3hRWM2Y4NxTJAPCQ27B3QA9oFXYYiOVENNd1O2450BJEyeQP00M8MnngzKOOzeVw3QIH
	 /jtt12qfOqUe/C1C9pOx/O2qu9dJLkt70qtTx65eelSPg82o9mmr42NfM6w1R6mU2xs/W
	 1y0cYMxH0yOEAw8qfaojUwC9EJLMxb92Fni5AYRRIVhODcrRWjvwsOVVqYNfKfGICdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794241539;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XtEeRqXHLEPOGyZQwuz6BRqICuFRktNZmTfdl1shQQ8=;
	b=CNWO404L+NTcQrXOgKlylXzDbwmVVAw88mWPu+bXDGpUKEre3DjXvwVmLBlilds28hHt
	 Vt1vXsL6G+2LkV2IQXbljiZMDQh+4GEzXX+sqUzfa8JuzdXqlFZmNnitIDAB1OKp/ubAq
	 sI3qJ8qHC8ilxHPjvdzusPffB1BK8jRWB9PSLlFMi6umJqxX6jaiDww9p7ug3fVKU1HLP
	 /nMqYSWMukr2GR2w5Iu+lhe2dVB6dELvZz/3vejaK15Kpva16cZLkyWtfh3vlx7F3xc9I
	 E2KfPAHEcXyBdSwfPokb1a2+AIbiueHJ1cq/trqeRfQtzwoxBfNgUbrIRgrnEV9r2+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EMHymsHk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E739F606A31C;
	Mon,  9 Nov 2026 16:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EMHymsHk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 813211F0089F;
	Mon,  9 Nov 2026 16:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794241538;
	bh=XtEeRqXHLEPOGyZQwuz6BRqICuFRktNZmTfdl1shQQ8=;
	h=From:To:Cc:Subject:Date;
	b=EMHymsHk0q6qqqTnET9bxIHzHGIS9GYTRiAe0dgoLyYvS0ZC/m+fV3BTwXo9SGddA
	 RDPOFXkABzc69NHhFUlOJjDjQAQGAuea73/ebh43n8I92NpYW9SxE3pMRkGKk2J8kj
	 lLi95zS991DDpLJcR0YTORNSBuhGvDaahefll+Qru5jojyXp2eiduGplVAFK/5Alsr
	 PxKDeU8+5o08Pr+Yi5vbamgGv0QPFDE/bSDhIGiMbgFOR1k4DqRV7ChNllxJKe1U56
	 NvWfSHioQH1OVyNWMZdCXmE83EgHZVqOsYGVxa8KYFKbkmnV5D/Okb6VSu+7BPEMWM
	 m7dMMzQsR/4Ag==
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
Subject: [PATCHv2 1/4] EDAC/altera: use flag to differentiate 64-bit platforms
Date: Mon,  9 Nov 2026 10:25:20 -0600
Message-ID: <20261109162523.1698129-1-dinguyen@kernel.org>
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

