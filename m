Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686934;
	b=h82E7nIBW6/9AdmnRSegVgy9ubDNCL8+6C9lrdn3+nkvUifg4KKwNkTiq/7mTXzJfxbL
	 ttYDGIYotYTydEzROoEwfBGLV/OZNt+3MZicDL7Tknm9E7q0qrnfLq8UP/8PMnsyVeV0J
	 EwWdkCe7MI9/FOy37rZtNv2dkAweYcSI5X+4u3ewlRG7Bf0aRKlLiFp0GH6yALUjmxwUr
	 EOEXHa18bcln96jn0J6ihIho4b91RPC/qTGxEhnexGswBS8+7ElFjI8Q4M6iryGEUbqzb
	 AXGUF3U+SRBACJm7qbsbCiwZIPQffuSLMyfzsRNAohr/n4xttnAHCgBPAGeS0+257Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686934;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=GjfLBEmDG/HlAMAHmMcXlPNLi05BAiSWM1z3+JIOepI=;
	b=3zu0usKBsSeFhD1YFRZRsN2KHjrVlOl+mQPnl1wM19Fj0uXQa6dlfVxTDqkzzwUIbuhh
	 +5FcPbnFRaUd+GdXlfID9eEtyQc3Xjo9my+jY1/+/QNgeJEi0Rf6uXznyFZtjfJeTy9kb
	 g38Y4urQ7ZUvjxOZRgSrjm81akqjzlSbSDXc7Lo29NIbxCiltgS5WiB80uLuR8YRP11/N
	 wlumjTlQbKLzWzGTzluAIX2h5uPLUSXSD8SNameLL5rx6RtUrefWxGHKtUZhoFIfahsYr
	 Fvm24iKRoVqIKjxPR43dju0dtSmHM0bO9oTmegcMwoEQBOayBb9P0BnM0i18MDp+byw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c9nbruIj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57377606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 20:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c9nbruIj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 744241F000C9;
	Sat, 14 Nov 2026 20:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794686934;
	bh=GjfLBEmDG/HlAMAHmMcXlPNLi05BAiSWM1z3+JIOepI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=c9nbruIjrK5XwqkhqWXlVyW8eIabX/Paj7NTP4CJsKnlAikW5kLS+AN2q8eDdU274
	 uyJYJrdQlvFSXOXmTJ/uLAJBmiuQ5d34/525yWZObWb8x8FfWV5vkgPnYkw/8ns/5t
	 MyYs7OLoi5TyVS/4FzsDZflWGuwRGF5wPsFkNpSKyoMnzLnm7CvdeB7uFF802xQzDZ
	 QLjwgGMYHkszR5hR6YRV6vhujxhIjZpydnad6VmPhlIYAHzKuFdEZGZJJRjyHM66Vw
	 cN49qEv9qAmBs3/ybNJu/N7SaYlOQWVlPhCHtyw8jqcCcBGjzpmHYxHDvT8DBfPCyv
	 6emaUeYVjRjjg==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: axelrasmussen@google.com,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	hannes@cmpxchg.org,
	hui.zhu@linux.dev,
	kasong@tencent.com,
	kunwu.chan@gmail.com,
	liam@infradead.org,
	lianux.mm@gmail.com,
	linux-kernel@vger.kernel.org,
	liuxiang.277@bytedance.com,
	lyugaofei@xiaomi.com,
	mhocko@kernel.org,
	mhocko@suse.com,
	qi.zheng@linux.dev,
	ridong.chen@linux.dev,
	rppt@kernel.org,
	ryncsn@gmail.com,
	shakeel.butt@linux.dev,
	surenb@google.com,
	wangzicheng@honor.com,
	weixugc@google.com,
	yuanchu@google.com,
	zhangbo56@xiaomi.com,
	zhuhui@kylinos.cn,
	sidchintamaneni@gmail.com,
	Barry Song <baohua@kernel.org>
Subject: [PATCH v9 08/16] mm/mglru: lift youngest gen protection for higher priority
Date: Sun, 15 Nov 2026 04:07:55 +0800
Message-Id: <20261114200803.23129-9-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261114200803.23129-1-baohua@kernel.org>
References: <20261114200803.23129-1-baohua@kernel.org>
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

From: Kairui Song <kasong@tencent.com>

The forced protection of younger generations contradicts the
goal of minimizing the I/O cost of reclaim. Under high memory
pressure, MGLRU can repeatedly trigger premature OOMs, while
the classic LRU does not.
The problem is that aging may fail to keep up with reclaim.
When this happens, reclaimers may all abort prematurely
because they see only empty generations or just two
generations remaining.
Proactive aging does not solve this problem either. The
number of threads performing proactive aging is limited,
while the number of concurrent reclaimers can be much
larger. This is a fundamental limitation of MGLRU. One
possible solution is to use an aging lock. However, the
aging lock introduces significant jitter under heavy memory
pressure and has been reported to cause noticeable lags
on Android.
Furthermore, the generation-based reclaim model can
conflict with the goal of swappiness, which is to minimize
I/O cost rather than blindly follow folio hotness.
The previous commit allowed reclaimers running at
non-default priorities to reclaim up to `lrugen->max_seq`,
while reclaimers at the default priority could reclaim only
up to `lrugen->min_seq`.
This patch further refines generation protection based on
reclaim priority. At the default priority, reclaimers can
reclaim generations down to `lrugen->max_seq - MIN_NR_GENS`.
As reclaim priority increases, reclaimers are progressively
allowed to reclaim younger generations.
With this graduated protection, premature OOMs are no
longer observed, while swappiness is also respected.

Signed-off-by: Kairui Song <kasong@tencent.com>
Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 mm/vmscan.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 18cf1c084e78..b538abf02578 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4772,12 +4772,14 @@ static int scan_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
 	VM_WARN_ON_ONCE(!list_empty(list));
 
 	/*
-	 * Respect the gen hotness distribution at low priority to avoid
-	 * aging and scan cost, but prefer to satisfy the reclaimers request
-	 * when under pressure to respect swappiness more and reduce IO cost.
+	 * Respect hotness at default priority, and only reach into the
+	 * newest generation when under severe pressure, so hot folios are
+	 * not evicted as soon as priority is raised.
 	 */
 	if (sc->priority == DEF_PRIORITY)
-		seq = lrugen->min_seq[type];
+		seq = lrugen->max_seq - MIN_NR_GENS;
+	else if (sc->priority > DEF_PRIORITY / 2)
+		seq = lrugen->max_seq - 1;
 	else
 		seq = lrugen->max_seq;
 
-- 
2.39.3 (Apple Git-146)

