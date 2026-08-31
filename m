Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F264ADD90
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194285; cv=none; b=oItRTwp4fUOEoLICXE8Rac9SOf8cpuGKCsKEWMth0L8pHoIpyUup622cgpR6GbTKcP1HWXB7/OreIhBsWIIzd6NzfgINq+pOFeB5BknmYczvMJEVyHHSV3baaQq4wzZ/oupZQIVGi+CTBgkG4b0PEPwsbDfGeuPAJRI4iT5yTE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194285; c=relaxed/simple;
	bh=K89uTa5EpQ9kFfWWW7y8lAp+J3EDDR87cMYtPD5wSV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l4C3J+clb9Xb62j/OStZAIssFaC0obE26wpraoqOeUr0drSZu4DRX64OFaYLENl/NpOh0P0rX8dIgwp4T1m4mUyYXGPYqY1+06Ld4mWi/J+o8Iv1NKVKl/S5ppD5hLQwscO43VJ2cPayhNiIRyi9pM/SFCrKtDLF1I/deYKQU1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DBhemhuv; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DBhemhuv"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6b19e291cc6so1512446eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788194282; x=1788799082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KCEcxBXECIK58MqzfUHKxW4lG6L2Egx8+PoUClZnYOs=;
        b=DBhemhuvtEj1fp2lqdOnDfIWwtM6Jr80nvYYO85lqw5BbYm9aBFkR0esPGOtiMQU4x
         Z0+e8f7kAlqLejMdrIcQp/9qUQb/Pp/spA+z9l5/FVn8Z1CbyQvI5Yml+t2B6zXz7SpM
         UTfj/xwdzlGhPGxyLgsS/03r6AoUoxEDKuXN9JJLFbix/fwRvGl8FxkpS6IHCyLbkq+b
         YNvM9zXm6VpM2XZTMV8gsMPR1d3JHY7J1hNxzABnMS/VxTzJs+bijhmCTSvKpa6F0Gqc
         13h9IIYJsuPPSvsP3/WHNwYPsbRofeAYgN5749BbjBJBrZXuxbVS9NxhRLpCfmQ8o8PF
         FVpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788194282; x=1788799082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KCEcxBXECIK58MqzfUHKxW4lG6L2Egx8+PoUClZnYOs=;
        b=Xl+wYEbR7Ayk2+o9W2l2Pe5bAWbLvCe7x0aOgw3bTXR1CvhuhvG8tPrsnnA0RYKcYg
         jO49jHb4l9UAIaS3pAamNg/nJvEXcDRLmmB3mmOmagDdMuenKnl+svTj3novnOOGsv/l
         Q6pA/trYiKOujLDbv9SsTeGUve7KqOUPZhOTH49dBLVc9MKsPUvxFsIc0wd2xd3WxA+E
         SJrQlZt6FVO/teGYyM7aTEvix1OY1Cyhnc75ZAJ1InjONa9nm08fML6felRkEFiU06rX
         xazP4Y6KtlTpV9PSGh8Kmgjt3f4MTggxDSnX7XBcEbOBHdn3IM7TORqOJwNLp3JtaXwm
         vadw==
X-Forwarded-Encrypted: i=1; AHgh+RqfDtwU9Kw9Dl5UiLx0LM6aPHx8Le+9xr2w41umS7mDjPSjeXpLlAIPYd4cRBb7amPHTdjWSQBCvLqYjdk=@vger.kernel.org
X-Gm-Message-State: AFuF++mmCPWddAQO7zRyHhLIZj++Iuqpw3Z/M3hA6pVQ2rmzOlLerSkf
	oSHdGJPuPmWjpuu32QvgaS2dahGRvr5EwLwrUMsrPuXj8CKE1GniKYCL
X-Gm-Gg: AR+sD11N2JaoH0NuZxqP1qD8QxoSD6gQcmXfPO7zcW8gSztfqLpEFHpla0IxU0DNr9N
	zQtynjYt1Sh1jek7zEqWPcwZb65UcV/6ELMJoEQ678Mw8HM07zSuUVKuiLwtLbt69QnTLKJu47K
	0NpB82K1/RkVtV8Wua+q7JWMv1rvK5MtjM/9RDRpjbbNr96P9PelBXtO/VzIQIlmtsebPV8f7/E
	WNgMcz8WXl/+OA6SjcLoV0hR3Gdgqt8VnumdeRQR8cgWvtrlR9+jU4nnG0CM2qrs7Phdxt1HUvA
	UpC5T4+5Y8jDtYHliTnEr+BE63Yhs4VqAeaId/tZmiwFL0wKf4WAbxrQ/7A2Mnbpc1u0yqOvz/d
	tileK5lyaiTF+83ZMSll5yVak6LVGc9JJX1aG0KKQCyfRGXpLMdaA1PLbho28+gwog5t5Nmh+bR
	Gmt1ra3fBmMd8JwHAWZFOXg74rR/V0meqX88XPNIM+qMUtq2Tzh4qRdTjUKeEkjjEF3FC365/tZ
	Ohno3L0RTrmXhWPZg==
