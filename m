Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793394843;
	b=01ZxPPC7GYcKHpsfK2DPkScTBTKlMio6ng6OyQ5dIxj2V0VT3u6An7a+6JuYzH7wfwQZ
	 FL/EJkzaH7d3r3+dfS6o13w1v5aTvXcEni12pEBkbQPzZGfZZGS/3+uYnQ/pofLzyu16M
	 q8KqqqIR8ua0dQrl7N77+YhA6EFcqJyibxPjnn4cNT+KjYEs/0Jk4wgCHYEH3gGedceM9
	 dGFJYRVuBeG7layGFFBI3e4wsF336acwiKjHYkOD44GaY3uryB1HtojJMohCPYmAiwiKT
	 PepOStuweR26rjYdzfIjK/9ud4UzMOpGtJ4nCszPrbhMsQ3q7bGD81ZaihXhDE5YBJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NAnP6kxLANFKZA48XouWqmjKSrwc1mVvKem2UvIUdlg=;
	b=nlH05nNlEDqqu7MiKw+IrMDEnfYbpjD8pCn6b/yeM5nICaAAj5cgwmZelNf0O4+COOCn
	 hh5zzp2l6drYghBx+XKM0Zxt01aGrqqVIAOwJrSc3HA4nCjoix7VJX10qa4vMEjM9MGus
	 2+bgOkYuh5QbzSwS32PTHGWe1KQyHCGKaCzxyKBlLY2Gk+R0RiqWPwC2apIF9J0rF0r0C
	 fnOXemEE0jEGEwgkEBznsKlB7b+MioeSBhn1sH74vVdk1IPRkKtX+DSyuY3NpvoLLsBHW
	 SYcdGhWzzKIun9TGRvK5b5x4puEys1z9g739sxCA0Cc7cbEOgNslSdMn1ASoeSv+iqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=everpuredata.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=WwpgwfIj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36ACE606A33A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:14:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36ACE606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=WwpgwfIj
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c38ac26cc5dso196346466b.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:14:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793394841; cv=none;
        d=google.com; s=arc-20260327;
        b=IuS22iNtX23mR3hZbKGUjSSz1y+kUgcqp0bEBEx4kj1mrbU+24mCFqoQapNY9dDd/O
         zFEgfXN5sHtCkIs28SIuZ9Lyv0s5d8xIqkLagiLk5iZf/yDd3CHhoL9A3b0AXePcqPyC
         mePVNTjsIYpCqaAeY+W1EaSSpulhNe8IfAe7eBuJ1jYwlZA6eLw6wtFDM/L0tXMksY2z
         h8RkjeNYSqp9Nquffe4oP7hcjOcSZlZjSvTsRLB+RewlhqUxmqzn1uCeGk2+sZfCaflz
         KbxX+Xbg4qYcB0qTVs8Ay1thTXzfFKiqriD7wBMcSzHP6GO1czp23ipGERFRk+sOlLhi
         0oWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NAnP6kxLANFKZA48XouWqmjKSrwc1mVvKem2UvIUdlg=;
        fh=CW+18PnqHW0YGeZ7BEv5gkF4r6+x8AS/9KlUqYbsWiY=;
        b=mhQE+DXftDusYPSfqeCIMSs6Op4jqU9HE9nBsLejzplSUes+lAMtRTGH4IRzUlgpwt
         0ZSz6+azDfY6Ze13nmXtodBckaY4EMUogM3XR4E0RCvLnlJgnt+XUuzf4az7d60m8OGp
         9i0bABSjNtCKrKxVUO2UnhPAWXsWYbL+VlBNdIlwmkksdKHjQ5ia2yf8fMrFNIKyxvne
         2H6/Y8NFKS1MiJgoxmrZ2bQDOLX2fLxzgN6nnvuyA92HocosJXFD4GC3wcCs9vWmt6nZ
         qJXZ5xW0ivZviibjnQXyMZkdlQO11K05wz4TCUWFHviecTbYkuipAMxxByt8ARdQ2UKw
         hHhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1793394841; x=1793999641; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NAnP6kxLANFKZA48XouWqmjKSrwc1mVvKem2UvIUdlg=;
        b=WwpgwfIjnHxSGLDdj+7WST/G7r4vMHlUUWnO5CyJTro+5flZDeqtywjByDFX5ZOiVn
         CIKqyB4szkbqzzv5NMX18K3gJC/MK6vbvgHeK9Ef4L8pGVeslBEDMzb7+RtNAgZuo3Jp
         Vj5yfetfpfgHFGX3dKmOOUTPH06WvqLffVSQruc2sWPcbwDmODChjkMFPR0LUKzPkEXm
         8NDO00FIGqz6BVOvNkhLEVUVJnAi/cZwnVo5bNIN5GFT5Has84/iTGU+N35CerZJS2js
         zDQCITz2JrT+9HpC0EBMPeeVLqtNtzzBqUjjIi6NHUazYHeEuwCxb5bAMP35G49vIhGK
         yIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793394841; x=1793999641;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NAnP6kxLANFKZA48XouWqmjKSrwc1mVvKem2UvIUdlg=;
        b=QC2OEmjDOJhAojOkKMbigkLv1fwDJH+aMwOfkFHxYifB/xuPCbutKD/6KrboIUl7jS
         pPSSNGO2+AuLI3oXI61sQsQdtgUarokEiMGASXmSzWynfQqwPXwuPVpyIKRvOkm06HVd
         KBMyQV02NuvJAqzsdZ1BuRazHDsMe3nWZDZc2tYOBLdOH4zA2pPb91oML3tPfvPx4q0t
         AEZg95O6SX8yuts7YbpSdgcTlnIuXgGm4oX2EPw7gxURndtxa+zkSceZHYn0ZG1/diTC
         qhaqw4LokF0JS/edE3OFPybMSpM17ShYTxSQ6Yles13SzpXKmSh8tAKhfpI2ge+S5i0o
         GxVA==
