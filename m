Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686893B83EF
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 05:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790488665; cv=none; b=YjyYfbMZWurgCX9By3r6Ppyr1kqEBB6sDvjY2BSbl/TRaqc7qDemWhR0792hCenjYTLm2aa4DdNcDLz9lHbZXCzNlE4fT9LmzH/lQ/5Y3+01lximdcAqga2t3vwyZJjLL0+ukZwJr61+NX7MaqoswD2iVh7yBBOjzLkkqY+cUPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790488665; c=relaxed/simple;
	bh=H74BpVVyrWDgbNeiX1qeWrOMjbADbLeaQyq/FE9Q09o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hTvocboQ+lZAWXsvPR6biD/v1mi9sN3MSEEUzQOtRwSrOL1MJMTAIahfynMkai1qvwLp3D7BvT1ooxqjwDXnFfS+L5aM8EXKcIG9V0ppk4HFOdpCuw00QhyAV6mTtqhAdugsOCmw+2q2ZomwjSTJA56FHcjEB2SKr/WlFKqDWvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr; spf=pass smtp.mailfrom=snu.ac.kr; dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b=v3kXTtel; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b="v3kXTtel"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc78dd54610so614076a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 22:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snu.ac.kr; s=google; t=1790488661; x=1791093461; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LPiWPwYgRW0JwJmKH5Jn/l1M/n/N7J5yYTqThLX/YnA=;
        b=v3kXTtelxTXj5E3YRHMUSDchil8Qk7L8kXUl45RW2wUTvOzN7ef1P8/a2odjcjcjV7
         DpWO93i089hRkl/EkqB9u8ArMb092RD2lH6KYbIwj4ZvIH7v5Irw0HuhWGSGUhUL7Ubt
         kX3v3G9wZEdM2KtIh2BLUCov3hpvcz9NoKggo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790488661; x=1791093461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LPiWPwYgRW0JwJmKH5Jn/l1M/n/N7J5yYTqThLX/YnA=;
        b=CXkB4DPi+/DJ/N1ym5K5aXG33twlGa7QXu6NXH/aY7/oOwk6FK+EYXBNgCKolEk0ag
         34FPq3qfgeLn25PeEP4WfHUlwHvwHSdeGxiJy9UnIqrkvLt3EAe1oT7nfop/5nGVBNaO
         pI9ukb8RPwWNjaid2+lboYnWIIscYGMBEhCmFUlQllAP9EaDzmewvyj9U8my6nzBTVuK
         pWpsY60DKsHsSd/SNerdpcPXkC1tzPTlWQprA/YDr8m3Jv+wpcfuKDsjSZSQ7KAz8LNz
         qhljuWQIxmx1zQ74nQIvjMiCv93m+eTRT6BzXP4M/qNQmtgJAnQEjkI+yOaXMyM6JzaK
         fESA==
X-Forwarded-Encrypted: i=1; AKwUvBy7+/D3evTvwAt5Isal/F0JvaV91Sf4nQALr8jpVwLGxghPrJSU2PdWfqjC/vF6GP742Ta74RL+I0A5mq4=@vger.kernel.org
X-Gm-Message-State: AFuF++lOb+Rd4ipIQcr/NED7v6acsWFKVUUHz2hm0j6OpB4S5SqIL/uW
	bbAjbBL1AmRee+KxzDzeOEC43kPl6qA2a8OefG+5qQP2c+CRBxoOSdz1iqhFL/1nVN0=
