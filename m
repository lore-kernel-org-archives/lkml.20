Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793184828;
	b=kd4fxvgLELE25oakRYnhzOGK0pcrMrhYZriTSgsZ+oRW2SMBipPA0ocgfDJSIN5dMhzn
	 UqKIEm25mh0S9r7xCih1IAz2ubROqbmVYy/4/GXciJg1YDo3w4XA+jPcJw+TVG8JhQmWW
	 EIxh5Cju3iGtLUoXZM+vc7Gb1fGksd93mxFD+djRosGLNAYh1VWVpUiUXx82eMcbuusjR
	 A5ks0aNfvD7fU+gqqgkGrTKO0flmx5S1olKy72aFDGXhYfBHlWhI4mSDFlwJrgO/wWDau
	 J1dZ2myy8DGqYyrc8qV6rFXMWeGB8oHPQ+D4hTuC+9DWrKU/VJHV9G7safRs+usgcig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793184828;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=VcibpdDwJMAkJYpoB8M8GAyj5HweFfCbCdgCuuvUqyM=;
	b=OVPFOOmZN1RHO6ft6VVpXl64j1DWM6hGdiuQOSTRE6BFXAOt++kVyveRahAwoQeAsLkx
	 +mOCH6jn12nL3o24Jryn5iJLfjkk1PsLzeyluaBhoY9zUOx0oUJpiPlhXJURAd+SxmP9+
	 7JxqL11TntUvOzeUps+LWTbuD6FZUsiZfSDCOEPmwYcO1DewoYMM1nmpa7TjGkqrWCGFn
	 Ycz/ednreau7hmpfDDB9pTwwEt5WOLywlLbOKaz0+pKrUeLhj7qLYdB+9pF97wlBeAeap
	 BJkwtq6ss2jYl7oVVH1zM71W9qjYVOU83pXk21BrPuGJmz94t3Lo+9+bCjfkQ4DVE+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=kkbtroER;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D649E606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:53:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D649E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=kkbtroER
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VcibpdDwJMAkJYpoB8M8GAyj5HweFfCbCdgCuuvUqyM=; b=kkbtroEROd4lN8qZBC6MykOKov
	bqoEFusPi/0RjQ3rpGIzRELGN82pnFsfzgUI0YZfofJOzV+Hfw04WbVYPpmPtx3Bw6YI/FkcAUVUY
	xII/k17zDVSzW1K70h2WbS80r3U3LDlh44ZhUd51QYNWeQsSIP5IL0ZJ3m7nQokjijMSJLZTaTSBu
	9dq9eM0p6kxt91TmwAyZ/Mkq3R9OWwoaBt3vSlHns8gljcgEni57Avfkhlk6i7V5/7uFD1oFNj9xO
	BEsf/VAmev5Zot8oLEvNzAEpx0MBjnbi0ARS2eNwxs/ISViPL21zNUySjxRkuX/cyC8TaQDEljKM4
	lhI1Jvgw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1Hl-00000002uEG-3wm7;
	Wed, 28 Oct 2026 10:53:38 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id BE59D30120E; Wed, 28 Oct 2026 11:53:36 +0100 (CET)
Date: Wed, 28 Oct 2026 11:53:36 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Qais Yousef <qyousef@layalina.io>
Cc: Ingo Molnar <mingo@kernel.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Stultz <jstultz@google.com>, linux-kernel@vger.kernel.org,
	Wei Wang <wvw@google.com>
Subject: Re: [PATCH v3 1/2] sched/uclamp: Fix race condition leading to
 imbalanced uclamp_rq
Message-ID: <20261028105336.GI2668804@noisy.programming.kicks-ass.net>
References: <20261028020512.10245-1-qyousef@layalina.io>
 <20261028020512.10245-2-qyousef@layalina.io>
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
In-Reply-To: <20261028020512.10245-2-qyousef@layalina.io>

On Wed, Oct 28, 2026 at 02:05:11AM +0000, Qais Yousef wrote:

> --- a/kernel/sched/idle.c
> +++ b/kernel/sched/idle.c
> @@ -502,6 +502,23 @@ static void set_next_task_idle(struct rq *rq, struct task_struct *next, enum snt
>  	 * lost_idle_time of clock_pelt
>  	 */
>  	update_idle_rq_clock_pelt(rq);
> +
> +	/*
> +	 * Due to a race condition when enabling sched_uclamp_used static key,
> +	 * we can end up with imbalance where uclamp_rq_inc_id() has happened
> +	 * on a CPU without uclamp_rq_dec_id() on another CPU that hasn't seen
> +	 * the static key flipped. The race condition is unlikely, but ensure
> +	 * the uclamp_rq() state is set properly on each entry to idle.
> +	 *
> +	 * The reset will cause the uclamp_max from uclamp_idle_value() to be
> +	 * lost. Since we are imbalanced, hard to know what is right. So just
> +	 * cleanup. This should be a transient error state once we recover
> +	 * everything should work as expected.
> +	 */
> +	if (uclamp_is_used()) {
> +		if (unlikely(!uclamp_rq_is_idle(rq)))
> +			init_uclamp_rq(rq);
> +	}
>  }

Much nicer! Would you mind terribly if I make that:

	if (unlikely(uclamp_is_used() && !uclamp_rq_is_idle(rq)))
		init_uclamp_rq(rq);

?
