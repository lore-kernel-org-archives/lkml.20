Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DC441A4EF
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790065344; cv=none; b=iEk06HF8jGySFTzJTR6A3DoaPwJWH5DZ54tiaMD/HVAm+zhbb6I+8DmuqeLoKp9GCaQGZYVLW+PUdgFEp8VZW71afcXinQXsZTkFq/iVNUJWlDwsnZMUcC065Y0XaFxCiJhndCllfAOwzY7lKH5gZnZsirdOUEiDuNvaSHPa12g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790065344; c=relaxed/simple;
	bh=1e+1JHL5yU071b+a9OBDDusz4ClJxLeRjTSxwJC5Lj0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ks+k0+7t2bXj4s9JIjwoXiNXkuRn0lAw+yUDkpYkLIzENeW522F1T8BU+IoLHtHrBKOnZr0JpzOBkaYeA4KTvVd7EIFfwB93yMJsnsHCGuF/ToR6TYOhova8Vptv7jCiglVcykvlP5++zA0654EYRqUwMgRlFEF9yE8N6zbVwJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AEW8RJQ4; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AEW8RJQ4"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39dacf053eeso2838512a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790065343; x=1790670143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oUr3HAAwa4UvQWi/4k8Tfe5hK+C7gkHWvU1DdGzSu+0=;
        b=AEW8RJQ46KGDkVvhDfD4WuqDWrhXJUyvW0vO/x4uUxOTxCwAIsUXgeX/zMO7Bgy8Qr
         9revNn9BboyA69Fexh5PAxBMXAIQVJ8BpsdCoA6Iw/9XaOiJZOmCO16Y3zhAszQTAE0Q
         qlTS0OwNyMolEpywPms2Q1jB/rCxi3lUpCdtwH3hOsw7qVjYL6bVJzgH+UNpsvQ0SO86
         sbP/+sU3bnsHhrtyIYu3PMM3++9YdZ+YMFLuCV87WY7LtCj/A/WiPOb+sm9bYseY2F+h
         azRyJsxv8xfOnU2z3zrbj8tCJqneT1a9maASZp9G/oqZwHuUxFrY56PFDgYfMU5iQYZ/
         sMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790065343; x=1790670143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oUr3HAAwa4UvQWi/4k8Tfe5hK+C7gkHWvU1DdGzSu+0=;
        b=AJBI7LoztW0knKjQsHu0+5UUSHwH1sfa6O/m5l1QiAX+0WhSGMGQDAAPaK/+Ie1mEY
         SprC9BTGnLpPp+iVzr1xj9zA79EuYYVBzdBxc65dEk0VUr/kYiqDrE5CEj5H3WDteWX2
         2ag3zVClrlq3NqKR3Jt002s/1zEtKHru/QWUzGSmO5AGANNM7Ve7LscVzJSGn9u/d0pk
         RQ9PdTs1CEic8DpXA7M+2rzBXsNU0jrjev3ZEhtt59tyVSvvCFj76aJI4LWJfVLD5q3B
         48jUjJPltMFc896HVPU9dZqTKI38/fPXI8H+Jfkg3c3o3mSjaxE5uVjbkMyASBczNEUW
         RA4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzKL8KkQZxnFMQzD2uUQD/5EW5Sh6ya9eOzUt/PFn/cXfd63lY8TyOSQbxAtQPvoRySzYsWCvHWtALwFP8=@vger.kernel.org
X-Gm-Message-State: AFuF++kmutJaGUqfFj70V0pHQbhg28/IsyamCp8vpwyDVB9mGohkS4lM
	ePN/KUTVehLyeYlVAW2M9htsLX5CaQsiCpvzluUGjtCqt/RoB7ybyd2H
X-Gm-Gg: AYBFou02uxiqwZo2H0bGUBDcrhCK4VHbs79IUSG9gMVxnRpkSt5vsn0IM61hwkxQuDc
	kxfuRDtGlXtBov6kvxwwOpZro/kLXI/xJQm529wx9kl0dbmHSFh/ux+dwwyIgYXuzKeq5GVjDt7
	lV7TQzxAoE/RIM3mJM6+j0qxQdos4nO3lTknVN/bShdG1JWc1F+kJzpvv4TFCbjut+CgRAQ75X4
	bEsTj9fKU8cLjOpP5ZgjpA46P/lZLVRBvRLno73JYFORDu1/OdVjYn70weGuRG+QLcZLJ6XatxA
	Zw9yfJXKkBl7tQZNsSNOLcX82xKT816FrNtqwR6uAd0QutTCPA0G8jO4sbuWKpqhdd+r5GqteLT
	oQjRgOWDq+97iVodTOj4ut0ubIQ5L+ka6SjB0Eej/JMfDfpjRHpOi35To8dboP9/XlByxcrz4c6
	aXowV03yTnXux2lg7+FoHY7HeRpMoO0pFsLepz1IEuQSV64TVaSil0/5Aro9m8bAdkbWTnfWx+N
	8GZA6q73g44pO0RHQ4MtJzR/6+B6TBGfWR59joEKXenk6G0a0/Z0cTv4g3QTYU=
