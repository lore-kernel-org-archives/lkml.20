Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B460E51E422;
	Thu, 15 Oct 2026 12:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792067547; cv=none; b=ELNHGxPu9NH3TBC9vtfkivFRMJFGm0ujdlzjqMH/rAUjpGrtT7v91uiu8ZkLz78zdKkxehvqFVNc56ELbtI1oGBdC8BUKSGj4Ax0w5paP4wIEW3xg8rUdoira6UM+90GFuY3i9j1U/IDnMlRxuzgfAPDvhAhfI/9+X+QbsbjX7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792067547; c=relaxed/simple;
	bh=qDyrWLaVLYCCSYFLFajyVu9wJtOgXzbLJ3XpGHVTn6E=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=hPy5SJn4bK/itvnUjrjodwKHxlRAVbYgmSiv4UCykBIhz8J6OeZvV/L4w1xKjiAxs7WqODFipfIeOTCn7zw94DadbSvjHoY+LpB2pGRTmYBTNkdl70AGxqtDud8cAZEiwDVhpnVgmF6k3A2wlTEZ8u1TYucr06Yr23dC19I4IeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AbswMm9D; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Len6Q70w; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AbswMm9D";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Len6Q70w"
Date: Thu, 15 Oct 2026 12:32:22 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792067544;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CcEod+y6w0LMPSMn38XWbn1a40sIkLoM+jp24P1DY3g=;
	b=AbswMm9Do1Xpbjsz2Mb4W3n+OKwfdVyLpLdhDK0IajJ8qXgNvG1CTChfrZpyylE9KVOY+s
	Joq1Xrgr6UxjWNStelcLw6iX1T8FVXdISKBNZTWiF2928mjCBVxkCF9VJaEUDewrYna0Yw
	F4OwxpJVWT6f6Y+qyNkLPRWGpnRInR192jy5FK7Op67AITvHPzdq2+CLF6BlFbQHFM64Lm
	9Rg/WqLd7qrSvakGkyjWddm1Eb5tsF6LCFmaKX9B4UfUCYXUkR1dD+BShB42ooHXE0tSp6
	1F8dyiC4pdMJ50nqHWl3T9V7JQAQVhOc0QjhRXc0DIozK+M/TQ/9KRY8UN9E2Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792067544;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CcEod+y6w0LMPSMn38XWbn1a40sIkLoM+jp24P1DY3g=;
	b=Len6Q70wId3UqpOyYi1CyVbxB+ptur7Ry/7Vs37nYz95QZcjMEi4bukdwt5peNFPvl/iHo
	WtzSFXH6bE7lbUCw==
From: "tip-bot2 for Eliav Farber" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: irq/drivers] irqchip/al-fic: Support error and fatal outputs and FIC v2
Cc: Eliav Farber <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261011050449.41903-8-farbere@amazon.com>
References: <20261011050449.41903-8-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179206754242.2666988.16446845090556527756.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     3d41f28682aa8375a025bc999e403852a78c092c
Gitweb:        https://git.kernel.org/tip/3d41f28682aa8375a025bc999e403852a78=
c092c
Author:        Eliav Farber <farbere@amazon.com>
AuthorDate:    Sun, 11 Oct 2026 05:04:46=20
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 14:25:07 +02:00

irqchip/al-fic: Support error and fatal outputs and FIC v2

FIC v2 hardware adds two interrupt outputs on top of the info output: an
error output and a fatal output, each with its own mask register
(AL_FIC_ERROR_MASK, AL_FIC_FATAL_MASK). A group drives exactly one of the
three outputs.

Read which output a group drives from the amazon,al-fic-mask devicetree
property (info, error or fatal; absent means info) and program the
matching mask register. Detect the hardware revision from the CONTROL
register version field (bits 28-29). The revision is not in the
devicetree, so requesting the error or fatal output on a v1 device - which
has neither - is rejected at probe against the register.

Name the selected output in the probe log line, in place of the "Legacy
mode" text it replaces. A booted system then shows which output each group
drives.

The "v1" and "v2" names are this driver's labels for the CONTROL
version field encoding (0 and 1).

The driver seeds mask_cache from the value it programs rather than having
the generic chip read the mask register back, so the error and fatal mask
registers are never read - which also sidesteps the v2 erratum where they
always read as 0 regardless of their contents.

Reading CONTROL to get the version field turns the write that follows into
a read-modify-write instead of a value built from CONTROL_MASK_MSI_X
alone. Every RW bit in this register resets to 0, so the two are
equivalent at probe time; the read-modify-write is kept anyway as the
better practice; it costs nothing and does not depend on the reset value
staying 0.

