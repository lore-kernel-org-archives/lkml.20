Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D069D43DA59
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382766; cv=none; b=F48NOXHRI9tTcK7aVqOj53fv+Cu4F3gzk27K+2+18ZUO+U1mSaveV1nBjdNah1c8JZIdL49A74EBs0LGzoo8+xegE/AvP11iOn70KLsOjXfjfLVTfbvk010FymGxL5a+T8rWU3Npmd4ZWgnP/ya7xdHxFpePb7/nzT2GWjIbx1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382766; c=relaxed/simple;
	bh=DJozdmLe72J5iSYnZN019M9Nya01TV4WxKVfcIOGR/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Om/APHYi7ekTm3zFfyOiGpbE5/VEtQXc+39VS6s4TqW2VErXVrdKdmWwGgLZL7MBpvyc4hsxIGJCIlq79oNuMM5k3HDB5iOp/ae2EnpTzGjQ6mPJPSFy7scWkQxf50qRPN8XTPkMG5szTruRbWjIm2Kst8LepuSJMJNf8THXrjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UpMcaT+e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UpMcaT+e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD77E1F00893;
	Mon, 14 Sep 2026 10:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789382760;
	bh=0hmu5z+eGTrnEF+isJsclBbqWJSTluvRzEiyOmJ/sGc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=UpMcaT+eBECzjsINizlIEKJdaADhIHQsa7usGEGZ+wpyw/sU6X/Yvgw6bf8m/8gMs
	 F7mt8ynEYSwvsePo1oNBArXMOg1GSXCebj9SkjcU0T2rnSCnsD4odhfA2Bom9WchMY
	 2JmuIuJ6RPGQANeE6zSjAIAQ6Ut363/jQ+yyejxyiCFq8A58EY6eByLR7DVQBsdyss
	 cDEnANAJRPwsexTbXjps5UC75cS5zpTRyO92bZUiadIFDejzqxkiNRA7eA+8nbYt05
	 kByFwQvRJ4lP9Z4H2i/jzphJUGX7tCVdcWd+KyLw71RyhEAw3em7dujFY+rTQEuJeA
	 LaeHg1bBVfSXg==
Message-ID: <88ded4c5-9181-41fe-9f31-e76910e58f85@kernel.org>
Date: Mon, 14 Sep 2026 12:45:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/2] mm/memory_hotplug: optimize zone contiguous check
 when changing pfn range
To: Yuan Liu <yuan1.liu@intel.com>, Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>, Wei Yang <richard.weiyang@gmail.com>
Cc: linux-mm@kvack.org, Nanhai Zou <nanhai.zou@intel.com>,
 Chen Zhang <zhangchen.kidd@jd.com>, Jason Zeng <jason.zeng@intel.com>,
 Chen Yu <yu.c.chen@intel.com>, Pan Deng <pan.deng@intel.com>,
 Tianyou Li <tianyou.li@intel.com>, linux-kernel@vger.kernel.org
References: <20260914072929.1883794-1-yuan1.liu@intel.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260914072929.1883794-1-yuan1.liu@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/14/26 09:29, Yuan Liu wrote:
> This series introduces a pages_with_online_memmap member into struct
> zone to avoid pageblock-by-pageblock scans across the entire zone and
> improve memory hotplug performance.
> 
> Approach
> ========
> Add a new zone member, pages_with_online_memmap, that tracks the
> number of pages within the zone span that have an online memory map,
> including present pages and memory holes whose memory map has been
> initialized and for which pfn_to_online_page() succeeds.
> 
> For early boot memory, pages_with_online_memmap is calculated in
> memmap_init_zone_range(). PFNs initialized by memmap_init_range() are
> included in pages_with_online_memmap, and hole PFNs for which
> pfn_to_online_page() succeeds are also counted in
> init_unavailable_range(). For hotplugged memory,
> pages_with_online_memmap is updated through adjust_present_page_count(),
> which is called during memory online and offline operations. When
> spanned_pages == pages_with_online_memmap, every PFN in the zone span
> has a valid memmap entry, so pfn_to_page() can be called for any PFN
> within the zone span without an additional pfn_valid() check.
> 
> The counter may temporarily undercount when pages with an online
> memory map exist outside the current zone span. This can only happen
> during boot, when initializing the memory map of pages that do not
> fall into any zone span. Growing the zone to cover such pages and
> later shrinking it back may result in a value that is too small.
> This is safe, as it merely prevents detecting a contiguous zone.
> 
> The contiguity check using pages_with_online_memmap is stricter than
> the old pageblock-by-pageblock scan. The old set_zone_contiguous()
> iterated at pageblock granularity via pageblock_pfn_to_page(), so a
> zone could be marked contiguous even if a subsection-sized hole
> existed within a pageblock. The new check requires
> spanned_pages == pages_with_online_memmap, meaning every PFN in the
> zone span must satisfy pfn_to_online_page().
> 
> Performance
> ===========
> 1. For VM hotplug performance data, please refer to Patch 2.
> 2. This series also benefits CXL hotplug. Performance results are
>    as follows
>    https://lore.kernel.org/all/20260409023552.GA2807@AE/
> 
> Tested cases
> ============
> 1. Hotplug/unplug correctness with both online_movable and online
>    policies, including partial unplug, middle-block offline gaps, and
>    edge-block span shrink.
> 2. Large scale (256G/512G) plug/unplug performance.
> 3. Boot-time subsection holes (aligned/unaligned, in-zone and
>    cross-zone) with correct pages_with_online_memmap accounting.
> 4. kernelcore=mirror: verified no overcounting.
> 
> Patch overview
> ==============
> Patch 1 makes shrink_zone_span() more robust when memory/hole boundary
> falls within a subsection. It checks the full subsection range to avoid
> incorrectly shrinking the zone span during memory unplug.
> 
> Patch 2 introduces pages_with_online_memmap to replace
> pageblock-by-pageblock scans across the entire zone for zone contiguity
> checks.

Sashiko seems to be heavy. I'll wait some more to get more review feedback (and
an Ack from Mike on the mm-init things) before I'll pick this up.

-- 
Cheers,

David
