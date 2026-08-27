Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D9043CE5E
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787825147; cv=none; b=STm2EitR471+IpW80qyjDoehUXjhyHbwY97KU4KTn7SG74/dqzadA9Yt1UFKelEEE63zDTzQDIzqVDAP1a5+DkmHF5ouAiCkjgyTp4MhF1G93N0d1i1eHeVTruo1vjWgY/GJ4KQxjzeGytKUh2LEUnloBZ7Oc421FIRxfKmzmcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787825147; c=relaxed/simple;
	bh=6gfmxpUfmKrrSJSDuGpRQrshbQrUGosUHDSPwWb56VE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RHiH2VJukakx3h4X9sNLySrSyfoKq2FwIrv3qnTEhSOCmsP0xqDXPcNu5shTjTVvHNRLNzn8t8LVJRGkW3WInGlfpK06mC7w9INFbd+Rgvr7R63UpfjCd4fSwqL3vt7XMcWt1tOnik/ih7uNo2LbJv4TD2WZPMEhDvRQ7lCeRco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MOx4vJAn; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nZVbHz0H; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MOx4vJAn";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nZVbHz0H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787825134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pW88VWxynzX4FH5YDB27jvLcss8TpBBYAW8EnWr/occ=;
	b=MOx4vJAnhfpkU81/mS0XGl4v1hR3NG3LNzmJwkkcqNJYBXjuJmes2TdDoJPNPiBYCXmtpl
	xhDNpl606EZcWsJR/GY+kCpZV8lCaaf8EXMWEmtGl5m94J38zxUE1G9t8D4y0qIOMTDoQj
	9l71auR4ugqNzpq2MsPE0T0gS0J8Zeo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-224-p13GuKBfMjS8LN8Dm3aZNA-1; Thu, 27 Aug 2026 06:05:32 -0400
X-MC-Unique: p13GuKBfMjS8LN8Dm3aZNA-1
X-Mimecast-MFC-AGG-ID: p13GuKBfMjS8LN8Dm3aZNA_1787825131
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c213d5fb55aso220436466b.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787825131; x=1788429931; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pW88VWxynzX4FH5YDB27jvLcss8TpBBYAW8EnWr/occ=;
        b=nZVbHz0HwkDRrK5y4YGLbtDP/6rRgG3huiNiwgaLbAoa4c5RBa9nm9fHbF887YTliv
         cAnUDH7loGi4S5+pllROyGfIjMou+36Ed87WRvPrs1XOw4j8J7JCEzfBVZnzwOMFGeuf
         yap/8a6kmRIxi+Bvg9LmQXxbRz6CfEjZtMq9RyDWw33nicAjvbRw9SwrB2sqjE54n+4+
         c3Q7AV8ft00b1YYW5Y/Yw1dCkZiYe3sSJ+1+kf868n/aZ3YmsEllMf6c5vkVcBebXXGj
         Zn3u/vWITp9CyPer1xxdsHpGvJjagsAGmb/y1mdZCaICD0cAJucw7YeirodlFr4CMdcU
         Xrzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787825131; x=1788429931;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pW88VWxynzX4FH5YDB27jvLcss8TpBBYAW8EnWr/occ=;
        b=a8oOPewpuxPU+FqI7z8VMSVT7jE4B58uHh52fBO6bs8SzMUsLAQXTvdLeCbVaRz99v
         EF1tBqH6+V6GSikl5iBfwKwe/ehj5fdiNJGEovEXZPL1nXiNZ8TqY8j0VN7mXLVq7HKk
         ldyjb8LBEgMOo/99WF5R96xjUTuHVuG3R9Vnjs6EFaLehRg3XZBjShqFjv2oXHSSLudc
         WnqTCR3jmxagTYUoSeNItwfpH6QfZU0IM1Z3rmp8vM/qodF9gTosbozzXn/oHvEmzcF5
         PHs0XHHTF/23AftZsbqAx8j982THHb6FzVe+GgHeoKzTF6dMhwJwaUCdvrE4jOTFlaE+
         QM6g==
