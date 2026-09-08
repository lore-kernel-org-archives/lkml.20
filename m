Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8487D2E06ED
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 01:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788832221; cv=none; b=qHr0aJRw53tNxJsT0MntO/9/tK87Rq/hgkldH0Pz2bA6xZ4dvR13DFKv+0MQq2Nea5zVZT01SNCgwN5gxxh3IDnSLScylV5a4dGKo+o8JC9ohv6E20TRsHuL/N6d2qYzJbIe2MUYbMiXZrjq40OnRGW2cYWeBz1ERmOIcTTTuGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788832221; c=relaxed/simple;
	bh=KOXQoSFa6lpwArsJl2+jsdggsoAwGCJYTei30gn0AIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rcxT6XagsjjQhul5uZg5VtIMA8TtiCj7J7UFX9keT+X/pzqUTMx32NsTkUsltcEP6opwzv/KecoF4dm6WXUas1qHQyzv2NkR/Yw9YMMYXao8sZZXsXmk3q1dN/L/f9uMt3Px/Ar0r8sKHeLXq+26BcGzKIV4OhxBKoI1EmoZE/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Tc0UhNC5; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Tc0UhNC5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=HrOK81VCA7fdgvtJBnT3Cwz5ib3t+eGo39+sr78CpkU=;
	b=Tc0UhNC5hIH1d5x7kg4j1eB92e1Sy1vrQ4jkFv7NMJIYzpyHb32lvmm8iMKepU
	WKRoyUYEvjgLH3pazYKaYBMmyoFeAQsLj4kk40+RD8f4p6Nj0DX7hu/wAbCnaxbq
	E7naBSIa3JoNN9TOsqG/iDimM9pGLf5x5QNQOB2zdsqvA=
Message-ID: <19023334-9550-478b-bdce-3631de0b1d78@163.com>
Date: Tue, 8 Sep 2026 09:49:12 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH resend 0/2] mm: vmscan: fix scan overshoot and ineligible
 folio scanning
To: akpm@linux-foundation.org, liuye@kylinos.cn, hannes@cmpxchg.org,
 mhocko@kernel.org, david@kernel.org, ljs@kernel.org, hughd@google.com,
 mgorman@techsingularity.net, yang@os.amperecomputing.com
Cc: zhangqiuhao@huawei.com, wangkefeng.wang@huawei.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Wupeng Ma <mawupeng1@huawei.com>,
 mawupeng1@huawei.com
References: <20260901084706.3784449-1-love_goo@163.com>
From: john <love_goo@163.com>
In-Reply-To: <20260901084706.3784449-1-love_goo@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCXzN+ZaZ9q03CQBQ--.21762S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGF1UCFyfCrWkKw43XrW7XFb_yoWrKr43pF
	ZxGr93tw18JFWayasIq3W0gFyY9w48GFW5XF4fWw17uw15JFyI934DKw4UZFWxGrs8uFyY
	qr4UGwsruF4UJ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UrcTQUUUUU=
X-CM-SenderInfo: 5oryvsxjrrqiywtou0bp/xtbC6xoDO2qfaZq2mgAA3j

Hi, Maintainers

   kindly ping.

