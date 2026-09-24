Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1422B330676
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790257289; cv=pass; b=Gfm8bQHdsBwpI4zGrfwG5pRY7zU8xWtHY/Xwya4OVZNrgtY53J/hFRrrwLb8pwmKpMz7zFhMIOv0Re9CdgCYIHFG8JChnatoD7gcjHiiDjQZawHU9iYA51bWXKeOkSFYoJ81oNdReEtQ0NCoJXbnTdikQYPbJNDlrbo+Vl9ksgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790257289; c=relaxed/simple;
	bh=cqW7SjFZ2VMeKZwt6tJnhW9zBsZWK5w5aMHQYAxktLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sItzKgObvOqIyUSmx0c6OXvTvNM++QskrKBuFNqGmjihYYcUOVUmvKBYasrzD4u2D67emrBKmugtCxEmInvMuaKZbAGnXxKPV+XQNURmJB4TP0IjOll4XMkS4d9TMkb+AfjOQ4267am9AI77zoB4RKlMa5TeVAUJLvnM1u+7BI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IapRArF3; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IapRArF3"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b76ff64d78so2020771e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:41:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790257282; cv=none;
        d=google.com; s=arc-20260327;
        b=fKOrsPhbM0yf3UYkcaCwC01cR7vt8KL3chcSsyTeBr8Xf/Wt9sHfrxkxMn06o4SXP1
         0DASkk9PXDb/lLjXfb/diO7NeA0u6yBmUKTQCT1h3GyRsmailmPpDpXUPrTTx9Ytj/ls
         BROowPVPntkffcc5eWJJla7TOhtEGzSgD+80sAldHipiz+hilAXaDzfM2pQX0+bO8L0H
         XZzq4+yKw4KbDkbGYqVY9xbGsDRWdRTwgo+GR9B/BD5EraHf7EmyOw4yQ7XZXQQ+yeFV
         K/y/EtOzWb5dv5Z3LUdqbHhy+LNc/nuNPKbZ8QXGuGphUrjRkXFNrt/cFS+272Jv37dL
         KnWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GGZb92y65Zgpq3x5v+GtiE7R/fU6xpwCAj6PKyWY/vY=;
        fh=gQjF3aLnJyV6erBnulf7jhV1X4IzlPYpWjoN2Eje9zM=;
        b=Jr31aj12je1tGYYABEi5QYgGUxCYOCRpxO0JnQK4GOWWkKkwUeZFSysnNTLXKYnpKo
         X9Amvj5O4Mp1bu/zpVbPbGRHtuYQISJc3vnMZUl7LvXnbY6KQ11TpESDeVLd4Yd9AKsJ
         cdnZ8tqJt9ds73E9eNVn8NRC8OtOHIk02MiVfSdBd7f+iu7NA7dl0AV0+nkmYbwyk8xx
         EiIpQJEuKtRivR7XcmvFMj+Zb6WHbyQ7G0fBynSJPCWqLuy1HMf8WDr0KyErGUcwZ+kj
         UzCDSp56eFj8+EhbhQSlJx67XqJge39vVAwYo8Hz61uG1nQ6/VprGrTs2zuLan49bybf
         agsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790257281; x=1790862081; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GGZb92y65Zgpq3x5v+GtiE7R/fU6xpwCAj6PKyWY/vY=;
        b=IapRArF3xZ3q54PUrDQ0oxoRvDIz7dOmcx0rBfLeofV9+TCoyxjHZqM14+WkwQu2kD
         S58nsc4Mm1+9hg8NryYurtPLwHkVxbrM1iqJZ29foIoS6ouMNkX188sMvgF/v5dA3La0
         1daqYGV0WKGnBBkid9KEJBJBiIBRieBQFMRFL377lcloUCo4GdL/t/G3wIbh981PMdPE
         /5xffJpJBnXtQAmPLTpABtm/dS8KOuhGLMVf2rXppP64JbAcynP1jR8gt24VGlXSsalO
         MHHFXGFtexJQBqJ3qlkbDLxBg0Kdsd+cYD79i5ktAHQBp396BpMdWmtBFIjENdIBF3gc
         2IWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790257281; x=1790862081;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GGZb92y65Zgpq3x5v+GtiE7R/fU6xpwCAj6PKyWY/vY=;
        b=QNW/VK7T3WEdHBprJE5w8rEC/y06fFUki6H8/3av/0z3GnUdINyryEdeYbtCflVknD
         1XfLkr5L5CG6EjgjM1q3Ddzwr94Ayys0W1JFnhhlc/W/Nam3iVwnmRUBUgNgC/6AVgUD
         eZci5WSdc/OSN0HJkrKLew7q0LiUkzWS3D1shsqrArNTatgS+eLmwLV7AdfPhJmZu2ka
         GNpGokRtxWCdBDla6IvwGm+rxw/pNDXsBG7E6bC14rgR3N82NK87JLgfovLIq/Lcu0pI
         y6i/j8n+ihK0idhMq5Q6U7YmTQrne0UR9AMJxBqjkdJYctdjCfzQsdiqB/tKYrzbtdA9
         0fFA==
