Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880143E51D4
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789893991; cv=none; b=at0h3NdwdoLaUwPi35xpFtD0XfHVNpXZ7hC/7G3UZ8cS3Q/7Vgy60J2d5IlGVWk5ffO2y+IcBgzMiI/piCW9DLyVLaJdVoqxFTK4MXa+1srG0RBEz/KziGCjvlaOM/TwRKc0SZjOvPfc0jTMvvUlXcRSBpEcqd67oQ8J9Id8MwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789893991; c=relaxed/simple;
	bh=HAcgfKHkNgLlXaIqIJX2qqZ64BIXaJH3XvIA/CZsUSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SitpTrHr3c7A5rvOk9NFUF01Edw2EOM7j/sEcUR3JCUy/imal+bPqYOSyhSzjM6PVSliYgtcH/REE0pYIiFywsQtfnhFSaL2FGPLCCbbWtno4WWTWVLNsN/WUzkR50jsHnLhxpG+Y2/fuxizk8DcGu/wmngp0IudCEmAZ7rgHRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jRjCXmHq; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jRjCXmHq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789893988; x=1821429988;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HAcgfKHkNgLlXaIqIJX2qqZ64BIXaJH3XvIA/CZsUSI=;
  b=jRjCXmHqP/h8/1z0KARd0tNnknA78V2WrckQDkIMUWSFsOl1vBi4Tmv9
   4HgNLMO9EGQSFfESWhMiz7DcC9eMIAUwtKH/5n5Iymll2ntW56mr31ALw
   urZqSHuMp6pN0wZkRyVwAWDH5tDUr9sZhC4cOm0nsAOafPK3qY62R0UgR
   N1h3NNmSRUEeEu5grpuVMXa/avg95gHstshzANhAaOS36Cw9qaTulbpfJ
   lJXSsxT7FtUEOUGZpOcIzacL3prdcNf9+bWgIHXLc+WuMNEnI1yRSWBdj
   gpCdwZD12ABs3GjmXlbzvOaHK0i84hPqymxc0a0tJK38YHae7aBZ1j3kq
   Q==;
X-CSE-ConnectionGUID: LPG5jWueT6qCt6hKXS9U1Q==
X-CSE-MsgGUID: FhALBok2TfyekGfBHsVbRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11910"; a="77968083"
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="77968083"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 01:46:28 -0700
X-CSE-ConnectionGUID: IQ8rWYG7SHOHwwNte+lCjQ==
X-CSE-MsgGUID: 4/rIdET0QGuGZFjtqW9S+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="3543410"
Received: from spr10.sh.intel.com (HELO localhost) ([10.239.23.75])
  by fmviesa013.fm.intel.com with ESMTP; 20 Sep 2026 01:46:25 -0700
From: Yuan Liu <yuan1.liu@intel.com>
To: David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Mike Rapoport <rppt@kernel.org>,
	Wei Yang <richard.weiyang@gmail.com>
Cc: linux-mm@kvack.org,
	Nanhai Zou <nanhai.zou@intel.com>,
	Chen Zhang <zhangchen.kidd@jd.com>,
	Yuan Liu <yuan1.liu@intel.com>,
	Jason Zeng <jason.zeng@intel.com>,
	Chen Yu <yu.c.chen@intel.com>,
	Pan Deng <pan.deng@intel.com>,
	Tianyou Li <tianyou.li@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 1/2] mm/memory_hotplug: make shrink_zone_span() more robust
Date: Sun, 20 Sep 2026 04:49:45 -0400
Message-ID: <20260920084946.3266279-2-yuan1.liu@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920084946.3266279-1-yuan1.liu@intel.com>
References: <20260920084946.3266279-1-yuan1.liu@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "David Hildenbrand (Arm)" <david@kernel.org>

Let's make shrink_zone_span() more robust by checking in
find_smallest_section_pfn() / find_biggest_section_pfn() that the
start or end PFN of the subsection is within the zone.

While at it, clean up the function by factoring the core check out
into subsection_overlaps_zone().

