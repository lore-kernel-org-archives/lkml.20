Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794391681;
	b=z2jONdGHWTvqKGKkuBRK11w9Sdw9U1mnIMtOBPGd9H3UtUHXMIHtqXq2pTzjP7emeIui
	 qamni1xGFd20pbdxCAXijR86eCVvPuAn7o1rfImIW7ts48mkS2tBsMYVTal+u39mn/Gsr
	 iD0CWwnMi0uppIdVHjl5esbPF3vLFZLkDLDyKcrg9e/WGsufOU08VV9Pn/ZnrSRheHwPt
	 gdGiV1F3B1QCDpsyqKtsK0YVvqMVysGiEFliwXbQdUMOHx4sk3uLbgSfNijmll68BCJiJ
	 bHNnSo3Z2q/t68fxUEiEh8j4t5tH34SNafQDJ3j1kP6DRfL4QqmW8cunn4T9nl0sHIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391681;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Subject:From:To:Cc:X-Mailer:References:
	 In-Reply-To;
	bh=U2QslJdyqbbBi70Vdlv8vhoVpPyWnxyHh1LLlAt8m4Y=;
	b=4CJ/7ftuJMKon4V17AwTguid/JiK9mnd0ZEY/jqNR8ZCVY7TW0g3IAtO8ofKjyu6TT7n
	 XxxdIdeF78ICvUCFeIucWNzvTeGFdfctzc0/uGDwHM+b8BjCFjw0eZvygJk8Jqz9Sn+/q
	 1NaTNVbCm4mgNoTyhCSxtB/CzEcESkXQGftVMPikEdUucju1nnqTD6qCKtJ0W0heDyn13
	 3680Unpf2CAXjon2lFY8qNaaaj7uKzsp8DeSEZaGKmQFY6wOXMKbBc2/vl33ygk65/Jxg
	 RM7BViPyFbOQkwQJgAWy5zgQ7/N9kXnSTNBC+Iinpa3cvbON6aqOYjZtYQcWpmPmQwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I1UdCEC6;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KQl5sgAk;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A072606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A072606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I1UdCEC6;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KQl5sgAk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794391677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U2QslJdyqbbBi70Vdlv8vhoVpPyWnxyHh1LLlAt8m4Y=;
	b=I1UdCEC6gIb/mhGIbCZIt9BvkcegjCOS4CoAFx4LflOyJcLkenV417Y9RbMCcRSauTHl4g
	oer1muZ1IwavZz98Of4EgqYD0NGgptYku180GHuP9B2zi1guyyIytYk/Ttx0bL5uWYZxnB
	zzGacoZTpfUiX2yRDbZS4iY2IfxXPQk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-e5hCxsGTNSGgmtATwk6eAA-1; Wed, 11 Nov 2026 05:07:49 -0500
