Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDAC2931DC
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073301; cv=none; b=nBlNJLeQNV8KsFiQGNckyQrgQndptp3eQj5lRqm5bl1XzKrEapd7Ro+9qlHRgruVBWtUHk7KfLk9Dx0eOEs94V1j82vuwJCdmhavAOF4+YaF1uTqOzh7LXgpC/vQ0P7r1U9wTViiWHYcV49A96XryUVtpgU9R9D82qPB45sPfyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073301; c=relaxed/simple;
	bh=gNf2+v1vHArppFDSfMqe7UtPUGlEYV+6AHW0gTlQ1jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DYu4mxvlkw1EjhL+EHfFrPkVltu1N65PPTa92+0RFvo1w2Kl8OpJ5Y9UbKqQz7SFwXY3qSaniebmFfS9O1pm5DS084/MPbWIQbg3VOkA67HFHF1z2drlDzCmP7fenXheqXc4qspzX92aSomqlsRhIwNXMQU+3nutOjGSe67T/hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=rHjgSZhq; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="rHjgSZhq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lD0XCleCmP0zs1cfTPh6j88beNkLlX2eyW8XI0RyBXA=; b=rHjgSZhqKai4vdHbqswFnmylIO
	LBG4qgRk6cHDPND3MyC6tBGEeRI1D3L/KslSwD/+Vt+IPrYxj9w4P+L4vWuOpGarWYN9akTA2CrIH
	AFikhbE88f0k0uw+tuxNYG8U927XOGViMAXIuuVXn63ofRYmAGlK/bm9qZtaaYkdkfx/gqan5KAva
	aRaHSVs6iRi1YyoBEKB5tG2kQTA+vPQAWkAv2eAfMeGlZFufuc+FwUq8ehpjKJdeTzdqn6Ghv1hgt
	cD68HdPUABKpKRzQQQt5OLh/0EAA//HZc+0IyyjWIAJRdjk6BIDmNnOU9/jhXeem8xpefgbIYipHK
	opr8ggtg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x8xps-002v8e-2Q;
	Tue, 22 Sep 2026 10:34:53 +0000
Date: Tue, 22 Sep 2026 03:34:48 -0700
From: Breno Leitao <leitao@debian.org>
To: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, 
	Marco Crivellari <marco.crivellari@suse.com>, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH RFC 0/3] workqueue: Take the pwq backend from the attrs
Message-ID: <arJO4eEGNzltAOk-@gmail.com>
References: <20260918-wq_final-v1-0-5c43c08a26bc@debian.org>
 <8a1437751a6da2c166284b1ca562fb0a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a1437751a6da2c166284b1ca562fb0a@kernel.org>
X-Debian-User: leitao

Hello Tejun,