在 2026/9/1 16:47, john 写道:
> From: Wupeng Ma <mawupeng1@huawei.com>
>
> Rebase to the latest v7.3-rc-1.
>
> These problems only surface when reclaim targets a lower zone
> while the LRU holds folios from a higher zone.  Normal userspace
> allocations go to the highest zone.  The zone-skip branch stays
> dead under typical loads.  Lower-zone-pressured configs (DMA32
> module allocations, memory-constrained devices) hit the issues.
> They inflate scan cost and delay the OOM.
>
> shrink_lruvec() drives reclaim in SWAP_CLUSTER_MAX (32) chunks, but
> isolate_lru_folios() may scan far more than that per call on a single
> LRU.  The excess is never charged back, so shrink_lruvec() keeps
> rescanning the same folios round after round.  When reclaim targets a
> lower zone, the same scanner also keeps walking zone-ineligible folios
> that can never satisfy the allocation, inflating nr_reclaimed into a
> false progress that delays the OOM.
>
> This series fixes both:
>
>    [1/2] Charge the isolate overshoot against the scan quota so the
>          next round skips already-scanned folios.
>    [2/2] Stop scanning once too many zone-ineligible folios have been
>          skipped, instead of force-isolating them.
>
> Background
> ==========
>
> We observed slow, unexpected OOM behavior during extreme stress testing,
> and while digging into the reclaim code during that analysis we spotted
> these latent risks in isolate_lru_folios() -- the overshoot never
> being charged back, and the force-isolate path on lower-zone reclaim.
> The concerns below are the ones surfaced from reading the code, then
> confirmed by constructing the situation deliberately.
>
> The problem only appears when reclaim targets a lower zone while the
> LRU holds folios from a higher zone:
>
>    - reclaim_idx points at DMA32/DMA (the triggering allocation asked
>      for a lower zone, e.g. __GFP_DMA32), and
>    - the LRU holds folios from a higher zone (Normal/Movable).
>
> Normal userspace allocations go to the highest zone, so reclaim_idx
> never points below it and the zone-skip branch is never taken.  It
> needs a real lower-zone allocator to drain that zone below watermark;
> that is also why it went unnoticed upstream -- the 1c7b17cf hard-lockup
> fix that introduced the force-isolate path was found only on a ~1 TB
> box running DMA32 module allocations.
>
> Impact
> ======
>
> Reproduced on x86 QEMU, 7.2-rc6, with a kernel module doing
> __GFP_DMA32 allocations to drain DMA32 below watermark (LRU folios
> sit in Movable):
>
>    - A single isolate_lru_folios() call scanned 32794 pages and took
>      25 (32769 skipped): 99.9% wasted on ineligible folios.
>    - Across one run, isolate was called 339 times, 140-165 of which
>      isolated nothing (taken=0, pure empty scans).
>    - shrink_lruvec() charges only the 32-page quota per round and
>      never refunds the overshoot, so the same skipped folios are
>      rescanned round after round.  vmstat on a memcg OOM path:
>      pgscan_direct / pgsteal_direct = 2836624 / 112719 = 25.2x
>      (isolate -> shrink_folio_list returns the folio -> isolate again).
>
> Once max_nr_skipped hits SWAP_CLUSTER_MAX_SKIPPED, the current code
> force-isolates the remaining ineligible folios.  On the inactive LRU
> they reach shrink_folio_list() and get reclaimed though they can
> never satisfy the allocation, inflating nr_reclaimed and resetting
> no_progress_loops in should_reclaim_retry(), delaying the OOM.
>
> A/B results (same .config, md5-identical):
>
>                            baseline    patched
>    empty scans (taken=0)   140-165         0
>    isolate calls               339         7
>    total pages scanned      343711      3140
>    single-call max scan      32794      3104
>
> Empty-scan 0 is the stable evidence (holds every run).  The
> pgscan/pgsteal ratio is volatile (baseline 56-26675x, patched
> 65-1324x, ranges overlap) and is not relied on alone.
>
> Caveats and reproduction
> ========================
>
>    - Triggering needs a lower-zone-pressured box.  To confirm the code
>      analysis, the situation was constructed on a small x86 QEMU VM
>      (1500M, CONFIG_LRU_GEN=n) with kernel cmdline
>      `movable_zone=DMA32 kernelcore=256M` (DMA32 small, Normal empty,
>      Movable large), then a kernel module doing
>      `alloc_page(GFP_DMA32)` drains DMA32 below watermark.  LRU folios
>      sit in Movable and are zone-skipped while reclaiming for DMA32.
>      Observed via the `mm_vmscan_lru_isolate` tracepoint and
>      /proc/vmstat (pgscan_direct, pgsteal_direct).
>
>
> Wupeng Ma (2):
>    mm: vmscan: charge isolate overshoot against scan quota
>    mm: vmscan: stop scanning ineligible folios after max_nr_skipped
>
>   mm/vmscan.c | 48 +++++++++++++++++++++++++++++++++---------------
>   1 file changed, 33 insertions(+), 15 deletions(-)
>

