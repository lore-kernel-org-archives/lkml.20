Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C2641443D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 19:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789070107; cv=pass; b=Izf65hpr8G5pa32MgGp/6BLiPfRLmocnW3XNPtRVuy41btjX77a4A0du6htlLoywXQzINCJDwTH2+i2C1cVRkW1nmQvqwoErM2zUXOA4efdwlpadzWsYptuo5gXpUgfmh+ak6REqiIVRHa02H2noyxKn2B0/UiGOOnn28EmbUy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789070107; c=relaxed/simple;
	bh=bh2YJ3KuadGX9vCZSOmz5mZlucIrhXaQaRqTTDdn1Cg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EIL3btnh0BO5qg1VPBIG6U/NM3u7fBIa7Gp4aY0zXbfbVYztY7hdn4UZkR9oLEWzv6/dCkAZYtGw55N6kG4QtC7vH/EXa1wWDU8BMJSqqpiAVshF+3bQudMncuvmaRvAN50ucIIDWsT8vmmaHvrfge8yPtzbOa9RDfRbbJ777zI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jCYpwLwY; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=eGYhC+Ud; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jCYpwLwY";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="eGYhC+Ud"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789070104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0DO/R6xXAH6j9OJ0/UerSJTCrEzNPtfjRy5UVMaTrOk=;
	b=jCYpwLwYLutiawo2M1VWddVHfilMC4m28s9fh2XcGzTO8bKuiFbdCe1KAwYtvtsIiNdwx6
	339XDJDTHcjhNSe61GzPsz7CBb77OChP9se2Zf9pQkkY01PWpUk2OuelCS7xymN0AAvwt5
	skukckC/XcflU5SLEsSN0Vo3K55qOrk=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-uKfveedROyS-tyoi5DvqHw-1; Thu, 10 Sep 2026 15:55:02 -0400
X-MC-Unique: uKfveedROyS-tyoi5DvqHw-1
X-Mimecast-MFC-AGG-ID: uKfveedROyS-tyoi5DvqHw_1789070102
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97caca2faacso62775241.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:55:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789070102; cv=none;
        d=google.com; s=arc-20260327;
        b=sgBwsUWZuXTPxyMoZH9QWUWzX/5dpe0jxAoBc1IFcOYriwcFseNbHhWg2y51ho4q74
         xerNpa+YVzpIOMzdyD+i5qEJuMOAjooSa14qhhz7Rx/dwEHlW/ecejRk9vd4AGopt5zB
         IrNqJUHW45LMbPMhPBwDZdQ/AIgPj0eW+Vc+vqYgDHTmRwrIfXivx8iYfybWMKk0TXj0
         IcIOr3Uu6T3qGlb4pC6rm5pKvQL/S+a2OHMTPHMXT51AJjAg7GnTeKr01tiwgNhlQfO3
         dMxp2J7yFE0COpx7rlYpzUnvEzSk7DUzXHmOiFHU/liu5inypbCXoMDBTecB43UA38iv
         DnaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0DO/R6xXAH6j9OJ0/UerSJTCrEzNPtfjRy5UVMaTrOk=;
        fh=ArQyyNseIQvmNioK/+y49Kztb3BOqoQijvyJiRwDNM0=;
        b=OyegxuMoaPq5rQ486QUJpV1yhjBLogruzZpPRtsHB8NOv8jDpDoMJrIfy1cm9YAVDy
         ZAiHPwgAXcS9O5zPRSRtGI1LZE5VPdEmeg+1HkZh0noe9y2rzOnaqHuLESs/IUvn8eCa
         WPTAcu0E+RybDOpyad6wcJdEZoJEMgGZfJPtipKNrpd3VjXtQpmQQkDRG1ZOFsQKpYt8
         v6njbZhcxbfx1IG6FDhu8W0OLQ/H5NtZIzL/W8oVO5invvNKsnyKhWO0qmbl70fj5Vw6
         kBTeYnspRrsFH24GsP+YG1Mx6pBsXIUAvKO28+iWDYSA8R35ThU/axQhe2bq6EYaUhnw
         7VOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789070102; x=1789674902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0DO/R6xXAH6j9OJ0/UerSJTCrEzNPtfjRy5UVMaTrOk=;
        b=eGYhC+Udp20mYhm95e4d3ccpz/9xDWe+Bc2C/gNyjbMwoxOaHY6487M9itaOYXRQFD
         AzBLvmH4HDBd/397JJ1MYHO5jYMpKvNQkFTWPmAvEdDdzsflFTTViGjQQ6cBtDDJ4BBJ
         DLoyUtKxsAbCh9vz5w7KAmI98VpdePbPUfkr/xFwr1lGzEI1IYwIyp1Fy7MAIavCQKaS
         CVpOXs/UDKjEm5pASDvyZor+iXBtzSjDo2jhmIa/c7zq3b4hxUaiPZoXbGF8tcA1l+FF
         +Z1ZRm0J38WAwqrW1IabLhfCATLn7QY7yIAnU9JcAqt3MHV6YDRa9Ab4sg6pkJR7K++v
         PJwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789070102; x=1789674902;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0DO/R6xXAH6j9OJ0/UerSJTCrEzNPtfjRy5UVMaTrOk=;
        b=mWdRKUpWRtqigDGcSLI2/Y9xZDWxM56tGVSfiF1AiD1+E07Jmf7sfrafVKAw7WWycO
         LpxX33GCQZkat5R9alh9j4xf8zh6VpjDXOQHfgTbfdk49wl+1VRhjYQbgl1hvAC4By8u
         JUJTXckIMJvRjqsp8RdK0hebt8vyQLhoADI2LY/x/0EwG7R3bUzlz6xdxcVUntnTLG6d
         OEEF2pHPktXI2M+P13SFRDwrwMz2xUD3VfKVb83u4vsIXt/aWocDE9U9ei/elRi5fCM1
         r5c75SdW98A1peIgkXxd+ItXqbOWfvPxpmX/9GMUG+xWdq8+vFM1OAc4tBH5D2DszKEf
         ep6g==
