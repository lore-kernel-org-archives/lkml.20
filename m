Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AD23AFB1C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 05:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788500544; cv=pass; b=lyeKvKgXJ1n8Fh+mcmibh6XlynhwbU2YX6eA15SGSJpbkxNYCMX+HLh4GFtA4yW0Elqz07ylk5RKxC9yalCHMPk3QWLjJn8QgHrXB+etVMUDxlh+fiB9He7Gd1OJ3j+5LVT2z1zblaTJlmyymsIDhUO0PUXpERuAPdVA7ijhT7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788500544; c=relaxed/simple;
	bh=7a9ytScdRalaQfs49ax3SHBjSOpZN0zrjBNJQ4qqRgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AKo6SAMnxAgMn8bJsE/FuZtJtQKOe/SjzMH0KCxKFaPXiugvyMvPrt8N/vwWij2ks7V0Cac0H7rTk/oHraYCsXvZ/01FwbV28VaQs8joiUPfVpudstiWW6GKZjZjs/ZMt7aE8IjumOQyEHaz/RsPRM5wGj/AYhIW4WhAOeu+frQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=XR5HqxlY; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="XR5HqxlY"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3a20f06cce6so5585091fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 22:42:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788500540; cv=none;
        d=google.com; s=arc-20260327;
        b=WAHelfjPDR9LKTB3kGTbhui1F869k0xbd4D18jnQa/HjkkuEVlyDqP89RWVMClLO/9
         4+w8HiZKy743OnnVyBxByeLQqqKkrKgqmlTtufYbSuh+WFXe5EVBsCMV7g+q799ALWca
         f+inEJ4H6d7OakiBZtSqHHbYAmW8jPfLDxQlfq+gF88j331HdUgQtAN/Zb9UnR/us0lh
         oYajFaUnUZjD7FKQQeXqQubAvgLtkJ5uAcB2sgi5b5LznpvucKoKp32f/A8E8eZSAU4m
         tYJKtC1z0CgiX8OzYu+Wom1Ek9tybOUJmAFa3ZaEVKPlpbrmOK7uia9Ymx/gYdGGo6TZ
         WGCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WP9LYTFZF8MbWwJfhaukl4r1/bwWhLGNTeX8IkDlRSA=;
        fh=VnL/cSKhCHi0V8v/uPxIq7imNSv0AJqdP5cCSJDUBYY=;
        b=X2EhdO2JlHBwQjE6yvcg1fRIOqE7DsfP29OZY9Cd59J/GxRlKfe3XAvnqzLQyMoYi9
         +7I0yvwPjvt8hKBByTeaQSim+w+meWSM3O/hI1eVb9+pTE0+UB3AwdiGtaIklJpiyuwU
         UQAWnn9cwbwEFr5y4IYxNDOxIE5hBcFrMZz8pHX6lmgSzGTLV17v+ZCF+9Dfxp9KWPeV
         uKRC2lAX+fhwRHKxsFO4Psaccisr+w1tfRI360f66jUKRCpdgOfsL75I7D9wyozMJqWf
         oxHJ5Dz3XIZ8JFAqsw/cOKFKgDUyPM2A3lwIrGqdbkkeM2QjrKFrO2ypHA0ZRFVQphgh
         h7iA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1788500540; x=1789105340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WP9LYTFZF8MbWwJfhaukl4r1/bwWhLGNTeX8IkDlRSA=;
        b=XR5HqxlY+Mahz09OZo80Hn5QddQI+Y1xc3wGYM51C8r9jjtRqYpb4SQQjkDxdVIf8t
         yg/7H0yiRLPckeljaBeJLoYWMwdba6Qkt1Lx5+hTquI9TKokB9ICbn8+DmzaKCSqlXKf
         Wo/Jbzjorw2r+LnW5tCHlc/njxQF4RQ0dJrPMbJmhyaFGRUJSJBrq4nx3q9IW7vTNnq/
         BeuTWl6Q9u38q8wnXz3MlgwGfgz4ZqbxoYkL3p25HWalD0+lSk1mpDi+md8c/6+jJiac
         nunhIciRrKl/gYvB5spC4JADvuexX2vmokSm6G+ccMuiBwhPyDeD4f20CHrOiPEw5G6r
         04Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788500540; x=1789105340;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WP9LYTFZF8MbWwJfhaukl4r1/bwWhLGNTeX8IkDlRSA=;
        b=pZ8BhqPCTUAlyayjE9q3+GqKOwdt6wWoA/6CkSertSiGz/Qk5aSnIJUI3scuZDefb8
         GgOQkXBWx51OU7GCAMrWW/tycahI+X7E/EqW6Pj6LT0HDuTA/ntZnmimBNZtHHis/N03
         wb1r2PnbbzBIVfdZ3upMjxX85WQ5BxG8mKMiZC0M7p1M1Lbn+fJxQtR2iP9sqYxGXkH4
         AilWqQUKG/KMYWgg2jf8id8fCvOFkDvF39uYvVNb03te2GCIDdKfcrFJs/Xjm/K1HviG
         bAg8CWYf/PN9M/ycfBLGf9SL4y6kWYQVXqEU2C06wH6J1Vn8t2et+iGlMmSo8GU3bvxT
         HJwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbCd7PhUwCE7lxmmAOHxpzos8iqCEzGobRytxcwjwIv5yHW5aDGiY3ZK0U508xvcl1RBCFaUcU5PogSZ4=@vger.kernel.org
