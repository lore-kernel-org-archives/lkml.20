Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E95D3D953B
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792032829; cv=none; b=YjFkkFpSb7KqQkblg4N4wJm4Jx9fU/qByeg3MEdrw/5y0YM5/xrFlCisaPFtgFgIgXW4TRl8WX+iymyHY+SMIy36NQNv3Iq/sgEDXfJzpWX96VgJeN6GfYmhTt1FzSpBkIC9t6wGXXmEWvF6tn5J4vKjV0AFXQZ3awhDPsC/6VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792032829; c=relaxed/simple;
	bh=iU9ZRLyySo74AB9A1zhSn36j6jhUhvpNTo1u5XM2BtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lt72iKUXYsdrbu92vAJ7lY4sEKdtEv0yzZ7ig/ylLJS0ARRe7M/Jz4EraVtpBOEF8Qrp5LiybPrV5b5Ou9VRAt/9IN2oz+w7hm/4o1PGcrqPla13IqQXxkpkwawQemn9baQ+sqmYRutxHPt+yCiXYC0QfHEAUBbovj0JU001hho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=byssasUj; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="byssasUj"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8897e83332fso3074728b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792032828; x=1792637628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X0jwQSa7/KFwBhQ0eU8j/tY9IdNhu+VSiabnKKJdx54=;
        b=byssasUjKSFFgorwMItuhyRSj4MWXnZagWcWw4Zkxw6NeWeXwRvloX7VKhv0VX193V
         IJO2SxuHz62FA9EtfPXp7qQGEaqZ79gOxrklNx9r0DRVyXbySQ0BbnbiOJh+03vaUgx9
         bbEOHIvgAuFi4vXhUu+/oVBLiK0OMkJJhoGmy6ZVIwbQt5z56jiX6rrRE7yRCJVHSlgF
         vPSNbIMC+YvDGuMO/++OyR/zJ2bLQxy+kJv6jBZdgv1HiEzd2ATQcUngAwTQOt/CKpeX
         ej9Q6rAdTSuZ29s6Gg5dP5pQz8lwoOQasHVLXC1CqkTSWHTOzjv1CPeY1Lmo9WKLFMU8
         +3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792032828; x=1792637628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X0jwQSa7/KFwBhQ0eU8j/tY9IdNhu+VSiabnKKJdx54=;
        b=CZErB13FDzwZsJHPjh/VY3a54crMZQIkLxf73N2PT4eCNgFXHr+m5sVYPAsPIk4ux7
         zXpuichlRCrHxd2hQC/q6rc1+PJ8kArdzk5xRcEjwW/lqxpHirfxk5zzvw95+unlTpmN
         aWLG6LjbLa0Om5QVGmOOQL8kP4q8NQcOOoOLSFknnotgcKiix+ahkN/Z6WZrjtrK3Hh/
         U6Mr4lU5TiX2tLnQJqf/hccaM939eCz4X8kDRbhuLrj6NhwwMv5kRet6xVernZu5SISc
         eXI3bzju/8GK3mBxGpRJLqh1sS+dbq/xBF/Ny1xnRYDIoVgpKcAWpZO39Lh8CvchKfFP
         FpFg==
X-Forwarded-Encrypted: i=1; AKwUvBw0+Y0+kJPSxxVzchm7f3S6UOYEOigYnztMTAdTTKuIYtTStUrPKxcE2X6BkJGc27uyOl0MqmxPLNhb7kI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKS8zqEHHCbJDlHqgN6x29D2z61QrHkIB1PbMmmrW7zv+nQ+96A
	aaWADfQmHoRdix1EoC3zeoM0blHh1KV0UGxgFOw7+P4TtdIosJTP78mM
