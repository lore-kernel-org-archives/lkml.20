Received: from mail-oi2-f43.google.com (mail-oi2-f43.google.com [74.125.231.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED314E1C78
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789592774; cv=none; b=oWIDLO3JKcnDY8TCNUIoiZ6x4NCWVUKHlw+hgCiZsMbH5ZORWuebNxteJRYPBUJuzpVSzC83Ti5VDhitnaJCn/a9uE2jjbAJcWI/u2L3qqj+YPJ12oGzW395hwPXkzAqvl5TlMGmr6oxJbrHkpuikrVKsXq+C4En5B5QoRF1b48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789592774; c=relaxed/simple;
	bh=aYack9iQ/NLabz3h4yWk2IS2sT6rmARUEn3hue6kgyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Or/SEWcqx62MKzFKd7GHqLWQgt2W9FX9a1bentE+AyoLSugTe1YGH+ySxzJzEvPSSlmDlELz71/9gWtL+wVV7as/I5HURpQAToNUoP48m7VqOyc+iv2G4wVohh8XEwaFHEWOmPv33JCWpy0qSb+hlY4eUnWY0AW+oo0t8PQfvsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bgd428WP; arc=none smtp.client-ip=74.125.231.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bgd428WP"
Received: by mail-oi2-f43.google.com with SMTP id 46e09a7af769-805bf8c2661so111458a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789592758; x=1790197558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OpeT7E+4SgQjmsGt8zdgsDPzGh6zBoDDRVsBk7NbP6k=;
        b=Bgd428WP+qUACtEX9SUjR/X8O82e0YP2zDh8OMDFjZMYoQpQv7qBDp9UV2MzZkGWcD
         BC9RahzlNZjAxJCRxsSJMPSefR6DWDmOhCsOBEjp3ble2Nu4iHZBXbVq5qjfYd0JnyDj
         Ei9H3Z1UbKvETZNVYevuQdJ87/qCrojkHd15SjqDHkmafY+7BgY4/yrH8wB4NNts+uR4
         7h8AOCwsv5XvTaZvW+esJpRW1mvtEXLSXITOxZCJLUiazhRsVK8Ll3y/Cv30aeXLUEa+
         KnwtKh+VKhIIPolHr7ucdnMWC1g3qJ00AkAcoMOBfNQfdSREeHGhJ2ux2kBinoRl85j2
         kMRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789592758; x=1790197558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OpeT7E+4SgQjmsGt8zdgsDPzGh6zBoDDRVsBk7NbP6k=;
        b=B7fCSRF68u3LjVY5yev+vTvSdPCgfym4ySwq1q631qB3phRidLKSx1qf1/uL1Ga0jv
         bkaFwaw4Gqn7Y8POmqRfAJb/OJ3p39E7SFr0knP0YRxwnrCNARqrZioq1RjRvJdmW0lK
         QG7qjjB2iOYMbpBtnFyLZ/27SUhHQcO4w7qX2rzuKg23GIvqW36qJAZutDjpDJp/4ii6
         b6yf0taJXJswo44F6pidsfYUlhNhRW5bkypanmxpF+8qQBEXyQORHlSppn8TbXbAwEz7
         cxr+oAyG6+OJG6NoewLzKL6xjb4Xot0ch7SFdyM20uflxxyWfzyi2htMWzED8nnDxfqT
         J3OQ==
X-Forwarded-Encrypted: i=1; AKwUvBzakMbfMJuw3cUTeLxhZ+EzPAEOskR3opm227bjljRWSeKo3nKCWaA3TehMBMC4VlWR9TdIv65PDbW+2lg=@vger.kernel.org
X-Gm-Message-State: AFuF++l3Y8FTmhmMH793oBO6DP9X9zA3HTDH6BeFuR6cPKdQ+Xa2EPCG
	fHnh7WM0o4C5NuTk0yOKYCnYgdFhiuDqkStRcLZc1++zr/4gpclKl80H
X-Gm-Gg: AYBFou3JFenHuMFnU7BxorJhN9/OMmr1UxZA8QXv+VrQW6j6xVTFmvr69tYVbr1j5xF
	9JKsmo6WgXCKHBwx2RupgvbC4jdmH9MTZw5QuF23cCf7So4qyagQUxyEMZI42PpgvRcbKIn4E/J
	lmTGg7q5Kd2l6Pn+pwMJ9LGCuPlO5H13v8JyWmB3qpWSGl0PAadZ80hxp8eS1Y0BOZZbG+FX6l+
	aOuMHGgh/+DqKyI3DxZU57wJIwPRMVLzCEDfS4ZLAScC4VNH61vD089Tu45IiLPW5ox2B5I40DH
	0vGnS3UkAcgONq9wuZmnBoBy7au+edfmagaoZzjj1Wwj5a1pXQukmKK1mGFQtAwzxz+4AqI++CO
	ijqwMnteoQAM1KyMGe24QTOuCIVZTNiaiBrvdWZv5lBE49lmLN2QPpLvjjKuuXpreYlMGJ5I8+0
	TNu9VrzoqqffjJaBnj77LZU/MYdBQHin8r/OHK5pwV4YNh6XIST3Xrr6h/aCQwZwIUNxNh4RhF3
	FOcATD4Q01wWX3SiQVJNcIPQjBV5Q==
X-Received: by 2002:a05:6808:1921:b0:4b9:a8ac:480 with SMTP id 5614622812f47-4ca4c6bab9emr5238137b6e.30.1789592758099;
        Wed, 16 Sep 2026 14:05:58 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:51::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4cb6d796b64sm891175b6e.15.2026.09.16.14.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 14:05:57 -0700 (PDT)
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
Subject: [PATCH v6 2/5] mm/page_counter: introduce per-CPU stock
Date: Wed, 16 Sep 2026 14:05:48 -0700
Message-ID: <20260916210552.891730-3-joshua.hahnjy@gmail.com>
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

Introduce a copy of the seven-slot per-CPU stock representation from
memcg in the page_counter layer. struct page_counter_stock_pcp preserves
everything from struct memcg_stock_pcp, but adds a new backpointer to
the base of the percpu stock, since there will be multiple percpu stock
base pointers later in the series (one for memory, one for memsw).

struct page_counter also gets a pointer to the base of the percpu stock,
as well as a struct cgroup_subsys_state pointer to pin its owning CSS
as long as the cached counter remains reachable.

Let's also copy over the drain, refill, and "flush required" functions,
preserving all behaviors from the memcg equivalent. In this patch they
are not connected.

No functional changes intended.

Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
---
 include/linux/page_counter.h |  31 +++++++++
 mm/page_counter.c            | 127 +++++++++++++++++++++++++++++++++++
 2 files changed, 158 insertions(+)

diff --git a/include/linux/page_counter.h b/include/linux/page_counter.h
index 07b7cb12249c7..9cb5612fe190f 100644
--- a/include/linux/page_counter.h
+++ b/include/linux/page_counter.h
@@ -5,8 +5,30 @@
 #include <linux/atomic.h>
 #include <linux/cache.h>
 #include <linux/limits.h>
+#include <linux/percpu.h>
+#include <linux/local_lock.h>
+#include <linux/workqueue_types.h>
 #include <asm/page.h>
 
+/*
+ * The value of NR_PAGE_COUNTER_STOCK is selected to keep the cached counters
+ * and their nr_pages in a single cacheline. This may change in the future.
+ */
+#define NR_PAGE_COUNTER_STOCK 7
+#define PAGE_COUNTER_STOCK_BATCH 64UL
+struct cgroup_subsys_state;
+struct page_counter;
+struct page_counter_stock_pcp {
+	local_trylock_t lock;
+	u8 nr_pages[NR_PAGE_COUNTER_STOCK];
+	struct page_counter *cached[NR_PAGE_COUNTER_STOCK];
+
+	struct page_counter_stock_pcp __percpu *base;
+	struct work_struct work;
+	unsigned long flags;
+	u8 drain_idx;
+};
+
 struct page_counter {
 	/*
 	 * Make sure 'usage' does not share cacheline with any other field in
@@ -41,6 +63,8 @@ struct page_counter {
 	unsigned long high;
 	unsigned long max;
 	struct page_counter *parent;
+	struct page_counter_stock_pcp __percpu *stock;
+	struct cgroup_subsys_state *stock_css;
 } ____cacheline_internodealigned_in_smp;
 
 #if BITS_PER_LONG == 32
@@ -61,6 +85,8 @@ static inline void page_counter_init(struct page_counter *counter,
 	counter->parent = parent;
 	counter->protection_support = protection_support;
 	counter->track_failcnt = false;
+	counter->stock = NULL;
+	counter->stock_css = NULL;
 }
 
 static inline unsigned long page_counter_read(struct page_counter *counter)
@@ -74,6 +100,11 @@ void page_counter_charge(struct page_counter *counter, unsigned long nr_pages);
 bool page_counter_try_charge(struct page_counter *counter,
 			     unsigned long nr_pages,
 			     struct page_counter **fail);
+void page_counter_refill_stock(struct page_counter *counter,
+			       unsigned long nr_pages);
+void page_counter_drain_stock_fully(struct page_counter_stock_pcp *stock);
+bool page_counter_stock_flush_required(struct page_counter_stock_pcp *stock,
+				       struct cgroup_subsys_state *root_css);
 void page_counter_uncharge(struct page_counter *counter, unsigned long nr_pages);
 void page_counter_set_min(struct page_counter *counter, unsigned long nr_pages);
 void page_counter_set_low(struct page_counter *counter, unsigned long nr_pages);
diff --git a/mm/page_counter.c b/mm/page_counter.c
index 98322803941a7..480a447bd7265 100644
--- a/mm/page_counter.c
+++ b/mm/page_counter.c
@@ -7,6 +7,7 @@
 
 #include <linux/page_counter.h>
 #include <linux/atomic.h>
+#include <linux/cgroup.h>
 #include <linux/kernel.h>
 #include <linux/math64.h>
 #include <linux/string.h>
@@ -14,6 +15,14 @@
 #include <linux/bug.h>
 #include <asm/page.h>
 
+/*
+ * Watermarks for a charge stock slot, in the spirit of pcp->high and
+ * pcp->batch: PAGE_COUNTER_STOCK_HIGH is the high watermark at which a slot is
+ * trimmed down to PAGE_COUNTER_STOCK_LOW rather than emptied.
+ */
+#define PAGE_COUNTER_STOCK_LOW (PAGE_COUNTER_STOCK_BATCH / 2)
+#define PAGE_COUNTER_STOCK_HIGH PAGE_COUNTER_STOCK_BATCH
+
 static bool track_protection(struct page_counter *c)
 {
 	return c->protection_support;
@@ -192,6 +201,124 @@ bool page_counter_try_charge(struct page_counter *counter,
 	return false;
 }
 
+static void page_counter_drain_stock(struct page_counter_stock_pcp *stock,
+				     int i)
+{
+	struct page_counter *counter = READ_ONCE(stock->cached[i]);
+	u8 nr_pages;
+
+	if (!counter)
+		return;
+
+	nr_pages = READ_ONCE(stock->nr_pages[i]);
+	if (nr_pages) {
+		page_counter_uncharge(counter, nr_pages);
+		WRITE_ONCE(stock->nr_pages[i], 0);
+	}
+	css_put(counter->stock_css);
+	WRITE_ONCE(stock->cached[i], NULL);
+}
+
+void page_counter_drain_stock_fully(struct page_counter_stock_pcp *stock)
+{
+	int i;
+
+	for (i = 0; i < NR_PAGE_COUNTER_STOCK; i++)
+		page_counter_drain_stock(stock, i);
+}
+
+bool page_counter_stock_flush_required(struct page_counter_stock_pcp *stock,
+				       struct cgroup_subsys_state *root_css)
+{
+	struct cgroup_subsys_state *css;
+	struct page_counter *counter;
+	bool flush = false;
+	int i;
+
+	rcu_read_lock();
+	for (i = 0; i < NR_PAGE_COUNTER_STOCK; i++) {
+		counter = READ_ONCE(stock->cached[i]);
+		if (!counter)
+			continue;
+		css = READ_ONCE(counter->stock_css);
+
+		if (READ_ONCE(stock->nr_pages[i]) &&
+		    cgroup_is_descendant(css->cgroup, root_css->cgroup)) {
+			flush = true;
+			break;
+		}
+	}
+	rcu_read_unlock();
+	return flush;
+}
+
+/**
+ * page_counter_refill_stock - return pages to a counter's stock
+ * @counter: counter to return pages to
+ * @nr_pages: number of pages to return
+ *
+ * If the stock cannot accept the pages, uncharge them from the hierarchy.
+ */
+void page_counter_refill_stock(struct page_counter *counter,
+			       unsigned long nr_pages)
+{
+	struct page_counter_stock_pcp __percpu *stock = counter->stock;
+	struct page_counter_stock_pcp *pcp_stock;
+	unsigned int stock_pages;
+	int empty_slot = -1;
+	int i;
+
+	/*
+	 * nr_pages[] is a u8 and a slot is capped at PAGE_COUNTER_STOCK_HIGH.
+	 * Raising PAGE_COUNTER_STOCK_BATCH beyond 127 would need careful
+	 * handling of nr_pages[] in struct page_counter_stock_pcp.
+	 */
+	BUILD_BUG_ON(PAGE_COUNTER_STOCK_BATCH > S8_MAX);
+	BUILD_BUG_ON(PAGE_COUNTER_STOCK_HIGH > U8_MAX);
+
+	if (!stock || nr_pages > PAGE_COUNTER_STOCK_BATCH ||
+	    !local_trylock(&stock->lock)) {
+		/*
+		 * For a larger-than-batch refill or an unlikely failure to lock
+		 * the per-CPU stock, uncharge the hierarchy directly.
+		 */
+		page_counter_uncharge(counter, nr_pages);
+		return;
+	}
+
+	pcp_stock = this_cpu_ptr(stock);
+	for (i = 0; i < NR_PAGE_COUNTER_STOCK; i++) {
+		struct page_counter *cached = READ_ONCE(pcp_stock->cached[i]);
+
+		if (!cached && empty_slot == -1)
+			empty_slot = i;
+		if (counter != cached)
+			continue;
+
+		stock_pages = READ_ONCE(pcp_stock->nr_pages[i]) + nr_pages;
+		if (stock_pages > PAGE_COUNTER_STOCK_HIGH) {
+			page_counter_uncharge(counter,
+					      stock_pages - PAGE_COUNTER_STOCK_LOW);
+			stock_pages = PAGE_COUNTER_STOCK_LOW;
+		}
+		WRITE_ONCE(pcp_stock->nr_pages[i], stock_pages);
+		local_unlock(&stock->lock);
+		return;
+	}
+
+	i = empty_slot;
+	if (i == -1) {
+		i = pcp_stock->drain_idx++;
+		if (pcp_stock->drain_idx == NR_PAGE_COUNTER_STOCK)
+			pcp_stock->drain_idx = 0;
+		page_counter_drain_stock(pcp_stock, i);
+	}
+	css_get(counter->stock_css);
+	WRITE_ONCE(pcp_stock->cached[i], counter);
+	WRITE_ONCE(pcp_stock->nr_pages[i], nr_pages);
+	local_unlock(&stock->lock);
+}
+
 /**
  * page_counter_uncharge - hierarchically uncharge pages
  * @counter: counter
-- 
2.53.0-Meta

