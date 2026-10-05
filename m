Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.13.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0036447DFAF;
	Mon,  5 Oct 2026 11:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.13.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791199554; cv=none; b=mlg0hAJCmuUGBF+5cNcN1174rAYH0qdwS2FIfhTQLCq8t6au5kgPN1kBI+xyI56PDE2XeBzBVyPh0eBQ+Y91709jTju4+j0fhcW4GNS6PybRkLSCqCc/gCKQYyCV9nZ4HjRROHtIu737iGOjyFHQEzbpaedqSkwdxKI1j/hlero=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791199554; c=relaxed/simple;
	bh=9chdf9rfuehyus/X6CaWJd1GiT+fyKpok6/8viMlBwo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nyxFBc4iexAU1sNPsIXQMzN2XE04DBLCTwI/AwjVa39MdFCkmljVxqDl0Np4JCANDEhNSma8+vLE5FfexAlXL3PyyBU85QwqJRFBh2IwV2XikemiTey46kKs0RkBPeZQrsAi9Honpay56n+RxYgbIJhOTcpbKlowRB+ONrZp8js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=jibccaC6; arc=none smtp.client-ip=52.13.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="jibccaC6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1791199553; x=1822735553;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OwtqYvHj3MfrUR8iN3M8QLsv6wQWGkSeG1k6DZsBklk=;
  b=jibccaC6Y29J5j43Fonc+V04rzHHNjelWmVpDB0Re2DrxOekRd0ZZN+X
   12L+kGe6uSQLUj/L9a7ybMx/bdPXxJNA5HwLbpAVVP/BP0Gr5sG88KYcY
   +6ejWRILpMnqeU/FFdR7gXfOUnfzJ+HPGgDrtx9slh0u2Xja2p1SESB+4
   TZSuYQnJu5zhtGrvnBESjKn7oEa5IDbFPSfY8/5s/w4PYWigGJAzhk+We
   pjBISzy3rYZfZ07z5rbzAY5RMiXawsMF0/8GoMLLNrT0Z9EO7LiqTk7PW
   fez/ysfdaXrEX2ElKliIh1gdI0hG5Xm8HKsNddrHr6fKfUFPmn5ywOioL
   A==;
X-CSE-ConnectionGUID: pUw4PEiXSvWIxH6FCBqxhw==
X-CSE-MsgGUID: rEQCP/a9QQSvsVoHCZxGRw==
X-IronPort-AV: E=Sophos;i="6.27,141,1787011200"; 
   d="scan'208";a="30399634"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:25:52 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:8533]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.52.137:2525] with esmtp (Farcaster)
 id 08bcf54c-522b-42cf-92c3-003426386a37; Mon, 5 Oct 2026 11:25:52 +0000 (UTC)
X-Farcaster-Flow-ID: 08bcf54c-522b-42cf-92c3-003426386a37
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Mon, 5 Oct 2026 11:25:52 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Mon, 5 Oct 2026
 11:25:50 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Talel Shenhar <talel@amazon.com>
CC: Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Eliav
 Farber" <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3 8/8] irqchip/al-fic: add irq_set_affinity callback
Date: Mon, 5 Oct 2026 11:24:58 +0000
Message-ID: <20261005112458.22291-9-farbere@amazon.com>
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
X-ClientProxiedBy: EX19D033UWC002.ant.amazon.com (10.13.139.196) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

The FIC aggregates up to 32 interrupt sources into a single parent GIC
SPI and has no per-child affinity control; affinity is determined by the
parent GIC SPI routing.

irq_set_affinity() fails with -EINVAL when the target irqchip has no
irq_set_affinity callback, which prevents drivers that call it from
probing when their interrupt is routed through a FIC instance. Add an
irq_set_affinity callback that returns IRQ_SET_MASK_OK_DONE
unconditionally.

Affinity requests cannot be forwarded to the parent GIC SPI, because it
may be shared by several FIC instances and changing its affinity for one
child would silently move all the others. A pr_warn_once() is emitted
when the requested affinity differs from the parent's current affinity,
giving visibility without failing the caller.

Co-developed-by: Talel Shenhar <talel@amazon.com>
Signed-off-by: Talel Shenhar <talel@amazon.com>
Signed-off-by: Eliav Farber <farbere@amazon.com>
---
v3: no change. The question Radu Rendec raised on this patch - whether an
    unconditional IRQ_SET_MASK_OK_DONE is the right contract, or whether
    it should fail with -EINVAL - is still under discussion on the v2
    thread and is answered there.

v2: add Co-developed-by/Signed-off-by: Talel Shenhar. No code change from
    v1.

 drivers/irqchip/irq-al-fic.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
index 84cb14615d56..36954ba4f4f2 100644
--- a/drivers/irqchip/irq-al-fic.c
+++ b/drivers/irqchip/irq-al-fic.c
@@ -157,6 +157,36 @@ static int al_fic_irq_retrigger(struct irq_data *data)
 	return 1;
 }
 
+/*
+ * The FIC aggregates up to 32 child interrupts into a single parent GIC SPI.
+ * It has no hardware affinity control - all children inherit the parent's
+ * CPU routing. Affinity requests cannot be forwarded to the parent, because
+ * a parent GIC SPI may be shared by multiple FIC instances and changing its
+ * affinity for one child would silently move all the others.
+ *
+ * Return IRQ_SET_MASK_OK_DONE unconditionally so that callers using
+ * irq_set_affinity() do not fail with -EINVAL for lack of this callback.
+ */
+static int al_fic_irq_set_affinity(struct irq_data *data,
+				   const struct cpumask *mask, bool force)
+{
+	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(data);
+	const struct cpumask *parent_affinity;
+	struct al_fic *fic = gc->private;
+	struct irq_data *parent_data;
+
+	parent_data = irq_get_irq_data(fic->parent_irq);
+	if (!parent_data)
+		return -EINVAL;
+
+	parent_affinity = irq_data_get_affinity_mask(parent_data);
+	if (!cpumask_equal(mask, parent_affinity))
+		pr_warn_once("%pOF: affinity change requested but FIC is fixed to parent IRQ %u CPU routing\n",
+			     fic->node, fic->parent_irq);
+
+	return IRQ_SET_MASK_OK_DONE;
+}
+
 static int al_fic_register(struct device_node *node,
 			   struct al_fic *fic,
 			   enum al_fic_id fic_id,
@@ -216,6 +246,7 @@ static int al_fic_register(struct device_node *node,
 	gc->chip_types->chip.irq_ack = irq_gc_ack_clr_bit;
 	gc->chip_types->chip.irq_set_type = al_fic_irq_set_type;
 	gc->chip_types->chip.irq_retrigger = al_fic_irq_retrigger;
+	gc->chip_types->chip.irq_set_affinity = al_fic_irq_set_affinity;
 	gc->chip_types->chip.flags = IRQCHIP_SKIP_SET_WAKE;
 	gc->private = fic;
 
-- 
2.47.3

