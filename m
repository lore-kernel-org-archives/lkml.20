Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793835032;
	b=D6UKGI2YrEmtkTu0qVvhHj+i4GKCBkakgiJ/Gal24Ifi2hEOss6r4vvxwBktgSRBEbiG
	 mF2LEme+g+dtpgOR0dzoktomUd92eMyblkzL9rvW+aHPge+PfA21Y7NGeQ8vd5iNgaiKT
	 llFQQZDY8CphygYwTtSxLzTKxgM+PA4+dC3qKtRtE+vqQ/NDNiTJxmjRw3WnKLKdtlJcR
	 t4Zz+QcyqJr+fE2c/8MpZyIy14br+O9RxxzYYa3I9ytZ6NROzDgF1LxZewrdmKOZn4u0U
	 nVHcdndW/BCNlyG7jTVfY6C9bUz8caYNv8D32XTe3jozD5pK7prtCVlrSNfWt7+Qyjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793835032;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=S8O6n4wkP+hVSces6SjRurqbVke5VUdfxmmLz5pPN8Y=;
	b=CstACEL9poU6TPZSZrr7iTgghOQWj85TicFXHqPeuIwMIjiZDnLKg1YXRY2+nj3odsWZ
	 WmZq1Vo03nau3WLBs0Lp1dlWR1zaawxLJEToRQFyoYvGOIYqWXTYzuUki3nplwfbW7UYE
	 Yg154oWfepJNjHN4PnTWJ2sNUcZbOoy9UbQc2XbejIcOUiuxmoaymc3F+LC0DXguXHSUf
	 dgKCXVs2dfSJ/KKD6mq85JniVd4r3e5C0//hFEYkHyk80ca2FBTmhsLwokbDNDCK+OHcy
	 ZZ5ZAiBrMosEntR/RmKY33fQ/m8RUC9CNwmFd/v3fqz2ERwIQY6XyzQ1SX+n/DDnZow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EvVroBtT;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBFF606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:30:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFBFF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EvVroBtT
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b0cf2c0785so11709367b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793835031; x=1794439831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S8O6n4wkP+hVSces6SjRurqbVke5VUdfxmmLz5pPN8Y=;
        b=EvVroBtTUWmi89p91aNwajO2iOtdAzpDF2ekbCdoJVtZHDfPYgSoI2hlQ2izInR8og
         +7E2vLPSzN/N/32IE22A1H23aBNd+93++Kok+aXo3VUg3Lz5eUfXZTxJpBDGjdqI9Yvf
         FrrH4f3hzLOemmSb9dvqNy8/iH9ddiLuB/w6ZM4r1Y5/DCFnyTAuwBu9RcGVr4u4+FS1
         ahJeZeUlP1H5xeeyHe1bm2mDb3bfrEUyb6ShOeA0DPtQILnvCpOchxvwLmEMVVI5u+b/
         XhtS30DjvF0+LfgL4VfA1hgTxvlZLCecWvF+uHypcbpm80tgKVOuk5zG/zS7PfdspKQm
         jUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793835031; x=1794439831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S8O6n4wkP+hVSces6SjRurqbVke5VUdfxmmLz5pPN8Y=;
        b=P/UySmZoQspyMD797EDpnBffI/Y9D3vm9sV8morxXREbsy5EZ+90LkrKhCVquAiLFj
         oLkGb12Cbm3z7Ri/nx51MmIr0uP48/75+izKu7PP9txJJRcmDc/bNBMLyNUkFiqeL+HN
         zj7FbdUzeoVtSxdYagZUjRAFM9CMlEKgx5AWTl/QtPGnangrmdAZulxvIOc5Kswh2pQy
         pIn1BWeMzx4x7XBmhSeh6X7tLigNHXm1C7oA5eZFfAQUbxcFbU2QJMEA2dNA1tCfZ8kz
         HblXbIS2uUgONCFtiVPPWWOTh4F8K3Wgs12Acx+F6KTHLkM7eT7Ofovazpz5xVpWh43u
         nwdA==
