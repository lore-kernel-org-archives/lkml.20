Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8CC48E0CB
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 19:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789070360; cv=pass; b=ia9saneRLzz29MsMByiLWzl2YxLEvzY9ezdBGbc5GGWqQv4QtyjrqBJgObK/wZRUEoIUaC7TL3qPSFWO9++2thHktPNgS4eX2odJLt0Gj2C/IAqRY33SnEH0pspFOraI+g5fX6g3rAwKExbTyfBvi5v4DeOqxyMmiyfvHhg36Ko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789070360; c=relaxed/simple;
	bh=JchUOFNEfs5wh4pNvKmd9qD8EFyuY0p7RtNx2nArRgs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ehKxIbPHpH5frJHyOqA2ksPBFizy6BmCzaTWWytDrLjOPuADk7xn1FF3G7S/3zr7KMiws82VTa62iBVdc9OiA/A7JJlQDo+lRNFZOM0h/UBXOHmq4J/Vk/ANxv6jKIOc1XqBRM0CGKtMa3A8KO1jgF26YX3F9DXEU1k/76A/eEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WDAdJCDz; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ms8SB+WJ; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WDAdJCDz";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ms8SB+WJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789070357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CTU1eHyeb2Ws2GlcVytRUEMUfdoHDb4fUJ8XssecKvI=;
	b=WDAdJCDzp91xLIusxaI05dCl71sXC4YhUXAHgydztAPMPF8BKN8FpjUpzlUyFX9a4yZlNO
	W0JoRmOoCD/iLTY2/SiHzSGY7RbGgy265Dtj27dEVflfUJSMYNykzgEbX1HmJYtR17N7a+
	+uo1invNqbOgHqMkMCQ8SKUCQJHU1dc=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-499-5npzu41uNSevRkmnCR2adQ-1; Thu, 10 Sep 2026 15:59:13 -0400
X-MC-Unique: 5npzu41uNSevRkmnCR2adQ-1
X-Mimecast-MFC-AGG-ID: 5npzu41uNSevRkmnCR2adQ_1789070353
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-980a896f53eso186562241.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:59:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789070353; cv=none;
        d=google.com; s=arc-20260327;
        b=oyRJ0Er/nWXnrIPYq0FrUSYHnhcMmfHtYSBiSjiVNZQV4m0TRs+QEXsR4yDFbyxEj4
         7kocntWDG0yX1f1dRWT+y4i83uYAQPn4D0PBDJ0AWGRr2SuKT1tdI5Jr1xMSW4QBv7cN
         cZeQkuqX4bNsBk6JppDH+MXzNxy7/+xy2Km7i9U35uz0gwJsGL8VKjAuPZI4eeP/lziS
         g123G8R65FikCYf8P/5I1MWIuzYe/wob2Z+3DmO5HXuVoGtPBmVTw4mSjHxFzHW//cTF
         H6+F5DFQF+ndTKFyk1VKjnw+ZbSozCg4yEsuC8AcDNBKJ6cbrIXmmARv+P12OjR/6y4N
         RGew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CTU1eHyeb2Ws2GlcVytRUEMUfdoHDb4fUJ8XssecKvI=;
        fh=AOvgLJiGMHa4j8RhGykGjhMPBEjvIq+VRL+vnEZEvIw=;
        b=TWZbx8cdv8BtbiukQCzTtu7P9Hk6nDRRCRDH8scmy3CRPGaqbXhwBrzYYPXtqG09yN
         t60+EpDC5IBxZepNWrkSUQunkMVRuzt7/TG82/JwHULTLgzAJGNE2Q/0o24wuH/oiNPf
         8VtRMbPoPaIDiwsO9uVxCLcExjT/v0bOWVNT+YhgGokdcBHbuRFAzJIc1doJEH7vpDXL
         OTkjKQjcf+BTD4M2+jqUo5y9e+DwzDS5T2/1S43n90rfO4axS63AJtRGjdj/CfGijTLW
         gEgrpZJeNJqalEdS8f5I6QkDcYHaxrZA3t9TUWeUfAYyjt13GO8qErzCvKRAb4bLBSoL
         PZ6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789070353; x=1789675153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CTU1eHyeb2Ws2GlcVytRUEMUfdoHDb4fUJ8XssecKvI=;
        b=Ms8SB+WJQPgzu+ifoGh1ksBcVbhzgdk4wYdfokadeUvjomqimwpCht3e/qRtZ45QBQ
         mIf4VTmLiTWWD73rHzzCrT33rNbH2mY9h9O5FjSMGb60rZPn9C6j9jNA1U5mgvHMYS+F
         N+6/8QL3dqq3lVSJvflF6HExGupnuf0Ont5lyvfgQwcB6w+/tqFzOncGxtcWEbBB41a1
         RPKSmLxrz9SK2DZ5+aSxxEnJIWBMw5gooincIOz4JrYjGSBcPIieeUYoxCF4d+38uABE
         K3G1OKV4rzCvWNZZix3DWpSFmMbS85Mm4xfUPLW13raUSzVjeovI0IXGvY5ln/VPEkWt
         7fIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789070353; x=1789675153;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CTU1eHyeb2Ws2GlcVytRUEMUfdoHDb4fUJ8XssecKvI=;
        b=ZqbV0EyJRv35BYQ8atoLmSjspYCSM5Qowm6K73q0hiEVTPXMWfFf5mx1NxcIgZOPuD
         UkEVFYWgBgxVBEflpxK8iMD3H+XrirvBHdHCfHd2YMccB6tLNrcmbQTJ0LqsSuP5ZsgO
         XD7Ojkxb2E/dt85QnoozIXZAQPlcma3aidv1QWonpnXGkzNXBlLeMVgKG5I2EfSyaMR7
         e6USor5UUJBKFYau7Tp4U4nZ4MUJaJZdLVUaYv52AZBSffrWsOeuoRuNqVhKT+KN7tBc
         tMEkDIWTD4+86BgS7JMUY9bDadij+0YFfrnYx406Y5CG2Ve27xBy/cHD3mpnvgJXzval
         ZUJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbFMmm6827ohn6Pr5c784tK/XioKKbW9j95jMktI0VeuvzTwCFZ/eWEK/yQC5BZJrw1ZrE99OFH0h/x34=@vger.kernel.org
