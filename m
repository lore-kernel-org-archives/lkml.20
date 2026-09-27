Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.77.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A53380FCA;
	Sun, 27 Sep 2026 08:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.77.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790496418; cv=none; b=Z2moKdm+KfVKStf3o9KBXyr80WhiquiKo5idvG1Qx65dFNGAGzuxTBNbG8SHoewQQk7dKvaImSSxcXH5P/ANjYkbp7nn9E2E8dNUkVhCUOg2QpA1myjSnozl6DC6WXJQq+d/PuN/v93pqTC6CWFKHSDlQ4jYjBkaKdw+1fOwmZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790496418; c=relaxed/simple;
	bh=qggmK6Wb3pZoZzDnooRZpBG1+fFMRIx1HcaTVNo6rzA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hELPBuAl9AvSGxURLboePrxOlOWgsJ2vwzpMlw2RE2lWzzngRX7HNbp0JreWE7yafCHZFcUEONBcuxn/JlOleCsa3NgCuEnditVMXV4RZxb9GLFmLvwWbEPECM50TCir1SD4Y/j08kY2omIk1EucQTFzkjPrkiNnOJA4t4Ci9PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=B5jLCiXF; arc=none smtp.client-ip=44.246.77.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="B5jLCiXF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790496417; x=1822032417;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eaBJMSYeY006cxV64+4x73P5ptQuIFAPfg06m+8AKcI=;
  b=B5jLCiXFMO6QwJy+6bIjQT6kcIrUIZZZ95K8ay4RPTC9G3fCpvcUDpmN
   pnNkr1NNZtbJvkXq1mmDtvF08vmOMKQmaoH7iBgJUdyZxDA0e7azjCQ/G
   QiXTR0vXMfLdlbNzYVv5uPtFeRjIaVcAef130kFx6gZN7R9meIEFLvv9q
   vBAzzXT4cWoygxqe/5X0+MIHBef5nLZuQrJVhx3R+wPTGvhFcVIrCT5Wh
   FMtaKeqCF3+7YWwBfWQxO2SJzvOxB2qPlxAcgsYamTAMTpKlhdPni695O
   4RAP+bSdyl5wcx63MC7oDgcvGfi/LkXJbBD85cY2sU7eS4oub+tpbP/OL
   g==;
X-CSE-ConnectionGUID: ULYyfIzKTKut9WoTdSyvMA==
X-CSE-MsgGUID: 03Qo8Uj5Q6WxKj4LbKnkHQ==
X-IronPort-AV: E=Sophos;i="6.27,126,1787011200"; 
   d="scan'208";a="29745383"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 08:06:50 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:13039]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.13.104:2525] with esmtp (Farcaster)
 id 499000f0-ccbf-4ff5-ab64-7b11491f9142; Sun, 27 Sep 2026 08:06:50 +0000 (UTC)
X-Farcaster-Flow-ID: 499000f0-ccbf-4ff5-ab64-7b11491f9142
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Sun, 27 Sep 2026 08:06:50 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Sun, 27 Sep 2026
 08:06:48 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Talel Shenhar <talel@amazon.com>
CC: Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Eliav
 Farber" <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 4/8] irqchip/al-fic: switch to shared parent interrupt
Date: Sun, 27 Sep 2026 08:06:33 +0000
Message-ID: <20260927080637.27285-5-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927080637.27285-1-farbere@amazon.com>
References: <20260927080637.27285-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D038UWC003.ant.amazon.com (10.13.139.209) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Until now the driver requested its parent interrupt using the chained IRQ
API (irq_set_chained_handler_and_data()), which only works when each
parent interrupt is wired to a single FIC instance.

A FIC controller is built from groups, each described by its own DT node,
and the groups of one controller share that controller's output line
toward the parent. So a real devicetree has several FIC nodes on one
parent GIC SPI, and a chained handler can only be installed once per
parent. Cascading compounds this: an aggregating group collects several
peripherals' outputs onto the line above it.