X-Forwarded-Encrypted: i=1; AKwUvBzTgc9GpWUCTnfDcZTwRh6Nw0sRn97imhbmiT90mJSN2VZUzBjg/fCs9/aPvjphjc4zfqwqnwRgle35B38=@vger.kernel.org
X-Gm-Message-State: AFuF++kCSPGIGohst8O1SU7xXLc/S46CbOxjTIP+a/kGXBtFiQFRg6QG
	JDPG7Sro3ESsKdDXR9gF8MDPfutTfGzMb7U5ASbJPXxg7Eo7gun45ibTSFmyXYfoQBbk/Zxqafg
	RIGL7OIJMrdSTl6WgZHV3lxMtSh9f0ULNmtd+uWPQ7Duoyr3DFE7M5WQ6d1Zxa9JjskkbzIUJN4
	A1MPtXoBOholX1tIs8X+d+7TuJmwnKV7V9equMa6qH
X-Gm-Gg: AYBFou1vAG1IQQEXHb+tF4N6NvSLtt+0TRkJCVL+NE+mrlA5WSXFkkVY7HyL87dgwdI
	qmOJ0UHOpVgKpapTmQIZzWBYqxSTGCYwNCec6OXKIP9oirfHrF7E16KZJiEgO/3gwV3bmhbjbuQ
	AZNYrmA60OLaoZsBcj2QwD2C2kwPHjEhzGHotJoMnG860fGtbbdRxA+HU=
X-Received: by 2002:a05:6122:3783:b0:5c8:44fa:7230 with SMTP id 71dfb90a1353d-5c845f4e527mr2491561e0c.2.1789070101831;
        Thu, 10 Sep 2026 12:55:01 -0700 (PDT)
