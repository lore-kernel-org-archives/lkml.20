Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.155.198.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792870627;
	b=ZS5n3WTJYOGNxWywa2oBwbEB19cdFOQBk9XCU/QItUrP+ZSpcuYyuTxrCU9n176Vfs5H
	 5XqPijTuf2pSiMID/qbHL1EomoJloFWkddL//cXpUfnH8Aow8WpOc7dDoKNoLJGquH4YT
	 czJOSSjYim3a4SnH/Nz1B5aWXO0LQPSXbquX88DZa9zfOZayf3x5226o8iUBzNQ7noRJ4
	 AqvXikw+L+cx9jjCK5tB2Ofr+/HVbsG4gWH+M4tiI4/HYwZfHh4agJUl2hzNm3XUZsWfS
	 Qx8oEQk1kwWEVzJLvTkPdc7nK2oNVArgSSF4KMOmPcyEQvm8LYOrmN2d5yphZVVMYBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792870627;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=rtWqW8qLJDrn7u8Th5PwOFI+Lm3egNVam53bNpAmvnc=;
	b=cL7irPTkn+t5HlX2dmPIiDrRuDoAI1XClD6oDmLXaE/xVFaxVxBiczcAD0ss1qwFdyOw
	 Oj8+qRms6ZvlMasccdO4zIaC3tcOtr5ow/vhonEWdjZajYoe2uIDfBXsCIgquGtvkl9y1
	 W9oHhQ6JNYYk6ufp/xF8THCTIrskiiDpmLszNfO760oZ7GGmsW6ZkknlMKIAEhTRCxM0K
	 Yys0DXbSL9RvFzy4Oy06DSc0VAzIyDSo4EGQ2DP2a+i/YIGQVYo0Qq0osYmWpMI18fKlL
	 4PeksTb7P2e6qras5h9nbXqycFIxCcVvPHGfvBEedhh4FpaaFE5GZUyGPuoc0hrKtQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=O3vz+y99;
	arc=none smtp.remote-ip=35.155.198.111
Received: from pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.155.198.111])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7173606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:37:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7173606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=O3vz+y99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1792870626; x=1824406626;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rtWqW8qLJDrn7u8Th5PwOFI+Lm3egNVam53bNpAmvnc=;
  b=O3vz+y99MxtxX3iAxH2yyMUyAWy+NGhkVjudA+HF1R62PGV9ceMuqZsD
   r6Yww5cxvZBNYh2Euipe8UmjJtGnYG9ze7Wz5x/bQJl0HbCaatUPT41dO
   4aaxTxj0Rwo66VWVUFCQRppty7rwSyDh6KK4OTi89nVgyW7sEUjUOVDhZ
   bEQTkqsTEdo68SDIoNgDTOMQsZjt4XzP9dfisQUhAMwhrP+jhC3HCcHOX
   qS6DrIgCSKJpbzZRB9rkJDDc7YmFQxTWu88VddIJTMigj60F4xKOHU8HM
   Q42JtnBtm7Qc1NRW/Zeat7f+3uHmXa57+F1ZuVe+C7AyCjKakIj8hobzk
   A==;
X-CSE-ConnectionGUID: aRo9yv+cThmilqjtYus8aQ==
X-CSE-MsgGUID: 2UHqYdcDT7uaublMm8yJ2g==
X-IronPort-AV: E=Sophos;i="6.27,176,1787011200"; 
   d="scan'208";a="32048984"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 19:37:04 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:28643]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.165:2525] with esmtp (Farcaster)
 id bbdd5bed-8aa9-4d5a-9945-5dc26d78c48a; Sat, 24 Oct 2026 19:37:04 +0000 (UTC)
X-Farcaster-Flow-ID: bbdd5bed-8aa9-4d5a-9945-5dc26d78c48a
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Sat, 24 Oct 2026 19:37:03 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53; Sat, 24 Oct 2026
 19:37:02 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Antoine Tenart <atenart@kernel.org>
CC: Radu Rendec <radu@rendec.net>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Eliav Farber <farbere@amazon.com>
Subject: [PATCH v2 3/5] irqchip/alpine-msi: Add missing space after comma in GENMASK_ULL
Date: Sat, 24 Oct 2026 19:36:18 +0000
Message-ID: <20261024193620.39999-4-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261024193620.39999-1-farbere@amazon.com>
References: <20261024193620.39999-1-farbere@amazon.com>
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
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC003.ant.amazon.com (10.13.139.252) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Fix the coding-style issue reported by checkpatch:

  ERROR: space required after that ',' (ctx:VxV)

No functional change.

Signed-off-by: Eliav Farber <farbere@amazon.com>
Reviewed-by: Radu Rendec <radu@rendec.net>
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

