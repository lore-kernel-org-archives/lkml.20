Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792550401;
	b=2cwF12ofHsQc8QZT6BCR5RFZN74IlFJ7oPfa3BCW9WHVxd2rTO+P63NNtjuA2ks1EYMn
	 aWQVEIlIpPl4dm0bR9MRdGgqk1jB6MwQoHnDbY/Fef35LwAFfaBJSqjocKM/iKeqP1A6Y
	 XGgD87SRYu7/A/I9DYHr9GvhzNXu5KdTa8dyf7xrjp4U0tsDrhRe+ANQzCm4BDyB6voDS
	 G6scISf/OLaq6Cbkw/Lzo09HJMjaxvtK6qSA3TUaeDy02K69froXbNgsZyf51jYHcaZ2C
	 RGpGVCidNbpaQ1S8NFooNDnE7GMItkPCbWuYjmpE/Hqf+ky12ay8Df+fHCVfgxGwY3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792550401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=abLwrGFXoJBlnSAGPYLFFR7ZpE8C/Ap31b+sTibNse0=;
	b=E3JjpSJPYyeiCMdsA4f6yFMBw/gdbwQKMl8YzTwiiWgUPTaVmKNzqOuLhpp68jUDj+xP
	 Pk7amqtxO0KipyKflIV2mWMUs7vpc51dFOSTR3E6nbMxYIiVfep2Mx8N1wzJ4Bl75ZCHW
	 Ob6wuKk38BPjn/yQWvsNLLPa0mTutASbPtXEPet7LWBO0Ro7CkjuPgEKt1lNZiDfp+8t4
	 YIq+w4kugnpbC5TbOf7w2reFzfEblOKKBljLJHTPAAK77ik0AL3d3MiqHBs6SumK5KqPl
	 jXYB3M4vl+olgbZc1rqcKwC3CFuAB1u2B15i09lrPtrDKafN7hDfYcB/QEUCqBGdgHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=sdrXFa1x;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB8560A2626
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:39:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFB8560A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=sdrXFa1x
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93cb1c0e851so17851185a.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792550399; x=1793155199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=abLwrGFXoJBlnSAGPYLFFR7ZpE8C/Ap31b+sTibNse0=;
        b=sdrXFa1xLhvIReq0kw4CbXCZJcV4vwN9Cdl2Lfxt5cMVxYojNvyfava1FDldns2RkZ
         ezXEEqGOT+9F/nekjNoyU8Wz+hF3DEhVETvlRSsioDWxSsMaOMnjH2dyz1IM59kg3xxz
         s7KcqE1tEin89Dnr86ypQ1UOW42bzFF856AYOahJZWvg2kG/xiNcmWJF0I8kFZAiLuVK
         CxfeFSf6jO1LAuZRq1HtTDW1/4ncDhTlsemBl+P63gDuV7YR3Mflg+PCZL+InLftYvIW
         u/ELWKZnlcmjIfgviPbQyn9TP1UEVrcbRh2AP5F1tMafZJNXA+nMW5UVUBuLIVSVUxC3
         DmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792550399; x=1793155199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=abLwrGFXoJBlnSAGPYLFFR7ZpE8C/Ap31b+sTibNse0=;
        b=G9+Rq9ziqjirbd+3rMboYX23BuOeFLkL8KiFR8htsQCGXPIKWbzajJr1mNBW1w6Zuv
         LoVtzqfXAl1XJRNWtOaY+n89bP6JamdxK4jyGkT+ZawNXfx1FIsOwrlxQ8VsbWdareb+
         UbBIqOD7lCnzRyYXZUjI5Z8Tc02ZqseVuywNTQwBkelq3lQpydp4y/zTMWBcGu2AglSR
         jP7r44EcWna4o/53q7YW6mJrvbUVvVugiTnphYUEnTYaEdw8iYqNne6f8LQQ0Ao9dnFU
         GCmsxWNJcZwvu45+QlffFVm8+gPgH3fBIHobh12KPMp58tURQru3xxN5YfYB1yxkrvUL
         HKzA==
