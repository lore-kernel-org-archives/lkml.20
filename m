Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794520065;
	b=uhTPFkalbGApbwjDku9cqZDjxc6bR3bZz2nlagIcA9r/LTE1j7h/8QnwRup0NPKSxxEB
	 Ek6QUfXZ2WGXe6F4WOIj5SUyAr3TheJ9XrdhHCYHurHTpEAQZ+pvC4E09ifLbCj/YeREi
	 5i1O4nWXU3AIrg6aH8F8sEnlElxP0dgx/3XKbTzlqWmCnu/BnYUS7j+9drCOF3w8gJIwN
	 kDml/EgDwwfwASK6KQ2doh0c4yZj5LrypFQDYa+KDBBhQlZHu8c+jX6wuphnjXoQSZ9b2
	 9DJO2zyZJYU4YixLgsDzj5zV9Dc3TKl4oeieZkbuu5SW0LnPjKWjjOiebVhov/TlzOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794520065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OtdlhKZ9G3DOjiAGL5mHW576xMlg85nEbvlb8HjXia4=;
	b=e25oRyTtzfihCVkrtSr6L1UgK/tJ8fifR9vmbjBipDjvWJpwoS5Pq3G0MziyS+iP9Qs/
	 IHdWE/GyyKkctSyZz2lCHHvcuWK/X8duV3DQkU7Xq6zMLp3K8NhhBgrulobPewyLAZuKS
	 Etn+gEmLKSv/GTmjNyger+NF1HIzkoyyZzFHcsmr0kkkyQlvy8iY1ju6H9hyunMpPUGQU
	 /QKhR2LrxFgecGNS1lgQbp2bRy9Kf4+w3354jnkccLebb0qQ0nwraYVo0Rsa+muqcLi5d
	 sM+5LioQ/MU04IwCI/Y2Ty1klF9BP8wPpZWGAMHlzqCocRisSqqMitofWmjJEV1EvIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d626qkNg;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C88606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76C88606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d626qkNg
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b309147589so3716117b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794520064; x=1795124864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OtdlhKZ9G3DOjiAGL5mHW576xMlg85nEbvlb8HjXia4=;
        b=d626qkNgSNfkdjGF6DwWp//ex5JZEG458OtdC9/lsIzgEFmgr75q0+kT+bF8VSGBbE
         9+OfgqcTfqr5l19Rg51LzxWciPRpsjGvNb2B4J4L/3L0SlWx/O2UTApjHdr/2Kx+zPAO
         H6lNxmEr9WouOqZW/myQ87/YShDkIZVvhGpYpxWoMRZhxSN3Oh2SNZmzFgjQzNxwpill
         d1NSoai4dBvaBL/6TAo3a4welJkMHdDd/eUh5d2ex4/A/G3iNYSSBuZuZw4aQoyUICWj
         36+A6bZr6jHfBDdIE4cTUHwtchCZtCZ4eWThMP4tc+Whl6W2+Qqq4m/E5n64wqpTmMJ4
         hfiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794520064; x=1795124864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OtdlhKZ9G3DOjiAGL5mHW576xMlg85nEbvlb8HjXia4=;
        b=PqBdr0kaTjZFEEYUxYEft6Ny4aTFToMz6END6mHELA/6Ee4N3RTxRFx0uAOsogQf0h
         DlE8D9kgd2M3ias2KkER4yT0zGb9FIGGUQZBzFlzTWDrITcbxSRAcW/R5prqIqVmdv0K
         PZQw90KSTgdSlJoreTQHQXE3WFziOdNdE5d3eaXzJO58wWMtBOCa1IQXsFDJAVCovS6n
         tHsyfLVADrYYAkQBCPgWCfJTo0vKjkq9Y+8ggl14IJVY83Md/yNDebZZ+DkDkCCNA1XB
         z+58PxbH7fvq1cwcg99m/Rf0IkvLrDLbh1vB4QxUz8OmKhVKrO75n6ccvfnK/UC6ocwW
         KyOQ==
X-Forwarded-Encrypted: i=1; AL+hErERU48qre15KtoelVn7csrvezKxTgKZi0gKoki/ABcCrGaHdayBZPc5IMg8aD++3y34qojbhhAk+ngJ/tg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8s0JpQ+LMXV4dyv8RLh+z4iGxZ839oDKhx96/8QzqyTY1AQiix
	wLfc3HhRqbYpaOcSk4RFgYoq4srub8inKl72gBbe/b01p0s72KvApRVt
X-Gm-Gg: AYBFou26V+PDDkEKsBTcFjC5W+XACTPuUJ0fGH3ioU/vI9AYY1khOeWE6hHKkRAFpsF
	G05beeiJP6N3LxZVoAPVSx/Opi7k8xuTS3ET0sEm9gzxZR+0ufFlZ3fRQJtewhyw4AEwXXD/HnK
	aGxhSUaKF6I+Yy4ATCUxraWrFqLKMGrOYnBDydTKbRX5dFys2f2IdXhQyTrSgyhsYd+Q5gSUI2A
	5gRBeN0pHnIlzad5J5/quVORQamoJa0V4OIF1j1tnp479MYv18EG1jOK82Gh8119VKAHfBpb38K
	PASXspRboMPBB5qPTBx6RiqN5bujpN1JRRAYfR5qIIePUBmF8FWgKPKeQ33a/hUlw/3T3AV6PEf
	tIHUY+nqaDDeZUDlkXZ1Onlbuf5lWIA/O8moRsIGBTEAVHSjnKQeWmtHIOxL33CTBgBVHb4Jtqt
	HiSG+Z/YqYsKtLNa3gfRmaS+8l7Raf9TbJ3QlqiMt7bB3aF4QLe8NQysbfL3y2HuntaAZYWx6XY
	5hBqv82VmFp+aaGvxhw0pmM/qqV1aV+gM6r9W7eInEw6HLP527matBRlqA1zaj8ue0aFUtG6DZx
	z89YlMgUXoTrov8qPczIrEZvpZZlSPgOimiXPdhRC9XAp3Lc5k7wnsh65PE=
