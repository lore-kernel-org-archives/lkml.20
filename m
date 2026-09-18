Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB4051599E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789749012; cv=none; b=NS6F9NlnV0GbLzEySDKl3vVauCWGu2asvHsiq0jk5Iwrt04rEUDsnwUNKAHEZ72zz2IKyuNDfXYSPGRPEVIX0n3OGsT62h2KJkObe8cvP7iVzlkaj2rHohonVJ2itw58+PbUtQlunQiYaNzNMuJScvnl6jFzICfaM/1iOVubALA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789749012; c=relaxed/simple;
	bh=O+UBJr3gFAX4TinUIRjZUyiXmreSVDUomUUj2Aj1ptQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TdVLjO5OOlNGSqrqZQCOhy7M36NAKvc3QGmGrqBUZweFO8aYh5aWu4v+GUh5Mpj4q0UP0fHLrTXihAsMl0FCScKyuBpJFpONVZokP4jI3VkEja7ev1AfwBnTqBF/GbD/cwX7Mb++qcNxwhOJPoIlmmr1HDP4zKbqjet/rRlcmRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MOon/fPZ; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MOon/fPZ"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2db8e9fe9c7so13476065ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789749010; x=1790353810; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=99erlflp2aCrSG4QDyPZLxsRtq+Uqca0X+Eqb36V21w=;
        b=MOon/fPZWzbK/s3WHjXvAzIQ9LTqwWE80w3GUMp/X0GhYu2HpaX/fVRXrf6BFQC5zo
         QJvQsMcLEysQByVbCfQbvBfcgVgSucfliU2rdKnYsifQSsYrbRPzF1W+e8jUbnY52JUo
         I8AxZvXDCvmLSD6pW3cQy/GnXTOV6yRntFhBfHZgPY+3dppUWWZ4ga3GIO29dp9Xp+PB
         deEDd6Lgl63SNJVuo3Jz7CLaejWRE7VyvDBYQg/FQKDCs6WmTjGxGAgORmWoK3lwPQHL
         KtLHeKSDzfCeZ8rKoekDudFEfrzrh1zfZh+RHcfZfTbdjXpcfEyn1s8Fi0barWgZlHB1
         FRNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789749010; x=1790353810;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=99erlflp2aCrSG4QDyPZLxsRtq+Uqca0X+Eqb36V21w=;
        b=GpxXt5CPMS7Mf8Rpg4UuKBf7mpleuEVheUaNdEPbK5RauW2JvmfCb9B1MwoYC1LaF6
         OOgIDKPIByuGI7gA9UIhptDiTJaJ5b7pOXasNo7g9bxycC+eb8ghqWpc+BoD9G2B50Bf
         b4SBfAQ5O8fEXr+V9sp2FVv9sw7vyBwAhiUR8SuGb8HVjvfz4NpRl63p+nRUZ456kipD
         MzlPru+N/6XKwOSWDM53Sve//nCgBvLi06rO7qFLueijWFES0480JlIwLJuD+pBoMAQR
         BZa3g9Do0XYDeVrd6GQriPolIFq6Xe4h9KL3VOE3D8EEYcTTeEQr4MFgwCwUCeuHeCd8
         RLIA==
X-Forwarded-Encrypted: i=1; AKwUvBxj1g4tbh3jp4EyX6G7ig3AI3LMMROnqE3eXTPfAo5/WjEI2RiSHfrnWRUrH0wjqBQNzVbOUMXFalb8UKE=@vger.kernel.org
X-Gm-Message-State: AFuF++kqb9GRgDKxhZFc+C9t61Sl1CSaQM7FjUwZC5tLyvi0dMIaFUoC
	S2oXaOPK6H89/8BR9QLDh4I2UZA67VNGIwrOG3eRCLCQ5uWUzB7GH14fTmzvYlsw+BT88r8FWYN
	ogKbZBw==