X-Received: by 2002:a05:6122:3783:b0:5c8:44fa:7230 with SMTP id
 71dfb90a1353d-5c845f4e527mr2491530e0c.2.1789070101357; Thu, 10 Sep 2026
 12:55:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427122742.210074-1-mkchauras@gmail.com> <CAE4VaGACd2es4NPQyhbR9pMEoGiTVBSE7Lw7x9VOb1Qbpvc6nw@mail.gmail.com>
 <amsapeQ2Kp6rwPpF@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CAE4VaGB_EhbWq8_X6FLtOx2MqoP7JEkOKkKSjKB7N--tt-sCeA@mail.gmail.com>
 <aqAMpawvpB7g1XdK@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com> <CAE4VaGBCmA0+28G=V_Qs37cR2GKYDUTGQWW_uRe0qvEp5io3qQ@mail.gmail.com>
In-Reply-To: <CAE4VaGBCmA0+28G=V_Qs37cR2GKYDUTGQWW_uRe0qvEp5io3qQ@mail.gmail.com>
From: Jirka Hladky <jhladky@redhat.com>
Date: Thu, 10 Sep 2026 21:54:49 +0200
X-Gm-Features: AcwNN1UINjTjrqytywWbMHNREErasxxlK8PN4pC_cq8M5jPiGNRwYTV8xfJ4kOE
Message-ID: <CAE4VaGCp7A7NuBC9Hwgzs5xg3bGBuRiDC8PRCu+yXnUZEXmt-g@mail.gmail.com>
Subject: Re: [PATCH v5 0/8] Generic IRQ entry/exit support for powerpc
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, ryabinin.a.a@gmail.com, glider@google.com, 
	andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com, 
	oleg@redhat.com, kees@kernel.org, luto@amacapital.net, wad@chromium.org, 
	mchauras@linux.ibm.com, sshegde@linux.ibm.com, thuth@redhat.com, 
	ruanjinjie@huawei.com, akpm@linux-foundation.org, macro@orcam.me.uk, 
	ldv@strace.io, charlie@rivosinc.com, deller@gmx.de, kevin.brodsky@arm.com, 
	ritesh.list@gmail.com, yeoreum.yun@arm.com, agordeev@linux.ibm.com, 
	segher@kernel.crashing.org, mark.rutland@arm.com, ryan.roberts@arm.com, 
	pmladek@suse.com, feng.tang@linux.alibaba.com, peterz@infradead.org, 
	kan.liang@linux.intel.com, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mukesh,

Following up on the ppc64le SELinux/kill() regression - it doesn't reproduc=
e
with proper multi-iteration sampling. stress-ng --kill has ~30%
run-to-run variance
on our LPARs. Part of the variance comes from LPARs being much less
isolated than I'd assumed - we saw contention bleed across LPARs on the sam=
e
physical server, even between "Dedicated" partitions. With 15 iterations pe=
r
config, 7.1 and 7.2-rc4 are statistically even (within ~3%) across enforcin=
g/
permissive/disabled, confirmed on a second, physically separate LPAR (7.1 v=
s
7.2-rc6). This matches what you said - you couldn't reproduce it either.

I also built 7.2-rc4 from source with your proposed
rcu_ct_kernel_exit_qs() patch and re-ran the same sweep - it shows no
consistent effect vs. stock 7.2-rc4 (differences within the same noise
band), which is consistent with there being no real regression here for it
to address.

Sorry for the false alarm, and thank you for the patch and for taking the
time to look into this - I don't think it's needed for this issue, though
it may still be a reasonable efficiency improvement on its own merits (it
does avoid the unconditional rcu_preempt_deferred_qs() call on the common
fast path). I'll update the internal RHEL tracking ticket (RHEL-216740) to
reflect that this doesn't reproduce.

Thank you!
Jirka


On Tue, Sep 8, 2026 at 6:01=E2=80=AFPM Jirka Hladky <jhladky@redhat.com> wr=
ote:
>
> Hi Mukesh,
>
> Re: policy details -  I'm running an ELN kernel on RHEL-10.2, with SELinu=
x
> in enforcing mode using the default (targeted) policy, nothing custom
> or hardened on top of it. Let me know if you need anything more specific
> (policy version, booleans, etc.) and I'll pull it.
>
> Re: the rcu_ct_kernel_exit_qs() diff =E2=80=94 thanks, that guard against=
 the
