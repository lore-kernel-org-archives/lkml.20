Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794540974;
	b=uMoXyNpfCdwQmlmKUQ8QhVJZDXpFcGCRgu2aSOM/sdHO+EBIWai46MBzEUQ+b/fj1V06
	 y1OaGA3HMYdoxaiKbcJWpwUqyOL0oKB83ZBgQLW+RDFurZG5X8ZJQ0T/GrQw54+9xQhlD
	 tvmW8cJhyXq4c3D1G63MtFVaQI8sCs7Bwtf+gWRnbXggJtZDPtMX4qGziF3bmiiJs1SUX
	 0QbBddWzZ6VQGEKJlX+lBGo5/hP3oAP6dvYz/l9AyZFHTy1dwgG2+4PxomLwHT/CBwXzV
	 H1lWdMaHUM8iTlIwvCIHfaj7BUhieBdvl/EdZ4lxW8dDgsVNJPzOih0RsYddQTt4laQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794540974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MM3wjom5yAriymyNPmygQnv5oEj8oKEWZWmGqerfl0Q=;
	b=gSQy67ALmN6LMtm8j3AECkWMVtN2YhjAYm2jGT7r14M1c3BlF3CctoOWAjzwf8AS2YMC
	 wOuR6dchZ1xKUWM0kQMBgmfb37tTP71+hWAzx6CM5RX4pxIKbnpKs2f3o/U1i6KiJEHQq
	 ZAXqA8D4OSn7hq6+WTjcHYer1IsGIa5AEB9jGyVyLlqo1/3nk92okv5Dnb04SZDoovjzz
	 PILKRje6/Ucck+foaTRIfl16xhj2XckvWfVTlVAGj5HikK+ApNY4H3jBpg2G41TmPavVe
	 JVJ4FIlADnk0Pkh2YwWaO+UT8o+uvnM8KkeJ9JR8v71NpDLTLJ8yqf7LoHRwk982sjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=CJKUOmKy;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608CC606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:36:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 608CC606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=CJKUOmKy
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3704d30b84fso703416eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794540973; x=1795145773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MM3wjom5yAriymyNPmygQnv5oEj8oKEWZWmGqerfl0Q=;
        b=CJKUOmKy1IupEi3aa4t5h3W6dfyV14yqBPavmg52NpzZ9SSqtMl+qZnAGE81WQQ/qg
         gdprNsAHvl+mCvOD8egb3NaHJ8Po9bwGapW0IropV3ydmFia7nzJguC2d6hXBrl0ireP
         i/GDqx36oX9oNkEUWORYetAM4Pj9noheuq/K4kYDrgCs9ztv0G148D3WbwZxCF2NSxhA
         IUCa0H2pOJJnevxKkIdALAL2XVn4kWOijIhkUfasvsjN006UsejPUQrdOiRBb0JOLgek
         mTrFWo4TLjy91+yWDV0Ij2QkdFN37lZoH6Gd37IGJozedKx7d7ph6IohZ0gNP2YbtM+w
         U+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794540973; x=1795145773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MM3wjom5yAriymyNPmygQnv5oEj8oKEWZWmGqerfl0Q=;
        b=G48SKyykj2Iny8frrEiIO4mwqQjCaHTy8nL2uVtT9vG0uVBJgdMX6Alr0rLJ5P5bGh
         1rTX3hBZ2jfReUQDubyM8+n5yw2WHCf2x5KuKUBwvwWXXx1Oja4SkMfDP4v+7xjszOsj
         7NPZSQleY0pqsDNDwdSWFqcLQEEwOV94VfG5VcvgxW3mn61T4IxfvjsREEoRUgPTcCGO
         Q7+mMEra0dk84bRuCV4boz+pMPwft0kWtCA2JeyVfi/7JqWcwGBFvKRY8F+7afVmzf7T
         C62OOuEozbJoPC4ckwytAcWPWC9NoA6zbXLN6ax+K1FcYTYnOUEpiYocsuyEoxC5+wGx
         5SmA==
X-Forwarded-Encrypted: i=1; AL+hErHUerrV19MxSUdMeiJ+CcE40UhgTw2tIx/nyOJ7+N09BZ9Bv7mBPL0MKM9o2iQWxN76/fyciYq37w7BUhE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6MK9b3u1Is8A50nOo7F1LfgLLq39v1bsskij3COphZ9bhBB5k
	Kwolw/4qEaHnagFcMnMVOvREcjvxgrsD2IdqpGF9zfcNwHhDgiUZqKYNDvs4Ut0QSVs=
X-Gm-Gg: AYBFou0TWDAv2q7D9fehY14Ui+cN0ybL5Cx4Z1mNGE5KBWMZn2+/fuGWCEgPaosDOWu
	3Ecy3ZNXogmaY84I3VQqKUe3y+rc6UU9tgeq5h/YIcsPfE/FFs8Sis+eTI5XTACwkAV7wDHEieu
	QzRUXNoUaVY5TM3rY6M35d8c76Ye4wqZyMIwQc8JjLjbAQ+aaj+8mxA4QofsVKF0jALGgkub8Yj
	McbdUo86qqVlWilok0NMC8ovaoVs6uUxro6daAzoDVSiDfNneBiCN3WySi/x7Age2rAAl1XrTn9
	uSUEyC8CajyNWpCaQxJjdSvmSd41/insspT0zpTZdbWyJ102bJsORfFiDvIaVZA/5DgEENXZbnO
	Qw6qDiDB23S2+oWw2oFC8qwkdRCjespBxAFgTlARRn2rxg3pJmXm5qKmxHQZg0IZDrbHRd1PVLW
	7ykLuQ9OXq6fi+DNy2y28kvsTmUHsR8HfjFjgB4yBocjVDGNeudp8HtLTVtzLhre5bfvZiyDufK
	asUrLEAm9J1U4cWfD1yQTO56Jztq2y9xYfNQS2DOOdevEGnBgeJjiwaSPHuJBMmwHydGraA6DON
	lIaYxo8RKHxHrGasG7iQ7yb/SH5pAEm2iOY7E5np5sW/J/foR+TQaOG8aoowJw==
