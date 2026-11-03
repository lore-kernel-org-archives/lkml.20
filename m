Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722625;
	b=AKOjXEY+/f9WbL+468Ef/YKrTF+RdMzSh+DK/KEGkApg31wsdFsYc+Jaia2aSkCmvrBh
	 j2SIW1r7cY3mQESkQjEBYhBVsvd75aZ9/r1OQRB7/lKY7DltM0sxlt6yThp7cqGmwzitx
	 vgfOmoIq8EkIWdctVF8jvExrx+lRs3PgCIb1dt+zMdRlf7ojuUG2RIdhtziu66Wt1lYB4
	 /k7AXP8Xshlg/3kIuI4tkJlzSe98AZcHNN8RN6bfNE0zxsqBAv/xgllwZ3iScICD/4Qj3
	 zXfulBi4XCtfebQ52As1ALmColzT06dmH+UNRCULG1RPPd4VE0biQa8aLQmbm10dU3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722625;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=6XkFTBaGPcV74Hvx3Jzk/fiQfWLpE7qRTByDVFKME8E=;
	b=HKcZAukiKCF+gdKaCeRwEeCeKQ08fEdUKt9gRcdc7G7YFZyy7zNEDEM0ZL1E7WoHcs6T
	 Yarqo9y5vD5NwYEDb5kdVecbxB90owwCp2ZyMszx7DYn/3FOZ7/Yp07JLGX3ea+AgZouE
	 IMbV5T1YOSZV6Ol/6Y/CpU/7Jy0Dpllq3vSTQobq3H7Ba/Jv0lKAcz6PYebN3zde317+4
	 QKyfLmss5+UABwY2QTgTj1WtX4L8DXSjCAioBIuWF4hdGpWrYFq9L8sLxN2R3bbZz2ygi
	 m/MsNnTthfU8ZeSiE4HU9zT7SaEFV7Vew8mHyjIsxbAro7fZYWJXX/0ryI4D69Gevcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="bbDjWhk/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404FB606EE90
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bbDjWhk/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB2311F00A16;
	Tue,  3 Nov 2026 16:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793722624;
	bh=6XkFTBaGPcV74Hvx3Jzk/fiQfWLpE7qRTByDVFKME8E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=bbDjWhk/HrON7r5DDzIx0zRhSP31IG/7Z9RFLl5dyFRXh/sKuD42LRnSXT45yPJHe
	 3ZkGK/wJzIp/gz8R2jzr5SkoNMY/qbszU3v6vb3ISSiiGNtghSakPYAPDPxvw0hx2K
	 fzendGOVPobWobrFQDpnvy9XRc3L/qAX80IYniQYVVJ7iNwIZTwgUdCfEqdIW0LAnf
	 pe46xIVHomUN0FRTP9YpY4sAbwhZfBZVLgi+uHSmWrDLhT3TNgNMBBm91RnU196c3a
	 yuQqyVVpUwBW4HER5FAAJjBCBZgrO0boOYDiTQ8I+kfnliJQiFzOZIwKeICoIDMNeE
	 eMuHHGywQCavQ==
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Date: Tue, 03 Nov 2026 17:16:49 +0100
Subject: [PATCH v2 3/5] mm: page_isolation: do not take slab pages for free
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
Message-Id: <20261103-pgalloc-ai-hotfixes-v2-3-e0d2890ab74f@kernel.org>
References: <20261103-pgalloc-ai-hotfixes-v2-0-e0d2890ab74f@kernel.org>
In-Reply-To: <20261103-pgalloc-ai-hotfixes-v2-0-e0d2890ab74f@kernel.org>
To: Johannes Weiner <hannes@cmpxchg.org>, 
 "Gregory Price (Meta)" <gourry@gourry.net>, Zi Yan <ziy@nvidia.com>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Mike Rapoport <rppt@kernel.org>, 
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Brendan Jackman <brendan.jackman@linux.dev>, linux-mm@kvack.org, 
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
Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
---
 mm/memory_hotplug.c | 7 +++++++
 mm/page_isolation.c | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index c9cc42e54f05..0ab9a6e09222 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1832,6 +1832,13 @@ static int scan_movable_pages(unsigned long start, unsigned long end,
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