X-Received: by 2002:a05:690c:e3ed:b0:8b1:f47:9c07 with SMTP id 00721157ae682-8b4aa25caf7mr6200957b3.25.1794520064454;
        Thu, 12 Nov 2026 13:47:44 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:1::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa931272sm5987177b3.16.2026.11.12.13.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 13:47:42 -0800 (PST)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Gregory Price <gourry@gourry.net>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	"Jose A . Perez de Azpillaga" <azpijr@gmail.com>,
	Daniel Hodges <hodgesd@meta.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v3] mm/page_alloc: only skip kswapd nodes below their kswapd watermark
Date: Thu, 12 Nov 2026 13:47:37 -0800
Message-ID: <20261112214738.3002458-1-joshua.hahnjy@gmail.com>
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

Commit 19c5fb83f2a4 ("mm: page_alloc: avoid kswapd thrashing due to
NUMA restrictions") makes get_page_from_freelist() skip any node with
kswapd running to avoid piling on already-pressured nodes.

This assumes that kswapd was woken to create free space, although kswapd
can be woken up for other reasons, like higher order allocation
failures. Thus, fragmented nodes with failed high order allocations will
always wake up kswapd and direct order-0 allocations to the fallback
path, even when there is free space.

This behavior was observed on 2-NUMA Meta production workloads where
faults would pile on already pressured remote nodes while stranding
memory on the relatively empty local node, causing unnecessary pressure.

Only skip nodes with kswapd running if the node is under the relevant
low-memory watermark.

On a 2-NUMA VM with a 60G node0 and a 20G node1, with THP enabled=always
and defrag=defer, I ran a process that prefers allocating on node0.
With a fragmented node0:
- Before the patch, 66% of faults were served from node0
- After the patch, 100% of faults were served from node0

Fixes: 19c5fb83f2a4 ("mm: page_alloc: avoid kswapd thrashing due to NUMA restrictions")
Suggested-by: Daniel Hodges <hodgesd@meta.com>
Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Acked-by: Gregory Price (Meta) <gourry@gourry.net>
Acked-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
---
v2 --> v3:
- Shortening cover letter, suggested by Gregory and Johannes
- Collect signatures

v1 --> v2:
- Added a Fixes tag and separated this from the other cleanup patches
- Check zone_watermark_fast with no flag to match the call in
  pgdat_balanced().
- Calculates mark outside the zone_watermark_fast check to match the
  style for the other zone checks.
- Wordsmithing commit message to explain the unaddressed gap.
- Yes, this is ugly. I have another series to clean this code up but
  I wanted this to be a feature-minimal patch so that it could be
  easily backported. Things will be much prettier once those are landed.

 mm/page_alloc.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 8532af052d74b..56121c3f9c4a7 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -45,6 +45,7 @@
 #include <linux/mmu_notifier.h>
 #include <linux/migrate.h>
 #include <linux/sched/mm.h>
+#include <linux/sched/sysctl.h>
 #include <linux/page_owner.h>
 #include <linux/page_table_check.h>
 #include <linux/memcontrol.h>
@@ -3799,6 +3800,9 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
 	struct zoneref *z;
 	struct zone *zone;
 	struct pglist_data *last_pgdat = NULL;
+	enum zone_watermarks kswapd_watermark =
+		sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING ?
+		WMARK_PROMO : WMARK_HIGH;
 	bool last_pgdat_dirty_ok = false;
 	bool no_fallback;
 	bool skip_kswapd_nodes = nr_online_nodes > 1;
@@ -3866,16 +3870,21 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
 		}
 
 		/*
-		 * If kswapd is already active on a node, keep looking
-		 * for other nodes that might be idle. This can happen
-		 * if another process has NUMA bindings and is causing
-		 * kswapd wakeups on only some nodes. Avoid accidental
-		 * "node_reclaim_mode"-like behavior in this case.
+		 * If kswapd is already active on a node and the zone is below
+		 * its kswapd watermark for this request, keep looking for
+		 * other nodes that might be idle. This can happen if another
+		 * process has NUMA bindings and is causing kswapd wakeups on
+		 * only some nodes. Avoid accidental "node_reclaim_mode"-like
+		 * behavior in this case.
 		 */
 		if (skip_kswapd_nodes &&
 		    !waitqueue_active(&zone->zone_pgdat->kswapd_wait)) {
-			skipped_kswapd_nodes = true;
-			continue;
+			mark = wmark_pages(zone, kswapd_watermark);
+			if (!zone_watermark_fast(zone, order, mark,
+					ac->highest_zoneidx, 0, gfp_mask)) {
+				skipped_kswapd_nodes = true;
+				continue;
+			}
 		}
 
 		cond_accept_memory(zone, order, alloc_flags);
-- 
2.53.0-Meta

