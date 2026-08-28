Received: from mta0.migadu.com (out-100.mta0.migadu.com [91.218.175.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B5340F749
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787915398; cv=none; b=RQfHMGikBH5H0pz6c5Aj0b+6lq9or9zGXdpoxvJzNbmZo5H/Qv3ZmoCHUwx9cGgocj8ZN+5rCMbHTeBuCpM2v+w/tro0OSZcnNgMXeBAtW9ytIvSYrAar+GWXpiAnBjfHhucbUqzJjlKNGFLNAfGdUiOEJuQ5NNG2QXr65Bjpy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787915398; c=relaxed/simple;
	bh=OoHGgjSfWYpB05+fSb88E0ID0/HP1IBQpVIbX01UjGk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B2ZuitdCGQyfFqqNPBiwAF/rXeoM+HuqIc22RhHfDA2px9muNLf6CGjWGmj1CCe5UXPAeG8QTpryp9KC34BKGthBhpNCYgO4Q+3KLZgIRuItlE/GEKrRtijPgZ/CAks9etjRps8tlWBSWjIIVJ/YaRSP78Rjp67c5xzMFJOEpNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RdniU1/D; arc=none smtp.client-ip=91.218.175.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RdniU1/D"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OoHGgjSfWYpB05+fSb88E0ID0/HP1IBQpVIbX01UjGk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787915388; v=1; x=1788520188;
 b=RdniU1/DbmPn0VtQ3oCjn/aSXaa7PAma4T34fwwGoPs1wOs9/MxtRHlPwLGmp3p7HTMZXCTB
 dZULfLBRB0RxyIlVbkElGGqIghNQtBlA0tLz/nSxP73dpOULj/+LTh7zOtWmcdbG1nm08/VATDj
 NeAv7aqxRVWu6e8lf73YbtNY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e93b957396df94b6;
	Fri, 28 Aug 2026 11:09:48 +0000
X-Mizu-Trace-ID: e93b957396df94b6
X-Migadu-Flow: FLOW_OUT
From: Ridong Chen <ridong.chen@linux.dev>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Muchun Song <muchun.song@linux.dev>,
	Kairui Song <kasong@tencent.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Chris Down <chris@chrisdown.name>,
	Tejun Heo <tj@kernel.org>,
	Yu Zhao <yuzhao@google.com>,
	cgroups@vger.kernel.org (open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)),
	linux-mm@kvack.org (open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)),
	linux-kernel@vger.kernel.org,
	Ridong Chen <ridong.chen@linux.dev>,
	Ridong Chen <chenridong@xiaomi.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] mm/page_counter: avoid integer overflow in effective_protection()
Date: Fri, 28 Aug 2026 19:09:18 +0800
Message-Id: <20260828110919.1324028-2-ridong.chen@linux.dev>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260828110919.1324028-1-ridong.chen@linux.dev>
References: <20260828110919.1324028-1-ridong.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ridong Chen <chenridong@xiaomi.com>

effective_protection() scales a parent's protection by a ratio of page
counts, e.g. for recursive protection:

	(parent_effective - siblings_protected) * (usage - protected)
		/ (parent_usage - siblings_protected)

The multiply is done at unsigned long width before dividing. On systems
with >= 16TB RAM the product can exceed 2^64 and wrap, giving a bogus
protection value and silently breaking memory.min/low enforcement.

Use mul_u64_u64_div_u64() to multiply in a 128-bit intermediate. Because
usage and parent_usage are not read atomically (a child is charged
before its parent), usage - protected can briefly exceed the divisor,
making the quotient overflow 64 bits and trap (#DE on x86). Cap it so
the ratio stays <= 1.

Reported by the sashiko review tool [1].

[1] https://sashiko.dev/#/patchset/20260826133054.88529-1-ridong.chen@linux.dev?part=1

Fixes: bc50bcc6e00b ("mm: memcontrol: clean up and document effective low/min calculations")
Fixes: 8a931f801340 ("mm: memcontrol: recursive memory.low protection")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
---
 mm/page_counter.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/mm/page_counter.c b/mm/page_counter.c
index 661e0f2a5127..e8bd512069c5 100644
--- a/mm/page_counter.c
+++ b/mm/page_counter.c
@@ -8,6 +8,7 @@
 #include <linux/page_counter.h>
 #include <linux/atomic.h>
 #include <linux/kernel.h>
+#include <linux/math64.h>
 #include <linux/string.h>
 #include <linux/sched.h>
 #include <linux/bug.h>
@@ -356,7 +357,8 @@ static unsigned long effective_protection(unsigned long usage,
 	 * otherwise get a smaller chunk than what they claimed.
 	 */
 	if (siblings_protected > parent_effective)
-		return protected * parent_effective / siblings_protected;
+		return mul_u64_u64_div_u64(protected, parent_effective,
+					   siblings_protected);
 
 	/*
 	 * Ok, utilized protection of all children is within what the
@@ -397,13 +399,18 @@ static unsigned long effective_protection(unsigned long usage,
 	if (parent_effective > siblings_protected &&
 	    parent_usage > siblings_protected &&
 	    usage > protected) {
-		unsigned long unclaimed;
+		unsigned long unclaimed = parent_effective - siblings_protected;
+		unsigned long unprotected = usage - protected;
+		unsigned long parent_unprotected = parent_usage - siblings_protected;
 
-		unclaimed = parent_effective - siblings_protected;
-		unclaimed *= usage - protected;
-		unclaimed /= parent_usage - siblings_protected;
+		/*
+		 * The usages aren't read atomically, so a child can transiently
+		 * appear to use more than its parent, making the ratio exceed 1
+		 * and the quotient overflow 64 bits (#DE on x86).  Cap it.
+		 */
+		unprotected = min(unprotected, parent_unprotected);
 
-		ep += unclaimed;
+		ep += mul_u64_u64_div_u64(unclaimed, unprotected, parent_unprotected);
 	}
 
 	return ep;
-- 
2.34.1

