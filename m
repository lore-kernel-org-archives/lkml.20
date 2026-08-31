Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0583DB620
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169734; cv=none; b=gt/VsY2m7XecmNH2AIgLBz/NnLfe3489gTLaICWk0EDlHQHrlRycqMu0IENnILGSib//1OnKFmFLya1i76UnUilAbj5PchYcA2MtQE0hkRzoimjRpzPOBD7YjGp+Mwk8ekyd9GUVrp42ZSRPssIVcIXqoplyq93R27yLmzPZZfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169734; c=relaxed/simple;
	bh=dii1q0DO9S4XCA5tquc5LzLiQnMsV0u1WIBKR9IfcG8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uiR5ctCtX0I+LIud48L6AQoLfotGuH8GyqghwGC8CO/Db75wofvexJ9E3zeoXlKfxIZXJviBSHBqWDDGigrX2ghDokSmwYqqwx/aY4OOQyANMbBDErjscr5Y5trxCNIJgbQgNcq4rvZkiMNXqGBT3+ELvnS+OdC8mFnrIcftXIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CmpVN3Od; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=JL0lWii6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CmpVN3Od";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="JL0lWii6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788169731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Hri4pxqYPzTEc6ZBZYkjRuO0ivhZyic4cgUNvU7rE+A=;
	b=CmpVN3Od9SEe3pzs2Byvgdgf+mul69SlSP2wpAo7QAGQ85ba0Waai3dtI3IvHAhi5hNrVx
	PMFq6nGq3XP3/gpZFD/f3b9frJC0e2ENdG+ppZduoRv/Y2ez8Ji86qc9QwmaX5lNAey9In
	y+bMIJ7pqvQnFqfUjjjUyo0DMfg5pFk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-_iafl8bhOIugeV8JNW4jgg-1; Mon, 31 Aug 2026 05:48:50 -0400
X-MC-Unique: _iafl8bhOIugeV8JNW4jgg-1
X-Mimecast-MFC-AGG-ID: _iafl8bhOIugeV8JNW4jgg_1788169729
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c252634bc4dso302715766b.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788169729; x=1788774529; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hri4pxqYPzTEc6ZBZYkjRuO0ivhZyic4cgUNvU7rE+A=;
        b=JL0lWii65rtghXYYOVB9M0bxdSw/QdxuYk5VYVDwYZwBYnColQ5Cz95WJ4i5SXTUNa
         bnONw8gnrL0AOXlIOq8QjK7evTYyHMSLt9ED0S3/nFCGBeB4uAKbxmAaqXmcpQcA4dPY
         0vR8C7yHrb0I/gIFHFkwCIpuLgZltKwPTbfvqAA3kzrd7kQ0R70zFPDUEQvz7GrrUmvW
         DNj9/4UsMtVxCDP+OWBGuc7e0VClqBs6YKIHl6/Bsa7NUP9JlyTGOkJy15UmfCcFljGq
         jONKAm2AGpsHb/Wdrvk9vNmUIz8VSN+JeHnz8/DCslWtaM6hTYK2yxMR6/jZ4k3kvyvU
         A5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788169729; x=1788774529;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Hri4pxqYPzTEc6ZBZYkjRuO0ivhZyic4cgUNvU7rE+A=;
        b=XAEecU5auq194oS0TFoCC5qmiBAZNRo2n1yGrQ+AnlvBmr2FQlknErtF/vj/CuhmhE
         j/aqqZZ1f66BGV+si70pKh5L9t/cn65qt0yGA9BF1KhK1pCzg88BIXa1HOrCOurmLf7p
         rH9MZZHyTzuXVEaN4ae9BIulJ4F18UJKzB/Tvnj90goYA7UZuEh+tnF/z3O+k8HkyVe0
         LhPaNNwgg9m6SfWctK0NvpsdaVCJceBH0OCPGWKUm5P0nSCEdVdANAYTMCdgVTb8aklu
         YgST0RQFMpJLPQqDhK22nB0bZ39ND3p36ql77Ay6ALlbwAYV6yPyKNWTpgZwmqDIfoW6
         3duw==
