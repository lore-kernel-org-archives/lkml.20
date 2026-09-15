Received: from mta0.migadu.com (out-144.mta0.migadu.com [91.218.175.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFEB352001
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481368; cv=none; b=J6j9nXbG7euLU19w5VFUeaJaazc+FtsxwnBr3nutxlu1Jxn7HY1rAsydTKtqE4vIWxvxkZ8f8pHVjQN9R/EyGf96WxbsxXViQc2vk5HrysnV6bkInV2WK6QiB1q3/V42Qv8ZX3sqbjM6i1CFMNpfmUEzX0eyXbeK+FBfpaxllss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481368; c=relaxed/simple;
	bh=He79VwyqA/A7y/x2AwYJsg4nK7NmCJ5xYttTnGrxq40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m+KbtVDJEkDUTHEK+MH3D1EcPGCazVl1Hb1xDyA8VrW10qOEC+NCUJZppG87rhd5wJrNb2rtal1D0rnw4DZmYUEbKMgnkeSAR/IZUq31D3lWQ6PbdNHbOKYXvSERoXffOTInIobxDuMZHwI6UsgvGhWobHsm4HeBkB4ZgN3f8yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GyAX1npr; arc=none smtp.client-ip=91.218.175.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GyAX1npr"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=He79VwyqA/A7y/x2AwYJsg4nK7NmCJ5xYttTnGrxq40=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789481363; v=1; x=1790086163;
 b=GyAX1nprE2u4WRK6BSmX+y6OtJWsBeAkdITNlSRYy7b/+9ZMUKpZpJ7x23Jdr+Sst38GcmAg
 yrIYt0NuWDa1TWRWeLtGuMUhV3LdjrnZghJ7n9JvCa/Po+mtlUOPCGWAAnidsZLV7Xuu6yJZ9YU
 x+5k9gt7xzEiFXAwp5pbOkeA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 167173392c468344;
	Tue, 15 Sep 2026 14:09:23 +0000
X-Mizu-Trace-ID: 167173392c468344
X-Migadu-Flow: FLOW_OUT
Message-ID: <ae847e8a-8c16-4170-a18c-19adb1a50de2@linux.dev>
Date: Tue, 15 Sep 2026 15:09:16 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND v7 00/29] mm: PMD-level swap entries for anonymous THPs
To: Andrew Morton <akpm@linux-foundation.org>
Cc: david@kernel.org, chrisl@kernel.org, kasong@tencent.com, ljs@kernel.org,
 ziy@nvidia.com, linux-mm@kvack.org, ying.huang@linux.alibaba.com,
 Baoquan He <baoquan.he@linux.dev>, willy@infradead.org,
 youngjun.park@lge.com, hannes@cmpxchg.org, riel@surriel.com,
 shakeel.butt@linux.dev, alex@ghiti.fr, kas@kernel.org, baohua@kernel.org,
 dev.jain@arm.com, baolin.wang@linux.alibaba.com,
 Nico Pache <nico.pache@linux.dev>, "Liam R. Howlett" <liam@infradead.org>,
 ryan.roberts@arm.com, Vlastimil Babka <vbabka@kernel.org>,
 lance.yang@linux.dev, linux-kernel@vger.kernel.org, nphamcs@gmail.com,
 shikemeng@huaweicloud.com, yosry@kernel.org, qi.zheng@linux.dev,
 luizcap@redhat.com, kernel-team@meta.com
References: <20260914122950.3283997-1-usama.arif@linux.dev>
 <20260914203237.7cdfcd4c320470f4ae5cafd2@linux-foundation.org>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <20260914203237.7cdfcd4c320470f4ae5cafd2@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 15/09/2026 04:32, Andrew Morton wrote:
> On Mon, 14 Sep 2026 05:27:50 -0700 Usama Arif <usama.arif@linux.dev> wrote:
> 
>> When reclaim swaps out a PMD-mapped anonymous THP today, the PMD is
>> split into HPAGE_PMD_NR PTE-level swap entries via TTU_SPLIT_HUGE_PMD
>> before unmap.  This series introduces a PMD-level swap entry so the
>> huge mapping can survive the swap round-trip and do_huge_pmd_swap_page()
>> can restore the PMD mapping directly on swap-in, without waiting for
>> khugepaged to collapse the range later.
> 
> Thanks.  I'd describe this as an inevitable step along our thp journey.
> Has to be done sometime.
> 
> I'll await more review, especially of the core parts: pmd swap fault
> handler (#27) and swapout producer (#28).
> 
> And it's a 29-patch performance optimization without any performance
> testing results ;)  Is efficacy testing in the works?

I previously tested an older revision and reran the test this morning
with the current revision. I used vm-scalability's case-swap-w-seq
benchmark [1].

The test configuration was:

- 4 vCPUs and 4 GiB RAM
- 4 pinned workers
- 8 GiB NOCOW raw virtio swap, cache=none,aio=native
- zswap disabled; THP allocation and defrag set to always
- 6 GiB total anonymous working set
- 8 sequential write passes

Four workers repeatedly write the working set, forcing memory to be
swapped out and back in. The results below are the medians of five
interleaved runs per kernel, following one warm-up run:

Metric                           Baseline median   Patched median   Change
Aggregate benchmark throughput   584.3 MiB/s       2,408.9 MiB/s    +312.2% (4.12x)
Elapsed time                     85.43 s           20.72 s          -75.7%
Major faults                     1,814,699         228,466          -87.4%
Swap I/O rate                    1.02 GiB/s        4.10 GiB/s       +303.9%

The results look good as this is a swap-intensive workload.
It primarily demonstrates the reduction in swap-fault and page-table
overhead from preserving PMD mappings.

For long-running workloads, where I believe the series will shine, I expect
benefits from fewer TLB misses, less khugepaged work as well as less kernel churn
due to larger folios, although there aren't a lot of benchmarks to test that.
PMD swap entries also move us closer to eliminating page-table deposits for
anonymous THPs, which would provide memory savings.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/wfg/vm-scalability.git/tree/case-swap-w-seq

