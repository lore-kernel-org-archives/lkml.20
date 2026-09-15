Received: from mta0.migadu.com (out-176.mta0.migadu.com [91.218.175.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003CB3D0900
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789440226; cv=none; b=bk2ZVTCt17RsbpN6mey6aJwu9DFkkv355Cyts/63Ryj8yyKOdRLfuDzjJTMp33fDx4VLXORZlid5oGKuuOv8JlUIvzdNP+FrfV1S1M1bcxqPrU52f5Y/SyjyMk/WkYtx7HQ2WHC/PkaxNaBG/zIG8ZwyqB6KIhY/AzhGrsb5vR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789440226; c=relaxed/simple;
	bh=F73hVyZvf0eZtl+4VEeziRhY9hxVXl8gY1uJk53dZ98=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V8L89lXQgWd9c9UORgsC/zTvHsrZdhhR5lxLavep+OLA+y3zuFskWNwvX05WmnghtuQe+aEbxI00Nt/zQFr4BChtlloKWgz6Pk+Y5hBRoi0G5TGf8GYBxptcFNbfPCQICzrFw6zX69N7s21jhjhtbN/edsgUwdCGRuniQIiSN4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mKk2zpXv; arc=none smtp.client-ip=91.218.175.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mKk2zpXv"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=F73hVyZvf0eZtl+4VEeziRhY9hxVXl8gY1uJk53dZ98=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789440221; v=1; x=1790045021;
 b=mKk2zpXvRBnrjD76Y/5amv0teeUuJoz+PwTU4C8VIur3dzy8xHK8+2JAYAU4xWwhbzB0CuZM
 5z5U1WSiIDQgE/ueU3vXJMUd23yglqZnvbOzagLri/nu3GFZie9JPV2BHE21VBWuF32CcJKIeYR
 aXVPqXhZ7bCtIgEuIdzPAsaY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a551f472497e0f01;
	Tue, 15 Sep 2026 02:43:41 +0000
X-Mizu-Trace-ID: a551f472497e0f01
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
Date: Tue, 15 Sep 2026 10:43:31 +0800
Subject: [PATCH v2 2/3] mm/vmalloc: extract vmap_insert_free_area helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-vmalloc_study-v2-2-cc4dfe635e22@linux.dev>
References: <20260915-vmalloc_study-v2-0-cc4dfe635e22@linux.dev>
In-Reply-To: <20260915-vmalloc_study-v2-0-cc4dfe635e22@linux.dev>
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
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 mm/vmalloc.c | 41 ++++++++++++++++++-----------------------
 1 file changed, 18 insertions(+), 23 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 117483dd048c..973d15ef4f3e 100644
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
+		if ((unsigned long) busy->addr - vmap_start > 0)
+			vmap_insert_free_area(vmap_start,
+					      (unsigned long) busy->addr);
 
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