X-Forwarded-Encrypted: i=1; AKwUvBxONYYqPMiim9tCZPEyAxc9eQG3j2VVoeRv50/nv7mMzPGXnFxNBwRnrfrIPMR3KkU6xyHnzwmCeunz/Tw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YNsWfp4MW7QmQyXlAqFoKzHCbyb95VxP8zB0avmEjXms6fchQ
	i2PJbHS3ZWEhyHz8FxD12qPeOwnjY+BwUdnm7EanGouwvKkb8TUS0LHW
X-Gm-Gg: AYBFou2uAPYvElDK4gERadPgpCNgEyRRTlF7PFSFD8eIMYhVaFv+YiCOeWX/eqvJHlT
	iE13lY2OzTYHUvRbVdF9cHATNbUA033fqxWZ5iideZuDq1/vM8vxsTnnS1nkRZAS4F66Ik89FT1
	OyxsQtFVh8mvq7Jz/7Wuf2/tB7JAWtS/LX9mWgHYdLaflni4yd9yrFz8i2YGDBD5Fsb7Rlj0CPm
	1PzRkP9fmG7nBL/carkBYwnpkZA2cdiN/wxi1Uf4oknxKNaE/QDJ5aaNiuySuPyPRvTN4+fKCTu
	H9jZoMaqrOI/SwTFlfYuSxNde6GvtbyKeiP8ObUResiiSXGWSp+hLm1yWouS0BtrsUR2Tff1s4u
	f+yEDQd+A5VtBK4LksnGJf6SgEyxZAl/oa1/ReF9Qap6mTKC0oIElz8oCVE3irSwc4gLDlL9EhY
	L0pbUl7ug/dZvG0wZIoOepkHIt/r7IwHH9DvqKt0cwPO6rDE6jHjdhkjDYNgfOMG2BWBjFdkRnM
	kpC/dSnh8If0gos5syQgNokJZZn3haUbgwMiEK3dAkkqp4Xr8ix7p8J2Wo20ArJhXnjJTrYpW2l
	cbZthG6FJhcR3mfJIzejd2ZhaABJAZKhDqzmQPhA0snk/+gz4cGMpb43nInt
X-Received: by 2002:a05:690c:e210:10b0:8b0:a30a:7f05 with SMTP id 00721157ae682-8b2b6774969mr71427577b3.84.1793835030478;
        Wed, 04 Nov 2026 15:30:30 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:73::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b30997aa84sm29045837b3.29.2026.11.04.15.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 15:30:29 -0800 (PST)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Michal Hocko <mhocko@kernel.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
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
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v8 0/7] mm/page_counter: move stock from mem_cgroup to page_counter
Date: Wed,  4 Nov 2026 15:30:21 -0800
Message-ID: <20261104233029.3282438-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
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

v7 --> v8
=========
- Rebase onto mm-new as of 11/03/2026. This picks up two memcg series
  that required some rework:
  - Kuniyuki Iwashima's memcg stock cleanups were worked into the
    series, so the changes now live in page_counter code instead.
  - Shakeel Butt's memory.high rework. Commit 4/7 folds in his
    PF_MEMALLOC change into the page_counter checks. This change was
    suggested by Shakeel.
- Commit 7/7 is new. It brings back an optimization from an earlier
  version of the series to let stock charge only accumulate on leaf
  cgroups.
  - To accommodate this change, sprinkle in READ_ONCE() for
    counter->stock reads since the pointer can change at runtime now.
- Cover letter rework as suggested by Michal Hocko.

INTRODUCTION
============
Memcg keeps a per-CPU stock of precharged pages so that small and
frequent allocations do not walk the page_counter hierarchy every time.
Today, the stock implementation lives in memcontrol code, even though
the operation it caches is a page_counter charge. This makes it
difficult to add new page_counters to a memcg and preserve the fast path
behavior.

