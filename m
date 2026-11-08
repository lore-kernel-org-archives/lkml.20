Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794147860;
	b=pc+IlhR2Dm1MHdA/k71+jlZ4iToSHGcZetkZZ7ICGKjf7/Dw3fPHyDAMBVnGWWQMBWWA
	 WMVF5oPNV8Pfh3XiTfXtB4IYjmDiH3Pcl21Xp9fa+J7KSeKftGYv1ILNrmJXL1XyaGBzk
	 e2P3r4k1AYCs47nayZQtMqq7pu0t5pZuhxcHFVodTZNev/oKRw4T8NwH43nEw7GwUci3v
	 GUzdfbgii7pKKKCdv8o4Qlx29mKGO16sRF5R1SFGjSY/EFxnDkqHP4NTa40aiU+MaLn6u
	 7qfcjeyic+TSZXLaWQOQbARAUUSDNZglnxnShPg7axRmMhM1tbcW3zel/KMz2e58JOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794147860;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=r5RsrNxAh7DgoouGJ4IC6isO+zYq6OCTwcMbp742YFM=;
	b=J1KALtwhdhCen4v5TLSiZUfPgpaVdho8713epPA2w0CQnBFtOIyk/tJ7bow6aCu3SM9c
	 3T8356xmDKorMip/6Zcnfk+7hRnzlwz52U2XHpfU8qSWt9Ruv6/500JjDIdiBsj5xuSU4
	 H4cDO7I0B1xS2+A3UU3JVYZ0zGEKHB/RlU5ZDuV3RFr19ZH7dhCiExdfTGyQR8molR4oI
	 Q/TN+nMbRWbdo6vR5Jh5jQzavm2saMO4PdEzVg/S6MvtxnRoZFPdlGzxBBMavfvkDEY/c
	 s5SM5G4oIsEk2JVwitwPcHtNfSLUY1Qiuw3eQc6pwUsiD+d8luLgTM9k4vQnvYQwB5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DB+hGGel;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37769606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 14:24:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37769606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DB+hGGel
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c450ab1483cso16561766b.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 06:24:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794147857; cv=none;
        d=google.com; s=arc-20260327;
        b=WLxDPohHeVnmt61pT6OwSdcNHSf4k7/zPTX7lNAyYKhFOen89Wx40gRIlWrChyL7Mr
         7jqhxvvl/zyVOMNTwfCD/tWoexvdyBMQY8T8w677oQhzUqX19qWfGsaHNOQwCVQLlsWX
         QKLML+sTWHWICp36vI6JnDmGwMnfjT8TqduQs5o9tyq8en9wNlF0j2Ki6vqencuLUSxl
         xPE+diGEbpPhV/K6dVfQQSH66FjkF8ejf+ZwvXG5xKcRuu38jhTjHTl6/eIWjQduvsC+
         rd/0Rg60diRRoDcoCIemxS7PU/zC0YefeqyiqgMTQaFJCrDuBy3Io9DJHxVqMIgzfeJY
         eJTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r5RsrNxAh7DgoouGJ4IC6isO+zYq6OCTwcMbp742YFM=;
        fh=WbOZ9Ak02f+HFJwALEStfSXUQxp2tSUpLk5Bffa/NXk=;
        b=UOZ/+TedwrC45cfQtawlRR1o+nS71tDRKa1K6BlQOm5cglWUi2CUcA4f8kLZZ5WYX3
         peM45ku/6Smy+zQwVoRScHdMH/OhOSjlzoCPyN98mu64tRW2o0LqH5Rd9PD7xIV6Gs/4
         /COP4IESRlJBnjc/Dzy/SvvggXj4XkIaznA8i2vBBmpHgvP/WHQsuicQMwDwMTxHNxuw
         cLWlLAcbvUahhMI6CM564MVz1qZSuwTayb+L+WZZbmoXyf3eKmf4tbO6aMsL0wrVxwf2
         NbfmNlNZ7V+DC4Kv1KxJ/Yu9ozAsC6ijDxHFJb1hMJYz01aHLUWON5l+OM20vWfBjw1g
         tCVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794147857; x=1794752657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r5RsrNxAh7DgoouGJ4IC6isO+zYq6OCTwcMbp742YFM=;
        b=DB+hGGelTuimW9Jk6S6fyUJv64EtwmjJNy/ZcsffOUmAM4XbIG765WxolnIvcUOih8
         8iXTo/jlplBIHduVmtrnLpO44ZUX1kzHukgMIYfyvqTVEze0iMVLT00v4YUb8z9qxHwx
         s05wDRh/HV6mlPX07sgeXfK3tLMKC61Jn/Nlh+wgCIQASwb8c0JUeslninqQQUpOO6e3
         ns4kGZ9MblZ+3TBnqyj7d3rvNGdClHRmPyyUCXKdrexjvS560tkrLEh46lFU066gi6es
         cVDdE+iOnurmI7CsJGpazXxDxM5HrvHla0teHpmfm8rdwdeqwCAJ2ekBmdds+gN6M4S5
         +60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794147857; x=1794752657;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r5RsrNxAh7DgoouGJ4IC6isO+zYq6OCTwcMbp742YFM=;
        b=ioRD+/HyOUxSeV69btg8C/IL3C9eNF2fTYFgyqSM+rnkHrv+vj1+/+VoU66uHgfYDc
         pl1yvzWHex9lFteZZk4puxtWHgunc0TpHOD6ScHP/8qQ34CE6uNfRwZI8j2I6mzY18AO
         T1iGMXsQXGyv9e+PayVeK69/l3royyfdZMVVV55tx+0GN5SPnWA1m+bUX64auwH2DTDV
         2bDo5kM+oG8jGpQKK0CHeHPjqXRfkM5xexz8Je5sVXhuY4WshWB0QqK6NX6DqOLtRBe4
         NX2I2y36tu6u/Xy+SdGWUxbNolsLUqsf3lGS74pVohuG6UN9+Ra4aa0uxfoL0rk9568i
         mdHg==
