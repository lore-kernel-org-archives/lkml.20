Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com [34.218.115.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A613B7769
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.218.115.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790231187; cv=none; b=S0eFjydMmsJbwTuNXVdi+IP6LX6JyCOu++UAmcGX7HEJuemlFjDfLVemAfgs2PK3WdYFFpAoOHoxOYQAcF5Iw9v3v2Vjpqg+DDnw6yJH47RGX7CB/wtp2APhGzyjUBiB0tecojfcu17xNWM0cKNqwVWUIczTpwxssJ/JGVuSs1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790231187; c=relaxed/simple;
	bh=bg3cjrhM/Gc1vfEW8B5IbVhaNbHNwnY4uv+GFyKCtT8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AYmZWW4C/48DDMFKI8c+fP3AlG9G1JIJkf0+/uOjNMle+i8m0uiqvuPYpDwqMhowEvXmGmV/8ASaP3iDeIarACan2I794gWKYVDrlMzc/gWzdG/7lVAPWcYiPlYFkOmr5xH09ptztT4bBTxg23jKT+9L14o/ttH9PcRkRRrdxpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=onFyrv5R; arc=none smtp.client-ip=34.218.115.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="onFyrv5R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790231185; x=1821767185;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FgERzSRkPJGm7ycOt1LVVsu3ynFm6am5sGse+G4eGUc=;
  b=onFyrv5R6CCqRrW25+CjC9aedzdsVSY4GU6USFQj2JFc2AKcyFXYW9OS
   fisr2qiO9WcOZYXUli0q9DD5IqnfKg9sE0O6Yk0N7K/nkRMmed4n6K5k7
   zJiR3DK0+D21qN7WXi5wK3BDmVypd/IkBYjz6gWjPSpiH0nguRuWxJQsE
   icxsmDjMFP0eo2DuIzAynOA5PTB/PPcSpU610ZQFCtdMl9cT5I0Tno66W
   vLtrJqI5zfrN+73mojuJJhgwzGuvRUFc6DZkBkiK7sYJdkr1fILAkMZNs
   WKhqM/woNyXLjGqkW3MC9G3i4ENk3/KMAp7I6mn+JWn0IfAj6VRnH3DM8
   Q==;
X-CSE-ConnectionGUID: s+xoaniTTfqDhygwPgYN1w==
X-CSE-MsgGUID: 4+ippplaQZu4GtqUROgWsg==
X-IronPort-AV: E=Sophos;i="6.27,120,1787011200"; 
   d="scan'208";a="29296323"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 06:26:25 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:4550]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.13.104:2525] with esmtp (Farcaster)
 id 964c8ce4-5700-41f5-aa9a-182dc344897b; Thu, 24 Sep 2026 06:26:25 +0000 (UTC)
X-Farcaster-Flow-ID: 964c8ce4-5700-41f5-aa9a-182dc344897b
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Thu, 24 Sep 2026 06:26:25 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Thu, 24 Sep 2026
 06:26:23 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Talel Shenhar <talel@amazon.com>
CC: Radu Rendec <radu@rendec.net>, Eliav Farber <farbere@amazon.com>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 6/6] irqchip/al-fic: add irq_set_affinity callback
Date: Thu, 24 Sep 2026 06:26:18 +0000
Message-ID: <20260924062618.42365-2-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260924062618.42365-1-farbere@amazon.com>
References: <20260924062311.37308-1-farbere@amazon.com>
 <20260924062618.42365-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D038UWC001.ant.amazon.com (10.13.139.213) To
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
child would silently move all the others. A dev_warn_once() is emitted
when the requested affinity differs from the parent's current affinity,
giving visibility without failing the caller.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
 drivers/irqchip/irq-al-fic.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
index d9f5d8d8a4ba..8ad753ef121a 100644
--- a/drivers/irqchip/irq-al-fic.c
+++ b/drivers/irqchip/irq-al-fic.c
@@ -149,6 +149,37 @@ static int al_fic_irq_retrigger(struct irq_data *data)
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
+		dev_warn_once(gc->domain->dev,
+			      "affinity change requested but FIC is fixed to parent IRQ %u CPU routing\n",
+			      fic->parent_irq);
+
+	return IRQ_SET_MASK_OK_DONE;
+}
+
 static int al_fic_register(struct device_node *node,
 			   struct al_fic *fic,
 			   enum al_fic_id fic_id)
@@ -184,6 +215,7 @@ static int al_fic_register(struct device_node *node,
 	gc->chip_types->chip.irq_ack = irq_gc_ack_clr_bit;
 	gc->chip_types->chip.irq_set_type = al_fic_irq_set_type;
 	gc->chip_types->chip.irq_retrigger = al_fic_irq_retrigger;
+	gc->chip_types->chip.irq_set_affinity = al_fic_irq_set_affinity;
 	gc->chip_types->chip.flags = IRQCHIP_SKIP_SET_WAKE;
 	gc->private = fic;
 
-- 
2.47.3

