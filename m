Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609822E54B6
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 01:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788919043; cv=none; b=U38I4W47rcRepOhAQrmLBHArpSVgLjVLqLBG9YHSZZt9ro7fUpwB0ArTcJxGnJe8JFQlDwJG823/KC8VN54G9UGWAnfVXkmvCX/I32DEYI2Ov3PfL287h6BIa+B+KeiPAxHfv/jKqMtJpWJFlrcsu+wozpmpGS0YG8+/LMHY9nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788919043; c=relaxed/simple;
	bh=VJ22iTkFEwdTvuahOVF8VDLuj6EuG+VH760AE+n5IeY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EONHLk5IjHi2p3EAmnomiEQ61ZaWdDP90fATjHsCj7o1eOlaQ1Jch+pfNEHUfx6uuprP4wHjvDPNsIEyEfMyEERdGFd8uPD9cCQqDJC6hsjp0cIUwp4SBfX3sn5DfOdpTtmmt8EEibscQ7H0xoIFNApDTofr0Qo/C/tduaCZqXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=ZVk8jJ7r; arc=none smtp.client-ip=115.124.30.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ZVk8jJ7r"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788919031; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=YJX4jMGPn68Bg3x4fB66fOlpPyQ7Wwc4MaKVzswffK0=;
	b=ZVk8jJ7rF96TmsjmT3pHvhOBJlSBNbrUcnnoR8TOY2w3t2Ng0zBmkmj/8jvbqWiKGf4kLDK56qrqtjUzu2lzy22m/5XuJBPHPKfDuE+Z+3J28ZoB5eeQ8aeYhbfy5x6/TAD5Ge6mUt5358+yUK9XRmV6+ZG3A6zfKApDYOT6cp0=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0XAdOQaY_1788919030;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XAdOQaY_1788919030 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 09 Sep 2026 09:57:11 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org
Cc: kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	hannes@cmpxchg.org,
	david@kernel.org,
	mhocko@kernel.org,
	ljs@kernel.org,
	ridong.chen@linux.dev,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH mm-new v2] mm: mglru: clear the reference counter for rejected folios
Date: Wed,  9 Sep 2026 09:57:04 +0800
Message-ID: <9214e36bf738fcfba86acc8cea85dff4010f66b0.1788918714.git.baolin.wang@linux.alibaba.com>
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

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
Changes from v1:
 - Update the commit message.
 - Clear LRU_REFS_FLAGS earlier.
---
 mm/vmscan.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 40d3f1b48a74..1557679aadb1 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -5020,11 +5020,12 @@ static int evict_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
 			continue;
 		}
 
+		/* See the comments on LRU_REFS_FLAGS */
+		folio_set_lru_refs(folio, 0);
+
 		/* don't add rejected folios to the oldest generation */
-		if (lru_gen_folio_seq(lruvec, folio, false) == min_seq[type]) {
-			folio_set_lru_refs(folio, 0);
+		if (lru_gen_folio_seq(lruvec, folio, false) == min_seq[type])
 			folio_set_active(folio);
-		}
 	}
 
 	move_folios_to_lru(&list);
-- 
2.47.3

