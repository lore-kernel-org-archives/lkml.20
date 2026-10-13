Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C5C4E66B8
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791891864; cv=none; b=Tugn5A30qYOGzXM/UQcrVRpvEBZ3/18KMTYo4dKAl2goDYehKDVZ8xGLqx00dHdadbxUQNhatLE+Vp0w/TVFQiXSAHL05onvG2so9z6ATxAdjDaLsP/Up+saLIobM/zyNGNykfr8jmGQpEbk0VfnTnmhHch3bPrWiXFakY3+8Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791891864; c=relaxed/simple;
	bh=w1GM1ccsbCNU7bl1E/eCIGy4tB7TjRvFHKKR6yECb0g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s51neApDllZeb+1GgilCBq5K/a0x8BWqH3heAaAUXeDCwTP2ed4pAygaD44vt7jeEkqonavZxsU/w/nNik1fAiHGSS7GqncNiDMbSgGhrnvDDe/dVW3r+PgppHi8s5YKIPzvFyx6Al4ayoZhicRyj1BAqTlW3wbuwe8SNUL/UvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M+gqIbtk; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=HstPepZ+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M+gqIbtk";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="HstPepZ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791891862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ezc60w2EW0Z8miij++dLscNvA7WLeG86FqgXSEBcGis=;
	b=M+gqIbtkEVfQLZ/c+yA8frU+4rTgl42dMEZnfCWueAJQsz6LKvqTBODCFvjd0zNHjj7sIW
	x4rPmDO+LwcrNeemztIzbyPAhxaD4P/nH8nv+u4fHs7QXagDLbFafkf3U3xGuZzLA3aoR2
	XgdYz0MzmSKwDYGNGFKTDMJ/ka+SF/E=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-157-UI6fuMVnMiOWCu6UQVqh9g-1; Tue, 13 Oct 2026 11:43:32 +0000
X-MC-Unique: UI6fuMVnMiOWCu6UQVqh9g-1
X-Mimecast-MFC-AGG-ID: UI6fuMVnMiOWCu6UQVqh9g_1791891811
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a022fee32fso22076835e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791891811; x=1792496611; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ezc60w2EW0Z8miij++dLscNvA7WLeG86FqgXSEBcGis=;
        b=HstPepZ+0kj5hw4nnEWqL+ohL1agB8HczsFrWHTyCv+531QUSmpVtoAaEVFnq3M+L/
         TgCBFzyGYz2cU8WAkaXno+Ki0LMoSg9rXdqV7rgRew84SGH4Dx1mDhYlFhr9M0cb91NQ
         fsmiwqZJrxleb4t6lVNyjRkWXqKNpTvku9MxbAJmfZuv3f18IpCmat/LX1v903CthKAv
         TVJM7R17Jpsv1i4E1wrOOgELia4zdtRSVXSUx2/JHPQSN7HX8BlIx0tc3fxeEFbvjWAp
         ooU32/Lx8epvZ2feIfiHM3FVs6eO4kDE6RdO9v2pLjxmcImkORsezCAWkvk+CNIvSn0j
         K5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791891811; x=1792496611;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ezc60w2EW0Z8miij++dLscNvA7WLeG86FqgXSEBcGis=;
        b=BM8lzp59IA/x90OKob919r/zQnMpTTe/4whJ8fQRFPCgC2oF5q63Oso5BbyqNA833h
         B+bc8d6VxpccabiyoChNh5hST2HToDYGzhvUW/F913d3iFT2Q5PUgQn0TTG76dzTkbeZ
         yhZeBqEEBfFbn3xDjLrUxz5YrssTO3XC2igFse4PoCMhDDxSNir652lqzDFZWKTUwOvw
         1Em9TCpRpCu7fL9fuuYFlIlIzYX1+By3yWn588bubzsU7MzX52zTEcqF+hlEiegWT8qm
         8YgqSDRX/N+2rGZurUHLQAaQatKC5H68GgATIaQKrjg1K/06FkYCFEKbNcaRjKMwLzft
         zYVQ==
