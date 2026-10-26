Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793057257;
	b=4bv13GUti2G/XECVuyrBh7b+rVRL6XaFdABg0Ai7UMRVe30xsNEyU5CTHPkFnlovLmjX
	 MYutPZ0+3IP7PNqnKia90XxyM+/475Eu3nbM7NCr4k53yg6ov2hjKIpghQFh+oUMqP/yT
	 GXzZ/X9kCXdRmV473fYRSjE8SrDDDqckniWm6I/h1EQZk086nBa/skZ5prW8K3NFUywq5
	 /AWpcarXFLMUJEUZqjaiTxjUFOZgBZMxAfukZH9M4P41hPDdbQFtKGSLxc8dn4WuGRC3T
	 3WubKAvaOffCmYNd/rSi8SWNppPY5Rf5drKImvoHSCvFUAs/E2iLa/V+NAPodM1M2zw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793057257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1mqD5M1SOnbBXQZnyfEZ1oBMiETd8QiLPN/NWhIUn50=;
	b=w4mq4e6qEIBwbe/82ouwGyQT8XR+/SngKPoTMc3oqSls+bPDM2uBswxe5RceR0u84q8C
	 JLKLkzX7kg19FrPEJx2HM98ZTakC6KaTnCSVqR2QBXAF2fCOJ1as+yEk1qekBRn9u6P66
	 B9Cq0VBtdbGKDVM479PtHB4Y8mkjtPJnVeToJzIOQCWchcN8ZDDJyxXIO4amJQd4hgGir
	 AiyEe/dTBYecnSx5QQ8qN/LuBtZqTp4kCCmJkRXphZLbUvvKHy0352x7oQst1mrcIzXKy
	 rY8eEX2t8PnPjGbVc1ZzQ7h4S6ZlEWqTnHqqNsOuYa+Y/w2VnvikSkljHXtvYHJRZ2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=bLs7jcyi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D70606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:27:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44D70606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=bLs7jcyi
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a206f0b95bso28635e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:27:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793057255; cv=none;
        d=google.com; s=arc-20260327;
        b=KWl2BRO60zvaPSTEwP7yDLa0Cj1/BBGB1DGoYQegr1gvX9+TUgwxnmn0AdtvUfYrQF
         kzllCcFRidSePcrdvL5VmPzFGWbtAWSg52x3/2qXvTiQ4DEjv9LEYg0wiJdY03YZzRkt
         3z522yrS1ak95IN1nRNUSCP7DW93Cv8nBVdSVPnEtIZEztHSr6Jsxc6yAQZ4Uhaz1V3P
         Haafxaps51lTgdlWx99DhjRXNBjJ+SmbyIj/ZIjvxEu3veyOIhRmTXwkDx4MV/qVk6Hl
         zlb9Gy/+iV3wBZN8hkVoIopDspaVRd+sSantfjgoFWQEGaunclC6sxM6XF+7FlkOIrAq
         7cCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1mqD5M1SOnbBXQZnyfEZ1oBMiETd8QiLPN/NWhIUn50=;
        fh=fSYdHy77utZXfkYaDYraSChNiqfqPJBkZGuz9s3b7xc=;
        b=SnqYaDSxHNTvi9OcJZ7BnklTzAxERiVLuDTx/j7PNK0C+1I6vliqy35zVoCUx9PR2C
         1ey8gWi+vITgljz4dNK5v2yScXgId3jjqqQZSKdBEzIzyIpzszzc18XfF+800Ap5Xd3H
         pPXVmVtA8XxNL8poyG/yBv31jdLwLEy1bioraMGF5OFKq8p0RFjmLb+p/3rdrsGNU3yq
         p/35qqkElMSPCq2OzT+dDEx0yLaTlmwEmT+halTb8h9ydBHebV2glaq7ZL8V8lwSHeDR
         NGrJENK5B+UC9wPDBoR87ghEIn+jX5gYovrra5UsYE1LzEFNQwIZ+sKRo7xWzWAqmNWA
         24ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793057255; x=1793662055; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1mqD5M1SOnbBXQZnyfEZ1oBMiETd8QiLPN/NWhIUn50=;
        b=bLs7jcyikitVpBLAUtc5L2B1UIJNgHuQGB0/pF4n7y1CCVCfe3qDOSBQ5pAnBzBmhG
         KPimts657MIy49F/7/Gvs2NaFGibHWpc/d3yhvQSzXhK2X13IvDrJ09P56agdXF4CKvc
         3MFmEflF+bzmb2Wx7Db0Mam0uMCk9WkSC5BQEVFpkr7EmWZdMXuEvYqLR81Ukxpvzd9y
         Kqo0F50y/t9+iT40S//H2VQXPX4QagP9gO2Z+a2LNk7UypsLyx0Y3LRF+qq9e/mNEnOB
         LMWGFVLALngr33ZvctHC9CHs4wFwaoMg1C88TBSFAmFnGeLceehulTsRF4FFnCUr6wpL
         lCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793057255; x=1793662055;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1mqD5M1SOnbBXQZnyfEZ1oBMiETd8QiLPN/NWhIUn50=;
        b=uSDnykVqk7r7Fxa2Q/lRtIjqIsL8wF3Jp5XV6lOBvQN4QU9C/59FPsKcGxWiHdGohy
         GMn50mMDgUqcZf87c1JyKw6tGI2n6xceIfXCgn2Hk4Jm0EK8QRLJgtT+rENmv6N7H21w
         vHITnK6VRKaILuXah5fvqCXfEvh+VFEOxYhvWxySz/3U/IDmWMFfkcrnQNRnuJ4sROfM
         OasPEIA1jkvCo3OSLc42uDX9qkRqee2Hh63BRECheBaPGFhFXJHXQDfwe+EmM5x0T4ue
         sUKKE8ZC2tFmawtmMLIbWVI2CImw9mf/Jy5Wuhf+mEsOA6RAxT9Zd/2rpKz49owoa9zh
         0PYA==
