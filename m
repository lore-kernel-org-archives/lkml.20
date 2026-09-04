Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9CF30146C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788538186; cv=pass; b=NimuKX7XSdNWuzPz5DFz0EX0fMsKoKJJiTuzTlJ1c2LS6I+amI3m0Q8o8z5Sc2EA8JbzYM0a4aM5Ea5YFsk8Pk1PR8YXutOtUdKkNdVvyHVXFAuMXfnodomBFkVrO8hTLOmUC6Xx3YlFDNPD6ns5P0/L2yRsXjGrt/O6Np1284g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788538186; c=relaxed/simple;
	bh=I7FTVNlZ0dogb6C0eOyzR1YPRcNP3XiCf/wTZ1Mslsg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oHwroKVLM7FWW3wW4Ed3ZdDc5bFsnoZ9AejJuTB/OlX6pn7byYYHA4E5KJst1xPf11ZjQcsfKNElTrr+gOqAyRy3qnSRuC4SFyVkq886MUkUx/j0F0JujNy7MYHq89mLoIG+ECDmzklzbnT0irRzwERSq11mKwMge2kprCfxcr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com; spf=pass smtp.mailfrom=mihalicyn.com; dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b=LYJ24fIU; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mihalicyn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b="LYJ24fIU"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a051b737d8so1108049a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:09:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788538181; cv=none;
        d=google.com; s=arc-20260327;
        b=RSljEDByW8/j2+fwB40x+FSOo2HlZV3lalrg5+NZDQjl5AgCsr9Lo+UVlcqJPab4Ma
         IJnqKCugchD1jO2EhifPxFRqKNS48vejkYa5wuTDAz9lTOhgV3eUs6Kf78EysVhbR26l
         9I7X0+YMoSa7eEUNBC5tI4wlc78duF+7lKMH8W1GQK4TKiVcrHUG10qVYm4yKvNRawlF
         H/ShTWS8/2KBnedz5pRxV7Y84qZZYoNSQ9kjT69dvuF28OAIuZxwrtmdeVgEh5YHvexR
         HJjJYRmi6KeqOzAmHYwOgh4uWaTUAUNZaiTOh5JvKLJT3zyjsqtoLWLI1jB/Cwt4ORIT
         dt8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FdR7pQWFNAy0Ig0AuVAHw6qnwdiJsW6s+mbBPNX+ky4=;
        fh=TZAPo4yzRlML+8MMWjfv79HJ/e1Y9geyGh52al/vTn0=;
        b=LAsZEks164JFozYzxNW/8LBLaJ8irnjgsRYuG+jmAiUoLG+m+dHZe9Y57Fbdbi4g6C
         AenVMyAIbSHj5BsXiHflvv8T+KZkw+QUde9Z6/tcoMGXd2FzYd/uCJMgope5OBKjdolu
         xAzDg7eSpGvEiJNjuFXVZD1ZiGuB3hlA1pWlQ6x6JcxS+hEzNrwJM4o05Q+83NXWnEAz
         LrV66uG289GWlR2qGciK46AlX7/HNO+dw1ut3hanl/5F2SxTUtnE2+rJ4RD/Md0x7cRH
         wlqWfXWS4zmQX77VTQqm2gqR2vnGJZsbNKLauxW1nZVY16n+Se7mxWtMrZvSNSx6g9PY
         QAUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mihalicyn.com; s=mihalicyn; t=1788538181; x=1789142981; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FdR7pQWFNAy0Ig0AuVAHw6qnwdiJsW6s+mbBPNX+ky4=;
        b=LYJ24fIUloVu66b4e55n54uMqyxyA2RjXm5FqIxFGM9Cubpp/LXHdFIqU5drYl5M9W
         RIQgYqmO+v2fUkKSbJwCngOh599KmOsNxRziD2G9pYDSrAjHq7jv3TURKSxKhvMNYdDT
         ZeNjbTgzYZTRtNbY1TAykIPkUFUsV7HHw7ofw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788538181; x=1789142981;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FdR7pQWFNAy0Ig0AuVAHw6qnwdiJsW6s+mbBPNX+ky4=;
        b=KOt0h1ChHJ7LHLpKMs5uQ0qMnmYONDRQZdOpW+CxFmxp9LgKDvdM9UR+ESyctfGPc9
         bnRl43bAkVJBIkzoWQSRbfMaxnQtW++kanlpet/pAw9d7wA5BC0d8+Nv67Q0S1GY0D17
         1hiY/RU+KHixCBvPfA9U6FBa7zGiZHLacSQOoDP//4XKQDLTnCRRsIjFBpobMjx56Mmx
         OWHW1iGK9XbszGRFb4woRrTrSj8p6q/68QRnNLSY4cfLrP85H6bnzO/pfUAhOB69r2sW
         Cuk2ybwASa3J4KhSo76ALlzIv074JbPhJ3qsDVh58ZXlwqN3s2PGH/bYjNmkGOyDl9ve
         mAQw==
