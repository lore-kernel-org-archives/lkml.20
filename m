Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917251;
	b=qGnpmGCIG0PIY45h3gKhAGiq9l6IRmEk8FgpVJUiVbgE9aLxE+UYa4ovtFed2t9uwmyQ
	 QenSNEtZ8XDPENOdswfNRpPFBo1YRbGerThymqTvu5j16W+AfjhGA31AYaXknLUrW3DbX
	 om6d1SmywURc/WVFbpbxYRknFSluhzIkR5P2YJ4NtXiIR0xb15mnpOngXgt7w/yd1oOsX
	 XAxUnd8WkQ+fLiqsMGNHkKYdhcF3TA3D9KHI/S/ZlIDqPSuObwOkIcy7iw1QBi+09aTKn
	 gjrgkJuNKCJt//zbEBvbiFxoijKPP3xlK7UdLHmyeNfX8rm/y4WHGApCwyeysRmIivA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HdCytpgBEMMjWWjAaswQ3teC54EqiXNp/aCnfx0q/Uk=;
	b=OCs8l5cGCkHaOPi3eLe/93AUjszKOqd8M4pTWmPwzYoXm6QGImLlwpyMYshBeFpfjXbU
	 hfo7ZR/XtCjtaPddEzsQRHCwydnsFYpKhYRV38mScKf8tbEhv704rd0N6zukoqH7FeL1G
	 FP+IPK9R73X1yoKkf+QskUFccYfl9RIn3h0P6cKrYezmEIPIOQj5kc+kGrRlunauvzvb2
	 6tpcwDbcC/RJCA25nCG/giHdcVRpLNWkBZz4hPdlvAGpuLRLWOQ6yXzaxTZz7TPsyX4SZ
	 /Bn1DXIzxRbJNZsBrQxFywDgqNO582q5h0PoewArIMd5pvInS6GV1E/8ah3w4bX15Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=hJi2PmuQ;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F7D606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:07:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57F7D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=hJi2PmuQ
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so5501038c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794917250; x=1795522050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HdCytpgBEMMjWWjAaswQ3teC54EqiXNp/aCnfx0q/Uk=;
        b=hJi2PmuQQWc1txnHWZ2ca/OQT5AlTNv20+9VAkjqNfHupRnD0OIxWuhoaVXIPeGtmr
         4oAK4mluhqafUZuPx7KrPYDvPh9mSpdo63g1QmgjEEdx6jQUWO9CscBFxGg+1KvGVxTQ
         qvbHtKNYyuF4xPc8tKWuEypXGjIS8+v/ypRsHgSGKjj+n+ai2hZJQ0KE8KbyRduR3IVJ
         ok1DhgHrs9QUUChJkJ95y8bKZQtYt/cGnAPx+1gmr+XB+WEPsesE4+HckaRVDfjgWIrV
         9FW70bdITPi1+N1MS7gGoAzXAHp8Gctc54/XkN8MDWdy30SZ566lMexIK3iQb9lpoStZ
         L8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917250; x=1795522050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HdCytpgBEMMjWWjAaswQ3teC54EqiXNp/aCnfx0q/Uk=;
        b=JYSj3M+RYyPFNRz7Ic3fNS8twb4P5+n1ZeNQYp43ncX9Y5TOdAYm+u3qHCXlk7G0Zv
         5yQd/3mDQ9Dr6AQdA59xxrrbBHEoUsY9QI5SdO25tC3/+uF7wsFFoU2JPEn8iB7V8Q2L
         xet/n4DMdJ/cOti2gBR+C0EzGAwZzxkWSYXshxLHH65iAJQRZVS76PoVN6i96BYR+8cP
         WDeDiCbeTyL6zlyXfyZXzCfIf/wC+rnFoHQh/k8sPpcPxB9QvSZ2PI5OIIQ9ELfBDNvH
         9RhIrbaECzV2tBQSV8ABYjzRzx463VrP7naBCG3yW2UhYwE6RHUXVoCL8sEzfWRgqZTz
         tP8Q==
X-Forwarded-Encrypted: i=1; AL+hErHVYE+MnCNL7mqRCn2Pb5YelgKS50B+/vncGa6IH1YgeHPIwjA4zCBI4J9eUrvE2q5oLio4FiNrXef7ivU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CVZUTLn3IKzLY9IBvYx0BFzB5te5daHuDE4JfHITGDxxMxSWu
	9CItPi29hgYCT9A9jHeWyjqzkqlWD4ckRPJr169NdXxsvbIFYaR/TWEfgCN/HW4aHVQ=
X-Gm-Gg: AYBFou0aa8Z9vjvXYQLAuHEOE7MNUMuKjN3p3CHL19uxF2vWHfvOKePIXCMnUWSc/HT
	IgfXq3cGUmWpKsIQaUzcoPedEPvFsMteSuvGthdvpO9yqo5U+7ly3h+3ZLtnRW7YMkl1Eh3q1Lx
	ii2zKRojHqcxJn2bDGW5OxsfcSsgoYpFrumdhvOAbW7apbJbboWqCxGuKeRW/XSEFWNA0TnyHtY
	waYuAhnhkvKaZznzqoJ8xpK48o1jNKeY2Suw6IlSBoDH0fO2EeqVMwkIlAf6Bnwehf1MnD7Ikgz
	sS9aelAwKFyPcCgvK357ZQi4O9VPYb7mg/XNIR09NuPgoRTJLYqYTQo5So0zczvoE6HxSDwq4+J
	I8Hlo/0fgWZ94ST1jyGcc2HTqWjE+fTHdSVdZwmQu58Cnbpl2IJuWm7EHTaG/Jdb3pGRUwL+ouj
	vz4bbMKR1wjvq6ZshI+MYL1pAJu6Qz5oTh0TZndpWqKhTMJGXgPil9Jo+NG7Wru9rL+Q9RM3JaC
	cBlAMqNmI60tKFHJIP2/sX1lH3K3wslWJH4DBQ1HXAQ6RS3uFC+dc2IYu17a0VLxr3/nWlDd3zQ
	IkGml8PuR+OplZJclErMedXLLohAKSSfyVqbXJKrLiRbD58XEmVqTnQaYfrdfDbu6A==
