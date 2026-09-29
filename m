Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE1B366051
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671865; cv=none; b=GQ8blwWWRytLgnEwrOuFXRmbmAilX9j8Rqa+6Lty5NwMzjf6kJTwZFqeojFXJK8G8ymZN7H5OgLN09VdoRmYYRiBCqVNqJ3Se0RvVBaVAvFrXyZD6W5UAsgOQkTQmD5xUXV+KLc6Vvgiu5PKE2xPDsLKTSxoygrOlGEzv1yMWPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671865; c=relaxed/simple;
	bh=R9TB+yxH0YATWv0v404fhcs5f/yaSeMTjK6kN+11mvQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wckk7lz/grJLWbKEZNCEcRMthekevbcwjCJGXTHULyqF5Kd4e3FUJMvZuWwenlN3/NDxjbmL0Voggmvt6YeQJLcNcJ6bbClvyAtYtaMXMPv+03s1za8UjrSL8wvYszBcjI6Zv3Bos4dK9Elt/b1r0o1BtghBsXImlNt5htdE02g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I8NDx77T; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=eFpQ2Eu6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I8NDx77T";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="eFpQ2Eu6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790671854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=VPzqKAPThPb+G5G+ENOoaKwbMC8bd2AramGn5Rlqvbg=;
	b=I8NDx77TJM09MJAIdVquKlXM2Yiafi066YDreQggxrCqpijfH6cw9aDrCGDrIoYS3oPy63
	eLVwucHmHE1FrsLu9rac0q/lHofgNMxswCRIrSJ+A5VGIgoCU3QT0Hk8V3mkByB5DKdJ8h
	5jls7ZqW/PqqgeZIijahLBTKMxC7M3s=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-413-aFpnMv69O-umg8OZ6p4dUQ-1; Tue, 29 Sep 2026 04:50:52 -0400
X-MC-Unique: aFpnMv69O-umg8OZ6p4dUQ-1
X-Mimecast-MFC-AGG-ID: aFpnMv69O-umg8OZ6p4dUQ_1790671851
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-487041c4c82so1237223f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790671851; x=1791276651; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VPzqKAPThPb+G5G+ENOoaKwbMC8bd2AramGn5Rlqvbg=;
        b=eFpQ2Eu6g5OjWqp2ZtUEmhf3PsLk2vF3VIiBa0THoY3rcha072TE0GS8hC6hw9Nu80
         j7L7ySQqM8CiToGg5m4/gR7AmIgbLtq9sIcUXXsA0UHTzy/w57wbH8dd4TaJwZQlibOM
         Njk7bBdAFOMJMET/x2hOZcxAlol7c5baW88pAVUXpJAa9suJ5HVidKv3ZbIN7MqstTYG
         6j/v5ajkdEX9ZEf6ilMAk3NYw8n6mwflg2C+ZhyVbE0/tnJaI5nyF12lrcDO2wR93cZV
         WYGwWGHVF3u532johkxMek7crym8WiaWOxBO0LwP8F8/Or1e9g/agCPk1BPoeXIfcKMB
         PsMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790671851; x=1791276651;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VPzqKAPThPb+G5G+ENOoaKwbMC8bd2AramGn5Rlqvbg=;
        b=IdcWXVs+fWSHnNUDul22OVOPyWn5w1nBPKBn+0hD9InJemsbHN5Qqm4GG5wXYGcdmZ
         i3UUy8Gu8ogA4IbKkoKxHW8uG/T9MBegKNofffMjdJ7Yh+ZLqYeNU1cOyQb9RSh+VpcC
         YK8un29xGeJhKBzY/qql/6Q63lijKp/IAOSgjYSYJ6pfThONPkIGW5YgSAoBTM91l5TC
         bXYdWODo7DR2zeQ55hIOPQms02HLptJZoTsLZ66Lx8e5FghpMyQIsbjMudrE5jE5+KXF
         LpebWZN3ubb3jJ5z6moS9NJXjZ+dxlov2Efm9Tp84+quqxUEE1I2uVRd2BfCyDhQnw1I
         ub2Q==
X-Forwarded-Encrypted: i=1; AKwUvBweECU2fKjEW0eHPDJq4TayP+sIXqDjagxTYON+WtBXdCrpvGaSwKXyQG+2ldIBouYzWDlKXUT6g3Gx7pk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbPKAn7RO88PVsdulukVShtn+B0prfyjAObBqfNzfdp2bHC/Ar
	76DVlnYfmFpfusiuyGciuxt1L7sgFA7gN8XDtn9noNgydurgx3CAgfOxPknnnz9NOM5sEgTPzF2
	Ohi+VrYVgGTezZzt0/YiUpDI4bRN5jRANHOiy25nPi2g8c58RCG0X+FL9f5sJLIzsJw==
