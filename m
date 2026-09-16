Received: from mta0.migadu.com (out-157.mta0.migadu.com [91.218.175.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2253ACA7F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789547154; cv=none; b=ILJEM9h488uFwZM87SrhgmdpGSPww24aGZz2LXFJ61hrEpUkzMaZOhsEXxePTfTQdcCMoC4xTIZ2fyQZD8w9Vjf42Qcdyi6lMpPfCLu4vfeBRMFzxdUK26YFrgm+2YkhQTu2Jy1Uk/9M9LEZOyKAG6BjO9TLvziCORt7OqkIDaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789547154; c=relaxed/simple;
	bh=ueVOpPzYnMeot+dswpS82YrnsBHSSPYd5K+PQjCvvaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pWu8KItnOm+M1qgMnt4nr/Xq2BckBhB3kqrYS8wSiRfAGW/rYt+NheE6FvRgailvJDOnfhDV0TXxbsWtt9RlVPaExk7Cdrpkx/5NaPS09ii/SV9ntgQfYL26gfK6xsJVoUi3yxBdCEyuatlMGOebn0fV8TbYzTQoRgVOsbvKKnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oWEsdVD5; arc=none smtp.client-ip=91.218.175.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oWEsdVD5"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ueVOpPzYnMeot+dswpS82YrnsBHSSPYd5K+PQjCvvaY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789547147; v=1; x=1790151947;
 b=oWEsdVD5I+8FD3wHIoHvy0lk7QLXJiwhTLBv5CfLEmQv4uFhZZ4kUbz2ufNXhrfcbYQN0wpd
 EIO0R1ct+nS13l/HKk4hkDEQ+WKBMjIv8HgLW+C7EL7nacr8sf/OfjS/iMb8V+sHFN0Ky5ID2d/
 txZc01I48G0CBx+OhkhYG6S8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3414f8a749aa3b67;
	Wed, 16 Sep 2026 08:25:46 +0000
X-Mizu-Trace-ID: 3414f8a749aa3b67
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
Date: Wed, 16 Sep 2026 16:25:29 +0800
Subject: [PATCH 2/3] mm/vmalloc: fix vmalloc_dump_obj cross-zone VA lookup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-vmalloc_dump_obj-v1-2-7aa402d224df@linux.dev>
References: <20260916-vmalloc_dump_obj-v1-0-7aa402d224df@linux.dev>
In-Reply-To: <20260916-vmalloc_dump_obj-v1-0-7aa402d224df@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Uladzislau Rezki <urezki@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Ye Liu <liuye@kylinos.cn>
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

