Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25BE4BA9FD
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789514444; cv=none; b=rNz9mGiwkPZQhA76R39GYx4sFOsW1wXzhUBoTQqx1qf+YsFmOaVNl5NnmguUOvYaO1bqXbwykQd7g3E4ypc8cfNM0og+nyWJHBfYVaqfMCg66mTv2Jv5CHUHQD31ppjAtkQ94zaRcLonyEFhk9rOUiT6K9INHs5nnIdrqQJmHZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789514444; c=relaxed/simple;
	bh=YHxHgN6UU3N+CRyqP6YR9gtUjtCBlfYvowwLJv20ycc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bIkcEe5sz0SmXJT2Q7WPEsjkAf8s7+yfKPNTkxhKw2I/N8JJoB8FtD+yfZIJrCOND0+7I8MEvsqxms6POz7dKTGnbxp7aTUV4mbaArVaDd6CuHpJEgiOXiTJLsoBi3b54GajdWlkl+G3gJbq0cGzawKoPYCCLklh4GLITSov9e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=BrVYs1NM; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=eDlgetua; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="BrVYs1NM";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="eDlgetua"
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FMbngA4082512
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:20:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=0v7j
	5xbCjC/R2t86sIxx8y87XGVXaehizjaj2Q5S50U=; b=BrVYs1NMaZZGfupVL8/o
	I2XXxeOWRwH1ui7kzucUwQsOgPtFfFOvMu4CsxpUvCkarLs8g0wRAcKdeugGJyAx
	KGFk6THEL4SVIQZaQouxivpAYeuwAgB1PMAsEvWqQpAiSOQdjkybjvzFc5ObFZzU
	ERnOWeH7Ke6o7KbQ+12CqNSgNrlBho5/Y5ptjJ81fY1atYIy9JTGdTflgIPFTGi2
	ht4dIC5+V23Jc49dyMCMarl3pH+7L0lDqP0mEpagqAeAPJZCIUlAgwFOHuo88OO6
	9piJF76yQP+tYZtI/9X11QktRCPElr7cGkwdx9Q/BKeSMI800mi8Z18wLUm4y+cx
	gA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gqbwaj2h7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:20:39 -0400 (EDT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a0c7126e7so585588485a.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1789514438; x=1790119238; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0v7j5xbCjC/R2t86sIxx8y87XGVXaehizjaj2Q5S50U=;
        b=eDlgetuaiybO3rJvNx/DeKFVEqE0CvkjJ1KVnHntdKJQu9N5Dlrgkg25hqcvYJ7TDg
         7GZ546wqJldQUq3OYMKezx0JPgqa06p4Nb07sEaDdfNoY/1lEM2gsyelsoXB0ncVW/AA
         XU5E9Yz2P8U0ITB/Sx1BWijDga+UT+itkaKGhomNXRqO1s1l5aYzzgS52s+Jnl/RWsVp
         54uA6NMynXYksamX/gzGuEYCQfCqQLyx3/3dHx+oJHHb4OX8p3njIWZFEDn77U6MFoyA
         /qrpHmWVUQj2ikTYJ+kq1FgDaT6Zfq1CFs3/dmwpUbm4TD7vJZpa0YK2JZVIecZ5l271
         DNkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789514438; x=1790119238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0v7j5xbCjC/R2t86sIxx8y87XGVXaehizjaj2Q5S50U=;
        b=j/FeBMV58CGT5t5cpmF/H1rLtWdDyHfQalDUw/cV8eh8WT7veP+01AB6tLrkLuvZY/
         nAO78FBiALw7hHi2WbYGn/wbvABCPXwrZ0RDQHszmlMmQAzDE4LFYpdxH7LVsibR2O61
         A/m6I2Fyb1D77RYRILoSs3Lp0VqW+4vF/roSurg5ItESnaOlvjf7WveWSSK5RHBnH9ni
         BR+tWsycTVcDzDHtuokFYB1kjp1dT5sQWy8cMdmgJNjNOICluaQ2mQ6fpyiYNoDbKM0w
         yyCvScvTAUGXtW+jHXyzgIVzXr7XoYaZ3X9YFZDmTQcQiWHjXohnRls4v7YQv/eNf11v
         gd7g==
X-Forwarded-Encrypted: i=1; AKwUvBzPgJsPD3zrY63sXGkR8gSCRdZn/2ifK5UapALLu5PHvyZu8UEx8MjKMVCDFgO1FNdRyJQhFIbR2FAGL4M=@vger.kernel.org
X-Gm-Message-State: AFuF++kQJRaX5SEyPMht2ZrRg2iYQ3fifXCn0BuPC963AYbZsGtkF4wf
	RwJgQATGyDOPOCRI+eaGE1KpZGbrdCONqRE5kLqVbp9js5WfHzZb8uEMNHUUQany+rysebx+ITb
	mq1WNuoUfCFsJbyTSA+z65OTEWw2keBchIzJfWzeHHo7/jLpa11vUdWROdt0kPA==
X-Gm-Gg: AYBFou0Ba9srO4M9pfLw/5naulDPHxN6fxD/hrqW4Km6xtE/FQVsCsgQm0Og5b7iXdX
	8GkY3tqar62T1S0/q4+50jbibFc5wlAYTVsBjoXyXmNTxBVfuFskud3jZWiJwtD771xREqLNSDA
	YEgxDU4GaikUpvyvjpA6kteAXy7Di8FwJnKXV9/BmAznEHmonp4PPwaJJtAdH0csmFEij+0V3BZ
	upwKxCwIYZh5npBAVW3Qx9UBV/kFj5hWD1z6wpPSNRK/3ECNrvFP7d3cWT6T4kQa4DpUU40CgBM
	oGARDC4T7mmvOUc+BNCqYm5DXns9JM7ZQnMOcchSCU4na42iZbt9gSGTBAIz/LWVru+3eYCusEu
	gJZ7NdFke8NHfKFzEZHIs15BiugpfewrJqHk7sI5ejTz/UI4p
X-Received: by 2002:a05:620a:28cc:b0:939:6dea:4f1b with SMTP id af79cd13be357-93bb7947dd8mr52929285a.49.1789514438248;
        Tue, 15 Sep 2026 16:20:38 -0700 (PDT)
X-Received: by 2002:a05:620a:28cc:b0:939:6dea:4f1b with SMTP id af79cd13be357-93bb7947dd8mr52925285a.49.1789514437828;
        Tue, 15 Sep 2026 16:20:37 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-179-204.net.columbia.edu. [128.59.179.204])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b781dfde3sm77151085a.12.2026.09.15.16.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 16:20:35 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 15 Sep 2026 19:20:12 -0400