X-Forwarded-Encrypted: i=1; AKwUvBzSTbmTHAxnoSwK80FK7A3khoVWeEE9k7O8TBsS5BGniQoSdKwqP/PKnGtl326qXxaBcBmP0ddPVdozBQo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKYo0UhW0nipttnB7R+pZJitYi9GZl1dvyW90z4TiVCeSOhBnO
	Qah23+fkyqFrfHOWpfCD0o9FVk3aRtSkCFkVSyESVAUfs2yMXRYXxY2+qw3LqEBVxT/vc6kKYFn
	t+vZc0lZ0hAXOshV8Mw9eAQebw+9R44bsD0wQtFPZ
X-Gm-Gg: AYBFou0/UR7hSSW3fyBO0IBX6hTmVl/n+fKxuUf7Uuigx7mc2oWl3wYKgPTik8VvyHk
	NG3p58j2PTTdpF3OgiQQGjJdKy9SlO4XEceRNqnGteI+bCtDsZ3dXWokT2xUbllGkeaqu78eMKr
	F0+hcLxKaCl64cTrEca5pnyUtanIvLx+B74OX6nG6bGxw9OzJuRw5WH5TVg/PQapH/kjBlmXybN
	pRD9PVD5+q0RroItPL84AVsbWRpJcexXoCoZIgdpC1/ptBD+AxIiRjiKhhESbHivptfnVUsc6iG
	l9E155NX24bxgGS/0qxTNKcEkAQKlKlefVhsWzwVoqGPbBjfahUPrIGvsOIChEL4V6nKxfpa10l
	1B1cWTebjtZRVJNpB/S9rtZ7yfy9OeIhexSJs7eTwYq6POSOHJB7h70ztQuuefRS7T5E=
X-Received: by 2002:a05:600c:6385:b0:4a2:1053:8854 with SMTP id
 5b1f17b1804b1-4a7fa6d7103mr238195e9.7.1793057254910; Mon, 26 Oct 2026
 16:27:34 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026221306.3151025-1-namangulati@google.com> <at_TlVBS-5KVZAkg@devvm16445.scu0.facebook.com>
