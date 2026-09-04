Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8530F377ABF
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 02:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788489740; cv=none; b=NDVBHKpDD6NiLAFkPcCqPQRSTQsmF6AnBqKO7qLU7QzgG+aSNVsCob+IIssAtJ0PugPztLt8/NT16dj3dhkob8OtQN69tONtF4TI5aeA6ZXfWvqZ6oHDUd4w1koYMtAg5AIuKM98SMrDR3zXW6eC9B7IaLBqBbE5voMu79A4TYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788489740; c=relaxed/simple;
	bh=SL9uOnCvlABtmJYf+nsrBBVra8CdnLHPfpXHILvzBNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PenRC9pX7onc0kZ4nAAKyASWKNa0pTb0QmxkvkU+rbd26VALXBVF2Zdrw5OQdjNqMlqE1T2Kq9k4N08ZzXYWKOtIImb/j/hEiKukPgYbXLZ4LYUNOEISjHq4eT/tMns4iKT/+7Q/OFawbPfei91vsJzh3u2wTUizL5/04q34M18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kYf0a4cf; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kYf0a4cf"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso5118845e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 19:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788489737; x=1789094537; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jByX/hUOJR9metF+xa8zMsLgboYN/Yuc7pkgyEeawdI=;
        b=kYf0a4cfqDU4A8+4l3K65e/bn8w3DIoT+njWilGdwGZ5bXvrFWpLcGMLLdhBMUjd5H
         od4UcAEIVclVlF2S0foozNDodBxPXNhLo9enfn+NM7KRnHhEDMnuJzH9IHCIGbGyWPrq
         lItt64gESJBQGznnodZ/fyvcrqLtyGadmKQcux04cR+6zIYyfNNwEDNs/+XqYUtNfuCP
         WL59hJayGdbqpS8fJAqamRIvzdDtgkU4fUX6hk4qXHPRZkTvO72taJtHkBjtt+KAiF59
         NBthPrhCRc/hdQpoN7SvJzX6soTpeqjlWb/WxHTK4OzA00N4y2QBacLtTTwo2JdJW3B8
         +gUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788489737; x=1789094537;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jByX/hUOJR9metF+xa8zMsLgboYN/Yuc7pkgyEeawdI=;
        b=YM4lL/jvQrkGH1qaJEGX4Y4YReyjRLBJJ07YkFBynFE/baXowTFsv09fCg9NhBQNhr
         lD8TuoaokfOqqaTx5Go4t2emBwdXIeUQpYA3y/KOsk/6dKkHPnizSvwGm8CSWEfZL4+K
         k60MNNCfskhGESntrMrWn3bChnMP7yMmFDBKn7VvaxokHiGIVNi9cnQ4aj9mKnUrNzf7
         20VSfgILCTpcUwP8nxmJgYXBu0HoOBOaDuj3+5rVOsJJeu+8Utm9oBHD39LmkLfXE++r
         zsCu/DaA59iY+2dWNmW0cVQ3emL7zLoxHlvHbwH/EqDWtbL1hEGb7Q5wG1WNe91ikOtr
         SMpA==
X-Forwarded-Encrypted: i=1; AKwUvBxoe6d/lMod8bZpQhQ0pVnLfNfbrPBmZKkDyJzqe0NhSax8oXxLUrQ0ANh2v0zlgphIEH8oH9Q0aB/7EPU=@vger.kernel.org
X-Gm-Message-State: AFuF++lIbGwn7eSDBxggBXXFsvv2Jbw8NBp9bwwRSoHv4IMFOextVDI9
	kJDL9tIIjwGJqPEpeVhGFGo56+biO7rOjcl1BICbHXGsw1R/A5T8RLM/
