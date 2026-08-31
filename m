Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59217414DD3
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788182229; cv=none; b=qI2XSfrhDBGJYvBfBHof5mhVWB/DEm7Qu4igQ4ELfkFf4M6apA7DUIL/pMxF7H40hqIgHRhDPAwWhsoREBwjRBxQvf36KoZIQ/WL446d8lqsrhx365EQN9sgewVrOCJJqkXbeIQhxr3cE9rW9yGTpso1+mJkpd1Uscy3yqGSKXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788182229; c=relaxed/simple;
	bh=ZQ9KW+EZzU5xzMOx/RAutpAA4lcqxmJUOfD/6cJLQCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nDQLiwjtDSKNtNdnJkdMJGi0ympyf5f0x54OQL8rNdj5sFm5oit5ff0E11MV/KDCUVaP3ymgBz2Qd9EmhMp7hzdjnfInnQ8UEHcPLiuBl/pL03SwE+NIAPLUYNGBTR+zFveZMfyT105kKo+OQ4rxA3FQ6ei0CMh6Jpa/Rcf5qr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=r3i6qXUL; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="r3i6qXUL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iS+QKvUiauQ5ltYL6rGwKb7rRjDBV+mGGCSvRrum6wo=; b=r3i6qXULGg1E0EIB2oBQ+M/rh+
	KeM2V/bYv4Du8XK2HmhMsYNwvjSSlkBYncDfmYXAUSbRTCJnCQJ2TliZVqOrodewx+vCa0HAle5Ab
	mc/lj54rQf09d8BzVYn+LH5Np9EPowx4cIT8m7KWmYvShP05WIu/ti2q9YalC9QJLrogHAeSsSAOz
	lTdNy/0znqJWf6uzC59DOEUQAs6cDxKUPnjhOrRbUB0f5n8Qd/Oy9oR2A5hihfvOkZNBuz8eaihKp
	oq5kX42FbDVhfrQERs+ox0eRJmEi6h6AeUG/L2RYO7Cj+HG2Y8MlllQS8qYtVU7PYj+BBYePh5+sh
	vJNjq/7A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11sT-00000003ISb-3xLT;
	Mon, 31 Aug 2026 13:16:46 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0CA6B300E7E; Mon, 31 Aug 2026 15:16:44 +0200 (CEST)
Date: Mon, 31 Aug 2026 15:16:43 +0200
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
Message-ID: <20260831131643.GK4120091@noisy.programming.kicks-ass.net>
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

> +	/*
> +	 * Avoid switching sc_stat.cpu too fast. The reason to choose 2X is
> +	 * because:
> +	 * 1. It is better to keep the preferred LLC stable, rather than
> +	 *    changing it frequently and cause migrations
> +	 * 2. 2X means the new preferred LLC has at least 1 more busy CPU than
> +	 *    the old one(200% vs 100%, eg)
> +	 * 3. 2X is chosen based on test results, as it delivers the optimal
> +	 *    performance gain so far.
> +	 *
> +	 * Moving to another node takes precedence over moving inside the
> +	 * current one, as it did when the two updates were applied in that
> +	 * order.
> +	 */

Comments should never refer to old code that no longer exists. Comments
are for the code as it is now. If you want to expand on details of the
transition from one implementation to the next, that's what the
Changelog is for.

> +	if (m_a_n_occ > 2 * curr_m_a_n_occ)
> +		new_cpu = m_a_n_cpu;
> +	else if (pref_llc_cpu >= 0 && pref_llc_occ > 2 * curr_m_a_occ)
> +		new_cpu = pref_llc_cpu;
> +
> +	if (new_cpu >= 0)
> +		WRITE_ONCE(mm->sc_stat.cpu, new_cpu);
>  
>  	update_avg_scale(&mm->sc_stat.nr_running_avg, nr_running);
>  	free_cpumask_var(cpus);
> -- 
> 2.34.1
> 
> 
