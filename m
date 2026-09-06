Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399912EC090
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 13:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788700954; cv=pass; b=OuwE4LMYLSW7/wZPy5N7YJxpp6kmx4BphgJ+ZEUkiQFZCbOcdfJfz5KhEeJAvye1JzAP34Rxlk204sV7LpmZ/1yTSmjYd/a+2z9aCN7Ogbbesl+sQqfCdkxWQXV8OfZBHzXqk95pL2bCVXeG3mdQU0HB8pUDz8rLRTpZ1CNyZAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788700954; c=relaxed/simple;
	bh=Nezq5pD2IT82MbsJeQEMgL3LfnfU4O6ovFKeW6MpEWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rnwDAgaSMsfUVBfRiMhfCLR8fhBXuy8x/L/slL8Rbq1RaQRahrLR3YLTt1GfY5vrDGFXVS1sQK054Fy6EI54ZMPEwuF4ZYfFkNrZjr5MzMTYymZb1gcKQrf6PWocSG332RfQRUj+Nnh2jajBdrNLynKGRbzCgUeILjq8qTzeXvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=NEgV1SKq; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="NEgV1SKq"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3a1f628b0afso19190201fa.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 06:22:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788700950; cv=none;
        d=google.com; s=arc-20260327;
        b=qv5xDcfykh/98k1PR8F6KoCWS7ICtBRoi5LIsFx6Be+xne/++yPLfOVzh1aEWv5dI0
         Qvq3nuMF+CvtQPXs1pLBqmZHVOlzCHSy6xjQpPa3QKYmH1Xlk+a2OSU/X7+Pbuv9BeBY
         7GcMS5TYYpgqwzIWsBbYHDPWWI72HhOzyM40IXYCwqbZIwbXpe+jCR6GK3QYo8OgbDji
         cNyuVOFz1UurGe5wwowY0ygQ7C2A2FAl6DuS6fyn1nOKxlYo+iVVH7KFaOgGSp6dKYXw
         B3WrpzllFC/+izHWjDhieCM7Bf1kBdaObnNwkJyrv3Xl8Z/sdmAyCqMoEPsZuyWkQG+P
         iCJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h2JtF3ckSHKifsslTt+B7R/tWpvusUhZgXS+40SNnQM=;
        fh=2DQyfVh376SCy8mNQCYqqbKDwpb3lDKW8vdBkHxiNgk=;
        b=eo23HqYE20Ir3/TxeYYMALLBjW0UY6gIcse5RdSMfWpeGMhNW51+nqUYeqSbzNCWQK
         ITuPlw+w3/5/LWoba/uGepqRhhPuoIkoogxJkKkp2unUNVUBneJ2jPKh4KKrPXFL2/kl
         fL6TEzN2eGkEQ2ATrCCyOODBLy0UyJkCz/TmgYXQUgTORrFwoaIpZDtwxmRSG0YcGMUL
         Tl+XCasJiha2rSxwTcirJ2DsCjjDkB2RJKD4fwC/MwQ5otKxKB+5sja+mOKUfl5ETics
         YAj2QMGuBkaQVf74+n6uq3+PsPUMpQszinOzAWYxTrHeNCf2PzkhopVuCooa8tkioemm
         PpbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1788700950; x=1789305750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h2JtF3ckSHKifsslTt+B7R/tWpvusUhZgXS+40SNnQM=;
        b=NEgV1SKq1NMb9fMuCSHUd+t7pT8NJOhwQUB02/PLfIWu6pJQKRGP2ej538l8qqAXew
         a+0x7oIi5PraUED/kW4lA24iCcHTmpzwtndlFRVJlH/HQnRfIizsFo6ugI3T2piRQ77K
         Z783rS0a1JvYqqzN40UORZafqpEmPZvjTix8FRQKdJmDs4e5/1Jjt8f+NZ/pqga4t7zg
         hLMTXOcDdm6UtIi43D4VoTAEbkx4kA1tMWSAQlWGJJw9olseAlSS86K6LgNQ5RTPjAay
         SeEY+HOzI1dRcHjuMY7vm58BnrXGZ11AAuEH8C6dE1v5YZWRF5Fv5NQFBcTFWFPOWCAc
         REsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788700950; x=1789305750;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h2JtF3ckSHKifsslTt+B7R/tWpvusUhZgXS+40SNnQM=;
        b=IXbkbEcmyRnBrbANEOkWWsVtgwhVsGTh+OrjXaLFJ1P8NWqPso5Qgcz9E3bc6V5cRr
         Vx8y0nzcxHa4fXq3SPuP1tv6HqOnEJR/u/nsXUOdcfWstRRsdSCU4lhxObaQezVpF1AX
         iYUHOI7tCt1Q7RNRDLrpKKNH8JkqVgqUV0hriEzjQ2l+mykSnMdTlaVbMO9w0SURUlPS
         p5P+YvrsMSf9laRYlnrgxZ6OOzWT37IUiCEO+QsJWtoT1VJlH7ZG30/ePnHo98uNAWV2
         qqDxdUmSaFDFycL4Q6tEAqTuxxPRXI75DWsuPMONQrLFUv72SMt9Q/fO7GXPnMeoKA8f
         YZJw==
