Received: from mail-oo2-f36.google.com (mail-oo2-f36.google.com [74.125.231.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487C44ED1AA
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790623436; cv=none; b=BnmRf0q783hXTtnaNhOAr8KRPfGXPtmpEZdCnC5taQPwZsqTcSITw1fU2yZUgVJsxJJvU8DbqmrBp1vFmph5M9L7Mugx8rhggsZGtYyDhuN66yQ784WiJHJLUHO7JZD5drSh3CRS8ImGdeuTqm9HDbipZjzAMuqnRJYXlquFrQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790623436; c=relaxed/simple;
	bh=NFH0poV7hjVYWtsnDInetTBExVbmvR8JOSLPTigC26A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=imkrodUCapjMEZ9GkJp2nthz2KVo/y42pH4H+abOGWtfgGYzQFlwnXzS9qy/2OVdU++SMuaWOlZChbB5lM2ens5nHbvYvTpbJJmPs9mOaPGJVt006mkpeXhJE3Bril7oREBf7kybv3cqollFGNNVcetylJNAf2ssj+5FIh5eFHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DOLZCVBP; arc=none smtp.client-ip=74.125.231.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DOLZCVBP"
Received: by mail-oo2-f36.google.com with SMTP id 006d021491bc7-6d769a6fbe4so173044eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790623433; x=1791228233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I36Y3EED4OdoOnkWgrbUuXn4cMyXzZHgZseFGBvv25g=;
        b=DOLZCVBPVdNd+Lz2vgP+eegfeoI7mvx6h2BWFrVeVAVsd1KmedruVU03GzyYyD9P9Y
         s5QZMgTtGADGuB4bigw8kKfIqoPbDtcwXxjAmC7PRaS+lXSLWSqEcYRmy5oDCa4r6ea9
         xzIuk/ylIJNy3ubo13ukOUVJhbFPzkcsHs7vkIoQ68g/KgXgwq6YjNoy0OyZqSXqhgzc
         WdJtY+q+NVkUhTj5RD4FIVTzJbJAmXDMV4rmlCQpbWeACKOPvq1Q4krkW+zOHXb19Uhy
         7ln/s2ao/9+cQjRsalYZbZ8VLV1lrctYZQg4FsIEC94UJPbGxeGpzNvmBxWsJCoWnnlb
         fGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790623433; x=1791228233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I36Y3EED4OdoOnkWgrbUuXn4cMyXzZHgZseFGBvv25g=;
        b=sb7bpri/AlkKZxcFpdldbzj2WL8irfxhYzDO6+4bphWoBWHEKBlO6W+3EiNgeyA5s1
         Wk1nejKBsx9qKNFZ0RhQLtRwouYh4RcfZhHVWWhOU5YZUOKSQaTvGZHRsqqAhz1PUdvQ
         Tp9lIMnmQXLpuof93MtsVnKrm/JIibS3o42UXhSBPEOEyyIjn2HIuDO1QUGqN9GtRdw1
         q5VZFdF6zLlyNfllnCO3mc5JIAbSGCsPyaDCak5p6hm2WL9lBx/kkoOMtZ57fRQRo9lj
         PEYLyRGn1IV7Il1FgRodHxgtUXmZY31XRkTGjMIhsiF4eomvoBhvHNKYOEMZuFonv8T9
         J8XA==
X-Forwarded-Encrypted: i=1; AKwUvBwXpwK+Uxqv6j49yb91pXuTWlEBTec13L1R847u4buqnEELVt1iVqKuFxiMUYRG+e1V/Q2w0F3mxlHOPb0=@vger.kernel.org
X-Gm-Message-State: AFuF++l9R3tUPdwMXUzV8rLV2UDg67+PFc4tdBYk/ie58Mytt9zMXe5k
	XXFZY5Y2JecHBiqNH9QMvqYFd9DaSWr28snIfzdE+wJnmOwQfsft7657
X-Gm-Gg: AYBFou25Cnz3c9qirkHZ3FwsGrupprO+xRfVjpG/woY7p/VbQ8qwuAPLtNHvyUb9maY
	pIr+gS3sTqbzmkr/+QM3dGhvOfaxN2o+e747FmxDkrVCjih8J3vpVESHMhAUl9Z2sP830Woh14Y
	dtJPPAx2EjQ6djhQ7jyQt2B10PYlbQpliQdc5d+OxJwmxGFwKbe7BvCGd7xeeO75OaYzIcOA1Jk
	P4MgrjkjgLBXLpa9mCfIXInYz7uQ9WoXgHyT17mtjg/0RBmYLXb1efS9iIw0bTKoonnB1WRZUxf
	HmOO2Orog/wtpeTbpSuMFNgQ7IwfwQ43hE+/Y4/ixxmaYDUTTN4XBNwkSxqX2a6bT2n5xCTy6tw
	VFWzwOJUzipiiMoTel6FYO8iB0f/2fwM9wz47BGaUW6FaI3DN+xv+eQOqQswGL4WpMEyHXiKtB9
	vnrQm6l5dh0wjtw1Q0shKJ/Kwd5UreBIToggzAIEpIZvfBtxDrkqTEFby09ekT42qW0bNZaUjtO
	dIgb0KSjLz0VMH3ElPaJQorEX0npq4q5v2vNSc=
X-Received: by 2002:a05:6820:308c:b0:6d7:af74:7185 with SMTP id 006d021491bc7-6d7af747559mr4823330eaf.63.1790623432762;
        Mon, 28 Sep 2026 12:23:52 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:2::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-81d58f177e1sm2414743a34.24.2026.09.28.12.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:23:52 -0700 (PDT)
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
Subject: [PATCH v6 RESEND 2/5] mm/page_counter: introduce per-CPU stock
Date: Mon, 28 Sep 2026 12:23:45 -0700
Message-ID: <20260928192349.3432886-3-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260928192349.3432886-1-joshua.hahnjy@gmail.com>
References: <20260928192349.3432886-1-joshua.hahnjy@gmail.com>
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
index 2baf7a2b29b2e..cf627c5090093 100644
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
 
 static inline unsigned long page_counter_read(const struct page_counter *counter)
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
index 9167ffd1380c8..77624b00b5f94 100644
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