X-Gm-Gg: AYBFou0ELTQFTkhAvbhrkuZPDZhPCInI5jGZCEyivhiwh0qqhAYZ8ThR4/hTRHvWDYR
	PX5/QAmVnsNbciNLworg+zHlIDHWy1Bo+fruCRJoD8AOkcCAfGtA255/gs1LclPxEq75CGqcBT/
	X4CRd7Fo34cKOkW1EAEuIVBgj1bCq/N0f/kxNLN2Zyd0dP34iSgWJjr9s5l13/psjI52pkUmv0R
	fGhzpAB8+f+zk8puKBBiYiZdGLi7zqAu4DkW72aSNe9zjjQdjdqAkbXKKMrybjVE9XlgiE4vKs0
	sH2br6jw9tw7CD1JrcKTz0z9WQRAV42zTHsd1yHM4i15TAFIkF9V6A3pblx7LRyobsrT1kUHwYH
	BpuMq79sEPS361RjXA/rB4SMloQY=
X-Received: by 2002:a05:6000:4703:b0:487:242a:c020 with SMTP id ffacd0b85a97d-48872a5cdb4mr27712597f8f.6.1790671851164;
        Tue, 29 Sep 2026 01:50:51 -0700 (PDT)
X-Received: by 2002:a05:6000:4703:b0:487:242a:c020 with SMTP id ffacd0b85a97d-48872a5cdb4mr27712554f8f.6.1790671850710;
        Tue, 29 Sep 2026 01:50:50 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.168.96.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af50a0fb7sm2113590f8f.33.2026.09.29.01.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:50:50 -0700 (PDT)
Message-ID: <96b3b5d5ec0eae499f1a98845720776b6fab84d4.camel@redhat.com>
Subject: Re: [PATCH v3] sched: set TIF_NEED_RESCHED before calling
 __trace_set_need_resched()
From: Gabriele Monaco <gmonaco@redhat.com>
To: Andrea Righi <arighi@nvidia.com>, Sechang Lim <rhkrqnwk98@gmail.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Dietmar Eggemann	 <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall	 <bsegall@google.com>, Mel
 Gorman <mgorman@suse.de>, Valentin Schneider	 <vschneid@redhat.com>, K
 Prateek Nayak <kprateek.nayak@amd.com>, 	linux-kernel@vger.kernel.org
Date: Tue, 29 Sep 2026 10:50:48 +0200
In-Reply-To: <arqhnt6lW8qiCo19@gpd4>
References: <20260630084750.2792851-1-rhkrqnwk98@gmail.com>
	 <arqhnt6lW8qiCo19@gpd4>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Andrea,

On Mon, 2026-09-28 at 19:19 +0200, Andrea Righi wrote:
> This leaves the race Prateek described in the v2 discussion: a remote CPU=
 sets
> TIF_NEED_RESCHED under rq->lock, but the target CPU can emit sched_entry_=
tp()
> before acquiring that lock, ahead of the need-resched tracepoint.
>=20
> I reproduced it with this applied to tip/master. With the RV nrp monitor
> enabled, 300 runs of "perf bench sched messaging -g 20 -l 100" produced:
>=20
> =C2=A0 rv: monitor nrp does not allow event schedule_entry_preempt on sta=
te
> any_thread_running
>=20
> Applying the following on top fixed the ordering, the same 300-run test t=
hen
> completed without an RV violation. If it makes sense, could you fold this
> change into v4?
>=20
> Thanks,
> -Andrea

thanks for looking into this. Is this change required for anything else bes=
ides
fixing the nrp monitor after changing the order with need_resched?

I believe this would break the sts monitor which expects sched_entry before
disabling interrupts.

Both monitors could be adapted to either case, but if your change is just f=
or
the sake of nrp, I think it's easier to just allow this race, since nrp is
already allowing the race with interrupts.
I haven't tested yet, but something like allowing a sched_entry_preempt wit=
hout
need_resched set but provided it's going to be set before sched_exit would
probably do (it'd allow also independent need_resched there, but those will=
 then
need their own preemption too).

I'd say if you don't need to move sched_entry for other reasons we can wait=
 to
apply this change until I see what's better for the models.

Thanks,
Gabriele

