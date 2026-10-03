Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0FF21FF2A
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790986906; cv=none; b=JlNm4iPHyNStzI8xLy1olXrPiqIB9JHTr2eewqWUGZ4CEBVELTNTYDBMbkiAxXCbHPFEOCTJYJ15a36e5Kt5HzIjhC71DkPlJFDb00TevXDs/iT6ZMHl1irRYIItLdwL1PQ3l06PLFtrefRa72czRgO+ZBMaZ7yOtQn7wWv/vP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790986906; c=relaxed/simple;
	bh=/Uog/olHbJL3eoKXUOpYt4JihD2R8HVABatRqtZ74rk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ts/ADc9y4xtcU3y5gCYuIIR7E8FjccpK5lpIaaAGtML5SJ9AbcI9OposhNv7KKaGH58tssKxHYJZ0oDXAmL02uZqYTYLpuX3LlYTyyV9H7zoZZnfClx7Vl0xia1ZVADWnYTnHUg2x1SlKJQS8pCX3ui63+URMxF2MlJrLmgnffI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Pmir8geS; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Pmir8geS"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2df8484f12cso3925ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790986900; x=1791591700; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+0LSbObtLQixt10mRMgsu561+yH+1K8mdQenqKY5U4A=;
        b=Pmir8geSI+efC6da9ZDriD/xr63hhFDdpI1zD3bKG5/HUvZqOpRjAqzY3zGbwpCodz
         3IsZZEX8oQKX+PhZATrasHBxwYj3dmpg+wfVTBKoiYxG3xTjRQqhhcRBqeCjeaShm3gS
         nSY2nRSOFNBn9fAKayzoqa0lEQMKSL+plVjajrzwFCJAU5J12Tmj103GzQYJUGAgiq63
         mz35OdqgC+dW4HVFwkfdpyncXJ4bjI8iLo9Ey84RoxKXIRE8m7SXHIC+dOYeFLlb0CVK
         qXy04jrBFTEuXndgGRw3OjeSBzBjruPvng7lMA89uGoF9X4Z53U9bBu1mqnmPKmFJ/6C
         omCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986900; x=1791591700;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+0LSbObtLQixt10mRMgsu561+yH+1K8mdQenqKY5U4A=;
        b=B7tQ/UiAstS0FnWzUgs6hx51osjOBpOeKjm+1kRZaxQcmuGYM7zdxNFeKD02ddEwjT
         ovF4iFGrPcKUySI7oyko4ZX06pR9CJZCdYrm6p2s6zOQmw/ziKuCDExkDPTTc/QjuzQH
         wwVHIgQ3J0sxFs5JFlSF/aXUPdWDs+9a4onG+cswBMcFbgSvYSm75u+6AiO7jOOCRcfU
         QolhNmi3d1GMH03IMMHr0a9P2BmqIfKyCXYgwVKx/A3hAIqze3r6A5US+mMFP8qbDEBn
         ps4DU1cvsnUNzFPFoBWciGEqAlvn43odozHtT9Vf78N6ME0wHmPEVU5tazhJbRclsj8y
         8uig==
X-Forwarded-Encrypted: i=1; AKwUvBwLTA5/QT24KX+Z/2cN2cAQZHseJxwF+ZoLiKsvw1c0YGp1T08NyEdpGYmXHG2ggkPNgq0MpkbmkBBHgF4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSQ+Y7QR14qNGxTphDeyD1GiJzz9dj/ZeSMmoR1XseeXTW2hju
	lJFnhT10QHcfiv4fK3asf20CwoCr4OIA84tfTYzlctHPQVCJbDfAJyGjZTNkalj2K4kLmFBYB0l
	PrtKGkRfed5ev0Kvu+V7kfg==
X-Received: from plev16.prod.google.com ([2002:a17:903:31d0:b0:2e2:c8c0:e8e2])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e88c:b0:2df:ad58:cf54 with SMTP id d9443c01a7336-2e49b60b6c4mr40943675ad.34.1790986899505;
 Fri, 02 Oct 2026 17:21:39 -0700 (PDT)
Date: Sat,  3 Oct 2026 00:21:09 +0000
In-Reply-To: <20261003002123.505555-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003002123.505555-7-jthoughton@google.com>
Subject: [PATCH v2 06/20] hugetlb_vmemmap: Allow architectures to dynamically
 disallow HVO
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

For arm64, only some platforms support HVO. Add an arch hook to prevent
HVO from taking affect if the architecture lacks support.

It may be the case that arch_supports_hugetlb_vmemmap_optimization()
returns false at first but eventually returns true. This is the case on
arm64. When this happens, bootmem hugepages won't be immediately HVOed,
but they will be optimized in prep_and_add_bootmem_folios().

Signed-off-by: James Houghton <jthoughton@google.com>
---
 include/asm-generic/hugetlb.h |  7 +++++++
 mm/hugetlb_vmemmap.c          | 12 ++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/include/asm-generic/hugetlb.h b/include/asm-generic/hugetlb.h
index 635c41cc3479..8d24075d53d4 100644
--- a/include/asm-generic/hugetlb.h
+++ b/include/asm-generic/hugetlb.h
@@ -128,4 +128,11 @@ static inline bool gigantic_page_runtime_supported(void)
 }
 #endif /* __HAVE_ARCH_GIGANTIC_PAGE_RUNTIME_SUPPORTED */
 
+#ifndef __HAVE_ARCH_HVO_SUPPORTED
+static inline bool arch_hugetlb_vmemmap_optimization_supported(void)
+{
+	return IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP);
+}
+#endif /* __HAVE_ARCH_HVO_SUPPORTED */
+
 #endif /* _ASM_GENERIC_HUGETLB_H */
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 3fdb1e4ce1a1..8596a462fee6 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -16,6 +16,7 @@
 #include <linux/pagewalk.h>
 #include <linux/pgalloc.h>
 #include <linux/vmemmap-optimization.h>
+#include <linux/hugetlb.h>
 
 #include <asm/tlbflush.h>
 #include "hugetlb_vmemmap.h"
@@ -529,6 +530,9 @@ static bool vmemmap_should_optimize_folio(const struct hstate *h, struct folio *
 	if (!READ_ONCE(vmemmap_optimize_enabled))
 		return false;
 
+	if (!arch_hugetlb_vmemmap_optimization_supported())
+		return false;
+
 	if (!hugetlb_vmemmap_optimizable(h))
 		return false;
 
@@ -731,6 +735,14 @@ void __init hugetlb_vmemmap_optimize_bootmem_page(unsigned long pfn, unsigned in
 	if (!READ_ONCE(vmemmap_optimize_enabled))
 		return;
 
+	/*
+	 * Architectures may return false here but true by the time
+	 * hugetlb_init() is called. In this case, although the folios will
+	 * not be pre-HVOed, they will be optimized in hugetlb_init().
+	 */
+	if (!arch_hugetlb_vmemmap_optimization_supported())
+		return;
+
 	section_set_compound_order_range(pfn, 1UL << order, order);
 }
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

