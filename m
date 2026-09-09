Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6A045A2A8;
	Wed,  9 Sep 2026 21:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788990578; cv=none; b=Mea08hyYtl7zxFUtoapzUsDyqlUEoi0/LWRsrWjOVrxbD4kZhJX5P2kUm1Z6j0DS0BUP+u06P4CwTCs6syV3Ctx63mg9gXXK/QFCZwLUC7ppkG2S5+PlAnP230NFvymI4yymrM3kQBBzUp1AT94XdE0ZIAdawy2gbU3QltILPpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788990578; c=relaxed/simple;
	bh=6HuWvLoHb9MNO+PA9l9yt6M3/Q2rdK1d/7u7hiJun5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pvUIDB51ExnrhLYz2JUClRlKmrf1+97xGdKBSU+FgEa0daVya2x3PrI1C+lKNfz0kUnj6i3AnI9mu5YL3hqabwd6B/3phJ8EdeuOzP1A/iIuaaukBlN5+vWVragjAUFsyReqC9mAUJLn2mLXCUp2ouCVrTZS3whbfSnLRLyjDVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bgXRonsL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bgXRonsL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 030B1C4AF10;
	Wed,  9 Sep 2026 21:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788990578;
	bh=6HuWvLoHb9MNO+PA9l9yt6M3/Q2rdK1d/7u7hiJun5I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bgXRonsLBmo+3r3edVzKWawVGmlc46sX9f5rRe6VaUxuAApHtQq4YARMQUu59fslm
	 OUUg7lMUmYZKZ8+LrcvRzlUtezkOB3flJDaqyepF5PJCyx25ZGUqRZ1gFMG13trCcp
	 EmeMLwYyfq7zFNDo2TvvYIsvpO2RGRpoA4LUWHD/nBSl27rkwZ+h9WXuj3M8CZ63Gf
	 SXT0ipvQ01PE3nGf2i/ivU5ks0elO1UNYzDXEl8051LggWIyNqLyzC/3/bqidlONGF
	 dggYVCh131PTayhFHaxPefN3P8KMBLSObm7S+T9XirCdBDZyhl1uIwK4W7sceWrVtS
	 snAbk43WZoEKA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1F01C88E40;
	Wed,  9 Sep 2026 21:49:37 +0000 (UTC)
From: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
Date: Wed, 09 Sep 2026 14:49:29 -0700
Subject: [PATCH v2 4/4] mm: hugetlb: Avoid re-allocating global
 reservations on region add failure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-hugetlb-subpool-always-track-used-v2-4-30c5d83b572a@google.com>
References: <20260909-hugetlb-subpool-always-track-used-v2-0-30c5d83b572a@google.com>
In-Reply-To: <20260909-hugetlb-subpool-always-track-used-v2-0-30c5d83b572a@google.com>
To: Alex Shi <alexs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>, 
 Hongxiang Lou <louhongxiang@huawei.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Miaohe Lin <linmiaohe@huawei.com>, Michal Hocko <mhocko@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
 Nhat Pham <nphamcs@gmail.com>, Oscar Salvador <osalvador@suse.de>, 
 Peter Xu <peterx@redhat.com>, Randy Dunlap <rdunlap@infradead.org>, 
 Roman Gushchin <roman.gushchin@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Suren Baghdasaryan <surenb@google.com>, Usama Arif <usama.arif@linux.dev>, 
 Vlastimil Babka <vbabka@kernel.org>, Wupeng Ma <mawupeng1@huawei.com>, 
 Yanteng Si <si.yanteng@linux.dev>, fvdl@google.com, jthoughton@google.com, 
 rientjes@google.com, vannapurve@google.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, Ackerley Tng <ackerleytng@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788990577; l=3199;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=EoLqecRMxYnQilsAlZ6TRmi6EOz6fqVlkxDRkYXZEGk=;
 b=pn54b1X1S+6OXfUVQLwJl5j4qFJzOlrJTC968pEjDav5b3JyIY5oXTBnAPkDoWOqMP4ghK560
 lOxRYC1UM8FCni/NJJLHPTOLuS739e0OBT7fH7w+J2lRsFmvY3WNYZC
X-Developer-Key: i=ackerleytng@google.com; a=ed25519;
 pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Endpoint-Received: by B4 Relay for ackerleytng@google.com/20260225 with
 auth_id=649
X-Original-From: Ackerley Tng <ackerleytng@google.com>
Reply-To: ackerleytng@google.com

From: Ackerley Tng <ackerleytng@google.com>

When reserving huge pages for a shared mapping, reservations are first
requested from the subpool, and any remainder is accounted in global
reservations. When adding the file region entries fails later in the
process, the reservation attempt must be rolled back.

Previously, this error path explicitly dropped the global reservations
that were just acquired before jumping to the cleanup label. The cleanup
label then returned the pages to the subpool. If concurrent activity in
the subpool allowed the subpool to absorb more reservations upon return
than it supplied initially, the cleanup label calculated a positive
difference and attempted to allocate new global reservations from scratch.

This premature release was completely unnecessary because all requested
pages were already backed globally: partly by the mount guarantee and
partly by the global reservations just acquired. Prematurely dissolving
those reservations forced the cleanup path to attempt fresh buddy
allocations that could fail under memory pressure.

Instead, track the number of global reservations actually accounted so
far. In the cleanup label, subtract the already-accounted amount from the
difference between requested and returned reservations. This ensures
that when global reservations were already acquired, the adjustment is
purely non-positive, dropping excess reservations without ever attempting
fresh allocations.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 mm/hugetlb.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 652cfb55c6e6e..1151ad959ffd5 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6678,6 +6678,7 @@ long hugetlb_reserve_pages(struct inode *inode,
 	struct hugepage_subpool *spool = subpool_inode(inode);
 	struct resv_map *resv_map;
 	struct hugetlb_cgroup *h_cg = NULL;
+	long gbl_resv_accted = 0;
 	long regions_needed = 0;
 	long gbl_resv_get;
 	long gbl_resv_put;
@@ -6768,6 +6769,7 @@ long hugetlb_reserve_pages(struct inode *inode,
 	err = hugetlb_acct_memory(h, gbl_resv_get);
 	if (err < 0)
 		goto out_put_pages;
+	gbl_resv_accted = gbl_resv_get;
 
 	/*
 	 * Account for the reservations made. Shared mappings record regions
@@ -6784,7 +6786,6 @@ long hugetlb_reserve_pages(struct inode *inode,
 		add = region_add(resv_map, from, to, regions_needed, h, h_cg);
 
 		if (unlikely(add < 0)) {
-			hugetlb_acct_memory(h, -gbl_resv_get);
 			err = add;
 			goto out_put_pages;
 		} else if (unlikely(chg > add)) {
@@ -6831,9 +6832,10 @@ long hugetlb_reserve_pages(struct inode *inode,
 	 * There may be a difference between the number of
 	 * reservations to consume and the number to restore now if
 	 * there are multiple threads interacting with the subpool -
-	 * restore the difference.
+	 * restore the difference, taking into account any global
+	 * reservations already acquired.
 	 */
-	hugetlb_acct_memory(h, gbl_resv_get - gbl_resv_put);
+	hugetlb_acct_memory(h, gbl_resv_get - gbl_resv_put - gbl_resv_accted);
 
 out_uncharge_cgroup:
 	hugetlb_cgroup_uncharge_cgroup_rsvd(hstate_index(h),

-- 
2.55.0.1007.g17ff1f9808-goog


