Received: from mta1.migadu.com (out-240.mta1.migadu.com [95.215.58.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5AA3AB28C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790583379; cv=none; b=FA83VgMtb6gHaAZLtti2lgrHV2gMCpBjAzsayyuIeE4IIyB54Chjk5kwuQb35vhFc5UUi5SaYZ+s4Aw0WF4ZUhnsYQUP/Savjnx6tV54PpG2IT9oK2QtLQKxFUjV0+qqkoUI/xhe4itNg1rtvNhEqI+gSEZnPzV+gStP6Zs9S0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790583379; c=relaxed/simple;
	bh=K5Q3pCElJ1kYWoQWSMWmJuaeilGdZ97iIqv2nF2D+kg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ylg7RKAKp58XR/xF+UM7x/IRcxoK09sq5PRds399744BK6KAYYBtijNCIgqoGol7wmjUe/reXdcA0GjygHkRNDuoDO0sgEsgyzD3wck6ZMAl6A9W7GNIuDYmbnTI8AQRx0wAjAoZYDYQnUmZ4kKh6P7vhF6aaPayeRYuwlOqaaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pDamGCxk; arc=none smtp.client-ip=95.215.58.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pDamGCxk"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=K5Q3pCElJ1kYWoQWSMWmJuaeilGdZ97iIqv2nF2D+kg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790583376; v=1; x=1791188176;
 b=pDamGCxk5Ut/v2RRK9TMQllPrxJPqXYPyKesBGjPrlyOF7wT/tFvfgdTy27R2Qfx24TyfVrk
 ulGkkHhMk8J4fT41QFhPUjM1o2sVuRCI/MdLLOhOH/zzioiEY+KN9pfvc1L1G6WG2e+T3zoy24I
 8s79t0dZiwRQWs8jmHvJayQ4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ef3d12d70e3ed8e3;
	Mon, 28 Sep 2026 08:16:15 +0000
X-Mizu-Trace-ID: ef3d12d70e3ed8e3
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
Date: Mon, 28 Sep 2026 16:15:55 +0800
Subject: [PATCH v4 2/2] mm/vmalloc: fix vmalloc_dump_obj cross-zone VA
 lookup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-vmalloc_dump_obj-v4-2-6f288a431edc@linux.dev>
References: <20260928-vmalloc_dump_obj-v4-0-6f288a431edc@linux.dev>
In-Reply-To: <20260928-vmalloc_dump_obj-v4-0-6f288a431edc@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Uladzislau Rezki <urezki@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Ye Liu <liuye@kylinos.cn>
X-Mailer: b4 0.14.3

From: Ye Liu <liuye@kylinos.cn>

vmalloc_dump_obj() searches only one vmap node (addr_to_node(addr)),
but a vmalloc allocation may span multiple vmap zones.  The VA is
stored in only one node's rb-tree (addr_to_node(va_start)), so an
object pointer in a different zone than va_start maps to a different
node and the search misses.  This affects any allocation larger than
vmap_zone_size (64 KiB) on multi-CPU systems.

Extract find_vmap_area_lock() from find_vmap_area() to share the
cross-node iteration logic.  The helper supports both spin_lock and
spin_trylock, the latter for atomic dump contexts (OOM, KASAN, RCU).

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
 mm/vmalloc.c | 108 ++++++++++++++++++++++++++++++++++++-----------------------
 1 file changed, 66 insertions(+), 42 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index df42d8a6f058..4f4d7453962f 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -2517,67 +2517,94 @@ static void free_unmap_vmap_area(struct vmap_area *va)
 	free_vmap_area_noflush(va);
 }
 
-struct vmap_area *find_vmap_area(unsigned long addr)
+static inline int next_vmap_node_id(int i)
+{
+	return (i + nr_vmap_nodes - 1) % nr_vmap_nodes;
+}
+
+enum vmap_lock_mode {
+	VMAP_LOCK,
+	VMAP_TRYLOCK,
+};
+
+/*
+ * Search for a vmap_area at @addr across all vmap nodes.  An
+ * addr_to_node_id(addr) converts an address to a node index where
+ * a VA is located. If VA spans several zones and passed addr is not
+ * the same as va->va_start, what is not common, we may need to scan
+ * extra nodes. See an example:
+ *
+ *      <----va---->
+ * -|-----|-----|-----|-----|-
+ *     1     2     0     1
+ *
+ * VA resides in node 1 whereas it spans 1, 2 an 0. If passed addr
+ * is within 2 or 0 nodes we should do extra work.
+ *
+ * Returns the VA with @locked_vn->busy.lock held; the caller must
+ * release it. If @mode is VMAP_TRYLOCK, nodes that cannot be locked
+ * are skipped.
+ */
+static struct vmap_area *
+find_vmap_area_lock(unsigned long addr, struct vmap_node **locked_vn,
+		enum vmap_lock_mode mode)
 {
 	struct vmap_node *vn;
 	struct vmap_area *va;
 	int i, j;
 
+	*locked_vn = NULL;
+
 	if (unlikely(!vmap_initialized))
 		return NULL;
 
-	/*
-	 * An addr_to_node_id(addr) converts an address to a node index
-	 * where a VA is located. If VA spans several zones and passed
-	 * addr is not the same as va->va_start, what is not common, we
-	 * may need to scan extra nodes. See an example:
-	 *
-	 *      <----va---->
-	 * -|-----|-----|-----|-----|-
-	 *     1     2     0     1
-	 *
-	 * VA resides in node 1 whereas it spans 1, 2 an 0. If passed
-	 * addr is within 2 or 0 nodes we should do extra work.
-	 */
 	i = j = addr_to_node_id(addr);
 	do {
 		vn = &vmap_nodes[i];
 
-		spin_lock(&vn->busy.lock);
-		va = __find_vmap_area(addr, &vn->busy.root);
-		spin_unlock(&vn->busy.lock);
+		if (mode == VMAP_LOCK) {
+			spin_lock(&vn->busy.lock);
+		} else {
+			if (!spin_trylock(&vn->busy.lock))
+				continue;
+		}
 
-		if (va)
+		va = __find_vmap_area(addr, &vn->busy.root);
+		if (va) {
+			*locked_vn = vn;
 			return va;
-	} while ((i = (i + nr_vmap_nodes - 1) % nr_vmap_nodes) != j);
+		}
+
+		spin_unlock(&vn->busy.lock);
+	} while ((i = next_vmap_node_id(i)) != j);
 
 	return NULL;
 }
 
