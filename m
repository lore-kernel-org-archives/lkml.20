Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793817026;
	b=H/LgVI/Z+rm6XXOyn1pjp9+tumFlySp7R/I+8SnfnUhLfdAeCZx1EH3f5vfL6kG3okR5
	 8R8EjBkNisARf2tmNEKxqPQfXzLsXxn46l6ilGqJVqwcI6NN7P6LvgeH5I0PyPE0LJtOE
	 RwtCekFTfGMGEBn6mTu5BTdJSOL9enmUecyh9/9hu9vJRooEjK9hUxvZyBRebloikEnDq
	 zqNgZ1/BGa9FiJVoC91euzraxisQ0BORLLXx9htTDn0NbG27G/yV6+XVON6fAvRBiel/X
	 ZnThs6cvf8xOvauTkGXbQ8VPOoi3ZLaC7aREQEN97qeKkFK5x1qcmBL5Xrpq5o219Kw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793817026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6vlBLO9On7q47NyBJ2Rw1NocpmdzrNn/c5hU8D8zRfc=;
	b=y/0wUfqUKofAfAMFBGA/2zqwpPD58eo4dhHNvLbrMoabqy0jmgjsEGw1wYQz4KKh4Vyu
	 n7YrZiH2YYtvI1AXiwJApIkggzi/0tr/F0aO7Oe62QbfP4933pd6K6MCySL/WS5SwlJ5k
	 UI/ABDNEWcwcJU9p/I5fxwBGipSOrbN1JuxHYU6iHrzS/8IbcL63qA+dAbC1vhz4/dJR5
	 L8l32iw08+29CQaBgCpzIQ1fefZF2V/xS9lKxJMJWHQJ5dLbifnsx/LVNoqcUY7I4KDwT
	 fem3BDymhcv3xAI79JWIDpjzYfEt2SdPT28d9JzKVB4J6mE3BL4hblQlVGOYqvFprmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=everpuredata.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=D+vzaXEc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.43
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C602606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:30:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C602606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=D+vzaXEc
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7ce645a1c6aso595247137.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:30:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793817023; cv=none;
        d=google.com; s=arc-20260327;
        b=OvGxiStRDUse2bkIZqMFGvxHDpVbCgs2HxFBhDm8U3hUI/Mam6WFP0GicZOurEouD/
         Hsx7+kmhVIbqmUVVId7tZ7cg5FsLVxnkuSZ2a8gx1gL8MJ7V/C8KCZCYGJ03YyZMq/ZY
         cnzuetWj5yugW59/nxKW3KoJ4/3A6HB+mwamxDVMHqI2VL85hv6hb1lE/ZrJ5wqYt49O
         XvDHBShh6M3cD1P3bR9PTfcQuWZPqAlymZtAW3pTBrjusZJurkmiz96nWMO8Rv2IZqcR
         z20S5rO5WPPciKROZFM/3prkrFO58BfSPMfxCdWD5lCc6qPGa0qi7ufP8QjJh1MlUBll
         ZPiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6vlBLO9On7q47NyBJ2Rw1NocpmdzrNn/c5hU8D8zRfc=;
        fh=ROZ5Z6hvGaNzEi95tKpOX9UYiIByTvGmMqQZz1Oelf0=;
        b=BVPtAjTYj6ZnDN0Uii3PeQpdJpvnOsIWZmYqjIcazpbKmIf3hfP+RFxAl7ElkFPbm+
         +w0cfCJ+blDR74nSoBvTZwODu5VqElXEsqeSFIZLKrnaAEvbbbp6e96WRMbETyBzhigd
         lEDyABAh7ar1VKQxhuCIbtum5TjLkABO8w1PmQo2DcxmMVVuanz+mKToIpDq1CToT+O2
         y+ySf8/KsnUARq0/am3yg86ss/nz2PnTc85z2F9Nc/0YI6YvjoGV23GxQ9vzPy4s0fQp
         hxwUbNqSU65aTEraRMKs0jy19lNZtq6xrEgYAs2T9B4RXkoQk8tvCe1jc1duxw5lVgi+
         tCdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1793817023; x=1794421823; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6vlBLO9On7q47NyBJ2Rw1NocpmdzrNn/c5hU8D8zRfc=;
        b=D+vzaXEcyQsrqSCPGZFnsmiGvYNBSc4foTiivjqiQoqaMvSxloeeFxaM5RXt6S2Kv6
         V9y2OBTNagImvYAvD10a+ZoSyI9FAmiK/KzEsrd/zYfkRAWLXuO+u9GbM4FBFTl9MbPS
         kRyUIbTsbZSmYQQLaciF+SGH0bpTJ1mFPQdzvRxHRBu1u/Miw3SOCmssLYPYx7bNVYPZ
         EBJMPfwBdPViJ2doX3G+mxxchBNoO8kqnaMhAprre7AkIt/4ny0vrfK4SLSP0Nt2bTTw
         uz/yAV3vprRPcCj3PtI0OiyjmsPECr7nrryw5M7Zb4RMktGqwLoCZwH84JtIQ+5N+CoT
         6k7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793817023; x=1794421823;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6vlBLO9On7q47NyBJ2Rw1NocpmdzrNn/c5hU8D8zRfc=;
        b=0QQDzV/qNLRsn8OA7on0vMTDxl0abTgrkNLgIjRoygwLxAly180FTus1KTcDKnpmI7
         Hldg+HIaYy2tRsuVE9PjRAIfFIxFSTyVZirquweWEhg5zn31V3lHqi7rP4oIgCStdxyI
         rJ6QJgNK6q9pjjF0SjuGPS5XdiOa8cGQVU1FTFu7DOd37i8BVIZxIoIXjqWu/01FlIvI
         NCty8sZ1XCRqdNkDH3+3EAGk5h9Z7B/VM3h7V5s7G6FpgEYm6g4znVrYicY4UvZRvBTG
         M4s+1/HmoH9dFyALd6nquCtpcieLCWLzK4cEoy2XTMeuEAYxIgNt9G5CpMm/2V8zxSKd
         +x/g==
