Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8D64248BA
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788182627; cv=none; b=auOor42MiEPZijgB3vzwC5jUnt5FxTY1kPETy0OntxCIVRkPMqRd/A9K0PZznP7NKFu9ntIBtWcaIHC0Di30tSTcoztXuixmT/oe0eumEjXnLuIxCDpfz/INDqg6aVxagPzRK3G91JJwafOeWXmmbS1o959NzbGYlawpZ2ZsMAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788182627; c=relaxed/simple;
	bh=y/xdrQPNhr3EqoT85szlxXGJUXOUmC24tyBFKxihDbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ba8FxO0z1F5QKt6YzNJyj1Si50AKlA+/cub03418WVBkztDIbJEe97jiLHJYSsfxSckYzrJJNDSxcDFcYWWAUgNDJiP+ptFVGU9muuRA77v/g6Jm5Me3DJ6eYtZyx8kVU9/9NjB2YFzU3HTwkyIbqxYptwVNUYkzzlyqz1GZ3qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=P0x5Fl53; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="P0x5Fl53"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1manqhE5SPjOZ0jcw17QGfzE49GZ9i2XHdOv453K6ho=; b=P0x5Fl53FWCdvnRNpccMOGEvV1
	nhrGMII0sRZF4KaONQS1HM1mHpD9vfKQLxv26J9M4exvR8DViuXZEjo2PHt7984h0B0MIqbKRTPpa
	cJDl8u5sz0VPXSHlKvXYTt9TS6u0rBlGWBdD2ariI5ta9vDwtYF6d4YL2nmSxHRrF8bbQ4uvIQYT2
	nEu6/DTwZ+peCXibb2ONuhAX/+FTw60po5eyn3b2Ok38QwjwVTdPxB+aZSFH3ckd54V1SKQXQvQP2
	lKIZ3GlKwZV+BdnXF9b4KKjk6176zbJA8Hv6u3ZxT2NkhYUDfVHNeodCBcHX7VoIeWsMbPLbKpPTo
	ct/K5Vog==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11yw-00000003Isx-0t9I;
	Mon, 31 Aug 2026 13:23:26 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id BEF11300CC0; Mon, 31 Aug 2026 15:23:25 +0200 (CEST)
Date: Mon, 31 Aug 2026 15:23:25 +0200
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
Subject: Re: [RFC PATCH v2 08/23] sched/topology: Introduce a per-CPU tasks
 NUMA preferred counter
Message-ID: <20260831132325.GM4120091@noisy.programming.kicks-ass.net>
References: <20260827122816.756234-1-wujianyong@hygon.cn>
 <20260827122816.756234-9-wujianyong@hygon.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827122816.756234-9-wujianyong@hygon.cn>

On Thu, Aug 27, 2026 at 08:28:01PM +0800, Jianyong Wu wrote:
> Like the existed task LLC preferred counter, sd->llc_counts, introduce
> sd->numa_counts to denotes the task number that prefer each NUMA node in
> a certain rq.
> 
> Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
> ---
>  include/linux/sched/topology.h |  1 +
>  kernel/sched/topology.c        | 33 +++++++++++++++++++++++++++------
>  2 files changed, 28 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
> index b5d9d7c2b8ad..b31d2cf16592 100644
> --- a/include/linux/sched/topology.h
> +++ b/include/linux/sched/topology.h
> @@ -121,6 +121,7 @@ struct sched_domain {
>  	unsigned int llc_max;
>  	unsigned int *llc_counts __counted_by_ptr(llc_max);
>  	unsigned long llc_bytes;
> +	unsigned int *numa_counts;

This is missing a __counted_by_ptr() annotation ?
