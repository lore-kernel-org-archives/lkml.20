Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1541D4A5EB2
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792406592; cv=none; b=cBZahKbCQtJ7hLcf/naYPGjDOG3KhiWU4PXTYAHTZ6ZUbK1EwkP3neIXxihPiYikeAkKGAhy6EXMYf2LRik9wZpSsEub8XG49uYJPHEL0zJ7QBlPQufcZtQC9s4M7ommtCeagxznXPeLDY3OCDScREPPgRqj5L1ONbliCEBzuWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792406592; c=relaxed/simple;
	bh=uYkeqd5tBLFGk1jwj1eJ0IFGnUKsublCpH2CcRrIi/E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DzbsZJL4Nu3NEsX5qqE7tvsOCc2PbOme/7fQPZY7bBjZcVuYmXGFhgSloQZ0qAo/Y0p2WRNjN48+CfQxW1fd2ASa+LYTxALQS1loavK9RClfKXhmiAsgE8gM9QEvTvz7mN3jh7mvjNBRAJS80k7UYLMRtlDY9okiTb5qxSLleQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ONSDgCRI; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=RA/CVi3U; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ONSDgCRI";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="RA/CVi3U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792406590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=uYkeqd5tBLFGk1jwj1eJ0IFGnUKsublCpH2CcRrIi/E=;
	b=ONSDgCRITMUKkWN6BaAnwgWTgXGEVJcVNmjvL5vOGG1llXfUL1xtxpoprEL2Gs+v4rb/Rt
	jL5QUQy9bXGE2W0YHKPLjN7Zc++Vgm9cTDjn1UK8QxES5Zyvm4+pqmIFMLlBxGM/S7gu2a
	epVQxmHVa2HkdJmsoBd0t6Gqc39EcXc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-221-na8Nd4yPMx6jbfELBlT4Cw-1; Mon, 19 Oct 2026 10:43:08 +0000
X-MC-Unique: na8Nd4yPMx6jbfELBlT4Cw-1
X-Mimecast-MFC-AGG-ID: na8Nd4yPMx6jbfELBlT4Cw_1792406588
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a1d15e7bfaso14267785e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792406587; x=1793011387; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uYkeqd5tBLFGk1jwj1eJ0IFGnUKsublCpH2CcRrIi/E=;
        b=RA/CVi3U9th1pmTLdAubdzps64o+PFqXMPTY+QorHr1gjF/ETFUk5XRq0iMe0o6Muq
         /69ErfYQPEqfhhaP+2oZX+yqBglwUrjhavddtnY5bITFE6A9M1fc7s3JBRH6erTD10Oi
         oj0O0+Tn7dgRI66RWO/K56wmyhBLcwSBDzi2GxIlv1qzqzD9Gha0+T1urodZq3irnUDy
         R7/EHe5zLcl0RxNbYCjPHb2p1TD3uI/gw1wxjWvzgIpcmidA+iTZdgLjqnh/wqUZaD6h
         f3ckqdLY3stLXY1mmEQ0YcxgMsDlyalo0egWiRC10D/1WdbxD9CroAMHd0gx3U0XSH6C
         2xmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792406587; x=1793011387;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uYkeqd5tBLFGk1jwj1eJ0IFGnUKsublCpH2CcRrIi/E=;
        b=hPIeET3OLwHE1JaWJ2ntBKhLhoG6HHvOjTK1ZK6O/57GoEjEqURjvUbeNC7uVt5kap
         EQgbtxSb3zHtmZOkMBgA+bRkivYtpI064gu01sjCc5D0AvgUSJzRLyCsrNugrFKGsxEb
         CylUp0oJdbo+13SFz0/H5L8GHuZ7qtMOCJMe5WnP7jcSW8O4UzYGZjYwK6tvjUlKIZQn
         WEmHy+WIMVDkVTHmneP65KZrSSZMPf+mw/RD5UqIKcX078LtJlx7SN3jNrSgxCS8a7/A
         j98ixwxiTiChud+DXN/hWCpESMNdDCrhGdDtQ+AUd1HPS8xDKWr0EAx6ud9yy5VAsNPY
         fFqw==
X-Forwarded-Encrypted: i=1; AKwUvBwQkAeAz4eReI6b23B9HWPPxRTK/1ELEJsR0lVub9lC8qUS6uuDZu0DQwBFYSSLzHOclFybMtvBbupEJng=@vger.kernel.org
X-Gm-Message-State: AFq9FYKihKSLpQ/U//fM86JF3JgSMqP3tUU5kA458v+heKn2Ojd+jvwi
	FA5ym+QyISNyaNUntxouUVqJpn+IcluRkeTXlceelJAYHrhxzdyv2AupIeF7UdX8a8MQ0y9afXn
	L0la0dJ0djTbJsTzNkJg7s4/v+SbABoNTEa3LcoxhbdvDVz94GDqvNkaXhxwCXD8b6g==