X-Forwarded-Encrypted: i=1; AKwUvBzhYNpeJyDK84OJR9lP5sOrug8f76u8U/DrEkpN184lHEMdOK0oi8AhYWKO+DUpN+dP1XmtedNmPVmS9LM=@vger.kernel.org
X-Gm-Message-State: AFuF++lzaFFyX/6WXEKzk6P376MnP4knuyYJ6ggXkjhyi5uRs0JPAkGj
	X7vwOyS9ZfOHDeZWy665gUZZjgVQ1B2tnuNNYyaQEUcn9iaTFUfKSuQXwLcNl9KORcHQtZV4IGx
	ed8saNjZKjiy2IBsLIH1VbcBIME7yxAE=
X-Gm-Gg: AYBFou2+fShvEeSQRHwz1KnR7976YPDjopeh+tknOsKRCJ+ixBxfi6GwdJlJJQ8ggYK
	usJ5nN+AYAlG00DsvDUegvbUc4yT74h6Yn4f0x/dJsifTin1zjpfTqLj2vUL3T5KOnoiWD82PvV
	37bMALV3ZXa05zz2yZWnf7P4TYIxdBIN0gPXoT1YaOioO46+29CRbh+nX/bb/7h8sL26fjcVX08
	EBwBzmVNQDi0AuUabAX5YzSey+vh6ifcyXfOwj1Q2BYC5QfRTkxgfdOzwUOkJ7UGpkXukzPRqUD
	0+nu43P/8JunCyficMJ6uGd8Gl/FrbmeM9yOM0h/YfvInmkZxiBlKDft2n7wqzdE
X-Received: by 2002:a05:6512:1192:b0:5b8:b3a6:719a with SMTP id
 2adb3069b0e04-5b8df09d744mr945812e87.30.1790257281161; Thu, 24 Sep 2026
 06:41:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917115657.20697-1-maimon.sagi@gmail.com> <178999185805.2160803.2118648689532400433@kernel.org>
In-Reply-To: <178999185805.2160803.2118648689532400433@kernel.org>
From: Sagi Maimon <maimon.sagi@gmail.com>
Date: Thu, 24 Sep 2026 16:40:54 +0300
X-Gm-Features: AclHuK_mv6cx7MF56HvpPI8ZeHUQyEOf1bmrhadhyKpWsU2yerYqhZUPa9QgwcM
Message-ID: <CAMuE1bEbupbvFxV4W8ZS5NxMAQP6SvxP=S6DC=+ho-+zkFQ=Vg@mail.gmail.com>
Subject: Re: [PATCH net v2] net: axienet: bound TX completion cleanup by the
 NAPI budget
