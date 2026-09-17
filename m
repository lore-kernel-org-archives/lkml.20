Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0BE4DA9A7
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647666; cv=pass; b=lD/mRdQb7ocnx0YjpNA2OqEude8klwakDAWZE5yNJ4/4NAvwTJ/uo+xd4JcTlL3qa6BHvRm3LfCiZvYtUDzibyblxmwomS81etBYFTHjZpehzjtJx9pWSoZzR0adMzNl5kO55AuGsg1GX2vPjTjz0gQQ6uBHJI+Ba8KKXlB0w8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647666; c=relaxed/simple;
	bh=AgdM9A2toQshFXzWIt1NLUOFu7oRlbj14WU2EvE1KRo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OLp3lXEJw8X1xLjELaSakZYUkk5e6kBlxgsVQqGbfkSQOp9CvroZ9EWpmO1kOUVFbOUjVVSYiN5293S7wHT32Xl5V2AtxzwVx5TEpPnfhgJKnKG534J01yxV/UCbiFkynIMQUiqjYipy4zIFWgii12KNsy8+rw9Tutl27xS6UfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iTam1gbG; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iTam1gbG"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f13d76so722714e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:20:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789647651; cv=none;
        d=google.com; s=arc-20260327;
        b=hi+Ue+cg1A/xbinWOl6PU30ym/Cbm4xMR06H4YedE6dVNW8035r4Bg8nwCg/fFmrcK
         Fl5Y1RWjaLx/Cvko9P1pTuyP/D1h9UTcops1XJ6HUQLEvk5kLAP7LFg5H8Zb2t2x5bOH
         zvd0euj9tOfltCHSTxXOqO0mPK9zj6pb33Qov81wL2HOHb58YuKjnM/+RwHWnC/5WzRF
         FkMUrn2MuC3yCYBGzVeLDVJk/c8MdPnr/nPPzHBhcFbZItfi+9l6HPosAn8KVD03SBzG
         k6ayItSERHQiYBHuCvtLR9rKcFFcboqhocn/vcYueYinp3jFRJI9LAtQqs9XqUviavnQ
         i6/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tYijwURBgre4NraXqG8mIJdmB3HdAUmRokXImKMdIY4=;
        fh=67Z377SYB/NgPX6A6gkbxdJWOI3+yqxvpOKxu2jYneY=;
        b=D6H8bs2sdm/GkZ/kkyhWRHxAjaP0k1kBBuIvq/52C1pUnEqWlDb+6EcKcN1De16dTU
         ku0E65XdIWIDttCFdV+OMgWPLqu3+vkcO++p0ejkBM4tWWT5fwE5/Csp7z2jRxpUO1mb
         nV87FlHH/J6kWfXET9umaNwo7eAxY2qvQNVN8hG0QFVYIhVtpOPtA439UZtLHi8de2iz
         lNl6AKPOzZ2fn7HnBHJjqNOGoSEIkXTC5ZZIh+nQj/ZNVPe+JhBTHAKr6xdD4XqyZogz
         2Ltn+3tesKqf3sBkG6NK+7jtAetuMh+kI5yvKuryKnb4pt2yEw99rCCoz4S6sqF0O6Ze
         vVZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789647651; x=1790252451; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tYijwURBgre4NraXqG8mIJdmB3HdAUmRokXImKMdIY4=;
        b=iTam1gbGO4AIw1aZb5oSVQRR6NosZ0NCer15BRAK9jFYfAetn6p+faFry16W2jyDVv
         PrtyFn9kPlqpn5q1LiJF4J3DL7ML2P552oTOMAPERH1gpFMX5NL/Xgd1G+q5nVcxfSOT
         epAgO6hoJSl7Ldv7uLhu/tFhGcfPH2HEwNIhO92qMJgmPSCqjJrWhsK9HmCAowlG499p
         2VExxVm6+WQh0gfmHnyAUuKEnFV/4A9MgR6M9aOqcEKZkWGW9atYcjkFAgV/istDEidE
         2GOlQL23XM5Agq+B9X2i3J6TfQmSZoAd6BMKMHpsxdAPxl0RxcZG23tWRLDWXfowuS+j
         bvDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647651; x=1790252451;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tYijwURBgre4NraXqG8mIJdmB3HdAUmRokXImKMdIY4=;
        b=gNtJ/ppQfQ11sEh2+yikzzYi7PLoCml3O0IxenBGA/oKbOvdxiEIu1LWfQfe9m4B5B
         pYwSPYUmzPEmcO4w2kOcX1NtaUpiJ33bIGdJSl54mjZGQF2DlkU7B539hOAou53CnDuP
         AAmiDx9cvIFoXpvozVDzz2FbFzqL+dfaa65pUbJgfyIY5Ljaj5v9I3SYj5SW+rzzCFf4
         LCrIpfjPcLEY0QDKH93B9rs8a+TZ379fYuAs9jLkk6p6ace6zhUzazbWO7BGaRO1em+0
         P+Htk63EgaidTB/UltrWMn2hxu1kJbLEpkTgQcYKPAFMKY6WxhrNMZdaH5DF+Ry8wtDA
         1Mrg==
