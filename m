Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794860941;
	b=ImCNlHJdQrE0RdRei4yRL4aKzRpVPksL8jLFNKItMI4KY+KXHlXX8Czx38nrCkR/0q69
	 HGEf8pX50iEfZa5/02EEWiAQlYZjonGQ2DEx4yy3frfk954gC7NBwgoNxQoAP0ISVoUe0
	 wPI0k63vi3elHBZYrrSv8xv7Cx7pD82E2EjOxRmJEloacwfKMjWImdoNpuhaVBjZg67En
	 FmfXJdF4wn/C55CqhpXKXnWbWzY8s+Mqj4FKLEh22ZYruBL/Eq+OzD+64XyaPq8wZjVbJ
	 S/sYUnHwTpBjY3LESzQdeQ+D4k5iwiuVP8nvs4SuopCndIIyu/eopJfTFYecxz81ISQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794860941;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=k13V6+vLg+jN5IWuy7SqRDSjBpMEZVsB7RmAAXNJ4eM=;
	b=z+n9qfkGjI2pBVnnLLR9Q73w8suQ7BPqjHoRvN4JnzCamqlb1chDEoK0xmy4y412lJR4
	 pdOzcTCgh6hb5M5LsFaBpVnNqLhnzxx0XJIdEcJeuSzv+FWiRJtUMV6lGXD5nuAwj/2c6
	 za103OdvVsQUjJy8VOwTxUVXPqDD80TqJDNWFKofc0XSKgYRH3lx98TIFcfd00oq3Rhmr
	 43K5K9GVJw7UOliBF19i6MzFEdrE5tGA9Ys2fyMiiyAlB1+WZSm+bcWrtlflBIfipDABL
	 vO6KkfEQ98rMQanIk5couLDqDg3iFlzL21GPCbBY1TOMkpmBk0Z95emWdyd3aykll4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D7RjcCOh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A70606A31C;
	Mon, 16 Nov 2026 20:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D7RjcCOh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BB9C1F000C4;
	Mon, 16 Nov 2026 20:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794860941;
	bh=k13V6+vLg+jN5IWuy7SqRDSjBpMEZVsB7RmAAXNJ4eM=;
	h=From:To:Cc:Subject:Date;
	b=D7RjcCOh2LCLqcAyF15ieNNl2OJqTxMeggtEGnqLNl7WygfiLfZwI7G5QqPJ3uNzD
	 D7R0Tyj9Khb4zbyj7Wzi5R1DP3BJdz+Eazj4zF5WoXMLKFGhnTclib7eFd/Mz7m5A8
	 wLe8Sis1DMf6kTmzU+zZxZzNX9SklN1mS3yjvoxpO06a6hjzhcATmdpor8wvl6z6xW
	 07bvwYEm+AwTzw8npOJQID/IJ532pCcGpssodvm8IldO0jwgKDzMBxw0USodLzrLmP
	 OPZ5z8wCQjYsaRPLgjkkRX1lAOHhGc0/Dmh1hLQlbhEKrB8SZ6BIGUTKoJI3EEa4dG
	 WPJH62RBpwPbg==
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
Subject: [PATCHv4 1/4] EDAC/altera: use flag to differentiate 64-bit platforms
Date: Mon, 16 Nov 2026 14:28:51 -0600
Message-ID: <20261116202854.3087673-1-dinguyen@kernel.org>
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
v4: no changes
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

