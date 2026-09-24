Received: from mta0.migadu.com (out-252.mta0.migadu.com [91.218.175.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5523E5594
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790239922; cv=none; b=pmuuVI9fh/Dx1WVCMJdPCmg0M8DqbImMZCuAJCww/Uzgupp8+aaB1e3RjBkLx1B76taPaXwhIe5L3xAD2kqonhlYwU3F2xlfFkMOoMjnYaQiM6NUGzauHC0LksIO/Oep5QUiJDt14vpqAH81eBNycVSnd9XebhHFD0OF3LrlhmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790239922; c=relaxed/simple;
	bh=SSX9xIAupprnWjWqUwH2oYEZRlvMUWqzHUN8lhagogw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PxI/AqThnAxmrShCudv0wJQVk3e5Oud51O8MXOUUCjU/lrkbm0+sI5Z4msuEPqi/T/t0tstjBzOzRyphvRdBGN6D9bG/O/wsPBB9Eqlc9RzIB3NUm4vK7rDe2n7P7Azzs+wLa824cT55Mx0FklgdLpby+bfecZLYv9KGdFWMEzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BhFgSU6x; arc=none smtp.client-ip=91.218.175.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BhFgSU6x"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=SSX9xIAupprnWjWqUwH2oYEZRlvMUWqzHUN8lhagogw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790239918; v=1; x=1790844718;
 b=BhFgSU6x72wnDos1k2qf6Fd9lM1UlkPIf4CIWWmHLJt7j/fJqj6dWrgEuE72JmEnf9OHrR+F
 kEukD5SkxDpC607CU2XjUQygInZipl9G3Gbx5Zo3kT7RiwH0sI79Z++bonMUUDKAiDkyUmMbN31
 VCGxdOzEQoiTuFnDpxkCzjco=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bf2fbf69d3d2174c;
	Thu, 24 Sep 2026 08:51:57 +0000
X-Mizu-Trace-ID: bf2fbf69d3d2174c
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
Date: Thu, 24 Sep 2026 16:51:40 +0800
Subject: [PATCH v3 2/2] mm/vmalloc: fix vmalloc_dump_obj cross-zone VA
 lookup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-vmalloc_dump_obj-v3-2-5bdee3da37b3@linux.dev>
References: <20260924-vmalloc_dump_obj-v3-0-5bdee3da37b3@linux.dev>
In-Reply-To: <20260924-vmalloc_dump_obj-v3-0-5bdee3da37b3@linux.dev>
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
 mm/vmalloc.c | 111 +++++++++++++++++++++++++++++++++++++----------------------
 1 file changed, 69 insertions(+), 42 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index df42d8a6f058..e5b465de1559 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -2517,39 +2517,81 @@ static void free_unmap_vmap_area(struct vmap_area *va)
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
 
-	if (unlikely(!vmap_initialized))
+	if (unlikely(!vmap_initialized)) {
+		*locked_vn = NULL;
 		return NULL;
+	}
 
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
+		if (mode == VMAP_LOCK) {
+			spin_lock(&vn->busy.lock);
+		} else {
+			if (!spin_trylock(&vn->busy.lock))
+				continue;
+		}
+
 		va = __find_vmap_area(addr, &vn->busy.root);
+		if (va) {
+			*locked_vn = vn;
+			return va;
+		}
+
 		spin_unlock(&vn->busy.lock);
+	} while ((i = next_vmap_node_id(i)) != j);
 
-		if (va)
-			return va;
-	} while ((i = (i + nr_vmap_nodes - 1) % nr_vmap_nodes) != j);
+	*locked_vn = NULL;
+	return NULL;
+}
+
+struct vmap_area *find_vmap_area(unsigned long addr)
+{
+	struct vmap_node *vn;
+	struct vmap_area *va;
+
+	va = find_vmap_area_lock(addr, &vn, VMAP_LOCK);
+	if (va) {
+		spin_unlock(&vn->busy.lock);
+		return va;
+	}
 
 	return NULL;
 }
@@ -2558,26 +2600,14 @@ static struct vmap_area *find_unlink_vmap_area(unsigned long addr)
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
+	if (va) {
+		unlink_va(va, &vn->busy.root);
 		spin_unlock(&vn->busy.lock);
+	}
 
-		if (va)
-			return va;
-	} while ((i = (i + nr_vmap_nodes - 1) % nr_vmap_nodes) != j);
-
-	return NULL;
+	return va;
 }
 
 /*** Per cpu kva allocator ***/
@@ -5278,14 +5308,11 @@ bool vmalloc_dump_obj(void *object)
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