> unconditional rcu_preempt_deferred_qs() call lines up well with what I
> was seeing on the RCU-barrier side. I'll apply it on top of 7.2 on
> POWER10 box and re-run the stress-ng --kill numbers
> (enforcing/permissive/disabled) to see how much of the SELinux tax it
> recovers. No need to prepare anything separately.
>
> I'm OOO tomorrow, but I'll get to this by the end of the week and report
> back with results.
>
> Thanks
> Jirka
>
>
> On Tue, Sep 8, 2026 at 3:26=E2=80=AFPM Mukesh Kumar Chaurasiya
> <mkchauras@gmail.com> wrote:
> >
> > On Thu, Jul 30, 2026 at 01:24:46PM +0200, Jirka Hladky wrote:
> > > On Thu, Jul 30, 2026 at 11:36=E2=80=AFAM Mukesh Kumar Chaurasiya
> > > <mkchauras@gmail.com> wrote:
> > > >
> > > > On Mon, Jul 27, 2026 at 11:41:07AM +0200, Jirka Hladky wrote:
> > > > > Hi Mukesh, Shrikanth, Madhavan,
> > > > >
> > > > > I'm seeing a ~19% throughput regression on ppc64le (POWER10) in
> > > > > syscall-heavy workloads between kernel 7.1 and 7.2-rc4, which I'v=
e
> > > > > narrowed down to the GENERIC_ENTRY enablement for powerpc (commit
> > > > > bee25f97ad24 "powerpc: Enable GENERIC_ENTRY feature").
> > > > >
> > > > > The regression manifests specifically when SELinux is enabled. Re=
gression
> > > > > disappears with selinux=3D0. With SELinux disabled, 7.2 is actual=
ly
> > > > > slightly *faster* than 7.1.
> > > > >
> > > > > Test: stress-ng --kill 1 -t 23 (single-thread kill() syscall loop=
)
> > > > > Machine: IBM,9080-HEX POWER10, 8 vCPUs (1 core SMT-8), 64 GiB
> > > > >
> > > > > Results (bogo-ops/sec, higher is better):
> > > > >
> > > > > Kernel   Enforcing   Permissive   Disabled    SELinux tax
> > > > > ------   ---------   ----------   --------    -----------
> > > > > 7.1      69,107      70,248       93,566      -26.1%
> > > > > 7.2-rc4  56,247      59,075       99,240      -43.3%
> > > > > Delta    -18.6%      -15.9%       +6.1%
> > > > >
> > > > > Key observations:
> > > > > - SELinux permissive ~ enforcing on both kernels (overhead is in =
the
> > > > >   code path, not policy evaluation)
> > > > > - SELinux disabled: 7.2 is 6% faster than 7.1 -- the generic entr=
y
> > > > >   path itself is not slower for the base syscall
> > > > > - The SELinux "tax" nearly doubles from 26% to 43% between 7.1->7=
.2
> > > > > - No changes to security/selinux/avc.c between v7.1 and v7.2-rc4
> > > > >
> > > > > The kill() hot path (sys_kill -> check_kill_permission -> securit=
y_task_kill
> > > > > -> selinux_task_kill -> avc_has_perm -> avc_lookup) wraps every A=
VC lookup
> > > > > in rcu_read_lock()/rcu_read_unlock(). On ppc64le with PREEMPT_RCU=
, each
> > > > > pair requires lwsync/isync barriers. I suspect the generic entry =
path
> > > > > changes something in how context tracking, tracing, or RCU intera=
cts
> > > > > with the syscall fast path that amplifies the per-call RCU cost.
> > > > >
> > > > > Note: this is on top of a separate ~36% regression from 6.12->7.1=
 caused
