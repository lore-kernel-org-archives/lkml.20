Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640222;
	b=d2vmbT5FrmE4m/akRZ4zuyWI5e5l9HfSaXn3/wsc/gS5HpxHbBbs4pg2f9dLaFDxBvlx
	 TYaZt8k5lJAu4jn3p6LjPhgqBjI3dy9OCLMuDnvZkGjJCzt7V5zpj5pgecaTTLPZHbILj
	 /GHHtEkQetPEw9wPua16Z+RI4HNqpfXVe7pA3HVpLxJUxCev9CBgRzHrJQAcHHVN77PTR
	 SQjWqCYNNjWz6NVyRlMrtRSrGqf/d5bPM33thB8tG/1yZTCiy8d/kXgwKkuGw/KA0eI+Z
	 az55yX2ARp1XDB4SYj8bFaMN1+pCRI8lP+WqparVHxCdXQ2hSXWnn+7VSlAk7AvVb0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DOXRgiF+CNyVqkJbhOIwPMg67CTmwFoCbwz1N9b8GHg=;
	b=kXiKzFI7T1Bz9rkKnIdmlFd+t/g8FiK0YW0AypCty9rJ/TEBYApkVwdSsDIr3aoRyBxM
	 TPg/i3ONJ3STCd22kp3jVFWInDVNtp/87dKmksNy4Ed2Pqf9zBxyiWtVK9r2OMrbLdsFd
	 jYtDsRwUbSXx6xMb9TsfrESjD5geKEyGWuPXcEdqj2OaIL53SDCtQ2XbvZ5h3wFjUsDts
	 PpMIlJFJi+Wqwm9Aes73Sixh3R1AOUlGk0Abksnzm6x1ln1zKHdmLcJxDuihJ7NSObmGu
	 OPaetUNrjAEu1HgFm8nmfPji1bKouTeRVyj3IMRhf+PhD3FFtPGJml5rIEpOg7wxHnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=dn8aPYjq;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7EC60A382E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:10:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A7EC60A382E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=dn8aPYjq
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91ec396c93dso42906266d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640221; x=1795245021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOXRgiF+CNyVqkJbhOIwPMg67CTmwFoCbwz1N9b8GHg=;
        b=dn8aPYjqsKhZwsk82BdbxjEFSE/vMaBbe+cox5m/7Df2gkmp44jLmMvpjtlgfZpehZ
         8VtDuumfxKQgTiwQyA44zpz1VpN8VYZrXf//xLpygTlh/mmCOZUUriWdYQcivo3a6L8c
         pSLy+otkzSzeQbpqiCjEhw6ybrSDAS0wwtWIYAPCdN3t4w0SHwGCt9z5OPI431nT9Bi8
         d01uBHt/f2gRMxcffnVFJlRyMNQJXgPKkXXTca1su0yl/rgRpd+kzFKuE5dh3T9Fb0zS
         4a847RJn2X8B2/ph4+ebCG/EDKFe2shPGmqiKw/sYMfZOB+DZUFZhAVD4emTOAPr5BYM
         1JpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640221; x=1795245021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DOXRgiF+CNyVqkJbhOIwPMg67CTmwFoCbwz1N9b8GHg=;
        b=nap7nsHuwBsRA/S20TfmackptDzTVADjV2tm84ORloYBdveyNBXqx+2YlhTce1tOYi
         94Pk4uTQY544tMKZ414WIlbJlo1YV+9r/GkHMaWN6R4bCPKaH1mQJAcoMzcLlvq38LEy
         sbxDnjj4CaHuAlEAemNG1JjupR3hBA8bYPj/ElV7KfQ9WZXo2Rgk3w9L2xt0W+EIdGSD
         4y/991WHThT2zejB1yFf7m/ZI7RBAlyJmc9GDMVll6WVENSYbzpmDFZbJDO2kE9t+aca
         y1P0f2eWL0y2FT6DxmMRScVThjCcVlNYL5rA5JcqqI9kROaLpoWR4d+gG8PYvkO/Ktfp
         zu3Q==