Subject: [PATCH v3 08/11] mm: memcontrol: constify the memcg and lruvec
 stat readers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-folio_memcg-const-v3-8-c239a6010b58@columbia.edu>
References: <20260915-folio_memcg-const-v3-0-c239a6010b58@columbia.edu>
In-Reply-To: <20260915-folio_memcg-const-v3-0-c239a6010b58@columbia.edu>
To: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Muchun Song <muchun.song@linux.dev>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>,
        Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>,
        Barry Song <baohua@kernel.org>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
        Baoquan He <baoquan.he@linux.dev>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chris Li <chrisl@kernel.org>, Kemeng Shi <shikemeng@huaweicloud.com>,
        Nhat Pham <nphamcs@gmail.com>, Youngjun Park <youngjun.park@lge.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789514423; l=8657;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=YHxHgN6UU3N+CRyqP6YR9gtUjtCBlfYvowwLJv20ycc=;
 b=uuSz1AN4zqrv+kKMUPwsyJcOR55Y3QGLadluQjZAAt4wjOFnOj6fBym05KwGEc1H5APSHo1Tn
 W6EXE/EhSJwCoQNu2oL3eojcGhds040wUiGowbePkxegFF+7xegz+S3
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: JeI9sjOZOcyiNIYJSrtZzD5REfZCyruY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDM0MSBTYWx0ZWRfX8HnIwTGtfmTR
 1x1zQfhM6T98GqYnj7Ir2iLgOcyw0WVVe7wbmJzl3qIffNXB4+pyKUArunwsmT7muHZMGktl2bF
 YxtjT3ZvGz14FJa112FSrI0ikS80s3LY6qorg2bqtezbhMYN+R2rRXTJWwD7F6dbG4fpT21Bmcb
 kxYjJgJJgd84i8cZiRQshlFMGUTu5AYXMnz4Tk+sisJbc3HeFlTJSVEwj+cbKKsHmSnU8WQl/lx
 gwwt9x22gBLBCC3gSbtSvpqCyiiB7e5SQKTB3Ug7tSLZbmQ0g6U4r9hAldrVkld3clj9nq31HV5
 HgVJEqb73v4r3XPcZYuPR8s03pvfkvx0pK2UIOhUu/I/EaqyTZEPz0a0rKlu7piW7x9VjTdqVaC
 UegKn1+QkYOaea5+fbrn2jAJOFr3DxZBG+vRGNJXGkzmOR7hfeP94MHM81DkmsXcxZpxj+P9nL/
 wnqmEblVfVgRIHW0tUA==