X-Gm-Gg: AYBFou1zFKsHWwQtqkJOoZTjdH+3TujpxFagEulsZrRWJdgBzYstpTETva53UyR7IMY
	Ie9sikQ3S/XH2CwdbhjyvnxMYmsylvq2jjZyF9FYcHcTtZIqhzdd4Cvnlcty/euxfViXH7+mbjU
	l0YdF7JQtAlXZ73edlsurCkWVfWxSmPNoxlQ+bc4G6BrqzEC41jIarBSchqdGvB2FmeuZCrNSTw
	8JEpE+Mg53OtA68VDXZjhbLaZTgUe8+gkkLmJkHmpDxl9yZgV8EPhfTlfAyI3+kB8Ni/3VpuvBb
	bKnVHJ0brKY1P32DWtdR6eMD5OsRb7Ycwo8DhhB9N8EkW4ZdgNCDPgz+Wst+i+y6wioWhPjSKo2
	befyJC7limbtRzFQxrzI7kxrFDB2NWGpncvjyfwtvQPelV/3RXQlWIsLKay4/8k0JEOeOP9PxnM
	5TdryL58ACMp9eCgcWqAAfsYgPH8OEVHPe9J0oRoAIIb7ndJYuYHbyZ/u8a2Nf7/Hn
X-Received: by 2002:a05:6a00:114c:b0:87a:346f:d060 with SMTP id d2e1a72fcca58-87e9ca1c0a8mr8014914b3a.55.1790488660751;
        Sat, 26 Sep 2026 22:57:40 -0700 (PDT)