X-Received: by 2002:a05:7300:f544:b0:36a:1788:3d1c with SMTP id 5a478bee46e88-3796879f0bemr1153458eec.34.1794540972998;
        Thu, 12 Nov 2026 19:36:12 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm2959426eec.15.2026.11.12.19.36.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 19:36:12 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Mike Rapoport <rppt@kernel.org>
Cc: Li Zhe <lizhe.67@bytedance.com>,
	Andrew Popple <apopple@nvidia.com>,
	Balbir Singh <balbirs@nvidia.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
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
Subject: [PATCH v2 12/14] mm/cma: centralize CMA pageblock initialization
Date: Fri, 13 Nov 2026 11:34:40 +0800
Message-ID: <20261113033442.62970-13-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261113033442.62970-1-songmuchun@bytedance.com>
References: <20261113033442.62970-1-songmuchun@bytedance.com>
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

Early reservations made with cma_reserve_early() currently require callers
to set the pageblock migratetype and update CMA statistics.  These
operations maintain CMA state and should be handled by the CMA core.

Move initialization of early-reserved pageblocks into cma_activate_area(),
alongside the remaining pageblocks.  If activation fails, restore the
managed-page accounting for early-reserved pages because they remain owned
by the caller and are not released by the CMA cleanup path.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/cma.c     | 16 ++++++++++------
 mm/hugetlb.c |  8 +++-----
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/mm/cma.c b/mm/cma.c
index 9ec1d1fd5dff..46e72734ba72 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -163,6 +163,10 @@ static void __init cma_activate_area(struct cma *cma)
 			count = early_pfn[r] - cmr->base_pfn;
 			bitmap_count = cma_bitmap_pages_to_bits(cma, count);
 			bitmap_set(cmr->bitmap, 0, bitmap_count);
+
+			for (pfn = cmr->base_pfn; pfn < early_pfn[r];
+			     pfn += pageblock_nr_pages)
+				init_cma_pageblock(pfn_to_page(pfn));
 		}
 
 		WARN_ON_ONCE(!pfn_valid(cmr->base_pfn));
@@ -191,12 +195,13 @@ static void __init cma_activate_area(struct cma *cma)
 	/* Expose all pages to the buddy, they are useless for CMA. */
 	if (!test_bit(CMA_RESERVE_PAGES_ON_ERROR, &cma->flags)) {
 		for (r = 0; r < cma->nranges; r++) {
-			unsigned long start_pfn;
-
 			cmr = &cma->ranges[r];
-			start_pfn = r <= allocrange ? early_pfn[r] : cmr->early_pfn;
+			end_pfn = r <= allocrange ? early_pfn[r] : cmr->early_pfn;
+			for (pfn = cmr->base_pfn; pfn < end_pfn; pfn++)
+				adjust_managed_page_count(pfn_to_page(pfn), 1);
+
 			end_pfn = cmr->base_pfn + cmr->count;
-			for (pfn = start_pfn; pfn < end_pfn; pfn++)
+			for (; pfn < end_pfn; pfn++)
 				free_reserved_page(pfn_to_page(pfn));
 		}
 	}
@@ -1110,8 +1115,7 @@ bool cma_intersects(struct cma *cma, unsigned long start, unsigned long end)
  *
  * The caller is responsible for initializing the page structures
  * in the area properly, since this just points to memblock-allocated
- * memory. The caller should subsequently use init_cma_pageblock to
- * set the migrate type and CMA stats  the pageblocks that were reserved.
+ * memory.
  *
  * If the CMA area fails to activate later, memory obtained through
  * this interface is not handed to the page allocator, this is
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 6ee36ca5f435..f70c1373235f 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3267,9 +3267,7 @@ static void __init hugetlb_bootmem_init_migratetype(struct folio *folio,
 	WARN_ON_ONCE(!pageblock_aligned(folio_pfn(folio)));
 
 	for (i = 0; i < nr_pages; i += pageblock_nr_pages) {
-		if (folio_test_hugetlb_cma(folio))
-			init_cma_pageblock(folio_page(folio, i));
-		else
+		if (!folio_test_hugetlb_cma(folio))
 			init_pageblock_migratetype(folio_page(folio, i),
 					  MIGRATE_MOVABLE, false);
 	}
@@ -3332,8 +3330,8 @@ static void __init gather_bootmem_prealloc_node(unsigned long nid)
 		 * in order to fix confusing memory reports from free(1) and
 		 * other side-effects, like CommitLimit going negative.
 		 *
-		 * For CMA pages, this is done in init_cma_pageblock
-		 * (via hugetlb_bootmem_init_migratetype), so skip it here.
+		 * For CMA pages, this is done in cma_activate_area(), so skip
+		 * it here.
 		 */
 		if (hugetlb_early_cma(h))
 			folio_set_hugetlb_cma(folio);
-- 
2.54.0

