Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583650;
	b=ORyaRJEFf2fI/q1mPWMyO9BYuWUPdai1mQ4H5Wds7vW3WQj3DM8C5XHliAqBgQRXWYue
	 RmH/3JG3h4ztcyMGPSYW8660Im5gbU9xipvYeM+ByUhUFDwzO0jqFFe00o+Zbj6CbjEpG
	 7LRmVcf+LoQpFyM8w8BJibiQ2+9PhkVhQPAi6J7b643oi09hPDnyJoI0Yn20nODtzdduM
	 V9ANwjitfpO/lbji/zax0OfPstx1haNS/RaO9As54QwGg/MW2/zGwUnfwWrQKQj3DL+4/
	 3A5AVBpvIDYdMznAYXeHnO3MbsjCah1EbUydHVJSwUjuhFYBzp4TBxkKArxy3M+smRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583650;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=RNBBbQrJNB3Xgg+fxj4Yup1S+J/gAN5RSYgtr57b0eI=;
	b=vxQ98c7kt4HDkZf4KVMFUtLaXULwGeQ947K5nt2bodbtl1KIR+OGP1w5BO4Lpeuoknhl
	 O3+dYF8lKryTmo+VN8G2WnkXkzm5m7bsn1X1KlaSgu9wae8V7VozWZ8YQ/VzcxaFTZK4m
	 JRy+AfSfSlSWNYoVVdYI9j8qq7ngiED7BIniswnNtbihR2cmqbGwAYs7Ft6ZjCmoj67fs
	 5ADPWX4mDCRxaUKWeJfgFCEBezcU52WXC0qusky/Z6pCEiv5kySND9beoRurOZN5AyiN3
	 vkw0odTlOtQRqGTZt0eIyuJQ/CG4gfciF5aZAKCMFNtK/ciuYXiVtUZiH0iap+rI2kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SWDc0shx;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UdRT1W1q;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6FC606A326
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:54:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A6FC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SWDc0shx;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UdRT1W1q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792583649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=RNBBbQrJNB3Xgg+fxj4Yup1S+J/gAN5RSYgtr57b0eI=;
	b=SWDc0shx2BcVDMM182dbys77upicGBT3kuMSQQz8JncCpzbCrx6Qqp9BnTR6OWBIJMfN5z
	uFbRoHO4pxjU4d3kWf7P0j3/3L6yCBXGwKTI6+vvQOTZ89efU0B4ApISDz3XNHlA0JZjfw
	jBDjFSolFgLFrpknVCNPjokUbNb1ErI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-oF-EDb09OUqYwAPztFqdHA-1; Wed, 21 Oct 2026 11:54:07 +0000
X-MC-Unique: oF-EDb09OUqYwAPztFqdHA-1
X-Mimecast-MFC-AGG-ID: oF-EDb09OUqYwAPztFqdHA_1792583647
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e29c25101so167306f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792583646; x=1793188446; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RNBBbQrJNB3Xgg+fxj4Yup1S+J/gAN5RSYgtr57b0eI=;
        b=UdRT1W1qOLgF07eOPQgfsR/TnzxDjUR6nwzEvaDC+qa9Ul/11fnCr2KHSW11457CX8
         D0JIgdOkyeCoHgkA5p3Eq5SKaTPPhFUGj502VALx8MjOqq2XbqIgMMXgrTezNOYwPlTi
         xhOVIN3YdbK9cnxiauvUpTyiDkAzkx3hviYjCmoIHavvVXNXZDkXVihibIlkN42xijgH
         PWgk0wPT7V31SE4JK3pHuNqSsjq7ESaAo3gYbzlBP6V0hBtyje+wfrEjj+0Unx/0WLcw
         CGY4c7SPo7yuLmLBzJBWjwdc7uyDmd5f7g+jVIuFYEa2WMKzGnLSpxN/9MVPGMbzLhG5
         s2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792583646; x=1793188446;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RNBBbQrJNB3Xgg+fxj4Yup1S+J/gAN5RSYgtr57b0eI=;
        b=xnHHtUAofigB75WNLML/0aPzSwycstbx9NT0ZwwDgd2D1k+N0UKH1REitzyaizni7E
         93e6/UsW1xzXg8klj93+xCtvRBak7WqG7u4N6yPWmiKvuOkvwQqWSS7/AHxK+lQ5SYRQ
         g91XD479r8M5zg9+601drzCd4JL2Pr4utzP2ScjsMm6U9Nh1QTt+WelKKHw2yUZl3vwo
         3YjFJBqIjj7LzE5J8+ZY/NwBwWy7mUO8BzXB4mZMEAnSGu70TDH/83smYCagSUAbrQYY
         h8f+ccvCNP1E+gMHvaMshouFZMtnaBG2LU0Jnd8yIrmiEcLjdVDDOmJP0I0mp9Vp0tvt
         FjZw==
