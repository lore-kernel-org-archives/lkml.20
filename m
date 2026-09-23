Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.77.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1A63C76BB
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.77.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152647; cv=none; b=nHVbc1zzyxTuTLYzwM98jAXUY5JAnYuVeatjXXRPvgGveF1gp88DTj7MDf2jmpsccnLI7okuyzYmlpCNOhVtH8Gd9R+NllswN0VsWm9o+Y5z0laABonofTOtMel9DEJR68Jmo4FtxktNamGbyM1/c7TneKTn+r0OuQ7ZaYpmcsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152647; c=relaxed/simple;
	bh=1w9qpnXLMpYjtsk4QT5qEqVCc/96tJIoet9vMslr6Wk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fgkORwHMRo9S1HRwRVVQXfnQEXRzKuHuwMOcxnYoBdO/nXM5Ylp/SgUOHdqDeb7zV7vWAEle9ZeagdgBzMUNVCl4Jhvh56vI5NJwuAZjH3iVO9qK82XdxauPp7uJChZKhVsXCxpjeYkXJwCZc26RdZBJ7ZyAvt5JsctTiE6b9zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=IbT507Ta; arc=none smtp.client-ip=44.246.77.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="IbT507Ta"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790152640; x=1821688640;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2/lJdiP4MMrsMxVhZojvsLz0AQ80OWJfwqihWe33qm8=;
  b=IbT507TaZUWKFnDo3QwPgA9c/E/K3hmahuMwOEonIn1Xy45Sn5kRNY2/
   82z4bBlSEotl+8gBr6n8ISox26WL2MB5R35VljgLloW0UyeHGYamOzp9M
   RiM/XHQsfCOlDcla9aqf21D0LsGKdlaIRsppw/mNut0f/iUoLacXAZ2fP
   Ggzn9GDTQAACWqqw9d3pwDY+5ahIb1M2x5PY87Otevmr89e70yjksKTH9
   UFZl+fOK4jWBPepUSvr0CjCGAhrPJkht47c2Gu7KXmV3G1BlblksqoQna
   cnu/vpdKAw9oZzIeLz85gFsqcVDlVB0IwySIZc86Rf33FWW4fPHq/463Q
   Q==;
X-CSE-ConnectionGUID: dq4XxM7BSa6cNOOLkhtlgA==
X-CSE-MsgGUID: pKw+rOEDTnqv6+PQx+yiJQ==
X-IronPort-AV: E=Sophos;i="6.27,118,1787011200"; 
   d="scan'208";a="29415376"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 08:37:15 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:4792]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.60.208:2525] with esmtp (Farcaster)
 id bc26085e-0f7a-495a-b7b1-1f149d6bacd0; Wed, 23 Sep 2026 08:37:14 +0000 (UTC)
X-Farcaster-Flow-ID: bc26085e-0f7a-495a-b7b1-1f149d6bacd0
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Wed, 23 Sep 2026 08:37:14 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Wed, 23 Sep 2026
 08:37:13 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Antoine Tenart <atenart@kernel.org>
CC: Radu Rendec <radu@rendec.net>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Eliav Farber <farbere@amazon.com>
Subject: [PATCH 3/4] irqchip/alpine-msi: Add missing space after comma in GENMASK_ULL
Date: Wed, 23 Sep 2026 08:37:02 +0000
Message-ID: <20260923083703.38974-4-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260923083703.38974-1-farbere@amazon.com>
References: <20260923083703.38974-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D033UWA004.ant.amazon.com (10.13.139.85) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Fix the coding-style issue reported by checkpatch:

  ERROR: space required after that ',' (ctx:VxV)

No functional change.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
 drivers/irqchip/irq-alpine-msi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpine-msi.c
index 20f1f7f7612b..8155f63cfd29 100644
--- a/drivers/irqchip/irq-alpine-msi.c
+++ b/drivers/irqchip/irq-alpine-msi.c
@@ -210,7 +210,7 @@ static int alpine_msix_init(struct device_node *node, struct device_node *parent
 	 * To select the primary GIC as the target GIC, bits [18:17] must be set
 	 * to 0x0. In this case, bit 16 (SPI_TARGET_CLUSTER0) must be set.
 	 */
-	priv->addr = res.start & GENMASK_ULL(63,20);
+	priv->addr = res.start & GENMASK_ULL(63, 20);
 	priv->addr |= ALPINE_MSIX_SPI_TARGET_CLUSTER0;
 
 	if (of_property_read_u32(node, "al,msi-base-spi", &priv->spi_first)) {
-- 
2.47.3

