Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218342;
	b=Kfsqu60dd4eR5+NDEM7rd3Cwl/pekFusxyiuQ3f8Ih6FxACUmeDTuOqTYg55q+Nz84Ge
	 V2v+dsKaZoO4VKHu/KRYiamiI1wog+0IMM0jjTAckwROkzU9VDK3x+4pCXmskKP3e2UlZ
	 i9wOKGKx6sioRl/yyS5t/ihq0PfU/qLKX++taJw/Xg7MyKgZqlYKkAEa0+ERQeWr8hOX7
	 XbuTYSwpjXyYeqMc77fsIPxAQVtntoDcOdxjesy1j+Q4xL6GsQQyKoIGwS8EuOqLqLujV
	 +X7gwIhVQsiMdOQJgKmZgaADC4/wvZ1sLD0s2+snGtGcNYuAmWbHICCS/CZWCD1iSOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=To4BA2WdbYiQnlb3QwwdIbRfoel2CyTLdH5PXVnKES0=;
	b=0spWlk1ssLxVILld0a3o06gqZ01RkKcgnrE8KPo7jhkMyqWtPwxRbxIPYk7aa+zuK8y8
	 brBCx3mFhbGcxO6/YQuibP/l6Z8miY3yctj0G2C3XFY8Bewd78L3pYpZVimzmJ+0ywJjS
	 WAVuNgocRpxFhzsjbbu3beL1FwUnOQd0hcqWjp3c+cbK24Lc4wXQaHPwKL8Ldt/Dz8US6
	 xmpX9fjpAK7cvgCsT42PEfxPyuiH85UZ0GqOgNe6iuAWCEIF0TqIby8em5Dsd4E9KX1xm
	 egrVLopreu3dAe1XxYsrObxVLxnrUNGdjP9my7iM3EUxucnaVqJeMjlBIJqZjfbJ5cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=EUKEjLCm;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2112D606D834
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:59:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2112D606D834
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=EUKEjLCm
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso1039738c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794218341; x=1794823141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=To4BA2WdbYiQnlb3QwwdIbRfoel2CyTLdH5PXVnKES0=;
        b=EUKEjLCmvLWjyHmGa6UfBPHXZvgPya4kM9JwAMceP5h+aUZkE2RBOh3kuWLJR5voVp
         CYljI7rVr2mA8+M2BmIpSNL3Mci8eP0AjXxHqeYQzXr1RMOeBAeh4QhR76RqIdpXldiR
         3JQzrs+EpZ03RmJmoV8o6RJrQHPyixKyv4hKvwBgPeOQ+5u6bysszN/lYkF11mmHLHkE
         e6/ig/HgdD7r2EEJx/EMiSl0pQd4u+Kl+SPz5ZYaxStQBzHlS2w3SNth2v90Ut5OIATd
         6cTwSKlNEoJUIoivLwMUu3hkg7l1AxcdPKBupuvI+UEQ/NFuJXvgMwzCwu04J96nfEdq
         I8eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218341; x=1794823141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=To4BA2WdbYiQnlb3QwwdIbRfoel2CyTLdH5PXVnKES0=;
        b=CsChnUMMeKnMcQk0rnB3/TiJ/4Xd6hBhbdfxjMKPc5ZRH2muGg/eciezfjnGWoQUNy
         MpfZiLLtgWTtjczpwXtbTKrD1a/uq/OMzEpy8Q5XTWBueCkfrZLmHIYVOb2pGlsg5ORI
         nXxAgPi91QtcgMbw48ButdB2w5kEWYnCpiZxx8q4c0RlwxWNUujATfYBeR6ZCj/l4EuL
         qm6JCYc1i48YbRULE1eNZwUaAFaxDZCU4DRJyW1uNPZXHiJkiS8GWD62jz3fzNCrQcqc
         uG989v/c0g68VjgUzZilyzgsOVtqTsqQ9kaMsNkf9ExAvHH0prgQwNMFXMLcQJC+xlGP
         NIJg==
X-Forwarded-Encrypted: i=1; AL+hErEPdZ/kvRuUaGRfuH2XQUbkvN7yjx6ed3ztGc/9Dd6agPDLwx/9JvbI+hSOSDF0x8NnQzPbArHq8m/70+k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+p5Gjinct8TARG/RRW4VgY2zYE+ePt0P4KHuEzmuF8TYjC36oO
	alM9HqYub4X24UBs2u3/XteoOTdBqLhGh3FfNHDlYh5j7I2MYFCZg6BrAz4ZTWg/GgI=
