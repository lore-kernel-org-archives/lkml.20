Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218338;
	b=Jn2b8K+ycz0Va8N6aKZKh2K1oDB0ATJgMvHiZSOhtb1/1kLGuzTQNW+MmtC6BzzPYQEX
	 PUTgzx1q2G1rg0vG9Q58DUcqYl9UA+HYd0+/u7I8TvvyflqAu1qz+Z4+lkG2c9p1fo+ZI
	 JvWmE2s899AUKvDGIHmXQMOywzH5VQFMz0OtZhcePnrVh+FUy8ZpLn3FjopqJP3jGv//G
	 3cPGp42QixzN1iqhdjUnBYeU39zlbsk+A0halobkYhJ/qc9kl1pYj/fmifXSJwlGcq0aT
	 UMmAlKbbTT0WVD0HO6wGCzB8R7jc/ZjBJyq4aA3ieC1WZiM4WGk6vClIcm/KbI1YBiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qD558earAYl8br9aRG0HhwUdpfvjBgTnem7osajkDSA=;
	b=VoHD7eMKdQv6UK8NHK1L/aI31Dg5amJy05krrsPGD7NMcbJTTCF74r0jbBHCLnrz/IvY
	 zcO6DVUgH4yx7nbLZ3bjEyTfW5P7d4CeGDDQwucJmKvdOKR0vQTN79R/mTcz0IWsXG/sq
	 s29+0C1t52HwuU383lQ5lkUfoXn3/1roXidkPLnHhUhfhdJ7YrTh2EcxsaFWvhoVrP+z+
	 HrhOxu/Llq95b9snixIrAkZQP/Iq4nAdHl7dVFxRep2vGxrB5USrJAvAxKno9KMvTKNfm
	 1I6EC+vusHQh2/2UdFIyxUupqBUYLvTyelThIfXMwR3mS0r2x5ByGG/doj4hxHOM+JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=j+Zl+mqG;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1D5606D828
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:58:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD1D5606D828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=j+Zl+mqG
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1aefd1bf74aso565375c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794218337; x=1794823137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qD558earAYl8br9aRG0HhwUdpfvjBgTnem7osajkDSA=;
        b=j+Zl+mqGB8pX1v/q3KQqAO83dXP6emeWV5C5Vs8xUpNwzoxMDr+Jwm5EFhN9ORBWUh
         Jm8ufzmt0K094DPAND2jmKm/PO47Oreoi6K/f0ujKxV3Llz6p8NH5LEA54rqfjD7KO8g
         tPxLEUrbX7cm21VhZpVLnC2IYl/9449Ttp/AVLRSmzF5/Nh/gFOqf/MUqJf4EaEyeaHX
         4ET7ZBh33cEHiWDg2O+9mYkvPMmrJdXRMyC/ThKTA3PLT7IbRyEpjJsMuoBdc3aq1CfF
         AcIDd1jCAanKhbH3QNOD8lf5aOe+2Qfsz63Q4vmOuqJPemgnM7TLUNFLT9Ds5ZI9669A
         IciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218337; x=1794823137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qD558earAYl8br9aRG0HhwUdpfvjBgTnem7osajkDSA=;
        b=Te7MLSBVAzq+WjJi7WClz3rd7LhrwBl5s2dF4DpeC9lHofizObTRjstbxcbaaXelg2
         /DS2W0h6ZgmjWxyTdfN3cdxAclv5afKjYD1S0WavqVtscVUceHUFjSukXg2OnCMffTpf
         qv0+306RaTsIDz7ABp7hQF+PfwCo6j/h2fFTDuYhL0xljEvaaSorrg3X2ViKCq+nmyT3
         weC14Z/gQMk8UDqWpSWbylIkEs9EPNOHGO6W0gAl1GxDu2VzmXiC/emViubnnwD6Qpps
         RQ+qe+6Y/VgjKa/eP87uQZO6AokSQc4O4FvYsrC8is99sWNj0+LH2LQpVW0/i2na1LJy
         MNbg==
X-Forwarded-Encrypted: i=1; AL+hErEf8PWvF1gHJNT8bicVd1T/BrOR8FX0hngRI5nC+HFH/NV+HrvHJK9yRQVWTigH9gjtFSoU0J1ZOH3/Mu4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/t8HUVe7F5F2BCtwt76oiRqtYXJuzdZwnYqfXyErvC+jpZ/NCc
	eWXggfEhTcJkF+aJOp61mAI6AdutYxAYF2j/x4zjCCXNApbjgJ/2nxYksI49Bmciz2I=
X-Gm-Gg: AYBFou2WqQK69k0LAB2p6LbdrFlg6CZvjOXqZnTynqyBguUOVXjHV9KNTs75jia3TmY
	VvttZbBIs33TBugkQS63v4O4SutuxV3SZTHB4d91OUViLvXvX2y6hnvwx4BYzgUDp51qyUM+ZNF
	ZsyQRaUWhbyir7wQZVgQnIKC2mwaByjdleGhVExF9zWt5/Tc91qfM0TeFBxVgyFlJPD1y6FoC7i
	z9Rth3BWauypRVLlnPkv20FS9VOutGKJksAZG+2P865hUFuJHzoiXSDeQyRhP1p3BqNM+571y5p
	DL/6Bs4jXuowIfFjcJqq8Lem0NjE/Pr6yGkBAYQ/oZItgiorJNw1DYNPbzkwwp4d8h696LpIQIb
	P/w6V7mltgSuKOJMHJb7MbVPW5BYDmXzgs625Tq75lnEmgJVelaWEEFbnCDO6o50wbYstm05+By
	d57QWyc2F2DKdLvuvVtGErrA8QnDN11jLvG58Lrp6KXHalpMb0Pr1wdcOQUKRKqvglZn65oPQiz
	TNJMIker2Xo5kXiCTeZHf5i7nXVzEGkckmRZgAArkQIVxzEr5IO/ZIK6Tn2nOA3BmOcYsxl/Fyx
	+OKjCYhhnHdGQdahpf557hSgOAN0+Ljy6DmBKiy3rftCkzh/20f0cP9qLAg3/w==
X-Received: by 2002:a05:701b:4244:20b0:152:dd1b:4fa7 with SMTP id a92af1059eb24-1b39fece05cmr5579074c88.19.1794218336598;
        Mon, 09 Nov 2026 01:58:56 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.10])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e8911sm12841684c88.5.2026.11.09.01.58.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 01:58:56 -0800 (PST)
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
Subject: [PATCH 09/11] mm/cma: centralize CMA pageblock initialization
Date: Mon,  9 Nov 2026 17:58:04 +0800
Message-ID: <20261109095807.41547-10-songmuchun@bytedance.com>
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
index 290e7859b2d7..ee47a3b09df3 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3240,9 +3240,7 @@ static void __init hugetlb_bootmem_init_migratetype(struct folio *folio,
 	WARN_ON_ONCE(!pageblock_aligned(folio_pfn(folio)));
 
 	for (i = 0; i < nr_pages; i += pageblock_nr_pages) {
-		if (folio_test_hugetlb_cma(folio))
-			init_cma_pageblock(folio_page(folio, i));
-		else
+		if (!folio_test_hugetlb_cma(folio))
 			init_pageblock_migratetype(folio_page(folio, i),
 					  MIGRATE_MOVABLE, false);
 	}
@@ -3305,8 +3303,8 @@ static void __init gather_bootmem_prealloc_node(unsigned long nid)
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

