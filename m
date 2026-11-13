Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794600004;
	b=EsCHzfeEpF2lw3TdRpsFQTnZgiTa5cWwYLzfSnqbsRYXN27pQFl4Ys2IPKql0VFpHVIU
	 ENSdX4jPtxm4cdyIRH1T3owYW9TWtA5XFf493pU20ZQWfylUA+Ue8eg6c6Gja5NEVxrJ1
	 AdMEY3FD70BVyCyJfHfyZn49EHdR1+ey/jAQB7eIzKE65q9TZ/pT8zGDBgd39UKw+pWVx
	 VRF8iWhyZxX7aQZ/zVTa7KuUn3ye1A/VqICwA1tvAyBW8jIVTT8PXEqLJaiwJNhAd1ahB
	 M8X8MsZrsKuQb5jA+NytRsVVpvERJ4X3B6KQEStYvHZok5+ZOMALll2Ct2DcOZZZwNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794600004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rxxlhOeSTEJsyGO1ruioD4/oFm9x4nBqfgGWGSw6X9M=;
	b=v1wb2/KSvOYXu7NWbplDxpIYeayMDyKKcb2r7/LXbO6Dk0EMikwu6w60UkOlkQ9JBGd5
	 8z1ICfn9TmJurVhfsutky2T5eq1TTkmtYqam8kmLPcFuZEejLuBFhaEFTMHl5x2YQB1zN
	 wz10MR/sNCjMka3Yte87a4qUfKRqu35vDs2vnlTLxDQk0u2Nzk2OC7ot7Eu12ydcZRKAt
	 Fy2OyeYtneFYwzalJDzgr9Uw77JV/CSbrS1bbYIqc9V0B8T3en8F8uQRfj6dwFx7id4jE
	 3Qq/jEMM9r2091drA/WG/AthX41l3tG0zXZOCBHUclz9IEqLiIZpW8CP8ClkVawwhhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gOsxe+bH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F834606A336
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F834606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gOsxe+bH
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so1573e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:00:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794600003; cv=none;
        d=google.com; s=arc-20260327;
        b=VWhwv59/2YPY105asByTZe9KDUQp+WZqlTNLwLCNMwpEBnRASnubldUChHUQh2SbG5
         GIGGC6yeqT1cSwEcx1d4uL2LaIr67DeN/tVZTepZRj/wQGUP0zFcb325Zo8ChtPPOtuz
         r6hH/FNa2zUQTINpQWEJ4B8T5xqsq78Hpk6LEiYFo8lo1PcangAIUkumdVhkIOw/cDTO
         ozS73FKZDpKLGmK0StFBp1BzIgptSq8i2WE+cJ6qlL8nZjDjck5M0X1sk5Yvt/56nOKe
         gNJX0Tj9dJwy98bhdbRcojdfM6yoiBdG73SX/JmDvOQ8awgqgNtIRT0DOxNP4XYtd3ZC
         b22A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rxxlhOeSTEJsyGO1ruioD4/oFm9x4nBqfgGWGSw6X9M=;
        fh=D++8GPU0uGIOZW4wOcs7XYF5f2BZdCr1oHK5r7RHEqE=;
        b=jWS4slD+utZ6DrgrUmh5fGYfJcTjZyfd+eAg/Owg1kJSr0As0r0jXpj4F6fwDgJiuT
         sB8YsaGcFZWVY5rwl9CaUXlQ8koMstKWKsBteq09w2DdSkFj8UAEUB4S1pdOGniNU7TO
         JGd+yPtOKbVckAA1nZMvubxaDu14XtirkD52u6BLWw0igPPy5sJnVgDuCsAQJ2VwO1mn
         9xAa//zU898kXGVVBBD7Dr61vJZZ7X3sGBQf6QtIllj8om9xU769DCjbt28AxIKi0Ym/
         k5chYRrjhaDzK/FgOoFHiWziyKAYHZikLJE6/BPr5XDDrRNcjFYzbD/QALldY0/z1mV5
         NFew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794600003; x=1795204803; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rxxlhOeSTEJsyGO1ruioD4/oFm9x4nBqfgGWGSw6X9M=;
        b=gOsxe+bHAqt8eQThG6pxYJ9YmFlW5P0ltVzn7tjceepoMkRoYWPzmxIo63uE3qd7HS
         AU4fFdQVyz5bdmv8JSoo8nN75A6yFX1ncEdjZez20BVel0eg8Lyl6U5e+M/1I9jfWbsH
         jb4Me7TcWI6dACQRGnzCTYaz4KQWxUeFEvHDUyl1K+gBCRTbtP/oD4UiY42WIDZAI/DS
         yhYNIDSv3tDk0eBrNweHfQtInHupvuHEryZsHnLTSgLDeUeKjXBYA8eu5eYG0Uxa7bf6
         aSCPPslDP85o3H0SdChmgjNJQLrXqxHnTGpJOykuorrmUXQht+Q11n3tAEGGCYoeLFvo
         /Llw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794600003; x=1795204803;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rxxlhOeSTEJsyGO1ruioD4/oFm9x4nBqfgGWGSw6X9M=;
        b=T8pVwOAS8ArgCUGDthYgjF9e97UDfPCE7tzj2u3vyZxybi0M8N7HNC53j9Xd2x2dIt
         8sP3w0q1bj/auQSiCQR/IYCgOR0TtNgzwWthV3ZgSAa2307eYyA6/dHYVxqFExT83gD6
         aWL1IhB+hcoOcCwBkUnRSq2RxAYS400OTqlQ38cgMdAfiVz03RI+EbqBy2uXPgYF832r
         1tIvWMPEnEYrGmVvJS1GMHcHkAX9boBh90L26NRQ975xz3lmFMvILJitGzAUyKvoB4Z1
         HvAXEdPfBn17mWToUcN89D+ttDDa+5Y+hd7eCcsuxqLbLFBhDpfxGss1/MoqQ+QGGf2N
         f25A==
