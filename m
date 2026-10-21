Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792626988;
	b=dz15+dTlpI3YCZpwGPAo6sC2lYQgaICvx3qj+132u+fI+deyRaIt3bSeZm46l2/ndmiF
	 oAv85Fp66lTo5bBMTYRdZ4+gvbVsy8Y7X31otJZgTxEsoLRqcd2yaeHNzo3aEo+TZjM+N
	 RHLWcM3iscuh+qtV3ZcwAckJ8eake5TCk2hcvwaYnAnyZ18Ua7WcjVByIjQbEUnhBwZar
	 t1M5n29iHShzNZfADOddcfgu3EYL+OoY6ipQz1zlisuL3444/7lVPuHolvBCPGXQ/A+WW
	 nsvirVbEB60I4WqPgSIslVUcvhnki39P85y1M3t70uU4ZqUJZkojh9hKJDm3gvw9jJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792626988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9X5fZ/FbtwVEHohDXP7Y9pADWXE7M/FKsbGY4MERs24=;
	b=Cyollz7wYpdBa+XSjzT3WuEvNla8/sHuqUAptsnyI7qz5pAuXZtbegHFFHUe8jK9eSLx
	 nzVjWbPiSOokw/o0a2sWqWCBnUIOAO0J/A/5lzlbtwP530xXyZE1sDZAUqYByPp8Ym8rK
	 CITurgW8K7Unv6JA6R8MssY6mOizQT8FipK49ek5RMiTxHZynFxpRxN/d1w8qFPjfD0HP
	 nqfayrbEPk1erqjIgBZ5LUlx2K7pz7TdXw98Q4AV3oUIa/RdEve/tXI72gQO8CMlRTf+N
	 NICkUXuBXznVo4qedxqIO7D5G2HVksZTKW7ksimeHdjNOzbFoPm9WD3+vbb1NmGARTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cOpxvwVT;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32FF606A325
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 23:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A32FF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cOpxvwVT
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a07078200fso544369b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792626987; x=1793231787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9X5fZ/FbtwVEHohDXP7Y9pADWXE7M/FKsbGY4MERs24=;
        b=cOpxvwVTTia8/hMhYfRnL7Y9HyYoSCfwu8BXodIE6ulBJ8tFd4t5LBI3/sQGtVygGH
         PUaZOJk+seK4wooDwEOB08hMpocCUJk20T30rW7seK3TWzFpZaZlmeLT6y5aKkHJsNVL
         qH0xP6i9aO1roX8EuU3Nefyxrud9r9zd5N1s6iNFcZ6zBsZsidTRy3CE/ewkkvYFg1Va
         cEa4+Uys6sEO95J2Dw8eMlTPHI5oUPF/zplHAca/egHV3e61/v7ZBnjy/uDlci5AR1FI
         2OVn74jMKXXFiIuDtxY2+4l0nos1xY2++I0xpSJvSLfs/Xop5yGs4dZ1BIXDEVZ9SSjK
         v8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792626987; x=1793231787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9X5fZ/FbtwVEHohDXP7Y9pADWXE7M/FKsbGY4MERs24=;
        b=vCA5B67ezWeBx/ASw7T/ReKD1zjayNAveWl7SJxQadVbscg7AEoRemyOT7gqh4AVZx
         QO+Y0qllj7HsjJSRwI00iEX/awDFWgZQoXreMO+eVdw2qK96RHMR6HGQhVXt683/i9rE
         9coeiH9dx9bjpg0UOx1ieyVZESVL+5EWQiHb4eN3iYepqnJk2ZEEfULbGvC8IjQ4hS8T
         RLQuEolQRLN7cFDf1vIYcntWPd7agl/3dDAgndFZ3MusSKJMnC6SAM8XJGCJv9l9rNsJ
         pNQYlSTvdvIe6x4qIFeRWQaGKYI9cgaidSppvffeNuJ5OwCXPZVAzA/qVC8app6bnZje
         oWkQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/A66R4QAvwkrn5+zmtqM3/9dNH2gxqXWgDfqlAdJz5xrbGsKnvzMJ+Gyv7JWrs6WmpA8VR5DNN3fEH7Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7evU1heaj8hI7qGzhtwY7K5U03GTMmcp2HgYPAMcavZ4cRjNF
	eRjLfIqYVWnpM+7JEgVadH2f3DcVl7tmFx0SwBkujNkCMlT7HWmhDczf
