Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D484041E6D9
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385386; cv=none; b=k+AZ4/DA9pqjfRRY36sr4GUCE00m871+hdtv5B6YPxfCtttrwB5Tmy/GqFmAKJRLQcbhfJEQ7MhG9bpomRBgqvms53Gyfft6h0Ev4gYa7k/RbH7PutraBr5Om4IQwjNcPqESinDmGk0w82r0DaeB58pP5oDQ1omqf/hQykVkzho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385386; c=relaxed/simple;
	bh=+CmKvnXADZSZeBEzDg4/Ki0gQmgJMmfbDX1PQczCMiM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bB5bWdE8YJySMaV6/LfPVy89wv+JrV03rbENHcVQwP8aWoHD/e1V9UNIha4f3ldJc6pnCvQs2waAMmH2VgEjSbV2/kmQPm83MIni2t2GhRp1DLeJ9Jh1MAzLQ0Br8U6UQJXPLXHpg7hcHRaszbptuMN9x6VrKxuGQT0+4wgs2PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=O1T+lTm/; arc=none smtp.client-ip=115.124.30.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="O1T+lTm/"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789385371; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=uJJuVJ8DPJj/Z8t/RBxJPr6rrha8u2eMESrY/Huz/tU=;
	b=O1T+lTm/SELyZL6Gl7VRzEkhZZNXAR0aMU1ftk8ZuBpQkzTi/8kuT8PdAXHH4Ez42mwmo66a0whGjvwDTDSjM+KCEXsQ4/1bwVtemKALcB6ZJyoOFH/C3Rj6yzVAj+pY4QKXvLFrjEDV3tPmbJ5qxjsW7MrHpDUuH40UL5qSBrE=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0XAvlfye_1789385370;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XAvlfye_1789385370 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 14 Sep 2026 19:29:30 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org
Cc: kasong@tencent.com,
	baohua@kernel.org,
	qi.zheng@linux.dev,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	hannes@cmpxchg.org,
	david@kernel.org,
	mhocko@kernel.org,
	ljs@kernel.org,
	ridong.chen@linux.dev,
	baoquan.he@linux.dev,
	shakeel.butt@linux.dev,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] mm: mglru: clear the reference counter for rejected folios
Date: Mon, 14 Sep 2026 19:29:22 +0800
Message-ID: <7384df363c12e4acdaa2e0428420cd8eed320ee7.1789384831.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per the comment on LRU_REFS_FLAGS, when accessed folios are promoted to
a new generation, LRU_REFS_FLAGS should be cleared so that the reference
counter can start over.

For folios rejected by shrink_folio_list(), we clear LRU_REFS_FLAGS and
set the PG_active flag when lru_gen_folio_seq() would place them in the
oldest generation. That's fine.

But for rejected folios where lru_gen_folio_seq() returns a generation
other than the oldest one (which can be treated as a promotion), we do
not clear LRU_REFS_FLAGS. This can violate the promotion mechanism. And
this means the rejected folio enters the new generation with stale, inflated
tier bits, which can inflate reference counts and distort eviction
statistics for these rejected folios.

Fix this by clearing LRU_REFS_FLAGS for rejected folios. Of course, I need
to evaluate the impact of the changes, which mainly falls into 3 cases:
1. When lru_gen_folio_seq() returns the oldest generation for rejected folios,
there are no logic changes, and they will be put back into the 2nd youngest
generation.
2. For rejected folios with PG_active set by shrink_folio_list(), we only
clear the LRU_REFS_FLAGS and do not change the generation.
3. For rejected folios with PG_referenced set, the original code would put
them back into the 2nd oldest generation. After this patch, we will put them
back into the 2nd youngest generation.

I think case 3 is also reasonable, before commmit 6cbdd9726fb5 ("mm/mglru:
use folio_mark_accessed to replace folio_set_active"), a rejected referenced
folio was also put back to the 2nd youngest gen. Meanwhile, I didn't see
any noticeable performance impact on my 32-core Arm machine when running
'make -j32' to build the kernel inside a 3G-limited memcg with either zram
or NVMe swap.

Reviewed-by: Baoquan He <baoquan.he@linux.dev>
Reviewed-by: Kairui Song <kasong@tencent.com>
Reviewed-by: Barry Song <baohua@kernel.org>
Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
Changes from v2:
 - Update the comments per Kairui.
 - Collect reviewed tags from Baoquan, Kairui and Barry. Thanks.
Changes from v1:
 - Update the commit message.
 - Clear LRU_REFS_FLAGS earlier.
---
 mm/vmscan.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 0a4355ddb63c..386ed743a766 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -5071,11 +5071,15 @@ static int evict_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
 			continue;
 		}
 
-		/* don't add rejected folios to the oldest generation */
-		if (lru_gen_folio_seq(lruvec, folio, false) == min_seq[type]) {
-			folio_set_lru_refs(folio, 0);
+		/*
+		 * See the comments on LRU_REFS_FLAGS.
+		 *
+		 * The rejected folios are never added to the oldest generation,
+		 * so this effectively promotes them by at least one generation.
+		 */
+		folio_set_lru_refs(folio, 0);
+		if (lru_gen_folio_seq(lruvec, folio, false) == min_seq[type])
 			folio_set_active(folio);
-		}
 	}
 
 	move_folios_to_lru(&list);
-- 
2.47.3

