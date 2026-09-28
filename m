Received: from mta1.migadu.com (out-109.mta1.migadu.com [95.215.58.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32B64B1CF5
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.109
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790596087; cv=none; b=nVuKQu20+WnVTCKWEf1v1MhYUTeR0uOTmuNL8klmtZUdIOleXKgv/QQgQpBz4AXvZkme3ODfwbZOKWJRWH+a13x4LVcN/xEYcdbENKpqDMvhI8SATPWZP814vvdmzW7RXrJHhUehsOWFj3Kw+MDds2WuGHJWnjLppImFyFwB0aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790596087; c=relaxed/simple;
	bh=wh39Lb8B8PZ4mAQMySeGjNr5Tlgc2XnpQJa5hI542jc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HoirIun0jNwR4+9amKYQ+4Cia0asdkG9MIvfqAdtCBog8p3/4GAbcLHSWqO79zkUh+8+/kdRbte316SU1TnrAqB7wmh3+XS1qbN6wX8c7ynU6LpdF3WzkeeBqwjBQE9PwgrSnHLWjqZ61fIIRYKnAWve9yfkQrZvM92PcYPQoD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=a0iVw9xj; arc=none smtp.client-ip=95.215.58.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="a0iVw9xj"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=wh39Lb8B8PZ4mAQMySeGjNr5Tlgc2XnpQJa5hI542jc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790596082; v=1; x=1791200882;
 b=a0iVw9xj+O7T/tvRBIMaIH5Gbqt/RAoid8AuLQjg6SO2vnNyLbdq7NgSFHvJVih/cgzAAW2f
 OZJ9/w5CPUHX+/j6roAdQ/LiBKqc5EN6U6zAyjX8KGPWlFrm+fjbGjP5Eh0KXREv5w0RbjtMbnh
 fAkvfGS+P7IHv2IQ2CiicXfI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a68d3de41c786f1a;
	Mon, 28 Sep 2026 11:48:02 +0000
X-Mizu-Trace-ID: a68d3de41c786f1a
X-Migadu-Flow: FLOW_OUT
From: Ridong Chen <ridong.chen@linux.dev>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dave Chinner <david@fromorbit.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Muchun Song <muchun.song@linux.dev>,
	Qi Zheng <qi.zheng@linux.dev>,
	Kairui Song <kasong@tencent.com>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	cgroups@vger.kernel.org (open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)),
	linux-mm@kvack.org (open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)),
	Ridong Chen <ridong.chen@linux.dev>,
	Ridong Chen <chenridong@xiaomi.com>
Subject: [PATCH RFC v2 6/7] mm/vmscan: pass scan_control to mm_vmscan_reclaim_pages
Date: Mon, 28 Sep 2026 19:46:23 +0800
Message-Id: <20260928114625.3609130-7-ridong.chen@linux.dev>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260928114625.3609130-1-ridong.chen@linux.dev>
References: <20260928114625.3609130-1-ridong.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ridong Chen <chenridong@xiaomi.com>

reclaim_folio_list() passes sc.nr_scanned to mm_vmscan_reclaim_pages as
a bare argument. Pass the enclosing struct scan_control instead and read
nr_scanned out in TP_fast_assign, consistent with the other reclaim
tracepoints. nr_reclaimed stays a separate argument as it is the return
value of shrink_folio_list() rather than a scan_control field.

The exported event format is unchanged.

No functional change.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
---
 mm/trace_vmscan.h | 10 +++++-----
 mm/vmscan.c       |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/mm/trace_vmscan.h b/mm/trace_vmscan.h
index 9b4a86fff37c..04f285e77659 100644
--- a/mm/trace_vmscan.h
+++ b/mm/trace_vmscan.h
@@ -418,11 +418,11 @@ TRACE_EVENT(mm_vmscan_write_folio,
 
 TRACE_EVENT(mm_vmscan_reclaim_pages,
 
-	TP_PROTO(int nid,
-		unsigned long nr_scanned, unsigned long nr_reclaimed,
-		struct reclaim_stat *stat),
+	TP_PROTO(int nid, struct scan_control *sc,
+		 unsigned long nr_reclaimed,
+		  struct reclaim_stat *stat),
 
-	TP_ARGS(nid, nr_scanned, nr_reclaimed, stat),
+	TP_ARGS(nid, sc, nr_reclaimed, stat),
 
 	TP_STRUCT__entry(
 		__field(int, nid)
@@ -440,7 +440,7 @@ TRACE_EVENT(mm_vmscan_reclaim_pages,
 
 	TP_fast_assign(
 		__entry->nid = nid;
-		__entry->nr_scanned = nr_scanned;
+		__entry->nr_scanned = sc->nr_scanned;
 		__entry->nr_reclaimed = nr_reclaimed;
 		__entry->nr_dirty = stat->nr_dirty;
 		__entry->nr_writeback = stat->nr_writeback;
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 030f14740cbc..6ec84390ee2a 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -2183,7 +2183,7 @@ static unsigned int reclaim_folio_list(struct list_head *folio_list,
 		list_del(&folio->lru);
 		folio_putback_lru(folio);
 	}
-	trace_mm_vmscan_reclaim_pages(pgdat->node_id, sc.nr_scanned, nr_reclaimed, &stat);
+	trace_mm_vmscan_reclaim_pages(pgdat->node_id, &sc, nr_reclaimed, &stat);
 
 	return nr_reclaimed;
 }
-- 
2.34.1