X-Forwarded-Encrypted: i=1; AHgh+RrK9b7XaHh9LkXwEgLs+zVR7GzTaHcS/CFZSzA3Yw38qMRSkZ8ChmulKNSUikMnnJpOTrvobEYbAWhmDyI=@vger.kernel.org
X-Gm-Message-State: AFuF++m/Xskb9Aop91a3W4NGLnmpDjGHGzmWgXZsCAyTB5pvo7MyuMaP
	o3C7EnjIQZ/eejFiPm+xO4tjEkJGI2DsDsT6WorHUILsecGdS9f7Qc8Qm3iSuC47gU5pFJBgrqM
	bXE13EhRmapm2vwCvsN8EmWhU7oORzQfUjJ1sp9MivqxQ/bfuXF1EhtiKKB2zq5sc7Q==
X-Gm-Gg: AR+sD101cn6yEGcNPkl7G/RCbKIehI3Fw+i5o0d9G9XVGsJ2c3J8mE/dQrr1IPMLO3q
	nkmBfFqt5Bf9toYiDoFQcNTpD5cG3BwIWMYYzDfDiObUg9M7C1m20rmkq5nywjkjajzTIAzcSnT
	pD4E7vml2xkpBrD23/l+1Y10SB2jcVJK+ObTFkwe2D/iiTDApZIlz/tBGMw78IlS8BFeQx9arum
	GzrYdDcz7t4SJl648uLElrxKWzqdeylNLu0ILsx1wnnjoQFpjZeTWefXhZH3Q0sL4t1IA+4u1FS
	G4T/FSwN0Nqz+4FCDXYXamQMbUvDWtQ7BDm0g2wnFLhX/zLR+BZbyj2f73LEGFjLqx7g6tkF/oh
	BTxNK3KRBTrpn32M8jD4o2lqJZbw3fh+KmOSanlKHy0qaL98EiHkofesxhwu0oitYsbpdJQ==
X-Received: by 2002:a17:907:8997:b0:c24:6505:8f66 with SMTP id a640c23a62f3a-c250c595824mr1566839466b.13.1787825130840;
        Thu, 27 Aug 2026 03:05:30 -0700 (PDT)
X-Received: by 2002:a17:907:8997:b0:c24:6505:8f66 with SMTP id a640c23a62f3a-c250c595824mr1566829466b.13.1787825130067;
        Thu, 27 Aug 2026 03:05:30 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb (212-8-243-115.hosted-by-worldstream.net. [212.8.243.115])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9b43absm719115766b.51.2026.08.27.03.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 03:05:29 -0700 (PDT)
Message-ID: <4d96d3520f5f2079155f6fcc6f7075deef8aec20.camel@redhat.com>
Subject: Re: [PATCH v6 6/9] rv: Add tlob hybrid automaton monitor
From: Gabriele Monaco <gmonaco@redhat.com>
To: wen.yang@linux.dev
Cc: Nam Cao <namcao@linutronix.de>, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 27 Aug 2026 12:05:28 +0200
In-Reply-To: <d8eb57e037881da2187c84fb9c8499f3acf04fb3.1787243842.git.wen.yang@linux.dev>
References: <cover.1787243842.git.wen.yang@linux.dev>
	 <d8eb57e037881da2187c84fb9c8499f3acf04fb3.1787243842.git.wen.yang@linux.dev>
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
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Wen,

thanks for the series, I'm going with the first chunk, I still need to
review the unbind_reap logic here.