X-MC-Unique: e5hCxsGTNSGgmtATwk6eAA-1
X-Mimecast-MFC-AGG-ID: e5hCxsGTNSGgmtATwk6eAA_1794391666
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4931c89d228so2031237f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794391666; x=1794996466; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U2QslJdyqbbBi70Vdlv8vhoVpPyWnxyHh1LLlAt8m4Y=;
        b=KQl5sgAk1Nuvjpl4EBiNuumkYz1dVNqIZB2GK7l0WL/ka3U6vzqHsGQjv9192vaJMu
         CxPg3+6/+zzQQOo14L0HfYq9dUNVdeF3MX1bheYqDMT+stoyXJxKXH0kFEOU/dCNp/e6
         VRAkaSDZaiOIH74w2S8QEgJFZas7ppkvcJ1RzZEghYN2S8cRxWbfDGH9coH/+PnVIShJ
         qshDcPQU8i2IA0J+37HkgI91wA45gL8uglsFoKzI3vxj5klVB1RjR8ckmEf4QWduprGl
         JHyUdYNGO8ndCX//MzizrdecrBTApn1i6oHhNqEgVc6nEVSladZXnQDQVxrfRpQFj358
         BwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794391666; x=1794996466;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U2QslJdyqbbBi70Vdlv8vhoVpPyWnxyHh1LLlAt8m4Y=;
        b=n7XYoI3tkqwTM2uId97qNKrcf9UhDVu3I8j54bPqiFi7G9H4rWxFZ2u5GXG/DafNJX
         5GDOhRq8dvdffqAn9BEVhftr6SwRZK4kxpQhwirkGK98wArRjXp7n1WUUHbexp2E/chF
         rOKuxL4rJGIwXtjoHOyt43I0bU7fSSM9JBe/oZ+3r5mWeYtzBpR6VCEuegAI5KJxmAIO
         HECXm/XIgeuIaHrpgSeMZ2SJvtW8SQXuR6PcBV1CqcKBNJt3+70Pp8S2cAUYfdmI7n7b
         txU+kraY41Pv7wAB6pUikeetd7a/QJAwlC6ahzLwNeB80DpiPc7vOAdATF2zRUYR5rkf
         fQvw==
X-Forwarded-Encrypted: i=1; AL+hErEBJY5Y8Lwcyh6H52ChfSzv/4iDz+dZvppcjigEf5XBIyw0/M1C/eiACLiKKAFxD0aKWfuHI1V7OiEOXho=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UzMkT0/jjGoksuLsdki19YFROJ4ERy3F7IdsUGcvEPS7QjzUb
	cE1GUvWHUYj/f7LjWX/lXGEMM9m03K7a/hMewv9AR1uQc4Xl9GfibQdSTqso5LNvofOrtZTIlf1
	VPb0h0FJsRDx7fHwVH17XqVA1DjpBKbKzNg8XMJ+Av2UwA6o894eCgUTT7GPcmkwrpaIN7mF9nw
	==
X-Gm-Gg: AYBFou2Qn/nWZz430VtqGIZ4+cmykIZv+j59uBummP4+HyKwzHoeY2jfvgY35diRACP
	c6QIx/VNeY35/7tadlNhTJrKaVGkoG6xk8TZzfmuwvn+dlQt7CkDtHQvINqQ2u08Y48SbyzANcb
	msrUwLoVU0EBLrp49zmQnt6YbMRa4rT3XVZQdgO/2CGluOZ04XQ+xH8openr+YA/qLErwnhP4BY
	f4/mmq5ZUvT75FY0K7lwEHcf7hkulHpTqI9KsExoiiJGQGiWTQHfsQg2kBvMIU9yh+3IL9d2rCg
	XQlLu0vLhyETLTMaUksc9cz4XgNSYLy91odHUg8/75nmve+fV0wzeGX+2WmF28ttoxT6OInUJMT
	lXjZKcPLWrJ4FUwfeXbb3ZjzhEhO5MInEQkDUeQ7TQn5fgg==
X-Received: by 2002:a05:6000:4a06:b0:493:f3f2:223b with SMTP id ffacd0b85a97d-499c5f3113dmr3181828f8f.12.1794391665885;
        Wed, 11 Nov 2026 02:07:45 -0800 (PST)
X-Received: by 2002:a05:6000:4a06:b0:493:f3f2:223b with SMTP id ffacd0b85a97d-499c5f3113dmr3181770f8f.12.1794391665484;
        Wed, 11 Nov 2026 02:07:45 -0800 (PST)
