Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792706601;
	b=A/UnJ+wq6ZXdHUWqE04XwvPwjj7/kyBDPEzcqRSoDJmnXa77n7tFC2m8e2eTxDKDZJvK
	 68D44fH+pOJiDXwr0zswF30B67xJdVICJq2a1MgE8z3ed1r3rKjPQhYTgEm+fUR+msyCT
	 R2QM6FOfBMTIdBZlvLQDFw6YwzBQO5FaCvsq7owb7OWnyZfm1PoM8dZHTWuUuLdWbN6Nu
	 jC7ow7yWr+RNaFQbd8xU7Si0O5EeSVYpzpzosj6ksilysfeYmPx3pspZ3w8rjUg5cT9QX
	 MoOmGvOG1TfIHgCmWc7u/DdG5W0LPunEm6YnsTC2mRUbNgDm+ceYMtyLehWbLE2GSTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792706601;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=vFrx/Rduc+8ObKA8YH7FJxIFbEwpzgAWwJqG31qSCIw=;
	b=aCZpdCHXNjqguMEp3vRpkKUg94+IZT5S9Y2wIPRp+BEZuXejPgmSGoxwP2d2JVBxiUv4
	 cvisiwG/XpC8fWRKK5QmE5GMREf5AIIZzAxTp2MVbKmICqt0T1E7hjnefhRa+Sg6DsT92
	 u7qoAAEG9lqDS0QvsUI0WdX2/QA6rVAS+x3zoenOl4DnMUWD5oyfSv+cLDBEVX1X7+feL
	 wknzW2XQ0FO1vJZx7KbDYQ6Pt6gKUMWJzW4F88HqjA0HlPJjMwVZXNqC5zt24JAAi7ITq
	 WGbEh7H3vcdyq9E80RGXgUCkEu7exfLcinKf3FpbJELJNyaZxANsuR5zZSFHxQQsyiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bdw9QDwU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1AA606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bdw9QDwU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 415E11F01825;
	Thu, 22 Oct 2026 22:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792706601;
	bh=vFrx/Rduc+8ObKA8YH7FJxIFbEwpzgAWwJqG31qSCIw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bdw9QDwUVXcRyjLN8KRZcI2Bz1J5yyYtGTIy6mchZ/zi+ZrzTMDCw0bcmJSSr5SL0
	 w0CElcSGKrGVCYs5L/fRGUcSQpIKrUjUIOVeMut+Joh77JQLjYCao3C5fVxFsP5Erh
	 3pHOkMe6HeVtrGRgrBVeOcyP++L+FkUzt1b5j0cdmLKGfh5raNKKoi4R0cIxaaWyR7
	 D5DfrJrxivUmofIRt7wofBkzqw5fO/v75E1FG+GfZi/9813c1SugD96qrev7RZr3nV
	 9rzEWWE+aBpoWLQNGpFUGUtK9PzhvBbMgx5C9OfhKDNM5gt8SH0OtpnIi/w4UJRd+1
	 C7KoV/jusV+gw==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: hui.zhu@linux.dev,
	axelrasmussen@google.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	david@kernel.org,
	hannes@cmpxchg.org,
	linux-kernel@vger.kernel.org,
	ljs@kernel.org,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	ryncsn@gmail.com,
	shakeel.butt@linux.dev,
	weixugc@google.com,
	yuanchu@google.com,
	zhuhui@kylinos.cn,
	baoquan.he@linux.dev,
	liuxiang.277@bytedance.com,
	wangzicheng@honor.com,
	lianux.mm@gmail.com,
	kasong@tencent.com,
	liam@infradead.org,
	surenb@google.com,
	mhocko@suse.com,
	rppt@kernel.org,
	zhangbo56@xiaomi.com,
	lyugaofei@xiaomi.com,
	ridong.chen@linux.dev,
	kunwu.chan@gmail.com
Subject: [RFC PATCH v5 13/14] mm/mglru: Make swappiness=1 file reclaim more aggressive
Date: Fri, 23 Oct 2026 06:02:02 +0800
Message-Id: <20261022220203.91911-14-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261022220203.91911-1-baohua@kernel.org>
References: <20261022220203.91911-1-baohua@kernel.org>
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

In MGLRU, swappiness=200 favors anon reclaim, while swappiness=1
favors file reclaim. Swappiness=0 allows only file reclaim, while
swappiness=201 allows only anon reclaim. Thus, swappiness=1 and
swappiness=200 are counterparts for file and anon reclaim,
respectively.

Before this patchset, get_type_to_scan() always returned
LRU_GEN_ANON for swappiness=200 and LRU_GEN_FILE for swappiness=1.

For swappiness=200, file_factor is set to 0 at higher reclaim
priorities. Similarly, anon_factor is set to 0 for swappiness=1
at higher reclaim priorities, making the two settings behave
similarly, although the thresholds are slightly different.

This allows file pages to be reclaimed more aggressively and
benefits workloads that prioritize file reclaim by using
swappiness=1.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 mm/vmscan.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 81e81d69e67e..6d5a823667e0 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -5113,7 +5113,11 @@ static void lru_gen_balance_scan(struct lruvec *lruvec, struct scan_control *sc,
 	anon_weight = nr[LRU_GEN_ANON] + nr[LRU_GEN_FILE] / size_bias;
 	file_weight = nr[LRU_GEN_FILE] + nr[LRU_GEN_ANON] / size_bias;
 
-	anon_factor = (u64)swappiness * refault_rate[LRU_GEN_FILE] * anon_weight;
+	if (swappiness == MIN_SWAPPINESS + 1)
+		anon_factor = sc->priority <= DEF_PRIORITY / 2 ?
+			      refault_rate[LRU_GEN_FILE] * anon_weight : 0;
+	else
+		anon_factor = (u64)swappiness * refault_rate[LRU_GEN_FILE] * anon_weight;
 	if (swappiness == MAX_SWAPPINESS)
 		file_factor = sc->priority < DEF_PRIORITY / 2 ?
 			      refault_rate[LRU_GEN_ANON] * file_weight : 0;
-- 
2.34.1

