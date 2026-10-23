Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792771539;
	b=X6SAICXpAoY4oWtQqvEahoYIcRot3zvsguJPq2XVFLGfgLr1O1GHixPVqlQg+GsAtrVZ
	 l9roZOstP8eY9R/Zt3VpHI86eRDM+xerqmvLXxJ7c3MVj+J7phs3KaJxnjnGEZ/M5hiJ4
	 C2R3QmdfG/JmmpHwjPgz7w3w4w5qYsAJUfRW0bH2KuQmoUQm/RXK24ncguZpf+Wvd0ft4
	 Wm81NpCvZJn9KgeEsrmxjHbksLgLp+KUAjoExJ8lHa6GYBTBamtcRTixsxmbhX2SP24GG
	 D+g422yS2djsTXSOHMoYq/Xaigv4tEPGMs7SDr2nBcAe6moePsaK0EVtpA+AUHDLIvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792771539;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=K14cnwecKDZXuHS20WMKxtkA3ZjcXzFbG9A0UfcDyZs=;
	b=EOkIlGOvxYVtU7FIAeo8Dnsa+80qnwAp6FikJUaWzMLX6TjC3Qoy3AvzmB36G4QzV8lI
	 W47hRQOWJAnr2+XBWUHCS4rPcrMfK9qE3bRN+QnJR2LtgRgLGvKSWrsJznrhYwRKTWQ/V
	 GGrlj5oG7CsStc53h1LQfvz34SBEnYA7OxGIeir0Kqn6vyaNYAA/FxXpvragjVbdcmkcv
	 Z0xBfEQjaFDgBex9bC775V4mpR91ZX9uSYeYXJkUkMG5mO4Th5wrbilRhHy0KYofoeoo0
	 xqsZGwtGFUqSiEB832vPbtWa/7FC7Oo8YkjchIQeeMfrNvdNH0K9JB6d6WYEG0brVBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TIaEpein;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=B6mwEf9S;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D05606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:05:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12D05606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TIaEpein;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=B6mwEf9S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792771537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=K14cnwecKDZXuHS20WMKxtkA3ZjcXzFbG9A0UfcDyZs=;
	b=TIaEpeinT0hkuxLwg+T/x0Y5B8WHRx4Ch+UbmG6Wj6fBM0BFhML5LSN1rsY2ZbUYkBjis2
	35r+XOkF6RZ62de2RXVef7jxbTJokuh0ep8B68WfHML9KdYfekfrJU5Q1S5KnnlO8K7Tch
	0QbR8R8xxh4YTjB00xP1XPcszHqCXbU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-KOLM_HY5NLG6k4CBivVvPA-1; Fri, 23 Oct 2026 12:05:35 -0400
X-MC-Unique: KOLM_HY5NLG6k4CBivVvPA-1
X-Mimecast-MFC-AGG-ID: KOLM_HY5NLG6k4CBivVvPA_1792771534
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a2063be141so9043435e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792771534; x=1793376334; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K14cnwecKDZXuHS20WMKxtkA3ZjcXzFbG9A0UfcDyZs=;
        b=B6mwEf9Sv/GsYuUxUhKr5HORLIhg7DRspoRFfOdxlKZtuGuALuweq2DqRPmAvR9oFo
         cLUPkoINhN7W+RyX0rCfBqmtV561EAvMAuZ+qcbSVyiSe+CQ2tHsbpzsyUFcgzGFTtLL
         KTLxfJfLjdU1Hzb9HeSZYWkYGFaS384eDxlscaVwCh+ds3lw2UrJ63BJqbiFaSobIVPj
         nDhuR3afELdvf1qkDp0R4i1WxgSk1HTxef5AVI/TvDRJxJWM80jQgIExv0OhU45Iup1K
         9Cdo4W7bxF8PE52b7vNnETZrtwoRum6QWpMRsqEp25wE4AIv2oCfeKYl5nkD+m3Z+xmu
         gqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792771534; x=1793376334;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K14cnwecKDZXuHS20WMKxtkA3ZjcXzFbG9A0UfcDyZs=;
        b=DoPKqtN+79tU9zV0FfQ1rNO5ixAK0+pDuLGCEc0z7uLpPHxFwG+hWavocKaqHQJjSh
         mTFgXIpZGTDe/mX33F4N6cs8yUA2F/Xg5ajzJnRCpIkw/LxubtPH01LoaDRkLuZFyHwj
         JHMudUFKJNU1+8GQF0yWww/FE8a4YnVIcpvAfw6ZJIi2P2yoezh65Ge5DNrtjMJSULIF
         N2kxCnvA0Rf84ZbHIkOpQLb+4sZYL6td4cODS+DwpsFRbzpEPi2d3C1am9DnTAAEjcwJ
         FcYpDuZse3EKE9lu83XpvxAdSkh0XCymygOV3mwYXlsewSdm2CQRpb0Km02ib6U5V4nU
         Pffg==