> > > > > by HAVE_PREEMPT_DYNAMIC_KEY enabling CONFIG_PREEMPT_RCU on ppc64l=
e
> > > > > (commit 6ad7751537e8), which I reported separately on the v4 thre=
ad.
> > > > >
> > > > > Thank you
> > > > > Jirka
> > > > [...]
> > > > Hey Jirka,
> > > >
> > > > Thanks for reporting this.
> > > > I'll take a look.
> > > >
> > > > Thanks,
> > > > Mukesh
> > > >
> > >
> > > Thank you, Mukesh! I'm happy to run additional tests on the POWER10 m=
achine
> > > if you have patches to try or specific experiments you'd like me to d=
o.
> > >
> > > Jirka
> > >
> >
> > can you try this with the below diff?
> >
> > diff --git a/include/linux/rcutiny.h b/include/linux/rcutiny.h
> > index e56ded733b1b..dcad641eb2c2 100644
> > --- a/include/linux/rcutiny.h
> > +++ b/include/linux/rcutiny.h
> > @@ -120,6 +120,7 @@ static inline bool rcu_preempt_need_deferred_qs(str=
uct task_struct *t)
> >         return false;
> >  }
> >  static inline void rcu_preempt_deferred_qs(struct task_struct *t) { }
> > +static inline void rcu_ct_kernel_exit_qs(void) { }
> >  void rcu_scheduler_starting(void);
> >  static inline void rcu_end_inkernel_boot(void) { }
> >  static inline bool rcu_inkernel_boot_has_ended(void) { return true; }
> > diff --git a/include/linux/rcutree.h b/include/linux/rcutree.h
> > index 16a04202888b..d623f2a7d3fc 100644
> > --- a/include/linux/rcutree.h
> > +++ b/include/linux/rcutree.h
> > @@ -87,6 +87,7 @@ static inline void rcu_irq_exit_check_preempt(void) {=
 }
> >
> >  struct task_struct;
> >  void rcu_preempt_deferred_qs(struct task_struct *t);
> > +void rcu_ct_kernel_exit_qs(void);
> >
> >  void exit_rcu(void);
> >
> > diff --git a/kernel/context_tracking.c b/kernel/context_tracking.c
> > index a743e7ffa6c0..011018214c6d 100644
> > --- a/kernel/context_tracking.c
> > +++ b/kernel/context_tracking.c
> > @@ -118,7 +118,7 @@ static void noinstr ct_kernel_exit(bool user, int o=
ffset)
> >         lockdep_assert_irqs_disabled();
> >         trace_rcu_watching(TPS("End"), ct_nesting(), 0, ct_rcu_watching=
());
> >         WARN_ON_ONCE(IS_ENABLED(CONFIG_RCU_EQS_DEBUG) && !user && !is_i=
dle_task(current));
> > -       rcu_preempt_deferred_qs(current);
> > +       rcu_ct_kernel_exit_qs();
> >
> >         // instrumentation for the noinstr ct_kernel_exit_state()
> >         instrument_atomic_write(&ct->state, sizeof(ct->state));
> > diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
> > index 96848fc1f02b..c23478f70c17 100644
> > --- a/kernel/rcu/tree.c
> > +++ b/kernel/rcu/tree.c
> > @@ -368,6 +368,25 @@ notrace void rcu_momentary_eqs(void)
> >  }
> >  EXPORT_SYMBOL_GPL(rcu_momentary_eqs);
> >
> > +/**
> > + * rcu_ct_kernel_exit_qs - report deferred QS on syscall/exception exi=
t if needed
> > + *
> > + * Called from ct_kernel_exit() on every return to userspace.  Guards =
the
> > + * rcu_preempt_deferred_qs() call with rcu_preempt_need_deferred_qs() =
so that
> > + * on the common fast path -- where nothing is deferred -- we avoid th=
e
> > + * cache-line traffic on current->rcu_read_unlock_special that the unc=
onditional
> > + * call causes.  This is particularly significant on weakly-ordered ar=
chitectures
> > + * (e.g. ppc64le) where rcu_read_lock/unlock issue lwsync/isync barrie=
rs and
> > + * already touch that cache line in the syscall body.
> > + *
> > + * Follows the same pattern used by rcu_flavor_sched_clock_irq().
> > + */
> > +notrace void rcu_ct_kernel_exit_qs(void)
> > +{
> > +       if (rcu_preempt_need_deferred_qs(current))
> > +               rcu_preempt_deferred_qs(current);
> > +}
> > +
> >  /**
> >   * rcu_is_cpu_rrupt_from_idle - see if 'interrupted' from idle
> >   *
> >
> >
>
>
> --
> -Jirka



--=20
-Jirka