X-Forwarded-Encrypted: i=1; AKwUvBwPIvBGX5hSbGn4GCZj2u9UudCnAXWegQjvMOaZ+vv1nq8WLfC6x5HFCEyunMaoXMzGRXUHE6717SMQ+sU=@vger.kernel.org
X-Gm-Message-State: AFuF++nWVrEMGO79YgFJmK3+CZv8OBUKKU8GkppFqP+6iUFfPEnBiOzI
	4z97Ru6wTR5yn6i+8jYeFgPpgM6Vh/wQDhgdvJrqDQkH9huP9qmVxU1vPoH2h1YCj5d6P9s5aop
	lvzvYrvb/Gqmg8mKpxxqWX1BxL5/NJJE=
X-Gm-Gg: AYBFou0dCXCJqZ3TBnxobjV6Aw8bt4dyLizJmglFug3VZ/1ei/pzjmEbOrEps15cMPf
	DxLlwZWXrDF/hceG92hcLD9ALNBg7bljRQak+zsdypTKSV1HrbSwC41UHg+rKpMPEF6ObzsPDoy
	fX+yp//AShdLLh1uzn312aJ1ZFIvGXmbzMGVOWeu+m7/NqjHyi976HO5dCgWKTYeiuYgoM/JpE6
	gT7a8oVTtc4Zx4qMjzcdk7cu2JL+8ww1R/fPQVGxTaP88cSAsLMMiZrB+r2xJAd5PgpYzaKniRn
	JvvIr1N8EKwwRacKZ1uVmXrJYxsuLGO45EJPDAr09eOoGSje8fw3ZP4e6xZdEEvy
X-Received: by 2002:a05:6512:a8c:b0:5b6:1a7c:27 with SMTP id
 2adb3069b0e04-5b8b6649f01mr2202222e87.42.1789647650597; Thu, 17 Sep 2026
 05:20:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915065534.102249-1-maimon.sagi@gmail.com> <178962831034.22033.349240265456808212@kernel.org>
In-Reply-To: <178962831034.22033.349240265456808212@kernel.org>
From: Sagi Maimon <maimon.sagi@gmail.com>
Date: Thu, 17 Sep 2026 15:20:24 +0300
X-Gm-Features: AcwNN1Xpv2dec-eWESeM4Wy6Y9WRN3elg-R5JrcdXrRAdLmAUBat1N6Ju4KqLAs
Message-ID: <CAMuE1bGnQNWvEKVzjwo7nZSzA8Ctv0bsW=uE_CnhUOPBvc6DUw@mail.gmail.com>
Subject: Re: [PATCH net-next] net: axienet: add a TX timeout handler to
 recover a lost DMA interrupt
To: netdev-bot+sashiko@kernel.org
Cc: radhey.shyam.pandey@amd.com, netdev@vger.kernel.org, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	michal.simek@amd.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 9:58=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
>
> Critical: 0 =C2=B7 High: 1 (1) =C2=B7 Medium: 0 =C2=B7 Low: 0
>
> - [High] The new .ndo_tx_timeout handler (axienet_tx_timeout(),
>   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1907-1913) only=E2=80=
=A6
>
> Pre-existing issues:
> - [High] axienet_dma_err_handler()
>   (drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2727-2810) tears=E2=
=80=A6
>
> --
>
> net: axienet: add a TX timeout handler to recover a lost DMA interrupt
>
> This adds an .ndo_tx_timeout handler to axienet_netdev_ops that queues
> lp->dma_err_task, so the netdev watchdog can reach the existing DMA reset
> path without depending on a DMA interrupt.  watchdog_timeo is set to 5 * =
HZ
> in the legacy DMA branch of axienet_probe().
>
> > diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/driver=
s/net/ethernet/xilinx/xilinx_axienet_main.c
> > index 782f903d318f3..b5927e979c341 100644
> > --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> > +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
>
> [ ... ]
>
> > @@ -1884,6 +1888,30 @@ axienet_get_stats64(struct net_device *dev, stru=
ct rtnl_link_stats64 *stats)
> >       } while (read_seqcount_retry(&lp->hw_stats_seqcount, start));
> >  }
> >
> > +/**
> > + * axienet_tx_timeout - Driver TX timeout callback
> > + * @ndev:    Pointer to net_device structure
> > + * @txqueue: Index of the transmit queue that stalled
> > + *
> > + * Called by the netdev watchdog when a transmit queue has made no pro=
gress for
> > + * @ndev->watchdog_timeo.  axienet_dma_err_handler() is the driver's o=
nly reset
> > + * path, and it is otherwise scheduled solely from axienet_tx_irq() an=
d
> > + * axienet_rx_irq() - so a completion interrupt that is never delivere=
d leaves
> > + * the queue stopped with descriptors unreclaimed and no way back shor=
t of
> > + * unloading the driver.  Schedule the reset from here as well, so a l=
ost
> > + * interrupt is recoverable.
> > + *
> > + * This runs from a timer, so it only queues the work; the reset itsel=
f happens
> > + * in process context in axienet_dma_err_handler().
> > + */
> > +static void axienet_tx_timeout(struct net_device *ndev, unsigned int t=
xqueue)
> > +{
> > +     struct axienet_local *lp =3D netdev_priv(ndev);
> > +
> > +     netdev_err(ndev, "TX queue %u stalled, resetting DMA\n", txqueue)=
;
> > +     schedule_work(&lp->dma_err_task);
> > +}
>
> [Severity: High]
> Does the queue actually get restarted after this reset?
>

