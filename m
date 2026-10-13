Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B9441E6DB
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791879331; cv=none; b=YTE/p31VvctsRLQBSbg0/H6hicGIxDSwiZLK942KB9PP+Jd1DDTeJlmqpWxSr6niyQ0TD3c6C2Jj/NrifNjxdB5rOmJQOx5BWQ9WgXmGy64oPMHUrWge13t4hkapcchrq4u246FsvwBSYpChr3B1DssVcXDwMELzjlRWvoTKMCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791879331; c=relaxed/simple;
	bh=986An/0l/b5loBwJrlBhRTpyxow6TTHiAodYkSHssxw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g2ZUlj2z3b+2mbce3ASZ0sZ4svYyhNlnxhVgDhcA24lLmYR2nx5W2RK59n9saRxqB/ywTlsUatgu3MbOITH0IkDuutAZjeFmNlcGTr4Ua2yxIYoF4b1ijCvpN3yXUa5N6DLd5UmfCEkR5UiN0BQrfnndPUdyOLI5cCO/2h3tqPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ns04meMQ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=XpOquaSu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ns04meMQ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="XpOquaSu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791879327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ImKAcRelEC90byXajVp4krfoSiChsTHlVCrCTr80AKM=;
	b=Ns04meMQAMaymDxvBAXHp0LleMMiqw0ruTT3ahnU1oUeusAksFhIIECbvFRp2sEH0dHnmd
	LYcofF/3zKPG9aHrb0RFy4mlO0dBzGIzV+Qp1ScE0nPK5va0R1OX/2Pz2Q1dtJQvvATfED
	2D76ZE//ry6TMXUMVE321CuIaBCZpZI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-1Wp4qPb-MrWkB6FSvpQLTw-1; Tue, 13 Oct 2026 08:15:26 +0000
X-MC-Unique: 1Wp4qPb-MrWkB6FSvpQLTw-1
X-Mimecast-MFC-AGG-ID: 1Wp4qPb-MrWkB6FSvpQLTw_1791879325
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48b027578a4so2236419f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791879325; x=1792484125; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ImKAcRelEC90byXajVp4krfoSiChsTHlVCrCTr80AKM=;
        b=XpOquaSutHn9owjQBb7Ma+bFyQncaJqCQUGZr2aZX5bS+Rnmj3cJY3+aRMqR0AqhfO
         JZDYtHOJf7siunUNj40ULGwZ9bcziaW/MIfTxOVfK07H2lJqLa9B4AybcdsQB8YtAI44
         rqcF4HquXJBPnJzeGZOmHbvP09e/alQoQhw9lHQiH6bUk8A6JmAqpt21UzHoKHPUKzNm
         /R0ZPze9XH6A8bMObw1WHdZvbl8kN/WTa+RqUk0IwcGP/UkUFFcJrSnYj2myTY1XBEvM
         x1wR9Vp0sZJ2nnY3+JGHx4teQZgLQY+ouCF9uDfec+Fn1x/EdrTj+cAmT76ECYPqILFV
         /TWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791879325; x=1792484125;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ImKAcRelEC90byXajVp4krfoSiChsTHlVCrCTr80AKM=;
        b=kTcGOdihbPt5j9LIBvMPstWSHX1n8EaJ9jc/dkrwF27DJyfdo7DVyfJxVrkSxpSYFx
         VHQ5afh+rulRd81fO5G2fEO8SjK/K4dVL2v0z12FQE3bADOngtcKQduKYfjIVyTCNMri
         BlaKo9nQckBKb8UNKniohMeqpV8oFuH/wwbEz3/Gac07YPf2JKuf7QuETFhxTEp8F0+H
         B0o/ezeVjr7vmqbYvRSLqJxuhVOQWVETPXOOr/Z4aLoxXeH05IOArzrrMiqIVS0JXLLP
         VVYAeY4Qjvq8IJQZFYwqph81lfYGBYVx+YaDgophmjvG2cOU/oS3hPe/RCjM8Iqv0MOs
         5Tbw==
X-Forwarded-Encrypted: i=1; AKwUvBwuw6VuvuUxFWt2g0qsGiRudE2hscIR+1cIFt8jTZI+KjH6Q67Plu1fD46hUJDQTZxgRNAVMKqN/BGLEx0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLueX58/KL/+ajNFUrhJydX/FTgeil9aPDZFCA1aGO/YmApBPkW
	l51vgq5x8k3bHfEPcaAulJEUVKd+FrEm7XZZfJEI516xk4g5ZJFBbtV7pRd3sd+vVdGB2vsmI89
	O8mqaZLlWzgc8cdbDVSHT4PgVxkt6H9WP9APR5tx+GDyO+LoJYPhv3ByonqWRLuBIlg==
X-Gm-Gg: AYBFou3x3LxEhuvUNyKurz3FygBf9yn6L5FUywHFz+CsN+kUFQRlpWjGYkA/IKI9gTy
	1WV7VA9znUMlLDO09rnxeb/MS2LJFOc3uEIh/yt5kmq7sJP7XFriItueVBGpnUj8UE9gxgO3Tcj
	GObyYyAENGdxiT4sWf97Miq7wK7fo3+FkEEsj08schF3MiRoicvzyxpOGIN1zrXHkEZVC9rVChQ
	7Ln1uMM1h0LRw8wX2D39KKFXME/RZ85paFSioGln67Epa4SFGFJ1UVgtXygYbhePf16SEF67olQ
	zlz3YjzThpCB2+lRgWi5LA6+otdkS+ZcX/5yegIecNkTs2IgVPIJZKg4lkoPdIWDHAeexsN4wRf
	1WozGsRcqKl3t+/kUyxy7QAenawfP
X-Received: by 2002:adf:efc3:0:b0:48b:6f3:667f with SMTP id ffacd0b85a97d-48dbacef900mr17118167f8f.56.1791879324787;
        Tue, 13 Oct 2026 01:15:24 -0700 (PDT)
