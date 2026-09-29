Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDB5530E0A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790692867; cv=none; b=VT9n8BJHye0OAIKl2rDpg3IkE30H94/l6XJKhDFtZ3iKGV1JPNSjhgtS4OGr0QmG/XVhdU/Iegqts3ViGXxlxftM65guiKub0rkrlsKnrK8Et/gnUQcHxGgqz+FBEAlUhY0H0AETOVwJR6FPCRpgTskA8fXP7ewza7ao+xJyvXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790692867; c=relaxed/simple;
	bh=eP6IkLTU9GzzyxyXPQFzqLgSIaHX1gDJ/z9Vd+Sz9zg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qp4Hq7K7BQrViRlfdCjglPtVfD2v+H7L1e8si524UBjp2I5sgNJ+wXh9Ljs6s1/69Mmn85xMT7/1CMtKTC9DSQ4xv1v3eBnhWvugE/fG5A8B/jQgonDkI++mk+CtrSuxSk/iKh8uuE3yYHtPw4670z+a6RQh+6dWhFxxzZXrjUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=c0wCDkMf; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="c0wCDkMf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+cda74Tbl3la0e4Lr3R/amwawlQi9HkJDH0Uf2cIhFA=; b=c0wCDkMfhcT18J9AevFaOh/eG8
	AhU6maKihhCo9lkNFj6E8xDCSw/qhWM8NdZemAw9SScIdwR0UUbgq68loYJolGv1o4MX6qzAyxsak
	fSVyMpA7Gbax9p48Xh5X0RSqhNRBZY99DKaR+X3azz+Z9wdTE0zB0mEpODAR/d5wwlHFyMmXfzInS
	kvf+8DgIv6MGYF8fvLODRWKiR+IU/XNLRq1hclqqCOPSc9/PKC2D6vSO3C5a8UsLjKKqsOf4GrQZw
	PzjpUo/9Z43LXVIqIGTokKeOs5oPPorn0jO9GAZDj1nmgfxibGW/nUoUXuNxWVXsWsBQ3/6+0OlZ2
	Ka1GUeeA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xBZ0r-008TrU-2j;
	Tue, 29 Sep 2026 14:40:58 +0000
Date: Tue, 29 Sep 2026 07:40:54 -0700
From: Breno Leitao <leitao@debian.org>
To: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, 
	Marco Crivellari <marco.crivellari@suse.com>, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH wq/for-7.4 v2 2/3] workqueue: Keep the limits of both
 max_active domains current
Message-ID: <arvJTBx7L0oSuPDm@gmail.com>
References: <20260925-wq_final-v2-0-860ee052169e@debian.org>
 <20260925-wq_final-v2-2-860ee052169e@debian.org>
 <79e8fdf844e1aa9358dd4c2c3e5f888b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79e8fdf844e1aa9358dd4c2c3e5f888b@kernel.org>
X-Debian-User: leitao

Hello Tejun,

On Mon, Sep 28, 2026 at 10:15:31AM -1000, Tejun Heo wrote:
> On Fri, Sep 25, 2026 at 06:09:51AM -0700, Breno Leitao wrote:
> > Given that we are introducing a WQ_AFFN_CPU which will be able to do CM,
> > we want to keep both values set, so, the transition from scopes would be
> > able to succeed.
> 
> This would be the new PERCPU scope rather than WQ_AFFN_CPU.

yes, sorry, that is waht I meant. 

> > +	int nr_cpus = wq_nr_online_cpus(wq_unbound_cpumask);
> 
> Workqueues from workqueue_init_early() and early initcalls are created
> before smp_init(), when only the boot CPU is online, so nr_cpus is 1 for
> them. For example, system_dfl_wq ends up with percpu_max_active 2048 where
> 32 would be right on a 64 CPU machine, and nothing rederives it once all
> CPUs are up. Maybe rederive the other domain in workqueue_init_topology(),
> which already walks all workqueues to update node max_active?

Very good point, and I've just tested it and reproduce the behaviour you
raised.

> 
> > +	} else if (wq->flags & WQ_BH) {	/* BH implies !WQ_UNBOUND */
> > +		wq->max_active = effective_max_active;
> > +		wq->min_active = effective_max_active;
> > +		wq->percpu_max_active = effective_max_active;
> 
> Maybe set these in the WQ_BH branch at the top so that BH is handled in one
> place?

Ack!

> >  	} else {
> >  		wq->percpu_max_active = effective_max_active;
> > +		wq->max_active = wq_scale_to_unbound(effective_max_active,
> > +						     nr_cpus);
> > +		wq->min_active = min(effective_max_active, wq->max_active);
> 
> max_active can't be lower than percpu_max_active here, so min_active can
> just be percpu_max_active. Same in workqueue_set_max_active().

Ack!

> >  	max_active = wq_clamp_max_active(max_active, wq->flags, wq->name);
> > +	nr_cpus = wq_nr_online_cpus(wq_unbound_cpumask);
> 
> For unbound workqueues, nr_cpus should match what
> wq_update_node_max_active() distributes max_active over, the online CPUs in
> unbound_effective_cpumask(). With wq_unbound_cpumask, percpu_max_active
> comes out too low for a workqueue with a narrowed cpumask, e.g. 8 instead of
> 64 for max_active 256 on 4 of 64 CPUs. Same in workqueue_set_min_active().
> wq_unbound_cpumask is right for percpu workqueues.

Right, thanks for catching that. I'll change both setters to use
unbound_effective_cpumask() once the workqueue has a pwq installed, and
only fall back to wq_unbound_cpumask before that (percpu workqueues, or
unbound ones still being set up), so it lines up with what
wq_update_node_max_active() already does.

Thanks for the review,
--breno
