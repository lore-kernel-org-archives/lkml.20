Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792868859;
	b=GImY5Ml20sjFSu/D3in5Yjm9+vLFBGbYFahHSeKFLjgll7qPdOACgA5cvoMElSGkXO5x
	 hYuEi2cZSwWu2DCka0RV4gAEc/vH/2fkfemcJYBoxqc5/0K82ol/JpPnKlkevl9ADi9ZR
	 ByeBYoZf3R4/9unt7EqkzB/sq/f8j3zCQ8Df3lwjlDTFKLbFszH3UYZprVq+qIEGkU2Jo
	 HVOnAwV/iCZtdU26RlJQ+XFC6OgQX3epoUkroG+GFqT8F6TXAreC2Flk1l/1mUfHXrynQ
	 43XQsAbpBv19T9//xBiqcuFEpIPgRCfUmL++e/JMQSxKTtV4RpDeFfzXs+9prMXYlBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792868859;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=dscSOc4wXv4rqjBBHRKQ1lpGGhTgMmohkttLGkLRrYc=;
	b=LOAiQR0xARVMypsa31zGkIb5cNzQVCqY8kl4Uw+AbXn0XER+F2+KjI8m29OiZ+xvqqx4
	 17B2CjH1D8kBcHrK3QWBFJBZo4ONGyUuw5GsC5yGp1QlPRi2VA3iPG6d90v1tzLDcI60k
	 AtDxP5rhRu6+JUDjc1G6zAXMiy9sZBcwjwTMO1o79Mc+g3ZSbg7QX3JrnKBbMl9453aRr
	 p+sU1wE9/JYhLNVOwudEALFPgAIXAgTteQ6G/ATOhniUB6hBsM5ESSVp2oxK3QMGh+sMo
	 cHNgQvj+TXUIhGdKtF7pMMD4SgRw0W3ECZxGJDJ1WvroriOTh/Qb7vhWTOQ+MAZe42w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QjvgL409;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CBC606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QjvgL409
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CCF31F01828;
	Sat, 24 Oct 2026 19:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792868858;
	bh=dscSOc4wXv4rqjBBHRKQ1lpGGhTgMmohkttLGkLRrYc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QjvgL409U++4546oq4u2khWxMjwP4nVSl578yOHefIw0n8w7rvouTst69VWHN5niE
	 tWiWKtBYrN8EZ64eHoPvq1VbruRDIC2jUrKzY8HdgI0ZETQ9/FEADVQq4dRZ0VL+S6
	 Itcdmqaaq2pa0th6qP/SIGGHiCjLUaAO16fILn2gr9QvCNRjPvMkpi3NKpgFr9SWET
	 +nh+UwA/ZaCzgA5Ebe+jGkJx6uL0wKqH97qxsFlEfXauR4EOlpVKDDbYnYD/0HPhHC
	 JJ5FWFEvV9JfUkdIRA6rpqGzbtJfg545JpTzbNsFk+muOGPI+9deNsuw7xGj5k/CQt
	 VIIizZfTtaWuA==
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Date: Sat, 24 Oct 2026 21:07:23 +0200
Subject: [PATCH RFC v2 1/8] mm, slab: refactor slab_min/max_order handling
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-slub_tiny_rework-v2-1-bf1419ab5ffd@kernel.org>
References: <20261024-slub_tiny_rework-v2-0-bf1419ab5ffd@kernel.org>
In-Reply-To: <20261024-slub_tiny_rework-v2-0-bf1419ab5ffd@kernel.org>
To: Harry Yoo <harry@kernel.org>
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
 David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Conor Dooley <conor@kernel.org>, 
 Damien Le Moal <dlemoal@kernel.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
X-Mailer: b4 0.16.0

Setting slab_min_order and slab_max_order as boot-time parameters
currently has several not so great aspects:

- slab_min_order is not checked against MAX_PAGE_ORDER
- slab_min_order can raise slab_max_order
- processing requires custom callbacks, their execution order
  depends on the order of boot time parameters specified
- upcoming SLUB_TINY changes would be more complicated

Instead of custom callbacks, introduce __initdata variables that hold
the boot-time parameter values (if given). All inputs are then evaluated
deterministically in kmem_cache_init(). slab_min_order is always capped
at slab_max_order and cannot raise it.

debug_guardpage_minorder() still overrides any given boot time params,
but it could be changed if there's a use case.

While at it, rename the slub_min/max_order variables and
slub_min_objects to have a "slab_" prefix instead, as their values
determine the sizing of slabs, and the "slub_" prefix already became
deprecated also for the boot-time parameters.

Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
---
 mm/slub.c | 84 ++++++++++++++++++++++++---------------------------------------
 1 file changed, 32 insertions(+), 52 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index 45e077c7526c..30714557306d 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -7684,10 +7684,17 @@ EXPORT_SYMBOL(kmem_cache_alloc_bulk_noprof);
  * and increases the number of allocations possible without having to
  * take the list_lock.
  */
-static unsigned int slub_min_order;
-static unsigned int slub_max_order =
+static unsigned int slab_min_order;
+static unsigned int slab_max_order =
 	IS_ENABLED(CONFIG_SLUB_TINY) ? 1 : PAGE_ALLOC_COSTLY_ORDER;
