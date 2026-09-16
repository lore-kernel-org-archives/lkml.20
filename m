Received: from mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77A04E3781
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554212; cv=none; b=t4j0OQG5vAEQq2Pdnc8kpG+asKPXqWQJ1oK0MjLVsGHZx3lbV9Az6A5LTXWrw2dvMuZLApK1CJRxiR/hN8UMZ3/kxmIrNZieeoZafkbx6zlAD8J1g4UVvOcF/rI+d9SoKcI7HSwlPjddy1I1h+P/GyRX/gi/CHC1nNN14hF6hSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554212; c=relaxed/simple;
	bh=PT4zk2r1uBSOi61HrDnCALYdUMVvyDSIHnzcu3tFfUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RkZznItaCrJ71UbfuPeTe3edAutPzXinHFufs4vpv4Lc/rWyohxv9ua5VXPduDLI53QFgZHI6+qGhThcqob2XjL3FxbezkYgPuYIFwCaDHldwD8b0rFTf2U0RVLdtHmu68eMJ3ewQxG+UFJIHNeBQGgPcUzvm2ff2+weuxCLugc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Y+QNkmNS; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Y+QNkmNS"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PT4zk2r1uBSOi61HrDnCALYdUMVvyDSIHnzcu3tFfUY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789554168; v=1; x=1790158968;
 b=Y+QNkmNSQkBNQZUOK5mdRaepomyjNARR7qgsuJBWKzjTyCv5bziMJRQLw/gM1Pp8h6SW+EfR
 TXUCbAdLswbJHmVr4aIxcdvahIBoSXKy0BmU177uN+aA67mkr0JVRUt5HlnBziItM4Mb2O+0Vld
 44LeG8sih3IPQh7bg1+3FAlw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6d5276e9e29299c1;
	Wed, 16 Sep 2026 10:22:48 +0000
X-Mizu-Trace-ID: 6d5276e9e29299c1
X-Migadu-Flow: FLOW_OUT
Message-ID: <7666a248-4411-419f-a2ce-42a71a51126a@linux.dev>
Date: Wed, 16 Sep 2026 11:22:45 +0100
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
 <ae847e8a-8c16-4170-a18c-19adb1a50de2@linux.dev>
 <20260915170010.0667b6dee268fb6fb29a3fee@linux-foundation.org>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <20260915170010.0667b6dee268fb6fb29a3fee@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 16/09/2026 01:00, Andrew Morton wrote:
> On Tue, 15 Sep 2026 15:09:16 +0100 Usama Arif <usama.arif@linux.dev> wrote:
> 
>>
>> Four workers repeatedly write the working set, forcing memory to be
>> swapped out and back in. The results below are the medians of five
>> interleaved runs per kernel, following one warm-up run:
>>
>> Metric                           Baseline median   Patched median   Change
>> Aggregate benchmark throughput   584.3 MiB/s       2,408.9 MiB/s    +312.2% (4.12x)
>> Elapsed time                     85.43 s           20.72 s          -75.7%
>> Major faults                     1,814,699         228,466          -87.4%
>> Swap I/O rate                    1.02 GiB/s        4.10 GiB/s       +303.9%
>>
>> The results look good as this is a swap-intensive workload.
>> It primarily demonstrates the reduction in swap-fault and page-table
>> overhead from preserving PMD mappings.
>>
>> For long-running workloads, where I believe the series will shine, I expect
>> benefits from fewer TLB misses, less khugepaged work as well as less kernel churn
>> due to larger folios, although there aren't a lot of benchmarks to test that.
>> PMD swap entries also move us closer to eliminating page-table deposits for
>> anonymous THPs, which would provide memory savings.
>>
> 
> Thanks.  Wow.
> 
> This doesn't look totally real-world but it's close enough to indicate
> that real people doing real things will see nice benefits from this
> change.  As expected - leaving post-swapin thp reassembly to khugepaged
> was so lame.
> 

Yes, exactly! I initially left it out because case-swap-w-seq is a
swap-intensive synthetic workload and might not be a representative
application benchmark. Completely agree that lower reliance on
khugepaged will be a much bigger impact of this series. Unfortunately
I cant find any benchmark that would capture the affect of that.

> Please add the above info to the [0/N] and maintain it.
> 

Will do!

> (I'm itching to get this moving ahead, but we do need eyes on those
> core bits).

Thanks for helping move this forward!
