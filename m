Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793122752;
	b=Tx3C2izaeXcB4NHoJaPV+4waY6QAq4JjVvKNxKOLm8wXy4srY3/8MnmS5H25m0oz7o0P
	 UCHjQXlcE0eKlW0U+cYHgSqY+zUBU7kbmgFaPYLKr4iHhVFQuiNt2nDz002m3SBKzfWBA
	 SolGu1ZNGcNcw1sOuTc5jF4fFfVhE2yMorYWDSKQEGOun8xulmBHtXUcCgDesCOXuvmY2
	 /tmwUEA4csZbaaORZCF/q8tCMobXUy6iLBf3xo5kmCdpo1zoVjw0gb+aXz/HLQsgZOScb
	 t2GHGC8j7Lc8kiPEmFT7IzNlXwZRbpIGXwGSaCqfKdDMEuU79LBqgvQFGIDhLN+1/kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793122752;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=WUtlurldtyh2Gl6SE0CuNHXZeHbjZI6olhVhsnMbdzo=;
	b=0NNK808e7dtqq6u9ZfrzpH6+J4Jk2kHXhpEi1T6Sb6qOIcvPgfYrq8WXkIvp+yFitQCH
	 uL1CnCmD/Jee/eF6I0RYME4o84yl9N3LSMIYkakPcD7/lbOzRovzZ2nAkN1RAOW/6Zzrl
	 ulZS/uTXOrPNed0Xs8OgyRxVbpSEe/3P39UFhFXaK1HsJbrMktG2f0dHyRNYpwScZ86E9
	 Bh+2/Dnj2/sI3PXPItEYnAZCpzw+XuylIIcWFcZ9xHK+HrZ8/i6Ldd/16fe2Z+h/uUZTH
	 u5ZiXy0CYInRNGtOg6attEeBCpEG0U4lJL4ZfYCr1xHTi3vaQjW+D9gspzlgoo7Y00w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=NKPZ4B3b;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AA7606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:39:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51AA7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=NKPZ4B3b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WUtlurldtyh2Gl6SE0CuNHXZeHbjZI6olhVhsnMbdzo=; b=NKPZ4B3bfZ6bPnwTKtEo1a0KYD
	m/fgtcmnE/gqFmhCaD7fDPw3Rj6P4+l5eUWsTz3ICLLIDmfMnSJhdvsXEJfUL2YDFXVL8Vd3MJYVM
	P2rctsCpyOXJNJJQuipn+N1sDpOne1/Y3NaH47/iXUrI5K/3Q4EfdO2XzSFnEF9DmwGTHO8duN9kB
	tvtjnMsEGewYcbippD6kjYaPe+5XWPrP5+rpy+2J3CHjGWQAsowTbvpLEdX1ReJD8ulSXqxXrRM7W
	JViIPG1nmkyS+qesuGwEml3PMRrf2ED3YbD5KzFj5U5hWLjRFxWLA7kII6JHw/38NgPmVr1t/xr8O
	VtrWemCA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xLl8Y-001cyi-1c;
	Tue, 27 Oct 2026 17:39:02 +0000
Date: Tue, 27 Oct 2026 10:38:58 -0700
From: Breno Leitao <leitao@debian.org>
To: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, 
	Marco Crivellari <marco.crivellari@suse.com>, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH wq/for-7.4 v3 2/3] workqueue: Keep the limits of both
 max_active domains current
Message-ID: <auDPB-9VRzF76Fcn@gmail.com>
References: <20261009-wq_final-v3-0-eb0b095b9de3@debian.org>
 <20261009-wq_final-v3-2-eb0b095b9de3@debian.org>
 <654ec35be0b19332d2e605d69ed57910@kernel.org>
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
In-Reply-To: <654ec35be0b19332d2e605d69ed57910@kernel.org>
X-Debian-User: leitao

Hello Tejun,