To: netdev-bot+sashiko@kernel.org
Cc: radhey.shyam.pandey@amd.com, netdev@vger.kernel.org, 
	robert.hancock@calian.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, michal.simek@amd.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 2:57=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 0 (1) =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] Incomplete fix: the new budget guard in axienet_free_tx_chain()
>   is disabled when @budget =3D=3D 0 (`if (!force && budget && packets >=
=3D=E2=80=A6
>
> Pre-existing issues:
> - [Medium] Pre-existing (not introduced or claimed to be fixed by this
>   patch): axienet_dma_bd_release()=E2=80=A6
>
> --
>
> net: axienet: bound TX completion cleanup by the NAPI budget
>
> The patch adds a budget check to axienet_free_tx_chain() so the TX
> completion loop stops on a packet boundary once the NAPI budget is spent,
> and treats a budget of zero as "no limit" so the netpoll TX reclaim and t=
he
> @force callers still drain the ring.  The kernel-doc for @budget is updat=
ed
> to match.
>
> > diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/driver=
s/net/ethernet/xilinx/xilinx_axienet_main.c
> > index 1722b7038f340..039885814a5d2 100644
> > --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> > +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> > @@ -772,7 +772,9 @@ static int axienet_device_reset(struct net_device *=
ndev)
> >   * @force:   Whether to clean descriptors even if not complete
> >   * @sizep:   Pointer to a u32 accumulating the total byte count of
> >   *           completed packets (using skb->len). Ignored if NULL.
> > - * @budget:  NAPI budget (use 0 when not called from NAPI poll)
> > + * @budget:  NAPI budget. When @force is false, cleanup stops after th=
is
> > + *           many completed packets. Zero means no limit, as used by t=
he
> > + *           netpoll TX reclaim and by callers outside NAPI poll.
> >   *
> >   * Would either be called after a successful transmit operation, or af=
ter
> >   * there was an error when setting up the chain.
> > @@ -788,6 +790,15 @@ static int axienet_free_tx_chain(struct axienet_lo=
cal *lp, u32 first_bd,
> >       dma_addr_t phys;
> >
> >       for (i =3D 0; i < nr_bds; i++) {
> > +             /* A NAPI poll must not return more than its budget.  Sto=
p on a
> > +              * packet boundary once it is spent - cur_p->skb is only =
set on
> > +              * a packet's last descriptor, so no packet is left half-=
freed.
> > +              * A zero budget means no limit: netpoll polls with a bud=
get of
> > +              * 0 to reclaim the TX path only, and must still clean th=
e ring.
> > +              */
> > +             if (!force && budget && packets >=3D budget)
> > +                     break;
> > +
>
> [Severity: High]
> With the "budget &&" term, is the case the commit message is about still
> reachable on the netpoll path?

Yes.  For a budget of 0 the loop drains the ring and axienet_tx_poll()
then returns the reclaimed count, which can trip the WARN_ONCE() in
poll_one_napi().  That was already reachable before this patch, while the
loop was unbounded, but since the patch is about honouring the budget it
should cover this case as well.  v3 returns "budget ? packets : 0" from
axienet_tx_poll() as you suggest, keeping the accounting and the queue
wake.

>
> For a budget of 0 the guard never fires, so axienet_free_tx_chain() walks=
 up
> to lp->tx_bd_num descriptors and increments packets for every completed
> descriptor with a non-NULL cur_p->skb.  axienet_tx_poll() then returns th=
at
> count verbatim:
>
> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:axienet_tx_poll() {
>         packets =3D axienet_free_tx_chain(lp, lp->tx_bd_ci, lp->tx_bd_num=
, false,
>                                         &size, budget);
>         ...
>         if (packets < budget && napi_complete_done(napi, packets)) {
>         ...
>         return packets;
> }
>
> netpoll is the caller that enforces the invariant:
>
> net/core/netpoll.c:poll_one_napi() {
>         /* We explicitly pass the polling call a budget of 0 to
>          * indicate that we are clearing the Tx path only.
>          */
>         work =3D napi->poll(napi, 0);
>         WARN_ONCE(work, "%pS exceeded budget in poll\n", napi->poll);
>         ...
> }
>
> lp->napi_tx is on dev->napi_list (netif_napi_add(ndev, &lp->napi_tx,
> axienet_tx_poll) in axienet_probe()), so netpoll_poll_dev()->poll_napi()-=
>
> poll_one_napi() reaches axienet_tx_poll() with budget 0.  If netconsole o=
r
> kgdboe is active on the interface and at least one TX descriptor has
> XAXIDMA_BD_STS_COMPLETE_MASK set with cur_p->skb !=3D NULL, doesn't that =
poll
> return non-zero work for a budget of 0 and trip the WARN_ONCE?
>
> The "packets < budget" test is also false for budget 0, so
> napi_complete_done() is skipped on that pass, which is the secondary symp=
tom
> the changelog describes.
>
> Would it work better to keep the unlimited reclaim for budget 0 (it is
> already bounded by lp->tx_bd_num) but have axienet_tx_poll() report
> "budget ? packets : 0", while still doing the byte/packet accounting?
>
> The new kernel-doc says zero means "no limit, as used by the netpoll TX
> reclaim".  netpoll asks for two things: drain the TX path, and report zer=
o
> work.  Could the kernel-doc and the in-loop comment mention both?

Will do.

>
> One more nit on the changelog:
>
>   "Zero therefore means no limit, which also covers the @force callers th=
at
>   clean up after a DMA mapping failure with a budget of 0."
>
> The guard is already gated on !force, so the @force callers are unaffecte=
d by
> the value of @budget here.

Right, that sentence is wrong.  v3 drops it.

>
> [Severity: Medium]
> This isn't a bug introduced by this patch, but while looking at the TX
> reclaim path: does axienet_dma_bd_release() leak the outstanding TX skbs =
and
> their streaming DMA mappings?

Yes.  It is independent of this patch, so I will send it as a separate
fix rather than fold it in.
v3 follows.  It passes traffic on hardware; the over-budget and netpoll
cases themselves were not exercised.

>
> The RX side walks the ring and cleans up:
>
> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:axienet_dma_bd_release(=
) {
>         for (i =3D 0; i < lp->rx_bd_num; i++) {
>                 ...
>                 dev_kfree_skb(lp->rx_bd_v[i].skb);
>                 ...
>                 dma_unmap_single(lp->dev, phys, lp->max_frm_size, DMA_FRO=
M_DEVICE);
>         }
>         ...
>         /* If we end up here, tx_bd_v must have been DMA allocated. */
>         dma_free_coherent(lp->dev,
>                           sizeof(*lp->tx_bd_v) * lp->tx_bd_num,
>                           lp->tx_bd_v,
>                           lp->tx_bd_p);
> }
>
> The TX ring is freed with no equivalent pass over lp->tx_bd_v, so descrip=
tors
> between lp->tx_bd_ci and lp->tx_bd_tail keep their cur_p->skb and their
> dma_map_single() mapping.
>
> axienet_stop() disables TX reclamation before the release, so nothing can=
 run
> afterwards:
>
>         napi_disable(&lp->napi_tx);
>         ...
>         axienet_dma_stop(lp);
>         cancel_work_sync(&lp->dma_err_task);
>         free_irq(lp->tx_irq, ndev);
>         free_irq(lp->rx_irq, ndev);
>         axienet_dma_bd_release(ndev);
>
> So an "ip link set down" or a driver unbind with frames in flight would l=
ose
> up to lp->tx_bd_num skbs and mappings.  The budget cap added here can lea=
ve
> completed-but-unreclaimed descriptors around for a later poll, which slig=
htly
> widens the window, but the leak is independent of this change.
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20260917115657.20697-1-maimon.sagi%40gmail.com