X-Received: by 2002:adf:efc3:0:b0:48b:6f3:667f with SMTP id ffacd0b85a97d-48dbacef900mr17118114f8f.56.1791879324220;
        Tue, 13 Oct 2026 01:15:24 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.135.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab5262sm3808098f8f.22.2026.10.13.01.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 01:15:23 -0700 (PDT)
Message-ID: <b5d9041971e2d033df78ada10977fd1e566f1bef.camel@redhat.com>
Subject: Re: [PATCH v2 04/15] rv: Cast result of model_get_*_name()
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org, Steven Rostedt
	 <rostedt@goodmis.org>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Wen Yang
	 <wen.yang@linux.dev>, Tobias Schaffner <tobias.schaffner@siemens.com>, 
 Viktor Malik <vmalik@redhat.com>
Date: Tue, 13 Oct 2026 10:15:22 +0200
In-Reply-To: <87jynmgm94.fsf@yellow.woof>
References: <20261001152042.124445-1-gmonaco@redhat.com>
	 <20261001152042.124445-5-gmonaco@redhat.com> <87jynmgm94.fsf@yellow.woof>
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

On Tue, 2026-10-13 at 08:14 +0200, Nam Cao wrote:
> Gabriele Monaco <gmonaco@redhat.com> writes:
>=20
> > Functions like model_get_event_name() and model_get_state_name() are
> > shared with BPF monitors, however those programs don't play nice with
> > string pointers without fixed length and the event_name and state_name
> > arrays need to be defined differently. This gets the compiler to notice
> > those are const char and the above function discard the const qualifier=
.
> >=20
> > Drop the warning by casting the result to (char *). Note, a cleaner
> > solution would require to modify all callers, but that would require
> > changing every single monitor's tracepoint and the advantage is minimal=
.
>=20
> I prefer the cleaner solution. Just mass replace "char *" with
> "const char *", and manually fix up a few errors and we are done.

Right, no excuse for being lazy in the era of LLMs..

Thanks for the patch,
Gabriele