X-Gm-Message-State: AFuF++nR4q2md3U7zSP4C+1l5hxHAyWs7Nq4GWNR7KkoCUDbDk55Vdk4
	KuNNqOZksBJJHBTzz1ShohcOjyNkbWpAbuMMk3UMrVrTscqTfuyhBrHkQh5AvkHLyEuVadxGmju
	SRAUi7fBXTUohm5FsJoWcnhcHoUFN0tDNCbvTBxyG/k5PY5eWtxo/E+doQl15zOWuFeB9Ze4lds
	PBTiGg/ECPvV4yKPBWbGNwVFXxBT3YBQlk0diN+B5Z
X-Gm-Gg: AYBFou1iDVT9Y0h5IxKx1XEPm1XQ6c6WTu6GrSKycZgJpe+p/SiYgdPD2y2DV5Xwfav
	qIU+Wvd4S5ZuI+Zszwy3AHroYlO1nw7299K1L2J5G5Cnc2WYRHH7nLRjyWL7mUnAREA4S4PLV+2
	yZm409Q1IaPLh+LYqg6jkoOQ+B4JMYL5Z2tipMNAn6S5tZUD8zVXAa5wA=
X-Received: by 2002:a05:6102:604e:b0:78e:45f7:54a0 with SMTP id ada2fe7eead31-792a7f05698mr1390256137.8.1789070352607;
        Thu, 10 Sep 2026 12:59:12 -0700 (PDT)
X-Received: by 2002:a05:6102:604e:b0:78e:45f7:54a0 with SMTP id
 ada2fe7eead31-792a7f05698mr1390212137.8.1789070352085; Thu, 10 Sep 2026
 12:59:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427122742.210074-1-mkchauras@gmail.com> <CAE4VaGACd2es4NPQyhbR9pMEoGiTVBSE7Lw7x9VOb1Qbpvc6nw@mail.gmail.com>
 <amsapeQ2Kp6rwPpF@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CAE4VaGB_EhbWq8_X6FLtOx2MqoP7JEkOKkKSjKB7N--tt-sCeA@mail.gmail.com>
 <aqAMpawvpB7g1XdK@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CAE4VaGBCmA0+28G=V_Qs37cR2GKYDUTGQWW_uRe0qvEp5io3qQ@mail.gmail.com> <CAE4VaGCp7A7NuBC9Hwgzs5xg3bGBuRiDC8PRCu+yXnUZEXmt-g@mail.gmail.com>