Signed-off-by: Eliav Farber <farbere@amazon.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Radu Rendec <radu@rendec.net>
Link: https://patch.msgid.link/20261011050449.41903-8-farbere@amazon.com
---
 drivers/irqchip/irq-al-fic.c | 104 ++++++++++++++++++++++++++++++----
 1 file changed, 94 insertions(+), 10 deletions(-)

diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
index e664c33..33de265 100644
--- a/drivers/irqchip/irq-al-fic.c
+++ b/drivers/irqchip/irq-al-fic.c
@@ -16,11 +16,14 @@
 /* FIC Registers */
 #define AL_FIC_CAUSE		0x00
 #define AL_FIC_SET_CAUSE	0x08
-#define AL_FIC_MASK		0x10
+#define AL_FIC_INFO_MASK	0x10
 #define AL_FIC_CONTROL		0x28
+#define AL_FIC_ERROR_MASK	0x2c
+#define AL_FIC_FATAL_MASK	0x34
=20
 #define CONTROL_TRIGGER_RISING	BIT(3)
 #define CONTROL_MASK_MSI_X	BIT(5)
+#define CONTROL_VERSION_ID	GENMASK(29, 28)
=20
 #define NR_FIC_IRQS 32
=20
@@ -33,6 +36,37 @@ enum al_fic_state {
 	AL_FIC_CONFIGURED_RISING_EDGE,
 };
=20
+/*
+ * FIC hardware revision, as reported by the CONTROL register version field
+ * (CONTROL_VERSION_ID, bits 29-28). These are this driver's names for that
+ * field's encoding.
+ */
+enum al_fic_version {
+	AL_FIC_VERSION_V1,
+	AL_FIC_VERSION_V2,
+};
+
+enum al_fic_id {
+	AL_FIC_ID_INFO,
+	AL_FIC_ID_ERROR,
+	AL_FIC_ID_FATAL,
+	AL_FIC_ID_MAX,
+};
+
+/* Mask register offset for each interrupt group */
+static const unsigned int al_fic_mask_offset[AL_FIC_ID_MAX] =3D {
+	[AL_FIC_ID_INFO]  =3D AL_FIC_INFO_MASK,
+	[AL_FIC_ID_ERROR] =3D AL_FIC_ERROR_MASK,
+	[AL_FIC_ID_FATAL] =3D AL_FIC_FATAL_MASK,
+};
+
+/* amazon,al-fic-mask property value for each interrupt group */
+static const char * const al_fic_mask_name[AL_FIC_ID_MAX] =3D {
+	[AL_FIC_ID_INFO]  =3D "info",
+	[AL_FIC_ID_ERROR] =3D "error",
+	[AL_FIC_ID_FATAL] =3D "fatal",
+};
+
 struct al_fic {
 	void __iomem		*base;
 	struct irq_domain	*domain;
@@ -121,7 +155,7 @@ static int al_fic_irq_retrigger(struct irq_data *data)
 	return 1;
 }
