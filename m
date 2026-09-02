Received: from mta0.migadu.com (out-108.mta0.migadu.com [91.218.175.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5CA4AC156
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788367292; cv=none; b=lCxMiqjI48I8qmcUqd5EoRzTKEfeZw7QxjWIdAc3j5dQdqeludBX0gePKZubavB+Uit3g0ISo7hcDNfLN48fH2d+yH58zVXpEY02uxCDho78PcT2AtCrzWaJbMXZzNLYU7UBEnANwgHOMi9r7+85Pznz15Yfsl2n00fk3An6O1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788367292; c=relaxed/simple;
	bh=Ou4zikGxkHmecP2znZ+Jqd5Qm8DfcxsyZmVSinR4NLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sI2eK4pZGm+6rTPQ9DR5BxiQUBTLzjQmzsHf9g5+sk29QOYJnjEC2utciLNsQZJVCKUvo101FNPMGHHgaSXY8vkNh/5TmTbqW4PmDLU/3owRtVNBl4R3VZpvTCBFGlBB771hUgItyjVlT9o2TiY32sHQR+hCvPggIhdZshM/jv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HRgF1s/T; arc=none smtp.client-ip=91.218.175.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HRgF1s/T"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Ou4zikGxkHmecP2znZ+Jqd5Qm8DfcxsyZmVSinR4NLg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788367284; v=1; x=1788972084;
 b=HRgF1s/TOMv9wBU5/2ufXbzeUgvcpXKsqefyMOBIEOgbvw/qAW2GsZO9ah7/agCQXgC/8MQl
 Qfus9sJ6ElMY97V69Z8mFT4WkM07pARQasNfRMFERES9MnSmrPRcolImayGNLu0OTwywaXHKnGB
 JN1NhzPfCTQm/PKal8nWNusA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 338eeb5a5200f8e7;
	Wed, 02 Sep 2026 16:41:13 +0000
X-Mizu-Trace-ID: 338eeb5a5200f8e7
X-Migadu-Flow: FLOW_OUT
Message-ID: <75232acb-6c87-4a1b-8f5d-c635a62ecff3@linux.dev>
Date: Wed, 2 Sep 2026 17:41:10 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mm: remove min_free_kbytes adjustment for THP
To: Nimrod Oren <noren@nvidia.com>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>
Cc: Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Brendan Jackman <brendan.jackman@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>, Hugh Dickins <hughd@google.com>,
 Nirmoy Das <nirmoyd@nvidia.com>, Dragos Tatulea <dtatulea@nvidia.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20260901190123.3511535-1-noren@nvidia.com>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <20260901190123.3511535-1-noren@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 01/09/2026 20:01, Nimrod Oren wrote:
> When THP is enabled, set_recommended_min_free_kbytes() may raise
> min_free_kbytes using a heuristic that scales with pageblock_nr_pages.
> Commit f000565adb77 ("thp: set recommended min free kbytes") added this
> heuristic to help keep pageblocks free and reduce fragmentation for THP
> allocations.
> 
> The recommendation scales poorly with larger base page sizes. With the
> default arm64 pageblock sizes, the contribution per eligible zone
> before applying the existing cap of 5% of low memory is:
> 
>   4 KiB pages:   2 MiB pageblock,   22 MiB per zone
>  16 KiB pages:  32 MiB pageblock,  352 MiB per zone
>  64 KiB pages: 512 MiB pageblock,  5.5 GiB per zone
> 
> Even with that cap, min_free_kbytes can reach excessive levels.
> 
> The automatic min_free_kbytes increase predates proactive compaction
> and many subsequent changes to compaction. Given those changes,
> increasing min_free_kbytes for THP by default is no longer clearly
> justified.
> 
> Remove set_recommended_min_free_kbytes() and all associated
> recalculation paths. With this policy gone, min_free_kbytes is
> controlled only by the page allocator's default calculation and the
> vm.min_free_kbytes sysctl. Users who want additional headroom may set a
> higher value via that sysctl.
> 
> Link: https://lore.kernel.org/r/20260831075635.2244437-1-noren@nvidia.com/
> Suggested-by: Michal Hocko <mhocko@suse.com>
> Signed-off-by: Nimrod Oren <noren@nvidia.com>

Could this negatively affect x86 and arm64 systems using 4 KiB
pages?

This change reduces the free-memory headroom available for
compaction. That could reduce THP allocation success, especially
for GFP_TRANSHUGE_LIGHT allocations, which fail quickly rather
than performing direct reclaim or compaction.

With defrag=madvise, faults in MADV_HUGEPAGE regions may instead
incur additional synchronous reclaim or compaction latency.
khugepaged itself will not start later, but it may encounter more
fragmented memory and perform more work or fail more often.

I think it would be good to provide THP success, fallback, and
allocation-latency results under memory pressure for x86 and
arm64 4 KiB systems?

