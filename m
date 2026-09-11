Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728D03563FB
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789138245; cv=none; b=eNE0oex661Z2Ty708PrpKG9uAmmgzlSjSMT0Dp6OILQc6F/wgKtP2FjM2XPW8B/nnbLI8WCMQI31FARWWaIXPsQc1xMre5s95YO0tluNPPVbRLVV2Fuxqk97y23OUyou38Moniy6CVRpbMnPAP3Mmx6FvIcSx+dldJQcM84bH4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789138245; c=relaxed/simple;
	bh=of8hcbHdIF9kFhh3L65GcZFEguJiAxzVbvy0I01K6VM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W8ThBcv79zWKYtDK9LLg8BSNDQXMKIUFCa3/JC7LQE1UH75HlP+6FH98343HG29pqO7wObLX9LAI7cca3TGtHabReeWk+kEYstfPKFjMGAzeRiLCe/BbJ3+58gs3c2npKuBNId7FvKqkFTJV+dmdtM94lunnk6vPKwrXx5wcqlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qasgzA6A; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EQCI9Wwa; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qasgzA6A";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EQCI9Wwa"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789138242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DofMgJ4HQJP6KXLOPb6VSmbpACWlyfd2dHezMOI9WDY=;
	b=qasgzA6Aq/R/H8P5AWE5YxpCPz6ZVxw6CdbEFnKcZ/p+erXvgEjC0vGM9KVIg14JXO+MQS
	GjMST0QNDNXbT7TzuHZ31OMaVpV0NYwZ51QUFSXA0j0KaztKYjLswtqRHPIR7zUERH0uY2
	G1OOmCakdukX7lNAsMDudXG4BLpr7EAxI0/t3AuR2SFzzGPFEb0Rw9mpvnIJrXypv3lEle
	ZjivBxIiid+UgVwpKeMZloD+BGPNa3Vb0jGH/WuJ6CdH7ewJOLi0kVX524KGb/jKwkW+Zh
	nI9Q2daIaV7A/yPnkSsdZSpHDAoS96NA5hcAAY0pNxZQxTGrtxYM22W1SNxxvg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789138242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DofMgJ4HQJP6KXLOPb6VSmbpACWlyfd2dHezMOI9WDY=;
	b=EQCI9Wwadzqc6WKyoR4BWQinngOIOMwsz4iw+O8I0kZGfp5Nixp21v6wXYEdtXuasoeRuZ
	wGfBBDFLboXCZHCA==
To: Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH] irqchip/sifive-plic: Panic if initialization fails
Date: Fri, 11 Sep 2026 16:50:37 +0200
Message-ID: <20260911145037.427896-1-namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

If PLIC initialization fails, the driver unwinds and returns an error.
However, that is futile because the system cannot function without the
PLIC: all device interrupts are routed through it.

Instead of the unnecessary cleanups, panic when PLIC initialization fails.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 drivers/irqchip/irq-sifive-plic.c | 56 +++++++++----------------------
 1 file changed, 15 insertions(+), 41 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive=
-plic.c
index a7cddadddf40..70a7478373e4 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -643,13 +643,11 @@ static int plic_probe(struct fwnode_handle *fwnode)
=20
 	error =3D plic_parse_nr_irqs_and_contexts(fwnode, &nr_irqs, &nr_contexts,=
 &gsi_base, &id);
 	if (error)
-		goto fail_free_regs;
+		return error;
=20
 	priv =3D kzalloc_obj(*priv);
-	if (!priv) {
-		error =3D -ENOMEM;
-		goto fail_free_regs;
-	}
+	if (!priv)
+		return -ENOMEM;
=20
 	priv->fwnode =3D fwnode;
 	priv->plic_quirks =3D plic_quirks;
@@ -668,10 +666,8 @@ static int plic_probe(struct fwnode_handle *fwnode)
 	priv->acpi_plic_id =3D id;
=20
 	priv->prio_save =3D bitmap_zalloc(nr_irqs, GFP_KERNEL);
-	if (!priv->prio_save) {
-		error =3D -ENOMEM;
-		goto fail_free_priv;
-	}
+	if (!priv->prio_save)
+		return -ENOMEM;
=20
 	for (i =3D 0; i < nr_contexts; i++) {
 		error =3D plic_parse_context_parent(fwnode, i, &parent_hwirq, &cpu,
@@ -735,10 +731,8 @@ static int plic_probe(struct fwnode_handle *fwnode)
=20
 		handler->enable_save =3D kcalloc(priv->irq_groups, sizeof(*handler->enab=
le_save),
 					       GFP_KERNEL);
-		if (!handler->enable_save) {
-			error =3D -ENOMEM;
-			goto fail_cleanup_contexts;
-		}
+		if (!handler->enable_save)
+			return -ENOMEM;
 done:
 		for_each_device_irq(hwirq, priv) {
 			plic_toggle(handler, hwirq, 0);
@@ -748,10 +742,8 @@ static int plic_probe(struct fwnode_handle *fwnode)
 	}
=20
 	priv->irqdomain =3D irq_domain_create_linear(fwnode, nr_irqs, &plic_irqdo=
main_ops, priv);
-	if (WARN_ON(!priv->irqdomain)) {
-		error =3D -ENOMEM;
-		goto fail_cleanup_contexts;
-	}
+	if (!priv->irqdomain)
+		return -ENOMEM;
=20
 	/*
 	 * We can have multiple PLIC instances so setup global state
@@ -799,33 +791,13 @@ static int plic_probe(struct fwnode_handle *fwnode)
 	pr_info("%pfwP: mapped %d interrupts with %d handlers for %d contexts.\n",
 		fwnode, nr_irqs, nr_handlers, nr_contexts);
 	return 0;
-
-fail_cleanup_contexts:
-	for (i =3D 0; i < nr_contexts; i++) {
-		if (plic_parse_context_parent(fwnode, i, &parent_hwirq, &cpu, priv->acpi=
_plic_id))
-			continue;
-		if (parent_hwirq !=3D RV_IRQ_EXT || cpu < 0)
-			continue;
-
-		handler =3D per_cpu_ptr(&plic_handlers, cpu);
-		handler->present =3D false;
-		handler->hart_base =3D NULL;
-		handler->enable_base =3D NULL;
-		kfree(handler->enable_save);
-		handler->enable_save =3D NULL;
-		handler->priv =3D NULL;
-	}
-	bitmap_free(priv->prio_save);
-fail_free_priv:
-	kfree(priv);
-fail_free_regs:
-	iounmap(regs);
-	return error;
 }
=20
 static int plic_platform_probe(struct platform_device *pdev)
 {
-	return plic_probe(pdev->dev.fwnode);
+	if (plic_probe(pdev->dev.fwnode))
+		panic("%pfwP: Failed to initialize\n", pdev->dev.fwnode);
+	return 0;
 }
=20
 static struct platform_driver plic_driver =3D {
@@ -842,7 +814,9 @@ builtin_platform_driver(plic_driver);
 static int __init plic_early_probe(struct device_node *node,
 				   struct device_node *parent)
 {
-	return plic_probe(&node->fwnode);
+	if (plic_probe(&node->fwnode))
+		panic("%pfwP: Failed to initialize\n", &node->fwnode);
+	return 0;
 }
=20
 IRQCHIP_DECLARE(riscv, "allwinner,sun20i-d1-plic", plic_early_probe);
--=20
2.47.3

