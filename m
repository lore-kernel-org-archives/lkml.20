Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.34.181.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCED64657E0;
	Thu,  8 Oct 2026 09:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.34.181.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450072; cv=none; b=g12KWhn4H9KIiiuI1Ykh+UIXzsOn0poAuzkWIjwIyxcgR8zSenGIa7v1p8ojNtoJ4YV4l3VqN/AtxMKOTszOAg5WsazbFPcaYtDug3pmY3ahXtAdjagjDBLfBFxX8ptvebDW+wxlcIJqXemJ4I6TY0sb8Jrhbr/5Zc848OPBxP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450072; c=relaxed/simple;
	bh=ZVevTM2bRNgXKNauip9sFy8E71ypdqfe0VTTTfi0qw0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LlZnzdjq4URXE/bwn89EjREIN/3naoiPfefVo1MxFZysbw7VQf+fqlARKmLF2JONDUJAnXB6ZBTyf0RPq8KeVhwqGr1pcSJymsoPAB+X/pw/P0tL2wsUPQZze33udbxfIU/Qay1RSKg7+kHHG8tQh+0QoiwBPdwGRsjRLQj/bQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=a+anjmab; arc=none smtp.client-ip=52.34.181.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="a+anjmab"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1791450070; x=1822986070;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=P+soB9Y9hTAGxUp2NFTQMkrnz9Ksg8tMJ1A+fjs8VCo=;
  b=a+anjmabeNlIffbzMbhHMFYpnbqD2joqyfxj8zKLGMkyLDCc5+0zxxn6
   wuw2B6WpTmUvOm+bd2bxbML7WFgYu9VNDoU8GL4Fs9mRm7bmgWnOLu96F
   uCYetnR/1xJSF33R0sR/sxvhKhQnw/EVXszUtE09KvKp7qj6oIxb25Who
   IkRdAV4Cc+BLQNFkiB1ZLNedckz3keocaRzSxNe8DWv8bvKL9VNVx0A2s
   qmBcGHAPS+KAWmHChtHc1gRg3eXQtF45OtkOItBcwQFk3COJbe8pF/K67
   eFCfeR4X6VPKA89b0bjV/QgEWyOpaRGdRluDfKZD4riN8IGusOZGOYZVM
   w==;
X-CSE-ConnectionGUID: Gv/ZGQhCSiu+eg/Xx/y40w==
X-CSE-MsgGUID: erHUsNAwRzS4F5Rd9kdPYA==
X-IronPort-AV: E=Sophos;i="6.27,146,1787011200"; 
   d="scan'208";a="30709619"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 09:01:10 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:31701]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.51.61:2525] with esmtp (Farcaster)
 id 13d2b186-75d8-458d-823b-9a778be9d2ff; Thu, 8 Oct 2026 09:01:10 +0000 (UTC)
X-Farcaster-Flow-ID: 13d2b186-75d8-458d-823b-9a778be9d2ff
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Thu, 8 Oct 2026 09:01:10 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Thu, 8 Oct 2026
 09:01:08 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Talel Shenhar <talel@amazon.com>
CC: Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Eliav
 Farber" <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v4 3/8] irqchip/al-fic: keep the device_node instead of a cached name string
Date: Thu, 8 Oct 2026 09:00:53 +0000
Message-ID: <20261008090058.38591-4-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261008090058.38591-1-farbere@amazon.com>
References: <20261008090058.38591-1-farbere@amazon.com>
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

struct al_fic cached a "const char *name" that al_fic_wire_init() received
as a separate argument and set from node->name. That string aliased
storage inside the device_node rather than being owned by the driver, but
nothing in the struct expressed that dependency - al_fic just held a bare
pointer with no indication of what it pointed into or why it stayed valid.

This is not fixing a lifetime bug - of_irq_init() takes a reference on
the node before calling the driver's init callback and never drops it on
a successful init, so the node is pinned for the life of the system
either way, and node->name was never actually at risk of dangling.

Keeping the device_node in the struct instead of the bare name is about
making the dependency explicit rather than closing a real one: it holds
the object the name is derived from, and lets each site derive the name
on demand instead of carrying a pointer whose validity nothing in the
struct asserts.

The irqchip callback that has no device_node in scope now prints the
instance with %pOF, which formats the node on demand, and the name argument
threaded through al_fic_wire_init() goes away.

irq_alloc_domain_generic_chips() keeps the pointer it is given, so it now
uses of_node_full_name(). This changes the generic chip name from the bare
node name (e.g. "interrupt-controller") to the full node name including
its unit address (e.g. "interrupt-controller@fd8a8500"), which keeps
instances that share a bare name distinguishable.

Signed-off-by: Eliav Farber <farbere@amazon.com>
Reviewed-by: Radu Rendec <radu@rendec.net>
---
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

 drivers/irqchip/irq-al-fic.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
index 760bd08dcff4..ee06d0123b7a 100644
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