>=20
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 639b5df7cf130..91a15a4234280 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -7143,9 +7143,6 @@ static void __sched notrace __schedule(int sched_mo=
de)
> =C2=A0	struct rq *rq;
> =C2=A0	int cpu;
> =C2=A0
> -	/* Trace preemptions consistently with task switches */
> -	trace_sched_entry_tp(sched_mode =3D=3D SM_PREEMPT);
> -
> =C2=A0	cpu =3D smp_processor_id();
> =C2=A0	rq =3D cpu_rq(cpu);
> =C2=A0	prev =3D rq->curr;
> @@ -7178,6 +7175,9 @@ static void __sched notrace __schedule(int sched_mo=
de)
> =C2=A0	rq_lock(rq, &rf);
> =C2=A0	smp_mb__after_spinlock();
> =C2=A0
> +	/* Trace preemptions consistently with task switches */
> +	trace_sched_entry_tp(sched_mode =3D=3D SM_PREEMPT);
> +
> =C2=A0	hrtick_schedule_enter(rq);
> =C2=A0
> =C2=A0	/* Promote REQ to ACT */
>=20
>=20
> >=20
> > Fixes: adcc3bfa8806 ("sched: Adapt sched tracepoints for RV task model"=
)
> > Signed-off-by: Sechang Lim <rhkrqnwk98@gmail.com>
> > ---
> > v3:
> > =C2=A0- reorder need_ipi variable. (K Prateek Nayak)
> >=20
> > v2:
> > =C2=A0- https://lore.kernel.org/all/20260627081657.499781-1-rhkrqnwk98@=
gmail.com/
> >=20
> > v1:
> > =C2=A0- https://lore.kernel.org/all/20260625065656.392182-1-rhkrqnwk98@=
gmail.com/
> >=20
> > =C2=A0include/linux/sched.h | 5 ++---
> > =C2=A0kernel/sched/core.c=C2=A0=C2=A0 | 7 +++++--
> > =C2=A02 files changed, 7 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/include/linux/sched.h b/include/linux/sched.h
> > index ee06cba5c6f5..c9efd08dae92 100644
> > --- a/include/linux/sched.h
> > +++ b/include/linux/sched.h
> > @@ -2071,10 +2071,9 @@ static inline int test_tsk_thread_flag(struct
> > task_struct *tsk, int flag)
> > =C2=A0
> > =C2=A0static inline void set_tsk_need_resched(struct task_struct *tsk)
> > =C2=A0{
> > -	if (tracepoint_enabled(sched_set_need_resched_tp) &&
> > -	=C2=A0=C2=A0=C2=A0 !test_tsk_thread_flag(tsk, TIF_NEED_RESCHED))
> > +	if (!test_and_set_tsk_thread_flag(tsk, TIF_NEED_RESCHED) &&
> > +	=C2=A0=C2=A0=C2=A0 tracepoint_enabled(sched_set_need_resched_tp))
> > =C2=A0		__trace_set_need_resched(tsk, TIF_NEED_RESCHED);
> > -	set_tsk_thread_flag(tsk,TIF_NEED_RESCHED);
> > =C2=A0}
> > =C2=A0
> > =C2=A0static inline void clear_tsk_need_resched(struct task_struct *tsk=
)
> > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > index b8871449d3c6..19de28f0d85a 100644
> > --- a/kernel/sched/core.c
> > +++ b/kernel/sched/core.c
> > @@ -1171,6 +1171,7 @@ static void __resched_curr(struct rq *rq, int tif=
)
> > =C2=A0{
> > =C2=A0	struct task_struct *curr =3D rq->curr;
> > =C2=A0	struct thread_info *cti =3D task_thread_info(curr);
> > +	bool need_ipi;
> > =C2=A0	int cpu;
> > =C2=A0
> > =C2=A0	lockdep_assert_rq_held(rq);
> > @@ -1187,15 +1188,17 @@ static void __resched_curr(struct rq *rq, int t=
if)
> > =C2=A0
> > =C2=A0	cpu =3D cpu_of(rq);
> > =C2=A0
> > -	trace_sched_set_need_resched_tp(curr, cpu, tif);
> > =C2=A0	if (cpu =3D=3D smp_processor_id()) {
> > =C2=A0		set_ti_thread_flag(cti, tif);
> > =C2=A0		if (tif =3D=3D TIF_NEED_RESCHED)
> > =C2=A0			set_preempt_need_resched();
> > +		trace_sched_set_need_resched_tp(curr, cpu, tif);
> > =C2=A0		return;
> > =C2=A0	}
> > =C2=A0
> > -	if (set_nr_and_not_polling(cti, tif)) {
> > +	need_ipi =3D set_nr_and_not_polling(cti, tif);
> > +	trace_sched_set_need_resched_tp(curr, cpu, tif);
> > +	if (need_ipi) {
> > =C2=A0		if (tif =3D=3D TIF_NEED_RESCHED)
> > =C2=A0			smp_send_reschedule(cpu);
> > =C2=A0	} else {
> > --=20
> > 2.43.0
> >=20