X-Gm-Message-State: AFuF++mGWc8fZQUwi6NdRy2m3MqgUznqYQh8TwM+fFv58LUjKB1nNhAz
	1CDXrCmbOV0dP1OR3z3vFS3XtJ21ymtPilBnbms/BNl6RgjVvzaYRiWL9iZ3+AHGq6frGHga0rs
	/ET0FYJqupgq1SXPKXV1Bbg2fX9sfKxXhMn/dRcmzGWI=
X-Gm-Gg: AYBFou0ETj93VUJaeIc7EPpytwVdMpuT7uznrFfpBBRcvDOsPkIg+GgspNefGm9lbaq
	CgilQaVH0K0bCYNEekv7/BKOje4YYcjFzqApqj92fLLujuq7diGwDCjfBvCi1swj0LbUn8p5CGP
	PthS7a3xYr/mgTY6FyUJGRMgS9v/eebk3mOwKvcAttjHQW1wUs9W5YmJPohjdfr+SQVnwb4nSbH
	F30gnYb35Z2lqxQAQabU7ELixgN9tUgtgd3nf+crwJbEAdtBu/S7TOKBPp3kMEr2mfXbeJaL7kp
	ABwb4Kyt6wu55lRK8iSQTS0paFfueAyfOByxiw2eAXkrMqAfk4SnujaBwJ/H2MDyE9WKUp0S1lM
	=
X-Received: by 2002:a2e:b8c3:0:b0:3a3:61ec:43bd with SMTP id
 38308e7fff4ca-3a361ec44d3mr7558051fa.14.1788500539833; Thu, 03 Sep 2026
 22:42:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788259244.git.zihanx@nebusec.ai> <34824eaea68a895a3fe9ed5337248eca1d81f74f.1788259244.git.zihanx@nebusec.ai>
 <3674f5d34d731403bfa0e680c9e5718237612315.camel@iki.fi>
In-Reply-To: <3674f5d34d731403bfa0e680c9e5718237612315.camel@iki.fi>
From: zihan xi <zihanx@nebusec.ai>
Date: Fri, 4 Sep 2026 13:42:08 +0800
X-Gm-Features: AcwNN1UfMQ3DTycfG08OX_qcUrL1qPCx5CxEUb6NKsdMUjjJ1Z01C_kABixHz6I
Message-ID: <CAANe3eTturj=T-H_O+eA=XF1jcJdt0TkRnG_UJEbeGsvgr-Gyw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] Bluetooth: Fix parent socket UAF in accept queues
To: Pauli Virtanen <pav@iki.fi>
Cc: linux-bluetooth@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pauli,

