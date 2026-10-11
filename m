Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E217175D53
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 05:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791694861; cv=pass; b=Ro3KIkCKclF2FzHt6TSn3MQjGZfY3GVEOmLX0KNekOREFfPqFjKkK6eym42V2v9ik05j/6ydHr3kFEqE0PTmcbW7Lyt7tQyAzbENkQCVNscrV6i0LGMQvBch8Yf1kttlxMyy7Vv+K5rmZ5y54GUAFuGXAIW94kdPZwfLzCuAPEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791694861; c=relaxed/simple;
	bh=ONJ8sL2eLY61Nf+ScHCP5MNggSt3fR+V7XSvnBvT1jg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BIFrXQE1Tw5SwHhtDv5fqyzwYpTcCOuUhAM/Hg6mxOO38jnUlB6IoC7T+kDc9QymjL5SHEah/xahIbqznXpEX3sAlKm91PEX4fJQzGvw+xvVtb0LKkdKTDwpaZJT9TUpf0sStDUTyYyTlGF+hkkgFIoxg44vgh5vmy/TW+8kkHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CwAZzTBT; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CwAZzTBT"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a9761758adso8825011fa.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 22:00:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791694857; cv=none;
        d=google.com; s=arc-20260327;
        b=epKHFFmTofr9YJ5xseyHjhGQWfizWaelZgzuZQKGKCMsL+4hihRkG+tnqse+e+Rk7Y
         oG0Ybbo0TPQajBOttLy46nXu86UsiINXf/Qwz7jAa2FXl/fiBMWau+S0Mi8AQ8F/Y5KI
         KVm2gV7bZwFkDgVC9HkBWC58BeDjbZbBvovrH+MgfeFDmMndZhVx/JIYwN7ReTY44J0C
         UZfwht5Xdkvpw7XYBlJmWC8/slvdE09DLS4L2e5d3TapzyT3Ox0foW3eYymAjrkvgkRg
         GxOdUfI6C6VVZIQ5KccQKmj/GClGCEV058oZ0nMPWqvz2cGX3JZTZHAYeSOiYLFQ7V9Q
         Igow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o9fOpLHNyvCnw7ct/flm+4OABTu8ji/SW2nl6R0R/KI=;
        fh=batIBH/KBNInU+de4jFvK88VH9WvhaWDdKVu3qnl5dY=;
        b=KwhbHrpR3mgTkpdnEphPcQBL00Os+p6zqGOcnGxxZ5HtLkQUT5jwDf9SVZ78xvtMGe
         ZrFbJY9/uYumWfrMqT/whHgXKqZ/op+kmY+wW8pzNX4fTh0uz5S7CcYuxFbVH/lR/TdF
         g5u/qGhFp6FwJ9PI5m6gI3tcJ2tk9VE4hO/kbmyj1YCqHSHIAs4u/ZF7JsanxYjFNFTR
         ToWBgomQi2wFxjZ4d+e7VE3kGrDe+30lrXl+RQ3jaQCuGIn6AuLm1FnnZwi2yduCqBgT
         k6QfctOl4EJ5I9Y3TSPgcePrXRTgRUZE5sgQp5dDVKf5EByP/084Vo+z6FDAUGcaDZ0a
         uhrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791694857; x=1792299657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o9fOpLHNyvCnw7ct/flm+4OABTu8ji/SW2nl6R0R/KI=;
        b=CwAZzTBTRSONUpXC6WiUjYFzFTfkivtHgncXV0hyDh8UYl2X1kCq0p5oLCHTTkApfq
         Wn11uEIlG56VKW7v6f1A+hYkkQtS6LSYYoVPORle8jFVITrdQiGcHo4OSZOBNRXnUL81
         /eJAgEoO/f0GbRhPsRS+tGt2SYiq0Rm6F0G7XKdM7jIQHjg1x1tKBwHb2TngIxo8mnC/
         TH8P5mIB5kSqiGygdPwgELrsiHkzTv1fPAsZmTagsx4GOo2vx9BtSOykiM3k9gWQEKpA
         NWa9EMd/5edmhDa2XLnHV2xxQCMjZAjdXhAfjpJbCcoPEdeKD8rtz4f7H64d9LuNHpzh
         k4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791694857; x=1792299657;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o9fOpLHNyvCnw7ct/flm+4OABTu8ji/SW2nl6R0R/KI=;
        b=rLQgMCFq501OlCWeyblrNzsBbO0n2oxjyAsl6QOv1oxMOS97W8bsWko+tPxPSLhuQS
         v9251x1pZF/x5AcJEFWrMi6s1oTrEH40aFO66Q5i+QMRtD/miflWF8F3Qu3QdVNUd+nQ
         /jjXP1//6G/zbn2A4KNjdYoee9amcn5bA2Ifdz1W6wIv2pu5epMggCfT4gB/pGfJFB33
         sgZXC5ePY1GcomO2Cx0Bfl9fYrZiPxP9MXoy1JPBkgUUhKU511H+NkiXIX/He20R6GWG
         CWc4mpT/PVOJxTopFEvyCfHeX64zqywpsUrVUYHlQ+KB0olIs5C64uHbpxke2fBNShB3
         I2lw==