X-Forwarded-Encrypted: i=1; AKwUvByYeemVOfzm2muOHTEU7bxL7fBs4y7ztG+T+5fx3kfzMYmLkKBGFFWyN/2GA3uzL5nbcOh9AQ8Rmx2gwDY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgP7II7rCD1Qq1pc0Sz4dURspmi5FEIDrzQObDA+iJHXvlVjB7
	2PcRxEO0AFizqHoV/nErp2iQAKawxbdcvtv0QpzcQL9pjX+q2osfD7fSkigM3GFVeZf46Gq6et7
	3xXPccGrRYb3/7teHp1yWpQ8kPUadydX9MEsByoN7Kf2/a8rRXdgVNdmwVI93kXtTEg==
X-Gm-Gg: AYBFou3GyK8UwU6GW1q1N6zKGFn1RQQBlgQJWaG7Oc6iVRGhiwq7PFhFBTPVuU6YYNi
	8kBJ3x7ffPh1+iM3iw/U7lpVti/UTwnhDvBnGY0zD3DcrclAT//JvbaCuC9v/tH8rYM9WNh95t4
	1IoLbxCz2TAGNE5RXr7taOYWzRPHrGYhEsa8O1czGoJMShWwh28Gljk3bRpJQFwa30QLSeh7nQS
	QfV8PcYJKp+mpxms9Zgia/YLnCkTvtsV1A8ygkrGVge8YllLijyon5beEdsZMQhM3LehNE9WVjg
	dB6NCuSJU3XHipnT7f1UZtlBrBiuq5o2COvu1JjNA69EAUP8vHyL5VAYIla1fcIxsggVYNxoQc2
	/SN0SdP8q0Hi8sdYeQu8IeSlTT8c6
X-Received: by 2002:a05:600c:83c6:b0:4a1:7093:40c7 with SMTP id 5b1f17b1804b1-4a18e493048mr222322695e9.8.1791891810961;
        Tue, 13 Oct 2026 04:43:30 -0700 (PDT)
X-Received: by 2002:a05:600c:83c6:b0:4a1:7093:40c7 with SMTP id 5b1f17b1804b1-4a18e493048mr222322215e9.8.1791891810454;
        Tue, 13 Oct 2026 04:43:30 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.135.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be8c5e7sm449268585e9.4.2026.10.13.04.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:43:29 -0700 (PDT)
Message-ID: <0eab40ebeb128ca308762f0bf33d2f7084ef32f9.camel@redhat.com>
Subject: Re: [PATCH v2 2/3] rv: add per-monitor edge-stat facility and stats
 file
From: Gabriele Monaco <gmonaco@redhat.com>
To: Tobias Schaffner <tobias.schaffner@siemens.com>, Steven Rostedt
	 <rostedt@goodmis.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>,  Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 rpm@xenomai.org, 	jan.kiszka@siemens.com
Date: Tue, 13 Oct 2026 13:43:28 +0200
In-Reply-To: <20260911123439.463052-3-tobias.schaffner@siemens.com>
References: <20260911123439.463052-1-tobias.schaffner@siemens.com>
	 <20260911123439.463052-3-tobias.schaffner@siemens.com>
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

On Fri, 2026-09-11 at 14:34 +0200, Tobias Schaffner wrote:
> Add CONFIG_RV_EDGE_STAT, an optional feature that records how long a
> monitor's automaton dwells in a state and exposes it per edge through a
> per-monitor "stats" tracefs file.
>=20
> The facility uses a static per-CPU matrix and reports, per edge and per
> CPU, the count, summed dwell time and maximum dwell time. Only the owning
> CPU writes the counters, so a reader snapshots them with local64_read()
> with no IPI and no locking on the accounting path.
>=20
> Signed-off-by: Tobias Schaffner <tobias.schaffner@siemens.com>
> ---
...

> +
> +/*
> + * Static storage avoids allocation lifetime races. Only the owning CPU
> writes,
> + * so readers can snapshot counters with local64_read().
> + */
> +#define RV_THIS_NR_EDGES	(STATE_MAX * EVENT_MAX)
> +
> +struct rv_this_edges {
> +	struct rv_edge_stat	edge[RV_THIS_NR_EDGES];
> +};

