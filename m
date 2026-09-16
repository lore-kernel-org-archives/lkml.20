Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5C24E2F3E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789592782; cv=none; b=Yb1kHVPEe24c/vXqKtKBiFIIvS1rQSnD9jjAupb05CBy6UkV98W/p+xn5ubwTYy5zR5YtHWZf1wTZf0e4jdzmR1ne+tHku6swamic9fuu++gocg7oRteV3VdLBrta7o2J/4EsJc/rCIqfR7P+x/mbI6cjSYRgpVDDes16v/tMPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789592782; c=relaxed/simple;
	bh=4iNlQRuHJ3/AP4thfCwYHevvDqFDf2gRy5/msQNXKiU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BBwfC4kj1PWY/gDH5lobZ6meGw0U7InrO0ZIMKZipU21SHqZXk17whoQvzKbTDnF7q3F2UOyDQeUqwvuzpZEPSDo/F9ZL6+019qKda3Zmu6hnGHmM6T6dDmAMycpdP9rkhpGHqO1RASuKPlE/QX2RW8Pwi95VCjgtp2QkZ28tP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WVJkKTre; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WVJkKTre"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7f4df360cc9so78508a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789592762; x=1790197562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HaJwiI/6dGGbCvd8Rz5XOkB+OlzyBFXfmU7W/ZpuGJs=;
        b=WVJkKTre4aCj15aYOsoOM6QO3yqYX7djhgTpKS4/D4fvYcrrLsGWd0OtdxH+KrTN0z
         lUItTKad+25FSMAx+NyFQ5CaM28We44s0YrpE1PVoPJ9hMQ4BoSgDENApkxpFAyzeiwD
         q5KLvIvRyhR+8GBMhSSC5DXTGU0kxrghStqPQ0vRIKoa8uZBFr51pFF15VH1yrdFvXfq
         MSiOfB8T3WOPhQYnnZ0PskVFnKFixZRC51dNpCky7KuWaxiS8Dxge1d5LEeINTNZrj+3
         xh3iUeaE5scl8y3kxfh6CmmdsDDMOEzxypp0KOp3GJK5PT7+qyTcgYMVwlVfJslIUBiq
         XgZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789592762; x=1790197562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HaJwiI/6dGGbCvd8Rz5XOkB+OlzyBFXfmU7W/ZpuGJs=;
        b=K4LVUuHRKhRpZs3T4ChPoAng9lpRaYlt50tJkbIpjnB+mjKJtVcOAmnec1dDbx2UVD
         Jtim2qm0c6j/IE1S6RVWW4UTgDg4zCOMsfRZYnw11HY3Rap+nm/v/bkeaIW07H/RHOtS
         69kE4Oe8G821rvZ4SDX80M8A2iboqcTXk6G0yTO+PZv6/iuqTrkfhZDarKXNnteRNjZc
         9fT6YluSWQEmi5uvaAHgMoaSD9wRwjL7+vNmz/zTbwGbZypcLUdVlP0YlwhysPdu+TOC
         TnFyuqhXRFFXzk0WECqbq3NufMOCEbwpLhZJzP0FUnbBtTRJIz8ax5vld17PoGLh/mZ2
         i/Nw==
X-Forwarded-Encrypted: i=1; AKwUvBzoivPLYaP+lVYiL11Sx598swanUv25QeJQzRK5pj1KRyPZDujgPQcQXtzCTlhNRr1yKg7V/+QrkSxJEeo=@vger.kernel.org
X-Gm-Message-State: AFuF++lWutBLovgX351EhxpbaX7nS6JL4tU44b9OfjkSBAFS4WcQhoqO
	/+JZm/2WYHRTF0fX2ZOuo6Ks/biwUUmmS+wRk4YTmYmgpWwn9D6kGs95
X-Gm-Gg: AYBFou1l/JURMNvuMLVak3MbI1luSlYkhcDcbz5Z1jPInUJ89NeRscSaHvr18Xao072
	n7Z50fO6hY+3kZ5xcElPFMlQHZ9YtIK5zFhzwFwB0I1SdBbzzx8sdUbN/pDoenach37PMUuowpA
	oTmUlCkXyRzgIZdaeO1fnGHMPAu+4xMH1TSqg9GmljcWI3uUyAWEWDNai/MlC2IkrDDQMUwfjfZ
	Suj5gvC9HQkug9fXZgqd/DiBe47L+uu5g5ktRg5/0lDYMXPqXckvswrhSOa5IXeOJ8a7xKoPOm1
	P7tiRiKPKtIHK+j0Y8hEoc04Pmczi8dZnS8ffKj3bnQdkYG0S5Qwmv8dgrsotLfqLs6kS6wf/A1
	wODCgK11lmZMgQy0aVJGQpN1fB8INSbU3HkCUidgs3+y6J6fXzVFiLiUHmu77tTP2j30fPNBrm/
	DfeWYk1RDH48d42gvif0tZwbtXCa34nykx6InSaBVaor+ONtdrRQF4M0GenzBooC+nYEumg+iFX
	toaE4QgNS6lQdaxnwIxOf1dHYpLOw==
