Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A05522F19;
	Thu, 15 Oct 2026 12:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792067556; cv=none; b=EGpfpPb5DKmy8kvHsaVtavGJ0YqYavGOmj7qLO5bQQiDd3W6ToRjVimIqe+GO+UomYFKBHu9si5FJdPq/peXdyJMok/gfPx0Ku3rZrqnnuJC4/HBTYMKpvySCkuYB1G7Y7oX7DKs1D7x92JKrWzRjm1GNnRTb4g11++tdcdUlBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792067556; c=relaxed/simple;
	bh=Yo8LrBrnS+khoXgnvwhOmw116Sit7ZbRcQWp6v+44Mc=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=B35NavZP3g+0WJmVYhV2DA+pWa5W3gQvSHaGFb5XrULUGZtX7qu0iUKlcSdBfsY2I+oFiFiVSwmFlDPqCbLJIPOcBIcePlZp2JR/wqXaFcSFNb8TFw69mEXkZu6L3sHObuJYrK/eR+OSPq27yuCAY6JlLSyaTergh3gsOgjn89I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=oEoBD2wo; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=n+0Bp6hT; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oEoBD2wo";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="n+0Bp6hT"
Date: Thu, 15 Oct 2026 12:32:32 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792067554;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P+pQmQ/PUxT13++12LW/VQiqou4FmK+/0oPPmhXpm+Q=;
	b=oEoBD2woxY8TQmDBENRsCQU8smUmuwU7UEeXyGnsgv5Awm7lez/ti7TYmEvl78g8v5ZwYY
	nPvu0gk0uSicW0Ll1GiKybqCBBQ6l6KFv81orjjiH4eVhZB6Q0E5cIZQxwkG5/pE1HHvrE
	5udDzwvdoi5n8pv+TTbznFPN5ktN2nAdhL3DQHOWSn4SdoMTXIIkTlwLTABjbkiOJQUw0O
	D05BdSWEfb9nW+6Pz1jB00E8hhiTEp50B+XrITi3o6QZvgNdEUGsoZmoG/QpPcI+/YgL+i
	txRIn5Q2Xkca56L3G1j+azFFYKxCuGpzVweCNDUXqlPLwaun985BlBzfHg/1XA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792067554;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P+pQmQ/PUxT13++12LW/VQiqou4FmK+/0oPPmhXpm+Q=;
	b=n+0Bp6hThKcP/qZo5UZfWIEKVSINTIyRPxG7AXbSB26x96ae71QClW+aCJ/sqSK/iCNxDF
	ajGFMlVokDSVCgAg==
From: "tip-bot2 for Eliav Farber" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/al-fic: Fix coding style issues
Cc: Eliav Farber <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261011050449.41903-2-farbere@amazon.com>
References: <20261011050449.41903-2-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179206755213.2666988.12522648967408493037.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     ad38b8836a828042262532c8f77659820be01d3d
Gitweb:        https://git.kernel.org/tip/ad38b8836a828042262532c8f77659820be=
01d3d
Author:        Eliav Farber <farbere@amazon.com>
AuthorDate:    Sun, 11 Oct 2026 05:04:40=20
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 14:25:06 +02:00

irqchip/al-fic: Fix coding style issues

Remove pointless line breaks and align continuations and struct
declarations properly.

No functional change.

[ tglx: Do a full sweep of the code instead of fixing a single instance ]

Signed-off-by: Eliav Farber <farbere@amazon.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Radu Rendec <radu@rendec.net>
Link: https://patch.msgid.link/20261011050449.41903-2-farbere@amazon.com
---
 drivers/irqchip/irq-al-fic.c | 66 ++++++++++++-----------------------
 1 file changed, 24 insertions(+), 42 deletions(-)

diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
index 760317d..adcdc05 100644
--- a/drivers/irqchip/irq-al-fic.c
+++ b/drivers/irqchip/irq-al-fic.c
@@ -34,19 +34,18 @@ enum al_fic_state {
 };
=20
 struct al_fic {
-	void __iomem *base;
-	struct irq_domain *domain;
-	const char *name;
-	unsigned int parent_irq;
-	enum al_fic_state state;
+	void __iomem		*base;
+	struct irq_domain	*domain;
+	const char		*name;
+	unsigned int		parent_irq;
+	enum al_fic_state	state;
 };
