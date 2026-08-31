Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508633264FF
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788177030; cv=none; b=J8odXrH6Ms0xKFCefMf9xwlsH6ns9XQwWHDL3MSr/52g2MyeDyNoGizryldZo/w5JyqMtXnKDYIgkOXQ2cQ5rEGjAp6lPhVwxkA13GEJ5otZRfx1eQ7PSWAgUvknwALpzd1sELm1i9rz1VcYywtNVqmBs+DUE82fywZb1aQ+24Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788177030; c=relaxed/simple;
	bh=jc1pdaoQPteDnKKqAi84UQ7FEjzD/qxiyncigv8CAQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WIwL0v6kDltsjzNLo+F2EzkEZB3EPTVAhR4Y+u7p7rnchndr0V61QnWczSo68XiJMyY+ikvUQoYIhffnO8DCMpwKKOGu0Pt73f72ttf/cHDISj8n3Ztqn2bKNlkHrguoo/c/UcxdjkvssFLZ84QwyfxyNZdX1/meavakmKw9iFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=AdN9RsL6; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="AdN9RsL6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aDebJtj+sX3RBx4IpJ0XhmIJry2c2+dglSVudIUPZUE=; b=AdN9RsL6r9JMai+CEQPHcCKxI5
	sZcsFUTuoQL6iHOH6Clb6WgoiyAA9PwDD4JH5q7JQeW+nHPBtN9X5NsYMI3ng+YkoVM0ijVv3vo3/
	L1QIFiGxIx4AQ9V7FW6Q5suvhmktMUDQ9r44TX4PMVPR1ShBBzfCbMVYkGf5WxNKXmLe4rT9KzQVI
	vCWkAzQ9t0oSSb38vAk1oiqqfWVzLBPrEfXrFXl3CDlZLfdAycoT+bIrQLKpIHls5VlavQUACUT0C
	9zqYTcbnHFjpIkgrNrbxDuawsr41c8kARi3OUlLWu5RawNfuTEOQLiMCKjQ0O6ACYwvSRKkY5pVwo
	KaW/3SaA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x10Wb-00000009pJc-3iGF;
	Mon, 31 Aug 2026 11:50:06 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 21E69300CC0; Mon, 31 Aug 2026 13:50:04 +0200 (CEST)
Date: Mon, 31 Aug 2026 13:50:04 +0200
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
Message-ID: <20260831115004.GF776954@noisy.programming.kicks-ass.net>
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

This example uses Node only, but the code in question is specifically
aimed at Cache granularity; might it be better to use a cache example?

A little something like so (I got tired of prompting Gemini to generate
more complicates / less broken examples)...

Pre:

Cache |  C0   C1 |  C2   C3 |  C4   C5 |  C6   C7
------+----------+----------+----------+---------
  C0  |  10   10 |  20   20 |  20   20 |  20   20
  C1  |  10   10 |  20   20 |  20   20 |  20   20
------+----------+----------+----------+---------
  C2  |  20   20 |  10   10 |  20   20 |  20   20
  C3  |  20   20 |  10   10 |  20   20 |  20   20
------+----------+----------+----------+---------
  C4  |  20   20 |  20   20 |  10   10 |  20   20
  C5  |  20   20 |  20   20 |  10   10 |  20   20
------+----------+----------+----------+---------
  C6  |  20   20 |  20   20 |  20   20 |  10   10
  C7  |  20   20 |  20   20 |  20   20 |  10   10

Post:

Cache |  C0   C1 |  C2   C3 |  C4   C5 |  C6   C7
------+----------+----------+----------+---------
  C0  |  10   11 |  20   21 |  22   23 |  24   25
  C1  |  11   10 |  21   20 |  23   22 |  25   24
------+----------+----------+----------+---------
  C2  |  20   21 |  10   11 |  24   25 |  22   23
  C3  |  21   20 |  11   10 |  25   24 |  23   22
------+----------+----------+----------+---------
  C4  |  22   23 |  24   25 |  10   11 |  20   21
  C5  |  23   22 |  25   24 |  11   10 |  21   20
------+----------+----------+----------+---------
  C6  |  24   25 |  22   23 |  20   21 |  10   11
  C7  |  25   24 |  23   22 |  21   20 |  11   10


> Each row of this refined NUMA distance matrix is sorted in ascending order to
> generate a unique per-node affinity sequence. This sequence will guide
> thread migration logic introduced in subsequent patches.

IIRC greedy has significant worse bounds than many other schemes. This
would result in more unique distances than strictly needed here, right?

Since this is all on slow paths anyway, does it make sense to pick a
slightly better algorithm in order to reduce this bound and get better
results?

Anyway, let me continue trying to dig through all this.