X-Forwarded-Encrypted: i=1; AKwUvBxBGg9KqZWFhS62G3EJF9VkAaLkdPxNIPJehsVdKIPLzl9Tix018teRwbgFbnrtx22L5TMhuFg3fWNTHjc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkn6GbwYGH/AKuCVL0s5rv+epKRRlz8yTOEaRA+b3fvVsNR0yR
	hpoZYdXkYSiBb4Qw37KXQN+HhfM5xigMv2uSpq9mMfHbol0RVqPl6+Yzaa6vohnYOmu0RFlIVpS
	h1lJPT+IVCHDddfj9ZelhpJjZJ/LDXxtVx4FlGPBCBT+dxD4NPtlBqfGLiXtb/YI1gg==
X-Gm-Gg: AYBFou2O5iEWe22VFi7z2bR9gu3Ph3H5UAIek0gnt2J/ub52NN6txJUHbEgcAG/WQTd
	d2o8cchutnM6A8SDLz/MiMBqhX4zm26dYQTOfLld5uiJNFDMWHdFvO7F+vR8/eG52W2sV5vTtLz
	iZqPcgrZfWwuq96VkfreDg9nJvLdAg1J8KC2VFbhytTvV1S/6saNqfjRSKlAdz/hnfQsDyyObLf
	4AswqYo70+ZQZqm9at5zO+z+z1Z2ZTD6e5kg+s5iZ+5LRpWQr52dDTKUk3QIerId1Fco3+Y/ExZ
	34k0W/YS0aupYovq9Jln+K2Vghg0di7OvXJev272OAY2wnWcE1MIDOznMYQ5P/Ime2l6TLCL1f0
	c98JeqWT2Bl794mbz1TGFba9d0Yg=
X-Received: by 2002:a05:6000:1869:b0:48e:25d7:d276 with SMTP id ffacd0b85a97d-48e264239e4mr3808034f8f.2.1792583646613;
        Wed, 21 Oct 2026 04:54:06 -0700 (PDT)
X-Received: by 2002:a05:6000:1869:b0:48e:25d7:d276 with SMTP id ffacd0b85a97d-48e264239e4mr3807986f8f.2.1792583646205;
        Wed, 21 Oct 2026 04:54:06 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.34.203])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2581f0d4sm4999776f8f.13.2026.10.21.04.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:54:05 -0700 (PDT)
Message-ID: <a8d8b080f403eed617242a3276717706b4081ed1.camel@redhat.com>
Subject: Re: [PATCH v2 10/15] tools/rv: Add BPF monitors
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>, John Ogness <john.ogness@linutronix.de>,
  Tomas Glozar <tglozar@redhat.com>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Wen Yang
	 <wen.yang@linux.dev>, Tobias Schaffner <tobias.schaffner@siemens.com>, 
 Viktor Malik <vmalik@redhat.com>
Date: Wed, 21 Oct 2026 13:54:04 +0200
In-Reply-To: <87h5ifqy6w.fsf@yellow.woof>
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
	 <8580176d216258e9008c344e0529509117dcc18b.camel@redhat.com>
	 <CAP4=nvTc297yQHz8aumZFAQ3+JK=5Z_=416WdosT0S6nHEeNfQ@mail.gmail.com>
	 <87pkx5q1w4.fsf@jogness.linutronix.de>
	 <0d4f11b1999588ddba9d855db43fc492eda32de1.camel@redhat.com>
	 <87h5ifqy6w.fsf@yellow.woof>
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

