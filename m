Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747F71B6D08
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 20:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790971542; cv=none; b=KHm73NuNA+DiIa1oAFjdPg/B4PEu6hNimjVKUcjnBhZj1XWcZ4pLM6tfK4n00Cwzo7tqs244Da1abLvqsq3kCM4TuWQOR8MR3LB6cLfqCemYJAPpc5nNucDk8CAN1d+tJY0OGeObVomzFWwFdhH+VxlontPt1v7FMi/OAh8x7c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790971542; c=relaxed/simple;
	bh=oYMUW41nHSss8rOXIgL7v+bhws077gDZHSXweykkQtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mvwsOSUQ/1fB0Wy5GVE7eY43YEjXRORqyhzhO3gb4HMiZ+5otWwCndbX6hBH/r2A2ZRXiQyV5C4T8zv+9uJUa8q7fcJORo2PSJyjj4PuA6l0yI97Pggwqh/hzfNyJ+8A5hF76BDzMWnMVS8dlLi/5hiUyuSct49w1+88mlB+C2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q+vh6w9B; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q+vh6w9B"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b2b92065ffso672132e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 13:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790971538; x=1791576338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NiaV9pLE/UyWnLNPpNRp8NShsPX1nhmz6PNg9bUI4ZQ=;
        b=q+vh6w9BiasmmS+7RQ2uuO3K7ZIbWjMgbSNdvltyOocjGmxGm+Dc7QovZm/bS3r6UM
         caOSbwcMpY3WGHgRlGbwA1CZ1UzGnC/tB/8mKMFH3P695q5NG2XHnV/yZXEBmUb5D0G6
         +HXVHtgqxErDBKjAL6bYzH7PAv9F/eYSwIgh27aGXakuugwLkCGcHXOSGgjsT8smppmC
         ea9BZ5N0u9vTuxrQxTZgpWyZ2expgCJLkz+luv43ErK9JM/ziiCr0AmDy1giLU+Kj7ze
         0N6G1w8tyIGQ+Y1CEJbzDdwH/u4bSfbeDC6+EomX/fdLfh6bPfg7PU7rZCAoB5v6tqUZ
         odHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790971538; x=1791576338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NiaV9pLE/UyWnLNPpNRp8NShsPX1nhmz6PNg9bUI4ZQ=;
        b=FgTdZbt8nGmEG7ePpMDH33fyOWi4XjnyKmsENuyhvEvj545cgFOLjXgaImGH2ai7c1
         y7aKeF9OwWEVOpHEflwUfmYx8SVTIxOMzcAxCq+Xc0tJlgc7l6P+AQr6CCdR5JejFmBq
         o702zSIJIYcy4VoyGe0wlNLrmqoiJSJEWT49UVjwd7muqQCFfkc8taQd2Z35RRD3Gu0T
         msIwe7DzakQfcZx2bQOUjcVrpCONM+mcexDZ5jT2DZMWZQBVUpuLbU/Ty++sOnv/B7RW
         QuDIqeOas8IyGEjmlj9Gb/0tcb3EzVPLKKVwvexPreIZMocosXGdYJQt5iLthjHj3ozu
         7jeA==
X-Forwarded-Encrypted: i=1; AKwUvBxQvCVRchP1Mi6I9BQuuLwIqErnsl3tiyMHwQiP063dnmeeqODSQvEnHcB/2oR9bbDMA94GnGTXm0ADvpM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3GNEOPhIgcUMUExPC+aym5mR2YfUUD+SGcEbLiTEHlbeF1P4g
	H6v2RxYZNr/ykUMKI7dy1NGntu1RsmuNlCIZ4NzcGEq4gO40tIYOFSS8
X-Gm-Gg: AYBFou2e2BOxt9/rHXIP2ISd2i+jLZjzOqd64GTd4EJPkPkTreVKoTna8E3VDUr//lL
	hVcvPRgYcRRp1jtGcPNDMo1iD32CTzin4NIEcfo4a5pSISIXo+dPDXVOVgAi4U5XtJfH2LlDwsJ
	ljCc+mzMbAB6QieCrASjdQXuaZomJWC8tD1+1Vl6DO4heU8r773mqwxWaVwpvCRh3/Pc8qrqYRS
	qR4WmHUyyboEjrlDYnR0a9+Jro/hzyW/9n08jnPc4R46qvkoajW4USKAilSri3rHkNIh1slzOAG
	XCQQPjm1AOIAN1EkyH+BVCOMDo7BD+lnkj2uWk0qHySo/EKlPLh0Rz5ySFImIVcPKCUBhS5J5s5
	+YQ4pERI78hsmdCA6t7MigjdpOE7xqCcUbBhao1liRPXTd1kvL4Tfka8lGCWLTyZ65Ac1XShOZh
	PaoyXODZqvuyteo+wWfHuSX8nlS7EbyNNKeOxvcmad+C0yXzxaD+XTgxStZwvfPUcKXPDaKGSqK
	8bv6sPVrLum5lJ1VezNwLfQRA3nHwwClwN6lPim/fd2Xr/UvWl7T8tiwj4+nAu7h3mDSpOvrnqB
	x/8SXnYM/P47VUFAGRWJ0sUw9z5pe3M1YF1bsPO1EtXqMZHwzgyAyxAvugk5FwQ=
X-Received: by 2002:a05:6512:2347:b0:5b8:e87e:cafb with SMTP id 2adb3069b0e04-5bcb5472174mr218939e87.58.1790971538301;
        Fri, 02 Oct 2026 13:05:38 -0700 (PDT)