X-Gm-Message-State: APuU4Z/qnRkvUoyhhlMjmTWOvMhyvpBXiJSqzabRGFlvRqVvDRilk0tU
	vzg0dvdA60qUuTpUcMa8oH3CR7wmMpClZKuBMvbslxn0VTKvo7p6iXY2jxb9FI1KwaI=
X-Gm-Gg: AYBFou3MM7O9wCpsOHrXxFL0dulaKt8cJma+7LpM9I6y3MEaZh6OJWJIgBOzBMuaIMZ
	LGr6gMAGNZ+c2ytgIPtJzzvp0ZRVivQimnDi+N7TIfDzyKMLDl+USY8++64OlRWf2SMfCfDgG7o
	/4IigWoVpjwNJ7L30rBmROct8V90b1tPRO9IeDDIZdAXUiMUorcmTHClQea3LwnzSfL8P3KqOLT
	Bm5m2xb8Ld5hd6CG09EHI5/AFE7IQakv8tEeKMrx15+MduXhTUBAH8fQz0p0K/zVwDzwV1mHgG2
	yUg4YNKYKjd30C0Swvri08yh+D3wzhES/91xQICF8cHqp2Z33iZyrzGIPnxgYmMIwL/L1VQ8gT3
	HWrS/VVP/taJKliLJIMVKDrse2mtSV6UrvdZmbs46mWB0su1mObRZh/ttkupmEKzWlKZ3Z4fP5z
	2/JOYpHYkHujJ638SmUpdGnc812YXYQJKsgoRDTaK3f3rbhgVKpZGJx55XMOepsYogjnFF56OWL
	mXOIgwXaZwrl9QOK8YlFeNQfsTliIPBnlACuIGmL0LydM8n9RlSEOC8cqB5U1fatJFShNZ4c/cn
	78JMoAu7mESO8ug+QSnp+Zcn+AhTeu1bgOuLMl3q+qGAqWRL4wEgElsqceY4HMSKQTYwE5WoN/y
	14KNtcC9wapbBlEM=
X-Received: by 2002:a05:6214:3905:b0:91e:7f01:f95a with SMTP id 6a1803df08f44-91f24229457mr72251376d6.46.1794640221033;
        Fri, 13 Nov 2026 23:10:21 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:20 -0800 (PST)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	linux-doc@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-serial@vger.kernel.org,
	linux-pm@vger.kernel.org,
	damon@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	johan@kernel.org,
	jirislaby@kernel.org,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	yury.norov@gmail.com,
	linux@rasmusvillemoes.dk,
	pavel@kernel.org,
	lenb@kernel.org,
	hannes@cmpxchg.org,
	brendan.jackman@linux.dev,
	ziy@nvidia.com,
	sj@kernel.org,
	muchun.song@linux.dev,
	osalvador@suse.de,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	xu.xin@linux.dev,
	chengming.zhou@linux.dev,
	gourry@gourry.net,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	matthew.brost@intel.com,
	byungchul@sk.com,
	apopple@nvidia.com,
	rientjes@google.com
Subject: [PATCH 08/22] mm/memory-tiers: restrict demotion topology to common memory
Date: Sat, 14 Nov 2026 02:09:45 -0500
Message-ID: <20261114070959.3490008-9-gourry@gourry.net>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114070959.3490008-1-gourry@gourry.net>
References: <20261114070959.3490008-1-gourry@gourry.net>
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

Memory outside N_MEMORY_COMMON is outside the ordinary allocation pool
and cannot be a generic demotion source or destination.

Build demotion paths and the default DRAM performance reference from
N_MEMORY_COMMON rather than every node that has memory, and do not
assign other nodes to a memory tier through the generic hotplug path.

Removing a node's memory already resets its demotion targets, so a node
that unplugs and returns outside N_MEMORY_COMMON keeps none.