On Fri, 2026-08-21 at 00:45 +0800, wen.yang@linux.dev wrote:
> From: Wen Yang <wen.yang@linux.dev>
> +static inline void tlob_reset_notify(struct da_monitor *da_mon)
> +{
> +	struct ha_monitor *ha_mon =3D to_ha_monitor(da_mon);
> +	struct tlob_task_state *ws;
> +
> +	ha_monitor_reset_env(da_mon);
> +
> +	ws =3D ha_get_target(ha_mon);
> +	if (!ws)
> +		return;
> +
> +	/*
> +	 * stopping=3D=3D1 means tlob_stop_task() ended this window already.
> +	 * acquire pairs with the _release clear in ha_setup_invariants().
> +	 */
> +	if (atomic_read_acquire(&ws->stopping))
> +		return;

Maybe I'm getting confused by the "acquire" in here, but are you aiming
to "acquire" the stopping here by reading and then setting it later?
That's obviously not atomic so you could read 0 and a concurring handler
could set it to 1 before you do. Wouldn't it be better to cmpxchg?

> +
> +	/*
> +	 * Monitor disable (ha_mon_destroying set) is not a violation: the
> +	 * teardown paths free ws regardless.=C2=A0 Couples to an HA-layer flag
> +	 * with no public contract; a framework-level equivalent would be
> +	 * cleaner.
> +	 */
> +	if (unlikely(READ_ONCE(ha_mon_destroying)))
> +		return;

This should be the first check in this function, there's no need to do
anything else and you cannot trust the da_mon pointer.
Put it before ha_monitor_reset_env() (to_ha_monitor is pointer
arithmetic, it can stay where it is for better readability).

> +
> +	/* Genuine expiry: end the window so a later start takes the restart
> path. */
> +	atomic_set(&ws->stopping, 1);
> +
> +	/* Stamped regardless of the tracepoint; tlob_stop_task() reads it.
> */
> +	WRITE_ONCE(ws->budget_exceeded, true);
> +
> +	if (!trace_detail_env_tlob_enabled())
> +		return;
> +
> +	unsigned int curr_state =3D READ_ONCE(da_mon->curr_state);
> +	u64 accs[TLOB_ACC_MAX], partial_ns;
> +	unsigned long flags;
> +
> +	/* Snapshot accumulators; partial_ns covers curr_state time not yet
> folded in. */
> +	raw_spin_lock_irqsave(&ws->entry_lock, flags);
> +	partial_ns =3D ktime_get_ns() - ktime_to_ns(ws->last_ts);
> +	accs[TLOB_ACC_RUNNING]=C2=A0 =3D ws->accs_ns[TLOB_ACC_RUNNING]=C2=A0 +
> +				=C2=A0 (curr_state =3D=3D running_tlob=C2=A0 ? partial_ns :
> 0);
> +	accs[TLOB_ACC_WAITING]=C2=A0 =3D ws->accs_ns[TLOB_ACC_WAITING]=C2=A0 +
> +				=C2=A0 (curr_state =3D=3D waiting_tlob=C2=A0 ? partial_ns :
> 0);
> +	accs[TLOB_ACC_SLEEPING] =3D ws->accs_ns[TLOB_ACC_SLEEPING] +
> +				=C2=A0 (curr_state =3D=3D sleeping_tlob ? partial_ns :
> 0);
> +	raw_spin_unlock_irqrestore(&ws->entry_lock, flags);
> +
> +	trace_detail_env_tlob(da_get_id(da_mon), ws->threshold_ns,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 accs[TLOB_ACC_RUNNING],
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 accs[TLOB_ACC_WAITING],
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 accs[TLOB_ACC_SLEEPING]);
> +}
> +
> +#define BUDGET_NS(ha_mon) (ha_get_target(ha_mon)->threshold_ns)
> +
> +/* HA constraint functions (called by ha_monitor_handle_constraint) */
> +
> +static u64 ha_get_env(struct ha_monitor *ha_mon, enum envs_tlob env,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 time_ns)
> +{
> +	if (env =3D=3D clk_elapsed_tlob)
> +		return ha_get_clk_ns(ha_mon, env, time_ns);
> +	return ENV_INVALID_VALUE;
> +}
> +
> +/*
> + * Invariant: clk_elapsed < BUDGET_NS in running/waiting/sleeping.=C2=A0=
 "stopped"
> + * is exempt: the parked period must not be measured against the old win=
dow's
> + * clock anchor (restart from "stopped" would otherwise spuriously overr=
un).
> + */
> +static inline bool ha_verify_invariants(struct ha_monitor *ha_mon,
> +					enum states curr_state, enum events
> event,
> +					enum states next_state, u64 time_ns)
> +{
> +	if (curr_state =3D=3D stopped_tlob)
> +		return true;
> +	return ha_check_invariant_ns(ha_mon, clk_elapsed_tlob, time_ns,
> BUDGET_NS(ha_mon));
> +}
> +
> +/*
> + * The clock stays in guard (anchor) representation all window: env_stor=
e
> + * holds the window-start timestamp, re-anchored on start/restart.
> + * ha_invariant_passed_ns() never stores the deadline representation (th=
e
> + * framework dropped ha_set_invariant_ns(), commit ab2900ae252b), so cal=
ling
> + * ha_inv_to_guard() here would subtract BUDGET_NS from the anchor and s=
kew
> + * every check by one budget.=C2=A0 nomiss likewise never converts.
> + */
> +
> +/* No per-event guard conditions for tlob; invariants suffice. */
> +static inline bool ha_verify_guards(struct ha_monitor *ha_mon,
> +				=C2=A0=C2=A0=C2=A0 enum states curr_state, enum events
> event,
> +				=C2=A0=C2=A0=C2=A0 enum states next_state, u64 time_ns)
> +{

Mmh, I just realised you don't use the guards for resets, is the order
of actions a problem for this monitor?

> +	return true;
> +}
> +
> +/*
> + * Guard on stopping: a sched_switch after ha_cancel_timer_sync() would
> + * re-arm the timer (ODEBUG splat).=C2=A0 _acquire pairs with cmpxchg_re=
lease in
> + * tlob_stop_task.
> + *
> + * Entering stopped_tlob also resets env_store to the invalid sentinel, =
so a
> + * restart re-anchors the clock; a stale anchor would wrap the restart's
> + * timer delay to ~U64_MAX.
> + */
> +static inline void ha_setup_invariants(struct ha_monitor *ha_mon,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum states curr_state, enum ev=
ents
> event,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum states next_state, u64 tim=
e_ns)
> +{
> +	if (next_state =3D=3D stopped_tlob) {
> +		/*
> +		 * Window ending: reset env_store to the invalid sentinel so
> +		 * the next window gets a fresh clock anchor.=C2=A0 Keep
> stopping=3D=3D1
> +		 * so __tlob_acc() continues to block sched events while
> parked.
> +		 */
> +		ha_monitor_reset_all_stored(ha_mon);

Is this really necessary since you have a reset() in the start edge?
Isn't that anyway equivalent to reset() on the stop edge too?

> +		return;
> +	}
> +
> +	if (atomic_read_acquire(&ha_get_target(ha_mon)->stopping)) {

Same as above, do you mean to cmpxchg?

> +		/*
> +		 * Restart (stopped -> running): arm the timer, then clear
> +		 * stopping so __tlob_acc() admits sched events only once the
> +		 * state is already running_tlob.=C2=A0 _release pairs with the
> +		 * acquires in __tlob_acc/tlob_reset_notify.
> +		 */
> +		if (next_state < state_max_tlob)
> +			ha_start_timer_ns(ha_mon, clk_elapsed_tlob,
> BUDGET_NS(ha_mon), time_ns);
> +		atomic_set_release(&ha_get_target(ha_mon)->stopping, 0);
> +		return;
> +	}
...
> +
> +/*
> + * Accumulate elapsed ns into accs_ns[idx] since last_ts and advance it.
> + * Returns true if monitored with an active window.=C2=A0 The stopping g=
ate is
> + * what keeps scheduler events from reaching a parked task (no "stopped"
> + * self-loops, see tlob.h) and keeps accs_ns[] from growing while parked=
.
> + */
> +static inline bool __tlob_acc(struct task_struct *task, ktime_t now,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum tlob_acc_idx idx)
> +{
> +	struct tlob_task_state *ws;
> +	unsigned long flags;
> +
> +	guard(rcu)();
> +	ws =3D da_get_target_by_id(task->pid);
> +	/* acquire pairs with the _release clear in ha_setup_invariants(). */
> +	if (!ws || atomic_read_acquire(&ws->stopping))
> +		return false;

Mmh, returning false on !ws is kind of a shortcut to avoid another
hashtable lookup that would return nothing, but skipping events on
stopping is actually changing how the model behaves.

It is usually clearer to allow all events in a stopped state as
self-loops (the /task/ can go through those events also when stopped).
I usually prefer to keep logic in the model rather than in the source
file.

It wouldn't be too wrong to say that the task can do anything but the
tlob instance is stopped and other events cannot occur there, like
you're doing, but that should be well documented.
You're vaguely mentioning this in some changelog, if you want to keep it
this way, please explain it in the documentation file.
Word it like a description of the model rather than how you implement
it, something like (adapt it accordingly): "although tasks can enter the
scheduler when tlob is in the stopped state, those events are explicitly
ignored by the tlob instance, hence there is no self-loop in the stopped
state".

Thanks,
Gabriele