X-Forwarded-Encrypted: i=1; AKwUvBwPf9HdMAgSFHW7XQQCHt6MKvTfzd71ps9lxUGOBqjzKYNkY5/Zf5P2MaEC/avmPCdNLMjvOqHIdvwX700=@vger.kernel.org
X-Gm-Message-State: AFuF++nAYJebVK1GufTfo215CniwnSyjF99MHRTVAYavo1sKMLG45YKC
	blTKDBhqfGZ/qgLyRGsiexrwevid0ddw9vy95bXIZGDzqDX3D91ghmnNJo9oIvmNHa5nVO3u/9N
	+0KYJYErILKAr6Aow7QOAnl8eHSXj90BjIg7W6VO6gcs=
X-Gm-Gg: AYBFou1smHB1x217ov6ZeR335oSOWb/98lctABaeS1Cy6Gq/KZAAMPzvoBFUQYPGfN+
	yKPeLnLu2usWg/A/FANKeH87XbZrqX1xKGWwDzGhjnP3fkx/43+vwpLlMs2d8tGDBvaAzg7arUP
	lBwKmYBFQRuksIiEphuVprzqm6xSM83caj/O53suEAcfPquDbrEUmxP7GHHhuF7kGVQMoCKoSfz
	Ty06oApdBTH5Nv4SVMyvF9wBDk58Q59aDqzgIrpgAR6jqq2wnOjRLsqhE1GhLupIVD2cnKHcroy
	Edg19HOcsMm+nBUst5qJokkE6o3wGVddtXpspmKlJo7A3FV6RXhR6oIZs2kmZhs5AgkcWcXrYAY
	=
X-Received: by 2002:a2e:a10f:0:b0:3a3:7682:499e with SMTP id
 38308e7fff4ca-3a376824ce0mr14070151fa.19.1788700949928; Sun, 06 Sep 2026
 06:22:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0b8964c9cd294898c9657fd34c9d04cec77782eb.1788414881.git.zihanx@nebusec.ai>
 <20260906124504.230137-1-horms@kernel.org>
In-Reply-To: <20260906124504.230137-1-horms@kernel.org>
From: zihan xi <zihanx@nebusec.ai>
Date: Sun, 6 Sep 2026 21:22:16 +0800
X-Gm-Features: AcwNN1WqrkmHlJS6aHnQkZDNAI20Zc34lolRxTyLII4g04r4yvqzTwFnffUSMMM
Message-ID: <CAANe3eRKpx3rxbddD4AYRy8=z=27B60z_sj2KDzg9YLYOKf2gw@mail.gmail.com>
Subject: Re: [PATCH net v7 1/1] llc: fix listener child socket leaks before
 passive open completes