All memory nodes currently carry N_MEMORY_COMMON, behavior is unchanged.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/memory-tiers.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/mm/memory-tiers.c b/mm/memory-tiers.c
index 7fc56a8c66518..97d5ecefd89f3 100644
--- a/mm/memory-tiers.c
+++ b/mm/memory-tiers.c
@@ -370,7 +370,8 @@ int next_demotion_node(int node, const nodemask_t *allowed_mask)
 	 * closest demotion target.
 	 */
 	nodes_complement(mask, *allowed_mask);
-	return find_next_best_node_in(node, &mask, &node_states[N_MEMORY]);
+	return find_next_best_node_in(node, &mask,
+				      &node_states[N_MEMORY_COMMON]);
 }
 
 static void disable_all_demotion_targets(void)
@@ -405,7 +406,7 @@ static void dump_demotion_targets(void)
 {
 	int node;
 
-	for_each_node_state(node, N_MEMORY) {
+	for_each_node_state(node, N_MEMORY_COMMON) {
 		struct memory_tier *memtier = __node_get_memory_tier(node);
 		nodemask_t preferred = node_demotion[node].preferred;
 
@@ -441,7 +442,7 @@ static void establish_demotion_targets(void)
 
 	disable_all_demotion_targets();
 
-	for_each_node_state(node, N_MEMORY) {
+	for_each_node_state(node, N_MEMORY_COMMON) {
 		best_distance = -1;
 		nd = &node_demotion[node];
 
@@ -459,7 +460,7 @@ static void establish_demotion_targets(void)
 		 * nodelist to skip list so that we find the best node from the
 		 * memtier nodelist.
 		 */
-		nodes_andnot(tier_nodes, node_states[N_MEMORY], tier_nodes);
+		nodes_andnot(tier_nodes, node_states[N_MEMORY_COMMON], tier_nodes);
 
 		/*
 		 * Find all the nodes in the memory tier node list of same best distance.
@@ -468,7 +469,7 @@ static void establish_demotion_targets(void)
 		 */
 		do {
 			target = find_next_best_node_in(node, &tier_nodes,
-							&node_states[N_MEMORY]);
+							&node_states[N_MEMORY_COMMON]);
 			if (target == NUMA_NO_NODE)
 				break;
 
@@ -507,7 +508,7 @@ static void establish_demotion_targets(void)
 	 * allocation to a set of nodes that is closer the above selected
 	 * preferred node.
 	 */
-	lower_tier = node_states[N_MEMORY];
+	lower_tier = node_states[N_MEMORY_COMMON];
 	list_for_each_entry(memtier, &memory_tiers, list) {
 		/*
 		 * Keep removing current tier from lower_tier nodes,
@@ -554,7 +555,7 @@ static struct memory_tier *set_node_memory_tier(int node)
 
 	lockdep_assert_held_once(&memory_tier_lock);
 
-	if (!node_state(node, N_MEMORY))
+	if (!node_state(node, N_MEMORY_COMMON))
 		return ERR_PTR(-EINVAL);
 
 	mt_calc_adistance(node, &adist);
@@ -706,8 +707,8 @@ static int __init memory_tier_late_init(void)
 	get_online_mems();
 	guard(mutex)(&memory_tier_lock);
 
-	/* Assign each uninitialized N_MEMORY node to a memory tier. */
-	for_each_node_state(nid, N_MEMORY) {
+	/* Assign each uninitialized common memory node to a memory tier. */
+	for_each_node_state(nid, N_MEMORY_COMMON) {
 		/*
 		 * Some device drivers may have initialized
 		 * memory tiers, potentially bringing memory nodes
@@ -929,8 +930,8 @@ static int __init memory_tier_init(void)
 	if (IS_ERR(default_dram_type))
 		panic("%s() failed to allocate default DRAM tier\n", __func__);
 
-	/* Record nodes with memory and CPU to set default DRAM performance. */
-	nodes_and(default_dram_nodes, node_states[N_MEMORY],
+	/* Record common-memory nodes with CPUs for default DRAM performance. */
+	nodes_and(default_dram_nodes, node_states[N_MEMORY_COMMON],
 		  node_states[N_CPU]);
 
 	hotplug_node_notifier(memtier_hotplug_callback, MEMTIER_HOTPLUG_PRI);
-- 
2.53.1-Meta