On Fri, Oct 16, 2026 at 07:21:06AM -1000, Tejun Heo wrote:
> On Fri, Oct 09, 2026 at 05:18:35AM -0700, Breno Leitao wrote:
> > Given that we are introducing a new PERCPU affinity scope which will be
> > able to do CM, we want to keep both values set, so, the transition from
> > scopes would be able to succeed. This cannot be done under the flip, given
> > this is RCU protected. See discussion at [1]
>
> "CM" and "the flip" aren't defined, and concurrency management doesn't
> come into this patch. The limits are WRITE_ONCE()/READ_ONCE() fields, not
> RCU-protected. Maybe say directly that a later scope switch should land on
> a sensible limit, so each setter derives the other domain?

Right, the RCU part was about the pwq table being swapped one CPU at a
time, not about the limits, and it doesn't belong in this patch. I will
reword it as you suggest.

> > Use the scale function suggested by Tejun in [1].
>
> The mapping is only in the cover letter, which doesn't land in git. Maybe
> spell out the conversions here?

Ack, the U/L/P/N block moves into the changelog.

> N is sampled only when a setter runs. Narrowing the cpumask afterwards
> through apply_workqueue_attrs() or sysfs redistributes max_active across
> the nodes but leaves percpu_max_active alone. max_active 256 on 64 CPUs
> gives percpu_max_active 8, and it stays 8 after narrowing to 4 CPUs where
> 64 would match. Nothing reads it yet. Should apply_wqattrs_commit()
> rederive it too?

I think so. N is meant to match the CPUs wq_update_node_max_active()
spreads max_active over, and apply_wqattrs_commit() is what changes that
mask.

For v4 I am moving the conversion into a helper that derives the saved
limits of the other domain from the backend's own, as you suggested on
3/3. The two setters, apply_wqattrs_commit() and
workqueue_init_topology() call it, followed by wq_adjust_max_active().
apply_wqattrs_commit() also runs at creation, so wq_init_max_active()
only needs to set the backend's own limits. Hotplug keeps the saved
values, as you suggested on v1.

apply_wqattrs_commit() runs on scope changes too, which is harmless
today: a scope change doesn't change N, and the helper always derives
from the domain of the backend the workqueue was created on. Once the
PERCPU scope can switch backends, it has to keep deriving from the
domain the user set. Otherwise switching back and forth ratchets the
limit up: max_active 256 on 64 CPUs gives percpu_max_active 8, which
scales back to 512.

> > +static int wq_user_max_active(struct workqueue_struct *wq)
> > +{
> > +	if (wq->flags & WQ_UNBOUND)
> > +		return READ_ONCE(wq->saved_max_active);
> > +
> > +	return READ_ONCE(wq->saved_percpu_max_active);
> > +}
>
> The reads are marked but the setters write these fields with plain
> stores. Maybe pair them with WRITE_ONCE()?

Ack!

> > -	if (!from_cancel && (wq->saved_max_active == 1 || wq->rescuer))
> > +	if (!from_cancel && (wq_user_max_active(wq) == 1 || wq->rescuer))
>
> The description doesn't explain this and the max_active_show() change.
> For a percpu workqueue, saved_max_active now holds the derived unbound
> limit, so these readers switch to the backend's own limit. Maybe add a
> sentence?

Ack!

> > +	if (!installed_pwq(wq, -1))
> > +		return wq_nr_online_cpus(wq_unbound_cpumask);
>
> This tests for a percpu workqueue indirectly. Percpu workqueues never get
> a dfl_pwq (apply_wqattrs_prepare() skips it for WQ_PERCPU), and unbound
> ones always have one by the time a setter runs. Maybe test WQ_UNBOUND
> directly?

Ack!

> > +	 * Which domain a pwq honours follows its pool, see
> > +	 * pwq_tryinc_nr_active(). Keeping both current means a pwq is never
> > +	 * metered against a limit nobody set.
>
> Today a pwq's pool always matches its workqueue's backend, so this
> describes the future PERCPU scope. Maybe state the contract instead, that
> both are kept current so that a pwq on either kind of pool has a valid
> limit?

Ack, I will take your wording.

Thanks for the review,
--breno