Does this really need to be a new struct? Cannot you just define it as:

DEFINE_PER_CPU(struct rv_edge_stat[RV_THIS_NR_EDGES], DA_MON_EDGES);

Then use it as:

per_cpu_ptr(DA_MON_EDGES, cpu), sizeof(DA_MON_EDGES)

struct rv_edge_stat *edges =3D per_cpu_ptr(DA_MON_EDGES, cpu);
&edges[e].count

> +
> +static DEFINE_PER_CPU(struct rv_this_edges, DA_MON_EDGES);
> +static struct dentry *rv_this_stats_file;
> +
> +/* Called before tracepoints are registered, so memset cannot race an up=
date.
> */
> +static void rv_edge_stats_reset(void)
> +{
> +	int cpu;
> +
> +	for_each_possible_cpu(cpu)
> +		memset(per_cpu_ptr(&DA_MON_EDGES, cpu), 0,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(struct rv_this_edges));
> +}
> +
> +static int rv_edge_stats_show(struct seq_file *seq, void *v)
> +{
> +	unsigned int e;
> +	int cpu;
> +
> +	seq_puts(seq, "# cpu edge label count sum_ns max_ns\n");
> +	/* Include offline CPUs and keep output stable across CPU hotplug. */
> +	for_each_possible_cpu(cpu) {
> +		struct rv_this_edges *m =3D per_cpu_ptr(&DA_MON_EDGES, cpu);
> +
> +		for (e =3D 0; e < RV_THIS_NR_EDGES; e++)
> +			seq_printf(seq, "%d %u %s:%s %llu %llu %llu\n",
> +				=C2=A0=C2=A0 cpu, e,
> +				=C2=A0=C2=A0 model_get_state_name(e / EVENT_MAX),
> +				=C2=A0=C2=A0 model_get_event_name(e % EVENT_MAX),

Perhaps you could have macros like DA_EDGE(s, e) or DA_EDGE_TO_EVENT(e)
DA_EDGE_TO_STATE(s) to make the matrix selection a bit more readable,
but that's a matter of taste.

> +				=C2=A0=C2=A0 (u64)local64_read(&m->edge[e].count),
> +				=C2=A0=C2=A0 (u64)local64_read(&m->edge[e].sum_ns),
> +				=C2=A0=C2=A0 (u64)local64_read(&m->edge[e].max_ns));
> +	}

I would like to see a way to tell if an edge is invalid or not, we
expect zero on invalid edges.
Perhaps that can be a new column so you also show the count in case they
are not 0.

You can just use model_get_next_state() =3D=3D INVALID_STATE

> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(rv_edge_stats);
> +
> +static int rv_edge_stats_create(struct dentry *parent)
> +{
> +	rv_edge_stats_reset();
> +	/* RV_MODE_READ is private to kernel/trace/rv/. */

I suggested you to use the rv helpers for this, you can obviously also
use RV_MODE_READ. Now monitors are in kernel/trace/rv/, so it won't be
an issue.

If we add support for modular monitors, moving the definitions to
linux/rv.h is the easiest thing to do anyway (you can do it too if you
really want and/or your agents complain, in a separate commit).

> +	rv_this_stats_file =3D tracefs_create_file("stats", 0440, parent,
> +						 NULL, &rv_edge_stats_fops);
> +	return rv_this_stats_file ? 0 : -ENOMEM;
> +}
> +
> +static void rv_edge_stats_remove(void)
> +{
> +	tracefs_remove(rv_this_stats_file);
> +	rv_this_stats_file =3D NULL;
> +}
> +
> +/* A zero timestamp marks resets, which can run on a different CPU. */
> +#define da_state_entered(s)	da_state_pack((s), local_clock() &
> RV_TS_MASK)
> +
> +static __always_inline void
> +rv_edge_account(da_state_t old, da_state_t new, enum states curr, enum e=
vents
> ev)
> +{
> +	struct rv_this_edges *m;
> +	u64 prev =3D da_ts_of(old);
> +
> +	if (!prev)
> +		return;

This happens only the first time after reset, isn't it unlikely()?

> +
> +	m =3D this_cpu_ptr(&DA_MON_EDGES);
> +	rv_edge_stat_account(&m->edge[curr * EVENT_MAX + ev],
> +			=C2=A0=C2=A0=C2=A0=C2=A0 (da_ts_of(new) - prev) & RV_TS_MASK);

If you decide to go for the macro, this would be DA_EDGE(s, e) or whatever
looks clear to you.

> +}
> +
> +#else /* per-cpu accounting off for this monitor type */
> +
> +#define da_state_entered(s)	((da_state_t)(s))
> +
> +static __always_inline void
> +rv_edge_account(da_state_t old, da_state_t new, enum states curr, enum e=
vents
> ev) { }
> +
> +#endif /* RV_MON_TYPE =3D=3D RV_MON_PER_CPU */
> +
> +static __always_inline bool
> +da_state_try_commit(da_state_t *word, da_state_t *old, enum states next,
> +		=C2=A0=C2=A0=C2=A0 enum events event)
> +{
> +	da_state_t prev =3D *old;
> +	da_state_t new =3D da_state_entered(next);
> +
> +	if (!try_cmpxchg(word, old, new))
> +		return false;
> +
> +	rv_edge_account(prev, new, da_state_of(prev), event);
> +	return true;
> +}
> +
> +#else /* !CONFIG_RV_EDGE_STAT */
> +
> +/*
> + * Feature off: only the hooks the DA/HA layer calls are provided, as tr=
ivial
> + * pass-throughs. da_state_t is a plain state word with no packed timest=
amp.
> + */
> +#define da_state_of(w)		((unsigned int)(w))

