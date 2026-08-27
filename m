Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B82340A6B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787874445; cv=none; b=DJGEnzQOKjawDK1SDqR5GgWvdRm76+8OPQPizp9/e9svnuimU+oWR3/rBerIXpvl1b4QcyKhg6gkFbYUzh+nBzA+Fj2ErNC88iLdmPzW8tmLVqDh7Rc8boZ80b+Po0gUqdF2mAZONmS4WQ5+r9eBAtEKmjsx57GPvACl8DyxaNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787874445; c=relaxed/simple;
	bh=/qDZiKT7hh+9+kPFKspP5ZM8yMb/8Mu5BOvXS7K8Aww=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T040aY1ST2umDRhp3NgNz7a7huY3K/QqT5Gg0ckoIFTa5JSvuGr3COkK7R28WGw/qksf3D81yJFwuBe4xBllOvSYuXJN3pbQRgBRxkrdCIrZhVsIjzDWxPiLe7tIS0IVM2gy5/XbRG0DfcYnYIuDxAE6ZRxR7HAmaa7n5o+FKR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iR+edBfU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iR+edBfU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 029261F00A3A;
	Thu, 27 Aug 2026 23:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787874443;
	bh=7I7JY1zLaktW057z/Fnc7oBx6JyoNkQhe3RQzTBptJo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iR+edBfUOenZjti8VZvvvWuIvpP/92rNVd4C6HyLhRCj88IVyA7OyH+hpUms1EV64
	 VS87H5+jUuRKZ4sV0kClRiHjOI8dWihw+Gx7T9ahwu+BrGyo5mtj5OIGlQPr7NMn/b
	 eqdkuOIK7cAoXWkut1uGIa5LpVgtoTotp0W/e3FyHCPw+HvGPnbTg0LkaEulNE7Hg1
	 sf/BsT6+Q46Q1oZcRN7PB/5oidPcbDHbLX6BxTwBn7X6eRCO2B6z2kyVA0EsP14Ksm
	 zVVmw6o/xJHgVE5p9A3sdlNgBHeaLQT+F2rw5yVh6Iq2TYAlAPoHgbUoj7+FNEifqh
	 4nl0jkmQwZDCw==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: akpm@linux-foundation.org,
	lianux.mm@gmail.com
Cc: axelrasmussen@google.com,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	chenridong@xiaomi.com,
	david@kernel.org,
	hannes@cmpxchg.org,
	kasong@tencent.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
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
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [PATCH v2 3/7] mm/mglru: enhance cold/hot inversion handling in inc_min_seq()
Date: Fri, 28 Aug 2026 07:47:00 +0800
Message-Id: <20260827234704.63163-4-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260827234704.63163-1-baohua@kernel.org>
References: <20260827234704.63163-1-baohua@kernel.org>
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
---
 mm/vmscan.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 07c22d51debd..b10d1703d907 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3949,9 +3949,12 @@ static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
 			VM_WARN_ON_ONCE_FOLIO(folio_zonenum(folio) != zone, folio);
 
 			new_gen = __folio_inc_gen(folio, old_gen, &gen_increased);
-			list_move_tail(&folio->lru, &lrugen->folios[new_gen][type][zone]);
-			if (gen_increased)
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