X-Forwarded-Encrypted: i=1; AL+hErG3HZpdNKZaaZbKfEZA2RUopB1vHEcBL3p1+AQPdBBGowsd5MTMFg4cSTPzuYYmuLY4m0yTFwsdITwEjhI=@vger.kernel.org
X-Gm-Message-State: APuU4Z97A3E6aENh/i0dXAcdkFU8z7XWYx4UMd+CJOBi7oE0HoLLitn8
	AU7It+MpKYHJSzMmINeFPQJw9NpM9G7/LQ1lOHEGRc11QiB1+NUktDMhJABy1Khdevxdb0yv9qB
	cc21nLidRDNuL5J0gKm5wR7IE2Jsz83w=
X-Gm-Gg: AYBFou1tzslwvHrGRICUHAcuZVlH4I+YoZ4t5FDbdUvxFQhwqARjJV17A8FvojNcEfK
	cTIe1Zwnya5Yl/ANHLzSV60tD107wufKH4iU1leMk8PhpRV0zTnBtPscweuOdnvqUyPtLiYq7dS
	KS/EoSETCHY56qNL5c54OamtawK/gVu8CbKzHXdv02bB+DoQEPB+YKp1GYm6zhQfE1pOgkLgHgo
	Y4W5TSfxIQywQmJ8BhmO9m8TTDO1ZdEPsRBbXhoUZ1FB1tUEXYxz83O6IsR+nmK7gK/lXeXQOXr
	gRNrzlqsaIlFrZQPKrP6FLepQFHqeTrKdrzQtQrOtf9WfINauXFqabhvhoTNcD4QGOjz5c0PBxp
	0doiMSqIaBABIMXp4pF+Y8KveJHgaz+9cPVeVBq24PFlQy2M+IgxR3H8nfEi3AXn7/EEyFg==
X-Received: by 2002:a17:907:7b91:b0:c46:645f:cee2 with SMTP id
 a640c23a62f3a-c4d6d994688mr122085066b.4.1794147857304; Sun, 08 Nov 2026
 06:24:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108132634.2650642-2-bestswngs@gmail.com> <74b00dcc-113f-4532-81f5-e7e0814ddc4c@efficios.com>
In-Reply-To: <74b00dcc-113f-4532-81f5-e7e0814ddc4c@efficios.com>
From: Weiming Shi <bestswngs@gmail.com>
Date: Sun, 8 Nov 2026 06:23:40 -0800
X-Gm-Features: AclHuK-RDpsKHHqs6Zf5S8zaUfD4URbw08aTNu88KBVtWVm-WrJ2tV0BX7o5hF8
Message-ID: <CANgPUi1To9bPCj0WE95mLMSBjw9hG+0oxAAPrApLv7Pvijr_NQ@mail.gmail.com>
Subject: Re: [PATCH v2] sched/mmcid: Synchronize exec MM teardown with
 affinity updates
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	linux-kernel@vger.kernel.org, Marco Elver <elver@google.com>, 
	co+cab19e2ebe4d535a@bugs.sh, Xiang Mei <xmei5@asu.edu>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mathieu Desnoyers <mathieu.desnoyers@efficios.com> =E4=BA=8E2026=E5=B9=B411=