X-Forwarded-Encrypted: i=1; AKwUvBxebbOpcO9+f/PkWiveq1vGug1yX/YhcepIiuNzq5jjNJhDHCee4nhtEh3rv1rM4r1UuwBVWHUzTY5OdTI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+MVjujzijENKebkuLifqR3l+GwxMWtMzWWx7eD2dcRTVrIBww
	TyT/f24BOVvOPYwzzLmlUPybCKufKY/0mXSq4BLGFdN65JtYiWFUTCwGyJUMqNgNBmbpVUOgqmd
	v/RE2kdxaQQb1/m8ef4Wwayz3iWJlETg=
X-Gm-Gg: AYBFou0ItPfxzFyNAG9mYeJffjtMhQooI81rO/Oh6WHv2IF3NwaKJkkKpCuMnIbzrFW
	OLAQRLZfxvKX086/n/t33WVGexeCLiNtLxrz66FZQF6XJPppMz8eFNDoZG8jG6USDjg44Jva0Wx
	rf875jJz8jIA6l7EEy50b2HdXYkEjrJUa39I/D9t3zufMekpeA+76R7ZVXJY//HaUWhJYYKR3ON
	zmrPUwIp5VBe9dTxDRRA45FSqoOfkBwemaI4/wDIb+AuFz4jOa0hGjp9+9DMpoyRK3+uxxyYoGR
	TcK6r2XxT6H5DlYVOiHUSs94D6Vruzd07aLpwGW/eoKaLu2pd9f7wfm6QvILwBtvyNBqSiBdwCg
	uqC/epj+G8Q==
X-Received: by 2002:a2e:b891:0:b0:3a3:2a41:c0c4 with SMTP id
 38308e7fff4ca-3a9c55ace5bmr15462731fa.14.1791694856908; Sat, 10 Oct 2026
 22:00:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007034620.1360542-1-maimon.sagi@gmail.com> <179147446494.434549.11428994399896260897@kernel.org>
In-Reply-To: <179147446494.434549.11428994399896260897@kernel.org>
From: Sagi Maimon <maimon.sagi@gmail.com>
Date: Sun, 11 Oct 2026 08:00:30 +0300
X-Gm-Features: AclHuK8wvxfWEv_7A9VOQ3ODs6zOLFK7SsQqqUZ0c-kLMQjTNWe3Fqy-VD138Ag
Message-ID: <CAMuE1bE5m0NrFaD28wEC5D7LrpDo6+N-TiihQy-CAjLzNs5+9Q@mail.gmail.com>
Subject: Re: [PATCH net v4] net: axienet: free outstanding TX buffers in axienet_dma_bd_release()
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, radhey.shyam.pandey@amd.com, michal.simek@amd.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, daniel@iogearbox.net, 
	jacob.e.keller@intel.com, joe@dama.to, suraj.gupta2@amd.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 6:47=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wrot=
e:
>
> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 (3) =C2=B7 Medium: 1 (3) =C2=B7 Low: 2
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] net: axienet: RX buffer leak in axienet_dma_bd_release

Real, but not introduced here: the RX walk is unchanged by this patch.
It stops at the first descriptor with a NULL skb, so after a failed
refill in axienet_rx_poll() the buffers behind that slot leak, and it
frees each skb before unmapping it.  The commit message overstates it
when it says the RX walk frees every receive buffer.  I will send a
separate fix for the RX walk once I can test it on hardware.