X-Forwarded-Encrypted: i=1; AKwUvBwLjMyvUFhNG7j4yEzXhAXawQ93XBvigQ9AVTQeaQ/I50ZX2spi3ZowVFDjUU9jtt1RFawYS/RPhudzSc4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VA4lJcawCkatmmd2VB42rgesEAOs0E0u8ScMFChP2QVlDDNeB
	cqSNjME4od2xyiZpWJt7SCl1aAY3+KPqY/o5nZWu1SWpCsKEovn2GIUtQNlc9tFrhJIDkrGEywa
	a1iOtCYXNBMM3+Uu8nF9jqYbMaAwJfpZDao1/u420dA==
X-Gm-Gg: AYBFou3sfaC16HuEQ5N/Mi/poq6QBSrfjg1y1FIIEfI80lcwQBBBw3rYt1Ri2GsQ1ZP
	pdVNQ3k6OJdBrwGJYS9Z9O40UA9NLex187TUDjgta/fG6uAKBWq4WAZheuFR7J4zO6iG8QzKnVM
	JEZ8HsFvl8UV1nHYf46xWvxjPL2vGkU8EvtajCVXDeMT22VXeiiEXsscvGeSivY8AbzBNpT9FTB
	cZeM2xtVECc/ZNM+9BsQ/1WOQnpgMX1a6J1jKriPUfLYu+RUuhgfZvMXHKs/r0QJFKp5QMd5RP0
	5NrgnLU99LpZdHKtVMSRGsH5BCvikwonvrkDXf6SlUbvHoVwcrvnfG9nGPUTPB8fThsrB28uStE
	v/yNA8S/xXkhcmP1lAoSn4bphoqRBgAmN+Dt6sN4LqyDOs8gqrClK8bMDyELnW4o3xsbhyCuBif
	dKMx5TW7RERlCJiZfOwcqhkPnIe3fVH63FwZlk3yLQZASM2gbXbxRYt2hp90vQ9roWoiZ/eZCKr
	nBH7GFxXV2RlBrZvNJ0ShQE
X-Received: by 2002:a05:6102:3e8e:b0:7cb:bb33:8413 with SMTP id
 ada2fe7eead31-7d072bb37c6mr7312101137.9.1793817022500; Wed, 04 Nov 2026
 10:30:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102220310.12649-1-rjethwani@purestorage.com> <179374354756.488856.17787079121679404910@kernel.org>
In-Reply-To: <179374354756.488856.17787079121679404910@kernel.org>
From: Rishikesh Jethwani <rjethwani@everpuredata.com>
Date: Wed, 4 Nov 2026 10:30:11 -0800
X-Gm-Features: AclHuK9IwD1rDZTP-2krUHCIqiisxEe3xHzAbLlTex379jxu1nU7vOHg_omGLSc
Message-ID: <CAKaoeS1koPSPtjzj3sFYnZoO5XkYaDcWnodHR+KsGNfz2CYrgA@mail.gmail.com>
Subject: Re: [PATCH net v5] kcm: reject attaching sockets with a ULP, and TLS
 on KCM sockets
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, stable@vger.kernel.org, jiayuan.chen@linux.dev, 
	syzbot@syzkaller.appspotmail.com, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, hare@suse.de, 
	sagi@grimberg.me, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 2:05=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wrot=
