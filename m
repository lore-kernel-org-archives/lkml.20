Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2449441E6D9
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788182566; cv=none; b=kvmkqkEIwpl8YeB54L+Jioycl54HXuLVH23bDqjy0zUP8T6YoCy6aUxrAUJo3BBNRv6ItKZdGqlk5V/5RcgmwMSoYKkbiPRhx/KsBszFKAoB6wmsyry9wRtYW+0m4E+tKKolWT/UWt1TQCDuJbp3x3myremh6YMDsSkz5yVkhrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788182566; c=relaxed/simple;
	bh=dnPnuyQdsPrad9nwuMMq+vLx65116uxYzY2RUCj7BPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QJ/cGzCJM19v1jXsiaIFoYboGPApEGfQH7UxPb2Dgu6hRbhWu3azbU7ncf4l4Hnou1s7qpGnUDChCKflM3wrVNieVqvKaEfRXysrqtGDdgCdjEUcT2KmcJoSRADatjqSE9WLh8G5spQBLtRqlF1D9KK+TJPCaFecRfP7BwkDro0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Z/fX1ADo; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Z/fX1ADo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+5bhMWttEMUgIbj5UKS5FSbb3mXKWX3q6HbFRgQMzKI=; b=Z/fX1ADo8gMI6p2qde3xIYicpA
	OAsRp3yZrUtVTNcA1n7Igl17tjj14XzR7I+xTazTgntMg3wbF49TyjbStqM3iYKvvg3K7AelqtdWC
	ka5DsVWX6pItIXKTIL7fV+K8zRdbeEpD/Ickjh5Ib78x1PXH0U8kRTVcEH+M3CjlhvsdqBFmYQa4W
	tc/yr5m3stcINNKHVjpVrGFDAY+MI1idN/7EGCH8uOnWwM8G6a+1KCvbvgvWKKJTtBySaB71rZQTL
	tadkNBMWnae+2fLxEbCnWcJFu+FxTs0ZHVFEMiPrHopOImWeykBopFeiaPVC9vZTbf0mz9zYIJ6Qh
	UX0IOs5Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x11y2-00000009sbF-3PLy;
	Mon, 31 Aug 2026 13:22:31 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A9AEA300E7E; Mon, 31 Aug 2026 15:22:29 +0200 (CEST)
Date: Mon, 31 Aug 2026 15:22:29 +0200
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
Subject: Re: [RFC PATCH v2 07/23] sched/cache: Prioritize preferred NUMA node
 selection over LLC selection
Message-ID: <20260831132229.GL4120091@noisy.programming.kicks-ass.net>
References: <20260827122816.756234-1-wujianyong@hygon.cn>
 <20260827122816.756234-8-wujianyong@hygon.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827122816.756234-8-wujianyong@hygon.cn>

On Thu, Aug 27, 2026 at 08:28:00PM +0800, Jianyong Wu wrote:
> In the current implementation, the preferred LLC is selected based on the
> LLC with the largest running time of the thread group. However, the
> preferred LLC may be prone to frequent migration when the workload
> spreads across the entire system, especially when the number of CPUs
> sharing an LLC is small. A better approach is to first select a preferred
> NUMA node in the same way, and then select the preferred LLC within that
> preferred NUMA node.

Hmm, if we're going to look at nodes, should we not also consider the
numa balancing preferred node, and perhaps priorize an llc inside that
nore, rather than the occupancy wise busiest node?


> -				a_occ += occ;
> -				if (occ > m_occ) {
> -					m_occ = occ;
> -					m_cpu = i;
> +					a_occ += occ;
> +					if (occ > m_occ) {
> +						m_occ = occ;
> +						m_cpu = i;
> +					}
> +
> +					cur = rcu_dereference_all(cpu_rq(i)->curr);
> +					if (cur && !(cur->flags & (PF_EXITING | PF_KTHREAD)) &&
> +					    cur->mm == mm)
> +						nr_running++;
>  				}

This level of indenting seems to suggest perhaps breaking things out
into a helper function?
