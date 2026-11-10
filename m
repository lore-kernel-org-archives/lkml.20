Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794299276;
	b=qbsGwFwc94ZSGO6p3/WiMmrGJPliupKt2LCHSzqtD1md3aHICsHMoZOgB25gjNVb+PY2
	 r+oPOgXIlP4Fm/yJBlPerDtgOKAno3gbwnoV1ixhnTzSs+qFJgQg254t0iNMxgwqkqIdM
	 NkVPrM+qwNJLMsqO8d19hlluU8viXpgvHHy2jRZ7i99T+qk5LARN8XpCv8xAlcfQfsh/c
	 75Jg93CHi8OnM+KSfhGoWmzdHcdqSLH3vp2sbeYuiaDZWP5Cl+C/9//RGaC+/Ab+z+V+Z
	 YNNgaK8YO2qYylxUo8jEINplgkcmFH8ztdkkgncapVL/Fp2FIwahDPDS/1F3mNQ5JiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=0sftvb8ZoBPTsS3ogHwi+u9oXrX5v2r9EJRPkGherl4=;
	b=QepSevoQAe2oPqNjDjm78VhkBGu3OEtTIWXEQo/BScKye7GgI1K2tL8w8r+LIPXQonoo
	 OLW7vPKfWk0cwUIUO0/zSYgW29CL23JG3zufzlEi5L8mifAgnvnk5BDi9h7WZkcAA/OY4
	 kYUAsLlMbi+vkLI52GxXhV9rhTWygQE0xjI+I9x52piqRCmuR+hU3J28cWzPRsQTspDZn
	 2X1DTz6Rj+BnP/NZEkGRDGbEMSV6M08kxV94BueMpZ2Zf7GYxwX0U9Xp5bLZ/89P1SkZt
	 5NFvzkO/0MkO/Qa5M0E7U6bezh+KdLuSdYNrU1NhrkwjJMHLXUclgoqjxiABj1a7BKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FCdsonxq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A541960A262A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:27:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A541960A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FCdsonxq
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c40f29667e6so255758266b.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:27:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794299274; cv=none;
        d=google.com; s=arc-20260327;
        b=FC13td5EKpyITZDXTOptpX39XusM9U4FGy55QA8mKzW033nLu5Tao0hlyCzcnz0CKQ
         9biSEe5/zaySQPjMQypePoZwVXsJia3W5zMEt6k2AqqwhY9ZcTVIOqlVmv9WUKedd1Jt
         Dt23zUm887Gt/ITInMIe/qB71u6VetjP9DNVWgSZF1c3wbdSXqWJYNrUgExSzakd29zd
         4IPmU1LvqkrNeHZVph/eGLkM7CHtI/OzKwMMYlVvTdHHvB9TEWG3NP8XNTpHOYZvbdHc
         FYBjlmYhk7b8lFCnX2yeaHkMeZT7umDydR9ko67AfBo34nm+C8NftUvhA2k8zM4+F3SU
         nNaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0sftvb8ZoBPTsS3ogHwi+u9oXrX5v2r9EJRPkGherl4=;
        fh=ghsbYtZEsjOiIhtkgaxqkQBQJvTC70wYKaedZEQwNIg=;
        b=qDRJPww+Co1e4dwjrO/1X1SOSp/CGDAgqlTm6qCrcOcaY0n0EC5wYpNgq7bK6vGK89
         pSAjttSBDMDgdPEkWQ0vkRflW2NroK9KrMF2cOeIxy/VmfswYSsct6hcu5Ga0gd2EDHb
         07hNdyS52n1gPKp3xuhFKaDgQS8R5d4L1vz5g7HqJD5c7PVnIDYpzOP2mL/F8g4H0fLK
         jo//RHScoQOUWEHhhQRyDGuzkijYE4NAxrHLq5zhCElb39HWKTtmebK8RygTRJdUP2wm
         djrM0gSI7o3znz9LIVvK0I9HWKd7rCJjKn4S600om0wVZaWakj/lM2zB9U9N5zRnwtt2
         /uQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794299274; x=1794904074; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0sftvb8ZoBPTsS3ogHwi+u9oXrX5v2r9EJRPkGherl4=;
        b=FCdsonxqXGCOd6AuNEjyiUMpM5qVxS2Rqidb1FSCIXjlHHdAUi9eqkk7wp04a+Ipud
         PBcRRo7pACoAeqSG+vIBQ9jroCw7npTYS+OpZO4BAjE6YN9a3MlctrgK/o8q1cZ4fxoi
         vCYW/CQgJvPzJMu5dRi65dlCKZgb76xewIuZjjZlbxuBN00+cHTNJg/bYqpft9SpvOc+
         4PIBJIkaYaWD0nv4bjuJkR40WFRLFhykA8vsUhhK2SayBheXU7esPGbaX6rLaTryyW9R
         ZXRB2NYIVLJ+ZZ7yQh9Xs1RITM9KX5TM2PR2glgitIwjji8FI0GF1UBhGIpn9mDeREQr
         yLBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794299274; x=1794904074;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0sftvb8ZoBPTsS3ogHwi+u9oXrX5v2r9EJRPkGherl4=;
        b=CGJ13t1mMjISzWNMoWxNurrwVeBy54zIT+l4tbM2qlGalSNCMxKQtpYgLo7q2Z5elN
         05M2hTGKE86l6+GnGtRcxHhWzMnvYQypy2wW/7PKiDJmLpL9t/kDi7vfexQybl+jwzO7
         KRDPblHxGb2KdkWkwRFCLwdIwe54QRpx6IA4imPFIiewxZU1UaMGXt6nLIah8Jn9Yw3y
         G9f52SuvuDd2IBb3mHpjSrsyTAg81xBpFqXjzhMlpKttLaAaQ6F7Aiw0JxHYzT+ZWkef
         xqKsqJvL49ky1f7+qyMPbYwAUW0xRct7CgON5+hJrjIby8wG8wuBbk9hWVGz7vYMMH/H
         5lMA==
