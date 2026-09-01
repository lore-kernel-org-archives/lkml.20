Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFF8351C35
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 11:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788262350; cv=none; b=Sb2I6UDoYr/hhDWTL2ILZdpPMlgKWUHOlJFfzVTNjeeb1ZOhksbriaSaIXjw2eflL+zRsvpi3qD9Q4GvAGDDaS6ZcwDoifA1a8ME5zjp/GwdhZ8VUwnBoc4i87CCvV1T9h2N2nJfGmi85jP5PHYdqeZ7ptUzDC2JQtO1Y+9mu9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788262350; c=relaxed/simple;
	bh=02BA4hc5awqgAgyUEFcBDN7eRJX6dgfyxPfpTXeZIDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l25Gwp0iLIS8JPRBSR65L0ecEp+opVFzsWz0xHH6yfV3vpQ7KM5rYjnikI8Bt9byjVsRY7XnvNqyFsjtgCG3MSDYfSmgNqH8/wFSU57xAcSYHvWOPNn8zN9j/fFhfzaLsOoPcgsp020/T8D8BinnYUdp0wDTzHLByVxltITu7P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=OkVlHmWZ; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OkVlHmWZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=In4PIJOfYGktUiKwvOjB/5uZvBatL+sz1EUZz0UG1eU=; b=OkVlHmWZt6wGhGHcsI3AZkVsvF
	zyxIhkA5M798NqwDk0Hev9Fk+C4L++K6gplBOuA28LL1H2RyDuiXG55wrKzSeK6HQ6JrePhoN1FsS
	2GB40JVYSbQKbCpXo7CoVfBnmgG5SJibUvdhf6Rnt3aVIERCiqoTT41tVvRzx3NZmLxGpNJbhMeCl
	ovsbGgs3DEgNSqTj8O5RhWu1QPPOjxmNgfOvc4aMEpm2XCE6r2+o3F0z2EMeNp8uTAu+QWtwpip5w
	uPOiCdbLH0a728RsIMIwGY5+iGkS2LO6UBKHUTLSFhEhzrmXyJ8CS9gNdj868kM0MYG6e2MTupkbO
	bzrYn0Lw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1Min-0000000AuHS-1FHZ;
	Tue, 01 Sep 2026 11:32:09 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9D54230031E; Tue, 01 Sep 2026 13:32:07 +0200 (CEST)
Date: Tue, 1 Sep 2026 13:32:07 +0200
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
Subject: Re: [RFC PATCH v2 11/23] sched/cache: Introduce helpers for task
 migration decisions
Message-ID: <20260901113207.GZ687043@noisy.programming.kicks-ass.net>
References: <20260827122816.756234-1-wujianyong@hygon.cn>
 <20260827122816.756234-12-wujianyong@hygon.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827122816.756234-12-wujianyong@hygon.cn>

On Thu, Aug 27, 2026 at 08:28:04PM +0800, Jianyong Wu wrote:

> +static bool get_span_stats(const struct cpumask *span, unsigned long *util_out,
> +					unsigned long *cap_out)
> +{
> +	cpumask_var_t mask;
> +	int cpu;
> +	unsigned long util_tmp, cap_tmp, util = 0, cap = 0;
> +	struct sched_domain *sd_tmp;
> +

We prefer inverse xmas ordering -- where possible. So please go through
the code and re-arrange things. Eg. the above becomes:

> +	unsigned long util_tmp, cap_tmp, util = 0, cap = 0;
> +	struct sched_domain *sd_tmp;
> +	cpumask_var_t mask;
> +	int cpu;