Received: from localhost.localdomain (2001-14ba-a052-b900-354c-f1dd-ffbd-a9f2.rev.dnainternet.fi. [2001:14ba:a052:b900:354c:f1dd:ffbd:a9f2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c78bcecsm1018388e87.15.2026.10.02.13.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 13:05:37 -0700 (PDT)
From: Dima Koziuk <dmytrokoziuk68@gmail.com>
To: glider@google.com,
	akpm@linux-foundation.org
Cc: dmytrokoziuk68@gmail.com,
	elver@google.com,
	dvyukov@google.com,
	urezki@gmail.com,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] mm: kmsan: fix ioremap error cleanup
Date: Fri,  2 Oct 2026 23:05:08 +0300
Message-ID: <20261002200508.546-2-dmytrokoziuk68@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <20261002200508.546-1-dmytrokoziuk68@gmail.com>
References: <20261002200508.546-1-dmytrokoziuk68@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Looking further at kmsan_ioremap_page_range(), I found three cases where
error cleanup leaks metadata blocks.

1. If the first iteration fails, clean is zero and cleanup is skipped,
   leaking any allocations that succeeded in that iteration.

2. If shadow mapping succeeds but origin mapping fails, the shadow
   pointer has already been cleared. Removing its mapping loses the
   backing block.

3. On failures after completed iterations, cleanup removes the earlier
   metadata mappings without freeing their backing blocks.

The cleanup needed here is the same as for iounmap, so it makes sense to
reuse kmsan_iounmap_pages(). Track the end of installed mappings with
mapped_end and advance it after each successful shadow mapping. This
includes the current shadow block if origin mapping subsequently fails,
while the helper skips the missing origin mapping.

Run cleanup whenever err is non-zero. Free allocations that have not been
mapped directly, and use the shared helper to unmap and free the installed
metadata, including blocks from completed iterations.

Fixes: fdea03e12aa2 ("mm: kmsan: handle alloc failures in kmsan_ioremap_page_range()")
Reviewed-by: Alexander Potapenko <glider@google.com>
Signed-off-by: Dima Koziuk <dmytrokoziuk68@gmail.com>
---
Changes in v2:
- No code changes. 
- Add Reviewed-by Alexander Potapenko from v1.

I tested this series on Linux 7.3-rc3 under QEMU, 
using ioremap()/iounmap() calls on the QEMU VGA BAR0. 
All tested mappings were torn down without metadata leaks.

 mm/kmsan/hooks.c | 35 ++++++++++++-----------------------
 1 file changed, 12 insertions(+), 23 deletions(-)

diff --git a/mm/kmsan/hooks.c b/mm/kmsan/hooks.c
index 24f71bc65896..a706666db097 100644
--- a/mm/kmsan/hooks.c
+++ b/mm/kmsan/hooks.c
@@ -186,16 +186,17 @@ int kmsan_ioremap_page_range(unsigned long start, unsigned long end,
 	gfp_t gfp_mask = GFP_KERNEL | __GFP_ZERO;
 	struct page *shadow, *origin;
 	unsigned long off = 0;
-	int nr, err = 0, clean = 0, mapped;
+	unsigned long mapped_end = start;
+	int nr, err = 0, mapped;
 
 	if (!kmsan_enabled || kmsan_in_runtime())
 		return 0;
 
 	nr = (end - start) / PAGE_SIZE;
 	kmsan_enter_runtime();
-	for (int i = 0; i < nr; i++, off += PAGE_SIZE, clean = i) {
-		shadow = alloc_pages(gfp_mask, 1);
-		origin = alloc_pages(gfp_mask, 1);
+	for (int i = 0; i < nr; i++, off += PAGE_SIZE) {
+		shadow = alloc_pages(gfp_mask, KMSAN_IOREMAP_META_ORDER);
+		origin = alloc_pages(gfp_mask, KMSAN_IOREMAP_META_ORDER);
 		if (!shadow || !origin) {
 			err = -ENOMEM;
 			goto ret;
@@ -209,39 +210,27 @@ int kmsan_ioremap_page_range(unsigned long start, unsigned long end,
 			goto ret;
 		}
 		shadow = NULL;
+		mapped_end = start + off + PAGE_SIZE;
 		mapped = __vmap_pages_range_noflush(
 			vmalloc_origin(start + off),
 			vmalloc_origin(start + off + PAGE_SIZE), prot, &origin,
 			PAGE_SHIFT);
 		if (mapped) {
-			__vunmap_range_noflush(
-				vmalloc_shadow(start + off),
-				vmalloc_shadow(start + off + PAGE_SIZE));
 			err = mapped;
 			goto ret;
 		}
 		origin = NULL;
 	}
-	/* Page mapping loop finished normally, nothing to clean up. */
-	clean = 0;
 
 ret:
-	if (clean > 0) {
-		/*
-		 * Something went wrong. Clean up shadow/origin pages allocated
-		 * on the last loop iteration, then delete mappings created
-		 * during the previous iterations.
-		 */
+	if (err) {
 		if (shadow)
-			__free_pages(shadow, 1);
+			__free_pages(shadow, KMSAN_IOREMAP_META_ORDER);
 		if (origin)
-			__free_pages(origin, 1);
-		__vunmap_range_noflush(
-			vmalloc_shadow(start),
-			vmalloc_shadow(start + clean * PAGE_SIZE));
-		__vunmap_range_noflush(
-			vmalloc_origin(start),
-			vmalloc_origin(start + clean * PAGE_SIZE));
+			__free_pages(origin, KMSAN_IOREMAP_META_ORDER);
+
+		if (mapped_end > start)
+			kmsan_iounmap_pages(start, mapped_end);
 	}
 	flush_cache_vmap(vmalloc_shadow(start), vmalloc_shadow(end));
 	flush_cache_vmap(vmalloc_origin(start), vmalloc_origin(end));
