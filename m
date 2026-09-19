Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E502931D3
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 02:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789784019; cv=none; b=iFQIxmM2clyY2o9NpmJgw7DMUIvtyXLmV0YXf6lPPNglcf5TtLbDwonG4sz0vjgRZi9FZbkBRhikEyjm/rDVt6LAuEyxEL9ndkKkIykKlL0CY3I3Qz36+s7VjghZeCDbCILfLf5zdnu/mdjjAqbcR8Gh+kyhb2CZUiulMnD1FA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789784019; c=relaxed/simple;
	bh=pc0Kdj1c8XEqcX+7jRCBxLBixRTdRO4OBz+g/VBa+so=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References; b=l1kCJSds5VYlZaSMUBkvAI6ztzvTjjCBBgX1slbf0nWClIUVoP3v1ZV1E6JjkRimqg4OoXOWHERjHX2oeI0JCGo0nL3+7R+VoEeVls+iFNpkLKaDvA9yeB/zTOoPlMgtAM5bPTb9bm8eARWFZiYYQjlQvlQHMT+xdEn0r0UFaKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mvVVpusr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mvVVpusr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89D101F000FF;
	Sat, 19 Sep 2026 02:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789784017;
	bh=RPCYyISSp/uB61GxtFml82fOw6Q3FwYLUrdsxPPIrmg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=mvVVpusrP7lo2L+f07w5cl1lad9x772B2ESWnwgOTpHeA9EDDQ6Zf2qT6X9ZzlF52
	 C6+jewmDkTY4K8uWaPoaTIh0+HvY7UkyP58Q9/dH4poj58tTD6JIxc/B9pAaqxxRz+
	 frEsVyERFGkHNqV9O16yeADb/rd6RRvkDE30OFprQvZuI2OSWiYhB0kC59BQuwemrB
	 Eh5ZJWJww4StVeiLniGXttQnipPH0b2EBcoaHr93rGy/cZgSVz2nbfZYISBJoFrbrW
	 ZhTHpf/jUJxwMb2S+ikahlfE70Vf1XXWAk1nKlU4uD9h1TAgJ+xYki7sy+z5ptWl8v
	 3KxWoUpaclfOQ==
Date: Fri, 18 Sep 2026 16:13:36 -1000
Message-ID: <8a1437751a6da2c166284b1ca562fb0a@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH RFC 0/3] workqueue: Take the pwq backend from the attrs
In-Reply-To: <20260918-wq_final-v1-0-5c43c08a26bc@debian.org>
References: <20260918-wq_final-v1-0-5c43c08a26bc@debian.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hello, Breno.

On Fri, Sep 18, 2026 at 07:25:32AM -0700, Breno Leitao wrote:
>  * Keep wq->max_active and wq->percpu_max_active both current. The two
>    backends meter work differently, and a pwq must not end up metered
>    against a limit nobody set. (this is the semi-conflictual with my previous
>    commit 27db9dd7f84f3a ("workqueue: Give percpu workqueues their own
>    max_active")

Both should stay current but I don't think they should be the same number.
max_active means different things in the two domains, per-CPU on one side and
across the whole workqueue on the other, so let's keep the two sets of values
separate and link them through scaling. On creation, the argument sets the
values for the domain the workqueue starts in and the other domain is derived
from it. Afterwards, each domain has its own interface, kernel and sysfs, and
adjusting one updates the other accordingly. That way a switch always lands
on a sensible limit without anyone having to think about it.

>  * Create a ->concurrency_managed field in the wq attributes, used to
>    decide whether to do concurrency management or not.
>
>  * Move WQ_PERCPU onto an UNBOUND workqueue with WQ_AFFN_CPU affinity and
>    the newly created ->concurrency_managed. WQ_PERCPU is then only the
>    promise that the workqueue stays on that backend.

I'd rather not build percpu on top of CPU scope. Unbound with strict CPU
scope and percpu are different things. The pools, the metering and how the
unbound cpumask applies all differ, and both should keep existing. So, how
about making PERCPU its own scope? Whether concurrency management is then
expressed as a flag or an attribute doesn't matter much as long as it can be
turned on and off. WQ_PERCPU would mean that the workqueue can't leave the
PERCPU scope while CM can still be toggled.

BH can be a scope value too for consistency. It's only selectable on creation
and can't be switched into or out of, but having it in the same enum keeps
things uniform.

With scope carrying the backend, nice can apply verbatim on unbound and snap
to normal or highpri when the workqueue is on percpu, picked from the current
value. No need to restrict what can be written.

> Not done: the switching itself. concurrency_managed is fixed when the
> workqueue is created and is not exported through sysfs, so nothing takes a
> workqueue onto the backend or off it yet.

For PREFER_PERCPU type workqueues, which benefit from cmwq but don't depend
on it for correctness, there's no reason to block switching in either
direction. Having them follow the unbound cpumask when picking the queueing
CPU even while on percpu, the way the last patch keys that on WQ_PERCPU
rather than on the backend, makes sense for them.

Thanks.

--
tejun