X-Forwarded-Encrypted: i=1; AKwUvBwPl05baaFD6P4Zw88WFXqLUsJ1xH4gGYaAgHISpYF5KYEhC6rbH/rK4xSPqAr2GksROMqBNRTPbX3y0Uw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEGBMJAXVP+r9eMZU483Vt3846eVdazdV0GKDoiwpF28i5h/Zr
	QxCLWAvfH68ySDOtQ0CMv30Ledt5fEyWzi3+CCXy64PjpsFZ+T83+/d963P7YjJ59l8AcZE6SG7
	gUk6XYKRl6g1IH+Ya76IMpUWBM54UlBN8HN+OmEF+5SRh4pLQjHsVouZddKRTJg+Z9w==
X-Gm-Gg: AYBFou1ZRujzOLhi9OerVHeTMEMo0855oM2HowZsQyrAMfKWNaPPJbLx1s6udTjgrXj
	G6Lq0rP1LrSH5OFPm0sUaFJdQlCOM5L5rEyGllWaTs7IqqUBCF8doXIknNqaZAlBO7iuNAyarw2
	qmGhGeYGYdFPaH50Y3Yw5Z/nY/ufTNWtmF9QUPVl3ICC1ZZqhw+o/A9d8sAzKLSH4dul5PR1RLs
	plu/BtVpV5M+SB23O3UxAe9eJCOQhy9ZAes+OF9Z82/d6fAp64XhSj+qJvzSGej2RinO4NVXwVx
	QKb5/b3Sq+0P/CLeA++G7lqJIjPb+OSSVVqT12N0Dx1wgEOp2rQFYy7wCH2etXtRw6D/wM7fd8l
	DHOEPiQzJSPDR7ymoarfsl/crp1bl
X-Received: by 2002:a05:600c:3514:b0:49d:1fa8:b266 with SMTP id 5b1f17b1804b1-4a211ed7602mr43987755e9.26.1792771534003;
        Fri, 23 Oct 2026 09:05:34 -0700 (PDT)
X-Received: by 2002:a05:600c:3514:b0:49d:1fa8:b266 with SMTP id 5b1f17b1804b1-4a211ed7602mr43987145e9.26.1792771533585;
        Fri, 23 Oct 2026 09:05:33 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.133.173])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a312ea914esm4004515e9.2.2026.10.23.09.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 09:05:32 -0700 (PDT)
Message-ID: <5b3ff014bf2f571b935f9519f422966a1c665c32.camel@redhat.com>
Subject: Re: [RFC PATCH 0/9] rv: Verify generic IRQ context transitions
From: Gabriele Monaco <gmonaco@redhat.com>
To: Karl Mehltretter <kmehltretter@gmail.com>, Steven Rostedt
	 <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers	
 <mathieu.desnoyers@efficios.com>, Thomas Gleixner <tglx@kernel.org>, 
 Sebastian Andrzej Siewior	 <bigeasy@linutronix.de>, Clark Williams
 <clrkwllms@kernel.org>, Ingo Molnar	 <mingo@redhat.com>, Peter Zijlstra
 <peterz@infradead.org>, Andy Lutomirski	 <luto@kernel.org>, Juri Lelli
 <juri.lelli@redhat.com>, Vincent Guittot	 <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,  Ben Segall
 <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider
 <vschneid@redhat.com>,  K Prateek Nayak <kprateek.nayak@amd.com>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,  Randy
 Dunlap <rdunlap@infradead.org>, linux-trace-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev, 	linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Fri, 23 Oct 2026 18:05:30 +0200
In-Reply-To: <20261022050712.75035-1-kmehltretter@gmail.com>
References: <20261022050712.75035-1-kmehltretter@gmail.com>
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