In-Reply-To: <at_TlVBS-5KVZAkg@devvm16445.scu0.facebook.com>
From: Naman Gulati <namangulati@google.com>
Date: Mon, 26 Oct 2026 16:27:23 -0700
X-Gm-Features: AclHuK8Cd20sFe09QIEr5z-xvF2Lx3z99lk5bXEqBpQ_ECzBPmwROmoKDtup8iQ
Message-ID: <CAMP57yVNVLsGJs5goWDZeoOtm0wOZDFziXpou3c_9fuTt_5r3w@mail.gmail.com>
Subject: Re: [PATCH net] netdev-genl: ignore NETDEV_UNREGISTER rebroadcasts
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+1269fe6cc2016008124e@syzkaller.appspotmail.com, 
	lege.wang@jaguarmicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 3:28=E2=80=AFPM Stanislav Fomichev <sdf.kernel@gmai=
l.com> wrote:
>
> On 10/26, Naman Gulati wrote:
> > netdev_wait_allrefs_any() re-sends NETDEV_UNREGISTER every second while
> > it waits for the last references on a device to be dropped. By then
> > netdev_run_todo() has already marked the device NETREG_UNREGISTERED and
> > RTNL has been dropped at least once since the initial notification sent
> > by unregister_netdevice_many_notify().
> >
> > netdev_genl_netdevice_event() does not tell these rebroadcasts apart
> > from the initial notification and sends a NETDEV_CMD_DEV_DEL_NTF
> > multicast for each of them. At best this spams NETDEV_NLGRP_MGMT
> > listeners with duplicate notifications; at worst the pernet state of
> > the netns the device belongs to is already gone and the handler
> > dereferences a NULL pointer.
> >
> > default_device_exit_batch() only unregisters the devices still listed
> > in the exiting netns; it does not wait for in-flight unregistrations of
> > devices that were already unlisted (the barrier doing that was removed
> > by commit 8a4fc54b07d7 ("net: get rid of rtnl_lock_unregistering()")).
> > So when a device is unregistered by something other than the
> > cleanup_net() of its own netns while references on it are still held,
> > e.g. a veth whose peer in another netns gets deleted, and that netns
> > exits while the device is stuck in netdev_wait_allrefs_any(), the
> > remaining pernet exit handlers run and genl_pernet_exit() sets
> > net->genl_sock to NULL. The next rebroadcast then crashes in
> > genl_has_listeners():
> >
> >   BUG: KASAN: null-ptr-deref in netlink_has_listeners+0x3d/0x3f0 net/ne=
tlink/af_netlink.c:1388
> >   Read of size 8 at addr 0000000000000578 by task syz.0.0/5325
> >   Call Trace:
> >    <TASK>
> >    netlink_has_listeners+0x3d/0x3f0 net/netlink/af_netlink.c:1388
> >    genl_has_listeners include/net/genetlink.h:644 [inline]
> >    netdev_genl_dev_notify+0x161/0x450 net/core/netdev-genl.c:93
> >    netdev_genl_netdevice_event+0x98/0x3c0 net/core/netdev-genl.c:1491
> >    notifier_call_chain+0x1a5/0x3d0 kernel/notifier.c:85
> >    netdev_wait_allrefs_any net/core/dev.c:11690 [inline]
> >    netdev_run_todo+0x731/0x1060 net/core/dev.c:11808
> >    rtnl_unlock net/core/rtnetlink.c:157 [inline]
> >    rtnl_dellink+0x68f/0x810 net/core/rtnetlink.c:3707
> >
> > syzbot hit this by moving one end of a veth pair into a short-lived
> > netns while netdevsim's deferred FIB event processing still held a
> > reference on it, and then deleting the other end (repro [1]). While the
> > source of this bug is netdevsim deferring FIB processing for and holdin=
g
> > onto the device reference for O(seconds) which is being fixed
> > separately [2], any driver may introduce such a delay and trigger the
> > null-ptr-deref.
> >
> > Skip the rebroadcasts, which are the only NETDEV_UNREGISTER events
> > delivered with reg_state =3D=3D NETREG_UNREGISTERED. The notifications =
sent
> > by unregister_netdevice_many_notify() and, for a device leaving a netns=
,
> > by __dev_change_net_namespace() are issued under RTNL in the same
> > critical section that unlists the device, before its netns can be torn
> > down, and keep being handled. This mirrors what ip6_route_dev_notify()
> > already does to cope with the rebroadcasts.
> >
> > This change should not break the UAPI spec as it defines dev-del-ntf as
> > a "Notification about device disappearing." which is a single event. Th=
e
> > rebroadcast in netdev_wait_allrefs_any() exists to re-kick in-kernel
> > subsystems holding references; netdev-genl happens to be on the notifie=
r
> > chain and forwards it.
> >
> > [1] https://gist.github.com/NamanGulati/2d1b49b8757f9a88b0bd6e55018c02a=
e
> > [2] https://lore.kernel.org/r/20261023191517.607834-1-kuniyu@google.com
> >
> > Fixes: d3d854fd6a1d ("netdev-genl: create a simple family for netdev st=
uff")
> > Reported-by: syzbot+1269fe6cc2016008124e@syzkaller.appspotmail.com
> > Closes: https://lore.kernel.org/netdev/6adf9f64.6200f071.51519.0ed1.GAE=
@google.com/
> > Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
> > Signed-off-by: Naman Gulati <namangulati@google.com>
> > ---
> > Note that the reproducer attached to the syzbot bug targets a different
> > bug (via devlink_port_notify() on netns teardown) that happens to share
> > the same crash title, not the one in the original reported crash report=
.
> > ---
> >  net/core/netdev-genl.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
> > index 33b9f4eb9565a..2032ab9a864c2 100644
> > --- a/net/core/netdev-genl.c
> > +++ b/net/core/netdev-genl.c
> > @@ -1487,6 +1487,12 @@ static int netdev_genl_netdevice_event(struct no=
tifier_block *nb,
> >               netdev_unlock_full_to_ops(netdev);
> >               break;
> >       case NETDEV_UNREGISTER:
> > +             /* netdev_wait_allrefs_any() rebroadcasts NETDEV_UNREGIST=
ER
> > +              * while waiting for the last references to be dropped; t=
he
> > +              * netns may already be torn down by then. Notify only on=
ce.
> > +              */
>
> [..]
>
> > +             if (READ_ONCE(netdev->reg_state) =3D=3D NETREG_UNREGISTER=
ED)
> > +                     break;
>
> Same as
> https://lore.kernel.org/netdev/20261026063743.1797-1-lege.wang@jaguarmicr=
o.com/
> ?

Yes, sorry, same as that patch - which I missed. The author sent that
as an RFC and mentioned they're happy for someone else to take it
over. I'm happy to iterate on this and credit them unless Xiaoguang
prefers to keep working on it.

>
> reg_state is protected by netdev, why not do this under netdev_lock?

No strong reason. I read it outside the lock because the rebroadcast
runs on the same thread that set NETREG_UNREGISTERED in
netdev_run_todo() so reading reg_state under the lock is not strictly
required, but we take the lock right below so can move it there if
prefered.


> Also seems like we are fixing a symptom, not the problem?

Since 8a4fc54b07d7 ("net: get rid of rtnl_lock_unregistering()"),
cleanup_net() doesn't wait for devices stuck in
netdev_wait_allrefs_any(), so the rebroadcast can reach notifiers
after the device's netns has already exited. However the rebroadcast
is only a retry to make ref holders let go, not a new event, yet
netdev-genl sends userspace another DEL_NTF for each one. I don't
think userspace should receive these redundant notifications, even if
the device still exists and we avoid the null-ptr-deref.
ip6_route_dev_notify() and mlxsw_sp_netdevice_unregister() already
skip handling the rebroadcasts the same way, by checking for
NETREG_UNREGISTERED.



pw-bot: changes-requested

>
> >               netdev_lock(netdev);
> >               netdev_genl_dev_notify(netdev, NETDEV_CMD_DEV_DEL_NTF);
> >               netdev_unlock(netdev);