> - [Medium] axienet_free_tx_bufs() loops over the current lp->tx_bd_num
>   entries of lp->tx_bd_v, reading cntrl/skb and storing zeros into every=
=E2=80=A6

This needs axienet_open() to ignore a failed reset after the ring was
resized, a path on which dma_free_coherent() already uses the wrong
size.  The fix is for axienet_open() to check the reset result and
unwind, which is a separate, pre-existing problem.
The remaining pre-existing items (the unchecked reset in
axienet_open(), the error handler not stopping the TX queue, the open
error paths, ll_temac) are outside this patch.  For the error handler,
the loop is moved unchanged; dev_kfree_skb_any() in its process context
frees at once instead of at the next softirq on the same CPU, which
neither opens nor closes that race.

> - [Low] axienet_free_tx_bufs() walks the TX ring in index order
>   0..tx_bd_num-1 and, at each descriptor that has an skb attached, frees=
=E2=80=A6
> - [Low] axienet_dma_stop() ignores both the timeouts of its HALT polls
>   and the return value of __axienet_device_reset(), which is -ETIMEDOUT=
=E2=80=A6
>
> Pre-existing issues:
> - [High] axienet_open() ignores the result of axienet_device_reset().
> - [High] In the RX walk of axienet_dma_bd_release(), each RX skb is freed
>   with dev_kfree_skb() (line 254) before its DMA_FROM_DEVICE streaming=E2=
=80=A6
> - [High] axienet_dma_err_handler() runs from a workqueue and does not
>   stop or lock the TX queue: there is no netif_tx_disable(),=E2=80=A6
> - [Medium] In the sibling Xilinx driver ll_temac, temac_dma_bd_release()
>   unmaps and frees the RX skbs but frees the TX descriptor ring with=E2=
=80=A6
> - [Medium] The RX walk in axienet_dma_bd_release() stops (`break`) at the
>   first descriptor with a NULL skb, on the assumption in its comment=E2=
=80=A6
> - [Medium] If phylink_of_phy_connect() or axienet_init_legacy_dma() fails
>   after axienet_device_reset() has succeeded, axienet_open() returns=E2=
=80=A6
>
> --
>
> net: axienet: free outstanding TX buffers in axienet_dma_bd_release()
>
> This patch moves the TX ring walk out of axienet_dma_err_handler() into a
> new helper, axienet_free_tx_bufs(). axienet_dma_bd_release() now calls it=
,
> so TX skbs still in flight and their DMA mappings are freed when the
> interface goes down. The patch also clears tx_bd_v and rx_bd_v once their
> rings are freed, skips the TX walk when tx_bd_v is NULL, and frees skbs
> with dev_kfree_skb_any() instead of dev_kfree_skb_irq().
>
> > diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/driver=
s/net/ethernet/xilinx/xilinx_axienet_main.c
> > index 09443623a3e2a..318ff03b04e69 100644
> > --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> > +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> > @@ -173,6 +173,46 @@ static dma_addr_t desc_get_phys_addr(struct axiene=
t_local *lp,
>
> [ ... ]
>
> > +static void axienet_free_tx_bufs(struct axienet_local *lp)
> > +{
> > +     struct axidma_bd *cur_p;
> > +     u32 i;
> > +
> > +     for (i =3D 0; i < lp->tx_bd_num; i++) {
> > +             cur_p =3D &lp->tx_bd_v[i];
>
> [Severity: Medium]
> Can this loop run past the end of the allocated ring? The loop bound is
> the current lp->tx_bd_num. The only guard in axienet_dma_bd_release() is
> the NULL check on lp->tx_bd_v, and that says nothing about how many
> entries the ring was allocated with.
>
> This sequence seems to reach that state:
>
> axienet_open()
>   axienet_device_reset() succeeds, axienet_dma_bd_init() allocates N entr=
ies
>   phylink_of_phy_connect() or axienet_init_legacy_dma() fails
>   returns without axienet_dma_bd_release(), so tx_bd_v stays non-NULL
>
> axienet_ethtools_set_ringparam()
>   the interface is down, so lp->tx_bd_num =3D M with M > N is accepted
>
> axienet_open()
>   __axienet_device_reset() times out and axienet_dma_bd_init() is skipped
>   the failure is ignored and open returns 0
>
> axienet_stop()->axienet_dma_bd_release()->axienet_free_tx_bufs()
>   walks M entries of an N-entry ring
>
> For i >=3D N, the loop reads cntrl and skb from beyond the coherent buffe=
r.
> It may call dma_unmap_single() or dev_kfree_skb_any() on garbage values,
> and it writes zeros past the end of the allocation.
>
> On this path the following dma_free_coherent() already passes the wrong
> size, so the path itself isn't new. The walk adds out-of-bounds writes to
> it. Fixing the unchecked reset and the missing unwind in axienet_open()
> would cover this too.
>
> > +             if (cur_p->cntrl) {
> > +                     dma_addr_t addr =3D desc_get_phys_addr(lp, cur_p)=
;
> > +
> > +                     dma_unmap_single(lp->dev, addr,
> > +                                      (cur_p->cntrl &
> > +                                       XAXIDMA_BD_CTRL_LENGTH_MASK),
> > +                                      DMA_TO_DEVICE);
> > +             }
> > +             /* not reclaimed by axienet_free_tx_chain(), so a drop */
> > +             if (cur_p->skb)
> > +                     dev_kfree_skb_any(cur_p->skb);
>
> [Severity: Low]
> Is the skb freed here before all of its mappings have been unmapped?
>
> axienet_start_xmit() puts the head at orig_tail_ptr and the fragments at
> the following indices, wrapping to 0. Only the last descriptor gets
> cur_p->skb:
>
>         for (ii =3D 0; ii < num_frag; ii++) {
>                 if (++new_tail_ptr >=3D lp->tx_bd_num)
>                         new_tail_ptr =3D 0;
>         ...
>         cur_p->skb =3D skb;
>
> Take an in-flight packet whose head is at tx_bd_num - 1 and whose last
> fragment wrapped to index 0. This loop frees the skb at index 0. It only
> calls dma_unmap_single() on the head and fragment descriptors at the top
> of the ring later in the walk.
>
> With DMA_TO_DEVICE and the engine stopped there may be no visible effect.
> Would unmapping every descriptor first and then freeing the skbs, or
> walking from tx_bd_ci in chain order, keep the usual unmap-before-free
> order? The error handler loop had the same order, and this patch adds it
> to normal teardown.
>
> > +             cur_p->phys =3D 0;
>
> [ ... ]
>
> > @@ -186,11 +226,18 @@ static void axienet_dma_bd_release(struct net_dev=
ice *ndev)
> >       int i;
> >       struct axienet_local *lp =3D netdev_priv(ndev);
> >
> > -     /* If we end up here, tx_bd_v must have been DMA allocated. */
> > +     /* tx_bd_v is NULL if axienet_dma_bd_init() did not get as far as
> > +      * allocating it, and is cleared below once the ring is freed;
> > +      * dma_free_coherent() accepts NULL.
> > +      */
> > +     if (lp->tx_bd_v)
> > +             axienet_free_tx_bufs(lp);
>
> [Severity: Low]
> This code assumes the DMA engine has stopped. axienet_dma_stop() ignores
> the HALT poll timeouts and also the return value of the reset:
>
>         /* Do a reset to ensure DMA is really stopped */
>         axienet_lock_mii(lp);
>         __axienet_device_reset(lp);
>         axienet_unlock_mii(lp);
>
> Suppose __axienet_device_reset() returns -ETIMEDOUT ("DMA reset timeout!"=
)
> while an AXI read is still outstanding. Could the device then read TX
> buffers after they were unmapped and freed here, for example causing an
> IOMMU fault?
>
> axienet_stop() clears TXEN before this point, so freed data shouldn't
> reach the wire, and teardown has to proceed anyway. This is more a
> hardening question about faulty hardware.
>
> > +
> >       dma_free_coherent(lp->dev,
> >                         sizeof(*lp->tx_bd_v) * lp->tx_bd_num,
> >                         lp->tx_bd_v,
> >                         lp->tx_bd_p);
> > +     lp->tx_bd_v =3D NULL;
>
> [Severity: High]
> This isn't a bug introduced by this patch. The commit message notes that
> axienet_open() does not check the reset result, and the transmit path
> still uses the ring when the reset fails:
>
> axienet_open() {
>         ...
>         ret =3D axienet_device_reset(ndev);
>         axienet_unlock_mii(lp);
>
>         ret =3D phylink_of_phy_connect(lp->phylink, lp->dev->of_node, 0);
>         ...
> }
>
> The reset can fail in two ways: __axienet_device_reset() times out, or
> axienet_dma_bd_init() fails with -ENOMEM and calls
> axienet_dma_bd_release(). Either way, open still runs
> axienet_init_legacy_dma() and returns 0 with no TX or RX ring.
>
> The first transmit then does this:
>
> axienet_start_xmit()
>         cur_p =3D &lp->tx_bd_v[orig_tail_ptr];
>         ...
> axienet_check_tx_bd_space()
>         cur_p =3D &lp->tx_bd_v[(READ_ONCE(lp->tx_bd_tail) + num_frag) %
>                              lp->tx_bd_num];
>         if (cur_p->cntrl)
>
> Now that this patch clears tx_bd_v, that is a NULL pointer dereference.
> Before the patch, after an earlier close, it was a write into the freed
> coherent ring.
>
> axienet_dma_err_handler() also calls axienet_free_tx_bufs() and walks
> rx_bd_v, without the NULL check that axienet_dma_bd_release() now has.
>
> Should axienet_open() check the result of axienet_device_reset() and
> unwind on failure?
>
> [Severity: Medium]
> This is a pre-existing issue. The axienet_open() error exits that come
> after a successful reset never release the rings or stop the DMA engine:
>
>         ret =3D phylink_of_phy_connect(lp->phylink, lp->dev->of_node, 0);
>         if (ret) {
>                 dev_err(lp->dev, "phylink_of_phy_connect() failed: %d\n",=
 ret);
>                 return ret;
>         }
>
> The err_phy path, taken when axienet_init_legacy_dma() fails, does the
> same.
>
> By that point axienet_dma_bd_init() has allocated both coherent rings,
> allocated and mapped rx_bd_num RX skbs, and started the DMA engine. Do
> these leak, with the DMA engine still running?
>
> The next open's axienet_dma_bd_init() then overwrites tx_bd_v and rx_bd_v
> without freeing the old allocations.
>
> >
> >       if (!lp->rx_bd_v)
> >               return;
>
> [Severity: High]
> This isn't a bug introduced by this patch, but the RX walk just below
> leaks in the same way the TX side did. It stops at the first
> descriptor with a NULL skb:
>
>         if (!lp->rx_bd_v[i].skb)
>                 break;
>
> That only works if the populated descriptors form a prefix of the
> ring. That holds on the axienet_dma_bd_init() error path, but not once
> the ring has been running.
>
> axienet_rx_poll() takes the skb from a completed descriptor and sets
> cur_p->skb to NULL before refilling it. If napi_alloc_skb() or
> dma_map_single() then fails, the poll loop breaks. That leaves a NULL
> slot at rx_bd_ci in the middle of an otherwise populated ring.
>
> If the interface is closed before a later poll refills that slot,
> axienet_stop()->axienet_dma_bd_release() stops there. The skb and
> DMA_FROM_DEVICE mapping of every descriptor after it are then leaked.
> Depending on where rx_bd_ci sits, that can be most of the ring. A
> system under memory pressure is the one most likely to hit this.
>
> It also contradicts the commit message, which says this walk frees
> every receive buffer.
>
> Would continue instead of break be enough? A slot emptied by
> axienet_rx_poll() still has a non-zero cntrl, and its phys points at
> the buffer that was already unmapped. So the skip has to cover the
> unmap as well, which a continue at that point does. The zeroed,
> never-filled slots on the axienet_dma_bd_init() error path would be
> skipped the same way.
>
> This patch is about making axienet_dma_bd_release() release everything
> the rings still hold. Could the RX side be fixed here as well, or in a
> separate patch?
>
> [Severity: High]
> This isn't a bug introduced by this patch. The RX walk below frees each
> skb before it unmaps the skb's DMA_FROM_DEVICE mapping:
>
>                 dev_kfree_skb(lp->rx_bd_v[i].skb);
>                 ...
>                 if (lp->rx_bd_v[i].cntrl) {
>                         phys =3D desc_get_phys_addr(lp, &lp->rx_bd_v[i]);
>                         dma_unmap_single(lp->dev, phys,
>                                          lp->max_frm_size, DMA_FROM_DEVIC=
E);
>                 }
>
> With swiotlb bouncing, can the unmap copy up to max_frm_size bytes back
> into the skb data that was just freed? On non-coherent platforms the
> unmap also invalidates cache lines of memory that may already belong to a
> new owner.
>
> Bouncing looks realistic here. Probe uses a 32-bit DMA mask unless 64-bit
> DMA is detected, so a 32-bit AXI DMA on a host with RAM above 4 GiB would
> bounce, as could the PCIe card from the commit message.
>
> The new TX helper unmaps before it frees. Would swapping the order in
> this loop make the two walks consistent?
>
> [Severity: Medium]
> This is also pre-existing. The same RX walk stops at the first NULL skb:
>
>                 /* A NULL skb means this descriptor has not been initiali=
sed
>                  * at all.
>                  */
>                 if (!lp->rx_bd_v[i].skb)
>                         break;
>
> axienet_rx_poll() sets cur_p->skb =3D NULL and exits its loop if
> napi_alloc_skb() or dma_map_single() fails. That leaves a NULL slot at
> rx_bd_ci in the middle of a populated ring.
>
> Would a close after such a refill failure leak every RX skb and mapping
> after that slot? That would also contradict the commit message, which
> says the RX walk frees "every receive buffer".
>
> > @@ -221,6 +268,7 @@ static void axienet_dma_bd_release(struct net_devic=
e *ndev)
> >                         sizeof(*lp->rx_bd_v) * lp->rx_bd_num,
> >                         lp->rx_bd_v,
> >                         lp->rx_bd_p);
> > +     lp->rx_bd_v =3D NULL;
> >  }
>
> [Severity: Medium]
> This isn't a bug introduced by this patch, but the sibling ll_temac
> driver seems to have the same TX leak. temac_dma_bd_release() in
> drivers/net/ethernet/xilinx/ll_temac_main.c frees only the TX ring:
>
>         if (lp->tx_bd_v)
>                 dma_free_coherent(ndev->dev.parent,
>                                   sizeof(*lp->tx_bd_v) * lp->tx_bd_num,
>                                   lp->tx_bd_v, lp->tx_bd_p);
>
> temac_start_xmit() attaches the skb to the last TX BD via ptr_to_txbd(),
> and only temac_start_xmit_done() reclaims it.
>
> Does temac_stop()->temac_dma_bd_release() leak in-flight TX skbs and
> their DMA_TO_DEVICE mappings? It may be worth a separate fix.
>
> [ ... ]
>
> > @@ -2749,29 +2797,7 @@ static void axienet_dma_err_handler(struct work_=
struct *work)
> >       axienet_dma_stop(lp);
> >       netdev_reset_queue(ndev);
> >
> > -     for (i =3D 0; i < lp->tx_bd_num; i++) {
>
> [ ... ]
>
> > -     }
> > +     axienet_free_tx_bufs(lp);
>
> [Severity: High]
> This is a pre-existing issue, since the loop was moved rather than newly
> written. What stops axienet_start_xmit() from running at the same time as
> this code?
>
> axienet_dma_err_handler() runs from a workqueue. It disables NAPI, the
> MAC TX/RX enables and the DMA engine, but it never calls
> netif_tx_disable(), netif_tx_lock() or netif_stop_queue(). The TX queue
> stays awake for the up to ~250 ms spent in axienet_dma_stop().
>
> Meanwhile, on another CPU:
>
> axienet_start_xmit()
>         cur_p->skb =3D skb;
>         ...
>         WRITE_ONCE(lp->tx_bd_tail, new_tail_ptr);
>         netdev_sent_queue(ndev, skb->len);
>
> If axienet_free_tx_bufs() frees that skb between the store and the read
> of skb->len, can start_xmit read a freed skb?
>
> The two paths also race on tx_bd_tail, which the handler later resets to
> 0, on BQL state (netdev_reset_queue() against netdev_sent_queue()), and
> on descriptor contents. The restarted DMA could therefore fetch zeroed
> descriptors.
>
> dev_kfree_skb_irq() deferred the free to NET_TX softirq. With
> dev_kfree_skb_any(), this process-context worker now frees the skb
> immediately, so the freed memory can be reused sooner.
>
> The helper's kernel-doc lists only "The DMA engine must be stopped" as a
> precondition. Should it also require the TX queue to be quiesced?
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261007034620.1360542-1-maimon.sagi%40gmail.com