On Thu, 2026-10-22 at 07:07 +0200, Karl Mehltretter wrote:
> IRQ action tracepoints describe handlers, but not the lifetime of the
> enclosing IRQ context. One context may run several actions, and an action
> may be dispatched outside hardirq context. PREEMPT_RT may also enter
> serving-softirq state without invoking an action. This leaves no generic
> event stream from which an RV monitor can check IRQ-context transitions.
>=20
> This RFC adds events at the generic hardirq and serving-softirq
> boundaries. The irqstate RV monitor checks their order and agreement with
> live kernel state. irqexit follows the owner of a preempt_schedule_irq()
> invocation across task switches and CPU migration.
>=20
> The hardirq events cover paths through irq_enter() or irq_enter_rcu() and
> their matching exits. They do not cover direct __irq_enter() and
> __irq_exit() users, raw paths, or architecture-specific entry and return
> intervals. irqexit covers preempt_schedule_irq(), not the complete
> interrupt-return path.
>=20
> Boundary callbacks can raise softirq work after the pending-work check.
> The series wakes ksoftirqd or ktimerd for remaining work. KUnit covers
> nesting, monitor synchronization, PREEMPT_RT worker intervals, provenance
> and late-work handoff.

Hi Karl,

thanks for your contribution!
I'm probably not going to have much time to look at this soon as I have a f=
ew
holidays planned and other series to review first. But it looks interesting=
.

What points my eyes is that you didn't include any schematic graph in the
documentation.
Some folks don't like RST, but I find having a textual representation of th=
e
model there easy to understand what you're trying to do without having to b=
uild
the models.
We use graph-easy for that (and adapt things if the model is too complex).

Do not send a V2 just for this, but please keep that in mind for next time.

Thanks,
Gabriele

>=20
> Cross-architecture RV KUnit testing also exposed an Arm-specific opid bug=
:
>=20
> =C2=A0 https://lore.kernel.org/r/20261020035158.90190-1-kmehltretter@gmai=
l.com
>=20
> I would especially appreciate feedback on:
>=20
> =C2=A0 1. Should the context boundaries be trace events or private RV
> =C2=A0=C2=A0=C2=A0=C2=A0 instrumentation?
> =C2=A0 2. Are dedicated scheduler events the right way to follow
> =C2=A0=C2=A0=C2=A0=C2=A0 preempt_schedule_irq() across task switches and =
migration?
> =C2=A0 3. Should irqstate and irqexit remain separate monitors?
> =C2=A0 4. Is the KUnit-only hook for an empty ksoftirqd invocation accept=
able?
> =C2=A0=C2=A0=C2=A0=C2=A0 Outside a KUnit run, its worker checks take a di=
sabled static-key
> =C2=A0=C2=A0=C2=A0=C2=A0 path.
>=20
> Patches 1-5 add the events, monitors, and documentation. Patches 6-9 add
> KUnit coverage.
>=20
> This series is based on v7.3 (c03c1a14507d) and depends on the following
> accepted change, which is not included:
>=20
> =C2=A0 softirq: Preserve interrupt context on return from interrupt
> =C2=A0 https://lore.kernel.org/r/20261011060742.30584-1-kmehltretter@gmai=
l.com
>=20
> A pre-existing issue can make rv_test_dummy intermittently report a
> false-positive invalid-wait-context warning under lockdep. Wen Yang has
> posted a fix:
>=20
> =C2=A0
> https://lore.kernel.org/lkml/5586dd00789a0f904cc299cd8889744b8c6f8dc9.178=
9412799.git.wen.yang@linux.dev/
>=20
> This series does not include that fix.
>=20
> Karl Mehltretter (9):
> =C2=A0 tracing/irq: Add generic IRQ context boundary events
> =C2=A0 tracing/sched: Add IRQ preemption lifecycle events
> =C2=A0 rv: Add a monitor for generic IRQ context transitions
> =C2=A0 rv: Add a monitor for IRQ-exit scheduling ownership
> =C2=A0 docs/rv: Document the IRQ-entry monitors
> =C2=A0 rv: Add KUnit coverage for IRQ context transitions
> =C2=A0 rv: Add KUnit coverage for IRQ-exit scheduling
> =C2=A0 rv: Test empty PREEMPT_RT softirq worker intervals
> =C2=A0 rv: Test IRQ-exit softirq provenance and handoff
>=20
> =C2=A0Documentation/trace/rv/index.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> =C2=A0Documentation/trace/rv/monitor_irqentry.rst=C2=A0=C2=A0 |=C2=A0 398=
 ++++
