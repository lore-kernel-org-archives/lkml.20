Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.1.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED7E3C416B;
	Sun, 11 Oct 2026 05:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.1.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791695117; cv=none; b=MAjc4wHUyhRazjbmPBksMWiti91fpKk+w0F5vXTUoGSjHjH8cW4d1aPrcHTVz+wjo80RZkOdbaAutlMlUSfrb4VQ9JWsp6yGNp1GQ0Vdsy1I+2mGtVQwViRXQ8+UQ+mU4dvm1mXpBc92JIsb86XiqcSOeTSO6m5jhG2wjPVqeAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791695117; c=relaxed/simple;
	bh=5UuT8WscMjjpVGTR2tiYHfKChiqBgmw2XXM9o4NUd/0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pbpwBCGIHXHpdR7zIZtAf4tGxUcaUvx6/PRsGXIIsnP2mJ3CuFbKf1q4tj4KH6yrZHayXehx3150qTyIyy9QOWolJHi2r5xRJhmbN5gF2+Wn3dkkephRf6G5rOV3rHRkiQ0b3UGselXVpRCQ4SweB4DDJtYvNgqxRxujgt8vMFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=Blld6cqj; arc=none smtp.client-ip=44.246.1.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="Blld6cqj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1791695104; x=1823231104;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Idi0f7bV8IGGEgt6QmmUD4QtY0supRYKNLx4YReMlGE=;
  b=Blld6cqjXIJpZ0mG9I3iyR/xXYdz8M2uk3KJukUhDml44QYJOoF6OJmR
   6oy5mxxGrZZH0Et8BMBarI23QrbIX8qps3iqfz6yYL1xbKDUzdPTwV6XW
   dMk87XszGXm2pZYnLfhW0GTMGqTdX52liLJdMMOF1iCd68mXKTr83nzZM
   6LhzAG25JeA7mjyazfag4i3tOA7kFUXgxqJ8mJt8y/S/Rkx8iEQ88uuSr
   Om9jMs/wvQvNt5Edv/C58+N7CNUJVDsWVflQNvT8ItM0gzSZe+CBtDY4/
   0dnG09k/dZ5h8NVF2/qaiq6JrQJIFAnKUd34arS/AvsfWAb6a0YaoXvQC
   g==;
X-CSE-ConnectionGUID: Atj8X3y7Rv+D1aMxmpxZRA==
X-CSE-MsgGUID: uaGDzyN7TZWWsB6G/O4scw==
X-IronPort-AV: E=Sophos;i="6.27,151,1787011200"; 
   d="scan'208";a="30950508"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 05:05:02 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:12734]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.13.116:2525] with esmtp (Farcaster)
 id 89023e09-dd4f-497e-842e-4f1d68f58131; Sun, 11 Oct 2026 05:05:01 +0000 (UTC)
X-Farcaster-Flow-ID: 89023e09-dd4f-497e-842e-4f1d68f58131
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Sun, 11 Oct 2026 05:05:01 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53; Sun, 11 Oct 2026
 05:04:59 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Talel Shenhar <talel@amazon.com>
CC: Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Eliav
 Farber" <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v5 4/9] irqchip/al-fic: keep the device_node instead of a cached name string
Date: Sun, 11 Oct 2026 05:04:43 +0000
Message-ID: <20261011050449.41903-5-farbere@amazon.com>
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
X-ClientProxiedBy: EX19D031UWC002.ant.amazon.com (10.13.139.212) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

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
---
v5:
 - Take a reference on the device_node where the driver stores it, and
   drop it on the error path. of_irq_init() no longer holds one past the
   init callback: commit 30724547b221 ("of/irq: Fix remaining refcount
   leaks in of_irq_init()") drops it when the parent list is drained.
 - Rewrite the commit message accordingly. It previously argued that
   of_irq_init() never drops the reference on a successful init, which is
   no longer true, and that this patch therefore fixed no lifetime bug.

v4: no change.

v3:
 - Use of_node_full_name() instead of reaching into node->full_name
   directly, as Radu Rendec suggested.
 - Rewrite the commit message to say plainly that this patch does not fix
   a lifetime bug. of_irq_init() takes a reference on the node before
   calling the driver's init callback and does not drop it on a
   successful init, so the node, and the storage node->name points into,
   is pinned for the life of the system either way. The value of keeping
   the device_node is making that dependency explicit, not closing a
   real one.

v2: new patch. Keep the device_node in struct al_fic instead of a cached
    name string that aliased node storage. Introduced here so the struct
    holds the node before the next patch requests the parent interrupt by
    node->full_name, keeping every commit buildable on its own.

 drivers/irqchip/irq-al-fic.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
index 1a7f851731b2..32d8098699a4 100644
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
+					     1, of_node_full_name(fic->node),
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
+	fic->node = of_node_get(node);
 
 	/* mask out all interrupts */
 	writel_relaxed(0xFFFFFFFF, fic->base + AL_FIC_MASK);
@@ -222,6 +220,7 @@ static struct al_fic *al_fic_wire_init(struct device_node *node,
 	return fic;
 
 err_free:
+	of_node_put(fic->node);
 	kfree(fic);
 	return ERR_PTR(ret);
 }
@@ -254,7 +253,6 @@ static int __init al_fic_init_dt(struct device_node *node,
 
 	fic = al_fic_wire_init(node,
 			       base,
-			       node->name,
 			       parent_irq);
 	if (IS_ERR(fic)) {
 		pr_err("%pOF: fail to initialize irqchip (%pe)\n",
-- 
2.47.3