X-Proofpoint-ORIG-GUID: JeI9sjOZOcyiNIYJSrtZzD5REfZCyruY
X-Authority-Analysis: v=2.4 cv=JP2uIMKb c=1 sm=1 tr=0 ts=6aa9d2c7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=hXAsoc/zAxyCEdIRhrpmVw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=cGOFIiuQh4YOckM99toA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDM0MSBTYWx0ZWRfXyCtncvE5WNka
 Er10qszeHESWq27dNwlem74ycloB0PG9XfL28ZhcTlQKN9JTbVmJNelV7LIY+3JmHRsU6JACEGk
 qy09udBYqMHTpVSfw/6fiS5D9CJEj0DYqY4F9cXckPtfCBJbrdDG
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11906
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=10 priorityscore=1501 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=10
 impostorscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150341

The memcg_page_state(), memcg_events(), and lruvec_page_state()
families only read counters. Constify them.

Use container_of_const() in the lruvec_page_state() family while at it,
so the const isn't silently cast away.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/memcontrol.h | 23 ++++++++++++-----------
 mm/memcontrol-v1.h         |  6 +++---
 mm/memcontrol.c            | 30 +++++++++++++++---------------
 3 files changed, 30 insertions(+), 29 deletions(-)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 22067899eb6c..9beb065c0879 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -971,15 +971,16 @@ static inline void mod_memcg_page_state(const struct page *page,
 	rcu_read_unlock();
 }
 
-unsigned long memcg_events(struct mem_cgroup *memcg, int event);
-unsigned long memcg_page_state(struct mem_cgroup *memcg, int idx);
-unsigned long memcg_page_state_output(struct mem_cgroup *memcg, int item);
+unsigned long memcg_events(const struct mem_cgroup *memcg, int event);
+unsigned long memcg_page_state(const struct mem_cgroup *memcg, int idx);
+unsigned long memcg_page_state_output(const struct mem_cgroup *memcg, int item);
 bool memcg_stat_item_valid(int idx);
 bool memcg_vm_event_item_valid(enum vm_event_item idx);
