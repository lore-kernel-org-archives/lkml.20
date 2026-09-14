Received: from mta0.migadu.com (out-2.mta0.migadu.com [91.218.175.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040AF2B9BA
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789356857; cv=none; b=V3+TELsOnX3NiNPQcNkZiZ0ZBcXi+PLZy2kkPguGXPIGnWZRrcOqGd3uso9hnQQDLqZ3NeCcN90LRJVS+cUAyDLDDtmuDwz+SQYgvj8ofQ2qI07z8cka7RQZQ815eHDZLOtCt+AnDJ9u002tdLGRsMC+Gd4voCxMOlZlUiQTRLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789356857; c=relaxed/simple;
	bh=FjLD91OsmHHYXnKEalfNO2UjXgSa8L0XL7p5Xdw+wAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jht6XOFEgLg0g05IoPr1pf+2ZzWJb6DSi0P7DRGXV7UWaSEab6jxBbpxJuLJfAM/wq6rglJrnwwkvjvyzvHyZxL7Xpdaxa/amqCAgtqE1D5ygk2V5V3FbUBfbXP8VUBeoSbGNSL1r2B1h5qWlSYRJJtwAj1d0Yir0M/wSzhUOn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=djkAODB3; arc=none smtp.client-ip=91.218.175.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="djkAODB3"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=FjLD91OsmHHYXnKEalfNO2UjXgSa8L0XL7p5Xdw+wAE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789356853; v=1; x=1789961653;
 b=djkAODB3+Q7/HNzhx2ZXdVuKpSEXgkumiGXVm7297ldREF4tU6vyOBml2BF0GW1zBLavcTdV
 ocY65ma5LzOdr4xaH0qcbNcqJJNU026tIBV/7GkBnvcAKNtkn5IL4YvR3lhRTKg2U3SYCceb2VU
 x4L330CwDHnK/VRZrDsBSFtE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id eb00aff8d21a2672;
	Mon, 14 Sep 2026 03:34:13 +0000
X-Mizu-Trace-ID: eb00aff8d21a2672
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
Date: Mon, 14 Sep 2026 11:34:01 +0800
Subject: [PATCH 2/3] mm/vmalloc: extract vmap_insert_free_area helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-vmalloc_study-v1-2-526f68559706@linux.dev>
References: <20260914-vmalloc_study-v1-0-526f68559706@linux.dev>
In-Reply-To: <20260914-vmalloc_study-v1-0-526f68559706@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Uladzislau Rezki <urezki@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Ye Liu <liuye@kylinos.cn>
X-Mailer: b4 0.14.3

From: Ye Liu <liuye@kylinos.cn>

The allocation and insertion of a free vmap_area is duplicated
between the loop body and the tail of vmap_init_free_space.  Factor
it into a small helper so the main function only deals with computing
the free gaps between busy regions.

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
 mm/vmalloc.c | 41 ++++++++++++++++++-----------------------
 1 file changed, 18 insertions(+), 23 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 117483dd048c..797933ba9451 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -5433,11 +5433,23 @@ module_init(proc_vmalloc_init);
 
 #endif
 
+static void __init vmap_insert_free_area(unsigned long start, unsigned long end)
+{
+	struct vmap_area *free = kmem_cache_zalloc(vmap_area_cachep, GFP_NOWAIT);
+
+	if (!WARN_ON_ONCE(!free)) {
+		free->va_start = start;
+		free->va_end = end;
+		insert_vmap_area_augment(free, NULL,
+					 &free_vmap_area_root,
+					 &free_vmap_area_list);
+	}
+}
+
 static void __init vmap_init_free_space(void)
 {
 	unsigned long vmap_start = 1;
 	const unsigned long vmap_end = ULONG_MAX;
-	struct vmap_area *free;
 	struct vm_struct *busy;
 
 	/*
@@ -5447,32 +5459,15 @@ static void __init vmap_init_free_space(void)
 	 *  |<--------------------------------->|
 	 */
 	for (busy = vmlist; busy; busy = busy->next) {
-		if ((unsigned long) busy->addr - vmap_start > 0) {
-			free = kmem_cache_zalloc(vmap_area_cachep, GFP_NOWAIT);
-			if (!WARN_ON_ONCE(!free)) {
-				free->va_start = vmap_start;
-				free->va_end = (unsigned long) busy->addr;
-
-				insert_vmap_area_augment(free, NULL,
-					&free_vmap_area_root,
-						&free_vmap_area_list);
-			}
-		}
+		if ((unsigned long)busy->addr - vmap_start > 0)
+			vmap_insert_free_area(vmap_start,
+					      (unsigned long)busy->addr);
 
 		vmap_start = (unsigned long) busy->addr + busy->size;
 	}
 
-	if (vmap_end - vmap_start > 0) {
-		free = kmem_cache_zalloc(vmap_area_cachep, GFP_NOWAIT);
-		if (!WARN_ON_ONCE(!free)) {
-			free->va_start = vmap_start;
-			free->va_end = vmap_end;
-
-			insert_vmap_area_augment(free, NULL,
-				&free_vmap_area_root,
-					&free_vmap_area_list);
-		}
-	}
+	if (vmap_end - vmap_start > 0)
+		vmap_insert_free_area(vmap_start, vmap_end);
 }
 
 static void vmap_init_nodes(void)

-- 
2.25.1

