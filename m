Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.1.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5431F414A0A;
	Thu, 24 Sep 2026 06:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.1.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790231004; cv=none; b=eBO4VHZg4a46vnC6VRP9jl8u4gnCHR4yUgZVbA797TX2fCTBrJDRI+Bb0zRftEL35uIj1wwOg3VPujI+YQgoIsC4vfFatXAUz+ZVZgsLh/7uzDjJXtvNrVHL8kznW7F8yCSPyPPnAWHsvk4m1V+55PgzVwHUgqvaEev2u+/2lBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790231004; c=relaxed/simple;
	bh=qJ8YM6DPp4EweC7Muqou7PQbW+BxqVtgw0ey7EAvBlk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TRa7JtAXEyQh0R0wmRlL/LkY8LA43lMQqA1R+8/RzQX+lSOEDV/Vs8jJt5qF3mb9xH7KrqSsHcByBsxkTAvQmYlQMsJLMEghqUt8vDlw7hf6VuIkZLaFxVS1QTutq6V+N20G9FXqDPwRE+l2vkXof5+j2/pK7UZx2aUcARXYoLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=nKO+OhbX; arc=none smtp.client-ip=44.246.1.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="nKO+OhbX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790231003; x=1821767003;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JqQ4COUf/cOjsx5b6mVFnNXi2UFxmvgPzrchQHoocoY=;
  b=nKO+OhbXYBhBhSVU/tNpoVX5Zj9G++49NVD32zuwFj+2Y1SzGoIj1ndM
   Qn82U7xz6ws7W18AxrjXZpdaQMcXhiM4/NErwMSnV5qh/VtZN0qgT2+4q
   XMvDrxvRoOqR6OfEX1gQa0f3d0zB1QOc1o7UN5iy0aitScctWmxE4yF/o
   nPyS7/RvixtN2daEByYKG6YLUp816E7WEhE1OQaUlMEz4L+Jr9MqlzdsC
   YiE6scVajkeqbn3SwEWbEi2DH6mSOJYzP90k7UVQQjHYRKLaZ37EaK1Hv
   54/625Pvl2GUPPDSN+Ryq35OsBq6K3ZZNRhF/lYNlhQ2Lv8COBIS4Z7Bo
   w==;
X-CSE-ConnectionGUID: A/qGh7H4QDCk7dganfNkbQ==
X-CSE-MsgGUID: OcpNpA7kTCW/jFGs1HgsDw==
X-IronPort-AV: E=Sophos;i="6.27,120,1787011200"; 
   d="scan'208";a="29509836"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 06:23:20 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:13518]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.33.144:2525] with esmtp (Farcaster)
 id 7c8e5b1d-b631-4b4f-acf2-bece68071344; Thu, 24 Sep 2026 06:23:20 +0000 (UTC)
X-Farcaster-Flow-ID: 7c8e5b1d-b631-4b4f-acf2-bece68071344
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Thu, 24 Sep 2026 06:23:20 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Thu, 24 Sep 2026
 06:23:18 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Talel Shenhar <talel@amazon.com>
CC: Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Eliav
 Farber" <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 2/6] irqchip/al-fic: switch to shared parent interrupt
Date: Thu, 24 Sep 2026 06:23:07 +0000
Message-ID: <20260924062311.37308-3-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260924062311.37308-1-farbere@amazon.com>
References: <20260924062311.37308-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D040UWB002.ant.amazon.com (10.13.138.89) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Until now the driver requested its parent interrupt using the chained
IRQ API (irq_set_chained_handler_and_data()), which only works when each
parent interrupt is wired to a single FIC instance.

On some platforms several FIC instances share the same parent GIC SPI.
To support that, request the parent interrupt as a shared interrupt
(IRQF_SHARED) instead of installing a chained handler. The handler now
has the standard irqreturn_t prototype and reports whether it handled any
child interrupt, so the shared-IRQ core can dispatch to the correct
instance.

generic_handle_domain_irq() is retained for dispatch; its return value is
used to determine whether a pending child was actually handled so the
handler can return IRQ_HANDLED/IRQ_NONE correctly.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
 drivers/irqchip/irq-al-fic.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
index efa7f2b62d00..9cf3eedac97f 100644
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
@@ -162,11 +162,17 @@ static int al_fic_register(struct device_node *node,
 	gc->chip_types->chip.flags = IRQCHIP_SKIP_SET_WAKE;
 	gc->private = fic;
 
-	irq_set_chained_handler_and_data(fic->parent_irq,
-					 al_fic_irq_handler,
-					 fic);
+	ret = request_irq(fic->parent_irq, al_fic_irq_handler,
+			  IRQF_NO_THREAD | IRQF_SHARED, fic->name, fic);
+	if (ret) {
+		pr_err("fail to request irq (%d)\n", ret);
+		goto err_free_generic_chip;
+	}
+
 	return 0;
 
+err_free_generic_chip:
+	irq_free_generic_chip(gc);
 err_domain_remove:
 	irq_domain_remove(fic->domain);
 
-- 
2.47.3

