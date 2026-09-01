Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED0E38F258
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788252512; cv=none; b=f1uriucIfThvMJDqH9+jHfaf4X4vM2IacKJxYeGWcFBSiaiQqS8lm/q7FQ8nFSfDe4oe85spBLFuuRxsArV0qwvjPSzwjiT8i9ZpadRmt9I3dxAuI40K3PSMPR/c6oIBIIq8veEVb3nFVJIJROJzdtPQJxy9nxonkjiAIxCTWlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788252512; c=relaxed/simple;
	bh=x/2IRXHyPLBdt5scPDivOgyOQLAH1T6Fhau5cc5Hh4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LLHG060jqN3YyTAdqZ27tvvdfX1qeiO++BxAoSkEg4dws7bsTG5uLRPbYe11XXUMgQrqtaliKGNfeeMq6a9fvW1HqSYEwUw8Wmsazhb2u62jQ1Q00vMwWfafsuuLSRTEJhWriw4HlVwH3XJ4SXCvKMdy1jSBzGOMqhkqFhcJzGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=crpT1F+U; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="crpT1F+U"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rpu/fdT1/zQmBW2aWFatHbtf3Lbyi0UgKBAQFFYR+/8=; b=crpT1F+UAX0B64FPtk3BPp45rL
	WOezknIaCCTAx8c0mbtWllpYwAhnPrEUj1Dw2yNcqHBJoMNNsoXvgyopZ3oE5E46OnA3TV5aLsCmf
	qjtj9YFWseWAVp7NdLvBthCj+SJ/DYkji7LJsRv8jbMDxUtT0co6JL8UDEivWcGM/wKahhwf+kTV/
	Aa9oEEuBOBJ7/KuIIkmkMUQ+ACck6r+vLqUbOaqngRlUHX7K0/PIiv/0uuecPishpyR8Y8ArkXiKY
	CsxDpBdAC1n9+G5DTQTKvvxZq249yEn1SO06VMNWiQtEOaz752NQZLpfuZElaZgfORuC0MIsJ+VBd
	jq38t8rw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1K9y-0000000AlQg-2bQH;
	Tue, 01 Sep 2026 08:48:03 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C3B5E30031E; Tue, 01 Sep 2026 10:48:00 +0200 (CEST)
Date: Tue, 1 Sep 2026 10:48:00 +0200
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
Subject: Re: [RFC PATCH v2 02/23] sched/topology: Introduce a NUMA distance
 matrix with unique distance values
Message-ID: <20260901084800.GI4121339@noisy.programming.kicks-ass.net>
References: <20260827122816.756234-1-wujianyong@hygon.cn>
 <20260827122816.756234-3-wujianyong@hygon.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827122816.756234-3-wujianyong@hygon.cn>

On Thu, Aug 27, 2026 at 08:27:55PM +0800, Jianyong Wu wrote:
> Builds a refined node distance matrix based on the raw NUMA distance matrix
> provided by BIOS. The refined matrix preserves the relative ordering of
> NUMA distances, while assigning distinct distance values to node pairs that
> originally shared identical distances within each matrix row. This matrix
> is exclusively used for cache-aware scheduling and has no impact on existing
> NUMA topology logic such as sched domain construction.
> 
> For example, consider a system with 4 NUMA nodes. The raw BIOS-provided
> distance matrix may look like this:
> 
>         NODE0  NODE1  NODE2  NODE3
> NODE0   10     20     20     30
> NODE1   20     10     20     25
> NODE2   20     20     10     20
> NODE3   30     25     20     10
> 
> Multiple duplicate distance values exist within each row. After the
> deduplication step, the refined distance matrix becomes:
> 
>         NODE0  NODE1  NODE2  NODE3
> NODE0   10     15     20     30
> NODE1   15     10     12     25
> NODE2   20     12     10     15
> NODE3   30     25     15     10
> 
> All entries in each row are now unique, while adhering to two core principles:
> 1. The relative distance ordering from the original matrix is preserved.
>    For instance, original distance(NODE0, NODE1) < distance(NODE0, NODE3),
>    and this relative relationship is retained in the refined matrix as well.
> 2. The matrix remains symmetric across its main diagonal. Maintaining
>    symmetry is critical to guarantee consistent pairwise node distances.
> 
> Each row of this refined NUMA distance matrix is sorted in ascending order to
> generate a unique per-node affinity sequence. This sequence will guide
> thread migration logic introduced in subsequent patches.

Hmm, I wonder if __build_all_zonelists() wants to use this, rather than
the unmodified distance table. This would ensure the node fallback order
is distinct between nodes.