X-Forwarded-Encrypted: i=1; AKwUvBwJcZ07lP+dTJSzT1eDMkY/RGbBG0H5Ip1DD9z1feYUJXgMHUNKGdrFg4+LxHpPUorRjwNBnGk/khQu6t0=@vger.kernel.org
X-Gm-Message-State: AFuF++lYgpIvCz7rD71kL15Y+n96qWGgwZhForcxaPuEl/ahflAVSSn0
	Ontn2UPUIM39G1GjW61D3K9UD+L6iy6v0+boMmWU1lpXB2BJs4e2+rBjZWzLqLam8Bt2EhjmR7h
	KRnd86+7h1FRaDNceMySOCrK3bw3tLkmguZvI0eE7Zg==
X-Gm-Gg: AYBFou3v4sh7Og2oNgOy402fQMtDTrn3zBMWEYqf7aY4r82fqtjcfcLucwnEd1Nn/y7
	TuenU8pPpIE4MrAa7MQBO3ny6bPvtw8iXZ85G9nzvaoRwg5IJerFYJa5agt1+Qb14l++nzVfo5O
	0jo75wjiMIHVXZAKceR8nrxlr0t4Et+le/+bPTAoZmg4EQTH7x7gK1kkTYmSVMde7QA7E4/ze7U
	OW35ivM+pBxbXOr0AGh0zN4ccKvXbkuDgE1pJmJu70+Fc1xHY1zutI/mz3GYQ1wSOPEyX8IxaMC
	6hwHdYMkOWfTHlHBgMzZxp6/8HbZ0N4/3sHVt6hlxDk4Eu+GCl0RvCc/hijDcU2aKdh9gOcGOxH
	Y
X-Received: by 2002:a05:6402:c2d1:b0:6a7:ee54:f8a7 with SMTP id
 4fb4d7f45d1cf-6a7ee550028mr1195731a12.43.1788538180182; Fri, 04 Sep 2026
 09:09:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904144636.3443342-1-maoyixie.tju@gmail.com> <CANn89iJRG6UbnYX2xo1ZJR4k=Jr+PQEb48qELK9gpKp2QATKyg@mail.gmail.com>
In-Reply-To: <CANn89iJRG6UbnYX2xo1ZJR4k=Jr+PQEb48qELK9gpKp2QATKyg@mail.gmail.com>
From: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Date: Fri, 4 Sep 2026 18:09:28 +0200
X-Gm-Features: AcwNN1Xq4Tt7rQDO1svcngvMnokM2FJKtX_ipen5pOVe3abVfNjqkDXYytdImE0
Message-ID: <CAJqdLrqGUQ2YFMAg197OrZaHrYg+-ZDkcA3c+wmZs39uxRz78A@mail.gmail.com>
Subject: Re: [PATCH net] netlink: render SCM_CREDENTIALS pid in the receiver's
 pid namespace
