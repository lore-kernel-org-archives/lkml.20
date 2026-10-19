Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792430637;
	b=rBlhZQINLcbXf3RbhpuRK//UIt/NgYVlcdVCDrNCMEGQqchszxDlNJu0hCptZK/7dQEt
	 YjVcQShDOJeXOir63mLBZMcRPboHbFyG8k4dG3iGRLp2oygeYS1SjuFbHHQ+dk9/YrhaX
	 4w7GzYSr4p+7IVURh/E7Zw/JflL8l+YXkhoTld6b1twX2StysGDdp8MdOsUX3gsXB9VFe
	 FLSWKjLx0Fk9GMcBxUOmnyW05QOOKniG8QlCDmtyp+ZKyctiwmyibR/3ajSCmTcbYMiAK
	 CpHjiSzJbohTNmLsN6R5knT/DnlYLEn8lkipBERj40OzgvzWbQX4JQsQ6DbbtTrzBzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792430637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Hr7mK0JGcf/BTvqE/DMHAbCOD5CXN72ZoZsomAZGCDQ=;
	b=SRHovnES2jOdG3AL20VBze0wIQLt33DKgtlJx5R/KNjkhUF6wNaxD2uViA8zJvICvpf3
	 UtcuMXCVsxOocF9PCAUdMAGHodvoVCeahHiCuRS5Ipm5LIUro8ctSjzDvs0SMTNgXIHEh
	 DmtHuKLU/lnbFOAMxyxBv3gCTPRHvX+kyJl+ewnS2hcuF2kkZj2qgBBgOF44ibR5rZ8rB
	 0ZtaD59xyjB60O7+RXakEpLrK3ZQrvzGzDDJWVa3ZanIzQodlW2Uxx1K4VcuKL7HRFVXK
	 Y6iHqu+fUSMKPUFW2/aX4exXW23TlM88J7GdBN2s7HuX8LNVtEFZAFs8XmRO7Smg2zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=CLxc+yKE;
	arc=none smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411F060A2613
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:23:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 411F060A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=CLxc+yKE
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93cb9e9405fso112788885a.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792430636; x=1793035436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hr7mK0JGcf/BTvqE/DMHAbCOD5CXN72ZoZsomAZGCDQ=;
        b=CLxc+yKE135AENhgrrycENbP8CNsEdDhb8Z5bxnyCuA02RPuWUWc7NM9oDB42k7lFO
         P+WDJfe8WXhZ8FPwxvcRBEH/37Km1pIddOHmyC4Zla/k+IgZuM8kFF4ZS4sGYZ7dhpi3
         vxgrqT9U2BohPuCeWkRlMouJgaJjP8OEq2SvQRwqziTJURnmL2X29MDltSow89gpsPyQ
         ygVvxjGdhkRndWfiMnvEYci4rrDP9t+a/3IHOj608e5d9u/jtTxTAb2dVyqV12/IAI7U
         iVgwLiCZHrvbwdqvsqUpYGkp92FDR8RVtB9vuAaSPXcF8e5oGSjo1LBFPtEqNaSZImeq
         HwUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792430636; x=1793035436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hr7mK0JGcf/BTvqE/DMHAbCOD5CXN72ZoZsomAZGCDQ=;
        b=IZw+EWMfYLIJrDfpSaGkkDfiJc2nfyCJw2A+y2+EVmhiqIRMh0IGIszC7H9Vy6ZE6p
         ZEzguaUcLdfUXvfmkmjWBCPWnzUwdvyuykvHT1iTp9OuVX+PCUN/QRew0TH84oqPxsds
         WnEjjNI+nHIrBdEEE3J7khOtwINlcyUNPVNSZzKtmkpZCxTxmOue5y61ub+IPmg7p/vp
         fhppKB0pWqSsh/hp5ZdabSwnrSg5weviZPMkSY1y1QnoffOzj4VVp9UzsifG+RP/7sjP
         pZaRCWU7CBULeJVrcBd1M3+k+NJ23BnuzUNfsgNwsy0B6m1N07tfuJgJeoQz9Ww9f9oQ
         ykpA==
X-Gm-Message-State: AFq9FYJR8TmEaQFz+v74QcShqNShwA/daKPxAh0dYc+twGAFBO/gVKzE
	BlCqMw3/rs1ynvc9x8AtYdRwUNy48z6d2ZJ3q79fiuvX0VqzNGFTQdfixq+SDycI4UO668hLs96
	1jUMmUp4=
X-Gm-Gg: AYBFou1sesdfUV86+IOdVIdY6ur+Sw1ZXnlz6q2EXpEwLLu40Vxxgpn1OwlH7kfLKMD
	nyAOzk//1jy5agaAjQzTQXGDKZZpPUlC1T2buAck6eMnSIJItSq7SUsPsx8LQiKlzSF5o455orK
	hVq5Sa7L3vY2ehGu4DWPJVq3iomDrO2MgEN62L+hOKc8WAB1409twIAlmrPe7ViJyFRthJrN8Xr
	iJm7OF0arsobp50joUlpwefBt+mO4ne3hy2NC89lFU59DdVBPWnMju6kr64+jCY05txBZF3Tw2l
	qc/A/fixxBz0TOdhx+wKHGUfICpIqrLCyyCjzLUaoS11lOVqjAbekjqDTSwOMaZHoJkcrTToSxG
	N3L7se3bYr4n7Yz0iRdT3Xue2xlzvPjXajn+aGpNWYDU/8vdLCIpsDIs+GA/Zu+Q+FU9QjcUu0T
	ZEp2H6iWdWh5dVe4EdWCqY8lKfAXbQL+tenHOXZwjxqfr0Nie0eFjIRdZyp/U/vpYnydZ9qiTV5
	qcpMDcHrHy2m/z8k58z+qG02VGBNLigd27rmtcXcTPv1AdJ0sw/mxdgen19