In-Reply-To: <CAE4VaGCp7A7NuBC9Hwgzs5xg3bGBuRiDC8PRCu+yXnUZEXmt-g@mail.gmail.com>
From: Jirka Hladky <jhladky@redhat.com>
Date: Thu, 10 Sep 2026 21:58:59 +0200
X-Gm-Features: AcwNN1WZWaGZqHQqCKl0JdGsW9fRspFbj7NuVeH481kOvPAKWQ8HCEdpVsfXCNY
Message-ID: <CAE4VaGATCET9F4XXS2oj47aNEZx3HN__Zp1CH4+ASec6BjhjGA@mail.gmail.com>
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

Oh, I forgot to add the actual results from the LPAR:

Model name:                  POWER10 (architected), altivec supported
Model:                     2.0 (pvr 0080 0200)
Type                                         : Dedicated
Mode                                         : Capped
Entitled Capacity                            : 1.00
Memory Mode                                  : Dedicated

Results (median bogo-ops/sec, N=3D15 per cell):
  Mode          7.1        7.2-rc4      Delta
  Enforcing     68,275     70,154       +2.7%
  Permissive    68,082     67,166       -1.3%
  Disabled      99,654     100,510      +0.9%

On Thu, Sep 10, 2026 at 9:54=E2=80=AFPM Jirka Hladky <jhladky@redhat.com> w=
rote:
>
> Hi Mukesh,
>
> Following up on the ppc64le SELinux/kill() regression - it doesn't reprod=
uce
> with proper multi-iteration sampling. stress-ng --kill has ~30%
> run-to-run variance
> on our LPARs. Part of the variance comes from LPARs being much less
> isolated than I'd assumed - we saw contention bleed across LPARs on the s=
ame
> physical server, even between "Dedicated" partitions. With 15 iterations =
per
> config, 7.1 and 7.2-rc4 are statistically even (within ~3%) across enforc=
ing/
> permissive/disabled, confirmed on a second, physically separate LPAR (7.1=
 vs
> 7.2-rc6). This matches what you said - you couldn't reproduce it either.
>
> I also built 7.2-rc4 from source with your proposed
> rcu_ct_kernel_exit_qs() patch and re-ran the same sweep - it shows no
> consistent effect vs. stock 7.2-rc4 (differences within the same noise
> band), which is consistent with there being no real regression here for i=
t
> to address.
>
> Sorry for the false alarm, and thank you for the patch and for taking the
> time to look into this - I don't think it's needed for this issue, though
> it may still be a reasonable efficiency improvement on its own merits (it
> does avoid the unconditional rcu_preempt_deferred_qs() call on the common
> fast path). I'll update the internal RHEL tracking ticket (RHEL-216740) t=
o
> reflect that this doesn't reproduce.
>
> Thank you!
> Jirka
>
>
> On Tue, Sep 8, 2026 at 6:01=E2=80=AFPM Jirka Hladky <jhladky@redhat.com> =
wrote:
> >
> > Hi Mukesh,
> >
> > Re: policy details -  I'm running an ELN kernel on RHEL-10.2, with SELi=
nux
> > in enforcing mode using the default (targeted) policy, nothing custom
> > or hardened on top of it. Let me know if you need anything more specifi=
c
> > (policy version, booleans, etc.) and I'll pull it.
> >
> > Re: the rcu_ct_kernel_exit_qs() diff =E2=80=94 thanks, that guard again=
st the
> > unconditional rcu_preempt_deferred_qs() call lines up well with what I
> > was seeing on the RCU-barrier side. I'll apply it on top of 7.2 on
> > POWER10 box and re-run the stress-ng --kill numbers
> > (enforcing/permissive/disabled) to see how much of the SELinux tax it
> > recovers. No need to prepare anything separately.
> >
> > I'm OOO tomorrow, but I'll get to this by the end of the week and repor=
t
> > back with results.
> >
> > Thanks
> > Jirka
> >
> >
> > On Tue, Sep 8, 2026 at 3:26=E2=80=AFPM Mukesh Kumar Chaurasiya
> > <mkchauras@gmail.com> wrote:
> > >
> > > On Thu, Jul 30, 2026 at 01:24:46PM +0200, Jirka Hladky wrote:
> > > > On Thu, Jul 30, 2026 at 11:36=E2=80=AFAM Mukesh Kumar Chaurasiya
> > > > <mkchauras@gmail.com> wrote:
> > > > >
> > > > > On Mon, Jul 27, 2026 at 11:41:07AM +0200, Jirka Hladky wrote:
> > > > > > Hi Mukesh, Shrikanth, Madhavan,
> > > > > >
> > > > > > I'm seeing a ~19% throughput regression on ppc64le (POWER10) in
> > > > > > syscall-heavy workloads between kernel 7.1 and 7.2-rc4, which I=
've
> > > > > > narrowed down to the GENERIC_ENTRY enablement for powerpc (comm=
it
> > > > > > bee25f97ad24 "powerpc: Enable GENERIC_ENTRY feature").
> > > > > >
> > > > > > The regression manifests specifically when SELinux is enabled. =
Regression
> > > > > > disappears with selinux=3D0. With SELinux disabled, 7.2 is actu=
ally
> > > > > > slightly *faster* than 7.1.
> > > > > >
> > > > > > Test: stress-ng --kill 1 -t 23 (single-thread kill() syscall lo=
op)
> > > > > > Machine: IBM,9080-HEX POWER10, 8 vCPUs (1 core SMT-8), 64 GiB
> > > > > >
> > > > > > Results (bogo-ops/sec, higher is better):
> > > > > >
> > > > > > Kernel   Enforcing   Permissive   Disabled    SELinux tax
> > > > > > ------   ---------   ----------   --------    -----------
> > > > > > 7.1      69,107      70,248       93,566      -26.1%
> > > > > > 7.2-rc4  56,247      59,075       99,240      -43.3%
> > > > > > Delta    -18.6%      -15.9%       +6.1%
> > > > > >
> > > > > > Key observations:
> > > > > > - SELinux permissive ~ enforcing on both kernels (overhead is i=
n the
> > > > > >   code path, not policy evaluation)
> > > > > > - SELinux disabled: 7.2 is 6% faster than 7.1 -- the generic en=
try
> > > > > >   path itself is not slower for the base syscall
> > > > > > - The SELinux "tax" nearly doubles from 26% to 43% between 7.1-=
>7.2
> > > > > > - No changes to security/selinux/avc.c between v7.1 and v7.2-rc=
4
> > > > > >
> > > > > > The kill() hot path (sys_kill -> check_kill_permission -> secur=
ity_task_kill
> > > > > > -> selinux_task_kill -> avc_has_perm -> avc_lookup) wraps every=
 AVC lookup
