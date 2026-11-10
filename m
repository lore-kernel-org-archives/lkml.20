Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794333095;
	b=yZjuw3yY7J/VxgXPDAvruJxTitlmNZPh4VPqZDSD88lr4I4S3QX52owF+jPw6YxADIWp
	 e5xJ6eo1+X+kUiVj/JnKgSAQe/mibUiEwJaFxJvDpJGxx01EYejAKiUuW6H1SUyarfcS0
	 o6LRkZMoNZ4xWPWecR2v3gRfeYeDplq/p3zeS5RNnvoLb78osKhyxogK7GwCul3LRrPlS
	 V8L3oUGKVd/7Yn5FYZendQ+wE+DgArJ5rWCP6/iO0bOuPDXozuZzIOjn6MUFf2le0v68A
	 RMX1Cnf0ewkb4zRLBIGmTfvOorVp5TqSV3sueXLuujS4aeLEyQA0gwu6p+3PdL5x+/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=l0QAMyRioMi5XhklthvtwTXDZy3heUuGNeimhftHveA=;
	b=1+ncavz+CZaifJEaSflSw+UaI508uZqW1kQNMiozq+Q7k0dhjmrX0l6VeA+Rgbfm6mdz
	 9vhku+lu5rkeuOuwIcmDAu57v82aPbj2i85xJftcO6az8GWaZ0fWqtuM4OB9d/9aSabgN
	 Rc77Ak89ko/gFUL59JaiewAjqqvv+nQ3ABBkEqlPshSAXcpqoGlYKLrFsHw/VO1WnqJlX
	 fRawVu5IUvYe27OmYMT7mmn148ktxQ8YBb4NwNdRD5pDul0IKkw/d1v3RsDGi+KdCKQAJ
	 CgOnAETkJy2I+EPLF65n6O967fZ28R7w4misDF3Blm7lzG/O9YbaaLgebhN61RiXacA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gnJ74gfF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308CA606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:51:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 308CA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gnJ74gfF
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so13107e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:51:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794333093; cv=none;
        d=google.com; s=arc-20260327;
        b=eFoxLuiraAMvW6Rw1+9tkkQ/mFhO36cVh3el6yyElrfBdlrfJj5tdBTSwJbV+43o1v
         9xH/Vp/T/jqkhib95o7cGsZx+w84uMEHNfLeoGnqGwVtjyhj+PlEEAGjSXTGmmk0ts8e
         SEZLSPPIQRirCtvBfBxf9T8tFDrISE6i4AsVeDP5yGH+LOV7xBpET1K+aAjRGSMa+HCG
         Hu9NvMgFwpWAtk7BkghRW1CSTKA7baAZ0Ym6D71S4GELqMhyayPoejJPZS8zffNmnVoK
         QW4x0aaeXvDgy2Mn9UuzO7ppv7wxAe+GRJXW+y3JVOX2IMCxFC5RCfx1l6MibeM+OmH7
         qtVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l0QAMyRioMi5XhklthvtwTXDZy3heUuGNeimhftHveA=;
        fh=YRqyZqB+Di/i510cpYas0AV1X6laX0q1wnOxbhsIzZ0=;
        b=DKd+2LSj2687uUnYw9ach36P6iJgVa/pknh21m5O9DFcePNhJ8JPdn8V81Yu3xQyI3
         YyLUR6yhjtr9br9xz/uO+d5QESCC095r50M5UmHfcHyxO7JOYJ4EFvaycm3FgbPZ+ovy
         62MbJbls3zhSamqY02fudBTo1pToxH6AZBaKMgxWfOy+AMygK/9fXpWf3HXnqLAUqYiF
         1kCTdmqGse82uqJDwPrqCcgD0LUMgOYlFg6CgCpx9acZHVxFBlX520jvMbykYwwUvp99
         KWXgyGF7zfCHnXgQSRZuS1yxAzYtK3P4RApDbj8dNpFrRqUMQ9nx6y/QJK5ruC50LY6e
         qxzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794333093; x=1794937893; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l0QAMyRioMi5XhklthvtwTXDZy3heUuGNeimhftHveA=;
        b=gnJ74gfFCb1d/sN4iFL3foEp2CPMVIk3kBRZJFUl3LvS8EHURdLFJJn/azah0cP5xL
         60QsCGoSmqgYBZR9F1VUh5cwxKoZT+NImmKMfw6xlbOvxPcdZRSKeYcHP3d53n9qKbnF
         KURURxSKw7lg5tPQwGEhHiDIv1zaJc4jri2f2ZxTOFBgogGyzWHP6KibEJnT3ne+R/kn
         76yVp8ZmAffabSp2NogNMpcYtNwqH5wT28yN4ykL7r+nkcaAqL7ZZcVY/uBEqvU6j5E6
         4haBTLviZQDtAlqN4Bt+DfP3XbEUBnHDa5EoKPPbqW468sNJU+b58ldRWJyvXiLD5tzi
         KTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333093; x=1794937893;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l0QAMyRioMi5XhklthvtwTXDZy3heUuGNeimhftHveA=;
        b=iigoxpVMBhneIXVzIp7aMH3UxhDmVTFr4jdpnQbst7yuDB07169nuwM+Z3DtYiv+Rk
         NmAp/zOWoYBogpnWi5ymfnr6u8DZiAENkVboTRNbJIsjaO4MUB3WXrMKhTX9dw82rgKt
         MJOQCqbDmnRN8QKj6G05794SzRaHRQxTKv4A46LxSfUUXAvTiLv//yd1oXMmM9EMGROm
         RV8sSy5vEgLP3Ty8TAd8V7/cSVhoTQ80QNt/fYN7O9NqE5jCfO+86UH+HsjGAgu9vXiS
         w0YiUIyx9bSB0yL+zVIUfTLsow4SKsGOl0scljuMheUDi5fK1fD/JRn/8178ShckNTVy
         gPCw==