To: Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, kees@kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, vega@nebusec.ai
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 8:48=E2=80=AFPM Simon Horman <horms@kernel.org> wrot=
e:
>
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> Full review at: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/0b896=
4c9cd294898c9657fd34c9d04cec77782eb.1788414881.git.zihanx@nebusec.ai?part=
=3D1
> ---
> llc: fix listener child socket leaks before passive open completes
>
> This restricts passive-open child creation to SABME commands, answers oth=
er
> listener-directed commands with a DM response generated from the packet
> source address, and adds an incoming_state / incoming_children lifecycle =
so
> children that never reach accept() are released on drop, backlog failure =
and
> listener close.  llc_sk_free() gains a sync argument and the final child
> teardown moves to a work item.
>
> Some questions below about the new locking and reference accounting.
>
> > diff --git a/net/llc/af_llc.c b/net/llc/af_llc.c
> > index b0447c33dbf0..e8054809cf0c 100644
> > --- a/net/llc/af_llc.c
> > +++ b/net/llc/af_llc.c
>
> [ ... ]
>
> > @@ -722,6 +729,17 @@ static int llc_ui_accept(struct socket *sock, stru=
ct socket *newsock,
> >               goto frees;
> >       rc =3D 0;
> >       newsk =3D skb->sk;
> > +     lock_sock_nested(newsk, SINGLE_DEPTH_NESTING);
> > +     if (llc_sk(newsk)->state < LLC_CONN_STATE_ADM ||
> > +         !llc_accept_incoming_sock(newsk)) {
> > +             if (atomic_read(&llc_sk(newsk)->incoming_state) !=3D
> > +                 LLC_INCOMING_NONE)
> > +                     llc_release_incoming_sock(newsk);
> > +             release_sock(newsk);
> > +             sock_put(newsk);
> > +             rc =3D -ECONNABORTED;
> > +             goto frees;
> > +     }
>
> [Severity: High]
> Can this lock_sock_nested() block on the lock_sock(sk) that llc_ui_accept=
()
> already holds?  There is no test that skb->sk is a distinct child.
>
> A connection indication can end up on a socket's own receive queue with
> skb->sk =3D=3D sk.  After bind(), llc->daddr is all zero, so a SABME whos=
e
> h_source is 00:00:00:00:00:00 and whose SSAP masks to 0 matches
> llc_estab_match():
>
> net/llc/llc_conn.c:llc_estab_match() {
>         ...
>                 llc->daddr.lsap =3D=3D daddr->lsap &&
>                 ether_addr_equal(llc->laddr.mac, laddr->mac) &&
>                 ether_addr_equal(llc->daddr.mac, daddr->mac);
> }
>
> __llc_lookup_established() returns that socket, so llc_conn_handler() tak=
es
> the non-listener branch and sets skb->sk =3D sk.
>
> llc_adm_state_trans_2 (action llc_conn_ac_conn_ind) then sets
> ind_prim =3D LLC_CONN_PRIM, and llc_conn_state_process() queues the skb o=
n
> sk->sk_receive_queue with skb->sk =3D=3D sk.  llc_ui_listen() does not dr=
ain
> sk_receive_queue, so the socket can enter TCP_LISTEN with that skb queued=
.
>
> accept() dequeues it, the !skb->sk test does not fire, newsk =3D=3D sk, a=
nd
> lock_sock_nested() waits in __lock_sock() for a lock this task owns.
>
> For such an skb the conditional hold added in llc_conn_state_process() wa=
s
> never taken (sk !=3D skb->sk is false there), so is the sock_put(newsk) o=
n the
> abort path, and on the success path below, also unbalanced?
>
> >       /* attach connection to a new socket. */
> >       llc_ui_sk_init(newsock, newsk);
> >       sock_reset_flag(newsk, SOCK_ZAPPED);
> > @@ -737,6 +755,8 @@ static int llc_ui_accept(struct socket *sock, struc=
t socket *newsock,
> >       sk_acceptq_removed(sk);
> >       dprintk("%s: ok success on %02X, client on %02X\n", __func__,
> >               llc_sk(sk)->addr.sllc_sap, newllc->daddr.lsap);
> > +     release_sock(newsk);
> > +     sock_put(newsk);
> >  frees:
> >       kfree_skb(skb);
> >  out:
>
> > diff --git a/net/llc/llc_conn.c b/net/llc/llc_conn.c
> > index 260460d50f54..092625e28b3b 100644
> > --- a/net/llc/llc_conn.c
> > +++ b/net/llc/llc_conn.c
>
> [ ... ]
>
> > @@ -88,6 +89,13 @@ int llc_conn_state_process(struct sock *sk, struct s=
k_buff *skb)
> >                * skb->sk pointing to the newly created struct sock in
> >                * llc_conn_handler. -acme
> >                */
> > +             if (sk !=3D skb->sk &&
> > +                 atomic_read(&llc_sk(skb->sk)->incoming_state) =3D=3D
> > +                 LLC_INCOMING_PENDING) {
> > +                     sock_hold(skb->sk);
> > +                     atomic_set(&llc_sk(skb->sk)->incoming_state,
> > +                                LLC_INCOMING_QUEUED);
> > +             }
> >               skb_get(skb);
> >               skb_queue_tail(&sk->sk_receive_queue, skb);
> >               sk->sk_state_change(sk);
>
> [ ... ]
>
> > @@ -765,27 +773,196 @@ static struct sock *llc_create_incoming_sock(str=
uct sock *sk,
>
> [ ... ]
>
> > +static void llc_incoming_sock_work(struct work_struct *work)
> > +{
> > +     struct llc_sock *llc =3D container_of(work, struct llc_sock,
> > +                                         incoming_work);
> > +     struct sock *listener =3D llc->incoming_listener;
> > +     struct sock *sk =3D &llc->sk;
> > +
> > +     lock_sock(sk);
> > +     llc_sk_stop_all_timers(sk, false);
> > +     sock_orphan(sk);
> > +     release_sock(sk);
> > +     llc_sk_stop_all_timers(sk, true);
> > +     dev_put(llc->dev);
> > +     llc->dev =3D NULL;
> > +     llc_sk_free(sk, false);
> > +     sock_put(sk);
> > +     sock_put(listener);
> > +}
> > +
> > +void llc_release_incoming_sock(struct sock *sk)
> > +{
> > +     struct llc_sock *llc =3D llc_sk(sk);
> > +
> > +     if (atomic_xchg(&llc->incoming_state, LLC_INCOMING_NONE) =3D=3D
> > +         LLC_INCOMING_NONE)
> > +             return;
> > +
> > +     WRITE_ONCE(llc->state, LLC_CONN_OUT_OF_SVC);
> > +     spin_lock_bh(&llc->sap->sk_lock);
> > +     list_del_init(&llc->incoming_node);
> > +     spin_unlock_bh(&llc->sap->sk_lock);
> > +     sock_hold(sk);
> > +     llc_sap_remove_socket(llc->sap, sk);
> > +     schedule_work(&llc->incoming_work);
> > +}
> > +
> > +bool llc_accept_incoming_sock(struct sock *sk)
> > +{
> > +     struct llc_sock *llc =3D llc_sk(sk);
> > +
> > +     if (atomic_cmpxchg(&llc->incoming_state, LLC_INCOMING_QUEUED,
> > +                        LLC_INCOMING_NONE) !=3D LLC_INCOMING_QUEUED)
> > +             return false;
> > +
> > +     spin_lock_bh(&llc->sap->sk_lock);
> > +     list_del_init(&llc->incoming_node);
> > +     spin_unlock_bh(&llc->sap->sk_lock);
> > +     sock_put(llc->incoming_listener);
> > +     return true;
> > +}
> > +
> > +void llc_release_incoming_children(struct sock *sk)
> > +{
> > +     struct llc_sock *llc =3D llc_sk(sk);
> > +     struct sk_buff *skb;
> > +
> > +     local_bh_disable();
> > +     while ((skb =3D skb_dequeue(&sk->sk_receive_queue))) {
> > +             struct sock *newsk =3D skb->sk;
> > +
> > +             if (newsk && newsk !=3D sk) {
> > +                     int incoming_state;
> > +
> > +                     bh_lock_sock_nested(newsk);
> > +                     incoming_state =3D
> > +                             atomic_read(&llc_sk(newsk)->incoming_stat=
e);
> > +                     if (incoming_state !=3D LLC_INCOMING_NONE) {
> > +                             llc_release_incoming_sock(newsk);
> > +                             if (incoming_state =3D=3D LLC_INCOMING_QU=
EUED)
> > +                                     sock_put(newsk);
> > +                     }
> > +                     bh_unlock_sock(newsk);
> > +             }
> > +             kfree_skb(skb);
> > +     }
> > +     if (llc->sap) {
> > +             spin_lock(&llc->sap->sk_lock);
> > +             while (!list_empty(&llc->incoming_children)) {
> > +                     struct llc_sock *child;
> > +                     struct sock *newsk;
> > +
> > +                     child =3D list_first_entry(&llc->incoming_childre=
n,
> > +                                              struct llc_sock,
> > +                                              incoming_node);
> > +                     list_del_init(&child->incoming_node);
> > +                     newsk =3D &child->sk;
> > +                     sock_hold(newsk);
> > +                     spin_unlock(&llc->sap->sk_lock);
> > +
> > +                     bh_lock_sock_nested(newsk);
> > +                     if (atomic_read(&child->incoming_state) !=3D
> > +                         LLC_INCOMING_NONE)
> > +                             llc_release_incoming_sock(newsk);
> > +                     bh_unlock_sock(newsk);
> > +                     sock_put(newsk);
> > +                     spin_lock(&llc->sap->sk_lock);
> > +             }
> > +             spin_unlock(&llc->sap->sk_lock);
> > +     }
> > +     local_bh_enable();
> > +}
>
> [Severity: High]
> The receive-queue loop above drops the accept-queue reference explicitly:
>
>                         if (incoming_state !=3D LLC_INCOMING_NONE) {
>                                 llc_release_incoming_sock(newsk);
>                                 if (incoming_state =3D=3D LLC_INCOMING_QU=
EUED)
>                                         sock_put(newsk);
>                         }
>
> The incoming_children walk releases children whose incoming_state is
> !=3D LLC_INCOMING_NONE, which includes LLC_INCOMING_QUEUED, but the only
> sock_put() there balances the walk's own sock_hold().
>
> Counting the references of a QUEUED child: llc_release_incoming_sock() ad=
ds
> one hold, and llc_incoming_sock_work() drops two (llc_sk_free()'s sock_pu=
t()
> plus its own), so the hold taken in llc_conn_state_process() has to be
> dropped by the caller.  Does a QUEUED child that reaches this walk leak i=
ts
> struct llc_sock?
>
> A path that gets a QUEUED child onto this walk:
>
> llc_ui_connect() has no TCP_LISTEN guard, so the listener can be moved to
> TCP_SYN_SENT/TCP_CLOSE.  llc_ui_recvmsg() only refuses sk_state =3D=3D
> TCP_LISTEN, so after that it treats the pending connection indication as
> stream data:
>
> net/llc/af_llc.c:llc_ui_recvmsg() {
>         ...
>                 skb_unlink(skb, &sk->sk_receive_queue);
>                 kfree_skb(skb);
> }
>
> That drops only the skb reference; the child stays QUEUED on
> incoming_children, and close() then reaches the walk above.
>
> [ ... ]
>
> > @@ -813,18 +1010,49 @@ void llc_conn_handler(struct llc_sap *sap, struc=
t sk_buff *skb)
> >               skb->sk =3D sk;
> >               skb->destructor =3D sock_efree;
> >       }
> > -     if (!sock_owned_by_user(sk))
> > +     if (unlikely(llc_sk(skb->sk)->state < LLC_CONN_STATE_ADM)) {
> > +             if (newsk) {
> > +                     if (atomic_read(&llc_sk(newsk)->incoming_state) =
=3D=3D
> > +                         LLC_INCOMING_PENDING)
> > +                             llc_release_incoming_sock(newsk);
> > +             } else if (atomic_read(&llc_sk(sk)->incoming_state) =3D=
=3D
> > +                        LLC_INCOMING_PENDING) {
> > +                     llc_release_incoming_sock(sk);
> > +             }
> > +             goto drop_unlock;
> > +     }
>
> [Severity: Medium]
> This out-of-service lower bound is not described anywhere in the commit
> message body, and the v7 changelog says the work was removed from the
> series:
>
>   "Drop the companion LLC_CONN_OUT_OF_SVC bounds patch due to overlap wit=
h
>    Kees Cook's net-next series"
>   "That series also covers ... rejecting out-of-service states before tab=
le
>    lookup"
>
> Five copies of the check are still here though: this one in
> llc_conn_handler(), three in llc_backlog_rcv(), and one in llc_ui_accept(=
).
>
> In the non-listener branch just above, skb->sk is the ordinary looked-up
> socket, so this changes behaviour for every socket on the direct receive
> path, and in llc_ui_accept() it converts an otherwise successful accept()
> into -ECONNABORTED.  Should the message describe the new semantics, or
> should these checks be dropped as the changelog states?
>
> >       if (!sock_owned_by_user(sk)) {
> >               llc_conn_rcv(sk, skb);
> > -     else {
> > +             if (newsk &&
> > +                 atomic_read(&llc_sk(newsk)->incoming_state) =3D=3D
> > +                 LLC_INCOMING_PENDING)
> > +                     llc_release_incoming_sock(newsk);
> > +     } else {
> >               dprintk("%s: adding to backlog...\n", __func__);
> >               llc_set_backlog_type(skb, LLC_PACKET);
> > -             if (sk_add_backlog(sk, skb, READ_ONCE(sk->sk_rcvbuf)))
> > +             if (sk_add_backlog(sk, skb, READ_ONCE(sk->sk_rcvbuf))) {
> > +                     if (newsk && !newsk_lookup_ref)
> > +                             llc_release_incoming_sock(newsk);
> >                       goto drop_unlock;
> > +             }
> >       }
>
> [ ... ]
>
> > @@ -852,12 +1080,52 @@ static int llc_backlog_rcv(struct sock *sk, stru=
ct sk_buff *skb)
> >  {
> >       int rc =3D 0;
> >       struct llc_sock *llc =3D llc_sk(sk);
> > +     struct sock *newsk =3D skb->sk;
> >
> >       if (likely(llc_backlog_type(skb) =3D=3D LLC_PACKET)) {
> > -             if (likely(llc->state > 1)) /* not closed */
> > +             if (newsk &&
> > +                 atomic_read(&llc_sk(newsk)->incoming_state) =3D=3D
> > +                 LLC_INCOMING_PENDING) {
> > +                     local_bh_disable();
> > +                     bh_lock_sock_nested(newsk);
> > +                     if (atomic_read(&llc_sk(newsk)->incoming_state) !=
=3D
> > +                         LLC_INCOMING_PENDING) {
> > +                             bh_unlock_sock(newsk);
> > +                             local_bh_enable();
> > +                             goto retry;
> > +                     }
> > +                     if (sock_flag(sk, SOCK_DEAD) ||
> > +                         sk->sk_state !=3D TCP_LISTEN ||
> > +                         llc_sk(newsk)->state < LLC_CONN_STATE_ADM) {
> > +                             llc_release_incoming_sock(newsk);
> > +                             bh_unlock_sock(newsk);
> > +                             local_bh_enable();
> > +                             goto out_kfree_skb;
> > +                     }
> >                       rc =3D llc_conn_rcv(sk, skb);
> > -             else
> > +                     if (atomic_read(&llc_sk(newsk)->incoming_state) =
=3D=3D
> > +                         LLC_INCOMING_PENDING)
> > +                             llc_release_incoming_sock(newsk);
> > +                     bh_unlock_sock(newsk);
> > +                     local_bh_enable();
> > +             } else if (newsk &&
> > +                        atomic_read(&llc_sk(newsk)->incoming_state) =
=3D=3D
> > +                        LLC_INCOMING_QUEUED) {
> > +                     local_bh_disable();
> > +                     bh_lock_sock_nested(newsk);
> > +                     if (llc_sk(newsk)->state < LLC_CONN_STATE_ADM) {
>
> [Severity: Medium]
> Two different "socket is usable" boundaries now live in this one function=
.
> LLC_CONN_OUT_OF_SVC is 0 and LLC_CONN_STATE_ADM is 1, so the new checks
> dispatch a socket in ADM while the legacy branch a few lines below,
> llc->state > 1 /* not closed */, drops the same frame as closed.  Which
> boundary is intended for a child in ADM?
>
> The same permissive bound is reused in llc_ui_accept().  A peer DISC retu=
rns
> a connected child to ADM:
>
> net/llc/llc_c_st.c:
> static const struct llc_conn_state_trans llc_common_state_trans_4 =3D {
>         .ev            =3D llc_conn_ev_rx_disc_cmd_pbit_set_x,
>         .next_state    =3D LLC_CONN_STATE_ADM,
>
> The LLC_DISC_PRIM handling in llc_conn_state_process() is gated on
> sk_state =3D=3D TCP_ESTABLISHED, which a pre-accept child is not, so the =
queued
> indication stays in the accept queue.  accept() then passes
> state >=3D LLC_CONN_STATE_ADM and sets newsk->sk_state =3D TCP_ESTABLISHE=
D and
> newsock->state =3D SS_CONNECTED for a connection that is already down.
>
> Should the boundary instead be the data-capable states used by
> llc_data_accept_state(), that is NORMAL/BUSY/REJ?
>
> > +                             bh_unlock_sock(newsk);
> > +                             local_bh_enable();
> > +                             goto out_kfree_skb;
> > +                     }
> > +                     rc =3D llc_conn_rcv(newsk, skb);
>
> [Severity: Medium]
> Here sk and skb->sk are both the unaccepted child, but the LLC_CONN_PRIM
> branch of llc_conn_state_process() assumes sk is the listener owning the
> accept queue and skb->sk is the child, which is what the new
> sk !=3D skb->sk bookkeeping encodes.
>
> With three frames queued on the listener backlog while the listener is
> user-owned:
>
>   f1 SABME -> PENDING branch -> LLC_CONN_PRIM -> child becomes QUEUED
>   f2 DISC   -> QUEUED branch  -> child returns to LLC_CONN_STATE_ADM
>   f3 SABME  -> QUEUED branch  -> llc_conn_rcv(child, f3)
>
> For f3, llc_adm_state_trans_2 / llc_conn_ac_conn_ind sets
> ind_prim =3D LLC_CONN_PRIM, and since sk =3D=3D skb->sk the indication is=
 queued
> on the child's own sk_receive_queue with no sock_hold() and no state
> transition.
>
> Does that lose the indication for accept(), and leave a raw SABME frame o=
n
> the child's receive queue where llc_ui_recvmsg() would later hand its byt=
es
> to userspace as stream data?
>
> > +                     bh_unlock_sock(newsk);
> > +                     local_bh_enable();
> > +             } else if (likely(llc->state > 1)) {
> > +                     rc =3D llc_conn_rcv(sk, skb);
>
> [Severity: High]
> This fallback branch checks the listener's llc->state, but llc_conn_rcv()
> runs the state machine on skb->sk, which can be a child that has already
> been put out of service:
>
> net/llc/llc_conn.c:llc_release_incoming_sock() {
>         WRITE_ONCE(llc->state, LLC_CONN_OUT_OF_SVC);
>         ...
>         schedule_work(&llc->incoming_work);
> }
>
> After that the child's incoming_state is LLC_INCOMING_NONE, so neither ne=
w
> branch above matches and its backlogged skbs land here, with no child loc=
k
> held.  llc_ui_release() releases the children before the backlog is drain=
ed:
>
> net/llc/af_llc.c:llc_ui_release() {
>                 llc_sap_remove_socket(llc->sap, sk);
>                 llc_release_incoming_children(sk);
>                 release_sock(sk);
> }
>
> llc_conn_service() only rejects llc->state > NBR_CONN_STATES, so state 0
> reaches:
>
> net/llc/llc_conn.c:llc_qualify_conn_ev() {
>         struct llc_conn_state *curr_state =3D
>                                         &llc_conn_state_table[llc->state =
- 1];
>
> Can this index llc_conn_state_table[] and llc_offset_table[][] at -1 and
> then dereference the resulting curr_state->transitions?
>
> Reaching this branch needs the listener's own llc->state to be > 1, which=
 a
> bound socket that received a matching SABME before listen() satisfies, si=
nce
> llc_ui_listen() does not reset llc->state.
>
> Separately, is running llc_conn_rcv() on that child safe against
> llc_incoming_sock_work(), which concurrently does sock_orphan(),
> dev_put(llc->dev), llc->dev =3D NULL and llc_sk_free(sk, false) with no
> serialization against this path?
>
> > +             } else {
> >                       goto out_kfree_skb;
> > +             }
> >       } else if (llc_backlog_type(skb) =3D=3D LLC_EVENT) {
> >               /* timer expiration event */
> >               if (likely(llc->state > 1))  /* not closed */
>
> [ ... ]

Thanks Simon, and thanks for the correction on the earlier mail.

I'll treat the listen(2)/SABME accept-queue bound as out of scope for
this series, and take this review as the one to address.

The High items look real to me, in particular:

- lock_sock_nested() in llc_ui_accept() when skb->sk =3D=3D sk
- the extra QUEUED hold not being dropped on the incoming_children walk
- the llc_backlog_rcv() fallback dispatching an already released child

I'll reroll v8 around those, without the accept-queue patch.

For the Medium notes: I agree the leftover state < ADM checks are
inconsistent with the v7 changelog. v8 will keep only the incoming-child
teardown guards and drop the extra ones on the ordinary receive/accept
paths. I will also check the QUEUED backlog SABME case.

I do not plan to retarget accept() at llc_data_accept_state(); that looks
like a separate behaviour change.

Thanks,
Zihan