> > > > > > in rcu_read_lock()/rcu_read_unlock(). On ppc64le with PREEMPT_R=
CU, each
> > > > > > pair requires lwsync/isync barriers. I suspect the generic entr=
y path
> > > > > > changes something in how context tracking, tracing, or RCU inte=
racts
> > > > > > with the syscall fast path that amplifies the per-call RCU cost=
.
> > > > > >
> > > > > > Note: this is on top of a separate ~36% regression from 6.12->7=
.1 caused
> > > > > > by HAVE_PREEMPT_DYNAMIC_KEY enabling CONFIG_PREEMPT_RCU on ppc6=
4le
> > > > > > (commit 6ad7751537e8), which I reported separately on the v4 th=
read.
> > > > > >
> > > > > > Thank you
> > > > > > Jirka
> > > > > [...]
> > > > > Hey Jirka,
> > > > >
> > > > > Thanks for reporting this.
> > > > > I'll take a look.
> > > > >
> > > > > Thanks,
> > > > > Mukesh
> > > > >
> > > >
> > > > Thank you, Mukesh! I'm happy to run additional tests on the POWER10=
 machine
> > > > if you have patches to try or specific experiments you'd like me to=
 do.
> > > >
> > > > Jirka
> > > >
> > >
> > > can you try this with the below diff?
> > >
> > > diff --git a/include/linux/rcutiny.h b/include/linux/rcutiny.h
> > > index e56ded733b1b..dcad641eb2c2 100644
> > > --- a/include/linux/rcutiny.h
> > > +++ b/include/linux/rcutiny.h
> > > @@ -120,6 +120,7 @@ static inline bool rcu_preempt_need_deferred_qs(s=
truct task_struct *t)
> > >         return false;
> > >  }
> > >  static inline void rcu_preempt_deferred_qs(struct task_struct *t) { =
}
> > > +static inline void rcu_ct_kernel_exit_qs(void) { }
> > >  void rcu_scheduler_starting(void);
> > >  static inline void rcu_end_inkernel_boot(void) { }
> > >  static inline bool rcu_inkernel_boot_has_ended(void) { return true; =
}
> > > diff --git a/include/linux/rcutree.h b/include/linux/rcutree.h
> > > index 16a04202888b..d623f2a7d3fc 100644
> > > --- a/include/linux/rcutree.h
> > > +++ b/include/linux/rcutree.h
> > > @@ -87,6 +87,7 @@ static inline void rcu_irq_exit_check_preempt(void)=
 { }
