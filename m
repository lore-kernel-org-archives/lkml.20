Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4200538D89
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790718824; cv=none; b=Sd1fgsi+Fo1TZ6XILhO0BXZdvJfuphO66vbP4CnoAmszW3R6T2cqNJA/YVs/DHQVuCBIOPR36m7A25wWv11AdVNc9NCWMBqB5VZ56zHu0YqJgTRTyjFoK/FDjF8cLkjMLOTF0cg5gAW2lvJMn9p8s0e0Jj5BfHA1kdZoTwj55dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790718824; c=relaxed/simple;
	bh=Dp0G3Wmg2vn+ojwqoPZTqWXUrFzkRE4jCEuSLOSDWHk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eWIhxsEM2kmjBPfqncUfaV8ZRmamn2+SitnSHBSF0teCEpXNwn81ptGbvCWzc1x3Cwsye3O3BWygHgsnlDRodZKuUiWwAfNhaK63nUUSoWEW6VeHtOOWgiyvo59mpIfRwbQAPhWDv1XBdumZggiGQ20KZqarN3W2YHfmwTfuNJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E6kkp4oc; arc=none smtp.client-ip=74.125.82.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E6kkp4oc"
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34316295d86so8076335eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790718821; x=1791323621; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RTMNyUVrpYZfptNKYYBniRNX5aVC7vTVEHYl81wiTKQ=;
        b=E6kkp4ocYF1BVy+GiH91JRSTux4y3s58MG4CzKUstGUjWcvduWvONsxx7bi4S8kwpy
         fLDa23IEOBZOMzzC9EnqeBFgziGclGXYB6Z5huMf9TyR/+EhUyqS6yE7qMy8U41N5Q/l
         JzAfNMcnL2U/7qwxYNKaoRa/2YRyulKz0OtbkQ5L5pKY4gpogZ7HHq6ILfUGlXvIz5tP
         reac94cAXJkzDqfG4yBlTBc+iYECJ7uRFtUPj0Cz4qOvBFkFg+idU3nXKAB5gMayUK/m
         VTaSEtgDHar3lip4o4EuQ4tEdHKzbVPp9N+meBxmo0exudkmnZFI2oww8oc+kwbAd9KK
         OZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790718821; x=1791323621;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RTMNyUVrpYZfptNKYYBniRNX5aVC7vTVEHYl81wiTKQ=;
        b=lQpAUhwLVNO6yZWOJbwEo1E4jsxgFjyvrE6Ns1qNBhIlG4FSDNRba+jb/mIgynWtRJ
         RDeLZg3Cs7/mE/0g6NF+sadax9y5PfefXYdUUkYd+IamKLnJmMbX6tNXJuXn9EA9XCHf
         SR1lOFG5qV0Pnl/JzaAvbzgCL2W+WkjBrR4M25vEVHxDDA+dY1Def3cngiMXeArJ8bm4
         xKT1JTuJRe2Q1+9ncYBXWxxGi4ST22WkUilH/DrCwpx3Zy+K9u8G98lnTcjhVjvWkFrq
         LbLk0RGhht/vRic2rjUzLlaINAXpuQTMVSMyX3gm+2d90v8dqlyIsaFnUXdBequO+9R0
         YL4w==
X-Forwarded-Encrypted: i=1; AKwUvBx5HPps74QK/bTFDkqtAifECRby/COb/QlisNjkVQ3yLoLgQ/YApXReQvcAcBr9qBe4a/HX+3ijTtJeHls=@vger.kernel.org
X-Gm-Message-State: AFuF++ngPC5xngVDfIITiitDPcbIShOrastq/pX0U6IVc2zk1Cfpds6d
	K8VXEFPU6lQl5/zhKHXCacKApSZAKIdgMEonwmm9xs6ZQ4qTpVXnTh+UoxDqaFpEqiGaLkx7Wvi
	3JEdcqbgTBm+QpdWwb20Esg==
