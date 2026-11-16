Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794854069;
	b=EZcS2TWblipzS/JOD2ZUnI0H5RbD+7v74CopMIT8TIvoYkMFiDbObdX4sp0D1oXlzR5N
	 vGterTVRsAkqn6AUfWEY/YIvoxFujLRSktrsIO6UiBrR2XKFoRtA6lS/1DwCgNhtxg5zT
	 2brIXaQZRU32JA+RJeFjajHjKWaVpf58Y7A3CX6r/gJKhNz3XZVOkRxA9I8F+NWJqybYc
	 +/ZC8vcQfnHEydmdXOQlzUrpRg9prbmmMuqsRT8AnXGT0s4/0RpOHdUpEYvEnLZEUsdTD
	 E1nwHhrIeUiNqBygGtF19IE1NNXNHLFJRECChIErZusNIg8y22Ue0gI4GmWAKNGfSwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xE4/pjASkUAynmBsoopUVVAbaBNyN5sM4lhvVCjAw+I=;
	b=HAkBoSH6Wt28b1PvvVjEIRwIu13EO5Nk/C0l6Al6hSW7e59BaR7TBvglyRKDzCT7Ojlk
	 7zuzc4bjXaAaumTdCP1kWxUsr+M+95poL9XdVUOLK8BP0xozvQ1cxQOpb2y7p3fhagjtp
	 In55imyA7C44gbIc3INrzKTkW/N/Dnl4VjObXFdL1yRRw6ZFNBygQlAUKJ+K73ESEEU3I
	 PmT87wRKCwygRKw4jobh7Mv2y4E3gm5nm0/Dk4ORVdiB07dmiRWTipwO6YqLtr4aOohBk
	 3F1LTttEshP1Qdl8xEXvpcfNn8y/RLjGbt6UFO/0lUjH24NMJUC4h1dRMahRVZhJ31A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=everpuredata.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=3KhvarpG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.50
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B5E606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37B5E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=3KhvarpG
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-990fbae94f5so3465467241.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:34:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794854063; cv=none;
        d=google.com; s=arc-20260327;
        b=a7xUuL/um6J3N+33TxB+Ue48IqBEuTMzL3otjtsXsiRv/AX33Xd8FnQBv1X1Gz9zW1
         XeRwlXBa6mwibHEj+w5oWqdtjCKjYfXChF7ucp7K4QAbp8RpyJvnx2Bhd3CgT7CgSAHO
         vj++DdEu/FH4/AkrZqq++FkZ+2GxPndxVm0/s1lyumw527tBdClWZJvR1QhH5p11fzmi
         0sC9Dz3XPsXuxYtmkFIO6Ol2q6bxSgdpN7aoVPosjWKfH9ezHGj4xOKttDN68TSikneT
         I5zgxe2b0+UQb/5wmZNN0Y2R16TvUtHDKvhLrQzwZfimHuYKsLjtdXZHInRk/uH7xMYR
         fVvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xE4/pjASkUAynmBsoopUVVAbaBNyN5sM4lhvVCjAw+I=;
        fh=LP5zg/+WRraE3IbqBNRkgIOVB3moERWeTNjUOcWvboo=;
        b=qiiVK0Yg3xxyu64osw7KWCOO7QVL3lvPCsLWLtd7VCksqyvZrlFqPEOsTK0Ciw8uX0
         SX05CAAjqfdL9WePlIbUSybuRaVRoxOvniNcUeP1Mgqvh73qUhif0UxV4WP+ENNi2vh7
         g/OyT3vhaSfzPlfIc8mwToXBK/NklatwMRW9x8lFuLRLT/6Tws2ZwKTShQ7fPGUiGKdG
         OewXun3/P3fWmduGoltwUj3341dv7Wj7dZXDD8TpsiCy64m4G0OIC/l75l0rvVClhy8/
         OjUzS4F40bBzWthlNxShuEqqP2b2ad9L5FHD1rbmZiK3GEH2KUYRqWqjXOa6UyhmA9yP
         i8wQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1794854063; x=1795458863; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xE4/pjASkUAynmBsoopUVVAbaBNyN5sM4lhvVCjAw+I=;
        b=3KhvarpGufVWO7lDXvtAVyMzYD8lYgjB1ajJ0pn8e7lxNUHRnUHTnBlyiV+rZZZu4O
         Vc04NRyR0ygU1ocwItyZwX+dN56Y5ZH9K1xE4a5vx8lOhpMxMiY4zKJMIDl/W4nNfTMQ
         QCx5LDwAwKiR2dQ13xfyhl5JT3GstcLYnPXfwGeyiWDhnUXaUoyKgE878dwBZD9lco1Y
         +V8jXYUkZSrmB6bPdwivKWb8P1Za0p00bD3e2KOIHtdbQqPkFlkH9ateNQZZL5w+vrJc
         J8gs+6aG4ZujQPi0NBtr+7PAClAnjL1s+WH7fz2kwoohIrejV17EuC9vS0Ufxa3Kj9Qa
         /fxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794854063; x=1795458863;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xE4/pjASkUAynmBsoopUVVAbaBNyN5sM4lhvVCjAw+I=;
        b=k3Hy9RPmhWiB17+tTsLk1leHeXnO3Do1vhSxFDzpk2OkBvE8AFXxuRH299HjRAudN0
         ANH5TJr2hzCeUEpWrzk3ju337E0mAfH9TQboBr4aEpCT/yh4yittnbw7p1Uq2YpDBbx/
         LHzO2UjVYX3H+GBDuR2/RSmdJvkRwzN3CQdoH3kzSGSXrQb3kjnI36En0I38c4BwiPcq
         Z0xbhrtic8BRPjwNDaCa5N5iMHft9ioZNYaVASoaSJV474731jGOX84yOONwGU46Jo3G
         phTpvHZJI3G0mxQTX8LJzOhzPMBBinx3TD/v8bEBvzFPK0j66IToL0CxwZF7VisSp/tE
         CWQQ==