X-Forwarded-Encrypted: i=1; AKwUvBzke0CzbdGj72wLFv6KRHLlnNEoLRw/wj2/lWwgTIfad8lVt+ErZZ2S2oBB3jYdjQWUOHobCcM3m7Qcc7A=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuaemhLZa0xdiu1qJbLarjnjevgnp6cyEM9tUF6ofB5kJfCvZG
	BqO3QU7gN5HZIGfbTgssv0KnuORyfJAJDvDVIjZ6rYGxNlETgGzcUIHOVL+oqeoQAu4Xs3tupYI
	Jnc48WECOgRjW09cgByVSlq20o7+KlOWSWc0Rt7jq+A==
X-Gm-Gg: AYBFou381gfna1sB3zz1bcsO42dJV5q4bjanmJli5JIAfN4yOPNwrgXbzB0vjyY+4i7
	fyKePLttS+Bnp29Xt29ZbS9qB2v71p1z4pQcATkKm2l/EoaMb3EuC8PlhCqt2zFjBTKR093c8Y8
	tFCqz3Z/O2YBBma0ZCppSAEvUvpoLXbplK+loadoV187Eh7GEy9hnsu+j4mI26VKlZMiIJGmcg/
	vS+JhOYW4f/r3f9KZ/XS05E0XJYYgWh9EAVBP9XLyY32v24qtKK3MwXIIHzE+efcg4rHgQtrD1f
	qliPCfxTlEkvxXWgzDmItGPJKeiZBYe1sD2NhHSxbEUvpFcEFOK0EvPK/KlFcrSxlH/qfCFuJj8
	C5hHIppgbVN6+S/pCU0cS/r002tRE5Sc6Af3QblsuI7g55MnLvzzvf331duAcvvslRXyrQLdWxh
	j297Br/PhaCiGTbU5qQ+5MXP4D8fKkEAKQ6IQ47ER26u813BYHqRPZCkrZYyn1Sf8kkAL0M94DS
	i6cr+IqJIe/LkFUZZyp6cYA