> > >
> > >  struct task_struct;
> > >  void rcu_preempt_deferred_qs(struct task_struct *t);
> > > +void rcu_ct_kernel_exit_qs(void);
> > >
> > >  void exit_rcu(void);
> > >
> > > diff --git a/kernel/context_tracking.c b/kernel/context_tracking.c
> > > index a743e7ffa6c0..011018214c6d 100644
> > > --- a/kernel/context_tracking.c
> > > +++ b/kernel/context_tracking.c
> > > @@ -118,7 +118,7 @@ static void noinstr ct_kernel_exit(bool user, int=
 offset)
> > >         lockdep_assert_irqs_disabled();
> > >         trace_rcu_watching(TPS("End"), ct_nesting(), 0, ct_rcu_watchi=
ng());
> > >         WARN_ON_ONCE(IS_ENABLED(CONFIG_RCU_EQS_DEBUG) && !user && !is=
_idle_task(current));
> > > -       rcu_preempt_deferred_qs(current);
> > > +       rcu_ct_kernel_exit_qs();
> > >
> > >         // instrumentation for the noinstr ct_kernel_exit_state()
> > >         instrument_atomic_write(&ct->state, sizeof(ct->state));
> > > diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
> > > index 96848fc1f02b..c23478f70c17 100644
> > > --- a/kernel/rcu/tree.c
> > > +++ b/kernel/rcu/tree.c
> > > @@ -368,6 +368,25 @@ notrace void rcu_momentary_eqs(void)
> > >  }
> > >  EXPORT_SYMBOL_GPL(rcu_momentary_eqs);
> > >
> > > +/**
> > > + * rcu_ct_kernel_exit_qs - report deferred QS on syscall/exception e=
xit if needed
> > > + *
> > > + * Called from ct_kernel_exit() on every return to userspace.  Guard=
s the
> > > + * rcu_preempt_deferred_qs() call with rcu_preempt_need_deferred_qs(=
) so that
> > > + * on the common fast path -- where nothing is deferred -- we avoid =
the
> > > + * cache-line traffic on current->rcu_read_unlock_special that the u=
nconditional
> > > + * call causes.  This is particularly significant on weakly-ordered =
architectures
> > > + * (e.g. ppc64le) where rcu_read_lock/unlock issue lwsync/isync barr=
iers and
> > > + * already touch that cache line in the syscall body.
> > > + *
> > > + * Follows the same pattern used by rcu_flavor_sched_clock_irq().
> > > + */
> > > +notrace void rcu_ct_kernel_exit_qs(void)
> > > +{
> > > +       if (rcu_preempt_need_deferred_qs(current))
> > > +               rcu_preempt_deferred_qs(current);
> > > +}
> > > +
> > >  /**
> > >   * rcu_is_cpu_rrupt_from_idle - see if 'interrupted' from idle
> > >   *
> > >
> > >
> >
> >
> > --
> > -Jirka
>
>
>
> --
> -Jirka



--=20
-Jirka

