Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BC63D9022
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030427; cv=none; b=k0TMAcx059cWgqg4AzESLGl9qF0edh4EPxnlVcyNbCFugKGklUAGoipGOyFW6fWl2znn1GIcqcgn6CcDXO5jhVrCfDWvFaTDuL6QB5RwFnRQjezhpHvlNm7B5yGuAwMQCu5mB+iBB3tlpMyFnNgUAVhtIAmg9BWejyP1UN+uasI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030427; c=relaxed/simple;
	bh=HKv0EMcDth6nenwAesL83sIvUM1qTYVv93CO8tVwKns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jyplOO4c/+z6NrgKjl0nQ+n+71WiQVryqegV/bZY/mOVMAUCFhRP8bO0Fbh1DnEALnP64x8zM2GrxW2oieFe+D9QRm2xhNb49xY/6LQgGoVsIcKAN+p5wqzaxDWjCha9b+eFgenSmmovLZaKAz6FUOFBlEQWIRWuKBFIu5xWXAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZfTZGCTU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZfTZGCTU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8CA11F00893;
	Thu, 10 Sep 2026 08:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789030425;
	bh=ic/LkmLOXogubKe3BAPte7eEtUqLwk2XroTu3Q+0VD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZfTZGCTUO6fwaS0Y9cDQGvUNcotSSeNzpiBqLyI2mBO6yQDtZxTlxbWtTX3ACYhrt
	 uuOJ8ZbwcTMRqFtSVqsptTy7Hb0CQ/3JA7lspIvmoWfahG0hAwUP+0f4od4i6jt4+t
	 G23pDPPtt8Kd1ju0GaOcTrHVFCSMV3V1xGNjcGph8o5EVdjiTVu1IcBXR0Eq58mm28
	 hAIBsQ/Q0fqJA/9CPoilCVx1qUaleBprjgjO9lnNqZIN+8HKWjOoJ/wdllvbRoTJT0
	 ZRZ17SrcAnYlfFLr0CN+PqMoODAQbfXEGC9/YedX9Ew6Ln/+FZoEawYUEasQpIGyZI
	 xBPv+Abt6HY+w==
Date: Thu, 10 Sep 2026 09:53:38 +0100
From: Will Deacon <will@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Phil Auld <pauld@redhat.com>, Breno Leitao <leitao@debian.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: topology: Prefer PE0 on NVIDIA Olympus SMT
 cores
Message-ID: <aqJwEpnrmqnEzpui@willie-the-truck>
References: <20260909062649.469633-1-arighi@nvidia.com>
 <20260909062649.469633-2-arighi@nvidia.com>
 <aqF8euAA8wLmr4w1@willie-the-truck>
 <aqGEKHfxcOzYiuBy@gpd4>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqGEKHfxcOzYiuBy@gpd4>

On Wed, Sep 09, 2026 at 06:07:04PM +0200, Andrea Righi wrote:
> On Wed, Sep 09, 2026 at 04:34:18PM +0100, Will Deacon wrote:
> > On Wed, Sep 09, 2026 at 08:26:08AM +0200, Andrea Righi wrote:
> > > diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> > > index d28438f8b83f1..e5a7a4b2e3844 100644
> > > --- a/arch/arm64/kernel/topology.c
> > > +++ b/arch/arm64/kernel/topology.c
> > > @@ -19,6 +19,8 @@
> > >  #include <linux/init.h>
> > >  #include <linux/percpu.h>
> > >  #include <linux/sched/isolation.h>
> > > +#include <linux/sched/topology.h>
> > > +#include <linux/smp.h>
> > >  #include <linux/xarray.h>
> > >  
> > >  #include <asm/cpu.h>
> > > @@ -44,6 +46,55 @@
> > >  static DEFINE_PER_CPU_READ_MOSTLY(unsigned long, arch_max_freq_scale) =  1UL << (2 * SCHED_CAPACITY_SHIFT);
> > >  static cpumask_var_t amu_fie_cpus;
> > >  
> > > +/*
> > > + * Switching the active PE on an NVIDIA Olympus SMT core can keep the core in
> > > + * two-thread active mode, with resources partitioned between the PEs.
> > > + *
> > > + * Prefer PE0 so PE1 can remain idle and the core can stay in full-resource
> > > + * mode. Firmware does not currently describe this preference, so detect
> > > + * Olympus by MIDR until a firmware interface is available.
> > > + */
> > 
> > Fix the firmware?
> > 
> > If we add this MIDR kludge, I guarantee that it will never be fixed.
> 
> Understood. The existing PPTT already describes the SMT relationship, but as far
> as I can tell ACPI doesn't currently provide a way to describe a preferred SMT
> sibling. Both PEs also have equal isolated performance, so representing this
> using different _CPC highest_perf values wouldn't accurately describe their
> capacity.
> 
> I'll drop the MIDR-based enablement and coordinate with the firmware team on a
> proper ABI.

Thanks, Andrea, I must confess that I wasn't expecting that!

> In the meantime, for systems with the existing firmware, would an explicit
> kernel boot option be acceptable as a fallback? It'd enable SD_ASYM_PACKING at
> the SMT level and prefer the primary PE, but only when requested by the user;
> the kernel would not infer this policy from the CPU model.

I'm ok with that.

Will
