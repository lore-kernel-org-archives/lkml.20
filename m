Received: from mta0.migadu.com (out-54.mta0.migadu.com [91.218.175.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211AC446BE1
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789110172; cv=none; b=bFGbnfMOZmBYt0JTPUMuoCIxuzi6kFHWqJzay8ZncElSfO+TroYQlnUV/UcXKZBFpaAVU3rsnlTluWiWFbJOiBVKeC5yJM52bJhWV2kbdDMLUbQHU5QoIvy7XUdsr39V+MEvxgWP1j1uID1q3IOpvaZlQRdW6SW3yrlArucocCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789110172; c=relaxed/simple;
	bh=+g+42iif6IVcRrIokUZrLgCvAoBdHhejpcI6IQl7UoA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CSdO6wNA+WeM9ktpZlLg1YSCK/Q3XjmZd0yC68IXp9ZnJocZ5U4l4uJ++g23+YO4pDGPJD4cbBhDoy3fu0eYCrOMb3G1z+rtATn7x0XWNYFqkTldDHrcHA3C/2psSmFjpuFt9gwOrSttIuj75fSC1PnHAvHMNSSM8USdlnUT7R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PIFQsalt; arc=none smtp.client-ip=91.218.175.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PIFQsalt"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+g+42iif6IVcRrIokUZrLgCvAoBdHhejpcI6IQl7UoA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789110150; v=1; x=1789714950;
 b=PIFQsaltAbdnzFbWxqypyJGlCSF/Awvx81yOfeb/UzHcix3h7aV9yV+FaHNKBdFejtspTMHG
 ewAjdQFIUDqn+iblsrHUxND6yTul596RBkxv7SKwDKYZK/Zf1hTAK6DhWESQ5uUwLx6kG4oRI2W
 PLVzh9Tq/iIIBhAlT66OFesg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c6938da83adc86f0;
	Fri, 11 Sep 2026 07:02:30 +0000
X-Mizu-Trace-ID: c6938da83adc86f0
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384c4so2493e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:02:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzow27EmrMXPHY35PCjMjFQK5zVT6UCh97horDIVzR+dLPiSieNR/Apx/5/N0DL+qXDuvL8Z2W6Ipncvn0=@vger.kernel.org
X-Gm-Message-State: AFuF++m4+vpQhtCDbf+ZnUryVBFPDmzdzATcS/DXo6QMbKIw8v1HTwSg
	fnTZwmg/CgV4bMaf0/Ia1pDFGRilo+k1PLTcuGwpJwo3znrS7xV23Jb0TjNRSGruFQOST9BJBPV
	7Q/XmLGKeLAZMgn0vMqL3tg4jcUIdKh5U8gnK/R5F
X-Received: by 2002:a05:6512:460f:b0:5ae:b9c5:f29f with SMTP id
 2adb3069b0e04-5b8a05a180fmr90471e87.2.1789110143622; Fri, 11 Sep 2026
 00:02:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908145651.2828597-1-fuad.tabba@linux.dev> <aqKJM3CF-i3VyJk2@willie-the-truck>
In-Reply-To: <aqKJM3CF-i3VyJk2@willie-the-truck>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 11 Sep 2026 08:01:47 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwxm1BxDq2Aqy2tfF0sXRZvfRLiSn5jaHYf=g1S2ARHRA@mail.gmail.com>
X-Gm-Features: AcwNN1XCuogT4WkezybFayrxqhUNrhZMDnWGz-WkLBJOTExg2uTnRtgxv1nD4YU
Message-ID: <CA+EHjTwxm1BxDq2Aqy2tfF0sXRZvfRLiSn5jaHYf=g1S2ARHRA@mail.gmail.com>
Subject: Re: [PATCH v2] KVM: arm64: Trap guest MPAM accesses whenever MPAM is implemented
To: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, James Morse <james.morse@arm.com>, 
	Ben Horgan <ben.horgan@arm.com>, Xi Ruoyao <xry111@xry111.site>, 
	Mark Rutland <mark.rutland@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Gavin Shan <gshan@redhat.com>, 
	Yuan Yao <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Sept 2026 at 11:40, Will Deacon <will@kernel.org> wrote:
...
> > +static bool
> > +test_has_mpam_sysregs(const struct arm64_cpu_capabilities *entry, int __unused)
> > +{
> > +     /* The registers exist whether or not firmware enabled MPAM. */
> > +     return detect_ftr_has_mpam();
> > +}
> > +
> >  static void
> >  cpu_enable_mpam(const struct arm64_cpu_capabilities *entry)
> >  {
> > @@ -3116,6 +3123,12 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
> >               .matches = test_has_mpam,
> >               .cpu_enable = cpu_enable_mpam,
> >       },
> > +     {
> > +             .desc = "Memory Partitioning And Monitoring system registers",
> > +             .type = ARM64_CPUCAP_SYSTEM_FEATURE,
> > +             .capability = ARM64_MPAM_SYSREGS,
> > +             .matches = test_has_mpam_sysregs,
> > +     },
>
> We already have two system capabilities for MPAM so I'm not overly keen
> to add a third, especially as the MPAM code is largely confined to the
> resctrl driver. In fact, this feels a bit similar to things like TRBE
> and SPE in the sense that (a) we have to probe it per-cpu (b) it can
> be disabled by a higher EL and (c) most of the code is in a driver, but
> KVM needs to know how to switch it.
>
> Neither TRBE nor SPE need entries in arm64_features[] at all, so something
> isn't right here...

I think I've overthunk it. The problem isn't in what the host is
doing, but that KVM is basing its traps on whether MPAM support exists
and whether that support is enabled.

V3 should be more in line with what you're suggesting...

Cheers,
/fuad

>
> Will
