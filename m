Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.68.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB66A3C873B;
	Sun, 11 Oct 2026 05:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.68.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791695145; cv=none; b=izmUn9EJ1e/LtelvKWQ4XSi8oPJdcJ2VPTqiuwdSK1QagDPvkynQpgc2oRHOIA6ul/lpBPE+NiA/Wa5qoeiv0WkXiihnPtIMVhjb3aqQ2vLwYAOn5ExQtZD7vuCp7WXaPtBDdTCXizXzffMtwCushchPAdg0yBOMaQLYl3R0JR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791695145; c=relaxed/simple;
	bh=9UD77fsOca9jJGBoH6DWysy7QZBu2AW32zqPKJOpqBY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zp00lqCMiv6CbL5nCkpZmBVxlaLfJV7yD8OG76DWrnAws63CJ77ej3KnBcEtIVLxZibhqmeCCD0G4y7btwMVv0ThxVcW++qcbD/6NpHpP2wkz4tqYAqgMuhoSAAcaUPrkxVKc44yM4jWReKzz7t2TPlrgbtuJhEC/j3z2uUR8hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=gZaQqCdv; arc=none smtp.client-ip=44.246.68.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="gZaQqCdv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1791695143; x=1823231143;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/AMIwhOXjKxIcc9orZVGUlP0GuuYaA0U5wq1JjpRUsI=;
  b=gZaQqCdvLDkucESZ6T3S4l2O5+YikG10Hf5uChYRf4DYswfnEiUKBM3v
   ++tS7yOBdeyADUCEwWTKZr1LABUQygz0ST4jjscnPhLz6MPXOatqy+cvd
   pn+EFond8BsXcdLePhV8FkMNVqxD39cPfta9tFqEpQ5LbHW5pMrwFSq+n
   5q0SKC9baLUvhNM8ejo7nPdh1gGB22O6GovI3Os2Rwf57wVtqcXiuBm5F
   7V9+ghT8AN85qs9zCu7m7K312b1MgLjZ2/Zbh4yK1SbPbdZHTm2sTimg2
   PW+Lwg5xa7XPk6Hzt8Jpxh4ml+u8ThlIQR1iljupEQ//PAjt/3VieTc5Q
   w==;
X-CSE-ConnectionGUID: u+wpr72gTiWtGTGuTFIg2A==
X-CSE-MsgGUID: HW91dRU2Qu2/KD4YQop0rA==
X-IronPort-AV: E=Sophos;i="6.27,151,1787011200"; 
   d="scan'208";a="30857776"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 05:05:41 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:25254]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.45.50:2525] with esmtp (Farcaster)
 id 8ad839d7-bbbb-4171-83f9-c8a89562a03a; Sun, 11 Oct 2026 05:05:41 +0000 (UTC)
X-Farcaster-Flow-ID: 8ad839d7-bbbb-4171-83f9-c8a89562a03a
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Sun, 11 Oct 2026 05:05:40 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53; Sun, 11 Oct 2026
 05:05:39 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Talel Shenhar <talel@amazon.com>
CC: Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Eliav
 Farber" <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v5 7/9] irqchip/al-fic: support error and fatal outputs and FIC v2
Date: Sun, 11 Oct 2026 05:04:46 +0000
Message-ID: <20261011050449.41903-8-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011050449.41903-1-farbere@amazon.com>
References: <20261011050449.41903-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC001.ant.amazon.com (10.13.139.241) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

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
Reviewed-by: Radu Rendec <radu@rendec.net>
---
v5: no change to this patch's own hunks; the new patch 2 shifted the
    init-failure line it carries as context. Added Reviewed-by: Radu
    Rendec, given on the v4 posting.

v4: drop the gc_flags local and the revision-gated condition that cleared
    IRQ_GC_INIT_MASK_CACHE for the v2 error and fatal outputs. Patch 4 now
    seeds mask_cache unconditionally and does not ask for the flag at all,
    so there is nothing left for this patch to gate. The enum
    al_fic_version parameter on al_fic_register() goes with it, since the
    condition was its only user. The v2 read-back erratum is now stated in
    the commit message as a consequence of seeding rather than as the
    reason for a per-revision workaround.

