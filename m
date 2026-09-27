Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.77.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37A53BAD92;
	Sun, 27 Sep 2026 08:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.77.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790496420; cv=none; b=fpeVDAFmaO2HOhyFl4KhJchH1+qSho1LSzeGjVwzTqhkAdv+Jn/8eYBxq7Ya9oAS0ztANBJM1yUqo0r1m2XLzj5A71z10C044QnlAoq1dtoO08sp4Pw1vMmZWKIUI3k99Hujh4k9+fECfy+RlxQC0PnaM7fBxdqgMc6WCUmNYJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790496420; c=relaxed/simple;
	bh=h6CZINb9WJO989TLDU0blJ+6xJd7llToorMrBSGM+50=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SE9ePbhrXXwI3bCFOg2eP+fxo79rvBBRb/8WmUW5NBPDcej7imkzLogG9O+dRczTbFvBbS9Hx48ZA6LtgOrhEQeWFuefJsvldkobCMY4y8Bp2Z4ulbG715ExpsntCLkQKmuHKFBkuFWDZQ1nvNs8ecILiQIjvkiW20uL/IXuUO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=OCXeG2BT; arc=none smtp.client-ip=44.246.77.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="OCXeG2BT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790496418; x=1822032418;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IeA5z99jYzK+1KANuJfiONaEAN7kvCa8qUpPxcdSYII=;
  b=OCXeG2BT7E5sxvINFU7sXfzIXchnDSH3eJ8vFXE4dB8osStKdUFkWCKp
   aBrSN6jAUK7/0r9bv2BQOFeoTLGBpdOnNvJp2UH+LbwJNaHNIaP4a4ulr
   caOfFrV/Nn5S10NIpNJqwNAoPseGcqjhYJpgVP+e62git0tG02z84tQzy
   7S5xpEUvTvfQKTA5JQkZkf07unN5TncMY2KtaSynWVtwBq0MfVubfwCJg
   Tlt89WkskunTjPcEO838uM/MbqBhwRudPloAT5zUihsQ6xcnP0GV1m5Xq
   94d9BbxnSiCuhm+pAuxoOnZZ8gDWh9JzNDhcb10Nw0CHqZQDfsIV2srWj
   g==;
X-CSE-ConnectionGUID: tmDebO+ARUivJpMAEoJtiQ==
X-CSE-MsgGUID: 15d9+N5vQN+PBWW9Fud2MQ==
X-IronPort-AV: E=Sophos;i="6.27,126,1787011200"; 
   d="scan'208";a="29745380"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 08:06:49 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:10734]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.16.27:2525] with esmtp (Farcaster)
 id 1860bf96-dbb2-43f1-a3e9-3e333d901c59; Sun, 27 Sep 2026 08:06:48 +0000 (UTC)
X-Farcaster-Flow-ID: 1860bf96-dbb2-43f1-a3e9-3e333d901c59
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Sun, 27 Sep 2026 08:06:48 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Sun, 27 Sep 2026
 08:06:46 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Talel Shenhar <talel@amazon.com>
CC: Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Eliav
 Farber" <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/8] irqchip/al-fic: keep the device_node instead of a cached name string
Date: Sun, 27 Sep 2026 08:06:32 +0000
Message-ID: <20260927080637.27285-4-farbere@amazon.com>
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
X-ClientProxiedBy: EX19D038UWC003.ant.amazon.com (10.13.139.209) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

struct al_fic cached a "const char *name" that al_fic_wire_init() received
as a separate argument and set from node->name. That string was never owned
by the driver: it aliased storage inside the device_node and stayed valid
only as long as the node did, yet nothing in the struct held the node to
express that dependency. Keep the device_node in the struct instead: it
holds the owning object rather than a bare pointer into it, lets each site
derive the name on demand, and gives the driver the node it needs in the
next change, which requests the parent interrupt by the node's full_name.

The irqchip callback that has no device_node in scope now prints the
instance with %pOF, which formats the node on demand, and the name argument
threaded through al_fic_wire_init() goes away.

irq_alloc_domain_generic_chips() keeps the pointer it is given, so it now
uses node->full_name. This changes the generic chip name from the bare
node name (e.g. "interrupt-controller") to the full node name including
its unit address (e.g. "interrupt-controller@fd8a8500"), which keeps
instances that share a bare name distinguishable.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
v2: new patch. Keep the device_node in struct al_fic instead of a cached
    name string that aliased node storage. Introduced here so the struct
    holds the node before the next patch requests the parent interrupt by
    node->full_name, keeping every commit buildable on its own.

 drivers/irqchip/irq-al-fic.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
index 760bd08dcff4..c7cc2631caf8 100644
--- a/drivers/irqchip/irq-al-fic.c
+++ b/drivers/irqchip/irq-al-fic.c
@@ -36,7 +36,7 @@ enum al_fic_state {
 struct al_fic {
 	void __iomem *base;
 	struct irq_domain *domain;
-	const char *name;
+	struct device_node *node;
 	unsigned int parent_irq;
 	enum al_fic_state state;
 };
@@ -89,7 +89,7 @@ static int al_fic_irq_set_type(struct irq_data *data, unsigned int flow_type)
 	if (fic->state == AL_FIC_UNCONFIGURED) {
 		al_fic_set_trigger(fic, gc, new_state);
 	} else if (fic->state != new_state) {
-		pr_debug("fic %s state already configured to %d\n", fic->name, fic->state);
+		pr_debug("fic %pOF state already configured to %d\n", fic->node, fic->state);
 		return -EINVAL;
 	}
 	return 0;
@@ -142,7 +142,7 @@ static int al_fic_register(struct device_node *node,
 
 	ret = irq_alloc_domain_generic_chips(fic->domain,
 					     NR_FIC_IRQS,
-					     1, fic->name,
+					     1, fic->node->full_name,
 					     handle_level_irq,
 					     0, 0, IRQ_GC_INIT_MASK_CACHE);
 	if (ret) {
@@ -175,9 +175,8 @@ static int al_fic_register(struct device_node *node,
 
 /*
  * al_fic_wire_init() - initialize and configure fic in wire mode
- * @of_node: optional pointer to interrupt controller's device tree node.
+ * @node: pointer to the interrupt controller's device tree node
  * @base: mmio to fic register
- * @name: name of the fic
  * @parent_irq: interrupt of parent
  *
  * This API will configure the fic hardware to work in wire mode.
@@ -187,7 +186,6 @@ static int al_fic_register(struct device_node *node,
  */
 static struct al_fic *al_fic_wire_init(struct device_node *node,
 				       void __iomem *base,
-				       const char *name,
 				       unsigned int parent_irq)
 {
 	struct al_fic *fic;
@@ -200,7 +198,7 @@ static struct al_fic *al_fic_wire_init(struct device_node *node,
 
 	fic->base = base;
 	fic->parent_irq = parent_irq;
-	fic->name = name;
+	fic->node = node;
 
 	/* mask out all interrupts */
 	writel_relaxed(0xFFFFFFFF, fic->base + AL_FIC_MASK);
@@ -254,7 +252,6 @@ static int __init al_fic_init_dt(struct device_node *node,
 
 	fic = al_fic_wire_init(node,
 			       base,
-			       node->name,
 			       parent_irq);
 	if (IS_ERR(fic)) {
 		pr_err("%pOF: fail to initialize irqchip (%lu)\n",
-- 
2.47.3