To: Eric Dumazet <edumazet@google.com>
Cc: Maoyi Xie <maoyixie.tju@gmail.com>, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, kuniyu@google.com, horms@kernel.org, brauner@kernel.org, 
	adobriyan@openvz.org, akpm@linux-foundation.org, leitao@debian.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Fr., 4. Sept. 2026 um 17:48 Uhr schrieb Eric Dumazet <edumazet@google.co=
m>:
>
> On Fri, Sep 4, 2026 at 4:46=E2=80=AFPM Maoyi Xie <maoyixie.tju@gmail.com>=
 wrote:
> >
> > __scm_recv_common() translates uid and gid into the reader's user
> > namespace but copies the pid as is. AF_UNIX gets away with that because
> > unix_skb_to_scm() re-renders the pid with pid_vnr() at recvmsg time.
> > netlink_sendmsg() renders it in the sender's namespace and stores a bar=
e
> > u32, so a reader in another pid namespace sees a number from a namespac=
e
> > it is not in. The sender chooses that number. An unprivileged sender in=
 a
> > child namespace made the receiver see pid 300.
> >
> > Carry the sender's struct pid in NETLINK_CB and hand it to scm_set_cred=
()
> > in netlink_recvmsg(), the way af_unix does. netlink_skb_set_owner_r()
> > takes the reference and netlink_skb_destructor() drops it. A reader in =
a
> > namespace the sender has no pid in now gets 0, like AF_UNIX.
> >
> > I found this with a CodeQL checker. I used Claude to help write the
> > reproducers. The ones that reproduce the bug run unprivileged and need =
no
> > kernel changes. Tested on net with KASAN and lockdep, no reports. The t=
ree
> > has no netlink SCM selftest.
> >
> > Fixes: b488893a390e ("pid namespaces: changes to show virtual ids to us=
er")
> > Cc: stable@vger.kernel.org
> > Assisted-by: Claude:claude-opus-5 codeql
> > Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
> > ---
> >  include/linux/netlink.h  |  9 +++++++++
> >  net/netlink/af_netlink.c | 30 ++++++++++++++++++++++++++++--
> >  2 files changed, 37 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/linux/netlink.h b/include/linux/netlink.h
> > index 882e9c1b6c1dcc..26266754e27c14 100644
> > --- a/include/linux/netlink.h
> > +++ b/include/linux/netlink.h
> > @@ -30,6 +30,15 @@ struct netlink_skb_parms {
> >         struct sock             *sk;
> >         bool                    nsid_is_set;
> >         int                     nsid;
> > +       /*
> > +        * Sender's struct pid.  netlink_sendmsg() stores a borrowed po=
inter
> > +        * taken from its own scm_cookie.  netlink_skb_set_owner_r() ta=
kes a
> > +        * reference when it takes ownership of the skb for a receiver,=
 and
> > +        * netlink_skb_destructor() drops that reference.  A clone star=
ts out
> > +        * borrowing again, because __skb_clone() clears both skb->sk a=
nd
> > +        * skb->destructor.  NULL for a kernel generated skb.
> > +        */
> > +       struct pid              *pid;
> >  };
> >
> >  #define NETLINK_CB(skb)                (*(struct netlink_skb_parms*)&(=
(skb)->cb))
> > diff --git a/net/netlink/af_netlink.c b/net/netlink/af_netlink.c
> > index e6b1d9758c9c92..170d90d472a0db 100644
> > --- a/net/netlink/af_netlink.c
> > +++ b/net/netlink/af_netlink.c
> > @@ -379,13 +379,24 @@ static void netlink_skb_destructor(struct sk_buff=
 *skb)
