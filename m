Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E56562609
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789063007; cv=none; b=P6S7A4fisJ6o76UVhg/tKG1NmUeKKIrQQ9aQkdoh3KJjgYpaCQ1QO0T4TBl1PuQKbgn7lwK51CZ1mnVN7cB+gpsJtd7dxtZo/Gr+1pd6BCDGpQBh1pnOO5xtTRsVHSzjp8cotga9R4rv08vpefSsRHlIEWExJKjEvFuuSjTrjKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789063007; c=relaxed/simple;
	bh=xLDdELpaZ92ME6nkeZN2fNUTDVi3mQx5ZlLrH57VYP0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=h/c4OlyVycOxPv10S/0e9ZrQ9PM8rfNXeuF5Fvh1Ol033XQ9MYmEFqdtOiPhypVdHzFtGCIYujlYQTKebb1RUWTeTxw4cT2OYRG6zDnnIM0AADLBIcaRzT32///x9dzeyPlK+On6m5cyHSCHD9wO+8gZbarJuj4ZQf/q1/pJ8vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tea7fuoo; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tea7fuoo"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb835525b10so102227a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789063005; x=1789667805; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X3fQxh9g5ajoX8Y1OGK5G6oHwPA/wuRadJNv+BCxKRo=;
        b=tea7fuooeBGrrANqJxhyTk9V3lHc70XXj09YsyU6fy0rAV6AinDB/L2b6L5FId48dO
         mbw0X5bljgCDfu157xeETUhzZ992dQ6Oj3aXjIFeh61XLsIYn6iSbeuPe0f7Fctau1VE
         kdFaLlgHROL9Q4zOGxPPAdSeFPFrZmGHWWkv7hS6BnOavsvGhT8kAPDrzQMACo56nUbh
         vhRm87T2jwvhnAg2AZPt3eedPAANW5ZgaBeR0lL1mWjlNhG+6zA6AHVWXJtuLv4nL1R4
         YxTWUNtAWY5XVkoWKoB+qB7Q2Hjc2wETGtFKN3zbIcoDrARbXVnrW2spoYGM6Rv4C+53
         g0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789063005; x=1789667805;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X3fQxh9g5ajoX8Y1OGK5G6oHwPA/wuRadJNv+BCxKRo=;
        b=cl3ClU085XXuFYkolP51i+2+p52Dz1swZWdsNc0weJgr1NzR73qAkISvH8QhP4FedS
         cD93pYcnXTSlwrNtw6DGtLCU0YRp0wba1nizf6RyjshmfkH7uOF0tFTuNX0F1yKEJqQI
         qDrwkhVsGZlm4Wv0sNG5yi8rVkx6wcV6NnSQemTROCP/FVq3G9fZpLluETAVL264fczq
         s+4jUvBLkC67uVYzG4cMKFWjFgXnbdbykCrVwjzhvjeYK4tGYR1wPPokYxPGREfhAmXs
         jEv5W/faTmwCSHtjJEmeVKljVZvIewxqzF7fNIN3mAW1idkP/UAAW2wgbBrQoqMpIsXp
         06BQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRZZ7ivcpF9Tqp6HMSMKh9Az73wbVXY2apjOwjTOp5uGA5JZjQ1F/y7Xt1aPiBzYeGKvjnAZEuQc1ugqQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mDgV1BVMNma/j8kfKvS7W8Po5xCvfnBdKDN0aIdXhkdtTQj0FJ
	etZfX6nfI3lkwHhIfgoxEOU757bFFNccRVQbK9CSEmrKGbrM3mJKy/GK+FVndZNpb0FoU0U4K3f
	G3TjwxA==
X-Received: from pgmm13.prod.google.com ([2002:a05:6a02:550d:b0:cc4:a477:43cc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:bea6:b0:3cd:9bb1:c6f5
 with SMTP id adf61e73a8af0-3daed1fa6f1mr77071637.10.1789063004860; Thu, 10
 Sep 2026 10:56:44 -0700 (PDT)
Date: Thu, 10 Sep 2026 10:56:44 -0700
In-Reply-To: <anTB6ksbUs18FEf1@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260508231353.406465-1-seanjc@google.com> <anTB6ksbUs18FEf1@google.com>
Message-ID: <aqLvXM5SPPlQePXs@google.com>
Subject: Re: [PATCH v3 0/9] perf/x86: Don't write PEBS_ENABLED on KVM transitions
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Jim Mattson <jmattson@google.com>, Mingwei Zhang <mizhang@google.com>, 
	Stephane Eranian <eranian@google.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Aug 06, 2026, Sean Christopherson wrote:
> On Fri, May 08, 2026, Sean Christopherson wrote:
> > Sean Christopherson (9):
> >   perf/x86/intel: Ensure guest PEBS path doesn't set unwanted
> >     PERF_GLOBAL_CTRL bits
> >   perf/x86/intel: Don't write PEBS_ENABLED on host<=>guest xfers if CPU
> >     has isolation
> >   perf/x86/intel: Don't context switch DS_AREA (and PEBS config) if PEBS
> >     is unused
> >   perf/x86/intel: Make @data a mandatory param for
> >     intel_guest_get_msrs()
> >   perf/x86/intel: Invert names of intel_ctrl_{guest,host}_mask
> >   perf/x86: KVM: Have perf define a dedicated struct for getting guest
> >     PEBS data
> >   perf/x86/intel: KVM: Handle cross-mapped PEBS PMCs entirely within KVM
> >   KVM: VMX: Drop a redundant pmu->global_ctrl check when processing
> >     pebs_enable
> >   KVM: VMX: Only tell perf to enable PEBS counters for fully enabled
> >     PMCs
> > 
> >  arch/x86/events/core.c            |  5 +-
> >  arch/x86/events/intel/core.c      | 92 +++++++++++++++++++------------
> >  arch/x86/events/intel/lbr.c       |  2 +-
> >  arch/x86/events/perf_event.h      |  7 ++-
> >  arch/x86/include/asm/kvm_host.h   |  9 ---
> >  arch/x86/include/asm/perf_event.h | 11 +++-
> >  arch/x86/kvm/vmx/pmu_intel.c      | 28 +++++++---
> >  arch/x86/kvm/vmx/vmx.c            | 10 ++--
> >  arch/x86/kvm/vmx/vmx.h            | 15 ++++-
> >  9 files changed, 114 insertions(+), 65 deletions(-)
> 
> Ping.  This still applies on Linus' tree and against tip/master.

Ping again.  This fixes a real issue and IMO provides much-needed improvements
for the KVM<=>perf APIs.