X-Received: by 2002:a17:907:7ba2:b0:c29:f5d8:9c78 with SMTP id
 a640c23a62f3a-c4ca7acc84emr326601366b.39.1793394840605; Fri, 30 Oct 2026
 14:14:00 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027015205.2169253-1-rjethwani@purestorage.com> <179332515324.3134.6360748215775582303@kernel.org>
In-Reply-To: <179332515324.3134.6360748215775582303@kernel.org>
From: Rishikesh Jethwani <rjethwani@everpuredata.com>
Date: Fri, 30 Oct 2026 14:13:47 -0700
X-Gm-Features: AclHuK8Vxy3eeEQzaUkBgu3IGQBxqEg4aHyXzErmdlM6PBFVU2hDMZWIRU8IQ_I
Message-ID: <CAKaoeS1cAzgAJ4qt=sTMU6K=J6MANxzrVHS3mRhNFYeGQg1+gw@mail.gmail.com>
Subject: Re: [PATCH net v2] tls: restrict device-down TX fallback to hardware
 TX sockets
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, john.fastabend@gmail.com, kuba@kernel.org, 
	sd@queasysnail.net, davem@davemloft.net, edumazet@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, alice.kernel@fastmail.im, 
	tariqt@nvidia.com, borisp@mellanox.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 6:52=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 (1) =C2=B7 Medium: 0 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] The patch fixes two NETDEV_DOWN/setsockopt windows.
