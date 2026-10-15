Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4FE2D94B5;
	Thu, 15 Oct 2026 09:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058103; cv=none; b=FBtB6wDDdLsTjQYgm2gL/ACGEYzaOfmrSdlOrETVtFC/RDfkb4qjAheqbDU6iDT/BU0FRQVFAhuG6LXuQtcF3Xcyndm3rfRBwuBJcL5Aj72eeF7xNhpleErc1s99gCXCovsWzzbfsw452UbM1iOEWqkrma8yPne+xwSjGVOeosw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058103; c=relaxed/simple;
	bh=w3pCtNFy3Y4WfnaQt1+UtR+yI/T7n9TSdHzsVy5cU/Q=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=sKYb9M/LypXJ6/yu1yitqM+7U7m3R66Oqf4SovLOnTCVSzc3WGMKqO2UL4XIqwGcEWWsky3yjkENzizvqcDPSCPK5DHxbF9vMT9r4iwG5WsNWBKNhqe+M7FRdKdbFSmMhTiYOXMp5Ba5xFyi+jEJ8WYdWB6MJPpm5D+Wqm5ps3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MuzdQaEo; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=p36pHMeb; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MuzdQaEo";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="p36pHMeb"
Date: Thu, 15 Oct 2026 09:54:56 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792058098;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+L0BGCh6nfJ3jYiIRXVEkQNktievDAPSMRIC3fi6viw=;
	b=MuzdQaEoT6kCDamcvplFVn4ou0jngCpGgX/E0DQdlA5ttf7zzzkXbHg00LdhC7bbB9E2Dc
	rI47/JQCO4Nxuj/22UZwInsDQvFF5UUBZcJKN74eNXArFHg4yl2ashu3vmmnMR+1X/xa/4
	r6SFawYnRIkZEPBdP0An5k3MQqo+cSAaTrhcM9IwPlP8hZiV0WUHjclPJ7vxvEKQBxNsYa
	31YNdIdxgU73hb7nLOQ7jz3rqTXVl+GOTwhLpoDPJc1XgUjL4h4lBquH6sZKk2QNKrUdRe
	M+ZQRUfJ9f8GUUdU1RQUi1Y/LVmX6pvn9kH94/BnRiZ7+aAhcJj+jEY/nHn8cg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792058098;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+L0BGCh6nfJ3jYiIRXVEkQNktievDAPSMRIC3fi6viw=;
	b=p36pHMeb8B+EW41Z4AjZonjWttXBEPOehvazYEe7r5ZLtBKIhPp+t5NH+GD94NBQfUc9R2
	1UnHAv9i5Z/8HODQ==
From: "tip-bot2 for Nam Cao" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/sifive-plic: Panic if initialization fails
Cc: Nam Cao <namcao@linutronix.de>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260911145037.427896-1-namcao@linutronix.de>
References: <20260911145037.427896-1-namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179205809680.2666988.14792996491977277622.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     dd6abfd40c6d8788efe81a7023886a8e0b595e29
Gitweb:        https://git.kernel.org/tip/dd6abfd40c6d8788efe81a7023886a8e0b5=
95e29
Author:        Nam Cao <namcao@linutronix.de>
AuthorDate:    Fri, 11 Sep 2026 16:50:37 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 11:50:47 +02:00

irqchip/sifive-plic: Panic if initialization fails

If PLIC initialization fails, the driver unwinds and returns an error.
However, that is futile because the system cannot function without the
PLIC: all device interrupts are routed through it.

Instead of the unnecessary cleanups, panic when PLIC initialization fails.

Signed-off-by: Nam Cao <namcao@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Radu Rendec <radu@rendec.net>
Link: https://patch.msgid.link/20260911145037.427896-1-namcao@linutronix.de
---
 drivers/irqchip/irq-sifive-plic.c | 56 ++++++++----------------------
 1 file changed, 15 insertions(+), 41 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-p=
lic.c
index a7cddad..70a7478 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -643,13 +643,11 @@ static int plic_probe(struct fwnode_handle *fwnode)
=20
 	error =3D plic_parse_nr_irqs_and_contexts(fwnode, &nr_irqs, &nr_contexts, &=
gsi_base, &id);
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
 		handler->enable_save =3D kcalloc(priv->irq_groups, sizeof(*handler->enable=
_save),
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
@@ -748,10 +742,8 @@ done:
 	}
=20
 	priv->irqdomain =3D irq_domain_create_linear(fwnode, nr_irqs, &plic_irqdoma=
in_ops, priv);
-	if (WARN_ON(!priv->irqdomain)) {
-		error =3D -ENOMEM;
-		goto fail_cleanup_contexts;
-	}
+	if (!priv->irqdomain)
+		return -ENOMEM;
=20
 	/*
 	 * We can have multiple PLIC instances so setup global state
@@ -799,33 +791,13 @@ done:
 	pr_info("%pfwP: mapped %d interrupts with %d handlers for %d contexts.\n",
 		fwnode, nr_irqs, nr_handlers, nr_contexts);
 	return 0;
-
-fail_cleanup_contexts:
-	for (i =3D 0; i < nr_contexts; i++) {
-		if (plic_parse_context_parent(fwnode, i, &parent_hwirq, &cpu, priv->acpi_p=
lic_id))
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