=20
-static int al_fic_register(struct device_node *node, struct al_fic *fic)
+static int al_fic_register(struct device_node *node, struct al_fic *fic, enu=
m al_fic_id fic_id)
 {
 	struct irq_chip_generic *gc;
 	int ret;
@@ -149,7 +183,7 @@ static int al_fic_register(struct device_node *node, stru=
ct al_fic *fic)
=20
 	gc =3D irq_get_domain_generic_chip(fic->domain, 0);
 	gc->reg_base =3D fic->base;
-	gc->chip_types->regs.mask =3D AL_FIC_MASK;
+	gc->chip_types->regs.mask =3D al_fic_mask_offset[fic_id];
 	gc->chip_types->regs.ack =3D AL_FIC_CAUSE;
 	gc->chip_types->chip.irq_mask =3D irq_gc_mask_set_bit;
 	gc->chip_types->chip.irq_unmask =3D irq_gc_mask_clr_bit;
@@ -186,6 +220,8 @@ err_domain_remove:
  * @node: pointer to the interrupt controller's device tree node
  * @base: mmio to fic register
  * @parent_irq: interrupt of parent
+ * @fic_id: which of the controller's outputs (info, error or fatal) this
+ *          group drives
  *
  * This API will configure the fic hardware to work in wire mode.
  * In wire mode, fic hardware is generating a wire ("wired") interrupt.
@@ -193,9 +229,9 @@ err_domain_remove:
  * to be determined based on connected hardware to this fic.
  */
 static struct al_fic *al_fic_wire_init(struct device_node *node, void __iome=
m *base,
-				       unsigned int parent_irq)
+				       unsigned int parent_irq, enum al_fic_id fic_id)
 {
-	u32 control =3D CONTROL_MASK_MSI_X;
+	u32 control, version_id;
 	struct al_fic *fic;
 	int ret;
=20
@@ -207,22 +243,37 @@ static struct al_fic *al_fic_wire_init(struct device_no=
de *node, void __iomem *b
 	fic->parent_irq =3D parent_irq;
 	fic->node =3D of_node_get(node);
=20
+	control =3D readl_relaxed(fic->base + AL_FIC_CONTROL);
+	version_id =3D FIELD_GET(CONTROL_VERSION_ID, control);
+	if (version_id =3D=3D AL_FIC_VERSION_V1 && fic_id !=3D AL_FIC_ID_INFO) {
+		pr_err("%pOF: amazon,al-fic-mask =3D \"%s\" not available on FIC v1\n",
+		       node, al_fic_mask_name[fic_id]);
+		ret =3D -EINVAL;
+		goto err_free;
+	}
+
 	/* mask out all interrupts */
-	writel_relaxed(0xFFFFFFFF, fic->base + AL_FIC_MASK);
+	writel_relaxed(~0U, fic->base + AL_FIC_INFO_MASK);
+	if (version_id > AL_FIC_VERSION_V1) {
+		writel_relaxed(~0U, fic->base + AL_FIC_ERROR_MASK);
+		writel_relaxed(~0U, fic->base + AL_FIC_FATAL_MASK);
+	}
=20
 	/* clear any pending interrupt */
 	writel_relaxed(0, fic->base + AL_FIC_CAUSE);
=20
+	/* make sure the controller works in non msi_x mode */
+	control |=3D CONTROL_MASK_MSI_X;
 	writel_relaxed(control, fic->base + AL_FIC_CONTROL);
=20
-	ret =3D al_fic_register(node, fic);
+	ret =3D al_fic_register(node, fic, fic_id);
 	if (ret) {
 		pr_err("fail to register irqchip\n");
 		goto err_free;
 	}
=20
-	pr_info("%pOF initialized successfully in Legacy mode (parent-irq=3D%u)\n",
-		node, parent_irq);
+	pr_info("%pOF initialized successfully (mask=3D%s parent-irq=3D%u)\n",
+		node, al_fic_mask_name[fic_id], parent_irq);
=20
 	return fic;
=20
@@ -232,9 +283,36 @@ err_free:
 	return ERR_PTR(ret);
 }
=20
+/*
+ * Parse the amazon,al-fic-mask property into an enum al_fic_id, selecting
+ * which of the controller's outputs this group drives. The property is
+ * optional; an absent property means the info output.
+ */
+static int al_fic_parse_mask(struct device_node *node, enum al_fic_id *fic_i=
d)
+{
+	const char *mask;
+	int ret;
+
+	ret =3D of_property_read_string(node, "amazon,al-fic-mask", &mask);
+	if (ret =3D=3D -EINVAL) {
+		*fic_id =3D AL_FIC_ID_INFO;
+		return 0;
+	}
+	if (ret)
+		return ret;
+
+	ret =3D match_string(al_fic_mask_name, AL_FIC_ID_MAX, mask);
+	if (ret < 0)
+		return ret;
+
+	*fic_id =3D ret;
+	return 0;
+}
+
 static int __init al_fic_init_dt(struct device_node *node, struct device_nod=
e *parent)
 {
 	unsigned int parent_irq;
+	enum al_fic_id fic_id;
 	struct al_fic *fic;
 	void __iomem *base;
 	int ret;
@@ -244,6 +322,12 @@ static int __init al_fic_init_dt(struct device_node *nod=
e, struct device_node *p
 		return -EINVAL;
 	}
=20
+	ret =3D al_fic_parse_mask(node, &fic_id);
+	if (ret) {
+		pr_err("%pOF: invalid amazon,al-fic-mask\n", node);
+		return ret;
+	}
+
 	base =3D of_iomap(node, 0);
 	if (!base) {
 		pr_err("%pOF: fail to map memory\n", node);
@@ -257,7 +341,7 @@ static int __init al_fic_init_dt(struct device_node *node=
, struct device_node *p
 		goto err_unmap;
 	}
=20
-	fic =3D al_fic_wire_init(node, base, parent_irq);
+	fic =3D al_fic_wire_init(node, base, parent_irq, fic_id);
=20
 	if (IS_ERR(fic)) {
 		pr_err("%pOF: fail to initialize irqchip (%pe)\n", node, fic);