e:
>
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 2
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The commit message understates one user-visible regression.
> - [Low] The commit message says 'rmmod kcm waits until such sockets are
>   destroyed'.
> - [Low] Documentation/networking/kcm.rst ('Attach transport sockets' /
>   'Unattach transport sockets', lines 144-190) is not updated for the=E2=
=80=A6
>
> --
>
> kcm: reject attaching sockets with a ULP, and TLS on KCM sockets
>
> With this commit, kcm_attach() refuses TCP sockets that already have a
> ULP, and it now refuses raw IPPROTO_TCP sockets too. Attached sockets get
> an unregistered dummy kcm_ulp_ops, so tcp_set_ulp() refuses kTLS on them
> afterwards. The marker stays until the socket is destroyed, and it pins
> the kcm module.
>
> Link: https://lore.kernel.org/netdev/3108e934-ec00-458b-8720-450554b35b55=
@linux.dev/
>
> > Holding a ULP also has visible side effects: getsockopt(TCP_ULP) and
> > inet_diag report "kcm" on a socket that was ever attached,
> > sk_has_decrypt_user() is true so PSP RX association is refused after th=
e
> > attach, and adding an attached socket to a sockmap fails with -EINVAL
> > rather than -EBUSY.
>
> [Severity: Medium]
>
> Is the sockmap effect really limited to attached sockets?
> SIOCKCMUNATTACH does not remove the kcm_ulp_ops marker, because
> kcm_unattach() only clears sk_user_data:
>
> net/kcm/kcmsock.c:kcm_unattach() {
>     ...
>         write_lock_bh(&csk->sk_callback_lock);
>         csk->sk_user_data =3D NULL;
>         WRITE_ONCE(csk->sk_data_ready, psock->save_data_ready);
>     ...
> }
>
> sk_psock_init() checks for a ULP before it looks at sk_user_data:
>
> net/core/skmsg.c:sk_psock_init() {
>     ...
>         if (sk_is_inet(sk) && inet_csk_has_ulp(sk)) {
>                 psock =3D ERR_PTR(-EINVAL);
>                 goto out;
>         }
>     ...
> }
>
> Before this patch, this sequence succeeded:
>
>   SIOCKCMATTACH -> SIOCKCMUNATTACH -> BPF_MAP_UPDATE_ELEM on a sockmap
>
> With this patch, the map update fails with -EINVAL for the rest of the
> socket's life.
>
> Could the stable-facing paragraph that lists the user-visible changes als=
o
> say that a socket that was ever attached can no longer be added to a
> sockmap or sockhash?

Good catch, I'll list the sockmap case in the stable paragraph,
and I'll fix the earlier paragraph that said the -EINVAL only applied to
attached sockets.

> > listen() after a disconnect fails with -EINVAL, as
> > the dummy has no .clone, and rmmod kcm waits until such sockets are
> > destroyed.
>
> [Severity: Low]
>
> Is "waits" accurate here? Unloading does not block on a non-zero module
> refcount:
>
> kernel/module/main.c:try_stop_module() {
>         /* If it's not unused, quit unless we're forcing. */
>         if (try_release_module_ref(mod) !=3D 0) {
>                 *forced =3D try_force_unload(flags);
>                 if (!(*forced))
>                         return -EWOULDBLOCK;
>         }
>     ...
> }
>
> The reference taken by __module_get() in kcm_attach() is only dropped by
> tcp_cleanup_ulp() when the TCP socket is destroyed. As long as any TCP
> socket that was once attached still exists, rmmod kcm fails at once with
> "Module kcm is in use". This holds even after every KCM socket is closed
> and every socket has been unattached.

Right, rmmod fails immediately rather than waiting. I'll reword it to say
it fails while any once-attached socket exists.

> > diff --git a/net/kcm/kcmsock.c b/net/kcm/kcmsock.c
> > index a7f94d42036fb..1f8bcbb8b9c3b 100644
> > --- a/net/kcm/kcmsock.c
> > +++ b/net/kcm/kcmsock.c
> > @@ -30,11 +30,26 @@
>
> [ ... ]
>
> > +/* Not registered, so TCP_ULP can't select it. It only holds
> > + * icsk_ulp_ops so tcp_set_ulp() refuses other ULPs like kTLS. Like an=
y
> > + * ULP it stays until the socket is destroyed, pinning this module, an=
d
> > + * tcp_cleanup_ulp() releases it. Clearing it on a live socket would r=
ace
> > + * with lockless readers such as do_tcp_getsockopt() and tcp_diag.
> > + *
> > + * No .clone: children copy icsk_ulp_ops without a module reference, s=
o
> > + * a socket that was once attached must not listen().
> > + */
> > +static const struct tcp_ulp_ops kcm_ulp_ops =3D {
> > +     .name =3D "kcm",
> > +     .owner =3D THIS_MODULE,
> > +};
>
> [Severity: Low]
>
> This isn't a bug, but should Documentation/networking/kcm.rst be updated
> as well? The "Attach transport sockets" section only says:
>
>   - fd: file descriptor for TCP socket being attached
>
> The "Unattach transport sockets" section says unattaching "is
> straightforward".
>
> After this patch, SIOCKCMATTACH refuses raw IPPROTO_TCP sockets and
> sockets that already have a ULP, both with -EOPNOTSUPP.
>
> The kcm marker also stays after SIOCKCMUNATTACH. For the rest of the
> socket's life:
>
>   - setting TCP_ULP fails with -EEXIST
>   - getsockopt(TCP_ULP) and inet_diag report "kcm"
>   - listen() fails with -EINVAL
>   - sockmap insertion fails with -EINVAL
>   - PSP RX association is refused

Yes. The next version updates kcm.rst.

> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261102220310.12649-1-rjethwani%40purestorage.com

pw-bot: cr
