Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FDB33DEF7
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256749; cv=none; b=MH+hIYUAV7DWKBh0yrSGVG0+HLtP8Op0i+bQGK+Ej4GoRe13MPZeOqU4fNIoxm+i1DtXFXFvM4kLnEP4cytJyOyEw9DHQdWZpyFTPAb7zCKStdYN2HuqQZ7XyEEu1jKzPHomElYi5HgeuK2nNNhDC6HKKPGM3HQI0N+lGJUZotw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256749; c=relaxed/simple;
	bh=bKM3BOiWSK2/vxsVP7xGQiL6REe1Em7IJPUcnMsp9wQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GNOOYwrL4FDnd07fXjhVom/XUdNn5xdqFXuQPiQ9VVuJBWFUSmbqMGJaviyD+cCJBrISw7bezcyiH63swx4Ujj3bJoGLQE1NrWtn/abRSZyH+Qxy8mXa8ZumKgi3InjT3UPQ+bPpnk/lVJYAGn5aZR786eSy5H/qbbMFx+WVUyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=srenq8KZ; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="srenq8KZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8hcZZuGg5zfIoWr+fssOIfgBGeSQ/Wi7x8gohmj3py8=; b=srenq8KZEkMiu7sLjo+AjDKVWc
	JWGjbodqLNndMUAt5vV1X0QK7XqderFV4bT/xGQvJolaTyqV9m3pgfZ/Sb1FWhHpf3vxwgQ7nBDMP
	yMR61ZW0oBRYxbmBGaAJRmZmTGwN1rveoJxlg86zH2P69RhoWx8FzpkXCGPvVlO8vRXVPaJmzu5K1
	eFDPFy+9V9KN4nfS8uPfHuIG/R66HOg/IAzE0/EWPrV8cCjztYSF0q6KQXRVVVtPI9aFheOuRA6lP
	wrkASIwbBSCEzUathVj0D93Cl0gR5SjKsv/d5sUAv2JpkvzjLWqCbFDYq3rYwUlSk+R2062oEGwzI
	bZkTvAgw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1LGL-00000004tKQ-1oqx;
	Tue, 01 Sep 2026 09:58:41 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 895DD300578; Tue, 01 Sep 2026 11:58:40 +0200 (CEST)
Date: Tue, 1 Sep 2026 11:58:40 +0200
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
Subject: Re: [RFC PATCH v2 12/23] sched/cache: Introduce rq affinity gain
 calculation
Message-ID: <20260901095840.GR4120091@noisy.programming.kicks-ass.net>
References: <20260827122816.756234-1-wujianyong@hygon.cn>
 <20260827122816.756234-13-wujianyong@hygon.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827122816.756234-13-wujianyong@hygon.cn>

On Thu, Aug 27, 2026 at 08:28:05PM +0800, Jianyong Wu wrote:

>  #ifdef CONFIG_SCHED_CACHE
> +extern int max_lid;
>  /*
>   * Record the statistics for this scheduler group for later
>   * use. These values guide load balancing on aggregating tasks
> @@ -11998,6 +11999,174 @@ static bool update_llc_busiest(struct lb_env *env,
>  	 */
>  	return sgs->nr_pref_dst_llc > busiest->nr_pref_dst_llc;
>  }
> +
> +/*
> + * Get all LLCs that are closer to the destination LLC than to the
> + * source LLC inside a NUMA.
> + */
> +static int get_affi_llcs(struct sched_domain *sd, int src_llc, int dst_llc,
> +			 int *affi_llcs, int *affi)
> +{
> +	int j = 0, src_dist, dst_dist, cur_node;
> +
> +	if (src_llc == dst_llc || sd->flags & (SD_NUMA | SD_SHARE_LLC))
> +		return 0;
> +
> +	cur_node = llc_to_node(src_llc);
> +	if (cur_node != llc_to_node(dst_llc))
> +		return 0;
> +
> +	for (int i = 0; i <= max_lid; i++) {

This isn't safe. max_lid isn't stable, you should use sd->llc_max which
matches the actual allocation size of sd->llc_counts.