X-Received: by 2002:a05:6830:a1d0:10b0:805:5bf7:4ab with SMTP id 46e09a7af769-80c4bd14b16mr715864a34.1.1789592762077;
        Wed, 16 Sep 2026 14:06:02 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:2e::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80c466a2dcesm1019834a34.11.2026.09.16.14.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 14:06:01 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Shakeel Butt <shakeel.butt@linux.dev>
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Maarten Lankhorst <dev@lankhorst.se>,
	Maxime Ripard <mripard@kernel.org>,
	Natalie Vock <nat@pixelcluster.dev>,
	Tejun Heo <tj@kernel.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Oscar Salvador <osalvador@suse.de>,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v6 5/5] mm/memcontrol: add stock to the memsw page counter
Date: Wed, 16 Sep 2026 14:05:51 -0700
Message-ID: <20260916210552.891730-6-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260916210552.891730-1-joshua.hahnjy@gmail.com>
References: <20260916210552.891730-1-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Attach legacy memsw page counters to their own seven-slot per-CPU
stock. Charge, refill, drain, and hotplug handling now operate on the
memory and memsw banks independently.

Factor the common drain scheduling into schedule_stock_drain() now
that both stocks use it.

Keep the existing direct memsw rollback when the memory charge fails,
ensuring that failed allocations do not replenish the newly
attached memsw stock.

The separate banks can hit, contend, evict, and drain independently,
so their raw counters can temporarily drift by their cached amounts.
The previous patch preserves the user-visible cgroup-v1 invariant by
reporting memory.memsw.usage_in_bytes as the larger raw value.

Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
---
 mm/memcontrol.c | 62 ++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 46 insertions(+), 16 deletions(-)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 1a209ad535540..7d5b2539c5699 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -2056,6 +2056,13 @@ static DEFINE_PER_CPU_ALIGNED(struct page_counter_stock_pcp, memory_stock) = {
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
@@ -2160,12 +2167,30 @@ static bool schedule_drain_work(int cpu, struct work_struct *work)
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
@@ -2180,21 +2205,13 @@ void drain_all_stock(struct mem_cgroup *root_memcg)
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
@@ -2221,6 +2238,11 @@ static int memcg_hotplug_cpu_dead(unsigned int cpu)
 	stock = per_cpu_ptr(&memory_stock, cpu);
 	page_counter_drain_stock_fully(stock);
 	clear_bit(FLUSHING_CACHED_CHARGE, &stock->flags);
+#ifdef CONFIG_MEMCG_V1
+	stock = per_cpu_ptr(&memsw_stock, cpu);
+	page_counter_drain_stock_fully(stock);
+	clear_bit(FLUSHING_CACHED_CHARGE, &stock->flags);
+#endif
 
 	/*
 	 * A drain work queued before the CPU went away is executed by an
@@ -2524,8 +2546,8 @@ static int try_charge_memcg(struct mem_cgroup *memcg, gfp_t gfp_mask,
 retry:
 	reclaim_options = MEMCG_RECLAIM_MAY_SWAP;
 	if (do_memsw_account() &&
-	    !page_counter_try_charge(&memcg->memsw, nr_pages, &counter, false,
-				     NULL)) {
+	    !page_counter_try_charge(&memcg->memsw, nr_pages, &counter,
+				     may_batch, NULL)) {
 		mem_over_limit = mem_cgroup_from_counter(counter, memsw);
 		reclaim_options &= ~MEMCG_RECLAIM_MAY_SWAP;
 		goto reclaim;
@@ -3004,7 +3026,7 @@ static void obj_cgroup_uncharge_pages(struct obj_cgroup *objcg,
 	if (!mem_cgroup_is_root(memcg)) {
 		page_counter_refill_stock(&memcg->memory, nr_pages);
 		if (do_memsw_account())
-			page_counter_uncharge(&memcg->memsw, nr_pages);
+			page_counter_refill_stock(&memcg->memsw, nr_pages);
 	}
 
 	css_put(&memcg->css);
@@ -4108,6 +4130,10 @@ mem_cgroup_css_alloc(struct cgroup_subsys_state *parent_css)
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
@@ -5735,6 +5761,10 @@ int __init mem_cgroup_init(void)
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
2.53.0-Meta

