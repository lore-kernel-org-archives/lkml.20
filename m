Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.162.73.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0702E401;
	Mon,  5 Oct 2026 11:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.162.73.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791199515; cv=none; b=mnubU0rZDS3SjjkicyEfWUfIUh83gou/Q5tsEMJflMPrnpb21AGH6n2FRrvhhfpvpJXgUQ27i2DJOP63cYhdnzqTSu5FvIGPRK/Wk16qldPsLWso4UGOGVDlJcQcOngRVPL9tw7Mc+d53AC95WQNLOi4JQcOyOQ5Jl2dB0oMcn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791199515; c=relaxed/simple;
	bh=9sQanoGatrUxWQK8fe7jlY1Kur21DL+2mYZayq0WqV0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mtug0+lGWWyXVle4i+xxqi5vjVUd1Ku8osJm2jmn0njx5Cs+ohmOnxiZf4zWCe7P28Dm/uXgNXpZY4/ls7MEldr5pKKciujaRnxZkqlK7jQrelaSX5QIFlhoZRDuwKtZ9mcY+OiXtEcUi+vATgq8w3lCkDoSVbYrA4pOPmge2TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=ZV9mBSPj; arc=none smtp.client-ip=35.162.73.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="ZV9mBSPj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1791199513; x=1822735513;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DPQK3j3cTLHcegb4rnkZGuAOmGISkeATPG4ewIppAqA=;
  b=ZV9mBSPjNvbDNoWAkuzLzEr/BI9IrdobdxwN12G9H+O8qhwvhjDT+pCX
   bQi7KOU43aakTPX5ZqPVDJ8hWLraWHraQ22M+yytxe2GZKHsWzfBl4gnR
   Sc4YD7ZuLeAf2pNbLS+06dMHQ3uLTrYRlfN+ndDagk8nPzltV8S+TcwEC
   r/G1YW4cNPFColVRqL6jrd41o7TMcLdbaWM7SB/6aNP/F93CeUi4lsWQ4
   ATlbUtfk44OD66Ec0IxyKQKgfHZdC1c50bwbTQDAVKoLBlQ/thp8MjUN9
   iRzujS3YcHrRqkbxX3jXvdjGo0ApHEdF8QkgjBC5FVvlP4zWQtUalqxmz
   A==;
X-CSE-ConnectionGUID: 5Wrq8AqjTsGwzrJRGEHcrQ==
X-CSE-MsgGUID: lw8uPIHtSC+A7nnRBUmw1A==
X-IronPort-AV: E=Sophos;i="6.27,141,1787011200"; 
   d="scan'208";a="30227564"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:25:09 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:8807]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.37.83:2525] with esmtp (Farcaster)
 id 4f7fc473-dfb3-4f79-b495-2dd45f577288; Mon, 5 Oct 2026 11:25:09 +0000 (UTC)
X-Farcaster-Flow-ID: 4f7fc473-dfb3-4f79-b495-2dd45f577288
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Mon, 5 Oct 2026 11:25:09 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Mon, 5 Oct 2026
 11:25:07 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Talel Shenhar <talel@amazon.com>
CC: Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Eliav
 Farber" <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3 3/8] irqchip/al-fic: keep the device_node instead of a cached name string
Date: Mon, 5 Oct 2026 11:24:53 +0000
Message-ID: <20261005112458.22291-4-farbere@amazon.com>
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
X-ClientProxiedBy: EX19D039UWA001.ant.amazon.com (10.13.139.110) To
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
---
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

