Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9132931C7
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789623329; cv=none; b=p5MvRmm013Q3dLXx02sjnzqnbzUM7G0w80yedaUbxMszdHjWuNoUSQCZKooxor7PMifkgBdHeNx4vSIxaU5gy8T3STuPBXVSvpC8sJb+1FZbvHNI8SU17lxxCAWqc6krXAsg5bLAaSYvSxFVkW2wLvl2MlVJmVOB+XIJJwDlpV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789623329; c=relaxed/simple;
	bh=LDoaXxYyXuD8LClMN5+HnZQcP+VuNNaN4IVCaalDO5o=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=crA/c3Zc9j5z3ZlJrZYpF0Gk1Px3cqOvZIqe0aKCd0J29EKuKOQrahIXf33hH8hvVkIv7l1g+Cr+ogOxsIPvVpfA957XweQD5v/EE0hg7FeQ57Qc+3ZMOheaMOJHaYMo/W8CDMg16DDDy5Qs1sT2xOlawGOEe0ncUs4lM1QeOIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=sRFmYT6o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="sRFmYT6o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EBF51F000FF;
	Thu, 17 Sep 2026 05:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789623327;
	bh=5LDe9JBY33kVRmTAOxxfbfg2OmHYv79TUa9VIuLFDDA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=sRFmYT6oG5XNkNhzD4PX0oeq57NPguBwfSqG4ah+CHJSstWgg5SOHFilDgkzZK/RO
	 X3w+VcDuaWccad5MKLqlsNrO7mXkMPkKpLYmFafSeU50BpVU/e2z/OmI60wQNuRdBI
	 nboJ6Zxsil7L3eTvARfiCmr38fVTreIOGf7ruykg=
Date: Wed, 16 Sep 2026 22:35:25 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Gregory Price <gourry@gourry.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
 david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
 ziy@nvidia.com, baolin.wang@linux.alibaba.com, nico.pache@linux.dev,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 lance.yang@linux.dev, usama.arif@linux.dev, kas@kernel.org,
 matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com,
 byungchul@sk.com, ying.huang@linux.alibaba.com, apopple@nvidia.com,
 jannh@google.com, pfalcato@suse.de, osalvador@suse.de, hannes@cmpxchg.org,
 raghavendra.kt@amd.com
Subject: Re: [PATCH v2 0/4] sched/numa: stop VMA scan filters from gating
 promotion
Message-Id: <20260916223525.65ae1628b1457a716efc298f@linux-foundation.org>
In-Reply-To: <20260911001826.2109390-1-gourry@gourry.net>
References: <20260911001826.2109390-1-gourry@gourry.net>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Sep 2026 20:18:22 -0400 Gregory Price <gourry@gourry.net> wrote:

> NUMA balancing uses hinting faults for both task placement and memory-tier
> promotion. Several filters designed to avoid unproductive socket-placement
> faults can also prevent promotion.
> 
> Read-only file mappings and VMAs without recent PID activity may never be
> scanned, while lower MM layers reject some shared folios. Hot memory in
> these mappings can therefore remain on a slow tier indefinitely.
> 
> Separate promotion-only scans from socket-placement scans.
> 
> MM_CP_PROT_NUMA_PROMO_ONLY carries that choice for one protection walk, so
> the PTE and PMD paths can restrict hinting faults to promotion candidates.
> Keeping this transient state in the protection flags avoids per-mm state and
> its associated lifetime, concurrency, and VMA identity problems.
> 
>   - Allow eligible shared folios to be promoted to a fast tier.
>   - Scan read-only file mappings and PID-inactive VMAs for promotion
>     without re-enabling placement sampling.
>   - Track the last placement scan separately so promotion-only scans
>     cannot postpone the existing placement-starvation fallback.
> 
> The series is ordered as follows:
> 
>   1. Add promotion-only NUMA protection walks without changing behavior.
>   2. Permit eligible shared folios to be promoted to a fast tier.
>   3. Scan read-only file mappings using promotion-only scans.
>   4. Scan PID-inactive VMAs for promotion and account for placement scans
>      separately.
> 
> Tested on a host with 768GB/256GB DRAM/CXL.
> Ran 2 ~430GB database workloads with large (>300GB) shmem VMAs.
> 
> Before change:
>   - 150-200GB/s DRAM bandwidth usage
>   - 40-45GB/s CXL bandwidth usage (maxed out)
>   - request latencies over 5ms (longer tails)
> 
> After chage:
>   - 250GB/s+ sustained DRAM bandwidth usage
>   - ~10GB/s sustained CXL bandwidth usage
>   - request latencies 800us-2ms.
> 
> Functional observation:
>   A 20 GB hash table VMA that previously remained entirely on CXL was
>   split evenly between DRAM and CXL after the changes - and tier
>   residency tracked hotness.  This was previously affected by the
>   stavation issue caused by the "unaccessed VMA" filter.

This seems very significant?

Why cc:stable and Fixes:?  Is this something which ran at these sorts
of speeds before the offending commits?

