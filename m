Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594421EB19B
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 10:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787999486; cv=none; b=P1blH4rRw5vGgHJvc+kJNSYXh1xGfx3bweslnfkVtPog5FR0ADLpPZvwiUWZO8KYNnOiyFZlMVTNQoFJ5qfpF6qvXHvq7jdQl+gByhp+3KCZwYdGlrqXJ7wJxoK9qIE6UGCy4/dafoL/yOhZMHEnez+k/ES/0qjcJmhBmdZyw7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787999486; c=relaxed/simple;
	bh=GU59R+u6UssUjS7ovlxbj5DThzjnDTV0xst/OUoyLYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e4262RBoOMz0lsbbxxSugDz/GGjiUxG5DjR5dNqSQAExgt2Zr/OEEp1OoY8YuFV2udXNhgB2W9axkbUBymms9dPvBWGh6XIif8fGM15HgPefAGH12eumUamaWxHmJ4ZphJtZ5WtGf8rBL3Y+h/R+2Xqrpdr02WF7gQ1I9qhImxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=amWIdUn2; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="amWIdUn2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tFeHJnfiLjvT405YufwKNGK1pvbaUZoRSpVuXj3avro=; b=amWIdUn2IrSzxEW/4ieYFSFbQq
	c4rzA83hgoB+DLp4iZ89dutx/2cbb4Uik5zsjnF38wqKpryyH3awkCkaRlBdx3m8M2h2ZfZI+zvgq
	JTPNWIM51nMK68U1wmM5+0/15Qa80UAI8GKKcQMMQG9nF/qbfbUsr+CzeQSL1qYtx2l2K33ebGyDh
	JufbhLS8tALhNOh6PYDkck4iNOWTkrPOPzVwM4fV0jP8Jg1kNSrSGGZE9fqznCyDIxNmBUq4jKWzn
	L0GXTuBt7fJ3ycBaOkTdJW2DbmDwQknDpqqyw5WCvJqU1QXSeQlpyYuqsk/Ftsro4qgXtyGgioSeG
	Pxpius6A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0GL1-0000000GLW0-1waY;
	Sat, 29 Aug 2026 10:31:03 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5D122300382; Sat, 29 Aug 2026 12:31:02 +0200 (CEST)
Date: Sat, 29 Aug 2026 12:31:02 +0200
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
Subject: Re: [RFC PATCH v2 01/23] sched/topology: Add llc_to_node() to
 translate LLC id to NUMA node
Message-ID: <20260829103102.GE776954@noisy.programming.kicks-ass.net>
References: <20260827122816.756234-1-wujianyong@hygon.cn>
 <20260827122816.756234-2-wujianyong@hygon.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827122816.756234-2-wujianyong@hygon.cn>

On Thu, Aug 27, 2026 at 08:27:54PM +0800, Jianyong Wu wrote:
> +static void rebuild_llc_node_map(int size)
> +{
> +	int *new_map, *old_map;
> +	u8 *seen_llc;
> +	int cpu, llc;
> +
> +	new_map = kcalloc(size, sizeof(int), GFP_KERNEL);
> +	if (!new_map)
> +		return;
> +	seen_llc = kcalloc(size, sizeof(*seen_llc), GFP_KERNEL);
> +	if (!seen_llc) {
> +		kfree(new_map);
> +		return;
> +	}
> +
> +	/*
> +	 * for_each_possible_cpu() revisits the same LLC non-consecutively
> +	 * under SMT (each node's LLCs are walked once per thread), so
> +	 * dedup by llc id via seen_llc[], not by comparing against the
> +	 * immediately preceding CPU's llc.
> +	 */
> +	for_each_possible_cpu(cpu) {
> +		llc = per_cpu(sd_llc_id, cpu);
> +		if (llc < 0 || llc >= size || seen_llc[llc])
> +			continue;
> +		seen_llc[llc] = 1;
> +		new_map[llc] = cpu_to_node(cpu);
> +	}
> +	kfree(seen_llc);
> +
> +	old_map = rcu_dereference_protected(llc_to_node_map, true);
> +	rcu_assign_pointer(llc_to_node_map, new_map);
> +	synchronize_rcu();
> +	kfree(old_map);

Could that not be: kfree_rcu_mightsleep(old_map); ?
