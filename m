Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0C1521890;
	Thu, 15 Oct 2026 12:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792067552; cv=none; b=kLNSQKm9XDPevDvMpYbyvRm6WvtHsD6GypLxKkD0vuJpIAqrfW+03qTFRI4Baxif/lYC19BT+a+61mKmeWOXDLqa8HEKE+peDB6Tm00FMObbLUC35QO2nNGkTG4mn12WKBJZdKQSbal0o7lO7afNTdZj4Lsmhj8/7N8JLJDyKdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792067552; c=relaxed/simple;
	bh=IubCBrjCgMwfqXhTazNmTrwkGFM8nOBgKwAHbEXPlYo=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=NibIZRVDDoMpW8OPjwTZm5mHU1dIkf1cTNTULXvbsOUhHR7AgVta8SDatmioxcfEsGfsoX8tiSpEeym5PE/oOpTmmEssZZDa1/vqAB5HnNBhk3koaf74HrRvStA43O1RkD72fBn/8c6Wya/OurTqBy86IFQachnU6HiIfbaZm48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AlonxMZU; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wXfqVqdM; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AlonxMZU";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wXfqVqdM"
Date: Thu, 15 Oct 2026 12:32:27 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792067548;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aMTG6RP6i5fmcZGML/KiBVNeHKsFv833LjFteAgVARc=;
	b=AlonxMZUM6tdBe5vLRsmwdUYMBSSiDL7SmXIGqjLTkRWI+vjdlFfo+rz4oOK0s/NzM7VHi
	7xf4BeW6IAxpMwFSv5GqGJeABMokR3GERut9UYbof2XxQYiCjVaR5rbQ9sWl5YZbeAvuTV
	POJmz7r/2bNlHClNTwaIRH+Ca9b+/8WNGPn9k7crtAY9goIgnCLT2ATkUEpsWU+FLXNRLT
	MAaWgsz0Oz4NSYn19NSI2XOY3pGmdLMiCsHUy2UOjD0VxTYinZtfa3Ci5XNt66ycSrTFq2
	sNc2N9Tpe+8Sb4n5OHvQhAi2vf+4ojJnVibMdCF4uFWNGTztjVSipQV23HdxNg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792067548;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aMTG6RP6i5fmcZGML/KiBVNeHKsFv833LjFteAgVARc=;
	b=wXfqVqdMoezGaYNvaVRAJaPqKPasf3yGJJQOpNPWjkXnFxgek/T1pTy6Pb453rBcvrykHb
	HkidWf8iJM7LGSBQ==
From: "tip-bot2 for Eliav Farber" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/al-fic: Keep the device_node instead of a
 cached name string
Cc: Eliav Farber <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261011050449.41903-5-farbere@amazon.com>
References: <20261011050449.41903-5-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179206754710.2666988.11556087581597630591.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     455c9664aa6940b44a4d0e92f6a5850afb1d8435
Gitweb:        https://git.kernel.org/tip/455c9664aa6940b44a4d0e92f6a5850afb1=
d8435
Author:        Eliav Farber <farbere@amazon.com>
AuthorDate:    Sun, 11 Oct 2026 05:04:43=20
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 14:25:06 +02:00

irqchip/al-fic: Keep the device_node instead of a cached name string

struct al_fic cached a const char *name that al_fic_wire_init() set
from node->name. That string pointed into the device_node, so the
driver already depended on the node outliving init, but nothing in the
struct said so.

Keep the device_node itself and derive the name where it is needed. The
dependency does not go away: of_node_full_name() also returns a pointer
into the node, and irq_alloc_domain_generic_chips() keeps the string it
is given.

