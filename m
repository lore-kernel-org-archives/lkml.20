Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A8343F4A1
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787823601; cv=none; b=qqj8Vso4XSeK2XZjSgpe/uc1Ab9WNRrVOS3F/mrbezBLgntJF6h10yxQEiWHvQPSgTK185tCuOIXOpfn1UpnmaQRtD47ReDTWh2PBuZSHOcRMrIOF/PgnpX/pymgyJ+8m5BG99MxWGho3V2pHJbw8oyx5RM46cSMmEyRwXPGhOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787823601; c=relaxed/simple;
	bh=CLXuh/vcHXcEvxacKyzlkbGPnkYNV6xZf+h6lmkcAlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=On0F70zhUsNuYr7BPCgikEfanTNAVXyKqXUa59PI+IFqq6bu3pEdGDvcYVImmdgqUZnYjpXu19P2vQzcj66WDQ6wcIqv2BCd/FcnpjozBgHphOYEhGlYOSFoCelYmUvTXgp/NZYHGFKtbct9giuqMRYZLRqPUZ1ZTsD5uRC30hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=QquS7DEO; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QquS7DEO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/AhnVGtj/w5D4VEBrq9xUEIQ9XIwF2qM9q6258calAE=; b=QquS7DEOLfr2xDgJbJkiGgJuH3
	bASzvjGbJY+lMpmjgvok9V8Y0YS4KPpUWApzqgAUvi5ZM0u6tNGmhnmx9rQLuBPOXhACnrAs2mH5n
	XD/y64P+N0ti3NI8+d5ApsjEiv1pvJtcHKe72C6V3KAnyoGIrFTFLYp5u2hbxOOYW+kQL4O5So7sv
	mmW/1eIQgdeP5hKAWgbYjNFYIi75Y0trI+77MtWcv7CBfBE8H5Y5V1y5SbScAehHaMbf2kV6PxRwu
	x1fxDaTUyBnJfoSlYjupmoMnQX9z15dyFZQxU1faSDjCRgr4CO/Mebkwo4s2MDDdYObUNsFJq5RUe
	8zuua3mg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzWa8-0000000CTnG-3ZFJ;
	Thu, 27 Aug 2026 09:39:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 75CAA30057C; Thu, 27 Aug 2026 11:39:35 +0200 (CEST)
Date: Thu, 27 Aug 2026 11:39:35 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	paulmck@kernel.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
	kprateek.nayak@amd.com, zhanxusheng1024@gmail.com, neelx@suse.com,
	chjohnst@mail.com, mproche@mail.com, sean@ashe.io, steve@abita.co,
	rishil1999@outlook.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/6] sched: Annotate rq->rd with __rcu and update
 lockless readers
Message-ID: <20260827093935.GE4121339@noisy.programming.kicks-ass.net>
References: <20260826224238.936456-1-atomlin@atomlin.com>
 <20260826224238.936456-2-atomlin@atomlin.com>
 <20260827073036.GC4121339@noisy.programming.kicks-ass.net>
 <36maob3lfrzbuktn6qii76rxdyt5bphjauc7dwg4rkmmgljqq2@j46iffegq6hd>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <36maob3lfrzbuktn6qii76rxdyt5bphjauc7dwg4rkmmgljqq2@j46iffegq6hd>

On Thu, Aug 27, 2026 at 05:35:44AM -0400, Aaron Tomlin wrote:

> To solve this cleanly, I propose introducing a concise helper, for the ro=
ot
> domain in kernel/sched/sched.h mirroring rcu_dereference_sched_domain(p):
>=20
>     #define rcu_dereference_root_domain(p) \
>         rcu_dereference_all_check((p), lockdep_is_held(&sched_domains_mut=
ex))
>=20
> This covers both the update side (under sched_domains_mutex) and read-side
> contexts (under rq_lock(), preemption-disabled, or RCU read locks) via
> rcu_read_lock_any_held(), while keeping the call sites clean and
> eliminating Sparse warnings.
>=20
> Would you prefer rcu_dereference_root_domain(p)?

Yeah, but I'm not sure I see the point of adding it, as it is exactly
the same as rcu_dereference_sched_domain(). The root domains are part of
the sched domains, so it doesn't seem wrong to me to use that existing
one.