-static unsigned int slub_min_objects;
+static unsigned int slab_min_objects;
+
+/*
+ * Store values set by boot-time parameters, to be evaluated in
+ * kmem_cache_init(). UINT_MAX means they were not set, as 0 is a valid value.
+ */
+static unsigned int slab_min_order_param __initdata = UINT_MAX;
+static unsigned int slab_max_order_param __initdata = UINT_MAX;
 
 /*
  * Calculate the order of allocation given an slab object size.
@@ -7741,7 +7748,7 @@ static inline int calculate_order(unsigned int size)
 	unsigned int max_objects;
 	unsigned int min_order;
 
-	min_objects = slub_min_objects;
+	min_objects = slab_min_objects;
 	if (!min_objects) {
 		/*
 		 * Some architectures will only update present cpus when
@@ -7758,10 +7765,10 @@ static inline int calculate_order(unsigned int size)
 		min_objects = 4 * (fls(nr_cpus) + 1);
 	}
 	/* min_objects can't be 0 because get_order(0) is undefined */
-	max_objects = max(order_objects(slub_max_order, size), 1U);
+	max_objects = max(order_objects(slab_max_order, size), 1U);
 	min_objects = min(min_objects, max_objects);
 
-	min_order = max_t(unsigned int, slub_min_order,
+	min_order = max_t(unsigned int, slab_min_order,
 			  get_order(min_objects * size));
 	if (order_objects(min_order, size) > MAX_OBJS_PER_PAGE)
 		return get_order(size * MAX_OBJS_PER_PAGE) - 1;
@@ -7782,9 +7789,9 @@ static inline int calculate_order(unsigned int size)
 	 * long as at least single object fits within slab_max_order.
 	 */
 	for (unsigned int fraction = 16; fraction > 1; fraction /= 2) {
-		order = calc_slab_order(size, min_order, slub_max_order,
+		order = calc_slab_order(size, min_order, slab_max_order,
 					fraction);
-		if (order <= slub_max_order)
+		if (order <= slab_max_order)
 			return order;
 	}
 
@@ -8355,50 +8362,14 @@ void __kmem_obj_info(struct kmem_obj_info *kpp, void *object, struct slab *slab)
  *		Kmalloc subsystem
  *******************************************************************/
 
-static int __init setup_slub_min_order(const char *str, const struct kernel_param *kp)
-{
-	int ret;
-
-	ret = kstrtouint(str, 0, &slub_min_order);
-	if (ret)
-		return ret;
+core_param(slab_min_order, slab_min_order_param, uint, 0);
+core_param(slub_min_order, slab_min_order_param, uint, 0);
 
-	if (slub_min_order > slub_max_order)
-		slub_max_order = slub_min_order;
+core_param(slab_max_order, slab_max_order_param, uint, 0);
+core_param(slub_max_order, slab_max_order_param, uint, 0);
 
-	return 0;
-}
-
-static const struct kernel_param_ops param_ops_slab_min_order __initconst = {
-	.set = setup_slub_min_order,
-};
-__core_param_cb(slab_min_order, &param_ops_slab_min_order, &slub_min_order, 0);
-__core_param_cb(slub_min_order, &param_ops_slab_min_order, &slub_min_order, 0);
-
-static int __init setup_slub_max_order(const char *str, const struct kernel_param *kp)
-{
-	int ret;
-
-	ret = kstrtouint(str, 0, &slub_max_order);
-	if (ret)
-		return ret;
-
-	slub_max_order = min_t(unsigned int, slub_max_order, MAX_PAGE_ORDER);
-
-	if (slub_min_order > slub_max_order)
-		slub_min_order = slub_max_order;
-
-	return 0;
-}
-
-static const struct kernel_param_ops param_ops_slab_max_order __initconst = {
-	.set = setup_slub_max_order,
-};
-__core_param_cb(slab_max_order, &param_ops_slab_max_order, &slub_max_order, 0);
-__core_param_cb(slub_max_order, &param_ops_slab_max_order, &slub_max_order, 0);
-
-core_param(slab_min_objects, slub_min_objects, uint, 0);
-core_param(slub_min_objects, slub_min_objects, uint, 0);
+core_param(slab_min_objects, slab_min_objects, uint, 0);
+core_param(slub_min_objects, slab_min_objects, uint, 0);
 
 #ifdef CONFIG_NUMA
 static int __init setup_slab_strict_numa(const char *str, const struct kernel_param *kp)
@@ -8771,8 +8742,17 @@ void __init kmem_cache_init(void)
 
 	slab_obj_ext_has_codetag_init();
 
+	if (slab_max_order_param <= MAX_PAGE_ORDER)
+		slab_max_order = slab_max_order_param;
+
+	if (slab_min_order_param <= MAX_PAGE_ORDER)
+		slab_min_order = slab_min_order_param;
+
 	if (debug_guardpage_minorder())
-		slub_max_order = 0;
+		slab_max_order = 0;
+
+	if (slab_min_order > slab_max_order)
+		slab_min_order = slab_max_order;
 
 	/* Inform pointer hashing choice about slub debugging state. */
 	hash_pointers_finalize(__slub_debug_enabled());
@@ -8823,7 +8803,7 @@ void __init kmem_cache_init(void)
 
 	pr_info("SLUB: HWalign=%d, Order=%u-%u, MinObjects=%u, CPUs=%u, Nodes=%u\n",
 		cache_line_size(),
-		slub_min_order, slub_max_order, slub_min_objects,
+		slab_min_order, slab_max_order, slab_min_objects,
 		nr_cpu_ids, nr_node_ids);
 }
 

-- 
2.56.0