v3:
 - Initialise gc_flags to IRQ_GC_INIT_MASK_CACHE at its declaration and
   only clear it on the FIC v2 error/fatal path, dropping the else
   branch.
 - Use ~0U instead of 0xFFFFFFFF, for the mask_cache seed and for the
   three mask register writes.
 - Explain the control register read-modify-write in the commit message.
   Every writable bit in that register resets to 0, so preserving the
   other bits is equivalent to the previous plain write at probe time. It
   is better practice, not a behaviour fix.

v2:
 - Fix the v2 mask_cache workaround, which was dead in v1. mask_cache is
   not seeded until the first child mapping (irq_map_generic_chip), so the
   v1 override was overwritten with 0 and the first unmask then cleared the
   whole mask register, unmasking all 32 sources. Drop
   IRQ_GC_INIT_MASK_CACHE for the error and fatal outputs and seed
   mask_cache from the value al_fic_wire_init() programmed. Commit message
   rewritten to state the real timing and consequence.
 - Read the output from the new amazon,al-fic-mask property (was per-output
   compatible in v1).
 - Label the mask in the probe log line (mask=%s).

 drivers/irqchip/irq-al-fic.c | 108 +++++++++++++++++++++++++++++++----
 1 file changed, 98 insertions(+), 10 deletions(-)

diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
index 8a7eb9009515..1d524b6aba42 100644
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
 
 #define CONTROL_TRIGGER_RISING	BIT(3)
 #define CONTROL_MASK_MSI_X	BIT(5)
+#define CONTROL_VERSION_ID	GENMASK(29, 28)
 
 #define NR_FIC_IRQS 32
 
