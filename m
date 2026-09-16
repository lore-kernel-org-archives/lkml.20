Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72BB3515E2
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789516813; cv=none; b=YDWRNrwc1aXoaPpj8dzPl0+H0bd9MrqlK0MhcI5UBusC4ScmexdlDDJ/g4dPZFVCj2OL7Y7Rp5VJ0tuCaId3a+ANvm1oaAFFNtPKfG1daNh+8sQoNG9rwJU0DOlU4Al2XjWM6z9owuBLvKGgdZa2qEp9AMIuypu4C8jfEvc6b8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789516813; c=relaxed/simple;
	bh=wFoZZKwbOpKMpCDvwWjaKGuo4zoC43xc4mt4ZOFBjZc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=aQFfvVU2t79zbCvOYGFhmYmRy3cfXXLfdxa7ylfiBm2uZPs28nEgvvlRmvjNB5HhSPni3fKnbzMNyfS14RKPPqK4OsI/D2f8HypVoYZGNIcTecfQNDMGx8/GYouUfbw8dXhjXfxonH+EZ8xltBbxmDh/4FNS2t/TXwJWOa9U0Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=1C59dYo6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="1C59dYo6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F96F1F000FF;
	Wed, 16 Sep 2026 00:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789516812;
	bh=lsG2UJoJMhrVhGOcp/RTa9rgqpxI7yatSzmwd8yhhxk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=1C59dYo66QV+RKUWZNkNSJKjp2seecbRk2ujMq+oeftUoRIcPPX+1yEcLeM93SJfK
	 jYQVNI7P5FG0EJ4uXrKQCUTc+hoLutKaGcdEzB46e0LhpElLl6z7MS+yfZX2XV3KbF
	 WNG9OJOwPzGbwY25294h3e7JSRzmaBn+ojJclNIo=
Date: Tue, 15 Sep 2026 17:00:10 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Usama Arif <usama.arif@linux.dev>
Cc: david@kernel.org, chrisl@kernel.org, kasong@tencent.com, ljs@kernel.org,
 ziy@nvidia.com, linux-mm@kvack.org, ying.huang@linux.alibaba.com, Baoquan
 He <baoquan.he@linux.dev>, willy@infradead.org, youngjun.park@lge.com,
 hannes@cmpxchg.org, riel@surriel.com, shakeel.butt@linux.dev,
 alex@ghiti.fr, kas@kernel.org, baohua@kernel.org, dev.jain@arm.com,
 baolin.wang@linux.alibaba.com, Nico Pache <nico.pache@linux.dev>,
 "Liam R. Howlett" <liam@infradead.org>, ryan.roberts@arm.com, Vlastimil
 Babka <vbabka@kernel.org>, lance.yang@linux.dev,
 linux-kernel@vger.kernel.org, nphamcs@gmail.com, shikemeng@huaweicloud.com,
 yosry@kernel.org, qi.zheng@linux.dev, luizcap@redhat.com,
 kernel-team@meta.com
Subject: Re: [RESEND v7 00/29] mm: PMD-level swap entries for anonymous THPs
Message-Id: <20260915170010.0667b6dee268fb6fb29a3fee@linux-foundation.org>
In-Reply-To: <ae847e8a-8c16-4170-a18c-19adb1a50de2@linux.dev>
References: <20260914122950.3283997-1-usama.arif@linux.dev>
	<20260914203237.7cdfcd4c320470f4ae5cafd2@linux-foundation.org>
	<ae847e8a-8c16-4170-a18c-19adb1a50de2@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Sep 2026 15:09:16 +0100 Usama Arif <usama.arif@linux.dev> wrote:

> 
> Four workers repeatedly write the working set, forcing memory to be
> swapped out and back in. The results below are the medians of five
> interleaved runs per kernel, following one warm-up run:
> 
> Metric                           Baseline median   Patched median   Change
> Aggregate benchmark throughput   584.3 MiB/s       2,408.9 MiB/s    +312.2% (4.12x)
> Elapsed time                     85.43 s           20.72 s          -75.7%
> Major faults                     1,814,699         228,466          -87.4%
> Swap I/O rate                    1.02 GiB/s        4.10 GiB/s       +303.9%
> 
> The results look good as this is a swap-intensive workload.
> It primarily demonstrates the reduction in swap-fault and page-table
> overhead from preserving PMD mappings.
> 
> For long-running workloads, where I believe the series will shine, I expect
> benefits from fewer TLB misses, less khugepaged work as well as less kernel churn
> due to larger folios, although there aren't a lot of benchmarks to test that.
> PMD swap entries also move us closer to eliminating page-table deposits for
> anonymous THPs, which would provide memory savings.
> 

Thanks.  Wow.

This doesn't look totally real-world but it's close enough to indicate
that real people doing real things will see nice benefits from this
change.  As expected - leaving post-swapin thp reassembly to khugepaged
was so lame.

Please add the above info to the [0/N] and maintain it.

(I'm itching to get this moving ahead, but we do need eyes on those
core bits).

