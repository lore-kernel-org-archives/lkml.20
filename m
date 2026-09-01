Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FA646D541
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 23:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788305082; cv=none; b=A+19bEMXRpJBQwCMJ+G60WKu9kUI1WQM6Zwj/yr0FcxFa5RJTsBhXadSbwXpZzFLFOH5qDTKBZMPZTXKgGzJWc1Lb7ZhuGgMogMlDabLwdRYZ7lUm5K90a+ylvDQNHQNDYsePNwd2LiZwuchn6O1UVwW1MYqkHGhmanv1vz2ThQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788305082; c=relaxed/simple;
	bh=FsPLwYxEQmT+DPaufObk4MU47CT8l7EHpXts93nyAy0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KKdhCQYZLHlom/iEVEK6oEwKF4wK1480ukjqQOB9VWtC7LF/uwZgZ5Nk9dlYg8ioP4UKbGE5c0xJOXkNkZ+dKOWzLCuxrIxqdJuYprKKHkBKrOTzpBLhkq2BOcT1SKTx6R/FDrOE99r3EGjF9QRYnYBrkUMJSu3i6aa95G20S3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IdybSuZf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IdybSuZf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2FCB1F00A3A;
	Tue,  1 Sep 2026 23:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788305080;
	bh=UYsVp4S12kJxQZ9xleV3/HWxsgB9SxfAwwi/YHWmcuM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IdybSuZfHV9uKjVOOovxDICpVc/WEhejni2FnCnnPNQzYP8WPabII3oOraAPBAg2m
	 Hi9nWpk0osyKzn8ysNfhM1PSdNcE7IqE5g5BCwV3dTFojCEvwMwpOG+MjrzqA6IWiu
	 r61/wNV4mmw/dbwHpdlC3IWkevs360ET6min6myLHM9agWsf5yaSGa22nrfchdmbEm
	 wgnhubNrL5OVHjsd/XNRj9fpjRykACMpCperraUl4q93M8zImsMCB0N4NyJRmXTHAl
	 sjj1ST+7TR+AcXNzJWsc51J44tLbKP37O0omMiD8JtZmpeA9sIcD9NEk12ppAVA+gw
	 rMmGZA5QppUVQ==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: axelrasmussen@google.com,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	chenridong@xiaomi.com,
	david@kernel.org,
	hannes@cmpxchg.org,
	kasong@tencent.com,
	lianux.mm@gmail.com,
	linux-kernel@vger.kernel.org,
	ljs@kernel.org,
	lyugaofei@xiaomi.com,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	stevensd@chromium.org,
	wangzicheng@honor.com,
	weixugc@google.com,
	yuanchu@google.com,
	zhangbo56@xiaomi.com,
	"Barry Song (Xiaomi)" <baohua@kernel.org>,
	Xueyuan Chen <xueyuan.chen21@gmail.com>,
	Ridong Chen <ridong.chen@linux.dev>
Subject: [PATCH v3 3/7] mm/mglru: enhance cold/hot inversion handling in inc_min_seq()
Date: Wed,  2 Sep 2026 07:24:17 +0800
Message-Id: <20260901232421.40157-4-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260901232421.40157-1-baohua@kernel.org>
References: <20260901232421.40157-1-baohua@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During aging, a folio's generation may already have been updated by
folio_update_gen(), even though it has not yet been moved to the
corresponding generation list. Such folios are hotter than those
already in that generation.

It makes sense for inc_min_seq() to increment the generation of
folios that were never promoted during aging and move them to the
tail of the new oldest generation. However, folios that were already
promoted should instead be moved to the head of their updated
generation, just as sort_folio() does in scan_folios().

Otherwise, promoted folios could end up behind folios that were
never promoted, effectively inverting their hot/cold ordering.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Reviewed-by: Kairui Song <kasong@tencent.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Reviewed-by: Ridong Chen <ridong.chen@linux.dev>
Reviewed-by: Lian Wang <lianux.mm@gmail.com>
---
 mm/vmscan.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 27494505cecc..95d48f9efc09 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3949,9 +3949,17 @@ static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
 			VM_WARN_ON_ONCE_FOLIO(folio_zonenum(folio) != zone, folio);
 
 			new_gen = __folio_inc_gen(folio, old_gen, &gen_increased);
-			list_move_tail(&folio->lru, &lrugen->folios[new_gen][type][zone]);
-			if (gen_increased)
+			/*
+			 * If gen_increased is false, this is a promotion. Put folios
+			 * at the head of the promoted gen. Otherwise, put them at
+			 * the tail of the second-oldest gen.
+			 */
+			if (gen_increased) {
 				delta += nr_pages;
+				list_move_tail(&folio->lru, &lrugen->folios[new_gen][type][zone]);
+			} else {
+				list_move(&folio->lru, &lrugen->folios[new_gen][type][zone]);
+			}
 			/* don't count the workingset being lazily promoted */
 			if (refs + workingset != BIT(LRU_REFS_WIDTH) + 1) {
 				int tier = lru_tier_from_refs(refs, workingset);
-- 
2.34.1