X-Forwarded-Encrypted: i=1; AL+hErGUAhC2UFLwfjhav3f7idVztjqRIDOtUORtkE5jut4ZKdrB7aaWBglp745jZkipJTiG1v2kjKARqjoMIi0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yKa7nmDsgRK/iEA4CPEIPEOD9/TQsWTNWXmufxLliGGH3Y1Ue
	Sc+HjoVHlqtwSVqBX+Oy/2BG/2EWBYY6ovM06ez6pPAgPhwRzl6/EP9mcnMpHVFnH6o0roHr/gV
	qFR4ELt/ovn2fwquYL37HGQmhCTkrT3qsBWrCKsEk
X-Gm-Gg: AYBFou0LUiRBGR4qD/nTXuc+yTK6vgzmIIqtjtrHsg38A0uxW72zZKpF3nNUcAqoaVH
	SO84ioH/xGflmvXvSp41OUYW7byIUnq8zrLA+qXRg+D6qjXScPPuuH1o1GIDLbbFxX2JR+LjYYO
	znbWVsckz1NQLuUzo7FvPmTIf3Y/k/yw+fD7fO41EeR6o0m4fBKUvpfP0GJv4a4ySxoweXwAk3b
	VYQMYajse6IDlOPCeHRbJLsglQBFhcmkY1NLRu7JwAw40niCZ/mKNn60q3btyR8NFyjzO5ngdcI
	R0PhRPHq3WRVhQoa5yGR42PivySgjSAaesHqaMXArCv9ITGPcWBv0qgAMW+cubSOlQQ82ukdoZs
	fTAjiK+5eKHW9mDJnZCLgj/LBjsbubfPjFR1KxGK51BEtLmzf9un0KuBpwz/15MFTMRkn9w==
X-Received: by 2002:a05:6512:158c:b0:5c0:7c6e:4559 with SMTP id
 2adb3069b0e04-5c17d87209emr18838e87.9.1794600001977; Fri, 13 Nov 2026
 12:00:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105165525.011876858@infradead.org> <20261105170157.765325702@infradead.org>
 <CABk29Nujsg7FNY4yJ3Yd0maT0GEtvxacUWvTDiT5HD=-YVqTvg@mail.gmail.com>
 <avMeP-80bZz-zdtO@scheduler.schedules> <CABk29NsBzdEYOdLqj9HsrCqO6RzW_G574RzY+=vJp+564R2u=w@mail.gmail.com>
 <20261112123119.GX1813469@noisy.programming.kicks-ass.net> <20261112123852.GE1922751@noisy.programming.kicks-ass.net>