X-Forwarded-Encrypted: i=1; AHgh+RqJgYrdgjJPgF9g/Mggo4RMs9zHnT8fs6b7a1jiQwL7btJ+PWcpQVseTaDM2oC4+vpfk0gu0J+OkaRnpLQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lgoYHvI60yqBPw1neNE3msZOYxPW5ezLWmYzxbaWgXEg7SVi06
	FPTDbWGCtw0UvJWzIHVod7jLs+WDrd6R0vicWqrbj1kIrfJt5pdkaDeGvyD70/Syj1NbWYYXZBu
	vbF761dfjumLlhB5DruqZ/1QvfhBn/pUKigxEHfHBKcNJdT9+Hd14vRUlv5JowwGh72M8V1R4bV
	6c
X-Gm-Gg: AR+sD121356qHCf3Kb07rXL1XXVIHEjSh0mdvVu0mohXmddi0AITKHwOjtYoVUuQh62
	/CaWPv1ZNXNiliEoTw1VZ3fa1gQv0765hMEIt/tDVyeqLCPvda4OadxIo1fDHqAw683y+6Qyn9b
	fSGjVnBaszYCwrd3waej6cqqKQbKoh1eyCycX+8Bfj+fsJ8eV7zWsUiyHU/P0nfrVz0xycC5htu
	HMFOP1ybsZPENEpNAw7pU6ULghfCqvK4AZrOyH9aGBfu0MvWMJdDlmoaPIOxEjvZ0uZWZPhGj1m
	CjZzF6ymRFeve+noquU/gCaSgNAGUVykvH5nylkuQo+rMuW4le5jGnabDdPmjtu8vCJoWMX3s73
	grT3Mnf5TpRsqGvhIISz8x8TllxlCrxpWcYymYpX/s/iYJrPh0bzIMvbHgwd9UUxmHxuvzw==
X-Received: by 2002:a17:907:72c6:b0:c16:12ff:dc93 with SMTP id a640c23a62f3a-c25ab4b52f2mr133980866b.18.1788169728748;
        Mon, 31 Aug 2026 02:48:48 -0700 (PDT)
X-Received: by 2002:a17:907:72c6:b0:c16:12ff:dc93 with SMTP id a640c23a62f3a-c25ab4b52f2mr133978766b.18.1788169728339;
        Mon, 31 Aug 2026 02:48:48 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb (212-8-243-115.hosted-by-worldstream.net. [212.8.243.115])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25ab254f49sm45172766b.10.2026.08.31.02.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:48:47 -0700 (PDT)
Message-ID: <e8a8de3683db55822595af75df6c56b263047962.camel@redhat.com>
Subject: Re: [PATCH v4 1/4] rv/reactors: use LD_WAIT_SPIN as the reactor
 lockdep wait type
From: Gabriele Monaco <gmonaco@redhat.com>
To: wen.yang@linux.dev
Cc: Nam Cao <namcao@linutronix.de>, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thomas =?ISO-8859-1?Q?Wei=DFschuh?=
	 <thomas.weissschuh@linutronix.de>
Date: Mon, 31 Aug 2026 11:48:46 +0200
In-Reply-To: <7bfe97bd497a2641de36b35e17f69e6f3f291c2a.1787854397.git.wen.yang@linux.dev>
References: <cover.1787854397.git.wen.yang@linux.dev>
	 <7bfe97bd497a2641de36b35e17f69e6f3f291c2a.1787854397.git.wen.yang@linux.dev>
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