> =C2=A0include/linux/interrupt.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0=C2=A0 7 +
> =C2=A0include/rv/kunit.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 34 +-
> =C2=A0include/trace/events/irq.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 70 +
> =C2=A0include/trace/events/sched.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 51 +
> =C2=A0kernel/sched/core.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 6 +
> =C2=A0kernel/softirq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 308 ++-
> =C2=A0kernel/trace/rv/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 5 +
> =C2=A0kernel/trace/rv/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 3 +
> =C2=A0kernel/trace/rv/monitors/irqentry/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 13 +
> =C2=A0kernel/trace/rv/monitors/irqentry/irqentry.c=C2=A0 |=C2=A0=C2=A0 35=
 +
> =C2=A0kernel/trace/rv/monitors/irqentry/irqentry.h=C2=A0 |=C2=A0=C2=A0=C2=
=A0 3 +
> =C2=A0kernel/trace/rv/monitors/irqexit/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 14 +
> =C2=A0kernel/trace/rv/monitors/irqexit/irqexit.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 172 ++
> =C2=A0kernel/trace/rv/monitors/irqexit/irqexit.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 85 +
> =C2=A0.../trace/rv/monitors/irqexit/irqexit_kunit.c |=C2=A0 537 +++++
> =C2=A0.../trace/rv/monitors/irqexit/irqexit_kunit.h |=C2=A0=C2=A0 21 +
> =C2=A0.../trace/rv/monitors/irqexit/irqexit_trace.h |=C2=A0=C2=A0 19 +
> =C2=A0kernel/trace/rv/monitors/irqstate/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 14 +
> =C2=A0kernel/trace/rv/monitors/irqstate/irqstate.c=C2=A0 |=C2=A0 289 +++
> =C2=A0kernel/trace/rv/monitors/irqstate/irqstate.h=C2=A0 |=C2=A0 139 ++
> =C2=A0.../rv/monitors/irqstate/irqstate_kunit.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
 2062 +++++++++++++++++
> =C2=A0.../rv/monitors/irqstate/irqstate_kunit.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 25 +
> =C2=A0.../rv/monitors/irqstate/irqstate_trace.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 15 +
> =C2=A0kernel/trace/rv/rv_monitors_test.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 29 +
> =C2=A0kernel/trace/rv/rv_trace.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0=C2=A0 2 +
> =C2=A0.../verification/models/irqentry/irqexit.dot=C2=A0 |=C2=A0=C2=A0 21=
 +
> =C2=A0.../verification/models/irqentry/irqstate.dot |=C2=A0=C2=A0 32 +
> =C2=A029 files changed, 4397 insertions(+), 13 deletions(-)
> =C2=A0create mode 100644 Documentation/trace/rv/monitor_irqentry.rst
> =C2=A0create mode 100644 kernel/trace/rv/monitors/irqentry/Kconfig
> =C2=A0create mode 100644 kernel/trace/rv/monitors/irqentry/irqentry.c
> =C2=A0create mode 100644 kernel/trace/rv/monitors/irqentry/irqentry.h
> =C2=A0create mode 100644 kernel/trace/rv/monitors/irqexit/Kconfig
> =C2=A0create mode 100644 kernel/trace/rv/monitors/irqexit/irqexit.c
> =C2=A0create mode 100644 kernel/trace/rv/monitors/irqexit/irqexit.h
> =C2=A0create mode 100644 kernel/trace/rv/monitors/irqexit/irqexit_kunit.c
> =C2=A0create mode 100644 kernel/trace/rv/monitors/irqexit/irqexit_kunit.h
> =C2=A0create mode 100644 kernel/trace/rv/monitors/irqexit/irqexit_trace.h
> =C2=A0create mode 100644 kernel/trace/rv/monitors/irqstate/Kconfig
> =C2=A0create mode 100644 kernel/trace/rv/monitors/irqstate/irqstate.c
> =C2=A0create mode 100644 kernel/trace/rv/monitors/irqstate/irqstate.h
> =C2=A0create mode 100644 kernel/trace/rv/monitors/irqstate/irqstate_kunit=
.c
> =C2=A0create mode 100644 kernel/trace/rv/monitors/irqstate/irqstate_kunit=
.h
> =C2=A0create mode 100644 kernel/trace/rv/monitors/irqstate/irqstate_trace=
.h
> =C2=A0create mode 100644 tools/verification/models/irqentry/irqexit.dot
> =C2=A0create mode 100644 tools/verification/models/irqentry/irqstate.dot
>=20
> base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
> prerequisite-patch-id: 6ac7167f0aa7c5319dac78bf5b06a989fd7dfac5

