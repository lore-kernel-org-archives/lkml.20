Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F04C418A37
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789498945; cv=none; b=eTm7BmH5eIlvQ6Vrl3smg7rIWv+cBZemYQDxWWXCPvM9ElZ85cQFXlmet3eiZPx7Oo01b9BBLeuzHP3fPxqCJtUGp8hjpVRBPIfZJC38iWUCZsBE/kQMOs+qXNKC68gkYnan9tqx42RhctphQCOxeOjMpPauBT8JgvlovEEEVWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789498945; c=relaxed/simple;
	bh=4QJ41D60w/6obA4tvm+K+HQianHe4zyzhNNqYViFJVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g/VTOwYwByV3h9+V2ln6vuYaVdjBeRgFiAel+pSdOJ3uFMd67jDKuif30R1bx3ocBEGTtTPOyOznZ9hPkCSId9NwpfPDTnWRont2GOF5jTR7xTpQeHNLk1LiRWkhUY75eIAs6nKr92a1+JTsqcFO/Q+xJIyqfsJli3lWr+Zku7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHawbbug; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHawbbug"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8b402f4e3so87451e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789498942; x=1790103742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=juVs+niFQu9LlYoaoMOmavJNX6cEMYtGxEF+4Y/j32E=;
        b=QHawbbug4CYAl8y2jv1FLp8WU7O0OO/D8SjP6UKGTJJGGGwZoRHrjamPKo15WkWXfD
         Ce7bULCjQbDwJ4MPUAZxjFYDzxI8hPaKOE421S3/7gapwNdHb3UYuvaKGOo+OHKqvO38
         k2LJDQWeF+SQl26s3n5Fcm2uP+i0vvyoLsBDuCCLlYVhvpyFdxjfO9iTX/ZMGVcOGCw1
         5AtsT54WXtaBWzU7UJ1fbPp56cpzzYrn+5cWDgJdzgxYRwhOKsKVoeqEhKbeQdpyhA34
         /ESRVI0wN1c0j40jdiQJZqAz9bX61e8xLsahMy6mutWDWgClDIu326vENivNWw+Z5uRF
         BfTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789498942; x=1790103742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=juVs+niFQu9LlYoaoMOmavJNX6cEMYtGxEF+4Y/j32E=;
        b=fvF54WVQa3DQuI0Ui7A3rO4PQe+NMMV4K12gmoxSopndmWH9aptYMI1KRR+ThhdcUT
         ha6BavNBNLnuqRSUZ6R8UQeysiI1SxvAImFvf057iErtabQjUaO9che7yRvsreXCDu/m
         gwSuh7x2o1OFC7s27TCVOZxbA0Nv4IWW+QpUB4F6jkMu4U+0fm8sroos2rC+qhs0fVfl
         fRWWqV/xjWcWFMb3ZBW5sCkxvpGQG8AGM57Bz4W8L1i0anEqZP/fJ5T4l9zhLOxo59K2
         s4kHjJh4UfHoiKSlOxnR65JchVOY6XQI843H9QgnRAEijs16MNYVEHaKv99WHsnV0pZl
         xexg==
X-Forwarded-Encrypted: i=1; AKwUvBxK1MRzVWgd9G4/XeHis9+sW8WRKNn9w6cK+W4FhXxzksc9JLi5kFdzRS5LEj04hHMDl84OYgKZRzQgm9s=@vger.kernel.org
X-Gm-Message-State: AFuF++nBfzIm8vMKZmV850LASBXBV2OLLl8kBSU2LLwmcPKuT1I+F2xz
	cTd7mLX2cgSAAqZwl+U6t9k9z5803YmIyKMOz2vvQIi+GOE4sD5M0jpv