Received: from localhost ([195.174.133.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498357648f0sm10555289f8f.12.2026.11.11.02.07.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 02:07:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Nov 2026 11:07:43 +0100
Message-Id: <DMSARAAS9QNH.2HFOWZ6ZHCK3O@redhat.com>
Subject: Re: [PATCH] rv: Normalize opid IRQ state to a boolean
From: "Gabriele Monaco" <gmonaco@redhat.com>
To: "Karl Mehltretter" <kmehltretter@gmail.com>, "Steven Rostedt"
 <rostedt@goodmis.org>, "Gabriele Monaco" <gmonaco@redhat.com>
Cc: "Masami Hiramatsu" <mhiramat@kernel.org>, "Mathieu Desnoyers"
 <mathieu.desnoyers@efficios.com>, "Nam Cao" <namcao@linutronix.de>,
 <linux-trace-kernel@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <20261020035158.90190-1-kmehltretter@gmail.com>
In-Reply-To: <20261020035158.90190-1-kmehltretter@gmail.com>

On Tue Oct 20, 2026 at 5:51 AM CEST, Karl Mehltretter wrote:
> The opid hybrid-automaton guards compare irq_off with 1. However,
> irqs_disabled() only guarantees zero or nonzero. On 32-bit Arm,
> arch_irqs_disabled_flags() returns the CPSR I bit, 0x80. Consequently,
> valid events with interrupts disabled fail the guard and spuriously
> trigger the reactor.
>
> Normalize the value before returning it. Add a KUnit regression test
> that handles a need-resched event with local interrupts disabled.
> Without the normalization, the test triggers a reaction on Arm.
>
> Fixes: 2b406fdb33387 ("rv: Convert the opid monitor to a hybrid automaton=
")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---

Looks reasonable, thanks!

Acked-by: Gabriele Monaco <gmonaco@redhat.com>

> Tested with an ARMv7 GCC 16 W=3D1 build and targeted SMP1 QEMU run:
> rv_test_opid and the RV KUnit suite pass.
>
>  kernel/trace/rv/monitors/opid/opid.c       | 2 +-
>  kernel/trace/rv/monitors/opid/opid_kunit.c | 6 ++++++
>  2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/trace/rv/monitors/opid/opid.c b/kernel/trace/rv/monit=
ors/opid/opid.c
> index 9ae619f176fa1..a14532cc41778 100644
> --- a/kernel/trace/rv/monitors/opid/opid.c
> +++ b/kernel/trace/rv/monitors/opid/opid.c
> @@ -20,7 +20,7 @@
>  static u64 ha_get_env(struct ha_monitor *ha_mon, enum envs_opid env, u64=
 time_ns)
>  {
>  	if (env =3D=3D irq_off_opid)
> -		return irqs_disabled();
> +		return !!irqs_disabled();
>  	else if (env =3D=3D preempt_off_opid) {
>  		if (IS_ENABLED(CONFIG_PREEMPTION))
>  			return (preempt_count() & PREEMPT_MASK) > 0;
> diff --git a/kernel/trace/rv/monitors/opid/opid_kunit.c b/kernel/trace/rv=
/monitors/opid/opid_kunit.c
> index 3cb087a74241e..8aa1fb9c62344 100644
> --- a/kernel/trace/rv/monitors/opid/opid_kunit.c
> +++ b/kernel/trace/rv/monitors/opid/opid_kunit.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  #include <linux/kernel.h>
> +#include <linux/irqflags.h>
>  #include <linux/rv.h>
>  #include <rv/kunit.h>
>  #include <trace/events/sched.h>
> @@ -17,6 +18,11 @@ static void rv_test_opid(struct kunit *test)
>  	guard(migrate)();
>  	KUNIT_EXPECT_TRUE(test, preemptible());
> =20
> +	/* Need resched with interrupts disabled */
> +	scoped_guard(irq)
> +		rv_opid_ops.handle_sched_need_resched(NULL, NULL, 0, TIF_NEED_RESCHED)=
;
> +	RV_KUNIT_EXPECT_NO_REACTION(test, ctx);
> +
>  	/* Wakeup with preemption and interrupts enabled */
>  	RV_KUNIT_EXPECT_REACTION_HERE(test, ctx)
>  		rv_opid_ops.handle_sched_waking(NULL, NULL);
>
> base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222