@@ -33,6 +36,37 @@ enum al_fic_state {
 	AL_FIC_CONFIGURED_RISING_EDGE,
 };
 
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
+	AL_FIC_ID_MAX,		/* keep last */
+};
+
+/* Mask register offset for each interrupt group */
+static const unsigned int al_fic_mask_offset[AL_FIC_ID_MAX] = {
+	[AL_FIC_ID_INFO]  = AL_FIC_INFO_MASK,
+	[AL_FIC_ID_ERROR] = AL_FIC_ERROR_MASK,
+	[AL_FIC_ID_FATAL] = AL_FIC_FATAL_MASK,
+};
+
+/* amazon,al-fic-mask property value for each interrupt group */
+static const char * const al_fic_mask_name[AL_FIC_ID_MAX] = {
+	[AL_FIC_ID_INFO]  = "info",
+	[AL_FIC_ID_ERROR] = "error",
+	[AL_FIC_ID_FATAL] = "fatal",
+};
+
 struct al_fic {
 	void __iomem *base;
 	struct irq_domain *domain;
@@ -123,7 +157,8 @@ static int al_fic_irq_retrigger(struct irq_data *data)
 }
 
 static int al_fic_register(struct device_node *node,
-			   struct al_fic *fic)
+			   struct al_fic *fic,
+			   enum al_fic_id fic_id)
 {
 	struct irq_chip_generic *gc;
 	int ret;
@@ -155,7 +190,7 @@ static int al_fic_register(struct device_node *node,
 
 	gc = irq_get_domain_generic_chip(fic->domain, 0);
 	gc->reg_base = fic->base;
-	gc->chip_types->regs.mask = AL_FIC_MASK;
+	gc->chip_types->regs.mask = al_fic_mask_offset[fic_id];
 	gc->chip_types->regs.ack = AL_FIC_CAUSE;
 	gc->chip_types->chip.irq_mask = irq_gc_mask_set_bit;
 	gc->chip_types->chip.irq_unmask = irq_gc_mask_clr_bit;
@@ -194,6 +229,8 @@ static int al_fic_register(struct device_node *node,
  * @node: pointer to the interrupt controller's device tree node
  * @base: mmio to fic register
  * @parent_irq: interrupt of parent
+ * @fic_id: which of the controller's outputs (info, error or fatal) this
+ *          group drives
  *
  * This API will configure the fic hardware to work in wire mode.
  * In wire mode, fic hardware is generating a wire ("wired") interrupt.
@@ -202,11 +239,13 @@ static int al_fic_register(struct device_node *node,
  */
 static struct al_fic *al_fic_wire_init(struct device_node *node,
 				       void __iomem *base,
-				       unsigned int parent_irq)
+				       unsigned int parent_irq,
+				       enum al_fic_id fic_id)
 {
 	struct al_fic *fic;
+	u32 version_id;
+	u32 control;
 	int ret;
-	u32 control = CONTROL_MASK_MSI_X;
 
 	fic = kzalloc_obj(*fic);
 	if (!fic)
@@ -216,22 +255,37 @@ static struct al_fic *al_fic_wire_init(struct device_node *node,
 	fic->parent_irq = parent_irq;
 	fic->node = of_node_get(node);
 
+	control = readl_relaxed(fic->base + AL_FIC_CONTROL);
+	version_id = FIELD_GET(CONTROL_VERSION_ID, control);
+	if (version_id == AL_FIC_VERSION_V1 && fic_id != AL_FIC_ID_INFO) {
+		pr_err("%pOF: amazon,al-fic-mask = \"%s\" not available on FIC v1\n",
+		       node, al_fic_mask_name[fic_id]);
+		ret = -EINVAL;
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
 
 	/* clear any pending interrupt */
 	writel_relaxed(0, fic->base + AL_FIC_CAUSE);
 
+	/* make sure the controller works in non msi_x mode */
+	control |= CONTROL_MASK_MSI_X;
 	writel_relaxed(control, fic->base + AL_FIC_CONTROL);
 
-	ret = al_fic_register(node, fic);
+	ret = al_fic_register(node, fic, fic_id);
 	if (ret) {
 		pr_err("fail to register irqchip\n");
 		goto err_free;
 	}
 
-	pr_info("%pOF initialized successfully in Legacy mode (parent-irq=%u)\n",
-		node, parent_irq);
+	pr_info("%pOF initialized successfully (mask=%s parent-irq=%u)\n",
+		node, al_fic_mask_name[fic_id], parent_irq);
 
 	return fic;
 
@@ -241,11 +295,38 @@ static struct al_fic *al_fic_wire_init(struct device_node *node,
 	return ERR_PTR(ret);
 }
 
+/*
+ * Parse the amazon,al-fic-mask property into an enum al_fic_id, selecting
+ * which of the controller's outputs this group drives. The property is
+ * optional; an absent property means the info output.
+ */
+static int al_fic_parse_mask(struct device_node *node, enum al_fic_id *fic_id)
+{
+	const char *mask;
+	int ret;
+
+	ret = of_property_read_string(node, "amazon,al-fic-mask", &mask);
+	if (ret == -EINVAL) {
+		*fic_id = AL_FIC_ID_INFO;
+		return 0;
+	}
+	if (ret)
+		return ret;
+
+	ret = match_string(al_fic_mask_name, AL_FIC_ID_MAX, mask);
+	if (ret < 0)
+		return ret;
+
+	*fic_id = ret;
+	return 0;
+}
+
 static int __init al_fic_init_dt(struct device_node *node,
 				 struct device_node *parent)
 {
 	int ret;
 	void __iomem *base;
+	enum al_fic_id fic_id;
 	unsigned int parent_irq;
 	struct al_fic *fic;
 
@@ -254,6 +335,12 @@ static int __init al_fic_init_dt(struct device_node *node,
 		return -EINVAL;
 	}
 
+	ret = al_fic_parse_mask(node, &fic_id);
+	if (ret) {
+		pr_err("%pOF: invalid amazon,al-fic-mask\n", node);
+		return ret;
+	}
+
 	base = of_iomap(node, 0);
 	if (!base) {
 		pr_err("%pOF: fail to map memory\n", node);
@@ -269,7 +356,8 @@ static int __init al_fic_init_dt(struct device_node *node,
 
 	fic = al_fic_wire_init(node,
 			       base,
-			       parent_irq);
+			       parent_irq,
+			       fic_id);
 	if (IS_ERR(fic)) {
 		pr_err("%pOF: fail to initialize irqchip (%pe)\n",
 		       node, fic);
-- 
2.47.3

