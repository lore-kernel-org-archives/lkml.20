Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.83.148.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4E942050;
	Sun, 11 Oct 2026 05:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.83.148.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791695141; cv=none; b=WIB+RcpL80V4NNZn5IU+hO5RtK530GkYeWLAaFxKqZ1Sk2XWLdbDgyTDBv2S7miMN3GiajRkVmivHzd1jX0t1Zsn5hY4ck7vMJB7Q3FKCTB2lhNmSU61aWg4ZCm7LBl8FXasfgSnW8WmJMX9+kjeCpEnJceyhYg/A6drDRu1tTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791695141; c=relaxed/simple;
	bh=sRwSp9XHZQUqdeUFL5uMwfeAgpSb3Dqh3QlOCGwpdXM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aCau9i6RbtE3knzH8gvT0y+UzWgif20XoVNvZtmTwYFFAPz4xrRLHd66522lrc0J64xJ2SbvdA8yPKm06mOoBFnOD5ex6RWSFKpHOQJCAuls/y9aDDHe2xMKhO/i8+fHw0p0C19sXLblVdmN24+lWuzrB1lmeyHm6OTbMvjV15M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=os4j5lBc; arc=none smtp.client-ip=35.83.148.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="os4j5lBc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1791695140; x=1823231140;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=szLUSMe+fFEYKk2FPALNuFCAnxVi3ksdX+zqHfEmHlE=;
  b=os4j5lBcXKPvQyPxLSEJyxVCFneEfLaOwrbKnSB1gaLIig8xiuBDbtYi
   AFx36nGWs4Le9qVtUyJOA4xTcKJL4UprKwGPQ0Tv0DCyxFfHVW1Pghv7l
   apgMDo3aaMz8U6N6TlkQYq7kK7oKhrLsJ8xkqkwFia5gxq7FYqZJIX8h0
   P7d7ZJ4PA0W4FYwAz4ZaWiAmzWJ0dOgy0oM0hakSZd5IYAyI2TYPrkd4D
   O1Ae4gR4GIHdEGy7MfGOiEf4N00EH+2EfLsRj/qP8pmm5ZM7xC2zPnj4X
   Uhbt+1zfmzJz440yh6F9elCzLiAlzSRyFZO/Q3E9XYpMfkqzBhnCCetON
   w==;
X-CSE-ConnectionGUID: AWJIiwsURRudUEPkJ+9vnQ==
X-CSE-MsgGUID: mwj/O6HbTNGOO3T4vEbhqg==
X-IronPort-AV: E=Sophos;i="6.27,151,1787011200"; 
   d="scan'208";a="30740878"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 05:05:37 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:27666]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.30.186:2525] with esmtp (Farcaster)
 id e8ca2f6e-9ba9-4050-9e88-a76f74021d16; Sun, 11 Oct 2026 05:05:37 +0000 (UTC)
X-Farcaster-Flow-ID: e8ca2f6e-9ba9-4050-9e88-a76f74021d16
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Sun, 11 Oct 2026 05:05:37 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53; Sun, 11 Oct 2026
 05:05:35 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Talel Shenhar <talel@amazon.com>
CC: Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Eliav
 Farber" <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v5 5/9] irqchip/al-fic: switch to shared parent interrupt
Date: Sun, 11 Oct 2026 05:04:44 +0000
Message-ID: <20261011050449.41903-6-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011050449.41903-1-farbere@amazon.com>
References: <20261011050449.41903-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC001.ant.amazon.com (10.13.139.241) To
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
the standard irqreturn_t prototype and reports whether this instance had
anything pending, so the shared-IRQ core can tell which instance on the
line raised the interrupt. IRQF_NO_THREAD is set because the handler only
demultiplexes to the child domain and must not be forced-threaded; all
instances sharing a parent line agree on this flag, as the shared-IRQ core
requires.

The handler reads the group's cause register and returns IRQ_HANDLED when
any unmasked cause bit is set, IRQ_NONE otherwise. That is the signal the
shared-IRQ core needs - "did this instance's hardware raise the line" -
rather than the result of dispatching to the child domain.

For that filter to be right, gc->mask_cache must be valid before the parent
is requested. IRQ_GC_INIT_MASK_CACHE seeds it from the mask register only
on the first child mapping, and never at all for a group with no consumer
in the devicetree; until then the cache reads 0 and every latched cause bit
passes the filter. Seed it from the value al_fic_wire_init() programmed and
drop the flag; nothing can change the register in between, so the read
could only have returned that same value.

