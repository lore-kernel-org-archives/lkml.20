Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58490331EC0
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788181987; cv=none; b=APgl08edwR5Hn42DRKW+s7K5rvplJw/TAJKHjpINh5PNkuQJlr4RRhQLowjG3/Ru1GC5T09FVJjU/ysRl+dzdpwrnUADN8xnVp+TpqQXy7bnDRElG181SzkPSMA6aQsQru3uK/ib2j/SEzutQSgCA1lemMyd3tJMuguF+nIEPUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788181987; c=relaxed/simple;
	bh=jr7bAeHGUjJakE0Ol1IFo91skAoVHFLYkiKLxwwKXYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iHnEbwfsvCFGzPC+5fj/UqUJ2e66K9N7p1P7UuJO1dLqxP+lClly0xAHudNI5Zc0y1byXmI3yAHthORGmB4yqJw6K8pWhRUmdvS55aZubQZNcX0rIseA7HxNSrxam/lHdtuFQhaHjhBrwcnAUc3LIxDFRkoqhqHzdmuEQTpRtO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=KPceeqwj; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KPceeqwj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QhaSwmeDZX+FhVbqZef/6aoKxmBjWUBVyUihTtoeWgo=; b=KPceeqwjCU2Fbvj/fap1K6JGrk
	VteOYqIzCZNBPGtbM43FSLgWNd2edxK+1Vs92twpxayUN6CDSPs6CvaEO6No61AnEAx2V9aHcyTy4
	ghxRdltlbsAddchl2mSxeMBFP1jrO1O2cMTmr2a821ZcWWQjRIBIaR2cLVvV/Lh0iwZ4yuBtcrPLP
	BXRK9RaEe7j2+ndGqH6JdmkD0e3B7lkryDd0GDcgMorqUzGpt37NsR/Gj38ICFYydN+M9Qt9GFoHH
	lGqihR/t1jrONnRcOO1qkrJJyQsLjVIWLYX1eKo4KZJfSLkaxRisPNNBEYh2t2NR1ELbMF3J3X24T
	OHbql/DQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x11ob-00000009sFC-353M;
	Mon, 31 Aug 2026 13:12:46 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 918B9300E7E; Mon, 31 Aug 2026 15:12:44 +0200 (CEST)
Date: Mon, 31 Aug 2026 15:12:44 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Jianyong Wu <wujianyong@hygon.cn>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Chen Yu <yu.c.chen@intel.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Phil Auld <pauld@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, jianyong.wu@outlook.com, zhongyuan@hygon.cn,
	huangsj@hygon.cn, wangfengyu@hygon.cn, yingzhiwei@hygon.cn,
	justin.he@arm.com
Subject: Re: [RFC PATCH v2 04/23] sched/topology: Introduce a method to
 calculate the llc distance
Message-ID: <20260831131244.GJ4120091@noisy.programming.kicks-ass.net>
References: <20260827122816.756234-1-wujianyong@hygon.cn>
 <20260827122816.756234-5-wujianyong@hygon.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827122816.756234-5-wujianyong@hygon.cn>

On Thu, Aug 27, 2026 at 08:27:57PM +0800, Jianyong Wu wrote:
> The previous patch addresses NUMA inter-node distance handling. This
> patch shifts focus to the LLC layer and introduces a scheme to compute
> pairwise distances between sibling LLCs inside one NUMA node.
> The calculation only guarantees distinct distance values for all peers
> when viewed from a single reference LLC; it does not enforce globally
> unique distances for every arbitrary LLC pair on the node.
> 
> One valid calculation scheme is defined by the formula below:
> 
>   dist(LLC1, LLC2) = (rank1 + rank2) % k + 1
> 
> Constraints: LLC1 and LLC2 must reside on the identical NUMA node.
> rank1 = local index of LLC1 within its node; rank2 follows the same rule.
> k = total count of LLCs available on the node.
> 
> The formula never yields zero, so diagonal self-distance entries are
> explicitly hardcoded to 0.
> 
> For demonstration, consider a NUMA node with four LLCs (local ranks 0~3):
>         LLC0    LLC1    LLC2    LLC3
> LLC0    0       2       3       4
> LLC1    2       0       4       1
> LLC2    3       4       0       2
> LLC3    4       1       2       0
> 
> Sorting each matrix row in ascending order generates a unique LLC affinity
> sequence, which drives thread migration policies implemented in follow-up
> patches.

Aah, now I see. I got confused by your sched_cache_node_distance naming,
and thought it was cache-to-cache distance.


