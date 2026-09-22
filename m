Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06D954CF54
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790114080; cv=none; b=olyXqzuCKkQfca46GEeW9/ruQFmhlskyneEmli4bgkjyw+RvRJdi6EcitRwc3VCk36C1++AUk2fquIAcJwrVxVlLZ4hSmLfauxjoS0Rpzdzh0NmOCQIFh5OwzuM2dM2aPDpU4/7PC2cbpupCnCQoHKfRGjie3+sSCMZzuW5E4/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790114080; c=relaxed/simple;
	bh=p/L879OIYLV71+H//ZRE8I1I2qqyLrtjKa4SR+oC9TQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UavTLx/gp2ZGUg0K/gWERM+h7UCy2QcNT6NwvsyRvxZ9HJ47o0jFfL3VDI2x17KyMKbIZmlub69S+nwRcxruum/RLjyda0g+BE53mT/E/ZItfSArfp8NiMH7XDWkNWNapG5bITyJkT/H56oJt4qKWr7RM+Q2R0mYCZeN0WQmTs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YB5cPXDg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YB5cPXDg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 653FE1F000FF;
	Tue, 22 Sep 2026 21:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790114069;
	bh=edyCbCfDMGk1hxYeG4dNEljv0IUSAZo+nnHOkefLgjA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=YB5cPXDg894MAfPTQJXanRS+r3sCLc6DCIuD8LXq0JyQrIpIgHJoPboKSVBrv3o4E
	 BFCRB1pD6iwEq8JTHcfUjST0VFM90wTh0C87AI1BQnzdAxqpAQhgvEeL4hwFj64vLn
	 cQqMVSxTInlcAAJJY6wzsTkTpX9U5qTJnxJuOS0iWXqFgzX8/5a5ahK4JeDaZRxmoI
	 Kau7SXyQ8d5ObnCEExOvWrXWRodONzeYJHFPzbUvkL3C3y4bVE8oZohMPx8wdpQ6FQ
	 cY1j3yIt8GZ2I8epQWDzp3gAFOVPiKLHiwhdxBWpgYrsW0N1IE1rFCH3QySY55UKIh
	 fBNxc6AFxgZgA==
Date: Tue, 22 Sep 2026 11:54:28 -1000
Message-ID: <ec6c22eddc8ce0b1ef2434ed62acd560@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>,
 Marco Crivellari <marco.crivellari@suse.com>,
 linux-kernel@vger.kernel.org, kernel-team@meta.com,
 Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH RFC 0/3] workqueue: Take the pwq backend from the attrs
In-Reply-To: <arJO4eEGNzltAOk-@gmail.com>
References: <20260918-wq_final-v1-0-5c43c08a26bc@debian.org>
 <8a1437751a6da2c166284b1ca562fb0a@kernel.org>
 <arJO4eEGNzltAOk-@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello, Breno.

On Tue, Sep 22, 2026 at 03:34:48AM -0700, Breno Leitao wrote:
> Right, I will create a function that maps/scale one to another. Maybe
> the following?

Unbound max_active is distributed among nodes, with min_active as the
floor on each node, so I think the conversion should account for both.
One possibility, using:

  U = unbound max_active, the system-wide target
  L = unbound min_active, the floor on each node
  P = percpu_max_active, the limit on each CPU
  N = online CPUs in the effective unbound mask, at least 1

  Setting P:
    U = min(P * N, WQ_MAX_ACTIVE)
    L = P

  Setting U:
    L = min(L, U)
    P = max(DIV_ROUND_UP(U, N), L)

  Setting L:
    L = clamp(L, 0, U)
    P = max(DIV_ROUND_UP(U, N), L)

This would carry the minimum concurrency in both directions. Clipping L
when lowering U preserves the existing setter's behavior. The cap and
rounding make the conversion approximate. We could derive the other
domain on explicit configuration changes and leave scope changes and
hotplug to use the saved values, with hotplug continuing to redistribute
U through the existing mechanism.

> Sure, and probably call them from wq_adjust_max_active(), so,
> independent of the one that is being set (percpu or unbound), it will
> change the other as well according to the function above.

I think separate kernel entry points and sysfs knobs for the two domains
would be clearer. Each would have a fixed meaning regardless of the
current scope. The conversion could happen in those setters, with
wq_adjust_max_active() publishing the saved limits and handling freezing.

> Oh, interesting, so, we are going to have CM toggable even for
> WQ_PERCPU and also for WQ_UNBOUND+WQ_AFFN_PERCPU, is this right?

The attribute could be changed in any scope, with its value taking effect
only in PERCPU scope. Maybe give it a percpu_ prefix to make that clear?

> Once we have it, what will be the difference between
> WQ_UNBOUND+WQ_AFFN_PERCPU+CM from WQ_PERCPU? They look exactly the same
> from a user perspective, no?

WQ_PERCPU declares that per-CPU affinity is required for correctness, so
the workqueue cannot leave PERCPU scope. WQ_PREFER_PERCPU starts in that
scope but permits scope changes and follows the unbound cpumask when
selecting the queueing CPU.

> I understand that scope means 'enum wq_affn_scope affn_scope', so, you
> want a WQ_AFFN_BH, right?

Yes. Scope is largely selecting the backend, and BH fits there. It remains
selectable only at creation, with no switching into or out of it.

>   - echo -5 > nice succeeds and stores -5, whatever scope the wq is in
>   - For WQ_PERCPU it runs on the highpri pool (nice -20 in practice)
>   - echo 0 > nice, will turn the WQ_PERCPU workqueue into the normal
>     pool.

I'd map only -20 to the highpri pool in PERCPU scope and everything else
to normal. The requested nice value would stay stored and apply verbatim
when using an unbound backend.

> Is this the final state you are envisioning?

How about PERCPU and BH scopes, with PREFER as a modifier of PERCPU like
CM? CM controls concurrency management. PREFER allows affinity to be
relaxed. WQ_PREFER_PERCPU would set the initial scope and modifier. We'd
still need to preserve the correctness requirement declared by
WQ_PERCPU when changing attributes.

These are suggestions. If you find a better way during implementation,
please go with that.

Thanks.

-- 
tejun