X-Received: by 2002:a05:620a:1d0d:b0:93f:3bb5:545c with SMTP id af79cd13be357-93f3bb558c1mr691193385a.18.1792430636279;
        Mon, 19 Oct 2026 10:23:56 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f4adb28c2sm14615385a.0.2026.10.19.10.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:23:55 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	mgorman@techsingularity.net,
	jiang.liu@huawei.com,
	Bessel.Wang@huawei.com,
	stable@vger.kernel.org
Subject: [PATCH v2 4/5] mm/page_alloc: keep a zone's pagesets when it goes empty
Date: Mon, 19 Oct 2026 13:23:44 -0400
Message-ID: <20261019172346.3344005-5-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019172346.3344005-1-gourry@gourry.net>
References: <20261019172346.3344005-1-gourry@gourry.net>
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

When offlining empties a zone, zone_pcp_reset() frees its pagesets while
the vmstat worker can still hold one across cond_resched():

  CPU 0                             CPU 1
  refresh_cpu_vm_stats()
    pcp = zone->per_cpu_pageset
    cond_resched()
                                    offline_pages()
                                      zone_pcp_reset()
                                        free_percpu(zone->per_cpu_pageset)
    decay_pcp_high(zone, this_cpu_ptr(pcp))

decay_pcp_high() then reads, and can write, memory the percpu allocator
may already have handed out again. With kprobes holding the worker
across the offline, it rewrote a new allocation at the freed address in
2 of 3 runs.

Keep the pagesets for the life of the zone, as pgdat->per_cpu_nodestats
already is, and only fold the stats in zone_pcp_reset().

Commit 340175b7d14d ("mm/hotplug: free zone->pageset when a zone becomes
empty") freed them because onlining the zone again allocated a new set
and leaked the old one. setup_zone_pageset() now reuses the existing
set, and zone_pcp_init() keeps it when the node is re-added, so nothing
is allocated twice. The pageset address stayed the same across repeated
offline/online cycles and across removing and re-adding the node.

The pagesets take 320 bytes per possible CPU: 30KiB per zone with 96
CPUs, 160KiB with 512 and 2.5MiB with 8192. A populated zone already
holds this memory, we just no longer give it back on offline.

Fixes: 340175b7d14d ("mm/hotplug: free zone->pageset when a zone becomes empty")
Cc: stable@vger.kernel.org
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/page_alloc.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 75a440ebcead6..417c427b196d9 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6356,6 +6356,12 @@ void __meminit setup_zone_pageset(struct zone *zone)
 {
 	int cpu;
 
+	/* Reuse the pagesets zone_pcp_reset() kept. */
+	if (zone->per_cpu_pageset != &boot_pageset) {
+		zone_set_pageset_high_and_batch(zone, 0);
+		return;
+	}
+
 	/* Size may be 0 on !SMP && !NUMA */
 	if (sizeof(struct per_cpu_zonestat) > 0)
 		zone->per_cpu_zonestats = alloc_percpu(struct per_cpu_zonestat);
@@ -6452,9 +6458,12 @@ __meminit void zone_pcp_init(struct zone *zone)
 	 * per cpu subsystem is not up at this point. The following code
 	 * relies on the ability of the linker to provide the
 	 * offset of a (static) per cpu variable into the per cpu area.
+	 * A re-added node keeps the pagesets zone_pcp_reset() kept.
 	 */
-	zone->per_cpu_pageset = &boot_pageset;
-	zone->per_cpu_zonestats = &boot_zonestats;
+	if (!zone->per_cpu_pageset || zone->per_cpu_pageset == &boot_pageset) {
+		zone->per_cpu_pageset = &boot_pageset;
+		zone->per_cpu_zonestats = &boot_zonestats;
+	}
 	zone->pageset_high_min = BOOT_PAGESET_HIGH;
 	zone->pageset_high_max = BOOT_PAGESET_HIGH;
 	zone->pageset_batch = BOOT_PAGESET_BATCH;
@@ -7728,6 +7737,10 @@ void zone_pcp_enable(struct zone *zone)
 	mutex_unlock(&pcp_batch_high_lock);
 }
 
+/*
+ * Keep the pagesets of an emptied zone: refresh_cpu_vm_stats() can hold
+ * one across cond_resched(), and nothing waits for it to let go.
+ */
 void zone_pcp_reset(struct zone *zone)
 {
 	int cpu;
@@ -7738,12 +7751,6 @@ void zone_pcp_reset(struct zone *zone)
 			pzstats = per_cpu_ptr(zone->per_cpu_zonestats, cpu);
 			drain_zonestat(zone, pzstats);
 		}
-		free_percpu(zone->per_cpu_pageset);
-		zone->per_cpu_pageset = &boot_pageset;
-		if (zone->per_cpu_zonestats != &boot_zonestats) {
-			free_percpu(zone->per_cpu_zonestats);
-			zone->per_cpu_zonestats = &boot_zonestats;
-		}
 	}
 }
 
-- 
2.53.0-Meta