On Fri, 2026-08-28 at 02:22 +0800, wen.yang@linux.dev wrote:
> From: Wen Yang <wen.yang@linux.dev>
>=20
> diff --git a/Documentation/trace/rv/monitor_synthesis.rst
> b/Documentation/trace/rv/monitor_synthesis.rst
> index 2c1b5a0ae154..aab4b0342d5f 100644
> --- a/Documentation/trace/rv/monitor_synthesis.rst
> +++ b/Documentation/trace/rv/monitor_synthesis.rst
> @@ -365,6 +365,26 @@ but higher overhead. The timer wheel (``HA_TIMER_WHE=
EL``)
> is a good alternative
> =C2=A0for monitors with several instances (e.g. per-task) that achieves l=
ower
> =C2=A0overhead with increased latency, yet without compromising precision=
.
> =C2=A0
> +Reactors
> +--------
> +
> +A reactor is a callback triggered by a monitor when a violation is
> +detected. Reactors are registered via ``/sys/kernel/tracing/rv/reactors/=
``
> +and enabled per monitor.

This is not correct, they stay in
/sys/kernel/tracing/rv/monitors/MONITOR/reactors and it is already explaine=
d in
Documentation/trace/rv/runtime-verification.rst .

You don't need to add any further section here (you're more than welcome to
update the existing one obviously, but not as part of this patch/series).

monitor_synthesis.rst is not about reactors.
At the moment we don't really have a good spot under Documentation to descr=
ibe
the /implementation/ of reactors.

I'd say for the purpose of this patch, in-code documentation (i.e. a commen=
t) is
sufficient, we can revise this later if needed.

> +
> +Reactor Locking Rules
> ++++++++++++++++++++++
> +
> +A reactor callback may be invoked from various contexts (process,
> +softirq, hardirq, NMI) depending on the tracepoint to which its
> +monitor is attached.
> +
> +Lockdep uses a fixed wait type: ``LD_WAIT_SPIN``. This allows
> +``raw_spinlock_t`` but disallows sleepable locks. ``LD_WAIT_FREE`` is
> +not viable in preemptible contexts because scheduler preemption takes
> +``rq->__lock`` (``LD_WAIT_SPIN``), which would cause false-positive
> +warnings.
> +

The code looks fine but this documentation is missing the point. We don't n=
eed
to explain what lockdep does but why we use a specific class and what we
actually wanted to use. Let's readapt the comment you added in v3

	/*
	 * Reactors must not explicitly take locks, so they should be
	 * LD_WAIT_FREE.  However, reactor callbacks can run with preemption
	 * enabled, meaning the preempting code (e.g. the scheduler taking
	 * rq->__lock at LD_WAIT_SPIN) may violate that constraint.  Use
	 * LD_WAIT_SPIN to avoid false-positive lockdep reports.
         * But you should still NOT be using locks in reactors.
	 */

> =C2=A0Final remarks
> =C2=A0-------------
> =C2=A0
> diff --git a/kernel/trace/rv/rv_reactors.c b/kernel/trace/rv/rv_reactors.=
c
> index 2f5fc8d18dea..afc97d097109 100644
> --- a/kernel/trace/rv/rv_reactors.c
> +++ b/kernel/trace/rv/rv_reactors.c
> @@ -465,7 +465,11 @@ int init_rv_reactors(struct dentry *root_dir)
> =C2=A0
> =C2=A0void rv_react(struct rv_monitor *monitor, const char *msg, ...)
> =C2=A0{
> -	static DEFINE_WAIT_OVERRIDE_MAP(rv_react_map, LD_WAIT_FREE);
> +	/*
> +	 * Use LD_WAIT_SPIN uniformly for deterministic lockdep checking.
> +	 * See Documentation/trace/rv/runtime-verification.rst.
> +	 */

See above, I would only add an explicit comment here of /why/ we do LD_WAIT=
_SPIN
although we would like LD_WAIT_FREE.

Thanks,
Gabriele

> +	static DEFINE_WAIT_OVERRIDE_MAP(rv_react_map, LD_WAIT_SPIN);
> =C2=A0	va_list args;
> =C2=A0
> =C2=A0	if (!rv_reacting_on() || !monitor->react)