X-Gm-Gg: AYBFou0IVdj0cxE4UIZ7I8vaUwiyDMpIJQ/JBRYDBydhow9VokinqQhPD0ryzLuvk46
	s1QyJxDXyGM3L/ki5xe88+hf0PLeYXBgu2m41eza3ZRen4cavdKtQq/fI3U06gjOXR6aGMy8CY/
	0LfWOLtVh9Y1BmKNse8iIlOmlheqU1KwcDnt0xOESp40M2PT10ApC3IZm5CZluVXZqN2RzGdVzq
	+vfFbRATg0Q7PsSjRFYgYPhzPGxtfFfcPbqKy28w/9IeUKJfYOZh9P8cpQVbHQCvFSoEtqkYiLM
	Styw1qnGfs1JLhrEoQTwVkUbs5lb5BWU0hhdvFrCXTniSZjoDoND1W6l+jHCEk7X0fd0kKXM4if
	y20nsDEvaxsPNgi8cyNKfRcvvEg3tGMmAhKlYDUnzDzJbmFSQYTyzBB9wmhBcmkf+NjzA/XU2Tr
	eqdJjOGXxXDX9X54P1GkwvhWyc1b2K7mIqdUxaJPtNJFSmpZbdh0IwskO1vSEB3yR9T3dFCsHql
	10aaHeHcaA08DMa6ehQYuCcOXKqO7w4lkxs9MB5/ep6ReiHHE/gj80kL3syLQttB+Iod3etdlWW
	um+M8jS880g6609V7FF60Eji8Le1quY+U+DadSZAChegv8jXlA8hR5f9ju/VqCg=
X-Received: by 2002:a05:6512:3d16:b0:5ad:55f6:1ec3 with SMTP id 2adb3069b0e04-5b8ae681db3mr4739034e87.5.1789498941854;
        Tue, 15 Sep 2026 12:02:21 -0700 (PDT)
Received: from localhost.localdomain (2001-14ba-a052-b900-3da4-4f58-44df-c60c.rev.dnainternet.fi. [2001:14ba:a052:b900:3da4:4f58:44df:c60c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57e0bd1sm157626e87.59.2026.09.15.12.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 12:02:21 -0700 (PDT)
From: Dima Koziuk <dmytrokoziuk68@gmail.com>
To: Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	dmytrokoziuk68@gmail.com
Subject: [PATCH 2/2] mm: kmsan: fix ioremap error cleanup
Date: Tue, 15 Sep 2026 19:02:07 +0300
Message-ID: <20260915160207.2952-2-dmytrokoziuk68@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <20260915160207.2952-1-dmytrokoziuk68@gmail.com>
References: <20260915160207.2952-1-dmytrokoziuk68@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Looking further at kmsan_ioremap_page_range(), I found three cases where
error cleanup leaks metadata blocks. Fault-injection testing confirmed
all three:

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
while the PTE walk skips the missing origin mapping.

Run cleanup whenever err is non-zero. Free allocations that have not been
mapped directly, and use the shared helper to unmap and free the installed
metadata, including blocks from completed iterations.

Fixes: fdea03e12aa2 ("mm: kmsan: handle alloc failures in kmsan_ioremap_page_range()")
Signed-off-by: Dima Koziuk <dmytrokoziuk68@gmail.com>

---
I tested this series on Linux 7.3-rc3 under QEMU with CONFIG_KMSAN=y
and CONFIG_DEBUG_VIRTUAL=n, using ioremap()/iounmap() calls on the QEMU
VGA BAR0. All tested mappings were torn down without metadata leaks.

 mm/kmsan/hooks.c |   35 ++++++++++++-----------------------
 1 file changed, 12 insertions(+), 23 deletions(-)

diff --git a/mm/kmsan/hooks.c b/mm/kmsan/hooks.c
index 084ba667cbf7..02c402f129e1 100644
--- a/mm/kmsan/hooks.c
+++ b/mm/kmsan/hooks.c
@@ -199,16 +199,17 @@ int kmsan_ioremap_page_range(unsigned long start, unsigned long end,
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
@@ -222,39 +223,27 @@ int kmsan_ioremap_page_range(unsigned long start, unsigned long end,
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