Is this cast necessary? We assign it to an enum, the sign isn't really
important. I guess it's the same for the other implementation of
da_state_of() (which is now in another patch).

Thanks,
Gabriele


> +#define da_state_entered(s)	(s)
> +
> +static __always_inline bool
> +da_state_try_commit(da_state_t *word, da_state_t *old, enum states next,
> +		=C2=A0=C2=A0=C2=A0 enum events event)
> +{
> +	return try_cmpxchg(word, old, next);
> +}
> +
> +#if RV_MON_TYPE =3D=3D RV_MON_PER_CPU
> +static inline int rv_edge_stats_create(struct dentry *parent) { return 0=
; }
> +static inline void rv_edge_stats_remove(void) { }
> +#endif
> +
> =C2=A0#endif /* CONFIG_RV_EDGE_STAT */
> =C2=A0
> =C2=A0#endif /* _RV_EDGE_STAT_H */
> diff --git a/kernel/trace/rv/Kconfig b/kernel/trace/rv/Kconfig
> index 3884b14df375..3045037fb36a 100644
> --- a/kernel/trace/rv/Kconfig
> +++ b/kernel/trace/rv/Kconfig
> @@ -59,6 +59,18 @@ config RV_PER_TASK_MONITORS
> =C2=A0	=C2=A0 This option configures the maximum number of per-task RV mo=
nitors
> that can run
> =C2=A0	=C2=A0 simultaneously.
> =C2=A0
> +config RV_EDGE_STAT
> +	bool "Per-edge dwell-time statistics"
> +	depends on RV && 64BIT && DA_MON_EVENTS_IMPLICIT
> +	help
> +	=C2=A0 Record per-edge dwell-time statistics for per-cpu deterministic =
and
> +	=C2=A0 hybrid automaton monitors and expose them through a per-monitor
> +	=C2=A0 "stats" tracefs file. This times each monitored automaton
> transition
> +	=C2=A0 with local_clock(), so leave it off if you do not need the
> +	=C2=A0 statistics.
> +
> +	=C2=A0 If unsure, say N.
> +
> =C2=A0source "kernel/trace/rv/monitors/wip/Kconfig"
> =C2=A0source "kernel/trace/rv/monitors/wwnr/Kconfig"
>=20