X-Forwarded-Encrypted: i=1; AL+hErFLvnMb2fHJp53E2TBcqPmdpXfuP1XMqVwxDksNo5Tf3UxnzZtaVP/wFOfVv8bxaVEGnUDnbZV/nX5HpEw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IHTT9yyynbYs33sQv6gCfQWgmXwMIFeekWYNsqzp6zI1i8S8U
	44cTbI8vWA2yze9ABDJAl8RikDzUpBbe+mPDNyFv+O8pmh60IjSe+Fzp/4YpcTBk7c/dcUmTdnI
	MeYx7wDiB5EmmOiWnjuEJjZraAuy/DkOLVGZ5eSwB
X-Gm-Gg: AYBFou3D3pMXP+q/424XhgQWIqEjD6FxcUST0dumZ4mkYQNuQBXTzoCTkRrReGY/6na
	AMr2+dlllyPFSHSYwRsVwDu5v1NB318cvosYp9o7+poQopWJGqPbre3rUEa44aGOldyaI5+AbM5
	Upg2uTSia+niXiPV2sohfZ51W+yee4SuwfNdNuSiSHjosKwrKAUynMmJmQ45Ic0LDwjleYklfch
	doJsdO+1KKCkm/L3Dznb7Q11gjnNpg8r6Y+90yF63KMddgESWskB9djeYk3SlO3cxKNpaSFRMOU
	ui+CeIVxM6PExqRwwWydZTb4W+ipsiGDr5qvfYUuS9UnEeRjnkYlgdpIkFai2JfgO2v9pzv7JjI
	kBVaPt17WQPwIfcXN2A0joGBMUPxDxemuVurmPAuN5WZ99aGRhaw6PePWYViweYpJmA6xT2E=
X-Received: by 2002:a05:6512:2389:b0:5c0:50:ff89 with SMTP id
 2adb3069b0e04-5c157dc8a9dmr158053e87.14.1794333092758; Tue, 10 Nov 2026
 09:51:32 -0800 (PST)
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
 <CABk29Nujsg7FNY4yJ3Yd0maT0GEtvxacUWvTDiT5HD=-YVqTvg@mail.gmail.com> <avMeP-80bZz-zdtO@scheduler.schedules>
