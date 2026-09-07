Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA08D517BC6
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 18:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788804735; cv=none; b=fSz/ER1zFEwc+H2ycObJ2JZ6wbyuD05u0qHxjXAUsyOpmhDrsc7SQk3OAe4RbCOxAYAIRUqt2rS7bjgWVjRvTjnXk3cq2pP1Sf7ZAXPbsS99sUhuHYeStH5ftb5mP7us6tTMLdV2yNIK/80/MRnqnbVaC9aOWoJoPdBVyj7xh3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788804735; c=relaxed/simple;
	bh=WHjZ3MtkzfeirCgRiKk2+BAR2kgb6CdSW7hILNlYFUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P5mAauTZNGyAs360vvAoV1ai2dY6wimcNNblDl0rNRzPofiV2AtnOOoht95ISLV5aa5OuQT7SbF/2a3uZ8woLTVifAwp9DP1mpOUoSKtgXke70xFsI/jdrrej9pV5GF/jir7Z6ycBbKCWEW5X9yzsrBPEEBmrlxTB9kbDS4fWDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mudKBYil; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mudKBYil"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65378C2BD01;
	Mon,  7 Sep 2026 18:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788804735;
	bh=WHjZ3MtkzfeirCgRiKk2+BAR2kgb6CdSW7hILNlYFUk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mudKBYilZletaWrVKoQQInwp3bT2uXJKxuncY/eT5dmk22y0hJBpViIGoBhueINsF
	 rB0GBgdFFPzB+fNG99onFvQM501aHSWtPfU9ExKApir680ztzaHmT8xKaf2oc4PEdQ
	 Koi8PwKOc/CeFLj1Clb351r+LX2dJRFdnjbbT7HNHCC8ZvYQ4gQMCrN5Mwdj7Q7tOW
	 zuTqnkEOSDPKDadt2gVCIpBEpII47drKAkgm/dCmotMWq9dyL21eJ2oiiY2h7egsTI
	 ypQMK9YNPcJZ0qfNKV/ejaFXmJmCYu6MwAXjbi28qOBQbkxvFYDWPjF5ETUCH3Kc69
	 I0PEBmpGy5Low==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C7BC79F99;
	Mon,  7 Sep 2026 18:12:15 +0000 (UTC)
From: Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>
Date: Tue, 08 Sep 2026 02:12:05 +0800
Subject: [PATCH v4 01/17] mm/swap: fix off-by-one in swap cache replace
 sanity check
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-swap-thp-cleanup-v4-1-b532a3f20e71@tencent.com>
References: <20260908-swap-thp-cleanup-v4-0-b532a3f20e71@tencent.com>
In-Reply-To: <20260908-swap-thp-cleanup-v4-0-b532a3f20e71@tencent.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Chris Li <chrisl@kernel.org>, Kemeng Shi <shikemeng@huaweicloud.com>, 
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
 Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, 
 "Kiryl Shutsemau (Meta)" <kas@kernel.org>, 
 Shivam Kalra <shivamkalra98@zohomail.in>, Kairui Song <kasong@tencent.com>, 
 Kairui Song <ryncsn@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788804732; l=1650;
 i=kasong@tencent.com; s=kasong-sign-tencent; h=from:subject:message-id;
 bh=XESq4kPupCnQj7r95GN7GoyviZFWLnOgj/AyzSIJFVc=;
 b=jCvUgn3rqoALZFvFG741d+xlfd7OfXxx2iN9tamlvi9M5ApOra3C9c7uG/LVbC8Ashsz4inbx
 PflnFhzqkucB/1VIZSkU7zQDUvf4EHyKiTVtmWkERcsqB9nwr2zsviO
X-Developer-Key: i=kasong@tencent.com; a=ed25519;
 pk=kCdoBuwrYph+KrkJnrr7Sm1pwwhGDdZKcKrqiK8Y1mI=
X-Endpoint-Received: by B4 Relay for kasong@tencent.com/kasong-sign-tencent
 with auth_id=562
X-Original-From: Kairui Song <kasong@tencent.com>
Reply-To: kasong@tencent.com

From: Kairui Song <kasong@tencent.com>

The DEBUG_VM sanity check in __swap_cache_replace_folio() iterates
the old folio's range with "while (ci_off++ < ci_end)", so the loop
body runs on the already-incremented offset: the first entry is
skipped and one entry past the range is read.  For a folio split
that entry belongs to the first after-split folio and was just
repointed by the replacement loop above, so the check would warn
spuriously whenever sub-folio orders differ from the head folio's.

Currently we don't support non-uniform swapcache split, but this still
needs a fix to clean it up and prepare for non-uniform swap cache split.

Use the same do-while pattern as the replacement loop.

Fixes: 8578e0c00dcf ("mm, swap: use the swap table for the swap cache and switch API")
Acked-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Barry Song <baohua@kernel.org>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Acked-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/swap_state.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/swap_state.c b/mm/swap_state.c
index 305877e1f4d7..2cf7ed2a4df4 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -389,8 +389,9 @@ void __swap_cache_replace_folio(struct swap_cluster_info *ci,
 	    folio_order(old) != folio_order(new)) {
 		ci_off = swp_cluster_offset(old->swap);
 		ci_end = ci_off + folio_nr_pages(old);
-		while (ci_off++ < ci_end)
+		do {
 			WARN_ON_ONCE(swp_tb_to_folio(__swap_table_get(ci, ci_off)) != old);
+		} while (++ci_off < ci_end);
 	}
 }
 

-- 
2.55.0