=20
-static void al_fic_set_trigger(struct al_fic *fic,
-			       struct irq_chip_generic *gc,
+static void al_fic_set_trigger(struct al_fic *fic, struct irq_chip_generic *=
gc,
 			       enum al_fic_state new_state)
 {
-	irq_flow_handler_t handler;
 	u32 control =3D readl_relaxed(fic->base + AL_FIC_CONTROL);
+	irq_flow_handler_t handler;
=20
 	if (new_state =3D=3D AL_FIC_CONFIGURED_LEVEL) {
 		handler =3D handle_level_irq;
@@ -98,8 +97,8 @@ static int al_fic_irq_set_type(struct irq_data *data, unsig=
ned int flow_type)
 static void al_fic_irq_handler(struct irq_desc *desc)
 {
 	struct al_fic *fic =3D irq_desc_get_handler_data(desc);
-	struct irq_domain *domain =3D fic->domain;
 	struct irq_chip *irqchip =3D irq_desc_get_chip(desc);
+	struct irq_domain *domain =3D fic->domain;
 	struct irq_chip_generic *gc =3D irq_get_domain_generic_chip(domain, 0);
 	unsigned long pending;
 	u32 hwirq;
@@ -125,25 +124,20 @@ static int al_fic_irq_retrigger(struct irq_data *data)
 	return 1;
 }
=20
-static int al_fic_register(struct device_node *node,
-			   struct al_fic *fic)
+static int al_fic_register(struct device_node *node, struct al_fic *fic)
 {
 	struct irq_chip_generic *gc;
 	int ret;
=20
-	fic->domain =3D irq_domain_create_linear(of_fwnode_handle(node),
-					    NR_FIC_IRQS,
-					    &irq_generic_chip_ops,
-					    fic);
+	fic->domain =3D irq_domain_create_linear(of_fwnode_handle(node), NR_FIC_IRQ=
S,
+					       &irq_generic_chip_ops, fic);
 	if (!fic->domain) {
 		pr_err("fail to add irq domain\n");
 		return -ENOMEM;
 	}
=20
-	ret =3D irq_alloc_domain_generic_chips(fic->domain,
-					     NR_FIC_IRQS,
-					     1, fic->name,
-					     handle_level_irq,
+	ret =3D irq_alloc_domain_generic_chips(fic->domain, NR_FIC_IRQS,
+					     1, fic->name, handle_level_irq,
 					     0, 0, IRQ_GC_INIT_MASK_CACHE);
 	if (ret) {
 		pr_err("fail to allocate generic chip (%d)\n", ret);
@@ -162,14 +156,11 @@ static int al_fic_register(struct device_node *node,
 	gc->chip_types->chip.flags =3D IRQCHIP_SKIP_SET_WAKE;
 	gc->private =3D fic;
=20
-	irq_set_chained_handler_and_data(fic->parent_irq,
-					 al_fic_irq_handler,
-					 fic);
+	irq_set_chained_handler_and_data(fic->parent_irq, al_fic_irq_handler, fic);
 	return 0;
=20
 err_domain_remove:
 	irq_domain_remove(fic->domain);
-
 	return ret;
 }
=20
@@ -185,14 +176,12 @@ err_domain_remove:
  * Interrupt can be generated based on positive edge or level - configuratio=
n is
  * to be determined based on connected hardware to this fic.
  */
-static struct al_fic *al_fic_wire_init(struct device_node *node,
-				       void __iomem *base,
-				       const char *name,
-				       unsigned int parent_irq)
+static struct al_fic *al_fic_wire_init(struct device_node *node, void __iome=
m *base,
+				       const char *name, unsigned int parent_irq)
 {
+	u32 control =3D CONTROL_MASK_MSI_X;
 	struct al_fic *fic;
 	int ret;
-	u32 control =3D CONTROL_MASK_MSI_X;
=20
 	fic =3D kzalloc_obj(*fic);
 	if (!fic)
@@ -226,17 +215,15 @@ err_free:
 	return ERR_PTR(ret);
 }
=20
-static int __init al_fic_init_dt(struct device_node *node,
-				 struct device_node *parent)
+static int __init al_fic_init_dt(struct device_node *node, struct device_nod=
e *parent)
 {
-	int ret;
-	void __iomem *base;
 	unsigned int parent_irq;
 	struct al_fic *fic;
+	void __iomem *base;
+	int ret;
=20
 	if (!parent) {
-		pr_err("%s: unsupported - device require a parent\n",
-		       node->name);
+		pr_err("%s: unsupported - device require a parent\n", node->name);
 		return -EINVAL;
 	}
=20
@@ -253,14 +240,10 @@ static int __init al_fic_init_dt(struct device_node *no=
de,
 		goto err_unmap;
 	}
=20
-	fic =3D al_fic_wire_init(node,
-			       base,
-			       node->name,
-			       parent_irq);
+	fic =3D al_fic_wire_init(node, base, node->name, parent_irq);
+
 	if (IS_ERR(fic)) {
-		pr_err("%s: fail to initialize irqchip (%lu)\n",
-		       node->name,
-		       PTR_ERR(fic));
+		pr_err("%s: fail to initialize irqchip (%lu)\n", node->name, PTR_ERR(fic));
 		ret =3D PTR_ERR(fic);
 		goto err_irq_dispose;
 	}
@@ -271,7 +254,6 @@ err_irq_dispose:
 	irq_dispose_mapping(parent_irq);
 err_unmap:
 	iounmap(base);
-
 	return ret;
 }
=20
