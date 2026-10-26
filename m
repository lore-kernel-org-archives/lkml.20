Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006515;
	b=T3FoaPHxmnIxWEXt7X7nUiRIM7LjW4WyPEJ+kFOp2lTsPQfZPyCTjb/V0fIGFA4vGUP5
	 CGSpN5QUsPn4006JUHeTEKLm6lNjEZGcyFUmegPb0eqvin714sntOzQMfpjg8VJ+yLzu1
	 6PVQoYnU8kpoVGDhE5DSNW9dxhO6xxOEqO9cU3L8dBDiG2e9z7I6SAt4Q5K7ce5ag808n
	 uI3TlWeRK1TYWQITdKzk080zSiwjhxD9loxE6CZWIeYaZeA5Zt5KuQAuG3z6pyJPrxdc7
	 2IImqyIHDdxwghMBzkXQeKrYEus7qh4d+sckaaHBCJOw1J5zkHvg6kbOGTHOGvjoF4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006515;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=g5iKcSbReiRguiVrpq8yN+qtpwVfnJUnZ33li2p+vFY=;
	b=MUMioLObCa4a5Eryn3j+0QNR4xSLwc+0Xb5HGRVThAAoRkgN/KzQXqcP7uUXHkBNAxgL
	 h/YL6DZYhW0TRhiUvWUkDXp+d+AO+ZLbDiKOKI+itgWO5925DVyhm5KWhglM/KrUpOAMK
	 Pm9ZaOnzolwIqAxc+QKTx9KMYyveZvEhz7/iMmdDv4ETL5PzNMJlH+5cE+Qer84XkV2Sr
	 MSuYOyY5306BPuHxMYRi3b7aAZRIxEVhyk/3Vci3LTuvAmksE4mP8GtHz+wGWi8sA7xFP
	 fhMwfnnH19T7j0xyDo3xBcGlLgcEtvBjgZgAINH4M4q5FxdAIYFiHlqOsAt/DLCAI5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F1lTbrVg;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=H64mUEsz;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775D3606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 775D3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F1lTbrVg;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=H64mUEsz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793006513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=g5iKcSbReiRguiVrpq8yN+qtpwVfnJUnZ33li2p+vFY=;
	b=F1lTbrVgtr75rh1du7VYyqtUBiQaCTo+RDuKgHpmPua9i1Cz4kPNevDpmyQ1VRK6GCikDq
	SJjA3Ek9fiUmLjFmZGgblFMt7g1I6YsKYMdjCMvAC7jH0QtY5OXNTo5yzznR+fX2OAipUq
	QoemTzZohIYkCGxGCzdYMh+DcGCRtms=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-qBDs4aipMHO8D8EZhyuYMA-1; Mon, 26 Oct 2026 05:21:51 -0400
X-MC-Unique: qBDs4aipMHO8D8EZhyuYMA-1
X-Mimecast-MFC-AGG-ID: qBDs4aipMHO8D8EZhyuYMA_1793006511
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a214a5f8a1so25776355e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793006510; x=1793611310; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g5iKcSbReiRguiVrpq8yN+qtpwVfnJUnZ33li2p+vFY=;
        b=H64mUEszyk0VKfZ4URZJ8Ti9wiz11rWtYZriQKahJKKIm+4Rx3b7GwhsDoXm6B2Zkj
         x5KlQXdr6nM7kbCiXSI6sDdvksGNGf6BsOuL3O2ZypK3tGImdnY1x6tdPiWo+Sxg5e5p
         aiwtkCU5cTee6Vw79BLXnrg+4/D+1KIepuV8UDOLMcXQKM8ouAATxiUSi8Hj4LkelScY
         XgX8py2P89rkcehIP+F0dmdJ/Ettb+i7Hm1KE/nk1LHy6I3Q5I8jjLMnGomIxFkdNS+G
         bWFMkkB/G5c1St7jIyRkntbCaPvQoC4o2ErzyKYTVYgSvECYmE6TTZa1hXGmH0ozh6eL
         dtyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006510; x=1793611310;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g5iKcSbReiRguiVrpq8yN+qtpwVfnJUnZ33li2p+vFY=;
        b=o+5ckwFv4ylgIUytOihrGcNbHbf1d8eOnF0GMd0m7PFTa1+ovgsJm1r1U7TB5J96HC
         sEx86bDgSegu+uiIBwcI/mxcrA/b6NZWPhde6eB4at39fdO2T5e3IMjdWJrcvRZocA/H
         F+04jGqj3zwNQqfwLkK0ilMXxSuxLxOoRJ8m6XX4WUUwJ9NLM7rGE8peeCUvfhid7GMo
         fx+x6A2TYfDbf/rgoIBJBa+fektgeJ5zVlN9QG1sck0HKIGMcfqxPPMu86O2pkiKf68k
         PpFkomeIeuu5oIFdgovIWZK8eX1Blsa97aS12lMNbWCDkq8q5OkWQe9DiR3ZIZrXVxNF
         tMmg==