-static struct vmap_area *find_unlink_vmap_area(unsigned long addr)
+struct vmap_area *find_vmap_area(unsigned long addr)
 {
 	struct vmap_node *vn;
 	struct vmap_area *va;
-	int i, j;
-
-	/*
-	 * Check the comment in the find_vmap_area() about the loop.
-	 */
-	i = j = addr_to_node_id(addr);
-	do {
-		vn = &vmap_nodes[i];
 
-		spin_lock(&vn->busy.lock);
-		va = __find_vmap_area(addr, &vn->busy.root);
-		if (va)
-			unlink_va(va, &vn->busy.root);
+	va = find_vmap_area_lock(addr, &vn, VMAP_LOCK);
+	if (va)
 		spin_unlock(&vn->busy.lock);
 
-		if (va)
-			return va;
-	} while ((i = (i + nr_vmap_nodes - 1) % nr_vmap_nodes) != j);
+	return va;
+}
 
-	return NULL;
+static struct vmap_area *find_unlink_vmap_area(unsigned long addr)
+{
+	struct vmap_node *vn;
+	struct vmap_area *va;
+
+	va = find_vmap_area_lock(addr, &vn, VMAP_LOCK);
+	if (va) {
+		unlink_va(va, &vn->busy.root);
+		spin_unlock(&vn->busy.lock);
+	}
+
+	return va;
 }
 
 /*** Per cpu kva allocator ***/
@@ -5278,14 +5305,11 @@ bool vmalloc_dump_obj(void *object)
 	unsigned long nr_pages;
 
 	addr = PAGE_ALIGN_DOWN((unsigned long) object);
-	vn = addr_to_node(addr);
-
-	if (!spin_trylock(&vn->busy.lock))
-		return false;
 
-	va = __find_vmap_area(addr, &vn->busy.root);
+	va = find_vmap_area_lock(addr, &vn, VMAP_TRYLOCK);
 	if (!va || !va->vm) {
-		spin_unlock(&vn->busy.lock);
+		if (va)
+			spin_unlock(&vn->busy.lock);
 		return false;
 	}
 

-- 
2.25.1

