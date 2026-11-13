Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794607555;
	b=Do2E17RLJ+nCpamWOSvAGAWQNBqaXd8XB8KEBiXJhu42UDigAdZasRu3I1vckp8ne94O
	 2Aki64e10draAx1gCc2rQdB9ASBQ6lDv18YCq2j0Z2ipvWhYziQqavn4Hy+Yq6JqkmVv+
	 3xPC3iTPau0kkOVQ1VEanVF2xi+Su/iStYI9ZFqdbiEraGNmr/7kvDMWEwzWJt4mhwRU1
	 sRHvK4o6NfJO42/4kehahjRTovPqTKL3e22O0aU9nVK+IyynyeuKxmHx6U/wvi0sm/iCS
	 rTNI1hSmg8WbFUjA6ZM4JnzKveHlIY+QtKwZxK1I5U8nT2K0Sd7ubx1K09fgDEToZOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794607555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oEux1Xz/zxYQ6Q/H2BR+VtuwQ39FefpqIgFmhfTyHbg=;
	b=sMLKIy8M+rmcgt+OBkToKa3wVquR32qe6YUTo/8b+ATblkAJXhkcw4X1N/nqD/SZLCce
	 TObwIggFNbnsLfdteLGKognq4s5I8IHYGv8rau7T13uRUVl44pwSLYg9M0NXza+m3Ee7y
	 44X4h2DQ7p/L2SQLJhiqkfqyOX2l4ihocTC80Fnphupk2LJoNjGqoUsHAsyGA3ad2wgeU
	 H3qdpOPI/UrrGekj00dsNwCffquIv403FWrTlB7tA2vIHLg8kZaeC4vwbmfB8TMAdiRh4
	 s5oAYaZOmV9WEms70oNNQKzbuI97f1OrKTFDf3zVsD+o69jjkBIYGAqHl+AHad+/QNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=spD2BFpm;
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BBD60A2639
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4BBD60A2639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=spD2BFpm
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b32b2e691aso22453567b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794607554; x=1795212354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oEux1Xz/zxYQ6Q/H2BR+VtuwQ39FefpqIgFmhfTyHbg=;
        b=spD2BFpmPClpu3aR+nnH44h4K6clRNwsRA3vRZelcglC1SgaWG9CwoVIH6mZ4y5vYL
         iWC0eHJdeO7MnNbHZf2S3hjbLBInl0+3mYjJ7EAnCJgTa0dvAYcf79A54FzhzFWCdvaG
         8TEH430hu+XN59RKrRX04tpcBAUgQbqKVptut/ti0B77QhlJbRzE7ne7myuIU+3ACW22
         pSzMIWUrCs7gMlcjEbXoBZTrIjJEIuMj+3u8Q4gOt8C5wnFrQod9oQAgWu1FtTS8Pgns
         WIYVJlltUSpwaCtz7P93zDFnXqkhzjULbScGzJdixazJfhIiUcGZauRid74IqH/7R7dW
         Eq1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794607554; x=1795212354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oEux1Xz/zxYQ6Q/H2BR+VtuwQ39FefpqIgFmhfTyHbg=;
        b=Vwuf5hhtjEsuO02cayEP6YlIAfxpNx6K1rtGEcvUPv7cG5lefFT2LCoI9wnjUiPCzO
         hzwm5F/ilumi6jNJqzMuKamxStQkUd8mfAPWxm+IPwDkW2cUo7BH2FPcAxEn48HKabjI
         gfpmSdvIXnqddQy2k4W+AsQAm/awbWEC+C72jdDuzwCe3+uR4cf1HPbu5deb33Bx3DsX
         Kw+Ax6C4ynCEc+dKSG7Unm+eYFYzD0JK5iSwFTnpQQXwpeD34MGLov/AMiW4RqjVI44F
         kobtP/w+5C6QPrGVuXRcK05Q+kkA4ubu4F3Z7UOCGbbDbtLkBO6vAj1WUjo2oz3VM5MR
         yNCw==
X-Forwarded-Encrypted: i=1; AL+hErHcDysuMWB/NA3fGMXu3xQghHU7Qf/8TpK5IftQDYyTI+eSqtsMKIIy3XIdNE+GmiexRMCrZN8iT8z25pw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UnmcOnVGuwLYsMG6UZMJpjVUowhfOFfcH0L2ssIMCJe6BAw58
	v6Bw8BE+8t8U615+0iP2oTtispjfosHc9Q9Vc012OiScdhu0tSv9cKp8
