Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793710496;
	b=I4zSo/F6cVSJF/T33deM3UX1hWVjfyAf07b+0sSowbg5lXMs+m26b6JlQgTjrivZugaY
	 b9vq14btXjRqLhEQsQMbQ2KtKfa51ok3UgEsWvM+i3vigBQkHzqQVtRFzX7ezbqPNFba2
	 S2IPM5qgus/FIYZfcxuy2s8YiW3+Y5ENxUYQjW03KaKbJ76mIKVSjQ3jO8DYkJHYRZTCS
	 ZypUD6haDDMqB2qA59pR7fPNxTEyMOYzKJNvNPE2u3acbuq6nNWSrVLp8lN3+uIbPa/bd
	 Lr6h640fHgADAO3Yp4NoNrfiIiqlXvSpvTf4WwSti87U+o/dugV0A4dODY0+TgibwyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793710496;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=JO/KbpqRGmahZ9r2KBudokt8MXoGc3DC4uUWxLJ/2zM=;
	b=X+A3vWHibTE2TmDxtRzELUuSXni7KSD9FJvvPUaywEQlFyrUSDslZcXSC7z0u5gI+vXB
	 Pg9zVg+vhfhoJbYEXQoaW3cZCx0dV0Wi2OENZ4T2cz99e7ApQ6xO7bBpDP3/+dQm2cxKc
	 R3iV72FpXf+qxvUI6frvM4Bmuz62KGGpUW07lGG0KIWSpOYvhzWgNz891DOUxI4rgXd7x
	 u7PDP5Uo9XKOcFlm+qxIuswCXZIGgsKHnF6JvLygUQnm8nIZxbwA1qT4A+5Sidok/Fnq/
	 l4jBZ2jba+TOB8f/OfSlqE9BH1Pwcx53UYNPY7b9zogGmZw6lOLo4oJN6lKO1/uq2gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=uWGWFsPA;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72386606A32F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:54:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72386606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=uWGWFsPA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JO/KbpqRGmahZ9r2KBudokt8MXoGc3DC4uUWxLJ/2zM=; b=uWGWFsPAztpUlV+NjrdR9yjsO4
	NdkUV/5lRK1erzvmAng8nRXeJdP8IZgYJ6oUpvTw9mb9DcEgOp8anertilf3iAj040777atowP28+
	M1cNSTvJHS6a9D/p986EMs5VHzyeCXMaRXD+N40S8v7a7eEfEEwKdFNAAVOFm8K60NTP7HjT+NUY+
	m1hvUiFwkUz83InXgvp4EWoGI8cuxTYRms78Ipuk+zWmehsrQ59accUxjEHXif7TFCaOjdK8R+y6B
	WWCJX+yFCpkaoJUeshapHi59l1Tx+sMYi7W1XZHeWvyBwpAyvqUIt5L0rnQbJ8fmgb3RWKR8N30aw
	RyRkQ2/Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOE2M-0000000CoCb-1n9I;
	Tue, 03 Nov 2026 12:54:50 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1EA39301185; Tue, 03 Nov 2026 13:54:49 +0100 (CET)
Date: Tue, 3 Nov 2026 13:54:49 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Aleksei Fedorov <ring.zero.sh@gmail.com>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC] sched/eevdf: fall back to the leftmost entity when nobody
 is eligible
Message-ID: <20261103125449.GY1779021@noisy.programming.kicks-ass.net>
References: <20261103124242.102319-1-ring.zero.sh@gmail.com>
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
In-Reply-To: <20261103124242.102319-1-ring.zero.sh@gmail.com>

On Tue, Nov 03, 2026 at 12:42:42PM +0000, Aleksei Fedorov wrote:
> pick_eevdf() returns NULL when more than one entity is runnable and
> entity_eligible() is false for every one of them, including curr. The
> caller then dereferences that pointer.
> 
> On Ubuntu linux-aws 6.8.0-1066.69 and 6.8.0-1063.66 the fault is
> pick_next_task_fair+0x91, mov r14,[rax+0xa0], RAX = 0, CR2 = 0xa0.
> Five oopses on one Xen HVM guest, from 2026-10-24 through 2026-10-28.
> commit 1560d1f6eb6b ("sched/eevdf: Prevent vlag from going out
> of bounds in reweight_eevdf()") is present in both kernels and does
> not stop the NULL return.
> 
> Take the leftmost entity so schedule() can finish. WARN_ON_ONCE records
> the substitution. It does not repair the eligibility state that rejected
> every entity.
> 
> On a guest booted with this change the warning fired once, on
> 2026-10-31 16:08:42 UTC, at pick_eevdf+0x22d in kernel/sched/fair.c:967.
> The guest was still running on 2026-11-03, with no further oops.
> 
> Signed-off-by: Aleksei Fedorov <ring.zero.sh@gmail.com>
> ---
>  kernel/sched/fair.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 0feec172f..1b940ced9 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -1196,6 +1196,18 @@ static struct sched_entity *pick_eevdf(struct cfs_rq *cfs_rq, bool protect)
>  	if (!best || (curr && entity_before(curr, best)))
>  		best = curr;
>  
> +	/*
> +	 * More than one entity is runnable, but none was eligible and curr
> +	 * was cleared. Returning NULL makes the caller dereference the
> +	 * result. Take the leftmost entity so schedule() can finish.
> +	 * WARN_ON_ONCE records that substitution. It does not repair the
> +	 * eligibility state that rejected every entity.
> +	 */
> +	if (unlikely(!best)) {
> +		best = __pick_first_entity(cfs_rq);
> +		WARN_ON_ONCE(best);
> +	}
> +
>  	return best;
>  }

That WARN will likely kill you as hard as a NULL deref.

Also, as I've said a million times before; getting into this situation
is bad -- something is messed up, find the root cause, fix that.

First step though, try something recent, there have been a *LOT* of
changes since 6.8
