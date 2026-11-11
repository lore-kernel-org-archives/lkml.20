Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794381459;
	b=wgOH1UOave0GCDY4MMjvzxpFoaIZOUB4WZF4eM9g4eB4RP09N7KvGOTk6sWSAno3nmTH
	 igDMor+kZ2uU4H9MWxRIdbgw1MOoPsQDK1j7aRQSDeGBleF462k6P0dw4AEHaAL1OQDY0
	 4jyxP33pC759dIxvwbb0+qRLG9OnyWtWUHsbD4McRJZ3r8A9ue3jslCFTx+eJzBp3Mgn5
	 hOz/jTU1dv4fPZJvn7Bju00/OJdYUSqfXYQUrFkaRakS70x1aFtAtlx6gXxTG7XgGon0N
	 E5SBDZFmDy8BAbW7fH4nHTct5oFYUBTDx6H2byl0KhpQ+cSf+0iMdDV8qCMYgg/4jVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794381459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7JuUV+9RepX3x2BjxY1OAwwH8ZUYdafN/RIIq5XC+Dg=;
	b=x/PjzjQz1hEScbDaj1mwKIxKcZSTlIPLwoUJ4lM5FmdQiuLeS6kzVngkpQfX4Uw8u57w
	 aLX+uFvGAxjIFYhmdf/067ADYXsH9H/O+zDQhtVMLh3UVTIlZZhoWPESEYNDx2NBUt13S
	 icvYsFj99oibn9PeFRIDePOTbIPffYXv6ugNDrPn+mVpxomavQdRHaYuhuyyck23zUUJO
	 9trhIoZ16U5TtY4HihDeeinARsjElxDHGmSTpRLBiHiSt+0Y6b7OIMNNTWrhX9JB7CWzr
	 qwjeAsnPYddogKt4JnHjO1brpvW63eK2yliltd3FIewrdd+3I/U9tbJZ/Q9XSvVPjZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=shopee.com;
	spf=pass smtp.mailfrom=shopee.com;
	dkim=pass header.d=shopee.com header.i=@shopee.com header.a=rsa-sha256 header.s=shopee.com header.b=NtO6LCzw;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB1A606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FB1A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shopee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.a=rsa-sha256 header.s=shopee.com header.b=NtO6LCzw
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd8ba7c2694so1151796a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com; t=1794381458; x=1794986258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7JuUV+9RepX3x2BjxY1OAwwH8ZUYdafN/RIIq5XC+Dg=;
        b=NtO6LCzwI02Orj/2Yvb9GDZhhVin0DcWcYMk0C31Tghbkl/z57abysVA1EQlx+rmSz
         H17+kKRE7+J/IJdTM0c85KE3IlObb+sCRYf7U0pBDWvWMVE3YOgheQcr9qg1zdfc3ANm
         tEyCl5FbMtCqCRnglULlPeYRNlRU4cQ1QEoA+W4xq7iatAchM4ElvsJ3U8dOmKf8x8Qt
         aDtj3oUiepWhJvE2voP7c5AcrmwKwyPazxV3to6IufSuKTMFtqT1YfRAg7KOlb7+8/rx
         bhOWk32MFUSI8OGvL3sVPP0rxUjyBF20puWf91y3nVRUlZgSjaZa+/r7+an8V6jFaiD4
         WHyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794381458; x=1794986258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7JuUV+9RepX3x2BjxY1OAwwH8ZUYdafN/RIIq5XC+Dg=;
        b=DqSm4Z/nFHPEnYGlD9+sUSyeeZj/BT6cVJ9LplXqs/yabJkBmlRx8i4a6qTzC2o9ae
         WbXIDjGMSntBTE9IylInp5INh0sU03SCvG9s6ZUFyqcTNr19V5ttwxnsEYqnRe78Otz7
         jLldS8S1GERC9V+cgMx34ne5Ud91HZgNW5BxO9PcmS9IMOWp5B7PEX1kAQcUJ0iXGx3B
         uAUK0GrmDjWviEA0mYkgalT+6+iqnMykB4yuDgss1+U+7xiakXdWTtKlVwLJUrQaL+NU
         CkiSW/o2VrvV361d9q3DWR5JplWQH0SFNH2ZD0Xg/99ESV+RQ2wkX5lUt4R4qH0u9Jng
         XgtQ==
X-Forwarded-Encrypted: i=1; AL+hErGf3aP0VGrnIO6FTcuhTiie5BOkdb8ooz7U7KPZd+aK9dG4lfpv5dpCzPGMrBjyFmkMGhSjreZ4C1pHGjk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SkFfg3vu+OZ0KQbd6EgSXG66HgTOcZZyCdwpsueW1/jU8GqM/
	EMyOJjOOV+mae8rDmJnwWFk2zqvqVntXbx1inRQf6AuT7EiWVpk5pMkrZ4phTfFhx0I=
