Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794337545;
	b=slQmIupGUyX1OSZxsVSTn1OJLowp05a3IH4cim/awdo01hJdYqwrvu4x+Mo3UfqiCBu1
	 R2LYaiw0o826VOLktdXKcJLnYm9zNPRZVcKhmAvClfmoNS1Lo7nZ6bTg75PrIOLrkiQEj
	 S0590cu+OoEZkq+xcasHEvqtYDMDWsMfrEn7GtEXMHuy2Eo7jCKaXG8nix6KEKGgQIL69
	 39Hf+uKmiGu04dzzmjFSFsNqlKEe3FrDT+xBuZxq3WxbU/PNmgKqKU6G27H/S/ZF7WWz2
	 pPi6fJQPTztuZPap/GggP0dBXxNpw4x0wRUxRrWigsETDL7K7AL+C/4atM5zNRkG1Hw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=anLt6qagkph9XR8vpxxzxpgqvxbcb9YqldFXaQ5KeM4=;
	b=m9dMxo+sWf5ZiJk9wBNWTy1QWWRASvwDf7X6iwQxSLGidtB7noo6d8q5a0SlJhWq/L+/
	 +QtNuCDUzmRNulTh9EclGmC3iR0quBB1BoCq56Z4RrQog2InzG18sZFptaPxB3Z2PpcjH
	 5ADZ6f5S+RwBVMafM9/tBPYTX6/SK+MVlAZ1tEjS5Rw4WcuhBJoSG1iY9e8rtcrVAtkmN
	 0ybYU32xS2bF1mOjKA3Lda5gqMJIWSSNX9xUHPiiWiQn0S8u4GQHcgXsu/PXt5DIid+lz
	 SJPmVB7TUNg9oNzoufMOiAL2XhfJyp4PGU7vNdI6G1KEFoTSvpqZ/YJgBKnaDIgaEjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FoPrCu+l;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D898606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:05:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D898606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FoPrCu+l
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso1609780f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:05:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794337544; cv=none;
        d=google.com; s=arc-20260327;
        b=FjhO4u0wubUpwTtLvqs0imPHhOIXSoFpgiW7Wj+V8lJyMe6PzjxQ7JXjgsoTUZKQTH
         +KO1PvHgQQ/C7mkuoA2BhB0gzuFTSQmmghig9WupsVqedon7q+p3HvyQfGBYC3qdd47k
         VfA08iaRzep6nUeWfzTkJiENhu60YKovsnBsIPixXdIaxAxb2Yko1MM8GtdEzl4taYxy
         rlyMb4SUEIeClkUY/BcBKaaZlMOhFsptS3W4ES0QIi8QN6sPNkKz/ituVUYY6eXb2mQA
         9QHrfAgzeVX6q3LDvYMS7CXiomtV1E7o1c+fbd1O1S38MBb0Hfv+OVsQ3rWrC+nrm0NH
         InRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=anLt6qagkph9XR8vpxxzxpgqvxbcb9YqldFXaQ5KeM4=;
        fh=eHB+D/taC4GJq+oditHNWSNlbMpLsC1MvQS2eLXrVZA=;
        b=qG8Mo6TqZ5tLudCfOrtreUA347vaDo180djgm/U4ULVzli3TG/2inbqEn8gZJBdkfI
         kdlbruaOya8JBqZ7CNpX/FECqG7TMsiICyCl5s0mD3CA9dOwbpnXY7HGCR0YUsQzDgsm
         3xiPkWbz6dj5DQKfPIZrH8Xd0lZ0iy95hJ8cR+ZdQucAxllMYfaAclLCWvRSSbD8Xwgo
         bxc3dGYN5z8t5CFB/35Fgr3q5XQAQ+ACNnoSK7TCmj89bpSFOVvdx3lUtRipf/D0CqNN
         DQE8gp7QV+6RwmP+pg6j9fi7Bo1GXZUIzX3yxrbMfCTB3kUxRB+/v5nOdwCbnamViy09
         rvnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794337544; x=1794942344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=anLt6qagkph9XR8vpxxzxpgqvxbcb9YqldFXaQ5KeM4=;
        b=FoPrCu+lgpPuMNG6t2WePToTWn1vV7OxoFB6yJCn3SW7ujyeMQPqPvI5MetASfN5t8
         aUVbujBjF9Hu1W2txzDolkMjz7o5JuekJ+JYD6KltD2HSGGWuWjec5FKHzJECE5iijKs
         JI6A04eOhY4OKbTYEL8+glLIl6Wb5A9dzm+fon3n+0CuHNLYzwXIhbmiEqiRC6Mp8/+V
         JpPCzsy5l9FUNFQ60oaTNlGLNEy3OLbzoGtCl6hkq3QjMJnGOOS7R4j0oJupsYPSOdyD
         CDayuFkXsON+vcFU66VzWecaTHRts1Z/5Z/A31nYSbEnYpS7yQe1PYhhXHCqwukBt0h+
         YbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794337544; x=1794942344;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=anLt6qagkph9XR8vpxxzxpgqvxbcb9YqldFXaQ5KeM4=;
        b=eYMMvbRbdwCp1k7FuuXdbOJOwwQuFZbtFevsE+T+Qo1uaHg2bpzUh0cVmO6pRX6mEr
         TyWIFqsFMmiCTv3kO68eUpYZ9bdPJr2DP0X6ecPM12GmsGypMHXzcCJgp7M6LFGwaY2R
         Zoau6vz3aBHvRm688884M16jcC/Jcho/AwTfiXlDEz3EO58tM141MOoN3F4uZ4rTML0i
         12eWbbLlbFezFmR80FNhs1CG9DRAW4dPNpcCcqoAydcfq4dKUH9Fz70jBy+csr17W/+B
         I3wnyflfurQgD9aMQV9Pbs6nKbgLJXM85SNiNq1UIeJXGi/ljx2etbGMMgzR6HeYfAKQ
         nm9g==