X-Gm-Gg: AYBFou3aoSy+ApgyQxv0+/Ygd5+MZZ/l/ygEvRLwBIfuXQCqKRg2JC9Y/h41V/lnZod
	MFojQkyf3Q/yODwLkZwPJzCPJXX6kd2/bypp6WcBVa4/NBvDgiDlevyxZKsC6jzgrDnenBpzpBX
	8frXndWOs13eS/lg+TbBWWO8hHABbZH7HnI+oSy2ufWJFpx/K7+xnS7uDK1bZUZWznQZYjlbtHy
	8F4ATfk9Y8+P0Hyv9QWHzqvnyY70e9SwbLP2itV6jq1ujyPSfy5MZ5gZ73JaErpjZbgPFCzJYrw
	RYHcAb+Hw19IxhWUFfrH7cvDsT8rbkD+2jwF5y8UOHJj960FKUCKo2M+01IGlYnK5Tkua0ztOcd
	n1BZrDGJrkIVY3T88v2+B+RdqcqIO19BGGH+wis8zAzvcikzvgCzxB/BBuI+kueCbsKGIBL5ufE
	ehFZ8+eltmRg98NQXVaHUO576FwJ2kNr1wSndzZzHFIlM+GfD3N5IRwyUOg/fXPyWIDUaTctnZm
	eWv6vy89r01temrGBwyMbUlv/59FOQHNKy3mAxqWCzDFig+0+JjjspUWkGg1SCJ
X-Received: by 2002:a05:6a00:c4c6:b0:88b:7e32:d91 with SMTP id d2e1a72fcca58-897d316cdbfmr7112036b3a.6.1792032827798;
        Wed, 14 Oct 2026 19:53:47 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::a891])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d802d10besm1706735b3a.28.2026.10.14.19.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:53:47 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: akpm@linux-foundation.org
Cc: david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	fvdl@google.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Ivy Lopez <skunkolee@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] mm/cma: fix list_insert_sorted() ordering
Date: Wed, 14 Oct 2026 20:53:40 -0600
Message-ID: <55118c45ec8251d7be2eaab87d9c0af4b8513161.1792032699.git.skunkolee@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1792032699.git.skunkolee@gmail.com>
References: <cover.1792032699.git.skunkolee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cma_declare_contiguous_multi() uses list_insert_sorted() to keep its
candidate ranges sorted by size, largest first (revsizecmp()), and by
base address, lowest first (basecmp()). Both comparators return true
when the first argument sorts before the second.

The helper stops at the first existing entry for which cmp(entry, new)
is true and inserts the new range before it, which is the reverse of
what is needed. If no entry matches, mlp is left pointing at the last
entry and the new range is inserted before it instead of being
appended. With revsizecmp(), inserting sizes 1 2 3 4 yields 2 3 4 1
and inserting 4 3 2 1 yields 1 2 3 4. The first range inserted stays
at the tail until it is evicted.

The caller relies on list_last_entry() being the smallest recorded
range when deciding whether to skip or replace a candidate, and on
walking the list largest first when picking the final ranges. With the
list misordered, a candidate larger than some recorded ranges can be
skipped because it is smaller than the first range found, so the
function can fail or reserve less than requested where a valid layout
exists. For example, free ranges of 4G, 7 x 1G and 2G, in address
order, with a request of 12G: the 2G range is dropped instead of
replacing a 1G one.

Insert before the first entry the new range sorts before, and append
when there is none.

Found by code inspection with the help of an LLM. No kernel-level
reproducer was produced and this was not tested on hardware or in a
booted kernel. The example above comes from a userspace copy of the
helper and the selection loop, written from the source.

Fixes: c009da4258f9 ("mm, cma: support multiple contiguous ranges, if requested")
Cc: <stable@vger.kernel.org> # 6.15+
Assisted-by: LLM
Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
---
 mm/cma.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/mm/cma.c b/mm/cma.c
index a10ea37a261d..527b2d894f3e 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -348,16 +348,12 @@ static void __init list_insert_sorted(
 	struct list_head *mp;
 	struct cma_init_memrange *mlp;
 
-	if (list_empty(ranges))
-		list_add(&mrp->list, ranges);
-	else {
-		list_for_each(mp, ranges) {
-			mlp = list_entry(mp, struct cma_init_memrange, list);
-			if (cmp(mlp, mrp))
-				break;
-		}
-		__list_add(&mrp->list, mlp->list.prev, &mlp->list);
+	list_for_each(mp, ranges) {
+		mlp = list_entry(mp, struct cma_init_memrange, list);
+		if (cmp(mrp, mlp))
+			break;
 	}
+	list_add_tail(&mrp->list, mp);
 }
 
 static int __init cma_fixed_reserve(phys_addr_t base, phys_addr_t size)
-- 
2.56.0