X-Forwarded-Encrypted: i=1; AL+hErH4A4xJYHUN/DLeDJFQL6UGs2RV+OUOdBgAlmpRvuejt56zlb3IFkwyU58JXJlrFcLFWVPnKqkI+tghXzY=@vger.kernel.org
X-Gm-Message-State: APuU4Z85KRxVaAfH/anDJ15mRBA6UaKsLEfHDiRchnU9NrYDhTq5apXg
	CWW+NNovnrQV3nK870bnanThCwQIHEf5tKElCnTh3dpKf/37gUWgh1GknMNy/KvhKDg1zN9i2SG
	xrqmG3SPOfDPsryZwT5keqPTIyx1qVpkeYDa2QWDaWQ==
X-Gm-Gg: AYBFou3hs8CoGnfOd9avFlsoKq6Ox5zPscD7mEYSDLfUU9jlLAago0OiZFLugEndRF/
	y3lvRojTN+oHvKpPrxxWc3QMweL2WxW/3kA2IkzuI06Rw84PD5WGg1/atuyzxMK2/LX6cdeZa9f
	USOXI5gwNS3n/bp25Jr8eETmVC7i7Zb/BRrc/sMdMmd2KeRV05oaLlG9qesPW3Y8EDAN6h4+lS8
	uFi2+XF20JihAKzDJm4LI6KBAI08stclVd8crUDXw/e2m4OzHLmSf+DeF91Voh86IgMigSP5sEX
	hwZFchL5cmZAUu5aorHmqlYAt4aFB8lvTkiBLamTsQhgqllohfy3GJFD8TX6GAlbu7btYOdUpGi
	tegB3ybt1IH8nd9WTEOxragRnXAUtaIRIA2AeZvyNVMD0WlqYeX+Fwoux835aAyyoab+Ut363gK
	gVgM38eLvQRDGuiSK8iHswI3WR7T1/A04KoD1aQe825dgg/eBSVH9duH9LJgOUELy8nE2r6pYfZ
	Hpe9j2+m2JfihCi9NCUI154mw==
X-Received: by 2002:a05:6102:80a4:b0:7cc:174b:f7d8 with SMTP id
 ada2fe7eead31-7d64d45c83bmr4289482137.1.1794854063023; Mon, 16 Nov 2026
 10:34:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111232930.2532497-1-rjethwani@purestorage.com> <179478734781.3136.1664474557678569331@kernel.org>
In-Reply-To: <179478734781.3136.1664474557678569331@kernel.org>
From: Rishikesh Jethwani <rjethwani@everpuredata.com>
Date: Mon, 16 Nov 2026 10:34:12 -0800
X-Gm-Features: Aa3M54oqwhpZ7DHE24VaOje9VGSeB2V5NDLz8uXzzvFs8A_zY2ZCgA2-4M_xdWU
Message-ID: <CAKaoeS2dxcgTFyQ+A8b4dEskQ_6+Pms4FGPFy9tXEk3cNtHEGg@mail.gmail.com>
Subject: Re: [PATCH net v4 1/2] tls: restrict device-down TX fallback to
 hardware TX sockets
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, stable@vger.kernel.org, john.fastabend@gmail.com, 
	kuba@kernel.org, sd@queasysnail.net, davem@davemloft.net, edumazet@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, tariqt@nvidia.com, 
	alice.kernel@fastmail.im, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 4:02=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 0 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] In tls_device_down() (net/tls/tls_device.c), this patch decides