> >
> >                 skb->head =3D NULL;
> >         }
> > -       if (skb->sk !=3D NULL)
> > +       if (skb->sk) {
> > +               /*
> > +                * The reference is held for as long as skb->sk is set,=
 taken
> > +                * in netlink_skb_set_owner_r() and dropped here.  The =
pointer
> > +                * is left in place: do_one_broadcast() orphans an skb =
one
> > +                * listener owned and hands it to the next, which takes=
 its
> > +                * own reference, and the sender's scm_cookie keeps the=
 pid
> > +                * alive across the whole broadcast.
> > +                */
> > +               put_pid(NETLINK_CB(skb).pid);
>

Dear friends,

> I really have a bad feeling about this dance and these assumptions,
> maybe this is just me.

completely agree with Eric.

1. We need to start from use-case here, because netlink sockets are
quite special in many ways.
     If you just found this using LLM and now we are going to change a
behavior that was there for more than 22 years
     ( just look
https://github.com/torvalds/linux/blame/d679c5324d9a87c6295f56c2dea52d5f688=
34f41/include/linux/netlink.h#L165
)
2. If you start tracking struct pid (which is a good idea
theoretically, if we ignore 1.), then we should do it a bit smarter
and
    make use pidfs API [pidfs_register_pid() function] like we do it
in unix_maybe_add_creds() to make sure that we properly support
    dead pidfds too.

Kind regards,
Alex

>
> Please include a dedicated selftest in tools/testing/selftests/net/
> exercising SO_PASSCRED / SCM_CREDENTIALS
> over netlink across PID namespaces to demonstrate the issue and
> validate the proposed changes.
>
> Thanks.
>
> >                 sock_rfree(skb);
> > +       }
> >  }
> >
> >  static void netlink_skb_set_owner_r(struct sk_buff *skb, struct sock *=
sk)
> >  {
> >         WARN_ON(skb->sk !=3D NULL);
> > +       NETLINK_CB(skb).pid =3D get_pid(NETLINK_CB(skb).pid);
> >         skb->sk =3D sk;
> >         skb->destructor =3D netlink_skb_destructor;
> >         sk_mem_charge(sk, skb->truesize);
> > @@ -1880,6 +1891,13 @@ static int netlink_sendmsg(struct socket *sock, =
struct msghdr *msg, size_t len)
> >         NETLINK_CB(skb).dst_group =3D dst_group;
> >         NETLINK_CB(skb).creds   =3D scm.creds;
> >         NETLINK_CB(skb).flags   =3D netlink_skb_flags;
> > +       /*
> > +        * Borrowed here.  scm_destroy() below drops the scm_cookie's o=
wn
> > +        * reference, and every delivery in between is synchronous, so =
the
> > +        * pointer stays valid until netlink_skb_set_owner_r() takes a
> > +        * reference of its own.
> > +        */
> > +       NETLINK_CB(skb).pid     =3D scm.pid;
> >
> >         err =3D -EFAULT;
> >         if (memcpy_from_msg(skb_put(skb, len), msg, len)) {
> > @@ -1971,7 +1989,15 @@ static int netlink_recvmsg(struct socket *sock, =
struct msghdr *msg, size_t len,
> >                 netlink_cmsg_listen_all_nsid(sk, msg, skb);
> >
> >         memset(&scm, 0, sizeof(scm));
> > -       scm.creds =3D *NETLINK_CREDS(skb);
> > +       /*
> > +        * Render the sender's pid in the reader's pid namespace, the w=
ay
> > +        * unix_skb_to_scm() does through scm_set_cred().  A NULL pid g=
ives 0,
> > +        * so a control block that lost its reference reports "unknown"=
 rather
> > +        * than the sender's own untranslated number.  scm_recv() below=
 drops
> > +        * the reference taken here on both of its paths.
> > +        */
> > +       scm_set_cred(&scm, NETLINK_CB(skb).pid, NETLINK_CREDS(skb)->uid=
,
> > +                    NETLINK_CREDS(skb)->gid);
> >         if (flags & MSG_TRUNC)
> >                 copied =3D data_skb->len;
> >
> > --
> > 2.34.1
> >
