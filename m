Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5796387364
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 05:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788327531; cv=none; b=bIRJ8SfZ45eEge4KRaU2yvogXPv2ANID3r5GvJy159eliIUq3NuBHrrwr7W7m7ep7OnzqxxacaBuB7FbW7h3jRb8hN6ZeZfGoVuTlB8s8I0swxw17FLBGDWKnS8tLJP1Zp5riDngZd3NLTxUYr60YsD8O6o5E0Rhb0hcG1PkSfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788327531; c=relaxed/simple;
	bh=NUQmfBTsfdfOM/FNFhgK5L8Lin1Zox5PWwp0gLcDWt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A37yNDVyOU5DmKCQ+Tn/XGMti1osqKBNYakcyZjCps9rdEm8jlYm75pqmYApe4MuE2/HtdHpbM71MJbnMXExzPaA+oX/KiUdHJQxzB704ZiWTHgHt6YG1Fj5Ns0KnYJODAxkngc44gwuq3RhSouHk7Pk6Lw+OD9NUhXL7l0uB50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KuafMg0J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KuafMg0J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 198F81F000E9;
	Wed,  2 Sep 2026 05:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788327530;
	bh=KBqnAWoIinanplzoKsLzNnIGR+eL7oIO2onBeSpcFb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KuafMg0JVWXS4A0CTRhv0Nyixn0XjiLpRl04Le9SVWS8DeEBozF1qm+cmRIO2Uh5J
	 +1MEwTRPMHCHRLcgzAc5+XkxyW8rwRFVlaQUGMxO4xyKrqr6EFy5lfbvgtMenBInVH
	 jupzpD6MRR2W0PiQxqLwuWgzSw6tVs9Zf3kH9eqMs+pZTXNrtCJzKybOlj10hqc/OR
	 OHyda611n/UO3fBvLFjpuWgcm1Xn+g+r7lR66/HgSeE0Gx3c0NWbNserFLburZsa3L
	 g5K525APYS5mm0my5JUH98MYsv76BBxxFDRd+fFOEVRluoTU/TbQJzN8RnQ9xUNzNh
	 4oBaBiNut96ZQ==
Date: Tue, 1 Sep 2026 19:38:49 -1000
From: Tejun Heo <tj@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@kernel.org, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] sched/core: Simplify/fix time updates
Message-ID: <ape2abNdAgRCfEtg@slm.duckdns.org>
References: <20260828101659.812011872@infradead.org>
 <20260828104018.483560652@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828104018.483560652@infradead.org>

Hello,

On Fri, Aug 28, 2026 at 12:17:01PM +0200, Peter Zijlstra wrote:
> +static void opt_update_rq_clock(struct rq *rq)
> +{
> +	if (!(rq->clock_update_flags & RQCF_UPDATED))
> +		update_rq_clock(rq);
> +}

Yeah, I think this really needs sth like this. That said,

> @@ -6336,18 +6336,12 @@ pick_next_task(struct rq *rq, struct rq_
>  		 * pick_next_task(). If the current cpu is not the core,
>  		 * the core may also have been updated above.
>  		 */
> -		if (i != cpu && (rq_i != rq->core || !core_clock_updated))
> -			update_rq_clock(rq_i);
> +		opt_update_rq_clock(rq_i);

I don't think this is correct. A sibling rq wouldn't necessarily have
RCQF_UPDATED cleared from whenever it scheduled / ticked the last time, so
the following pick_task() can run with pretty stale rq clock.

>  
> -		p = pick_task(rq_i, rf);
> +		p = pick_task(rq_i, &rf_i);
>  		if (unlikely(seq != rq->core->core_task_seq ||
> -			     WARN_ON_ONCE(p == RETRY_TASK))) {
> -			/* rq lock may have been dropped, clocks invalidated */
> -			core_clock_updated = false;
> -			if (!(rq->clock_update_flags & RQCF_UPDATED))
> -				update_rq_clock(rq);
> +			     WARN_ON_ONCE(p == RETRY_TASK)))
>  			goto restart;
> -		}

Thanks.

-- 
tejun