X-Gm-Gg: AYBFou0q+hC6epEz8geXcAjnF7quGkPN/rqTGsLuplmtGSNTDI/6KIHRAuKNsoQAkjq
	gkFQ8kai4BiV/MgZx5AFYs5tNRy5F6RP+0VlcqfKundQZi75lj2uOeFSTJiE5dEvQtndjvLO7AE
	rAgpDdUORVfEc5dRzqdo15YBQC/hycJz7dxdAm17T1qP6mBHBXwMFfwnMC+0oc+3UqH0lHOkQlY
	hy7zAzds65U6pyroJZhMyB2W94uoEJQXr0ERk5Ofay2ZKwGLyTwDtwtFk+eEvJojKjj5k6HbTcG
	qb2+ukR1PFvk+hLlmG2Th/QPtMgWoZZzlAVIhHUUFzQ+UOwfJejVLVUt+FnT/vlxXgxehlrY/Bh
	HJ68Lj4iqSmVo3WoVDTSsyMGo9jmhyDB3iob9l0+tWRJk3C0s4bJc0dHqOYqiRlwaElNAHTIPLm
	PVGDoBd83bZXNS+FXEch8zGe9IG3eX6mlU/FklNXdq2+0SgVkQ5pAIvvzBSBxq1j4J9WcxTWOLC
	qlBFrhehK6CUQOmuvHQ5koySrmk2wj0vgEV13aajh++2JR9ff9Av/mox+9miF4yB/Sgryfqfuub
	TT/l4LaKmwRRcoxbkouooiHpdfTqApWxgf81kZYWJyi5P43/+oxRxoCKRTbqOjkInn+R5EQi2I5
	as7oCLq6U5zjoc44=
X-Received: by 2002:a17:90b:2552:b0:3b0:9deb:d994 with SMTP id 98e67ed59e1d1-3b182f85315mr1524391a91.64.1794381457818;
        Tue, 10 Nov 2026 23:17:37 -0800 (PST)
Received: from LPMV6FJ9FM.cn.corp.seagroup.com ([143.92.118.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db5cc73sm3189218a91.10.2026.11.10.23.17.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 23:17:36 -0800 (PST)
From: Runli <mingyu.he@shopee.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	linux-mm@kvack.org
Cc: Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Yosry Ahmed <yosry@kernel.org>,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	littleswimmingwhale@gmail.com,
	Runli <mingyu.he@shopee.com>
Subject: [PATCH v2] mm/bpf: Always flush memcg stats when explicitly requested
Date: Wed, 11 Nov 2026 15:14:34 +0800
Message-Id: <20261111071434.34547-1-mingyu.he@shopee.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
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

memcg_rstat_updated() stops walking the ancestors when a memcg exceeds
the flush threshold. A concurrent flush can leave an ancestor below the
threshold, so the early exit prevents it from receiving further updates.

Consider root and leaf on a 4-CPU system, with a threshold of 256.
CPU 0 is flushing another CPU's stats after CPU 1's stats have already
been flushed. The counts below are shared stats_updates counters:

  CPU 0 (root flush)                CPU 1 (leaf updates)
  ------------------               --------------------
  clear leaf->stats_updates
                                   add 64 to leaf and root
  clear root->stats_updates
  finish flush
                                   leaf = 64, root = 0
                                   4 more batches of 64:
                                     leaf = 320, root = 256
                                   next update:
                                     leaf > threshold
                                     break; root is not updated

Root remains at the threshold, which is insufficient to trigger a flush,
while further leaf updates keep taking the early exit. The periodic
forced flush restores progress, but until then the root's aggregated
statistics can fall far behind. For example, page cache grows at rate of
1 GiB/s, a two-second wait can leave the reported usage about 2 GiB below
the actual usage.

Make bpf_mem_cgroup_flush_stats() bypass the update threshold so BPF
callers can explicitly flush stale statistics without waiting for the
periodic flush.

Suggested-by: Shakeel Butt <shakeel.butt@linux.dev>
Link: https://lore.kernel.org/all/avKy9oMwDRjKjfzm@linux.dev/
Signed-off-by: Runli <mingyu.he@shopee.com>
---
Changes since v1:
- Make the BPF kfunc flush unconditionally, as suggested by Shakeel.
- Leave memcg_rstat_updated() unchanged.

v1: https://lore.kernel.org/all/20260911032905.63683-1-mingyu.he@shopee.com/

 mm/bpf_memcontrol.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/mm/bpf_memcontrol.c b/mm/bpf_memcontrol.c
index d8f579c28560..f8552651b6d6 100644
--- a/mm/bpf_memcontrol.c
+++ b/mm/bpf_memcontrol.c
@@ -7,6 +7,7 @@
 
 #include <linux/memcontrol.h>
 #include <linux/bpf.h>
+#include <linux/cgroup.h>
 
 #include "internal.h"
 
@@ -154,11 +155,12 @@ __bpf_kfunc unsigned long bpf_mem_cgroup_page_state(struct mem_cgroup *memcg, in
  * bpf_mem_cgroup_flush_stats - Flush memory cgroup's statistics
  * @memcg: memory cgroup
  *
- * Propagate memory cgroup's statistics up the cgroup tree.
+ * Flush the memory cgroup subtree and propagate its statistics up the cgroup
+ * tree, regardless of the number of pending updates.
  */
 __bpf_kfunc void bpf_mem_cgroup_flush_stats(struct mem_cgroup *memcg)
 {
-	mem_cgroup_flush_stats(memcg);
+	css_rstat_flush(&memcg->css);
 }
 
 /**
-- 
2.39.2 (Apple Git-143)