X-Received: from plw15.prod.google.com ([2002:a17:903:45cf:b0:2dd:b2b9:91a7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f792:b0:2dd:ad74:ac82
 with SMTP id d9443c01a7336-2ddb1bbff1emr67985325ad.29.1789749009925; Fri, 18
 Sep 2026 09:30:09 -0700 (PDT)
Date: Fri, 18 Sep 2026 09:30:09 -0700
In-Reply-To: <20260917102314.GI776954@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260508231353.406465-1-seanjc@google.com> <anTB6ksbUs18FEf1@google.com>
 <aqLvXM5SPPlQePXs@google.com> <20260917102314.GI776954@noisy.programming.kicks-ass.net>
Message-ID: <aq1nETs-EO0B7NLj@google.com>
Subject: Re: [PATCH v3 0/9] perf/x86: Don't write PEBS_ENABLED on KVM transitions
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Jim Mattson <jmattson@google.com>, Mingwei Zhang <mizhang@google.com>, 
	Stephane Eranian <eranian@google.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Sep 17, 2026, Peter Zijlstra wrote:
> On Thu, Sep 10, 2026 at 10:56:44AM -0700, Sean Christopherson wrote:
> > On Thu, Aug 06, 2026, Sean Christopherson wrote:
> > > On Fri, May 08, 2026, Sean Christopherson wrote:
> > > > Sean Christopherson (9):
> > > >   perf/x86/intel: Ensure guest PEBS path doesn't set unwanted
> > > >     PERF_GLOBAL_CTRL bits
> > > >   perf/x86/intel: Don't write PEBS_ENABLED on host<=>guest xfers if CPU
> > > >     has isolation
> > > >   perf/x86/intel: Don't context switch DS_AREA (and PEBS config) if PEBS
> > > >     is unused
> > > >   perf/x86/intel: Make @data a mandatory param for
> > > >     intel_guest_get_msrs()
> > > >   perf/x86/intel: Invert names of intel_ctrl_{guest,host}_mask
> > > >   perf/x86: KVM: Have perf define a dedicated struct for getting guest
> > > >     PEBS data
> > > >   perf/x86/intel: KVM: Handle cross-mapped PEBS PMCs entirely within KVM
> > > >   KVM: VMX: Drop a redundant pmu->global_ctrl check when processing
> > > >     pebs_enable
> > > >   KVM: VMX: Only tell perf to enable PEBS counters for fully enabled
> > > >     PMCs
> > > > 
> > > >  arch/x86/events/core.c            |  5 +-
> > > >  arch/x86/events/intel/core.c      | 92 +++++++++++++++++++------------
> > > >  arch/x86/events/intel/lbr.c       |  2 +-
> > > >  arch/x86/events/perf_event.h      |  7 ++-
> > > >  arch/x86/include/asm/kvm_host.h   |  9 ---
> > > >  arch/x86/include/asm/perf_event.h | 11 +++-
> > > >  arch/x86/kvm/vmx/pmu_intel.c      | 28 +++++++---
> > > >  arch/x86/kvm/vmx/vmx.c            | 10 ++--
> > > >  arch/x86/kvm/vmx/vmx.h            | 15 ++++-
> > > >  9 files changed, 114 insertions(+), 65 deletions(-)
> > > 
> > > Ping.  This still applies on Linus' tree and against tip/master.
> > 
> > Ping again.  This fixes a real issue and IMO provides much-needed improvements
> > for the KVM<=>perf APIs.
> 
> Right, finally got around to staring at them. How did you want them
> merged?
> 
> AFAICT 2-4 have Fixes tags and should go in perf/urgent, while the rest
> goes in perf/core?

I was going to say "just put everything in perf/core", but given that 7.3 is the
likely next LTS, I agree that we should patch 2 in particular into 7.3.  FWIW,
after looking at this more, patch 1 is more of a fix than I realized (it too will
have a Fixes tag on the next version).  It *should* be a glorified nop, but is a
decent defense-in-depth change, so is probably worth putting into perf/urgent as
well.  That would give a nice split of 1-4 to perf/urgent, and the rest to perf/core.

> /me tries and finds patch 5 doesn't apply.

I'll send a v6.  After reading through all of this again, I agree with Dapeng[*]
that it's worth fixing the flaw Sashiko pointed out (I'll tack on a patch).

Thanks!

[*] https://lore.kernel.org/all/a0fdbd96-3a4d-4a32-92ee-cf2b47db59db@linux.intel.com
