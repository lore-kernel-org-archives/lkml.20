Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DF44CA797;
	Wed, 30 Sep 2026 11:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767586; cv=none; b=ORXP4HLKvy+4AhpVVa3xsmSZr1yyLUaxrfA7T/GRGhCKzT9psPe/XFXfr23VTnmNCkReppHe71NkqLH5GSeL1wPvkq9PRPG6OvEtsXMhED1xSQHZQBFMzIDQGZCmpegaoPagRLO5tg+10R+1dsarKetLScLYohrc55WXF9iGWCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767586; c=relaxed/simple;
	bh=QNibcMkUZFEoDmU9a76mge/qlbLPlBG4AmiX6t1Tbn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oIsCOcc4G1FvY/PaSzukTMA9HE1SOLLLtdjPmpUHy++hB/wRn1FU8BPhyeiUMGFN7y0zQbXMp4UI0ALSSmsplwMAe0Ch1IIImKhAhfXoKDeoqCgOzg2OgOY/cIiJTmnru6ou/k8O5ktDfMhgMVrifSn2EXV4UmUwTNTRyjWJqWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lzBmmt1Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lzBmmt1Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 341601F000FF;
	Wed, 30 Sep 2026 11:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790767584;
	bh=TQupl8eDsCF6/sGS+B8O0v2tQta8e38EjGU/FlwQXsQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=lzBmmt1Q/FAST0Wi2RY1i62DiQEBygHqjx2v8wnuJcl6ICW0Ps6adlK6+EWb+vMiE
	 VodX83Zpcs2rnuidX3ntm63FJyCo0vyPZUL3ViPdt9K9iX6TEDe9/ZHPb6lTecB6zZ
	 lpLqeSr46jR/I3pbDE9aczVttQaeIcFU0oV+q+LvThoS1uS4fKWfPbpbjU/P3cIOnh
	 c0YyVdaA6UKNbGHNcIutWDdJI6JyHyLtrp4gwr/VX8SpPGURLPUzpR26GjqLlTvxBM
	 Ae9F6JY2QbfpHpdO/n6qhnjrDn+mWRke1TKRwEID2WI5lUTKAVNSv2iAGoq0yejX5s
	 pEzP3kv9kjHCA==
Message-ID: <cfdcaaa3-a9e7-4352-ab01-4922ebb8e0c9@kernel.org>
Date: Wed, 30 Sep 2026 13:26:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/numa_balancing: allow migrate on protnone reference
 with MPOL_WEIGHTED_INTERLEAVE policy
To: Li Zhe <lizhe.67@bytedance.com>, akpm@linux-foundation.org,
 ljs@kernel.org, liam@infradead.org, rppt@kernel.org, mhocko@suse.com,
 corbet@lwn.net, skhan@linuxfoundation.org, ziy@nvidia.com,
 joshua.hahnjy@gmail.com, gourry@gourry.net, ying.huang@linux.alibaba.com,
 apopple@nvidia.com
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260930072617.64665-1-lizhe.67@bytedance.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260930072617.64665-1-lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/30/26 09:26, Li Zhe wrote:
> MPOL_WEIGHTED_INTERLEAVE is useful on tiered-memory systems because it
> can seed a workload's new allocations across fast memory and slower
> capacity memory according to a configured ratio.
> 
> That initial placement is useful for workload managers and orchestration
> systems.  They can take the amount of fast memory and slower capacity
> memory on a machine into account before starting a workload, and choose a
> weighted policy that seeds the workload across the tiers at allocation
> time.  This avoids starting from an all-fast or all-slow placement and
> then relying on promotion or demotion to reshape a large working set.
> 
> After those pages have been placed, however, the policy cannot currently
> opt in to migrate-on-fault placement.  set_mempolicy() and mbind()
> reject MPOL_WEIGHTED_INTERLEAVE when MPOL_F_NUMA_BALANCING is specified,
> so memory tiering cannot promote hot pages that were initially placed on
> the slower nodes by the weighted policy.
> 
> Initial placement is only a starting point.  Pages initially allocated on
> fast memory are not necessarily the long-term hot pages, and pages
> initially allocated on slower memory may become hot as the workload's hot
> set changes.  The policy therefore needs to be able to combine weighted
> initial placement with memory tiering's NUMA fault based hot-page
> promotion.

Ok, so memory allocation will respect the weights but balancing will ignore
them? That really sounds rather odd to me.

And I assume that was the reason why we might have disallowed the combination:
it turns a weighted mechanism into an unweighted mechanism.

So are we really sure these semantics that you would essentially set in stone
here are the semantics we want? (ignoring weights)

-- 
Cheers,

David