You are right that it does not, for the DRV_XOFF case.  Thank you - the
analysis is correct and I had not covered that path.

For what it is worth, the hardware run behind the changelog did recover,
and the logs say why it did not expose this.  Sampling once a second
across the wedge (MSI-X disabled, TX completions stopped):

  T+6   TXirq=3D24542  tx_pkts=3D1767  tx_timeout=3D0  backlog=3D131264b/92=
p
  T+7   TXirq=3D24542  tx_pkts=3D1767  tx_timeout=3D1  backlog=3D131306b/93=
p
  T+8   TXirq=3D24542  tx_pkts=3D1767  tx_timeout=3D1  backlog=3D0b/0p
  ...
  T+22  TXirq=3D24542  tx_pkts=3D1767  tx_timeout=3D1  backlog=3D0b/0p

The qdisc backlog drains to zero on the sample after the reset while
tx_packets stays frozen, so the queue was woken, and tx_timeout stays at
1 for the remaining 15 seconds, so the watchdog did not re-fire.  With
CONFIG_BQL=3Dy the dql limit stopped the queue via STACK_XOFF before the
128-descriptor ring filled, and netdev_reset_queue() clears exactly that
bit.  "TX ring unexpectedly full" never appeared in either run, which is
consistent with DRV_XOFF never being set.

So the recovery was only ever demonstrated for the BQL stop, exactly as
you suggest, and the DRV_XOFF path is untested.

That gap is pre-existing and independent of this patch -
axienet_dma_err_handler() has never woken the queue, and the
error-interrupt path into it has the same problem - so I have sent it
separately rather than folding it in:

  net: axienet: restart the TX queue after a DMA error reset

That one is a missing call and I am comfortable sending it reasoned from
the code, but this patch is a different matter: its changelog claims the
interface resumes passing traffic, and that is a behavioural claim I
should demonstrate rather than assert.  So I will repost the TX timeout
patch once I can test the DRV_XOFF case on hardware, about a month from
now.

