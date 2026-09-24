Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.77.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC04418376;
	Thu, 24 Sep 2026 06:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.77.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790231009; cv=none; b=AYK9eG9sEvJ6HBBVn+JJLb3cRVrm+uEqWxBgM0S/zbFHBLVY5luIoK9jdjfkvnKcco7bp5aVjRRxjiytiKtovLsDbVARUBDO4VIwUGBoYahTNQqy22YnM9LXB7OE2yX4LCfNHv2bDiabfW23MWCBOObAs5zp2vmxgOplCm41cRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790231009; c=relaxed/simple;
	bh=TrVlGRX7xNTwtllA9fYcrOQcQdLnp78koGIP7Ah1/RI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FEwOezm9wG4sA2lnB4mZfF8yzK9h/Cg+W2zzDgC8K6TYB5ar0CJKoZ2wLyTXxSAsE1Ve0V6/S644wX28WW8+638+BeC0IGQN9H9e2nurAgLbu3EotQTEiqG/aTejUzX62Qoy12IplkNbrjg5VjwxU+R1B5MQAwfnkMB0qiL6Fos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=UcohWl6a; arc=none smtp.client-ip=44.246.77.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="UcohWl6a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790231007; x=1821767007;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yn36i2r7jwhVSfsubNIQzvXeED8I8uv1J1ap9x4z3nQ=;
  b=UcohWl6ayY5ipmStHtAWP047CvU2f1R/cztia5JzZ48PILvZWPxvsePy
   Uu2ca+5RmQw92HWcq+LT9Zu/LjFrW8zxC3MfUf6WA4KjPxRQo51MFeruM
   ulpGwB69Uni6HyzYxcmPO2SPWJoaxO7DFdofVEBqLN6X+k0C8CgTn18VG
   nzQXAq8mMhYDHgKo57jGLjXqmzqqI+jvaDKGCEOE7Uj6hiBpC2pGoAw+4
   Fr0evdokoD4SWD8u8896yL856LxaEa7vpHPDH2y6NHyvFXkXlPRPOY0mp
   MHJJ4f8Cpeu5JpRU6BL8UXYlhUWLaZ/abRYMpnHEIh+RACy3vuH4fmKZ7
   A==;
X-CSE-ConnectionGUID: 4/WuFFm5R/iE5HhdFNOsUw==
X-CSE-MsgGUID: epBBodYST86sChxUv9ZBxQ==
X-IronPort-AV: E=Sophos;i="6.27,120,1787011200"; 
   d="scan'208";a="29505642"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 06:23:24 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:8811]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.15.186:2525] with esmtp (Farcaster)
 id aca717c0-2497-44dc-8e87-705134b9bc48; Thu, 24 Sep 2026 06:23:23 +0000 (UTC)
X-Farcaster-Flow-ID: aca717c0-2497-44dc-8e87-705134b9bc48
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Thu, 24 Sep 2026 06:23:23 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Thu, 24 Sep 2026
 06:23:21 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Talel Shenhar <talel@amazon.com>
CC: Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Eliav
 Farber" <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 4/6] irqchip/al-fic: add support for FIC v2
Date: Thu, 24 Sep 2026 06:23:09 +0000
Message-ID: <20260924062311.37308-5-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260924062311.37308-1-farbere@amazon.com>
References: <20260924062311.37308-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D040UWB002.ant.amazon.com (10.13.138.89) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

FIC v2 hardware adds two additional interrupt groups on top of the
legacy group: an "error" group and a "fatal" group, each with its own
mask register (AL_FIC_ERROR_MASK, AL_FIC_FATAL_MASK). A single FIC
instance exposes one of these groups, selected by the compatible string.

Detect the hardware version from the CONTROL register version id field
(bits 28-29) and, on v2, mask out the error and fatal groups during
initialization.

The driver now distinguishes the three groups via enum al_fic_id, wired
up through three IRQCHIP_DECLARE entries:

  amazon,al-fic         - legacy group (existing, unchanged behaviour)
  amazon,al-fic-error   - error group  (v2+)
  amazon,al-fic-fatal   - fatal group  (v2+)

Requesting an error/fatal group on a v1 device is rejected.

