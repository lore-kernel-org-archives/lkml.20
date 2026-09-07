Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A9C27A462
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 03:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788751532; cv=none; b=ppn7IuB7suRol34MgMziWyMMQGw9qqp8QnCbYTzKjRTdbQfr5YoK6qaGfOmV8hmCYDCdcUnmwF2ynqQxYohDrcLXDXAAdCDlWp3aWobDhokKQWz694MFHSVVJik2E2gNeYruhnyv21IzHF9LgUdLMiP0MiVyt7FPLM2VYBjI0o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788751532; c=relaxed/simple;
	bh=VxkruZ4BJDmRngI8pJc2VdjBdy0Tpo4zmdyLURC4BxY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QRkg0gHtgTdVNxkmLQvZsqziOdGeYuxBExt/6uoVdRza1ARHeyYmCOKCYZLOrj/ia/xpnstUyDIPolwDdotOzkd0l0TQglPWNYNPErndvh7LRgJU2w0bNSxsVhrPT1t8BTDY5rSQMxtiRjKYrYy7X9yuGF24M+IvH92FvBfDyTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=bfXCQJhR; arc=none smtp.client-ip=115.124.30.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="bfXCQJhR"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788751519; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=rS6imTLMpSvjT8hbBugEkDfrPUjLonv/z4Zv4Tf3MOI=;
	b=bfXCQJhRPUeiDKxNFUUxyigTCXs+EgKqbaP64roSQ2I3vJEcc1UIB97Yhe6/0JH97eEG2bAKMnUz3Bwr08chYsKnXoPeFqdE7ICBAVQRi9dUAgEHm6Zr1DSWcEFRgS86rTAM5RKLKWZENmdT86v5nuLditb76jNLVngHkGhYwT0=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0XAOWTEg_1788751517;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XAOWTEg_1788751517 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 07 Sep 2026 11:25:18 +0800
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
	hebaoquan@kylinos.cn,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm: mglru: clear the reference counter for rejected folios
Date: Mon,  7 Sep 2026 11:25:12 +0800
Message-ID: <8e4db9a298c5ea6ccb192e274caed5b96f0cf022.1788751143.git.baolin.wang@linux.alibaba.com>
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
set the PG_active flag if the rejected folio is planned to be put back to
the oldest generation. That's fine.

But for those that are not put back to the oldest generation (which can
be treated as a promotion), we do not clear LRU_REFS_FLAGS, which can
violate the promotion mechanism. This means the rejected folio enters the
new generation with stale, inflated tier bits, which can inflate reference
counts and distort eviction statistics for these rejected folios.

Fix this by clearing LRU_REFS_FLAGS for rejected folios, and also do some
measurement. On my 32-core Arm machine, with the memcg limit set to 3G,
running 'make -j32' to build the kernel showed a small improvement in sys
time when using either a zram or NVMe swap device (averaged over 2 runs with
no significant variance).

zram swap:
		w/o patch	w/ patch
sys time:	1666.5s		1589.5s

NVMe swap:
		w/o patch	w/patch
sys time:	760s		741.5s

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/vmscan.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 40d3f1b48a74..42c0a09938ab 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -5021,10 +5021,11 @@ static int evict_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
 		}
 
 		/* don't add rejected folios to the oldest generation */
-		if (lru_gen_folio_seq(lruvec, folio, false) == min_seq[type]) {
-			folio_set_lru_refs(folio, 0);
+		if (lru_gen_folio_seq(lruvec, folio, false) == min_seq[type])
 			folio_set_active(folio);
-		}
+
+		/* See the comments on LRU_REFS_FLAGS */
+		folio_set_lru_refs(folio, 0);
 	}
 
 	move_folios_to_lru(&list);
-- 
2.47.3