X-Gm-Gg: AYBFou2s8RPCjQ2WttLcEhz7sgu6TZA/XZopYAOmn4rEXHinpvWKOwPcWEMXJGd8Msv
	y4hz4RPexMDXD1o/MHA+/STi+Aej8lytVvAAResc9P1G/7zxmGM8ZP+6Q8QYlaq/NCt8IL4HWgV
	3wv31ZgQw5vgIirvscw8VVPfLIbNNyzEaKKwldxiLNnRj7xUuvuu6I6d7nAnoBIav5HEUsMYmEP
	FAdFlJhRwdan03xgBNvFVE643WP+D9fLcUgxO73bOeKGK8TMKwQcRRcpmiMVhmdOe1RhsvGS4Qr
	WfbuyI2by9jXtWpM15PcWOgm+QC5oAMK6x9KOwCvjqmp2xeM2qk+uRyvVYKiPSeXuZ9rERtfUbK
	GXmp6OsS1M9kRoQAUCHB1EpFsgQ0ZOXpgY9GT08iUXUgyFR8yIvV62BBtx9DU27kbNOkZ8wShHm
	AVtM5wMtc8S6UGYTcfE3LHKKvAaZVUWBsbwY82d5OT5J58ExD4d2vWazmpLZkiIW0lgiHmttQZa
	To7gGKb8jpAWa1nJ4BEUBPsFZkRJZiJywSAzMLHoDiKJfYPAuscElUI5e5rfYcJNcGKBgzGkNDE
	NCb10/wewarGtJcIjsxy4rak2fJglkKSD3MI5tDO9RTonK7tQCT+btoCIAf4
X-Received: by 2002:a05:690c:498f:b0:895:8474:3c6f with SMTP id 00721157ae682-8b4a9f74dcdmr27872247b3.0.1794607553668;
        Fri, 13 Nov 2026 14:05:53 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:45::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa7ee70csm31029047b3.6.2026.11.13.14.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 14:05:52 -0800 (PST)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Michal Hocko <mhocko@kernel.org>,
	Michal Koutny <mkoutny@suse.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Harry Yoo <harry@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Maarten Lankhorst <dev@lankhorst.se>,
	Maxime Ripard <mripard@kernel.org>,
	Natalie Vock <nat@pixelcluster.dev>,
	Tejun Heo <tj@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Balbir Singh <balbirs@nvidia.com>,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v9 6/7] mm/memcontrol: add stock to the memsw page counter
Date: Fri, 13 Nov 2026 14:05:33 -0800
Message-ID: <20261113220539.2275715-7-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261113220539.2275715-1-joshua.hahnjy@gmail.com>
References: <20261113220539.2275715-1-joshua.hahnjy@gmail.com>
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

Attach legacy memsw page counters to their own seven-slot per-CPU
stock. Charge, refill, drain, and hotplug handling now operate on the
memory and memsw banks independently.

Factor the common drain scheduling into schedule_stock_drain() now
that both stocks use it.

If the memory charge fails, roll back only nr_pages from memsw. Any
batch surplus the memsw charge already placed in the memsw stock
stays cached, like any other stock slot.

The separate banks can hit, contend, evict, and drain independently,
so their raw counters can temporarily drift by their cached amounts.
The previous patch preserves the user-visible cgroup-v1
memory <= memory + swap invariant by reporting memory.usage_in_bytes
as the smaller raw value.

Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
---
 mm/memcontrol.c | 64 ++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 48 insertions(+), 16 deletions(-)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 0f5481b276fa1..cb1f46b457ae8 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -2061,6 +2061,13 @@ static DEFINE_PER_CPU_ALIGNED(struct page_counter_stock_pcp, memory_stock) = {
 	.base = &memory_stock,
 };
 