X-Received: from dlbem11.prod.google.com ([2002:a05:7022:100b:b0:14b:4891:4b9b])
 (user=nilayvaish job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701a:c909:b0:14a:725b:7b40 with SMTP id a92af1059eb24-14ca02946f6mr560218c88.44.1790718820169;
 Tue, 29 Sep 2026 14:53:40 -0700 (PDT)
Date: Tue, 29 Sep 2026 14:52:06 -0700
In-Reply-To: <20260929215206.516490-1-nilayvaish@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929215206.516490-1-nilayvaish@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929215206.516490-16-nilayvaish@google.com>
Subject: [PATCH 15/15] mm: replace remaining &folio->page uses with
 folio_page() and helpers
From: Nilay Vaish <nilayvaish@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Matthew Wilcox <willy@infradead.org>, David Hildenbrand <david@kernel.org>, 
	Greg Thelen <gthelen@google.com>, Roman Gushchin <kfree@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Nilay Vaish <nilayvaish@google.com>
Content-Type: text/plain; charset="UTF-8"

As part of the memdescs effort, struct folio will be allocated
separately from struct page and will no longer overlay the head page.

Convert the remaining &folio->page uses in mm/memory-failure.c,
mm/hwpoison-inject.c, mm/filemap.c, mm/gup_test.c, mm/memory_hotplug.c,
and mm/memremap.c to folio_page(folio, 0) (and folio_set_hwpoison() in
mf_generic_kill_procs()), and use ERR_CAST(folio) when returning an
error pointer as struct page * in do_read_cache_page() and
shmem_read_mapping_page_gfp().

In free_zone_device_folio() (mm/memremap.c), passing folio_page(folio, 0)
to wake_up_var() ensures the wake-up key continues to match the struct
page address that fs/dax.c waits on via ___wait_var_event(page, ...)
once struct folio is separated from struct page.

No functional change intended while struct folio overlays struct page.

Assisted-by: LLM
Signed-off-by: Nilay Vaish <nilayvaish@google.com>
---
 mm/filemap.c         | 6 +++---
 mm/gup_test.c        | 6 ++++--
 mm/hwpoison-inject.c | 2 +-
 mm/memory-failure.c  | 8 ++++----
 mm/memory_hotplug.c  | 2 +-
 mm/memremap.c        | 2 +-
 mm/shmem.c           | 2 +-
 7 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/mm/filemap.c b/mm/filemap.c
index b74bc1e5015c..02e0c2af594c 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -156,7 +156,7 @@ static void filemap_unaccount_folio(struct address_space *mapping,
 	if (!IS_ENABLED(CONFIG_DEBUG_VM) && unlikely(folio_mapped(folio))) {
 		pr_alert("BUG: Bad page cache in process %s  pfn:%05lx\n",
 			 current->comm, folio_pfn(folio));
-		dump_page(&folio->page, "still mapped when deleted");
+		dump_page(folio_page(folio, 0), "still mapped when deleted");
 		dump_stack();
 		add_taint(TAINT_BAD_PAGE, LOCKDEP_NOW_UNRELIABLE);
 
@@ -3888,7 +3888,7 @@ static vm_fault_t filemap_map_order0_folio(struct vm_fault *vmf,
 		unsigned long *rss)
 {
 	vm_fault_t ret = 0;
-	struct page *page = &folio->page;
+	struct page *page = folio_page(folio, 0);
 
 	if (PageHWPoison(page))
 		goto out;
@@ -4239,7 +4239,7 @@ static struct page *do_read_cache_page(struct address_space *mapping,
 
 	folio = do_read_cache_folio(mapping, index, filler, file, gfp);
 	if (IS_ERR(folio))
-		return &folio->page;
+		return ERR_CAST(folio);
 	return folio_file_page(folio, index);
 }
 
diff --git a/mm/gup_test.c b/mm/gup_test.c
index ba74bf3f4104..337b58221c79 100644
--- a/mm/gup_test.c
+++ b/mm/gup_test.c
@@ -59,13 +59,15 @@ static void verify_dma_pinned(unsigned int cmd, struct page **pages,
 			if (WARN(!folio_maybe_dma_pinned(folio),
 				 "pages[%lu] is NOT dma-pinned\n", i)) {
 
-				dump_page(&folio->page, "gup_test failure");
+				dump_page(folio_page(folio, 0),
+					  "gup_test failure");
 				break;
 			} else if (cmd == PIN_LONGTERM_BENCHMARK &&
 				WARN(!folio_is_longterm_pinnable(folio),
 				     "pages[%lu] is NOT pinnable but pinned\n",
 				     i)) {
-				dump_page(&folio->page, "gup_test failure");
+				dump_page(folio_page(folio, 0),
+					  "gup_test failure");
 				break;
 			}
 		}
diff --git a/mm/hwpoison-inject.c b/mm/hwpoison-inject.c
index a11222572f97..127e5d75aa0d 100644
--- a/mm/hwpoison-inject.c
+++ b/mm/hwpoison-inject.c
@@ -131,7 +131,7 @@ static int hwpoison_inject(void *data, u64 val)
 	 * the targeted owner (or on a free page).
 	 * memory_failure() will redo the check reliably inside page lock.
 	 */
-	err = hwpoison_filter(&folio->page);
+	err = hwpoison_filter(folio_page(folio, 0));
 	if (err)
 		return 0;
 
diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index 0c96eb511997..771a75eb5505 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -1400,7 +1400,7 @@ static int __get_hwpoison_page(struct page *page, unsigned long flags)
 	 * unsupported type of folio in order to reduce the risk of unexpected
 	 * races caused by taking a folio refcount.
 	 */
-	if (!HWPoisonHandlable(&folio->page, flags))
+	if (!HWPoisonHandlable(folio_page(folio, 0), flags))
 		return -EBUSY;
 
 	if (folio_try_get(folio)) {
@@ -1777,7 +1777,7 @@ static int mf_generic_kill_procs(unsigned long long pfn, int flags,
 	if (!cookie)
 		return -EBUSY;
 
-	if (hwpoison_filter(&folio->page)) {
+	if (hwpoison_filter(folio_page(folio, 0))) {
 		rc = -EOPNOTSUPP;
 		goto unlock;
 	}
@@ -1799,7 +1799,7 @@ static int mf_generic_kill_procs(unsigned long long pfn, int flags,
 	 * Use this flag as an indication that the dax page has been
 	 * remapped UC to prevent speculative consumption of poison.
 	 */
-	SetPageHWPoison(&folio->page);
+	folio_set_hwpoison(folio);
 
 	/*
 	 * Unlike System-RAM there is no possibility to swap in a
@@ -1808,7 +1808,7 @@ static int mf_generic_kill_procs(unsigned long long pfn, int flags,
 	 * SIGBUS (i.e. MF_MUST_KILL)
 	 */
 	flags |= MF_ACTION_REQUIRED | MF_MUST_KILL;
-	collect_procs(folio, &folio->page, &to_kill, true);
+	collect_procs(folio, folio_page(folio, 0), &to_kill, true);
 
 	unmap_and_kill(&to_kill, pfn, folio->mapping, folio->index, flags);
 unlock:
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 796af1028ee2..47bf3b5d3ff2 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1952,7 +1952,7 @@ static void do_migrate_range(unsigned long start_pfn, unsigned long end_pfn)
 				if (__ratelimit(&migrate_rs)) {
 					pr_warn("migrating pfn %lx failed ret:%d\n",
 						folio_pfn(folio), ret);
-					dump_page(&folio->page,
+					dump_page(folio_page(folio, 0),
 						  "migration failure");
 				}
 			}
diff --git a/mm/memremap.c b/mm/memremap.c
index accba23aef28..70cfd3f05a25 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -467,7 +467,7 @@ void free_zone_device_folio(struct folio *folio)
 		break;
 
 	case MEMORY_DEVICE_FS_DAX:
-		wake_up_var(&folio->page);
+		wake_up_var(folio_page(folio, 0));
 		break;
 
 	case MEMORY_DEVICE_PCI_P2PDMA:
diff --git a/mm/shmem.c b/mm/shmem.c
index 07b2855dfb7b..1dca70978ac9 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -6195,7 +6195,7 @@ struct page *shmem_read_mapping_page_gfp(struct address_space *mapping,
 	struct page *page;
 
 	if (IS_ERR(folio))
-		return &folio->page;
+		return ERR_CAST(folio);
 
 	page = folio_file_page(folio, index);
 	if (PageHWPoison(page)) {
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

