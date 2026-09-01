Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B503473C76
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788252532; cv=none; b=Bri86aoqQjey6nHqjef12NZTC1y9cf7y3j4/LjHtLaJB2l8T8AuDxDmbYmKz/QxDLv0F2K/c+8rP2uJl0OnDBt9NsLO06SiUoM7sNbCGXrZ7Co1sKt7Ukk5IfQljS/1ljk+kQH6Pj1E+Xmz78yo9SX+pQXu/Y5yz6XFI/h17jzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788252532; c=relaxed/simple;
	bh=oAr2xSnNStj9baR1lIelWzgT/r+QQDwqANCW9K7ad9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cNLkPdvU4/k99MIi1BPIor9pVxku61+ZSrr8sWcje38sM+6swGJYOm5Qg4ouDBr2hbxl7j0+6CMqujHVI7BRpjjF9ZwzTqnZguwZBW8AHlJdnlVSiyt+NygY7vD0KplYxmsfKEmAn31XN47Amec67giin7/mAszHe1w3eGx6yWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=J9SyWHLI; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="J9SyWHLI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=n+
	SR/NJSg/EtwwaXWRG+qNU7rqtKtDhFvpyfSCWiMk0=; b=J9SyWHLItMi7+r+nII
	h+iVjgfLEXyNnaZWR0sbd0/n8Zwp07Jkvbph2RA8+vYRQ4roVeruLalcbdU/hxoE
	pxywulbn6BPvP8ZZIhXF8TkpI5ShXpotw5UaKc6o+tRZDUdiT5GFEp7ckkoW2j5E
	qBlMRS/VUPIO8zkCpGDQIJMO8=
Received: from hpc (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgC3qo4OkZZqHFWTNA--.28200S4;
	Tue, 01 Sep 2026 16:47:12 +0800 (CST)
From: john <love_goo@163.com>
To: akpm@linux-foundation.org,
	liuye@kylinos.cn,
	hannes@cmpxchg.org,
	mhocko@kernel.org,
	david@kernel.org,
	ljs@kernel.org,
	hughd@google.com,
	mgorman@techsingularity.net,
	yang@os.amperecomputing.com
Cc: zhangqiuhao@huawei.com,
	wangkefeng.wang@huawei.com,
	mawupeng1@huwei.com,
	love_goo@163.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Wupeng Ma <mawupeng1@huawei.com>
Subject: [PATCH resend 2/2] mm: vmscan: stop scanning ineligible folios after max_nr_skipped
Date: Tue,  1 Sep 2026 16:47:06 +0800
Message-ID: <20260901084706.3784449-3-love_goo@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901084706.3784449-1-love_goo@163.com>
References: <20260901084706.3784449-1-love_goo@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgC3qo4OkZZqHFWTNA--.28200S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7CFyxtF17urWrWF15tr4ktFb_yoW8ZFWUpa
	n3GayDXr48Jw13G3sIqw1IgrySgrWFgFyUJF17Zr1xA3W3JFy2kFy7Kw1UZryrGrykXF1F
	qwnF9FWkWF1UJF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEeMKtUUUUU=
X-CM-SenderInfo: 5oryvsxjrrqiywtou0bp/xtbC7BGo4GqWkREuugAA3d

From: Wupeng Ma <mawupeng1@huawei.com>

When reclaiming for a lower zone, isolate_lru_folios() accounts folios
from higher zones as skipped and, once max_nr_skipped hits
SWAP_CLUSTER_MAX_SKIPPED, force-isolates the remaining ineligible folios
to keep the loop from spinning on the skipped ones.  Those folios are
reclaimed even though they can never satisfy the current allocation, so
nr_reclaimed is inflated into a false progress that keeps resetting
no_progress_loops in should_reclaim_retry() and delays the OOM.

Stop scanning once max_nr_skipped is reached instead of force-isolating
the ineligible folios.  The skipped folios are already accounted in
total_scan, so shrink_lruvec() can charge the overshoot against its scan
budget (see the previous commit) and will not rescan them.

Fixes: 1c7b17cf0594 ("mm/vmscan: fix hard LOCKUP in function isolate_lru_folios")
Signed-off-by: Wupeng Ma <mawupeng1@huawei.com>
---
 mm/vmscan.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 823af9e86efd3..375f7cd5aa441 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -1701,12 +1701,20 @@ static unsigned long isolate_lru_folios(unsigned long nr_to_scan,
 		nr_pages = folio_nr_pages(folio);
 		total_scan += nr_pages;
 
-		/* Using max_nr_skipped to prevent hard LOCKUP*/
-		if (max_nr_skipped < SWAP_CLUSTER_MAX_SKIPPED &&
-		    (folio_zonenum(folio) > sc->reclaim_idx)) {
+		/*
+		 * Using max_nr_skipped to prevent hard LOCKUP.
+		 * Once the cap is hit, stop rather than force-isolating:
+		 * reclaiming ineligible folios only inflates nr_reclaimed
+		 * into a false progress.
+		 */
+		if (folio_zonenum(folio) > sc->reclaim_idx) {
 			nr_skipped[folio_zonenum(folio)] += nr_pages;
-			move_to = &folios_skipped;
 			max_nr_skipped++;
+			if (max_nr_skipped >= SWAP_CLUSTER_MAX_SKIPPED) {
+				list_move(&folio->lru, &folios_skipped);
+				break;
+			}
+			move_to = &folios_skipped;
 			goto move;
 		}
 
-- 
2.53.0