X-Forwarded-Encrypted: i=1; AL+hErHpWtzojbwSHyRfzT47VngD7gpUE/ms3+wy2RTS3nzQ1gCz6HwsId/SR0BxfwHqOgeA068BzLb9KlsO4Wk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aOpWy64soQXKd/wRwmtUra+rRowC8Vw+29/GL3kra3t1hGiiO
	AkaGo8wtFDImP3NcQSd2zzobXa0vTmkd3rWunKiNW8DKTv4tuaF0vcoeNakW/hxKdJr+UnCCD5i
	Yy5gPkQkH1JrQZBo6CbC+lYee3tKNpBg=
X-Gm-Gg: AYBFou0moo3VecCR44IERyljuCFjuYO3Zcc/diJ6jKh1IdgeUgIEYlXBtT8eUwFaFi7
	Ay8U/NceQtezPWi/eAeyOa6ebe2AdXW7tCgi/vUQ9nFcSghX75H2he1EvWEJPEobLWazF0pftMp
	PYvG0ibVtNHbvprBd/SnGrsJMYddJc9fUA54j/ILOyuX74N21Q1vznO92JhUyLKpdSCyh0/KVqH
	rKu372XFTZJOMZsBrBdwtcir5melC3usPkSjU4LuoO95q/TVJE6iBRxXJbKcU1F2ljcusBVaNCP
	gzytG8ycYnN0R2ExesW84IFFE7MZQi358GmsMiSlmOtT0IDlsb7U4JJ67JNDsOh9WL7AE819g5A
	vjFMRkQLluc0DHPAU0FBx746wPyG2Xis9reukRVwLw9HK37w0G2ziotIoYl5C/Rlh6JowqP1e6h
	UAeZ7UEJ5rXfyyx/3z4eVVmBKtHjiJF9qmFw==
X-Received: by 2002:a05:6000:1610:b0:498:364d:7509 with SMTP id
 ffacd0b85a97d-49997c6c18bmr523568f8f.24.1794337543600; Tue, 10 Nov 2026
 11:05:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <b7456dbb-16fd-45b4-8742-e9ea3f896317@amd.com> <20261105170340.165507-1-puranjay@kernel.org>
 <CAEf4BzZeVd4boXX4Hy1sKAM=dUPS7dvdmrOPybGrrZV+bU7eAA@mail.gmail.com>