>
> Pre-existing issues:
> - [High] This bug was not introduced by this patch, but it is a use-
>   after-free write that stays reachable for hardware-TX sockets.
>
> --
>
> tls: restrict device-down TX fallback to hardware TX sockets
>
> With this patch, tls_device_down() installs tls_validate_xmit_skb_sw()
> only on sockets that have hardware TX offload. This fixes a NULL
> dereference on RX-only sockets. The patch also sets tx_conf/rx_conf to
> TLS_HW and publishes the HW validator under device_offload_lock, so
> tls_device_down() sees a consistent state and releases the driver
> contexts.
>
> > diff --git a/net/tls/tls_device.c b/net/tls/tls_device.c
> > index 1a5f328d80a50..9e0863dd2f96f 100644
> > --- a/net/tls/tls_device.c
> > +++ b/net/tls/tls_device.c
> > @@ -1176,13 +1176,15 @@ int tls_set_device_offload(struct sock *sk)
> >               goto release_lock;
> >
> >       tls_device_attach(ctx, sk, netdev);
> > -     up_read(&device_offload_lock);
> >
> >       /* following this assignment tls_is_skb_tx_device_offloaded
> >        * will return true and the context might be accessed
> > -      * by the netdev's xmit function.
> > +      * by the netdev's xmit function. Publish it and tx_conf under
> > +      * device_offload_lock so tls_device_down() sees both or neither.
> >        */
> >       smp_store_release(&sk->sk_validate_xmit_skb, tls_validate_xmit_sk=
b);
> > +     ctx->tx_conf =3D TLS_HW;
> > +     up_read(&device_offload_lock);
>
> [Severity: High]
> Is there still a third path that leaves the leaked driver contexts and th=
e
> stale HW validator that the commit message describes?
>
> Take a socket where one direction is offloaded first, the device goes
> down and comes back up, and then the other direction is offloaded:
>
>   setsockopt(TLS_RX) -> tls_set_device_offload_rx()
>     tls_device_attach()   /* sk_destruct =3D tls_device_sk_destruct */
>
>   NETDEV_DOWN -> tls_device_down()
>     rcu_assign_pointer(ctx->netdev, NULL);
>     list_move_tail(&ctx->list, &tls_device_down_list);
>     /* sk->sk_destruct is left as is */
>
>   NETDEV_UP
>
>   setsockopt(TLS_TX) -> tls_set_device_offload()
>     tls_dev_add(TX) succeeds
>     tls_device_attach()   /* no-op */
>     smp_store_release(&sk->sk_validate_xmit_skb, tls_validate_xmit_skb);
>     ctx->tx_conf =3D TLS_HW;
>
> tls_device_attach() only checks this:
>
>         if (sk->sk_destruct !=3D tls_device_sk_destruct) {
>
> So ctx->netdev stays NULL, no dev_hold() is taken, and the ctx stays off
> tls_device_list.
>
> Neither tls_set_device_offload() nor tls_set_device_offload_rx() looks at
> ctx->netdev before calling tls_dev_add(). They only check priv_ctx_* and
> IFF_UP. The same state can also happen inside a single TX setsockopt, if
> the down/up falls between get_netdev_for_sock() and
> down_read(&device_offload_lock).
>
> The result is sk_validate_xmit_skb =3D=3D tls_validate_xmit_skb with
> ctx->netdev =3D=3D NULL. The commit message describes that state as a
> regression.
>
> In tls_validate_xmit_skb(), the device never equals NULL, so every data
> skb goes through tls_sw_fallback(). complete_skb() then sets
> nskb->sk =3D sk, so tls_is_skb_tx_device_offloaded() still returns true.
>
> mlx5e_ktls_handle_tx_skb() accepts a NULL tls_ctx->netdev:
>
>         if (WARN_ON_ONCE(tls_netdev && tls_netdev !=3D netdev))
>                 goto err_out;
>
> Would the NIC then apply inline TLS to records that the software fallback
> already encrypted, and corrupt the stream? GCM encryption is a keystream
> XOR, so a second pass might even send plaintext on the wire. That part
> has not been verified.
>
> At teardown, tls_device_queue_ctx_destruction() computes:
>
>         async_cleanup =3D netdev && ctx->tx_conf =3D=3D TLS_HW;
>
> That is false here. tls_dev_del(TX) is never called, and the offload ctx
> that holds driver_state is freed. Later NETDEV_DOWNs don't see the ctx
> either, because it is on tls_device_down_list.
>
> Does this leak the driver TX context?
>
> The RX mirror looks similar: TX HW offload, ifdown, ifup, then
> setsockopt(TLS_RX). tls_set_device_offload_rx() sets rx_conf =3D TLS_HW o=
n
> a ctx whose ctx->netdev is NULL. tls_device_offload_cleanup_rx() skips
> tls_dev_del() when ctx->netdev is NULL.
>
> Does this leak the driver RX context?
>
> On mlx5, mlx5e_ktls_add_rx() stores priv_rx->sk without taking a
> reference, and async work dereferences it later. A use-after-free may
> therefore be possible here (not verified).
>
> Also, with the new tx_hw gate in tls_device_down(), RX-only sockets no
> longer crash on their first transmit after a down/up cycle. That makes
> the RX-first sequence above easy to reach.
>
> Could tls_set_device_offload() and tls_set_device_offload_rx() check,
> under device_offload_lock and before tls_dev_add(), whether the ctx is
> already device-attached with rcu_dereference_protected(ctx->netdev) !=3D
> netdev? That would include the NULL that tls_device_down() leaves behind.
> In that case they could refuse hardware offload and fall back to
> software. The other option is to fully re-attach the ctx.

This series applies on top of 1c8a70075235 ("tls: keep TX and RX
hardware offload on the same device"), which is already in net. That
commit adds tls_device_can_attach(), which both tls_set_device_offload()
and tls_set_device_offload_rx() call under device_offload_lock before
tls_dev_add(). Once tls_device_sk_destruct is installed, it refuses
hardware offload unless ctx->netdev matches the current netdev. That
includes the NULL left by tls_device_down(). The requested direction
then falls back to software, so neither ordering reaches the state you
describe. Without that commit, the sequence was possible before this
patch too.

The window inside a single setsockopt only matters when another
direction is already attached, which is the same case. For the first
direction the ctx is not on tls_device_list yet, so tls_device_down()
never touches it, and the later attach goes to an up device.

> [ ... ]
>
> > @@ -1326,10 +1333,17 @@ static int tls_device_down(struct net_device *n=
etdev)
> >       spin_unlock_irqrestore(&tls_device_lock, flags);
> >
> >       list_for_each_entry_safe(ctx, tmp, &list, list) {
> > +             bool tx_hw =3D ctx->tx_conf =3D=3D TLS_HW;
> > +
> >               /* Stop offloaded TX and switch to the fallback.
> >                * tls_is_skb_tx_device_offloaded will return false.
> > +              * Only HW TX sockets have the context the fallback needs=
.
> > +              * The single read above keeps the fallback and tls_dev_d=
el()
> > +              * below in agreement.
> >                */
> > -             WRITE_ONCE(ctx->sk->sk_validate_xmit_skb, tls_validate_xm=
it_skb_sw);
> > +             if (tx_hw)
> > +                     WRITE_ONCE(ctx->sk->sk_validate_xmit_skb,
> > +                                tls_validate_xmit_skb_sw);
>
> [Severity: High]
> This isn't a bug introduced by this patch, but can this write land in a
> socket that has already been freed?
>
> tls_device_down() only pins the tls_context:
>
>         if (ctx_netdev !=3D netdev ||
>             !refcount_inc_not_zero(&ctx->refcount))
>                 continue;
>
> It then drops tls_device_lock. For every context after the first, the
> WRITE_ONCE() through ctx->sk runs after one synchronize_net() for each
> earlier context.
>
> Meanwhile, the socket's final sk_free() can run:
>
>   __sk_destruct()
>     tls_device_sk_destruct()
>       tls_device_queue_ctx_destruction()
>         refcount 2 -> 1, returns early
>     sk_prot_free()
>
> The TX-only close and destruct paths don't take device_offload_lock, and
> tls_device_down() holds no socket reference. So the socket can be freed
> while the ctx is still alive.
>
> The TCP slab is SLAB_TYPESAFE_BY_RCU, so by then the memory may belong to
> a new, unrelated TCP socket. That socket would get
> tls_validate_xmit_skb_sw installed and call tls_sw_fallback() with a NULL
> or foreign icsk_ulp_data.
>
> The patch keeps this ctx->sk dereference for every context with
> tx_conf =3D=3D TLS_HW.

Yes. This bug has existed since c55dcdd435aa ("net/tls: Fix
use-after-free after the TLS device goes down and up"). That commit
started pinning only the tls_context and dropping tls_device_lock before
the per-context loop. The refcount_dec_and_test() branch at the end of
the loop already expects sk_destruct to run in the middle of it.

The sockets that can hit this have TX offloaded in hardware: their close
and destruct paths take no device_offload_lock. Closing a socket with RX
in hardware blocks in tls_device_offload_cleanup_rx() behind down_write
until tls_device_down() finishes. This patch limits the write to the
tx_conf =3D=3D TLS_HW sockets, which are exactly the ones that can hit it,
but the write is still unsafe for them.

v3 will add a fix that installs the fallback validator in the first
loop, while tls_device_lock is held. If a context is still on
tls_device_list and refcount_inc_not_zero() succeeds there,
tls_device_queue_ctx_destruction() has not yet run its locked section.
It takes the same lock before __sk_destruct() frees the socket, so
ctx->sk is valid while the lock is held. The second loop keeps its
tx_conf =3D=3D TLS_HW check for tls_dev_del(TX). This patch now sets tx_con=
f
to TLS_HW only under device_offload_lock, which tls_device_down() holds
for writing, so both checks agree. That is also why the fix goes on top
of this patch.

While checking the tls_dev_del() callbacks for the same problem, I found
that chcr_ktls_dev_del() releases its IPv6 CLIP entry through
tx_info->sk->sk_v6_rcv_saddr. That read happens in this window, and also
on normal close, where tls_device_tx_del_task() can run after the socket
is freed. I'll send a separate ch_ktls fix that stores the address at
tls_dev_add() time.

pw-bot: cr

> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261027015205.2169253-1-rjethwani%40purestorage.com