X-Gm-Gg: AYBFou0GO+lTh99kB/0HCSBFQeFR9OMKMzBEsYEG11HQGLGnwY72HxAXNxWOPlfsRO8
	Hi+QsLNoR6qp8dzfD14xXrffHp/FRLIwm1+tTXqge2hpQzBjdlWkLfG7th7hz9nY8ZuDrbaDhDc
	Pwpmjgsyz5RN77HG2WCAb2780QLjIP9AWojRpXuWU4lwJGvngvwlpua084bRq/8aX98eM2+8uHK
	WzEGwbecDwPAWHuDQ1s4SVRShoChBD8Tc7Xp8Sf/PIEtqBvjht7ljUFZjKYrTWHuTDh/jE2AkrU
	T2d0va4KTiU1qR0cXUMDfOlMXYuDEQQCKC5p5ohERp4X+k5eV7weli7shjZ5RSrOB+W5kdOFFfv
	uB15rwXAk2rhE8VoDlOTxTUSW4b7xUei65Npo/MRbmU7MGHmsRiYY+2CuFZ4Kp3L+6hbkoGtqTD
	J5OePu0GdxUHrreBJHLFqv2WuFl6NjlAuAYvf3E4UvCmWs4Y1qfIqnYBC+uunf78a2sLcaKhUSM
	+yqqfG5MhPx+ZBMJmXKzPjBOxI00XlLv/UZn/48ZvbH5fUbbVuXEytn7kw4j1/sPWZM7B+fqvXj
	1l4P9YmuQtjvsSJE3ffhBi0vanVCoJR/HVmiRqYYBG/VRupgtjOb4rSqECyzO4nrfsiowajcuAk
	KoER0o1g=
X-Received: by 2002:a05:701b:2303:b0:191:ac4:55a7 with SMTP id a92af1059eb24-1b39fe95e8fmr5401187c88.23.1794218341054;
        Mon, 09 Nov 2026 01:59:01 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.10])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e8911sm12841684c88.5.2026.11.09.01.58.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 01:59:00 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Mike Rapoport <rppt@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Muchun Song <muchun.song@linux.dev>,
	James Houghton <jthoughton@google.com>,
	Lance Yang <lance.yang@linux.dev>,
	Qi Zheng <qi.zheng@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH 10/11] mm/cma: localize init_cma_pageblock() to cma.c
Date: Mon,  9 Nov 2026 17:58:05 +0800
Message-ID: <20261109095807.41547-11-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109095807.41547-1-songmuchun@bytedance.com>
References: <20261109095807.41547-1-songmuchun@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move init_cma_pageblock() from mm_init.c into cma.c so it lives
alongside the CMA code that uses it.

No functional change intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/cma.c     | 8 ++++++++
 mm/mm_init.c | 9 ---------
 mm/mm_init.h | 8 --------
 3 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/mm/cma.c b/mm/cma.c
index 46e72734ba72..7ca0e100504d 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -30,6 +30,7 @@
 #include <linux/io.h>
 #include <linux/kmemleak.h>
 #include <trace/events/cma.h>
+#include <linux/page-isolation.h>
 
 #include "internal.h"
 #include "cma.h"
@@ -138,6 +139,13 @@ bool cma_validate_zones(struct cma *cma)
 	return true;
 }
 
+static void __init init_cma_pageblock(struct page *page)
+{
+	init_pageblock_migratetype(page, MIGRATE_CMA, false);
+	adjust_managed_page_count(page, pageblock_nr_pages);
+	page_zone(page)->cma_pages += pageblock_nr_pages;
+}
+
 static void __init cma_activate_area(struct cma *cma)
 {
 	unsigned long pfn, end_pfn, early_pfn[CMA_MAX_RANGES];
diff --git a/mm/mm_init.c b/mm/mm_init.c
index b719e6f82d66..61a720bb44dc 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -2205,15 +2205,6 @@ void __init init_cma_reserved_pageblock(struct page *page)
 	adjust_managed_page_count(page, pageblock_nr_pages);
 	page_zone(page)->cma_pages += pageblock_nr_pages;
 }
-/*
- * Similar to above, but only set the migrate type and stats.
- */
-void __init init_cma_pageblock(struct page *page)
-{
-	init_pageblock_migratetype(page, MIGRATE_CMA, false);
-	adjust_managed_page_count(page, pageblock_nr_pages);
-	page_zone(page)->cma_pages += pageblock_nr_pages;
-}
 #endif
 
 /*
diff --git a/mm/mm_init.h b/mm/mm_init.h
index 1a1cde5126c3..54d6043bed9a 100644
--- a/mm/mm_init.h
+++ b/mm/mm_init.h
@@ -40,14 +40,6 @@ struct zone *pfn_to_zone(unsigned long pfn, int nid);
 void init_cma_reserved_pageblock(struct page *page);
 #endif
 
-#ifdef CONFIG_CMA
-void init_cma_pageblock(struct page *page);
-#else
-static inline void init_cma_pageblock(struct page *page)
-{
-}
-#endif
-
 /* Memory initialisation debug and verification */
 #ifdef CONFIG_DEFERRED_STRUCT_PAGE_INIT
 DECLARE_STATIC_KEY_TRUE(deferred_pages);
-- 
2.54.0

