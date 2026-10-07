Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB187357D19
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 02:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791339212; cv=none; b=jJBOWWkTVSyJfXpwjYjp8lLW0WpHGvzgKh9g7KRxJV4AcAxXfT2H2wpWCHWY8Lnj0Jd1LgYYt1XfuGAEHbZcWD77L76r4izKZJB1NCJGhJYwTz66rsvqTj7hRHlH9TNqZZX4AGLf6jZ2j1WziRQdyzvEz2obQi8mww/R7LuWG08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791339212; c=relaxed/simple;
	bh=J5qplktwcR8rP2nlvx/tEAk05s2ocebs9O9HNBcdsLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Omi+oIsulbPqWuSEOSf7/CxAUAQSpWrP4tAc28+Vi/Z0on4cGocHZZ/iT3+csIA4ygJ0uK83UAuUHpZyfAfm45jI/b+573dAQEPKM05q7ICV1nKUIxqhwfOd504oM7yJENbQkTRGa2P/XC5YP8Cwf26tFo61WpLaHAwwBCBW630=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=kd5fSFl1; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="kd5fSFl1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=zf956o7Xb3ZAc7snjXqwGB/wRoNyeXb3dU6QTOPLSKg=; b=kd5fSF
	l1Et4fuw0fA/NTiBHcgmHsADezDrKr41HJkv4gh4mFoTJaNVite5V94t24F00jvCE2bOUCrs7BDMV
	qvdJt1HTbg58GOIvpC4j+CfpLTCg+uBbAvFYcT/O51TEaV/1UPEqHQ5qYdcTznuTTFAqFe6WYPN1M
	dyjStLuG1fGrtrULibk6ffePjNy9DSnxdUOsrO9fPvIGyfChZr1HfaThA/+C92rUiiOKeoyovp6lf
	9rP1wre5v0LanRQA4zwjyHPueBhS549qRt61dZaw5r7IIODlfa28gmukedY64P80IA2reU008BUbK
	tVsaTISFiH1kj8CBIUqObIgBEi1A==;
Received: from [2601:18c:8100:a0e0:2541:b86e:2586:d219] (helo=fangorn.surriel.com)
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xEH9M-0000000B2cT-45iF;
	Wed, 07 Oct 2026 02:12:56 +0000
From: Rik van Riel <riel@surriel.com>
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Zi Yan <ziy@nvidia.com>,
	Kairui Song <kasong@tencent.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	linux-mm@kvack.org,
	Rik van Riel <riel@surriel.com>
Subject: [RFC PATCH 2/5] mm/page_alloc: count a merged buddy's pages under the merged type
Date: Tue,  6 Oct 2026 22:12:47 -0400
Message-ID: <20261007021250.1665929-3-riel@surriel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007021250.1665929-1-riel@surriel.com>
References: <20261007021250.1665929-1-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__free_one_page() merges a freed page with a free buddy of another
mergeable type at pageblock order and above, and retypes the buddy to
match. The buddy's pages stay counted under the old type: nothing moves
them to the merged type in the free counts.

That is unobservable today. NR_FREE_PAGES does not separate types, so the
missing move nets to zero there.  Any future per-type free count would
undercount on a merge from the other side, and allocating the merged
run later could wrap it.

Move the buddy's pages to the merged type in the count too.

Assisted-by: LLM
Signed-off-by: Rik van Riel <riel@surriel.com>
---
 mm/page_alloc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 4658af97be010..ae38e25971559 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -993,6 +993,11 @@ static inline void __free_one_page(struct page *page,
 			account_freepages(zone, 1 << order, migratetype);
 		} else {
 			__del_page_from_free_list(buddy, zone, order, buddy_mt);
+			/* The buddy's free pages join the merged block's type. */
+			if (unlikely(buddy_mt != migratetype)) {
+				account_freepages(zone, -(1 << order), buddy_mt);
+				account_freepages(zone, 1 << order, migratetype);
+			}
 		}
 
 		if (unlikely(buddy_mt != migratetype)) {
-- 
2.53.0-Meta

