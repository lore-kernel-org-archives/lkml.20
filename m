Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794809525;
	b=4+q6VJN72/5hBvSteo0lC51SOMdTPZc457iJUmuga7ifHmedNT7HXnypZ7OsRJRXrku9
	 +Nc8LCSAyijEFaenZs9vTSN/3HXY4FULJNukOfRmSt/t6PJYgfF16sHzPtfJBcyU1hbNM
	 xiLCHCCy2CJrdh2krpdSTaCxFqq8adnyX0qzubVaHRzGUf1CxF1IhEH1F/CHQZBFxJVSW
	 ZW+WQkUhpDa3/K0oQrRiAtyaxCBg8g9m/GH1W3MnxSsesj2T0NCFvMKstQ5wpjumVSYRz
	 C74hY/XbKItn6/qUnOLGa3WGVJB70nEGaUBUSomo93RiWpsC0gsP/JDm0KLHSjtaoMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794809525;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=0RMiKm8OhZ/whW1u17DDxpoYgGPWHg9pbYjHuqCA9VI=;
	b=kFfrd1TlEENIY5IgW4qdA+jOECKpMXj6ZChHt5a1GJtT9Dy4+lovdDpefLg2j4++75sX
	 sknfjcgGmVSYOoqTYBBK/T/VpyY5vyYJzT0B29+u5wlrYuTrO3GfEc9TcgsZb8JFWigu1
	 IdLfatpWrQCW3w0hT2rphpTb2vwmMOyQ7JfYYW7nBiyPe1CBsjOFqzds1HYqcfmIdbzuw
	 991DN5EfZkUJJqc57+Qjlm/bM+w6Q0NPuNMk7PUBmWyEqAHl3wNwdBr/hV4ChsiVSxyKS
	 QDbubFCBkZcCACmpDRWMOwN2MKZtvv+oHLqYm9V3X3tWtKx/cJHGjX6pLXCzTro32SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UJYOwvTY;
	arc=none smtp.remote-ip=95.215.58.39
Received: from mta1.migadu.com (out-39.mta1.migadu.com [95.215.58.39])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB5D606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:12:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DB5D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UJYOwvTY
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=hQuBY7FIlaTSnxksxhCcBvzfrEGVlJz/9yiTBC1ZBTs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794809522; v=1; x=1795414322;
 b=UJYOwvTYw4H7n27qc1Z2QjVajGDz6CUxx3VwggM5WmfTD3NjdbwW6zpUWhQSsSJqwfIkr9tI
 PO8kvrWvcnDANPU06ug1Om4c0rPTPrcHaMElg7p+F/rKu+LKXoxztPuIFecMtlM4Gvr4WtrvsU0
 NUco27WbtJb1cp/sK1/gR5yo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id af38cebce14534ca;
	Mon, 16 Nov 2026 06:12:02 +0000
X-Mizu-Trace-ID: af38cebce14534ca
X-Migadu-Flow: FLOW_OUT
From: "Hui Zhu" <hui.zhu@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: Hui Zhu <zhuhui@kylinos.cn>
Subject: [PATCH v3] mm/mglru: use a smaller batch in fill/drain_evictable()
Date: Mon, 16 Nov 2026 14:11:58 +0800
Message-ID: <20261116061158.333826-1-hui.zhu@linux.dev>
X-Mailer: git-send-email 2.53.0
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

From: Hui Zhu <zhuhui@kylinos.cn>

lru_gen_change_state() migrates folios in batches of up to
MAX_LRU_BATCH (4096) folios under lruvec_lock_irq().  A full batch
keeps local interrupts off for up to about a millisecond, and CPUs
contending for the same lru_lock spin with interrupts disabled for
that long.

The caller already drops the lock and reschedules between batches,
and the restart protocol does not depend on the batch size: both
functions make monotone progress, so a smaller batch only shortens
the irq-off section.  Use MIN_LRU_BATCH (64) instead, bounding it to
about 15us.  This is a cold path that runs once per kill-switch
toggle; the extra unlock/resched/relock round trips cost a few
percent of wall time on an otherwise idle machine.

Same change as commit 6e9be217a3ce ("mm/mglru: use a smaller batch
for reclaim") made for try_to_shrink_lruvec().

Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
---
Changlog:
v3:
Drop the need_resched()/spin_is_contended() checks and shrink the batch
to MIN_LRU_BATCH instead (Baolin Wang).
v2:
Also yield on lock contention after a minimum batch (Kairui Song).

 mm/vmscan.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 6a1af9b92349..054af6cf6a2e 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -5499,7 +5499,7 @@ static bool __maybe_unused state_is_valid(struct lruvec *lruvec)
 static bool fill_evictable(struct lruvec *lruvec)
 {
 	enum lru_list lru;
-	int remaining = MAX_LRU_BATCH;
+	int remaining = MIN_LRU_BATCH;
 
 	for_each_evictable_lru(lru) {
 		int type = is_file_lru(lru);
@@ -5544,7 +5544,7 @@ static bool fill_evictable(struct lruvec *lruvec)
 static bool drain_evictable(struct lruvec *lruvec)
 {
 	int gen, type, zone;
-	int remaining = MAX_LRU_BATCH;
+	int remaining = MIN_LRU_BATCH;
 
 	for_each_gen_type_zone(gen, type, zone) {
 		struct list_head *head = &lruvec->lrugen.folios[gen][type][zone];
-- 
2.53.0