There likely is no need to check the nid first. We require
SPARSEMEM_VMEMMAP_ENABLE, where pfn_to_page() is cheap, and
pfn_to_nid() on CONFIG_NUMA would call pfn_to_page() either way.
So let's just drop that for now.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
Tested-by: Yuan Liu <yuan1.liu@intel.com>
Reviewed-by: Wei Yang <richard.weiyang@gmail.com>
Signed-off-by: Yuan Liu <yuan1.liu@intel.com>
---
 mm/memory_hotplug.c | 59 ++++++++++++++++++---------------------------
 1 file changed, 24 insertions(+), 35 deletions(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 226ab9cb078a..9f19876ec3ec 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -425,49 +425,39 @@ int __add_pages(int nid, unsigned long pfn, unsigned long nr_pages,
 	return err;
 }
 
-/* find the smallest valid pfn in the range [start_pfn, end_pfn) */
-static unsigned long find_smallest_section_pfn(int nid, struct zone *zone,
-				     unsigned long start_pfn,
-				     unsigned long end_pfn)
+static bool subsection_overlaps_zone(unsigned long pfn, struct zone *zone)
 {
-	for (; start_pfn < end_pfn; start_pfn += PAGES_PER_SUBSECTION) {
-		if (unlikely(!pfn_to_online_page(start_pfn)))
-			continue;
+	const unsigned long start_pfn = ALIGN_DOWN(pfn, PAGES_PER_SUBSECTION);
+	const unsigned long end_pfn = start_pfn + PAGES_PER_SUBSECTION - 1;
 
-		if (unlikely(pfn_to_nid(start_pfn) != nid))
-			continue;
+	/* All pages in a subsection are either online or offline. */
+	if (unlikely(!pfn_to_online_page(start_pfn)))
+		return false;
 
-		if (zone != page_zone(pfn_to_page(start_pfn)))
-			continue;
+	/* Checking start+end is sufficient. */
+	return zone == page_zone(pfn_to_page(start_pfn)) ||
+	       zone == page_zone(pfn_to_page(end_pfn));
+}
 
-		return start_pfn;
+/* find the smallest valid pfn in the range [start_pfn, end_pfn) */
+static unsigned long find_smallest_section_pfn(struct zone *zone,
+		unsigned long start_pfn, unsigned long end_pfn)
+{
+	for (; start_pfn < end_pfn; start_pfn += PAGES_PER_SUBSECTION) {
+		if (subsection_overlaps_zone(start_pfn, zone))
+			return start_pfn;
 	}
-
 	return 0;
 }
 
 /* find the biggest valid pfn in the range [start_pfn, end_pfn). */
-static unsigned long find_biggest_section_pfn(int nid, struct zone *zone,
-				    unsigned long start_pfn,
-				    unsigned long end_pfn)
+static unsigned long find_biggest_section_pfn(struct zone *zone,
+		unsigned long start_pfn, unsigned long end_pfn)
 {
-	unsigned long pfn;
-
-	/* pfn is the end pfn of a memory section. */
-	pfn = end_pfn - 1;
-	for (; pfn >= start_pfn; pfn -= PAGES_PER_SUBSECTION) {
-		if (unlikely(!pfn_to_online_page(pfn)))
-			continue;
-
-		if (unlikely(pfn_to_nid(pfn) != nid))
-			continue;
-
-		if (zone != page_zone(pfn_to_page(pfn)))
-			continue;
-
-		return pfn;
+	for (; end_pfn > start_pfn; end_pfn -= PAGES_PER_SUBSECTION) {
+		if (subsection_overlaps_zone(end_pfn - 1, zone))
+			return end_pfn - 1;
 	}
-
 	return 0;
 }
 
@@ -475,7 +465,6 @@ static void shrink_zone_span(struct zone *zone, unsigned long start_pfn,
 			     unsigned long end_pfn)
 {
 	unsigned long pfn;
-	int nid = zone_to_nid(zone);
 
 	if (zone->zone_start_pfn == start_pfn) {
 		/*
@@ -484,7 +473,7 @@ static void shrink_zone_span(struct zone *zone, unsigned long start_pfn,
 		 * In this case, we find second smallest valid mem_section
 		 * for shrinking zone.
 		 */
-		pfn = find_smallest_section_pfn(nid, zone, end_pfn,
+		pfn = find_smallest_section_pfn(zone, end_pfn,
 						zone_end_pfn(zone));
 		if (pfn) {
 			zone->spanned_pages = zone_end_pfn(zone) - pfn;
@@ -500,7 +489,7 @@ static void shrink_zone_span(struct zone *zone, unsigned long start_pfn,
 		 * In this case, we find second biggest valid mem_section for
 		 * shrinking zone.
 		 */
-		pfn = find_biggest_section_pfn(nid, zone, zone->zone_start_pfn,
+		pfn = find_biggest_section_pfn(zone, zone->zone_start_pfn,
 					       start_pfn);
 		if (pfn)
 			zone->spanned_pages = pfn - zone->zone_start_pfn + 1;
-- 
2.47.3