X-Forwarded-Encrypted: i=1; AKwUvBw+TLdb+kdCqjG6d7Ij7gulqtKBdQt0pS9NHndQrNuEygR+t5LcOakht/Y5n7PM64zaG2Pczo8t3hEi1Zg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRz5K4HWS5vAs8N1aL44wwQs4IyLehl16r95ynW2wS+jQCvqOO
	BRd9z1W9udGc15Y3dJJhGmPed9UjzXb13UmXgLDuHfCUsxF1H2DlegXVDCxJD7NBgUTgYcnwDth
	vaPZRwTHl30LoMOgm77miUNnFX8OpFXguZCwRSL7OV3ulRk9bJT6eExnd1t8aSOzD27rOzt4cVQ
	==
X-Gm-Gg: AYBFou2pY/HADK4NImltFeiefi3OJOanjB7tIBt6B/o6BZTC5J9Ym63rh+56exiaj61
	OiFTy5WWvS/6JgrWPqxIDhxDjDIxPqRuCbICwEDQbyh0RilKWS5IieH1GGHHqtdDjSDLJOYVHUz
	f2CBLNhhDdnzXiB5POkEW5pHbQYEgabKOMjMDbpdvHhsUZXUoUdHRzDE+nGXyxEdRWyxwtrVKJM
	ZQnpgx0Rn6uGVIzRN9By04bJut1Nm6xlm+DrKOMB+3ZnOXl8Vo2H1AzpeGF2CeaUxR+hsYpMmVt
	kISPNizs7tdG08fCtqU4DUI1wJstHPaZg5AfYZUnrUcJHVvtSUqRZ1YgSRI6oNuUhonkAlHrNSj
	kSDvyfySQBu7WxwtP8Z1JjyX23iJN
X-Received: by 2002:a05:600c:4704:b0:4a2:1612:637a with SMTP id 5b1f17b1804b1-4a35acbd575mr120747165e9.16.1793006510565;
        Mon, 26 Oct 2026 02:21:50 -0700 (PDT)
X-Received: by 2002:a05:600c:4704:b0:4a2:1612:637a with SMTP id 5b1f17b1804b1-4a35acbd575mr120746615e9.16.1793006510118;
        Mon, 26 Oct 2026 02:21:50 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.133.173])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a00e1b0sm144534585e9.3.2026.10.26.02.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:21:49 -0700 (PDT)
Message-ID: <b7a037a62858e6ad7017cf05c3ccaba06e7a8671.camel@redhat.com>
Subject: Re: [PATCH v7 02/14] rv: Fix ha_monitor timer and invariant
 underflow
