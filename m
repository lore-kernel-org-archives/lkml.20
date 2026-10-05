Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.34.181.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB69447DFA7;
	Mon,  5 Oct 2026 11:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.34.181.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791199524; cv=none; b=M5tV4FG7fNinWuJSQM9/uFcEt0m7uxBkS+p4WOoiuZtlttPgyDP4/kUzJ4gragOmBSoia22Bw/oZAk0zKjzqdx/s19Bm8Ijd1K0YL8ChyJMhGIEDMdV/SfrHmHoKBP1snv89+3SyCs6IgmRozj3BHC5EzMHFSUn300AObYtN4y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791199524; c=relaxed/simple;
	bh=XCs/paEGYM17fjv+cHZo/UKaY3xp3WuoGtMAmiGLns4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DN4exCo+SRCE5jv6xV9SxL9siNsWGUoKavdfFM1vmbwNd8XRG0izyRZ7tSmed1TpgBCObKjRmWo0+J+HXbRVoIzSZgJRG53mCTHYq8Uch3ngHvXUfNUgZ/PtBUxlCc3w08A7lr66A803ECZhtRsDC+F3OoN76mqo4rIaA4vVQ7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=KQiqJqWA; arc=none smtp.client-ip=52.34.181.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="KQiqJqWA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1791199513; x=1822735513;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uTkwUBd2rR2sTvGTWenad0+Q0AEGgLoC4T1XhpCn1BE=;
  b=KQiqJqWAblhVbWP86qVO0TYoIHmt/gBE04eApIqZmk1sLonsKqbPISWk
   /vbDs8GAawbYY+vgGpwjLZkfcSHcTzOGmYBG9qaNV7IdszPnwbIk+5Br/
   BrHL5iiMQNGKQskG4Bijs8tUpkOry5bVwiIop8WV5mGzRtBxvtmWpoi71
   9V8esUYrs/j0BxdllMN0y+ddXbIpOoe7P0vRX7Rq54K0YTYwKMW85BWM8
   JGuct7kri6teePwDsViTaY9bTSvfwqit46azOUmHW1SvQWscg+eNW7UP8
   0iOlX54IAJYYtGFTbzq/LXFNsbhWScA+27wpYZQk7uw2kGWxGdMoxIhse
   Q==;
X-CSE-ConnectionGUID: gFPzG05NTMeEo0QeOW5QSA==
X-CSE-MsgGUID: O5vYiHICSUuaqUSoWpvOyA==
X-IronPort-AV: E=Sophos;i="6.27,141,1787011200"; 
   d="scan'208";a="30414840"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:25:11 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:14704]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.153:2525] with esmtp (Farcaster)
 id 2a214ec6-14d1-4f47-b703-47b8f8c60f4e; Mon, 5 Oct 2026 11:25:11 +0000 (UTC)
X-Farcaster-Flow-ID: 2a214ec6-14d1-4f47-b703-47b8f8c60f4e
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Mon, 5 Oct 2026 11:25:11 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Mon, 5 Oct 2026
 11:25:09 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Talel Shenhar <talel@amazon.com>
CC: Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Eliav
 Farber" <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3 4/8] irqchip/al-fic: switch to shared parent interrupt
Date: Mon, 5 Oct 2026 11:24:54 +0000
Message-ID: <20261005112458.22291-5-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005112458.22291-1-farbere@amazon.com>
References: <20261005112458.22291-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D039UWA001.ant.amazon.com (10.13.139.110) To
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
rather than the result of dispatching to the child domain, which for a
domain sized exactly to the cause register always succeeds.

request_irq() can fail, unlike irq_set_chained_handler_and_data(), so add
an error path for it. Set IRQ_DOMAIN_FLAG_DESTROY_GC on the domain after
creating it, so irq_domain_remove() tears the generic chips down too and
the single call suffices for both the chip-allocation and request_irq()
failure paths.

Co-developed-by: Talel Shenhar <talel@amazon.com>
Signed-off-by: Talel Shenhar <talel@amazon.com>
Signed-off-by: Eliav Farber <farbere@amazon.com>
---
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

 drivers/irqchip/irq-al-fic.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
index ee06d0123b7a..4c60da8558ed 100644
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
@@ -140,6 +137,12 @@ static int al_fic_register(struct device_node *node,
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
@@ -162,9 +165,14 @@ static int al_fic_register(struct device_node *node,
 	gc->chip_types->chip.flags = IRQCHIP_SKIP_SET_WAKE;
 	gc->private = fic;
 
-	irq_set_chained_handler_and_data(fic->parent_irq,
-					 al_fic_irq_handler,
-					 fic);
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