In-Reply-To: <CAEf4BzZeVd4boXX4Hy1sKAM=dUPS7dvdmrOPybGrrZV+bU7eAA@mail.gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 10 Nov 2026 11:05:32 -0800
X-Gm-Features: AclHuK8p9eKzrAmIvCtxKy6s76DJ6bc52Qt62Y2l4XXBjiRTKRk1Vg0I6Sg8r78
Message-ID: <CAEf4BzaGnsOhpz=bOxoSEyy-8W0epd5Go6juimoqDge+Rc-+Dw@mail.gmail.com>
Subject: Re: [PATCH RFC] perf/x86/amd/lbr: Don't freeze the LBR on PMI for
 user-only filters
To: Puranjay Mohan <puranjay@kernel.org>
Cc: Sandipan Das <sandipan.das@amd.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Andrii Nakryiko <andrii@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 5:07=E2=80=AFPM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Thu, Nov 5, 2026 at 9:03=E2=80=AFAM Puranjay Mohan <puranjay@kernel.or=
g> wrote:
> >
> > On CPUs with X86_FEATURE_AMD_LBR_PMC_FREEZE the LBR is always frozen on
> > PMI, so the branch stack ends before the IP and callchain, which are
> > taken when the NMI is delivered. IBS rejects branch-stack events, so
> > there is no precise alternative.
> >
> > The freeze only keeps the PMI handler's branches out of the stack, whic=
h
> > matters only if branches into the kernel are recorded. Skip it when
> > LBR_SELECT suppresses them, and add a freeze format bit (config2:0) to
> > request it anyway.
> >
> > Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
> > ---
> > Thanks both. A user-only default with an explicit request works for me,
> > with one exception I would like to keep: when branches into the kernel
> > are recorded the freeze has to stay. On a Zen 5 part with the freeze
> > cleared and a user+kernel filter, every entry in every sample was a
> > branch taken by amd_pmu_v2_handle_irq() or amd_pmu_lbr_read(), so users
> > recording kernel branches would regress with a "never freeze" default.
> >
> > This RFC does the following:
> >  - LBR_SELECT suppresses kernel branches: no freeze, unless the new
> >    AMD-only freeze format bit (config2:0, advertised through the format
> >    attributes) is set.
> >  - Otherwise: freeze as today.
> >
> > That needs no tool changes for the user-only case and gives an explicit
> > way to request the freeze. This version is only compile tested; I will
> > retest on a Zen 5 part if the approach is acceptable.
> >
> >  arch/x86/events/amd/core.c | 14 ++++++++++++++
> >  arch/x86/events/amd/lbr.c  | 21 ++++++++++++++++++---
> >  2 files changed, 32 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/x86/events/amd/core.c b/arch/x86/events/amd/core.c
> > index 49b6b8fce5664..d63649c756a58 100644
> > --- a/arch/x86/events/amd/core.c
> > +++ b/arch/x86/events/amd/core.c
> > @@ -1404,8 +1404,22 @@ static struct attribute_group group_events_amd_b=
rs =3D {
> >
> >  #endif /* CONFIG_PERF_EVENTS_AMD_BRS */
> >
> > +PMU_FORMAT_ATTR(freeze, "config2:0");
> > +
> > +static struct attribute *amd_pmu_lbr_format_attrs[] =3D {
> > +       &format_attr_freeze.attr,
> > +       NULL,
> > +};
> > +
> > +static struct attribute_group group_format_amd_lbr =3D {
> > +       .name       =3D "format",
> > +       .attrs      =3D amd_pmu_lbr_format_attrs,
> > +       .is_visible =3D amd_branches_is_visible,
> > +};
> > +
> >  static const struct attribute_group *amd_attr_update[] =3D {
> >         &group_caps_amd_branches,
> > +       &group_format_amd_lbr,
> >  #ifdef CONFIG_PERF_EVENTS_AMD_BRS
> >         &group_events_amd_brs,
> >  #endif
> > diff --git a/arch/x86/events/amd/lbr.c b/arch/x86/events/amd/lbr.c
> > index a55646fcb8465..f45e2c53566af 100644
> > --- a/arch/x86/events/amd/lbr.c
> > +++ b/arch/x86/events/amd/lbr.c
> > @@ -10,6 +10,12 @@
> >  /* LBR Branch Select valid bits */
> >  #define LBR_SELECT_MASK                0x1ff
> >
> > +/* attr.config2: freeze the LBR on PMI */
> > +#define LBR_CFG2_FREEZE                BIT_ULL(0)
> > +
> > +/* Software only, masked out before writing LBR_SELECT */
> > +#define LBR_FREEZE             BIT_ULL(63)
> > +
> >  /*
> >   * LBR Branch Select filter bits which when set, ensures that the
> >   * corresponding type of branches are not recorded
> > @@ -307,6 +313,9 @@ static int amd_pmu_lbr_setup_filter(struct perf_eve=
nt *event)
> >         /* Filter bits operate in suppress mode */
> >         reg->config =3D mask ^ LBR_SELECT_MASK;
> >
> > +       if (event->attr.config2 & LBR_CFG2_FREEZE)
> > +               reg->config |=3D LBR_FREEZE;
> > +
> >         return 0;
> >  }
> >
> > @@ -392,20 +401,26 @@ void amd_pmu_lbr_sched_task(struct perf_event_pmu=
_context *pmu_ctx,
> >  void amd_pmu_lbr_enable_all(void)
> >  {
> >         struct cpu_hw_events *cpuc =3D this_cpu_ptr(&cpu_hw_events);
> > -       u64 lbr_select, dbg_ctl, dbg_extn_cfg;
> > +       u64 lbr_cfg =3D 0, lbr_select =3D 0, dbg_ctl, dbg_extn_cfg;
> >
> >         if (!cpuc->lbr_users || !x86_pmu.lbr_nr)
> >                 return;
> >
> >         /* Set hardware branch filter */
> >         if (cpuc->lbr_select) {
> > -               lbr_select =3D cpuc->lbr_sel->config & LBR_SELECT_MASK;
> > +               lbr_cfg =3D cpuc->lbr_sel->config;
> > +               lbr_select =3D lbr_cfg & LBR_SELECT_MASK;
> >                 wrmsrq(MSR_AMD64_LBR_SELECT, lbr_select);
> >         }
> >
> >         if (cpu_feature_enabled(X86_FEATURE_AMD_LBR_PMC_FREEZE)) {
> >                 rdmsrq(MSR_IA32_DEBUGCTLMSR, dbg_ctl);
> > -               wrmsrq(MSR_IA32_DEBUGCTLMSR, dbg_ctl | DEBUGCTLMSR_FREE=
ZE_LBRS_ON_PMI);
> > +               /* Skip the freeze if kernel branches are suppressed, u=
nless asked */
> > +               if ((lbr_select & LBR_KERNEL) && !(lbr_cfg & LBR_FREEZE=
))
>
> heh, so we basically either
>
> a) opt-in freeze with *new config*, but do it *only for non-kernel LBR*
>
> or
>
> b) opt-out freeze *only for non-kernel LBR* _unconditionally_, but
> without adding any new config
>
> In both cases we have a behavior that makes sense in practice, but a)
> adds some new config, while b) doesn't add anything. End result is the
> same, just more configuration and need to change user space code to
> opt-out the freeze.
>
> Is a) worth it, or we should stick to b) and keep it simple, Sandipan?

ping

>
> > +                       dbg_ctl &=3D ~DEBUGCTLMSR_FREEZE_LBRS_ON_PMI;
> > +               else
> > +                       dbg_ctl |=3D DEBUGCTLMSR_FREEZE_LBRS_ON_PMI;
> > +               wrmsrq(MSR_IA32_DEBUGCTLMSR, dbg_ctl);
> >         }
> >
> >         rdmsrq(MSR_AMD_DBG_EXTN_CFG, dbg_extn_cfg);
> >
> > base-commit: 0f443787a7f6ae907975742680aac2600483eaf1
> > --
> > 2.53.0-Meta
> >
