Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7243F3283;
	Wed,  7 Oct 2026 06:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791353623; cv=none; b=OcmGm0uHj7uYGCYRK3FnsZG+9XA9XkLegcPZX+oAa1GMfSQq3ua/x7qaP98Fxs8S/4Q7iV8z3b4mW8B6BnSklQKB1LH8uRkJd2K9j6caUskuF0knFieMPmJ/M8EyPilYxzFNAKTEzyDnkXv+3kZ9sFbpSY3sIP5Y9jYop2YTDCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791353623; c=relaxed/simple;
	bh=HAabpmX2c//xzySbY96a1LqNR0wWgYBnoW1KUfWu6LE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=hB6N3A8J6MzRTbPtGj1aeLuS3L3mJHCOsYoQJclB19PhEATmjcD5H/3gjBNr/mGPYLGD6Dd8YyDtwwB7WR5C7EX4yiuUVmvXoNHPSx65qF9EfbAwIrLZ27AUHiOo6cXNGFSMhT262k4n4N67NP7j0EHvsRp/FibheE4TQImwzIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 7 Oct
 2026 14:13:19 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 7 Oct 2026 14:13:19 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Wed, 7 Oct 2026 14:13:19 +0800
Subject: [PATCH v5 2/9] EDAC/aspeed: Free the interrupt before the
 mem_ctl_info on remove
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261007-edac-v5-2-5c31fc5df4cf@aspeedtech.com>
References: <20261007-edac-v5-0-5c31fc5df4cf@aspeedtech.com>
In-Reply-To: <20261007-edac-v5-0-5c31fc5df4cf@aspeedtech.com>
To: Stefan Schaeckeler <sschaeck@cisco.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-edac@vger.kernel.org>, Borislav Petkov <bp@suse.de>, Ryan Chen
	<ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791353599; l=2176;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=HAabpmX2c//xzySbY96a1LqNR0wWgYBnoW1KUfWu6LE=;
 b=1NyCPAkhY78g1xuIJge7tW+Ruluz5gE63m7zzEcYSHL3a5vdv8o6xe757IGZlvwD70KD3K9kP
 FA9zfC30FxqB/pfflP6akobu/coHbbTw3sNsaf7qkcuWpY6wpp160vf
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=

The ECC interrupt is devm-managed, so it is only released after .remove()
has returned, and masking the controller does not wait for a handler
already running on another CPU. edac_mc_free() can therefore free the
mem_ctl_info the handler uses as its context while it is still running.

Register the handler with request_irq() and free it before the memory
it uses. aspeed_probe() returns as soon as config_irq() succeeds, so
devres has no error path left to unwind.

Fixes: 9b7e6242ee4e ("EDAC, aspeed: Add an Aspeed AST2500 EDAC driver")
Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>

---
Changes in v5:
- Use request_irq()/free_irq() rather than devm_request_irq() followed
  by an explicit free, and keep the interrupt number in a file-scope
  variable so aspeed_remove() does not have to call platform_get_irq()
  a second time.

Changes in v4:
- Drop the Cc: stable tag.

Changes in v2:
- New patch.
---
 drivers/edac/aspeed_edac.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/aspeed_edac.c b/drivers/edac/aspeed_edac.c
index 83d60414f89a..cb233a33d29a 100644
--- a/drivers/edac/aspeed_edac.c
+++ b/drivers/edac/aspeed_edac.c
@@ -36,6 +36,7 @@
 
 
 static struct regmap *aspeed_regmap;
+static int aspeed_irq;
 
 
 static int regmap_reg_write(void *context, unsigned int reg, unsigned int val)
@@ -212,11 +213,12 @@ static int config_irq(void *ctx, struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	rc = devm_request_irq(&pdev->dev, irq, mcr_isr, IRQF_TRIGGER_HIGH,
-			      DRV_NAME, ctx);
+	rc = request_irq(irq, mcr_isr, IRQF_TRIGGER_HIGH, DRV_NAME, ctx);
 	if (rc)
 		return rc;
 
+	aspeed_irq = irq;
+
 	/* enable interrupts */
 	regmap_update_bits(aspeed_regmap, ASPEED_MCR_INTR_CTRL,
 			   ASPEED_MCR_INTR_CTRL_ENABLE,
@@ -364,6 +366,8 @@ static void aspeed_remove(struct platform_device *pdev)
 	regmap_update_bits(aspeed_regmap, ASPEED_MCR_INTR_CTRL,
 			   ASPEED_MCR_INTR_CTRL_ENABLE, 0);
 
+	free_irq(aspeed_irq, platform_get_drvdata(pdev));
+
 	/* free resources */
 	mci = edac_mc_del_mc(&pdev->dev);
 	if (mci)

-- 
2.34.1