request_irq() can fail, unlike irq_set_chained_handler_and_data(), so add
an error path for it. Set IRQ_DOMAIN_FLAG_DESTROY_GC on the domain after
creating it, so irq_domain_remove() tears the generic chips down too and
the single call suffices for both the chip-allocation and request_irq()
failure paths.

Co-developed-by: Talel Shenhar <talel@amazon.com>
Signed-off-by: Talel Shenhar <talel@amazon.com>
Signed-off-by: Eliav Farber <farbere@amazon.com>
Reviewed-by: Radu Rendec <radu@rendec.net>
---
v5: no change. Added Reviewed-by: Radu Rendec, given on the v4 posting.

v4:
 - Seed gc->mask_cache before request_irq() and drop
   IRQ_GC_INIT_MASK_CACHE. The flag only seeds the cache on the first
   child mapping, which is too late once the handler is shared and never
   happens for a group with no consumer in the devicetree. Found by
   sashiko-bot on the v3 posting.
 - Drop Radu Rendec's Reviewed-by, since the above is a functional
   change.
 - The commit message no longer claims the domain-sized dispatch loop
   always succeeds; with the cache seeded, only mapped bits reach it.

v3:
 - al_fic_irq_handler() no longer derives IRQ_HANDLED/IRQ_NONE from
   generic_handle_domain_irq(), whose return value only reports whether
   the hwirq to virq mapping succeeded - and since the loop iterates
   exactly NR_FIC_IRQS bits, which is the domain's own size, that mapping
   always succeeds. Return IRQ_HANDLED when the masked CAUSE snapshot is
   non-zero instead, which is the correct signal for a shared interrupt.
 - Set IRQ_DOMAIN_FLAG_DESTROY_GC on the domain and let
   irq_domain_remove() free the generic chips, instead of calling
   irq_domain_remove_generic_chips() by hand. Both error paths now go
   through one label. The invalid-free fix from v2 is unaffected; only the
   teardown mechanism changed.
 - Use of_node_full_name() in the request_irq() call.

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

 drivers/irqchip/irq-al-fic.c | 38 +++++++++++++++++++++++++-----------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
index 32d8098699a4..8a7eb9009515 100644
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
@@ -95,24 +95,21 @@ static int al_fic_irq_set_type(struct irq_data *data, unsigned int flow_type)
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
 	unsigned long pending;
 	u32 hwirq;
 
-	chained_irq_enter(irqchip, desc);
-
 	pending = readl_relaxed(fic->base + AL_FIC_CAUSE);
 	pending &= ~gc->mask_cache;
 
 	for_each_set_bit(hwirq, &pending, NR_FIC_IRQS)
 		generic_handle_domain_irq(domain, hwirq);
 
-	chained_irq_exit(irqchip, desc);
+	return pending ? IRQ_HANDLED : IRQ_NONE;
 }
 
 static int al_fic_irq_retrigger(struct irq_data *data)
@@ -140,11 +137,17 @@ static int al_fic_register(struct device_node *node,
 		return -ENOMEM;
 	}
 
+	/*
+	 * Let irq_domain_remove() free the generic chips on either error path
+	 * below, instead of calling irq_domain_remove_generic_chips() by hand.
+	 */
+	fic->domain->flags |= IRQ_DOMAIN_FLAG_DESTROY_GC;
+
 	ret = irq_alloc_domain_generic_chips(fic->domain,
 					     NR_FIC_IRQS,
 					     1, of_node_full_name(fic->node),
 					     handle_level_irq,
-					     0, 0, IRQ_GC_INIT_MASK_CACHE);
+					     0, 0, 0);
 	if (ret) {
 		pr_err("fail to allocate generic chip (%d)\n", ret);
 		goto err_domain_remove;
@@ -162,9 +165,22 @@ static int al_fic_register(struct device_node *node,
 	gc->chip_types->chip.flags = IRQCHIP_SKIP_SET_WAKE;
 	gc->private = fic;
 
-	irq_set_chained_handler_and_data(fic->parent_irq,
-					 al_fic_irq_handler,
-					 fic);
+	/*
+	 * Seed the mask cache with the value al_fic_wire_init() programmed,
+	 * rather than having the generic chip read the register back on the
+	 * first child mapping: that is later than the parent is requested, and
+	 * never happens at all for a group with no consumer in the devicetree.
+	 */
+	gc->mask_cache = ~0U;
+
+	ret = request_irq(fic->parent_irq, al_fic_irq_handler,
+			  IRQF_NO_THREAD | IRQF_SHARED,
+			  of_node_full_name(fic->node), fic);
+	if (ret) {
+		pr_err("fail to request irq (%d)\n", ret);
+		goto err_domain_remove;
+	}
+
 	return 0;
 
 err_domain_remove:
-- 
2.47.3

