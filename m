Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793046229;
	b=PVoNqa8kyVuUV72pnuJocK+rslH/C588IfIarDn6wp8pMkF8zhPVpN3a4+2wVfzieqU8
	 RuwoMckiMKYrARP3hBJMn6FTYru3D0Yr5n8DLs7FLRB3pB8rOgZjI6g2wsSZOuxka0cc/
	 RNEIWdjJLHQ6YCvh45xKwMCL0SlFG6E7lfJlfz0YZkYzXECTFhMX60lomlsnxDgAyTfbC
	 vBoaZzNJwBW+K+XTAAcFz8isHNh+2pLHpyJmGZL7ENXqEA8mvAJ92Oi4YAK6U5vBgxDV7
	 eWzMloDBLd7E0FaWQr8fBooWXTwdK1qjhQ9Sud8xuRdA70hL0JmQ3sE6k3ytWCTZlnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793046229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=faymWgnFdRC1Ks69YF78/tFXx05sYwA9Q3xwmQUKoUw=;
	b=BFxoNnf0o54/b3OvzEHM6cDFsp5XdSA+jzr/cwcQtlLOlPTt0s4fdwOCZb0dhnc2HSx0
	 whtd7qiulc/kG/36yjbdOtRv6l/flecn+/MqlS5JpkSKu85poOOnu77R1TakqYPUgbC28
	 CF78JLCGbmUCoRObigwpUjFcAZ2matCrZRTfnuczgBe1YEcv9eKwmhzC65tp6yuL3XID8
	 x6rU5vfugy3gPOxfR1V26KtQVJT4WMZsmxqwSg8eJkemKnt9wkzak1SM8OVjKfbQGtfSj
	 SEo2eQqpBRLd5fPHuwxcoN1qRp2WzsZXdJCMQZB9UyFA4uNrRckxNlCntqIjVvoWA8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KcXqNYbs;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282D6606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:23:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 282D6606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KcXqNYbs
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a06e79e152so1667355b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793046228; x=1793651028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=faymWgnFdRC1Ks69YF78/tFXx05sYwA9Q3xwmQUKoUw=;
        b=KcXqNYbsPqvSDhGBrUyabXjruTIPint79F2Q17hVWRy86nY+ZDwCy1nTyH0t5NULbi
         uB1TDe2CA+bBEYE3xymiMu8L3n6NG4NL8w11Mcqcv+/PyjC12qrJXGiQjl9/6uPHW0O3
         CCPK52XMPrhZC2cck+K0TUWA4yIVY12KCypFQVABVKs41LrF+Nmqlggk5P2MJVbQXke4
         MFaClQ0iiDaItHjt7SRfAAcNX+0oGWqZ0vTWI7wY6o4Dm2qle8Qh3A4+F208TBMbjsaD
         matL/l5Jm10FggyqhIeH3xFyQsFXbKRKkHJ80JkmNl5UxifBHAxC6ZtIbgjINtqg3Z/D
         UoFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793046228; x=1793651028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=faymWgnFdRC1Ks69YF78/tFXx05sYwA9Q3xwmQUKoUw=;
        b=bRsPVl5bULi8shatc4HS81J5HdkKAByE/p//qFchh7V7OnsTZR3Ck463Jna2jF3xeF
         xGnW+Y6hqfpQoD6GumZQHxUZO3/Brr7LPuTs4V8Bc4C/dlG5iOH8J5YGQyPIxctN/CLP
         2p4T48iCmLozNFfbrObbhTS7jQwhupLO0jr2wqpp7ynIhMhSx4NGXBdXXgw8Un4e1riN
         uvh1QUTkgsDi0x4e7NdFj/WpuJR25V7IiBE7/JUGriUDCl9vWqNIglp81KhcTXWJkTgX
         03MJidwWCaIaVDzPE1a2n13TkxaVjtzweXw7y4dHCRdRpVJ7Yz5h1KUKcYiRU9DgvgxP
         T7Lg==
X-Forwarded-Encrypted: i=1; AKwUvByUdtMQfkC/5XZYMXwoecmuYw5DImksAkBdjovhtIZIfO2IT/ZgG4W/DtK9Y93eHAtfeWfmZtEB+PmHB/8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuxXyKmA+MpWo4mszqgjZeko++vQ2js5g8/ObaBlbGbUcedAm/
	lXKf/QPH6hNVGYgSRt74KcVjdkQC7Yuu+xK1H9O0VTLC8lIjATopTJoI
X-Gm-Gg: AYBFou3nTw+KSdJRMaVUwxFfNhXYHvCJw30a+NV/sR+INPjHULXyaZu05oTDR1JmsVO
	NL0EsXUKHa9YHepLWtoXxu1Ooe6Bxh2eIBGR6JhYdxV7SqNT8s4Y5uwMykMEf2GScveilZ+p3to
	2h/YJSQ53ej/2OFGESGT8F1COaec6/bTSdz693NJ6zDBueMWX6muC3mckbOVs9bCj9NOBojxgqM
	5QPl1W8cRdd2nb1RajPjTGmNTky/hmYuan6KNL6gEPpIIM6nF2rA+abYa/e/xdBBJxHLIBApmZQ
	Xn0Y7/KrfbFGGmEpfrz9hlSspp76KsakmwRWxn/xJ3LXQ/5874qQrWOXUIfdodeoXQZ28rj3c9N
	OKvk2zwAB9N0OoFU2AvpYdlm0mEkaNsrOXbKwfK4FV7RYexYLKOHFeDskcoZWlQMMLGwyuVj2Pa
	Dxa1NDjC4Zwt0WZ2Axq3Kjc+Z8A+g7RSxasWFw7MEXhx6WDTP3fBkyFax0SQIv2kPKcghZKi1t4
	d5v3ubfESFRmUvsih2jrbzS8+DS8yDYviLoDRKl3aTLADsO1/IZeEoFRp1PIbMUDfvmL4Ld2sW3
	X4U1iGVMd+GTBcLnrZ5h00qFA7kwkrBX//JhRU+s7LFgysIYYnyDf2bvE63dqMdApJordS7u8NX
	GPmooV+o7FBzyi/Mxuc5bCe5siQBJws0KaIEoCQpoEFDH+8UiiDBK4ZzyCWwF7w3jSv0=
X-Received: by 2002:a05:6a00:12d9:b0:8a0:6860:cb16 with SMTP id d2e1a72fcca58-8a364e52e50mr5448635b3a.8.1793046228194;
        Mon, 26 Oct 2026 13:23:48 -0700 (PDT)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36bb29546sm1627846b3a.33.2026.10.26.13.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:23:47 -0700 (PDT)
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
Subject: [PATCH v2 2/2] mm: multi-gen LRU: remove get_lruvec()
Date: Mon, 26 Oct 2026 20:23:13 +0000
Message-ID: <20261026202313.63122-3-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026202313.63122-1-sidchintamaneni@gmail.com>
References: <20261026202313.63122-1-sidchintamaneni@gmail.com>
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

Suggested-by: Barry Song <baohua@kernel.org>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
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