This series moves the stock into the page_counter layer.
page_counter_try_charge() consumes the stock, charges a batch to the
hierarchy on a miss, and refills the stock with the surplus. Memcg no
longer manages the stock in try_charge_memcg.

So the stock keeps the existing layout, which is still a per-CPU bank
of 7 slots, each holding a count of precharged pages that it hands out.
It maintains exclusion using local locks on each CPU, and for remote
drains we schedule on the memcg workqueue.

This change gives us the following benefits:
- Separate charge caching (page_counter) from charge policy (memcg).
- Makes it simple to keep stock out of interior cgroups on cgroup v2.
- Prepares for future work for stock improvement, which can now be
  isolated from memcg changes.

With this change, make sure to preserve:
- All locking behavior is unchanged from before.
- Non-leaf cgroups do not hold stock. Specifically, their stock is
  drained when they become a parent, and remaining stock (isolated CPUs,
  concurrent refills, etc.) gets drained lazily on future stock misses.
- Exact charging for non-spinning callers.
- Stocks only exist for the memory and memsw page_counters as before.
  Other page_counters (swap, v1 kmem, v1 tcpmem, hugetlb_cgroup, dmem)
  don't stock as before.

EFFECT ON CGROUP V2 USERS
=========================
Currently when a cgroup becomes a parent, it doesn't drain the stock.
Rather, it just prevents new charges from accumulating by nature of
parent cgroups not having processes. Here, we can do a little better.
When a cgroup becomes a parent, schedule drains right away, in addition
to making sure parents don't accumulate new charges.

Everything else is preserved. We preserve all draining, refilling,
and (un)charging behavior, including the uncharge path's refills
and direct uncharges.

EFFECT ON CGROUP V1 USERS
=========================
The memory and memsw counters now have separate stocks, which can hit,
evict, and drain independently. Their raw values can therefore drift
apart by the stocked amounts, even though every charge is applied to
both.

To preserve the user-visible property that
memory.usage_in_bytes <= memory.memsw.usage_in_bytes, the memory
value reports the smaller of the two values. Both raw values are already
upper bounds on real usage, so this stays within the fuzz that
usage_in_bytes always had (and this is also already documented, see
section 5.5 usage_in_bytes in Documentation/admin-guide/cgroup-v1/
memory.rst).

TESTING
=======
This series should not have big changes to performance, so I ran some
benchmarks to verify that. I did testing on a 16-CPU, 32G machine VM.
I ran repeated anonymous memory faults and MADV_DONTNEED to measure the
CPU time spent per page. So + number is worse. I ran each experiment
5 times, with 4 workers.

+-----------+-----------+--------------+-------+
|           | base (ns) | patched (ns) | delta |
+-----------+-----------+--------------+-------+
| cgroup v1 |     890.6 |        901.8 | +1.2% |
| cgroup v2 |     893.5 |        902.2 | +1.0% |
+-----------+-----------+--------------+-------+

Based on mm-new as of 11/03/26:
74d73ffcffe03 "riscv: mm: fix concurrency in mark_new_valid_map()"

Joshua Hahn (7):
  mm/memcontrol: flatten try_charge_memcg control flow
  mm/page_counter: introduce per-CPU stock
  mm/page_counter: make page_counter_try_charge() stock-aware
  mm/memcontrol: check PF_MEMALLOC after trying the limits
  mm/memcontrol: move memory stock to page counters
  mm/memcontrol: add stock to the memsw page counter
  mm/memcontrol: restrict memory stock to leaf cgroups on v2

 include/linux/page_counter.h |  35 ++-
 kernel/cgroup/dmem.c         |   2 +-
 mm/hugetlb_cgroup.c          |   2 +-
 mm/memcontrol-v1.c           |  17 +-
 mm/memcontrol.c              | 430 +++++++++++++----------------------
 mm/page_counter.c            | 233 ++++++++++++++++++-
 6 files changed, 430 insertions(+), 289 deletions(-)

-- 
2.53.0-Meta

