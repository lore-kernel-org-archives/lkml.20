Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116020;
	b=cWMZxDatTRPbLDqNVn+5lR5nLox0H2grlFwqeh4TqbOKOYKv4wso85W/Wl1mYP9TnkCT
	 QvmD503i4u3/eLumLCPkKivgPb5A8idpMVyx5XSZW2QbP5CN0ooYYGSZZG3WIlD8NVtG8
	 M3HeKRhagBN39MzMXfAXwr3xLfgSqsUJfs+oYk+QS1VF9MISril9NYRwyS4OUToAgdXYj
	 rV1r1p0A3nY8tcD2xYjvqOo7jvRNdqHKvhPy9WuCGqma7CKqhY95rySmlP0TJ2+2M5b9q
	 v+sO7+d1s2k+7o16zNuQd7xdMEW/JIHjYHOIDfhQraqaZxdAA84XhQJHuaCGIgyrAnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116020;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=seQJ0RkpYsv0DnDnr/texKmVDxEFVMoOUeLo6OCf//M=;
	b=u0SHTcBbskoZewPiibuM1s85OfHjRzxLQkWx9haTG5Es0k9A4ILXKgE3OCJnkD3jbTKS
	 vynXYUBXNUEC1knNTGY9AIH8AStTWISDSsSoQBg4yfz7Bcz5v7yMl+E5fQXziRTQfEnqR
	 aymDen/CcDP7e6YQ/jOluHq1KoYslN0nMg04BfF96zVuyoWMwPcvCMz793tUp25Pxfs+P
	 vy8VFevRvEJi9s2/z7ggT1rx71orONe9RUHVH9wxBVTHybEQWGyga1UupSWqBmc/kNWFY
	 gHfxSUvVz+AZQCiO+M88ehrAU6fDHCcI7FYiLp0nywUo6LY6Ff9a0NJ+pCmCzBmAs0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UhCwhlHW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA4C60A5BE1
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UhCwhlHW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E6D1F01300;
	Tue, 27 Oct 2026 15:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793116019;
	bh=seQJ0RkpYsv0DnDnr/texKmVDxEFVMoOUeLo6OCf//M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UhCwhlHWqRSNVp4V+PNk+6LOLtxBDSg4RhoIkr0OuVQoKO77yc1WMcPQ/qci8QG1+
	 n55kHT7Ssw87wyF8y4YnNchXx2zle0vmSX41KWVTtuqkzl/SzeFaF1U/RPrmXspkKt
	 hk/DDiICVG1ziAdCCYKnrz6UAgUeqtZAd0w30XWfQxYTXTeXxFWEedK537/wSL7AMl
	 19zZr/IgEn3PEzEgbbbgJqtFp+LA7Px2HDTnkazCYYWye2Qnm94zoo2gbmDK+451sS
	 WqdWnzHPIKR9biYySf+1pl5K+iB+NW/6RXNmoSOLmWQB4Ow7P9HDBSdVBsyLRGb1b7
	 1JeOZ/VEVaViw==
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Date: Tue, 27 Oct 2026 16:46:33 +0100
Subject: [PATCH 7/9] mm: page_isolation: do not take slab pages for free
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-pgalloc-ai-hotfixes-v1-7-9c7d1aca801e@kernel.org>
References: <20261027-pgalloc-ai-hotfixes-v1-0-9c7d1aca801e@kernel.org>
In-Reply-To: <20261027-pgalloc-ai-hotfixes-v1-0-9c7d1aca801e@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Mike Rapoport <rppt@kernel.org>, 
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Brendan Jackman <brendan.jackman@linux.dev>, 
 Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.16.0

From: Josef Bacik <josef@toxicpanda.com>

page_is_unmovable() regards a page with a reference count of zero as free
or about to be freed. Since slab allocates frozen pages, they will
be wrongly considered to be freed if order 0 (higher-order compound
pages are caught earlier).

If such slabs are the only unmovable pages of a memory block, memory
offlining now isolates the block, this can lead to offline_pages()
looping without progress.

Thus detect the slab pages as removable to return -EBUSY, as would
happen before commit 9aec2fb0fd5e ("slab: allocate frozen pages").

Fixes: 9aec2fb0fd5e ("slab: allocate frozen pages")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
---
 mm/memory_hotplug.c | 7 +++++++
 mm/page_isolation.c | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 796af1028ee2..e773a7d54165 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1847,6 +1847,13 @@ static int scan_movable_pages(unsigned long start, unsigned long end,
 		if (PageOffline(page) && page_count(page))
 			return -EBUSY;
 
+		/*
+		 * A page that was allocated, but was not a slab page yet, when
+		 * its pageblock was isolated.
+		 */
+		if (PageSlab(page))
+			return -EBUSY;
+
 		folio = page_folio(page);
 		if (!folio_test_hugetlb(folio))
 			continue;
diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index 5aaad037384e..f4f0571607ab 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -74,6 +74,13 @@ bool page_is_unmovable(struct zone *zone, struct page *page,
 		return false;
 	}
 
+	/*
+	 * Slab pages are frozen: do not take their reference count of zero
+	 * for that of a free page.
+	 */
+	if (PageSlab(page))
+		return true;
+
 	/*
 	 * We can't use page_count without pin a page
 	 * because another CPU can free compound page.

-- 
2.56.0

