Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFB63B3C05;
	Wed, 30 Sep 2026 05:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790745317; cv=none; b=uuR3y4liva1Lo6GXHl/LlmC0DmjUWXq5L81Om88PXQKkCgHg6mT/Ysnrs2jUtbIs2ckQX30gIMFSDEs/EBVgaKQtWx678A4s4EwLrrLH6aHfZXeekNH6RC1u3ucZ/2fFrP55dq+bK4nQ6m/l3p6Oc+z1aXPZbEMAY9l3+UQ2Hgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790745317; c=relaxed/simple;
	bh=FhGqCgC1qcv7kHcNVhXGaiiu15ASlL/TX82CfVZ7NtU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=cbXyVW1T9t+Xs3w6zKrHd2RnejzqgIJhC5JHrWPogNzpv1gOxSuEQaCaEpKcmkqxFHvNn9sFep4QWtD48TGQtQ5+b7UliDXjrTBm9mc4yqOiCLcq8ncpW87OXYYrNu5zo26G6j/usbV/Eoju7YmmwT29GwOs4IahmqR/cFbPFNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 30 Sep
 2026 13:15:00 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 30 Sep 2026 13:15:00 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Wed, 30 Sep 2026 13:15:01 +0800
Subject: [PATCH v4 3/9] EDAC/aspeed: Clean up whitespace and include
 ordering
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260930-edac-v4-3-c2e526f3ed79@aspeedtech.com>
References: <20260930-edac-v4-0-c2e526f3ed79@aspeedtech.com>
In-Reply-To: <20260930-edac-v4-0-c2e526f3ed79@aspeedtech.com>
To: Stefan Schaeckeler <sschaeck@cisco.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-edac@vger.kernel.org>, Borislav Petkov <bp@suse.de>, Ryan Chen
	<ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790745299; l=4626;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=FhGqCgC1qcv7kHcNVhXGaiiu15ASlL/TX82CfVZ7NtU=;
 b=Zvr+kHcjG7woXBqcYLP/j2ul7EPBjCUbPtpcq3WtmxWAcrsM9r2jMsEjL7ZueNzb6OYSpZhx4
 yOJdyGb7+9EA0UuKqWeS90lzOKdCVi4JOCIVBgEhUY1mNbEZjsvosvl
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=

The driver separates functions and definition groups with two blank
lines where the kernel style uses one, its headers are not sorted, and it
includes linux/stop_machine.h without using it. Collapse the double blank
lines, drop the unused include and sort the rest alphabetically so the
following changes start from a consistent style.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 drivers/edac/aspeed_edac.c | 34 +++++++++-------------------------
 1 file changed, 9 insertions(+), 25 deletions(-)

diff --git a/drivers/edac/aspeed_edac.c b/drivers/edac/aspeed_edac.c
index e05ebed5c2f2..cd2a6fcca355 100644
--- a/drivers/edac/aspeed_edac.c
+++ b/drivers/edac/aspeed_edac.c
@@ -4,20 +4,17 @@
  */
 
 #include <linux/edac.h>
-#include <linux/module.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
-#include <linux/platform_device.h>
-#include <linux/stop_machine.h>
 #include <linux/io.h>
+#include <linux/module.h>
 #include <linux/of_address.h>
+#include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include "edac_module.h"
 
-
 #define DRV_NAME "aspeed-edac"
 
-
 #define ASPEED_MCR_PROT        0x00 /* protection key register */
 #define ASPEED_MCR_CONF        0x04 /* configuration register */
 #define ASPEED_MCR_INTR_CTRL   0x50 /* interrupt control/status register */
@@ -25,19 +22,16 @@
 #define ASPEED_MCR_ADDR_REC    0x5c /* address of last recoverable error */
 #define ASPEED_MCR_LAST        ASPEED_MCR_ADDR_REC
 