X-Received: by 2002:a05:6820:1791:b0:6b1:d18b:4048 with SMTP id 006d021491bc7-6b372d21358mr2106016eaf.10.1788194281822;
        Mon, 31 Aug 2026 09:38:01 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:e::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f4fa7e97d5sm8453832a34.10.2026.08.31.09.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 09:38:01 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: hannes@cmpxchg.org,
	shakeel.butt@linux.dev,
	mhocko@kernel.org
Cc: roman.gushchin@linux.dev,
	muchun.song@linux.dev,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	dev@lankhorst.se,
	mripard@kernel.org,
	nat@pixelcluster.dev,
	tj@kernel.org,
	mkoutny@suse.com,
	osalvador@suse.de,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	kernel-team@meta.com
Subject: [PATCH v5 7/7] mm/memcontrol: add stock to the memsw page_counter
Date: Mon, 31 Aug 2026 09:37:51 -0700
Message-ID: <20260831163752.2193337-8-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831163752.2193337-1-joshua.hahnjy@gmail.com>
References: <20260831163752.2193337-1-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Before this series, each memcg had one stock shared by all its
page_counters (memory + memsw). Now that the memcg stock was folded
into the page_counter level, give memsw its own page_counter_stock
so that it can benefit from caching charges as well.

Note that while the allocation is conditional on do_memsw_account(),
the freeing is not; the freer will only free non-NULL stocks. This
matters because do_memsw_account() could have changed in between the
allocation and the free.

This narrows the memsw skew introduced by the previous patch. memsw is
now charged in the same batches as memory, so the two no longer diverge
systematically, but can still see transient drifts since each keeps
its own per-cpu stock. The drift is bound by
MEMCG_CHARGE_BATCH * nr_possible_cpus.

In the unlikely scenario that one of the stocks does not get allocated,
there will be different granularities of charging for the cgroup's
lifetime (one charging in batch granularity, the other just in
nr_pages).

Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
---
 mm/memcontrol.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 5678486cc55b0..33e4ffbd48a8b 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -2127,8 +2127,10 @@ void drain_all_stock(struct mem_cgroup *root_memcg)
 	if (!mutex_trylock(&percpu_charge_mutex))
 		return;
 
-	for_each_mem_cgroup_tree(memcg, root_memcg)
+	for_each_mem_cgroup_tree(memcg, root_memcg) {
 		page_counter_drain_stock_async(&memcg->memory);
+		page_counter_drain_stock_async(&memcg->memsw);
+	}
 
 	/* Hotplug races are OK; workers only touch their own cpu's obj_stock */
 	migrate_disable();
@@ -2159,8 +2161,10 @@ static int memcg_hotplug_cpu_dead(unsigned int cpu)
 	/* no need for the local lock */
 	drain_obj_stock(obj_st);
 
-	for_each_mem_cgroup_tree(memcg, NULL)
+	for_each_mem_cgroup_tree(memcg, NULL) {
 		page_counter_drain_cpu_stock(&memcg->memory, cpu);
+		page_counter_drain_cpu_stock(&memcg->memsw, cpu);
+	}
 
 	/*
 	 * A drain work queued before the CPU went away is executed by an
@@ -2467,7 +2471,7 @@ static int try_charge_memcg(struct mem_cgroup *memcg, gfp_t gfp_mask,
 		goto check_high;
 
 	if (do_memsw_account())
-		page_counter_uncharge(&memcg->memsw, nr_pages);
+		page_counter_refill_stock(&memcg->memsw, nr_pages);
 	mem_over_limit = mem_cgroup_from_counter(counter, memory);
 
 reclaim:
@@ -2926,7 +2930,7 @@ static void obj_cgroup_uncharge_pages(struct obj_cgroup *objcg,
 	if (!mem_cgroup_is_root(memcg)) {
 		page_counter_refill_stock(&memcg->memory, nr_pages);
 		if (do_memsw_account())
-			page_counter_uncharge(&memcg->memsw, nr_pages);
+			page_counter_refill_stock(&memcg->memsw, nr_pages);
 	}
 
 	css_put(&memcg->css);
@@ -3930,6 +3934,8 @@ static void __mem_cgroup_free(struct mem_cgroup *memcg)
 static void mem_cgroup_free(struct mem_cgroup *memcg)
 {
 	page_counter_free_stock(&memcg->memory);
+	/* memsw and swap are the same counter; only memsw is ever stocked */
+	page_counter_free_stock(&memcg->memsw);
 	lru_gen_exit_memcg(memcg);
 	memcg_wb_domain_exit(memcg);
 	__mem_cgroup_free(memcg);
@@ -4098,8 +4104,12 @@ static int mem_cgroup_css_online(struct cgroup_subsys_state *css)
 	css_get(css);
 
 	/* stock allocation failure is nonfatal; fall back to direct charges */
-	if (!mem_cgroup_is_root(memcg))
+	if (!mem_cgroup_is_root(memcg)) {
 		page_counter_alloc_stock(&memcg->memory, MEMCG_CHARGE_BATCH);
+		if (do_memsw_account())
+			page_counter_alloc_stock(&memcg->memsw,
+						 MEMCG_CHARGE_BATCH);
+	}
 
 	/*
 	 * Ensure mem_cgroup_from_private_id() works once we're fully online.
-- 
2.53.0-Meta