On Fri, Sep 18, 2026 at 04:13:36PM -1000, Tejun Heo wrote:
> On Fri, Sep 18, 2026 at 07:25:32AM -0700, Breno Leitao wrote:
> >  * Keep wq->max_active and wq->percpu_max_active both current. The two
> >    backends meter work differently, and a pwq must not end up metered
> >    against a limit nobody set. (this is the semi-conflictual with my previous
> >    commit 27db9dd7f84f3a ("workqueue: Give percpu workqueues their own
> >    max_active")
> 
> Both should stay current but I don't think they should be the same number.

Ok, that means we are going to keep both as commit 27db9dd7f84f3a, and
keep both values set at a given time, and the values will be different.

> max_active means different things in the two domains, per-CPU on one side and
> across the whole workqueue on the other, so let's keep the two sets of values
> separate and link them through scaling.

Right, I will create a function that maps/scale one to another. Maybe
the following?

	 static int percpu_to_unbound_max_active(int percpu_max_active)
	 {
		 s64 max_active = (s64)percpu_max_active * num_possible_cpus();

		 return min_t(s64, max_active, WQ_MAX_ACTIVE);
	 }

	 static int unbound_to_percpu_max_active(int max_active)
	 {
		 return DIV_ROUND_UP(max_active, num_possible_cpus());
	 }

> On creation, the argument sets the
> values for the domain the workqueue starts in and the other domain is derived
> from it. Afterwards, each domain has its own interface, kernel and sysfs, and
> adjusting one updates the other accordingly. That way a switch always lands
> on a sensible limit without anyone having to think about it.

Sure, and probably call them from wq_adjust_max_active(), so,
independent of the one that is being set (percpu or unbound), it will
change the other as well according to the function above.

> >  * Create a ->concurrency_managed field in the wq attributes, used to
> >    decide whether to do concurrency management or not.
> >
> >  * Move WQ_PERCPU onto an UNBOUND workqueue with WQ_AFFN_CPU affinity and
> >    the newly created ->concurrency_managed. WQ_PERCPU is then only the
> >    promise that the workqueue stays on that backend.
> 
> I'd rather not build percpu on top of CPU scope. Unbound with strict CPU
> scope and percpu are different things. The pools, the metering and how the
> unbound cpumask applies all differ, and both should keep existing. So, how
> about making PERCPU its own scope? 

Ack! I will proceed with a newly created WQ_AFFN_PERCPU scope then.

> Whether concurrency management is then
> expressed as a flag or an attribute doesn't matter much as long as it can be
> turned on and off. WQ_PERCPU would mean that the workqueue can't leave the
> PERCPU scope while CM can still be toggled.

Oh, interesting, so, we are going to have CM toggable even for
WQ_PERCPU and also for WQ_UNBOUND+WQ_AFFN_PERCPU, is this right?

Once we have it, what will be the difference between
WQ_UNBOUND+WQ_AFFN_PERCPU+CM from WQ_PERCPU? They look exactly the same
from a user perspective, no?

> BH can be a scope value too for consistency. It's only selectable on creation
> and can't be switched into or out of, but having it in the same enum keeps
> things uniform.

Do you mean something like WQ_AFFN_BH or an entry in workqueue_attrs,
similar to affn_strict and the recently propsoed concurrency_managed?

I understand that scope means 'enum wq_affn_scope affn_scope', so, you
want a WQ_AFFN_BH, right?

> With scope carrying the backend, nice can apply verbatim on unbound and snap
> to normal or highpri when the workqueue is on percpu, picked from the current
> value. No need to restrict what can be written.

So, it means that we are going to expose the wq_sysfs_unbound_attrs to
WQ_PERCPU as well, and we are going to map nice to high priority queues
and normal queues. For instance:

  - echo -5 > nice succeeds and stores -5, whatever scope the wq is in
  - For WQ_PERCPU it runs on the highpri pool (nice -20 in practice)
  - echo 0 > nice, will turn the WQ_PERCPU workqueue into the normal
    pool.

Am I getting the idea right here?

> > Not done: the switching itself. concurrency_managed is fixed when the
> > workqueue is created and is not exported through sysfs, so nothing takes a
> > workqueue onto the backend or off it yet.
> 
> For PREFER_PERCPU type workqueues, which benefit from cmwq but don't depend
> on it for correctness, there's no reason to block switching in either
> direction. Having them follow the unbound cpumask when picking the queueing
> CPU even while on percpu, the way the last patch keys that on WQ_PERCPU
> rather than on the backend, makes sense for them.

let me back up a bit and talk about the scopes. The final state of the
scopes will be:

enum wq_affn_scope {
        WQ_AFFN_DFL,    
        WQ_AFFN_CPU,     
        WQ_AFFN_SMT,      
        WQ_AFFN_CACHE,     
        WQ_AFFN_CACHE_SHARD,
        WQ_AFFN_NUMA,       
        WQ_AFFN_SYSTEM,     
+       WQ_AFFN_PERCPU,                 /* one pod per CPU + CM + affinity */
+       WQ_AFFN_PEREFER_PERCPU,         /* one pod per CPU + CM + relaxed affinity */
+       WQ_AFFN_BH,			/* scope for WQ_BH */
}

Is this the final state you are envisioning?

Thanks for the excellent review and guidance,
--breno