Received: from [172.19.0.2] ([49.142.45.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8808182fd7fsm2328266b3a.39.2026.09.26.22.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 22:57:39 -0700 (PDT)
From: Seongjun Hong <hsj0512@snu.ac.kr>
Date: Sun, 27 Sep 2026 05:57:28 +0000
Subject: [PATCH 2/2] tools/mm/slabinfo: report percpu sheaves and barn
 statistics
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-tools-mm-update-slabinfo-v1-2-a4ea0d4dc136@snu.ac.kr>
References: <20260927-tools-mm-update-slabinfo-v1-0-a4ea0d4dc136@snu.ac.kr>
In-Reply-To: <20260927-tools-mm-update-slabinfo-v1-0-a4ea0d4dc136@snu.ac.kr>
To: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>, 
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Seongjun Hong <hsj0512@snu.ac.kr>
X-Mailer: b4 0.13.0

Since commit 2d517aa09bbc ("slab: add opt-in caching layer of percpu
sheaves") sysfs provides the statistics of sheaf and barn, but slabinfo
did not utilize this information. Display perf, API, and sheaf allocation
counters on slabinfo report(-r).

Example slabinfo report output:

	$ slabinfo -r kmalloc-1k

	Sheaf capacity             12 objects

	Sheaf Perf Counter    Success     Fail
	--------------------------------------------------
	Barn get                    4       43
	Barn put                    4        0
	RCU sheaf free             34        0

	Sheaf API Counter        Fast     Slow
	--------------------------------------------------
	Prefill                     0        0
	Return                      0        0

	Sheaf Objects/Allocations
	--------------------------------------------------
	Objects flushed to slabs             0
	Objects refilled into sheaves      516
	Sheaves allocated                    7
	Sheaves freed                        0
	Oversize sheaves for prefill         0

Signed-off-by: Seongjun Hong <hsj0512@snu.ac.kr>
---
 tools/mm/slabinfo.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/tools/mm/slabinfo.c b/tools/mm/slabinfo.c
index 84359d628f2e..dbc72582ffab 100644
--- a/tools/mm/slabinfo.c
+++ b/tools/mm/slabinfo.c
@@ -33,6 +33,7 @@ struct slabinfo {
 
 	unsigned int slab_size, object_size;
 	unsigned int objs_per_slab, order;
+	unsigned int sheaf_capacity;
 	unsigned long objects_partial, partial;
 	int aliases;
 	unsigned int align;
@@ -49,12 +50,19 @@ struct slabinfo {
 
 	/* CONFIG_SLUB_STATS */
 	unsigned long alloc_fastpath, alloc_slowpath;
+	unsigned long free_rcu_sheaf, free_rcu_sheaf_fail;
 	unsigned long free_fastpath, free_slowpath;
 	unsigned long free_add_partial, free_remove_partial;
 	unsigned long alloc_slab, alloc_node_mismatch, free_slab;
 	unsigned long order_fallback;
 	unsigned long cmpxchg_double_fail;
 
+	unsigned long sheaf_flush, sheaf_refill, sheaf_alloc, sheaf_free;
+	unsigned long barn_get, barn_get_fail, barn_put, barn_put_fail;
+	unsigned long sheaf_prefill_fast, sheaf_prefill_slow,
+		sheaf_prefill_oversize;
+	unsigned long sheaf_return_fast, sheaf_return_slow;
+
 	/*
 	 * Deprecated files:
 	 * No STAT_ATTR()/SLAB_ATTR() for these exists in mm/slub.c's
@@ -574,6 +582,39 @@ static void slab_stats(struct slabinfo *s)
 	}
 }
 
+static void sheaf_stats(struct slabinfo *s)
+{
+	if (!s->sheaf_capacity)
+		return;
+
+	printf("\nSheaf capacity       %8u objects\n", s->sheaf_capacity);
+
+	printf("\nSheaf Perf Counter    Success     Fail\n");
+	printf("--------------------------------------------------\n");
+	printf("Barn get             %8lu %8lu\n",
+		s->barn_get, s->barn_get_fail);
+	printf("Barn put             %8lu %8lu\n",
+		s->barn_put, s->barn_put_fail);
+	printf("RCU sheaf free       %8lu %8lu\n",
+		s->free_rcu_sheaf, s->free_rcu_sheaf_fail);
+
+	printf("\nSheaf API Counter        Fast     Slow\n");
+	printf("--------------------------------------------------\n");
+	printf("Prefill              %8lu %8lu\n",
+		s->sheaf_prefill_fast, s->sheaf_prefill_slow);
+	printf("Return               %8lu %8lu\n",
+		s->sheaf_return_fast, s->sheaf_return_slow);
+
+	printf("\nSheaf Objects/Allocations\n");
+	printf("--------------------------------------------------\n");
+	printf("Objects flushed to slabs      %8lu\n", s->sheaf_flush);
+	printf("Objects refilled into sheaves %8lu\n", s->sheaf_refill);
+	printf("Sheaves allocated             %8lu\n", s->sheaf_alloc);
+	printf("Sheaves freed                 %8lu\n", s->sheaf_free);
+	printf("Oversize sheaves for prefill  %8lu\n",
+		s->sheaf_prefill_oversize);
+}
+
 static void report(struct slabinfo *s)
 {
 	if (strcmp(s->name, "*") == 0)
@@ -613,6 +654,7 @@ static void report(struct slabinfo *s)
 	show_tracking(s);
 	slab_numa(s, 1);
 	slab_stats(s);
+	sheaf_stats(s);
 }
 
 static void slabcache(struct slabinfo *s)
@@ -1280,6 +1322,22 @@ static void fill_slabinfo(struct slabinfo *slab, const char *name)
 	slab->cpu_partial_free = get_obj("cpu_partial_free");
 	slab->alloc_node_mismatch = get_obj("alloc_node_mismatch");
 	slab->deactivate_bypass = get_obj("deactivate_bypass");
+	slab->sheaf_capacity = get_obj("sheaf_capacity");
+	slab->free_rcu_sheaf = get_obj("free_rcu_sheaf");
+	slab->free_rcu_sheaf_fail = get_obj("free_rcu_sheaf_fail");
+	slab->sheaf_flush = get_obj("sheaf_flush");
+	slab->sheaf_refill = get_obj("sheaf_refill");
+	slab->sheaf_alloc = get_obj("sheaf_alloc");
+	slab->sheaf_free = get_obj("sheaf_free");
+	slab->barn_get = get_obj("barn_get");
+	slab->barn_get_fail = get_obj("barn_get_fail");
+	slab->barn_put = get_obj("barn_put");
+	slab->barn_put_fail = get_obj("barn_put_fail");
+	slab->sheaf_prefill_fast = get_obj("sheaf_prefill_fast");
+	slab->sheaf_prefill_slow = get_obj("sheaf_prefill_slow");
+	slab->sheaf_prefill_oversize = get_obj("sheaf_prefill_oversize");
+	slab->sheaf_return_fast = get_obj("sheaf_return_fast");
+	slab->sheaf_return_slow = get_obj("sheaf_return_slow");
 }
 
 static void read_slab_dir(void)

-- 
2.43.0

