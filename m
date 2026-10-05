Received: from mail-oo2-f38.google.com (mail-oo2-f38.google.com [74.125.231.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214A447D464
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 11:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791200203; cv=pass; b=p4RMBNJdrQhSudoAwi3tLQdWsZlqI1V6mS2OxvaGDUJHYxHO+6Q31hRKzjarDFRo7r1dmvHrySX4iJgL/tNQ+5pBcoUtLeEv4QcQkizxfRYiB6tujRZsnc8aalUx6NMl56+UcR2NGm1pCGIyOyTODsXwrTNMa21BnI35rFI/27Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791200203; c=relaxed/simple;
	bh=iQs9u5Dxt5qA1L2dSEQtGGHrdemsHVwPrDyyj9Xyad8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kwZQfXyEz/Zzuq+0qXxgVAGGyGQzI0ZAN2e94V9E+I1Hgk4+cNdPTBRkbmt7HGyprX7wyOKRZe9Ifl60QsNZOeKQ7Cc0BgU54H9xkKqp+xVnynLY35IgdSduNVad4ZzsvtpFH0tqgHKGa9Xguo5Be+deUMwO0IioRBqeP1s+XMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hD1eZxn9; arc=pass smtp.client-ip=74.125.231.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hD1eZxn9"
Received: by mail-oo2-f38.google.com with SMTP id 46e09a7af769-801cb343a92so304377a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 04:36:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791200201; cv=none;
        d=google.com; s=arc-20260327;
        b=ZFJ1B669amNdwd6ewVF2C6Mqeq+UA2y43uAt4wva70vTqltCQzijzdJUahiykz8vbn
         WvW19FkAFHChJPLLfPtQtmeXfmb1daFX+K6g6qLbS5Alx9XzYu4QECIrNpgo+hDz/CY4
         nyIsKKG0+r9PbS/2oquD/V/3W2OkMmr39qSO7vxvAB+21r5u95gLDMz3g2IdMTL1qgiF
         v3/14BMs6A9nnbaD2nEvs81NtKnlt3tY0qwE3YSxVxpU4GSb1vyfwdjFmSIUxjgU7IAC
         Z45fa8i2QJN1NAWo21PsExaWkvhUVOtv2pS4iNBqOzE2Tnt4ovDRt9gMkGoEvrG9Q4na
         H6tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g5J2HOgwSoitKKDvvN0FWjMcbKZZ6kViLYOEdGgUDcs=;
        fh=h2nLpeBbl4J2CmIzFAU5l+2w4ORxUcCF/DmxukG39YE=;
        b=kuw7Y3zEvtuwVW3NwP9wBF3i3gM375Ct+4weHYYCyV4ij2G4/Xyt46O6d8vjvYsTik
         tkYdtl9mhWKXhLmu0w6057pRHPVgYXSxCSvAPU3vMynJZksogYrpbcCbyE1hn/nMTRP/
         Hnqal/zVePwfSJ4aLZl+4OrxDGWNBKhRDYH0cYxIJu7lKQabHwOxUTWqbM2jdURgLvCy
         llPYdbXGgPBCV/3z4r4mwYzWvhbWqmgJDE4sbq8tvNeiGORL8FcvEzA1Xyk+Kdf4Usf2
         fsjjHcATDauaqwdc8x6eww6+jrGD0hEJMwPQhwj2V+V7dbugf6OLZJqqZr6BaNvS4Bw8
         grXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791200201; x=1791805001; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g5J2HOgwSoitKKDvvN0FWjMcbKZZ6kViLYOEdGgUDcs=;
        b=hD1eZxn90yb6czilSPxF01HfBGNc81p66NbWd5f/4SzKzYqfoSL//hJGe4tkdd7Qj5
         vhADNdXLY4tsinOKR5BeQo6GWyfR0JUc3xJEUDYxfcx/BNh6TbxDUGQ/np+tI7kV+zM5
         GWlnQ+9ukg0TuVNq/oopg0uCLKFShaBkk6rS4XQVqatcg1QS9vknmglhQi0F+6BPzZSe
         TkFulF3jP4IzxYTYtGXSWWYUUOMBpls5UhDWYxKhhcMxtnBHvbuGVRUGk9tBD9JF7z06
         XaXCZxguUxNe5IaM3IqrAYfgkswlVOZOfFX/3JfX+sCmMJSiMzLNK/hiT5D92YF4kpSP
         s3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791200201; x=1791805001;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g5J2HOgwSoitKKDvvN0FWjMcbKZZ6kViLYOEdGgUDcs=;
        b=KRM0dUgNjGa4BI6gUpvORj5VOyM/n8JfaGOaAwEoizhSac4NndJiepu6J8AtAniNdr
         DyQ9tcZvHmbqnUrrkwqDUD8p4KSUAD7Fxg65gnw1cMXy0fhKgGgo1RHp9EUSbeCcR29H
         KLi5SJzynuhgbP+v2ZU0u1q4PcR3gQuQxXcs+ffyAKKGd6N3kUqpp6t+imheD1j86AOC
         YWrFOEgep2Yzj62YWjYloitB3MMlDjavVmL+Wvfn4Mhd9+g1gLlPI+/AON5Ovqm/t66W
         0j3DvDsi9pDvJGlWL7kDBXwoEN+DD+QMG7WgFFWfXHGnPgIu8YC74R8XQkXeekmVTCMB
         D5ZA==
X-Forwarded-Encrypted: i=1; AKwUvBx380041tXoRX7HwWd/aHBcTdxXZ5c2TNTJW5jFqlvMCPO4gpwm230bWdPwKWR6LbRL2LSvONbVjahvoJw=@vger.kernel.org
X-Gm-Message-State: AFuF++noFahe2MLr0Vc1/tgW2ibQw3oTvF9m1ilgaR1A33cUnrWlZNuq
	DQSuzy1TBWQOlMxk9Cal2k5L/FEQdMVI+1NVdnNTt2cxOb26FYFdw8O3s2tFKwEJw5pmvxkW86U
	MYQ54w8HU+mxKnd8DpXcJtLclPGLSmXY=
X-Gm-Gg: AYBFou32DCfbo2soZvdKH7k9LUruVSl6VAQZMPuRW3rqcWS6zFRYGz7kIAMET+wJa6W
	u68W0WYE6vcDaz9wXH6kFITMJZxM5r5yuSTccltXkOXjyJibN/qzVCfm1kZ3tp0D8HGA193ywBB
	k92IXpAr0E6Oc3I4PvWhJchJPmY2chtIJDX3RS+A4xxwgesVyNp4vPaJrCacLTH0qem5vu5SFUy
	Z4kQYqaY8UvNpaH7QfFnoU2fHo62C3EOTQf/ZmuQyFmOBI6l+gfyrwnzJu7WWE09/SFWzQjx2B8
	gmKLWdYONjHiDO91rZDJPhj0+Lq76iCDNDL1i/eRTyKfkq8vAUJ9clqWvkCl8ttlD4nq5ys=
X-Received: by 2002:a05:6808:3084:b0:4e9:73ce:e2a5 with SMTP id
 5614622812f47-4f52aea9cd7mr11914029b6e.6.1791200200790; Mon, 05 Oct 2026
 04:36:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-netcons-fixes-v1-0-bb5ffe5e698a@gmail.com>
 <20260928-netcons-fixes-v1-1-bb5ffe5e698a@gmail.com> <ar51wR0vG6QL2egY@gmail.com>
In-Reply-To: <ar51wR0vG6QL2egY@gmail.com>
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Mon, 5 Oct 2026 12:36:28 +0100
X-Gm-Features: AclHuK-Ind_gLUAUpXypTDGhx5aprFrQV_UWxhirAUIPDoPPuFVwYJtBGqXQ9z8
Message-ID: <CAGSyskVS_OqLXNeDyBbdCGghQqh7SLVUg1FHUC_vHgDKof4rnA@mail.gmail.com>
Subject: Re: [PATCH net-next 1/4] netconsole: finish enabling the target
 before releasing RTNL
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matt Mackall <mpm@selenic.com>, =?UTF-8?Q?Bruno_Pr=C3=A9mont?= <bonbons@linux-vserver.org>, 
	Stephen Hemminger <stephen@networkplumber.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 4:03=E2=80=AFPM Breno Leitao <leitao@debian.org> wro=
te:
>
> On Mon, Sep 28, 2026 at 07:00:03PM +0100, Gustavo Luiz Duarte wrote:
> > netcons_netpoll_setup() publishes nt->np.dev inside __netpoll_setup(),
> > then releases the RTNL and waits for an RCU grace period before
> > returning. Only after that does its caller store STATE_ENABLED:
> >
> > A NETDEV_UNREGISTER event landing in that window tears the target down
> > and we end up storing STATE_ENABLED with a NULL np->dev, leading to a
> > null-ptr-deref in netconsole_write():
> >
> >   BUG: KASAN: null-ptr-deref in netconsole_write+0xb9/0x7f0
> >   Read of size 8 at addr 00000000000000a8 by task pr/netcon_ext0/135
> >    netconsole_write+0xb9/0x7f0
> >    nbcon_emit_next_record+0x501/0x550
> >    nbcon_emit_one+0x10e/0x170
> >    nbcon_kthread_func+0x2ff/0x3b0
> >    kthread+0x199/0x1e0
>
> Oh gosh. Thanks for hte fix.
>
> > Store STATE_ENABLED before dropping the RTNL lock to avoid racing with
> > netconsole_netdev_event().
> >
> > Fixes: 2382b15bcc39 ("netconsole: take care of NETDEV_UNREGISTER event"=
)
>
> This should go to `net` instead of netdev.

I was unsure whether to target net or net-next because these bugs
require root to be triggered.
I can resend it targeting net. I assume the same applies to patch 2/4,
so I will split 1,2 -> net and 3,4 -> net-next.

> >
> > @@ -552,13 +552,16 @@ static int netcons_netpoll_setup(struct netconsol=
e_target *nt)
> >       err =3D __netpoll_setup(np, ndev);
> >       if (err)
> >               goto put;
> > -     rtnl_unlock();
> >
> >       /* Make sure all NAPI polls which started before dev->npinfo
> >        * was visible have exited before we start calling NAPI poll.
> >        * NAPI skips locking if dev->npinfo is NULL.
> > +      * Hold RTNL until enable is finished so we don't race with
> > +      * netconsole_netdev_event()
> >        */
> > -     synchronize_rcu();
> > +     synchronize_net();
> > +     nt->state =3D STATE_ENABLED;
> > +     rtnl_unlock();
>
> Why do you need to synchornize-rcu with the RTNL held? Why not enabling
> nt->state, releasing the lock and than synchronizing RCU?

My understanding from the comment above is that we need to synchronize
RCU before allowing netconsole to start calling NAPI poll.
And (nt->state !=3D STATE_ENABLED) is what is currently blocking
netconsole_write() from calling NAPI poll.
So if we enable nt->state before synchronizing RCU, it would regress
the hang fixed in [1].

[1] https://patch.msgid.link/20250726010846.1105875-1-kuba@kernel.org