X-Gm-Gg: AYBFou2E8dwYQWpC+H5OwgQxp+sdr7OzDIPkv+JBwObDly7yrm8fPMoTIiN3l3Ds6j2
	8w9/C01xeRypmTPyIyqDsyQD3K4oe4SK+6D5UawM4RP+p52CqMDsOl8dYwFQJDB3VD67tyKj0CC
	xJuf/188gtZhofuASD9riiIWCA8v95QdYbrpZFM7iLaC6zvAvkmSZyE1niOHtI0wZsM3IEtRRc1
	+tEnIWprfm2zOwtuFi9Qn/E15gX9TFVLKRnrrot6yEeGEWgkio1Bzj8bxU7f/BEbvg4TsgoZck+
	MhQoqOHk0Ob/SS2JXvvD0dngJpXjcrAi2Vqo+q+tUHECupFS7KJO4pcqomGVhi5cZNIeTS2Gebl
	oTTP60/iAKsJHvtdhmlihwklTtg==
X-Received: by 2002:a05:600c:8b25:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4a1d75f987dmr194763785e9.12.1792406587562;
        Mon, 19 Oct 2026 03:43:07 -0700 (PDT)
X-Received: by 2002:a05:600c:8b25:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4a1d75f987dmr194763415e9.12.1792406587234;
        Mon, 19 Oct 2026 03:43:07 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.134.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd91c55bsm314719595e9.0.2026.10.19.03.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:43:06 -0700 (PDT)
Message-ID: <8580176d216258e9008c344e0529509117dcc18b.camel@redhat.com>
Subject: Re: [PATCH v2 10/15] tools/rv: Add BPF monitors
From: Gabriele Monaco <gmonaco@redhat.com>
To: Tomas Glozar <tglozar@redhat.com>
Cc: John Ogness <john.ogness@linutronix.de>, Alexei Starovoitov
	 <alexei.starovoitov@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org, Steven Rostedt
	 <rostedt@goodmis.org>, Nam Cao <namcao@linutronix.de>, Wen Yang
	 <wen.yang@linux.dev>, Tobias Schaffner <tobias.schaffner@siemens.com>, 
 Viktor Malik <vmalik@redhat.com>
Date: Mon, 19 Oct 2026 12:43:05 +0200
In-Reply-To: <CAP4=nvR2i092924zszA8Qh0UUYnwXfAsa+7KjPe-NpwC+bbLXw@mail.gmail.com>
References: <20261001152042.124445-1-gmonaco@redhat.com>
	 <20261001152042.124445-11-gmonaco@redhat.com>
	 <DLXSI4BSRE5F.1TLKCBUAGNDFQ@gmail.com>
	 <b1fb01e1c58893795dd4be346f233d39fe653aaa.camel@redhat.com>
	 <DM6H7SK4YZ7A.F0MM6C0I77OR@gmail.com>
	 <878q3xtptq.fsf@jogness.linutronix.de>
	 <8B3FF026-6159-48CF-8FEA-AF2FACD2E4EB@redhat.com>
	 <87bj8s8ih9.fsf@jogness.linutronix.de>
	 <DM78SVMBI2XW.2XHVC67VON48A@gmail.com>
	 <87v770uuyr.fsf@jogness.linutronix.de>
	 <DM7I2PYHNKXE.3AYY3N1HATXLW@gmail.com>
	 <87ik2zryzo.fsf@jogness.linutronix.de>
	 <0055967d4571e7c8549dfa476fa6b15b93013701.camel@redhat.com>
	 <CAP4=nvR2i092924zszA8Qh0UUYnwXfAsa+7KjPe-NpwC+bbLXw@mail.gmail.com>
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

> Since commit ac5a72ea5c89 ("bpf: Use dedicated bpf_trace_printk event
> instead of trace_printk()"), bpf_trace_printk() does not use
> trace_printk(). Rather, it is recorded as a separate ftrace event that
> has to be enabled, in
> /sys/kernel/tracing/events/bpf_trace/bpf_trace_printk, for each
> instance that wants to trace it, and using it does not print any
> warnings into dmesg.
>=20
> The BPF documentation says otherwise [1]:

Thanks Tomas! I noticed the banner was not displayed and I was puzzled. You
saved me an LLM iteration that would have probably be puzzled by the commen=
t
too..

> One disadvantage of using bpf_trace_printk() for RV violation
> reporting is that the event will be caught by every instance that
> enables bpf_trace_printk() and does not explicitly filter rv out.

Yes, that should somewhat be mitigated by the glob filter, though events ar=
e
still generated.

> I can imagine an RV-specific trace event for that, however, it would
> require a separate kfunc to generate it, and ideally also distinct
> labeling of a BPF program eligible to call that kfunc. The "rv"
> userspace tool could then iterate over these labels so the user knows
> which violation events can be expected to occur on the system.

That'd work too. It's what I initially envisioned but=C2=A0I'm not sure a k=
func
producing a tracepoint is something BPF folks would really like (and techni=
cally
any other unrelated BPF program could call that, unless there's some access
control mechanism I'm not aware of).

Not sure how much it matters in practice against the glob filter, it probab=
ly
really depends on the other bpf_printk users (and a mildly better usability=
).

Gabriele