X-Gm-Gg: AYBFou3aySfYwDqPygc39OoluuvJPpC4TAzGfTjHqMd+uQYBr8kMTal7+WmRtZZ4N2O
	KW8AMjznHt6axqOL62+gRe0oQrADL+Agl8WEt4vWtSOezoelbh2xs3cBSY79NPSwzxLI3ky+i44
	LRckeQBl6yHa5Npb1Bv5DBjExZCVJ56sj02iHc5Llyy6vNlFbYiJ2x0i6QcwP8wwnwHemeJwRf4
	IiYrCLVHo7mbatP4kVVXpVWRiSSF9MNJpuWU4tzXbx4N+JHLpU2hf6t1FhwCCyJPc0cOfYRYnVO
	ewb5bjWA+gSqO4ZoQ7swFSaR0YtpXLcm3624uVL3uztLSS93KarXb6nirNYReNNjUb0YW5M7PsU
	0RuPmYFHlgWuWqtqVCLd44tbtHBXQvBLF9U09n6R0Sbxkq7jmNJNOyHkgDMInc+hnFI94fiEp7C
	FjOadluoGcGfmCOZIIMhdD2FcfX4xFAW9l7DCt5buP+lCdEQ1tFpUtT+DG4tY=
X-Received: by 2002:a05:600c:4f4b:b0:499:83f1:398 with SMTP id 5b1f17b1804b1-49cf823f53emr34860435e9.9.1788489736619;
        Thu, 03 Sep 2026 19:42:16 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee3b0af8sm118348575e9.0.2026.09.03.19.42.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Sep 2026 19:42:16 -0700 (PDT)
Date: Fri, 4 Sep 2026 02:42:15 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Yuan Liu <yuan1.liu@intel.com>
Cc: David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
	Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
	Nanhai Zou <nanhai.zou@intel.com>,
	Chen Zhang <zhangchen.kidd@jd.com>,
	Jason Zeng <jason.zeng@intel.com>, Chen Yu <yu.c.chen@intel.com>,
	Pan Deng <pan.deng@intel.com>, Tianyou Li <tianyou.li@intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 1/2] mm/memory_hotplug: make shrink_zone_span() more
 robust
Message-ID: <20260904024215.2vg2j77kopwfv54e@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20260901052950.3284540-1-yuan1.liu@intel.com>
 <20260901052950.3284540-2-yuan1.liu@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901052950.3284540-2-yuan1.liu@intel.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Tue, Sep 01, 2026 at 01:29:49AM -0400, Yuan Liu wrote:
>From: "David Hildenbrand (Arm)" <david@kernel.org>
>
>Let's make shrink_zone_span() more robust by checking in
>find_smallest_section_pfn() / find_biggest_section_pfn() that the
>start and end PFNs of the subsection are within the zone.

Either the start or end PFN is within the zone?

>
>While at it, clean up the function by factoring the core check out
>into subsection_overlaps_zone().
>
>There likely is no need to check the nid first. We require
>SPARSEMEM_VMEMMAP_ENABLE, where pfn_to_page() is cheap, and
>pfn_to_nid() on CONFIG_NUMA would call pfn_to_page() either way.
>So let's just drop that for now.
>
>Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
>Tested-by: Yuan Liu <yuan1.liu@intel.com>
>Signed-off-by: Yuan Liu <yuan1.liu@intel.com>

Otherwise, LGTM.

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