In-Reply-To: <avMeP-80bZz-zdtO@scheduler.schedules>
From: Josh Don <joshdon@google.com>
Date: Tue, 10 Nov 2026 09:51:21 -0800
X-Gm-Features: AclHuK8VxoIVTd1eeJUnM-J3Z7oTimMmBLy0hxjjDAIAlOxtMq0ebO4KncJJ5eg
Message-ID: <CABk29NsBzdEYOdLqj9HsrCqO6RzW_G574RzY+=vJp+564R2u=w@mail.gmail.com>
Subject: Re: [RFC][PATCH 3/3] sched/eevdf: Fix sched idle task group preemption
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, mingo@kernel.org, linux-kernel@vger.kernel.org, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, tj@kernel.org, jakub@okonski.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 6:20=E2=80=AFAM Kayra Cizmeci <kayracizmeci@gmail.c=
om> wrote:
>
> Hi Josh!
>
> On Mon, Nov 09, 2026 at 04:10:30PM -0800, Josh Don wrote:
>
> > >  /*
> > > - * Preempt the current task with a newly woken task if needed:
> > > + * Preempt an idle entity in favor of a non-idle entity (and don't p=
reempt
> > > + * in the inverse case).
> > > + */
> > > +static inline enum preempt_wakeup_action
> > > +wakeup_preempt_sched_idle(struct sched_entity *cse, struct sched_ent=
ity *pse)
> > > +{
> > > +       int cse_is_idle, pse_is_idle;
> > > +
> > > +       cse_is_idle =3D se_is_idle(cse);
> > > +       pse_is_idle =3D se_is_idle(pse);
> > > +
> > > +       if (cse_is_idle || pse_is_idle) {
> > > +               find_matching_se(&cse, &pse);
> > > +               WARN_ON_ONCE(!pse);
> > > +
> > > +               cse_is_idle =3D se_is_idle(cse);
> > > +               pse_is_idle =3D se_is_idle(pse);
> >
> > now that se_is_idle() is checking for any ancestors with idle, this
> > doesn't appear to be correct. Some motivaing examples:
>
> So we want to keep the idle difference between groups with idle
> ancestors? FWIW, I asked about this but then thought it was knowingly
> and that was what we wanted. I'm still not sure what we want...

cgroup properties are cgroup hierarchy position relative, this just
maintins that behavior for cpu.idle as well. There was a more
extensive discussion on this in the previous RFC, which is how we
landed back on the find_matching_se() restoration.

ie. user given a cgroup can sub-delegate portions of their job as idle
relative to their main workload, but all of this still runs at the
user's priority vs other users on the system

>
> >
> > Ex 1:
> > regular task and SCHED_IDLE task both inside an idle cgroup.
> > se_is_idle() will be true for both se's, and so the regular task will
> > not end up preempting the SCHED_IDLE task, which would be the
> > desirable behavior (the task is not idle relative to the SCHED_IDLE
> > task)
> >
> >     cgrp A (idle)
> >      /                 \
> > regular_task     SCHED_IDLE task
> >
> > Ex2:
> > more complex example with a hierarchy of cgroups
> >
> >           root
> >             |
> >           cgrp A (idle)
> >          /            \
> >      cgrp B           cgrp C (idle)
> >         |                   |
> >       task_1            task_2
> >
> > task_1 should preempt task_2, and the inverse should also never
> > happen. However, the matching_se here are cgroups B and C, and both
> > show se_is_idle() as true
> >
> > I can think of two simple ways to fix that, either seems fine
> > 1) use the existing se_is_idle() check for knowing when we can
> > fast-path skip the whole find_matching_se() business, but when we do
> > find the matching se, rather than use se_is_idle, use a more targeted
> > helper that directly compares just those two entities without any of
> > their ancestors (ie. for the task case just check if it has an idle
> > policy, and for the group case, just check tg_is_idle())
> > 2) once you find the matching se, just compare the ->idle values,
> > since if one of them is bigger (by at most 1?), then that one must be
> > the "idle" one relatively speaking. Handling the task vs group case
> > here seems a bit messier compared to the first option, so my
> > suggestion would be to go with the above
> >
> >
> > Best,
> > Josh
>
> Cheers,
>
> Kayra :-).