=E6=9C=888=E6=97=A5=E5=91=A8=E6=97=A5 05:33=E5=86=99=E9=81=93=EF=BC=9A
>
> On 2026-11-08 08:26, Weiming Shi wrote:
> > set_cpus_allowed_common() passes a remote task's p->mm to
> > mm_update_cpus_allowed(), but the scheduler locks do not stabilize that
> > pointer against exec. A same-owner sched_setaffinity() can race the tar=
get
> > replacing and freeing its old mm. Current kernels are only incidentally
> > serialized by futex_exec_done() taking p->pi_lock when CONFIG_FUTEX=3Dy=
;
> > valid CONFIG_FUTEX=3Dn builds remain vulnerable.
> >
> >    BUG: KASAN: slab-use-after-free in set_cpus_allowed_common (kernel/s=
ched/core.c:10835 kernel/sched/core.c:2829)
> >    Read of size 4 at addr ffff88810991b04c by task poc/5127
> >    Call Trace:
> >     set_cpus_allowed_common (kernel/sched/core.c:10835 kernel/sched/cor=
e.c:2829)
> >     set_cpus_allowed_fair (kernel/sched/fair.c:10046)
> >     __set_cpus_allowed_ptr_locked (kernel/sched/core.c:2842 kernel/sche=
d/core.c:3224)
> >     __set_cpus_allowed_ptr (kernel/sched/core.c:3258)
> >     __sched_setaffinity (kernel/sched/syscalls.c:1161)
> >     sched_setaffinity (kernel/sched/syscalls.c:1239)
> >     __x64_sys_sched_setaffinity (kernel/sched/syscalls.c:1275)
> >     do_syscall_64 (arch/x86/entry/syscall_64.c:84)
> >     entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
> >
> >    Freed by task 5128:
> >     kmem_cache_free (mm/slub.c:6757)
> >     __mmput (kernel/fork.c:1204)
> >     mmput (kernel/fork.c:1215)
> >     setup_new_exec (fs/exec.c:1395)
> >     load_elf_binary (fs/binfmt_elf.c:1024)
> >     bprm_execve (fs/exec.c:1865)
> >     do_execveat_common.isra.0 (fs/exec.c:1963)
> >     __x64_sys_execve (fs/exec.c:2036)
> >     do_syscall_64 (arch/x86/entry/syscall_64.c:84)
> >     entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
> >
> > After exec publishes the new p->mm, acquire and release the task's runq=
ueue
> > lock before the old mm can be dropped. Affinity updates already hold th=
at
> > lock across set_cpus_allowed_common(), so the barrier waits for any upd=
ate
> > that loaded the old mm. Updates that start afterwards observe the new m=
m.
> >
> > This keeps allowed-mask updates synchronous, including transient affini=
ty
> > expansions, without changing the MM-CID fork, exit, or scheduling paths=
.
> >
> > This change was developed with assistance from an LLM.
> >
> > Fixes: 7e019dcc470f ("sched: Improve cache locality of RSEQ concurrency=
 IDs for intermittent workloads")
> > Cc: stable@vger.kernel.org
> > Reported-by: <co+cab19e2ebe4d535a@bugs.sh>
> > Signed-off-by: Weiming Shi <bestswngs@gmail.com>
> > ---
> > Changes in v2:
> > - Replace the schedule-in deferral with an exec-side runqueue-lock barr=
ier.
> > - Keep affinity expansions synchronous, including expansions narrowed b=
efore
> >    the next schedule-in.
> > - Avoid changes to the MM-CID fork, exit, and scheduling state machine.
> >
> >   fs/exec.c             | 1 +
> >   include/linux/sched.h | 2 ++
> >   kernel/sched/core.c   | 6 ++++++
> >   3 files changed, 9 insertions(+)
> >
> > diff --git a/fs/exec.c b/fs/exec.c
> > index 8d2b14e1d455..2e1cac6a3de7 100644
> > --- a/fs/exec.c
> > +++ b/fs/exec.c
> > @@ -905,6 +905,7 @@ static int exec_mmap(struct linux_binprm *bprm)
> >               BUG_ON(active_mm !=3D old_mm);
> >               /* Defer teardown to setup_new_exec(), outside the exec l=
ocks. */
> >               bprm->old_mm =3D old_mm;
> > +             sched_mm_cid_exec_mmap(tsk);
> >       } else {
> >               mmdrop_lazy_tlb(active_mm);
> >       }
> [...]
> >
> > +/* Wait for affinity updates that may still be using the old MM. */
> > +void sched_mm_cid_exec_mmap(struct task_struct *t)
> > +{
> > +     guard(task_rq_lock)(t);
> > +}
>
> Using a lock side-effect as synchronization of what sits _outside_
> of the lock is an interesting synchronization pattern. If this actually
> works, it should be thoroughly documented.
>
> It should come with at least one sequence diagram explaining why this
> works, along with acquire-release MO explanation.
>
> Thanks,
>
> Mathieu
>
> --
> Mathieu Desnoyers
> EfficiOS Inc.
> https://www.efficios.com


Hi Mathieu,

Thanks for the feedback.

I will include the requested documentation, sequence diagram,
acquire-release memory order explanation, and reproduction code in v3.

Best regards,
Weiming Shi