>---
> mm/memory_hotplug.c | 59 ++++++++++++++++++---------------------------
> 1 file changed, 24 insertions(+), 35 deletions(-)
>
>diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
>index 226ab9cb078a..9f19876ec3ec 100644
>--- a/mm/memory_hotplug.c
>+++ b/mm/memory_hotplug.c
>@@ -425,49 +425,39 @@ int __add_pages(int nid, unsigned long pfn, unsigned long nr_pages,
> 	return err;
> }
> 
>-/* find the smallest valid pfn in the range [start_pfn, end_pfn) */
>-static unsigned long find_smallest_section_pfn(int nid, struct zone *zone,
>-				     unsigned long start_pfn,
>-				     unsigned long end_pfn)
>+static bool subsection_overlaps_zone(unsigned long pfn, struct zone *zone)
> {
>-	for (; start_pfn < end_pfn; start_pfn += PAGES_PER_SUBSECTION) {
>-		if (unlikely(!pfn_to_online_page(start_pfn)))
>-			continue;
>+	const unsigned long start_pfn = ALIGN_DOWN(pfn, PAGES_PER_SUBSECTION);
>+	const unsigned long end_pfn = start_pfn + PAGES_PER_SUBSECTION - 1;
> 
>-		if (unlikely(pfn_to_nid(start_pfn) != nid))
>-			continue;
>+	/* All pages in a subsection are either online or offline. */
>+	if (unlikely(!pfn_to_online_page(start_pfn)))
>+		return false;
> 
>-		if (zone != page_zone(pfn_to_page(start_pfn)))
>-			continue;
>+	/* Checking start+end is sufficient. */
>+	return zone == page_zone(pfn_to_page(start_pfn)) ||
>+	       zone == page_zone(pfn_to_page(end_pfn));
>+}
> 
>-		return start_pfn;
>+/* find the smallest valid pfn in the range [start_pfn, end_pfn) */
>+static unsigned long find_smallest_section_pfn(struct zone *zone,
>+		unsigned long start_pfn, unsigned long end_pfn)
>+{
>+	for (; start_pfn < end_pfn; start_pfn += PAGES_PER_SUBSECTION) {
>+		if (subsection_overlaps_zone(start_pfn, zone))
>+			return start_pfn;
> 	}
>-
> 	return 0;
> }
> 
> /* find the biggest valid pfn in the range [start_pfn, end_pfn). */
>-static unsigned long find_biggest_section_pfn(int nid, struct zone *zone,
>-				    unsigned long start_pfn,
>-				    unsigned long end_pfn)
>+static unsigned long find_biggest_section_pfn(struct zone *zone,
>+		unsigned long start_pfn, unsigned long end_pfn)
> {
>-	unsigned long pfn;
>-
>-	/* pfn is the end pfn of a memory section. */
>-	pfn = end_pfn - 1;
>-	for (; pfn >= start_pfn; pfn -= PAGES_PER_SUBSECTION) {
>-		if (unlikely(!pfn_to_online_page(pfn)))
>-			continue;
>-
>-		if (unlikely(pfn_to_nid(pfn) != nid))
>-			continue;
>-
>-		if (zone != page_zone(pfn_to_page(pfn)))
>-			continue;
>-
>-		return pfn;
>+	for (; end_pfn > start_pfn; end_pfn -= PAGES_PER_SUBSECTION) {
>+		if (subsection_overlaps_zone(end_pfn - 1, zone))
>+			return end_pfn - 1;
> 	}
>-
> 	return 0;
> }
> 
>@@ -475,7 +465,6 @@ static void shrink_zone_span(struct zone *zone, unsigned long start_pfn,
> 			     unsigned long end_pfn)
> {
> 	unsigned long pfn;
>-	int nid = zone_to_nid(zone);
> 
> 	if (zone->zone_start_pfn == start_pfn) {
> 		/*
>@@ -484,7 +473,7 @@ static void shrink_zone_span(struct zone *zone, unsigned long start_pfn,
> 		 * In this case, we find second smallest valid mem_section
> 		 * for shrinking zone.
> 		 */
>-		pfn = find_smallest_section_pfn(nid, zone, end_pfn,
>+		pfn = find_smallest_section_pfn(zone, end_pfn,
> 						zone_end_pfn(zone));
> 		if (pfn) {
> 			zone->spanned_pages = zone_end_pfn(zone) - pfn;
>@@ -500,7 +489,7 @@ static void shrink_zone_span(struct zone *zone, unsigned long start_pfn,
> 		 * In this case, we find second biggest valid mem_section for
> 		 * shrinking zone.
> 		 */
>-		pfn = find_biggest_section_pfn(nid, zone, zone->zone_start_pfn,
>+		pfn = find_biggest_section_pfn(zone, zone->zone_start_pfn,
> 					       start_pfn);
> 		if (pfn)
> 			zone->spanned_pages = pfn - zone->zone_start_pfn + 1;
>-- 
>2.47.3

-- 
Wei Yang
Help you, Help me