To support that, request the parent interrupt as a shared interrupt
(IRQF_SHARED) instead of installing a chained handler. The handler now has
the standard irqreturn_t prototype and reports whether it handled any
child interrupt, so the shared-IRQ core can dispatch to the correct
instance. IRQF_NO_THREAD is set because the handler only demultiplexes to
the child domain and must not be forced-threaded; all instances sharing a
parent line agree on this flag, as the shared-IRQ core requires.

generic_handle_domain_irq() is retained for dispatch; its return value is
used to determine whether a pending child was actually handled so the
handler can return IRQ_HANDLED/IRQ_NONE correctly.

request_irq() can fail, unlike irq_set_chained_handler_and_data(), so add
an error path for it. It calls irq_domain_remove_generic_chips() before
irq_domain_remove(), because irq_domain_remove() frees the generic chips
only when the domain carries IRQ_DOMAIN_FLAG_DESTROY_GC.

Co-developed-by: Talel Shenhar <talel@amazon.com>
Signed-off-by: Talel Shenhar <talel@amazon.com>
Signed-off-by: Eliav Farber <farbere@amazon.com>
---
v2:
 - Fix the request_irq() error path: v1 called irq_free_generic_chip(gc),
   which is kfree(gc) on an interior pointer into the single allocation
   made by irq_domain_alloc_generic_chips() - an invalid free reachable
   when request_irq() fails at probe. Replace it with
   irq_domain_remove_generic_chips() before irq_domain_remove(), and add a
   commit-message paragraph explaining the teardown ordering.
 - Add Co-developed-by/Signed-off-by: Talel Shenhar.
 - Reworded to state the hardware reason for the shared parent (the groups
   of one controller share that controller's output line).

 drivers/irqchip/irq-al-fic.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
index c7cc2631caf8..091a06abc0bb 100644
--- a/drivers/irqchip/irq-al-fic.c
+++ b/drivers/irqchip/irq-al-fic.c
@@ -4,9 +4,9 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irqchip.h>
-#include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -95,24 +95,24 @@ static int al_fic_irq_set_type(struct irq_data *data, unsigned int flow_type)
 	return 0;
 }
 
-static void al_fic_irq_handler(struct irq_desc *desc)
+static irqreturn_t al_fic_irq_handler(int irq, void *data)
 {
-	struct al_fic *fic = irq_desc_get_handler_data(desc);
+	struct al_fic *fic = data;
 	struct irq_domain *domain = fic->domain;
-	struct irq_chip *irqchip = irq_desc_get_chip(desc);
 	struct irq_chip_generic *gc = irq_get_domain_generic_chip(domain, 0);
+	irqreturn_t ret = IRQ_NONE;
 	unsigned long pending;
 	u32 hwirq;
 
-	chained_irq_enter(irqchip, desc);
-
 	pending = readl_relaxed(fic->base + AL_FIC_CAUSE);
 	pending &= ~gc->mask_cache;
 
-	for_each_set_bit(hwirq, &pending, NR_FIC_IRQS)
-		generic_handle_domain_irq(domain, hwirq);
+	for_each_set_bit(hwirq, &pending, NR_FIC_IRQS) {
+		if (!generic_handle_domain_irq(domain, hwirq))
+			ret = IRQ_HANDLED;
+	}
 
-	chained_irq_exit(irqchip, desc);
+	return ret;
 }
 
 static int al_fic_irq_retrigger(struct irq_data *data)
@@ -162,11 +162,18 @@ static int al_fic_register(struct device_node *node,
 	gc->chip_types->chip.flags = IRQCHIP_SKIP_SET_WAKE;
 	gc->private = fic;
 
-	irq_set_chained_handler_and_data(fic->parent_irq,
-					 al_fic_irq_handler,
-					 fic);
+	ret = request_irq(fic->parent_irq, al_fic_irq_handler,
+			  IRQF_NO_THREAD | IRQF_SHARED, fic->node->full_name,
+			  fic);
+	if (ret) {
+		pr_err("fail to request irq (%d)\n", ret);
+		goto err_remove_generic_chips;
+	}
+
 	return 0;
 
+err_remove_generic_chips:
+	irq_domain_remove_generic_chips(fic->domain);
 err_domain_remove:
 	irq_domain_remove(fic->domain);
 
-- 
2.47.3