X-Received: by 2002:a17:90a:da8c:b0:39e:6a7e:ee19 with SMTP id 98e67ed59e1d1-3a07320242cmr409438a91.37.1790065342365;
        Tue, 22 Sep 2026 01:22:22 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f29d88afsm3218679c88.4.2026.09.22.01.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:22:22 -0700 (PDT)
From: Zhijian Han <hanzhijian1991@gmail.com>
To: David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm/memory_hotplug: cache zone stats for "auto-movable" online policy
Date: Tue, 22 Sep 2026 16:22:07 +0800
Message-ID: <20260922082207.3224897-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When onlining memory using the "auto-movable" online policy with
nid == NUMA_NO_NODE, auto_movable_can_online_movable() walks all
populated zones across all nodes on each invocation to collect the
MOVABLE vs. KERNEL_EARLY stats.  This walk happens twice for every
memory block onlining decision (global check and, with NUMA awareness
enabled, per-node check) and is repeated for every single memory block
that gets onlined, although the underlying zone counters rarely change.

Cache the stats for nid == NUMA_NO_NODE and only recalculate them when
a zone counter actually changes.  All modifications of the relevant
zone counters (present_pages, present_early_pages) funnel through
adjust_present_page_count(), which is only called while holding the
mem_hotplug_lock in write mode and the device_lock() of the memory
block device.  Invalidate the cache there, such that the next
auto-movable onlining decision recalculates the stats from scratch.

CMA adjustments (zone->cma_pages) only happen during boot (via
init_cma_reserved_pageblock()/init_cma_pageblock(), both __init) and
cannot race with memory onlining.  Boot-time zone initialization
happens before any memory block can be onlined.

The per-node path (nid != NUMA_NO_NODE) is left uncached; it only
walks a single node's zones.

Resolve a TODO that was left when the "auto-movable" online policy was
introduced.

Tested on QEMU (x86_64, 512M boot + 256M hotplugged pc-dimm,
online_policy=auto-movable): hotplugged memory blocks get onlined to
ZONE_MOVABLE as expected, and an offline/online cycle of a hotplugged
block shows the correct zone counters after cache invalidation, with
no kernel warnings.

Link: https://lore.kernel.org/r/20210806124715.17090-3-david@redhat.com
Signed-off-by: Zhijian Han <hanzhijian1991@gmail.com>
---
 mm/memory_hotplug.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index d7a59167bec4..dfac59739a6d 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -789,6 +789,19 @@ struct auto_movable_stats {
 	unsigned long movable_pages;
 };
 
+/*
+ * Cached stats for all populated zones across all nodes. Modified (incl.
+ * invalidation) only while holding the mem_hotplug_lock in write mode and
+ * the device_lock() of the memory block device.
+ */
+static struct auto_movable_stats auto_movable_zone_stats;
+static bool auto_movable_zone_stats_valid;
+
+static void auto_movable_zone_stats_invalidate(void)
+{
+	auto_movable_zone_stats_valid = false;
+}
+
 static void auto_movable_stats_account_zone(struct auto_movable_stats *stats,
 					    struct zone *zone)
 {
@@ -849,9 +862,14 @@ static bool auto_movable_can_online_movable(int nid, struct memory_group *group,
 
 	/* Walk all relevant zones and collect MOVABLE vs. KERNEL stats. */
 	if (nid == NUMA_NO_NODE) {
-		/* TODO: cache values */
-		for_each_populated_zone(zone)
-			auto_movable_stats_account_zone(&stats, zone);
+		if (auto_movable_zone_stats_valid) {
+			stats = auto_movable_zone_stats;
+		} else {
+			for_each_populated_zone(zone)
+				auto_movable_stats_account_zone(&stats, zone);
+			auto_movable_zone_stats = stats;
+			auto_movable_zone_stats_valid = true;
+		}
 	} else {
 		for (i = 0; i < MAX_NR_ZONES; i++) {
 			pg_data_t *pgdat = NODE_DATA(nid);
@@ -1079,6 +1097,8 @@ void adjust_present_page_count(struct page *page, struct memory_group *group,
 	zone->present_pages += nr_pages;
 	zone->zone_pgdat->node_present_pages += nr_pages;
 
+	auto_movable_zone_stats_invalidate();
+
 	if (group && movable)
 		group->present_movable_pages += nr_pages;
 	else if (group && !movable)
-- 
2.43.0