On Thu, Sep 3, 2026 at 11:11=E2=80=AFPM Pauli Virtanen <pav@iki.fi> wrote:
>
> Hi,
>
> to, 2026-09-03 kello 11:11 +0000, Zihan Xi kirjoitti:
> > Bluetooth children queued on a listening socket store the listener in
> > bt_sk(sk)->parent, but the accept queue did not hold a reference on
> > that parent socket.  The child side can later fetch that pointer and
> > unlink itself from the accept queue while still needing to notify the
> > listener, for example from L2CAP, ISO or RFCOMM teardown/state-change
> > callbacks.
>
> Please revalidate the KASAN crash on current bluetooth-next/master,
> there have been related fixes since v1 of the patch and the v7.2-rc6
> shown in the KASAN crash in the cover letter.
>
> With commit d4bfa78fd679 ("Bluetooth: L2CAP: reject accept queue add
> unless BT_LISTEN") in v7.3-rc1 cherry-picked on v7.2-rc6 the POC no
> longer reproduces for me.
>

 Thanks for the review.

We revalidated this. On bluetooth-next with 9db7e5fffbae ("Bluetooth:
L2CAP: reject accept queue add unless BT_LISTEN") =E2=80=94 the same change=
 as
d4bfa78fd679 =E2=80=94 our PoC no longer hits the l2cap_sock_ready_cb UAF.
That matches what you saw after cherry-picking d4bfa78fd679 onto
v7.2-rc6.

The KASAN report in the cover letter was captured on v7.2-rc6 after
reverting that commit. I should not have presented it as a crash on
current bluetooth-next/master.

> ***
>
> The design intent AFAICS is that the accept queue of the parent socket
> shall be empty when the parent socket is freed.
>
> Otherwise, the child sockets in accept queue would leak.
>
> There must then be parent->sk_state =3D=3D BT_LISTEN check before
> bt_accept_enqueue() and some were missing in v7.2-rc6.
>
> bt_sk(sk)->parent read/write is guarded by lock_sock(sk), and it is set
> to NULL when removed from accept queue.
>
> Dangling bt_sk(sk)->parent should then not occur.
>
> If bt_sk(sk)->parent !=3D NULL is observed under lock_sock(sk), the
> parent socket is valid during that critical section.
>
> The sock_hold/put(parent) in this patch are in lock_sock(sk) critical
> sections, so should be no-ops.
>
> The accept queue items owning reference to parent also should be no-
> ops.

Agreed. Once the BT_LISTEN check is in place, close() empties the
accept queue before the parent is freed, and lock_sock(sk) serializes
ready/teardown against unlink. The extra parent references do not
change the lifetime of the listener, so this patch is not needed on
current bluetooth-next.

I will drop this series.

Thanks,
Zihan Xi
>
> > If the listener is closed concurrently, removing the child from the
> > accept queue can drop the last listener reference before those
> > callbacks call parent->sk_data_ready(parent), leaving a stale parent
> > pointer and a use-after-free.
> >
> > Take a reference on the parent when a child is queued and drop it when
> > the child is unlinked.  Since unlinking now drops the accept-queue
> > parent reference, take a temporary parent reference in the callbacks
> > that continue to notify the parent after bt_accept_unlink().
> >
> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > Cc: stable@vger.kernel.org
> > Reported-by: Vega <vega@nebusec.ai>
> > Assisted-by: Codex:gpt-5.4
> > Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
> > ---
> > changes in v2:
> >   - rebase onto current bluetooth-next
> >   - refresh trailers to the current submission template
> >   - retarget author identity to Zihan Xi <zihanx@nebusec.ai>
> >   - v1 Link: https://lore.kernel.org/all/65767989c644f8adf52f35334f4034=
c66f47881f.1784383243.git.xizh2024@lzu.edu.cn/
> >
> >  net/bluetooth/af_bluetooth.c | 2 ++
> >  net/bluetooth/iso.c          | 2 ++
> >  net/bluetooth/l2cap_sock.c   | 2 ++
> >  net/bluetooth/rfcomm/sock.c  | 2 ++
> >  4 files changed, 8 insertions(+)
> >
> > diff --git a/net/bluetooth/af_bluetooth.c b/net/bluetooth/af_bluetooth.=
c
> > index 411d66f24393..61a232378e6c 100644
> > --- a/net/bluetooth/af_bluetooth.c
> > +++ b/net/bluetooth/af_bluetooth.c
> > @@ -218,6 +218,7 @@ void bt_accept_enqueue(struct sock *parent, struct =
sock *sk, bool bh)
> >       BT_DBG("parent %p, sk %p", parent, sk);
> >
> >       sock_hold(sk);
> > +     sock_hold(parent);
> >
> >       if (bh)
> >               bh_lock_sock_nested(sk);
> > @@ -266,6 +267,7 @@ void bt_accept_unlink(struct sock *sk)
> >       spin_unlock_bh(&bt_sk(parent)->accept_q_lock);
> >       bt_sk(sk)->parent =3D NULL;
> >       sock_put(sk);
> > +     sock_put(parent);
> >  }
> >  EXPORT_SYMBOL(bt_accept_unlink);
> >
> > diff --git a/net/bluetooth/iso.c b/net/bluetooth/iso.c
> > index 75bfd5938b2e..e709292aa112 100644
> > --- a/net/bluetooth/iso.c
> > +++ b/net/bluetooth/iso.c
> > @@ -286,8 +286,10 @@ static void iso_chan_del(struct sock *sk, int err)
> >
> >       parent =3D bt_sk(sk)->parent;
> >       if (parent) {
> > +             sock_hold(parent);
> >               bt_accept_unlink(sk);
> >               parent->sk_data_ready(parent);
> > +             sock_put(parent);
> >       } else {
> >               sk->sk_state_change(sk);
> >       }
> > diff --git a/net/bluetooth/l2cap_sock.c b/net/bluetooth/l2cap_sock.c
> > index b553b6356af8..3720ab2e39ed 100644
> > --- a/net/bluetooth/l2cap_sock.c
> > +++ b/net/bluetooth/l2cap_sock.c
> > @@ -1748,8 +1748,10 @@ static void l2cap_sock_teardown_cb(struct l2cap_=
chan *chan, int err)
> >               sk->sk_err =3D err;
> >
> >               if (parent) {
> > +                     sock_hold(parent);
> >                       bt_accept_unlink(sk);
> >                       parent->sk_data_ready(parent);
> > +                     sock_put(parent);
> >               } else {
> >                       sk->sk_state_change(sk);
> >               }
> > diff --git a/net/bluetooth/rfcomm/sock.c b/net/bluetooth/rfcomm/sock.c
> > index 958081adb9b5..a16daa68ecb8 100644
> > --- a/net/bluetooth/rfcomm/sock.c
> > +++ b/net/bluetooth/rfcomm/sock.c
> > @@ -78,11 +78,13 @@ static void rfcomm_sk_state_change(struct rfcomm_dl=
c *d, int err)
> >
> >       parent =3D bt_sk(sk)->parent;
> >       if (parent) {
> > +             sock_hold(parent);
> >               if (d->state =3D=3D BT_CLOSED) {
> >                       sock_set_flag(sk, SOCK_ZAPPED);
> >                       bt_accept_unlink(sk);
> >               }
> >               parent->sk_data_ready(parent);
> > +             sock_put(parent);
> >       } else {
> >               if (d->state =3D=3D BT_CONNECTED)
> >                       rfcomm_session_getaddr(d->session,
>
> --
> Pauli Virtanen