X-Received: by 2002:a05:701a:cc97:20b0:1b5:2dce:1b88 with SMTP id a92af1059eb24-1b52dce1e79mr5203228c88.45.1794917250013;
        Tue, 17 Nov 2026 04:07:30 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm47347116c88.5.2026.11.17.04.07.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 04:07:29 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Chris Down <chris@chrisdown.name>,
	David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Muchun Song <muchun.song@linux.dev>,
	Joerg Roedel <joerg.roedel@amd.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Pranjal Shrivastava <praan@google.com>,
	Ketan <ketan.kishore@oss.qualcomm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sashiko <sashiko-bot@kernel.org>,
	kasan-dev@googlegroups.com,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 4/7] mm/page_ext: use common allocation and initialization entry points
Date: Tue, 17 Nov 2026 20:06:24 +0800
Message-ID: <20261117120627.50601-5-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261117120627.50601-1-songmuchun@bytedance.com>
References: <20261117120627.50601-1-songmuchun@bytedance.com>
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

FLATMEM uses separate page_ext_init_flatmem() and
page_ext_init_flatmem_late() entry points, while SPARSEMEM performs its
work through page_ext_init().  This exposes the memory model in the
generic boot sequence and obscures the allocation and client
initialization phases.

Rename the early entry point to page_ext_alloc() and use
page_ext_init() for client callbacks in both memory models.  SPARSEMEM
keeps its existing late allocation behavior for now; its
page_ext_alloc() remains an empty configuration stub.

This also moves FLATMEM client callbacks from immediately after
kmem_cache_init() to after vmalloc_init().  The callbacks still run
after the buddy and slab allocators are available, as required by
page_owner.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v2:
- Split the common allocation and initialization entry points into a
  preparatory patch
- Document the later FLATMEM client callback timing (noted by Chris
  Down)
---
 include/linux/page_ext.h | 20 +++++---------------
 mm/mm_init.c             |  7 +------
 mm/page_ext.c            |  5 ++---
 3 files changed, 8 insertions(+), 24 deletions(-)

diff --git a/include/linux/page_ext.h b/include/linux/page_ext.h
index 79c53ec45dfa..911a84bbb3db 100644
--- a/include/linux/page_ext.h
+++ b/include/linux/page_ext.h
@@ -62,13 +62,10 @@ static inline bool early_page_ext_enabled(void)
 }
 
 #ifdef CONFIG_SPARSEMEM
-static inline void page_ext_init_flatmem(void)
-{
-}
-extern void page_ext_init(void);
-static inline void page_ext_init_flatmem_late(void)
+static inline void page_ext_alloc(void)
 {
 }
+void page_ext_init(void);
 
 static inline bool page_ext_iter_next_fast_possible(unsigned long next_pfn)
 {
@@ -79,11 +76,8 @@ static inline bool page_ext_iter_next_fast_possible(unsigned long next_pfn)
 	return next_pfn % PAGES_PER_SECTION;
 }
 #else
-extern void page_ext_init_flatmem(void);
-extern void page_ext_init_flatmem_late(void);
-static inline void page_ext_init(void)
-{
-}
+void page_ext_alloc(void);
+void page_ext_init(void);
 
 static inline bool page_ext_iter_next_fast_possible(unsigned long next_pfn)
 {
@@ -205,11 +199,7 @@ static inline void page_ext_init(void)
 {
 }
 
-static inline void page_ext_init_flatmem_late(void)
-{
-}
-
-static inline void page_ext_init_flatmem(void)
+static inline void page_ext_alloc(void)
 {
 }
 
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 2367af05570b..7344e7cb8196 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -2711,7 +2711,7 @@ void __init mm_core_init(void)
 	 * page_ext requires contiguous pages,
 	 * bigger than MAX_PAGE_ORDER unless SPARSEMEM.
 	 */
-	page_ext_init_flatmem();
+	page_ext_alloc();
 	mem_debugging_and_hardening_init();
 	kfence_alloc_pool_and_metadata();
 	report_meminit();
@@ -2727,11 +2727,6 @@ void __init mm_core_init(void)
 	memblock_free_all();
 	mem_init();
 	kmem_cache_init();
-	/*
-	 * page_owner must be initialized after buddy is ready, and also after
-	 * slab is ready so that stack_depot_init() works properly
-	 */
-	page_ext_init_flatmem_late();
 	kmemleak_init();
 	ptlock_cache_init();
 	pgtable_cache_init();
diff --git a/mm/page_ext.c b/mm/page_ext.c
index 3b581242fd52..b41d4a957bc6 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -180,7 +180,7 @@ static inline struct page_ext *get_entry(void *base, unsigned long index)
 }
 
 #ifndef CONFIG_SPARSEMEM
-void __init page_ext_init_flatmem_late(void)
+void __init page_ext_init(void)
 {
 	invoke_init_callbacks();
 }
@@ -238,9 +238,8 @@ static int __init alloc_node_page_ext(int nid)
 	return 0;
 }
 
-void __init page_ext_init_flatmem(void)
+void __init page_ext_alloc(void)
 {
-
 	int nid, fail;
 
 	if (!invoke_need_callbacks())
-- 
2.54.0