X-Gm-Message-State: APuU4Z+WJABNvNZNUOL+7fH+MTyIyUfJ4iNP0wbEJbYCKKMw9u55TXIH
	r8a8qysI+1BBoGhaZXmTauqfIh7su5iNawaLMOh7//ajpRljn2b/NMrSujqr1Bqy2ZTX0k3gVcS
	EsTCGkxFD+Kyp86tJkbOIoeBexk7A87sBBQKpPM2rcA==
X-Gm-Gg: AYBFou1rE52F+ZeSpDOoTd8LU4zm9I+EhLCPEV0dwD9TvkGbtdwsX2ZAbQhNmCcahji
	AEXIn4S7yTShjE/vD8OkbwG327b74uyp8wOYePN4oKXBSjy4itclLNL3cxJ4VwkvnvPm5WCrZ7J
	2IkgBlzWDWFes8c5PsJJNEXI7DJ5Ehx1O3zqtOI7Tand/LJK3Qu4fXSd4sr5M7FZ4pC0F30wCQT
	GGJCFKBs61Jys9VCC8DhQYje1+x8ky6lIAEeC5o2olLfO6CBUuRSoPR/Uf24juJlq/jK24/RrUb
	Gaqn3Pigvoa6SPss1IET1om9IVQCXk37l1mX3ZE76x6HQ3/ImGFXul47Y8M+8pBZKrNshEJm1D7
	4VgwPGKLWjJKGZoBfaxVORnJEwnrAFZne0csmBO4DIHPdwYM+DddUu41uWHlpW+C03Q3tUw==
X-Received: by 2002:a17:907:d406:b0:c41:8e21:4d58 with SMTP id
 a640c23a62f3a-c50491b9478mr158348466b.5.1794299273958; Tue, 10 Nov 2026
 00:27:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106160621.347228-1-marco.crivellari@suse.com>
 <20261106160621.347228-3-marco.crivellari@suse.com> <au5M1hKb2QuNd5bl@pavilion.home>
In-Reply-To: <au5M1hKb2QuNd5bl@pavilion.home>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 10 Nov 2026 09:27:42 +0100
X-Gm-Features: AclHuK-oKnJCdx_a3FoDDwIp_HzToKkr4CHnNIBq4hKYv-QRD6buuafl0RY87jg
Message-ID: <CAAofZF711RE-SiuzBWyno+ADDoX73bLcc_mqLDAPkbE6a1b3HQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] sched/idle: Stop the tick on polling idle on
 nohz_full CPUs
To: Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org, "Paul E . McKenney" <paulmck@kernel.org>, 
	Ingo Molnar <mingo@kernel.org>, Michal Hocko <mhocko@suse.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 10:55=E2=80=AFPM Frederic Weisbecker <frederic@kerne=