+#ifdef CONFIG_MEMCG_V1
+static DEFINE_PER_CPU_ALIGNED(struct page_counter_stock_pcp, memsw_stock) = {
+	.lock = INIT_LOCAL_TRYLOCK(lock),
+	.base = &memsw_stock,
+};
+#endif
+
 /*
  * NR_OBJ_STOCK is sized so the entire hot path of obj_stock_pcp
  * (lock, accounting metadata, nr_bytes[] and cached[]) fits within a
@@ -2165,12 +2172,30 @@ static bool schedule_drain_work(int cpu, struct work_struct *work)
 	return true;
 }
 
+static void schedule_stock_drain(struct page_counter_stock_pcp __percpu *stock,
+				 struct cgroup_subsys_state *root_css,
+				 int cpu, int curcpu)
+{
+	struct page_counter_stock_pcp *pcp_stock = per_cpu_ptr(stock, cpu);
+
+	if (test_bit(FLUSHING_CACHED_CHARGE, &pcp_stock->flags) ||
+	    !page_counter_stock_flush_required(pcp_stock, root_css) ||
+	    test_and_set_bit(FLUSHING_CACHED_CHARGE, &pcp_stock->flags))
+		return;
+
+	if (cpu == curcpu)
+		drain_local_stock(&pcp_stock->work);
+	else if (!schedule_drain_work(cpu, &pcp_stock->work))
+		clear_bit(FLUSHING_CACHED_CHARGE, &pcp_stock->flags);
+}
+
 /*
  * Drains all per-CPU charge caches for given root_memcg resp. subtree
  * of the hierarchy under it.
  */
 void drain_all_stock(struct mem_cgroup *root_memcg)
 {
+	struct cgroup_subsys_state *root_css = &root_memcg->css;
 	int cpu, curcpu;
 
 	/* If someone's already draining, avoid adding running more workers. */
@@ -2185,21 +2210,13 @@ void drain_all_stock(struct mem_cgroup *root_memcg)
 	migrate_disable();
 	curcpu = smp_processor_id();
 	for_each_online_cpu(cpu) {
-		struct page_counter_stock_pcp *memory_st =
-			per_cpu_ptr(&memory_stock, cpu);
 		struct obj_stock_pcp *obj_st = &per_cpu(obj_stock, cpu);
 
-		if (!test_bit(FLUSHING_CACHED_CHARGE, &memory_st->flags) &&
-		    page_counter_stock_flush_required(memory_st,
-						      &root_memcg->css) &&
-		    !test_and_set_bit(FLUSHING_CACHED_CHARGE,
-				      &memory_st->flags)) {
-			if (cpu == curcpu)
-				drain_local_stock(&memory_st->work);
-			else if (!schedule_drain_work(cpu, &memory_st->work))
-				clear_bit(FLUSHING_CACHED_CHARGE,
-					  &memory_st->flags);
-		}
+		schedule_stock_drain(&memory_stock, root_css, cpu, curcpu);
+#ifdef CONFIG_MEMCG_V1
+		if (do_memsw_account())
+			schedule_stock_drain(&memsw_stock, root_css, cpu, curcpu);
+#endif
 
 		if (!test_bit(FLUSHING_CACHED_CHARGE, &obj_st->flags) &&
 		    obj_stock_flush_required(obj_st, root_memcg) &&
@@ -2225,6 +2242,9 @@ static int memcg_hotplug_cpu_dead(unsigned int cpu)
 	/* no need for the local lock */
 	drain_obj_stock(obj_st);
 	page_counter_drain_stock_fully(memory_st);
+#ifdef CONFIG_MEMCG_V1
+	page_counter_drain_stock_fully(per_cpu_ptr(&memsw_stock, cpu));
+#endif
 
 	/*
 	 * A drain work queued before the CPU went away is executed by an
@@ -2233,6 +2253,10 @@ static int memcg_hotplug_cpu_dead(unsigned int cpu)
 	 * the CPU comes back online.
 	 */
 	clear_bit(FLUSHING_CACHED_CHARGE, &memory_st->flags);
+#ifdef CONFIG_MEMCG_V1
+	clear_bit(FLUSHING_CACHED_CHARGE,
+		  &per_cpu_ptr(&memsw_stock, cpu)->flags);
+#endif
 	clear_bit(FLUSHING_CACHED_CHARGE, &obj_st->flags);
 
 	return 0;
@@ -2618,8 +2642,8 @@ static int try_charge_memcg(struct mem_cgroup *memcg, gfp_t gfp_mask,
 
 retry:
 	if (do_memsw_account() &&
-	    !page_counter_try_charge(&memcg->memsw, nr_pages, &counter, false,
-				     NULL)) {
+	    !page_counter_try_charge(&memcg->memsw, nr_pages, &counter,
+				     may_batch, NULL)) {
 		mem_over_limit = mem_cgroup_from_counter(counter, memsw);
 		goto reclaim;
 	}
@@ -3050,7 +3074,7 @@ static void obj_cgroup_uncharge_pages(struct obj_cgroup *objcg,
 	if (!mem_cgroup_is_root(memcg)) {
 		page_counter_refill_stock(&memcg->memory, nr_pages);
 		if (do_memsw_account())
-			page_counter_uncharge(&memcg->memsw, nr_pages);
+			page_counter_refill_stock(&memcg->memsw, nr_pages);
 	}
 
 	css_put(&memcg->css);
@@ -4204,6 +4228,10 @@ mem_cgroup_css_alloc(struct cgroup_subsys_state *parent_css)
 		memcg->memory.stock_css = &memcg->css;
 		page_counter_init(&memcg->swap, &parent->swap, false);
 #ifdef CONFIG_MEMCG_V1
+		if (!memcg_on_dfl) {
+			memcg->memsw.stock = &memsw_stock;
+			memcg->memsw.stock_css = &memcg->css;
+		}
 		WRITE_ONCE(memcg->swappiness, mem_cgroup_swappiness(parent));
 		memcg->memory.track_failcnt = !memcg_on_dfl;
 		memcg->memsw.track_failcnt = !memcg_on_dfl;
@@ -5829,6 +5857,10 @@ int __init mem_cgroup_init(void)
 	for_each_possible_cpu(cpu) {
 		INIT_WORK(&per_cpu_ptr(&memory_stock, cpu)->work,
 			  drain_local_stock);
+#ifdef CONFIG_MEMCG_V1
+		INIT_WORK(&per_cpu_ptr(&memsw_stock, cpu)->work,
+			  drain_local_stock);
+#endif
 		INIT_WORK(&per_cpu_ptr(&obj_stock, cpu)->work,
 			  drain_local_obj_stock);
 	}
-- 
2.53.1-Meta