> dev_watchdog() only calls ndo_tx_timeout for a queue that is already
> stopped:
>
> net/sched/sch_generic.c:dev_watchdog() {
>         ...
>                         if (!netif_xmit_stopped(txq))
>                                 continue;
>         ...
>                         dev->netdev_ops->ndo_tx_timeout(dev, i);
> }
>
> In the scenario the changelog describes (lost TX completion, descriptors
> unreclaimed) the stop bit is __QUEUE_STATE_DRV_XOFF, set here:
>
> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:axienet_start_xmit() {
>         ...
>         if (axienet_check_tx_bd_space(lp, MAX_SKB_FRAGS + 1)) {
>                 netif_stop_queue(ndev);
>         ...
> }
>
> axienet_dma_err_handler() then resets DMA, zeroes every TX BD, sets
> lp->tx_bd_ci =3D lp->tx_bd_tail =3D 0, re-enables NAPI and returns.  The =
only
> queue-state clearing it does is netdev_reset_queue(), which touches
> STACK_XOFF only, and nothing at all without CONFIG_BQL:
>
> include/linux/netdevice.h:netdev_tx_reset_queue() {
> #ifdef CONFIG_BQL
>         clear_bit(__QUEUE_STATE_STACK_XOFF, &q->state);
>         dql_reset(&q->dql);
> #endif
> }
>
> There is no netif_wake_queue()/netif_tx_wake_all_queues() and no
> netif_trans_update() anywhere in axienet_dma_err_handler().  The remainin=
g
> wake site in axienet_tx_poll() is gated on packets:
>
> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:axienet_tx_poll() {
>         packets =3D axienet_free_tx_chain(lp, lp->tx_bd_ci, lp->tx_bd_num=
, false,
>                                         &size, budget);
>
>         if (packets) {
>         ...
>                 if (!axienet_check_tx_bd_space(lp, MAX_SKB_FRAGS + 1))
>                         netif_wake_queue(ndev);
>         }
> }
>
> Can axienet_free_tx_chain() ever return non-zero after the handler cleare=
d
> cur_p->status for every descriptor?  And the wake in axienet_start_xmit()
> cannot run while the queue is stopped.
>
> If DRV_XOFF survives the reset, and txq->trans_start is never refreshed,
> doesn't dev_watchdog()'s time_after(jiffies, trans_start + watchdog_timeo=
)
> stay true, so the timeout path re-fires every 5 seconds, re-running
> napi_disable() / axienet_dma_stop() / __axienet_device_reset() /
> axienet_dma_start() and printing netdev_crit + netdev_err indefinitely
> while the interface still cannot transmit?
>
> The driver's other reset path does refresh the timestamp:
>
> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:axienet_device_reset() =
{
>         ...
>         netif_trans_update(ndev);
> }
>
> Would adding netif_trans_update() plus a wake of the TX queue at the tail
> of axienet_dma_err_handler() be needed for the recovery claimed in the
> changelog ("the watchdog fires and the interface resumes passing traffic"=
)
> to hold for the DRV_XOFF case rather than only for a BQL-only stop?
>
> [Severity: High]
> This is a pre-existing issue and not introduced by this patch, but the ne=
w
> trigger makes it much easier to reach: axienet_dma_err_handler() tears do=
wn
> the TX ring with no exclusion against axienet_start_xmit().
>
> The worker calls napi_disable() (which only excludes axienet_tx_poll()),
> axienet_dma_stop(), then re-enables transmission for a BQL-only stop befo=
re
> it starts freeing descriptors:
>
> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:axienet_dma_err_handler=
() {
>         axienet_dma_stop(lp);
>         netdev_reset_queue(ndev);       /* clears __QUEUE_STATE_STACK_XOF=
F */
>
>         for (i =3D 0; i < lp->tx_bd_num; i++) {
>                 cur_p =3D &lp->tx_bd_v[i];
>                 if (cur_p->cntrl) {
>                         dma_addr_t addr =3D desc_get_phys_addr(lp, cur_p)=
;
>
>                         dma_unmap_single(lp->dev, addr, ..., DMA_TO_DEVIC=
E);
>                 }
>                 if (cur_p->skb)
>                         dev_kfree_skb_irq(cur_p->skb);
>         ...
>         lp->tx_bd_ci =3D 0;
>         lp->tx_bd_tail =3D 0;
>
>         axienet_dma_start(lp);
> }
>
> It never takes the per-queue _xmit_lock and never calls
> netif_tx_disable()/netif_device_detach(), and the core unfreezes the queu=
es
> as soon as ndo_tx_timeout() returns, long before the work runs:
>
> net/sched/sch_generic.c:dev_watchdog() {
>                         netif_freeze_queues(dev);
>                         dev->netdev_ops->ndo_tx_timeout(dev, i);
>                         netif_unfreeze_queues(dev);
> }
>
> So while the teardown loop is running, can a transmit on another CPU ente=
r
>
> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:axienet_start_xmit() {
>         ...
>         WRITE_ONCE(lp->tx_bd_tail, new_tail_ptr);
>         netdev_sent_queue(ndev, skb->len);
>
>         /* Start the transfer */
>         axienet_dma_out_addr(lp, XAXIDMA_TX_TDESC_OFFSET, tail_p);
> }
>
> and write cur_p->cntrl/phys/skb into a descriptor the worker is about to
> unmap and clear?  The outcomes look like an skb freed by the worker and
> then re-referenced, a DMA mapping released while a fresh buffer is being
> programmed into the same descriptor, and lp->tx_bd_tail/tx_bd_ci rewound =
to
> 0 out of step with the hardware tail pointer written by axienet_start_xmi=
t().
>
> Since this new .ndo_tx_timeout makes the reset a routine event (and, per =
the
> comment above, potentially every 5 seconds), should the reset path be mad=
e
> to exclude the xmit path, for example with netif_tx_disable() around the
> descriptor teardown?

Agreed, and I think that is a real bug today rather than only with this
patch.  It is a bigger change to a path I cannot currently exercise, so
I would prefer to send it as its own patch once I have the board back.

>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20260915065534.102249-1-maimon.sagi%40gmail.com