l.org> wrote:
>
> Le Fri, Nov 06, 2026 at 05:06:14PM +0100, Marco Crivellari a =C3=A9crit :
> > With idle=3Dpoll, the tick fires while in user space, interrupting the =
task
> > running there. This is a problem when the CPU is nohz_full, as it
> > introduces noise into the workload.
> >
> > To fix this, stop the tick when entering polling idle on nohz_full CPUs=
,
> > while on other CPUs keep restarting it.
> >
> > Cc: Peter Zijlstra <peterz@infradead.org>
> > Cc: Juri Lelli <juri.lelli@redhat.com>
> > Cc: Vincent Guittot <vincent.guittot@linaro.org>
> > Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
> > Cc: Steven Rostedt <rostedt@goodmis.org>
> > Cc: Ben Segall <bsegall@google.com>
> > Cc: Mel Gorman <mgorman@suse.de>
> > Cc: Valentin Schneider <vschneid@redhat.com>
> > Cc: K Prateek Nayak <kprateek.nayak@amd.com>
> > Link: https://lore.kernel.org/all/aQiWfnnSzxsnwa2o@tpad/
> > Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> > ---
> >  include/linux/tick.h     |  2 ++
> >  kernel/sched/idle.c      |  5 ++++-
> >  kernel/time/tick-sched.c | 18 ++++++++++++++++++
> >  3 files changed, 24 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/tick.h b/include/linux/tick.h
> > index 8bfbb053f4fd..be4940f76777 100644
> > --- a/include/linux/tick.h
> > +++ b/include/linux/tick.h
> > @@ -129,6 +129,7 @@ extern bool tick_nohz_is_active(void);
> >  extern bool tick_nohz_tick_stopped(void);
> >  extern bool tick_nohz_tick_stopped_cpu(int cpu);
> >  extern void tick_nohz_idle_stop_tick(void);
> > +extern void tick_nohz_full_idle_stop_tick(void);
> >  extern void tick_nohz_idle_retain_tick(void);
> >  extern void tick_nohz_idle_restart_tick(void);
> >  extern void tick_nohz_idle_enter(void);
> > @@ -144,6 +145,7 @@ static inline bool tick_nohz_is_active(void) { retu=
rn false; }
> >  static inline int tick_nohz_tick_stopped(void) { return 0; }
> >  static inline int tick_nohz_tick_stopped_cpu(int cpu) { return 0; }
> >  static inline void tick_nohz_idle_stop_tick(void) { }
> > +static inline void tick_nohz_full_idle_stop_tick(void) { }
> >  static inline void tick_nohz_idle_retain_tick(void) { }
> >  static inline void tick_nohz_idle_restart_tick(void) { }
> >  static inline void tick_nohz_idle_enter(void) { }
> > diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
> > index e0c10a5dbda2..226d02d24c73 100644
> > --- a/kernel/sched/idle.c
> > +++ b/kernel/sched/idle.c
> > @@ -349,7 +349,10 @@ static void do_idle(void)
> >                * idle as we know that the IPI is going to arrive right =
away.
> >                */
> >               if (cpu_idle_force_poll || tick_check_broadcast_expired()=
) {
> > -                     tick_nohz_idle_restart_tick();
> > +                     if (cpu_idle_force_poll)
> > +                             tick_nohz_full_idle_stop_tick();
> > +                     else
> > +                             tick_nohz_idle_restart_tick();
> >                       cpu_idle_poll();
> >               } else {
> >                       cpuidle_idle_call(got_tick);
> > diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
> > index a9f622fdeb12..3625ad9d2268 100644
> > --- a/kernel/time/tick-sched.c
> > +++ b/kernel/time/tick-sched.c
> > @@ -1179,6 +1179,24 @@ static bool can_stop_idle_tick(int cpu, struct t=
ick_sched *ts)
> >       return true;
> >  }
> >
> > +/**
> > + * tick_nohz_full_idle_stop_tick - stop the tick on polling idle on NO=
HZ
> > + *
> > + * On nohz_full CPUs the tick restarted for polling idle would keep
> > + * running after idle exit and interrupt userspace once more; so stop =
it
> > + * instaed. On other CPUs, keep restarting it as before. Must be calle=
d
>
> *instead
>
> Also it should mention that we want to stop the tick before polling
> and not after because we don't want the tick stop induced latency after
> the task wake-up.
>
> > + * with interrupts disabled.
> > + */
> > +void tick_nohz_full_idle_stop_tick(void)
>
> I would rather call that tick_nohz_idle_poll_enter() because it is
> very specific and it's not just about stopping the nohz_full tick
> in idle, it's also restarting the tick if in dynticks-idle.

Sure, makes sense, I will change it.

Thanks,

--=20

Marco Crivellari

SUSE Labs