From: Gabriele Monaco <gmonaco@redhat.com>
To: wen.yang@linux.dev
Cc: Nam Cao <namcao@linutronix.de>, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 26 Oct 2026 10:21:48 +0100
In-Reply-To: <2ab5a814ce453e282c5d90b7285ee6fea8a674b6.1791745088.git.wen.yang@linux.dev>
References: <cover.1791745088.git.wen.yang@linux.dev>
	 <2ab5a814ce453e282c5d90b7285ee6fea8a674b6.1791745088.git.wen.yang@linux.dev>
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
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, 2026-10-12 at 03:39 +0800, wen.yang@linux.dev wrote:
> From: Wen Yang <wen.yang@linux.dev>
>=20
> ha_start_timer_ns() and ha_start_timer_jiffy() compute the remaining
> budget as expire - passed.=C2=A0 Once the elapsed time passed exceeds the
> budget expire (e.g. a state transition after the invariant should have
> fired, before the timer callback ran), the unsigned subtraction
> underflows to a huge value and the timer is scheduled far into the
> future instead of expiring immediately.
>=20
> ha_check_invariant_ns() computes store >=3D time_ns - expire_ns, which
> underflows when the system uptime is still below expire_ns (a monitor
> armed early in boot with a large budget), reporting a false violation.
>=20
> Clamp the timer remainder to 0 (fire immediately) when passed >=3D expire=
,
> and replace the invariant check as store + expire_ns >=3D time_ns so
> neither side can underflow.
>=20
> Fixes: f5587d1b6ec9 ("rv: Add Hybrid Automata monitor type")
> Fixes: ab2900ae252b ("rv: Simplify hybrid automata monitors's clock
> variables")
> Signed-off-by: Wen Yang <wen.yang@linux.dev>
> ---

Looks good, thanks

Reviewed-by: Gabriele Monaco <gmonaco@redhat.com>

> =C2=A0include/rv/ha_monitor.h | 19 ++++++++++++++-----
> =C2=A01 file changed, 14 insertions(+), 5 deletions(-)
>=20
> diff --git a/include/rv/ha_monitor.h b/include/rv/ha_monitor.h
> index 93ac99ff7f1d..499ce60779f9 100644
> --- a/include/rv/ha_monitor.h
> +++ b/include/rv/ha_monitor.h
> @@ -351,7 +351,7 @@ static inline void ha_reset_clk_ns(struct ha_monitor
> *ha_mon, enum envs env, u64
> =C2=A0static inline bool ha_check_invariant_ns(struct ha_monitor *ha_mon,=
 enum envs
> env,
> =C2=A0					 u64 time_ns, u64 expire_ns)
> =C2=A0{
> -	return READ_ONCE(ha_mon->env_store[env]) >=3D time_ns - expire_ns;
> +	return READ_ONCE(ha_mon->env_store[env]) + expire_ns >=3D time_ns;
> =C2=A0}
> =C2=A0/*
> =C2=A0 * ha_invariant_passed_ns - prepare the invariant and return the ti=
me since
> reset
> @@ -410,6 +410,11 @@ static inline void ha_inv_to_guard(struct ha_monitor
> *ha_mon, enum envs env,
> =C2=A0	WRITE_ONCE(ha_mon->env_store[env], READ_ONCE(ha_mon->env_store[env=
])
> - value);
> =C2=A0}
> =C2=A0
> +static inline u64 ha_time_left(u64 passed, u64 expire)
> +{
> +	return passed < expire ? expire - passed : 0;
> +}
> +
> =C2=A0#if HA_TIMER_TYPE =3D=3D HA_TIMER_WHEEL
> =C2=A0/*
> =C2=A0 * Helper functions to handle the monitor timer.
> @@ -439,15 +444,17 @@ static inline void ha_start_timer_jiffy(struct
> ha_monitor *ha_mon, enum envs env
> =C2=A0{
> =C2=A0	u64 passed =3D ha_invariant_passed_jiffy(ha_mon, env, time_ns);
> =C2=A0
> -	mod_timer(&ha_mon->timer, get_jiffies_64() + expire - passed);
> +	mod_timer(&ha_mon->timer,
> +		=C2=A0 get_jiffies_64() + ha_time_left(passed, expire));
> =C2=A0}
> =C2=A0static inline void ha_start_timer_ns(struct ha_monitor *ha_mon, enu=
m envs
> env,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 u64 expire, u64 time_ns)
> =C2=A0{
> =C2=A0	u64 passed =3D ha_invariant_passed_ns(ha_mon, env, time_ns);
> +	u64 delay =3D ha_time_left(passed, expire);
> =C2=A0
> =C2=A0	ha_start_timer_jiffy(ha_mon, ENV_MAX_STORED,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 nsecs_to_jiffies(expire - passed + TICK_NSEC=
 -
> 1), time_ns);
> +			=C2=A0=C2=A0=C2=A0=C2=A0 nsecs_to_jiffies(delay + TICK_NSEC - 1),
> time_ns);
> =C2=A0}
> =C2=A0/*
> =C2=A0 * ha_cancel_timer - Cancel the timer
> @@ -494,7 +501,8 @@ static inline void ha_start_timer_ns(struct ha_monito=
r
> *ha_mon, enum envs env,
> =C2=A0
> =C2=A0	if (RV_MON_TYPE =3D=3D RV_MON_PER_CPU)
> =C2=A0		mode |=3D HRTIMER_MODE_PINNED;
> -	hrtimer_start(&ha_mon->hrtimer, ns_to_ktime(expire - passed), mode);
> +	hrtimer_start(&ha_mon->hrtimer,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ns_to_ktime(ha_time_left(passed, expire=
)), mode);
> =C2=A0}
> =C2=A0static inline void ha_start_timer_jiffy(struct ha_monitor *ha_mon, =
enum envs
> env,
> =C2=A0					u64 expire, u64 time_ns)
> @@ -502,7 +510,8 @@ static inline void ha_start_timer_jiffy(struct ha_mon=
itor
> *ha_mon, enum envs env
> =C2=A0	u64 passed =3D ha_invariant_passed_jiffy(ha_mon, env, time_ns);
> =C2=A0
> =C2=A0	ha_start_timer_ns(ha_mon, ENV_MAX_STORED,
> -			=C2=A0 jiffies_to_nsecs(expire - passed), time_ns);
> +			=C2=A0 jiffies_to_nsecs(ha_time_left(passed, expire)),
> +			=C2=A0 time_ns);
> =C2=A0}
> =C2=A0/*
> =C2=A0 * ha_cancel_timer - Cancel the timer