X-Gm-Gg: AYBFou03oOcwqthv/wk46M1/uTCm1vmpi5JMlHVSHNmnaLF6GqW7acNxqecIaKQYsU9
	CmQHxc7cDIkmyIXNkFSW/uHayf/9oAhL4r5Hkp+MEf/e0dSEpFi1+gkdmzLdvDoIqnntul7SgVf
	LBGWp7QAxYINXFUAnlfYoqnQdT2asNCvdxsDpQvBwQRfmkGrP0UUn/mFr9UAQaKNjYm+pUz14cr
	q/2IMoq7BC0qbd6kuEIFHEBWImp1p8q1Hd0J6lIS9eJtdEHJL6viQpCkUbAijil1dNHnb7Ue0jH
	8gFYxFXs9rnzE2KDol2cXZ5PNgcEse54f7hEV4H4o+6JNkmn/Fxs8SrzYdVTj41g1lAPol9vTYP
	g3iztQcak6Qpgw4oNzRHqDcjnCU40ULeq/9ZzPFZVB2+kSFuJnJ2kmz2vQ8wii3Zqr6qHqO0RNb
	SSQJQbvqwrmdiHReFL/BE7d6TtheyhY+yOiIMg1sciKc80c2MU1H+Wu9a+znS3k2KBlvi9gu4K0
	wH6SLEIw5WHFwlUl5RjVfl8boG3ir10JY4MOxGiQas9V/dIrF5kLUr1fDoRJXElgpFa/yo3Ta42
	23JH1nTjiEnuUlvpB35Sy99RPf2WabDK2hwgMR3fTH+z6ua28ph0zHsc8+FswpH0PeDEvd8a5xV
	9WYMU6h6dYu1DeVamGOk+AzPTCYG6n4BC5+tf4+bzdyIkBFPRYLW1hzAn47gHucZKHHg=
X-Received: by 2002:a05:6a00:4185:b0:89e:9c7e:fd56 with SMTP id d2e1a72fcca58-8a089d1fd3emr2665695b3a.33.1792626987000;
        Wed, 21 Oct 2026 16:56:27 -0700 (PDT)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895fa696sm1366733b3a.45.2026.10.21.16.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 16:56:26 -0700 (PDT)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: akpm@linux-foundation.org,
	hannes@cmpxchg.org
Cc: david@kernel.org,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	ljs@kernel.org,
	kasong@tencent.com,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	yuzhao@google.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	apais@microsoft.com,
	rlmenge@gmail.com,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>,
	Hardik Garg <hargar@linux.microsoft.com>
Subject: [PATCH v1 2/2] mm: multi-gen LRU: remove get_lruvec()
Date: Wed, 21 Oct 2026 23:56:06 +0000
Message-ID: <20261021235606.89545-2-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021235606.89545-1-sidchintamaneni@gmail.com>
References: <20261021235606.89545-1-sidchintamaneni@gmail.com>
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

