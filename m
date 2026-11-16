Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794811649;
	b=IwQ/wF+qmzcV2xab12QZ8B14OnHMAmLibeEQPO0MI9g7USMTsE5Ufeaixik3/ZqdKNvf
	 o/CWpYfeGIk4PdgUE3ypZPEfpZAA1j9noumNNkaZfdZfqlTAOnJffXxvvx4+OCfYO7ZOV
	 skzjNEgZuH1tLcnW3MmPQGNydgha7TFRe3yaucsUt8X/7bVLrWFrjByYk3HON/+Aauh3B
	 /m7IZyts5fhcPg0m/wPBX6Iyvi4lf0r+KmaSqNKVfHctqfs+aMoPhS3Cit/IxDNg8iheg
	 1R+Hkv1Zk8Lq0T9EAD1d6C0o20siTB2WtJ8Ovtee5+vYbRh0OVtfSeg/zJk6+wFlQZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794811649;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=gc5nVXFmpa2FYzNpiPky+TSsIO9QRIgf+0xNVO2950I=;
	b=VHVNKee3YZs0xn2jBXthLhT27kGShhKW19y0GbVCs/eShqm75NGV0rxAC6M8oBDd+rEi
	 0GTHX9/qnYUWOlZejEJYcCOyuNjnsVqOap+/p84DNPHrTt2PySooZHHVm85HF8jsm3bCw
	 UTOjrbRdvuEhp1eX9nK6wDJlTpfNELSw338vBhb6r2niPm6DD3BTfG8wH0agGcj7+st1w
	 HXfS4O814c9xOX2g49JxFHEi/E8knR3CiOLIBQx2lh3yqYgxUMK6LtErC73hLCr13Me/i
	 02L6A64iCv+eWeSBdKe1mweN1IuZJJvJ6cVkhbF8MkL+ljULKYOMUcGTfwXpsrSLcMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O5dD2v5y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0936606A335
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O5dD2v5y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2637F1F000C5;
	Mon, 16 Nov 2026 06:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794811649;
	bh=gc5nVXFmpa2FYzNpiPky+TSsIO9QRIgf+0xNVO2950I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=O5dD2v5yu5J8xhy7sLPwd8o1ZenNXCLx3LgiAqlz+xblx0jU5kst8YgL1FzGksOMI
	 Cdmw+8t33N9Lr2RFsL7lc4pfxDksNxt/p+GEvfl1tdhkKJ1c6nUk3OBNbJ19E5cYLA
	 /EiT2QwT6tHdhFxSWoRSONfUznDnKd7SIl8H4vhCJyPHDjrloiq7/CLzTyBH8cpIIn
	 EW04UJZPD4cUPBJNk36PRasfzLGgs0UdabevdEy+Nt5SoALqKxqtkNryrDqwkPIXjt
	 qmQppbrnNfmObfSslu6C6MCui7Y8obF7XEWUGD+rkGdYUowoq5vXboe0GrhxtZvvoj
	 FyL24kkvR9HeQ==
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Date: Mon, 16 Nov 2026 07:47:11 +0100
Subject: [PATCH v4 03/10] mm, slab: refactor slab_min/max_order handling
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
Message-Id: <20261116-slub_tiny_rework-v4-3-227a4b3636a5@kernel.org>
References: <20261116-slub_tiny_rework-v4-0-227a4b3636a5@kernel.org>
In-Reply-To: <20261116-slub_tiny_rework-v4-0-227a4b3636a5@kernel.org>
To: Harry Yoo <harry@kernel.org>, Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
 David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Conor Dooley <conor@kernel.org>, 
 Damien Le Moal <dlemoal@kernel.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com, 
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
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

Reviewed-by: Harry Yoo (Meta) <harry@kernel.org>
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

