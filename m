Received: from pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.26.1.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6DD46AA6B;
	Mon,  5 Oct 2026 11:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.26.1.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791199554; cv=none; b=Uvdt3b94pwv48sbnhdWD8bMwELPH8+VyyGW02h7QNLxc8eCbAZBzAIuqX6vJaF9lb6HU/KKxnWT1i0H3hQkjJ5Y+aYgIPthoqiWBGyUi8+Sl9s5UlT/2uKGSg9iAAk1BAGNfhobq081rl5T8Pe8+s8I5aukRyUyZknLlJUenCfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791199554; c=relaxed/simple;
	bh=axxLAE4OvAxPyb6YU8NswDtqrvOG7q5oq38HgbItThA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U5bjK83G0WIpANrG/qkWEsY1Nw0lnYI913odY90rbYYV3yj1pmdElJ9G7MZjliwYYsqj20AuIcQoez1/n5Ufvlhux3kg0Z4pKL1yZRHYOS1uFhJVl54z4ZC7KzAWe4mQfL8pgX5YToJCHsaxuSKbz01YQvlHnBX0UY8yLIbpr6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=eXi6Ed+1; arc=none smtp.client-ip=52.26.1.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="eXi6Ed+1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1791199552; x=1822735552;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zD9ZEmWuC88Ba7Ma/aUQTmf9TWVgjMo1oQU8F4ZUfO4=;
  b=eXi6Ed+1Lh6EgGcSoabL8tyzrikpPShnJsIsp2QsWxQc05RxF1SKscc3
   WXsudcB+lTONx5yUPs0RKbX9DOA/YLtglSqNrkTOzgyBqGu4QUxMrxR78
   8bHeiICZmqqYI31lEYkEXNdZu83FXVCleGAA21gphubS6SNYgcQtqHhZu
   3C9GhqaxFaYcNFxIb+GZj2kRW1HUWl/ZI7PypczHSb0X1WnX6s00iKjz1
   jeNeYLGevSRqE9TC3gknWJ6ftZPNWjg44woL9np6o/HRacFFve0Kspkud
   W7zRuYOLONrZDgEpi1upzGrRqOqT97aqS6zNYDnIrjPfitzDl4Yt+vrqE
   Q==;
X-CSE-ConnectionGUID: oQD3Zk5RS2yGbKtIRwIDGg==
X-CSE-MsgGUID: NhTUhn7wSuOVN5hQrLBKug==
X-IronPort-AV: E=Sophos;i="6.27,141,1787011200"; 
   d="scan'208";a="30463102"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:25:49 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:1358]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.47.21:2525] with esmtp (Farcaster)
 id 3e5f8292-a74b-48d4-8a30-070dc1a6d601; Mon, 5 Oct 2026 11:25:49 +0000 (UTC)
X-Farcaster-Flow-ID: 3e5f8292-a74b-48d4-8a30-070dc1a6d601
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Mon, 5 Oct 2026 11:25:48 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Mon, 5 Oct 2026
 11:25:47 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Talel Shenhar <talel@amazon.com>
CC: Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Eliav
 Farber" <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3 6/8] irqchip/al-fic: support error and fatal outputs and FIC v2
Date: Mon, 5 Oct 2026 11:24:56 +0000
Message-ID: <20261005112458.22291-7-farbere@amazon.com>
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

On v2 the error and fatal mask registers always read back as 0, regardless
of their actual contents. IRQ_GC_INIT_MASK_CACHE seeds mask_cache from the
mask register on the first child mapping, so on those two outputs it would
seed 0: every source would appear unmasked, and the first unmask would
write that 0 back and clear the whole mask register. Drop the flag for
those two outputs and seed mask_cache with the value al_fic_wire_init()
programmed instead. The info mask register is not affected, so the info
output keeps the register-seeded mask_cache.

Reading CONTROL to get the version field turns the write that follows into
a read-modify-write instead of a value built from CONTROL_MASK_MSI_X
alone. Every RW bit in this register resets to 0, so the two are
equivalent at probe time; the read-modify-write is kept anyway as the
better practice; it costs nothing and does not depend on the reset value
staying 0.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
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

 drivers/irqchip/irq-al-fic.c | 135 ++++++++++++++++++++++++++++++++---
 1 file changed, 124 insertions(+), 11 deletions(-)

diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
index 4c60da8558ed..68948d5464d4 100644
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
@@ -123,11 +157,30 @@ static int al_fic_irq_retrigger(struct irq_data *data)
 }
 
 static int al_fic_register(struct device_node *node,
-			   struct al_fic *fic)
+			   struct al_fic *fic,
+			   enum al_fic_id fic_id,
+			   enum al_fic_version version)
 {
+	enum irq_gc_flags gc_flags = IRQ_GC_INIT_MASK_CACHE;
 	struct irq_chip_generic *gc;
 	int ret;
 
+	/*
+	 * On FIC v2 the error and fatal mask registers always read back as 0,
+	 * regardless of their actual contents. IRQ_GC_INIT_MASK_CACHE seeds
+	 * mask_cache from the mask register on the first child mapping, so on
+	 * those two outputs it would seed 0 and make every source appear
+	 * unmasked - and the first unmask would then clear the whole mask
+	 * register. Suppress the seeding there and set mask_cache below to
+	 * match what al_fic_wire_init() programmed.
+	 *
+	 * The info mask register is not affected, so the info output keeps the
+	 * register-seeded mask_cache.
+	 */
+	if (version == AL_FIC_VERSION_V2 &&
+	    (fic_id == AL_FIC_ID_ERROR || fic_id == AL_FIC_ID_FATAL))
+		gc_flags = 0;
+
 	fic->domain = irq_domain_create_linear(of_fwnode_handle(node),
 					       NR_FIC_IRQS,
 					       &irq_generic_chip_ops,
@@ -147,7 +200,7 @@ static int al_fic_register(struct device_node *node,
 					     NR_FIC_IRQS,
 					     1, of_node_full_name(fic->node),
 					     handle_level_irq,
-					     0, 0, IRQ_GC_INIT_MASK_CACHE);
+					     0, 0, gc_flags);
 	if (ret) {
 		pr_err("fail to allocate generic chip (%d)\n", ret);
 		goto err_domain_remove;
@@ -155,7 +208,7 @@ static int al_fic_register(struct device_node *node,
 
 	gc = irq_get_domain_generic_chip(fic->domain, 0);
 	gc->reg_base = fic->base;
-	gc->chip_types->regs.mask = AL_FIC_MASK;
+	gc->chip_types->regs.mask = al_fic_mask_offset[fic_id];
 	gc->chip_types->regs.ack = AL_FIC_CAUSE;
 	gc->chip_types->chip.irq_mask = irq_gc_mask_set_bit;
 	gc->chip_types->chip.irq_unmask = irq_gc_mask_clr_bit;
@@ -165,6 +218,13 @@ static int al_fic_register(struct device_node *node,
 	gc->chip_types->chip.flags = IRQCHIP_SKIP_SET_WAKE;
 	gc->private = fic;
 
+	/*
+	 * Seed the mask cache the driver maintains itself, matching the mask
+	 * al_fic_wire_init() programmed (see the gc_flags comment above).
+	 */
+	if (!(gc_flags & IRQ_GC_INIT_MASK_CACHE))
+		gc->mask_cache = ~0U;
+
 	ret = request_irq(fic->parent_irq, al_fic_irq_handler,
 			  IRQF_NO_THREAD | IRQF_SHARED,
 			  of_node_full_name(fic->node), fic);
@@ -186,6 +246,8 @@ static int al_fic_register(struct device_node *node,
  * @node: pointer to the interrupt controller's device tree node
  * @base: mmio to fic register
  * @parent_irq: interrupt of parent
+ * @fic_id: which of the controller's outputs (info, error or fatal) this
+ *          group drives
  *
  * This API will configure the fic hardware to work in wire mode.
  * In wire mode, fic hardware is generating a wire ("wired") interrupt.
@@ -194,11 +256,13 @@ static int al_fic_register(struct device_node *node,
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
@@ -208,22 +272,37 @@ static struct al_fic *al_fic_wire_init(struct device_node *node,
 	fic->parent_irq = parent_irq;
 	fic->node = node;
 
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
+	ret = al_fic_register(node, fic, fic_id, version_id);
 	if (ret) {
 		pr_err("fail to register irqchip\n");
 		goto err_free;
 	}
 
-	pr_info("%pOF initialized successfully in Legacy mode (parent-irq=%u)\n",
-		node, parent_irq);
+	pr_info("%pOF initialized successfully (mask=%s parent-irq=%u)\n",
+		node, al_fic_mask_name[fic_id], parent_irq);
 
 	return fic;
 
@@ -232,11 +311,38 @@ static struct al_fic *al_fic_wire_init(struct device_node *node,
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
 
@@ -245,6 +351,12 @@ static int __init al_fic_init_dt(struct device_node *node,
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
@@ -260,7 +372,8 @@ static int __init al_fic_init_dt(struct device_node *node,
 
 	fic = al_fic_wire_init(node,
 			       base,
-			       parent_irq);
+			       parent_irq,
+			       fic_id);
 	if (IS_ERR(fic)) {
 		pr_err("%pOF: fail to initialize irqchip (%lu)\n",
 		       node, PTR_ERR(fic));
-- 
2.47.3