On v2 the error and fatal mask registers always read back as 0,
regardless of their actual contents, so IRQ_GC_INIT_MASK_CACHE seeds
mask_cache with 0 and makes every source appear unmasked on the next
access. Since al_fic_wire_init() has already masked all sources, override
mask_cache to match for these two groups and let the driver maintain it.
The legacy mask register is not affected, so the legacy group keeps the
register-seeded mask_cache.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
 drivers/irqchip/irq-al-fic.c | 101 ++++++++++++++++++++++++++++++-----
 1 file changed, 89 insertions(+), 12 deletions(-)

diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
index 9cf3eedac97f..90a64350be63 100644
--- a/drivers/irqchip/irq-al-fic.c
+++ b/drivers/irqchip/irq-al-fic.c
@@ -16,11 +16,14 @@
 /* FIC Registers */
 #define AL_FIC_CAUSE		0x00
 #define AL_FIC_SET_CAUSE	0x08
-#define AL_FIC_MASK		0x10
+#define AL_FIC_LEGACY_MASK	0x10
 #define AL_FIC_CONTROL		0x28
+#define AL_FIC_ERROR_MASK	0x2c
+#define AL_FIC_FATAL_MASK	0x34
 
 #define CONTROL_TRIGGER_RISING	BIT(3)
 #define CONTROL_MASK_MSI_X	BIT(5)
+#define CONTROL_VERSION_ID	GENMASK(29, 28)
 
 #define NR_FIC_IRQS 32
 
@@ -33,12 +36,32 @@ enum al_fic_state {
 	AL_FIC_CONFIGURED_RISING_EDGE,
 };
 
