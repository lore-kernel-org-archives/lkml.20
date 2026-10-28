Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793178366;
	b=HT1cLC3PVRRTyw2Rj4uEGvKUi5Bm6T8IUOe0Hgi7T/SXgY1q2VgVrq4h4R7GOU7+xGH+
	 rvT52gU2YKXx7T+ZL6uRvh2xuIX2UPjhnImABBk+DC5vi+dMa9sSvY9RyWymZ3xntAi6n
	 4ypahJwlrXVUzqB6bnxFeYX8VS8zgkPKEghBb3l8aDYhdDM8pYa5ea05/MXAcRpN+YXC5
	 H1HLnU/H4dhFevVdlBZLHX0RVnIjsHE9EjCYC7pT3L9Y0tXhikifzkMg4ak71SvKkMeeJ
	 RR2XCgUSrxsHr8D0EHqaCkq6MSHHJ5Bicc8KBoLAWiWgBbjmEEFzkmZ4W+42tADgNFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793178366;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=D1jNYLh/Uy1bmh/rfK/cAELQ9v5Y1xI8XVwWEyCjt6A=;
	b=Q25k9sevaEJTjqvdsW6nBHEjq8e+1h+WxQGJOG3uM5ZH/VkiMCbKpRmOpGSDXXfuqRSo
	 M1w7eVQTl3y6US+mgtFK6apuRT/a4kp0zYLTpTC0yibWXosRzt1907hb7vhMn2AJpYXuQ
	 DIAuPKKPb2bE3LH/+8XJfF0RTi8ciqSUItKMtlwqR+oBy/CTmDFAxljl3IHrt0L/R6DzL
	 zSsFejtvjxqNU9nS2+4oi7gdLhmQDiBq8O/o32AMcsgMZPPT0rHhg3vOvdXYHx56H42an
	 aLge3sFx0molFEIsM2aff3IBJOBkCzNh/7lS4mJqii3STsyVI70fi3BHRyy3khCoNvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=cXYIiDYp;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608CA606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:06:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 608CA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=cXYIiDYp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=D1jNYLh/Uy1bmh/rfK/cAELQ9v5Y1xI8XVwWEyCjt6A=; b=cXYIiDYpP4ilpI/q/P2jFZSDYk
	bHsUCux2pSzD819xD/FP2E/oOUHTalmaRBoAreuZibzq+4nfqLTa1VYIZbuu/eCTm0I+jOx/XYdNn
	DY4YBvkT9W+rcTGPBmA6H0dMWqb7LuDAa3tq+W1QvJ3rmt7nlTXBs7G5+MKG5v/X/XyWHLFLmKOuz
	Dj7P32FORDpdxWhbxn+tMBVIRCBjVJOvcNBn+UQ46XkTJfCVOMOQqBTJAnDHCl73IlupxWVFrSPWG
	5rOBTq3aiVgofCjq77Bg24g6y00B+HLtT3IaSYgaPbQqpzJRKP3rXPsBJ9iYdNVeXDX5gONAERDWM
	L/JnnaeQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLzbZ-0000000Fp7Z-1yU8;
	Wed, 28 Oct 2026 09:05:57 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0D14C30120E; Wed, 28 Oct 2026 10:05:56 +0100 (CET)
Date: Wed, 28 Oct 2026 10:05:55 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Qing Wang <wangqing7171@gmail.com>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	Chen Yu <yu.c.chen@intel.com>,
	Davi Chaves Azevedo <davichazbh@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] sched/fair: Replace random newidle_balance with
 Bresenham accumulator
Message-ID: <20261028090555.GF2668804@noisy.programming.kicks-ass.net>
References: <20261028034449.2368071-1-wangqing7171@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028034449.2368071-1-wangqing7171@gmail.com>

On Wed, Oct 28, 2026 at 11:44:49AM +0800, Qing Wang wrote:
> The current NI_RANDOM implementation uses a random dice roll to allow
> newidle_balance attempts according to the success rate. There is a better
> way to implement it.

Well, sorta. So Bresenham is a linear algorithm; it doesn't (and cannot)
properly deal with slope changes, and that is exactly what we do here.

Your solution:

> @@ -14198,6 +14198,7 @@ static inline void update_newidle_stats(struct sched_domain *sd, unsigned int su
>  		ratio += sd->newidle_success;
>  
>  		sd->newidle_ratio = min(1024, ratio);
> +		sd->newidle_window_pos = 0;
>  		sd->newidle_call /= 2;
>  		sd->newidle_success /= 2;
>  	}

is to simply delete the residual on slope change. If we were drawing
actual lines (like Bresenham was), everybody would be yelling at you for
creating jaggies.

Now, we can rescale the residual, but realistically this probably
doesn't matter.

> Replace the random dice with a Bresenham accumulator that distributes the
> allowed attempts uniformly across a 1024-step window:
> 
> Each step does the following:
>   - Accumulate (1 + newidle_ratio) into newidle_window_pos.
>   - If the accumulator reaches 1024, allow the balance attempt and
>     subtract 1024.
> 
> This guarantees exactly (1 + newidle_ratio) newidle_balance operations per
> 1024 steps, uniformly spaced for any ratio in [0, 1023].

Right, except you get the boundaries wrong. Also; as you mention, the
new pattern is uniform, which might (but probably doesn't) matter.

But the thing is; you didn't call out any of this. Can you please update
the Changelog to be explicit about these things and argue why it doesn't
matter.