-unsigned long lruvec_page_state(struct lruvec *lruvec, enum node_stat_item idx);
-unsigned long lruvec_page_state_monotonic(struct lruvec *lruvec,
+unsigned long lruvec_page_state(const struct lruvec *lruvec,
+				enum node_stat_item idx);
+unsigned long lruvec_page_state_monotonic(const struct lruvec *lruvec,
 					  enum node_stat_item idx);
-unsigned long lruvec_page_state_local(struct lruvec *lruvec,
+unsigned long lruvec_page_state_local(const struct lruvec *lruvec,
 				      enum node_stat_item idx);
 
 void mem_cgroup_flush_stats(struct mem_cgroup *memcg);
@@ -1412,12 +1413,12 @@ static inline void mod_memcg_page_state(const struct page *page,
 {
 }
 
-static inline unsigned long memcg_page_state(struct mem_cgroup *memcg, int idx)
+static inline unsigned long memcg_page_state(const struct mem_cgroup *memcg, int idx)
 {
 	return 0;
 }
 
-static inline unsigned long memcg_page_state_output(struct mem_cgroup *memcg, int item)
+static inline unsigned long memcg_page_state_output(const struct mem_cgroup *memcg, int item)
 {
 	return 0;
 }
@@ -1432,19 +1433,19 @@ static inline bool memcg_vm_event_item_valid(enum vm_event_item idx)
 	return false;
 }
 
-static inline unsigned long lruvec_page_state(struct lruvec *lruvec,
+static inline unsigned long lruvec_page_state(const struct lruvec *lruvec,
 					      enum node_stat_item idx)
 {
 	return node_page_state(lruvec_pgdat(lruvec), idx);
 }
 
-static inline unsigned long lruvec_page_state_monotonic(struct lruvec *lruvec,
+static inline unsigned long lruvec_page_state_monotonic(const struct lruvec *lruvec,
 							enum node_stat_item idx)
 {
 	return node_page_state_monotonic(lruvec_pgdat(lruvec), idx);
 }
 
-static inline unsigned long lruvec_page_state_local(struct lruvec *lruvec,
+static inline unsigned long lruvec_page_state_local(const struct lruvec *lruvec,
 						    enum node_stat_item idx)
 {
 	return node_page_state(lruvec_pgdat(lruvec), idx);
diff --git a/mm/memcontrol-v1.h b/mm/memcontrol-v1.h
index b9a21f0fd2c3..f6d128da443e 100644
--- a/mm/memcontrol-v1.h
+++ b/mm/memcontrol-v1.h
@@ -34,9 +34,9 @@ static inline bool do_memsw_account(void)
 	return !cgroup_subsys_on_dfl(memory_cgrp_subsys);
 }
 
-unsigned long memcg_events_local(struct mem_cgroup *memcg, int event);
-unsigned long memcg_page_state_local(struct mem_cgroup *memcg, int idx);
-unsigned long memcg_page_state_local_output(struct mem_cgroup *memcg, int item);
+unsigned long memcg_events_local(const struct mem_cgroup *memcg, int event);
+unsigned long memcg_page_state_local(const struct mem_cgroup *memcg, int idx);
+unsigned long memcg_page_state_local_output(const struct mem_cgroup *memcg, int item);
 bool memcg1_alloc_events(struct mem_cgroup *memcg);
 void memcg1_free_events(struct mem_cgroup *memcg);
 
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 4b7c01daebce..b13f5ed74a5a 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -490,9 +490,9 @@ struct lruvec_stats {
 	long state_pending[NR_MEMCG_NODE_STAT_ITEMS];
 };
 
-unsigned long lruvec_page_state(struct lruvec *lruvec, enum node_stat_item idx)
+unsigned long lruvec_page_state(const struct lruvec *lruvec, enum node_stat_item idx)
 {
-	struct mem_cgroup_per_node *pn;
+	const struct mem_cgroup_per_node *pn;
 	long x;
 	int i;
 
@@ -503,7 +503,7 @@ unsigned long lruvec_page_state(struct lruvec *lruvec, enum node_stat_item idx)
 	if (WARN_ONCE(BAD_STAT_IDX(i), "%s: missing stat item %d\n", __func__, idx))
 		return 0;
 
-	pn = container_of(lruvec, struct mem_cgroup_per_node, lruvec);
+	pn = container_of_const(lruvec, struct mem_cgroup_per_node, lruvec);
 	x = READ_ONCE(pn->lruvec_stats->state[i]);
 #ifdef CONFIG_SMP
 	if (x < 0)
@@ -531,10 +531,10 @@ unsigned long lruvec_page_state(struct lruvec *lruvec, enum node_stat_item idx)
  * monotonically-incremented event counters are stored in
  * enum node_stat_item.
  */
-unsigned long lruvec_page_state_monotonic(struct lruvec *lruvec,
+unsigned long lruvec_page_state_monotonic(const struct lruvec *lruvec,
 					  enum node_stat_item idx)
 {
-	struct mem_cgroup_per_node *pn;
+	const struct mem_cgroup_per_node *pn;
 	int i;
 
 	if (mem_cgroup_disabled())
@@ -544,14 +544,14 @@ unsigned long lruvec_page_state_monotonic(struct lruvec *lruvec,
 	if (WARN_ONCE(BAD_STAT_IDX(i), "%s: missing stat item %d\n", __func__, idx))
 		return 0;
 
-	pn = container_of(lruvec, struct mem_cgroup_per_node, lruvec);
+	pn = container_of_const(lruvec, struct mem_cgroup_per_node, lruvec);
 	return (unsigned long)READ_ONCE(pn->lruvec_stats->state[i]);
 }
 
-unsigned long lruvec_page_state_local(struct lruvec *lruvec,
+unsigned long lruvec_page_state_local(const struct lruvec *lruvec,
 				      enum node_stat_item idx)
 {
-	struct mem_cgroup_per_node *pn;
+	const struct mem_cgroup_per_node *pn;
 	long x;
 	int i;
 
@@ -562,7 +562,7 @@ unsigned long lruvec_page_state_local(struct lruvec *lruvec,
 	if (WARN_ONCE(BAD_STAT_IDX(i), "%s: missing stat item %d\n", __func__, idx))
 		return 0;
 
-	pn = container_of(lruvec, struct mem_cgroup_per_node, lruvec);
+	pn = container_of_const(lruvec, struct mem_cgroup_per_node, lruvec);
 	x = READ_ONCE(pn->lruvec_stats->state_local[i]);
 #ifdef CONFIG_SMP
 	if (x < 0)
@@ -827,7 +827,7 @@ static void flush_memcg_stats_dwork(struct work_struct *w)
 	queue_delayed_work(system_dfl_wq, &stats_flush_dwork, FLUSH_TIME);
 }
 
-unsigned long memcg_page_state(struct mem_cgroup *memcg, int idx)
+unsigned long memcg_page_state(const struct mem_cgroup *memcg, int idx)
 {
 	long x;
 	int i = memcg_stats_index(idx);
@@ -950,7 +950,7 @@ void mod_memcg_state(struct mem_cgroup *memcg, enum memcg_stat_item idx,
 
 #ifdef CONFIG_MEMCG_V1
 /* idx can be of type enum memcg_stat_item or node_stat_item. */
-unsigned long memcg_page_state_local(struct mem_cgroup *memcg, int idx)
+unsigned long memcg_page_state_local(const struct mem_cgroup *memcg, int idx)
 {
 	long x;
 	int i = memcg_stats_index(idx);
@@ -1113,7 +1113,7 @@ void count_memcg_events(struct mem_cgroup *memcg, enum vm_event_item idx,
 	put_cpu();
 }
 
-unsigned long memcg_events(struct mem_cgroup *memcg, int event)
+unsigned long memcg_events(const struct mem_cgroup *memcg, int event)
 {
 	int i = memcg_events_index(event);
 
@@ -1132,7 +1132,7 @@ bool memcg_vm_event_item_valid(enum vm_event_item idx)
 }
 
 #ifdef CONFIG_MEMCG_V1
-unsigned long memcg_events_local(struct mem_cgroup *memcg, int event)
+unsigned long memcg_events_local(const struct mem_cgroup *memcg, int event)
 {
 	int i = memcg_events_index(event);
 
@@ -1715,14 +1715,14 @@ static int memcg_page_state_output_unit(int item)
 	}
 }
 
-unsigned long memcg_page_state_output(struct mem_cgroup *memcg, int item)
+unsigned long memcg_page_state_output(const struct mem_cgroup *memcg, int item)
 {
 	return memcg_page_state(memcg, item) *
 		memcg_page_state_output_unit(item);
 }
 
 #ifdef CONFIG_MEMCG_V1
-unsigned long memcg_page_state_local_output(struct mem_cgroup *memcg, int item)
+unsigned long memcg_page_state_local_output(const struct mem_cgroup *memcg, int item)
 {
 	return memcg_page_state_local(memcg, item) *
 		memcg_page_state_output_unit(item);

-- 
2.39.5