The driver therefore needs its own reference. of_irq_init() holds one
across the init callback, but since commit 30724547b221 ("of/irq: Fix
remaining refcount leaks in of_irq_init()") it drops that reference
again when it drains its parent list. Take a reference where the
pointer is stored and drop it on the error path. The driver is
__init-only with no teardown, so on success it is held for the life of
the system.

Deriving the name this way also changes the generic chip name from the
bare node name (e.g. "interrupt-controller") to the full name including
the unit address (e.g. "interrupt-controller@fd8a8500"), which keeps
instances that share a bare name distinguishable.

Signed-off-by: Eliav Farber <farbere@amazon.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Radu Rendec <radu@rendec.net>
Link: https://patch.msgid.link/20261011050449.41903-5-farbere@amazon.com
---
 drivers/irqchip/irq-al-fic.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
index ac979c3..30740d7 100644
--- a/drivers/irqchip/irq-al-fic.c
+++ b/drivers/irqchip/irq-al-fic.c
@@ -36,7 +36,7 @@ enum al_fic_state {
 struct al_fic {
 	void __iomem		*base;
 	struct irq_domain	*domain;
-	const char		*name;
+	struct device_node	*node;
 	unsigned int		parent_irq;
 	enum al_fic_state	state;
 };
@@ -88,7 +88,7 @@ static int al_fic_irq_set_type(struct irq_data *data, unsig=
ned int flow_type)
 	if (fic->state =3D=3D AL_FIC_UNCONFIGURED) {
 		al_fic_set_trigger(fic, gc, new_state);
 	} else if (fic->state !=3D new_state) {
-		pr_debug("fic %s state already configured to %d\n", fic->name, fic->state);
+		pr_debug("fic %pOF state already configured to %d\n", fic->node, fic->stat=
e);
 		return -EINVAL;
 	}
 	return 0;
@@ -137,7 +137,7 @@ static int al_fic_register(struct device_node *node, stru=
ct al_fic *fic)
 	}
=20
 	ret =3D irq_alloc_domain_generic_chips(fic->domain, NR_FIC_IRQS,
-					     1, fic->name, handle_level_irq,
+					     1, of_node_full_name(fic->node), handle_level_irq,
 					     0, 0, IRQ_GC_INIT_MASK_CACHE);
 	if (ret) {
 		pr_err("fail to allocate generic chip (%d)\n", ret);
@@ -166,9 +166,8 @@ err_domain_remove:
=20
 /*
  * al_fic_wire_init() - initialize and configure fic in wire mode
- * @of_node: optional pointer to interrupt controller's device tree node.
+ * @node: pointer to the interrupt controller's device tree node
  * @base: mmio to fic register
- * @name: name of the fic
  * @parent_irq: interrupt of parent
  *
  * This API will configure the fic hardware to work in wire mode.
@@ -177,7 +176,7 @@ err_domain_remove:
  * to be determined based on connected hardware to this fic.
  */
 static struct al_fic *al_fic_wire_init(struct device_node *node, void __iome=
m *base,
-				       const char *name, unsigned int parent_irq)
+				       unsigned int parent_irq)
 {
 	u32 control =3D CONTROL_MASK_MSI_X;
 	struct al_fic *fic;
@@ -189,7 +188,7 @@ static struct al_fic *al_fic_wire_init(struct device_node=
 *node, void __iomem *b
=20
 	fic->base =3D base;
 	fic->parent_irq =3D parent_irq;
-	fic->name =3D name;
+	fic->node =3D of_node_get(node);
=20
 	/* mask out all interrupts */
 	writel_relaxed(0xFFFFFFFF, fic->base + AL_FIC_MASK);
@@ -211,6 +210,7 @@ static struct al_fic *al_fic_wire_init(struct device_node=
 *node, void __iomem *b
 	return fic;
=20
 err_free:
+	of_node_put(fic->node);
 	kfree(fic);
 	return ERR_PTR(ret);
 }
@@ -240,7 +240,7 @@ static int __init al_fic_init_dt(struct device_node *node=
, struct device_node *p
 		goto err_unmap;
 	}
=20
-	fic =3D al_fic_wire_init(node, base, node->name, parent_irq);
+	fic =3D al_fic_wire_init(node, base, parent_irq);
=20
 	if (IS_ERR(fic)) {
 		pr_err("%pOF: fail to initialize irqchip (%pe)\n", node, fic);