>   whether to call tls_dev_del(TX) from the result of=E2=80=A6
>
> --
>
> tls: restrict device-down TX fallback to hardware TX sockets
>
> This commit changes tls_device_down() so the TX validator is switched to
> the software fallback only for sockets that use hardware TX. The cmpxchg
> result now decides whether the driver TX state is deleted. RX driver
> state is tracked with TLS_RX_DEV_CLOSED, which is set at context
> creation and cleared after a successful RX tls_dev_add().
>
> > diff --git a/net/tls/tls_device.c b/net/tls/tls_device.c
> > index 4cdfbb57ecff0..a42cbc89db2bb 100644
> > --- a/net/tls/tls_device.c
> > +++ b/net/tls/tls_device.c
>
> [ ... ]
>
> > @@ -1350,10 +1350,14 @@ static int tls_device_down(struct net_device *n=
etdev)
> >       spin_unlock_irqrestore(&tls_device_lock, flags);
> >
> >       list_for_each_entry_safe(ctx, tmp, &list, list) {
> > +             bool tx_hw;
> > +
> >               /* Stop offloaded TX and switch to the fallback.
> >                * tls_is_skb_tx_device_offloaded will return false.
> >                */
> > -             WRITE_ONCE(ctx->sk->sk_validate_xmit_skb, tls_validate_xm=
it_skb_sw);
> > +             tx_hw =3D cmpxchg(&ctx->sk->sk_validate_xmit_skb,
> > +                             tls_validate_xmit_skb,
> > +                             tls_validate_xmit_skb_sw) =3D=3D tls_vali=
date_xmit_skb;
>
> [Severity: High]
> Is ctx->sk still guaranteed to be allocated when this cmpxchg runs?
>
> The cmpxchg is in the second loop, after tls_device_lock has been
> dropped. The refcount_inc_not_zero() in the first loop pins only the
> tls_context, not the socket.
>
> The final reference on a hardware TX socket can be dropped from skb
> freeing, and that path does not take device_offload_lock. The socket
> destructor then sees the extra ctx reference held by tls_device_down()
> and returns early:
>
> __sk_destruct()
>   tls_device_sk_destruct()
>     tls_device_queue_ctx_destruction()
>         spin_lock_irqsave(&tls_device_lock, flags);
>         if (unlikely(!refcount_dec_and_test(&ctx->refcount))) {
>             spin_unlock_irqrestore(&tls_device_lock, flags);
>             return;
>         }
>
> The ctx survives, but the sock is freed. ctx->sk is left dangling. Each
> earlier context in the list adds a synchronize_net() before this one is
> reached, so the window can be fairly wide.
>
> If that happens, can the cmpxchg read and write freed or reused socket
> memory? There seem to be two bad outcomes:
>
> If the compare fails, tx_hw is false and tls_dev_del() is never called
> for TLS_OFFLOAD_CTX_DIR_TX. ctx->netdev has already been set to NULL,
> and the final refcount_dec_and_test() in tls_device_down() goes to
> tls_device_free_ctx(), which never calls tls_dev_del(). Would this leak
> the driver TX offload state?
>
> If the memory has been reused by another TLS socket whose validator is
> tls_validate_xmit_skb, the cmpxchg would switch that unrelated socket to
> the software fallback.
>
> The unconditional WRITE_ONCE() through ctx->sk in the second loop was
> already a use-after-free before this patch, so that part is pre-existing.
> What this patch adds is that driver TX teardown now depends on that
> unprotected access, where before it used the pinned ctx->tx_conf.
>
> The next patch in this series, "tls: fix socket use-after-free during
> device-down", seems to address this. It moves the cmpxchg into the first
> loop under tls_device_lock, records the result in TLS_TX_DEV_DOWN, and
> tests that flag in the second loop. Would it make sense to fold that fix
> into this patch, or reorder the two? Then this commit would not add the
> dependency on its own, which matters since it is marked for stable.

Thanks, agreed. I'll fix in v5 by reordering instead of folding: the UAF fi=
x
now comes first and moves the validator switch under tls_device_lock.
The restrict patch then turns it into the cmpxchg under that same lock,
with TLS_TX_DEV_DOWN recording the result. No commit dereferences ctx->sk
outside the lock. I'll keep them as two patches because the fixes have
different Fixes tags and backport prerequisites. The final code will be
unchanged from v4.

pw-bot: cr

> >
> >               /* Stop the RX and TX resync.
> >                * tls_dev_resync must not be called after tls_dev_del.
> > @@ -1370,13 +1374,14 @@ static int tls_device_down(struct net_device *n=
etdev)
> >               synchronize_net();
> >
> >               /* Release the offload context on the driver side. */
> > -             if (ctx->tx_conf =3D=3D TLS_HW)
> > +             if (tx_hw)
> >                       netdev->tlsdev_ops->tls_dev_del(netdev, ctx,
> >                                                       TLS_OFFLOAD_CTX_D=
IR_TX);
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261111232930.2532497-1-rjethwani%40purestorage.com