On Wed, 2026-10-21 at 10:01 +0200, Nam Cao wrote:
> Gabriele Monaco <gmonaco@redhat.com> writes:
> > Fair enough, I feel to be cautious at redefining what reactors are righ=
t
> > now,
> > though. Currently they are nothing but a function call to the set-up ac=
tion.
> > It's trivial to verify where the code goes without adding the tracing
> > subsystem
> > as a dependency in the path (typically important in some safety critica=
l
> > cases).
> > Sure, handlers are called by the same tracing subsystem nonetheless, so=
 it
> > may
> > not add much value.
>=20
> I am thinking about dropping reactors entirely and only use
> bpf_printk. I have never been a fan of the panic reactor, crashing the
> system because of an RV violation is a bit much. And the printk reactor
> would be replaced by bpf_printk, just that the messages would be in
> tracing ring buffer instead of kernel log.

The panic reactor comes from the functional safety use case, imagine a syst=
em
with redundancy where the linux system is compromised by a violation, the o=
nly
safe state is to shut it down (with all vmcores and stack traces panic give=
s
you) and continue in emergency mode.

Right now that's still a potential use-case, no one that I know is using RV=
 in
that context for a few other reasons.

I wouldn't completely drop reactors. That is, we can avoid implementing the=
m in
BPF, but I wouldn't take design choices making them impossible in the futur=
e
(nothing occurred so far).

>=20
> Or do you already have potential future reactors in mind?
>=20

Well, I have a lot of ideas, not many requests so far ;)
I think of reactors whenever people want to integrate exotic things to RV.

Actions tied to the error tracepoints (what Tomas suggested, and I think yo=
u or
ThomasW also mentioned in the past) would probably work in many use-cases.

This doesn't affect the design, we'd still need something making tracepoint=
s.

> > Let's leave reactors aside for a moment. What I am coming to terms with=
,
> > instead, is that the current ringbuffer to userspace design isn't what =
we
> > want.
> > In kernel monitors communicate their status through tracepoints, perfec=
tly
> > integrating to tracing tools, BPF monitors use a custom buffer.
> >=20
> > Generating a tracepoint here is probably the way to go. bpf_printk does
> > generate
> > one, but as Tomas pointed out, hijacking that for everything (think of
> > monitor
> > events) might be a bit much.
> > Nonetheless, we want RV BPF handlers to generate tracepoints, then atta=
ching
> > actions on error tracepoints (whether we call that reactors or not) can=
 be
> > done
> > later.
> >=20
> > Summarising, we have 2 potential designs.
> >=20
> > 1. bpf_printk only:
> > =C2=A0 bpf_printk("event: monitor: curr_state x event -> next_state")
> > =C2=A0 bpf_printk("error: monitor: event not expected in curr_state")
> >=20
> > 2. new kfunc(s) calling a tracepoint:=20
> > =C2=A0 trace_event_da_bpf("monitor", "curr_state", "event", "next_state=
")
> > =C2=A0 trace_error_da_bpf("monitor", "curr_state", "event")
> >=20
> > 1. is simpler and works mostly out of the box, depending on how powerfu=
l
> > glob
> > filters are, it can reach the same functionality as 2. Might risk to
> > overload
> > the shared bpf_printk event and perhaps have a higher filtering overhea=
d.
> > 2. is closest to the current in-kernel implementation and offers flexib=
ility
> > to
> > easily filter the type of event (useful for DA, e.g. I want a backtrace=
 only
> > when going from state A to B). But it requires a series of kfuncs (e.g.
> > error
> > and event for each monitor class).
> >=20
> > In both cases a malicious actor could call the kfunc and make us believ=
e
> > there
> > was a reaction (they cannot mess with the model though). If we own the
> > kfuncs we
> > can at least limit the availability (tracing-only and CAP_SYS_BOOT).
> > This, unless we register BPF monitors in the kernel like in V1.
> >=20
> > I'm going to test each design once I get again to work on this.
> >=20
> > Thoughts?
>=20
> I vote 1, much simpler (but maybe I just haven't quite got the issue). I
> feel a bit ensure about adding RV kfuncs and would only go that route if
> there is no other way.

We can go down that route and see how it behaves.

Thanks,
Gabriele

