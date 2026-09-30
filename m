Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83343AC0C0;
	Wed, 30 Sep 2026 05:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790745315; cv=none; b=Y88OagvkfUNVuthfkZWKUyc8MA3rhMnrQ4n1TUw47vo2cteeBQ04bc5pLYaXtwzYrsEcMpEl/wD7Nhpnr1h2U2vuqa25q9iIFL7qZPCUD74XToPR7DvWJq/uO2LY4dlCS5cWipK1g01RMowvbLuWX5oAcDvaqc/lnLvpc5oaN8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790745315; c=relaxed/simple;
	bh=xfnhxHJqIcWx+yqcMApIiBOpfhKo5Hdnp9j5TMIgdEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=W5UGnltiY6gOw29+bplbkNTGLRJosVdRkGShigqymP62RX9SSRXVWjcsndFlZSw/cff+J0wH5ZSs77bqYyogNNi9IgG6OhEa53q8UzJMihJhbuzAu5G6LNgTuhXfWdB8zs1TNn/nU2EnVMT2v9CLjyaizsGKgn9rlRLhIEQNQVY=
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
Date: Wed, 30 Sep 2026 13:15:00 +0800
Subject: [PATCH v4 2/9] EDAC/aspeed: Free the interrupt before the
 mem_ctl_info on remove
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260930-edac-v4-2-c2e526f3ed79@aspeedtech.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790745299; l=1381;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=xfnhxHJqIcWx+yqcMApIiBOpfhKo5Hdnp9j5TMIgdEc=;
 b=FdNW3hlvPud1TirgbEu7Fmt84CzEsuZiJGTUUd+Kpe0XIbfaQBlVmetPwC3sIqQn0SmRRX4k0
 MwwHFA0Xe+NDmLX0ePDz4BBHe3LuzNs93TyFtMDgqYTYUixhtN3kfC/
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=

The ECC interrupt is devm-managed, so it is only released after .remove()
has returned, and masking the controller does not wait for a handler
already running on another CPU. edac_mc_free() can therefore free the
mem_ctl_info the handler uses as its context while it is still running.

Fix the ordering and synchronise by freeing the interrupt prior to
releasing related memory.

Fixes: 9b7e6242ee4e ("EDAC, aspeed: Add an Aspeed AST2500 EDAC driver")
Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>

---
Changes in v4:
- Drop the Cc: stable tag.

Changes in v2:
- New patch.
---
 drivers/edac/aspeed_edac.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/edac/aspeed_edac.c b/drivers/edac/aspeed_edac.c
index 83d60414f89a..e05ebed5c2f2 100644
--- a/drivers/edac/aspeed_edac.c
+++ b/drivers/edac/aspeed_edac.c
@@ -359,11 +359,16 @@ static int aspeed_probe(struct platform_device *pdev)
 static void aspeed_remove(struct platform_device *pdev)
 {
 	struct mem_ctl_info *mci;
+	int irq;
 
 	/* disable interrupts */
 	regmap_update_bits(aspeed_regmap, ASPEED_MCR_INTR_CTRL,
 			   ASPEED_MCR_INTR_CTRL_ENABLE, 0);
 
+	irq = platform_get_irq(pdev, 0);
+	WARN_ON(irq < 0);
+	devm_free_irq(&pdev->dev, irq, platform_get_drvdata(pdev));
+
 	/* free resources */
 	mci = edac_mc_del_mc(&pdev->dev);
 	if (mci)

-- 
2.34.1

