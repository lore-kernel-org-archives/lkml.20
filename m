Received: from mta1.migadu.com (out-59.mta1.migadu.com [95.215.58.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE44F33A6F1
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789996678; cv=none; b=uNiqGNKJRkJHgC+xmRCoy3JcmnMUGUVFjynqalnwWZnTPiGBSxLpHiM1YF0K6oXSs/KmJ0eKgBndASM2xnssTOagqGRE7ysAfRlUXTC2tijqh8ffHaEEvbdFnbU1yL2TQK/6I+gXs4tjlxpgbMNmkyxL7vJcKmnNOfKloOawrew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789996678; c=relaxed/simple;
	bh=ueVOpPzYnMeot+dswpS82YrnsBHSSPYd5K+PQjCvvaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UvfPIte3wlx9QupiSQc6Z+8FweA9NXnByNAQA22wPwmrmKKTLDKG5v65csKNVCUt/URSLn1cMoT+jAueyuKnPms/iruhpT6l1ecUM3ys2T0IXYX7fS72+IRTz+8SH70yOpZfO5D3KQfawR2CnNzNBrlSPVZNgJnZf8a/cz1TlVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=X/SjqYcJ; arc=none smtp.client-ip=95.215.58.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="X/SjqYcJ"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ueVOpPzYnMeot+dswpS82YrnsBHSSPYd5K+PQjCvvaY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789996674; v=1; x=1790601474;
 b=X/SjqYcJokzG5Jzyk6IVWxAXA+B4Xm2zy1fhXRgjy9ZEfXBQNe028meEjtHeHVkI9ZGDZo0U
 vBCYfFcQl7QxHlYUPwMhSmzQ9JxpQNVX7LiAOzX4bRqgCdd6x7u/k1nBG4zy91iUNa8YHVRUDCW
 AjTsvty9tppeRrskQ66c1STU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f48b4f0c2c5289ef;
	Mon, 21 Sep 2026 13:17:54 +0000
X-Mizu-Trace-ID: f48b4f0c2c5289ef
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
Date: Mon, 21 Sep 2026 21:17:22 +0800
Subject: [PATCH v2 2/3] mm/vmalloc: fix vmalloc_dump_obj cross-zone VA
 lookup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-vmalloc_dump_obj-v2-2-73fceb3ed1c8@linux.dev>
References: <20260921-vmalloc_dump_obj-v2-0-73fceb3ed1c8@linux.dev>
In-Reply-To: <20260921-vmalloc_dump_obj-v2-0-73fceb3ed1c8@linux.dev>
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

Iterate all vmap nodes using for_each_vmap_node, like find_vmap_area()
does, but with spin_trylock instead of spin_lock as this function can
be called from atomic dump contexts (OOM, KASAN, RCU).

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
 mm/vmalloc.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index df42d8a6f058..30c610f678dc 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -5278,17 +5278,29 @@ bool vmalloc_dump_obj(void *object)
 	unsigned long nr_pages;
 
 	addr = PAGE_ALIGN_DOWN((unsigned long) object);
-	vn = addr_to_node(addr);
 
-	if (!spin_trylock(&vn->busy.lock))
-		return false;
+	/*
+	 * A vmalloc allocation may span multiple vmap zones, so the
+	 * node whose rb-tree holds the VA may differ from the node
+	 * the address maps to.  Search all nodes.  Use trylock as
+	 * this function can be called from atomic dump contexts.
+	 */
+	va = NULL;
+	for_each_vmap_node(vn) {
+		if (!spin_trylock(&vn->busy.lock))
+			continue;
+
+		va = __find_vmap_area(addr, &vn->busy.root);
+		if (va && va->vm)
+			break;
 
-	va = __find_vmap_area(addr, &vn->busy.root);
-	if (!va || !va->vm) {
 		spin_unlock(&vn->busy.lock);
-		return false;
+		va = NULL;
 	}
 
+	if (!va)
+		return false;
+
 	vm = va->vm;
 	addr = (unsigned long) vm->addr;
 	caller = vm->caller;

-- 
2.25.1