>=20
> diff --git a/include/rv/automata.h b/include/rv/automata.h
> index 4a4eb40cf09a..e4afd5ba1d06 100644
> --- a/include/rv/automata.h
> +++ b/include/rv/automata.h
> @@ -22,7 +22,7 @@
> =C2=A0/*
> =C2=A0 * model_get_state_name - return the (string) name of the given sta=
te
> =C2=A0 */
> -static char *model_get_state_name(enum states state)
> +static const char *model_get_state_name(enum states state)
> =C2=A0{
> =C2=A0	if ((state < 0) || (state >=3D STATE_MAX))
> =C2=A0		return "INVALID";
> @@ -33,7 +33,7 @@ static char *model_get_state_name(enum states state)
> =C2=A0/*
> =C2=A0 * model_get_event_name - return the (string) name of the given eve=
nt
> =C2=A0 */
> -static char *model_get_event_name(enum events event)
> +static const char *model_get_event_name(enum events event)
> =C2=A0{
> =C2=A0	if ((event < 0) || (event >=3D EVENT_MAX))
> =C2=A0		return "INVALID";
> diff --git a/include/rv/da_monitor.h b/include/rv/da_monitor.h
> index 6fc5ef8142ac..fc830c9f5046 100644
> --- a/include/rv/da_monitor.h
> +++ b/include/rv/da_monitor.h
> @@ -633,8 +633,8 @@ static inline void da_monitor_destroy(void)
> =C2=A0 */
> =C2=A0
> =C2=A0static inline void da_trace_event(struct da_monitor *da_mon,
> -				=C2=A0 char *curr_state, char *event,
> -				=C2=A0 char *next_state, bool is_final,
> +				=C2=A0 const char *curr_state, const char *event,
> +				=C2=A0 const char *next_state, bool is_final,
> =C2=A0				=C2=A0 da_id_type id)
> =C2=A0{
> =C2=A0	CONCATENATE(trace_event_, MONITOR_NAME)(curr_state, event,
> next_state,
> @@ -642,7 +642,7 @@ static inline void da_trace_event(struct da_monitor
> *da_mon,
> =C2=A0}
> =C2=A0
> =C2=A0static inline void da_trace_error(struct da_monitor *da_mon,
> -				=C2=A0 char *curr_state, char *event,
> +				=C2=A0 const char *curr_state, const char *event,
> =C2=A0				=C2=A0 da_id_type id)
> =C2=A0{
> =C2=A0	CONCATENATE(trace_error_, MONITOR_NAME)(curr_state, event);
> @@ -662,8 +662,8 @@ static inline da_id_type da_get_id(struct da_monitor
> *da_mon)
> =C2=A0 */
> =C2=A0
> =C2=A0static inline void da_trace_event(struct da_monitor *da_mon,
> -				=C2=A0 char *curr_state, char *event,
> -				=C2=A0 char *next_state, bool is_final,
> +				=C2=A0 const char *curr_state, const char *event,
> +				=C2=A0 const char *next_state, bool is_final,
> =C2=A0				=C2=A0 da_id_type id)
> =C2=A0{
> =C2=A0	CONCATENATE(trace_event_, MONITOR_NAME)(id, curr_state, event,
> @@ -671,7 +671,7 @@ static inline void da_trace_event(struct da_monitor
> *da_mon,
> =C2=A0}
> =C2=A0
> =C2=A0static inline void da_trace_error(struct da_monitor *da_mon,
> -				=C2=A0 char *curr_state, char *event,
> +				=C2=A0 const char *curr_state, const char *event,
> =C2=A0				=C2=A0 da_id_type id)
> =C2=A0{
> =C2=A0	CONCATENATE(trace_error_, MONITOR_NAME)(id, curr_state, event);
> diff --git a/include/rv/ha_monitor.h b/include/rv/ha_monitor.h
> index 6e1c7fe5449a..0952a3f161c3 100644
> --- a/include/rv/ha_monitor.h
> +++ b/include/rv/ha_monitor.h
> @@ -87,7 +87,7 @@ _Static_assert(offsetof(struct ha_monitor, da_mon) =3D=
=3D 0,
> =C2=A0 * environment constraint is false. This function can be called als=
o with no
> =C2=A0 * event from a timer (state constraints only).
> =C2=A0 */
> -static void ha_react(enum states curr_state, enum events event, char *en=
v)
> +static void ha_react(enum states curr_state, enum events event, const ch=
ar
> *env)
> =C2=A0{
> =C2=A0	rv_react(&rv_this,
> =C2=A0		 "rv: monitor %s does not allow event %s on state %s with env
> %s\n",
> @@ -98,13 +98,13 @@ static void ha_react(enum states curr_state, enum eve=
nts
> event, char *env)
> =C2=A0
> =C2=A0#else /* CONFIG_RV_REACTOR */
> =C2=A0
> -static void ha_react(enum states curr_state, enum events event, char *en=
v) {
> }
> +static void ha_react(enum states curr_state, enum events event, const ch=
ar
> *env) { }
> =C2=A0#endif
> =C2=A0
> =C2=A0/*
> =C2=A0 * model_get_state_name - return the (string) name of the given sta=
te
> =C2=A0 */
> -static char *model_get_env_name(enum envs env)
> +static const char *model_get_env_name(enum envs env)
> =C2=A0{
> =C2=A0	if ((env < 0) || (env >=3D ENV_MAX))
> =C2=A0		return "INVALID";
> @@ -227,7 +227,7 @@ static inline void ha_get_env_string(struct seq_buf *=
s,
> =C2=A0
> =C2=A0#if RV_MON_TYPE =3D=3D RV_MON_GLOBAL || RV_MON_TYPE =3D=3D RV_MON_P=
ER_CPU
> =C2=A0static inline void ha_trace_error_env(struct ha_monitor *ha_mon,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char *curr_state, char *event, char
> *env,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *curr_state, const char
> *event, const char *env,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 da_id_type id)
> =C2=A0{
> =C2=A0	CONCATENATE(trace_error_env_, MONITOR_NAME)(curr_state, event, env=
);
> @@ -237,7 +237,7 @@ static inline void ha_trace_error_env(struct ha_monit=
or
> *ha_mon,
> =C2=A0#define ha_get_target(ha_mon) da_get_target(&ha_mon->da_mon)
> =C2=A0
> =C2=A0static inline void ha_trace_error_env(struct ha_monitor *ha_mon,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char *curr_state, char *event, char
> *env,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *curr_state, const char
> *event, const char *env,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 da_id_type id)
> =C2=A0{
> =C2=A0	CONCATENATE(trace_error_env_, MONITOR_NAME)(id, curr_state, event,
> env);
> diff --git a/kernel/trace/rv/monitors/nomiss/nomiss.h
> b/kernel/trace/rv/monitors/nomiss/nomiss.h
> index 3d1b436194d7..0e74a27bc38c 100644
> --- a/kernel/trace/rv/monitors/nomiss/nomiss.h
> +++ b/kernel/trace/rv/monitors/nomiss/nomiss.h
> @@ -41,9 +41,9 @@ _Static_assert(env_max_stored_nomiss <=3D MAX_HA_ENV_LE=
N, "Not
> enough slots");
> =C2=A0#define HA_CLK_NS
> =C2=A0
> =C2=A0struct automaton_nomiss {
> -	char *state_names[state_max_nomiss];
> -	char *event_names[event_max_nomiss];
> -	char *env_names[env_max_nomiss];
> +	const char *state_names[state_max_nomiss];
> +	const char *event_names[event_max_nomiss];
> +	const char *env_names[env_max_nomiss];
> =C2=A0	unsigned char function[state_max_nomiss][event_max_nomiss];
> =C2=A0	unsigned char initial_state;
> =C2=A0	bool final_states[state_max_nomiss];
> diff --git a/kernel/trace/rv/monitors/nomiss/nomiss_trace.h
> b/kernel/trace/rv/monitors/nomiss/nomiss_trace.h
> index 42e7efaca4e7..8ad43b6dde6a 100644
> --- a/kernel/trace/rv/monitors/nomiss/nomiss_trace.h
> +++ b/kernel/trace/rv/monitors/nomiss/nomiss_trace.h
> @@ -6,14 +6,14 @@
> =C2=A0
> =C2=A0#ifdef CONFIG_RV_MON_NOMISS
> =C2=A0DEFINE_EVENT(event_da_monitor_id, event_nomiss,
> -	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(int id, char *state, char *event, cha=
r *next_state,
> bool final_state),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(int id, const char *state, const char=
 *event, const
> char *next_state, bool final_state),
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(id, state, event, next_state, fin=
al_state));
> =C2=A0
> =C2=A0DEFINE_EVENT(error_da_monitor_id, error_nomiss,
> -	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(int id, char *state, char *event),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(int id, const char *state, const char=
 *event),
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(id, state, event));
> =C2=A0
> =C2=A0DEFINE_EVENT(error_env_da_monitor_id, error_env_nomiss,
> -	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(int id, char *state, char *event, cha=
r *env),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(int id, const char *state, const char=
 *event, const
> char *env),
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(id, state, event, env));
> =C2=A0#endif /* CONFIG_RV_MON_NOMISS */
> diff --git a/kernel/trace/rv/monitors/nrp/nrp.h
> b/kernel/trace/rv/monitors/nrp/nrp.h
> index 3270d4c0139f..f6c1ec62233d 100644
> --- a/kernel/trace/rv/monitors/nrp/nrp.h
> +++ b/kernel/trace/rv/monitors/nrp/nrp.h
> @@ -26,8 +26,8 @@ enum events_nrp {
> =C2=A0};
> =C2=A0
> =C2=A0struct automaton_nrp {
> -	char *state_names[state_max_nrp];
> -	char *event_names[event_max_nrp];
> +	const char *state_names[state_max_nrp];
> +	const char *event_names[event_max_nrp];
> =C2=A0	unsigned char function[state_max_nrp][event_max_nrp];
> =C2=A0	unsigned char initial_state;
> =C2=A0	bool final_states[state_max_nrp];
> diff --git a/kernel/trace/rv/monitors/nrp/nrp_trace.h
> b/kernel/trace/rv/monitors/nrp/nrp_trace.h
> index 2e13497de3b6..bcdb44c8e1fa 100644
> --- a/kernel/trace/rv/monitors/nrp/nrp_trace.h
> +++ b/kernel/trace/rv/monitors/nrp/nrp_trace.h
> @@ -6,10 +6,10 @@
> =C2=A0
> =C2=A0#ifdef CONFIG_RV_MON_NRP
> =C2=A0DEFINE_EVENT(event_da_monitor_id, event_nrp,
> -	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(int id, char *state, char *event, cha=
r *next_state,
> bool final_state),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(int id, const char *state, const char=
 *event, const
> char *next_state, bool final_state),
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(id, state, event, next_state, fin=
al_state));
> =C2=A0
> =C2=A0DEFINE_EVENT(error_da_monitor_id, error_nrp,
> -	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(int id, char *state, char *event),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(int id, const char *state, const char=
 *event),
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(id, state, event));
> =C2=A0#endif /* CONFIG_RV_MON_NRP */
> diff --git a/kernel/trace/rv/monitors/opid/opid.h
> b/kernel/trace/rv/monitors/opid/opid.h
> index fb0aa4c28aa6..42680aa81f33 100644
> --- a/kernel/trace/rv/monitors/opid/opid.h
> +++ b/kernel/trace/rv/monitors/opid/opid.h
> @@ -30,9 +30,9 @@ enum envs_opid {
> =C2=A0_Static_assert(env_max_stored_opid <=3D MAX_HA_ENV_LEN, "Not enough=
 slots");
> =C2=A0
> =C2=A0struct automaton_opid {
> -	char *state_names[state_max_opid];
> -	char *event_names[event_max_opid];
> -	char *env_names[env_max_opid];
> +	const char *state_names[state_max_opid];
> +	const char *event_names[event_max_opid];
> +	const char *env_names[env_max_opid];
> =C2=A0	unsigned char function[state_max_opid][event_max_opid];
> =C2=A0	unsigned char initial_state;
> =C2=A0	bool final_states[state_max_opid];
> diff --git a/kernel/trace/rv/monitors/opid/opid_trace.h
> b/kernel/trace/rv/monitors/opid/opid_trace.h
> index b04005b64208..daca1f4a1cd6 100644
> --- a/kernel/trace/rv/monitors/opid/opid_trace.h
> +++ b/kernel/trace/rv/monitors/opid/opid_trace.h
> @@ -6,14 +6,14 @@
> =C2=A0
> =C2=A0#ifdef CONFIG_RV_MON_OPID
> =C2=A0DEFINE_EVENT(event_da_monitor, event_opid,
> -	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(char *state, char *event, char *next_=
state, bool
> final_state),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(const char *state, const char *event,=
 const char
> *next_state, bool final_state),
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(state, event, next_state, final_s=
tate));
> =C2=A0
> =C2=A0DEFINE_EVENT(error_da_monitor, error_opid,
> -	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(char *state, char *event),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(const char *state, const char *event)=
,
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(state, event));
> =C2=A0
> =C2=A0DEFINE_EVENT(error_env_da_monitor, error_env_opid,
> -	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(char *state, char *event, char *env),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(const char *state, const char *event,=
 const char *env),
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(state, event, env));
> =C2=A0#endif /* CONFIG_RV_MON_OPID */
> diff --git a/kernel/trace/rv/monitors/pagefault/pagefault_trace.h
> b/kernel/trace/rv/monitors/pagefault/pagefault_trace.h
> index fe1f82597b1a..cd0915a42c85 100644
> --- a/kernel/trace/rv/monitors/pagefault/pagefault_trace.h
> +++ b/kernel/trace/rv/monitors/pagefault/pagefault_trace.h
> @@ -6,7 +6,7 @@
> =C2=A0
> =C2=A0#ifdef CONFIG_RV_MON_PAGEFAULT
> =C2=A0DEFINE_EVENT(event_ltl_monitor_id, event_pagefault,
> -	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(struct task_struct *task, char *state=
s, char *atoms,
> char *next),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(struct task_struct *task, const char =
*states, const
> char *atoms, const char *next),
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(task, states, atoms, next));
> =C2=A0DEFINE_EVENT(error_ltl_monitor_id, error_pagefault,
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(struct task_struct *task),
> diff --git a/kernel/trace/rv/monitors/sco/sco.h
> b/kernel/trace/rv/monitors/sco/sco.h
> index bac3beb51e72..65bcfcb136b7 100644
> --- a/kernel/trace/rv/monitors/sco/sco.h
> +++ b/kernel/trace/rv/monitors/sco/sco.h
> @@ -23,8 +23,8 @@ enum events_sco {
> =C2=A0};
> =C2=A0
> =C2=A0struct automaton_sco {
> -	char *state_names[state_max_sco];
> -	char *event_names[event_max_sco];
> +	const char *state_names[state_max_sco];
> +	const char *event_names[event_max_sco];
> =C2=A0	unsigned char function[state_max_sco][event_max_sco];
> =C2=A0	unsigned char initial_state;
> =C2=A0	bool final_states[state_max_sco];
> diff --git a/kernel/trace/rv/monitors/sco/sco_trace.h
> b/kernel/trace/rv/monitors/sco/sco_trace.h
> index b711cd9024ec..99bc63873f4a 100644
> --- a/kernel/trace/rv/monitors/sco/sco_trace.h
> +++ b/kernel/trace/rv/monitors/sco/sco_trace.h
> @@ -6,10 +6,10 @@
> =C2=A0
> =C2=A0#ifdef CONFIG_RV_MON_SCO
> =C2=A0DEFINE_EVENT(event_da_monitor, event_sco,
> -	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(char *state, char *event, char *next_=
state, bool
> final_state),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(const char *state, const char *event,=
 const char
> *next_state, bool final_state),
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(state, event, next_state, final_s=
tate));
> =C2=A0
> =C2=A0DEFINE_EVENT(error_da_monitor, error_sco,
> -	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(char *state, char *event),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(const char *state, const char *event)=
,
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(state, event));
> =C2=A0#endif /* CONFIG_RV_MON_SCO */
> diff --git a/kernel/trace/rv/monitors/scpd/scpd.h
> b/kernel/trace/rv/monitors/scpd/scpd.h
> index d6329da2671b..e9742c2789f7 100644
> --- a/kernel/trace/rv/monitors/scpd/scpd.h
> +++ b/kernel/trace/rv/monitors/scpd/scpd.h
> @@ -24,8 +24,8 @@ enum events_scpd {
> =C2=A0};
> =C2=A0
> =C2=A0struct automaton_scpd {
> -	char *state_names[state_max_scpd];
> -	char *event_names[event_max_scpd];
> +	const char *state_names[state_max_scpd];
> +	const char *event_names[event_max_scpd];
> =C2=A0	unsigned char function[state_max_scpd][event_max_scpd];
> =C2=A0	unsigned char initial_state;
> =C2=A0	bool final_states[state_max_scpd];
> diff --git a/kernel/trace/rv/monitors/scpd/scpd_trace.h
> b/kernel/trace/rv/monitors/scpd/scpd_trace.h
> index 6b0f4aa4732e..d9013db67f94 100644
> --- a/kernel/trace/rv/monitors/scpd/scpd_trace.h
> +++ b/kernel/trace/rv/monitors/scpd/scpd_trace.h
> @@ -6,10 +6,10 @@
> =C2=A0
> =C2=A0#ifdef CONFIG_RV_MON_SCPD
> =C2=A0DEFINE_EVENT(event_da_monitor, event_scpd,
> -	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(char *state, char *event, char *next_=
state, bool
> final_state),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(const char *state, const char *event,=
 const char
> *next_state, bool final_state),
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(state, event, next_state, final_s=
tate));
> =C2=A0
> =C2=A0DEFINE_EVENT(error_da_monitor, error_scpd,
> -	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(char *state, char *event),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(const char *state, const char *event)=
,
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(state, event));
> =C2=A0#endif /* CONFIG_RV_MON_SCPD */
> diff --git a/kernel/trace/rv/monitors/sleep/sleep_trace.h
> b/kernel/trace/rv/monitors/sleep/sleep_trace.h
> index 22eaf31da987..446c30c3af36 100644
> --- a/kernel/trace/rv/monitors/sleep/sleep_trace.h
> +++ b/kernel/trace/rv/monitors/sleep/sleep_trace.h
> @@ -6,7 +6,7 @@
> =C2=A0
> =C2=A0#ifdef CONFIG_RV_MON_SLEEP
> =C2=A0DEFINE_EVENT(event_ltl_monitor_id, event_sleep,
> -	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(struct task_struct *task, char *state=
s, char *atoms,
> char *next),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(struct task_struct *task, const char =
*states, const
> char *atoms, const char *next),
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(task, states, atoms, next));
> =C2=A0DEFINE_EVENT(error_ltl_monitor_id, error_sleep,
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(struct task_struct *task),
> diff --git a/kernel/trace/rv/monitors/snep/snep.h
> b/kernel/trace/rv/monitors/snep/snep.h
> index 357520a5b3d1..fabc363684d2 100644
> --- a/kernel/trace/rv/monitors/snep/snep.h
> +++ b/kernel/trace/rv/monitors/snep/snep.h
> @@ -24,8 +24,8 @@ enum events_snep {
> =C2=A0};
> =C2=A0
> =C2=A0struct automaton_snep {
> -	char *state_names[state_max_snep];
> -	char *event_names[event_max_snep];
> +	const char *state_names[state_max_snep];
> +	const char *event_names[event_max_snep];
> =C2=A0	unsigned char function[state_max_snep][event_max_snep];
> =C2=A0	unsigned char initial_state;
> =C2=A0	bool final_states[state_max_snep];
> diff --git a/kernel/trace/rv/monitors/snep/snep_trace.h
> b/kernel/trace/rv/monitors/snep/snep_trace.h
> index 01aad49a949a..d758882e7607 100644
> --- a/kernel/trace/rv/monitors/snep/snep_trace.h
> +++ b/kernel/trace/rv/monitors/snep/snep_trace.h
> @@ -6,10 +6,10 @@
> =C2=A0
> =C2=A0#ifdef CONFIG_RV_MON_SNEP
> =C2=A0DEFINE_EVENT(event_da_monitor, event_snep,
> -	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(char *state, char *event, char *next_=
state, bool
> final_state),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(const char *state, const char *event,=
 const char
> *next_state, bool final_state),
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(state, event, next_state, final_s=
tate));
> =C2=A0
> =C2=A0DEFINE_EVENT(error_da_monitor, error_snep,
> -	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(char *state, char *event),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(const char *state, const char *event)=
,
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(state, event));
> =C2=A0#endif /* CONFIG_RV_MON_SNEP */
> diff --git a/kernel/trace/rv/monitors/snroc/snroc.h
> b/kernel/trace/rv/monitors/snroc/snroc.h
> index 88b7328ad31a..12aa743e4f19 100644
> --- a/kernel/trace/rv/monitors/snroc/snroc.h
> +++ b/kernel/trace/rv/monitors/snroc/snroc.h
> @@ -23,8 +23,8 @@ enum events_snroc {
> =C2=A0};
> =C2=A0
> =C2=A0struct automaton_snroc {
> -	char *state_names[state_max_snroc];
> -	char *event_names[event_max_snroc];
> +	const char *state_names[state_max_snroc];
> +	const char *event_names[event_max_snroc];
> =C2=A0	unsigned char function[state_max_snroc][event_max_snroc];
> =C2=A0	unsigned char initial_state;
> =C2=A0	bool final_states[state_max_snroc];
> diff --git a/kernel/trace/rv/monitors/snroc/snroc_trace.h
> b/kernel/trace/rv/monitors/snroc/snroc_trace.h
> index 50114cef5122..aa9162a2d34d 100644
> --- a/kernel/trace/rv/monitors/snroc/snroc_trace.h
> +++ b/kernel/trace/rv/monitors/snroc/snroc_trace.h
> @@ -6,10 +6,10 @@
> =C2=A0
> =C2=A0#ifdef CONFIG_RV_MON_SNROC
> =C2=A0DEFINE_EVENT(event_da_monitor_id, event_snroc,
> -	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(int id, char *state, char *event, cha=
r *next_state,
> bool final_state),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(int id, const char *state, const char=
 *event, const
> char *next_state, bool final_state),
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(id, state, event, next_state, fin=
al_state));
> =C2=A0
> =C2=A0DEFINE_EVENT(error_da_monitor_id, error_snroc,
> -	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(int id, char *state, char *event),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(int id, const char *state, const char=
 *event),
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(id, state, event));
> =C2=A0#endif /* CONFIG_RV_MON_SNROC */
> diff --git a/kernel/trace/rv/monitors/sssw/sssw.h
> b/kernel/trace/rv/monitors/sssw/sssw.h
> index 1a4b806061c3..ad8d7a18c52d 100644
> --- a/kernel/trace/rv/monitors/sssw/sssw.h
> +++ b/kernel/trace/rv/monitors/sssw/sssw.h
> @@ -31,8 +31,8 @@ enum events_sssw {
> =C2=A0};
> =C2=A0
> =C2=A0struct automaton_sssw {
> -	char *state_names[state_max_sssw];
> -	char *event_names[event_max_sssw];
> +	const char *state_names[state_max_sssw];
> +	const char *event_names[event_max_sssw];
> =C2=A0	unsigned char function[state_max_sssw][event_max_sssw];
> =C2=A0	unsigned char initial_state;
> =C2=A0	bool final_states[state_max_sssw];
> diff --git a/kernel/trace/rv/monitors/sssw/sssw_trace.h
> b/kernel/trace/rv/monitors/sssw/sssw_trace.h
> index 6c03cfc6960b..14d22f793a07 100644
> --- a/kernel/trace/rv/monitors/sssw/sssw_trace.h
> +++ b/kernel/trace/rv/monitors/sssw/sssw_trace.h
> @@ -6,10 +6,10 @@
> =C2=A0
> =C2=A0#ifdef CONFIG_RV_MON_SSSW
> =C2=A0DEFINE_EVENT(event_da_monitor_id, event_sssw,
> -	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(int id, char *state, char *event, cha=
r *next_state,
> bool final_state),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(int id, const char *state, const char=
 *event, const
> char *next_state, bool final_state),
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(id, state, event, next_state, fin=
al_state));
> =C2=A0
> =C2=A0DEFINE_EVENT(error_da_monitor_id, error_sssw,
> -	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(int id, char *state, char *event),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(int id, const char *state, const char=
 *event),
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(id, state, event));
> =C2=A0#endif /* CONFIG_RV_MON_SSSW */
> diff --git a/kernel/trace/rv/monitors/stall/stall.h
> b/kernel/trace/rv/monitors/stall/stall.h
> index 638520cb1082..ce38b6b2311e 100644
> --- a/kernel/trace/rv/monitors/stall/stall.h
> +++ b/kernel/trace/rv/monitors/stall/stall.h
> @@ -33,9 +33,9 @@ enum envs_stall {
> =C2=A0_Static_assert(env_max_stored_stall <=3D MAX_HA_ENV_LEN, "Not enoug=
h slots");
> =C2=A0
> =C2=A0struct automaton_stall {
> -	char *state_names[state_max_stall];
> -	char *event_names[event_max_stall];
> -	char *env_names[env_max_stall];
> +	const char *state_names[state_max_stall];
> +	const char *event_names[event_max_stall];
> +	const char *env_names[env_max_stall];
> =C2=A0	unsigned char function[state_max_stall][event_max_stall];
> =C2=A0	unsigned char initial_state;
> =C2=A0	bool final_states[state_max_stall];
> diff --git a/kernel/trace/rv/monitors/stall/stall_trace.h
> b/kernel/trace/rv/monitors/stall/stall_trace.h
> index 6a7cc1b1d040..30896932a91c 100644
> --- a/kernel/trace/rv/monitors/stall/stall_trace.h
> +++ b/kernel/trace/rv/monitors/stall/stall_trace.h
> @@ -6,14 +6,14 @@
> =C2=A0
> =C2=A0#ifdef CONFIG_RV_MON_STALL
> =C2=A0DEFINE_EVENT(event_da_monitor_id, event_stall,
> -	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(int id, char *state, char *event, cha=
r *next_state,
> bool final_state),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(int id, const char *state, const char=
 *event, const
> char *next_state, bool final_state),
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(id, state, event, next_state, fin=
al_state));
> =C2=A0
> =C2=A0DEFINE_EVENT(error_da_monitor_id, error_stall,
> -	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(int id, char *state, char *event),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(int id, const char *state, const char=
 *event),
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(id, state, event));
> =C2=A0
> =C2=A0DEFINE_EVENT(error_env_da_monitor_id, error_env_stall,
> -	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(int id, char *state, char *event, cha=
r *env),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(int id, const char *state, const char=
 *event, const
> char *env),
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(id, state, event, env));
> =C2=A0#endif /* CONFIG_RV_MON_STALL */
> diff --git a/kernel/trace/rv/monitors/sts/sts.h
> b/kernel/trace/rv/monitors/sts/sts.h
> index 6f7b2d9d72e6..74397c37cb0e 100644
> --- a/kernel/trace/rv/monitors/sts/sts.h
> +++ b/kernel/trace/rv/monitors/sts/sts.h
> @@ -31,8 +31,8 @@ enum events_sts {
> =C2=A0};
> =C2=A0
> =C2=A0struct automaton_sts {
> -	char *state_names[state_max_sts];
> -	char *event_names[event_max_sts];
> +	const char *state_names[state_max_sts];
> +	const char *event_names[event_max_sts];
> =C2=A0	unsigned char function[state_max_sts][event_max_sts];
> =C2=A0	unsigned char initial_state;
> =C2=A0	bool final_states[state_max_sts];
> diff --git a/kernel/trace/rv/monitors/sts/sts_trace.h
> b/kernel/trace/rv/monitors/sts/sts_trace.h
> index d78beb58d5b3..61e8e414627d 100644
> --- a/kernel/trace/rv/monitors/sts/sts_trace.h
> +++ b/kernel/trace/rv/monitors/sts/sts_trace.h
> @@ -6,10 +6,10 @@
> =C2=A0
> =C2=A0#ifdef CONFIG_RV_MON_STS
> =C2=A0DEFINE_EVENT(event_da_monitor, event_sts,
> -	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(char *state, char *event, char *next_=
state, bool
> final_state),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(const char *state, const char *event,=
 const char
> *next_state, bool final_state),
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(state, event, next_state, final_s=
tate));
> =C2=A0
> =C2=A0DEFINE_EVENT(error_da_monitor, error_sts,
> -	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(char *state, char *event),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(const char *state, const char *event)=
,
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(state, event));
> =C2=A0#endif /* CONFIG_RV_MON_STS */
> diff --git a/kernel/trace/rv/monitors/wakeup/wakeup_trace.h
> b/kernel/trace/rv/monitors/wakeup/wakeup_trace.h
> index 7e056183f920..79bfaf91c912 100644
> --- a/kernel/trace/rv/monitors/wakeup/wakeup_trace.h
> +++ b/kernel/trace/rv/monitors/wakeup/wakeup_trace.h
> @@ -6,7 +6,7 @@
> =C2=A0
> =C2=A0#ifdef CONFIG_RV_MON_WAKEUP
> =C2=A0DEFINE_EVENT(event_ltl_monitor_id, event_wakeup,
> -	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(struct task_struct *task, char *state=
s, char *atoms,
> char *next),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(struct task_struct *task, const char =
*states, const
> char *atoms, const char *next),
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(task, states, atoms, next));
> =C2=A0DEFINE_EVENT(error_ltl_monitor_id, error_wakeup,
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(struct task_struct *task),
> diff --git a/kernel/trace/rv/monitors/wip/wip.h
> b/kernel/trace/rv/monitors/wip/wip.h
> index b4c3eea94c86..b65baeae5419 100644
> --- a/kernel/trace/rv/monitors/wip/wip.h
> +++ b/kernel/trace/rv/monitors/wip/wip.h
> @@ -23,8 +23,8 @@ enum events_wip {
> =C2=A0};
> =C2=A0
> =C2=A0struct automaton_wip {
> -	char *state_names[state_max_wip];
> -	char *event_names[event_max_wip];
> +	const char *state_names[state_max_wip];
> +	const char *event_names[event_max_wip];
> =C2=A0	unsigned char function[state_max_wip][event_max_wip];
> =C2=A0	unsigned char initial_state;
> =C2=A0	bool final_states[state_max_wip];
> diff --git a/kernel/trace/rv/monitors/wip/wip_trace.h
> b/kernel/trace/rv/monitors/wip/wip_trace.h
> index aa2162f47a4c..99cf368a4b03 100644
> --- a/kernel/trace/rv/monitors/wip/wip_trace.h
> +++ b/kernel/trace/rv/monitors/wip/wip_trace.h
> @@ -6,10 +6,10 @@
> =C2=A0
> =C2=A0#ifdef CONFIG_RV_MON_WIP
> =C2=A0DEFINE_EVENT(event_da_monitor, event_wip,
> -	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(char *state, char *event, char *next_=
state, bool
> final_state),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(const char *state, const char *event,=
 const char
> *next_state, bool final_state),
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(state, event, next_state, final_s=
tate));
> =C2=A0
> =C2=A0DEFINE_EVENT(error_da_monitor, error_wip,
> -	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(char *state, char *event),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(const char *state, const char *event)=
,
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(state, event));
> =C2=A0#endif /* CONFIG_RV_MON_WIP */
> diff --git a/kernel/trace/rv/monitors/wwnr/wwnr.h
> b/kernel/trace/rv/monitors/wwnr/wwnr.h
> index a28006512c9b..06d724ac1182 100644
> --- a/kernel/trace/rv/monitors/wwnr/wwnr.h
> +++ b/kernel/trace/rv/monitors/wwnr/wwnr.h
> @@ -23,8 +23,8 @@ enum events_wwnr {
> =C2=A0};
> =C2=A0
> =C2=A0struct automaton_wwnr {
> -	char *state_names[state_max_wwnr];
> -	char *event_names[event_max_wwnr];
> +	const char *state_names[state_max_wwnr];
> +	const char *event_names[event_max_wwnr];
> =C2=A0	unsigned char function[state_max_wwnr][event_max_wwnr];
> =C2=A0	unsigned char initial_state;
> =C2=A0	bool final_states[state_max_wwnr];
> diff --git a/kernel/trace/rv/monitors/wwnr/wwnr_trace.h
> b/kernel/trace/rv/monitors/wwnr/wwnr_trace.h
> index fc97ec7476ad..c36c8935dce5 100644
> --- a/kernel/trace/rv/monitors/wwnr/wwnr_trace.h
> +++ b/kernel/trace/rv/monitors/wwnr/wwnr_trace.h
> @@ -7,10 +7,10 @@
> =C2=A0#ifdef CONFIG_RV_MON_WWNR
> =C2=A0/* id is the pid of the task */
> =C2=A0DEFINE_EVENT(event_da_monitor_id, event_wwnr,
> -	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(int id, char *state, char *event, cha=
r *next_state,
> bool final_state),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(int id, const char *state, const char=
 *event, const
> char *next_state, bool final_state),
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(id, state, event, next_state, fin=
al_state));
> =C2=A0
> =C2=A0DEFINE_EVENT(error_da_monitor_id, error_wwnr,
> -	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(int id, char *state, char *event),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(int id, const char *state, const char=
 *event),
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(id, state, event));
> =C2=A0#endif /* CONFIG_RV_MON_WWNR */
> diff --git a/kernel/trace/rv/rv_monitors_test.c
> b/kernel/trace/rv/rv_monitors_test.c
> index 3ad11195e664..e70ae29da268 100644
> --- a/kernel/trace/rv/rv_monitors_test.c
> +++ b/kernel/trace/rv/rv_monitors_test.c
> @@ -21,7 +21,7 @@
> =C2=A0static struct rv_kunit_ctx *active_ctx;
> =C2=A0
> =C2=A0__printf(1, 0)
> -static void rv_kunit_mock_react(const char *msg, va_list args)
> +static void rv_kunit_mock_react(const const char *msg, va_list args)
> =C2=A0{
> =C2=A0	if (active_ctx)
> =C2=A0		++active_ctx->reactions;
> diff --git a/kernel/trace/rv/rv_reactors.c b/kernel/trace/rv/rv_reactors.=
c
> index 2f5fc8d18dea..538fd0d70fc7 100644
> --- a/kernel/trace/rv/rv_reactors.c
> +++ b/kernel/trace/rv/rv_reactors.c
> @@ -71,7 +71,7 @@
> =C2=A0 */
> =C2=A0static LIST_HEAD(rv_reactors_list);
> =C2=A0
> -static struct rv_reactor *get_reactor_rdef_by_name(char *name)
> +static struct rv_reactor *get_reactor_rdef_by_name(const char *name)
> =C2=A0{
> =C2=A0	struct rv_reactor *r;
> =C2=A0
> diff --git a/kernel/trace/rv/rv_trace.h b/kernel/trace/rv/rv_trace.h
> index 2f8a932432c9..a756c7d11755 100644
> --- a/kernel/trace/rv/rv_trace.h
> +++ b/kernel/trace/rv/rv_trace.h
> @@ -11,7 +11,7 @@
> =C2=A0#ifdef CONFIG_DA_MON_EVENTS_IMPLICIT
> =C2=A0DECLARE_EVENT_CLASS(event_da_monitor,
> =C2=A0
> -	TP_PROTO(char *state, char *event, char *next_state, bool
> final_state),
> +	TP_PROTO(const char *state, const char *event, const char
> *next_state, bool final_state),
> =C2=A0
> =C2=A0	TP_ARGS(state, event, next_state, final_state),
> =C2=A0
> @@ -38,7 +38,7 @@ DECLARE_EVENT_CLASS(event_da_monitor,
> =C2=A0
> =C2=A0DECLARE_EVENT_CLASS(error_da_monitor,
> =C2=A0
> -	TP_PROTO(char *state, char *event),
> +	TP_PROTO(const char *state, const char *event),
> =C2=A0
> =C2=A0	TP_ARGS(state, event),
> =C2=A0
> @@ -68,7 +68,7 @@ DECLARE_EVENT_CLASS(error_da_monitor,
> =C2=A0/* For simplicity this class is marked as DA although relevant only=
 for HA */
> =C2=A0DECLARE_EVENT_CLASS(error_env_da_monitor,
> =C2=A0
> -	TP_PROTO(char *state, char *event, char *env),
> +	TP_PROTO(const char *state, const char *event, const char *env),
> =C2=A0
> =C2=A0	TP_ARGS(state, event, env),
> =C2=A0
> @@ -100,7 +100,7 @@ DECLARE_EVENT_CLASS(error_env_da_monitor,
> =C2=A0#ifdef CONFIG_DA_MON_EVENTS_ID
> =C2=A0DECLARE_EVENT_CLASS(event_da_monitor_id,
> =C2=A0
> -	TP_PROTO(int id, char *state, char *event, char *next_state, bool
> final_state),
> +	TP_PROTO(int id, const char *state, const char *event, const char
> *next_state, bool final_state),
> =C2=A0
> =C2=A0	TP_ARGS(id, state, event, next_state, final_state),
> =C2=A0
> @@ -130,7 +130,7 @@ DECLARE_EVENT_CLASS(event_da_monitor_id,
> =C2=A0
> =C2=A0DECLARE_EVENT_CLASS(error_da_monitor_id,
> =C2=A0
> -	TP_PROTO(int id, char *state, char *event),
> +	TP_PROTO(int id, const char *state, const char *event),
> =C2=A0
> =C2=A0	TP_ARGS(id, state, event),
> =C2=A0
> @@ -162,7 +162,7 @@ DECLARE_EVENT_CLASS(error_da_monitor_id,
> =C2=A0/* For simplicity this class is marked as DA although relevant only=
 for HA */
> =C2=A0DECLARE_EVENT_CLASS(error_env_da_monitor_id,
> =C2=A0
> -	TP_PROTO(int id, char *state, char *event, char *env),
> +	TP_PROTO(int id, const char *state, const char *event, const char
> *env),
> =C2=A0
> =C2=A0	TP_ARGS(id, state, event, env),
> =C2=A0
> @@ -197,7 +197,7 @@ DECLARE_EVENT_CLASS(error_env_da_monitor_id,
> =C2=A0#ifdef CONFIG_LTL_MON_EVENTS_ID
> =C2=A0DECLARE_EVENT_CLASS(event_ltl_monitor_id,
> =C2=A0
> -	TP_PROTO(struct task_struct *task, char *states, char *atoms, char
> *next),
> +	TP_PROTO(struct task_struct *task, const char *states, const char
> *atoms, const char *next),
> =C2=A0
> =C2=A0	TP_ARGS(task, states, atoms, next),
> =C2=A0
> @@ -249,7 +249,7 @@ DECLARE_EVENT_CLASS(error_ltl_monitor_id,
> =C2=A0/* Tracepoint useful for monitors development, currenly only used i=
n DA */
> =C2=A0TRACE_EVENT(rv_retries_error,
> =C2=A0
> -	TP_PROTO(char *name, char *event),
> +	TP_PROTO(const char *name, const char *event),
> =C2=A0
> =C2=A0	TP_ARGS(name, event),
> =C2=A0

