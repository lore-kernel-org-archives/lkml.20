Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E813B1B3
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859438; cv=none; b=NpitBnz9IrkEH8RYbSbuqkgFti3G8D9et80MEgCj+WUJ+UkW0vdtR0Lq7nNAWrQmwyV84p4R0ThV5NCWVdWnja9u2xIcGGObRC+wEQGU/VGE/OwlH95x+Qckp/Zb+XdPXIIM34kITINy5YXiaKL6dAK83FPt665/BCt2Jmv6gOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859438; c=relaxed/simple;
	bh=9HE/P4hZC1Jby8nmQJso4Jet2QV0MNRC5Nq3TmW0DB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fJXU/hDT0pFiHo/LpUNj90j7N7/SruJaU19Jbq+wozW3IUH1oktZXVFi+B6BJt5oQKkQPUB8TPxi8ITnGXss9KBxQPRrd4b3ktBYwBUcOBRODM2EUF3dD06WCA3FRJ3aCol2MgSY7Vpit0PXhHSjwHyn/inNM2bMTbHK99TF83o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cBV+kcEm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cBV+kcEm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27A061F00898;
	Thu,  1 Oct 2026 12:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790859436;
	bh=v3kuTJyWWmHgDNRH9mlAGfi6Y9YSMB7SSfbANvTZk9o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cBV+kcEmB5MvxILIoD2MEOB4xKKyhU56s8eoii68ybgdC78YWASYfLndkZJ4j8ML2
	 EIbjOnnq6awdfa7qEnpqY3g+CkDMlO6v2LpV8L9d/cDEGr0gMb3kyQg6FaaX1/60Zs
	 ztszFg1FTiRa2U0LLWzbISJ4UUWjGz4fJZIfKszr2+JHMlxPGHdSr3NJxdgAUzATy0
	 GJYDP78PD2wnlx1kkGnVZ1sxahJqvMDcpHZ+GlXQaLuXXVq7E9wU6BEtbre4xEchdT
	 JwqBOC7ZALqBHqQJcyPRM9MulIowdWt6XPvLZp4xG+NHNDQ0QTNWDQGAlA9nQuClxm
	 2jf2zTAn8URow==
Date: Thu, 1 Oct 2026 14:57:13 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: "Ionut Nechita (Wind River)" <ionut.nechita@windriver.com>,
	mingo@redhat.com, peterz@infradead.org, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	arighi@nvidia.com, linux-kernel@vger.kernel.org,
	dhaufe@simplextrading.com, create0818@163.com,
	frn1furkan10@gmail.com
Subject: Re: [PATCH v2] sched/deadline: Make dl-server nohz full aware
Message-ID: <ar5YqUCMbhZyjvtn@localhost.localdomain>
References: <20260513-upstream-fix-dlserver-nohzfull-b4-v2-1-d3e9cbe5c845@redhat.com>
 <20260924170402.521623-1-ionut.nechita@windriver.com>
 <araOR8aTAU_R5lwQ@jlelli-thinkpadt14gen4.remote.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <araOR8aTAU_R5lwQ@jlelli-thinkpadt14gen4.remote.csb>

Le Fri, Sep 25, 2026 at 05:07:51PM +0200, Juri Lelli a écrit :
> Hi Ionut,
> 
> On 24/09/26 20:02, Ionut Nechita (Wind River) wrote:
> > Hi Juri,
> > 
> > I have been chasing timer noise on isolated nohz_full cores for an RT
> > product and ended up on this patch. It does restore the CFS bandwidth
> > guarantee, but on the isolated core itself it trades the dl-server's
> > timers for a full CONFIG_HZ tick, which for us is the more expensive of
> > the two.
> > 
> > Below are measurements from two machines, a variant that keeps the core
> > tickless, and a hazard in the dl_servers_stop_all() call sites that an
> > equivalent change of mine ran into. The variant is not a replacement for
> > your patch as it stands, since it does not address the housekeeping
> > wakeups you are fixing, so this is more a "can we get both?" than a
> > counter-proposal.
> 
> Thanks for the detailed analysis!
> 
> I believe my v2 was never picked up, so I'm happy for you to send a v3
> modified with your approach. Keeping the tick stopped during the
> server's throttled window sounds reasonable to me. Having a proper
> single patch will make it easier to evaluate. Please do include the
> ext_server handling as well so we have the complete picture.
> 
> ...
> 
> > A separate observation
> > ======================
> > 
> > Independently of either patch, the CFS wakeup pattern changed between
> > v6.12 and v6.18. With the same workload, v6.12 serves the periodic CFS
> > task every ~50ms (199 wakeups in 10s), while both v6.18 variants on that
> > machine serve it once per server period (10 wakeups in 10s, ~1s worst
> > case). The bandwidth is the same, but it arrives in one burst per period
> > instead of being spread out. For an isolated core running a periodic
> > housekeeping task next to an RT application, that is a user-visible
> > change. Is the deferred activation expected to behave this way, or is it
> > worth looking at separately?
> 
> I think what you see is the deferred server model at work. The server
> now defers activation until zero-laxity. The dl-server is primarily a
> safety net to prevent complete CFS starvation under RT, not a latency
> guarantee, so the bandwidth being correct (5%) is what matters and how
> it's distributed within the period is a secondary concern. That said, if
> I understand your example correctly, that periodic housekeeping CFS task
> you have on the same isolated core of the RT application is relying on
> dl-server to be able to run? It doesn't seem a safe approach to me, the
> RT application should better ensure to sleep at times leaving space for
> CFS housekeeping task to execute w/o activating the dl-server?

I'm not sure I understand everything in this matter but in general
sched bandwidth is incompatible with nohz_full. It's about a single task
running so there shouldn't need to limit access to the CPU. And therefore
there should be no dl_server running there, right?

-- 
Frederic Weisbecker
SUSE Labs