X-Gm-Message-State: AFq9FYIbZHZgazippQIPCfuIPG262Mx6/QX5W9oRwMUDnow3XRbrAbMT
	V/t7mK05R4aH1WqMgxN5MVtFkqUgXGvHOXl54xVLqU4ks4GmDIR1cgrCMfgM8o8qDW0=
X-Gm-Gg: AYBFou0eK8QvebMsy+wYDHRgy0WaT1vtJejg3uxNGfa+FHJ+3W/6NI88VwcmAbeQTS2
	SIAmStapL0pn+d4HDgHqRzyJCRy9u8+3resLrZ+7Q7cAXQ0sI2jE9D0GN9bFsyGJRBfnJcEtEmc
	KvRHY5AjD+iKLYuPcdFMtL8gvV5/DyrEvQJKBac7pbZhiPXtNpR5MbD7P6Blm4A6HoDzUTif0et
	9ocH0QH7bg1R5b3x6lhK7E7hxtoacRj8S1Mrlmmmtmd6ULgl17yX21HHmTmN3f0cdntWbo1cfNO
	+u/op7Ts7SYzbcwqE0viw9KS8EqkD9w4PrztKdt6W56Y8CjmL/u4F4RFAQScVfTlb7QOXzddV1p
	NpL8qesNHTN0vXKe4UR4IX3rmzyXmp1PpVPIAeUSEpVnorwcdO2UYxFTEcCyCEK5vjy2R5GVe2n
	pQaNXxWjuUCp9PNprr569VoI9afPVjZKgyVPqiKofRfOJpX9M9vz+z2E2K7dDQQGO2RvEYcN0XG
	GJVbmYuftYvR4sPEn4xhDF2hqAHmjLfICxjMKR6xmeK28iRUEtKuoeY9RKT/AraldFGe8YgSHL/
	B0adhYP5OmXbk5EoqL6kc49Tvz7d1H5rnojvYJpvPw==
X-Received: by 2002:a05:620a:3187:b0:93f:1823:308f with SMTP id af79cd13be357-93f57fe8708mr199104685a.81.1792550398715;
        Tue, 20 Oct 2026 19:39:58 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c10a45336sm13819426d6.3.2026.10.20.19.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:39:58 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	mhocko@suse.com,
	rientjes@google.com,
	shakeel.butt@linux.dev,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	muchun.song@linux.dev,
	osalvador@suse.de,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	mgorman@techsingularity.net,
	anshuman.khandual@arm.com,
	Bessel.Wang@huawei.com,
	jiang.liu@huawei.com,
	stable@vger.kernel.org
Subject: [PATCH v3 8/8] mm/page_alloc: keep a zone's pagesets when it goes empty
Date: Tue, 20 Oct 2026 22:39:40 -0400
Message-ID: <20261021023940.1940971-9-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021023940.1940971-1-gourry@gourry.net>
References: <20261021023940.1940971-1-gourry@gourry.net>
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
across the offline, it used the freed pageset in 6 of 6 runs, and
rewrote a new allocation at the freed address in 1 of them.

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
index 96ae09c8099be..dfca77764f1fb 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6369,6 +6369,12 @@ void __meminit setup_zone_pageset(struct zone *zone)
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
@@ -6465,9 +6471,12 @@ __meminit void zone_pcp_init(struct zone *zone)
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
@@ -7749,6 +7758,10 @@ void zone_pcp_enable(struct zone *zone)
 	mutex_unlock(&pcp_batch_high_lock);
 }
 
+/*
+ * Keep the pagesets of an emptied zone: refresh_cpu_vm_stats() can hold
+ * one across cond_resched(), and nothing waits for it to let go.
+ */
 void zone_pcp_reset(struct zone *zone)
 {
 	int cpu;
@@ -7759,12 +7772,6 @@ void zone_pcp_reset(struct zone *zone)
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