get_lruvec() was originally introduced in commit ec1c86b25f4b ("mm:
multi-gen LRU: groundwork") to guard against NULL NODE_DATA(nid) on
uninitialized NUMA nodes (`return pgdat ? &pgdat->__lruvec : NULL;`).
After commit 09f49dca570a ("mm: handle uninitialized numa nodes
gracefully") and commit 931b6a8b36a2 ("mm: multi-gen LRU: remove NULL
checks on NODE_DATA()"), that NULL check was removed, leaving
get_lruvec() as a thin wrapper around mem_cgroup_lruvec().

Remove get_lruvec() and call mem_cgroup_lruvec() directly at all call
sites.

Cc: Barry Song <baohua@kernel.org>
Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Signed-off-by: Hardik Garg <hargar@linux.microsoft.com>
---
 mm/vmscan.c | 39 +++++++++++++++------------------------
 1 file changed, 15 insertions(+), 24 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 99e9f07fa2e1..5767b94fd8e8 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -2741,15 +2741,6 @@ static bool should_clear_pmd_young(void)
 #define get_memcg_gen(seq)	((seq) % MEMCG_NR_GENS)
 #define get_memcg_bin(bin)	((bin) % MEMCG_NR_BINS)
 
-static struct lruvec *get_lruvec(struct mem_cgroup *memcg, int nid)
-{
-	struct pglist_data *pgdat = NODE_DATA(nid);
-
-	VM_WARN_ON_ONCE(!memcg && !mem_cgroup_disabled());
-
-	return mem_cgroup_lruvec(memcg, pgdat);
-}
-
 static int get_swappiness(struct lruvec *lruvec, struct scan_control *sc)
 {
 	struct mem_cgroup *memcg = lruvec_memcg(lruvec);
@@ -2942,7 +2933,7 @@ void lru_gen_add_mm(struct mm_struct *mm)
 	spin_lock(&mm_list->lock);
 
 	for_each_node_state(nid, N_MEMORY) {
-		struct lruvec *lruvec = get_lruvec(memcg, nid);
+		struct lruvec *lruvec = mem_cgroup_lruvec(memcg, NODE_DATA(nid));
 		struct lru_gen_mm_state *mm_state = get_mm_state(lruvec);
 
 		/* the first addition since the last iteration */
@@ -2972,7 +2963,7 @@ void lru_gen_del_mm(struct mm_struct *mm)
 	spin_lock(&mm_list->lock);
 
 	for_each_node(nid) {
-		struct lruvec *lruvec = get_lruvec(memcg, nid);
+		struct lruvec *lruvec = mem_cgroup_lruvec(memcg, NODE_DATA(nid));
 		struct lru_gen_mm_state *mm_state = get_mm_state(lruvec);
 
 		/* where the current iteration continues after */
@@ -4424,7 +4415,7 @@ void lru_gen_online_memcg(struct mem_cgroup *memcg)
 
 	for_each_node(nid) {
 		struct pglist_data *pgdat = NODE_DATA(nid);
-		struct lruvec *lruvec = get_lruvec(memcg, nid);
+		struct lruvec *lruvec = mem_cgroup_lruvec(memcg, pgdat);
 
 		spin_lock_irq(&pgdat->memcg_lru.lock);
 
@@ -4446,7 +4437,7 @@ void lru_gen_offline_memcg(struct mem_cgroup *memcg)
 	int nid;
 
 	for_each_node(nid) {
-		struct lruvec *lruvec = get_lruvec(memcg, nid);
+		struct lruvec *lruvec = mem_cgroup_lruvec(memcg, NODE_DATA(nid));
 
 		lru_gen_rotate_memcg(lruvec, MEMCG_LRU_OLD);
 	}
@@ -4459,7 +4450,7 @@ void lru_gen_release_memcg(struct mem_cgroup *memcg)
 
 	for_each_node(nid) {
 		struct pglist_data *pgdat = NODE_DATA(nid);
-		struct lruvec *lruvec = get_lruvec(memcg, nid);
+		struct lruvec *lruvec = mem_cgroup_lruvec(memcg, pgdat);
 
 		spin_lock_irq(&pgdat->memcg_lru.lock);
 
@@ -4480,7 +4471,7 @@ void lru_gen_release_memcg(struct mem_cgroup *memcg)
 
 void lru_gen_soft_reclaim(struct mem_cgroup *memcg, int nid)
 {
-	struct lruvec *lruvec = get_lruvec(memcg, nid);
+	struct lruvec *lruvec = mem_cgroup_lruvec(memcg, NODE_DATA(nid));
 
 	/* see the comment on MEMCG_NR_GENS */
 	if (READ_ONCE(lruvec->lrugen.seg) != MEMCG_LRU_HEAD)
@@ -4489,7 +4480,7 @@ void lru_gen_soft_reclaim(struct mem_cgroup *memcg, int nid)
 
 bool recheck_lru_gen_max_memcg(struct mem_cgroup *memcg, int nid)
 {
-	struct lruvec *lruvec = get_lruvec(memcg, nid);
+	struct lruvec *lruvec = mem_cgroup_lruvec(memcg, NODE_DATA(nid));
 	int type;
 
 	for (type = 0; type < ANON_AND_FILE; type++) {
@@ -4536,7 +4527,7 @@ static void try_to_inc_max_seq_nowalk(struct mem_cgroup *memcg,
  */
 void max_lru_gen_memcg(struct mem_cgroup *memcg, int nid)
 {
-	struct lruvec *lruvec = get_lruvec(memcg, nid);
+	struct lruvec *lruvec = mem_cgroup_lruvec(memcg, NODE_DATA(nid));
 	int type;
 
 	for (type = 0; type < ANON_AND_FILE; type++) {
@@ -4613,8 +4604,8 @@ void lru_gen_reparent_memcg(struct mem_cgroup *memcg, struct mem_cgroup *parent,
 	struct zone *zone;
 	enum lru_list lru;
 
-	child_lruvec = get_lruvec(memcg, nid);
-	parent_lruvec = get_lruvec(parent, nid);
+	child_lruvec = mem_cgroup_lruvec(memcg, NODE_DATA(nid));
+	parent_lruvec = mem_cgroup_lruvec(parent, NODE_DATA(nid));
 
 	for_each_managed_zone_pgdat(zone, NODE_DATA(nid), zid, MAX_NR_ZONES - 1)
 		for (type = 0; type < ANON_AND_FILE; type++)
@@ -5370,7 +5361,7 @@ static void lru_gen_change_state(bool enabled)
 		int nid;
 
 		for_each_node(nid) {
-			struct lruvec *lruvec = get_lruvec(memcg, nid);
+			struct lruvec *lruvec = mem_cgroup_lruvec(memcg, NODE_DATA(nid));
 
 			lruvec_lock_irq(lruvec);
 
@@ -5501,7 +5492,7 @@ static void *lru_gen_seq_start(struct seq_file *m, loff_t *pos)
 
 		for_each_node_state(nid, N_MEMORY) {
 			if (!nr_to_skip--)
-				return get_lruvec(memcg, nid);
+				return mem_cgroup_lruvec(memcg, NODE_DATA(nid));
 		}
 	} while ((memcg = mem_cgroup_iter(NULL, memcg, NULL)));
 
@@ -5533,7 +5524,7 @@ static void *lru_gen_seq_next(struct seq_file *m, void *v, loff_t *pos)
 		nid = first_memory_node;
 	}
 
-	return get_lruvec(memcg, nid);
+	return mem_cgroup_lruvec(memcg, NODE_DATA(nid));
 }
 
 static void lru_gen_seq_show_full(struct seq_file *m, struct lruvec *lruvec,
@@ -5715,7 +5706,7 @@ static int run_cmd(char cmd, u64 memcg_id, int nid, unsigned long seq,
 		goto done;
 
 	sc->target_mem_cgroup = memcg;
-	lruvec = get_lruvec(memcg, nid);
+	lruvec = mem_cgroup_lruvec(memcg, NODE_DATA(nid));
 
 	if (swappiness < MIN_SWAPPINESS)
 		swappiness = get_swappiness(lruvec, sc);
@@ -5899,7 +5890,7 @@ void lru_gen_exit_memcg(struct mem_cgroup *memcg)
 	VM_WARN_ON_ONCE(mm_list && !list_empty(&mm_list->fifo));
 
 	for_each_node(nid) {
-		struct lruvec *lruvec = get_lruvec(memcg, nid);
+		struct lruvec *lruvec = mem_cgroup_lruvec(memcg, NODE_DATA(nid));
 		struct lru_gen_mm_state *mm_state = get_mm_state(lruvec);
 
 		VM_WARN_ON_ONCE(memchr_inv(lruvec->lrugen.nr_pages, 0,
-- 
2.45.4

