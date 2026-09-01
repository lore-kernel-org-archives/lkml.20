Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAE447AF5C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 10:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788258578; cv=none; b=tUh2umK0KPgvLp4Oo8OS+wWHP5EZ4ctd3EoC9a5YhYmubsFZQTfNsmoOfHuolIQajafbkhcv410dfZBYqLua+UduMGhz6XHKqliTau5pDoiipEbAutbmtGoSXti4AJ/x3ibLdYRJn9d4Mo0dEKSoKAc/PLOc5dnHiYcGMnlSohY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788258578; c=relaxed/simple;
	bh=BuROZHB+oAUqZL/+duKbF7C95KZZYofztqYRf0xFPXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i4Im1A7QJvhsSaH5Vi5aLlLi8zWXywa6Bq0bu9cMSfdw8UMLlolzq3EyJOIGabzAWsAn5QhvO7DXfea+d0QPn82hAvLxwhMHTIf52NwLKzjHhdfYHxxVkiP1opuCsZN1C0gRIwr8GVCn4I9sb5tvz32e8CvEA3W/DbRAXQgE5dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=CclhBcNQ; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CclhBcNQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PUus9S9MODT/QuFwH6nooYCoD+hdaIxSvabuO+GXl/k=; b=CclhBcNQzW+aMW35635m3dmmAU
	2cFyY7FteXJwlQUjc1icaB5jJpLE5ys9V2+Tu7k53qyaIyixvmg/uaYnAtf23/6yjEAoPXfEFWpAd
	aZRzJK/kqv7lKTKSS6OYdgL6vUUrFBqnp9ydWsBFxDPM40mia1kL7SRCv+OeFB42E1adHOOE0QDsC
	jhl48QBWzZteHxI89jYEmDs3M0QDoncSX5T914/ia/x1QAxpasclWAvGxv6KXA7fSaHuqssx2IMb6
	xFG9APm7JP5pxdAXorXZxmk5nN+9k++VhsMsfFWPQL2hrSuUEhyF/Smit7koRsizy8GzDoX2Lk8wg
	SOmCyBIQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1Ljy-0000000Ar4c-1mv8;
	Tue, 01 Sep 2026 10:29:18 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 43DED30031E; Tue, 01 Sep 2026 12:29:17 +0200 (CEST)
Date: Tue, 1 Sep 2026 12:29:17 +0200
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
Subject: Re: [RFC PATCH v2 14/23] sched/cache: Drop prefer_sibling
 restriction for llc_balance
Message-ID: <20260901102917.GH776954@noisy.programming.kicks-ass.net>
References: <20260827122816.756234-1-wujianyong@hygon.cn>
 <20260827122816.756234-15-wujianyong@hygon.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827122816.756234-15-wujianyong@hygon.cn>

On Thu, Aug 27, 2026 at 08:28:07PM +0800, Jianyong Wu wrote:
> group_llc_balance performs balancing across LLC and NUMA domains.
> The prefer_sibling constraint unnecessarily limits its scope, so remove
> this requirement entirely from the branch condition.
> 
> Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
> ---
>  kernel/sched/fair.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 584297528a9e..5c35a43e5e38 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -13274,9 +13274,9 @@ static struct sched_group *sched_balance_find_src_group(struct lb_env *env)
>  	 * Try to move all excess tasks to a sibling domain of the busiest
>  	 * group's child domain.
>  	 */
> -	if (sds.prefer_sibling && local->group_type == group_has_spare &&
> -	    (busiest->group_type == group_llc_balance ||
> -	    sibling_imbalance(env, &sds, busiest, local) > 1))
> +	if (local->group_type == group_has_spare &&
> +	    ((busiest->group_type == group_llc_balance) || (sds.prefer_sibling &&
> +	    sibling_imbalance(env, &sds, busiest, local) > 1)))
>  		goto force_balance;

Not sure about blanked disable. Maybe only disable when cache aware
scheduling is present and enabled?