In-Reply-To: <20261112123852.GE1922751@noisy.programming.kicks-ass.net>
From: Josh Don <joshdon@google.com>
Date: Fri, 13 Nov 2026 11:59:50 -0800
X-Gm-Features: AclHuK8RRsqB3tyeA2JZZxXprj6fmvtiP6iBJUOFwPgkdpHpaG_KNh0ddyQesnA
Message-ID: <CABk29NtpA5h2ZS4zk9oWeh+ca7pT-6B7T0sgr20wC4RfD+P0_A@mail.gmail.com>
Subject: Re: [RFC][PATCH 3/3] sched/eevdf: Fix sched idle task group preemption
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kayra Cizmeci <kayracizmeci@gmail.com>, mingo@kernel.org, linux-kernel@vger.kernel.org, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, tj@kernel.org, jakub@okonski.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 4:38=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Thu, Nov 12, 2026 at 01:31:19PM +0100, Peter Zijlstra wrote:
> > On Tue, Nov 10, 2026 at 09:51:21AM -0800, Josh Don wrote:
> > > On Tue, Nov 10, 2026 at 6:20=E2=80=AFAM Kayra Cizmeci <kayracizmeci@g=
mail.com> wrote:
> > > >
> > > > Hi Josh!
> > > >
> > > > On Mon, Nov 09, 2026 at 04:10:30PM -0800, Josh Don wrote:
> > > >
> > > > > >  /*
> > > > > > - * Preempt the current task with a newly woken task if needed:
> > > > > > + * Preempt an idle entity in favor of a non-idle entity (and d=
on't preempt
> > > > > > + * in the inverse case).
> > > > > > + */
> > > > > > +static inline enum preempt_wakeup_action
> > > > > > +wakeup_preempt_sched_idle(struct sched_entity *cse, struct sch=
ed_entity *pse)
> > > > > > +{
> > > > > > +       int cse_is_idle, pse_is_idle;
> > > > > > +
> > > > > > +       cse_is_idle =3D se_is_idle(cse);
> > > > > > +       pse_is_idle =3D se_is_idle(pse);
> > > > > > +
> > > > > > +       if (cse_is_idle || pse_is_idle) {
> > > > > > +               find_matching_se(&cse, &pse);
> > > > > > +               WARN_ON_ONCE(!pse);
> > > > > > +
> > > > > > +               cse_is_idle =3D se_is_idle(cse);
> > > > > > +               pse_is_idle =3D se_is_idle(pse);
> > > > >
> > > > > now that se_is_idle() is checking for any ancestors with idle, th=
is
> > > > > doesn't appear to be correct. Some motivaing examples:
> > > >
> > > > So we want to keep the idle difference between groups with idle
> > > > ancestors? FWIW, I asked about this but then thought it was knowing=
ly
> > > > and that was what we wanted. I'm still not sure what we want...
> > >
> > > cgroup properties are cgroup hierarchy position relative, this just
> > > maintins that behavior for cpu.idle as well. There was a more
> > > extensive discussion on this in the previous RFC, which is how we
> > > landed back on the find_matching_se() restoration.
> >
> > Well, I'm still not convinced we need this.
> >
> > Realistically idle means: "don't care, run whenever you have a minute".
> > To then preempt such a task for another such a task just because its
> > somewhere else in the hierarchy makes no sense, you don't care about
> > either of them, we shouldn't be preempting.
> >
> > Anyway, I've pushed out the first two patches to queue/sched/urgent
> > since they address the worst of it. We can chew on all this a bit more =
I
> > suppose. But I cannot convince myself that there is any situation in
> > which we (should) actually care about the timeliness of anything in a
> > cgroup::idle container.
>
> Perhaps even to the point that we should have idle (either the task or
> the cgroup property) imply an extra long slice length, much like how it
> implies a very low weight.

Does the example I gave earlier with separate users (jobs) that can
subdivide their own cpu slice into regular and "idle" usage not feel
convincing to you? If a user is entitled to 50% of the cpu, and they
have both latency sensitive and background batch work to do, they
still want their batch work entitled to forward progress under the
job's overall 50% system cpu share.