+enum al_fic_version {
+	AL_FIC_VERSION_V1,
+	AL_FIC_VERSION_V2,
+};
+
+enum al_fic_id {
+	AL_FIC_ID_LEGACY,
+	AL_FIC_ID_ERROR,
+	AL_FIC_ID_FATAL,
+	AL_FIC_ID_MAX,		/* keep last */
+};
+
+/* Mask register offset for each interrupt group */
+static const unsigned int al_fic_mask_offset[AL_FIC_ID_MAX] = {
+	[AL_FIC_ID_LEGACY] = AL_FIC_LEGACY_MASK,
+	[AL_FIC_ID_ERROR]  = AL_FIC_ERROR_MASK,
+	[AL_FIC_ID_FATAL]  = AL_FIC_FATAL_MASK,
+};
+
 struct al_fic {
 	void __iomem *base;
 	struct irq_domain *domain;
 	const char *name;
 	unsigned int parent_irq;
 	enum al_fic_state state;
+	enum al_fic_version version;
 };
 
 static void al_fic_set_trigger(struct al_fic *fic,
@@ -126,7 +149,8 @@ static int al_fic_irq_retrigger(struct irq_data *data)
 }
 
 static int al_fic_register(struct device_node *node,
-			   struct al_fic *fic)
+			   struct al_fic *fic,
+			   enum al_fic_id fic_id)
 {
 	struct irq_chip_generic *gc;
 	int ret;
@@ -152,7 +176,7 @@ static int al_fic_register(struct device_node *node,
 
 	gc = irq_get_domain_generic_chip(fic->domain, 0);
 	gc->reg_base = fic->base;
-	gc->chip_types->regs.mask = AL_FIC_MASK;
+	gc->chip_types->regs.mask = al_fic_mask_offset[fic_id];
 	gc->chip_types->regs.ack = AL_FIC_CAUSE;
 	gc->chip_types->chip.irq_mask = irq_gc_mask_set_bit;
 	gc->chip_types->chip.irq_unmask = irq_gc_mask_clr_bit;
@@ -162,6 +186,20 @@ static int al_fic_register(struct device_node *node,
 	gc->chip_types->chip.flags = IRQCHIP_SKIP_SET_WAKE;
 	gc->private = fic;
 
+	/*
+	 * On FIC v2 the error and fatal mask registers always read back as 0,
+	 * regardless of their actual contents, so IRQ_GC_INIT_MASK_CACHE seeds
+	 * mask_cache with 0 and makes every source appear unmasked on the next
+	 * access. al_fic_wire_init() has already masked all sources, so override
+	 * mask_cache to match and let the driver maintain it from here.
+	 *
+	 * The legacy mask register is not affected, and the erratum is fixed
+	 * from v3 onwards, so those paths keep the register-seeded mask_cache.
+	 */
+	if (fic->version == AL_FIC_VERSION_V2 &&
+	    (fic_id == AL_FIC_ID_ERROR || fic_id == AL_FIC_ID_FATAL))
+		gc->mask_cache = 0xFFFFFFFF;
+
 	ret = request_irq(fic->parent_irq, al_fic_irq_handler,
 			  IRQF_NO_THREAD | IRQF_SHARED, fic->name, fic);
 	if (ret) {
@@ -194,11 +232,13 @@ static int al_fic_register(struct device_node *node,
 static struct al_fic *al_fic_wire_init(struct device_node *node,
 				       void __iomem *base,
 				       const char *name,
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
@@ -208,22 +248,37 @@ static struct al_fic *al_fic_wire_init(struct device_node *node,
 	fic->parent_irq = parent_irq;
 	fic->name = name;
 
+	control = readl_relaxed(fic->base + AL_FIC_CONTROL);
+	version_id = FIELD_GET(CONTROL_VERSION_ID, control);
+	fic->version = version_id;
+	if (version_id == AL_FIC_VERSION_V1 && fic_id != AL_FIC_ID_LEGACY) {
+		pr_err("%s unexpected fic id (%d)\n", fic->name, fic_id);
+		ret = -EINVAL;
+		goto err_free;
+	}
+
 	/* mask out all interrupts */
-	writel_relaxed(0xFFFFFFFF, fic->base + AL_FIC_MASK);
+	writel_relaxed(0xFFFFFFFF, fic->base + AL_FIC_LEGACY_MASK);
+	if (version_id > AL_FIC_VERSION_V1) {
+		writel_relaxed(0xFFFFFFFF, fic->base + AL_FIC_ERROR_MASK);
+		writel_relaxed(0xFFFFFFFF, fic->base + AL_FIC_FATAL_MASK);
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
 
-	pr_info("%s initialized successfully in Legacy mode (parent-irq=%u)\n",
-		fic->name, parent_irq);
+	pr_info("%s initialized successfully (fic_id=%d parent-irq=%u)\n",
+		fic->name, fic_id, parent_irq);
 
 	return fic;
 
@@ -233,7 +288,8 @@ static struct al_fic *al_fic_wire_init(struct device_node *node,
 }
 
 static int __init al_fic_init_dt(struct device_node *node,
-				 struct device_node *parent)
+				 struct device_node *parent,
+				 enum al_fic_id fic_id)
 {
 	int ret;
 	void __iomem *base;
@@ -262,7 +318,8 @@ static int __init al_fic_init_dt(struct device_node *node,
 	fic = al_fic_wire_init(node,
 			       base,
 			       node->full_name,
-			       parent_irq);
+			       parent_irq,
+			       fic_id);
 	if (IS_ERR(fic)) {
 		pr_err("%s: fail to initialize irqchip (%lu)\n",
 		       node->full_name,
@@ -281,4 +338,24 @@ static int __init al_fic_init_dt(struct device_node *node,
 	return ret;
 }
 
-IRQCHIP_DECLARE(al_fic, "amazon,al-fic", al_fic_init_dt);
+static int __init al_fic_init_dt_legacy(struct device_node *node,
+					struct device_node *parent)
+{
+	return al_fic_init_dt(node, parent, AL_FIC_ID_LEGACY);
+}
+
+static int __init al_fic_init_dt_error(struct device_node *node,
+				       struct device_node *parent)
+{
+	return al_fic_init_dt(node, parent, AL_FIC_ID_ERROR);
+}
+
+static int __init al_fic_init_dt_fatal(struct device_node *node,
+				       struct device_node *parent)
+{
+	return al_fic_init_dt(node, parent, AL_FIC_ID_FATAL);
+}
+
+IRQCHIP_DECLARE(al_fic_legacy, "amazon,al-fic", al_fic_init_dt_legacy);
+IRQCHIP_DECLARE(al_fic_error, "amazon,al-fic-error", al_fic_init_dt_error);
+IRQCHIP_DECLARE(al_fic_fatal, "amazon,al-fic-fatal", al_fic_init_dt_fatal);
-- 
2.47.3

