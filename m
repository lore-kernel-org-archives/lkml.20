Received: from pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.245.243.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A683BAD92;
	Sun, 27 Sep 2026 08:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.245.243.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790496462; cv=none; b=lB7w6lcgGOjqnFli0eDG8XtLcdM0GYPNM6gMPhhY6XQqe3k67g+76yLzL2sdfGnnq0u/DUcdr8gk/ze4KADFBNnd5mqQxc5jhLADjKT4K8lIgn/ni47JQAYikeJ3N3/Og0N6FbejV+A/LYvRA7mQoDsWgbjQ+UjJ7ZRD1mHqK+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790496462; c=relaxed/simple;
	bh=hO45jCmlAiPeFKxvVXQ+u7Ud0J1gp0P99rjlXrQubB8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tQRL+J58Erudj4kKu2geS7LqSYfJSsD/pRIrZ7+5S73+nKtIJVleD95sqVQmVnskBdS2k6uawbBWA3ZGNz4ERGcE8HqYW+UGtitDKogyqeMadPzF3RZuRUjmpoFV4yEIS07Y7q/2U+J/SOVJg3cRWvdXAPcBBQaANGNSU2SVVQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=c/lbSSFv; arc=none smtp.client-ip=44.245.243.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="c/lbSSFv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790496461; x=1822032461;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L6Tyx5kS9m2g9ytm5JqBGf2Zg59G2JcAZ7/OyZDtD80=;
  b=c/lbSSFvj4a4+HFuNJdqDXIWOzDpMKwsI/YWOBhg0vpNZHdbdiMG0M6i
   +LHXb8oZq1nUAfcGr8Gq5PchuRcLWSTZPJsUIX+IerYXsL+GwVbY+qfxU
   RpTMMO393PYmZ4xHQAjTRvPqWJry/fl4hi4VDn8+y2mAfBVOvWDGdPPLt
   ZjZsukct329h4g7PQGBpHa3fUAjBV5Y9yG2DUo+I2f1X/TkwYt32IBzsS
   g9B2aeEUsij1wGUBg75hzCBIM1fQdbUsu24AMzrg6GDmZbuXn6BPQHR9h
   mb2kO4g62inZ+f6H5m4JIChTcoSC1+zbIFWZeDaA8ejL8l18pANdovfFK
   w==;
X-CSE-ConnectionGUID: vjR0qTeOTe+u5gDUE4hJ6A==
X-CSE-MsgGUID: w9HocvlBTj6+rMwfIj5hIQ==
X-IronPort-AV: E=Sophos;i="6.27,126,1787011200"; 
   d="scan'208";a="29254626"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 08:07:36 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:22427]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.53.187:2525] with esmtp (Farcaster)
 id 37029467-d6d6-4f76-b1fd-9d44381def29; Sun, 27 Sep 2026 08:07:35 +0000 (UTC)
X-Farcaster-Flow-ID: 37029467-d6d6-4f76-b1fd-9d44381def29
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Sun, 27 Sep 2026 08:07:35 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Sun, 27 Sep 2026
 08:07:34 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Talel Shenhar <talel@amazon.com>
CC: Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Eliav
 Farber" <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 8/8] irqchip/al-fic: add irq_set_affinity callback
Date: Sun, 27 Sep 2026 08:06:37 +0000
Message-ID: <20260927080637.27285-9-farbere@amazon.com>
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
X-ClientProxiedBy: EX19D031UWC003.ant.amazon.com (10.13.139.252) To
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
v2: add Co-developed-by/Signed-off-by: Talel Shenhar. No code change from
    v1.

 drivers/irqchip/irq-al-fic.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
index 322e41ffa2fa..a558e0d88697 100644
--- a/drivers/irqchip/irq-al-fic.c
+++ b/drivers/irqchip/irq-al-fic.c
@@ -160,6 +160,36 @@ static int al_fic_irq_retrigger(struct irq_data *data)
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
@@ -215,6 +245,7 @@ static int al_fic_register(struct device_node *node,
 	gc->chip_types->chip.irq_ack = irq_gc_ack_clr_bit;
 	gc->chip_types->chip.irq_set_type = al_fic_irq_set_type;
 	gc->chip_types->chip.irq_retrigger = al_fic_irq_retrigger;
+	gc->chip_types->chip.irq_set_affinity = al_fic_irq_set_affinity;
 	gc->chip_types->chip.flags = IRQCHIP_SKIP_SET_WAKE;
 	gc->private = fic;
 
-- 
2.47.3