-
-#define ASPEED_MCR_PROT_PASSWD	            0xfc600309
-#define ASPEED_MCR_CONF_DRAM_TYPE               BIT(4)
-#define ASPEED_MCR_CONF_ECC                     BIT(7)
-#define ASPEED_MCR_INTR_CTRL_CLEAR             BIT(31)
-#define ASPEED_MCR_INTR_CTRL_CNT_REC   GENMASK(23, 16)
-#define ASPEED_MCR_INTR_CTRL_CNT_UNREC GENMASK(15, 12)
-#define ASPEED_MCR_INTR_CTRL_ENABLE  (BIT(0) | BIT(1))
-
+#define ASPEED_MCR_PROT_PASSWD          0xfc600309
+#define ASPEED_MCR_CONF_DRAM_TYPE       BIT(4)
+#define ASPEED_MCR_CONF_ECC             BIT(7)
+#define ASPEED_MCR_INTR_CTRL_CLEAR      BIT(31)
+#define ASPEED_MCR_INTR_CTRL_CNT_REC    GENMASK(23, 16)
+#define ASPEED_MCR_INTR_CTRL_CNT_UNREC  GENMASK(15, 12)
+#define ASPEED_MCR_INTR_CTRL_ENABLE     (BIT(0) | BIT(1))
 
 static struct regmap *aspeed_regmap;
 
-
 static int regmap_reg_write(void *context, unsigned int reg, unsigned int val)
 {
 	void __iomem *regs = (void __iomem *)context;
@@ -53,7 +47,6 @@ static int regmap_reg_write(void *context, unsigned int reg, unsigned int val)
 	return 0;
 }
 
-
 static int regmap_reg_read(void *context, unsigned int reg, unsigned int *val)
 {
 	void __iomem *regs = (void __iomem *)context;
@@ -76,7 +69,6 @@ static bool regmap_is_volatile(struct device *dev, unsigned int reg)
 	}
 }
 
-
 static const struct regmap_config aspeed_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
@@ -88,7 +80,6 @@ static const struct regmap_config aspeed_regmap_config = {
 	.fast_io = true,
 };
 
-
 static void count_rec(struct mem_ctl_info *mci, u8 rec_cnt, u32 rec_addr)
 {
 	struct csrow_info *csrow = mci->csrows[0];
@@ -120,7 +111,6 @@ static void count_rec(struct mem_ctl_info *mci, u8 rec_cnt, u32 rec_addr)
 			     0, 0, -1, "", "");
 }
 
-
 static void count_un_rec(struct mem_ctl_info *mci, u8 un_rec_cnt,
 			 u32 un_rec_addr)
 {
@@ -153,7 +143,6 @@ static void count_un_rec(struct mem_ctl_info *mci, u8 un_rec_cnt,
 	}
 }
 
-
 static irqreturn_t mcr_isr(int irq, void *arg)
 {
 	struct mem_ctl_info *mci = arg;
@@ -200,7 +189,6 @@ static irqreturn_t mcr_isr(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
-
 static int config_irq(void *ctx, struct platform_device *pdev)
 {
 	int irq;
@@ -225,7 +213,6 @@ static int config_irq(void *ctx, struct platform_device *pdev)
 	return 0;
 }
 
-
 static int init_csrows(struct mem_ctl_info *mci)
 {
 	struct csrow_info *csrow = mci->csrows[0];
@@ -274,7 +261,6 @@ static int init_csrows(struct mem_ctl_info *mci)
 	return 0;
 }
 
-
 static int aspeed_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -355,7 +341,6 @@ static int aspeed_probe(struct platform_device *pdev)
 	return rc;
 }
 
-
 static void aspeed_remove(struct platform_device *pdev)
 {
 	struct mem_ctl_info *mci;
@@ -375,7 +360,6 @@ static void aspeed_remove(struct platform_device *pdev)
 		edac_mc_free(mci);
 }
 
-
 static const struct of_device_id aspeed_of_match[] = {
 	{ .compatible = "aspeed,ast2400-sdram-edac" },
 	{ .compatible = "aspeed,ast2500-sdram-edac" },

-- 
2.34.1

